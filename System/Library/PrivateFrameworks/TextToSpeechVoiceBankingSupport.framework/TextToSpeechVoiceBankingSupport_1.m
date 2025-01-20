void sub_25F3AC438(void *a1, uint64_t a2, char *a3)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  char *v16;
  id v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint8_t *v22;
  void *v23;
  id v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint8_t *v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  uint64_t v38;
  char *v39;
  id v40;
  void *v41;
  uint64_t v42;
  double v43;
  uint64_t v44;
  char *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  double v54;
  uint64_t v55;
  char *v56;
  uint64_t (*v57)(char *, uint64_t, double);
  uint8_t *v58;
  uint64_t v59;
  double v60;
  char *v61;
  void (*v62)(char *, char *, uint64_t, double);
  NSObject *v63;
  os_log_type_t v64;
  uint64_t v65;
  uint8_t *v66;
  uint64_t v67;
  unint64_t v68;
  void (*v69)(char *, uint64_t);
  void *v70;
  void *v71;
  char *v72;
  void *v73;
  id v74;
  id v75;
  void *v76;
  id v77;
  id v78;
  void v79[2];
  void *v80;
  void *v81;
  id v82;
  void *v83;
  uint8_t *v84;
  void *v85;
  char *v86;
  void *v87;
  unint64_t v88;
  _OWORD v89[2];
  id v90[6];

  v86 = a3;
  v90[4] = *(id *)MEMORY[0x263EF8340];
  v90[0] = 0;
  v87 = a1;
  v3 = objc_msgSend(a1, sel_executeRequest_error_, a2, v90);
  v4 = v90[0];
  if (v3)
  {
    v5 = v3;
    self;
    v6 = swift_dynamicCastObjCClass();
    if (!v6)
    {
      v29 = v4;

      return;
    }
    v7 = (void *)v6;
    v8 = v4;
    if (objc_msgSend(v7, sel_result))
    {
      sub_25F3F6730();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v89, 0, sizeof(v89));
    }
    sub_25F307A7C((uint64_t)v89, (uint64_t)v90, (uint64_t *)&unk_26A78D2B0);
    if (!v90[3])
    {

      sub_25F307B78((uint64_t)v90, (uint64_t *)&unk_26A78D2B0);
      return;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A78D8F0);
    if ((swift_dynamicCast() & 1) == 0)
    {

      return;
    }
    v30 = (void *)v88;
    if (v88 >> 62)
    {
      swift_bridgeObjectRetain();
      v31 = sub_25F3F6980();
      swift_bridgeObjectRelease();
      if (v31) {
        goto LABEL_15;
      }
    }
    else
    {
      v31 = *(void *)((v88 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v31)
      {
LABEL_15:
        if (v31 < 1) {
          __break(1u);
        }
        v32 = 0;
        v82 = v5;
        v83 = (void *)(v88 & 0xC000000000000001);
        v84 = (uint8_t *)v31;
        v85 = (void *)v88;
        do
        {
          if (v83) {
            v33 = (id)MEMORY[0x2611F12D0](v32, v30);
          }
          else {
            v33 = (id)v30[(void)v32 + 4];
          }
          v34 = v33;
          ++v32;
          v35 = sub_25F3F5890();
          v36 = *(void *)(v35 - 8);
          v37 = MEMORY[0x270FA5388](v35);
          v39 = (char *)v79 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
          v40 = objc_msgSend(v34, sel_objectIDNotification, v37);
          sub_25F3F5860();

          v41 = (void *)sub_25F3F5850();
          objc_msgSend(v87, sel_mergeChangesFromContextDidSaveNotification_, v41);

          v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B398898);
          v43 = MEMORY[0x270FA5388](v42 - 8);
          v45 = (char *)v79 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
          v46 = objc_msgSend(v34, sel_timestamp, v43);
          sub_25F3F5C80();

          v47 = sub_25F3F5CC0();
          v48 = *(void *)(v47 - 8);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v48 + 56))(v45, 0, 1, v47);
          sub_25F3ACE6C((uint64_t)v45);

          (*(void (**)(char *, uint64_t))(v36 + 8))(v39, v35);
          v30 = v85;
        }
        while (v84 != v32);
        v49 = swift_bridgeObjectRelease();
        v50 = *(void *)(v48 + 64);
        MEMORY[0x270FA5388](v49);
        sub_25F3F5C60();
        v51 = sub_25F3EFA00();
        v52 = sub_25F3F5EA0();
        v85 = v79;
        v53 = *(void *)(v52 - 8);
        v54 = MEMORY[0x270FA5388](v52);
        v56 = (char *)v79 - ((v55 + 15) & 0xFFFFFFFFFFFFFFF0);
        v57 = *(uint64_t (**)(char *, uint64_t, double))(v53 + 16);
        v84 = v58;
        v59 = v57(v56, v51, v54);
        v83 = v79;
        v60 = MEMORY[0x270FA5388](v59);
        v61 = (char *)v79 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0);
        v62 = *(void (**)(char *, char *, uint64_t, double))(v48 + 16);
        v86 = v61;
        v62(v61, v61, v47, v60);
        v63 = sub_25F3F5E80();
        v64 = sub_25F3F64B0();
        if (os_log_type_enabled(v63, v64))
        {
          v65 = swift_slowAlloc();
          v81 = v79;
          v66 = (uint8_t *)v65;
          v80 = (void *)swift_slowAlloc();
          v90[0] = v80;
          *(_DWORD *)v66 = 136315138;
          v79[1] = v66 + 4;
          v67 = sub_25F3F5CA0();
          *(void *)&v89[0] = sub_25F2FE464(v67, v68, (uint64_t *)v90);
          sub_25F3F66A0();
          swift_bridgeObjectRelease();
          v69 = *(void (**)(char *, uint64_t))(v48 + 8);
          v69(v61, v47);
          _os_log_impl(&dword_25F2F5000, v63, v64, "Deleting all history items older than one year %s", v66, 0xCu);
          v70 = v80;
          swift_arrayDestroy();
          MEMORY[0x2611F21E0](v70, -1, -1);
          MEMORY[0x2611F21E0](v66, -1, -1);
        }
        else
        {
          v69 = *(void (**)(char *, uint64_t))(v48 + 8);
          v69(v61, v47);
        }

        (*(void (**)(char *, uint8_t *))(v53 + 8))(v56, v84);
        v71 = self;
        v72 = v86;
        v73 = (void *)sub_25F3F5C40();
        v74 = objc_msgSend(v71, sel_deleteHistoryBeforeDate_, v73);

        v90[0] = 0;
        v75 = objc_msgSend(v87, sel_executeRequest_error_, v74, v90);
        if (v75)
        {
          v76 = v75;
          v77 = v90[0];

          v69(v72, v47);
          return;
        }
        v78 = v90[0];
        v10 = (void *)sub_25F3F5980();

        swift_willThrow();
        v69(v72, v47);
        goto LABEL_6;
      }
    }

    swift_bridgeObjectRelease();
    return;
  }
  v9 = v90[0];
  v10 = (void *)sub_25F3F5980();

  swift_willThrow();
LABEL_6:
  v11 = sub_25F3EFA00();
  v12 = sub_25F3F5EA0();
  v13 = *(void *)(v12 - 8);
  v14 = MEMORY[0x270FA5388](v12);
  v16 = (char *)v79 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, double))(v13 + 16))(v16, v11, v12, v14);
  v17 = v10;
  v18 = v10;
  v19 = sub_25F3F5E80();
  v20 = sub_25F3F64C0();
  if (os_log_type_enabled(v19, v20))
  {
    v87 = v79;
    v21 = swift_slowAlloc();
    v86 = (char *)v12;
    v22 = (uint8_t *)v21;
    v85 = (void *)swift_slowAlloc();
    v90[0] = v85;
    *(_DWORD *)v22 = 136315138;
    v84 = v22 + 4;
    v23 = (void *)sub_25F3F5970();
    v24 = objc_msgSend(v23, sel_debugDescription);

    v25 = sub_25F3F6130();
    v27 = v26;

    *(void *)&v89[0] = sub_25F2FE464(v25, v27, (uint64_t *)v90);
    sub_25F3F66A0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_25F2F5000, v19, v20, "Error occurred processing persistent history: %s", v22, 0xCu);
    v28 = v85;
    swift_arrayDestroy();
    MEMORY[0x2611F21E0](v28, -1, -1);
    MEMORY[0x2611F21E0](v22, -1, -1);

    (*(void (**)(char *, char *))(v13 + 8))(v16, v86);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
  }
}

uint64_t sub_25F3ACE6C(uint64_t a1)
{
  v2 = sub_25F3486EC();
  id v3 = (id)*v2;
  swift_bridgeObjectRetain();
  v4 = (void *)sub_25F3F6100();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(v3, sel_dictionaryForKey_, v4);

  if (v5)
  {
    unint64_t v6 = sub_25F3F6040();
  }
  else
  {
    unint64_t v6 = sub_25F30D784(MEMORY[0x263F8EE78]);
  }
  unint64_t v29 = v6;
  id v7 = objc_msgSend(self, sel_mainBundle);
  id v8 = objc_msgSend(v7, sel_bundleIdentifier);

  if (!v8)
  {
    id v9 = objc_msgSend(self, sel_processInfo);
    id v8 = objc_msgSend(v9, sel_processName);
  }
  uint64_t v10 = sub_25F3F6130();
  uint64_t v12 = v11;

  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B398898);
  MEMORY[0x270FA5388](v13 - 8);
  v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25F3078D4(a1, (uint64_t)v15, &qword_26B398898);
  uint64_t v16 = sub_25F3F5CC0();
  uint64_t v17 = *(void *)(v16 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16) == 1)
  {
    sub_25F307B78((uint64_t)v15, &qword_26B398898);
    sub_25F3AE4A0(v10, v12, v27);
    swift_bridgeObjectRelease();
    sub_25F307B78((uint64_t)v27, (uint64_t *)&unk_26A78D2B0);
  }
  else
  {
    uint64_t v28 = v16;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v27);
    (*(void (**)(uint64_t *, char *, uint64_t))(v17 + 32))(boxed_opaque_existential_0, v15, v16);
    sub_25F3237C8(v27, v26);
    unint64_t v19 = v29;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v25 = v19;
    unint64_t v29 = 0x8000000000000000;
    sub_25F322DF8(v26, v10, v12, isUniquelyReferenced_nonNull_native);
    unint64_t v29 = v25;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  id v21 = (id)*v2;
  v22 = (void *)sub_25F3F6020();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v23 = (void *)sub_25F3F6100();
  swift_bridgeObjectRelease();
  objc_msgSend(v21, sel_setObject_forKey_, v22, v23);

  return sub_25F307B78(a1, &qword_26B398898);
}

id TTSVBDataStore.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void TTSVBDataStore.init()()
{
}

id TTSVBDataStore.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void TTSVBDataStoreEvent.MergeEvent.inserted.getter()
{
}

void TTSVBDataStoreEvent.MergeEvent.updated.getter()
{
}

void sub_25F3AD454()
{
  uint64_t v0 = sub_25F3F5880();
  if (v0)
  {
    uint64_t v1 = v0;
    sub_25F3F6130();
    sub_25F3F6830();
    if (*(void *)(v1 + 16) && (unint64_t v2 = sub_25F3AE5A4((uint64_t)v4), (v3 & 1) != 0))
    {
      sub_25F301A40(*(void *)(v1 + 56) + 32 * v2, (uint64_t)&v5);
    }
    else
    {
      long long v5 = 0u;
      long long v6 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_25F3AEC24((uint64_t)v4);
    if (*((void *)&v6 + 1))
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A78D8B8);
      if (swift_dynamicCast()) {
        return;
      }
      goto LABEL_11;
    }
  }
  else
  {
    long long v5 = 0u;
    long long v6 = 0u;
  }
  sub_25F307B78((uint64_t)&v5, (uint64_t *)&unk_26A78D2B0);
LABEL_11:
  if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0)
  {
    if (sub_25F3F6980()) {
      sub_25F3B09C0(MEMORY[0x263F8EE78]);
    }
  }
}

void TTSVBDataStoreEvent.MergeEvent.deleted.getter()
{
}

void TTSVBDataStoreEvent.MergeEvent.refreshed.getter()
{
}

void TTSVBDataStoreEvent.MergeEvent.invalidated.getter()
{
}

uint64_t TTSVBDataStoreEvent.MergeEvent.all.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A78D8C0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_25F400560;
  TTSVBDataStoreEvent.MergeEvent.inserted.getter();
  *(void *)(v0 + 32) = v1;
  TTSVBDataStoreEvent.MergeEvent.updated.getter();
  *(void *)(v0 + 40) = v2;
  TTSVBDataStoreEvent.MergeEvent.deleted.getter();
  *(void *)(v0 + 48) = v3;
  TTSVBDataStoreEvent.MergeEvent.refreshed.getter();
  *(void *)(v0 + 56) = v4;
  TTSVBDataStoreEvent.MergeEvent.invalidated.getter();
  *(void *)(v0 + 64) = v5;
  return v0;
}

Swift::Bool __swiftcall TTSVBDataStoreEvent.MergeEvent.anyObjectIsEntity(_:)(NSEntityDescription a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A78D8C0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25F400560;
  TTSVBDataStoreEvent.MergeEvent.inserted.getter();
  *(void *)(inited + 32) = v2;
  uint64_t v28 = inited + 32;
  TTSVBDataStoreEvent.MergeEvent.updated.getter();
  *(void *)(inited + 40) = v3;
  TTSVBDataStoreEvent.MergeEvent.deleted.getter();
  *(void *)(inited + 48) = v4;
  TTSVBDataStoreEvent.MergeEvent.refreshed.getter();
  *(void *)(inited + 56) = v5;
  TTSVBDataStoreEvent.MergeEvent.invalidated.getter();
  unint64_t v7 = 0;
  *(void *)(inited + 64) = v6;
  uint64_t v27 = inited;
  while (2)
  {
    if (v7 >= *(void *)(inited + 16)) {
      goto LABEL_37;
    }
    uint64_t v8 = *(void *)(v28 + 8 * v7);
    if ((v8 & 0xC000000000000001) != 0)
    {
      swift_bridgeObjectRetain();
      sub_25F3F67D0();
      sub_25F3236F0(0, &qword_26A78D8C8);
      sub_25F3B1148();
      LOBYTE(v6) = sub_25F3F6420();
      uint64_t v8 = v32;
      uint64_t v30 = v33;
      uint64_t v9 = v34;
      uint64_t v10 = v35;
      unint64_t v11 = v36;
    }
    else
    {
      uint64_t v12 = -1 << *(unsigned char *)(v8 + 32);
      uint64_t v30 = v8 + 56;
      uint64_t v9 = ~v12;
      uint64_t v13 = -v12;
      if (v13 < 64) {
        uint64_t v14 = ~(-1 << v13);
      }
      else {
        uint64_t v14 = -1;
      }
      unint64_t v11 = v14 & *(void *)(v8 + 56);
      LOBYTE(v6) = swift_bridgeObjectRetain();
      uint64_t v10 = 0;
    }
    unint64_t v29 = v7 + 1;
    int64_t v15 = (unint64_t)(v9 + 64) >> 6;
    while (1)
    {
      uint64_t v16 = v10;
      if (v8 < 0)
      {
        if (!sub_25F3F6800()) {
          goto LABEL_2;
        }
        sub_25F3236F0(0, &qword_26A78D8C8);
        swift_unknownObjectRetain();
        swift_dynamicCast();
        id v19 = v31;
        swift_unknownObjectRelease();
        if (!v31) {
          goto LABEL_2;
        }
        goto LABEL_32;
      }
      if (!v11) {
        break;
      }
      unint64_t v17 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v18 = v17 | (v10 << 6);
LABEL_31:
      id v19 = *(id *)(*(void *)(v8 + 48) + 8 * v18);
      if (!v19) {
        goto LABEL_2;
      }
LABEL_32:
      sub_25F3236F0(0, (unint64_t *)&qword_26A78D598);
      id v23 = objc_msgSend(v19, sel_entity);
      char v24 = sub_25F3F6650();

      if (v24)
      {
        sub_25F37C120();
        char v25 = 1;
        goto LABEL_34;
      }
    }
    int64_t v20 = v10 + 1;
    if (!__OFADD__(v10, 1))
    {
      if (v20 >= v15) {
        goto LABEL_2;
      }
      unint64_t v21 = *(void *)(v30 + 8 * v20);
      ++v10;
      if (!v21)
      {
        uint64_t v10 = v16 + 2;
        if (v16 + 2 >= v15) {
          goto LABEL_2;
        }
        unint64_t v21 = *(void *)(v30 + 8 * v10);
        if (!v21)
        {
          uint64_t v10 = v16 + 3;
          if (v16 + 3 >= v15) {
            goto LABEL_2;
          }
          unint64_t v21 = *(void *)(v30 + 8 * v10);
          if (!v21)
          {
            uint64_t v10 = v16 + 4;
            if (v16 + 4 >= v15) {
              goto LABEL_2;
            }
            unint64_t v21 = *(void *)(v30 + 8 * v10);
            if (!v21)
            {
              uint64_t v22 = v16 + 5;
              while (v15 != v22)
              {
                unint64_t v21 = *(void *)(v30 + 8 * v22++);
                if (v21)
                {
                  uint64_t v10 = v22 - 1;
                  goto LABEL_30;
                }
              }
LABEL_2:
              uint64_t inited = v27;
              unint64_t v7 = v29;
              LOBYTE(v6) = sub_25F37C120();
              if (v29 != 5) {
                continue;
              }
              char v25 = 0;
LABEL_34:
              swift_bridgeObjectRelease();
              LOBYTE(v6) = v25;
              return v6;
            }
          }
        }
      }
LABEL_30:
      unint64_t v11 = (v21 - 1) & v21;
      unint64_t v18 = __clz(__rbit64(v21)) + (v10 << 6);
      goto LABEL_31;
    }
    break;
  }
  __break(1u);
LABEL_37:
  __break(1u);
  return v6;
}

BOOL TTSVBDataStoreEvent.MergeEvent.voicesDidChange.getter()
{
  type metadata accessor for TTSVBLocalVoiceMO();
  id v0 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_entity);
  Swift::Bool v1 = TTSVBDataStoreEvent.MergeEvent.anyObjectIsEntity(_:)((NSEntityDescription)v0);

  return v1;
}

id TTSVBDataStoreEvent.CloudKitSyncEvent.event.getter()
{
  Swift::Bool v1 = *(void **)(v0 + *(int *)(type metadata accessor for TTSVBDataStoreEvent.CloudKitSyncEvent(0) + 20));

  return v1;
}

uint64_t TTSVBDataStoreEvent.CloudKitSyncEvent.isFinished.getter()
{
  id v1 = objc_msgSend(*(id *)(v0 + *(int *)(type metadata accessor for TTSVBDataStoreEvent.CloudKitSyncEvent(0) + 20)), sel_endDate);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B398898);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v1)
  {
    uint64_t v5 = sub_25F3F5CC0();
    uint64_t v6 = *(void *)(v5 - 8);
    MEMORY[0x270FA5388](v5);
    uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_25F3F5C80();

    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v4, v8, v5);
    uint64_t v9 = 1;
    (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) != 1) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v10 = sub_25F3F5CC0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v4, 1, 1, v10);
  }
  uint64_t v9 = 0;
LABEL_6:
  sub_25F307B78((uint64_t)v4, &qword_26B398898);
  return v9;
}

uint64_t TTSVBDataStoreEvent.CloudKitSyncEvent.description.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B398D08);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_25F3F8460;
  *(void *)(v1 + 32) = 0xD000000000000013;
  *(void *)(v1 + 40) = 0x800000025F407110;
  uint64_t v2 = *(int *)(type metadata accessor for TTSVBDataStoreEvent.CloudKitSyncEvent(0) + 20);
  id v3 = objc_msgSend(*(id *)(v0 + v2), sel_endDate);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B398898);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v57 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v3)
  {
    uint64_t v7 = sub_25F3F5CC0();
    uint64_t v8 = *(void *)(v7 - 8);
    MEMORY[0x270FA5388](v7);
    uint64_t v10 = (char *)&v57 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_25F3F5C80();

    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v6, v10, v7);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
    LOBYTE(v3) = (*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) != 1;
  }
  else
  {
    uint64_t v11 = sub_25F3F5CC0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v6, 1, 1, v11);
  }
  sub_25F307B78((uint64_t)v6, &qword_26B398898);
  uint64_t v12 = *(void **)(v0 + v2);
  id v13 = objc_msgSend(v12, sel_type);
  if (!v13)
  {
    unint64_t v21 = *(void *)(v1 + 16);
    unint64_t v20 = *(void *)(v1 + 24);
    unint64_t v22 = v21 + 1;
    if ((v3 & 1) == 0)
    {
      if (v20 >> 1 <= v21) {
        uint64_t v1 = (uint64_t)sub_25F3225B8((char *)(v20 > 1), v21 + 1, 1, (char *)v1);
      }
      *(void *)(v1 + 16) = v22;
      uint64_t v53 = v1 + 16 * v21;
      *(void *)(v53 + 32) = 0xD00000000000001ALL;
      *(void *)(v53 + 40) = 0x800000025F407160;
      goto LABEL_49;
    }
    if (v20 >> 1 <= v21) {
      uint64_t v1 = (uint64_t)sub_25F3225B8((char *)(v20 > 1), v21 + 1, 1, (char *)v1);
    }
    *(void *)(v1 + 16) = v22;
    uint64_t v23 = v1 + 16 * v21;
    *(void *)(v23 + 32) = 0xD00000000000001BLL;
    uint64_t v18 = v23 + 32;
    id v19 = "Finished setting up records";
    goto LABEL_19;
  }
  if (v13 == (id)2)
  {
    unint64_t v25 = *(void *)(v1 + 16);
    unint64_t v24 = *(void *)(v1 + 24);
    unint64_t v26 = v25 + 1;
    if (v3)
    {
      if (v24 >> 1 <= v25) {
        uint64_t v1 = (uint64_t)sub_25F3225B8((char *)(v24 > 1), v25 + 1, 1, (char *)v1);
      }
      *(void *)(v1 + 16) = v26;
      uint64_t v27 = v1 + 16 * v25;
      *(void *)(v27 + 32) = 0xD00000000000001ALL;
      uint64_t v18 = v27 + 32;
      id v19 = "Finished uploading records";
      goto LABEL_19;
    }
    if (v24 >> 1 <= v25) {
      uint64_t v1 = (uint64_t)sub_25F3225B8((char *)(v24 > 1), v25 + 1, 1, (char *)v1);
    }
    *(void *)(v1 + 16) = v26;
    uint64_t v35 = v1 + 16 * v25;
    unint64_t v36 = 0xD000000000000019;
    v52 = "Started uploading records";
LABEL_47:
    unint64_t v37 = (unint64_t)(v52 - 32) | 0x8000000000000000;
LABEL_48:
    *(void *)(v35 + 32) = v36;
    *(void *)(v35 + 40) = v37;
    goto LABEL_49;
  }
  if (v13 != (id)1)
  {
    unint64_t v29 = *(void *)(v1 + 16);
    unint64_t v28 = *(void *)(v1 + 24);
    if (v29 >= v28 >> 1) {
      uint64_t v1 = (uint64_t)sub_25F3225B8((char *)(v28 > 1), v29 + 1, 1, (char *)v1);
    }
    *(void *)(v1 + 16) = v29 + 1;
    uint64_t v30 = v1 + 16 * v29;
    strcpy((char *)(v30 + 32), "Unknown event");
    *(_WORD *)(v30 + 46) = -4864;
    if ((v3 & 1) == 0) {
      goto LABEL_49;
    }
    goto LABEL_23;
  }
  unint64_t v15 = *(void *)(v1 + 16);
  unint64_t v14 = *(void *)(v1 + 24);
  unint64_t v16 = v15 + 1;
  if ((v3 & 1) == 0)
  {
    if (v14 >> 1 <= v15) {
      uint64_t v1 = (uint64_t)sub_25F3225B8((char *)(v14 > 1), v15 + 1, 1, (char *)v1);
    }
    *(void *)(v1 + 16) = v16;
    uint64_t v35 = v1 + 16 * v15;
    unint64_t v36 = 0xD00000000000001BLL;
    v52 = "Started downloading records";
    goto LABEL_47;
  }
  if (v14 >> 1 <= v15) {
    uint64_t v1 = (uint64_t)sub_25F3225B8((char *)(v14 > 1), v15 + 1, 1, (char *)v1);
  }
  *(void *)(v1 + 16) = v16;
  uint64_t v17 = v1 + 16 * v15;
  *(void *)(v17 + 32) = 0xD00000000000001CLL;
  uint64_t v18 = v17 + 32;
  id v19 = "Finished downloading records";
LABEL_19:
  *(void *)(v18 + 8) = (unint64_t)(v19 - 32) | 0x8000000000000000;
LABEL_23:
  unsigned __int8 v31 = objc_msgSend(v12, sel_succeeded);
  unint64_t v33 = *(void *)(v1 + 16);
  unint64_t v32 = *(void *)(v1 + 24);
  unint64_t v34 = v33 + 1;
  if (v31)
  {
    if (v32 >> 1 <= v33) {
      uint64_t v1 = (uint64_t)sub_25F3225B8((char *)(v32 > 1), v33 + 1, 1, (char *)v1);
    }
    *(void *)(v1 + 16) = v34;
    uint64_t v35 = v1 + 16 * v33;
    unint64_t v36 = 0x73736563637553;
    unint64_t v37 = 0xE700000000000000;
    goto LABEL_48;
  }
  if (v32 >> 1 <= v33) {
    uint64_t v1 = (uint64_t)sub_25F3225B8((char *)(v32 > 1), v33 + 1, 1, (char *)v1);
  }
  *(void *)(v1 + 16) = v34;
  uint64_t v38 = v1 + 16 * v33;
  *(void *)(v38 + 32) = 0x64656C696146;
  *(void *)(v38 + 40) = 0xE600000000000000;
  id v39 = objc_msgSend(v12, sel_error);
  if (v39)
  {
    uint64_t v60 = (uint64_t)v39;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B398850);
    sub_25F3236F0(0, qword_26B399268);
    if (swift_dynamicCast())
    {
      id v40 = v59;
      id v41 = objc_msgSend(v59, sel_debugDescription);
      uint64_t v42 = sub_25F3F6130();
      uint64_t v44 = v43;

      unint64_t v46 = *(void *)(v1 + 16);
      unint64_t v45 = *(void *)(v1 + 24);
      unint64_t v47 = v46 + 1;
      if (v46 >= v45 >> 1)
      {
        unint64_t v58 = v46 + 1;
        v56 = sub_25F3225B8((char *)(v45 > 1), v46 + 1, 1, (char *)v1);
        unint64_t v47 = v58;
        uint64_t v1 = (uint64_t)v56;
      }
      *(void *)(v1 + 16) = v47;
      uint64_t v48 = v1 + 16 * v46;
      *(void *)(v48 + 32) = v42;
      *(void *)(v48 + 40) = v44;
      if (objc_msgSend(v40, sel_code) == (id)134400)
      {
        unint64_t v50 = *(void *)(v1 + 16);
        unint64_t v49 = *(void *)(v1 + 24);
        if (v50 >= v49 >> 1) {
          uint64_t v1 = (uint64_t)sub_25F3225B8((char *)(v49 > 1), v50 + 1, 1, (char *)v1);
        }
        *(void *)(v1 + 16) = v50 + 1;
        uint64_t v51 = v1 + 16 * v50;
        *(void *)(v51 + 32) = 0xD000000000000024;
        *(void *)(v51 + 40) = 0x800000025F407130;
      }
    }
  }
LABEL_49:
  uint64_t v60 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B398C98);
  sub_25F335CF0((unint64_t *)&qword_26B398CA0, &qword_26B398C98);
  uint64_t v54 = sub_25F3F6070();
  swift_bridgeObjectRelease();
  return v54;
}

BOOL TTSVBDataStoreEvent.voicesDidChange.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for TTSVBDataStoreEvent(0);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for TTSVBDataStoreEvent.MergeEvent(0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25F3B2BA8(v1, (uint64_t)v4, type metadata accessor for TTSVBDataStoreEvent);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_25F3B08B8((uint64_t)v4, type metadata accessor for TTSVBDataStoreEvent);
    return 0;
  }
  else
  {
    sub_25F3B0958((uint64_t)v4, (uint64_t)v7, type metadata accessor for TTSVBDataStoreEvent.MergeEvent);
    type metadata accessor for TTSVBLocalVoiceMO();
    id v9 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_entity);
    Swift::Bool v8 = TTSVBDataStoreEvent.MergeEvent.anyObjectIsEntity(_:)((NSEntityDescription)v9);

    sub_25F3B08B8((uint64_t)v7, type metadata accessor for TTSVBDataStoreEvent.MergeEvent);
  }
  return v8;
}

double sub_25F3AE4A0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_25F322920(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v13 = *v4;
    uint64_t *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_25F322FB8();
      uint64_t v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_25F3237C8((_OWORD *)(*(void *)(v11 + 56) + 32 * v8), a3);
    sub_25F3AE900(v8, v11);
    uint64_t *v4 = v11;
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

unint64_t sub_25F3AE5A4(uint64_t a1)
{
  uint64_t v2 = sub_25F3F6810();

  return sub_25F3AECF4(a1, v2);
}

uint64_t sub_25F3AE5E8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B398CF8);
  uint64_t v6 = sub_25F3F69A0();
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
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v14 << 6);
      goto LABEL_22;
    }
    int64_t v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v11) {
      break;
    }
    unint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v14;
    if (!v23)
    {
      int64_t v14 = v21 + 1;
      if (v21 + 1 >= v11) {
        goto LABEL_34;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v14);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v11)
        {
LABEL_34:
          swift_release();
          if ((a2 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v14 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_43;
            }
            if (v14 >= v11) {
              goto LABEL_34;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v14);
            ++v24;
            if (v23) {
              goto LABEL_21;
            }
          }
        }
        int64_t v14 = v24;
      }
    }
LABEL_21:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_22:
    uint64_t v25 = *(void *)(v5 + 48) + 40 * v20;
    if (a2)
    {
      long long v26 = *(_OWORD *)v25;
      long long v27 = *(_OWORD *)(v25 + 16);
      uint64_t v40 = *(void *)(v25 + 32);
      long long v38 = v26;
      long long v39 = v27;
      sub_25F3237C8((_OWORD *)(*(void *)(v5 + 56) + 32 * v20), v37);
    }
    else
    {
      sub_25F3B2B4C(v25, (uint64_t)&v38);
      sub_25F301A40(*(void *)(v5 + 56) + 32 * v20, (uint64_t)v37);
    }
    uint64_t result = sub_25F3F6810();
    uint64_t v28 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v29 = result & ~v28;
    unint64_t v30 = v29 >> 6;
    if (((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v34 = *(void *)(v12 + 8 * v30);
      }
      while (v34 == -1);
      unint64_t v15 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    uint64_t v16 = *(void *)(v7 + 48) + 40 * v15;
    long long v17 = v38;
    long long v18 = v39;
    *(void *)(v16 + 32) = v40;
    *(_OWORD *)uint64_t v16 = v17;
    *(_OWORD *)(v16 + 16) = v18;
    uint64_t result = (uint64_t)sub_25F3237C8(v37, (_OWORD *)(*(void *)(v7 + 56) + 32 * v15));
    ++*(void *)(v7 + 16);
  }
  swift_release();
  unint64_t v22 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v22, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v22 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_25F3AE900(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_25F3F67B0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_25F3F6C20();
        swift_bridgeObjectRetain();
        sub_25F3F61A0();
        uint64_t v10 = sub_25F3F6C70();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v11 = v10 & v7;
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
          uint64_t v13 = (_OWORD *)(v12 + 16 * v3);
          int64_t v14 = (_OWORD *)(v12 + 16 * v6);
          if (v3 != v6 || v13 >= v14 + 1) {
            *uint64_t v13 = *v14;
          }
          uint64_t v15 = *(void *)(a2 + 56);
          uint64_t v16 = (_OWORD *)(v15 + 32 * v3);
          long long v17 = (_OWORD *)(v15 + 32 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v16 >= v17 + 2))
          {
            long long v9 = v17[1];
            *uint64_t v16 = *v17;
            v16[1] = v9;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    long long v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v19 = *v18;
    uint64_t v20 = (-1 << v3) - 1;
  }
  else
  {
    long long v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v20 = *v18;
    uint64_t v19 = (-1 << result) - 1;
  }
  *long long v18 = v20 & v19;
  uint64_t v21 = *(void *)(a2 + 16);
  BOOL v22 = __OFSUB__(v21, 1);
  uint64_t v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

_OWORD *sub_25F3AEAD8(_OWORD *a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  unint64_t v8 = (void *)*v3;
  unint64_t v10 = sub_25F3AE5A4(a2);
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
  if (v15 < v13 || (a3 & 1) == 0)
  {
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_25F3AEDBC();
      goto LABEL_7;
    }
    sub_25F3AE5E8(v13, a3 & 1);
    unint64_t v19 = sub_25F3AE5A4(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      unint64_t v10 = v19;
      uint64_t v16 = *v4;
      if (v14) {
        goto LABEL_8;
      }
LABEL_13:
      sub_25F3B2B4C(a2, (uint64_t)v21);
      return sub_25F3AEC78(v10, (uint64_t)v21, a1, v16);
    }
LABEL_15:
    uint64_t result = (_OWORD *)sub_25F3F6BC0();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v16 = *v4;
  if ((v14 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  long long v17 = (_OWORD *)(v16[7] + 32 * v10);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v17);

  return sub_25F3237C8(a1, v17);
}

uint64_t sub_25F3AEC24(uint64_t a1)
{
  return a1;
}

_OWORD *sub_25F3AEC78(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v5 = a4[6] + 40 * a1;
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(void *)(v5 + 32) = *(void *)(a2 + 32);
  uint64_t result = sub_25F3237C8(a3, (_OWORD *)(a4[7] + 32 * a1));
  uint64_t v8 = a4[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a4[2] = v10;
  }
  return result;
}

unint64_t sub_25F3AECF4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_25F3B2B4C(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x2611F1240](v9, a1);
      sub_25F3AEC24((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

void *sub_25F3AEDBC()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B398CF8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25F3F6990();
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
    int64_t v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      int64_t v9 = v21 + 1;
      if (v21 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v22 = *(void *)(v6 + 8 * v9);
      if (!v22) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v22 - 1) & v22;
    unint64_t v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 40 * v15;
    sub_25F3B2B4C(*(void *)(v2 + 48) + 40 * v15, (uint64_t)v25);
    uint64_t v17 = 32 * v15;
    sub_25F301A40(*(void *)(v2 + 56) + v17, (uint64_t)v24);
    uint64_t v18 = *(void *)(v4 + 48) + v16;
    long long v19 = v25[0];
    long long v20 = v25[1];
    *(void *)(v18 + 32) = v26;
    *(_OWORD *)uint64_t v18 = v19;
    *(_OWORD *)(v18 + 16) = v20;
    uint64_t result = sub_25F3237C8(v24, (_OWORD *)(*(void *)(v4 + 56) + v17));
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v13) {
    goto LABEL_26;
  }
  unint64_t v22 = *(void *)(v6 + 8 * v23);
  if (v22)
  {
    int64_t v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v9);
    ++v23;
    if (v22) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void sub_25F3AEFA4(void *a1)
{
  id v2 = objc_msgSend(a1, sel_entitiesByName);
  sub_25F3236F0(0, &qword_26B398CB8);
  uint64_t v3 = sub_25F3F6040();

  if (!*(void *)(v3 + 16) || (unint64_t v4 = sub_25F322920(0xD000000000000012, 0x800000025F406E20), (v5 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    sub_25F3F6880();
    swift_bridgeObjectRelease();
    type metadata accessor for TTSVBError(0);
    sub_25F2FE028();
    swift_allocError();
    TTSVBError.init(_:_:_:)(0xD000000000000019, 0x800000025F407460, 0xD000000000000030, 0x800000025F407480, 0, v30);
    swift_willThrow();
    return;
  }
  id v6 = *(id *)(*(void *)(v3 + 56) + 8 * v4);
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(v6, sel_attributesByName);
  sub_25F3236F0(0, &qword_26B398CC0);
  uint64_t v8 = sub_25F3F6040();

  if (qword_26B399330 == -1)
  {
    if (!*(void *)(v8 + 16))
    {
LABEL_17:
      swift_bridgeObjectRelease();
      sub_25F3F6880();
      swift_bridgeObjectRelease();
      id v31 = objc_msgSend(v6, sel_description);
      sub_25F3F6130();

      sub_25F3F61E0();
      swift_bridgeObjectRelease();
      type metadata accessor for TTSVBError(0);
      sub_25F2FE028();
      swift_allocError();
      TTSVBError.init(_:_:_:)(0xD000000000000019, 0x800000025F407460, 0xD000000000000038, 0x800000025F4074C0, 0, v32);
      swift_willThrow();

      return;
    }
  }
  else
  {
    swift_once();
    if (!*(void *)(v8 + 16)) {
      goto LABEL_17;
    }
  }
  uint64_t v9 = qword_26B399320;
  uint64_t v10 = qword_26B399318;
  swift_bridgeObjectRetain();
  unint64_t v11 = sub_25F322920(v10, v9);
  if ((v12 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_17;
  }
  uint64_t v36 = v6;
  id v13 = *(id *)(*(void *)(v8 + 56) + 8 * v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (objc_msgSend(v13, sel_respondsToSelector_, sub_25F3F5DA0()))
  {
    unint64_t v14 = (void *)sub_25F3F6370();
    unint64_t v15 = (void *)sub_25F3F6100();
    objc_msgSend(v13, sel_setValue_forKey_, v14, v15);

    id v16 = objc_msgSend(a1, sel_entitiesByName);
    uint64_t v17 = sub_25F3F6040();

    if (!*(void *)(v17 + 16) || (unint64_t v18 = sub_25F322920(0xD000000000000015, 0x800000025F405E10), (v19 & 1) == 0))
    {
      swift_bridgeObjectRelease();
      sub_25F3F6880();
      swift_bridgeObjectRelease();
      type metadata accessor for TTSVBError(0);
      sub_25F2FE028();
      swift_allocError();
      TTSVBError.init(_:_:_:)(0xD000000000000019, 0x800000025F407460, 0xD000000000000033, 0x800000025F407500, 0, v33);
      swift_willThrow();

      return;
    }
    id v20 = *(id *)(*(void *)(v17 + 56) + 8 * v18);
    swift_bridgeObjectRelease();
    id v21 = objc_msgSend(v20, sel_attributesByName);
    uint64_t v22 = sub_25F3F6040();

    if (qword_26B399308 != -1) {
      swift_once();
    }
    if (*(void *)(v22 + 16))
    {
      uint64_t v23 = qword_26B3992F8;
      uint64_t v24 = qword_26B3992F0;
      swift_bridgeObjectRetain();
      unint64_t v25 = sub_25F322920(v24, v23);
      if (v26)
      {
        id v27 = *(id *)(*(void *)(v22 + 56) + 8 * v25);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (objc_msgSend(v27, sel_respondsToSelector_, sub_25F3F5DA0()))
        {
          uint64_t v28 = (void *)sub_25F3F6370();
          unint64_t v29 = (void *)sub_25F3F6100();
          objc_msgSend(v27, sel_setValue_forKey_, v28, v29);

          return;
        }
        goto LABEL_23;
      }
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    sub_25F3F6880();
    swift_bridgeObjectRelease();
    id v34 = objc_msgSend(v20, sel_description);
    sub_25F3F6130();

    sub_25F3F61E0();
    swift_bridgeObjectRelease();
    type metadata accessor for TTSVBError(0);
    sub_25F2FE028();
    swift_allocError();
    TTSVBError.init(_:_:_:)(0xD000000000000019, 0x800000025F407460, 0xD000000000000037, 0x800000025F407540, 0, v35);
    swift_willThrow();

    return;
  }
LABEL_23:
  sub_25F3F6970();
  __break(1u);
}

void sub_25F3AF758()
{
  uint64_t v1 = (void *)v0[2];
  uint64_t v2 = v0[3];
  uint64_t v3 = v0[4];
  unint64_t v4 = v1;
  swift_retain();
  sub_25F3AF7DC(v4, v4, v2, v3);
  swift_release();
}

uint64_t block_copy_helper_6(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_6()
{
  return swift_release();
}

void sub_25F3AF7DC(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v124 = a4;
  uint64_t v128 = *MEMORY[0x263EF8340];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B398D28);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v123 = (uint64_t)v104 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v116 = (uint64_t)v104 - v10;
  uint64_t v117 = type metadata accessor for TTSVBError.Reason(0);
  MEMORY[0x270FA5388](v117);
  uint64_t v118 = (uint64_t)v104 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3988B0);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  uint64_t v120 = (uint64_t)v104 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v119 = (uint64_t)v104 - v16;
  MEMORY[0x270FA5388](v15);
  unint64_t v18 = (char *)v104 - v17;
  uint64_t v19 = type metadata accessor for TTSVBError(0);
  uint64_t v121 = *(void *)(v19 - 8);
  uint64_t v122 = v19;
  MEMORY[0x270FA5388](v19);
  id v21 = ((char *)v104 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v22 = sub_25F3F5FE0();
  uint64_t v23 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  unint64_t v25 = (void *)((char *)v104 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
  char v26 = *(void **)((char *)a1 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport14TTSVBDataStore_queue);
  *unint64_t v25 = v26;
  (*(void (**)(void *, void, uint64_t))(v23 + 104))(v25, *MEMORY[0x263F8F0E8], v22);
  id v27 = v26;
  uint64_t v28 = sub_25F3F6000();
  uint64_t v30 = *(void (**)(void *, uint64_t))(v23 + 8);
  unint64_t v29 = v23 + 8;
  v30(v25, v22);
  if ((v28 & 1) == 0)
  {
    __break(1u);
LABEL_36:
    swift_bridgeObjectRetain();
    uint64_t v35 = sub_25F3F6980();
    swift_bridgeObjectRelease();
    goto LABEL_6;
  }
  id v31 = a1;
  if (*((unsigned char *)a1 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport14TTSVBDataStore_queue_shouldAttemptLoad) != 1)
  {
    uint64_t v49 = (uint64_t)a1 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport14TTSVBDataStore_queue_loadError;
    swift_beginAccess();
    sub_25F3078D4(v49, (uint64_t)v18, &qword_26B3988B0);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v121 + 48))(v18, 1, v122) != 1)
    {
      sub_25F3B0958((uint64_t)v18, (uint64_t)v21, type metadata accessor for TTSVBError);
      uint64_t v54 = v123;
      sub_25F3B2BA8((uint64_t)v21, v123, type metadata accessor for TTSVBError);
      swift_storeEnumTagMultiPayload();
      sub_25F3A89D0(v54, (uint64_t)a2, a3, v124);
      sub_25F307B78(v54, &qword_26B398D28);
      sub_25F3B08B8((uint64_t)v21, type metadata accessor for TTSVBError);
      return;
    }
    sub_25F307B78((uint64_t)v18, &qword_26B3988B0);
    uint64_t v50 = v123;
    swift_storeEnumTagMultiPayload();
    uint64_t v51 = v50;
    uint64_t v52 = (uint64_t)a2;
    uint64_t v53 = a3;
    goto LABEL_33;
  }
  *((unsigned char *)a1 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport14TTSVBDataStore_queue_shouldAttemptLoad) = 0;
  unint64_t v29 = sub_25F3A9FD8();
  sub_25F3EFA00();
  uint64_t v22 = sub_25F3F5EA0();
  a1 = v104;
  uint64_t v28 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  unint64_t v18 = (char *)v104 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(void))(v28 + 16))();
  swift_bridgeObjectRetain_n();
  id v21 = sub_25F3F5E80();
  int v112 = sub_25F3F64A0();
  BOOL v33 = os_log_type_enabled(v21, (os_log_type_t)v112);
  uint64_t v114 = a3;
  v115 = a2;
  uint64_t v113 = v7;
  if (!v33)
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v18, v22);
    goto LABEL_21;
  }
  id v34 = (uint8_t *)swift_slowAlloc();
  uint64_t v105 = swift_slowAlloc();
  *(void *)&long long v126 = v105;
  v106 = v34;
  *(_DWORD *)id v34 = 136315138;
  v111 = v31;
  if (v29 >> 62) {
    goto LABEL_36;
  }
  uint64_t v35 = *(void *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_6:
  uint64_t v36 = MEMORY[0x263F8EE78];
  uint64_t v109 = v28;
  uint64_t v110 = v22;
  v108 = v18;
  os_log_t v107 = v21;
  if (v35)
  {
    v104[1] = a1;
    uint64_t v125 = MEMORY[0x263F8EE78];
    sub_25F34BAB4(0, v35 & ~(v35 >> 63), 0);
    if (v35 < 0) {
      __break(1u);
    }
    uint64_t v37 = 0;
    uint64_t v36 = v125;
    unint64_t v38 = v29 & 0xC000000000000001;
    unint64_t v39 = v29;
    do
    {
      if (v38) {
        id v40 = (id)MEMORY[0x2611F12D0](v37, v29);
      }
      else {
        id v40 = *(id *)(v29 + 8 * v37 + 32);
      }
      id v41 = v40;
      id v42 = objc_msgSend(v41, sel_description);
      uint64_t v43 = sub_25F3F6130();
      uint64_t v45 = v44;

      uint64_t v125 = v36;
      unint64_t v47 = *(void *)(v36 + 16);
      unint64_t v46 = *(void *)(v36 + 24);
      if (v47 >= v46 >> 1)
      {
        sub_25F34BAB4((char *)(v46 > 1), v47 + 1, 1);
        uint64_t v36 = v125;
      }
      ++v37;
      *(void *)(v36 + 16) = v47 + 1;
      unint64_t v48 = v36 + 16 * v47;
      *(void *)(v48 + 32) = v43;
      *(void *)(v48 + 40) = v45;
      unint64_t v29 = v39;
    }
    while (v35 != v37);
  }
  uint64_t v125 = v36;
  v55 = v106;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B398C98);
  sub_25F335CF0((unint64_t *)&qword_26B398CA0, &qword_26B398C98);
  uint64_t v56 = sub_25F3F6070();
  unint64_t v58 = v57;
  swift_bridgeObjectRelease();
  uint64_t v125 = sub_25F2FE464(v56, v58, (uint64_t *)&v126);
  sub_25F3F66A0();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  os_log_t v59 = v107;
  _os_log_impl(&dword_25F2F5000, v107, (os_log_type_t)v112, "Will create and load TTSVoiceBanking persistent stores: %s", v55, 0xCu);
  uint64_t v60 = v105;
  swift_arrayDestroy();
  MEMORY[0x2611F21E0](v60, -1, -1);
  MEMORY[0x2611F21E0](v55, -1, -1);

  (*(void (**)(char *, uint64_t))(v109 + 8))(v108, v110);
  a3 = v114;
  a2 = v115;
  id v31 = v111;
LABEL_21:
  id v61 = sub_25F3A85B0();
  sub_25F3236F0(0, &qword_26B398CC8);
  v62 = (void *)sub_25F3F62E0();
  swift_bridgeObjectRelease();
  objc_msgSend(v61, sel_setPersistentStoreDescriptions_, v62);

  id v63 = sub_25F3A85B0();
  *(void *)&long long v126 = 0;
  LODWORD(v62) = objc_msgSend(v63, sel_load_, &v126);

  if (v62)
  {
    id v64 = (id)v126;
    id v65 = sub_25F3A85B0();
    id v66 = objc_msgSend(v65, sel_viewContext);

    v67 = (void *)sub_25F3F6100();
    objc_msgSend(v66, sel_setName_, v67);

    id v68 = sub_25F3A85B0();
    id v69 = objc_msgSend(v68, sel_viewContext);

    id v70 = objc_msgSend(self, sel_mergeByPropertyObjectTrumpMergePolicy);
    objc_msgSend(v69, sel_setMergePolicy_, v70);

    int v71 = *((unsigned __int8 *)v31 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport14TTSVBDataStore_configureation);
    if (v71)
    {
      char v72 = sub_25F3F6B80();
      swift_bridgeObjectRelease();
      if ((v72 & 1) == 0) {
        goto LABEL_29;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    id v86 = sub_25F3A85B0();
    id v87 = objc_msgSend(v86, sel_viewContext);

    objc_msgSend(v87, sel_setAutomaticallyMergesChangesFromParent_, 1);
    v88 = self;
    id v89 = objc_msgSend(v88, sel_defaultCenter);
    v90 = v31;
    uint64_t v91 = *MEMORY[0x263EFF038];
    id v92 = sub_25F3A85B0();
    id v93 = objc_msgSend(v92, sel_viewContext);

    objc_msgSend(v89, sel_addObserver_selector_name_object_, v31, sel_handleManagedObjectContextDidMergeChangesObjectIDs_, v91, v93);
    id v94 = objc_msgSend(v88, sel_defaultCenter);
    uint64_t v95 = *MEMORY[0x263EFF0F8];
    id v96 = sub_25F3A85B0();
    id v97 = objc_msgSend(v96, sel_persistentStoreCoordinator);

    uint64_t v98 = v95;
    id v31 = v90;
    objc_msgSend(v94, sel_addObserver_selector_name_object_, v90, sel_handlePersistentStoreRemoteChange_, v98, v97);

    if (!v71)
    {
      char v99 = sub_25F3F6B80();
      swift_bridgeObjectRelease();
      if ((v99 & 1) == 0)
      {
LABEL_32:
        uint64_t v50 = v123;
        swift_storeEnumTagMultiPayload();
        uint64_t v51 = v50;
        uint64_t v53 = v114;
        uint64_t v52 = (uint64_t)v115;
LABEL_33:
        sub_25F3A89D0(v51, v52, v53, v124);
        uint64_t v85 = v50;
        goto LABEL_34;
      }
LABEL_31:
      v100 = self;
      id v101 = objc_msgSend(v100, sel_defaultCenter);
      objc_msgSend(v101, sel_addObserver_selector_name_object_, v31, sel_handlePersistentCloudKitContainerEventChanged_, *MEMORY[0x263EFF080], 0);

      id v102 = objc_msgSend(v100, sel_defaultCenter);
      objc_msgSend(v102, sel_addObserver_selector_name_object_, v31, sel_handleWillResetCloudSync_, *MEMORY[0x263EFEFD8], 0);

      id v103 = objc_msgSend(v100, sel_defaultCenter);
      objc_msgSend(v103, sel_addObserver_selector_name_object_, v31, sel_handleDidResetCloudSync_, *MEMORY[0x263EFEFC8], 0);

      goto LABEL_32;
    }
LABEL_29:
    swift_bridgeObjectRelease();
    goto LABEL_31;
  }
  id v73 = (id)v126;
  v74 = (void *)sub_25F3F5980();

  swift_willThrow();
  long long v126 = xmmword_25F400550;
  char v127 = 3;
  uint64_t v75 = v118;
  sub_25F3A7DB0(&OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport14TTSVBDataStore____lazy_storage___localDatastoreURL, v118);
  swift_storeEnumTagMultiPayload();
  uint64_t v76 = sub_25F3F5970();
  uint64_t v77 = v119;
  TTSVBError.init(_:_:_:)((uint64_t)&v126, v75, v76, v119);
  uint64_t v79 = v121;
  uint64_t v78 = v122;
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v121 + 56))(v77, 0, 1, v122);
  uint64_t v80 = (uint64_t)v31 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport14TTSVBDataStore_queue_loadError;
  swift_beginAccess();
  sub_25F3B2C10(v77, v80, &qword_26B3988B0);
  swift_endAccess();
  uint64_t v81 = v80;
  uint64_t v82 = v120;
  sub_25F3078D4(v81, v120, &qword_26B3988B0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v79 + 48))(v82, 1, v78) != 1)
  {
    uint64_t v83 = v82;
    uint64_t v84 = v116;
    sub_25F3B0958(v83, v116, type metadata accessor for TTSVBError);
    swift_storeEnumTagMultiPayload();
    sub_25F3A89D0(v84, (uint64_t)a2, a3, v124);

    uint64_t v85 = v84;
LABEL_34:
    sub_25F307B78(v85, &qword_26B398D28);
    return;
  }
  swift_release();

  __break(1u);
}

uint64_t sub_25F3B0648(void *a1)
{
  id v1 = objc_msgSend(a1, sel_userInfo);
  if (!v1)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    return sub_25F307B78((uint64_t)&v19, (uint64_t *)&unk_26A78D2B0);
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_25F3F6040();

  v17[1] = sub_25F3F6130();
  v17[2] = v4;
  sub_25F3F6830();
  if (*(void *)(v3 + 16) && (unint64_t v5 = sub_25F3AE5A4((uint64_t)v18), (v6 & 1) != 0))
  {
    sub_25F301A40(*(void *)(v3 + 56) + 32 * v5, (uint64_t)&v19);
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_25F3AEC24((uint64_t)v18);
  if (!*((void *)&v20 + 1)) {
    return sub_25F307B78((uint64_t)&v19, (uint64_t *)&unk_26A78D2B0);
  }
  sub_25F307B78((uint64_t)&v19, (uint64_t *)&unk_26A78D2B0);
  uint64_t v7 = sub_25F3EFA00();
  uint64_t v8 = sub_25F3F5EA0();
  uint64_t v9 = *(void *)(v8 - 8);
  double v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, double))(v9 + 16))(v12, v7, v8, v10);
  uint64_t v13 = sub_25F3F5E80();
  os_log_type_t v14 = sub_25F3F64A0();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl(&dword_25F2F5000, v13, v14, "*** Got note *** should invalidate all objects", v15, 2u);
    MEMORY[0x2611F21E0](v15, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, v8);
}

uint64_t type metadata accessor for TTSVBDataStoreEvent(uint64_t a1)
{
  return sub_25F3227C4(a1, (uint64_t *)&unk_26B399440);
}

uint64_t sub_25F3B08B8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t type metadata accessor for TTSVBDataStoreEvent.CloudKitSyncEvent(uint64_t a1)
{
  return sub_25F3227C4(a1, (uint64_t *)&unk_26B399420);
}

uint64_t type metadata accessor for TTSVBDataStoreEvent.MergeEvent(uint64_t a1)
{
  return sub_25F3227C4(a1, (uint64_t *)&unk_26B399430);
}

uint64_t sub_25F3B0958(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void sub_25F3B09C0(unint64_t a1)
{
  unint64_t v1 = a1;
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_25F3F6980();
    swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A78D8E8);
      uint64_t v3 = sub_25F3F6870();
      uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
      if (!v2) {
        goto LABEL_4;
      }
LABEL_8:
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_25F3F6980();
      swift_bridgeObjectRelease();
      if (!v5) {
        return;
      }
      goto LABEL_9;
    }
  }
  else if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  uint64_t v3 = MEMORY[0x263F8EE88];
  uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
  if (v2) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5) {
    return;
  }
LABEL_9:
  uint64_t v7 = v3 + 56;
  uint64_t v43 = v5;
  if ((v1 & 0xC000000000000001) != 0)
  {
    uint64_t v8 = 0;
    unint64_t v41 = v1;
    while (1)
    {
      while (1)
      {
        uint64_t v9 = MEMORY[0x2611F12D0](v8, v1);
        BOOL v10 = __OFADD__(v8++, 1);
        if (v10)
        {
          __break(1u);
          goto LABEL_36;
        }
        uint64_t v11 = v9;
        uint64_t v12 = sub_25F3F6640();
        uint64_t v13 = -1 << *(unsigned char *)(v3 + 32);
        unint64_t v14 = v12 & ~v13;
        unint64_t v15 = v14 >> 6;
        uint64_t v16 = *(void *)(v7 + 8 * (v14 >> 6));
        uint64_t v17 = 1 << v14;
        if (((1 << v14) & v16) != 0) {
          break;
        }
LABEL_20:
        *(void *)(v7 + 8 * v15) = v17 | v16;
        *(void *)(*(void *)(v3 + 48) + 8 * v14) = v11;
        uint64_t v23 = *(void *)(v3 + 16);
        BOOL v10 = __OFADD__(v23, 1);
        uint64_t v24 = v23 + 1;
        if (v10) {
          goto LABEL_37;
        }
        *(void *)(v3 + 16) = v24;
        if (v8 == v5) {
          return;
        }
      }
      sub_25F3236F0(0, &qword_26A78D8C8);
      id v18 = *(id *)(*(void *)(v3 + 48) + 8 * v14);
      char v19 = sub_25F3F6650();

      if ((v19 & 1) == 0)
      {
        uint64_t v20 = ~v13;
        while (1)
        {
          unint64_t v14 = (v14 + 1) & v20;
          unint64_t v15 = v14 >> 6;
          uint64_t v16 = *(void *)(v7 + 8 * (v14 >> 6));
          uint64_t v17 = 1 << v14;
          if ((v16 & (1 << v14)) == 0) {
            break;
          }
          id v21 = *(id *)(*(void *)(v3 + 48) + 8 * v14);
          char v22 = sub_25F3F6650();

          if (v22) {
            goto LABEL_11;
          }
        }
        unint64_t v1 = v41;
        uint64_t v5 = v43;
        goto LABEL_20;
      }
LABEL_11:
      swift_unknownObjectRelease();
      unint64_t v1 = v41;
      uint64_t v5 = v43;
      if (v8 == v43) {
        return;
      }
    }
  }
  uint64_t v25 = 0;
  unint64_t v40 = v1 + 32;
  uint64_t v42 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v25 != v42)
  {
    id v26 = *(id *)(v40 + 8 * v25);
    uint64_t v27 = sub_25F3F6640();
    uint64_t v28 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v29 = v27 & ~v28;
    unint64_t v30 = v29 >> 6;
    uint64_t v31 = *(void *)(v7 + 8 * (v29 >> 6));
    uint64_t v32 = 1 << v29;
    if (((1 << v29) & v31) != 0)
    {
      sub_25F3236F0(0, &qword_26A78D8C8);
      id v33 = *(id *)(*(void *)(v3 + 48) + 8 * v29);
      char v34 = sub_25F3F6650();

      if (v34)
      {
LABEL_24:

        goto LABEL_25;
      }
      uint64_t v35 = ~v28;
      while (1)
      {
        unint64_t v29 = (v29 + 1) & v35;
        unint64_t v30 = v29 >> 6;
        uint64_t v31 = *(void *)(v7 + 8 * (v29 >> 6));
        uint64_t v32 = 1 << v29;
        if ((v31 & (1 << v29)) == 0) {
          break;
        }
        id v36 = *(id *)(*(void *)(v3 + 48) + 8 * v29);
        char v37 = sub_25F3F6650();

        if (v37) {
          goto LABEL_24;
        }
      }
    }
    *(void *)(v7 + 8 * v30) = v32 | v31;
    *(void *)(*(void *)(v3 + 48) + 8 * v29) = v26;
    uint64_t v38 = *(void *)(v3 + 16);
    BOOL v10 = __OFADD__(v38, 1);
    uint64_t v39 = v38 + 1;
    if (v10) {
      goto LABEL_38;
    }
    *(void *)(v3 + 16) = v39;
LABEL_25:
    if (++v25 == v43) {
      return;
    }
  }
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
}

uint64_t sub_25F3B0D1C(void *a1, const char *a2)
{
  id v3 = objc_msgSend(a1, sel_userInfo);
  if (!v3)
  {
    long long v29 = 0u;
    long long v30 = 0u;
LABEL_10:
    sub_25F307B78((uint64_t)&v29, (uint64_t *)&unk_26A78D2B0);
    goto LABEL_11;
  }
  uint64_t v4 = v3;
  uint64_t v5 = sub_25F3F6040();

  v27[1] = sub_25F3F6130();
  v27[2] = v6;
  sub_25F3F6830();
  if (*(void *)(v5 + 16) && (unint64_t v7 = sub_25F3AE5A4((uint64_t)v28), (v8 & 1) != 0))
  {
    sub_25F301A40(*(void *)(v5 + 56) + 32 * v7, (uint64_t)&v29);
  }
  else
  {
    long long v29 = 0u;
    long long v30 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_25F3AEC24((uint64_t)v28);
  if (!*((void *)&v30 + 1)) {
    goto LABEL_10;
  }
  sub_25F3236F0(0, &qword_26B398CD8);
  if (swift_dynamicCast())
  {
    id v9 = v28[0];
    BOOL v10 = (char *)objc_msgSend(v28[0], sel_unsignedIntegerValue);

    goto LABEL_12;
  }
LABEL_11:
  BOOL v10 = 0;
LABEL_12:
  uint64_t v11 = sub_25F3EFA00();
  uint64_t v12 = sub_25F3F5EA0();
  uint64_t v13 = *(void *)(v12 - 8);
  double v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, double))(v13 + 16))(v16, v11, v12, v14);
  uint64_t v17 = sub_25F3F5E80();
  os_log_type_t v18 = sub_25F3F64D0();
  if (os_log_type_enabled(v17, v18))
  {
    char v19 = (uint8_t *)swift_slowAlloc();
    uint64_t v20 = (void *)swift_slowAlloc();
    v28[0] = v20;
    *(_DWORD *)char v19 = 136315138;
    id v21 = v10 - 1;
    uint64_t v22 = 0xD000000000000010;
    unint64_t v23 = 0x800000025F407440;
    switch((unint64_t)v21)
    {
      case 0uLL:
        unint64_t v23 = 0xED00006E69676F4CLL;
        goto LABEL_19;
      case 1uLL:
        uint64_t v24 = 0x74756F676F4CLL;
        goto LABEL_18;
      case 2uLL:
        uint64_t v24 = 0x65676E616843;
LABEL_18:
        unint64_t v23 = v24 & 0xFFFFFFFFFFFFLL | 0xEE00000000000000;
LABEL_19:
        uint64_t v22 = 0x20746E756F636341;
        break;
      case 3uLL:
        break;
      case 4uLL:
        unint64_t v23 = 0xEC00000064657465;
        uint64_t v22 = 0x6C654420656E6F5ALL;
        break;
      case 5uLL:
        uint64_t v22 = 0xD000000000000015;
        uint64_t v25 = "History Token Expired";
        goto LABEL_23;
      case 6uLL:
        uint64_t v22 = 0xD00000000000001BLL;
        uint64_t v25 = "Server Change Token Expired";
LABEL_23:
        unint64_t v23 = (unint64_t)(v25 - 32) | 0x8000000000000000;
        break;
      default:
        unint64_t v23 = 0xEF746C7561666544;
        uint64_t v22 = 0x206E776F6E6B6E55;
        break;
    }
    *(void *)&long long v29 = sub_25F2FE464(v22, v23, (uint64_t *)v28);
    sub_25F3F66A0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25F2F5000, v17, v18, a2, v19, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611F21E0](v20, -1, -1);
    MEMORY[0x2611F21E0](v19, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v16, v12);
}

uint64_t sub_25F3B113C()
{
  return sub_25F3AAE9C(v0[2], v0[3], v0[4]);
}

unint64_t sub_25F3B1148()
{
  unint64_t result = qword_26A78D8D0;
  if (!qword_26A78D8D0)
  {
    sub_25F3236F0(255, &qword_26A78D8C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A78D8D0);
  }
  return result;
}

unint64_t sub_25F3B11A8()
{
  unint64_t result = qword_26A78D8D8;
  if (!qword_26A78D8D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A78D8D8);
  }
  return result;
}

unint64_t sub_25F3B1200()
{
  unint64_t result = qword_26A78D8E0;
  if (!qword_26A78D8E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A78D8E0);
  }
  return result;
}

ValueMetadata *type metadata accessor for TTSVBDataStoreEntity()
{
  return &type metadata for TTSVBDataStoreEntity;
}

ValueMetadata *type metadata accessor for TTSVBDataStoreAttribute()
{
  return &type metadata for TTSVBDataStoreAttribute;
}

uint64_t sub_25F3B1274()
{
  return type metadata accessor for TTSVBDataStore(0);
}

uint64_t type metadata accessor for TTSVBDataStore(uint64_t a1)
{
  return sub_25F3227C4(a1, qword_26B3993E0);
}

void sub_25F3B129C()
{
  sub_25F3F5B60();
  if (v0 <= 0x3F)
  {
    sub_25F3B1430(319, (unint64_t *)&qword_26B398890, MEMORY[0x270FA8EA8]);
    if (v1 <= 0x3F)
    {
      sub_25F3B1430(319, qword_26B3988B8, (void (*)(uint64_t))type metadata accessor for TTSVBError);
      if (v2 <= 0x3F) {
        swift_updateClassMetadata2();
      }
    }
  }
}

uint64_t method lookup function for TTSVBDataStore(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TTSVBDataStore);
}

void sub_25F3B1430(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_25F3F6680();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

ValueMetadata *type metadata accessor for TTSVBDataStore.Configuration()
{
  return &type metadata for TTSVBDataStore.Configuration;
}

uint64_t *initializeBufferWithCopyOfBuffer for TTSVBDataStore.XPCServiceConfig(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_25F3F5B60();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    BOOL v10 = *(void **)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = (uint64_t)v10;
    *(uint64_t *)((char *)a1 + v9) = *(uint64_t *)((char *)a2 + v9);
    uint64_t v11 = a3[7];
    uint64_t v12 = (uint64_t *)((char *)a1 + v11);
    uint64_t v13 = (uint64_t *)((char *)a2 + v11);
    uint64_t v14 = v13[1];
    *uint64_t v12 = *v13;
    v12[1] = v14;
    id v15 = v10;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for TTSVBDataStore.XPCServiceConfig(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25F3F5B60();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);

  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for TTSVBDataStore.XPCServiceConfig(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25F3F5B60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = *(void **)(a2 + v7);
  *(void *)(a1 + v7) = v9;
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  uint64_t v10 = a3[7];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  uint64_t v13 = v12[1];
  *uint64_t v11 = *v12;
  v11[1] = v13;
  id v14 = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TTSVBDataStore.XPCServiceConfig(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25F3F5B60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = *(void **)(a2 + v7);
  uint64_t v9 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = v8;
  id v10 = v8;

  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v11 = a3[7];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  *uint64_t v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for TTSVBDataStore.XPCServiceConfig(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25F3F5B60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t assignWithTake for TTSVBDataStore.XPCServiceConfig(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25F3F5B60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);

  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  swift_bridgeObjectRelease();
  uint64_t v9 = a3[7];
  id v10 = (void *)(a1 + v9);
  uint64_t v11 = (uint64_t *)(a2 + v9);
  uint64_t v13 = *v11;
  uint64_t v12 = v11[1];
  *id v10 = v13;
  v10[1] = v12;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TTSVBDataStore.XPCServiceConfig(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25F3B18F8);
}

uint64_t sub_25F3B18F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_indexTm(a1, a2, a3, MEMORY[0x270FA8F30]);
}

uint64_t storeEnumTagSinglePayload for TTSVBDataStore.XPCServiceConfig(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25F3B1918);
}

uint64_t sub_25F3B1918(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_indexTm(a1, a2, a3, a4, MEMORY[0x270FA8F30]);
}

uint64_t sub_25F3B1924()
{
  uint64_t result = sub_25F3F5B60();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unsigned char *_s31TextToSpeechVoiceBankingSupport14TTSVBDataStoreC13ConfigurationOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25F3B1AA0);
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

ValueMetadata *type metadata accessor for TTSVBDataStore.OperationContext()
{
  return &type metadata for TTSVBDataStore.OperationContext;
}

uint64_t *initializeBufferWithCopyOfBuffer for TTSVBDataStoreEvent(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    uint64_t v7 = sub_25F3F5890();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v8 = *(int *)(type metadata accessor for TTSVBDataStoreEvent.CloudKitSyncEvent(0) + 20);
      uint64_t v9 = *(void **)((char *)a2 + v8);
      *(uint64_t *)((char *)a1 + v8) = (uint64_t)v9;
      id v10 = v9;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void destroy for TTSVBDataStoreEvent(uint64_t a1)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t v3 = sub_25F3F5890();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  if (EnumCaseMultiPayload == 1)
  {
    unsigned int v4 = *(void **)(a1 + *(int *)(type metadata accessor for TTSVBDataStoreEvent.CloudKitSyncEvent(0) + 20));
  }
}

uint64_t initializeWithCopy for TTSVBDataStoreEvent(uint64_t a1, uint64_t a2)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t v5 = sub_25F3F5890();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a1, a2, v5);
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v6 = *(int *)(type metadata accessor for TTSVBDataStoreEvent.CloudKitSyncEvent(0) + 20);
    uint64_t v7 = *(void **)(a2 + v6);
    *(void *)(a1 + v6) = v7;
    id v8 = v7;
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for TTSVBDataStoreEvent(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_25F3B08B8(a1, type metadata accessor for TTSVBDataStoreEvent);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    uint64_t v5 = sub_25F3F5890();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a1, a2, v5);
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v6 = *(int *)(type metadata accessor for TTSVBDataStoreEvent.CloudKitSyncEvent(0) + 20);
      uint64_t v7 = *(void **)(a2 + v6);
      *(void *)(a1 + v6) = v7;
      id v8 = v7;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t initializeWithTake for TTSVBDataStoreEvent(uint64_t a1, uint64_t a2)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t v5 = sub_25F3F5890();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a1, a2, v5);
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v6 = type metadata accessor for TTSVBDataStoreEvent.CloudKitSyncEvent(0);
    *(void *)(a1 + *(int *)(v6 + 20)) = *(void *)(a2 + *(int *)(v6 + 20));
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithTake for TTSVBDataStoreEvent(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_25F3B08B8(a1, type metadata accessor for TTSVBDataStoreEvent);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    uint64_t v5 = sub_25F3F5890();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a1, a2, v5);
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v6 = type metadata accessor for TTSVBDataStoreEvent.CloudKitSyncEvent(0);
      *(void *)(a1 + *(int *)(v6 + 20)) = *(void *)(a2 + *(int *)(v6 + 20));
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_25F3B1F9C()
{
  uint64_t result = sub_25F3F5890();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for TTSVBDataStoreEvent.CloudKitSyncEvent(319);
    if (v2 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for TTSVBDataStoreEvent.MergeEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25F3F5890();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t destroy for TTSVBDataStoreEvent.MergeEvent(uint64_t a1)
{
  uint64_t v2 = sub_25F3F5890();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t initializeWithCopy for TTSVBDataStoreEvent.MergeEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25F3F5890();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for TTSVBDataStoreEvent.MergeEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25F3F5890();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for TTSVBDataStoreEvent.MergeEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25F3F5890();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for TTSVBDataStoreEvent.MergeEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25F3F5890();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for TTSVBDataStoreEvent.MergeEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25F3B22D4);
}

uint64_t sub_25F3B22D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25F3F5890();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for TTSVBDataStoreEvent.MergeEvent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25F3B2354);
}

uint64_t sub_25F3B2354(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25F3F5890();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t sub_25F3B23C4()
{
  uint64_t result = sub_25F3F5890();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for TTSVBDataStoreEvent.CloudKitSyncEvent(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_25F3F5890();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = *(void **)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = (uint64_t)v9;
    id v10 = v9;
  }
  return a1;
}

void destroy for TTSVBDataStoreEvent.CloudKitSyncEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25F3F5890();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  int v5 = *(void **)(a1 + *(int *)(a2 + 20));
}

uint64_t initializeWithCopy for TTSVBDataStoreEvent.CloudKitSyncEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25F3F5890();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void **)(a2 + v7);
  *(void *)(a1 + v7) = v8;
  id v9 = v8;
  return a1;
}

uint64_t assignWithCopy for TTSVBDataStoreEvent.CloudKitSyncEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25F3F5890();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void **)(a2 + v7);
  id v9 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = v8;
  id v10 = v8;

  return a1;
}

uint64_t initializeWithTake for TTSVBDataStoreEvent.CloudKitSyncEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25F3F5890();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for TTSVBDataStoreEvent.CloudKitSyncEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25F3F5890();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);

  return a1;
}

uint64_t getEnumTagSinglePayload for TTSVBDataStoreEvent.CloudKitSyncEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25F3B27B0);
}

uint64_t sub_25F3B27B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_indexTm(a1, a2, a3, MEMORY[0x270FA7FC0]);
}

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v7 = a4(0);
  uint64_t v8 = *(void *)(v7 - 8);
  if (*(_DWORD *)(v8 + 84) == a2)
  {
    id v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
    return v9(a1, a2, v7);
  }
  else
  {
    unint64_t v11 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v11 >= 0xFFFFFFFF) {
      LODWORD(v11) = -1;
    }
    return (v11 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for TTSVBDataStoreEvent.CloudKitSyncEvent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25F3B2894);
}

uint64_t sub_25F3B2894(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_indexTm(a1, a2, a3, a4, MEMORY[0x270FA7FC0]);
}

uint64_t __swift_store_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t result = a5(0);
  uint64_t v10 = *(void *)(result - 8);
  if (*(_DWORD *)(v10 + 84) == a3)
  {
    unint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
    return v11(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_25F3B2960()
{
  uint64_t result = sub_25F3F5890();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_25F3B29F8()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_25F3B2A38()
{
  return sub_25F3ABAAC(*(void (**)(char *))(v0 + 16), *(void *)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_25F3B2A44()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25F3B2A7C()
{
  return sub_25F3ABA04(*(void (**)(char *))(v0 + 16));
}

uint64_t sub_25F3B2A84()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_25F3B2ACC()
{
  sub_25F3AC438(*(void **)(v0 + 16), *(void *)(v0 + 24), *(char **)(v0 + 32));
}

uint64_t sub_25F3B2AD8()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
{
  unint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_25F3B2B4C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_25F3B2BA8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25F3B2C10(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_25F3B2C74()
{
  uint64_t v1 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B398D28) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  swift_release();
  uint64_t v5 = v0 + v3;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_25F307C20(*(void *)v5, *(void *)(v5 + 8), *(unsigned char *)(v5 + 16));
    uint64_t v6 = type metadata accessor for TTSVBError(0);
    uint64_t v7 = v5 + *(int *)(v6 + 20);
    type metadata accessor for TTSVBError.Reason(0);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
      case 7u:
      case 0x16u:
      case 0x1Au:
      case 0x1Cu:
        swift_bridgeObjectRelease();
        break;
      case 1u:
      case 2u:
      case 3u:
      case 4u:
      case 5u:
      case 6u:
      case 8u:
      case 9u:
      case 0xAu:
      case 0xBu:
      case 0xEu:
      case 0xFu:
      case 0x10u:
      case 0x11u:
      case 0x12u:
      case 0x13u:
      case 0x14u:
      case 0x18u:
        uint64_t v8 = sub_25F3F5B60();
        goto LABEL_4;
      case 0xCu:
      case 0xDu:
        uint64_t v9 = sub_25F3F5B60();
        uint64_t v10 = *(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8);
        v10(v7, v9);
        uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A78C970);
        v10(v7 + *(int *)(v11 + 48), v9);
        break;
      case 0x15u:
      case 0x17u:
      case 0x1Bu:
      case 0x1Du:
        uint64_t v8 = sub_25F3F5D30();
LABEL_4:
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
        break;
      default:
        break;
    }
  }

  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t TTSVBSiriTTSTrainingAsset.inferenceAssetURL.getter()
{
  return sub_25F3B2F5C();
}

uint64_t TTSVBSiriTTSTrainingAsset.trainingAssetURL.getter()
{
  return sub_25F3B2F5C();
}

uint64_t sub_25F3B2F5C()
{
  id v1 = objc_msgSend(v0, sel_path);
  if (v1)
  {
    uint64_t v2 = v1;
    sub_25F3F6130();

    uint64_t v3 = sub_25F3F5B60();
    uint64_t v4 = *(void *)(v3 - 8);
    MEMORY[0x270FA5388](v3);
    uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_25F3F5A60();
    swift_bridgeObjectRelease();
    sub_25F3F5AC0();
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  else
  {
    uint64_t result = sub_25F3F6970();
    __break(1u);
  }
  return result;
}

uint64_t TTSVBSiriTTSTrainingAsset.metadataURL.getter()
{
  uint64_t v1 = sub_25F3F5B60();
  uint64_t v2 = *(void *)(v1 - 8);
  unint64_t v3 = (*(void *)(v2 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  id v4 = objc_msgSend(v0, sel_path, MEMORY[0x270FA5388](v1));
  if (v4)
  {
    uint64_t v5 = v4;
    sub_25F3F6130();

    MEMORY[0x270FA5388](v6);
    sub_25F3F5A60();
    swift_bridgeObjectRelease();
    sub_25F3F5AC0();
    uint64_t v7 = *(void (**)(char *, uint64_t))(v2 + 8);
    v7((char *)&v9 - v3, v1);
    sub_25F3F5AC0();
    return ((uint64_t (*)(char *, uint64_t))v7)((char *)&v9 - v3, v1);
  }
  else
  {
    uint64_t result = sub_25F3F6970();
    __break(1u);
  }
  return result;
}

uint64_t TTSVBSiriTTSTrainingAsset.trainingScript.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = sub_25F3F5B60();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  TTSVBSiriTTSTrainingAsset.metadataURL.getter();
  static TTSVBTrainingScript.parseScript(fromMetadatFile:)((uint64_t)v5, a1);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t static TTSVBLiveSpeechSupport.localPrefsDomain.getter()
{
  return 0xD000000000000022;
}

unint64_t static TTSVBLiveSpeechSupport.cloudPrefsDomain.getter()
{
  return 0xD000000000000022;
}

uint64_t static TTSVBLiveSpeechSupport.favoritePhrasesKey.getter()
{
  return 0x657469726F766166;
}

unint64_t static TTSVBLiveSpeechSupport.favoritePhraseCategoriesKey.getter()
{
  return 0xD000000000000018;
}

uint64_t static TTSVBLiveSpeechSupport.maxRecentsKey.getter()
{
  return 0x6E6563655278616DLL;
}

uint64_t static TTSVBLiveSpeechSupport.phraseTextKey.getter()
{
  return 1954047348;
}

uint64_t static TTSVBLiveSpeechSupport.phraseShortcutKey.getter()
{
  return 0x74756374726F6873;
}

uint64_t static TTSVBLiveSpeechSupport.phraseInputIDKey.getter()
{
  return 0x44497475706E69;
}

uint64_t static TTSVBLiveSpeechSupport.phraseCategoryIDKey.getter()
{
  return 0x79726F6765746163;
}

uint64_t static TTSVBLiveSpeechSupport.phraseCreationDateKey.getter()
{
  return 0x6E6F697461657263;
}

uint64_t static TTSVBLiveSpeechSupport.phraseCategoryNameKey.getter()
{
  return 1701667182;
}

uint64_t static TTSVBLiveSpeechSupport.phraseCategorySymbolKey.getter()
{
  return 0x6C6F626D7973;
}

unint64_t static TTSVBLiveSpeechSupport.localPrefsDidChangeNotifyName.getter()
{
  return 0xD000000000000026;
}

id sub_25F3B3518(void *a1, uint64_t a2)
{
  return sub_25F3B35D4(a1, a2, (void (*)(void))NSUserDefaults.favoritePhrases.getter);
}

uint64_t sub_25F3B3534(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A78D2B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_25F3B35A4(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_25F3B35B0(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

id sub_25F3B35BC(void *a1, uint64_t a2)
{
  return sub_25F3B35D4(a1, a2, (void (*)(void))NSUserDefaults.liveSpeechPhrases.getter);
}

id sub_25F3B35D4(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4 = a1;
  a3();

  __swift_instantiateConcreteTypeFromMangledName(&qword_26B398C80);
  uint64_t v5 = (void *)sub_25F3F62E0();
  swift_bridgeObjectRelease();

  return v5;
}

uint64_t _sSo14NSUserDefaultsC31TextToSpeechVoiceBankingSupportE15favoritePhrasesSaySDySSypGGvg_0()
{
  uint64_t v1 = (void *)sub_25F3F6100();
  id v2 = objc_msgSend(v0, sel_objectForKey_, v1);

  if (v2)
  {
    sub_25F3F6730();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v5, 0, sizeof(v5));
  }
  sub_25F3B3534((uint64_t)v5, (uint64_t)v6);
  if (v7)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A78D8F8);
    if (swift_dynamicCast()) {
      return v4;
    }
  }
  else
  {
    sub_25F307B78((uint64_t)v6, (uint64_t *)&unk_26A78D2B0);
  }
  return MEMORY[0x263F8EE78];
}

void sub_25F3B374C(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B398C80);
  sub_25F3F6300();
  id v2 = a1;
  uint64_t v3 = (void *)sub_25F3F62E0();
  swift_bridgeObjectRelease();
  id v4 = (id)sub_25F3F6100();
  objc_msgSend(v2, sel_setObject_forKey_, v3, v4);
}

void _sSo14NSUserDefaultsC31TextToSpeechVoiceBankingSupportE15favoritePhrasesSaySDySSypGGvs_0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B398C80);
  uint64_t v1 = (void *)sub_25F3F62E0();
  swift_bridgeObjectRelease();
  id v2 = (id)sub_25F3F6100();
  objc_msgSend(v0, sel_setObject_forKey_, v1, v2);
}

void sub_25F3B38CC(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_25F3B38D8(id *a1@<X0>, SEL *a2@<X3>, uint64_t *a3@<X8>)
{
  id v4 = [*a1 *a2];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B398C80);
  uint64_t v5 = sub_25F3F6300();

  *a3 = v5;
}

void sub_25F3B393C(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

void sub_25F3B3948(uint64_t a1, void **a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  uint64_t v6 = *a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B398C80);
  id v7 = (id)sub_25F3F62E0();
  objc_msgSend(v6, *a5, v7);
}

id sub_25F3B39C0(void *a1)
{
  id v1 = a1;
  NSUserDefaults.liveSpeechCategories.getter();

  __swift_instantiateConcreteTypeFromMangledName(&qword_26A78D908);
  id v2 = (void *)sub_25F3F6020();
  swift_bridgeObjectRelease();

  return v2;
}

void sub_25F3B3A3C(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A78D908);
  sub_25F3F6040();
  id v2 = a1;
  uint64_t v3 = (void *)sub_25F3F6020();
  swift_bridgeObjectRelease();
  id v4 = (id)sub_25F3F6100();
  objc_msgSend(v2, sel_setObject_forKey_, v3, v4);
}

void NSUserDefaults.liveSpeechCategories.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A78D908);
  id v1 = (void *)sub_25F3F6020();
  swift_bridgeObjectRelease();
  id v2 = (id)sub_25F3F6100();
  objc_msgSend(v0, sel_setObject_forKey_, v1, v2);
}

void sub_25F3B3BE0(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_liveSpeechCategories);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A78D908);
  uint64_t v4 = sub_25F3F6040();

  *a2 = v4;
}

void sub_25F3B3C58(uint64_t a1, void **a2)
{
  id v2 = *a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A78D908);
  id v3 = (id)sub_25F3F6020();
  objc_msgSend(v2, sel_setLiveSpeechCategories_, v3);
}

unint64_t sub_25F3B3CD8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A78D998);
  id v2 = (void *)sub_25F3F69B0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_25F322920(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 3;
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

unint64_t sub_25F3B3DF4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A78D988);
  id v2 = (void *)sub_25F3F69B0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_25F322920(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    BOOL v12 = (void *)(v2[7] + 16 * result);
    *BOOL v12 = v8;
    v12[1] = v7;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
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

id sub_25F3B3F18(void *a1)
{
  id v1 = a1;
  id v2 = (void *)sub_25F3F6100();
  id v3 = objc_msgSend(v1, sel_integerForKey_, v2);

  return v3;
}

id NSUserDefaults.liveSpeechMaxRecentsCount.getter()
{
  id v1 = (void *)sub_25F3F6100();
  id v2 = objc_msgSend(v0, sel_integerForKey_, v1);

  return v2;
}

void sub_25F3B3FE4(void *a1)
{
  id v1 = a1;
  id v2 = (void *)sub_25F3F6430();
  id v3 = (id)sub_25F3F6100();
  objc_msgSend(v1, sel_setValue_forKey_, v2, v3);
}

void NSUserDefaults.liveSpeechMaxRecentsCount.setter()
{
  id v1 = (void *)sub_25F3F6430();
  id v2 = (id)sub_25F3F6100();
  objc_msgSend(v0, sel_setValue_forKey_, v1, v2);
}

id sub_25F3B40F0@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_liveSpeechMaxRecentsCount);
  *a2 = result;
  return result;
}

id sub_25F3B4124(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLiveSpeechMaxRecentsCount_, *a1);
}

uint64_t sub_25F3B4138(char a1)
{
  if (a1) {
    return 0x73746E65636552;
  }
  else {
    return 0x6465766153;
  }
}

uint64_t sub_25F3B416C(char *a1, char *a2)
{
  return sub_25F3B4178(*a1, *a2);
}

uint64_t sub_25F3B4178(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x73746E65636552;
  }
  else {
    uint64_t v3 = 0x6465766153;
  }
  if (v2) {
    unint64_t v4 = 0xE500000000000000;
  }
  else {
    unint64_t v4 = 0xE700000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x73746E65636552;
  }
  else {
    uint64_t v5 = 0x6465766153;
  }
  if (a2) {
    unint64_t v6 = 0xE700000000000000;
  }
  else {
    unint64_t v6 = 0xE500000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25F3F6B80();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25F3B4218()
{
  return sub_25F3B4220();
}

uint64_t sub_25F3B4220()
{
  return sub_25F3F6C70();
}

uint64_t sub_25F3B42A0()
{
  return sub_25F3B42A8();
}

uint64_t sub_25F3B42A8()
{
  sub_25F3F61A0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_25F3B4310()
{
  return sub_25F3B4318();
}

uint64_t sub_25F3B4318()
{
  return sub_25F3F6C70();
}

uint64_t sub_25F3B4394@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_25F3F69E0();
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

uint64_t sub_25F3B43F4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25F3B4138(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_25F3B4420(void *a1@<X8>)
{
  *a1 = &unk_270B96E58;
}

id sub_25F3B4430()
{
  id v1 = &v0[OBJC_IVAR___LiveSpeechPhrase_categoryID];
  *(void *)id v1 = 0;
  *((void *)v1 + 1) = 0;
  uint64_t v2 = &v0[OBJC_IVAR___LiveSpeechPhrase_inputID];
  *(void *)uint64_t v2 = 0;
  *((void *)v2 + 1) = 0;
  uint64_t v3 = &v0[OBJC_IVAR___LiveSpeechPhrase_anyCreationDate];
  *(_OWORD *)uint64_t v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  uint64_t v4 = &v0[OBJC_IVAR___LiveSpeechPhrase_text];
  *(void *)uint64_t v4 = 0;
  *((void *)v4 + 1) = 0xE000000000000000;
  swift_beginAccess();
  *(void *)uint64_t v2 = 0;
  *((void *)v2 + 1) = 0;
  uint64_t v5 = v0;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *(void *)id v1 = 0;
  *((void *)v1 + 1) = 0;

  swift_bridgeObjectRelease();
  v7.receiver = v5;
  v7.super_class = (Class)LiveSpeechPhrase;
  return objc_msgSendSuper2(&v7, sel_init);
}

char *sub_25F3B4538(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  BOOL v14 = (char *)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  uint64_t v15 = &v14[OBJC_IVAR___LiveSpeechPhrase_text];
  swift_beginAccess();
  *(void *)uint64_t v15 = a1;
  *((void *)v15 + 1) = a2;
  uint64_t v16 = v14;
  swift_bridgeObjectRelease();
  uint64_t v17 = &v16[OBJC_IVAR___LiveSpeechPhrase_inputID];
  swift_beginAccess();
  *(void *)uint64_t v17 = a3;
  *((void *)v17 + 1) = a4;
  swift_bridgeObjectRelease();
  os_log_type_t v18 = &v16[OBJC_IVAR___LiveSpeechPhrase_categoryID];
  swift_beginAccess();
  *(void *)os_log_type_t v18 = a5;
  *((void *)v18 + 1) = a6;
  swift_bridgeObjectRelease();
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B398898);
  MEMORY[0x270FA5388](v19 - 8);
  id v21 = (char *)&v26 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25F3078D4(a7, (uint64_t)v21, &qword_26B398898);
  uint64_t v22 = sub_25F3F5CC0();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22) != 1)
  {
    uint64_t v24 = (void *)sub_25F3F5C40();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v21, v22);
  }
  objc_msgSend(v16, sel_setCreationDate_, v24);

  sub_25F307B78(a7, &qword_26B398898);
  return v16;
}

char *sub_25F3B4758(uint64_t a1)
{
  id v2 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = (char *)v2;
  if (v3
    && (unint64_t v5 = sub_25F322920(1954047348, 0xE400000000000000), (v6 & 1) != 0)
    && (sub_25F301A40(*(void *)(a1 + 56) + 32 * v5, (uint64_t)&v34), swift_dynamicCast()))
  {
    uint64_t v7 = v33[7];
    unint64_t v8 = v33[8];
  }
  else
  {
    uint64_t v7 = 0;
    unint64_t v8 = 0xE000000000000000;
  }
  char v9 = &v4[OBJC_IVAR___LiveSpeechPhrase_text];
  swift_beginAccess();
  *(void *)char v9 = v7;
  *((void *)v9 + 1) = v8;
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 16) && (unint64_t v10 = sub_25F322920(0x44497475706E69, 0xE700000000000000), (v11 & 1) != 0))
  {
    sub_25F301A40(*(void *)(a1 + 56) + 32 * v10, (uint64_t)&v34);
    int v12 = swift_dynamicCast();
    if (v12) {
      uint64_t v13 = v33[4];
    }
    else {
      uint64_t v13 = 0;
    }
    if (v12) {
      uint64_t v14 = v33[5];
    }
    else {
      uint64_t v14 = 0;
    }
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v14 = 0;
  }
  uint64_t v15 = &v4[OBJC_IVAR___LiveSpeechPhrase_inputID];
  swift_beginAccess();
  *(void *)uint64_t v15 = v13;
  *((void *)v15 + 1) = v14;
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 16) && (unint64_t v16 = sub_25F322920(0x79726F6765746163, 0xEA00000000004449), (v17 & 1) != 0))
  {
    sub_25F301A40(*(void *)(a1 + 56) + 32 * v16, (uint64_t)&v34);
    int v18 = swift_dynamicCast();
    if (v18) {
      uint64_t v19 = v33[1];
    }
    else {
      uint64_t v19 = 0;
    }
    if (v18) {
      uint64_t v20 = v33[2];
    }
    else {
      uint64_t v20 = 0;
    }
  }
  else
  {
    uint64_t v19 = 0;
    uint64_t v20 = 0;
  }
  id v21 = &v4[OBJC_IVAR___LiveSpeechPhrase_categoryID];
  swift_beginAccess();
  *(void *)id v21 = v19;
  *((void *)v21 + 1) = v20;
  swift_bridgeObjectRelease();
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B398898);
  MEMORY[0x270FA5388](v22 - 8);
  uint64_t v24 = (char *)v33 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(a1 + 16) && (unint64_t v25 = sub_25F322920(0x6E6F697461657263, 0xEC00000065746144), (v26 & 1) != 0))
  {
    sub_25F301A40(*(void *)(a1 + 56) + 32 * v25, (uint64_t)&v34);
  }
  else
  {
    long long v34 = 0u;
    long long v35 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((void *)&v35 + 1))
  {
    uint64_t v27 = sub_25F3F5CC0();
    int v28 = swift_dynamicCast();
    uint64_t v29 = *(void *)(v27 - 8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v24, v28 ^ 1u, 1, v27);
    long long v30 = 0;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v24, 1, v27) != 1)
    {
      long long v30 = (void *)sub_25F3F5C40();
      (*(void (**)(char *, uint64_t))(v29 + 8))(v24, v27);
    }
  }
  else
  {
    sub_25F307B78((uint64_t)&v34, (uint64_t *)&unk_26A78D2B0);
    uint64_t v31 = sub_25F3F5CC0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v24, 1, 1, v31);
    long long v30 = 0;
  }
  objc_msgSend(v4, sel_setCreationDate_, v30);

  return v4;
}

id sub_25F3B4BB0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a1 + *a3;
  swift_beginAccess();
  if (*(void *)(v3 + 8))
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = (void *)sub_25F3F6100();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t sub_25F3B4C44(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a3)
  {
    uint64_t v6 = sub_25F3F6130();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  char v9 = (uint64_t *)(a1 + *a4);
  swift_beginAccess();
  *char v9 = v6;
  v9[1] = v8;
  return swift_bridgeObjectRelease();
}

uint64_t sub_25F3B4DE4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR___LiveSpeechPhrase_anyCreationDate;
  swift_beginAccess();
  sub_25F3078D4(v3, (uint64_t)v8, (uint64_t *)&unk_26A78D2B0);
  if (v9)
  {
    uint64_t v4 = sub_25F3F5CC0();
    int v5 = swift_dynamicCast();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(a1, v5 ^ 1u, 1, v4);
  }
  else
  {
    sub_25F307B78((uint64_t)v8, (uint64_t *)&unk_26A78D2B0);
    uint64_t v7 = sub_25F3F5CC0();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(a1, 1, 1, v7);
  }
}

uint64_t sub_25F3B5008(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B398898);
  MEMORY[0x270FA5388](v3 - 8);
  int v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25F3078D4(a1, (uint64_t)v5, &qword_26B398898);
  uint64_t v6 = sub_25F3F5CC0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_25F307B78(a1, &qword_26B398898);
    sub_25F307B78((uint64_t)v5, &qword_26B398898);
    long long v12 = 0u;
    long long v13 = 0u;
  }
  else
  {
    *((void *)&v13 + 1) = v6;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v12);
    (*(void (**)(uint64_t *, char *, uint64_t))(v7 + 32))(boxed_opaque_existential_0, v5, v6);
    sub_25F307B78(a1, &qword_26B398898);
  }
  uint64_t v9 = v1 + OBJC_IVAR___LiveSpeechPhrase_anyCreationDate;
  swift_beginAccess();
  sub_25F3B9390((uint64_t)&v12, v9);
  return swift_endAccess();
}

uint64_t sub_25F3B5270(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14 = *a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v15 = swift_bridgeObjectRetain();
  unint64_t v16 = sub_25F3BA65C(v15, a2, a3, a4, a5);
  char v18 = v17;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v18 & 1) == 0)
  {
    v33[3] = MEMORY[0x263F8D310];
    v33[0] = a6;
    v33[1] = a7;
    swift_bridgeObjectRetain();
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if (result)
    {
      if ((v16 & 0x8000000000000000) == 0) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t result = (uint64_t)sub_25F3BA360(v14);
      uint64_t v14 = (void *)result;
      if ((v16 & 0x8000000000000000) == 0)
      {
LABEL_4:
        if (v16 < v14[2])
        {
          sub_25F3B55E4((uint64_t)v33, 1954047348, 0xE400000000000000);
          *a1 = v14;
          return notify_post("com.apple.livespeech.localprefschanged");
        }
        goto LABEL_12;
      }
    }
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  uint64_t v20 = sub_25F3EFF08();
  swift_beginAccess();
  uint64_t v21 = sub_25F3F5EA0();
  uint64_t v22 = *(void *)(v21 - 8);
  double v23 = MEMORY[0x270FA5388](v21);
  unint64_t v25 = (char *)&v33[-1] - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, double))(v22 + 16))(v25, v20, v21, v23);
  char v26 = sub_25F3F5E80();
  os_log_type_t v27 = sub_25F3F64C0();
  if (os_log_type_enabled(v26, v27))
  {
    uint64_t v28 = swift_slowAlloc();
    uint64_t v32 = (uint64_t)&v32;
    uint64_t v29 = (uint8_t *)v28;
    uint64_t v30 = swift_slowAlloc();
    uint64_t v34 = v30;
    *(_DWORD *)uint64_t v29 = 136315138;
    v33[4] = sub_25F2FE464(0xD00000000000003CLL, 0x800000025F407BF0, &v34);
    sub_25F3F66A0();
    _os_log_impl(&dword_25F2F5000, v26, v27, "%s", v29, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611F21E0](v30, -1, -1);
    MEMORY[0x2611F21E0](v29, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v22 + 8))(v25, v21);
  type metadata accessor for TTSVBError(0);
  sub_25F2FE028();
  swift_allocError();
  TTSVBError.init(_:_:_:)(0xD00000000000003CLL, 0x800000025F407BF0, 0, 0, 0, v31);
  return swift_willThrow();
}

uint64_t sub_25F3B55E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    sub_25F3237C8((_OWORD *)a1, v9);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_25F322DF8(v9, a2, a3, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v8;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_25F307B78(a1, (uint64_t *)&unk_26A78D2B0);
    sub_25F3AE4A0(a2, a3, v9);
    swift_bridgeObjectRelease();
    return sub_25F307B78((uint64_t)v9, (uint64_t *)&unk_26A78D2B0);
  }
}

unint64_t _sSo14NSUserDefaultsC31TextToSpeechVoiceBankingSupportE04liveE10CategoriesSDySSSDyS2SGGvg_0()
{
  uint64_t v1 = (void *)sub_25F3F6100();
  id v2 = objc_msgSend(v0, sel_objectForKey_, v1);

  if (v2)
  {
    sub_25F3F6730();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v5, 0, sizeof(v5));
  }
  sub_25F3B3534((uint64_t)v5, (uint64_t)v6);
  if (v7)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A78D900);
    if (swift_dynamicCast()) {
      return v4;
    }
  }
  else
  {
    sub_25F307B78((uint64_t)v6, (uint64_t *)&unk_26A78D2B0);
  }
  return sub_25F3B3CD8(MEMORY[0x263F8EE78]);
}

uint64_t sub_25F3B57D0(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14 = *a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v15 = swift_bridgeObjectRetain();
  unint64_t v16 = sub_25F3BA65C(v15, a2, a3, a4, a5);
  char v18 = v17;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v18 & 1) == 0)
  {
    v33[3] = MEMORY[0x263F8D310];
    v33[0] = a6;
    v33[1] = a7;
    swift_bridgeObjectRetain();
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if (result)
    {
      if ((v16 & 0x8000000000000000) == 0) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t result = (uint64_t)sub_25F3BA360(v14);
      uint64_t v14 = (void *)result;
      if ((v16 & 0x8000000000000000) == 0)
      {
LABEL_4:
        if (v16 < v14[2])
        {
          sub_25F3B55E4((uint64_t)v33, 0x79726F6765746163, 0xEA00000000004449);
          *a1 = v14;
          return notify_post("com.apple.livespeech.localprefschanged");
        }
        goto LABEL_12;
      }
    }
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  uint64_t v20 = sub_25F3EFF08();
  swift_beginAccess();
  uint64_t v21 = sub_25F3F5EA0();
  uint64_t v22 = *(void *)(v21 - 8);
  double v23 = MEMORY[0x270FA5388](v21);
  unint64_t v25 = (char *)&v33[-1] - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, double))(v22 + 16))(v25, v20, v21, v23);
  char v26 = sub_25F3F5E80();
  os_log_type_t v27 = sub_25F3F64C0();
  if (os_log_type_enabled(v26, v27))
  {
    uint64_t v28 = swift_slowAlloc();
    uint64_t v32 = (uint64_t)&v32;
    uint64_t v29 = (uint8_t *)v28;
    uint64_t v30 = swift_slowAlloc();
    uint64_t v34 = v30;
    *(_DWORD *)uint64_t v29 = 136315138;
    v33[4] = sub_25F2FE464(0xD000000000000045, 0x800000025F407BA0, &v34);
    sub_25F3F66A0();
    _os_log_impl(&dword_25F2F5000, v26, v27, "%s", v29, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611F21E0](v30, -1, -1);
    MEMORY[0x2611F21E0](v29, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v22 + 8))(v25, v21);
  type metadata accessor for TTSVBError(0);
  sub_25F2FE028();
  swift_allocError();
  TTSVBError.init(_:_:_:)(0xD000000000000045, 0x800000025F407BA0, 0, 0, 0, v31);
  return swift_willThrow();
}

uint64_t sub_25F3B5B68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v8 = sub_25F3F6130();
  uint64_t v10 = v9;
  uint64_t v11 = sub_25F3F6130();
  uint64_t v13 = v12;
  uint64_t v14 = sub_25F3F6130();
  a7(v8, v10, v11, v13, v14, v15);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 1;
}

uint64_t sub_25F3B5C80(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = MEMORY[0x263F8EE78];
  if (v2)
  {
    uint64_t v21 = MEMORY[0x263F8EE78];
    sub_25F3F6920();
    uint64_t v4 = sub_25F3BA374(a1);
    int v6 = v5;
    uint64_t v7 = a1 + 64;
    uint64_t result = type metadata accessor for LiveSpeechCategory(v4);
    uint64_t v8 = 0;
    while ((v4 & 0x8000000000000000) == 0 && v4 < 1 << *(unsigned char *)(a1 + 32))
    {
      unint64_t v10 = (unint64_t)v4 >> 6;
      if ((*(void *)(v7 + 8 * ((unint64_t)v4 >> 6)) & (1 << v4)) == 0) {
        goto LABEL_22;
      }
      if (*(_DWORD *)(a1 + 36) != v6) {
        goto LABEL_23;
      }
      uint64_t v20 = v8;
      uint64_t v11 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v4);
      uint64_t v13 = *v11;
      uint64_t v12 = v11[1];
      uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8 * v4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_25F3B6640(v13, v12, v14);
      sub_25F3F6900();
      sub_25F3F6930();
      sub_25F3F6940();
      uint64_t result = sub_25F3F6910();
      int64_t v9 = 1 << *(unsigned char *)(a1 + 32);
      if (v4 >= v9) {
        goto LABEL_24;
      }
      uint64_t v15 = *(void *)(v7 + 8 * v10);
      if ((v15 & (1 << v4)) == 0) {
        goto LABEL_25;
      }
      if (*(_DWORD *)(a1 + 36) != v6) {
        goto LABEL_26;
      }
      unint64_t v16 = v15 & (-2 << (v4 & 0x3F));
      if (v16)
      {
        int64_t v9 = __clz(__rbit64(v16)) | v4 & 0xFFFFFFFFFFFFFFC0;
      }
      else
      {
        unint64_t v17 = v10 + 1;
        unint64_t v18 = (unint64_t)(v9 + 63) >> 6;
        if (v10 + 1 < v18)
        {
          unint64_t v19 = *(void *)(v7 + 8 * v17);
          if (v19)
          {
LABEL_18:
            int64_t v9 = __clz(__rbit64(v19)) + (v17 << 6);
          }
          else
          {
            while (v18 - 2 != v10)
            {
              unint64_t v19 = *(void *)(a1 + 80 + 8 * v10++);
              if (v19)
              {
                unint64_t v17 = v10 + 1;
                goto LABEL_18;
              }
            }
          }
        }
      }
      uint64_t v8 = v20 + 1;
      uint64_t v4 = v9;
      if (v20 + 1 == v2) {
        return v21;
      }
    }
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
  }
  return result;
}

uint64_t static LiveSpeechPhrase.observeChanges(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_25F3B8AF0(a1, a2, a3);
}

id static LiveSpeechPhrase.maxPreferredPhraseCount.getter()
{
  if (qword_26A79DCD0 != -1) {
    swift_once();
  }
  id v0 = (id)qword_26A79DCD8;
  uint64_t v1 = (void *)sub_25F3F6100();
  id v2 = objc_msgSend(v0, sel_integerForKey_, v1);

  return v2;
}

void static LiveSpeechPhrase.maxPreferredPhraseCount.setter()
{
  if (qword_26A79DCD0 != -1) {
    swift_once();
  }
  id v0 = (id)qword_26A79DCD8;
  uint64_t v1 = (void *)sub_25F3F6430();
  id v2 = (id)sub_25F3F6100();
  objc_msgSend(v0, sel_setValue_forKey_, v1, v2);
}

uint64_t static LiveSpeechPhrase.observeChangesAsync()()
{
  if (qword_26A79DCD0 != -1) {
    swift_once();
  }
  id v0 = (void *)qword_26A79DCD8;
  swift_getKeyPath();
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A78D930);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = v0;
  sub_25F3F5A00();
  sub_25F3BE074(&qword_26A78D938, &qword_26A78D930);
  uint64_t v6 = sub_25F3F5F20();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  v10[1] = v6;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A78D940);
  uint64_t v8 = sub_25F335CF0(&qword_26A78D948, &qword_26A78D940);
  MEMORY[0x2611F0980](v7, v8);

  swift_release();
  return swift_release();
}

uint64_t LiveSpeechCategory.id.getter()
{
  id v1 = objc_msgSend(v0, sel_categoryID);
  uint64_t v2 = sub_25F3F6130();

  return v2;
}

void sub_25F3B657C(uint64_t *a1@<X8>)
{
  id v3 = objc_msgSend(*v1, sel_categoryID);
  uint64_t v4 = sub_25F3F6130();
  uint64_t v6 = v5;

  *a1 = v4;
  a1[1] = v6;
}

char *sub_25F3B6640(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (char *)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  uint64_t v7 = &v6[OBJC_IVAR___LiveSpeechCategory_categoryID];
  swift_beginAccess();
  *(void *)uint64_t v7 = a1;
  *((void *)v7 + 1) = a2;
  uint64_t v8 = v6;
  swift_bridgeObjectRelease();
  if (*(void *)(a3 + 16) && (unint64_t v9 = sub_25F322920(1701667182, 0xE400000000000000), (v10 & 1) != 0))
  {
    uint64_t v11 = (uint64_t *)(*(void *)(a3 + 56) + 16 * v9);
    uint64_t v13 = *v11;
    unint64_t v12 = v11[1];
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v13 = 0;
    unint64_t v12 = 0xE000000000000000;
  }
  uint64_t v14 = &v8[OBJC_IVAR___LiveSpeechCategory_name];
  swift_beginAccess();
  *(void *)uint64_t v14 = v13;
  *((void *)v14 + 1) = v12;
  swift_bridgeObjectRelease();
  if (*(void *)(a3 + 16) && (unint64_t v15 = sub_25F322920(0x6C6F626D7973, 0xE600000000000000), (v16 & 1) != 0))
  {
    unint64_t v17 = (uint64_t *)(*(void *)(a3 + 56) + 16 * v15);
    uint64_t v19 = *v17;
    unint64_t v18 = v17[1];
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v19 = 0;
    unint64_t v18 = 0xE000000000000000;
  }
  swift_bridgeObjectRelease();
  uint64_t v20 = &v8[OBJC_IVAR___LiveSpeechCategory_symbol];
  swift_beginAccess();
  *(void *)uint64_t v20 = v19;
  *((void *)v20 + 1) = v18;

  swift_bridgeObjectRelease();
  return v8;
}

id sub_25F3B67FC()
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  id v0 = (void *)sub_25F3F6100();
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t sub_25F3B6880(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6 = sub_25F3F6130();
  uint64_t v8 = v7;
  unint64_t v9 = (uint64_t *)(a1 + *a4);
  swift_beginAccess();
  *unint64_t v9 = v6;
  v9[1] = v8;
  return swift_bridgeObjectRelease();
}

uint64_t sub_25F3B6ADC()
{
  id v1 = objc_msgSend(v0, sel_categoryID);
  uint64_t v2 = sub_25F3F6130();
  uint64_t v4 = v3;

  BOOL v5 = v2 == 0x73746E65636552 && v4 == 0xE700000000000000;
  if (v5 || (sub_25F3F6B80() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    uint64_t v6 = (void *)sub_25F3F6100();
    id v7 = TTSVBSupportLocString(v6);
  }
  else
  {
    if (v2 == 0x6465766153 && v4 == 0xE500000000000000)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v12 = sub_25F3F6B80();
      swift_bridgeObjectRelease();
      if ((v12 & 1) == 0)
      {
        id v8 = objc_msgSend(v0, sel_name);
        goto LABEL_8;
      }
    }
    uint64_t v6 = (void *)sub_25F3F6100();
    id v7 = TTSVBSupportLocString(v6);
  }
  id v8 = v7;

LABEL_8:
  uint64_t v9 = sub_25F3F6130();

  return v9;
}

void sub_25F3B6D68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = v4;
  v35[3] = *(id *)MEMORY[0x263EF8340];
  if (qword_26A79DCD0 != -1) {
    swift_once();
  }
  id v11 = (id)qword_26A79DCD8;
  v35[0] = (id)_sSo14NSUserDefaultsC31TextToSpeechVoiceBankingSupportE15favoritePhrasesSaySDySSypGGvg_0();
  sub_25F3B726C((uint64_t)v35, v6, a1, a2, a3, a4);
  if (v5)
  {

LABEL_20:
    swift_bridgeObjectRelease();
    return;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B398C80);
  char v12 = (void *)sub_25F3F62E0();
  swift_bridgeObjectRelease();
  uint64_t v13 = (void *)sub_25F3F6100();
  objc_msgSend(v11, sel_setObject_forKey_, v12, v13);

  id v14 = objc_msgSend(v6, sel_phrases);
  type metadata accessor for LiveSpeechPhrase((uint64_t)v14);
  unint64_t v15 = sub_25F3F6300();

  if ((objc_msgSend(v6, sel_isRecents) & 1) == 0) {
    goto LABEL_20;
  }
  if (!(v15 >> 62))
  {
    if (*(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10) <= 0x64uLL) {
      goto LABEL_20;
    }
    goto LABEL_8;
  }
  swift_bridgeObjectRetain();
  uint64_t v20 = sub_25F3F6980();
  swift_bridgeObjectRelease();
  if (v20 <= 100) {
    goto LABEL_20;
  }
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_25F3F6980();
  swift_bridgeObjectRelease();
  if (v21)
  {
LABEL_8:
    if ((v15 & 0xC000000000000001) != 0)
    {
      id v16 = (id)MEMORY[0x2611F12D0](0, v15);
    }
    else
    {
      if (!*(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        __break(1u);
      }
      id v16 = *(id *)(v15 + 32);
    }
    unint64_t v17 = v16;
    swift_bridgeObjectRelease();
    v35[0] = 0;
    if (objc_msgSend(v6, sel_deletePhrase_error_, v17, v35))
    {
      id v18 = v35[0];
    }
    else
    {
      id v19 = v35[0];
      sub_25F3F5980();

      swift_willThrow();
    }

    return;
  }
  swift_bridgeObjectRelease();
  uint64_t v22 = sub_25F3EFF08();
  swift_beginAccess();
  uint64_t v23 = sub_25F3F5EA0();
  v33[1] = v33;
  uint64_t v24 = *(void *)(v23 - 8);
  double v25 = MEMORY[0x270FA5388](v23);
  os_log_type_t v27 = (char *)v33 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, double))(v24 + 16))(v27, v22, v23, v25);
  uint64_t v28 = sub_25F3F5E80();
  os_log_type_t v29 = sub_25F3F64C0();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v30 = (uint8_t *)swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    uint64_t v34 = v31;
    *(_DWORD *)uint64_t v30 = 136315138;
    v33[2] = sub_25F2FE464(0xD000000000000032, 0x800000025F407740, &v34);
    sub_25F3F66A0();
    _os_log_impl(&dword_25F2F5000, v28, v29, "%s", v30, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611F21E0](v31, -1, -1);
    MEMORY[0x2611F21E0](v30, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v24 + 8))(v27, v23);
  type metadata accessor for TTSVBError(0);
  sub_25F2FE028();
  swift_allocError();
  TTSVBError.init(_:_:_:)(0xD000000000000032, 0x800000025F407740, 0, 0, 0, v32);
  swift_willThrow();
}

uint64_t sub_25F3B726C(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v54 = a5;
  uint64_t v6 = a6;
  uint64_t v56 = a4;
  uint64_t v57 = a3;
  unint64_t v58 = a2;
  id v7 = (void *)a1;
  id v8 = *(void **)a1;
  uint64_t v9 = *(void *)(*(void *)a1 + 16);
  if (!v9)
  {
LABEL_26:
    type metadata accessor for LiveSpeechPhrase(a1);
    swift_bridgeObjectRetain();
    uint64_t v26 = v56;
    swift_bridgeObjectRetain();
    id v27 = objc_msgSend(v58, sel_categoryID);
    uint64_t v28 = sub_25F3F6130();
    uint64_t v30 = v29;

    uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B398898);
    MEMORY[0x270FA5388](v31 - 8);
    id v33 = (char *)&v52 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_25F3F5CB0();
    uint64_t v34 = sub_25F3F5CC0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v33, 0, 1, v34);
    long long v35 = sub_25F3B4538(v57, v26, v54, v6, v28, v30, (uint64_t)v33);
    unint64_t v36 = sub_25F3B78A8();

    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      id v8 = sub_25F3B9184(0, v8[2] + 1, 1, v8);
    }
    unint64_t v38 = v8[2];
    unint64_t v37 = v8[3];
    if (v38 >= v37 >> 1) {
      id v8 = sub_25F3B9184((void *)(v37 > 1), v38 + 1, 1, v8);
    }
    v8[2] = v38 + 1;
    v8[v38 + 4] = v36;
    *id v7 = v8;
    return notify_post("com.apple.livespeech.localprefschanged");
  }
  uint64_t v52 = a6;
  uint64_t v53 = (void *)a1;
  swift_bridgeObjectRetain();
  uint64_t v10 = 0;
  uint64_t v55 = MEMORY[0x263F8EE58] + 8;
  id v11 = v8;
  while (1)
  {
    uint64_t v12 = v8[v10 + 4];
    swift_bridgeObjectRetain();
    if (*(void *)(v12 + 16)
      && (unint64_t v13 = sub_25F322920(0x79726F6765746163, 0xEA00000000004449), (v14 & 1) != 0)
      && (sub_25F301A40(*(void *)(v12 + 56) + 32 * v13, (uint64_t)v61), swift_dynamicCast()))
    {
      uint64_t v16 = v59;
      uint64_t v15 = v60;
    }
    else
    {
      uint64_t v16 = 0;
      uint64_t v15 = 0;
    }
    id v17 = objc_msgSend(v58, sel_categoryID, v52, v53, v54);
    uint64_t v18 = sub_25F3F6130();
    uint64_t v20 = v19;

    if (!v15)
    {
      swift_bridgeObjectRelease();
      id v8 = v11;
      goto LABEL_4;
    }
    BOOL v21 = v16 == v18 && v15 == v20;
    id v8 = v11;
    if (v21)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (!*(void *)(v12 + 16)) {
        goto LABEL_4;
      }
    }
    else
    {
      char v22 = sub_25F3F6B80();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v22 & 1) == 0 || !*(void *)(v12 + 16)) {
        goto LABEL_4;
      }
    }
    unint64_t v23 = sub_25F322920(1954047348, 0xE400000000000000);
    if ((v24 & 1) == 0) {
      goto LABEL_4;
    }
    sub_25F301A40(*(void *)(v12 + 56) + 32 * v23, (uint64_t)v61);
    if ((swift_dynamicCast() & 1) == 0) {
      goto LABEL_4;
    }
    if (v59 == v57 && v60 == v56) {
      break;
    }
    char v25 = sub_25F3F6B80();
    swift_bridgeObjectRelease();
    if (v25) {
      goto LABEL_32;
    }
LABEL_4:
    ++v10;
    swift_bridgeObjectRelease();
    if (v9 == v10)
    {
      a1 = swift_bridgeObjectRelease();
      uint64_t v6 = v52;
      id v7 = v53;
      goto LABEL_26;
    }
  }
  swift_bridgeObjectRelease();
LABEL_32:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v40 = sub_25F3EFF08();
  swift_beginAccess();
  uint64_t v41 = sub_25F3F5EA0();
  uint64_t v42 = *(void *)(v41 - 8);
  double v43 = MEMORY[0x270FA5388](v41);
  uint64_t v45 = (char *)&v52 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, double))(v42 + 16))(v45, v40, v41, v43);
  unint64_t v46 = sub_25F3F5E80();
  os_log_type_t v47 = sub_25F3F64C0();
  if (os_log_type_enabled(v46, v47))
  {
    uint64_t v48 = swift_slowAlloc();
    unint64_t v58 = &v52;
    uint64_t v49 = (uint8_t *)v48;
    uint64_t v50 = swift_slowAlloc();
    uint64_t v59 = v50;
    *(_DWORD *)uint64_t v49 = 136315138;
    uint64_t v62 = sub_25F2FE464(0xD000000000000039, 0x800000025F407B10, &v59);
    sub_25F3F66A0();
    _os_log_impl(&dword_25F2F5000, v46, v47, "%s", v49, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611F21E0](v50, -1, -1);
    MEMORY[0x2611F21E0](v49, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v42 + 8))(v45, v41);
  type metadata accessor for TTSVBError(0);
  sub_25F2FE028();
  swift_allocError();
  TTSVBError.init(_:_:_:)(0xD000000000000039, 0x800000025F407B10, 0, 0, 0, v51);
  return swift_willThrow();
}

unint64_t sub_25F3B78A8()
{
  id v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A78D9B8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25F3F8460;
  *(void *)(inited + 32) = 1954047348;
  *(void *)(inited + 40) = 0xE400000000000000;
  id v3 = objc_msgSend(v0, sel_text);
  uint64_t v4 = sub_25F3F6130();
  uint64_t v6 = v5;

  uint64_t v7 = MEMORY[0x263F8D310];
  *(void *)(inited + 72) = MEMORY[0x263F8D310];
  *(void *)(inited + 48) = v4;
  *(void *)(inited + 56) = v6;
  unint64_t v8 = sub_25F30D784(inited);
  id v9 = objc_msgSend(v1, sel_categoryID);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = sub_25F3F6130();
    uint64_t v13 = v12;

    uint64_t v39 = v7;
    *(void *)&long long v38 = v11;
    *((void *)&v38 + 1) = v13;
    sub_25F3237C8(&v38, v37);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v36 = v8;
    sub_25F322DF8(v37, 0x79726F6765746163, 0xEA00000000004449, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
  }
  id v15 = objc_msgSend(v1, sel_inputID, v36);
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = sub_25F3F6130();
    uint64_t v19 = v18;

    uint64_t v39 = v7;
    *(void *)&long long v38 = v17;
    *((void *)&v38 + 1) = v19;
    sub_25F3237C8(&v38, v37);
    char v20 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v36 = v8;
    sub_25F322DF8(v37, 0x44497475706E69, 0xE700000000000000, v20);
    swift_bridgeObjectRelease();
  }
  uint64_t v21 = sub_25F3F5CC0();
  uint64_t v22 = *(void *)(v21 - 8);
  unint64_t v23 = (*(void *)(v22 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  char v24 = (char *)&v36 - v23;
  id v25 = objc_msgSend(v1, sel_creationDate, MEMORY[0x270FA5388](v21));
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B398898);
  double v28 = MEMORY[0x270FA5388](v26 - 8);
  uint64_t v30 = (char *)&v36 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!v25)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t, double))(v22 + 56))(v30, 1, 1, v21, v28);
    goto LABEL_9;
  }
  MEMORY[0x270FA5388](v27);
  uint64_t v31 = (char *)&v36 - v23;
  sub_25F3F5C80();

  uint64_t v32 = *(void (**)(char *, char *, uint64_t))(v22 + 32);
  v32(v30, v31, v21);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v30, 0, 1, v21);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v30, 1, v21) == 1)
  {
LABEL_9:
    sub_25F307B78((uint64_t)v30, &qword_26B398898);
    return v8;
  }
  v32(v24, v30, v21);
  uint64_t v39 = v21;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v38);
  (*(void (**)(uint64_t *, char *, uint64_t))(v22 + 16))(boxed_opaque_existential_0, v24, v21);
  sub_25F3237C8(&v38, v37);
  char v34 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v36 = v8;
  sub_25F322DF8(v37, 0x6E6F697461657263, 0xEC00000065746144, v34);
  unint64_t v8 = v36;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v21);
  return v8;
}

uint64_t sub_25F3B7DB8(void *a1)
{
  id v3 = v1;
  if (qword_26A79DCD0 != -1) {
    goto LABEL_34;
  }
  while (1)
  {
    id v5 = (id)qword_26A79DCD8;
    uint64_t v6 = _sSo14NSUserDefaultsC31TextToSpeechVoiceBankingSupportE15favoritePhrasesSaySDySSypGGvg_0();
    double v28 = (void *)v6;
    uint64_t v7 = *(void *)(v6 + 16);
    if (!v7) {
      break;
    }
    unint64_t v8 = (void *)v6;
    swift_bridgeObjectRetain();
    uint64_t v9 = 0;
    while (1)
    {
      uint64_t v27 = v8[v9 + 4];
      swift_bridgeObjectRetain();
      char v10 = sub_25F3B80B4(&v27, v3, a1);
      if (v2) {
        goto LABEL_37;
      }
      char v11 = v10;
      swift_bridgeObjectRelease();
      if (v11) {
        break;
      }
      if (v7 == ++v9)
      {
        swift_bridgeObjectRelease();
        uint64_t v9 = v8[2];
        int64_t v12 = v9;
        goto LABEL_27;
      }
    }
    swift_bridgeObjectRelease();
    int64_t v12 = v9 + 1;
    if (__OFADD__(v9, 1)) {
      goto LABEL_36;
    }
    unint64_t v13 = v8[2];
    if (v12 == v13)
    {
LABEL_26:
      if (v12 >= v9) {
        goto LABEL_27;
      }
      __break(1u);
LABEL_36:
      __break(1u);
LABEL_37:
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      __break(1u);
      return result;
    }
    id v26 = v5;
    uint64_t v14 = v9 + 5;
    while (1)
    {
      unint64_t v18 = v14 - 4;
      if (v14 - 4 >= v13) {
        break;
      }
      uint64_t v27 = v8[v14];
      swift_bridgeObjectRetain();
      char v19 = sub_25F3B80B4(&v27, v3, a1);
      swift_bridgeObjectRelease();
      if ((v19 & 1) == 0)
      {
        if (v18 != v9)
        {
          if (v9 < 0) {
            goto LABEL_30;
          }
          unint64_t v20 = v8[2];
          if (v9 >= v20) {
            goto LABEL_31;
          }
          if (v18 >= v20) {
            goto LABEL_32;
          }
          uint64_t v21 = v8[v9 + 4];
          uint64_t v22 = v8[v14];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            unint64_t v8 = sub_25F3BA360(v8);
          }
          v8[v9 + 4] = v22;
          swift_bridgeObjectRelease();
          if (v18 >= v8[2]) {
            goto LABEL_33;
          }
          v8[v14] = v21;
          swift_bridgeObjectRelease();
          double v28 = v8;
        }
        if (__OFADD__(v9++, 1)) {
          goto LABEL_29;
        }
      }
      unint64_t v13 = v8[2];
      uint64_t v16 = v14 + 1;
      uint64_t v17 = v14 - 3;
      ++v14;
      if (v17 == v13)
      {
        int64_t v12 = v16 - 4;
        id v5 = v26;
        goto LABEL_26;
      }
    }
    __break(1u);
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    swift_once();
  }
  uint64_t v9 = 0;
  int64_t v12 = 0;
LABEL_27:
  sub_25F3BB07C(v9, v12);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B398C80);
  unint64_t v23 = (void *)sub_25F3F62E0();
  swift_bridgeObjectRelease();
  char v24 = (void *)sub_25F3F6100();
  objc_msgSend(v5, sel_setObject_forKey_, v23, v24);

  return notify_post("com.apple.livespeech.localprefschanged");
}

uint64_t sub_25F3B80B4(uint64_t *a1, void *a2, void *a3)
{
  uint64_t v5 = *a1;
  if (*(void *)(*a1 + 16)
    && (unint64_t v6 = sub_25F322920(0x79726F6765746163, 0xEA00000000004449), (v7 & 1) != 0)
    && (sub_25F301A40(*(void *)(v5 + 56) + 32 * v6, (uint64_t)v27), swift_dynamicCast()))
  {
    uint64_t v9 = v25;
    uint64_t v8 = v26;
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v8 = 0;
  }
  id v10 = objc_msgSend(a2, sel_categoryID);
  uint64_t v11 = sub_25F3F6130();
  uint64_t v13 = v12;

  if (!v8) {
    goto LABEL_26;
  }
  if (v9 == v11 && v8 == v13)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (!*(void *)(v5 + 16)) {
      goto LABEL_18;
    }
    goto LABEL_15;
  }
  char v15 = sub_25F3F6B80();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  LOBYTE(v8) = 0;
  if (v15)
  {
    if (!*(void *)(v5 + 16)) {
      goto LABEL_18;
    }
LABEL_15:
    unint64_t v16 = sub_25F322920(1954047348, 0xE400000000000000);
    if (v17)
    {
      sub_25F301A40(*(void *)(v5 + 56) + 32 * v16, (uint64_t)v27);
      if (swift_dynamicCast())
      {
        uint64_t v19 = v25;
        uint64_t v18 = v26;
        goto LABEL_19;
      }
    }
LABEL_18:
    uint64_t v19 = 0;
    uint64_t v18 = 0;
LABEL_19:
    id v20 = objc_msgSend(a3, sel_text);
    uint64_t v21 = sub_25F3F6130();
    uint64_t v23 = v22;

    if (v18)
    {
      if (v19 == v21 && v18 == v23) {
        LOBYTE(v8) = 1;
      }
      else {
        LOBYTE(v8) = sub_25F3F6B80();
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      LOBYTE(v8) = 0;
    }
LABEL_26:
    swift_bridgeObjectRelease();
  }
  return v8 & 1;
}

id sub_25F3B83C0(uint64_t a1, uint64_t a2, void (*a3)(void), void (*a4)(void))
{
  a3();
  a4();
  uint64_t v5 = (void *)sub_25F3F62E0();
  swift_bridgeObjectRelease();

  return v5;
}

uint64_t sub_25F3B8634(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = sub_25F3B940C(a2, a3);
  if (v10)
  {
    uint64_t v11 = v10;
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v34 = v11;
    sub_25F3B9E64(a4, a5, 0x6C6F626D7973, 0xE600000000000000, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    char v13 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v34 = *a1;
    *a1 = 0x8000000000000000;
    sub_25F3B9CF4(v11, a2, a3, v13);
    *a1 = v34;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v34 = 0;
    unint64_t v35 = 0xE000000000000000;
    sub_25F3F6880();
    sub_25F3F61E0();
    sub_25F3F61E0();
    uint64_t v15 = 0;
    uint64_t v16 = sub_25F3EFF08();
    swift_beginAccess();
    uint64_t v17 = sub_25F3F5EA0();
    uint64_t v18 = *(void *)(v17 - 8);
    double v19 = MEMORY[0x270FA5388](v17);
    uint64_t v21 = (char *)&v29 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, uint64_t, uint64_t, double))(v18 + 16))(v21, v16, v17, v19);
    swift_bridgeObjectRetain_n();
    uint64_t v22 = sub_25F3F5E80();
    os_log_type_t v23 = sub_25F3F64C0();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v31 = &v29;
      uint64_t v24 = swift_slowAlloc();
      uint64_t v32 = 0;
      uint64_t v25 = (uint8_t *)v24;
      uint64_t v26 = swift_slowAlloc();
      uint64_t v36 = v26;
      uint64_t v30 = v17;
      *(_DWORD *)uint64_t v25 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v33 = sub_25F2FE464(v32, 0xE000000000000000, &v36);
      sub_25F3F66A0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25F2F5000, v22, v23, "%s", v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611F21E0](v26, -1, -1);
      uint64_t v27 = v25;
      uint64_t v15 = v32;
      MEMORY[0x2611F21E0](v27, -1, -1);

      (*(void (**)(char *, uint64_t))(v18 + 8))(v21, v30);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v18 + 8))(v21, v17);
    }
    type metadata accessor for TTSVBError(0);
    sub_25F2FE028();
    swift_allocError();
    TTSVBError.init(_:_:_:)(v15, 0xE000000000000000, 0, 0, 0, v28);
    return swift_willThrow();
  }
}

uint64_t sub_25F3B8A08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v7 = sub_25F3F6130();
  uint64_t v9 = v8;
  uint64_t v10 = sub_25F3F6130();
  a6(v7, v9, v10, v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 1;
}

uint64_t static LiveSpeechCategory.observeChanges(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_25F3B8AF0(a1, a2, a3);
}

uint64_t sub_25F3B8AF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  if (qword_26A79DCD0 != -1) {
    swift_once();
  }
  unint64_t v6 = (void *)qword_26A79DCD8;
  uint64_t v11 = (void *)qword_26A79DCD8;
  swift_getKeyPath();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a1;
  *(void *)(v7 + 24) = a2;
  id v8 = v6;
  swift_retain();
  uint64_t v9 = sub_25F3F59D0();
  swift_release();
  swift_release();

  uint64_t result = sub_25F3F5960();
  a3[3] = result;
  *a3 = v9;
  return result;
}

uint64_t sub_25F3B8BFC(uint64_t (*a1)(uint64_t), uint64_t a2, const char *a3)
{
  uint64_t v5 = sub_25F3EFF08();
  swift_beginAccess();
  uint64_t v6 = sub_25F3F5EA0();
  uint64_t v7 = *(void *)(v6 - 8);
  double v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, double))(v7 + 16))(v10, v5, v6, v8);
  uint64_t v11 = sub_25F3F5E80();
  os_log_type_t v12 = sub_25F3F64B0();
  if (os_log_type_enabled(v11, v12))
  {
    char v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v13 = 0;
    _os_log_impl(&dword_25F2F5000, v11, v12, a3, v13, 2u);
    MEMORY[0x2611F21E0](v13, -1, -1);
  }

  uint64_t v14 = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  return a1(v14);
}

uint64_t static LiveSpeechCategory.observeChangesAsync()()
{
  if (qword_26A79DCD0 != -1) {
    swift_once();
  }
  id v0 = (void *)qword_26A79DCD8;
  swift_getKeyPath();
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A78D968);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = v0;
  sub_25F3F5A00();
  sub_25F3BE074(&qword_26A78D970, &qword_26A78D968);
  uint64_t v6 = sub_25F3F5F20();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  v10[1] = v6;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A78D978);
  uint64_t v8 = sub_25F335CF0(&qword_26A78D980, &qword_26A78D978);
  MEMORY[0x2611F0980](v7, v8);

  swift_release();
  return swift_release();
}

void sub_25F3B910C()
{
  id v0 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  uint64_t v1 = (void *)sub_25F3F6100();
  id v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  if (v2) {
    qword_26A79DCD8 = (uint64_t)v2;
  }
  else {
    __break(1u);
  }
}

void *sub_25F3B9184(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A78D9B0);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      void v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
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
    sub_25F3BA3FC(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_25F3B9294(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    int64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  int64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      int64_t v7 = a2;
    }
LABEL_8:
    int64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      int64_t v9 = *((void *)a4 + 2);
    }
    else {
      int64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A78D9A0);
      uint64_t v10 = (char *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * v11 - 64;
      uint64_t v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[v8 + 32]) {
          memmove(v12, a4 + 32, v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (char *)MEMORY[0x263F8EE78];
      uint64_t v12 = (char *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_25F3BD984(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_25F3B9390(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A78D2B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for LiveSpeechPhrase(uint64_t a1)
{
  return sub_25F3236F0(a1, &qword_26A79DD70);
}

uint64_t sub_25F3B940C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_25F322920(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t v12 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_25F3B9FEC();
    uint64_t v9 = v12;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(*(void *)(v9 + 56) + 8 * v6);
  sub_25F3B9B1C(v6, v9);
  *uint64_t v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_25F3B94DC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A78D998);
  char v36 = a2;
  uint64_t v6 = sub_25F3F69A0();
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
    uint64_t v22 = (void *)(v5 + 64);
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
    sub_25F3F6C20();
    sub_25F3F61A0();
    uint64_t result = sub_25F3F6C70();
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
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *uint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_25F3B97F4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A78D988);
  char v42 = a2;
  uint64_t v6 = sub_25F3F69A0();
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
    int64_t v24 = (void *)(v5 + 64);
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
    uint64_t v32 = (uint64_t *)(*(void *)(v5 + 48) + v31);
    uint64_t v34 = *v32;
    uint64_t v33 = v32[1];
    uint64_t v35 = (uint64_t *)(*(void *)(v5 + 56) + v31);
    uint64_t v36 = *v35;
    uint64_t v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_25F3F6C20();
    sub_25F3F61A0();
    uint64_t result = sub_25F3F6C70();
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
    unint64_t v19 = (void *)(*(void *)(v7 + 48) + v18);
    *unint64_t v19 = v34;
    v19[1] = v33;
    unint64_t v20 = (void *)(*(void *)(v7 + 56) + v18);
    *unint64_t v20 = v36;
    v20[1] = v37;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  int64_t v24 = (void *)(v5 + 64);
  if ((v42 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v38 = 1 << *(unsigned char *)(v5 + 32);
  if (v38 >= 64) {
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v24 = -1 << v38;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_25F3B9B1C(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_25F3F67B0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_25F3F6C20();
        swift_bridgeObjectRetain();
        sub_25F3F61A0();
        uint64_t v9 = sub_25F3F6C70();
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
          unint64_t v15 = (void *)(v14 + 8 * v3);
          unint64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            void *v15 = *v16;
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

uint64_t sub_25F3B9CF4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_25F322920(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_25F3B9FEC();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_25F3B94DC(v15, a4 & 1);
  unint64_t v21 = sub_25F322920(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_25F3F6BC0();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  int64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
  uint64_t *v23 = a2;
  v23[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v24 = v18[2];
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (v25)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v26;

  return swift_bridgeObjectRetain();
}

uint64_t sub_25F3B9E64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  unint64_t v6 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_25F322920(a3, a4);
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
    sub_25F3BA1A4();
LABEL_7:
    uint64_t v20 = (void *)*v6;
    if (v18)
    {
LABEL_8:
      unint64_t v21 = (void *)(v20[7] + 16 * v14);
      uint64_t result = swift_bridgeObjectRelease();
      *unint64_t v21 = a1;
      v21[1] = a2;
      return result;
    }
    goto LABEL_11;
  }
  sub_25F3B97F4(v17, a5 & 1);
  unint64_t v23 = sub_25F322920(a3, a4);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_17:
    uint64_t result = sub_25F3F6BC0();
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
  BOOL v25 = (uint64_t *)(v20[6] + 16 * v14);
  *BOOL v25 = a3;
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

void *sub_25F3B9FEC()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A78D998);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25F3F6990();
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
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = *v17;
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

void *sub_25F3BA1A4()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A78D988);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25F3F6990();
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
    unint64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    void *v23 = v19;
    v23[1] = v18;
    int64_t v24 = (void *)(*(void *)(v4 + 56) + v16);
    *int64_t v24 = v21;
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

void *sub_25F3BA360(void *a1)
{
  return sub_25F3B9184(0, a1[2], 0, a1);
}

uint64_t sub_25F3BA374(uint64_t a1)
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
  int64_t v9 = (unint64_t *)(a1 + 80);
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

uint64_t sub_25F3BA3FC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 8 * a1 + 32;
    unint64_t v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B398C80);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_25F3F69C0();
  __break(1u);
  return result;
}

void sub_25F3BA508(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (qword_26A79DCD0 != -1) {
    swift_once();
  }
  id v13 = (id)qword_26A79DCD8;
  uint64_t v16 = (void *)_sSo14NSUserDefaultsC31TextToSpeechVoiceBankingSupportE15favoritePhrasesSaySDySSypGGvg_0();
  sub_25F3B5270(&v16, a3, a4, a1, a2, a5, a6);
  if (v6)
  {

    swift_bridgeObjectRelease();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B398C80);
    unint64_t v14 = (void *)sub_25F3F62E0();
    swift_bridgeObjectRelease();
    unint64_t v15 = (void *)sub_25F3F6100();
    objc_msgSend(v13, sel_setObject_forKey_, v14, v15);
  }
}

uint64_t sub_25F3BA65C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v23 = a2;
  uint64_t v6 = *(void *)(a1 + 16);
  if (!v6) {
    return 0;
  }
  uint64_t v8 = 0;
  uint64_t v9 = a1 + 32;
  while (1)
  {
    uint64_t v10 = *(void *)(v9 + 8 * v8);
    swift_bridgeObjectRetain();
    if (*(void *)(v10 + 16))
    {
      unint64_t v11 = sub_25F322920(0x79726F6765746163, 0xEA00000000004449);
      if (v12)
      {
        sub_25F301A40(*(void *)(v10 + 56) + 32 * v11, (uint64_t)v22);
        if (swift_dynamicCast())
        {
          if (v20 == v23 && v21 == a3)
          {
            swift_bridgeObjectRelease();
          }
          else
          {
            char v13 = sub_25F3F6B80();
            swift_bridgeObjectRelease();
            char v14 = 0;
            if ((v13 & 1) == 0) {
              goto LABEL_17;
            }
          }
          if (*(void *)(v10 + 16))
          {
            unint64_t v15 = sub_25F322920(1954047348, 0xE400000000000000);
            if (v16)
            {
              sub_25F301A40(*(void *)(v10 + 56) + 32 * v15, (uint64_t)v22);
              if (swift_dynamicCast()) {
                break;
              }
            }
          }
        }
      }
    }
    char v14 = 0;
LABEL_17:
    if (v5) {
      goto LABEL_24;
    }
    swift_bridgeObjectRelease();
    if (v14) {
      return v8;
    }
    if (v6 == ++v8) {
      return 0;
    }
  }
  if (v20 != a4 || v21 != a5)
  {
    char v14 = sub_25F3F6B80();
    swift_bridgeObjectRelease();
    goto LABEL_17;
  }
  swift_bridgeObjectRelease();
LABEL_24:
  swift_bridgeObjectRelease();
  return v8;
}

void sub_25F3BA870(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (qword_26A79DCD0 != -1) {
    swift_once();
  }
  id v12 = (id)qword_26A79DCD8;
  swift_bridgeObjectRetain();
  unint64_t v13 = _sSo14NSUserDefaultsC31TextToSpeechVoiceBankingSupportE04liveE10CategoriesSDySSSDyS2SGGvg_0();

  if (*(void *)(v13 + 16))
  {
    sub_25F322920(a5, a6);
    if (v14)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  unint64_t v15 = sub_25F3F69E0();
  swift_bridgeObjectRelease();
  if (v15 <= 1)
  {
LABEL_7:
    id v16 = (id)qword_26A79DCD8;
    uint64_t v34 = (void *)_sSo14NSUserDefaultsC31TextToSpeechVoiceBankingSupportE15favoritePhrasesSaySDySSypGGvg_0();
    sub_25F3B57D0(&v34, a3, a4, a1, a2, a5, a6);
    if (v32)
    {

      swift_bridgeObjectRelease();
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B398C80);
      uint64_t v29 = (void *)sub_25F3F62E0();
      swift_bridgeObjectRelease();
      uint64_t v30 = (void *)sub_25F3F6100();
      objc_msgSend(v16, sel_setObject_forKey_, v29, v30);
    }
    return;
  }
  uint64_t v17 = sub_25F3EFF08();
  swift_beginAccess();
  uint64_t v18 = sub_25F3F5EA0();
  uint64_t v19 = *(void *)(v18 - 8);
  double v20 = MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v31 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, double))(v19 + 16))(v22, v17, v18, v20);
  uint64_t v23 = sub_25F3F5E80();
  os_log_type_t v24 = sub_25F3F64C0();
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v25 = swift_slowAlloc();
    uint64_t v32 = &v31;
    unint64_t v26 = (uint8_t *)v25;
    uint64_t v27 = swift_slowAlloc();
    uint64_t v35 = v27;
    *(_DWORD *)unint64_t v26 = 136315138;
    uint64_t v33 = sub_25F2FE464(0xD000000000000048, 0x800000025F407B50, &v35);
    sub_25F3F66A0();
    _os_log_impl(&dword_25F2F5000, v23, v24, "%s", v26, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611F21E0](v27, -1, -1);
    MEMORY[0x2611F21E0](v26, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v19 + 8))(v22, v18);
  type metadata accessor for TTSVBError(0);
  sub_25F2FE028();
  swift_allocError();
  TTSVBError.init(_:_:_:)(0xD000000000000048, 0x800000025F407B50, 0, 0, 0, v28);
  swift_willThrow();
}

uint64_t sub_25F3BAC98()
{
  if (qword_26A79DCD0 != -1) {
    swift_once();
  }
  id v0 = (id)qword_26A79DCD8;
  uint64_t v1 = _sSo14NSUserDefaultsC31TextToSpeechVoiceBankingSupportE15favoritePhrasesSaySDySSypGGvg_0();

  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    uint64_t v3 = sub_25F3F6920();
    type metadata accessor for LiveSpeechPhrase(v3);
    uint64_t v4 = 0;
    do
    {
      uint64_t v5 = v4 + 1;
      uint64_t v6 = swift_bridgeObjectRetain();
      sub_25F3B4758(v6);
      sub_25F3F6900();
      sub_25F3F6930();
      sub_25F3F6940();
      sub_25F3F6910();
      uint64_t v4 = v5;
    }
    while (v2 != v5);
    uint64_t v7 = v9;
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  return v7;
}

char *keypath_get_selector_liveSpeechPhrases()
{
  return sel_liveSpeechPhrases;
}

uint64_t sub_25F3BADD8()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25F3BAE10()
{
  return sub_25F3B8BFC(*(uint64_t (**)(uint64_t))(v0 + 16), *(void *)(v0 + 24), "Phrases did change. Notifying observers");
}

uint64_t sub_25F3BAE34(uint64_t a1, void *a2, char a3)
{
  uint64_t result = MEMORY[0x263F8EE78];
  uint64_t v29 = MEMORY[0x263F8EE78];
  uint64_t v5 = *(void *)(a1 + 16);
  if (v5)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = 0;
    uint64_t v22 = MEMORY[0x263F8EE58] + 8;
    while (1)
    {
      uint64_t v7 = *(void *)(a1 + 8 * v6 + 32);
      swift_bridgeObjectRetain();
      if (*(void *)(v7 + 16)
        && (unint64_t v8 = sub_25F322920(0x79726F6765746163, 0xEA00000000004449), (v9 & 1) != 0)
        && (sub_25F301A40(*(void *)(v7 + 56) + 32 * v8, (uint64_t)v28), swift_dynamicCast()))
      {
        uint64_t v11 = v26;
        uint64_t v10 = v27;
      }
      else
      {
        uint64_t v11 = 0;
        uint64_t v10 = 0;
      }
      id v12 = objc_msgSend(a2, sel_categoryID, v22);
      uint64_t v13 = sub_25F3F6130();
      uint64_t v15 = v14;

      if (v10)
      {
        if (v11 == v13 && v10 == v15)
        {
          swift_bridgeObjectRelease();
          uint64_t v18 = swift_bridgeObjectRelease();
LABEL_21:
          type metadata accessor for LiveSpeechPhrase(v18);
          uint64_t v20 = swift_bridgeObjectRetain();
          uint64_t v19 = sub_25F3B4758(v20);
          if (v25)
          {
LABEL_25:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            return swift_bridgeObjectRelease();
          }
          goto LABEL_22;
        }
        char v17 = sub_25F3F6B80();
        swift_bridgeObjectRelease();
        uint64_t v18 = swift_bridgeObjectRelease();
        if (v17) {
          goto LABEL_21;
        }
      }
      else
      {
        uint64_t v18 = swift_bridgeObjectRelease();
        if (a3) {
          goto LABEL_21;
        }
      }
      uint64_t v19 = 0;
      if (v25) {
        goto LABEL_25;
      }
LABEL_22:
      uint64_t v21 = swift_bridgeObjectRelease();
      if (v19)
      {
        MEMORY[0x2611F0CF0](v21);
        if (*(void *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_25F3F6320();
        }
        sub_25F3F6350();
        sub_25F3F6310();
      }
      if (v5 == ++v6)
      {
        swift_bridgeObjectRelease();
        return v29;
      }
    }
  }
  return result;
}

uint64_t sub_25F3BB07C(uint64_t a1, int64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v4 = *(void **)v2;
  int64_t v5 = *(void *)(*(void *)v2 + 16);
  if (v5 < a2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  int isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > v4[3] >> 1)
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    uint64_t v4 = sub_25F3B9184(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B398C80);
  uint64_t result = swift_arrayDestroy();
  if (!v7) {
    goto LABEL_20;
  }
  uint64_t v13 = v4[2];
  BOOL v14 = __OFSUB__(v13, a2);
  uint64_t v15 = v13 - a2;
  if (v14) {
    goto LABEL_26;
  }
  if ((v15 & 0x8000000000000000) == 0)
  {
    id v16 = (char *)&v4[a2 + 4];
    if (a1 != a2 || &v4[a1 + 4] >= (void *)&v16[8 * v15]) {
      uint64_t result = (uint64_t)memmove(&v4[a1 + 4], v16, 8 * v15);
    }
    uint64_t v17 = v4[2];
    BOOL v14 = __OFADD__(v17, v8);
    uint64_t v18 = v17 - v7;
    if (!v14)
    {
      v4[2] = v18;
LABEL_20:
      *(void *)uint64_t v2 = v4;
      return result;
    }
    goto LABEL_27;
  }
LABEL_28:
  uint64_t result = sub_25F3F69C0();
  __break(1u);
  return result;
}

char *sub_25F3BB1F0()
{
  uint64_t v0 = (char *)objc_msgSend(objc_allocWithZone((Class)LiveSpeechCategory), sel_init);
  uint64_t v1 = &v0[OBJC_IVAR___LiveSpeechCategory_name];
  swift_beginAccess();
  *(void *)uint64_t v1 = 0;
  *((void *)v1 + 1) = 0xE000000000000000;
  uint64_t v2 = v0;
  swift_bridgeObjectRelease();
  uint64_t v3 = &v2[OBJC_IVAR___LiveSpeechCategory_symbol];
  swift_beginAccess();
  *(void *)uint64_t v3 = 0;
  *((void *)v3 + 1) = 0xE000000000000000;
  swift_bridgeObjectRelease();
  uint64_t v4 = &v2[OBJC_IVAR___LiveSpeechCategory_categoryID];
  swift_beginAccess();
  *(void *)uint64_t v4 = 0;
  *((void *)v4 + 1) = 0xE000000000000000;

  swift_bridgeObjectRelease();
  return v2;
}

unint64_t sub_25F3BB2D8()
{
  if (qword_26A79DCD0 != -1) {
    goto LABEL_33;
  }
  while (1)
  {
    id v0 = (id)qword_26A79DCD8;
    unint64_t v1 = _sSo14NSUserDefaultsC31TextToSpeechVoiceBankingSupportE04liveE10CategoriesSDySSSDyS2SGGvg_0();

    unint64_t v2 = sub_25F3B5C80(v1);
    swift_bridgeObjectRelease();
    unint64_t v28 = v2;
    if (v2 >> 62)
    {
      swift_bridgeObjectRetain_n();
      uint64_t v3 = sub_25F3F6980();
    }
    else
    {
      uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain_n();
    }
    if (v3) {
      break;
    }
LABEL_12:
    swift_bridgeObjectRelease_n();
    int64_t v9 = (char *)objc_msgSend(objc_allocWithZone((Class)LiveSpeechCategory), sel_init);
    uint64_t v10 = &v9[OBJC_IVAR___LiveSpeechCategory_name];
    swift_beginAccess();
    *(void *)uint64_t v10 = 0x6465766153;
    *((void *)v10 + 1) = 0xE500000000000000;
    int64_t v11 = v9;
    swift_bridgeObjectRelease();
    id v12 = &v11[OBJC_IVAR___LiveSpeechCategory_symbol];
    swift_beginAccess();
    *(void *)id v12 = 0x6B72616D6B6F6F62;
    *((void *)v12 + 1) = 0xE800000000000000;
    swift_bridgeObjectRelease();
    uint64_t v13 = &v11[OBJC_IVAR___LiveSpeechCategory_categoryID];
    swift_beginAccess();
    *(void *)uint64_t v13 = 0x6465766153;
    *((void *)v13 + 1) = 0xE500000000000000;

    uint64_t v14 = swift_bridgeObjectRelease();
    MEMORY[0x2611F0CF0](v14);
    if (*(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_25F3F6320();
    }
    sub_25F3F6350();
    sub_25F3F6310();
    unint64_t v2 = v28;
    if (v28 >> 62) {
      goto LABEL_27;
    }
LABEL_15:
    uint64_t v15 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    if (!v15) {
      goto LABEL_23;
    }
LABEL_16:
    uint64_t v16 = 4;
    while (1)
    {
      id v17 = (v2 & 0xC000000000000001) != 0 ? (id)MEMORY[0x2611F12D0](v16 - 4, v2) : *(id *)(v2 + 8 * v16);
      uint64_t v18 = v17;
      uint64_t v19 = v16 - 3;
      if (__OFADD__(v16 - 4, 1)) {
        break;
      }
      unsigned int v20 = objc_msgSend(v17, sel_isRecents);

      if (v20)
      {
        swift_bridgeObjectRelease_n();
        return v2;
      }
      ++v16;
      if (v19 == v15) {
        goto LABEL_23;
      }
    }
LABEL_32:
    __break(1u);
LABEL_33:
    swift_once();
  }
  uint64_t v4 = 4;
  while (1)
  {
    if ((v2 & 0xC000000000000001) != 0) {
      id v5 = (id)MEMORY[0x2611F12D0](v4 - 4, v2);
    }
    else {
      id v5 = *(id *)(v2 + 8 * v4);
    }
    uint64_t v6 = v5;
    uint64_t v7 = v4 - 3;
    if (__OFADD__(v4 - 4, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    unsigned int v8 = objc_msgSend(v5, sel_isSaved);

    if (v8) {
      break;
    }
    ++v4;
    if (v7 == v3) {
      goto LABEL_12;
    }
  }
  swift_bridgeObjectRelease_n();
  if (!(v2 >> 62)) {
    goto LABEL_15;
  }
LABEL_27:
  swift_bridgeObjectRetain_n();
  uint64_t v15 = sub_25F3F6980();
  if (v15) {
    goto LABEL_16;
  }
LABEL_23:
  swift_bridgeObjectRelease_n();
  uint64_t v21 = (char *)objc_msgSend(objc_allocWithZone((Class)LiveSpeechCategory), sel_init);
  uint64_t v22 = &v21[OBJC_IVAR___LiveSpeechCategory_name];
  swift_beginAccess();
  *(void *)uint64_t v22 = 0x73746E65636552;
  *((void *)v22 + 1) = 0xE700000000000000;
  uint64_t v23 = v21;
  swift_bridgeObjectRelease();
  os_log_type_t v24 = &v23[OBJC_IVAR___LiveSpeechCategory_symbol];
  swift_beginAccess();
  *(void *)os_log_type_t v24 = 0x6B636F6C63;
  *((void *)v24 + 1) = 0xE500000000000000;
  swift_bridgeObjectRelease();
  uint64_t v25 = &v23[OBJC_IVAR___LiveSpeechCategory_categoryID];
  swift_beginAccess();
  *(void *)uint64_t v25 = 0x73746E65636552;
  *((void *)v25 + 1) = 0xE700000000000000;

  uint64_t v26 = swift_bridgeObjectRelease();
  MEMORY[0x2611F0CF0](v26);
  if (*(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_25F3F6320();
  }
  sub_25F3F6350();
  sub_25F3F6310();
  return v28;
}

uint64_t sub_25F3BB754(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = a1 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a1 + 64);
  int64_t v20 = (unint64_t)(v5 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v9 = 0;
  if (!v7) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v10 = __clz(__rbit64(v7));
  v7 &= v7 - 1;
  for (unint64_t i = v10 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v13)) + (v9 << 6))
  {
    uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 16 * i);
    uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8 * i) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v16 && (sub_25F322920(1701667182, 0xE400000000000000), (v17 & 1) != 0))
    {
      sub_25F2FDE6C();
      BOOL v18 = sub_25F3F6720() == 0;
      if (v2) {
        goto LABEL_30;
      }
    }
    else
    {
      BOOL v18 = 0;
      if (v2)
      {
LABEL_30:
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return v15;
      }
    }
    if (v18)
    {
      swift_release();
      return v15;
    }
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    if (v7) {
      goto LABEL_4;
    }
LABEL_5:
    if (__OFADD__(v9++, 1)) {
      break;
    }
    if (v9 >= v20) {
      goto LABEL_32;
    }
    unint64_t v13 = *(void *)(v4 + 8 * v9);
    if (!v13)
    {
      int64_t v14 = v9 + 1;
      if (v9 + 1 >= v20) {
        goto LABEL_32;
      }
      unint64_t v13 = *(void *)(v4 + 8 * v14);
      if (v13) {
        goto LABEL_14;
      }
      int64_t v14 = v9 + 2;
      if (v9 + 2 >= v20) {
        goto LABEL_32;
      }
      unint64_t v13 = *(void *)(v4 + 8 * v14);
      if (v13) {
        goto LABEL_14;
      }
      int64_t v14 = v9 + 3;
      if (v9 + 3 >= v20) {
        goto LABEL_32;
      }
      unint64_t v13 = *(void *)(v4 + 8 * v14);
      if (v13)
      {
LABEL_14:
        int64_t v9 = v14;
        goto LABEL_15;
      }
      int64_t v19 = v9 + 4;
      if (v9 + 4 >= v20)
      {
LABEL_32:
        swift_release();
        return 0;
      }
      unint64_t v13 = *(void *)(v4 + 8 * v19);
      for (v9 += 4; !v13; ++v19)
      {
        int64_t v9 = v19 + 1;
        if (__OFADD__(v19, 1)) {
          goto LABEL_35;
        }
        if (v9 >= v20) {
          goto LABEL_32;
        }
        unint64_t v13 = *(void *)(v4 + 8 * v9);
      }
    }
LABEL_15:
    unint64_t v7 = (v13 - 1) & v13;
  }
  __break(1u);
LABEL_35:
  __break(1u);
  return result;
}

char *sub_25F3BB9C0(uint64_t a1, uint64_t a2)
{
  if (qword_26A79DCD0 != -1) {
    swift_once();
  }
  id v4 = (id)qword_26A79DCD8;
  swift_bridgeObjectRetain();
  unint64_t v5 = _sSo14NSUserDefaultsC31TextToSpeechVoiceBankingSupportE04liveE10CategoriesSDySSSDyS2SGGvg_0();

  if (*(void *)(v5 + 16) && (unint64_t v6 = sub_25F322920(a1, a2), (v7 & 1) != 0))
  {
    uint64_t v8 = *(void *)(*(void *)(v5 + 56) + 8 * v6);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v9 = swift_bridgeObjectRelease();
    type metadata accessor for LiveSpeechCategory(v9);
    swift_bridgeObjectRetain();
    return sub_25F3B6640(a1, a2, v8);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_25F3F69E0();
    uint64_t v12 = swift_bridgeObjectRelease();
    if (v11 == 1)
    {
      unint64_t v13 = 0xE700000000000000;
      uint64_t v14 = 0x73746E65636552;
      unint64_t v15 = 0xE500000000000000;
      uint64_t v16 = 0x6B636F6C63;
    }
    else
    {
      if (v11) {
        return 0;
      }
      unint64_t v13 = 0xE500000000000000;
      uint64_t v14 = 0x6465766153;
      unint64_t v15 = 0xE800000000000000;
      uint64_t v16 = 0x6B72616D6B6F6F62;
    }
    type metadata accessor for LiveSpeechCategory(v12);
    char v17 = (char *)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
    BOOL v18 = (uint64_t *)&v17[OBJC_IVAR___LiveSpeechCategory_name];
    swift_beginAccess();
    *BOOL v18 = v14;
    v18[1] = v13;
    unint64_t v10 = v17;
    swift_bridgeObjectRelease();
    int64_t v19 = (uint64_t *)&v10[OBJC_IVAR___LiveSpeechCategory_symbol];
    swift_beginAccess();
    *int64_t v19 = v16;
    v19[1] = v15;
    swift_bridgeObjectRelease();
    int64_t v20 = (uint64_t *)&v10[OBJC_IVAR___LiveSpeechCategory_categoryID];
    swift_beginAccess();
    *int64_t v20 = v14;
    v20[1] = v13;
    swift_bridgeObjectRelease();
  }
  return v10;
}

uint64_t sub_25F3BBC08(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v32 = a6;
  uint64_t v33 = (uint64_t *)a4;
  if (qword_26A79DCD0 != -1) {
    swift_once();
  }
  id v12 = (id)qword_26A79DCD8;
  unint64_t v13 = _sSo14NSUserDefaultsC31TextToSpeechVoiceBankingSupportE04liveE10CategoriesSDySSSDyS2SGGvg_0();

  swift_bridgeObjectRetain();
  sub_25F3BB754(v13);
  uint64_t v15 = v14;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v15)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v16 = sub_25F3EFF08();
    swift_beginAccess();
    uint64_t v17 = sub_25F3F5EA0();
    uint64_t v18 = *(void *)(v17 - 8);
    double v19 = MEMORY[0x270FA5388](v17);
    uint64_t v21 = (char *)&v32 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, uint64_t, uint64_t, double))(v18 + 16))(v21, v16, v17, v19);
    uint64_t v22 = sub_25F3F5E80();
    os_log_type_t v23 = sub_25F3F64C0();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = swift_slowAlloc();
      uint64_t v33 = &v32;
      uint64_t v25 = (uint8_t *)v24;
      uint64_t v26 = swift_slowAlloc();
      uint64_t v36 = v26;
      *(_DWORD *)uint64_t v25 = 136315138;
      uint64_t v34 = sub_25F2FE464(0xD00000000000004BLL, 0x800000025F407A80, &v36);
      sub_25F3F66A0();
      _os_log_impl(&dword_25F2F5000, v22, v23, "%s", v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611F21E0](v26, -1, -1);
      MEMORY[0x2611F21E0](v25, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v18 + 8))(v21, v17);
    type metadata accessor for TTSVBError(0);
    sub_25F2FE028();
    swift_allocError();
    TTSVBError.init(_:_:_:)(0xD00000000000004BLL, 0x800000025F407A80, 0, 0, 0, v27);
    return swift_willThrow();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A78D9A8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_25F3FE240;
    *(void *)(inited + 32) = 1701667182;
    *(void *)(inited + 40) = 0xE400000000000000;
    *(void *)(inited + 48) = a2;
    *(void *)(inited + 56) = a3;
    *(void *)(inited + 64) = 0x6C6F626D7973;
    *(void *)(inited + 72) = 0xE600000000000000;
    *(void *)(inited + 80) = v32;
    *(void *)(inited + 88) = a7;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v30 = sub_25F3B3DF4(inited);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v35 = *a1;
    *a1 = 0x8000000000000000;
    sub_25F3B9CF4(v30, (uint64_t)v33, a5, isUniquelyReferenced_nonNull_native);
    *a1 = v35;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

char *sub_25F3BC004(uint64_t a1, uint64_t a2, uint64_t a3, char *a4)
{
  uint64_t v8 = sub_25F3F5D30();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0) + 40;
  sub_25F3F5D20();
  uint64_t v12 = sub_25F3F5CE0();
  uint64_t v14 = v13;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  if (qword_26A79DCD0 != -1) {
    swift_once();
  }
  id v15 = (id)qword_26A79DCD8;
  v29[0] = _sSo14NSUserDefaultsC31TextToSpeechVoiceBankingSupportE04liveE10CategoriesSDySSSDyS2SGGvg_0();
  uint64_t v16 = v30;
  sub_25F3BBC08((uint64_t *)v29, a1, a2, v12, v14, a3, (uint64_t)a4);
  if (v16)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A78D908);
    uint64_t v17 = sub_25F3F6020();
    uint64_t v30 = v12;
    uint64_t v18 = a4;
    uint64_t v28 = v14;
    double v19 = (void *)v17;
    swift_bridgeObjectRelease();
    uint64_t v20 = (void *)sub_25F3F6100();
    objc_msgSend(v15, sel_setObject_forKey_, v19, v20);

    notify_post("com.apple.livespeech.localprefschanged");
    id v21 = objc_allocWithZone((Class)LiveSpeechCategory);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v22 = (char *)objc_msgSend(v21, sel_init);
    os_log_type_t v23 = (uint64_t *)&v22[OBJC_IVAR___LiveSpeechCategory_name];
    swift_beginAccess();
    uint64_t *v23 = a1;
    v23[1] = a2;
    a4 = v22;
    swift_bridgeObjectRelease();
    uint64_t v24 = (uint64_t *)&a4[OBJC_IVAR___LiveSpeechCategory_symbol];
    swift_beginAccess();
    *uint64_t v24 = a3;
    v24[1] = (uint64_t)v18;
    swift_bridgeObjectRelease();
    uint64_t v25 = (uint64_t *)&a4[OBJC_IVAR___LiveSpeechCategory_categoryID];
    swift_beginAccess();
    uint64_t v26 = v28;
    *uint64_t v25 = v30;
    v25[1] = v26;
  }
  swift_bridgeObjectRelease();
  return a4;
}

uint64_t sub_25F3BC308(uint64_t a1, unint64_t a2)
{
  swift_bridgeObjectRetain();
  uint64_t v47 = a1;
  unint64_t v4 = sub_25F3F69E0();
  swift_bridgeObjectRelease();
  if (v4 <= 1)
  {
    uint64_t v5 = sub_25F3EFF08();
    swift_beginAccess();
    uint64_t v6 = sub_25F3F5EA0();
    uint64_t v7 = *(void *)(v6 - 8);
    double v8 = MEMORY[0x270FA5388](v6);
    uint64_t v10 = (char *)v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, uint64_t, uint64_t, double))(v7 + 16))(v10, v5, v6, v8);
    swift_bridgeObjectRetain_n();
    uint64_t v11 = sub_25F3F5E80();
    os_log_type_t v12 = sub_25F3F64C0();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = swift_slowAlloc();
      v46[1] = v46;
      uint64_t v14 = (uint8_t *)v13;
      uint64_t v15 = swift_slowAlloc();
      uint64_t v49 = v15;
      *(_DWORD *)uint64_t v14 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_25F2FE464(v47, a2, &v49);
      sub_25F3F66A0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25F2F5000, v11, v12, "Cannot delete category with ID: %s. System categories cant be deleted", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611F21E0](v15, -1, -1);
      MEMORY[0x2611F21E0](v14, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  if (qword_26A79DCD0 != -1) {
LABEL_50:
  }
    swift_once();
  id v17 = (id)qword_26A79DCD8;
  v51[0] = _sSo14NSUserDefaultsC31TextToSpeechVoiceBankingSupportE04liveE10CategoriesSDySSSDyS2SGGvg_0();
  sub_25F3B940C(v47, a2);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A78D908);
  uint64_t v18 = (void *)sub_25F3F6020();
  swift_bridgeObjectRelease();
  double v19 = (void *)sub_25F3F6100();
  uint64_t v20 = &selRef_addObject_;
  objc_msgSend(v17, sel_setObject_forKey_, v18, v19);

  id v21 = (id)qword_26A79DCD8;
  uint64_t v22 = _sSo14NSUserDefaultsC31TextToSpeechVoiceBankingSupportE15favoritePhrasesSaySDySSypGGvg_0();
  uint64_t v48 = v22;
  uint64_t v23 = *(void *)(v22 + 16);
  if (!v23)
  {
    uint64_t v25 = 0;
    int64_t v30 = 0;
    goto LABEL_47;
  }
  uint64_t v24 = (void *)v22;
  swift_bridgeObjectRetain();
  uint64_t v25 = 0;
  while (1)
  {
    uint64_t v26 = v24[v25 + 4];
    if (!*(void *)(v26 + 16)) {
      goto LABEL_9;
    }
    swift_bridgeObjectRetain();
    unint64_t v27 = sub_25F322920(0x79726F6765746163, 0xEA00000000004449);
    if (v28)
    {
      sub_25F301A40(*(void *)(v26 + 56) + 32 * v27, (uint64_t)v51);
      if (swift_dynamicCast()) {
        break;
      }
    }
    swift_bridgeObjectRelease();
LABEL_9:
    if (v23 == ++v25)
    {
      swift_bridgeObjectRelease();
      uint64_t v25 = v24[2];
      int64_t v30 = v25;
      uint64_t v20 = &selRef_addObject_;
LABEL_47:
      sub_25F3BB07C(v25, v30);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B398C80);
      uint64_t v44 = (void *)sub_25F3F62E0();
      swift_bridgeObjectRelease();
      uint64_t v45 = (void *)sub_25F3F6100();
      objc_msgSend(v21, v20[205], v44, v45);

      return notify_post("com.apple.livespeech.localprefschanged");
    }
  }
  if (v49 != v47 || v50 != a2)
  {
    char v29 = sub_25F3F6B80();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v29) {
      goto LABEL_21;
    }
    goto LABEL_9;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_21:
  uint64_t result = swift_bridgeObjectRelease();
  int64_t v30 = v25 + 1;
  uint64_t v20 = &selRef_addObject_;
  if (__OFADD__(v25, 1)) {
    goto LABEL_56;
  }
  unint64_t v31 = v24[2];
  if (v30 == v31)
  {
LABEL_46:
    if (v30 < v25) {
      goto LABEL_55;
    }
    goto LABEL_47;
  }
  uint64_t v32 = v25 + 5;
  while (2)
  {
    unint64_t v36 = v32 - 4;
    if (v32 - 4 >= v31)
    {
      __break(1u);
LABEL_49:
      __break(1u);
      goto LABEL_50;
    }
    uint64_t v37 = v24[v32];
    swift_bridgeObjectRetain();
    if (*(void *)(v37 + 16)
      && (unint64_t v38 = sub_25F322920(0x79726F6765746163, 0xEA00000000004449), (v39 & 1) != 0)
      && (sub_25F301A40(*(void *)(v37 + 56) + 32 * v38, (uint64_t)v51), (swift_dynamicCast() & 1) != 0))
    {
      if (v49 == v47 && v50 == a2)
      {
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        goto LABEL_26;
      }
      char v43 = sub_25F3F6B80();
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      if (v43)
      {
LABEL_26:
        unint64_t v31 = v24[2];
        uint64_t v34 = v32 + 1;
        uint64_t v35 = v32 - 3;
        ++v32;
        if (v35 == v31)
        {
          int64_t v30 = v34 - 4;
          uint64_t v20 = &selRef_addObject_;
          goto LABEL_46;
        }
        continue;
      }
    }
    else
    {
      uint64_t result = swift_bridgeObjectRelease();
    }
    break;
  }
  if (v36 == v25)
  {
LABEL_25:
    if (__OFADD__(v25++, 1)) {
      goto LABEL_49;
    }
    goto LABEL_26;
  }
  if ((v25 & 0x8000000000000000) == 0)
  {
    unint64_t v40 = v24[2];
    if (v25 >= v40) {
      goto LABEL_52;
    }
    if (v36 >= v40) {
      goto LABEL_53;
    }
    uint64_t v41 = v24[v25 + 4];
    uint64_t v42 = v24[v32];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v24 = sub_25F3BA360(v24);
    }
    v24[v25 + 4] = v42;
    uint64_t result = swift_bridgeObjectRelease();
    if (v36 >= v24[2]) {
      goto LABEL_54;
    }
    v24[v32] = v41;
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v48 = (uint64_t)v24;
    goto LABEL_25;
  }
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
  return result;
}

uint64_t sub_25F3BCA20(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (qword_26A79DCD0 != -1) {
    swift_once();
  }
  id v10 = (id)qword_26A79DCD8;
  unint64_t v11 = _sSo14NSUserDefaultsC31TextToSpeechVoiceBankingSupportE04liveE10CategoriesSDySSSDyS2SGGvg_0();

  swift_bridgeObjectRetain();
  sub_25F3BB754(v11);
  uint64_t v13 = v12;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v13)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v14 = sub_25F3EFF08();
    swift_beginAccess();
    uint64_t v15 = sub_25F3F5EA0();
    uint64_t v16 = *(void *)(v15 - 8);
    double v17 = MEMORY[0x270FA5388](v15);
    double v19 = (char *)&v48 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, uint64_t, uint64_t, double))(v16 + 16))(v19, v14, v15, v17);
    uint64_t v20 = sub_25F3F5E80();
    os_log_type_t v21 = sub_25F3F64C0();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = swift_slowAlloc();
      uint64_t v51 = &v48;
      uint64_t v23 = (uint8_t *)v22;
      uint64_t v24 = swift_slowAlloc();
      uint64_t v55 = v24;
      *(_DWORD *)uint64_t v23 = 136315138;
      uint64_t v52 = sub_25F2FE464(0xD00000000000004BLL, 0x800000025F407A80, &v55);
      sub_25F3F66A0();
      _os_log_impl(&dword_25F2F5000, v20, v21, "%s", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611F21E0](v24, -1, -1);
      MEMORY[0x2611F21E0](v23, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v16 + 8))(v19, v15);
    type metadata accessor for TTSVBError(0);
    sub_25F2FE028();
    swift_allocError();
    uint64_t v26 = v25;
    uint64_t v27 = 0xD00000000000004BLL;
    uint64_t v28 = 0x800000025F407A80;
LABEL_7:
    TTSVBError.init(_:_:_:)(v27, v28, 0, 0, 0, v26);
    return swift_willThrow();
  }
  uint64_t v30 = sub_25F3B940C(a4, a5);
  if (!v30)
  {
    uint64_t v53 = 0;
    unint64_t v54 = 0xE000000000000000;
    sub_25F3F6880();
    sub_25F3F61E0();
    sub_25F3F61E0();
    uint64_t v34 = 0;
    uint64_t v35 = sub_25F3EFF08();
    swift_beginAccess();
    uint64_t v36 = sub_25F3F5EA0();
    uint64_t v37 = *(void *)(v36 - 8);
    double v38 = MEMORY[0x270FA5388](v36);
    unint64_t v40 = (char *)&v48 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, uint64_t, uint64_t, double))(v37 + 16))(v40, v35, v36, v38);
    swift_bridgeObjectRetain_n();
    uint64_t v41 = sub_25F3F5E80();
    os_log_type_t v42 = sub_25F3F64C0();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v50 = &v48;
      uint64_t v43 = swift_slowAlloc();
      uint64_t v51 = 0;
      uint64_t v44 = (uint8_t *)v43;
      uint64_t v45 = swift_slowAlloc();
      uint64_t v55 = v45;
      uint64_t v49 = v36;
      *(_DWORD *)uint64_t v44 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v52 = sub_25F2FE464((uint64_t)v51, 0xE000000000000000, &v55);
      sub_25F3F66A0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25F2F5000, v41, v42, "%s", v44, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611F21E0](v45, -1, -1);
      unint64_t v46 = v44;
      uint64_t v34 = (uint64_t)v51;
      MEMORY[0x2611F21E0](v46, -1, -1);

      (*(void (**)(char *, uint64_t))(v37 + 8))(v40, v49);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v37 + 8))(v40, v36);
    }
    type metadata accessor for TTSVBError(0);
    sub_25F2FE028();
    swift_allocError();
    uint64_t v26 = v47;
    uint64_t v27 = v34;
    uint64_t v28 = 0xE000000000000000;
    goto LABEL_7;
  }
  uint64_t v31 = v30;
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v53 = v31;
  sub_25F3B9E64(a2, a3, 1701667182, 0xE400000000000000, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  char v33 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v53 = *a1;
  *a1 = 0x8000000000000000;
  sub_25F3B9CF4(v31, a4, a5, v33);
  *a1 = v53;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return notify_post("com.apple.livespeech.localprefschanged");
}

void sub_25F3BD0A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_bridgeObjectRetain();
  unint64_t v9 = sub_25F3F69E0();
  swift_bridgeObjectRelease();
  if (v9 > 1)
  {
    if (qword_26A79DCD0 != -1) {
      swift_once();
    }
    id v23 = (id)qword_26A79DCD8;
    v32[0] = _sSo14NSUserDefaultsC31TextToSpeechVoiceBankingSupportE04liveE10CategoriesSDySSSDyS2SGGvg_0();
    sub_25F3BCA20(v32, a3, a4, a1, a2);
    if (v4)
    {

      swift_bridgeObjectRelease();
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A78D908);
      uint64_t v25 = (void *)sub_25F3F6020();
      swift_bridgeObjectRelease();
      uint64_t v26 = (void *)sub_25F3F6100();
      objc_msgSend(v23, sel_setObject_forKey_, v25, v26);
    }
  }
  else
  {
    v32[0] = 0;
    v32[1] = 0xE000000000000000;
    sub_25F3F6880();
    sub_25F3F61E0();
    sub_25F3F61E0();
    sub_25F3F61E0();
    uint64_t v10 = 0;
    uint64_t v11 = sub_25F3EFF08();
    swift_beginAccess();
    uint64_t v12 = sub_25F3F5EA0();
    uint64_t v13 = *(void *)(v12 - 8);
    double v14 = MEMORY[0x270FA5388](v12);
    uint64_t v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, uint64_t, uint64_t, double))(v13 + 16))(v16, v11, v12, v14);
    swift_bridgeObjectRetain_n();
    double v17 = sub_25F3F5E80();
    os_log_type_t v18 = sub_25F3F64C0();
    if (os_log_type_enabled(v17, v18))
    {
      char v29 = &v27;
      uint64_t v19 = swift_slowAlloc();
      uint64_t v30 = 0;
      uint64_t v20 = (uint8_t *)v19;
      uint64_t v21 = swift_slowAlloc();
      uint64_t v33 = v21;
      uint64_t v28 = v12;
      *(_DWORD *)uint64_t v20 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v31 = sub_25F2FE464(v30, 0xE000000000000000, &v33);
      sub_25F3F66A0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25F2F5000, v17, v18, "%s", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611F21E0](v21, -1, -1);
      uint64_t v22 = v20;
      uint64_t v10 = v30;
      MEMORY[0x2611F21E0](v22, -1, -1);

      (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v28);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
    }
    type metadata accessor for TTSVBError(0);
    sub_25F2FE028();
    swift_allocError();
    TTSVBError.init(_:_:_:)(v10, 0xE000000000000000, 0, 0, 0, v24);
    swift_willThrow();
  }
}

uint64_t sub_25F3BD4F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_bridgeObjectRetain();
  unint64_t v9 = sub_25F3F69E0();
  swift_bridgeObjectRelease();
  if (v9 > 1)
  {
    if (qword_26A79DCD0 != -1) {
      swift_once();
    }
    id v23 = (id)qword_26A79DCD8;
    v33[0] = _sSo14NSUserDefaultsC31TextToSpeechVoiceBankingSupportE04liveE10CategoriesSDySSSDyS2SGGvg_0();
    sub_25F3B8634(v33, a1, a2, a3, a4);
    if (v4)
    {

      return swift_bridgeObjectRelease();
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A78D908);
      uint64_t v26 = (void *)sub_25F3F6020();
      swift_bridgeObjectRelease();
      uint64_t v27 = (void *)sub_25F3F6100();
      objc_msgSend(v23, sel_setObject_forKey_, v26, v27);

      return notify_post("com.apple.livespeech.localprefschanged");
    }
  }
  else
  {
    v33[0] = 0;
    v33[1] = 0xE000000000000000;
    sub_25F3F6880();
    sub_25F3F61E0();
    sub_25F3F61E0();
    sub_25F3F61E0();
    uint64_t v10 = 0;
    uint64_t v11 = sub_25F3EFF08();
    swift_beginAccess();
    uint64_t v12 = sub_25F3F5EA0();
    uint64_t v13 = *(void *)(v12 - 8);
    double v14 = MEMORY[0x270FA5388](v12);
    uint64_t v16 = (char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, uint64_t, uint64_t, double))(v13 + 16))(v16, v11, v12, v14);
    swift_bridgeObjectRetain_n();
    double v17 = sub_25F3F5E80();
    os_log_type_t v18 = sub_25F3F64C0();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v30 = &v28;
      uint64_t v19 = swift_slowAlloc();
      uint64_t v31 = 0;
      uint64_t v20 = (uint8_t *)v19;
      uint64_t v21 = swift_slowAlloc();
      uint64_t v34 = v21;
      uint64_t v29 = v12;
      *(_DWORD *)uint64_t v20 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v32 = sub_25F2FE464(v31, 0xE000000000000000, &v34);
      sub_25F3F66A0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25F2F5000, v17, v18, "%s", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611F21E0](v21, -1, -1);
      uint64_t v22 = v20;
      uint64_t v10 = v31;
      MEMORY[0x2611F21E0](v22, -1, -1);

      (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v29);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
    }
    type metadata accessor for TTSVBError(0);
    sub_25F2FE028();
    swift_allocError();
    TTSVBError.init(_:_:_:)(v10, 0xE000000000000000, 0, 0, 0, v25);
    return swift_willThrow();
  }
}

char *keypath_get_selector_liveSpeechCategories()
{
  return sel_liveSpeechCategories;
}

uint64_t sub_25F3BD960()
{
  return sub_25F3B8BFC(*(uint64_t (**)(uint64_t))(v0 + 16), *(void *)(v0 + 24), "Categories did change. Notifying observers");
}

char *sub_25F3BD984(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + a1 + 32);
    uint64_t v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }
  uint64_t result = (char *)sub_25F3F69C0();
  __break(1u);
  return result;
}

void _sSo18LiveSpeechCategoryC06TextToB19VoiceBankingSupportE27addSystemCategoriesIfNeededyyFZ_0()
{
  if (qword_26A79DCD0 != -1) {
    goto LABEL_56;
  }
  while (1)
  {
    id v0 = (id)qword_26A79DCD8;
    unint64_t v1 = _sSo14NSUserDefaultsC31TextToSpeechVoiceBankingSupportE04liveE10CategoriesSDySSSDyS2SGGvg_0();

    unint64_t v2 = sub_25F3B5C80(v1);
    swift_bridgeObjectRelease();
    if (v2 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v3 = sub_25F3F6980();
      if (v3)
      {
LABEL_4:
        unint64_t v4 = v2 & 0xC000000000000001;
        uint64_t v5 = 4;
        do
        {
          id v6 = v4 ? (id)MEMORY[0x2611F12D0](v5 - 4, v2) : *(id *)(v2 + 8 * v5);
          uint64_t v7 = v6;
          uint64_t v8 = v5 - 3;
          if (__OFADD__(v5 - 4, 1)) {
            goto LABEL_55;
          }
          unsigned int v9 = objc_msgSend(v6, sel_isSaved);

          if (v9)
          {
            swift_bridgeObjectRelease();
            uint64_t v13 = (char *)MEMORY[0x263F8EE78];
            goto LABEL_16;
          }
          ++v5;
        }
        while (v8 != v3);
      }
    }
    else
    {
      uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v3) {
        goto LABEL_4;
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v10 = sub_25F3B9294(0, 1, 1, MEMORY[0x263F8EE78]);
    unint64_t v12 = *((void *)v10 + 2);
    unint64_t v11 = *((void *)v10 + 3);
    if (v12 >= v11 >> 1) {
      uint64_t v10 = sub_25F3B9294((char *)(v11 > 1), v12 + 1, 1, v10);
    }
    *((void *)v10 + 2) = v12 + 1;
    v10[v12 + 32] = 0;
    if (v3)
    {
      uint64_t v13 = v10;
      unint64_t v4 = v2 & 0xC000000000000001;
LABEL_16:
      swift_bridgeObjectRetain();
      uint64_t v14 = 4;
      while (1)
      {
        id v15 = v4 ? (id)MEMORY[0x2611F12D0](v14 - 4, v2) : *(id *)(v2 + 8 * v14);
        uint64_t v16 = v15;
        uint64_t v17 = v14 - 3;
        if (__OFADD__(v14 - 4, 1)) {
          goto LABEL_54;
        }
        unsigned __int8 v18 = objc_msgSend(v15, sel_isRecents);

        if (v18)
        {
          swift_bridgeObjectRelease_n();
          uint64_t v10 = v13;
          if (*((void *)v13 + 2)) {
            goto LABEL_30;
          }
          swift_bridgeObjectRelease();
          return;
        }
        ++v14;
        if (v17 == v3)
        {
          swift_bridgeObjectRelease();
          uint64_t v10 = v13;
          break;
        }
      }
    }
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v10 = sub_25F3B9294(0, *((void *)v10 + 2) + 1, 1, v10);
    }
    unint64_t v20 = *((void *)v10 + 2);
    unint64_t v19 = *((void *)v10 + 3);
    if (v20 >= v19 >> 1) {
      uint64_t v10 = sub_25F3B9294((char *)(v19 > 1), v20 + 1, 1, v10);
    }
    *((void *)v10 + 2) = v20 + 1;
    v10[v20 + 32] = 1;
LABEL_30:
    id v21 = (id)qword_26A79DCD8;
    _sSo14NSUserDefaultsC31TextToSpeechVoiceBankingSupportE04liveE10CategoriesSDySSSDyS2SGGvg_0();
    uint64_t v46 = *((void *)v10 + 2);
    if (!v46) {
      break;
    }
    id v44 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A78D988);
    swift_bridgeObjectRetain();
    uint64_t v22 = 0;
    uint64_t v45 = v10;
    while (1)
    {
      if (v10[v22 + 32]) {
        uint64_t v23 = 0x73746E65636552;
      }
      else {
        uint64_t v23 = 0x6465766153;
      }
      unint64_t v24 = 0xE500000000000000;
      if (v10[v22 + 32]) {
        uint64_t v25 = 0xE700000000000000;
      }
      else {
        uint64_t v25 = 0xE500000000000000;
      }
      uint64_t v26 = 0x6B72616D6B6F6F62;
      if (v10[v22 + 32]) {
        uint64_t v26 = 0x6B636F6C63;
      }
      uint64_t v47 = v26;
      if (!v10[v22 + 32]) {
        unint64_t v24 = 0xE800000000000000;
      }
      unint64_t v48 = v24;
      uint64_t v27 = (void *)sub_25F3F69B0();
      swift_retain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v28 = sub_25F322920(1701667182, 0xE400000000000000);
      if (v29) {
        break;
      }
      *(void *)((char *)v27 + ((v28 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v28;
      uint64_t v30 = (void *)(v27[6] + 16 * v28);
      *uint64_t v30 = 1701667182;
      v30[1] = 0xE400000000000000;
      uint64_t v31 = (uint64_t *)(v27[7] + 16 * v28);
      uint64_t *v31 = v23;
      v31[1] = v25;
      uint64_t v32 = v27[2];
      BOOL v33 = __OFADD__(v32, 1);
      uint64_t v34 = v32 + 1;
      if (v33) {
        goto LABEL_51;
      }
      v27[2] = v34;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v35 = sub_25F322920(0x6C6F626D7973, 0xE600000000000000);
      if (v36) {
        goto LABEL_52;
      }
      *(void *)((char *)v27 + ((v35 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v35;
      uint64_t v37 = (void *)(v27[6] + 16 * v35);
      *uint64_t v37 = 0x6C6F626D7973;
      v37[1] = 0xE600000000000000;
      double v38 = (uint64_t *)(v27[7] + 16 * v35);
      *double v38 = v47;
      v38[1] = v48;
      uint64_t v39 = v27[2];
      BOOL v33 = __OFADD__(v39, 1);
      uint64_t v40 = v39 + 1;
      if (v33) {
        goto LABEL_53;
      }
      ++v22;
      v27[2] = v40;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A78D990);
      swift_arrayDestroy();
      swift_release();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      sub_25F3B9CF4((uint64_t)v27, v23, v25, isUniquelyReferenced_nonNull_native);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v10 = v45;
      if (v46 == v22)
      {
        swift_bridgeObjectRelease();
        id v21 = v44;
        goto LABEL_48;
      }
    }
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
    swift_once();
  }
LABEL_48:
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A78D908);
  os_log_type_t v42 = (void *)sub_25F3F6020();
  swift_bridgeObjectRelease();
  uint64_t v43 = (void *)sub_25F3F6100();
  objc_msgSend(v21, sel_setObject_forKey_, v42, v43);
  swift_bridgeObjectRelease();
}

uint64_t sub_25F3BE074(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_25F3BE0B8()
{
  return MEMORY[0x263F8D320];
}

char *keypath_get_selector_favoritePhrases()
{
  return sel_favoritePhrases;
}

char *keypath_get_selector_liveSpeechMaxRecentsCount()
{
  return sel_liveSpeechMaxRecentsCount;
}

ValueMetadata *type metadata accessor for TTSVBLiveSpeechSupport()
{
  return &type metadata for TTSVBLiveSpeechSupport;
}

uint64_t type metadata accessor for LiveSpeechCategory(uint64_t a1)
{
  return sub_25F3236F0(a1, qword_26A79DD78);
}

uint64_t sub_25F3BE100()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25F3BE138()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

unsigned char *storeEnumTagSinglePayload for SystemCategory(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25F3BE214);
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

ValueMetadata *type metadata accessor for SystemCategory()
{
  return &type metadata for SystemCategory;
}

uint64_t sub_25F3BE24C()
{
  return sub_25F335CF0(&qword_26A78D9C0, &qword_26A78D9C8);
}

unint64_t sub_25F3BE28C()
{
  unint64_t result = qword_26A79DE80[0];
  if (!qword_26A79DE80[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A79DE80);
  }
  return result;
}

uint64_t sub_25F3BE2FC()
{
  uint64_t v1 = *v0;
  if (*v0)
  {
    return sub_25F3BE3F0(v1);
  }
  else
  {
    id v3 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_entity);
    id v4 = objc_msgSend(v3, sel_attributesByName);
    sub_25F3236F0(0, &qword_26B398CC0);
    uint64_t v5 = sub_25F3F6040();

    unsigned int v6 = sub_25F3BFB28(v5);
    swift_bridgeObjectRelease();
    uint64_t v7 = sub_25F3BE3F0((uint64_t)v6);

    swift_release();
    return v7;
  }
}

uint64_t sub_25F3BE3F0(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    sub_25F3BFCF8(0, v1, 0);
    uint64_t v2 = v9;
    uint64_t v4 = a1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_25F3BFCF8(0, *(void *)(v2 + 16) + 1, 1);
        uint64_t v2 = v9;
      }
      unint64_t v6 = *(void *)(v2 + 16);
      unint64_t v5 = *(void *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_25F3BFCF8(v5 > 1, v6 + 1, 1);
        uint64_t v2 = v9;
      }
      v4 += 16;
      *(void *)(v2 + 16) = v6 + 1;
      sub_25F3237C8(&v8, (_OWORD *)(v2 + 32 * v6 + 32));
      --v1;
    }
    while (v1);
  }
  return v2;
}

id static DSO<>.entity.getter()
{
  id v0 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_entity);

  return v0;
}

void static DSO<>.entityName.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (void *)(*(uint64_t (**)(void))(a2 + 8))();
  id v3 = objc_msgSend(v2, sel_name);

  if (v3)
  {
    sub_25F3F6130();
  }
  else
  {
    __break(1u);
  }
}

uint64_t static DSO<>.count(in:configure:)(uint64_t a1, void (*a2)(void), uint64_t a3, uint64_t a4, uint64_t a5)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B398CA8);
  (*(void (**)(uint64_t, uint64_t))(a5 + 16))(a4, a5);
  id v8 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v9 = sub_25F3BFAD0();
  a2();
  uint64_t v10 = sub_25F3F65E0();

  return v10;
}

void static DSO<>.hydrated(in:matching:)(void *a1, void *a2)
{
  id v2 = objc_msgSend(a1, sel_registeredObjects);
  sub_25F3236F0(0, &qword_26A78D9D0);
  sub_25F3BFC10();
  uint64_t v3 = sub_25F3F6410();

  if ((v3 & 0xC000000000000001) != 0)
  {
    sub_25F3F67D0();
    sub_25F3F6420();
    uint64_t v3 = v22;
    uint64_t v20 = v23;
    uint64_t v4 = v24;
    uint64_t v5 = v25;
    unint64_t v6 = v26;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = -1 << *(unsigned char *)(v3 + 32);
    uint64_t v20 = v3 + 56;
    uint64_t v4 = ~v7;
    uint64_t v8 = -v7;
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v6 = v9 & *(void *)(v3 + 56);
  }
  int64_t v10 = (unint64_t)(v4 + 64) >> 6;
  while (v3 < 0)
  {
    if (!sub_25F3F6800()) {
      goto LABEL_33;
    }
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v14 = v21;
    swift_unknownObjectRelease();
    uint64_t v13 = v5;
    uint64_t v11 = v6;
    if (!v21) {
      goto LABEL_33;
    }
LABEL_30:
    if ((objc_msgSend(v14, sel_isFault) & 1) == 0)
    {
      uint64_t v18 = swift_dynamicCastUnknownClass();
      if (v18)
      {
        if (objc_msgSend(a2, sel_evaluateWithObject_, v18)) {
          goto LABEL_33;
        }
      }
    }

    uint64_t v5 = v13;
    unint64_t v6 = v11;
  }
  if (v6)
  {
    uint64_t v11 = (v6 - 1) & v6;
    unint64_t v12 = __clz(__rbit64(v6)) | (v5 << 6);
    uint64_t v13 = v5;
LABEL_29:
    id v14 = *(id *)(*(void *)(v3 + 48) + 8 * v12);
    if (!v14) {
      goto LABEL_33;
    }
    goto LABEL_30;
  }
  int64_t v15 = v5 + 1;
  if (!__OFADD__(v5, 1))
  {
    if (v15 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v20 + 8 * v15);
    uint64_t v13 = v5 + 1;
    if (!v16)
    {
      uint64_t v13 = v5 + 2;
      if (v5 + 2 >= v10) {
        goto LABEL_33;
      }
      unint64_t v16 = *(void *)(v20 + 8 * v13);
      if (!v16)
      {
        uint64_t v13 = v5 + 3;
        if (v5 + 3 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = *(void *)(v20 + 8 * v13);
        if (!v16)
        {
          uint64_t v13 = v5 + 4;
          if (v5 + 4 >= v10) {
            goto LABEL_33;
          }
          unint64_t v16 = *(void *)(v20 + 8 * v13);
          if (!v16)
          {
            uint64_t v17 = v5 + 5;
            while (v10 != v17)
            {
              unint64_t v16 = *(void *)(v20 + 8 * v17++);
              if (v16)
              {
                uint64_t v13 = v17 - 1;
                goto LABEL_28;
              }
            }
LABEL_33:
            sub_25F37C120();
            return;
          }
        }
      }
    }
LABEL_28:
    uint64_t v11 = (v16 - 1) & v16;
    unint64_t v12 = __clz(__rbit64(v16)) + (v13 << 6);
    goto LABEL_29;
  }
  __break(1u);
}

uint64_t (*sub_25F3BEA1C(uint64_t a1, uint64_t a2))()
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  return nullsub_1;
}

uint64_t static DSO<>.fetch(in:config:)(uint64_t a1, void (*a2)(id), uint64_t a3, uint64_t a4, uint64_t a5)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B398CA8);
  (*(void (**)(uint64_t, uint64_t))(a5 + 16))(a4, a5);
  id v8 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v9 = sub_25F3BFAD0();
  objc_msgSend(v9, sel_setReturnsObjectsAsFaults_, 1);
  a2(v9);
  uint64_t v10 = sub_25F3F65F0();

  return v10;
}

uint64_t static DSO<>.fetch(properties:in:config:)(uint64_t a1, uint64_t a2, void (*a3)(id), uint64_t a4, uint64_t a5, uint64_t a6)
{
  (*(void (**)(uint64_t, uint64_t))(a6 + 16))(a5, a6);
  id v7 = objc_allocWithZone(MEMORY[0x263EFF260]);
  id v8 = (void *)sub_25F3F6100();
  swift_bridgeObjectRelease();
  id v9 = objc_msgSend(v7, sel_initWithEntityName_, v8);

  objc_msgSend(v9, sel_setResultType_, 2);
  type metadata accessor for DSOFetchProperties();
  sub_25F3BE2FC();
  uint64_t v10 = (void *)sub_25F3F62E0();
  swift_bridgeObjectRelease();
  objc_msgSend(v9, sel_setPropertiesToFetch_, v10);

  a3(v9);
  sub_25F3236F0(0, &qword_26A78D9E0);
  unint64_t v11 = sub_25F3F65F0();
  uint64_t v12 = sub_25F3BF120(v11);
  swift_bridgeObjectRelease();

  if (v12) {
    return v12;
  }
  else {
    return MEMORY[0x263F8EE78];
  }
}

uint64_t sub_25F3BF120(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_25F3F6980();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v10 = MEMORY[0x263F8EE78];
  sub_25F3BFD18(0, v3 & ~(v3 >> 63), 0);
  uint64_t v4 = v10;
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_25F3F6980();
    swift_bridgeObjectRelease();
    if (!v6) {
      return v4;
    }
  }
  else if (!*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    return v4;
  }
  if ((a1 & 0xC000000000000001) != 0) {
    id v7 = (id)MEMORY[0x2611F12D0](0, a1);
  }
  else {
    id v7 = *(id *)(a1 + 32);
  }
  id v8 = v7;
  sub_25F3F6030();

  swift_release();
  return 0;
}

void static DSO<>.findOrFetch(in:matching:)(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  static DSO<>.hydrated(in:matching:)(a1, a2);
  if (!v8)
  {
    MEMORY[0x270FA5388](0);
    _OWORD v9[2] = a3;
    v9[3] = a4;
    v9[4] = a2;
    v9[6] = static DSO<>.fetch(in:config:)((uint64_t)a1, (void (*)(id))sub_25F3BFC94, (uint64_t)v9, a3, a4);
    sub_25F3F6360();
    swift_getWitnessTable();
    sub_25F3F6440();
    swift_bridgeObjectRelease();
  }
}

uint64_t static DSO<>.findOrCreate(in:matching:config:)(void *a1, void *a2, void (*a3)(void), uint64_t a4, uint64_t a5, uint64_t a6)
{
  static DSO<>.findOrFetch(in:matching:)(a1, a2, a5, a6);
  if (v9) {
    return v9;
  }
  uint64_t v10 = NSManagedObjectContext.insertDSO<A>(_:)(0, a5, a6);
  a3();
  return v10;
}

uint64_t NSManagedObjectContext.insertDSO<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  id v7 = self;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a2, a3);
  uint64_t v8 = (void *)sub_25F3F6100();
  swift_bridgeObjectRelease();
  id v9 = objc_msgSend(v7, sel_insertNewObjectForEntityForName_inManagedObjectContext_, v8, v4);

  uint64_t result = swift_dynamicCastUnknownClass();
  if (!result)
  {

    uint64_t result = sub_25F3F6970();
    __break(1u);
  }
  return result;
}

void DSO<>.refresh(_:)(char a1)
{
  id v3 = objc_msgSend(v1, sel_managedObjectContext);
  objc_msgSend(v3, sel_refreshObject_mergeChanges_, v1, a1 & 1);
}

uint64_t DSO<>.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  id v7 = objc_msgSend(v3, sel_changedValues);
  uint64_t v8 = sub_25F3F6040();

  if (*(void *)(v8 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v9 = sub_25F322920(a1, a2);
    if (v10)
    {
      sub_25F301A40(*(void *)(v8 + 56) + 32 * v9, (uint64_t)a3);
    }
    else
    {
      *a3 = 0u;
      a3[1] = 0u;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    *a3 = 0u;
    a3[1] = 0u;
  }

  return swift_bridgeObjectRelease();
}

{
  void *v3;
  void *v4;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  uint64_t vars8;

  uint64_t v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B398D08);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_25F3F8460;
  *(void *)(v8 + 32) = a1;
  *(void *)(v8 + 40) = a2;
  swift_bridgeObjectRetain();
  unint64_t v9 = (void *)sub_25F3F62E0();
  swift_bridgeObjectRelease();
  char v10 = objc_msgSend(v4, sel_committedValuesForKeys_, v9);

  unint64_t v11 = sub_25F3F6040();
  if (*(void *)(v11 + 16))
  {
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_25F322920(a1, a2);
    if (v13)
    {
      sub_25F301A40(*(void *)(v11 + 56) + 32 * v12, (uint64_t)a3);
    }
    else
    {
      *a3 = 0u;
      a3[1] = 0u;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    *a3 = 0u;
    a3[1] = 0u;
  }

  return swift_bridgeObjectRelease();
}

Swift::Bool __swiftcall NSManagedObjectContext.saveOrRollback()()
{
  int64_t v1 = v0;
  v16[1] = *(id *)MEMORY[0x263EF8340];
  v16[0] = 0;
  unsigned int v2 = objc_msgSend(v0, sel_save_, v16);
  if (v2)
  {
    id v3 = v16[0];
  }
  else
  {
    id v4 = v16[0];
    uint64_t v5 = (void *)sub_25F3F5980();

    swift_willThrow();
    uint64_t v6 = sub_25F3EFA00();
    uint64_t v7 = sub_25F3F5EA0();
    uint64_t v8 = *(void *)(v7 - 8);
    MEMORY[0x270FA5388](v7);
    char v10 = (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v6, v7);
    unint64_t v11 = sub_25F3F5E80();
    os_log_type_t v12 = sub_25F3F64C0();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_25F2F5000, v11, v12, "CoreData save failed! Rolling back context", v13, 2u);
      MEMORY[0x2611F21E0](v13, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    objc_msgSend(v1, sel_rollback);
  }
  return v2;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> NSManagedObjectContext.trySave()()
{
  uint64_t v1 = type metadata accessor for TTSVBError.Reason(0);
  MEMORY[0x270FA5388](v1);
  id v3 = &v4[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = v0;
  long long v6 = xmmword_25F400A60;
  char v7 = 3;
  swift_storeEnumTagMultiPayload();
  static TTSVBError.perform<A>(_:problem:reason:)((void (*)(uint64_t))sub_25F3C0034, (uint64_t)v4, (uint64_t)&v6, (uint64_t)v3);
  sub_25F3C00AC((uint64_t)v3);
}

id sub_25F3BFAD0()
{
  uint64_t v1 = (void *)sub_25F3F6100();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

void *sub_25F3BFB28(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B398D08);
  id v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = sub_25F3C02C8((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_25F37C120();
  if (v6 != v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

unint64_t sub_25F3BFC10()
{
  unint64_t result = qword_26A78D9D8;
  if (!qword_26A78D9D8)
  {
    sub_25F3236F0(255, &qword_26A78D9D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A78D9D8);
  }
  return result;
}

uint64_t sub_25F3BFC6C()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t type metadata accessor for DSOFetchProperties()
{
  return __swift_instantiateGenericMetadata();
}

id sub_25F3BFC94(void *a1)
{
  objc_msgSend(a1, sel_setPredicate_, *(void *)(v1 + 32));
  objc_msgSend(a1, sel_setReturnsObjectsAsFaults_, 1);

  return objc_msgSend(a1, sel_setFetchLimit_, 1);
}

uint64_t sub_25F3BFCF8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25F3BFD38(a1, a2, a3, *v3);
  *id v3 = (char *)result;
  return result;
}

uint64_t sub_25F3BFD18(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25F3BFEA8(a1, a2, a3, (void *)*v3);
  *id v3 = result;
  return result;
}

uint64_t sub_25F3BFD38(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A78D9E8);
    char v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    char v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  id v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_25F3F69C0();
  __break(1u);
  return result;
}

uint64_t sub_25F3BFEA8(char a1, int64_t a2, char a3, void *a4)
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A78D9B0);
    char v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    void v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    char v10 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = (unint64_t)(v10 + 4);
  unint64_t v14 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v13 >= v14 + 8 * v8) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 8 * v8 || v13 >= v14 + 8 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B398C80);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_25F3F69C0();
  __break(1u);
  return result;
}

id sub_25F3C0034()
{
  uint64_t v1 = *(void **)(v0 + 16);
  id v4 = 0;
  if (objc_msgSend(v1, sel_save_, &v4)) {
    return v4;
  }
  id v3 = v4;
  sub_25F3F5980();

  return (id)swift_willThrow();
}

uint64_t sub_25F3C00AC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TTSVBError.Reason(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t dispatch thunk of static DSO.entity.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of static DSO.entityName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_25F3C0130(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 8);
}

void *sub_25F3C0138(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_25F3C0168()
{
  return swift_bridgeObjectRelease();
}

void *sub_25F3C0170(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void *sub_25F3C01B8(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_25F3C01EC(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  if ((v3 + 1) >= 2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t sub_25F3C023C(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)uint64_t result = 0;
    *(_DWORD *)uint64_t result = a2 - 0x7FFFFFFF;
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
      *(void *)uint64_t result = a2;
    }
  }
  return result;
}

uint64_t sub_25F3C0290(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_25F3C02A8(void *result, int a2)
{
  if (a2 < 0)
  {
    unsigned int v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2) {
      return result;
    }
    unsigned int v2 = a2 - 1;
  }
  *uint64_t result = v2;
  return result;
}

uint64_t sub_25F3C02C8(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *uint64_t v5 = a4;
    v5[1] = v6;
    _OWORD v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  int64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    uint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *int64_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    uint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

TextToSpeechVoiceBankingSupport::TTSVBTrainingScriptItem::CodingKeys_optional __swiftcall TTSVBTrainingScriptItem.CodingKeys.init(rawValue:)(Swift::String rawValue)
{
  unsigned int v2 = v1;
  unint64_t v3 = sub_25F3F69E0();
  result.value = swift_bridgeObjectRelease();
  char v5 = 9;
  if (v3 < 9) {
    char v5 = v3;
  }
  char *v2 = v5;
  return result;
}

TextToSpeechVoiceBankingSupport::TTSVBTrainingScriptItem::CodingKeys_optional __swiftcall TTSVBTrainingScriptItem.CodingKeys.init(stringValue:)(Swift::String stringValue)
{
  unsigned int v2 = v1;
  result.value = TTSVBTrainingScriptItem.CodingKeys.init(rawValue:)(stringValue).value;
  unsigned char *v2 = v4;
  return result;
}

TextToSpeechVoiceBankingSupport::TTSVBTrainingScriptItem::CodingKeys_optional __swiftcall TTSVBTrainingScriptItem.CodingKeys.init(intValue:)(Swift::Int intValue)
{
  *uint64_t v1 = 9;
  return (TextToSpeechVoiceBankingSupport::TTSVBTrainingScriptItem::CodingKeys_optional)intValue;
}

uint64_t TTSVBTrainingScriptItem.CodingKeys.intValue.getter()
{
  return 0;
}

unint64_t TTSVBTrainingScriptItem.CodingKeys.rawValue.getter()
{
  unint64_t result = 0x636E617265747475;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x697263736E617274;
      break;
    case 2:
      unint64_t result = 0x7364726F77;
      break;
    case 3:
      unint64_t result = 0x65735F656E6F6870;
      break;
    case 4:
      unint64_t result = 0x745F747069726373;
      break;
    case 5:
      unint64_t result = 0x7061726761726170;
      break;
    case 6:
      unint64_t result = 0x65636E65746E6573;
      break;
    case 7:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 8:
      unint64_t result = 0x656C61636F6CLL;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t TTSVBTrainingScriptItem.CodingKeys.stringValue.getter()
{
  unint64_t result = 0x636E617265747475;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x697263736E617274;
      break;
    case 2:
      unint64_t result = 0x7364726F77;
      break;
    case 3:
      unint64_t result = 0x65735F656E6F6870;
      break;
    case 4:
      unint64_t result = 0x745F747069726373;
      break;
    case 5:
      unint64_t result = 0x7061726761726170;
      break;
    case 6:
      unint64_t result = 0x65636E65746E6573;
      break;
    case 7:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 8:
      unint64_t result = 0x656C61636F6CLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25F3C0858(unsigned __int8 *a1, char *a2)
{
  return sub_25F3C0864(*a1, *a2);
}

uint64_t sub_25F3C0864(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xEE00656D616E5F65;
  unint64_t v3 = 0x636E617265747475;
  uint64_t v4 = a1;
  unint64_t v5 = 0x636E617265747475;
  unint64_t v6 = 0xEE00656D616E5F65;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0x697263736E617274;
      unint64_t v6 = 0xED00006E6F697470;
      break;
    case 2:
      unint64_t v6 = 0xE500000000000000;
      unint64_t v5 = 0x7364726F77;
      break;
    case 3:
      unint64_t v5 = 0x65735F656E6F6870;
      unint64_t v6 = 0xEE0065636E657571;
      break;
    case 4:
      unint64_t v5 = 0x745F747069726373;
      unint64_t v6 = 0xEC000000656C7469;
      break;
    case 5:
      unint64_t v5 = 0x7061726761726170;
      unint64_t v6 = 0xED00007864695F68;
      break;
    case 6:
      unint64_t v5 = 0x65636E65746E6573;
      unint64_t v6 = 0xEC0000007864695FLL;
      break;
    case 7:
      unint64_t v6 = 0x800000025F407D30;
      unint64_t v5 = 0xD00000000000001BLL;
      break;
    case 8:
      unint64_t v6 = 0xE600000000000000;
      unint64_t v5 = 0x656C61636F6CLL;
      break;
    default:
      break;
  }
  switch(a2)
  {
    case 1:
      uint64_t v7 = 0x697263736E617274;
      uint64_t v8 = 0x6E6F697470;
      goto LABEL_18;
    case 2:
      unint64_t v2 = 0xE500000000000000;
      if (v5 != 0x7364726F77) {
        goto LABEL_28;
      }
      goto LABEL_25;
    case 3:
      unint64_t v2 = 0xEE0065636E657571;
      if (v5 != 0x65735F656E6F6870) {
        goto LABEL_28;
      }
      goto LABEL_25;
    case 4:
      uint64_t v9 = 0x745F747069726373;
      uint64_t v10 = 1701606505;
      goto LABEL_21;
    case 5:
      uint64_t v7 = 0x7061726761726170;
      uint64_t v8 = 0x7864695F68;
LABEL_18:
      unint64_t v2 = v8 & 0xFFFFFFFFFFFFLL | 0xED00000000000000;
      if (v5 != v7) {
        goto LABEL_28;
      }
      goto LABEL_25;
    case 6:
      uint64_t v9 = 0x65636E65746E6573;
      uint64_t v10 = 2019846495;
LABEL_21:
      unint64_t v2 = v10 & 0xFFFFFFFFFFFFLL | 0xEC00000000000000;
      if (v5 != v9) {
        goto LABEL_28;
      }
      goto LABEL_25;
    case 7:
      unint64_t v2 = 0x800000025F407D30;
      unint64_t v3 = 0xD00000000000001BLL;
      goto LABEL_24;
    case 8:
      unint64_t v2 = 0xE600000000000000;
      if (v5 != 0x656C61636F6CLL) {
        goto LABEL_28;
      }
      goto LABEL_25;
    default:
LABEL_24:
      if (v5 != v3) {
        goto LABEL_28;
      }
LABEL_25:
      if (v6 == v2) {
        char v11 = 1;
      }
      else {
LABEL_28:
      }
        char v11 = sub_25F3F6B80();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v11 & 1;
  }
}

uint64_t sub_25F3C0B90()
{
  return sub_25F3F6C70();
}

uint64_t sub_25F3C0BD8()
{
  return sub_25F3C0BE0();
}

uint64_t sub_25F3C0BE0()
{
  sub_25F3F61A0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_25F3C0D70()
{
  return sub_25F3F6C70();
}

TextToSpeechVoiceBankingSupport::TTSVBTrainingScriptItem::CodingKeys_optional sub_25F3C0DB4(Swift::String *a1)
{
  return TTSVBTrainingScriptItem.CodingKeys.init(rawValue:)(*a1);
}

unint64_t sub_25F3C0DC0@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = TTSVBTrainingScriptItem.CodingKeys.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

TextToSpeechVoiceBankingSupport::TTSVBTrainingScriptItem::CodingKeys_optional sub_25F3C0DEC@<W0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  result.value = TTSVBTrainingScriptItem.CodingKeys.init(rawValue:)(*(Swift::String *)&a1).value;
  *a2 = v5;
  return result;
}

void sub_25F3C0E24(unsigned char *a1@<X8>)
{
  *a1 = 9;
}

uint64_t sub_25F3C0E30(uint64_t a1)
{
  unint64_t v2 = sub_25F3C87DC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25F3C0E6C(uint64_t a1)
{
  unint64_t v2 = sub_25F3C87DC();

  return MEMORY[0x270FA00B8](a1, v2);
}

void __swiftcall TTSVBTrainingScriptItem.init(id:transcript:phrase:phonemes:bookTitle:paragraphIndex:sentenceIndex:estimatedDuration:locale:)(TextToSpeechVoiceBankingSupport::TTSVBTrainingScriptItem *__return_ptr retstr, Swift::String id, Swift::String transcript, Swift::String phrase, Swift::String phonemes, Swift::String bookTitle, Swift::Int paragraphIndex, Swift::Int sentenceIndex, Swift::Double estimatedDuration, Swift::String locale)
{
  retstr->id = id;
  retstr->transcript = transcript;
  retstr->phrase = phrase;
  retstr->phonemes = phonemes;
  retstr->bookTitle = bookTitle;
  retstr->paragraphIndex = paragraphIndex;
  retstr->sentenceIndex = sentenceIndex;
  retstr->estimatedDuration = estimatedDuration;
  retstr->locale = locale;
}

uint64_t TTSVBTrainingScriptItem.id.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TTSVBTrainingScriptItem.transcript.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TTSVBTrainingScriptItem.phrase.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TTSVBTrainingScriptItem.phonemes.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TTSVBTrainingScriptItem.bookTitle.getter()
{
  uint64_t v1 = *(void *)(v0 + 64);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TTSVBTrainingScriptItem.paragraphIndex.getter()
{
  return *(void *)(v0 + 80);
}

uint64_t TTSVBTrainingScriptItem.sentenceIndex.getter()
{
  return *(void *)(v0 + 88);
}

double TTSVBTrainingScriptItem.estimatedDuration.getter()
{
  return *(double *)(v0 + 96);
}

uint64_t TTSVBTrainingScriptItem.locale.getter()
{
  uint64_t v1 = *(void *)(v0 + 104);
  swift_bridgeObjectRetain();
  return v1;
}

unint64_t TTSVBTrainingScriptItem.description.getter()
{
  return 0xD000000000000018;
}

uint64_t TTSVBTrainingScriptItem.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_25F3F61A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25F3F61A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25F3F61A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25F3F61A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25F3F61A0();
  swift_bridgeObjectRelease();
  sub_25F3F6C30();
  sub_25F3F6C30();
  sub_25F3F6C60();
  swift_bridgeObjectRetain();
  sub_25F3F61A0();

  return swift_bridgeObjectRelease();
}

uint64_t TTSVBTrainingScriptItem.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A78D9F0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  unint64_t v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = v1[2];
  v15[11] = v1[3];
  v15[12] = v7;
  uint64_t v8 = v1[4];
  v15[9] = v1[5];
  v15[10] = v8;
  uint64_t v9 = v1[6];
  v15[7] = v1[7];
  v15[8] = v9;
  uint64_t v10 = v1[9];
  v15[5] = v1[8];
  v15[6] = v10;
  uint64_t v11 = v1[10];
  v15[3] = v1[11];
  v15[4] = v11;
  uint64_t v12 = v1[14];
  v15[1] = v1[13];
  v15[2] = v12;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25F3C87DC();
  sub_25F3F6C90();
  char v24 = 0;
  uint64_t v13 = v15[13];
  sub_25F3F6AE0();
  if (!v13)
  {
    char v23 = 1;
    sub_25F3F6AE0();
    char v22 = 2;
    sub_25F3F6AE0();
    char v21 = 3;
    sub_25F3F6AE0();
    char v20 = 4;
    sub_25F3F6AE0();
    char v19 = 5;
    sub_25F3F6B20();
    char v18 = 6;
    sub_25F3F6B20();
    char v17 = 7;
    sub_25F3F6B00();
    char v16 = 8;
    sub_25F3F6AE0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t TTSVBTrainingScriptItem.hashValue.getter()
{
  return sub_25F3F6C70();
}

uint64_t TTSVBTrainingScriptItem.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DA00);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25F3C87DC();
  sub_25F3F6C80();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  char v49 = 0;
  uint64_t v10 = sub_25F3F6A30();
  uint64_t v12 = v11;
  char v48 = 1;
  swift_bridgeObjectRetain();
  uint64_t v37 = sub_25F3F6A30();
  uint64_t v38 = v10;
  char v47 = 2;
  uint64_t v14 = v13;
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_25F3F6A30();
  uint64_t v40 = v14;
  uint64_t v36 = v15;
  char v46 = 3;
  uint64_t v39 = v16;
  swift_bridgeObjectRetain();
  uint64_t v17 = sub_25F3F6A30();
  uint64_t v19 = v18;
  uint64_t v35 = v17;
  char v45 = 4;
  swift_bridgeObjectRetain();
  uint64_t v33 = sub_25F3F6A30();
  uint64_t v34 = v20;
  char v44 = 5;
  swift_bridgeObjectRetain();
  uint64_t v32 = sub_25F3F6A70();
  char v43 = 6;
  uint64_t v31 = sub_25F3F6A70();
  char v42 = 7;
  sub_25F3F6A50();
  uint64_t v30 = v21;
  char v41 = 8;
  uint64_t v29 = sub_25F3F6A30();
  uint64_t v23 = v22;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  swift_bridgeObjectRetain();
  uint64_t v24 = v40;
  swift_bridgeObjectRetain();
  uint64_t v25 = v39;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *a2 = v38;
  a2[1] = v12;
  a2[2] = v37;
  a2[3] = v24;
  a2[4] = v36;
  a2[5] = v25;
  uint64_t v26 = v34;
  a2[6] = v35;
  a2[7] = v19;
  a2[8] = v33;
  a2[9] = v26;
  uint64_t v27 = v31;
  a2[10] = v32;
  a2[11] = v27;
  a2[12] = v30;
  a2[13] = v29;
  a2[14] = v23;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25F3C1B18@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return TTSVBTrainingScriptItem.init(from:)(a1, a2);
}

uint64_t sub_25F3C1B30(void *a1)
{
  return TTSVBTrainingScriptItem.encode(to:)(a1);
}

uint64_t sub_25F3C1B48()
{
  return sub_25F3F6C70();
}

uint64_t sub_25F3C1BC8()
{
  return sub_25F3F6C70();
}

uint64_t sub_25F3C1C40@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t TTSVBTrainingScript.items.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t static TTSVBTrainingScript.parseScript(fromMetadatFile:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v39 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3988B0);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for TTSVBError(0);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for TTSVBError.Reason(0);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = a1;
  long long v37 = xmmword_25F3FF070;
  char v38 = 3;
  uint64_t v14 = sub_25F3F5B60();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v13, a1, v14);
  swift_storeEnumTagMultiPayload();
  static TTSVBError.perform<A>(_:problem:reason:)((void (*)(uint64_t))sub_25F3C8830, (uint64_t)v33, (uint64_t)&v37, (uint64_t)v13);
  uint64_t result = sub_25F391060((uint64_t)v13, type metadata accessor for TTSVBError.Reason);
  if (!v2)
  {
    uint64_t v29 = v10;
    uint64_t v32 = v7;
    uint64_t v17 = v35;
    uint64_t v16 = v36;
    sub_25F3F57E0();
    swift_allocObject();
    uint64_t v18 = sub_25F3F57D0();
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = MEMORY[0x263F8EE78];
    v28[1] = v19 + 16;
    uint64_t v20 = swift_allocBox();
    uint64_t v22 = v21;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56))(v21, 1, 1, v32);
    *(void *)&long long v37 = v17;
    *((void *)&v37 + 1) = v16;
    uint64_t v23 = (void *)swift_allocObject();
    v23[2] = v18;
    v23[3] = v19;
    v23[4] = v20;
    sub_25F2FDE6C();
    uint64_t v30 = v18;
    swift_retain();
    swift_retain();
    uint64_t v31 = v20;
    swift_retain();
    sub_25F3F66D0();
    uint64_t v24 = v32;
    swift_bridgeObjectRelease();
    swift_release();
    swift_beginAccess();
    sub_25F3C88D8(v22, (uint64_t)v6);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v24) == 1)
    {
      swift_release();
      sub_25F38BFC8((uint64_t)v6);
      swift_beginAccess();
      uint64_t v25 = *(void *)(v19 + 16);
      swift_bridgeObjectRetain();
      swift_release();
      uint64_t result = swift_release();
      *uint64_t v39 = v25;
    }
    else
    {
      uint64_t v26 = (uint64_t)v29;
      sub_25F390FFC((uint64_t)v6, (uint64_t)v29);
      sub_25F2FE028();
      swift_allocError();
      sub_25F3072D8(v26, v27);
      swift_willThrow();
      swift_release();
      sub_25F391060(v26, type metadata accessor for TTSVBError);
      swift_release();
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_25F3C2098@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = sub_25F3F6170();
  MEMORY[0x270FA5388](v3 - 8);
  sub_25F3F6160();
  uint64_t result = sub_25F3F60D0();
  if (!v1)
  {
    *a1 = result;
    a1[1] = v5;
  }
  return result;
}

uint64_t sub_25F3C2130(uint64_t a1, uint64_t a2, unsigned char *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v52 = a5;
  uint64_t v53 = a3;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3988B0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for TTSVBError.Reason(0);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = swift_projectBox();
  uint64_t v13 = sub_25F3F6170();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v44 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25F3F6160();
  uint64_t v17 = sub_25F3F6140();
  unint64_t v19 = v18;
  uint64_t v20 = (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  if (v19 >> 60 == 15)
  {
    long long v54 = xmmword_25F3FF070;
    LOBYTE(v55) = 3;
    swift_storeEnumTagMultiPayload();
    type metadata accessor for TTSVBError(0);
    sub_25F2FE028();
    uint64_t v21 = (void *)swift_allocError();
    TTSVBError.init(_:_:_:)((uint64_t)&v54, (uint64_t)v11, 0, v22);
    swift_willThrow();
    sub_25F30CB70((uint64_t)&v54);
    long long v23 = v54;
    unsigned __int8 v24 = v55;
    long long v68 = v54;
    char v69 = v55;
    static TTSVBError.map(_:_:)(v21, (uint64_t)&v68, (uint64_t)v8);

    sub_25F307C20(v23, *((uint64_t *)&v23 + 1), v24);
    uint64_t v25 = type metadata accessor for TTSVBError(0);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v8, 0, 1, v25);
    swift_beginAccess();
    uint64_t result = sub_25F391D20((uint64_t)v8, v12);
    *uint64_t v53 = 1;
  }
  else
  {
    MEMORY[0x270FA5388](v20);
    *(&v44 - 4) = a4;
    *(&v44 - 3) = v17;
    *(&v44 - 2) = v19;
    static TTSVBError.perform<A>(_:errorTransform:)((void (*)(void))sub_25F3C973C, (uint64_t)(&v44 - 6), (void (*)(void *))sub_25F3C2638);
    uint64_t v27 = (char **)(v52 + 16);
    long long v28 = v54;
    uint64_t v29 = v55;
    uint64_t v30 = v56;
    uint64_t v31 = v57;
    uint64_t v32 = v58;
    uint64_t v51 = v59;
    uint64_t v50 = v60;
    uint64_t v49 = v61;
    uint64_t v48 = v62;
    uint64_t v47 = v63;
    uint64_t v46 = v64;
    uint64_t v33 = v65;
    uint64_t v45 = v66;
    uint64_t v44 = v67;
    swift_beginAccess();
    uint64_t v34 = *v27;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *uint64_t v27 = v34;
    uint64_t v53 = v31;
    uint64_t v52 = v32;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v34 = sub_25F3C3CE0(0, *((void *)v34 + 2) + 1, 1, v34);
      *uint64_t v27 = v34;
    }
    unint64_t v37 = *((void *)v34 + 2);
    unint64_t v36 = *((void *)v34 + 3);
    if (v37 >= v36 >> 1)
    {
      uint64_t v34 = sub_25F3C3CE0((char *)(v36 > 1), v37 + 1, 1, v34);
      *uint64_t v27 = v34;
    }
    *((void *)v34 + 2) = v37 + 1;
    char v38 = &v34[120 * v37];
    *((_OWORD *)v38 + 2) = v28;
    *((void *)v38 + 6) = v29;
    *((void *)v38 + 7) = v30;
    uint64_t v39 = v52;
    *((void *)v38 + 8) = v53;
    *((void *)v38 + 9) = v39;
    uint64_t v40 = v50;
    *((void *)v38 + 10) = v51;
    *((void *)v38 + 11) = v40;
    uint64_t v41 = v48;
    *((void *)v38 + 12) = v49;
    *((void *)v38 + 13) = v41;
    uint64_t v42 = v46;
    *((void *)v38 + 14) = v47;
    *((void *)v38 + 15) = v42;
    *((void *)v38 + 16) = v33;
    uint64_t v43 = v44;
    *((void *)v38 + 17) = v45;
    *((void *)v38 + 18) = v43;
    return sub_25F30737C(v17, v19);
  }
  return result;
}

uint64_t sub_25F3C2638@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for TTSVBError.Reason(0);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v6 = xmmword_25F3FF070;
  char v7 = 3;
  swift_storeEnumTagMultiPayload();
  return TTSVBError.init(_:_:_:)((uint64_t)&v6, (uint64_t)v4, 0, a1);
}

unint64_t TTSVBTrainingScript.description.getter()
{
  return 0xD000000000000010;
}

uint64_t static TTSVBTrainingScript.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  return sub_25F3C279C(*a1, *a2);
}

uint64_t sub_25F3C279C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (v2)
  {
    uint64_t v3 = a2;
    if (a1 != a2)
    {
      uint64_t v4 = 0;
      uint64_t v17 = a1;
      while (1)
      {
        uint64_t v6 = *(void *)(a1 + v4 + 48);
        uint64_t v5 = *(void *)(a1 + v4 + 56);
        uint64_t v7 = *(void *)(a1 + v4 + 64);
        uint64_t v33 = *(void *)(a1 + v4 + 80);
        uint64_t v34 = *(void *)(a1 + v4 + 72);
        uint64_t v32 = *(void *)(a1 + v4 + 88);
        uint64_t v29 = *(void *)(a1 + v4 + 104);
        uint64_t v30 = *(void *)(a1 + v4 + 96);
        uint64_t v26 = *(void *)(a1 + v4 + 112);
        uint64_t v24 = *(void *)(a1 + v4 + 120);
        double v8 = *(double *)(a1 + v4 + 128);
        uint64_t v21 = *(void *)(a1 + v4 + 144);
        uint64_t v22 = *(void *)(a1 + v4 + 136);
        uint64_t v10 = *(void *)(v3 + v4 + 48);
        uint64_t v9 = *(void *)(v3 + v4 + 56);
        uint64_t v11 = *(void *)(v3 + v4 + 64);
        uint64_t v12 = *(void *)(v3 + v4 + 72);
        uint64_t v13 = *(void *)(v3 + v4 + 80);
        uint64_t v31 = *(void *)(v3 + v4 + 88);
        uint64_t v27 = *(void *)(v3 + v4 + 104);
        uint64_t v28 = *(void *)(v3 + v4 + 96);
        uint64_t v25 = *(void *)(v3 + v4 + 112);
        uint64_t v23 = *(void *)(v3 + v4 + 120);
        double v14 = *(double *)(v3 + v4 + 128);
        uint64_t v19 = *(void *)(v3 + v4 + 144);
        uint64_t v20 = *(void *)(v3 + v4 + 136);
        if ((*(void *)(a1 + v4 + 32) != *(void *)(v3 + v4 + 32)
           || *(void *)(a1 + v4 + 40) != *(void *)(v3 + v4 + 40))
          && (sub_25F3F6B80() & 1) == 0)
        {
          break;
        }
        if ((v6 != v10 || v5 != v9) && (sub_25F3F6B80() & 1) == 0
          || (v7 != v11 || v34 != v12) && (sub_25F3F6B80() & 1) == 0
          || (v33 != v13 || v32 != v31) && (sub_25F3F6B80() & 1) == 0)
        {
          break;
        }
        if (v30 == v28 && v29 == v27)
        {
          uint64_t result = 0;
        }
        else
        {
          char v16 = sub_25F3F6B80();
          uint64_t result = 0;
          if ((v16 & 1) == 0) {
            return result;
          }
        }
        if (v26 != v25 || v24 != v23 || v8 != v14) {
          return result;
        }
        if ((v22 != v20 || v21 != v19) && (sub_25F3F6B80() & 1) == 0) {
          return 0;
        }
        v4 += 120;
        --v2;
        a1 = v17;
        uint64_t v3 = a2;
        if (!v2) {
          return 1;
        }
      }
      return 0;
    }
  }
  return 1;
}

uint64_t sub_25F3C29D0()
{
  return 0;
}

uint64_t sub_25F3C2A84(uint64_t *a1, uint64_t *a2)
{
  return sub_25F3C279C(*a1, *a2);
}

uint64_t TTSVBTrainingBook.TTSVBTrainingParagraph.paragraphIndex.getter()
{
  uint64_t v1 = *v0;
  if (*(void *)(v1 + 16) && (unint64_t v2 = sub_25F3C3DFC(0), (v3 & 1) != 0)) {
    return *(void *)(*(void *)(v1 + 56) + 120 * v2 + 80);
  }
  else {
    return -1;
  }
}

unint64_t sub_25F3C2AE0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DA40);
  unint64_t v2 = (void *)sub_25F3F69B0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (_OWORD *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *((void *)v4 - 3);
    uint64_t v6 = *((void *)v4 - 2);
    uint64_t v7 = *((void *)v4 - 1);
    long long v15 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_25F322920(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v10 = v5;
    v10[1] = v6;
    uint64_t v11 = v2[7] + 24 * result;
    *(void *)uint64_t v11 = v7;
    *(_OWORD *)(v11 + 8) = v15;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    uint64_t v4 = (_OWORD *)((char *)v4 + 40);
    v2[2] = v14;
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

uint64_t TTSVBTrainingBook.TTSVBTrainingParagraph.items.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain_n();
  unint64_t v2 = sub_25F3C3F60(v1);
  swift_bridgeObjectRelease();
  uint64_t v4 = v2;
  sub_25F3C3EDC((uint64_t *)&v4, (uint64_t (*)(uint64_t))sub_25F3C8568, sub_25F3C4238);
  swift_bridgeObjectRelease();
  return (uint64_t)v4;
}

uint64_t TTSVBTrainingBook.TTSVBTrainingParagraph.hash(into:)(uint64_t a1)
{
  uint64_t v3 = *v1;
  swift_bridgeObjectRetain();
  sub_25F3C7AC4(a1, v3);

  return swift_bridgeObjectRelease();
}

uint64_t static TTSVBTrainingBook.TTSVBTrainingParagraph.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  return sub_25F3C2EC8(*a1, *a2);
}

uint64_t sub_25F3C2D28(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  uint64_t v2 = result;
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v3 = 0;
  uint64_t v4 = result + 64;
  uint64_t v5 = 1 << *(unsigned char *)(result + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(result + 64);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  while (1)
  {
    if (v7)
    {
      unint64_t v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v10 = v9 | (v3 << 6);
      goto LABEL_22;
    }
    int64_t v11 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v11 >= v8) {
      return 1;
    }
    unint64_t v12 = *(void *)(v4 + 8 * v11);
    ++v3;
    if (!v12)
    {
      int64_t v3 = v11 + 1;
      if (v11 + 1 >= v8) {
        return 1;
      }
      unint64_t v12 = *(void *)(v4 + 8 * v3);
      if (!v12)
      {
        int64_t v3 = v11 + 2;
        if (v11 + 2 >= v8) {
          return 1;
        }
        unint64_t v12 = *(void *)(v4 + 8 * v3);
        if (!v12) {
          break;
        }
      }
    }
LABEL_21:
    unint64_t v7 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v3 << 6);
LABEL_22:
    uint64_t v14 = 8 * v10;
    uint64_t v15 = *(void *)(*(void *)(v2 + 56) + v14);
    sub_25F3C3DFC(*(void *)(*(void *)(v2 + 48) + v14));
    if (v16)
    {
      swift_bridgeObjectRetain();
      uint64_t v17 = swift_bridgeObjectRetain();
      char v18 = sub_25F3C2EC8(v17, v15);
      swift_bridgeObjectRelease();
      unint64_t result = swift_bridgeObjectRelease();
      if (v18) {
        continue;
      }
    }
    return 0;
  }
  int64_t v13 = v11 + 3;
  if (v13 >= v8) {
    return 1;
  }
  unint64_t v12 = *(void *)(v4 + 8 * v13);
  if (v12)
  {
    int64_t v3 = v13;
    goto LABEL_21;
  }
  while (1)
  {
    int64_t v3 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v3 >= v8) {
      return 1;
    }
    unint64_t v12 = *(void *)(v4 + 8 * v3);
    ++v13;
    if (v12) {
      goto LABEL_21;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_25F3C2EC8(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v2 = 0;
  uint64_t v43 = result + 64;
  uint64_t v3 = 1 << *(unsigned char *)(result + 32);
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  unint64_t v5 = v4 & *(void *)(result + 64);
  int64_t v44 = (unint64_t)(v3 + 63) >> 6;
  uint64_t v45 = result;
  while (1)
  {
    if (v5)
    {
      uint64_t v48 = (v5 - 1) & v5;
      int64_t v49 = v2;
      unint64_t v7 = __clz(__rbit64(v5)) | (v2 << 6);
      goto LABEL_24;
    }
    int64_t v8 = v2 + 1;
    if (__OFADD__(v2, 1))
    {
      __break(1u);
      goto LABEL_50;
    }
    if (v8 >= v44) {
      return 1;
    }
    unint64_t v9 = *(void *)(v43 + 8 * v8);
    int64_t v10 = v2 + 1;
    if (!v9)
    {
      int64_t v10 = v2 + 2;
      if (v2 + 2 >= v44) {
        return 1;
      }
      unint64_t v9 = *(void *)(v43 + 8 * v10);
      if (!v9)
      {
        int64_t v10 = v2 + 3;
        if (v2 + 3 >= v44) {
          return 1;
        }
        unint64_t v9 = *(void *)(v43 + 8 * v10);
        if (!v9) {
          break;
        }
      }
    }
LABEL_23:
    uint64_t v48 = (v9 - 1) & v9;
    int64_t v49 = v10;
    unint64_t v7 = __clz(__rbit64(v9)) + (v10 << 6);
LABEL_24:
    uint64_t v12 = *(void *)(*(void *)(result + 48) + 8 * v7);
    uint64_t v13 = *(void *)(result + 56) + 120 * v7;
    uint64_t v15 = *(void *)v13;
    uint64_t v14 = *(void *)(v13 + 8);
    uint64_t v17 = *(void *)(v13 + 16);
    uint64_t v16 = *(void *)(v13 + 24);
    uint64_t v19 = *(void *)(v13 + 32);
    uint64_t v18 = *(void *)(v13 + 40);
    uint64_t v21 = *(void *)(v13 + 48);
    uint64_t v20 = *(void *)(v13 + 56);
    uint64_t v22 = *(void *)(v13 + 64);
    uint64_t v23 = *(void *)(v13 + 72);
    uint64_t v24 = *(void *)(v13 + 96);
    uint64_t v25 = *(void *)(v13 + 104);
    uint64_t v26 = *(void *)(v13 + 112);
    long long v27 = *(_OWORD *)(v13 + 80);
    v65[0] = v12;
    v65[1] = v15;
    v65[2] = v14;
    v65[3] = v17;
    v65[4] = v16;
    v65[5] = v19;
    v65[6] = v18;
    v65[7] = v21;
    v65[8] = v20;
    v65[9] = v22;
    v65[10] = v23;
    long long v66 = v27;
    uint64_t v67 = v24;
    uint64_t v68 = v25;
    uint64_t v69 = v26;
    nullsub_1(v65);
    sub_25F3C965C((uint64_t)v65, (uint64_t)v70);
    uint64_t v28 = v70[1];
    uint64_t v29 = v70[3];
    uint64_t v64 = v70[2];
    uint64_t v30 = v70[5];
    uint64_t v63 = v70[4];
    uint64_t v31 = v70[7];
    uint64_t v62 = v70[6];
    uint64_t v32 = v70[9];
    uint64_t v61 = v70[8];
    uint64_t v33 = v70[11];
    uint64_t v60 = v70[10];
    uint64_t v55 = v70[12];
    double v34 = *(double *)&v70[13];
    uint64_t v54 = v70[14];
    uint64_t v57 = v70[15];
    unint64_t v35 = sub_25F3C3DFC(v70[0]);
    if ((v36 & 1) == 0) {
      goto LABEL_47;
    }
    uint64_t v37 = *(void *)(a2 + 56) + 120 * v35;
    uint64_t v38 = *(void *)(v37 + 16);
    uint64_t v39 = *(void *)(v37 + 24);
    uint64_t v40 = *(void *)(v37 + 32);
    uint64_t v41 = *(void *)(v37 + 40);
    uint64_t v58 = *(void *)(v37 + 56);
    uint64_t v59 = *(void *)(v37 + 48);
    uint64_t v52 = *(void *)(v37 + 72);
    uint64_t v53 = *(void *)(v37 + 64);
    uint64_t v50 = *(void *)(v37 + 88);
    uint64_t v51 = *(void *)(v37 + 80);
    double v42 = *(double *)(v37 + 96);
    uint64_t v46 = *(void *)(v37 + 112);
    uint64_t v47 = *(void *)(v37 + 104);
    if ((*(void *)v37 != v28 || *(void *)(v37 + 8) != v64) && (sub_25F3F6B80() & 1) == 0) {
      goto LABEL_47;
    }
    if ((v38 != v29 || v39 != v63) && (sub_25F3F6B80() & 1) == 0
      || (v40 != v30 || v41 != v62) && (sub_25F3F6B80() & 1) == 0
      || (v59 != v31 || v58 != v61) && (sub_25F3F6B80() & 1) == 0
      || (v53 != v32 || v52 != v60) && (sub_25F3F6B80() & 1) == 0
      || v51 != v33
      || v50 != v55
      || v42 != v34)
    {
LABEL_47:
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return 0;
    }
    if (v47 == v54 && v46 == v57)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      char v6 = sub_25F3F6B80();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v6 & 1) == 0) {
        return 0;
      }
    }
    unint64_t result = v45;
    unint64_t v5 = v48;
    int64_t v2 = v49;
  }
  uint64_t v11 = v2 + 4;
  if (v2 + 4 >= v44) {
    return 1;
  }
  unint64_t v9 = *(void *)(v43 + 8 * v11);
  if (v9)
  {
    int64_t v10 = v2 + 4;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v10 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      break;
    }
    if (v10 >= v44) {
      return 1;
    }
    unint64_t v9 = *(void *)(v43 + 8 * v10);
    ++v11;
    if (v9) {
      goto LABEL_23;
    }
  }
LABEL_50:
  __break(1u);
  return result;
}

uint64_t TTSVBTrainingBook.TTSVBTrainingParagraph.hashValue.getter()
{
  uint64_t v1 = *v0;
  sub_25F3F6C20();
  sub_25F3C7AC4((uint64_t)v3, v1);
  return sub_25F3F6C70();
}

uint64_t sub_25F3C342C()
{
  uint64_t v1 = *v0;
  sub_25F3F6C20();
  sub_25F3C7AC4((uint64_t)v3, v1);
  return sub_25F3F6C70();
}

uint64_t sub_25F3C3474(uint64_t a1)
{
  return sub_25F3C7AC4(a1, *v1);
}

uint64_t sub_25F3C347C()
{
  uint64_t v1 = *v0;
  sub_25F3F6C20();
  sub_25F3C7AC4((uint64_t)v3, v1);
  return sub_25F3F6C70();
}

BOOL sub_25F3C34C4(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v4 = *a2;
  uint64_t v5 = v2;
  return !_s31TextToSpeechVoiceBankingSupport17TTSVBTrainingBookV0G9ParagraphV1loiySbAE_AEtFZ_0(&v4, &v5);
}

BOOL sub_25F3C3500(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v4 = *a2;
  uint64_t v5 = v2;
  return !_s31TextToSpeechVoiceBankingSupport17TTSVBTrainingBookV0G9ParagraphV1loiySbAE_AEtFZ_0(&v5, &v4);
}

BOOL sub_25F3C353C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v4 = *a2;
  uint64_t v5 = v2;
  return _s31TextToSpeechVoiceBankingSupport17TTSVBTrainingBookV0G9ParagraphV1loiySbAE_AEtFZ_0(&v4, &v5);
}

uint64_t sub_25F3C3574(uint64_t *a1, uint64_t *a2)
{
  return sub_25F3C2EC8(*a1, *a2);
}

uint64_t TTSVBTrainingBook.paragraphsByIndex.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t TTSVBTrainingBook.paragraphsByIndex.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t (*TTSVBTrainingBook.paragraphsByIndex.modify())()
{
  return nullsub_1;
}

uint64_t TTSVBTrainingBook.paragraphs.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain_n();
  uint64_t v2 = sub_25F3C4058(v1);
  swift_bridgeObjectRelease();
  uint64_t v4 = v2;
  sub_25F3C3EDC((uint64_t *)&v4, (uint64_t (*)(uint64_t))sub_25F3C857C, sub_25F3C4A14);
  swift_bridgeObjectRelease();
  return (uint64_t)v4;
}

uint64_t TTSVBTrainingBook.id.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t static TTSVBTrainingBook.booksWithScriptItems(_:)(uint64_t a1)
{
  unint64_t v2 = sub_25F3C2AE0(MEMORY[0x263F8EE78]);
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = 32;
    uint64_t v27 = a1;
    while (1)
    {
      long long v10 = *(_OWORD *)(a1 + v4 + 80);
      long long v31 = *(_OWORD *)(a1 + v4 + 64);
      long long v32 = v10;
      long long v33 = *(_OWORD *)(a1 + v4 + 96);
      uint64_t v34 = *(void *)(a1 + v4 + 112);
      long long v11 = *(_OWORD *)(a1 + v4 + 48);
      v30[2] = *(_OWORD *)(a1 + v4 + 32);
      v30[3] = v11;
      long long v12 = *(_OWORD *)(a1 + v4 + 16);
      v30[0] = *(_OWORD *)(a1 + v4);
      v30[1] = v12;
      long long v13 = v31;
      uint64_t v14 = *(void *)(v2 + 16);
      sub_25F3C8C48((uint64_t)v30);
      if (v14)
      {
        swift_bridgeObjectRetain();
        unint64_t v15 = sub_25F322920(v13, *((uint64_t *)&v13 + 1));
        if (v16)
        {
          uint64_t v17 = (uint64_t *)(*(void *)(v2 + 56) + 24 * v15);
          uint64_t v18 = v17[1];
          uint64_t v28 = *v17;
          unint64_t v19 = v17[2];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          goto LABEL_10;
        }
        swift_bridgeObjectRelease();
      }
      unint64_t v19 = sub_25F3C8B48(MEMORY[0x263F8EE78]);
      swift_bridgeObjectRetain();
      uint64_t v18 = *((void *)&v13 + 1);
      uint64_t v28 = v13;
LABEL_10:
      uint64_t v20 = v32;
      if (*(void *)(v19 + 16) && (unint64_t v21 = sub_25F3C3DFC(v32), (v22 & 1) != 0))
      {
        unint64_t v5 = *(void *)(*(void *)(v19 + 56) + 8 * v21);
        swift_bridgeObjectRetain();
      }
      else
      {
        unint64_t v5 = sub_25F3C89D8(MEMORY[0x263F8EE78]);
      }
      uint64_t v6 = *((void *)&v32 + 1);
      sub_25F3C8C48((uint64_t)v30);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      sub_25F3C6EA8((uint64_t)v30, v6, isUniquelyReferenced_nonNull_native);
      swift_bridgeObjectRelease();
      char v8 = swift_isUniquelyReferenced_nonNull_native();
      sub_25F3C6D6C(v5, v20, v8);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      char v9 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v29 = (void *)v2;
      sub_25F3C6BCC(v28, v18, v19, v13, *((uint64_t *)&v13 + 1), v9);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_25F3C8CC0((uint64_t)v30);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v4 += 120;
      --v3;
      a1 = v27;
      if (!v3)
      {
        swift_bridgeObjectRelease();
        break;
      }
    }
  }
  uint64_t v23 = swift_bridgeObjectRetain();
  uint64_t v24 = sub_25F3C4140(v23);
  swift_bridgeObjectRelease();
  uint64_t v29 = v24;
  swift_retain();
  sub_25F3C3EDC((uint64_t *)&v29, (uint64_t (*)(uint64_t))sub_25F3C8590, sub_25F3C51A4);
  swift_release();
  uint64_t v25 = (uint64_t)v29;
  swift_bridgeObjectRelease();
  return v25;
}

uint64_t TTSVBTrainingBook.hash(into:)(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 16);
  swift_bridgeObjectRetain();
  sub_25F3F61A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25F3C7928(a1, v3);

  return swift_bridgeObjectRelease();
}

uint64_t static TTSVBTrainingBook.== infix(_:_:)(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a2[2];
  BOOL v4 = *a1 == *a2 && a1[1] == a2[1];
  if (!v4 && (sub_25F3F6B80() & 1) == 0) {
    return 0;
  }

  return sub_25F3C2D28(v2, v3);
}

uint64_t TTSVBTrainingBook.hashValue.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  sub_25F3F6C20();
  swift_bridgeObjectRetain();
  sub_25F3F61A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25F3C7928((uint64_t)v3, v1);
  swift_bridgeObjectRelease();
  return sub_25F3F6C70();
}

uint64_t sub_25F3C3AF0()
{
  uint64_t v1 = *(void *)(v0 + 16);
  sub_25F3F6C20();
  swift_bridgeObjectRetain();
  sub_25F3F61A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25F3C7928((uint64_t)v3, v1);
  swift_bridgeObjectRelease();
  return sub_25F3F6C70();
}

uint64_t sub_25F3C3B74(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 16);
  swift_bridgeObjectRetain();
  sub_25F3F61A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25F3C7928(a1, v3);

  return swift_bridgeObjectRelease();
}

uint64_t sub_25F3C3BEC()
{
  uint64_t v1 = *(void *)(v0 + 16);
  sub_25F3F6C20();
  swift_bridgeObjectRetain();
  sub_25F3F61A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25F3C7928((uint64_t)v3, v1);
  swift_bridgeObjectRelease();
  return sub_25F3F6C70();
}

uint64_t sub_25F3C3C6C(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a2[2];
  BOOL v4 = *a1 == *a2 && a1[1] == a2[1];
  if (!v4 && (sub_25F3F6B80() & 1) == 0) {
    return 0;
  }

  return sub_25F3C2D28(v2, v3);
}

char *sub_25F3C3CE0(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DA68);
    long long v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 120);
  }
  else
  {
    long long v10 = (char *)MEMORY[0x263F8EE78];
  }
  long long v12 = v10 + 32;
  long long v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[120 * v8]) {
      memmove(v12, v13, 120 * v8);
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

unint64_t sub_25F3C3DFC(uint64_t a1)
{
  uint64_t v2 = sub_25F3F6C10();

  return sub_25F3C3E40(a1, v2);
}

unint64_t sub_25F3C3E40(uint64_t a1, uint64_t a2)
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

uint64_t sub_25F3C3EDC(uint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t (*a3)(void *))
{
  uint64_t v6 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v6 = a2(v6);
  }
  uint64_t v7 = *(void *)(v6 + 16);
  v9[0] = v6 + 32;
  v9[1] = v7;
  uint64_t result = a3(v9);
  *a1 = v6;
  return result;
}

void *sub_25F3C3F60(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DA68);
  uint64_t v3 = (void *)swift_allocObject();
  size_t v4 = _swift_stdlib_malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 120);
  uint64_t v5 = sub_25F3C7E7C(&v7, (uint64_t)(v3 + 4), v1, a1);
  swift_bridgeObjectRetain();
  sub_25F37C120();
  if (v5 != (void *)v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

void *sub_25F3C4058(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DA58);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 25;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 3);
  uint64_t v6 = sub_25F3C814C((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_25F37C120();
  if (v6 != v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

void *sub_25F3C4140(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DA38);
  uint64_t v3 = (void *)swift_allocObject();
  size_t v4 = _swift_stdlib_malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 24);
  uint64_t v5 = sub_25F3C8348(&v7, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_25F37C120();
  if (v5 != (void *)v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

uint64_t sub_25F3C4238(void *a1)
{
  uint64_t v2 = a1;
  uint64_t v3 = a1[1];
  uint64_t result = sub_25F3F6B50();
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_139;
    }
    if ((unint64_t)v3 >= 2)
    {
      uint64_t v94 = 0;
      uint64_t v95 = *v2;
      for (uint64_t i = 1; i != v3; ++i)
      {
        uint64_t v97 = *(void *)(v95 + 120 * i + 88);
        uint64_t v98 = v94;
        do
        {
          uint64_t v99 = v95 + v98;
          if (v97 >= *(void *)(v95 + v98 + 88)) {
            break;
          }
          if (!v95) {
            goto LABEL_143;
          }
          uint64_t v100 = *(void *)(v99 + 120);
          uint64_t v101 = v95 + v98;
          long long v102 = *(_OWORD *)(v95 + v98 + 128);
          long long v103 = *(_OWORD *)(v95 + v98 + 144);
          long long v104 = *(_OWORD *)(v95 + v98 + 160);
          long long v105 = *(_OWORD *)(v95 + v98 + 176);
          uint64_t v106 = *(void *)(v95 + v98 + 192);
          uint64_t result = *(void *)(v95 + v98 + 200);
          uint64_t v107 = *(void *)(v95 + v98 + 216);
          uint64_t v108 = *(void *)(v95 + v98 + 224);
          uint64_t v109 = *(void *)(v95 + v98 + 232);
          long long v110 = *(_OWORD *)(v99 + 80);
          *(_OWORD *)(v99 + 184) = *(_OWORD *)(v99 + 64);
          *(_OWORD *)(v99 + 200) = v110;
          *(_OWORD *)(v99 + 216) = *(_OWORD *)(v99 + 96);
          *(void *)(v99 + 232) = *(void *)(v99 + 112);
          long long v111 = *(_OWORD *)(v99 + 16);
          *(_OWORD *)(v99 + 120) = *(_OWORD *)v99;
          *(_OWORD *)(v99 + 136) = v111;
          long long v112 = *(_OWORD *)(v99 + 48);
          *(_OWORD *)(v99 + 152) = *(_OWORD *)(v99 + 32);
          *(_OWORD *)(v99 + 168) = v112;
          *(void *)uint64_t v101 = v100;
          *(_OWORD *)(v101 + 8) = v102;
          *(_OWORD *)(v101 + 24) = v103;
          *(_OWORD *)(v101 + 40) = v104;
          *(_OWORD *)(v101 + 56) = v105;
          *(void *)(v101 + 72) = v106;
          *(void *)(v101 + 80) = result;
          *(void *)(v99 + 88) = v97;
          *(void *)(v101 + 96) = v107;
          v98 -= 120;
          *(void *)(v101 + 104) = v108;
          *(void *)(v101 + 112) = v109;
        }
        while (v98 != -120);
        v94 += 120;
      }
    }
  }
  else
  {
    if (v3 >= 0) {
      uint64_t v5 = v3;
    }
    else {
      uint64_t v5 = v3 + 1;
    }
    if (v3 < -1) {
      goto LABEL_138;
    }
    uint64_t v123 = result;
    uint64_t v134 = v1;
    if (v3 > 1)
    {
      uint64_t v6 = v5 >> 1;
      uint64_t result = sub_25F3F6340();
      *(void *)(result + 16) = v6;
      uint64_t v122 = result;
      v132 = (char *)(result + 32);
LABEL_13:
      uint64_t v8 = 0;
      uint64_t v121 = v2;
      uint64_t v9 = *v2;
      uint64_t v133 = MEMORY[0x263F8EE78];
      uint64_t v124 = v3;
      while (1)
      {
        uint64_t v11 = v8++;
        if (v8 < v3)
        {
          uint64_t v12 = *(void *)(v9 + 120 * v8 + 88);
          uint64_t v13 = *(void *)(v9 + 120 * v11 + 88);
          uint64_t v8 = v11 + 2;
          if (v11 + 2 < v3)
          {
            uint64_t v14 = (uint64_t *)(v9 + 328 + 120 * v11);
            uint64_t v15 = v12;
            while (1)
            {
              uint64_t v17 = *v14;
              v14 += 15;
              uint64_t v16 = v17;
              if (v12 < v13 == v17 >= v15) {
                break;
              }
              ++v8;
              uint64_t v15 = v16;
              if (v3 == v8)
              {
                uint64_t v8 = v3;
                break;
              }
            }
          }
          if (v12 < v13)
          {
            if (v8 < v11) {
              goto LABEL_140;
            }
            if (v11 < v8)
            {
              uint64_t v18 = 120 * v8;
              uint64_t v19 = v8;
              uint64_t v20 = v11;
              uint64_t v120 = v11;
              uint64_t v21 = 120 * v11;
              do
              {
                if (v20 != --v19)
                {
                  if (!v9) {
                    goto LABEL_146;
                  }
                  uint64_t v22 = v9 + v18;
                  long long v128 = *(_OWORD *)(v9 + v21 + 16);
                  long long v129 = *(_OWORD *)(v9 + v21);
                  long long v126 = *(_OWORD *)(v9 + v21 + 48);
                  long long v127 = *(_OWORD *)(v9 + v21 + 32);
                  uint64_t v23 = *(void *)(v9 + v21 + 64);
                  uint64_t v24 = *(void *)(v9 + v21 + 72);
                  uint64_t v25 = *(void *)(v9 + v21 + 96);
                  uint64_t v130 = *(void *)(v9 + v21 + 112);
                  uint64_t v131 = *(void *)(v9 + v21 + 104);
                  long long v125 = *(_OWORD *)(v9 + v21 + 80);
                  uint64_t result = (uint64_t)memmove((void *)(v9 + v21), (const void *)(v9 + v18 - 120), 0x78uLL);
                  *(_OWORD *)(v22 - 120) = v129;
                  *(_OWORD *)(v22 - 104) = v128;
                  *(_OWORD *)(v22 - 88) = v127;
                  *(_OWORD *)(v22 - 72) = v126;
                  *(void *)(v22 - 56) = v23;
                  *(void *)(v22 - 48) = v24;
                  *(_OWORD *)(v22 - 40) = v125;
                  *(void *)(v22 - 24) = v25;
                  *(void *)(v22 - 16) = v131;
                  *(void *)(v22 - 8) = v130;
                }
                ++v20;
                v18 -= 120;
                v21 += 120;
              }
              while (v20 < v19);
              uint64_t v3 = v124;
              uint64_t v11 = v120;
            }
          }
        }
        if (v8 >= v3) {
          goto LABEL_39;
        }
        if (__OFSUB__(v8, v11)) {
          goto LABEL_137;
        }
        if (v8 - v11 >= v123) {
          goto LABEL_39;
        }
        uint64_t v26 = v11 + v123;
        if (__OFADD__(v11, v123)) {
          goto LABEL_141;
        }
        if (v26 >= v3) {
          uint64_t v26 = v3;
        }
        if (v26 < v11)
        {
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
          return result;
        }
        if (v8 == v26)
        {
LABEL_39:
          uint64_t v27 = v133;
          if (v8 < v11) {
            goto LABEL_132;
          }
        }
        else
        {
          uint64_t v77 = v9 + 112 + 120 * v8;
          uint64_t v27 = v133;
          do
          {
            uint64_t v78 = *(void *)(v9 + 120 * v8 + 88);
            uint64_t v79 = v11;
            uint64_t v80 = (void *)v77;
            do
            {
              if (v78 >= *(v80 - 18)) {
                break;
              }
              if (!v9) {
                goto LABEL_144;
              }
              uint64_t v81 = v80 - 14;
              uint64_t v82 = *(v80 - 14);
              uint64_t v83 = *(v80 - 13);
              long long v84 = *((_OWORD *)v80 - 6);
              long long v85 = *((_OWORD *)v80 - 5);
              long long v86 = *((_OWORD *)v80 - 4);
              long long v87 = *((_OWORD *)v80 - 3);
              uint64_t v88 = *(v80 - 4);
              uint64_t v89 = *(v80 - 2);
              uint64_t v90 = *(v80 - 1);
              uint64_t result = *v80;
              long long v91 = *(_OWORD *)(v80 - 19);
              v81[4] = *(_OWORD *)(v80 - 21);
              v81[5] = v91;
              v81[6] = *(_OWORD *)(v80 - 17);
              *uint64_t v80 = *(v80 - 15);
              long long v92 = *(_OWORD *)(v80 - 27);
              *uint64_t v81 = *(_OWORD *)(v80 - 29);
              v81[1] = v92;
              long long v93 = *(_OWORD *)(v80 - 23);
              v81[2] = *(_OWORD *)(v80 - 25);
              v81[3] = v93;
              *(v80 - 15) = result;
              v80 -= 15;
              *(v80 - 14) = v82;
              *(v80 - 13) = v83;
              *((_OWORD *)v80 - 6) = v84;
              *((_OWORD *)v80 - 5) = v85;
              *((_OWORD *)v80 - 4) = v86;
              *((_OWORD *)v80 - 3) = v87;
              *(v80 - 4) = v88;
              *(v80 - 3) = v78;
              *(v80 - 2) = v89;
              ++v79;
              *(v80 - 1) = v90;
            }
            while (v8 != v79);
            ++v8;
            v77 += 120;
          }
          while (v8 != v26);
          uint64_t v8 = v26;
          if (v26 < v11) {
            goto LABEL_132;
          }
        }
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          uint64_t result = (uint64_t)sub_25F394790(0, *(void *)(v27 + 16) + 1, 1, (char *)v27);
          uint64_t v27 = result;
        }
        unint64_t v29 = *(void *)(v27 + 16);
        unint64_t v28 = *(void *)(v27 + 24);
        unint64_t v10 = v29 + 1;
        if (v29 >= v28 >> 1)
        {
          uint64_t result = (uint64_t)sub_25F394790((char *)(v28 > 1), v29 + 1, 1, (char *)v27);
          uint64_t v27 = result;
        }
        *(void *)(v27 + 16) = v10;
        uint64_t v30 = v27 + 32;
        long long v31 = (uint64_t *)(v27 + 32 + 16 * v29);
        uint64_t *v31 = v11;
        v31[1] = v8;
        uint64_t v133 = v27;
        if (v29)
        {
          while (1)
          {
            unint64_t v32 = v10 - 1;
            if (v10 >= 4)
            {
              unint64_t v37 = v30 + 16 * v10;
              uint64_t v38 = *(void *)(v37 - 64);
              uint64_t v39 = *(void *)(v37 - 56);
              BOOL v43 = __OFSUB__(v39, v38);
              uint64_t v40 = v39 - v38;
              if (v43) {
                goto LABEL_121;
              }
              uint64_t v42 = *(void *)(v37 - 48);
              uint64_t v41 = *(void *)(v37 - 40);
              BOOL v43 = __OFSUB__(v41, v42);
              uint64_t v35 = v41 - v42;
              char v36 = v43;
              if (v43) {
                goto LABEL_122;
              }
              unint64_t v44 = v10 - 2;
              uint64_t v45 = (uint64_t *)(v30 + 16 * (v10 - 2));
              uint64_t v47 = *v45;
              uint64_t v46 = v45[1];
              BOOL v43 = __OFSUB__(v46, v47);
              uint64_t v48 = v46 - v47;
              if (v43) {
                goto LABEL_123;
              }
              BOOL v43 = __OFADD__(v35, v48);
              uint64_t v49 = v35 + v48;
              if (v43) {
                goto LABEL_125;
              }
              if (v49 >= v40)
              {
                uint64_t v67 = (uint64_t *)(v30 + 16 * v32);
                uint64_t v69 = *v67;
                uint64_t v68 = v67[1];
                BOOL v43 = __OFSUB__(v68, v69);
                uint64_t v70 = v68 - v69;
                if (v43) {
                  goto LABEL_131;
                }
                BOOL v60 = v35 < v70;
                goto LABEL_76;
              }
            }
            else
            {
              if (v10 != 3)
              {
                uint64_t v61 = *(void *)(v27 + 32);
                uint64_t v62 = *(void *)(v27 + 40);
                BOOL v43 = __OFSUB__(v62, v61);
                uint64_t v54 = v62 - v61;
                char v55 = v43;
                goto LABEL_70;
              }
              uint64_t v34 = *(void *)(v27 + 32);
              uint64_t v33 = *(void *)(v27 + 40);
              BOOL v43 = __OFSUB__(v33, v34);
              uint64_t v35 = v33 - v34;
              char v36 = v43;
            }
            if (v36) {
              goto LABEL_124;
            }
            unint64_t v44 = v10 - 2;
            uint64_t v50 = (uint64_t *)(v30 + 16 * (v10 - 2));
            uint64_t v52 = *v50;
            uint64_t v51 = v50[1];
            BOOL v53 = __OFSUB__(v51, v52);
            uint64_t v54 = v51 - v52;
            char v55 = v53;
            if (v53) {
              goto LABEL_126;
            }
            uint64_t v56 = (uint64_t *)(v30 + 16 * v32);
            uint64_t v58 = *v56;
            uint64_t v57 = v56[1];
            BOOL v43 = __OFSUB__(v57, v58);
            uint64_t v59 = v57 - v58;
            if (v43) {
              goto LABEL_128;
            }
            if (__OFADD__(v54, v59)) {
              goto LABEL_130;
            }
            if (v54 + v59 >= v35)
            {
              BOOL v60 = v35 < v59;
LABEL_76:
              if (v60) {
                unint64_t v32 = v44;
              }
              goto LABEL_78;
            }
LABEL_70:
            if (v55) {
              goto LABEL_127;
            }
            uint64_t v63 = (uint64_t *)(v30 + 16 * v32);
            uint64_t v65 = *v63;
            uint64_t v64 = v63[1];
            BOOL v43 = __OFSUB__(v64, v65);
            uint64_t v66 = v64 - v65;
            if (v43) {
              goto LABEL_129;
            }
            if (v66 < v54) {
              goto LABEL_15;
            }
LABEL_78:
            unint64_t v71 = v32 - 1;
            if (v32 - 1 >= v10)
            {
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
LABEL_140:
              __break(1u);
LABEL_141:
              __break(1u);
              goto LABEL_142;
            }
            if (!v9) {
              goto LABEL_145;
            }
            char v72 = (uint64_t *)(v30 + 16 * v71);
            uint64_t v73 = *v72;
            v74 = (void *)(v30 + 16 * v32);
            uint64_t v75 = v74[1];
            uint64_t result = sub_25F3C5A80((char *)(v9 + 120 * *v72), (char *)(v9 + 120 * *v74), v9 + 120 * v75, v132);
            if (v134) {
              goto LABEL_95;
            }
            if (v75 < v73) {
              goto LABEL_118;
            }
            if (v32 > *(void *)(v133 + 16)) {
              goto LABEL_119;
            }
            *char v72 = v73;
            *(void *)(v30 + 16 * v71 + 8) = v75;
            unint64_t v76 = *(void *)(v133 + 16);
            if (v32 >= v76) {
              goto LABEL_120;
            }
            uint64_t v27 = v133;
            unint64_t v10 = v76 - 1;
            uint64_t result = (uint64_t)memmove((void *)(v30 + 16 * v32), v74 + 2, 16 * (v76 - 1 - v32));
            *(void *)(v133 + 16) = v76 - 1;
            if (v76 <= 2) {
              goto LABEL_15;
            }
          }
        }
        unint64_t v10 = 1;
LABEL_15:
        uint64_t v3 = v124;
        if (v8 >= v124)
        {
          uint64_t v7 = v122;
          uint64_t result = v133;
          uint64_t v2 = v121;
          goto LABEL_104;
        }
      }
    }
    uint64_t v7 = MEMORY[0x263F8EE78];
    v132 = (char *)(MEMORY[0x263F8EE78] + 32);
    if (v3 == 1)
    {
      uint64_t v122 = MEMORY[0x263F8EE78];
      goto LABEL_13;
    }
    unint64_t v10 = *(void *)(MEMORY[0x263F8EE78] + 16);
    uint64_t result = MEMORY[0x263F8EE78];
LABEL_104:
    uint64_t v122 = v7;
    if (v10 >= 2)
    {
      uint64_t v113 = *v2;
      do
      {
        unint64_t v114 = v10 - 2;
        if (v10 < 2) {
          goto LABEL_133;
        }
        if (!v113) {
          goto LABEL_147;
        }
        uint64_t v115 = result;
        uint64_t v116 = *(void *)(result + 32 + 16 * v114);
        uint64_t v117 = *(void *)(result + 32 + 16 * (v10 - 1) + 8);
        uint64_t result = sub_25F3C5A80((char *)(v113 + 120 * v116), (char *)(v113 + 120 * *(void *)(result + 32 + 16 * (v10 - 1))), v113 + 120 * v117, v132);
        if (v134) {
          break;
        }
        if (v117 < v116) {
          goto LABEL_134;
        }
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          uint64_t result = (uint64_t)sub_25F394970(v115);
          uint64_t v115 = result;
        }
        if (v114 >= *(void *)(v115 + 16)) {
          goto LABEL_135;
        }
        uint64_t v118 = (void *)(v115 + 32 + 16 * v114);
        *uint64_t v118 = v116;
        v118[1] = v117;
        unint64_t v119 = *(void *)(v115 + 16);
        if (v10 > v119) {
          goto LABEL_136;
        }
        memmove((void *)(v115 + 32 + 16 * (v10 - 1)), (const void *)(v115 + 32 + 16 * v10), 16 * (v119 - v10));
        uint64_t result = v115;
        *(void *)(v115 + 16) = v119 - 1;
        unint64_t v10 = v119 - 1;
      }
      while (v119 > 2);
    }
LABEL_95:
    swift_bridgeObjectRelease();
    *(void *)(v122 + 16) = 0;
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25F3C4A14(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t result = sub_25F3F6B50();
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_158;
    }
    if (v3) {
      return sub_25F3C5880(0, v3, 1, a1);
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
    goto LABEL_157;
  }
  uint64_t v104 = result;
  uint64_t v100 = a1;
  if (v3 <= 1)
  {
    uint64_t v7 = MEMORY[0x263F8EE78];
    __dst = (char *)(MEMORY[0x263F8EE78] + 32);
    if (v3 != 1)
    {
      unint64_t v11 = *(void *)(MEMORY[0x263F8EE78] + 16);
      uint64_t v10 = MEMORY[0x263F8EE78];
LABEL_123:
      uint64_t result = v10;
      uint64_t v103 = v7;
      if (v11 >= 2)
      {
        uint64_t v93 = *v100;
        do
        {
          unint64_t v94 = v11 - 2;
          if (v11 < 2) {
            goto LABEL_152;
          }
          if (!v93) {
            goto LABEL_165;
          }
          uint64_t v95 = result;
          uint64_t v96 = *(void *)(result + 32 + 16 * v94);
          uint64_t v97 = *(void *)(result + 32 + 16 * (v11 - 1) + 8);
          uint64_t result = sub_25F3C5CDC((char *)(v93 + 8 * v96), (char *)(v93 + 8 * *(void *)(result + 32 + 16 * (v11 - 1))), v93 + 8 * v97, __dst);
          if (v1) {
            break;
          }
          if (v97 < v96) {
            goto LABEL_153;
          }
          uint64_t result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            uint64_t result = (uint64_t)sub_25F394970(v95);
            uint64_t v95 = result;
          }
          if (v94 >= *(void *)(v95 + 16)) {
            goto LABEL_154;
          }
          uint64_t v98 = (void *)(v95 + 32 + 16 * v94);
          *uint64_t v98 = v96;
          v98[1] = v97;
          unint64_t v99 = *(void *)(v95 + 16);
          if (v11 > v99) {
            goto LABEL_155;
          }
          memmove((void *)(v95 + 32 + 16 * (v11 - 1)), (const void *)(v95 + 32 + 16 * v11), 16 * (v99 - v11));
          uint64_t result = v95;
          *(void *)(v95 + 16) = v99 - 1;
          unint64_t v11 = v99 - 1;
        }
        while (v99 > 2);
      }
LABEL_120:
      swift_bridgeObjectRelease();
      *(void *)(v103 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v103 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    uint64_t result = sub_25F3F6340();
    *(void *)(result + 16) = v6;
    uint64_t v103 = result;
    __dst = (char *)(result + 32);
  }
  uint64_t v8 = 0;
  uint64_t v9 = *a1;
  uint64_t v101 = v9 - 8;
  uint64_t v102 = v9 + 16;
  uint64_t v10 = MEMORY[0x263F8EE78];
  uint64_t v106 = v3;
  while (2)
  {
    uint64_t v12 = v8++;
    uint64_t v107 = v12;
    if (v8 >= v3) {
      goto LABEL_47;
    }
    uint64_t v13 = *(void *)(v9 + 8 * v8);
    uint64_t v14 = *(void *)(v9 + 8 * v12);
    if (*(void *)(v13 + 16) && (uint64_t result = sub_25F3C3DFC(0), (v15 & 1) != 0))
    {
      uint64_t v16 = *(void *)(*(void *)(v13 + 56) + 120 * result + 80);
      if (!*(void *)(v14 + 16)) {
        goto LABEL_24;
      }
    }
    else
    {
      uint64_t v16 = -1;
      if (!*(void *)(v14 + 16))
      {
LABEL_24:
        uint64_t v18 = -1;
        goto LABEL_25;
      }
    }
    uint64_t result = sub_25F3C3DFC(0);
    if ((v17 & 1) == 0) {
      goto LABEL_24;
    }
    uint64_t v18 = *(void *)(*(void *)(v14 + 56) + 120 * result + 80);
LABEL_25:
    uint64_t v8 = v12 + 2;
    if (v12 + 2 >= v3) {
      goto LABEL_39;
    }
    uint64_t v19 = v102 + 8 * v12;
    do
    {
      uint64_t v21 = *(void *)(v19 - 8);
      uint64_t v20 = *(void *)v19;
      if (*(void *)(*(void *)v19 + 16) && (uint64_t result = sub_25F3C3DFC(0), (v22 & 1) != 0))
      {
        uint64_t v23 = *(void *)(*(void *)(v20 + 56) + 120 * result + 80);
        if (!*(void *)(v21 + 16)) {
          goto LABEL_27;
        }
      }
      else
      {
        uint64_t v23 = -1;
        if (!*(void *)(v21 + 16)) {
          goto LABEL_27;
        }
      }
      uint64_t result = sub_25F3C3DFC(0);
      if ((v24 & 1) == 0)
      {
LABEL_27:
        if (v16 < v18 == v23 > -2) {
          goto LABEL_36;
        }
        goto LABEL_28;
      }
      if (v16 < v18 == v23 >= *(void *)(*(void *)(v21 + 56) + 120 * result + 80))
      {
LABEL_36:
        uint64_t v3 = v106;
        goto LABEL_38;
      }
LABEL_28:
      ++v8;
      v19 += 8;
      uint64_t v3 = v106;
    }
    while (v106 != v8);
    uint64_t v8 = v106;
LABEL_38:
    uint64_t v12 = v107;
LABEL_39:
    if (v16 < v18)
    {
      if (v8 < v12) {
        goto LABEL_159;
      }
      if (v12 < v8)
      {
        uint64_t v25 = (uint64_t *)(v101 + 8 * v8);
        uint64_t v26 = v8;
        uint64_t v27 = v12;
        unint64_t v28 = (uint64_t *)(v9 + 8 * v12);
        do
        {
          if (v27 != --v26)
          {
            if (!v9) {
              goto LABEL_164;
            }
            uint64_t v29 = *v28;
            *unint64_t v28 = *v25;
            *uint64_t v25 = v29;
          }
          ++v27;
          --v25;
          ++v28;
        }
        while (v27 < v26);
      }
    }
LABEL_47:
    if (v8 >= v3) {
      goto LABEL_72;
    }
    if (__OFSUB__(v8, v12)) {
      goto LABEL_156;
    }
    if (v8 - v12 >= v104) {
      goto LABEL_72;
    }
    if (__OFADD__(v12, v104)) {
      goto LABEL_160;
    }
    if (v12 + v104 >= v3) {
      uint64_t v30 = v3;
    }
    else {
      uint64_t v30 = v12 + v104;
    }
    if (v30 >= v12)
    {
      if (v8 == v30) {
        goto LABEL_72;
      }
      long long v31 = (uint64_t *)(v101 + 8 * v8);
      uint64_t v105 = v30;
      while (2)
      {
        uint64_t v32 = *(void *)(v9 + 8 * v8);
        uint64_t v33 = v31;
        while (2)
        {
          uint64_t v34 = *v33;
          if (*(void *)(v32 + 16) && (uint64_t result = sub_25F3C3DFC(0), (v35 & 1) != 0))
          {
            uint64_t v36 = *(void *)(*(void *)(v32 + 56) + 120 * result + 80);
            if (!*(void *)(v34 + 16)) {
              goto LABEL_67;
            }
LABEL_64:
            uint64_t result = sub_25F3C3DFC(0);
            if (v37)
            {
              if (v36 >= *(void *)(*(void *)(v34 + 56) + 120 * result + 80)) {
                break;
              }
              goto LABEL_68;
            }
          }
          else
          {
            uint64_t v36 = -1;
            if (*(void *)(v34 + 16)) {
              goto LABEL_64;
            }
          }
LABEL_67:
          if (v36 >= -1) {
            break;
          }
LABEL_68:
          if (!v9) {
            goto LABEL_162;
          }
          uint64_t v38 = *v33;
          uint64_t v32 = v33[1];
          *uint64_t v33 = v32;
          v33[1] = v38;
          --v33;
          if (v8 != ++v12) {
            continue;
          }
          break;
        }
        ++v8;
        ++v31;
        uint64_t v12 = v107;
        if (v8 != v105) {
          continue;
        }
        break;
      }
      uint64_t v8 = v105;
LABEL_72:
      if (v8 < v12) {
        goto LABEL_151;
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_25F394790(0, *(void *)(v10 + 16) + 1, 1, (char *)v10);
        uint64_t v10 = result;
      }
      unint64_t v40 = *(void *)(v10 + 16);
      unint64_t v39 = *(void *)(v10 + 24);
      unint64_t v11 = v40 + 1;
      if (v40 >= v39 >> 1)
      {
        uint64_t result = (uint64_t)sub_25F394790((char *)(v39 > 1), v40 + 1, 1, (char *)v10);
        uint64_t v10 = result;
      }
      *(void *)(v10 + 16) = v11;
      uint64_t v41 = v10 + 32;
      uint64_t v42 = (uint64_t *)(v10 + 32 + 16 * v40);
      *uint64_t v42 = v12;
      v42[1] = v8;
      if (v40)
      {
        uint64_t v108 = v8;
        while (1)
        {
          unint64_t v43 = v11 - 1;
          if (v11 >= 4)
          {
            unint64_t v48 = v41 + 16 * v11;
            uint64_t v49 = *(void *)(v48 - 64);
            uint64_t v50 = *(void *)(v48 - 56);
            BOOL v54 = __OFSUB__(v50, v49);
            uint64_t v51 = v50 - v49;
            if (v54) {
              goto LABEL_140;
            }
            uint64_t v53 = *(void *)(v48 - 48);
            uint64_t v52 = *(void *)(v48 - 40);
            BOOL v54 = __OFSUB__(v52, v53);
            uint64_t v46 = v52 - v53;
            char v47 = v54;
            if (v54) {
              goto LABEL_141;
            }
            unint64_t v55 = v11 - 2;
            uint64_t v56 = (uint64_t *)(v41 + 16 * (v11 - 2));
            uint64_t v58 = *v56;
            uint64_t v57 = v56[1];
            BOOL v54 = __OFSUB__(v57, v58);
            uint64_t v59 = v57 - v58;
            if (v54) {
              goto LABEL_142;
            }
            BOOL v54 = __OFADD__(v46, v59);
            uint64_t v60 = v46 + v59;
            if (v54) {
              goto LABEL_144;
            }
            if (v60 >= v51)
            {
              uint64_t v78 = (uint64_t *)(v41 + 16 * v43);
              uint64_t v80 = *v78;
              uint64_t v79 = v78[1];
              BOOL v54 = __OFSUB__(v79, v80);
              uint64_t v81 = v79 - v80;
              if (v54) {
                goto LABEL_150;
              }
              BOOL v71 = v46 < v81;
              goto LABEL_110;
            }
          }
          else
          {
            if (v11 != 3)
            {
              uint64_t v72 = *(void *)(v10 + 32);
              uint64_t v73 = *(void *)(v10 + 40);
              BOOL v54 = __OFSUB__(v73, v72);
              uint64_t v65 = v73 - v72;
              char v66 = v54;
              goto LABEL_104;
            }
            uint64_t v45 = *(void *)(v10 + 32);
            uint64_t v44 = *(void *)(v10 + 40);
            BOOL v54 = __OFSUB__(v44, v45);
            uint64_t v46 = v44 - v45;
            char v47 = v54;
          }
          if (v47) {
            goto LABEL_143;
          }
          unint64_t v55 = v11 - 2;
          uint64_t v61 = (uint64_t *)(v41 + 16 * (v11 - 2));
          uint64_t v63 = *v61;
          uint64_t v62 = v61[1];
          BOOL v64 = __OFSUB__(v62, v63);
          uint64_t v65 = v62 - v63;
          char v66 = v64;
          if (v64) {
            goto LABEL_145;
          }
          uint64_t v67 = (uint64_t *)(v41 + 16 * v43);
          uint64_t v69 = *v67;
          uint64_t v68 = v67[1];
          BOOL v54 = __OFSUB__(v68, v69);
          uint64_t v70 = v68 - v69;
          if (v54) {
            goto LABEL_147;
          }
          if (__OFADD__(v65, v70)) {
            goto LABEL_149;
          }
          if (v65 + v70 >= v46)
          {
            BOOL v71 = v46 < v70;
LABEL_110:
            if (v71) {
              unint64_t v43 = v55;
            }
            goto LABEL_112;
          }
LABEL_104:
          if (v66) {
            goto LABEL_146;
          }
          v74 = (uint64_t *)(v41 + 16 * v43);
          uint64_t v76 = *v74;
          uint64_t v75 = v74[1];
          BOOL v54 = __OFSUB__(v75, v76);
          uint64_t v77 = v75 - v76;
          if (v54) {
            goto LABEL_148;
          }
          if (v77 < v65) {
            goto LABEL_15;
          }
LABEL_112:
          unint64_t v82 = v43 - 1;
          if (v43 - 1 >= v11)
          {
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
LABEL_149:
            __break(1u);
LABEL_150:
            __break(1u);
LABEL_151:
            __break(1u);
LABEL_152:
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
            goto LABEL_161;
          }
          uint64_t v83 = v9;
          if (!v9) {
            goto LABEL_163;
          }
          uint64_t v84 = v10;
          long long v85 = (uint64_t *)(v41 + 16 * v82);
          uint64_t v86 = *v85;
          uint64_t v87 = v41;
          unint64_t v88 = v43;
          uint64_t v89 = (void *)(v41 + 16 * v43);
          uint64_t v90 = v89[1];
          uint64_t v91 = v83;
          uint64_t result = sub_25F3C5CDC((char *)(v83 + 8 * *v85), (char *)(v83 + 8 * *v89), v83 + 8 * v90, __dst);
          if (v1) {
            goto LABEL_120;
          }
          if (v90 < v86) {
            goto LABEL_137;
          }
          if (v88 > *(void *)(v84 + 16)) {
            goto LABEL_138;
          }
          *long long v85 = v86;
          *(void *)(v87 + 16 * v82 + 8) = v90;
          unint64_t v92 = *(void *)(v84 + 16);
          if (v88 >= v92) {
            goto LABEL_139;
          }
          uint64_t v10 = v84;
          unint64_t v11 = v92 - 1;
          uint64_t result = (uint64_t)memmove(v89, v89 + 2, 16 * (v92 - 1 - v88));
          uint64_t v41 = v87;
          *(void *)(v84 + 16) = v92 - 1;
          uint64_t v9 = v91;
          uint64_t v8 = v108;
          if (v92 <= 2) {
            goto LABEL_15;
          }
        }
      }
      unint64_t v11 = 1;
LABEL_15:
      uint64_t v3 = v106;
      if (v8 >= v106)
      {
        uint64_t v7 = v103;
        goto LABEL_123;
      }
      continue;
    }
    break;
  }
LABEL_161:
  __break(1u);
LABEL_162:
  __break(1u);
LABEL_163:
  __break(1u);
LABEL_164:
  __break(1u);
LABEL_165:
  __break(1u);
  return result;
}

uint64_t sub_25F3C51A4(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t result = sub_25F3F6B50();
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_152;
    }
    if (v3) {
      return sub_25F3C5998(0, v3, 1, a1);
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
    goto LABEL_151;
  }
  uint64_t v102 = result;
  unint64_t v99 = a1;
  if (v3 <= 1)
  {
    uint64_t v7 = MEMORY[0x263F8EE78];
    uint64_t v105 = (char *)(MEMORY[0x263F8EE78] + 32);
    if (v3 != 1)
    {
      unint64_t v11 = *(void *)(MEMORY[0x263F8EE78] + 16);
      uint64_t v10 = MEMORY[0x263F8EE78];
LABEL_117:
      uint64_t result = v10;
      uint64_t v101 = v7;
      if (v11 >= 2)
      {
        uint64_t v91 = *v99;
        do
        {
          unint64_t v92 = v11 - 2;
          if (v11 < 2) {
            goto LABEL_146;
          }
          if (!v91) {
            goto LABEL_159;
          }
          uint64_t v93 = result;
          uint64_t v94 = *(void *)(result + 32 + 16 * v92);
          uint64_t v95 = *(void *)(result + 32 + 16 * (v11 - 1) + 8);
          uint64_t result = sub_25F3C5FFC((char *)(v91 + 24 * v94), (char *)(v91 + 24 * *(void *)(result + 32 + 16 * (v11 - 1))), v91 + 24 * v95, v105);
          if (v1) {
            break;
          }
          if (v95 < v94) {
            goto LABEL_147;
          }
          uint64_t result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            uint64_t result = (uint64_t)sub_25F394970(v93);
            uint64_t v93 = result;
          }
          if (v92 >= *(void *)(v93 + 16)) {
            goto LABEL_148;
          }
          uint64_t v96 = (void *)(v93 + 32 + 16 * v92);
          *uint64_t v96 = v94;
          v96[1] = v95;
          unint64_t v97 = *(void *)(v93 + 16);
          if (v11 > v97) {
            goto LABEL_149;
          }
          memmove((void *)(v93 + 32 + 16 * (v11 - 1)), (const void *)(v93 + 32 + 16 * v11), 16 * (v97 - v11));
          uint64_t result = v93;
          *(void *)(v93 + 16) = v97 - 1;
          unint64_t v11 = v97 - 1;
        }
        while (v97 > 2);
      }
LABEL_114:
      swift_bridgeObjectRelease();
      *(void *)(v101 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v101 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    uint64_t result = sub_25F3F6340();
    *(void *)(result + 16) = v6;
    uint64_t v101 = result;
    uint64_t v105 = (char *)(result + 32);
  }
  uint64_t v8 = 0;
  uint64_t v9 = *a1;
  uint64_t v100 = *a1 + 8;
  uint64_t v98 = *a1 - 24;
  uint64_t v10 = MEMORY[0x263F8EE78];
  uint64_t v103 = v3;
  uint64_t v104 = v9;
  while (1)
  {
    uint64_t v12 = v8++;
    if (v8 >= v3) {
      goto LABEL_45;
    }
    uint64_t v13 = (uint64_t *)(v9 + 24 * v8);
    uint64_t result = *v13;
    uint64_t v14 = v13[1];
    char v15 = (void *)(v9 + 24 * v12);
    if (result == *v15 && v14 == v15[1])
    {
      uint64_t v18 = v12 + 2;
      if (v12 + 2 >= v3) {
        goto LABEL_44;
      }
      int v17 = 0;
    }
    else
    {
      uint64_t result = sub_25F3F6B80();
      int v17 = result;
      uint64_t v18 = v12 + 2;
      if (v12 + 2 >= v3) {
        goto LABEL_36;
      }
    }
    uint64_t v19 = (void *)(v100 + 24 * v18);
    do
    {
      uint64_t result = *(v19 - 1);
      uint64_t v21 = (void *)(v9 + 24 * v8);
      if (result == *v21 && *v19 == v21[1])
      {
        if (v17) {
          goto LABEL_37;
        }
      }
      else
      {
        uint64_t result = sub_25F3F6B80();
        if ((v17 ^ result)) {
          goto LABEL_36;
        }
      }
      v19 += 3;
      uint64_t v20 = v18 + 1;
      uint64_t v8 = v18;
      uint64_t v18 = v20;
    }
    while (v20 < v3);
    uint64_t v18 = v20;
LABEL_36:
    uint64_t v8 = v18;
    if (v17)
    {
LABEL_37:
      if (v18 < v12) {
        goto LABEL_155;
      }
      if (v12 < v18)
      {
        uint64_t v23 = 24 * v18;
        uint64_t v24 = 24 * v12;
        uint64_t v25 = v18;
        uint64_t v26 = v12;
        do
        {
          if (v26 != --v25)
          {
            if (!v9) {
              goto LABEL_158;
            }
            uint64_t v27 = v9 + v24;
            uint64_t v28 = v9 + v23;
            uint64_t v29 = *(void *)(v9 + v24);
            long long v30 = *(_OWORD *)(v9 + v24 + 8);
            long long v31 = *(_OWORD *)(v9 + v23 - 24);
            *(void *)(v27 + 16) = *(void *)(v9 + v23 - 8);
            *(_OWORD *)uint64_t v27 = v31;
            *(void *)(v28 - 24) = v29;
            *(_OWORD *)(v28 - 16) = v30;
          }
          ++v26;
          v23 -= 24;
          v24 += 24;
        }
        while (v26 < v25);
      }
LABEL_44:
      uint64_t v8 = v18;
    }
LABEL_45:
    if (v8 < v3)
    {
      if (__OFSUB__(v8, v12)) {
        goto LABEL_150;
      }
      if (v8 - v12 < v102) {
        break;
      }
    }
LABEL_66:
    if (v8 < v12) {
      goto LABEL_145;
    }
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_25F394790(0, *(void *)(v10 + 16) + 1, 1, (char *)v10);
      uint64_t v10 = result;
    }
    unint64_t v42 = *(void *)(v10 + 16);
    unint64_t v41 = *(void *)(v10 + 24);
    unint64_t v11 = v42 + 1;
    if (v42 >= v41 >> 1)
    {
      uint64_t result = (uint64_t)sub_25F394790((char *)(v41 > 1), v42 + 1, 1, (char *)v10);
      uint64_t v10 = result;
    }
    *(void *)(v10 + 16) = v11;
    uint64_t v43 = v10 + 32;
    uint64_t v44 = (uint64_t *)(v10 + 32 + 16 * v42);
    *uint64_t v44 = v12;
    v44[1] = v8;
    if (v42)
    {
      uint64_t v9 = v104;
      while (1)
      {
        unint64_t v45 = v11 - 1;
        if (v11 >= 4)
        {
          unint64_t v50 = v43 + 16 * v11;
          uint64_t v51 = *(void *)(v50 - 64);
          uint64_t v52 = *(void *)(v50 - 56);
          BOOL v56 = __OFSUB__(v52, v51);
          uint64_t v53 = v52 - v51;
          if (v56) {
            goto LABEL_134;
          }
          uint64_t v55 = *(void *)(v50 - 48);
          uint64_t v54 = *(void *)(v50 - 40);
          BOOL v56 = __OFSUB__(v54, v55);
          uint64_t v48 = v54 - v55;
          char v49 = v56;
          if (v56) {
            goto LABEL_135;
          }
          unint64_t v57 = v11 - 2;
          uint64_t v58 = (uint64_t *)(v43 + 16 * (v11 - 2));
          uint64_t v60 = *v58;
          uint64_t v59 = v58[1];
          BOOL v56 = __OFSUB__(v59, v60);
          uint64_t v61 = v59 - v60;
          if (v56) {
            goto LABEL_136;
          }
          BOOL v56 = __OFADD__(v48, v61);
          uint64_t v62 = v48 + v61;
          if (v56) {
            goto LABEL_138;
          }
          if (v62 >= v53)
          {
            uint64_t v80 = (uint64_t *)(v43 + 16 * v45);
            uint64_t v82 = *v80;
            uint64_t v81 = v80[1];
            BOOL v56 = __OFSUB__(v81, v82);
            uint64_t v83 = v81 - v82;
            if (v56) {
              goto LABEL_144;
            }
            BOOL v73 = v48 < v83;
            goto LABEL_104;
          }
        }
        else
        {
          if (v11 != 3)
          {
            uint64_t v74 = *(void *)(v10 + 32);
            uint64_t v75 = *(void *)(v10 + 40);
            BOOL v56 = __OFSUB__(v75, v74);
            uint64_t v67 = v75 - v74;
            char v68 = v56;
            goto LABEL_98;
          }
          uint64_t v47 = *(void *)(v10 + 32);
          uint64_t v46 = *(void *)(v10 + 40);
          BOOL v56 = __OFSUB__(v46, v47);
          uint64_t v48 = v46 - v47;
          char v49 = v56;
        }
        if (v49) {
          goto LABEL_137;
        }
        unint64_t v57 = v11 - 2;
        uint64_t v63 = (uint64_t *)(v43 + 16 * (v11 - 2));
        uint64_t v65 = *v63;
        uint64_t v64 = v63[1];
        BOOL v66 = __OFSUB__(v64, v65);
        uint64_t v67 = v64 - v65;
        char v68 = v66;
        if (v66) {
          goto LABEL_139;
        }
        uint64_t v69 = (uint64_t *)(v43 + 16 * v45);
        uint64_t v71 = *v69;
        uint64_t v70 = v69[1];
        BOOL v56 = __OFSUB__(v70, v71);
        uint64_t v72 = v70 - v71;
        if (v56) {
          goto LABEL_141;
        }
        if (__OFADD__(v67, v72)) {
          goto LABEL_143;
        }
        if (v67 + v72 >= v48)
        {
          BOOL v73 = v48 < v72;
LABEL_104:
          if (v73) {
            unint64_t v45 = v57;
          }
          goto LABEL_106;
        }
LABEL_98:
        if (v68) {
          goto LABEL_140;
        }
        uint64_t v76 = (uint64_t *)(v43 + 16 * v45);
        uint64_t v78 = *v76;
        uint64_t v77 = v76[1];
        BOOL v56 = __OFSUB__(v77, v78);
        uint64_t v79 = v77 - v78;
        if (v56) {
          goto LABEL_142;
        }
        if (v79 < v67) {
          goto LABEL_15;
        }
LABEL_106:
        unint64_t v84 = v45 - 1;
        if (v45 - 1 >= v11)
        {
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
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
          goto LABEL_154;
        }
        if (!v9) {
          goto LABEL_157;
        }
        uint64_t v85 = v9;
        uint64_t v86 = (uint64_t *)(v43 + 16 * v84);
        uint64_t v87 = *v86;
        unint64_t v88 = (void *)(v43 + 16 * v45);
        uint64_t v89 = v88[1];
        uint64_t result = sub_25F3C5FFC((char *)(v85 + 24 * *v86), (char *)(v85 + 24 * *v88), v85 + 24 * v89, v105);
        if (v1) {
          goto LABEL_114;
        }
        if (v89 < v87) {
          goto LABEL_131;
        }
        if (v45 > *(void *)(v10 + 16)) {
          goto LABEL_132;
        }
        *uint64_t v86 = v87;
        *(void *)(v43 + 16 * v84 + 8) = v89;
        unint64_t v90 = *(void *)(v10 + 16);
        if (v45 >= v90) {
          goto LABEL_133;
        }
        unint64_t v11 = v90 - 1;
        uint64_t result = (uint64_t)memmove((void *)(v43 + 16 * v45), v88 + 2, 16 * (v90 - 1 - v45));
        *(void *)(v10 + 16) = v90 - 1;
        BOOL v73 = v90 > 2;
        uint64_t v9 = v104;
        if (!v73) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v11 = 1;
    uint64_t v9 = v104;
LABEL_15:
    uint64_t v3 = v103;
    if (v8 >= v103)
    {
      uint64_t v7 = v101;
      goto LABEL_117;
    }
  }
  if (__OFADD__(v12, v102)) {
    goto LABEL_153;
  }
  if (v12 + v102 >= v3) {
    uint64_t v32 = v3;
  }
  else {
    uint64_t v32 = v12 + v102;
  }
  if (v32 >= v12)
  {
    if (v8 != v32)
    {
      uint64_t v33 = v98 + 24 * v8;
      do
      {
        uint64_t v34 = (uint64_t *)(v9 + 24 * v8);
        uint64_t result = *v34;
        uint64_t v35 = v34[1];
        uint64_t v36 = v12;
        uint64_t v37 = v33;
        do
        {
          if (result == *(void *)v37 && v35 == *(void *)(v37 + 8)) {
            break;
          }
          uint64_t result = sub_25F3F6B80();
          if ((result & 1) == 0) {
            break;
          }
          if (!v9) {
            goto LABEL_156;
          }
          long long v39 = *(_OWORD *)(v37 + 32);
          uint64_t v40 = *(void *)(v37 + 16);
          uint64_t result = *(void *)(v37 + 24);
          *(_OWORD *)(v37 + 24) = *(_OWORD *)v37;
          *(void *)(v37 + 40) = v40;
          *(void *)uint64_t v37 = result;
          *(_OWORD *)(v37 + 8) = v39;
          uint64_t v35 = v39;
          v37 -= 24;
          ++v36;
        }
        while (v8 != v36);
        ++v8;
        v33 += 24;
      }
      while (v8 != v32);
      uint64_t v8 = v32;
    }
    goto LABEL_66;
  }
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
  return result;
}

unint64_t sub_25F3C5880(unint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  unint64_t v16 = result;
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v5 = *a4;
    uint64_t v6 = *a4 + 8 * a3 - 8;
LABEL_5:
    uint64_t v7 = *(void *)(v5 + 8 * v4);
    unint64_t v8 = v16;
    uint64_t v9 = (uint64_t *)v6;
    while (1)
    {
      uint64_t v10 = *v9;
      if (*(void *)(v7 + 16) && (uint64_t result = sub_25F3C3DFC(0), (v11 & 1) != 0))
      {
        uint64_t v12 = *(void *)(*(void *)(v7 + 56) + 120 * result + 80);
        if (!*(void *)(v10 + 16)) {
          goto LABEL_14;
        }
      }
      else
      {
        uint64_t v12 = -1;
        if (!*(void *)(v10 + 16)) {
          goto LABEL_14;
        }
      }
      uint64_t result = sub_25F3C3DFC(0);
      if (v13)
      {
        if (v12 >= *(void *)(*(void *)(v10 + 56) + 120 * result + 80)) {
          goto LABEL_4;
        }
        goto LABEL_15;
      }
LABEL_14:
      if (v12 >= -1) {
        goto LABEL_4;
      }
LABEL_15:
      if (!v5)
      {
        __break(1u);
        return result;
      }
      uint64_t v14 = *v9;
      uint64_t v7 = v9[1];
      *uint64_t v9 = v7;
      v9[1] = v14;
      --v9;
      if (v4 == ++v8)
      {
LABEL_4:
        ++v4;
        v6 += 8;
        if (v4 == a2) {
          return result;
        }
        goto LABEL_5;
      }
    }
  }
  return result;
}

uint64_t sub_25F3C5998(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 24 * a3 - 24;
LABEL_5:
    uint64_t v9 = (uint64_t *)(v7 + 24 * v4);
    uint64_t result = *v9;
    uint64_t v10 = v9[1];
    uint64_t v11 = v6;
    uint64_t v12 = v8;
    while (1)
    {
      BOOL v13 = result == *(void *)v12 && v10 == *(void *)(v12 + 8);
      if (v13 || (uint64_t result = sub_25F3F6B80(), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 24;
        if (v4 == a2) {
          return result;
        }
        goto LABEL_5;
      }
      if (!v7) {
        break;
      }
      long long v14 = *(_OWORD *)(v12 + 32);
      uint64_t v15 = *(void *)(v12 + 16);
      uint64_t result = *(void *)(v12 + 24);
      *(_OWORD *)(v12 + 24) = *(_OWORD *)v12;
      *(void *)(v12 + 40) = v15;
      *(void *)uint64_t v12 = result;
      *(_OWORD *)(v12 + 8) = v14;
      uint64_t v10 = v14;
      v12 -= 24;
      if (v4 == ++v11) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_25F3C5A80(char *__dst, char *__src, unint64_t a3, char *a4)
{
  uint64_t v4 = a4;
  uint64_t v6 = __src;
  uint64_t v7 = __dst;
  int64_t v8 = __src - __dst;
  int64_t v9 = (__src - __dst) / 120;
  uint64_t v10 = a3 - (void)__src;
  uint64_t v11 = (uint64_t)(a3 - (void)__src) / 120;
  if (v9 >= v11)
  {
    if (a4 != __src || &__src[120 * v11] <= a4) {
      memmove(a4, __src, 120 * v11);
    }
    uint64_t v12 = &v4[120 * v11];
    if (v7 >= v6 || v10 < 120) {
      goto LABEL_39;
    }
    unint64_t v16 = (char *)(a3 - 120);
    while (1)
    {
      int v17 = v16 + 120;
      if (*((void *)v12 - 4) >= *((void *)v6 - 4))
      {
        uint64_t v18 = v12 - 120;
        if (v17 != v12)
        {
          v12 -= 120;
          goto LABEL_36;
        }
        BOOL v19 = v16 >= v12;
        v12 -= 120;
        if (v19) {
          goto LABEL_36;
        }
      }
      else
      {
        uint64_t v18 = v6 - 120;
        if (v17 != v6)
        {
          v6 -= 120;
LABEL_36:
          memmove(v16, v18, 0x78uLL);
          goto LABEL_37;
        }
        BOOL v19 = v16 >= v6;
        v6 -= 120;
        if (v19) {
          goto LABEL_36;
        }
      }
LABEL_37:
      if (v6 > v7)
      {
        v16 -= 120;
        if (v12 > v4) {
          continue;
        }
      }
      goto LABEL_39;
    }
  }
  if (a4 != __dst || &__dst[120 * v9] <= a4) {
    memmove(a4, __dst, 120 * v9);
  }
  uint64_t v12 = &v4[120 * v9];
  if ((unint64_t)v6 < a3 && v8 >= 120)
  {
    while (1)
    {
      if (*((void *)v6 + 11) >= *((void *)v4 + 11))
      {
        uint64_t v15 = v4 + 120;
        long long v14 = v4;
        BOOL v13 = v6;
        if (v7 == v4)
        {
          v4 += 120;
          if (v7 < v15) {
            goto LABEL_16;
          }
        }
        else
        {
          v4 += 120;
        }
      }
      else
      {
        BOOL v13 = v6 + 120;
        long long v14 = v6;
        if (v7 == v6 && v7 < v13) {
          goto LABEL_16;
        }
      }
      memmove(v7, v14, 0x78uLL);
LABEL_16:
      v7 += 120;
      if (v4 < v12)
      {
        uint64_t v6 = v13;
        if ((unint64_t)v13 < a3) {
          continue;
        }
      }
      break;
    }
  }
  uint64_t v6 = v7;
LABEL_39:
  uint64_t v20 = (v12 - v4) / 120;
  if (v6 != v4 || v6 >= &v4[120 * v20]) {
    memmove(v6, v4, 120 * v20);
  }
  return 1;
}

uint64_t sub_25F3C5CDC(char *__src, char *a2, unint64_t a3, char *__dst)
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
  if (v10 >= v12 >> 3)
  {
    if (__dst != a2 || &a2[8 * v13] <= __dst) {
      memmove(__dst, a2, 8 * v13);
    }
    uint64_t v24 = &v4[8 * v13];
    if (v7 >= v6 || v11 < 8)
    {
      long long v14 = &v4[8 * v13];
      goto LABEL_57;
    }
    uint64_t v25 = (char *)(a3 - 8);
    __srca = v4;
    long long v14 = v24;
    while (1)
    {
      uint64_t v27 = v14 - 8;
      uint64_t v26 = *((void *)v14 - 1);
      uint64_t v28 = v6 - 8;
      uint64_t v29 = *((void *)v6 - 1);
      __dsta = v6;
      if (*(void *)(v26 + 16) && (unint64_t v30 = sub_25F3C3DFC(0), (v31 & 1) != 0))
      {
        unint64_t v32 = (unint64_t)v14;
        uint64_t v33 = *(void *)(*(void *)(v26 + 56) + 120 * v30 + 80);
      }
      else
      {
        unint64_t v32 = (unint64_t)v14;
        uint64_t v33 = -1;
      }
      uint64_t v34 = v25 + 8;
      if (*(void *)(v29 + 16) && (unint64_t v35 = sub_25F3C3DFC(0), (v36 & 1) != 0))
      {
        if (v33 < *(void *)(*(void *)(v29 + 56) + 120 * v35 + 80)) {
          goto LABEL_45;
        }
      }
      else if (v33 < -1)
      {
LABEL_45:
        uint64_t v4 = __srca;
        if (v34 == __dsta)
        {
          long long v14 = (char *)v32;
          uint64_t v6 = v28;
          if (v25 < __dsta) {
            goto LABEL_51;
          }
        }
        else
        {
          long long v14 = (char *)v32;
          uint64_t v6 = v28;
        }
        goto LABEL_50;
      }
      uint64_t v4 = __srca;
      uint64_t v28 = v27;
      if (v34 != (char *)v32)
      {
        long long v14 = v27;
        uint64_t v6 = __dsta;
LABEL_50:
        *(void *)uint64_t v25 = *(void *)v28;
        goto LABEL_51;
      }
      BOOL v37 = (unint64_t)v25 >= v32;
      long long v14 = v27;
      uint64_t v6 = __dsta;
      if (v37) {
        goto LABEL_50;
      }
LABEL_51:
      if (v6 > v7)
      {
        v25 -= 8;
        if (v14 > v4) {
          continue;
        }
      }
      goto LABEL_57;
    }
  }
  if (__dst != __src || &__src[8 * v10] <= __dst) {
    memmove(__dst, __src, 8 * v10);
  }
  long long v14 = &v4[8 * v10];
  if ((unint64_t)v6 < a3 && v8 >= 8)
  {
    do
    {
      uint64_t v15 = *(void *)v6;
      uint64_t v16 = *(void *)v4;
      if (*(void *)(*(void *)v6 + 16) && (unint64_t v17 = sub_25F3C3DFC(0), (v18 & 1) != 0))
      {
        uint64_t v19 = *(void *)(*(void *)(v15 + 56) + 120 * v17 + 80);
        if (!*(void *)(v16 + 16)) {
          goto LABEL_23;
        }
      }
      else
      {
        uint64_t v19 = -1;
        if (!*(void *)(v16 + 16)) {
          goto LABEL_23;
        }
      }
      unint64_t v20 = sub_25F3C3DFC(0);
      if (v21)
      {
        if (v19 >= *(void *)(*(void *)(v16 + 56) + 120 * v20 + 80)) {
          goto LABEL_18;
        }
        goto LABEL_24;
      }
LABEL_23:
      if (v19 >= -1)
      {
LABEL_18:
        char v22 = v4;
        BOOL v23 = v7 == v4;
        v4 += 8;
        if (v23) {
          goto LABEL_20;
        }
LABEL_19:
        *(void *)uint64_t v7 = *(void *)v22;
        goto LABEL_20;
      }
LABEL_24:
      char v22 = v6;
      BOOL v23 = v7 == v6;
      v6 += 8;
      if (!v23) {
        goto LABEL_19;
      }
LABEL_20:
      v7 += 8;
    }
    while (v4 < v14 && (unint64_t)v6 < a3);
  }
  uint64_t v6 = v7;
LABEL_57:
  if (v6 != v4 || v6 >= &v4[(v14 - v4 + (v14 - v4 < 0 ? 7uLL : 0)) & 0xFFFFFFFFFFFFFFF8]) {
    memmove(v6, v4, 8 * ((v14 - v4) / 8));
  }
  return 1;
}

uint64_t sub_25F3C5FFC(char *__dst, char *__src, unint64_t a3, char *a4)
{
  uint64_t v4 = a4;
  uint64_t v6 = __src;
  uint64_t v7 = __dst;
  int64_t v8 = __src - __dst;
  int64_t v9 = (__src - __dst) / 24;
  uint64_t v10 = a3 - (void)__src;
  uint64_t v11 = (uint64_t)(a3 - (void)__src) / 24;
  if (v9 >= v11)
  {
    if (a4 != __src || &__src[24 * v11] <= a4) {
      memmove(a4, __src, 24 * v11);
    }
    uint64_t v12 = &v4[24 * v11];
    if (v7 >= v6 || v10 < 24) {
      goto LABEL_44;
    }
    unint64_t v16 = a3 - 24;
    while (1)
    {
      unint64_t v17 = (char *)(v16 + 24);
      char v18 = v6 - 24;
      BOOL v19 = *((void *)v12 - 3) == *((void *)v6 - 3) && *((void *)v12 - 2) == *((void *)v6 - 2);
      if (v19 || (sub_25F3F6B80() & 1) == 0)
      {
        char v18 = v12 - 24;
        if (v17 != v12)
        {
          v12 -= 24;
LABEL_41:
          long long v21 = *(_OWORD *)v18;
          *(void *)(v16 + 16) = *((void *)v18 + 2);
          *(_OWORD *)unint64_t v16 = v21;
          goto LABEL_42;
        }
        BOOL v20 = v16 >= (unint64_t)v12;
        v12 -= 24;
        if (v20) {
          goto LABEL_41;
        }
      }
      else
      {
        if (v17 != v6)
        {
          v6 -= 24;
          goto LABEL_41;
        }
        BOOL v20 = v16 >= (unint64_t)v6;
        v6 -= 24;
        if (v20) {
          goto LABEL_41;
        }
      }
LABEL_42:
      if (v6 > v7)
      {
        v16 -= 24;
        if (v12 > v4) {
          continue;
        }
      }
      goto LABEL_44;
    }
  }
  if (a4 != __dst || &__dst[24 * v9] <= a4) {
    memmove(a4, __dst, 24 * v9);
  }
  uint64_t v12 = &v4[24 * v9];
  if ((unint64_t)v6 < a3 && v8 >= 24)
  {
    while (1)
    {
      BOOL v13 = *(void *)v6 == *(void *)v4 && *((void *)v6 + 1) == *((void *)v4 + 1);
      if (v13 || (sub_25F3F6B80() & 1) == 0) {
        break;
      }
      long long v14 = v6;
      BOOL v13 = v7 == v6;
      v6 += 24;
      if (!v13) {
        goto LABEL_16;
      }
LABEL_17:
      v7 += 24;
      if (v4 >= v12 || (unint64_t)v6 >= a3) {
        goto LABEL_19;
      }
    }
    long long v14 = v4;
    BOOL v13 = v7 == v4;
    v4 += 24;
    if (v13) {
      goto LABEL_17;
    }
LABEL_16:
    long long v15 = *(_OWORD *)v14;
    *((void *)v7 + 2) = *((void *)v14 + 2);
    *(_OWORD *)uint64_t v7 = v15;
    goto LABEL_17;
  }
LABEL_19:
  uint64_t v6 = v7;
LABEL_44:
  uint64_t v22 = (v12 - v4) / 24;
  if (v6 != v4 || v6 >= &v4[24 * v22]) {
    memmove(v6, v4, 24 * v22);
  }
  return 1;
}

uint64_t sub_25F3C6264(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DA40);
  char v39 = a2;
  uint64_t v6 = sub_25F3F69A0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v38 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  char v36 = v2;
  int64_t v37 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v37) {
      break;
    }
    BOOL v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v38 + 8 * v22);
    ++v13;
    if (!v24)
    {
      int64_t v13 = v22 + 1;
      if (v22 + 1 >= v37) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v38 + 8 * v13);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v37)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v36;
          if ((v39 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v38 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v13 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v37) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v38 + 8 * v13);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v25;
      }
    }
LABEL_30:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v13 << 6);
LABEL_31:
    unint64_t v30 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    uint64_t v33 = *(void *)(v5 + 56) + 24 * v21;
    uint64_t v34 = *(void *)v33;
    long long v40 = *(_OWORD *)(v33 + 8);
    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_25F3F6C20();
    sub_25F3F61A0();
    uint64_t result = sub_25F3F6C70();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v16 == v27;
        if (v16 == v27) {
          unint64_t v16 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v11 + 8 * v16);
      }
      while (v29 == -1);
      unint64_t v17 = __clz(__rbit64(~v29)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    char v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *char v18 = v32;
    v18[1] = v31;
    uint64_t v19 = *(void *)(v7 + 56) + 24 * v17;
    *(void *)uint64_t v19 = v34;
    *(_OWORD *)(v19 + 8) = v40;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v36;
  BOOL v23 = (void *)(v5 + 64);
  if ((v39 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v23 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_25F3C65A8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DA48);
  uint64_t result = sub_25F3F69A0();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    uint64_t v9 = (uint64_t *)(v5 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v31 = -1 << v10;
    uint64_t v32 = v10;
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v13 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v19 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v20 = v19 | (v8 << 6);
      }
      else
      {
        int64_t v21 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v21 >= v33) {
          goto LABEL_33;
        }
        unint64_t v22 = v9[v21];
        ++v8;
        if (!v22)
        {
          int64_t v8 = v21 + 1;
          if (v21 + 1 >= v33) {
            goto LABEL_33;
          }
          unint64_t v22 = v9[v8];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v33)
            {
LABEL_33:
              if (a2)
              {
                if (v32 >= 64) {
                  bzero((void *)(v5 + 64), 8 * v33);
                }
                else {
                  *uint64_t v9 = v31;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v22 = v9[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v8 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_41;
                }
                if (v8 >= v33) {
                  goto LABEL_33;
                }
                unint64_t v22 = v9[v8];
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
        unint64_t v12 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v8 << 6);
      }
      uint64_t v28 = 8 * v20;
      uint64_t v29 = *(void *)(*(void *)(v5 + 48) + v28);
      uint64_t v30 = *(void *)(*(void *)(v5 + 56) + v28);
      if ((a2 & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      uint64_t result = sub_25F3F6C10();
      uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
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
            goto LABEL_40;
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
      *(void *)(*(void *)(v7 + 48) + v18) = v29;
      *(void *)(*(void *)(v7 + 56) + v18) = v30;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_25F3C6860(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DA50);
  char v44 = a2;
  uint64_t result = sub_25F3F69A0();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    long long v40 = v3;
    int64_t v8 = 0;
    unint64_t v42 = (uint64_t *)(v5 + 64);
    uint64_t v43 = v5;
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v38 = -1 << v9;
    uint64_t v39 = v9;
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v41 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v18 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        int64_t v45 = v8;
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
        uint64_t result = (uint64_t)v42;
        if (v20 >= v41) {
          goto LABEL_33;
        }
        unint64_t v21 = v42[v20];
        int64_t v22 = v8 + 1;
        if (!v21)
        {
          int64_t v22 = v20 + 1;
          if (v20 + 1 >= v41) {
            goto LABEL_33;
          }
          unint64_t v21 = v42[v22];
          if (!v21)
          {
            int64_t v23 = v20 + 2;
            if (v23 >= v41)
            {
LABEL_33:
              if ((v44 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v40;
                goto LABEL_40;
              }
              if (v39 >= 64) {
                bzero(v42, 8 * v41);
              }
              else {
                *unint64_t v42 = v38;
              }
              uint64_t v3 = v40;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v21 = v42[v23];
            if (!v21)
            {
              while (1)
              {
                int64_t v22 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_42;
                }
                if (v22 >= v41) {
                  goto LABEL_33;
                }
                unint64_t v21 = v42[v22];
                ++v23;
                if (v21) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v22 = v23;
          }
        }
LABEL_30:
        unint64_t v11 = (v21 - 1) & v21;
        int64_t v45 = v22;
        unint64_t v19 = __clz(__rbit64(v21)) + (v22 << 6);
      }
      uint64_t v28 = *(void *)(v5 + 56);
      uint64_t v29 = *(void *)(*(void *)(v5 + 48) + 8 * v19);
      uint64_t v30 = (uint64_t *)(v28 + 120 * v19);
      uint64_t v31 = v30[1];
      uint64_t v32 = v30[3];
      uint64_t v50 = v30[2];
      uint64_t v51 = *v30;
      uint64_t v33 = v30[5];
      uint64_t v34 = v30[7];
      uint64_t v48 = v30[6];
      uint64_t v49 = v30[4];
      uint64_t v35 = v30[9];
      long long v52 = *((_OWORD *)v30 + 5);
      uint64_t v36 = v30[12];
      uint64_t v37 = v30[14];
      uint64_t v46 = v30[13];
      uint64_t v47 = v30[8];
      if ((v44 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      uint64_t result = sub_25F3F6C10();
      uint64_t v13 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v14 = result & ~v13;
      unint64_t v15 = v14 >> 6;
      if (((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v13) >> 6;
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
      *(void *)(*(void *)(v7 + 48) + 8 * v16) = v29;
      uint64_t v17 = *(void *)(v7 + 56) + 120 * v16;
      *(void *)uint64_t v17 = v51;
      *(void *)(v17 + 8) = v31;
      *(void *)(v17 + 16) = v50;
      *(void *)(v17 + 24) = v32;
      *(void *)(v17 + 32) = v49;
      *(void *)(v17 + 40) = v33;
      *(void *)(v17 + 48) = v48;
      *(void *)(v17 + 56) = v34;
      *(void *)(v17 + 64) = v47;
      *(void *)(v17 + 72) = v35;
      *(_OWORD *)(v17 + 80) = v52;
      *(void *)(v17 + 96) = v36;
      int64_t v8 = v45;
      *(void *)(v17 + 104) = v46;
      *(void *)(v17 + 112) = v37;
      ++*(void *)(v7 + 16);
      uint64_t v5 = v43;
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_25F3C6BCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v7 = v6;
  uint64_t v14 = *v6;
  unint64_t v16 = sub_25F322920(a4, a5);
  uint64_t v17 = *(void *)(v14 + 16);
  BOOL v18 = (v15 & 1) == 0;
  uint64_t v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v20 = v15;
  uint64_t v21 = *(void *)(v14 + 24);
  if (v21 >= v19 && (a6 & 1) != 0) {
    goto LABEL_7;
  }
  if (v21 >= v19 && (a6 & 1) == 0)
  {
    sub_25F3C702C();
LABEL_7:
    int64_t v22 = (void *)*v7;
    if (v20)
    {
LABEL_8:
      int64_t v23 = (void *)(v22[7] + 24 * v16);
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      void *v23 = a1;
      v23[1] = a2;
      v23[2] = a3;
      return result;
    }
    goto LABEL_11;
  }
  sub_25F3C6264(v19, a6 & 1);
  unint64_t v25 = sub_25F322920(a4, a5);
  if ((v20 & 1) != (v26 & 1))
  {
LABEL_17:
    uint64_t result = sub_25F3F6BC0();
    __break(1u);
    return result;
  }
  unint64_t v16 = v25;
  int64_t v22 = (void *)*v7;
  if (v20) {
    goto LABEL_8;
  }
LABEL_11:
  v22[(v16 >> 6) + 8] |= 1 << v16;
  uint64_t v27 = (uint64_t *)(v22[6] + 16 * v16);
  *uint64_t v27 = a4;
  v27[1] = a5;
  uint64_t v28 = (void *)(v22[7] + 24 * v16);
  *uint64_t v28 = a1;
  v28[1] = a2;
  void v28[2] = a3;
  uint64_t v29 = v22[2];
  BOOL v30 = __OFADD__(v29, 1);
  uint64_t v31 = v29 + 1;
  if (v30)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v22[2] = v31;

  return swift_bridgeObjectRetain();
}

uint64_t sub_25F3C6D6C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_25F3C3DFC(a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_25F3C7214();
LABEL_7:
    unint64_t v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      uint64_t v17 = v16[7];
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(v17 + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    uint64_t v19 = 8 * v10;
    *(void *)(v16[6] + v19) = a2;
    *(void *)(v16[7] + v19) = a1;
    uint64_t v20 = v16[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (!v21)
    {
      id v16[2] = v22;
      return result;
    }
    goto LABEL_14;
  }
  sub_25F3C65A8(result, a3 & 1);
  uint64_t result = sub_25F3C3DFC(a2);
  if ((v14 & 1) == (v18 & 1))
  {
    unint64_t v10 = result;
    unint64_t v16 = (void *)*v4;
    if (v14) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = sub_25F3F6BC0();
  __break(1u);
  return result;
}

uint64_t sub_25F3C6EA8(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_25F3C3DFC(a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 < result || (a3 & 1) == 0)
  {
    if (v15 < result || (a3 & 1) != 0)
    {
      sub_25F3C6860(result, a3 & 1);
      uint64_t result = sub_25F3C3DFC(a2);
      if ((v14 & 1) != (v18 & 1))
      {
LABEL_17:
        uint64_t result = sub_25F3F6BC0();
        __break(1u);
        return result;
      }
      unint64_t v10 = result;
      unint64_t v16 = (void *)*v4;
      if (v14) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
    uint64_t result = (uint64_t)sub_25F3C73B8();
  }
  unint64_t v16 = (void *)*v4;
  if ((v14 & 1) == 0)
  {
LABEL_13:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    *(void *)(v16[6] + 8 * v10) = a2;
    uint64_t v19 = v16[7] + 120 * v10;
    long long v20 = *(_OWORD *)a1;
    long long v21 = *(_OWORD *)(a1 + 16);
    long long v22 = *(_OWORD *)(a1 + 48);
    *(_OWORD *)(v19 + 32) = *(_OWORD *)(a1 + 32);
    *(_OWORD *)(v19 + 48) = v22;
    *(_OWORD *)uint64_t v19 = v20;
    *(_OWORD *)(v19 + 16) = v21;
    long long v23 = *(_OWORD *)(a1 + 64);
    long long v24 = *(_OWORD *)(a1 + 80);
    long long v25 = *(_OWORD *)(a1 + 96);
    *(void *)(v19 + 112) = *(void *)(a1 + 112);
    *(_OWORD *)(v19 + 80) = v24;
    *(_OWORD *)(v19 + 96) = v25;
    *(_OWORD *)(v19 + 64) = v23;
    uint64_t v26 = v16[2];
    BOOL v27 = __OFADD__(v26, 1);
    uint64_t v28 = v26 + 1;
    if (!v27)
    {
      id v16[2] = v28;
      return result;
    }
    goto LABEL_16;
  }
LABEL_8:
  uint64_t v17 = v16[7] + 120 * v10;

  return sub_25F3C964C(a1, v17);
}

void *sub_25F3C702C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DA40);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25F3F6990();
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
    int64_t v26 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v26 >= v13) {
      goto LABEL_26;
    }
    unint64_t v27 = *(void *)(v6 + 8 * v26);
    ++v9;
    if (!v27)
    {
      int64_t v9 = v26 + 1;
      if (v26 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v27 = *(void *)(v6 + 8 * v9);
      if (!v27) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v27 - 1) & v27;
    unint64_t v15 = __clz(__rbit64(v27)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 24 * v15;
    uint64_t v21 = *(void *)(v2 + 56) + v20;
    uint64_t v22 = *(void *)v21;
    long long v23 = (void *)(*(void *)(v4 + 48) + v16);
    long long v24 = *(_OWORD *)(v21 + 8);
    void *v23 = v19;
    v23[1] = v18;
    uint64_t v25 = *(void *)(v4 + 56) + v20;
    *(void *)uint64_t v25 = v22;
    *(_OWORD *)(v25 + 8) = v24;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v28 = v26 + 2;
  if (v28 >= v13) {
    goto LABEL_26;
  }
  unint64_t v27 = *(void *)(v6 + 8 * v28);
  if (v27)
  {
    int64_t v9 = v28;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v28 + 1;
    if (__OFADD__(v28, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v27 = *(void *)(v6 + 8 * v9);
    ++v28;
    if (v27) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_25F3C7214()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DA48);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25F3F6990();
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
    uint64_t result = (void *)swift_bridgeObjectRetain();
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

void *sub_25F3C73B8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DA50);
  uint64_t v36 = v0;
  uint64_t v1 = *v0;
  uint64_t v2 = sub_25F3F6990();
  uint64_t v3 = v2;
  if (!*(void *)(v1 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v36 = v3;
    return result;
  }
  uint64_t result = (void *)(v2 + 64);
  unint64_t v5 = (unint64_t)((1 << *(unsigned char *)(v3 + 32)) + 63) >> 6;
  if (v3 != v1 || (unint64_t)result >= v1 + 64 + 8 * v5) {
    uint64_t result = memmove(result, (const void *)(v1 + 64), 8 * v5);
  }
  uint64_t v37 = v1 + 64;
  int64_t v7 = 0;
  *(void *)(v3 + 16) = *(void *)(v1 + 16);
  uint64_t v8 = 1 << *(unsigned char *)(v1 + 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & *(void *)(v1 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  while (1)
  {
    if (v10)
    {
      unint64_t v12 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v13 = v12 | (v7 << 6);
      goto LABEL_12;
    }
    int64_t v33 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v33 >= v11) {
      goto LABEL_26;
    }
    unint64_t v34 = *(void *)(v37 + 8 * v33);
    ++v7;
    if (!v34)
    {
      int64_t v7 = v33 + 1;
      if (v33 + 1 >= v11) {
        goto LABEL_26;
      }
      unint64_t v34 = *(void *)(v37 + 8 * v7);
      if (!v34) {
        break;
      }
    }
LABEL_25:
    unint64_t v10 = (v34 - 1) & v34;
    unint64_t v13 = __clz(__rbit64(v34)) + (v7 << 6);
LABEL_12:
    uint64_t v14 = 8 * v13;
    uint64_t v15 = *(void *)(*(void *)(v1 + 48) + 8 * v13);
    uint64_t v16 = 120 * v13;
    uint64_t v17 = *(void *)(v1 + 56) + v16;
    uint64_t v19 = *(void *)v17;
    uint64_t v18 = *(void *)(v17 + 8);
    uint64_t v20 = *(void *)(v17 + 16);
    uint64_t v21 = *(void *)(v17 + 24);
    uint64_t v22 = *(void *)(v17 + 32);
    uint64_t v23 = *(void *)(v17 + 40);
    uint64_t v24 = *(void *)(v17 + 48);
    uint64_t v25 = *(void *)(v17 + 56);
    uint64_t v26 = *(void *)(v17 + 64);
    uint64_t v27 = *(void *)(v17 + 72);
    uint64_t v28 = *(void *)(v17 + 96);
    uint64_t v29 = *(void *)(v17 + 104);
    uint64_t v30 = *(void *)(v17 + 112);
    long long v31 = *(_OWORD *)(v17 + 80);
    *(void *)(*(void *)(v3 + 48) + v14) = v15;
    uint64_t v32 = *(void *)(v3 + 56) + v16;
    *(void *)uint64_t v32 = v19;
    *(void *)(v32 + 8) = v18;
    *(void *)(v32 + 16) = v20;
    *(void *)(v32 + 24) = v21;
    *(void *)(v32 + 32) = v22;
    *(void *)(v32 + 40) = v23;
    *(void *)(v32 + 48) = v24;
    *(void *)(v32 + 56) = v25;
    *(void *)(v32 + 64) = v26;
    *(void *)(v32 + 72) = v27;
    *(_OWORD *)(v32 + 80) = v31;
    *(void *)(v32 + 96) = v28;
    *(void *)(v32 + 104) = v29;
    *(void *)(v32 + 112) = v30;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v35 = v33 + 2;
  if (v35 >= v11) {
    goto LABEL_26;
  }
  unint64_t v34 = *(void *)(v37 + 8 * v35);
  if (v34)
  {
    int64_t v7 = v35;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v7 = v35 + 1;
    if (__OFADD__(v35, 1)) {
      break;
    }
    if (v7 >= v11) {
      goto LABEL_26;
    }
    unint64_t v34 = *(void *)(v37 + 8 * v7);
    ++v35;
    if (v34) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

char *sub_25F3C75EC(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DA68);
    unint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 120);
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[120 * v8]) {
      memmove(v12, v13, 120 * v8);
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

char *sub_25F3C7708(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DA58);
    unint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
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

char *sub_25F3C780C(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DA38);
    unint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[24 * v8]) {
      memmove(v12, v13, 24 * v8);
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

uint64_t sub_25F3C7928(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a2 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a2 + 64);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v10 = 0;
  int64_t v11 = 0;
  while (1)
  {
    if (v7)
    {
      unint64_t v12 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v13 = v12 | (v11 << 6);
      goto LABEL_5;
    }
    int64_t v18 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_21;
    }
    if (v18 >= v8) {
      goto LABEL_19;
    }
    unint64_t v19 = *(void *)(v4 + 8 * v18);
    ++v11;
    if (!v19)
    {
      int64_t v11 = v18 + 1;
      if (v18 + 1 >= v8) {
        goto LABEL_19;
      }
      unint64_t v19 = *(void *)(v4 + 8 * v11);
      if (!v19) {
        break;
      }
    }
LABEL_18:
    unint64_t v7 = (v19 - 1) & v19;
    unint64_t v13 = __clz(__rbit64(v19)) + (v11 << 6);
LABEL_5:
    uint64_t v14 = *(void *)(*(void *)(a2 + 56) + 8 * v13);
    uint64_t v15 = *(void *)(a1 + 64);
    long long v16 = *(_OWORD *)(a1 + 16);
    v21[0] = *(_OWORD *)a1;
    v21[1] = v16;
    long long v17 = *(_OWORD *)(a1 + 48);
    v21[2] = *(_OWORD *)(a1 + 32);
    v21[3] = v17;
    uint64_t v22 = v15;
    sub_25F3F6C30();
    swift_bridgeObjectRetain();
    sub_25F3C7AC4((uint64_t)v21, v14);
    swift_bridgeObjectRelease();
    uint64_t result = sub_25F3F6C70();
    v10 ^= result;
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v8)
  {
LABEL_19:
    swift_release();
    return sub_25F3F6C30();
  }
  unint64_t v19 = *(void *)(v4 + 8 * v20);
  if (v19)
  {
    int64_t v11 = v20;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v11 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v11 >= v8) {
      goto LABEL_19;
    }
    unint64_t v19 = *(void *)(v4 + 8 * v11);
    ++v20;
    if (v19) {
      goto LABEL_18;
    }
  }
LABEL_21:
  __break(1u);
  return result;
}

uint64_t sub_25F3C7AC4(uint64_t a1, uint64_t a2)
{
  uint64_t v29 = a2 + 64;
  uint64_t v2 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v3 = -1;
  if (v2 < 64) {
    uint64_t v3 = ~(-1 << v2);
  }
  unint64_t v4 = v3 & *(void *)(a2 + 64);
  int64_t v30 = (unint64_t)(v2 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v6 = 0;
  for (int64_t i = 0; ; int64_t i = v33)
  {
    uint64_t v34 = v6;
    if (v4)
    {
      uint64_t v32 = (v4 - 1) & v4;
      int64_t v33 = i;
      unint64_t v8 = __clz(__rbit64(v4)) | (i << 6);
      goto LABEL_5;
    }
    int64_t v25 = i + 1;
    if (__OFADD__(i, 1))
    {
      __break(1u);
      goto LABEL_21;
    }
    if (v25 >= v30) {
      goto LABEL_19;
    }
    unint64_t v26 = *(void *)(v29 + 8 * v25);
    int64_t v27 = i + 1;
    if (!v26)
    {
      int64_t v27 = i + 2;
      if (i + 2 >= v30) {
        goto LABEL_19;
      }
      unint64_t v26 = *(void *)(v29 + 8 * v27);
      if (!v26) {
        break;
      }
    }
LABEL_18:
    uint64_t v32 = (v26 - 1) & v26;
    int64_t v33 = v27;
    unint64_t v8 = __clz(__rbit64(v26)) + (v27 << 6);
LABEL_5:
    uint64_t v9 = *(void *)(*(void *)(a2 + 48) + 8 * v8);
    uint64_t v10 = *(void *)(a2 + 56) + 120 * v8;
    uint64_t v11 = *(void *)v10;
    uint64_t v12 = *(void *)(v10 + 8);
    uint64_t v13 = *(void *)(v10 + 16);
    uint64_t v14 = *(void *)(v10 + 24);
    uint64_t v15 = *(void *)(v10 + 32);
    uint64_t v16 = *(void *)(v10 + 40);
    uint64_t v17 = *(void *)(v10 + 48);
    uint64_t v18 = *(void *)(v10 + 56);
    uint64_t v19 = *(void *)(v10 + 64);
    uint64_t v20 = *(void *)(v10 + 72);
    uint64_t v21 = *(void *)(v10 + 96);
    uint64_t v22 = *(void *)(v10 + 104);
    uint64_t v23 = *(void *)(v10 + 112);
    long long v24 = *(_OWORD *)(v10 + 80);
    v35[0] = v9;
    v35[1] = v11;
    v35[2] = v12;
    v35[3] = v13;
    id v35[4] = v14;
    v35[5] = v15;
    v35[6] = v16;
    v35[7] = v17;
    v35[8] = v18;
    v35[9] = v19;
    v35[10] = v20;
    long long v36 = v24;
    uint64_t v37 = v21;
    uint64_t v38 = v22;
    uint64_t v39 = v23;
    nullsub_1(v35);
    sub_25F3C965C((uint64_t)v35, (uint64_t)&v40);
    sub_25F3F6C30();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_25F3F61A0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_25F3F61A0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_25F3F61A0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_25F3F61A0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_25F3F61A0();
    swift_bridgeObjectRelease();
    sub_25F3F6C30();
    sub_25F3F6C30();
    sub_25F3F6C60();
    swift_bridgeObjectRetain();
    sub_25F3F61A0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    uint64_t result = sub_25F3F6C70();
    uint64_t v6 = result ^ v34;
    unint64_t v4 = v32;
  }
  uint64_t v28 = i + 3;
  if (i + 3 >= v30)
  {
LABEL_19:
    swift_release();
    return sub_25F3F6C30();
  }
  unint64_t v26 = *(void *)(v29 + 8 * v28);
  if (v26)
  {
    int64_t v27 = i + 3;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v27 = v28 + 1;
    if (__OFADD__(v28, 1)) {
      break;
    }
    if (v27 >= v30) {
      goto LABEL_19;
    }
    unint64_t v26 = *(void *)(v29 + 8 * v27);
    ++v28;
    if (v26) {
      goto LABEL_18;
    }
  }
LABEL_21:
  __break(1u);
  return result;
}

void *sub_25F3C7E7C(void *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 + 64);
  uint64_t v4 = a4 + 64;
  uint64_t v5 = v6;
  uint64_t v36 = v4;
  uint64_t v7 = -1 << *(unsigned char *)(v4 - 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & v5;
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_39:
    *uint64_t result = a4;
    result[1] = v36;
    result[2] = ~v7;
    result[3] = v12;
    result[4] = v9;
    return (void *)v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_39;
  }
  if (a3 < 0) {
    goto LABEL_41;
  }
  uint64_t v11 = a2;
  uint64_t v33 = -1 << *(unsigned char *)(v4 - 32);
  uint64_t v34 = result;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v35 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v14 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v15 = v14 | (v12 << 6);
  while (1)
  {
    ++v13;
    uint64_t v19 = *(void *)(a4 + 56) + 120 * v15;
    uint64_t v20 = *(void *)(v19 + 8);
    uint64_t v21 = *(void *)(v19 + 16);
    uint64_t v22 = *(void *)(v19 + 24);
    uint64_t v23 = *(void *)(v19 + 32);
    uint64_t v24 = *(void *)(v19 + 40);
    uint64_t v25 = *(void *)(v19 + 48);
    uint64_t v26 = *(void *)(v19 + 56);
    uint64_t v27 = *(void *)(v19 + 64);
    uint64_t v28 = *(void *)(v19 + 72);
    uint64_t v29 = *(void *)(v19 + 96);
    uint64_t v30 = *(void *)(v19 + 104);
    uint64_t v31 = *(void *)(v19 + 112);
    long long v32 = *(_OWORD *)(v19 + 80);
    *(void *)uint64_t v11 = *(void *)v19;
    *(void *)(v11 + 8) = v20;
    *(void *)(v11 + 16) = v21;
    *(void *)(v11 + 24) = v22;
    *(void *)(v11 + 32) = v23;
    *(void *)(v11 + 40) = v24;
    *(void *)(v11 + 48) = v25;
    *(void *)(v11 + 56) = v26;
    *(void *)(v11 + 64) = v27;
    *(void *)(v11 + 72) = v28;
    *(_OWORD *)(v11 + 80) = v32;
    *(void *)(v11 + 96) = v29;
    *(void *)(v11 + 104) = v30;
    *(void *)(v11 + 112) = v31;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 120;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      break;
    }
    if (v16 >= v35) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v36 + 8 * v16);
    if (!v17)
    {
      v12 += 2;
      if (v16 + 1 >= v35)
      {
        unint64_t v9 = 0;
        int64_t v12 = v16;
      }
      else
      {
        unint64_t v17 = *(void *)(v36 + 8 * v12);
        if (v17) {
          goto LABEL_14;
        }
        int64_t v18 = v16 + 2;
        if (v16 + 2 >= v35) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v36 + 8 * v18);
        if (v17)
        {
LABEL_17:
          int64_t v16 = v18;
          goto LABEL_18;
        }
        int64_t v12 = v16 + 3;
        if (v16 + 3 < v35)
        {
          unint64_t v17 = *(void *)(v36 + 8 * v12);
          if (v17)
          {
LABEL_14:
            int64_t v16 = v12;
            goto LABEL_18;
          }
          int64_t v18 = v16 + 4;
          if (v16 + 4 >= v35)
          {
LABEL_33:
            unint64_t v9 = 0;
            goto LABEL_37;
          }
          unint64_t v17 = *(void *)(v36 + 8 * v18);
          if (!v17)
          {
            while (1)
            {
              int64_t v16 = v18 + 1;
              if (__OFADD__(v18, 1)) {
                goto LABEL_42;
              }
              if (v16 >= v35)
              {
                unint64_t v9 = 0;
                int64_t v12 = v35 - 1;
                goto LABEL_37;
              }
              unint64_t v17 = *(void *)(v36 + 8 * v16);
              ++v18;
              if (v17) {
                goto LABEL_18;
              }
            }
          }
          goto LABEL_17;
        }
        unint64_t v9 = 0;
        int64_t v12 = v16 + 2;
      }
LABEL_37:
      uint64_t v10 = v13;
LABEL_38:
      uint64_t v7 = v33;
      uint64_t result = v34;
      goto LABEL_39;
    }
LABEL_18:
    unint64_t v9 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v16 << 6);
    int64_t v12 = v16;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_25F3C814C(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *uint64_t v5 = a4;
    v5[1] = v6;
    _OWORD v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    *uint64_t v11 = *(void *)(*(void *)(a4 + 56) + 8 * v16);
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    ++v11;
    uint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

void *sub_25F3C8348(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a4 + 64;
  uint64_t v6 = -1 << *(unsigned char *)(a4 + 32);
  if (-v6 < 64) {
    uint64_t v7 = ~(-1 << -(char)v6);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v11 = 0;
    uint64_t v9 = 0;
LABEL_39:
    *uint64_t result = a4;
    result[1] = v5;
    result[2] = ~v6;
    result[3] = v11;
    result[4] = v8;
    return (void *)v9;
  }
  uint64_t v9 = a3;
  if (!a3)
  {
    int64_t v11 = 0;
    goto LABEL_39;
  }
  if (a3 < 0) {
    goto LABEL_41;
  }
  uint64_t v10 = a2;
  uint64_t v22 = -1 << *(unsigned char *)(a4 + 32);
  uint64_t v23 = result;
  int64_t v11 = 0;
  uint64_t v12 = 0;
  int64_t v13 = (unint64_t)(63 - v6) >> 6;
  if (!v8) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v14 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  unint64_t v15 = v14 | (v11 << 6);
  while (1)
  {
    ++v12;
    int64_t v19 = (void *)(*(void *)(a4 + 56) + 24 * v15);
    uint64_t v20 = v19[1];
    uint64_t v21 = v19[2];
    *uint64_t v10 = *v19;
    v10[1] = v20;
    void v10[2] = v21;
    if (v12 == v9)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v10 += 3;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
    if (v8) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      break;
    }
    if (v16 >= v13) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v5 + 8 * v16);
    if (!v17)
    {
      v11 += 2;
      if (v16 + 1 >= v13)
      {
        unint64_t v8 = 0;
        int64_t v11 = v16;
      }
      else
      {
        unint64_t v17 = *(void *)(v5 + 8 * v11);
        if (v17) {
          goto LABEL_14;
        }
        int64_t v18 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v5 + 8 * v18);
        if (v17)
        {
LABEL_17:
          int64_t v16 = v18;
          goto LABEL_18;
        }
        int64_t v11 = v16 + 3;
        if (v16 + 3 < v13)
        {
          unint64_t v17 = *(void *)(v5 + 8 * v11);
          if (v17)
          {
LABEL_14:
            int64_t v16 = v11;
            goto LABEL_18;
          }
          int64_t v18 = v16 + 4;
          if (v16 + 4 >= v13)
          {
LABEL_33:
            unint64_t v8 = 0;
            goto LABEL_37;
          }
          unint64_t v17 = *(void *)(v5 + 8 * v18);
          if (!v17)
          {
            while (1)
            {
              int64_t v16 = v18 + 1;
              if (__OFADD__(v18, 1)) {
                goto LABEL_42;
              }
              if (v16 >= v13)
              {
                unint64_t v8 = 0;
                int64_t v11 = v13 - 1;
                goto LABEL_37;
              }
              unint64_t v17 = *(void *)(v5 + 8 * v16);
              ++v18;
              if (v17) {
                goto LABEL_18;
              }
            }
          }
          goto LABEL_17;
        }
        unint64_t v8 = 0;
        int64_t v11 = v16 + 2;
      }
LABEL_37:
      uint64_t v9 = v12;
LABEL_38:
      uint64_t v6 = v22;
      uint64_t result = v23;
      goto LABEL_39;
    }
LABEL_18:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v16 << 6);
    int64_t v11 = v16;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

char *sub_25F3C8568(uint64_t a1)
{
  return sub_25F3C75EC(0, *(void *)(a1 + 16), 0, (char *)a1);
}

char *sub_25F3C857C(uint64_t a1)
{
  return sub_25F3C7708(0, *(void *)(a1 + 16), 0, (char *)a1);
}

char *sub_25F3C8590(uint64_t a1)
{
  return sub_25F3C780C(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t _s31TextToSpeechVoiceBankingSupport23TTSVBTrainingScriptItemV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v32 = *(void *)(a1 + 56);
  uint64_t v33 = *(void *)(a1 + 48);
  uint64_t v30 = *(void *)(a1 + 72);
  uint64_t v31 = *(void *)(a1 + 64);
  uint64_t v25 = *(void *)(a1 + 88);
  double v6 = *(double *)(a1 + 96);
  uint64_t v22 = *(void *)(a1 + 112);
  uint64_t v23 = *(void *)(a1 + 104);
  uint64_t v8 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  uint64_t v10 = *(void *)(a2 + 32);
  uint64_t v9 = *(void *)(a2 + 40);
  uint64_t v12 = *(void *)(a2 + 48);
  uint64_t v11 = *(void *)(a2 + 56);
  uint64_t v29 = *(void *)(a2 + 64);
  uint64_t v27 = *(void *)(a1 + 80);
  uint64_t v28 = *(void *)(a2 + 72);
  uint64_t v26 = *(void *)(a2 + 80);
  uint64_t v24 = *(void *)(a2 + 88);
  double v13 = *(double *)(a2 + 96);
  uint64_t v20 = *(void *)(a2 + 112);
  uint64_t v21 = *(void *)(a2 + 104);
  if (*(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8)
    || (char v14 = sub_25F3F6B80(), result = 0, (v14 & 1) != 0))
  {
    if (v2 == v8 && v4 == v7 || (char v16 = sub_25F3F6B80(), result = 0, (v16 & 1) != 0))
    {
      if (v3 == v10 && v5 == v9 || (char v17 = sub_25F3F6B80(), result = 0, (v17 & 1) != 0))
      {
        if (v33 == v12 && v32 == v11 || (char v18 = sub_25F3F6B80(), result = 0, (v18 & 1) != 0))
        {
          if (v31 == v29 && v30 == v28)
          {
            uint64_t result = 0;
          }
          else
          {
            char v19 = sub_25F3F6B80();
            uint64_t result = 0;
            if ((v19 & 1) == 0) {
              return result;
            }
          }
          if (v27 == v26 && v25 == v24 && v6 == v13)
          {
            if (v23 == v21 && v22 == v20)
            {
              return 1;
            }
            else
            {
              return sub_25F3F6B80();
            }
          }
        }
      }
    }
  }
  return result;
}

unint64_t sub_25F3C87DC()
{
  unint64_t result = qword_26A78D9F8;
  if (!qword_26A78D9F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A78D9F8);
  }
  return result;
}

uint64_t sub_25F3C8830@<X0>(uint64_t *a1@<X8>)
{
  return sub_25F3C2098(a1);
}

uint64_t sub_25F3C884C()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25F3C8884()
{
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_25F3C88CC(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  return sub_25F3C2130(a1, a2, a3, *(void *)(v3 + 16), *(void *)(v3 + 24));
}

uint64_t sub_25F3C88D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3988B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

BOOL _s31TextToSpeechVoiceBankingSupport17TTSVBTrainingBookV0G9ParagraphV1loiySbAE_AEtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  if (*(void *)(*a1 + 16) && (unint64_t v4 = sub_25F3C3DFC(0), (v5 & 1) != 0))
  {
    uint64_t v6 = *(void *)(*(void *)(v2 + 56) + 120 * v4 + 80);
    if (!*(void *)(v3 + 16)) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v6 = -1;
    if (!*(void *)(v3 + 16))
    {
LABEL_8:
      uint64_t v9 = -1;
      return v6 < v9;
    }
  }
  unint64_t v7 = sub_25F3C3DFC(0);
  if ((v8 & 1) == 0) {
    goto LABEL_8;
  }
  uint64_t v9 = *(void *)(*(void *)(v3 + 56) + 120 * v7 + 80);
  return v6 < v9;
}

unint64_t sub_25F3C89D8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return MEMORY[0x263F8EE80];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DA50);
  uint64_t v3 = (void *)sub_25F3F69B0();
  long long v4 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)&v29[64] = *(_OWORD *)(a1 + 96);
  *(_OWORD *)uint64_t v30 = v4;
  long long v5 = *(_OWORD *)(a1 + 144);
  *(_OWORD *)&v30[16] = *(_OWORD *)(a1 + 128);
  long long v31 = v5;
  long long v6 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)uint64_t v29 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)&v29[16] = v6;
  long long v7 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)&v29[32] = *(_OWORD *)(a1 + 64);
  *(_OWORD *)&v29[48] = v7;
  uint64_t v8 = *(void *)v29;
  unint64_t result = sub_25F3C3DFC(*(uint64_t *)v29);
  if (v10)
  {
LABEL_7:
    __break(1u);
    return MEMORY[0x263F8EE80];
  }
  uint64_t v11 = (_OWORD *)(a1 + 160);
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v8;
    uint64_t v12 = v3[7] + 120 * result;
    long long v13 = *(_OWORD *)&v29[24];
    long long v14 = *(_OWORD *)&v29[40];
    long long v15 = *(_OWORD *)&v29[56];
    uint64_t v16 = *(void *)&v29[72];
    uint64_t v17 = *(void *)v30;
    uint64_t v18 = *(void *)&v30[24];
    long long v19 = v31;
    long long v20 = *(_OWORD *)&v30[8];
    *(_OWORD *)uint64_t v12 = *(_OWORD *)&v29[8];
    *(_OWORD *)(v12 + 16) = v13;
    *(_OWORD *)(v12 + 32) = v14;
    *(_OWORD *)(v12 + 48) = v15;
    *(void *)(v12 + 64) = v16;
    *(void *)(v12 + 72) = v17;
    *(_OWORD *)(v12 + 80) = v20;
    *(void *)(v12 + 96) = v18;
    *(_OWORD *)(v12 + 104) = v19;
    uint64_t v21 = v3[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22) {
      break;
    }
    v3[2] = v23;
    sub_25F3C96C4((uint64_t)v29);
    if (!--v1) {
      return (unint64_t)v3;
    }
    long long v24 = v11[5];
    *(_OWORD *)&v29[64] = v11[4];
    *(_OWORD *)uint64_t v30 = v24;
    long long v25 = v11[7];
    *(_OWORD *)&v30[16] = v11[6];
    long long v31 = v25;
    long long v26 = v11[1];
    *(_OWORD *)uint64_t v29 = *v11;
    *(_OWORD *)&v29[16] = v26;
    long long v27 = v11[3];
    *(_OWORD *)&v29[32] = v11[2];
    *(_OWORD *)&v29[48] = v27;
    uint64_t v8 = *(void *)v29;
    unint64_t result = sub_25F3C3DFC(*(uint64_t *)v29);
    v11 += 8;
    if (v28) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

unint64_t sub_25F3C8B48(void *a1)
{
  uint64_t v1 = a1[2];
  if (!v1) {
    return MEMORY[0x263F8EE80];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DA48);
  uint64_t v3 = (void *)sub_25F3F69B0();
  uint64_t v5 = a1[4];
  uint64_t v4 = a1[5];
  unint64_t result = sub_25F3C3DFC(v5);
  if (v7)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    return (unint64_t)v3;
  }
  uint64_t v8 = a1 + 7;
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = 8 * result;
    *(void *)(v3[6] + v9) = v5;
    *(void *)(v3[7] + v9) = v4;
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      break;
    }
    v3[2] = v12;
    if (!--v1) {
      goto LABEL_8;
    }
    long long v13 = v8 + 2;
    uint64_t v5 = *(v8 - 1);
    uint64_t v14 = *v8;
    swift_bridgeObjectRetain();
    unint64_t result = sub_25F3C3DFC(v5);
    uint64_t v8 = v13;
    uint64_t v4 = v14;
    if (v15) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_25F3C8C48(uint64_t a1)
{
  return a1;
}

uint64_t sub_25F3C8CC0(uint64_t a1)
{
  return a1;
}

unint64_t sub_25F3C8D3C()
{
  unint64_t result = qword_26A78DA08;
  if (!qword_26A78DA08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A78DA08);
  }
  return result;
}

unint64_t sub_25F3C8D94()
{
  unint64_t result = qword_26A78DA10;
  if (!qword_26A78DA10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A78DA10);
  }
  return result;
}

unint64_t sub_25F3C8DEC()
{
  unint64_t result = qword_26A78DA18;
  if (!qword_26A78DA18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A78DA18);
  }
  return result;
}

unint64_t sub_25F3C8E44()
{
  unint64_t result = qword_26A78DA20;
  if (!qword_26A78DA20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A78DA20);
  }
  return result;
}

unint64_t sub_25F3C8E9C()
{
  unint64_t result = qword_26A78DA28;
  if (!qword_26A78DA28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A78DA28);
  }
  return result;
}

unint64_t sub_25F3C8EF4()
{
  unint64_t result = qword_26A78DA30;
  if (!qword_26A78DA30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A78DA30);
  }
  return result;
}

uint64_t destroy for TTSVBTrainingScriptItem()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for TTSVBTrainingScriptItem(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  uint64_t v7 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v7;
  long long v8 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v8;
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for TTSVBTrainingScriptItem(void *a1, void *a2)
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
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[10] = a2[10];
  a1[11] = a2[11];
  a1[12] = a2[12];
  a1[13] = a2[13];
  a1[14] = a2[14];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy120_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  __n128 result = (__n128)a2[4];
  long long v6 = a2[5];
  long long v7 = a2[6];
  *(void *)(a1 + 112) = *((void *)a2 + 14);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t assignWithTake for TTSVBTrainingScriptItem(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v8;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  uint64_t v9 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v9;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TTSVBTrainingScriptItem(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 120)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TTSVBTrainingScriptItem(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 120) = 1;
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
    *(unsigned char *)(result + 120) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TTSVBTrainingScriptItem()
{
  return &type metadata for TTSVBTrainingScriptItem;
}

uint64_t getEnumTagSinglePayload for TTSVBTrainingScriptItem.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF8) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 8;
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
      return (*a1 | (v4 << 8)) - 8;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 8;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 9;
  int v8 = v6 - 9;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for TTSVBTrainingScriptItem.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 8;
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
        JUMPOUT(0x25F3C9418);
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
          *__n128 result = a2 + 8;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TTSVBTrainingScriptItem.CodingKeys()
{
  return &type metadata for TTSVBTrainingScriptItem.CodingKeys;
}

ValueMetadata *type metadata accessor for TTSVBTrainingScript()
{
  return &type metadata for TTSVBTrainingScript;
}

uint64_t destroy for TTSVBTrainingBook()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *_s31TextToSpeechVoiceBankingSupport17TTSVBTrainingBookVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for TTSVBTrainingBook(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for TTSVBTrainingBook(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TTSVBTrainingBook(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for TTSVBTrainingBook(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for TTSVBTrainingBook()
{
  return &type metadata for TTSVBTrainingBook;
}

ValueMetadata *type metadata accessor for TTSVBTrainingBook.TTSVBTrainingParagraph()
{
  return &type metadata for TTSVBTrainingBook.TTSVBTrainingParagraph;
}

uint64_t sub_25F3C964C(uint64_t a1, uint64_t a2)
{
  return assignWithTake for TTSVBTrainingScriptItem(a2, a1);
}

uint64_t sub_25F3C965C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DA60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25F3C96C4(uint64_t a1)
{
  return a1;
}

uint64_t sub_25F3C973C()
{
  return sub_25F3F57C0();
}

unint64_t sub_25F3C97A4()
{
  unint64_t result = qword_26A78DA70;
  if (!qword_26A78DA70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A78DA70);
  }
  return result;
}

uint64_t TTSVBVoiceSampleTrainingValidity.rawValue.getter()
{
  return *v0;
}

uint64_t TTSVBVoiceSampleTrainingValidity.init(rawValue:)@<X0>(uint64_t result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

void static TTSVBVoiceSampleTrainingValidity.valid.getter(_DWORD *a1@<X8>)
{
  *a1 = 0;
}

void *sub_25F3C9814()
{
  return &unk_25F400FA4;
}

void static TTSVBVoiceSampleTrainingValidity.invalidASRUserEditScore.getter(_DWORD *a1@<X8>)
{
  *a1 = 1;
}

void *sub_25F3C982C()
{
  return &unk_25F400FA8;
}

void static TTSVBVoiceSampleTrainingValidity.invalidSNR.getter(_DWORD *a1@<X8>)
{
  *a1 = 2;
}

void *sub_25F3C9844()
{
  return &unk_25F400FAC;
}

void static TTSVBVoiceSampleTrainingValidity.invalidSPL.getter(_DWORD *a1@<X8>)
{
  *a1 = 4;
}

void *static TTSVBVoiceSampleTrainingValidity.evaluate(userScore:spl:splThreshold:snr:snrThreshold:)@<X0>(void *result@<X0>, _DWORD *a2@<X8>, float a3@<S0>, float a4@<S1>, float a5@<S2>, float a6@<S3>)
{
  LOWORD(v10) = (_WORD)result;
  if (((unsigned __int16)result & 0x8000) != 0 && (int v10 = -(__int16)result, (__int16)result + (__int16)-(__int16)result))
  {
    __break(1u);
  }
  else
  {
    unint64_t result = sub_25F34A410();
    int v12 = *result < (__int16)v10;
    if (a4 < a3) {
      v12 |= 4u;
    }
    if (a5 < a6) {
      v12 |= 2u;
    }
    *a2 = v12;
  }
  return result;
}

BOOL TTSVBVoiceSampleTrainingValidity.isValid.getter()
{
  return *v0 == 0;
}

unint64_t TTSVBVoiceSampleTrainingValidity.stringValue.getter()
{
  int v1 = *v0;
  if (*v0)
  {
    uint64_t v2 = MEMORY[0x263F8EE78];
    if ((v1 & 2) != 0)
    {
      uint64_t v11 = MEMORY[0x263F8EE78];
      sub_25F3C9F68(0, 1, 1);
      uint64_t v2 = v11;
      unint64_t v5 = *(void *)(v11 + 16);
      unint64_t v4 = *(void *)(v11 + 24);
      if (v5 >= v4 >> 1)
      {
        sub_25F3C9F68((char *)(v4 > 1), v5 + 1, 1);
        uint64_t v2 = v11;
      }
      *(void *)(v2 + 16) = v5 + 1;
      *(_DWORD *)(v2 + 4 * v5 + 32) = 2;
      if ((v1 & 4) == 0)
      {
LABEL_4:
        if ((v1 & 1) == 0)
        {
LABEL_20:
          sub_25F3C9B70(v2);
          swift_release();
          __swift_instantiateConcreteTypeFromMangledName(&qword_26B398C98);
          sub_25F34B624();
          uint64_t v3 = sub_25F3F6070();
          swift_bridgeObjectRelease();
          return v3;
        }
LABEL_15:
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_25F3C9F68(0, *(void *)(v2 + 16) + 1, 1);
        }
        unint64_t v9 = *(void *)(v2 + 16);
        unint64_t v8 = *(void *)(v2 + 24);
        if (v9 >= v8 >> 1) {
          sub_25F3C9F68((char *)(v8 > 1), v9 + 1, 1);
        }
        *(void *)(v2 + 16) = v9 + 1;
        *(_DWORD *)(v2 + 4 * v9 + 32) = 1;
        goto LABEL_20;
      }
    }
    else if ((v1 & 4) == 0)
    {
      goto LABEL_4;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      sub_25F3C9F68(0, *(void *)(v2 + 16) + 1, 1);
    }
    unint64_t v7 = *(void *)(v2 + 16);
    unint64_t v6 = *(void *)(v2 + 24);
    if (v7 >= v6 >> 1) {
      sub_25F3C9F68((char *)(v6 > 1), v7 + 1, 1);
    }
    *(void *)(v2 + 16) = v7 + 1;
    *(_DWORD *)(v2 + 4 * v7 + 32) = 4;
    if ((v1 & 1) == 0) {
      goto LABEL_20;
    }
    goto LABEL_15;
  }
  return 0xD000000000000012;
}

unint64_t TTSVBVoiceSampleTrainingValidity.debugDescription.getter()
{
  unint64_t v1 = 0xD000000000000014;
  int v2 = *v0;
  if ((*v0 & 4) != 0) {
    unint64_t v3 = 0xD000000000000015;
  }
  else {
    unint64_t v3 = 0;
  }
  if ((v2 & 2) == 0) {
    unint64_t v1 = v3;
  }
  if (v2) {
    return 0xD000000000000022;
  }
  else {
    return v1;
  }
}

uint64_t sub_25F3C9B70(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t result = MEMORY[0x263F8EE78];
  if (v2)
  {
    uint64_t v19 = MEMORY[0x263F8EE78];
    sub_25F34BAB4(0, v2, 0);
    uint64_t result = v19;
    unint64_t v4 = (int *)(a1 + 32);
    unint64_t v5 = 0x800000025F407E00;
    unint64_t v6 = 0x800000025F407DE0;
    do
    {
      int v8 = *v4++;
      char v7 = v8;
      BOOL v9 = (v8 & 4) == 0;
      if ((v8 & 4) != 0) {
        unint64_t v10 = 0xD000000000000015;
      }
      else {
        unint64_t v10 = 0;
      }
      if (v9) {
        unint64_t v11 = 0xE000000000000000;
      }
      else {
        unint64_t v11 = 0x800000025F407DC0;
      }
      if ((v7 & 2) != 0)
      {
        unint64_t v10 = 0xD000000000000014;
        unint64_t v11 = v6;
      }
      if (v7) {
        unint64_t v12 = 0xD000000000000022;
      }
      else {
        unint64_t v12 = v10;
      }
      if (v7) {
        unint64_t v13 = v5;
      }
      else {
        unint64_t v13 = v11;
      }
      uint64_t v20 = result;
      unint64_t v15 = *(void *)(result + 16);
      unint64_t v14 = *(void *)(result + 24);
      if (v15 >= v14 >> 1)
      {
        unint64_t v17 = v6;
        unint64_t v18 = v5;
        sub_25F34BAB4((char *)(v14 > 1), v15 + 1, 1);
        unint64_t v6 = v17;
        unint64_t v5 = v18;
        uint64_t result = v20;
      }
      *(void *)(result + 16) = v15 + 1;
      uint64_t v16 = result + 16 * v15;
      *(void *)(v16 + 32) = v12;
      *(void *)(v16 + 40) = v13;
      --v2;
    }
    while (v2);
  }
  return result;
}

uint64_t TTSVBVoiceSampleTrainingValidity.localizedValidTitle.getter()
{
  if ((*v0 & 1) == 0 && (*v0 & 4) == 0) {
    return 0;
  }
  int64_t v2 = (void *)sub_25F3F6100();
  id v3 = TTSVBSupportLocString(v2);

  uint64_t v1 = sub_25F3F6130();
  return v1;
}

uint64_t TTSVBVoiceSampleTrainingValidity.localizedInvalidTitle.getter()
{
  int v1 = *v0;
  if ((*v0 & 1) == 0 && (v1 & 2) == 0 && (v1 & 4) == 0) {
    return 0;
  }
  id v3 = (void *)sub_25F3F6100();
  id v4 = TTSVBSupportLocString(v3);

  uint64_t v2 = sub_25F3F6130();
  return v2;
}

uint64_t TTSVBVoiceSampleTrainingValidity.localizedValidDescription.getter()
{
  int v1 = *v0;
  if ((*v0 & 1) == 0 && (v1 & 2) == 0 && (v1 & 4) == 0) {
    return 0;
  }
  id v3 = (void *)sub_25F3F6100();
  id v4 = TTSVBSupportLocString(v3);

  uint64_t v2 = sub_25F3F6130();
  return v2;
}

uint64_t TTSVBVoiceSampleTrainingValidity.localizedInvalidDescription.getter()
{
  int v1 = *v0;
  if ((*v0 & 1) == 0 && (v1 & 2) == 0 && (v1 & 4) == 0) {
    return 0;
  }
  id v3 = (void *)sub_25F3F6100();
  id v4 = TTSVBSupportLocString(v3);

  uint64_t v2 = sub_25F3F6130();
  return v2;
}

char *sub_25F3C9F68(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_25F3CA0A4(a1, a2, a3, *v3);
  *id v3 = result;
  return result;
}

unint64_t sub_25F3C9F8C()
{
  unint64_t result = qword_26A78DA78;
  if (!qword_26A78DA78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A78DA78);
  }
  return result;
}

unint64_t sub_25F3C9FE8()
{
  unint64_t result = qword_26A78DA80;
  if (!qword_26A78DA80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A78DA80);
  }
  return result;
}

unint64_t sub_25F3CA040()
{
  unint64_t result = qword_26A78DA88;
  if (!qword_26A78DA88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A78DA88);
  }
  return result;
}

ValueMetadata *type metadata accessor for TTSVBVoiceSampleTrainingValidity()
{
  return &type metadata for TTSVBVoiceSampleTrainingValidity;
}

char *sub_25F3CA0A4(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DA90);
    unint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 29;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8]) {
      memmove(v13, v14, 4 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 4 * v8);
  }
  swift_release();
  return v10;
}

id *static String.tccService_voicebanking.getter()
{
  return sub_25F3CA1D0(MEMORY[0x263F7C668]);
}

id *static String.tccService_liverpool.getter()
{
  return sub_25F3CA1D0(MEMORY[0x263F7C578]);
}

id *static String.tccInfoKey_bundle.getter()
{
  return sub_25F3CA1D0(MEMORY[0x263F7C4C0]);
}

id *static String.tccInfoKey_granted.getter()
{
  return sub_25F3CA1D0(MEMORY[0x263F7C4D0]);
}

id *sub_25F3CA1D0(id *result)
{
  if (*result)
  {
    id v1 = *result;
    uint64_t v2 = sub_25F3F6130();

    return (id *)v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t TTSVBTCCInfo.localizedName.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TTSVBTCCInfo.granted.getter()
{
  return *(unsigned __int8 *)(v0 + 32);
}

uint64_t TTSVBTCCInfo.granted.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 32) = result;
  return result;
}

uint64_t (*TTSVBTCCInfo.granted.modify())()
{
  return nullsub_1;
}

uint64_t static TTSVBTCCInfo.query(service:)(uint64_t a1, unint64_t a2)
{
  v23[4] = *MEMORY[0x263EF8340];
  id v4 = (void *)sub_25F3F6100();
  char v5 = (void *)TCCAccessCopyInformation();

  if (v5)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B398C80);
    sub_25F3F62F0();
  }
  else
  {
    uint64_t v6 = sub_25F3EF89C();
    uint64_t v7 = sub_25F3F5EA0();
    uint64_t v8 = *(void *)(v7 - 8);
    double v9 = MEMORY[0x270FA5388](v7);
    int64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, uint64_t, uint64_t, double))(v8 + 16))(v11, v6, v7, v9);
    swift_bridgeObjectRetain_n();
    uint64_t v12 = sub_25F3F5E80();
    os_log_type_t v13 = sub_25F3F64C0();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = swift_slowAlloc();
      uint64_t v21 = &v19;
      unint64_t v15 = (uint8_t *)v14;
      uint64_t v16 = swift_slowAlloc();
      uint64_t v20 = v7;
      uint64_t v17 = v16;
      v23[0] = v16;
      *(_DWORD *)unint64_t v15 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)&long long v22 = sub_25F2FE464(a1, a2, v23);
      sub_25F3F66A0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25F2F5000, v12, v13, "No TCC service for %s", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611F21E0](v17, -1, -1);
      MEMORY[0x2611F21E0](v15, -1, -1);

      (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v20);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
    }
  }
  return MEMORY[0x263F8EE78];
}

uint64_t TTSVBTCCInfo.id.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

Swift::Void __swiftcall TTSVBTCCInfo.updateStatus(_:)(Swift::Bool a1)
{
  if (*MEMORY[0x263F7C668])
  {
    id v3 = (id)*MEMORY[0x263F7C668];
    sub_25F3F6130();

    id v4 = (void *)sub_25F3F6100();
    swift_bridgeObjectRelease();
    uint64_t v5 = *(void *)(v1 + 16);
    uint64_t v6 = *(void *)(v1 + 24);
    uint64_t v7 = (void *)sub_25F3F6100();
    TCCAccessSetForBundleId();

    *(void *)(v1 + 16) = v5;
    *(void *)(v1 + 24) = v6;
    *(unsigned char *)(v1 + 32) = a1;
  }
  else
  {
    __break(1u);
  }
}

uint64_t TTSVBTCCInfo.hash(into:)()
{
  return sub_25F3F6C40();
}

uint64_t TTSVBTCCInfo.hashValue.getter()
{
  return sub_25F3F6C70();
}

uint64_t sub_25F3CAAEC()
{
  return sub_25F3F6C70();
}

uint64_t sub_25F3CAB8C()
{
  return sub_25F3F6C40();
}

uint64_t sub_25F3CAC14()
{
  return sub_25F3F6C70();
}

uint64_t sub_25F3CACB0@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 24);
  *a1 = *(void *)(v1 + 16);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

void *sub_25F3CACC0(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DAA8);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      void v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
      uint64_t v12 = v10 + 4;
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
      uint64_t v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_25F3CAE38(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void type metadata accessor for CFBundle()
{
  if (!qword_26A78DAA0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_26A78DAA0);
    }
  }
}

uint64_t sub_25F3CAE38(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_25F3F69C0();
  __break(1u);
  return result;
}

uint64_t _s31TextToSpeechVoiceBankingSupport12TTSVBTCCInfoV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void *)(a1 + 24);
  int v4 = *(unsigned __int8 *)(a1 + 32);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  int v7 = *(unsigned __int8 *)(a2 + 32);
  BOOL v8 = *(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8);
  if (v8 || (char v9 = sub_25F3F6B80(), result = 0, (v9 & 1) != 0))
  {
    if (v2 == v5 && v3 == v6) {
      return v4 ^ v7 ^ 1u;
    }
    char v12 = sub_25F3F6B80();
    uint64_t result = 0;
    if (v12) {
      return v4 ^ v7 ^ 1u;
    }
  }
  return result;
}

unint64_t sub_25F3CAFDC()
{
  unint64_t result = qword_26A78DA98;
  if (!qword_26A78DA98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A78DA98);
  }
  return result;
}

uint64_t destroy for TTSVBTCCInfo()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for TTSVBTCCInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TTSVBTCCInfo(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for TTSVBTCCInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for TTSVBTCCInfo(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 33)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TTSVBTCCInfo(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 33) = 1;
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
    *(unsigned char *)(result + 33) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TTSVBTCCInfo()
{
  return &type metadata for TTSVBTCCInfo;
}

uint64_t TTSVBVoiceSample.url.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for TTSVBVoiceSample();
  return sub_25F3078D4(v1 + *(int *)(v3 + 20), a1, &qword_26B398888);
}

uint64_t type metadata accessor for TTSVBVoiceSample()
{
  uint64_t result = qword_26A79F1A0;
  if (!qword_26A79F1A0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

double TTSVBVoiceSample.recordingDuration.getter()
{
  return *(double *)(v0 + *(int *)(type metadata accessor for TTSVBVoiceSample() + 24));
}

uint64_t TTSVBVoiceSample.phonemes.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for TTSVBVoiceSample() + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TTSVBVoiceSample.phrase.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for TTSVBVoiceSample() + 32));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TTSVBVoiceSample.transcript.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for TTSVBVoiceSample() + 36));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TTSVBVoiceSample.bookTitle.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for TTSVBVoiceSample() + 40));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TTSVBVoiceSample.paragraphIndex.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for TTSVBVoiceSample() + 44));
}

uint64_t TTSVBVoiceSample.sentenceIndex.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for TTSVBVoiceSample() + 48));
}

double TTSVBVoiceSample.estimatedDuration.getter()
{
  return *(double *)(v0 + *(int *)(type metadata accessor for TTSVBVoiceSample() + 52));
}

uint64_t TTSVBVoiceSample.locale.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for TTSVBVoiceSample() + 56));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TTSVBVoiceSample.recordingDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for TTSVBVoiceSample();
  return sub_25F3078D4(v1 + *(int *)(v3 + 60), a1, &qword_26B398898);
}

uint64_t TTSVBVoiceSample.userPhrase.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for TTSVBVoiceSample() + 64));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TTSVBVoiceSample.userScore.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for TTSVBVoiceSample() + 68));
}

float TTSVBVoiceSample.spl.getter()
{
  return *(float *)(v0 + *(int *)(type metadata accessor for TTSVBVoiceSample() + 72));
}

float TTSVBVoiceSample.snr.getter()
{
  return *(float *)(v0 + *(int *)(type metadata accessor for TTSVBVoiceSample() + 76));
}

float TTSVBVoiceSample.splThreshold.getter()
{
  return *(float *)(v0 + *(int *)(type metadata accessor for TTSVBVoiceSample() + 80));
}

float TTSVBVoiceSample.snrThreshold.getter()
{
  return *(float *)(v0 + *(int *)(type metadata accessor for TTSVBVoiceSample() + 84));
}

uint64_t TTSVBVoiceSample.flags.getter@<X0>(_DWORD *a1@<X8>)
{
  uint64_t result = type metadata accessor for TTSVBVoiceSample();
  *a1 = *(_DWORD *)(v1 + *(int *)(result + 88));
  return result;
}

uint64_t TTSVBVoiceSample.hasVoiceRecording.getter()
{
  uint64_t v1 = sub_25F3F5B60();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = v0 + *(int *)(type metadata accessor for TTSVBVoiceSample() + 20);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B398888);
  MEMORY[0x270FA5388](v6 - 8);
  BOOL v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25F3078D4(v5, (uint64_t)v8, &qword_26B398888);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v8, 1, v1) == 1)
  {
    sub_25F307B78((uint64_t)v8, &qword_26B398888);
    unsigned __int8 v9 = 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v4, v8, v1);
    v11[1] = *sub_25F39FB9C();
    unsigned __int8 v9 = _TTSVBFileManager.fileExists(_:)();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  return v9 & 1;
}

uint64_t TTSVBVoiceSample.trainingValidity.getter@<X0>(_DWORD *a1@<X8>)
{
  uint64_t v3 = (int *)type metadata accessor for TTSVBVoiceSample();
  uint64_t result = *(void *)(v1 + v3[17]);
  if (result < -32768)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (result >= 0x8000)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  float v5 = *(float *)(v1 + v3[18]);
  float v6 = *(float *)(v1 + v3[20]);
  float v7 = *(float *)(v1 + v3[19]);
  float v8 = *(float *)(v1 + v3[21]);

  return (uint64_t)static TTSVBVoiceSampleTrainingValidity.evaluate(userScore:spl:splThreshold:snr:snrThreshold:)((void *)result, a1, v5, v6, v7, v8);
}

uint64_t TTSVBVoiceSample.init(sampleID:url:recordingDuration:phonemes:phrase:transcript:bookTitle:paragraphIndex:sentenceIndex:estimatedDuration:locale:recordingDate:userPhrase:userScore:spl:snr:splThreshold:snrThreshold:flags:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>, double a10@<D0>, double a11@<D1>, float a12@<S2>, float a13@<S3>, float a14@<S4>, float a15@<S5>, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,int *a27)
{
  int v48 = *a27;
  *a9 = a1;
  a9[1] = a2;
  uint64_t v37 = (int *)type metadata accessor for TTSVBVoiceSample();
  sub_25F307A7C(a3, (uint64_t)a9 + v37[5], &qword_26B398888);
  *(double *)((char *)a9 + v37[6]) = a10;
  uint64_t v38 = (void *)((char *)a9 + v37[7]);
  *uint64_t v38 = a4;
  v38[1] = a5;
  uint64_t v39 = (void *)((char *)a9 + v37[8]);
  *uint64_t v39 = a6;
  v39[1] = a7;
  uint64_t v40 = (void *)((char *)a9 + v37[9]);
  *uint64_t v40 = a8;
  v40[1] = a16;
  int64_t v41 = (void *)((char *)a9 + v37[10]);
  *int64_t v41 = a17;
  v41[1] = a18;
  *(void *)((char *)a9 + v37[11]) = a19;
  *(void *)((char *)a9 + v37[12]) = a20;
  *(double *)((char *)a9 + v37[13]) = a11;
  unint64_t v42 = (void *)((char *)a9 + v37[14]);
  *unint64_t v42 = a21;
  v42[1] = a22;
  uint64_t result = sub_25F307A7C(a23, (uint64_t)a9 + v37[15], &qword_26B398898);
  char v44 = (void *)((char *)a9 + v37[16]);
  *char v44 = a24;
  v44[1] = a25;
  *(void *)((char *)a9 + v37[17]) = a26;
  *(float *)((char *)a9 + v37[18]) = a12;
  *(float *)((char *)a9 + v37[19]) = a13;
  *(float *)((char *)a9 + v37[20]) = a14;
  *(float *)((char *)a9 + v37[21]) = a15;
  *(_DWORD *)((char *)a9 + v37[22]) = v48;
  return result;
}

uint64_t TTSVBVoiceSample.id.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TTSVBVoiceSample.description.getter()
{
  return 0x4449656C706D6153;
}

uint64_t TTSVBVoiceSample.hash(into:)()
{
  uint64_t v1 = v0;
  swift_bridgeObjectRetain();
  sub_25F3F61A0();
  swift_bridgeObjectRelease();
  uint64_t v2 = (int *)type metadata accessor for TTSVBVoiceSample();
  uint64_t v3 = v0 + v2[5];
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B398888);
  MEMORY[0x270FA5388](v4 - 8);
  float v6 = (char *)v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25F3078D4(v3, (uint64_t)v6, &qword_26B398888);
  uint64_t v7 = sub_25F3F5B60();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7);
  if (v9 == 1)
  {
    sub_25F3F6C40();
  }
  else
  {
    double v10 = MEMORY[0x270FA5388](v9);
    char v12 = (char *)v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, char *, uint64_t, double))(v8 + 32))(v12, v6, v7, v10);
    sub_25F3F6C40();
    sub_25F3D054C(&qword_26A78CB70, MEMORY[0x270FA8E20]);
    sub_25F3F6050();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v12, v7);
  }
  sub_25F3F6C60();
  swift_bridgeObjectRetain();
  sub_25F3F61A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25F3F61A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25F3F61A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25F3F61A0();
  swift_bridgeObjectRelease();
  sub_25F3F6C30();
  sub_25F3F6C30();
  sub_25F3F6C60();
  swift_bridgeObjectRetain();
  sub_25F3F61A0();
  swift_bridgeObjectRelease();
  uint64_t v13 = v1 + v2[15];
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B398898);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25F3078D4(v13, (uint64_t)v16, &qword_26B398898);
  uint64_t v17 = sub_25F3F5CC0();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17);
  if (v19 == 1)
  {
    sub_25F3F6C40();
  }
  else
  {
    double v20 = MEMORY[0x270FA5388](v19);
    long long v22 = (char *)v24 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, char *, uint64_t, double))(v18 + 32))(v22, v16, v17, v20);
    sub_25F3F6C40();
    sub_25F3D054C(&qword_26A78D190, MEMORY[0x270FA9160]);
    sub_25F3F6050();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v22, v17);
  }
  if (*(void *)(v1 + v2[16] + 8))
  {
    sub_25F3F6C40();
    swift_bridgeObjectRetain();
    sub_25F3F61A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_25F3F6C40();
  }
  sub_25F3F6C30();
  sub_25F3F6C50();
  sub_25F3F6C50();
  sub_25F3F6C50();
  sub_25F3F6C50();
  v24[3] = *(_DWORD *)(v1 + v2[22]);
  sub_25F3CD6D8();
  return sub_25F3F6050();
}

uint64_t sub_25F3CC010(char a1)
{
  uint64_t result = 0x4449656C706D6173;
  switch(a1)
  {
    case 1:
      uint64_t result = 7107189;
      break;
    case 2:
    case 9:
      uint64_t result = 0xD000000000000011;
      break;
    case 3:
      uint64_t result = 0x73656D656E6F6870;
      break;
    case 4:
      uint64_t result = 0x657361726870;
      break;
    case 5:
      uint64_t result = 0x697263736E617274;
      break;
    case 6:
      uint64_t result = 0x6C7469546B6F6F62;
      break;
    case 7:
      uint64_t result = 0x7061726761726170;
      break;
    case 8:
      uint64_t result = 0x65636E65746E6573;
      break;
    case 10:
      uint64_t result = 0x656C61636F6CLL;
      break;
    case 11:
      uint64_t result = 0x6E6964726F636572;
      break;
    case 12:
      uint64_t result = 0x6172685072657375;
      break;
    case 13:
      uint64_t result = 0x726F635372657375;
      break;
    case 14:
      uint64_t result = 7106675;
      break;
    case 15:
      uint64_t result = 7499379;
      break;
    case 16:
      unsigned int v3 = 1416392819;
      goto LABEL_19;
    case 17:
      unsigned int v3 = 1416785523;
LABEL_19:
      uint64_t result = v3 | 0x7365726800000000;
      break;
    case 18:
      uint64_t result = 0x7367616C66;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25F3CC248()
{
  return sub_25F3CC010(*v0);
}

uint64_t sub_25F3CC250@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25F3CFD60(a1, a2);
  *a3 = result;
  return result;
}

void sub_25F3CC278(unsigned char *a1@<X8>)
{
  *a1 = 19;
}

uint64_t sub_25F3CC284(uint64_t a1)
{
  unint64_t v2 = sub_25F3CE194();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25F3CC2C0(uint64_t a1)
{
  unint64_t v2 = sub_25F3CE194();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t TTSVBVoiceSample.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DAB8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25F3CE194();
  sub_25F3F6C90();
  LOBYTE(v12) = 0;
  sub_25F3F6AE0();
  if (!v2)
  {
    uint64_t v9 = type metadata accessor for TTSVBVoiceSample();
    LOBYTE(v12) = 1;
    sub_25F3F5B60();
    sub_25F3D054C(&qword_26A78CD70, MEMORY[0x270FA8E20]);
    sub_25F3F6AD0();
    LOBYTE(v12) = 2;
    sub_25F3F6B00();
    LOBYTE(v12) = 3;
    sub_25F3F6AE0();
    LOBYTE(v12) = 4;
    sub_25F3F6AE0();
    LOBYTE(v12) = 5;
    sub_25F3F6AE0();
    LOBYTE(v12) = 6;
    sub_25F3F6AE0();
    LOBYTE(v12) = 7;
    sub_25F3F6B20();
    LOBYTE(v12) = 8;
    sub_25F3F6B20();
    LOBYTE(v12) = 9;
    sub_25F3F6B00();
    LOBYTE(v12) = 10;
    sub_25F3F6AE0();
    LOBYTE(v12) = 11;
    sub_25F3F5CC0();
    sub_25F3D054C(&qword_26A78D1B8, MEMORY[0x270FA9160]);
    sub_25F3F6AD0();
    LOBYTE(v12) = 12;
    sub_25F3F6AC0();
    LOBYTE(v12) = 13;
    sub_25F3F6B20();
    LOBYTE(v12) = 14;
    sub_25F3F6B10();
    LOBYTE(v12) = 15;
    sub_25F3F6B10();
    LOBYTE(v12) = 16;
    sub_25F3F6B10();
    LOBYTE(v12) = 17;
    sub_25F3F6B10();
    int v12 = *(_DWORD *)(v3 + *(int *)(v9 + 88));
    v11[11] = 18;
    sub_25F3CE1E8();
    sub_25F3F6B30();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t TTSVBVoiceSample.hashValue.getter()
{
  return sub_25F3F6C70();
}

uint64_t TTSVBVoiceSample.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DAC8);
  uint64_t v5 = *(void *)(v46 - 8);
  MEMORY[0x270FA5388](v46);
  uint64_t v7 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (int *)type metadata accessor for TTSVBVoiceSample();
  MEMORY[0x270FA5388](v8);
  double v10 = (uint64_t *)((char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = a1[3];
  uint64_t v47 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v11);
  sub_25F3CE194();
  sub_25F3F6C80();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v47);
  }
  uint64_t v44 = a2;
  uint64_t v45 = v5;
  LOBYTE(v49) = 0;
  *double v10 = sub_25F3F6A30();
  v10[1] = v12;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B398888);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25F3F5B60();
  LOBYTE(v49) = 1;
  sub_25F3D054C(&qword_26A78CF70, MEMORY[0x270FA8E20]);
  sub_25F3F6A20();
  sub_25F307A7C((uint64_t)v15, (uint64_t)v10 + v8[5], &qword_26B398888);
  LOBYTE(v49) = 2;
  sub_25F3F6A50();
  *(uint64_t *)((char *)v10 + v8[6]) = v16;
  LOBYTE(v49) = 3;
  uint64_t v17 = sub_25F3F6A30();
  uint64_t v18 = (uint64_t *)((char *)v10 + v8[7]);
  *uint64_t v18 = v17;
  v18[1] = v19;
  LOBYTE(v49) = 4;
  uint64_t v20 = sub_25F3F6A30();
  uint64_t v21 = (uint64_t *)((char *)v10 + v8[8]);
  *uint64_t v21 = v20;
  v21[1] = v22;
  LOBYTE(v49) = 5;
  uint64_t v23 = sub_25F3F6A30();
  long long v24 = (uint64_t *)((char *)v10 + v8[9]);
  *long long v24 = v23;
  v24[1] = v25;
  LOBYTE(v49) = 6;
  uint64_t v26 = sub_25F3F6A30();
  long long v27 = (uint64_t *)((char *)v10 + v8[10]);
  *long long v27 = v26;
  v27[1] = v28;
  LOBYTE(v49) = 7;
  *(uint64_t *)((char *)v10 + v8[11]) = sub_25F3F6A70();
  LOBYTE(v49) = 8;
  *(uint64_t *)((char *)v10 + v8[12]) = sub_25F3F6A70();
  LOBYTE(v49) = 9;
  sub_25F3F6A50();
  *(uint64_t *)((char *)v10 + v8[13]) = v29;
  LOBYTE(v49) = 10;
  uint64_t v30 = sub_25F3F6A30();
  long long v31 = (uint64_t *)((char *)v10 + v8[14]);
  uint64_t *v31 = v30;
  v31[1] = v32;
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B398898);
  MEMORY[0x270FA5388](v33 - 8);
  int64_t v35 = (char *)&v44 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25F3F5CC0();
  LOBYTE(v49) = 11;
  sub_25F3D054C(&qword_26A78D158, MEMORY[0x270FA9160]);
  sub_25F3F6A20();
  sub_25F307A7C((uint64_t)v35, (uint64_t)v10 + v8[15], &qword_26B398898);
  LOBYTE(v49) = 12;
  uint64_t v36 = sub_25F3F6A10();
  uint64_t v37 = (uint64_t *)((char *)v10 + v8[16]);
  *uint64_t v37 = v36;
  v37[1] = v38;
  LOBYTE(v49) = 13;
  *(uint64_t *)((char *)v10 + v8[17]) = sub_25F3F6A70();
  LOBYTE(v49) = 14;
  sub_25F3F6A60();
  *(_DWORD *)((char *)v10 + v8[18]) = v39;
  LOBYTE(v49) = 15;
  sub_25F3F6A60();
  *(_DWORD *)((char *)v10 + v8[19]) = v40;
  LOBYTE(v49) = 16;
  sub_25F3F6A60();
  *(_DWORD *)((char *)v10 + v8[20]) = v41;
  LOBYTE(v49) = 17;
  sub_25F3F6A60();
  *(_DWORD *)((char *)v10 + v8[21]) = v42;
  char v48 = 18;
  sub_25F3CE23C();
  sub_25F3F6A80();
  (*(void (**)(char *, uint64_t))(v45 + 8))(v7, v46);
  *(_DWORD *)((char *)v10 + v8[22]) = v49;
  sub_25F3CE290((uint64_t)v10, v44);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v47);
  return sub_25F3CE2F4((uint64_t)v10);
}

uint64_t sub_25F3CD1A4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return TTSVBVoiceSample.init(from:)(a1, a2);
}

uint64_t sub_25F3CD1BC(void *a1)
{
  return TTSVBVoiceSample.encode(to:)(a1);
}

uint64_t sub_25F3CD1D4()
{
  return sub_25F3F6C70();
}

uint64_t sub_25F3CD218()
{
  return sub_25F3F6C70();
}

BOOL sub_25F3CD25C(void *a1, void *a2)
{
  uint64_t v4 = (int *)type metadata accessor for TTSVBVoiceSample();
  uint64_t v5 = v4[10];
  uint64_t v6 = *(void *)((char *)a2 + v5);
  uint64_t v7 = *(void *)((char *)a2 + v5 + 8);
  uint64_t v8 = (void *)((char *)a1 + v5);
  BOOL v9 = v6 == *v8 && v7 == v8[1];
  if (!v9 && (sub_25F3F6B80() & 1) == 0) {
    goto LABEL_14;
  }
  uint64_t v10 = v4[11];
  uint64_t v11 = *(void *)((char *)a2 + v10);
  uint64_t v12 = *(void *)((char *)a1 + v10);
  BOOL v13 = v11 < v12;
  if (v11 == v12)
  {
    uint64_t v14 = v4[12];
    uint64_t v15 = *(void *)((char *)a2 + v14);
    uint64_t v16 = *(void *)((char *)a1 + v14);
    BOOL v13 = v15 < v16;
    if (v15 == v16)
    {
      if (*a2 == *a1 && a2[1] == a1[1])
      {
        char v17 = 0;
        return (v17 & 1) == 0;
      }
LABEL_14:
      char v17 = sub_25F3F6B80();
      return (v17 & 1) == 0;
    }
  }
  char v17 = v13;
  return (v17 & 1) == 0;
}

BOOL sub_25F3CD354(void *a1, void *a2)
{
  uint64_t v4 = (int *)type metadata accessor for TTSVBVoiceSample();
  uint64_t v5 = v4[10];
  uint64_t v6 = *(void *)((char *)a1 + v5);
  uint64_t v7 = *(void *)((char *)a1 + v5 + 8);
  uint64_t v8 = (void *)((char *)a2 + v5);
  BOOL v9 = v6 == *v8 && v7 == v8[1];
  if (!v9 && (sub_25F3F6B80() & 1) == 0) {
    goto LABEL_14;
  }
  uint64_t v10 = v4[11];
  uint64_t v11 = *(void *)((char *)a1 + v10);
  uint64_t v12 = *(void *)((char *)a2 + v10);
  BOOL v13 = v11 < v12;
  if (v11 == v12)
  {
    uint64_t v14 = v4[12];
    uint64_t v15 = *(void *)((char *)a1 + v14);
    uint64_t v16 = *(void *)((char *)a2 + v14);
    BOOL v13 = v15 < v16;
    if (v15 == v16)
    {
      if (*a1 == *a2 && a1[1] == a2[1])
      {
        char v17 = 0;
        return (v17 & 1) == 0;
      }
LABEL_14:
      char v17 = sub_25F3F6B80();
      return (v17 & 1) == 0;
    }
  }
  char v17 = v13;
  return (v17 & 1) == 0;
}

uint64_t sub_25F3CD44C(void *a1, void *a2)
{
  uint64_t v4 = (int *)type metadata accessor for TTSVBVoiceSample();
  uint64_t v5 = v4[10];
  uint64_t v6 = *(void *)((char *)a2 + v5);
  uint64_t v7 = *(void *)((char *)a2 + v5 + 8);
  uint64_t v8 = (void *)((char *)a1 + v5);
  BOOL v9 = v6 == *v8 && v7 == v8[1];
  if (v9 || (sub_25F3F6B80() & 1) != 0)
  {
    uint64_t v10 = v4[11];
    uint64_t v11 = *(void *)((char *)a2 + v10);
    uint64_t v12 = *(void *)((char *)a1 + v10);
    BOOL v13 = v11 < v12;
    if (v11 != v12) {
      return v13;
    }
    uint64_t v14 = v4[12];
    uint64_t v15 = *(void *)((char *)a2 + v14);
    uint64_t v16 = *(void *)((char *)a1 + v14);
    BOOL v13 = v15 < v16;
    if (v15 != v16) {
      return v13;
    }
    if (*a2 == *a1 && a2[1] == a1[1]) {
      return 0;
    }
  }

  return sub_25F3F6B80();
}

uint64_t sub_25F3CD558()
{
  return 0x4449656C706D6153;
}

uint64_t _s31TextToSpeechVoiceBankingSupport16TTSVBVoiceSampleV1loiySbAC_ACtFZ_0(void *a1, void *a2)
{
  uint64_t v4 = (int *)type metadata accessor for TTSVBVoiceSample();
  uint64_t v5 = v4[10];
  uint64_t v6 = *(void *)((char *)a1 + v5);
  uint64_t v7 = *(void *)((char *)a1 + v5 + 8);
  uint64_t v8 = (void *)((char *)a2 + v5);
  BOOL v9 = v6 == *v8 && v7 == v8[1];
  if (v9 || (sub_25F3F6B80() & 1) != 0)
  {
    uint64_t v10 = v4[11];
    uint64_t v11 = *(void *)((char *)a1 + v10);
    uint64_t v12 = *(void *)((char *)a2 + v10);
    BOOL v13 = v11 < v12;
    if (v11 != v12) {
      return v13;
    }
    uint64_t v14 = v4[12];
    uint64_t v15 = *(void *)((char *)a1 + v14);
    uint64_t v16 = *(void *)((char *)a2 + v14);
    BOOL v13 = v15 < v16;
    if (v15 != v16) {
      return v13;
    }
    if (*a1 == *a2 && a1[1] == a2[1]) {
      return 0;
    }
  }

  return sub_25F3F6B80();
}

unint64_t sub_25F3CD6D8()
{
  unint64_t result = qword_26A78DAB0;
  if (!qword_26A78DAB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A78DAB0);
  }
  return result;
}

BOOL _s31TextToSpeechVoiceBankingSupport16TTSVBVoiceSampleV2eeoiySbAC_ACtFZ_0(void *a1, void *a2)
{
  if (*a1 != *a2 || a1[1] != a2[1])
  {
    char v5 = sub_25F3F6B80();
    BOOL result = 0;
    if ((v5 & 1) == 0) {
      return result;
    }
  }
  uint64_t v7 = type metadata accessor for TTSVBVoiceSample();
  uint64_t v8 = *(int *)(v7 + 20);
  uint64_t v98 = a1;
  uint64_t v9 = (uint64_t)a1 + v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B398888);
  uint64_t v102 = &v95;
  uint64_t v11 = *(void *)(*(void *)(v10 - 8) + 64);
  MEMORY[0x270FA5388](v10 - 8);
  unint64_t v12 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0;
  BOOL v13 = (char *)&v95 - v12;
  sub_25F3078D4(v9, (uint64_t)&v95 - v12, &qword_26B398888);
  uint64_t v101 = &v95;
  unint64_t v97 = (int *)v7;
  uint64_t v14 = *(int *)(v7 + 20);
  unint64_t v99 = a2;
  MEMORY[0x270FA5388]((char *)a2 + v14);
  uint64_t v15 = (char *)&v95 - v12;
  sub_25F3078D4(v16, (uint64_t)&v95 - v12, &qword_26B398888);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DAE0);
  uint64_t v100 = &v95;
  MEMORY[0x270FA5388](v17 - 8);
  uint64_t v19 = (char *)&v95 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = (uint64_t)&v19[*(int *)(v20 + 56)];
  sub_25F3078D4((uint64_t)&v95 - v12, (uint64_t)v19, &qword_26B398888);
  sub_25F3078D4((uint64_t)&v95 - v12, v21, &qword_26B398888);
  uint64_t v22 = sub_25F3F5B60();
  uint64_t v23 = *(void *)(v22 - 8);
  long long v24 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v23 + 48);
  uint64_t v25 = v24(v19, 1, v22);
  if (v25 == 1)
  {
    sub_25F307B78((uint64_t)&v95 - v12, &qword_26B398888);
    sub_25F307B78((uint64_t)&v95 - v12, &qword_26B398888);
    if (v24((char *)v21, 1, v22) == 1)
    {
      sub_25F307B78((uint64_t)v19, &qword_26B398888);
      goto LABEL_14;
    }
LABEL_11:
    uint64_t v28 = &qword_26A78DAE0;
    goto LABEL_12;
  }
  uint64_t v96 = &v95;
  MEMORY[0x270FA5388](v25);
  uint64_t v26 = (char *)&v95 - v12;
  sub_25F3078D4((uint64_t)v19, (uint64_t)&v95 - v12, &qword_26B398888);
  uint64_t v27 = v24((char *)v21, 1, v22);
  if (v27 == 1)
  {
    sub_25F307B78((uint64_t)&v95 - v12, &qword_26B398888);
    sub_25F307B78((uint64_t)&v95 - v12, &qword_26B398888);
    (*(void (**)(char *, uint64_t))(v23 + 8))((char *)&v95 - v12, v22);
    goto LABEL_11;
  }
  double v29 = MEMORY[0x270FA5388](v27);
  long long v31 = (char *)&v95 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, double))(v23 + 32))(v31, v21, v22, v29);
  sub_25F3D054C(&qword_26A78DAE8, MEMORY[0x270FA8E20]);
  char v32 = sub_25F3F60C0();
  uint64_t v33 = *(void (**)(char *, uint64_t))(v23 + 8);
  v33(v31, v22);
  sub_25F307B78((uint64_t)v15, &qword_26B398888);
  sub_25F307B78((uint64_t)v13, &qword_26B398888);
  v33(v26, v22);
  sub_25F307B78((uint64_t)v19, &qword_26B398888);
  if ((v32 & 1) == 0) {
    return 0;
  }
LABEL_14:
  int64_t v35 = v97;
  uint64_t v34 = v98;
  uint64_t v36 = v99;
  if (*(double *)((char *)v98 + v97[6]) != *(double *)((char *)v99 + v97[6])) {
    return 0;
  }
  uint64_t v37 = v97[7];
  uint64_t v38 = *(void *)((char *)v98 + v37);
  uint64_t v39 = *(void *)((char *)v98 + v37 + 8);
  int v40 = (void *)((char *)v99 + v37);
  if (v38 == *v40 && v39 == v40[1] || (char v41 = sub_25F3F6B80(), result = 0, (v41 & 1) != 0))
  {
    if ((uint64_t v42 = v35[8],
          uint64_t v43 = *(void *)((char *)v34 + v42),
          uint64_t v44 = *(void *)((char *)v34 + v42 + 8),
          uint64_t v45 = (void *)((char *)v36 + v42),
          v43 == *v45)
      && v44 == v45[1]
      || (char v46 = sub_25F3F6B80(), result = 0, (v46 & 1) != 0))
    {
      if ((uint64_t v47 = v35[9],
            uint64_t v48 = *(void *)((char *)v34 + v47),
            uint64_t v49 = *(void *)((char *)v34 + v47 + 8),
            uint64_t v50 = (void *)((char *)v36 + v47),
            v48 == *v50)
        && v49 == v50[1]
        || (char v51 = sub_25F3F6B80(), result = 0, (v51 & 1) != 0))
      {
        if ((uint64_t v52 = v35[10],
              uint64_t v53 = *(void *)((char *)v34 + v52),
              uint64_t v54 = *(void *)((char *)v34 + v52 + 8),
              uint64_t v55 = (void *)((char *)v36 + v52),
              v53 == *v55)
          && v54 == v55[1]
          || (v56 = sub_25F3F6B80(), BOOL result = 0, (v56 & 1) != 0))
        {
          if (*(void *)((char *)v34 + v35[11]) != *(void *)((char *)v36 + v35[11])
            || *(void *)((char *)v34 + v35[12]) != *(void *)((char *)v36 + v35[12])
            || *(double *)((char *)v34 + v35[13]) != *(double *)((char *)v36 + v35[13]))
          {
            return 0;
          }
          if ((uint64_t v57 = v35[14],
                uint64_t v58 = *(void *)((char *)v34 + v57),
                uint64_t v59 = *(void *)((char *)v34 + v57 + 8),
                uint64_t v60 = (void *)((char *)v36 + v57),
                v58 == *v60)
            && v59 == v60[1]
            || (v61 = sub_25F3F6B80(), BOOL result = 0, (v61 & 1) != 0))
          {
            uint64_t v62 = (uint64_t)v34 + v35[15];
            uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B398898);
            uint64_t v102 = &v95;
            uint64_t v64 = *(void *)(*(void *)(v63 - 8) + 64);
            MEMORY[0x270FA5388](v63 - 8);
            unint64_t v65 = (v64 + 15) & 0xFFFFFFFFFFFFFFF0;
            BOOL v66 = (char *)&v95 - v65;
            sub_25F3078D4(v62, (uint64_t)&v95 - v65, &qword_26B398898);
            uint64_t v101 = &v95;
            MEMORY[0x270FA5388]((char *)v36 + v35[15]);
            uint64_t v67 = (char *)&v95 - v65;
            sub_25F3078D4(v68, (uint64_t)&v95 - v65, &qword_26B398898);
            uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A78D208);
            uint64_t v100 = &v95;
            MEMORY[0x270FA5388](v69 - 8);
            uint64_t v19 = (char *)&v95 - ((v70 + 15) & 0xFFFFFFFFFFFFFFF0);
            uint64_t v72 = (uint64_t)&v19[*(int *)(v71 + 56)];
            sub_25F3078D4((uint64_t)&v95 - v65, (uint64_t)v19, &qword_26B398898);
            sub_25F3078D4((uint64_t)&v95 - v65, v72, &qword_26B398898);
            uint64_t v73 = sub_25F3F5CC0();
            uint64_t v74 = *(void *)(v73 - 8);
            uint64_t v75 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v74 + 48);
            uint64_t v76 = v75(v19, 1, v73);
            if (v76 == 1)
            {
              sub_25F307B78((uint64_t)&v95 - v65, &qword_26B398898);
              sub_25F307B78((uint64_t)&v95 - v65, &qword_26B398898);
              if (v75((char *)v72, 1, v73) == 1)
              {
                sub_25F307B78((uint64_t)v19, &qword_26B398898);
LABEL_40:
                uint64_t v85 = v97;
                unint64_t v84 = v98;
                uint64_t v86 = v97[16];
                uint64_t v87 = (void *)((char *)v98 + v86);
                uint64_t v88 = *(void *)((char *)v98 + v86 + 8);
                uint64_t v89 = v99;
                unint64_t v90 = (void *)((char *)v99 + v86);
                uint64_t v91 = v90[1];
                if (v88)
                {
                  if (v91)
                  {
                    if (*v87 != *v90 || v88 != v91)
                    {
                      char v92 = sub_25F3F6B80();
                      BOOL result = 0;
                      if ((v92 & 1) == 0) {
                        return result;
                      }
                    }
                    goto LABEL_47;
                  }
                }
                else if (!v91)
                {
LABEL_47:
                  if (*(void *)((char *)v84 + v85[17]) == *(void *)((char *)v89 + v85[17])
                    && *(float *)((char *)v84 + v85[18]) == *(float *)((char *)v89 + v85[18])
                    && *(float *)((char *)v84 + v85[19]) == *(float *)((char *)v89 + v85[19])
                    && *(float *)((char *)v84 + v85[20]) == *(float *)((char *)v89 + v85[20])
                    && *(float *)((char *)v84 + v85[21]) == *(float *)((char *)v89 + v85[21]))
                  {
                    uint64_t v93 = v85[22];
                    int v94 = *(_DWORD *)((char *)v84 + v93);
                    int v105 = *(_DWORD *)((char *)v89 + v93);
                    int v106 = v94;
                    sub_25F33AABC();
                    sub_25F3F6280();
                    sub_25F3F6280();
                    return v104 == v103;
                  }
                }
                return 0;
              }
            }
            else
            {
              uint64_t v96 = &v95;
              MEMORY[0x270FA5388](v76);
              uint64_t v77 = (char *)&v95 - v65;
              sub_25F3078D4((uint64_t)v19, (uint64_t)&v95 - v65, &qword_26B398898);
              uint64_t v78 = v75((char *)v72, 1, v73);
              if (v78 != 1)
              {
                double v79 = MEMORY[0x270FA5388](v78);
                uint64_t v81 = (char *)&v95 - ((v80 + 15) & 0xFFFFFFFFFFFFFFF0);
                (*(void (**)(char *, uint64_t, uint64_t, double))(v74 + 32))(v81, v72, v73, v79);
                sub_25F3D054C(&qword_26A78D218, MEMORY[0x270FA9160]);
                char v82 = sub_25F3F60C0();
                uint64_t v83 = *(void (**)(char *, uint64_t))(v74 + 8);
                v83(v81, v73);
                sub_25F307B78((uint64_t)v67, &qword_26B398898);
                sub_25F307B78((uint64_t)v66, &qword_26B398898);
                v83(v77, v73);
                sub_25F307B78((uint64_t)v19, &qword_26B398898);
                if ((v82 & 1) == 0) {
                  return 0;
                }
                goto LABEL_40;
              }
              sub_25F307B78((uint64_t)&v95 - v65, &qword_26B398898);
              sub_25F307B78((uint64_t)&v95 - v65, &qword_26B398898);
              (*(void (**)(char *, uint64_t))(v74 + 8))((char *)&v95 - v65, v73);
            }
            uint64_t v28 = &qword_26A78D208;
LABEL_12:
            sub_25F307B78((uint64_t)v19, v28);
            return 0;
          }
        }
      }
    }
  }
  return result;
}

unint64_t sub_25F3CE194()
{
  unint64_t result = qword_26A79EE10[0];
  if (!qword_26A79EE10[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A79EE10);
  }
  return result;
}

unint64_t sub_25F3CE1E8()
{
  unint64_t result = qword_26A78DAC0;
  if (!qword_26A78DAC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A78DAC0);
  }
  return result;
}

unint64_t sub_25F3CE23C()
{
  unint64_t result = qword_26A78DAD0;
  if (!qword_26A78DAD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A78DAD0);
  }
  return result;
}

uint64_t sub_25F3CE290(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TTSVBVoiceSample();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25F3CE2F4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TTSVBVoiceSample();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_25F3CE354()
{
  unint64_t result = qword_26A78DAD8;
  if (!qword_26A78DAD8)
  {
    type metadata accessor for TTSVBVoiceSample();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A78DAD8);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for TTSVBVoiceSample(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    uint64_t *v4 = *a2;
    uint64_t v4 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
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
    uint64_t v11 = sub_25F3F5B60();
    uint64_t v12 = *(void *)(v11 - 8);
    BOOL v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B398888);
      memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    uint64_t v16 = a3[7];
    *(uint64_t *)((char *)v4 + a3[6]) = *(uint64_t *)((char *)a2 + a3[6]);
    uint64_t v17 = (uint64_t *)((char *)v4 + v16);
    uint64_t v18 = (uint64_t *)((char *)a2 + v16);
    uint64_t v51 = v18[1];
    *uint64_t v17 = *v18;
    v17[1] = v51;
    uint64_t v19 = a3[8];
    uint64_t v20 = a3[9];
    uint64_t v21 = (uint64_t *)((char *)v4 + v19);
    uint64_t v22 = (uint64_t *)((char *)a2 + v19);
    uint64_t v23 = v22[1];
    *uint64_t v21 = *v22;
    v21[1] = v23;
    long long v24 = (uint64_t *)((char *)v4 + v20);
    uint64_t v25 = (uint64_t *)((char *)a2 + v20);
    uint64_t v50 = v25[1];
    *long long v24 = *v25;
    v24[1] = v50;
    uint64_t v26 = a3[10];
    uint64_t v27 = a3[11];
    uint64_t v28 = (uint64_t *)((char *)v4 + v26);
    double v29 = (uint64_t *)((char *)a2 + v26);
    uint64_t v30 = v29[1];
    *uint64_t v28 = *v29;
    v28[1] = v30;
    *(uint64_t *)((char *)v4 + v27) = *(uint64_t *)((char *)a2 + v27);
    uint64_t v31 = a3[13];
    *(uint64_t *)((char *)v4 + a3[12]) = *(uint64_t *)((char *)a2 + a3[12]);
    *(uint64_t *)((char *)v4 + v31) = *(uint64_t *)((char *)a2 + v31);
    uint64_t v32 = a3[14];
    uint64_t v33 = a3[15];
    uint64_t v34 = (uint64_t *)((char *)v4 + v32);
    int64_t v35 = (uint64_t *)((char *)a2 + v32);
    uint64_t v36 = v35[1];
    *uint64_t v34 = *v35;
    v34[1] = v36;
    __dst = (char *)v4 + v33;
    uint64_t v37 = (char *)a2 + v33;
    uint64_t v38 = sub_25F3F5CC0();
    uint64_t v39 = *(void *)(v38 - 8);
    uint64_t v49 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v39 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v49(v37, 1, v38))
    {
      uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B398898);
      memcpy(__dst, v37, *(void *)(*(void *)(v40 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v39 + 16))(__dst, v37, v38);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v39 + 56))(__dst, 0, 1, v38);
    }
    uint64_t v41 = a3[16];
    uint64_t v42 = a3[17];
    uint64_t v43 = (uint64_t *)((char *)v4 + v41);
    uint64_t v44 = (uint64_t *)((char *)a2 + v41);
    uint64_t v45 = v44[1];
    *uint64_t v43 = *v44;
    v43[1] = v45;
    *(uint64_t *)((char *)v4 + v42) = *(uint64_t *)((char *)a2 + v42);
    uint64_t v46 = a3[19];
    *(_DWORD *)((char *)v4 + a3[18]) = *(_DWORD *)((char *)a2 + a3[18]);
    *(_DWORD *)((char *)v4 + v46) = *(_DWORD *)((char *)a2 + v46);
    uint64_t v47 = a3[21];
    *(_DWORD *)((char *)v4 + a3[20]) = *(_DWORD *)((char *)a2 + a3[20]);
    *(_DWORD *)((char *)v4 + v47) = *(_DWORD *)((char *)a2 + v47);
    *(_DWORD *)((char *)v4 + a3[22]) = *(_DWORD *)((char *)a2 + a3[22]);
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for TTSVBVoiceSample(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_25F3F5B60();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v7 = a1 + *(int *)(a2 + 60);
  uint64_t v8 = sub_25F3F5CC0();
  uint64_t v9 = *(void *)(v8 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8)) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  }

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for TTSVBVoiceSample(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_25F3F5B60();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  if (v12(v9, 1, v10))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B398888);
    memcpy(v8, v9, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v14 = a3[7];
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  uint64_t v15 = (void *)((char *)a1 + v14);
  uint64_t v16 = (void *)((char *)a2 + v14);
  uint64_t v49 = v16[1];
  void *v15 = *v16;
  v15[1] = v49;
  uint64_t v17 = a3[8];
  uint64_t v18 = a3[9];
  uint64_t v19 = (void *)((char *)a1 + v17);
  uint64_t v20 = (void *)((char *)a2 + v17);
  uint64_t v21 = v20[1];
  *uint64_t v19 = *v20;
  v19[1] = v21;
  uint64_t v22 = (void *)((char *)a1 + v18);
  uint64_t v23 = (void *)((char *)a2 + v18);
  uint64_t v48 = v23[1];
  void *v22 = *v23;
  v22[1] = v48;
  uint64_t v24 = a3[10];
  uint64_t v25 = a3[11];
  uint64_t v26 = (void *)((char *)a1 + v24);
  uint64_t v27 = (void *)((char *)a2 + v24);
  uint64_t v28 = v27[1];
  *uint64_t v26 = *v27;
  v26[1] = v28;
  *(void *)((char *)a1 + v25) = *(void *)((char *)a2 + v25);
  uint64_t v29 = a3[13];
  *(void *)((char *)a1 + a3[12]) = *(void *)((char *)a2 + a3[12]);
  *(void *)((char *)a1 + v29) = *(void *)((char *)a2 + v29);
  uint64_t v30 = a3[14];
  uint64_t v31 = a3[15];
  uint64_t v32 = (void *)((char *)a1 + v30);
  uint64_t v33 = (void *)((char *)a2 + v30);
  uint64_t v34 = v33[1];
  *uint64_t v32 = *v33;
  v32[1] = v34;
  __dst = (char *)a1 + v31;
  int64_t v35 = (char *)a2 + v31;
  uint64_t v36 = sub_25F3F5CC0();
  uint64_t v37 = *(void *)(v36 - 8);
  uint64_t v47 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v47(v35, 1, v36))
  {
    uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B398898);
    memcpy(__dst, v35, *(void *)(*(void *)(v38 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v37 + 16))(__dst, v35, v36);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v37 + 56))(__dst, 0, 1, v36);
  }
  uint64_t v39 = a3[16];
  uint64_t v40 = a3[17];
  uint64_t v41 = (void *)((char *)a1 + v39);
  uint64_t v42 = (void *)((char *)a2 + v39);
  uint64_t v43 = v42[1];
  *uint64_t v41 = *v42;
  v41[1] = v43;
  *(void *)((char *)a1 + v40) = *(void *)((char *)a2 + v40);
  uint64_t v44 = a3[19];
  *(_DWORD *)((char *)a1 + a3[18]) = *(_DWORD *)((char *)a2 + a3[18]);
  *(_DWORD *)((char *)a1 + v44) = *(_DWORD *)((char *)a2 + v44);
  uint64_t v45 = a3[21];
  *(_DWORD *)((char *)a1 + a3[20]) = *(_DWORD *)((char *)a2 + a3[20]);
  *(_DWORD *)((char *)a1 + v45) = *(_DWORD *)((char *)a2 + v45);
  *(_DWORD *)((char *)a1 + a3[22]) = *(_DWORD *)((char *)a2 + a3[22]);
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for TTSVBVoiceSample(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25F3F5B60();
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
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B398888);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  uint64_t v15 = a3[7];
  uint64_t v16 = (void *)((char *)a1 + v15);
  uint64_t v17 = (void *)((char *)a2 + v15);
  *uint64_t v16 = *v17;
  v16[1] = v17[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v18 = a3[8];
  uint64_t v19 = (void *)((char *)a1 + v18);
  uint64_t v20 = (void *)((char *)a2 + v18);
  *uint64_t v19 = *v20;
  v19[1] = v20[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v21 = a3[9];
  uint64_t v22 = (void *)((char *)a1 + v21);
  uint64_t v23 = (void *)((char *)a2 + v21);
  void *v22 = *v23;
  v22[1] = v23[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v24 = a3[10];
  uint64_t v25 = (void *)((char *)a1 + v24);
  uint64_t v26 = (void *)((char *)a2 + v24);
  *uint64_t v25 = *v26;
  v25[1] = v26[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[11]) = *(void *)((char *)a2 + a3[11]);
  *(void *)((char *)a1 + a3[12]) = *(void *)((char *)a2 + a3[12]);
  *(void *)((char *)a1 + a3[13]) = *(void *)((char *)a2 + a3[13]);
  uint64_t v27 = a3[14];
  uint64_t v28 = (void *)((char *)a1 + v27);
  uint64_t v29 = (void *)((char *)a2 + v27);
  *uint64_t v28 = *v29;
  v28[1] = v29[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v30 = a3[15];
  uint64_t v31 = (char *)a1 + v30;
  uint64_t v32 = (char *)a2 + v30;
  uint64_t v33 = sub_25F3F5CC0();
  uint64_t v34 = *(void *)(v33 - 8);
  int64_t v35 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v34 + 48);
  int v36 = v35(v31, 1, v33);
  int v37 = v35(v32, 1, v33);
  if (!v36)
  {
    if (!v37)
    {
      (*(void (**)(char *, char *, uint64_t))(v34 + 24))(v31, v32, v33);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v34 + 8))(v31, v33);
    goto LABEL_12;
  }
  if (v37)
  {
LABEL_12:
    uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B398898);
    memcpy(v31, v32, *(void *)(*(void *)(v38 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v31, v32, v33);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
LABEL_13:
  uint64_t v39 = a3[16];
  uint64_t v40 = (void *)((char *)a1 + v39);
  uint64_t v41 = (void *)((char *)a2 + v39);
  *uint64_t v40 = *v41;
  v40[1] = v41[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[17]) = *(void *)((char *)a2 + a3[17]);
  *(_DWORD *)((char *)a1 + a3[18]) = *(_DWORD *)((char *)a2 + a3[18]);
  *(_DWORD *)((char *)a1 + a3[19]) = *(_DWORD *)((char *)a2 + a3[19]);
  *(_DWORD *)((char *)a1 + a3[20]) = *(_DWORD *)((char *)a2 + a3[20]);
  *(_DWORD *)((char *)a1 + a3[21]) = *(_DWORD *)((char *)a2 + a3[21]);
  *(_DWORD *)((char *)a1 + a3[22]) = *(_DWORD *)((char *)a2 + a3[22]);
  return a1;
}

_OWORD *initializeWithTake for TTSVBVoiceSample(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25F3F5B60();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B398888);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v12 = a3[7];
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  *(_OWORD *)((char *)a1 + v12) = *(_OWORD *)((char *)a2 + v12);
  uint64_t v13 = a3[9];
  *(_OWORD *)((char *)a1 + a3[8]) = *(_OWORD *)((char *)a2 + a3[8]);
  *(_OWORD *)((char *)a1 + v13) = *(_OWORD *)((char *)a2 + v13);
  uint64_t v14 = a3[11];
  *(_OWORD *)((char *)a1 + a3[10]) = *(_OWORD *)((char *)a2 + a3[10]);
  *(void *)((char *)a1 + v14) = *(void *)((char *)a2 + v14);
  uint64_t v15 = a3[13];
  *(void *)((char *)a1 + a3[12]) = *(void *)((char *)a2 + a3[12]);
  *(void *)((char *)a1 + v15) = *(void *)((char *)a2 + v15);
  uint64_t v16 = a3[15];
  *(_OWORD *)((char *)a1 + a3[14]) = *(_OWORD *)((char *)a2 + a3[14]);
  uint64_t v17 = (char *)a1 + v16;
  uint64_t v18 = (char *)a2 + v16;
  uint64_t v19 = sub_25F3F5CC0();
  uint64_t v20 = *(void *)(v19 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19))
  {
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B398898);
    memcpy(v17, v18, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v17, v18, v19);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
  }
  uint64_t v22 = a3[17];
  *(_OWORD *)((char *)a1 + a3[16]) = *(_OWORD *)((char *)a2 + a3[16]);
  *(void *)((char *)a1 + v22) = *(void *)((char *)a2 + v22);
  uint64_t v23 = a3[19];
  *(_DWORD *)((char *)a1 + a3[18]) = *(_DWORD *)((char *)a2 + a3[18]);
  *(_DWORD *)((char *)a1 + v23) = *(_DWORD *)((char *)a2 + v23);
  uint64_t v24 = a3[21];
  *(_DWORD *)((char *)a1 + a3[20]) = *(_DWORD *)((char *)a2 + a3[20]);
  *(_DWORD *)((char *)a1 + v24) = *(_DWORD *)((char *)a2 + v24);
  *(_DWORD *)((char *)a1 + a3[22]) = *(_DWORD *)((char *)a2 + a3[22]);
  return a1;
}

void *assignWithTake for TTSVBVoiceSample(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_25F3F5B60();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B398888);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 40))(v8, v9, v10);
LABEL_7:
  uint64_t v16 = a3[7];
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  uint64_t v17 = (void *)((char *)a1 + v16);
  uint64_t v18 = (void *)((char *)a2 + v16);
  uint64_t v20 = *v18;
  uint64_t v19 = v18[1];
  *uint64_t v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  uint64_t v21 = a3[8];
  uint64_t v22 = (void *)((char *)a1 + v21);
  uint64_t v23 = (void *)((char *)a2 + v21);
  uint64_t v25 = *v23;
  uint64_t v24 = v23[1];
  void *v22 = v25;
  v22[1] = v24;
  swift_bridgeObjectRelease();
  uint64_t v26 = a3[9];
  uint64_t v27 = (void *)((char *)a1 + v26);
  uint64_t v28 = (void *)((char *)a2 + v26);
  uint64_t v30 = *v28;
  uint64_t v29 = v28[1];
  *uint64_t v27 = v30;
  v27[1] = v29;
  swift_bridgeObjectRelease();
  uint64_t v31 = a3[10];
  uint64_t v32 = (void *)((char *)a1 + v31);
  uint64_t v33 = (void *)((char *)a2 + v31);
  uint64_t v35 = *v33;
  uint64_t v34 = v33[1];
  *uint64_t v32 = v35;
  v32[1] = v34;
  swift_bridgeObjectRelease();
  uint64_t v36 = a3[12];
  *(void *)((char *)a1 + a3[11]) = *(void *)((char *)a2 + a3[11]);
  *(void *)((char *)a1 + v36) = *(void *)((char *)a2 + v36);
  uint64_t v37 = a3[14];
  *(void *)((char *)a1 + a3[13]) = *(void *)((char *)a2 + a3[13]);
  uint64_t v38 = (void *)((char *)a1 + v37);
  uint64_t v39 = (void *)((char *)a2 + v37);
  uint64_t v41 = *v39;
  uint64_t v40 = v39[1];
  *uint64_t v38 = v41;
  v38[1] = v40;
  swift_bridgeObjectRelease();
  uint64_t v42 = a3[15];
  uint64_t v43 = (char *)a1 + v42;
  uint64_t v44 = (char *)a2 + v42;
  uint64_t v45 = sub_25F3F5CC0();
  uint64_t v46 = *(void *)(v45 - 8);
  uint64_t v47 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v46 + 48);
  int v48 = v47(v43, 1, v45);
  int v49 = v47(v44, 1, v45);
  if (!v48)
  {
    if (!v49)
    {
      (*(void (**)(char *, char *, uint64_t))(v46 + 40))(v43, v44, v45);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v46 + 8))(v43, v45);
    goto LABEL_12;
  }
  if (v49)
  {
LABEL_12:
    uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B398898);
    memcpy(v43, v44, *(void *)(*(void *)(v50 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v46 + 32))(v43, v44, v45);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v46 + 56))(v43, 0, 1, v45);
LABEL_13:
  uint64_t v51 = a3[16];
  uint64_t v52 = (void *)((char *)a1 + v51);
  uint64_t v53 = (void *)((char *)a2 + v51);
  uint64_t v55 = *v53;
  uint64_t v54 = v53[1];
  void *v52 = v55;
  v52[1] = v54;
  swift_bridgeObjectRelease();
  uint64_t v56 = a3[18];
  *(void *)((char *)a1 + a3[17]) = *(void *)((char *)a2 + a3[17]);
  *(_DWORD *)((char *)a1 + v56) = *(_DWORD *)((char *)a2 + v56);
  uint64_t v57 = a3[20];
  *(_DWORD *)((char *)a1 + a3[19]) = *(_DWORD *)((char *)a2 + a3[19]);
  *(_DWORD *)((char *)a1 + v57) = *(_DWORD *)((char *)a2 + v57);
  uint64_t v58 = a3[22];
  *(_DWORD *)((char *)a1 + a3[21]) = *(_DWORD *)((char *)a2 + a3[21]);
  *(_DWORD *)((char *)a1 + v58) = *(_DWORD *)((char *)a2 + v58);
  return a1;
}

uint64_t getEnumTagSinglePayload for TTSVBVoiceSample(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25F3CF6BC);
}

uint64_t sub_25F3CF6BC(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B398888);
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
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B398898);
      int v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = a1 + *(int *)(a3 + 60);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t storeEnumTagSinglePayload for TTSVBVoiceSample(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25F3CF804);
}

uint64_t sub_25F3CF804(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B398888);
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
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B398898);
      int v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 60);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

void sub_25F3CF938()
{
  sub_25F3CFA70(319, (unint64_t *)&qword_26B398890, MEMORY[0x270FA8DE0]);
  if (v0 <= 0x3F)
  {
    sub_25F3CFA70(319, (unint64_t *)&qword_26B398EF8, MEMORY[0x270FA9340]);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_25F3CFA70(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_25F3F6680();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t getEnumTagSinglePayload for TTSVBVoiceSample.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xEE) {
    goto LABEL_17;
  }
  if (a2 + 18 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 18) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 18;
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
      return (*a1 | (v4 << 8)) - 18;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 18;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x13;
  int v8 = v6 - 19;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for TTSVBVoiceSample.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 18 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 18) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xEE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xED)
  {
    unsigned int v6 = ((a2 - 238) >> 8) + 1;
    *unint64_t result = a2 + 18;
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
        JUMPOUT(0x25F3CFC20);
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
          *unint64_t result = a2 + 18;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TTSVBVoiceSample.CodingKeys()
{
  return &type metadata for TTSVBVoiceSample.CodingKeys;
}

unint64_t sub_25F3CFC5C()
{
  unint64_t result = qword_26A79F2B0[0];
  if (!qword_26A79F2B0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A79F2B0);
  }
  return result;
}

unint64_t sub_25F3CFCB4()
{
  unint64_t result = qword_26A79F3C0;
  if (!qword_26A79F3C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A79F3C0);
  }
  return result;
}

unint64_t sub_25F3CFD0C()
{
  unint64_t result = qword_26A79F3C8[0];
  if (!qword_26A79F3C8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A79F3C8);
  }
  return result;
}

uint64_t sub_25F3CFD60(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x4449656C706D6173 && a2 == 0xE800000000000000;
  if (v2 || (sub_25F3F6B80() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 7107189 && a2 == 0xE300000000000000 || (sub_25F3F6B80() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000025F4065D0 || (sub_25F3F6B80() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x73656D656E6F6870 && a2 == 0xE800000000000000 || (sub_25F3F6B80() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x657361726870 && a2 == 0xE600000000000000 || (sub_25F3F6B80() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x697263736E617274 && a2 == 0xEA00000000007470 || (sub_25F3F6B80() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6C7469546B6F6F62 && a2 == 0xE900000000000065 || (sub_25F3F6B80() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x7061726761726170 && a2 == 0xEE007865646E4968 || (sub_25F3F6B80() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x65636E65746E6573 && a2 == 0xED00007865646E49 || (sub_25F3F6B80() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000025F406590 || (sub_25F3F6B80() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0x656C61636F6CLL && a2 == 0xE600000000000000 || (sub_25F3F6B80() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0x6E6964726F636572 && a2 == 0xED00006574614467 || (sub_25F3F6B80() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else if (a1 == 0x6172685072657375 && a2 == 0xEA00000000006573 || (sub_25F3F6B80() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 12;
  }
  else if (a1 == 0x726F635372657375 && a2 == 0xE900000000000065 || (sub_25F3F6B80() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 13;
  }
  else if (a1 == 7106675 && a2 == 0xE300000000000000 || (sub_25F3F6B80() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 14;
  }
  else if (a1 == 7499379 && a2 == 0xE300000000000000 || (sub_25F3F6B80() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 15;
  }
  else if (a1 == 0x73657268546C7073 && a2 == 0xEC000000646C6F68 || (sub_25F3F6B80() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 16;
  }
  else if (a1 == 0x7365726854726E73 && a2 == 0xEC000000646C6F68 || (sub_25F3F6B80() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 17;
  }
  else if (a1 == 0x7367616C66 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 18;
  }
  else
  {
    char v6 = sub_25F3F6B80();
    swift_bridgeObjectRelease();
    if (v6) {
      return 18;
    }
    else {
      return 19;
    }
  }
}

uint64_t sub_25F3D054C(unint64_t *a1, void (*a2)(uint64_t))
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

id TTSVBAudioService.RecordingResult.measurement.getter()
{
  return *v0;
}

uint64_t TTSVBAudioService.RecordingResult.audioFileURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for TTSVBAudioService.RecordingResult(0) + 20);
  uint64_t v4 = sub_25F3F5B60();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for TTSVBAudioService.RecordingResult(uint64_t a1)
{
  return sub_25F3227C4(a1, (uint64_t *)&unk_26A79FAD0);
}

uint64_t TTSVBAudioService.RecordingResult.userPhrase.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for TTSVBAudioService.RecordingResult(0) + 24));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TTSVBAudioService.RecordingResult.userScore.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for TTSVBAudioService.RecordingResult(0) + 28));
}

uint64_t TTSVBAudioService.RecordingResult.sampleID.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for TTSVBAudioService.RecordingResult(0) + 32));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TTSVBAudioService.RecordingResult.spl.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **v0) + 0xA0))();
}

uint64_t TTSVBAudioService.RecordingResult.splEnd.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **v0) + 0xB8))();
}

uint64_t TTSVBAudioService.RecordingResult.splUnnormalized.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **v0) + 0xD0))();
}

uint64_t TTSVBAudioService.RecordingResult.splEndUnnormalized.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **v0) + 0xE8))();
}

uint64_t TTSVBAudioService.RecordingResult.splThreshold.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **v0) + 0x100))();
}

uint64_t TTSVBAudioService.RecordingResult.snr.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **v0) + 0x118))();
}

uint64_t TTSVBAudioService.RecordingResult.snrEnd.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **v0) + 0x130))();
}

uint64_t TTSVBAudioService.RecordingResult.snrUnnormalized.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **v0) + 0x148))();
}

uint64_t TTSVBAudioService.RecordingResult.snrEndUnnormalized.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **v0) + 0x160))();
}

uint64_t TTSVBAudioService.RecordingResult.snrThreshold.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **v0) + 0x178))();
}

BOOL TTSVBAudioService.RecordingResult.hasErrors.getter()
{
  uint64_t v1 = (uint64_t)v0;
  uint64_t v2 = type metadata accessor for TTSVBAudioService.RecordingResult(0);
  double v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (uint64_t *)((char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  char v6 = *v0;
  BOOL v7 = (void *)MEMORY[0x263F8EED0];
  float v8 = (*(float (**)(double))((*MEMORY[0x263F8EED0] & *v6) + 0xA0))(v3);
  float v9 = (*(float (**)(void))((*v7 & *v6) + 0x100))();
  uint64_t v10 = sub_25F3E84A4(v1, (uint64_t)v5, type metadata accessor for TTSVBAudioService.RecordingResult);
  if (v9 >= v8)
  {
    uint64_t v12 = (void *)*v5;
    float v13 = (*(float (**)(uint64_t))((*v7 & *(void *)*v5) + 0x118))(v10);
    BOOL v11 = v13 < (*(float (**)(void))((*v7 & *v12) + 0x178))();
  }
  else
  {
    BOOL v11 = 1;
  }
  sub_25F3E9DBC((uint64_t)v5, type metadata accessor for TTSVBAudioService.RecordingResult);
  return v11;
}

TextToSpeechVoiceBankingSupport::TTSVBAudioService::SoundEffect_optional __swiftcall TTSVBAudioService.SoundEffect.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  uint64_t v3 = sub_25F3F69E0();
  result.value = swift_bridgeObjectRelease();
  if (v3 == 1) {
    char v5 = 1;
  }
  else {
    char v5 = 2;
  }
  if (!v3) {
    char v5 = 0;
  }
  char *v2 = v5;
  return result;
}

unint64_t TTSVBAudioService.SoundEffect.rawValue.getter()
{
  return 0xD000000000000012;
}

uint64_t sub_25F3D0CB4(char *a1, char *a2)
{
  return sub_25F3D0CC0(*a1, *a2);
}

uint64_t sub_25F3D0CC0(char a1, char a2)
{
  if (a1) {
    unint64_t v2 = 0x800000025F407F70;
  }
  else {
    unint64_t v2 = 0x800000025F407F50;
  }
  if (a2) {
    unint64_t v3 = 0x800000025F407F70;
  }
  else {
    unint64_t v3 = 0x800000025F407F50;
  }
  if (v2 == v3) {
    char v4 = 1;
  }
  else {
    char v4 = sub_25F3F6B80();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4 & 1;
}

TextToSpeechVoiceBankingSupport::TTSVBAudioService::SoundEffect_optional sub_25F3D0D60(Swift::String *a1)
{
  return TTSVBAudioService.SoundEffect.init(rawValue:)(*a1);
}

void sub_25F3D0D6C(void *a1@<X8>)
{
  unint64_t v2 = 0x800000025F407F50;
  if (*v1) {
    unint64_t v2 = 0x800000025F407F70;
  }
  *a1 = 0xD000000000000012;
  a1[1] = v2;
}

uint64_t sub_25F3D0DA8()
{
  return sub_25F3D0DB0();
}

uint64_t sub_25F3D0DB0()
{
  return sub_25F3F6C70();
}

uint64_t sub_25F3D0E30()
{
  sub_25F3F61A0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_25F3D0E9C()
{
  return sub_25F3D0EA4();
}

uint64_t sub_25F3D0EA4()
{
  return sub_25F3F6C70();
}

uint64_t type metadata accessor for TTSVBAudioService.State(uint64_t a1)
{
  return sub_25F3227C4(a1, qword_26A79FB10);
}

id sub_25F3D0F40()
{
  uint64_t v1 = OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService____lazy_storage___audioEngine;
  unint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService____lazy_storage___audioEngine);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService____lazy_storage___audioEngine);
  }
  else
  {
    id v4 = sub_25F3D0FA0();
    char v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    unint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id sub_25F3D0FA0()
{
  uint64_t v1 = v0;
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EF9368]), sel_init);
  uint64_t v3 = sub_25F3F5B60();
  MEMORY[0x270FA5388](v3 - 8);
  char v5 = &v13[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13[15] = 0;
  sub_25F3D4ED0((uint64_t)v5);
  id v6 = objc_allocWithZone(MEMORY[0x263EF9378]);
  id v7 = sub_25F39070C((uint64_t)v5);
  uint64_t v8 = OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioPlayerNode;
  objc_msgSend(v2, sel_attachNode_, *(void *)(v1 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioPlayerNode));
  id v9 = *(id *)(v1 + v8);
  id v10 = objc_msgSend(v2, sel_outputNode);
  id v11 = objc_msgSend(v7, sel_processingFormat);
  objc_msgSend(v2, sel_connect_to_format_, v9, v10, v11);

  return v2;
}

id sub_25F3D111C()
{
  uint64_t v1 = OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService____lazy_storage___playbackPlayer;
  id v2 = *(void **)(v0
                + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService____lazy_storage___playbackPlayer);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService____lazy_storage___playbackPlayer);
  }
  else
  {
    id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFA7F8]), sel_init);
    char v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    id v2 = 0;
  }
  id v6 = v2;
  return v3;
}

uint64_t TTSVBAudioService.numberOfAudioMagnitudes.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_numberOfAudioMagnitudes;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t TTSVBAudioService.numberOfAudioMagnitudes.setter(uint64_t a1)
{
  id v3 = (void *)(v1 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_numberOfAudioMagnitudes);
  uint64_t result = swift_beginAccess();
  *id v3 = a1;
  return result;
}

uint64_t (*TTSVBAudioService.numberOfAudioMagnitudes.modify())()
{
  return j__swift_endAccess;
}

id TTSVBAudioService.speechRecognitionService.getter()
{
  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_speechRecognitionService));
}

id TTSVBAudioService.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

char *TTSVBAudioService.init()()
{
  uint64_t ObjectType = swift_getObjectType();
  unint64_t v181 = OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioQueue;
  v182 = (objc_class *)ObjectType;
  uint64_t v190 = sub_25F3236F0(0, (unint64_t *)&qword_26B399220);
  uint64_t v2 = sub_25F3F5FB0();
  uint64_t v188 = *(void *)(*(void *)(v2 - 8) + 64);
  MEMORY[0x270FA5388](v2 - 8);
  unint64_t v189 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  v175 = (char *)&v167 - v189;
  id v4 = v0;
  sub_25F3F5F90();
  uint64_t v5 = sub_25F3F6500();
  uint64_t v186 = *(void *)(*(void *)(v5 - 8) + 64);
  MEMORY[0x270FA5388](v5);
  unint64_t v187 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  id v191 = (id)MEMORY[0x263F8EE78];
  unint64_t v185 = sub_25F3E5338((unint64_t *)&unk_26B399210, MEMORY[0x270FCDB68]);
  unint64_t v183 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B398EC0);
  unint64_t v184 = sub_25F335CF0((unint64_t *)&unk_26B399200, (uint64_t *)&unk_26B398EC0);
  sub_25F3F67A0();
  uint64_t v7 = sub_25F3F6530();
  uint64_t v8 = *(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 64);
  double v9 = MEMORY[0x270FA5388](v7);
  v179 = v8;
  unint64_t v10 = ((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v11 = *MEMORY[0x263F8F140];
  v173 = *(void (**)(char *, uint64_t, uint64_t, double))(v12 + 104);
  uint64_t v174 = v12 + 104;
  LODWORD(v178) = v11;
  uint64_t v180 = v7;
  v173((char *)&v167 - v10, v11, v7, v9);
  uint64_t v13 = sub_25F3F6560();
  *(void *)((char *)v177 + v181) = v13;
  unint64_t v181 = OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_calloutQueue;
  MEMORY[0x270FA5388](v13);
  uint64_t v14 = sub_25F3F5F90();
  MEMORY[0x270FA5388](v14);
  id v191 = (id)MEMORY[0x263F8EE78];
  v176 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v5;
  uint64_t v15 = sub_25F3F67A0();
  double v16 = MEMORY[0x270FA5388](v15);
  uint64_t v17 = v7;
  uint64_t v18 = v173;
  v173((char *)&v167 - v10, v11, v17, v16);
  *(void *)&v4[v181] = sub_25F3F6560();
  uint64_t v19 = OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_state;
  type metadata accessor for TTSVBAudioService.State(0);
  uint64_t v20 = swift_allocObject();
  sub_25F3E5144();
  *(void *)&v4[v19] = v20;
  uint64_t v21 = OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioPlayerNode;
  id v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EF93D0]), sel_init);
  *(void *)&v4[v21] = v22;
  *(void *)&v4[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService____lazy_storage___audioEngine] = 0;
  *(void *)&v4[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService____lazy_storage___playbackPlayer] = 0;
  *(void *)&v4[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_cancellables] = MEMORY[0x263F8EE88];
  uint64_t v23 = OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioIOQueue;
  MEMORY[0x270FA5388](v22);
  uint64_t v24 = sub_25F3F5F90();
  MEMORY[0x270FA5388](v24);
  uint64_t v25 = MEMORY[0x263F8EE78];
  id v191 = (id)MEMORY[0x263F8EE78];
  uint64_t v26 = sub_25F3F67A0();
  double v27 = MEMORY[0x270FA5388](v26);
  v18((char *)&v167 - v10, v178, v180, v27);
  *(void *)&v4[v23] = sub_25F3F6560();
  *(void *)&v4[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_numberOfAudioMagnitudes] = 0;
  uint64_t v28 = OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_speechRecognitionService;
  type metadata accessor for TTSVBSpeechRecognitionService();
  *(void *)&v4[v28] = sub_25F386F2C();
  uint64_t v29 = OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_cachedSoundEffects;
  *(void *)&v4[v29] = sub_25F3DD310(v25);
  id v30 = objc_msgSend(self, sel_sharedInstance);
  *(void *)&v4[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioSession] = v30;

  v192.receiver = v4;
  v192.super_class = v182;
  id v31 = objc_msgSendSuper2(&v192, sel_init);
  uint64_t v32 = self;
  uint64_t v33 = (char *)v31;
  id v172 = objc_msgSend(v32, sel_defaultCenter);
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DB50);
  uint64_t v35 = *(void *)(v34 - 8);
  unint64_t v187 = v34;
  uint64_t v188 = v35;
  uint64_t v174 = *(void *)(v35 + 64);
  MEMORY[0x270FA5388](v34);
  unint64_t v183 = (v36 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v37 = (char *)&v167 - v183;
  uint64_t v38 = sub_25F3F6590();
  unint64_t v189 = *(void *)(v38 - 8);
  uint64_t v178 = *(void *)(v189 + 64);
  MEMORY[0x270FA5388](v38);
  unint64_t v185 = (v39 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v40 = (char *)&v167 - v185;
  id v41 = sub_25F3D111C();
  sub_25F3F65A0();

  v182 = (objc_class *)OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioQueue;
  id v191 = *(id *)&v33[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioQueue];
  id v42 = v191;
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DB58);
  uint64_t v180 = *(void *)(*(void *)(v43 - 8) + 64);
  MEMORY[0x270FA5388](v43 - 8);
  unint64_t v181 = (v44 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v45 = (char *)&v167 - v181;
  uint64_t v171 = sub_25F3F6520();
  uint64_t v46 = *(void *)(v171 - 8);
  v176 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v46 + 56);
  uint64_t v186 = v46 + 56;
  v176(v45, 1, 1, v171);
  v175 = (char *)sub_25F3E5338(&qword_26A78DB60, MEMORY[0x270FA9C58]);
  unint64_t v184 = sub_25F3E5380();
  id v47 = v42;
  uint64_t v169 = v38;
  sub_25F3F5F40();
  sub_25F307B78((uint64_t)v45, &qword_26A78DB58);

  v179 = *(void (**)(char *, uint64_t))(v189 + 8);
  v189 += 8;
  v179(v40, v38);
  swift_allocObject();
  int v48 = v33;
  swift_unknownObjectWeakInit();
  v173 = (void (*)(char *, uint64_t, uint64_t, double))sub_25F335CF0(&qword_26A78DB70, &qword_26A78DB50);
  unint64_t v49 = v187;
  sub_25F3F5F50();
  swift_release();
  v177 = *(void (**)(char *, unint64_t))(v188 + 8);
  v188 += 8;
  v177(v37, v49);
  v170 = &v33[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_cancellables];
  swift_beginAccess();
  sub_25F3F5EC0();
  swift_endAccess();
  uint64_t v50 = swift_release();
  MEMORY[0x270FA5388](v50);
  unint64_t v51 = v183;
  MEMORY[0x270FA5388](v52);
  uint64_t v53 = (char *)&v167 - v185;
  uint64_t v54 = sub_25F3F65A0();
  id v191 = *(id *)((char *)v182 + (void)v33);
  id v55 = v191;
  double v56 = MEMORY[0x270FA5388](v54);
  uint64_t v57 = (char *)&v167 - v181;
  uint64_t v58 = (void (*)(char *, uint64_t, uint64_t, uint64_t, double))v176;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t, double))v176)((char *)&v167 - v181, 1, 1, v171, v56);
  id v59 = v55;
  uint64_t v60 = v169;
  sub_25F3F5F40();
  sub_25F307B78((uint64_t)v57, &qword_26A78DB58);

  v179(v53, v60);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  unint64_t v61 = v187;
  sub_25F3F5F50();
  swift_release();
  v177((char *)&v167 - v51, v61);
  swift_beginAccess();
  sub_25F3F5EC0();
  swift_endAccess();
  uint64_t v62 = swift_release();
  MEMORY[0x270FA5388](v62);
  uint64_t v63 = (char *)&v167 - v51;
  MEMORY[0x270FA5388](v64);
  unint64_t v65 = v185;
  uint64_t v66 = sub_25F3F65A0();
  id v191 = *(id *)((char *)v182 + (void)v48);
  id v67 = v191;
  double v68 = MEMORY[0x270FA5388](v66);
  uint64_t v69 = (char *)&v167 - v181;
  uint64_t v70 = v171;
  v58((char *)&v167 - v181, 1, 1, v171, v68);
  id v71 = v67;
  uint64_t v72 = v169;
  sub_25F3F5F40();
  sub_25F307B78((uint64_t)v69, &qword_26A78DB58);

  v179((char *)&v167 - v65, v72);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  unint64_t v73 = v187;
  sub_25F3F5F50();
  swift_release();
  v177(v63, v73);
  swift_beginAccess();
  sub_25F3F5EC0();
  swift_endAccess();
  uint64_t v74 = swift_release();
  MEMORY[0x270FA5388](v74);
  uint64_t v75 = (char *)&v167 - v183;
  MEMORY[0x270FA5388](v76);
  uint64_t v77 = sub_25F3F65A0();
  id v191 = *(id *)((char *)v182 + (void)v48);
  id v78 = v191;
  double v79 = MEMORY[0x270FA5388](v77);
  uint64_t v80 = (char *)&v167 - v181;
  uint64_t v81 = v70;
  char v82 = (void (*)(char *, uint64_t, uint64_t, uint64_t, double))v176;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t, double))v176)((char *)&v167 - v181, 1, 1, v81, v79);
  id v83 = v78;
  sub_25F3F5F40();
  sub_25F307B78((uint64_t)v80, &qword_26A78DB58);

  uint64_t v84 = v72;
  uint64_t v85 = v179;
  v179((char *)&v167 - v65, v84);
  swift_allocObject();
  uint64_t v86 = v48;
  v168 = v48;
  swift_unknownObjectWeakInit();
  unint64_t v87 = v187;
  sub_25F3F5F50();
  swift_release();
  v177(v75, v87);
  swift_beginAccess();
  sub_25F3F5EC0();
  swift_endAccess();
  uint64_t v88 = swift_release();
  MEMORY[0x270FA5388](v88);
  uint64_t v89 = (char *)&v167 - v183;
  MEMORY[0x270FA5388](v90);
  uint64_t v91 = (char *)&v167 - v185;
  uint64_t v92 = sub_25F3F65A0();
  id v191 = *(id *)((char *)v182 + (void)v86);
  id v93 = v191;
  double v94 = MEMORY[0x270FA5388](v92);
  uint64_t v95 = (char *)&v167 - v181;
  v82((char *)&v167 - v181, 1, 1, v171, v94);
  id v96 = v93;
  uint64_t v97 = v169;
  sub_25F3F5F40();
  sub_25F307B78((uint64_t)v95, &qword_26A78DB58);

  v85(v91, v97);
  swift_allocObject();
  uint64_t v98 = v168;
  swift_unknownObjectWeakInit();
  unint64_t v99 = v187;
  sub_25F3F5F50();
  swift_release();
  unint64_t v100 = v99;
  uint64_t v101 = v177;
  v177(v89, v100);
  swift_beginAccess();
  sub_25F3F5EC0();
  swift_endAccess();
  uint64_t v102 = swift_release();
  MEMORY[0x270FA5388](v102);
  int v103 = (char *)&v167 - v183;
  MEMORY[0x270FA5388](v104);
  int v105 = (char *)&v167 - v185;
  uint64_t v106 = sub_25F3F65A0();
  uint64_t v107 = v182;
  uint64_t v109 = v98;
  id v191 = *(id *)((char *)v182 + (void)v98);
  id v108 = v191;
  double v110 = MEMORY[0x270FA5388](v106);
  unint64_t v111 = v181;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t, double))v176)((char *)&v167 - v181, 1, 1, v171, v110);
  id v112 = v108;
  uint64_t v113 = v169;
  sub_25F3F5F40();
  sub_25F307B78((uint64_t)&v167 - v111, &qword_26A78DB58);

  v179(v105, v113);
  swift_allocObject();
  unint64_t v114 = v109;
  swift_unknownObjectWeakInit();
  unint64_t v115 = v187;
  sub_25F3F5F50();
  swift_release();
  v101(v103, v115);
  swift_beginAccess();
  sub_25F3F5EC0();
  swift_endAccess();
  uint64_t v116 = swift_release();
  MEMORY[0x270FA5388](v116);
  uint64_t v117 = (char *)&v167 - v183;
  MEMORY[0x270FA5388](v118);
  unint64_t v119 = (char *)&v167 - v185;
  uint64_t v120 = sub_25F3F65A0();
  uint64_t v121 = v114;
  id v191 = *(id *)((char *)v107 + (void)v114);
  id v122 = v191;
  double v123 = MEMORY[0x270FA5388](v120);
  uint64_t v124 = (char *)&v167 - v111;
  long long v125 = (char *)&v167 - v111;
  uint64_t v126 = v171;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t, double))v176)(v125, 1, 1, v171, v123);
  id v127 = v122;
  uint64_t v128 = v169;
  sub_25F3F5F40();
  sub_25F307B78((uint64_t)v124, &qword_26A78DB58);

  uint64_t v129 = v128;
  v179(v119, v128);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  unint64_t v130 = v187;
  sub_25F3F5F50();
  swift_release();
  v177(v117, v130);
  swift_beginAccess();
  sub_25F3F5EC0();
  swift_endAccess();
  uint64_t v131 = swift_release();
  MEMORY[0x270FA5388](v131);
  v132 = (char *)&v167 - v183;
  MEMORY[0x270FA5388](v133);
  uint64_t v134 = (char *)&v167 - v185;
  uint64_t v135 = sub_25F3F65A0();
  id v191 = *(id *)((char *)v182 + (void)v121);
  id v136 = v191;
  double v137 = MEMORY[0x270FA5388](v135);
  v138 = (char *)&v167 - v181;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t, double))v176)((char *)&v167 - v181, 1, 1, v126, v137);
  id v139 = v136;
  sub_25F3F5F40();
  sub_25F307B78((uint64_t)v138, &qword_26A78DB58);

  v179(v134, v129);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  unint64_t v140 = v187;
  sub_25F3F5F50();
  swift_release();
  v177(v132, v140);
  swift_beginAccess();
  sub_25F3F5EC0();
  swift_endAccess();
  uint64_t v141 = swift_release();
  MEMORY[0x270FA5388](v141);
  v142 = (char *)&v167 - v183;
  MEMORY[0x270FA5388](v143);
  v144 = (char *)&v167 - v185;
  v145 = v172;
  uint64_t v146 = sub_25F3F65A0();
  id v191 = *(id *)((char *)v182 + (void)v121);
  id v147 = v191;
  double v148 = MEMORY[0x270FA5388](v146);
  v149 = (char *)&v167 - v181;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t, double))v176)((char *)&v167 - v181, 1, 1, v171, v148);
  id v150 = v147;
  sub_25F3F5F40();
  sub_25F307B78((uint64_t)v149, &qword_26A78DB58);

  v179(v144, v129);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  unint64_t v151 = v187;
  sub_25F3F5F50();
  swift_release();
  v177(v142, v151);
  swift_beginAccess();
  sub_25F3F5EC0();
  swift_endAccess();
  uint64_t v152 = swift_release();
  MEMORY[0x270FA5388](v152);
  v153 = (char *)&v167 - v183;
  MEMORY[0x270FA5388](v154);
  v155 = (char *)&v167 - v185;
  uint64_t v156 = sub_25F3F65A0();
  id v191 = *(id *)((char *)v182 + (void)v121);
  id v157 = v191;
  double v158 = MEMORY[0x270FA5388](v156);
  v159 = (char *)&v167 - v181;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t, double))v176)((char *)&v167 - v181, 1, 1, v171, v158);
  id v160 = v157;
  sub_25F3F5F40();
  sub_25F307B78((uint64_t)v159, &qword_26A78DB58);

  v179(v155, v129);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_25F3F5F50();
  swift_release();
  v177(v153, v151);
  swift_beginAccess();
  sub_25F3F5EC0();
  swift_endAccess();
  swift_release();
  uint64_t v161 = OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioSession;
  v162 = *(void **)&v121[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioSession];
  swift_retain();
  LOBYTE(v191) = objc_msgSend(v162, sel_isInputAvailable);
  sub_25F3F5F00();
  swift_release();
  v163 = *(void **)&v121[v161];
  v164 = v121;
  v165 = (void *)sub_25F3F6100();
  objc_msgSend(v163, sel_addObserver_forKeyPath_options_context_, v164, v165, 0, 0);

  return v164;
}

void sub_25F3D2D40()
{
  swift_retain();
  sub_25F3F5EF0();
  swift_release();
  LODWORD(v18) = v20;
  uint64_t v1 = sub_25F3EF940();
  uint64_t v2 = sub_25F3F5EA0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  double v5 = MEMORY[0x270FA5388](v2);
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t, double))(v3 + 16);
  v19((char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v1, v2, v5);
  uint64_t v6 = sub_25F3F5E80();
  os_log_type_t v7 = sub_25F3F64D0();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    v17[1] = v1;
    uint64_t v9 = v3;
    uint64_t v10 = v2;
    uint64_t v11 = v8;
    *(_DWORD *)uint64_t v8 = 67109120;
    LODWORD(v20) = v18;
    sub_25F3F66A0();
    _os_log_impl(&dword_25F2F5000, v6, v7, "Got audio engine config change. wasRunning=%{BOOL}d. Restarting audio engine.", v11, 8u);
    uint64_t v12 = v11;
    uint64_t v2 = v10;
    uint64_t v3 = v9;
    MEMORY[0x2611F21E0](v12, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))((char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  sub_25F3D5F60();
  id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EF93D0]), sel_init);
  uint64_t v14 = *(void **)(v0 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioPlayerNode);
  *(void *)(v0 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioPlayerNode) = v13;

  id v15 = sub_25F3D0FA0();
  double v16 = *(void **)(v0
                 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService____lazy_storage___audioEngine);
  *(void *)(v0 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService____lazy_storage___audioEngine) = v15;

  sub_25F3D5700();
}

void sub_25F3D31C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for TTSVBAudioService.AudioSessionEvent(0);
  MEMORY[0x270FA5388](v3);
  double v5 = (uint64_t *)((char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x2611F22B0](a2 + 16);
  if (v6)
  {
    os_log_type_t v7 = (char *)v6;
    sub_25F3F5870();
    if (*((void *)&v43 + 1))
    {
      sub_25F3237C8(&v42, v41);
      sub_25F3236F0(0, &qword_26A78DCE0);
      swift_dynamicCast();
      uint64_t v8 = (void *)v39;
      if ((void)v39 != *(void *)&v7[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioSession])
      {

        return;
      }
      uint64_t v9 = sub_25F3F5880();
      if (v9)
      {
        uint64_t v10 = v9;
        *(void *)&long long v42 = sub_25F3F6130();
        *((void *)&v42 + 1) = v11;
        swift_bridgeObjectRetain();
        sub_25F3F6830();
        if (*(void *)(v10 + 16) && (unint64_t v12 = sub_25F3AE5A4((uint64_t)v41), (v13 & 1) != 0))
        {
          sub_25F301A40(*(void *)(v10 + 56) + 32 * v12, (uint64_t)&v39);
        }
        else
        {
          long long v39 = 0u;
          long long v40 = 0u;
        }
        swift_bridgeObjectRelease();
        if (*((void *)&v40 + 1))
        {
          sub_25F3AEC24((uint64_t)v41);
          swift_bridgeObjectRelease();
          sub_25F3237C8(&v39, &v42);
          sub_25F3236F0(0, &qword_26B398CD8);
          swift_dynamicCast();
          id v37 = v38;
          id v36 = objc_msgSend(v38, sel_unsignedIntegerValue);
          uint64_t v14 = sub_25F3F5880();
          if (v14)
          {
            uint64_t v15 = v14;
            *(void *)&long long v39 = sub_25F3F6130();
            *((void *)&v39 + 1) = v16;
            sub_25F3F6830();
            if (*(void *)(v15 + 16) && (unint64_t v17 = sub_25F3AE5A4((uint64_t)v41), (v18 & 1) != 0))
            {
              sub_25F301A40(*(void *)(v15 + 56) + 32 * v17, (uint64_t)&v42);
            }
            else
            {
              long long v42 = 0u;
              long long v43 = 0u;
            }
            swift_bridgeObjectRelease();
            sub_25F3AEC24((uint64_t)v41);
            if (*((void *)&v43 + 1))
            {
              if (swift_dynamicCast())
              {
                uint64_t v19 = *(void **)&v41[0];
                id v35 = objc_msgSend(*(id *)&v41[0], sel_unsignedIntegerValue);

                int v34 = 0;
                goto LABEL_22;
              }
LABEL_21:
              id v35 = 0;
              int v34 = 1;
LABEL_22:
              uint64_t v20 = sub_25F3F5880();
              if (v20)
              {
                uint64_t v21 = v20;
                *(void *)&long long v39 = sub_25F3F6130();
                *((void *)&v39 + 1) = v22;
                sub_25F3F6830();
                if (*(void *)(v21 + 16) && (unint64_t v23 = sub_25F3AE5A4((uint64_t)v41), (v24 & 1) != 0))
                {
                  sub_25F301A40(*(void *)(v21 + 56) + 32 * v23, (uint64_t)&v42);
                }
                else
                {
                  long long v42 = 0u;
                  long long v43 = 0u;
                }
                swift_bridgeObjectRelease();
                sub_25F3AEC24((uint64_t)v41);
                if (*((void *)&v43 + 1))
                {
                  if (swift_dynamicCast())
                  {
                    uint64_t v25 = *(void **)&v41[0];
                    id v26 = objc_msgSend(*(id *)&v41[0], sel_unsignedIntegerValue);

                    char v27 = 0;
LABEL_33:
                    uint64_t v28 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26A78DBD0);
                    uint64_t v29 = v28[16];
                    id v30 = (char *)v5 + v28[20];
                    id v31 = (char *)v5 + v28[24];
                    *double v5 = v8;
                    id v32 = v8;
                    sub_25F3F5CB0();
                    *(void *)((char *)v5 + v29) = v36;
                    *(void *)id v30 = v35;
                    v30[8] = v34;
                    *(void *)id v31 = v26;
                    v31[8] = v27;
                    swift_storeEnumTagMultiPayload();
                    sub_25F3D3678((uint64_t)v5);

                    sub_25F3E9DBC((uint64_t)v5, type metadata accessor for TTSVBAudioService.AudioSessionEvent);
                    return;
                  }
LABEL_32:
                  id v26 = 0;
                  char v27 = 1;
                  goto LABEL_33;
                }
              }
              else
              {
                long long v42 = 0u;
                long long v43 = 0u;
              }
              sub_25F307B78((uint64_t)&v42, (uint64_t *)&unk_26A78D2B0);
              goto LABEL_32;
            }
          }
          else
          {
            long long v42 = 0u;
            long long v43 = 0u;
          }
          sub_25F307B78((uint64_t)&v42, (uint64_t *)&unk_26A78D2B0);
          goto LABEL_21;
        }
LABEL_37:
        __break(1u);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_37;
  }
}

void sub_25F3D3678(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for TTSVBAudioService.AudioSessionEvent(0);
  MEMORY[0x270FA5388](v3);
  double v5 = (id *)((char *)&v54 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v54 - v7;
  uint64_t v9 = sub_25F3F5FE0();
  uint64_t v10 = *(void *)(v9 - 8);
  double v11 = MEMORY[0x270FA5388](v9);
  char v13 = (uint64_t *)((char *)&v54 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v14 = *(void **)&v1[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioQueue];
  *char v13 = v14;
  (*(void (**)(void *, void, uint64_t, double))(v10 + 104))(v13, *MEMORY[0x263F8F0E8], v9, v11);
  id v15 = v14;
  LOBYTE(v14) = sub_25F3F6000();
  (*(void (**)(void *, uint64_t))(v10 + 8))(v13, v9);
  if (v14)
  {
    uint64_t v16 = sub_25F3EF940();
    uint64_t v17 = sub_25F3F5EA0();
    uint64_t v18 = *(void *)(v17 - 8);
    double v19 = MEMORY[0x270FA5388](v17);
    uint64_t v21 = (char *)&v54 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v22 = *(void (**)(char *, uint64_t, double))(v18 + 16);
    uint64_t v62 = v23;
    v22(v21, v16, v19);
    sub_25F3E84A4(a1, (uint64_t)v8, type metadata accessor for TTSVBAudioService.AudioSessionEvent);
    char v24 = v1;
    uint64_t v25 = sub_25F3F5E80();
    os_log_type_t v26 = sub_25F3F64A0();
    int v27 = v26;
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v28 = swift_slowAlloc();
      uint64_t v60 = v3;
      uint64_t v29 = v28;
      uint64_t v57 = swift_slowAlloc();
      uint64_t v69 = v57;
      *(_DWORD *)uint64_t v29 = 136316162;
      int v56 = v27;
      os_log_t v55 = v25;
      unint64_t v30 = sub_25F3E4D78();
      uint64_t v67 = sub_25F2FE464(v30, v31, &v69);
      sub_25F3F66A0();
      swift_bridgeObjectRelease();
      sub_25F3E9DBC((uint64_t)v8, type metadata accessor for TTSVBAudioService.AudioSessionEvent);
      *(_WORD *)(v29 + 12) = 2080;
      uint64_t v59 = a1;
      id v32 = *(void **)&v24[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioSession];
      id v33 = objc_msgSend(v32, sel_category);
      uint64_t v34 = sub_25F3F6130();
      uint64_t v58 = &v54;
      uint64_t v67 = v34;
      uint64_t v68 = v35;
      unint64_t v65 = 0xD000000000000016;
      unint64_t v66 = 0x800000025F408020;
      uint64_t v63 = 0;
      unint64_t v64 = 0xE000000000000000;
      sub_25F2FDE6C();
      uint64_t v36 = sub_25F3F6700();
      unint64_t v61 = v5;
      unint64_t v38 = v37;

      swift_bridgeObjectRelease();
      uint64_t v67 = sub_25F2FE464(v36, v38, &v69);
      sub_25F3F66A0();

      swift_bridgeObjectRelease();
      *(_WORD *)(v29 + 22) = 2080;
      uint64_t v39 = sub_25F3E0E44((char)objc_msgSend(v32, sel_categoryOptions));
      uint64_t v67 = sub_25F2FE464(v39, v40, &v69);
      sub_25F3F66A0();

      swift_bridgeObjectRelease();
      *(_WORD *)(v29 + 32) = 2080;
      id v41 = objc_msgSend(v32, sel_mode);
      uint64_t v42 = sub_25F3F6130();
      unint64_t v44 = v43;

      uint64_t v67 = sub_25F2FE464(v42, v44, &v69);
      sub_25F3F66A0();

      a1 = v59;
      swift_bridgeObjectRelease();
      *(_WORD *)(v29 + 42) = 2080;
      id v45 = objc_msgSend(v32, sel_currentRoute);
      uint64_t v46 = sub_25F3E3A78();
      unint64_t v48 = v47;

      uint64_t v67 = sub_25F2FE464(v46, v48, &v69);
      sub_25F3F66A0();

      double v5 = v61;
      swift_bridgeObjectRelease();
      os_log_t v49 = v55;
      _os_log_impl(&dword_25F2F5000, v55, (os_log_type_t)v56, "Got audio sesseion event: %s. CurrentCategory=%s CurrentOptions=%s CurrentMode=%s CurrentRoute=%s", (uint8_t *)v29, 0x34u);
      uint64_t v50 = v57;
      swift_arrayDestroy();
      MEMORY[0x2611F21E0](v50, -1, -1);
      MEMORY[0x2611F21E0](v29, -1, -1);
    }
    else
    {
      sub_25F3E9DBC((uint64_t)v8, type metadata accessor for TTSVBAudioService.AudioSessionEvent);
    }
    (*(void (**)(char *, uint64_t))(v18 + 8))(v21, v62);
    sub_25F3E84A4(a1, (uint64_t)v5, type metadata accessor for TTSVBAudioService.AudioSessionEvent);
    if (swift_getEnumCaseMultiPayload() == 1)
    {

      uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DBC8);
      uint64_t v52 = (char *)v5 + *(int *)(v51 + 48);

      uint64_t v53 = sub_25F3F5CC0();
      (*(void (**)(char *, uint64_t))(*(void *)(v53 - 8) + 8))(v52, v53);
      sub_25F3E3844();
    }
    else
    {
      sub_25F3E9DBC((uint64_t)v5, type metadata accessor for TTSVBAudioService.AudioSessionEvent);
    }
  }
  else
  {
    __break(1u);
  }
}

void sub_25F3D3D74(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for TTSVBAudioService.AudioSessionEvent(0);
  MEMORY[0x270FA5388](v3);
  double v5 = (id *)((char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x2611F22B0](a2 + 16);
  if (v6)
  {
    uint64_t v7 = (char *)v6;
    sub_25F3F5870();
    if (v35)
    {
      sub_25F3237C8(&v34, v33);
      sub_25F3236F0(0, &qword_26A78DCE0);
      swift_dynamicCast();
      uint64_t v8 = (void *)v31;
      if ((void)v31 != *(void *)&v7[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioSession])
      {

        return;
      }
      uint64_t v9 = sub_25F3F5880();
      if (v9)
      {
        uint64_t v10 = v9;
        *(void *)&long long v34 = sub_25F3F6130();
        *((void *)&v34 + 1) = v11;
        swift_bridgeObjectRetain();
        sub_25F3F6830();
        if (*(void *)(v10 + 16) && (unint64_t v12 = sub_25F3AE5A4((uint64_t)v33), (v13 & 1) != 0))
        {
          sub_25F301A40(*(void *)(v10 + 56) + 32 * v12, (uint64_t)&v31);
        }
        else
        {
          long long v31 = 0u;
          long long v32 = 0u;
        }
        swift_bridgeObjectRelease();
        if (*((void *)&v32 + 1))
        {
          sub_25F3AEC24((uint64_t)v33);
          swift_bridgeObjectRelease();
          sub_25F3237C8(&v31, &v34);
          sub_25F3236F0(0, &qword_26B398CD8);
          swift_dynamicCast();
          id v14 = v30;
          id v15 = objc_msgSend(v30, sel_unsignedIntegerValue);
          uint64_t v16 = sub_25F3F5880();
          if (v16)
          {
            uint64_t v17 = v16;
            *(void *)&long long v34 = sub_25F3F6130();
            *((void *)&v34 + 1) = v18;
            swift_bridgeObjectRetain();
            sub_25F3F6830();
            uint64_t v19 = *(void *)(v17 + 16);
            id v29 = v14;
            if (v19 && (unint64_t v20 = sub_25F3AE5A4((uint64_t)v33), (v21 & 1) != 0))
            {
              sub_25F301A40(*(void *)(v17 + 56) + 32 * v20, (uint64_t)&v31);
            }
            else
            {
              long long v31 = 0u;
              long long v32 = 0u;
            }
            id v22 = v15;
            swift_bridgeObjectRelease();
            if (*((void *)&v32 + 1))
            {
              sub_25F3AEC24((uint64_t)v33);
              swift_bridgeObjectRelease();
              sub_25F3237C8(&v31, &v34);
              sub_25F3236F0(0, &qword_26A78DCE8);
              swift_dynamicCast();
              id v23 = v30;
              uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DBC8);
              uint64_t v25 = *(int *)(v24 + 64);
              uint64_t v26 = *(int *)(v24 + 80);
              *double v5 = v8;
              id v27 = v8;
              sub_25F3F5CB0();
              *(void *)((char *)v5 + v25) = v22;
              *(void *)((char *)v5 + v26) = v23;
              swift_storeEnumTagMultiPayload();
              id v28 = v23;
              sub_25F3D3678((uint64_t)v5);

              sub_25F3E9DBC((uint64_t)v5, type metadata accessor for TTSVBAudioService.AudioSessionEvent);
              return;
            }
LABEL_23:
            __break(1u);
            return;
          }
LABEL_22:
          __break(1u);
          goto LABEL_23;
        }
LABEL_21:
        __break(1u);
        goto LABEL_22;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_21;
  }
}

void sub_25F3D4124(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for TTSVBAudioService.AudioSessionEvent(0);
  MEMORY[0x270FA5388](v3);
  double v5 = (uint64_t *)((char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x2611F22B0](a2 + 16);
  if (v6)
  {
    uint64_t v7 = (char *)v6;
    sub_25F3F5870();
    if (v24)
    {
      sub_25F3237C8(&v23, v22);
      sub_25F3236F0(0, &qword_26A78DCE0);
      swift_dynamicCast();
      uint64_t v8 = (void *)v20;
      if ((void)v20 != *(void *)&v7[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioSession])
      {

        return;
      }
      uint64_t v9 = sub_25F3F5880();
      if (v9)
      {
        uint64_t v10 = v9;
        *(void *)&long long v23 = sub_25F3F6130();
        *((void *)&v23 + 1) = v11;
        swift_bridgeObjectRetain();
        sub_25F3F6830();
        if (*(void *)(v10 + 16) && (unint64_t v12 = sub_25F3AE5A4((uint64_t)v22), (v13 & 1) != 0))
        {
          sub_25F301A40(*(void *)(v10 + 56) + 32 * v12, (uint64_t)&v20);
        }
        else
        {
          long long v20 = 0u;
          long long v21 = 0u;
        }
        swift_bridgeObjectRelease();
        if (*((void *)&v21 + 1))
        {
          sub_25F3AEC24((uint64_t)v22);
          swift_bridgeObjectRelease();
          sub_25F3237C8(&v20, &v23);
          sub_25F3236F0(0, &qword_26B398CD8);
          swift_dynamicCast();
          id v14 = v19;
          id v15 = objc_msgSend(v19, sel_unsignedIntegerValue);
          uint64_t v16 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A78DBC0) + 64);
          *double v5 = v8;
          id v17 = v8;
          sub_25F3F5CB0();
          *(void *)((char *)v5 + v16) = v15;
          swift_storeEnumTagMultiPayload();
          sub_25F3D3678((uint64_t)v5);

          sub_25F3E9DBC((uint64_t)v5, type metadata accessor for TTSVBAudioService.AudioSessionEvent);
          return;
        }
LABEL_15:
        __break(1u);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_15;
  }
}

void sub_25F3D43C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for TTSVBAudioService.AudioSessionEvent(0);
  MEMORY[0x270FA5388](v3);
  double v5 = (uint64_t *)((char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x2611F22B0](a2 + 16);
  if (v6)
  {
    uint64_t v7 = (char *)v6;
    sub_25F3F5870();
    if (v24)
    {
      sub_25F3237C8(&v23, v22);
      sub_25F3236F0(0, &qword_26A78DCE0);
      swift_dynamicCast();
      uint64_t v8 = (void *)v20;
      if ((void)v20 != *(void *)&v7[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioSession])
      {

        return;
      }
      uint64_t v9 = sub_25F3F5880();
      if (v9)
      {
        uint64_t v10 = v9;
        *(void *)&long long v23 = sub_25F3F6130();
        *((void *)&v23 + 1) = v11;
        swift_bridgeObjectRetain();
        sub_25F3F6830();
        if (*(void *)(v10 + 16) && (unint64_t v12 = sub_25F3AE5A4((uint64_t)v22), (v13 & 1) != 0))
        {
          sub_25F301A40(*(void *)(v10 + 56) + 32 * v12, (uint64_t)&v20);
        }
        else
        {
          long long v20 = 0u;
          long long v21 = 0u;
        }
        swift_bridgeObjectRelease();
        if (*((void *)&v21 + 1))
        {
          sub_25F3AEC24((uint64_t)v22);
          swift_bridgeObjectRelease();
          sub_25F3237C8(&v20, &v23);
          sub_25F3236F0(0, &qword_26B398CD8);
          swift_dynamicCast();
          id v14 = v19;
          unsigned __int8 v15 = objc_msgSend(v19, sel_BOOLValue);

          uint64_t v16 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A78DBB8) + 64);
          *double v5 = v8;
          id v17 = v8;
          sub_25F3F5CB0();
          *((unsigned char *)v5 + v16) = v15;
          swift_storeEnumTagMultiPayload();
          sub_25F3D3678((uint64_t)v5);

          sub_25F3E9DBC((uint64_t)v5, type metadata accessor for TTSVBAudioService.AudioSessionEvent);
          return;
        }
LABEL_15:
        __break(1u);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_15;
  }
}

void sub_25F3D465C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for TTSVBAudioService.AudioSessionEvent(0);
  MEMORY[0x270FA5388](v3);
  double v5 = (void **)((char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x2611F22B0](a2 + 16);
  if (v6)
  {
    uint64_t v7 = (char *)v6;
    sub_25F3F5870();
    if (v12)
    {
      sub_25F3237C8(&v11, &v13);
      sub_25F3236F0(0, &qword_26A78DCE0);
      swift_dynamicCast();
      uint64_t v8 = v10;
      if (v10 == *(void **)&v7[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioSession])
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DBB0);
        *double v5 = v8;
        id v9 = v8;
        sub_25F3F5CB0();
        swift_storeEnumTagMultiPayload();
        sub_25F3D3678((uint64_t)v5);

        sub_25F3E9DBC((uint64_t)v5, type metadata accessor for TTSVBAudioService.AudioSessionEvent);
      }
      else
      {
      }
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t TTSVBAudioService.isAudioEngineRunning.getter()
{
  return sub_25F3D4A5C();
}

uint64_t TTSVBAudioService.isAudioEngineRunningPublisher.getter()
{
  return sub_25F3D4D28(&qword_26A78DB78);
}

uint64_t TTSVBAudioService.isRecording.getter()
{
  return sub_25F3D4A5C();
}

uint64_t TTSVBAudioService.isRecordingPublisher.getter()
{
  return sub_25F3D4D28(&qword_26A78DB78);
}

uint64_t sub_25F3D4888@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DCC0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10[1] = *(void *)(*(void *)(a1 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_state)
                     + 24);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DCC8);
  sub_25F335CF0(&qword_26A78DCD0, &qword_26A78DCC8);
  sub_25F3F5F30();
  swift_release();
  sub_25F335CF0(&qword_26A78DCD8, &qword_26A78DCC0);
  uint64_t v8 = sub_25F3F5F20();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  *a2 = v8;
  return result;
}

uint64_t sub_25F3D4A30@<X0>(uint64_t result@<X0>, BOOL *a2@<X8>)
{
  *a2 = *(unsigned char *)(result + 16) == 0;
  return result;
}

uint64_t TTSVBAudioService.isPlaying.getter()
{
  return sub_25F3D4A5C();
}

uint64_t sub_25F3D4A5C()
{
  sub_25F3F6540();
  return v1;
}

uint64_t TTSVBAudioService.isPlayingPublisher.getter()
{
  return sub_25F3D4D28(&qword_26A78DB78);
}

uint64_t TTSVBAudioService.audioMagnitudes.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DB80);
  sub_25F3F6540();
  return v1;
}

uint64_t TTSVBAudioService.audioMagnitudesPublisher.getter()
{
  return sub_25F3D4D28(&qword_26A78DB88);
}

double TTSVBAudioService.audioLevel.getter()
{
  sub_25F3F6540();
  return v1;
}

uint64_t TTSVBAudioService.audioLevelPublisher.getter()
{
  return sub_25F3D4D28(&qword_26A78DB90);
}

uint64_t TTSVBAudioService.inputSource.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DB98);
  sub_25F3F6540();
  return v1;
}

uint64_t TTSVBAudioService.inputSourcePublisher.getter()
{
  return sub_25F3D4D28(&qword_26A78DBA0);
}

uint64_t TTSVBAudioService.isInputAvailable.getter()
{
  sub_25F3F6540();
  return v1;
}

uint64_t TTSVBAudioService.isInputAvailablePublisher.getter()
{
  return sub_25F3D4D28(&qword_26A78DB78);
}

uint64_t sub_25F3D4D28(uint64_t *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(a1);
  sub_25F3F6540();
  return v2;
}

uint64_t sub_25F3D4ED0@<X0>(uint64_t a1@<X8>)
{
  swift_getObjectType();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v4 = (void *)sub_25F3F6100();
  swift_bridgeObjectRelease();
  uint64_t v5 = (void *)sub_25F3F6100();
  id v6 = objc_msgSend(v3, sel_URLForResource_withExtension_, v4, v5);

  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B398888);
  MEMORY[0x270FA5388](v7 - 8);
  id v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v6)
  {
    uint64_t v10 = sub_25F3F5B60();
    uint64_t v11 = *(void *)(v10 - 8);
    MEMORY[0x270FA5388](v10);
    long long v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_25F3F5B20();

    id v14 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
    v14(v9, v13, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10);
    if (result != 1) {
      return ((uint64_t (*)(uint64_t, char *, uint64_t))v14)(a1, v9, v10);
    }
  }
  else
  {
    uint64_t v16 = sub_25F3F5B60();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v9, 1, 1, v16);
  }
  __break(1u);
  return result;
}

uint64_t TTSVBAudioService.startAudio(_:)(uint64_t a1, uint64_t a2)
{
  return sub_25F3E0628(a1, a2, (uint64_t)&unk_270B97648, (uint64_t)sub_25F3E8010, (uint64_t)&block_descriptor_7);
}

uint64_t sub_25F3D5198(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25F3D5700();
  void v17[3] = *(void *)(a1 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_calloutQueue);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a2;
  *(void *)(v6 + 24) = a3;
  aBlock[4] = sub_25F3EC104;
  aBlock[5] = v6;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_25F302590;
  aBlock[3] = &block_descriptor_257;
  uint64_t v7 = _Block_copy(aBlock);
  uint64_t v8 = sub_25F3F5FB0();
  void v17[2] = v17;
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  sub_25F3F5F80();
  uint64_t v12 = sub_25F3F5F70();
  v17[1] = v17;
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  unsigned __int8 v15 = (char *)v17 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17[4] = MEMORY[0x263F8EE78];
  sub_25F3E5338((unint64_t *)&unk_26B3991D0, MEMORY[0x270FCDAA0]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B3991E0);
  sub_25F335CF0((unint64_t *)&unk_26B3991F0, (uint64_t *)&unk_26B3991E0);
  sub_25F3F67A0();
  MEMORY[0x2611F0F70](0, v11, v15, v7);
  _Block_release(v7);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return swift_release();
}

void sub_25F3D5700()
{
  uint64_t v2 = v0;
  uint64_t v3 = type metadata accessor for TTSVBError.Reason(0);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25F3F5FE0();
  uint64_t v7 = *(void *)(v6 - 8);
  double v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (uint64_t *)((char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = *(void **)(v2 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioQueue);
  *uint64_t v10 = v11;
  (*(void (**)(void *, void, uint64_t, double))(v7 + 104))(v10, *MEMORY[0x263F8F0E8], v6, v8);
  id v12 = v11;
  LOBYTE(v11) = sub_25F3F6000();
  (*(void (**)(void *, uint64_t))(v7 + 8))(v10, v6);
  if (v11)
  {
    sub_25F3DDA6C((void *)*MEMORY[0x263EF9120]);
    if (!v1)
    {
      id v13 = sub_25F3D0F40();
      unsigned __int8 v14 = objc_msgSend(v13, sel_isRunning);

      if (v14)
      {
        uint64_t v15 = sub_25F3EF940();
        uint64_t v16 = sub_25F3F5EA0();
        uint64_t v17 = *(void *)(v16 - 8);
        double v18 = MEMORY[0x270FA5388](v16);
        long long v20 = (char *)&v40 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *, uint64_t, uint64_t, double))(v17 + 16))(v20, v15, v16, v18);
        long long v21 = sub_25F3F5E80();
        os_log_type_t v22 = sub_25F3F64D0();
        if (os_log_type_enabled(v21, v22))
        {
          long long v23 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)long long v23 = 0;
          _os_log_impl(&dword_25F2F5000, v21, v22, "Will not start audio engine. Aready running", v23, 2u);
          MEMORY[0x2611F21E0](v23, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v17 + 8))(v20, v16);
      }
      else
      {
        uint64_t v24 = OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_state;
        uint64_t v25 = *(void (**)(uint64_t))(**(void **)(*(void *)(v2
                                                                       + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_state)
                                                           + OBJC_IVAR____TtCC31TextToSpeechVoiceBankingSupport17TTSVBAudioServiceP33_2F288AB684677915D8A6F8C1A2A5794F5State_bufferHistory)
                                             + 248);
        uint64_t v26 = swift_retain();
        v25(v26);
        swift_release();
        sub_25F3DF09C();
        uint64_t v27 = sub_25F3EF940();
        uint64_t v28 = sub_25F3F5EA0();
        unint64_t v44 = &v40;
        uint64_t v29 = *(void *)(v28 - 8);
        double v30 = MEMORY[0x270FA5388](v28);
        long long v32 = (char *)&v40 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
        id v33 = *(void (**)(char *, uint64_t, double))(v29 + 16);
        uint64_t v41 = v34;
        v33(v32, v27, v30);
        uint64_t v35 = sub_25F3F5E80();
        os_log_type_t v36 = sub_25F3F64D0();
        if (os_log_type_enabled(v35, v36))
        {
          unint64_t v37 = (uint8_t *)swift_slowAlloc();
          uint64_t v40 = v24;
          unint64_t v38 = v37;
          *(_WORD *)unint64_t v37 = 0;
          _os_log_impl(&dword_25F2F5000, v35, v36, "Will start audio engine", v37, 2u);
          MEMORY[0x2611F21E0](v38, -1, -1);
        }

        uint64_t v39 = (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v32, v41);
        MEMORY[0x270FA5388](v39);
        *(&v40 - 2) = v2;
        long long v42 = xmmword_25F4015E0;
        char v43 = 3;
        swift_storeEnumTagMultiPayload();
        static TTSVBError.perform<A>(_:problem:reason:)((void (*)(uint64_t))sub_25F3EB784, (uint64_t)(&v40 - 4), (uint64_t)&v42, (uint64_t)v5);
        sub_25F3E9DBC((uint64_t)v5, type metadata accessor for TTSVBError.Reason);
        LOBYTE(v42) = 1;
        swift_retain();
        sub_25F3F5F00();
        swift_release();
      }
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t TTSVBAudioService.stopAudio(_:)(uint64_t a1, uint64_t a2)
{
  return sub_25F3E0628(a1, a2, (uint64_t)&unk_270B97698, (uint64_t)sub_25F3E8038, (uint64_t)&block_descriptor_21);
}

uint64_t sub_25F3D5C84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25F3D5F60();
  void v17[2] = *(void *)(a1 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_calloutQueue);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a2;
  *(void *)(v6 + 24) = a3;
  aBlock[4] = sub_25F3EC104;
  aBlock[5] = v6;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_25F302590;
  aBlock[3] = &block_descriptor_245;
  uint64_t v7 = _Block_copy(aBlock);
  uint64_t v8 = sub_25F3F5FB0();
  v17[1] = v17;
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  sub_25F3F5F80();
  uint64_t v12 = sub_25F3F5F70();
  v17[0] = v17;
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)v17 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  void v17[3] = MEMORY[0x263F8EE78];
  sub_25F3E5338((unint64_t *)&unk_26B3991D0, MEMORY[0x270FCDAA0]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B3991E0);
  sub_25F335CF0((unint64_t *)&unk_26B3991F0, (uint64_t *)&unk_26B3991E0);
  sub_25F3F67A0();
  MEMORY[0x2611F0F70](0, v11, v15, v7);
  _Block_release(v7);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return swift_release();
}

uint64_t sub_25F3D5F60()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25F3F5FE0();
  uint64_t v3 = *(void *)(v2 - 8);
  double v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = &v22[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = *(void **)(v1 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioQueue);
  *uint64_t v6 = v7;
  (*(void (**)(void *, void, uint64_t, double))(v3 + 104))(v6, *MEMORY[0x263F8F0E8], v2, v4);
  id v8 = v7;
  LOBYTE(v7) = sub_25F3F6000();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v3 + 8))(v6, v2);
  if (v7)
  {
    objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioPlayerNode), sel_stop);
    uint64_t v10 = sub_25F3EF940();
    uint64_t v11 = sub_25F3F5EA0();
    uint64_t v12 = *(void *)(v11 - 8);
    double v13 = MEMORY[0x270FA5388](v11);
    uint64_t v15 = &v22[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
    (*(void (**)(unsigned char *, uint64_t, uint64_t, double))(v12 + 16))(v15, v10, v11, v13);
    uint64_t v16 = sub_25F3F5E80();
    os_log_type_t v17 = sub_25F3F64D0();
    if (os_log_type_enabled(v16, v17))
    {
      double v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)double v18 = 0;
      _os_log_impl(&dword_25F2F5000, v16, v17, "Will stop audio engine", v18, 2u);
      MEMORY[0x2611F21E0](v18, -1, -1);
    }

    (*(void (**)(unsigned char *, uint64_t))(v12 + 8))(v15, v11);
    id v19 = sub_25F3D0F40();
    objc_msgSend(v19, sel_stop);

    long long v20 = *(void (**)(uint64_t))(**(void **)(*(void *)(v1
                                                                   + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_state)
                                                       + OBJC_IVAR____TtCC31TextToSpeechVoiceBankingSupport17TTSVBAudioServiceP33_2F288AB684677915D8A6F8C1A2A5794F5State_bufferHistory)
                                         + 248);
    uint64_t v21 = swift_retain();
    v20(v21);
    swift_release();
    sub_25F3DFA60();
    v22[15] = 0;
    swift_retain();
    sub_25F3F5F00();
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_25F3D625C(void (*a1)(char *))
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B398D28);
  MEMORY[0x270FA5388](v2);
  double v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_storeEnumTagMultiPayload();
  a1(v4);
  return sub_25F307B78((uint64_t)v4, &qword_26B398D28);
}

uint64_t TTSVBAudioService.playAudioFile(_:completion:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v25[0] = *(void *)&v3[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioQueue];
  uint64_t v7 = sub_25F3F5B60();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  double v10 = MEMORY[0x270FA5388](v7);
  (*(void (**)(char *, uint64_t, uint64_t, double))(v8 + 16))((char *)v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v7, v10);
  unint64_t v11 = (*(unsigned __int8 *)(v8 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v3;
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v12 + v11, (char *)v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
  double v13 = (void *)(v12 + ((v9 + v11 + 7) & 0xFFFFFFFFFFFFFFF8));
  *double v13 = a2;
  v13[1] = a3;
  aBlock[4] = sub_25F3E8130;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_25F302590;
  aBlock[3] = &block_descriptor_27;
  uint64_t v14 = _Block_copy(aBlock);
  uint64_t v15 = sub_25F3F5FB0();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  double v18 = (char *)v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v19 = v3;
  swift_retain();
  sub_25F3F5F80();
  uint64_t v20 = sub_25F3F5F70();
  uint64_t v21 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  long long v23 = (char *)v25 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25[1] = MEMORY[0x263F8EE78];
  sub_25F3E5338((unint64_t *)&unk_26B3991D0, MEMORY[0x270FCDAA0]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B3991E0);
  sub_25F335CF0((unint64_t *)&unk_26B3991F0, (uint64_t *)&unk_26B3991E0);
  sub_25F3F67A0();
  MEMORY[0x2611F0F70](0, v18, v23, v14);
  _Block_release(v14);
  (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v20);
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  return swift_release();
}

uint64_t sub_25F3D6698(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_25F3D6978(a2);
  v18[2] = *(void *)(a1 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_calloutQueue);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a3;
  *(void *)(v7 + 24) = a4;
  aBlock[4] = sub_25F3EC104;
  aBlock[5] = v7;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_25F302590;
  aBlock[3] = &block_descriptor_233_0;
  uint64_t v8 = _Block_copy(aBlock);
  uint64_t v9 = sub_25F3F5FB0();
  v18[1] = v18;
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  sub_25F3F5F80();
  uint64_t v13 = sub_25F3F5F70();
  v18[0] = v18;
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)v18 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18[3] = MEMORY[0x263F8EE78];
  sub_25F3E5338((unint64_t *)&unk_26B3991D0, MEMORY[0x270FCDAA0]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B3991E0);
  sub_25F335CF0((unint64_t *)&unk_26B3991F0, (uint64_t *)&unk_26B3991E0);
  sub_25F3F67A0();
  MEMORY[0x2611F0F70](0, v12, v16, v8);
  _Block_release(v8);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return swift_release();
}

void sub_25F3D6978(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_25F3F5FE0();
  uint64_t v5 = *(void *)(v4 - 8);
  double v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (uint64_t *)((char *)&v57 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = *(void **)(v2 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioQueue);
  *uint64_t v8 = v9;
  (*(void (**)(void *, void, uint64_t, double))(v5 + 104))(v8, *MEMORY[0x263F8F0E8], v4, v6);
  id v10 = v9;
  LOBYTE(v9) = sub_25F3F6000();
  (*(void (**)(void *, uint64_t))(v5 + 8))(v8, v4);
  if (v9)
  {
    uint64_t v11 = sub_25F3EF940();
    uint64_t v12 = sub_25F3F5EA0();
    uint64_t v13 = *(void *)(v12 - 8);
    double v14 = MEMORY[0x270FA5388](v12);
    uint64_t v16 = (char *)&v57 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v17 = *(void (**)(char *, uint64_t, double))(v13 + 16);
    uint64_t v65 = v18;
    v17(v16, v11, v14);
    uint64_t v19 = sub_25F3F5B60();
    unint64_t v64 = &v57;
    uint64_t v20 = *(void *)(v19 - 8);
    double v21 = MEMORY[0x270FA5388](v19);
    uint64_t v66 = v22;
    long long v23 = (char *)&v57 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t, double))(v20 + 16);
    uint64_t v63 = a1;
    v24(v23, a1, v19, v21);
    uint64_t v25 = sub_25F3F5E80();
    os_log_type_t v26 = sub_25F3F64D0();
    BOOL v27 = os_log_type_enabled(v25, v26);
    uint64_t v62 = v20;
    if (v27)
    {
      uint64_t v28 = swift_slowAlloc();
      uint64_t v59 = &v57;
      uint64_t v29 = (uint8_t *)v28;
      uint64_t v58 = swift_slowAlloc();
      v68[0] = v58;
      uint64_t v60 = v2;
      *(_DWORD *)uint64_t v29 = 136315138;
      unint64_t v61 = (void (*)(char *, uint64_t))(v29 + 4);
      uint64_t v30 = sub_25F3F5B40();
      uint64_t v67 = sub_25F2FE464(v30, v31, v68);
      sub_25F3F66A0();
      swift_bridgeObjectRelease();
      unint64_t v61 = *(void (**)(char *, uint64_t))(v20 + 8);
      v61(v23, v19);
      _os_log_impl(&dword_25F2F5000, v25, v26, "Will play audio file: %s", v29, 0xCu);
      uint64_t v32 = v58;
      swift_arrayDestroy();
      MEMORY[0x2611F21E0](v32, -1, -1);
      MEMORY[0x2611F21E0](v29, -1, -1);
    }
    else
    {
      unint64_t v61 = *(void (**)(char *, uint64_t))(v20 + 8);
      v61(v23, v19);
    }

    uint64_t v33 = (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v16, v65);
    uint64_t v34 = v66;
    MEMORY[0x270FA5388](v33);
    uint64_t v35 = (char *)&v57 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B398888);
    MEMORY[0x270FA5388](v36 - 8);
    unint64_t v38 = (char *)&v57 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
    id v39 = sub_25F3D111C();
    id v40 = objc_msgSend(v39, sel_currentItem);

    if (v40)
    {
      id v41 = objc_msgSend(v40, sel_asset);

      if (v41)
      {
        self;
        long long v42 = (void *)swift_dynamicCastObjCClass();
        if (v42)
        {
          id v43 = objc_msgSend(v42, sel_URL);

          MEMORY[0x270FA5388](v44);
          id v45 = (char *)&v57 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
          sub_25F3F5B20();

          uint64_t v46 = *(void (**)(char *, char *, uint64_t))(v62 + 32);
          unint64_t v47 = v45;
          uint64_t v48 = v62;
          v46(v38, v47, v19);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v48 + 56))(v38, 0, 1, v19);
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v48 + 48))(v38, 1, v19) != 1)
          {
            v46(v35, v38, v19);
            if (MEMORY[0x2611F0520](v35, v63))
            {
              id v49 = sub_25F3D111C();
              uint64_t v50 = *(void *)(MEMORY[0x263F010E8] + 16);
              v68[0] = *MEMORY[0x263F010E8];
              v68[1] = *(void *)(MEMORY[0x263F010E8] + 8);
              v68[2] = v50;
              objc_msgSend(v49, sel_seekToTime_, v68);

              id v51 = sub_25F3D111C();
              objc_msgSend(v51, sel_play);

              v61(v35, v19);
              return;
            }
            v61(v35, v19);
            goto LABEL_14;
          }
LABEL_13:
          sub_25F307B78((uint64_t)v38, &qword_26B398888);
LABEL_14:
          uint64_t v52 = (void *)sub_25F3F5AA0();
          id v53 = objc_msgSend(self, sel_assetWithURL_, v52);

          id v54 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFA808]), sel_initWithAsset_, v53);
          id v55 = sub_25F3D111C();
          objc_msgSend(v55, sel_replaceCurrentItemWithPlayerItem_, v54);

          id v56 = sub_25F3D111C();
          objc_msgSend(v56, sel_play);

          return;
        }
      }
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v62 + 56))(v38, 1, 1, v19);
    goto LABEL_13;
  }
  __break(1u);
}

uint64_t TTSVBAudioService.stopRecording(completion:)(uint64_t a1, uint64_t a2)
{
  return sub_25F3E0628(a1, a2, (uint64_t)&unk_270B97738, (uint64_t)sub_25F3E81C8, (uint64_t)&block_descriptor_33_0);
}

uint64_t sub_25F3D710C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25F3D73C8();
  v17[0] = *(void *)(a1 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_calloutQueue);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a2;
  *(void *)(v6 + 24) = a3;
  aBlock[4] = sub_25F378C6C;
  aBlock[5] = v6;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_25F302590;
  aBlock[3] = &block_descriptor_221;
  uint64_t v7 = _Block_copy(aBlock);
  uint64_t v8 = sub_25F3F5FB0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  sub_25F3F5F80();
  uint64_t v12 = sub_25F3F5F70();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)v17 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17[1] = MEMORY[0x263F8EE78];
  sub_25F3E5338((unint64_t *)&unk_26B3991D0, MEMORY[0x270FCDAA0]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B3991E0);
  sub_25F335CF0((unint64_t *)&unk_26B3991F0, (uint64_t *)&unk_26B3991E0);
  sub_25F3F67A0();
  MEMORY[0x2611F0F70](0, v11, v15, v7);
  _Block_release(v7);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return swift_release();
}

uint64_t sub_25F3D73C8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25F3F5FE0();
  uint64_t v3 = *(void *)(v2 - 8);
  double v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (void *)((char *)v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = *(void **)(v1 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioQueue);
  *uint64_t v6 = v7;
  (*(void (**)(void *, void, uint64_t, double))(v3 + 104))(v6, *MEMORY[0x263F8F0E8], v2, v4);
  id v8 = v7;
  LOBYTE(v7) = sub_25F3F6000();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v3 + 8))(v6, v2);
  if (v7)
  {
    uint64_t v10 = OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_state;
    swift_retain();
    sub_25F3F5EF0();
    swift_release();
    if (v50)
    {
      uint64_t v11 = sub_25F3EF940();
      uint64_t v12 = sub_25F3F5EA0();
      uint64_t v13 = *(void *)(v12 - 8);
      double v14 = MEMORY[0x270FA5388](v12);
      uint64_t v16 = (char *)v45 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, uint64_t, uint64_t, double))(v13 + 16))(v16, v11, v12, v14);
      uint64_t v17 = sub_25F3F5E80();
      os_log_type_t v18 = sub_25F3F64C0();
      if (os_log_type_enabled(v17, v18))
      {
        uint64_t v19 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v19 = 0;
        _os_log_impl(&dword_25F2F5000, v17, v18, "Cannot stop recording. isRecording already false", v19, 2u);
        MEMORY[0x2611F21E0](v19, -1, -1);
      }

      return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v16, v12);
    }
    else
    {
      (*(void (**)(void))((*MEMORY[0x263F8EED0] & **(void **)(v1
                                                                           + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_speechRecognitionService))
                                     + 0x1B0))(0);
      swift_retain();
      sub_25F3F5EF0();
      uint64_t v20 = v49[0];
      int v21 = v50;
      v51.value = 0;
      v51.is_nil = 1;
      double v22 = TTSVBTimestampInSeconds(when:)(v51);
      if (!v21 || (uint64_t v23 = 0, v21 == 1)) {
        uint64_t v23 = v20;
      }
      v49[0] = v23;
      *(double *)&v49[1] = v22;
      unsigned __int8 v50 = 1;
      sub_25F3F5F00();
      swift_release();
      uint64_t v24 = sub_25F3EF940();
      uint64_t v25 = sub_25F3F5EA0();
      uint64_t v26 = *(void *)(v25 - 8);
      double v27 = MEMORY[0x270FA5388](v25);
      uint64_t v29 = (char *)v45 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, uint64_t, uint64_t, double))(v26 + 16))(v29, v24, v25, v27);
      uint64_t v30 = sub_25F3F5E80();
      os_log_type_t v31 = sub_25F3F64D0();
      if (os_log_type_enabled(v30, v31))
      {
        uint64_t v32 = swift_slowAlloc();
        unint64_t v47 = v45;
        uint64_t v33 = (uint8_t *)v32;
        uint64_t v34 = swift_slowAlloc();
        uint64_t v46 = v25;
        uint64_t v35 = v34;
        v49[0] = v34;
        *(_DWORD *)uint64_t v33 = 136315138;
        v45[1] = v33 + 4;
        v52.value = 0;
        v52.is_nil = 1;
        double v36 = TTSVBTimestampInSeconds(when:)(v52);
        uint64_t v37 = sub_25F34B3C4(v36);
        uint64_t v48 = sub_25F2FE464(v37, v38, v49);
        sub_25F3F66A0();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25F2F5000, v30, v31, "StopRecording. hostTime=%s", v33, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2611F21E0](v35, -1, -1);
        MEMORY[0x2611F21E0](v33, -1, -1);

        (*(void (**)(char *, uint64_t))(v26 + 8))(v29, v46);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v26 + 8))(v29, v25);
      }
      uint64_t v39 = *(void *)(v1 + v10);
      uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B398888);
      MEMORY[0x270FA5388](v40 - 8);
      long long v42 = (char *)v45 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v43 = sub_25F3F5B60();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v43 - 8) + 56))(v42, 1, 1, v43);
      uint64_t v44 = v39
          + OBJC_IVAR____TtCC31TextToSpeechVoiceBankingSupport17TTSVBAudioServiceP33_2F288AB684677915D8A6F8C1A2A5794F5State_audioFileURL;
      swift_beginAccess();
      swift_retain();
      sub_25F3EB4E4((uint64_t)v42, v44);
      swift_endAccess();
      return swift_release();
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t TTSVBAudioService.beginNewRecording(expectedSpeech:localeInfo:recordingEnvironment:audioFileURL:completion:)(uint64_t a1, uint64_t a2, long long *a3, unsigned __int8 *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v66 = a2;
  uint64_t v67 = a7;
  uint64_t v65 = a6;
  uint64_t v63 = a1;
  long long v8 = a3[1];
  long long v72 = *a3;
  long long v73 = v8;
  long long v74 = a3[2];
  int v64 = *a4;
  uint64_t v9 = sub_25F3EF940();
  uint64_t v10 = sub_25F3F5EA0();
  double v11 = MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v57 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = (uint8_t **)v14;
  (*(void (**)(char *, uint64_t, uint64_t, double))(v14 + 16))(v13, v9, v10, v11);
  uint64_t v15 = sub_25F3F5B60();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(void *)(v16 + 64);
  double v18 = MEMORY[0x270FA5388](v15);
  uint64_t v19 = *(void (**)(char *, uint64_t, uint8_t **, double))(v16 + 16);
  uint64_t v68 = v20;
  uint64_t v60 = v19;
  ((void (*)(char *, uint64_t, double))v19)((char *)&v57 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0), a5, v18);
  int v21 = sub_25F3F5E80();
  os_log_type_t v22 = sub_25F3F64D0();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = swift_slowAlloc();
    uint64_t v59 = v10;
    uint64_t v24 = (uint8_t *)v23;
    uint64_t v58 = swift_slowAlloc();
    aBlock[0] = v58;
    uint64_t v61 = a5;
    *(_DWORD *)uint64_t v24 = 136315138;
    uint64_t v57 = v24 + 4;
    uint64_t v25 = sub_25F3F5A70();
    uint64_t v70 = sub_25F2FE464(v25, v26, aBlock);
    a5 = v61;
    sub_25F3F66A0();
    swift_bridgeObjectRelease();
    uint64_t v27 = v16;
    (*(void (**)(char *, uint8_t **))(v16 + 8))((char *)&v57 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0), v68);
    _os_log_impl(&dword_25F2F5000, v21, v22, "Will begin new recording: %s", v24, 0xCu);
    uint64_t v28 = v58;
    swift_arrayDestroy();
    MEMORY[0x2611F21E0](v28, -1, -1);
    MEMORY[0x2611F21E0](v24, -1, -1);

    uint64_t v29 = ((uint64_t (*)(char *, uint64_t))v62[1])(v13, v59);
  }
  else
  {
    uint64_t v27 = v16;
    (*(void (**)(char *, uint8_t **))(v16 + 8))((char *)&v57 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0), v68);

    uint64_t v29 = ((uint64_t (*)(char *, uint64_t))v62[1])(v13, v10);
  }
  uint64_t v62 = &v57;
  uint64_t v61 = *(uint64_t *)((char *)v69 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioQueue);
  uint64_t v59 = *(uint64_t *)((char *)v69 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_state);
  uint64_t v30 = v59;
  double v31 = MEMORY[0x270FA5388](v29);
  uint64_t v32 = (char *)&v57 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = v68;
  v60(v32, a5, v68, v31);
  uint64_t v34 = v27;
  unint64_t v35 = (*(unsigned __int8 *)(v27 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80);
  unint64_t v36 = (v17 + v35 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v37 = (v36 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v38 = swift_allocObject();
  *(void *)(v38 + 16) = v30;
  (*(void (**)(unint64_t, char *, uint8_t **))(v34 + 32))(v38 + v35, v32, v33);
  uint64_t v39 = v69;
  *(void *)(v38 + v36) = v69;
  uint64_t v40 = (void *)(v38 + v37);
  uint64_t v42 = v66;
  uint64_t v41 = v67;
  *uint64_t v40 = v63;
  v40[1] = v42;
  unint64_t v43 = v38 + ((v37 + 23) & 0xFFFFFFFFFFFFFFF8);
  long long v44 = v74;
  long long v45 = v72;
  *(_OWORD *)(v43 + 16) = v73;
  *(_OWORD *)(v43 + 32) = v44;
  *(_OWORD *)unint64_t v43 = v45;
  *(unsigned char *)(v43 + 48) = v64;
  uint64_t v46 = (uint64_t *)(v38 + ((v37 + 79) & 0xFFFFFFFFFFFFFFF8));
  *uint64_t v46 = v65;
  v46[1] = v41;
  aBlock[4] = (uint64_t)sub_25F3E8310;
  aBlock[5] = v38;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_25F302590;
  aBlock[3] = (uint64_t)&block_descriptor_39;
  unint64_t v47 = _Block_copy(aBlock);
  uint64_t v65 = sub_25F3F5FB0();
  uint64_t v68 = &v57;
  uint64_t v48 = *(void *)(v65 - 8);
  MEMORY[0x270FA5388](v65);
  unsigned __int8 v50 = (char *)&v57 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  swift_retain_n();
  Swift::UInt64_optional v51 = v39;
  sub_25F38B7E0((uint64_t)&v72);
  swift_retain();
  sub_25F3F5F80();
  uint64_t v52 = sub_25F3F5F70();
  uint64_t v69 = &v57;
  uint64_t v53 = *(void *)(v52 - 8);
  MEMORY[0x270FA5388](v52);
  id v55 = (char *)&v57 - ((v54 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = MEMORY[0x263F8EE78];
  sub_25F3E5338((unint64_t *)&unk_26B3991D0, MEMORY[0x270FCDAA0]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B3991E0);
  sub_25F335CF0((unint64_t *)&unk_26B3991F0, (uint64_t *)&unk_26B3991E0);
  sub_25F3F67A0();
  MEMORY[0x2611F0F70](0, v50, v55, v47);
  _Block_release(v47);
  swift_release();
  (*(void (**)(char *, uint64_t))(v53 + 8))(v55, v52);
  (*(void (**)(char *, uint64_t))(v48 + 8))(v50, v65);
  return swift_release();
}

void sub_25F3D80D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, long long *a6, int a7, uint64_t a8, uint64_t a9)
{
  uint64_t v101 = a6;
  uint64_t v102 = a5;
  uint64_t v105 = a3;
  uint64_t v14 = type metadata accessor for TTSVBError.Reason(0);
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)v89 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v103 = a1;
  swift_retain();
  sub_25F3F5EF0();
  swift_release();
  LODWORD(a1) = v110;
  uint64_t v17 = sub_25F3EF940();
  uint64_t v18 = sub_25F3F5EA0();
  uint64_t v104 = v89;
  double v19 = MEMORY[0x270FA5388](v18);
  uint64_t v99 = v20;
  uint64_t v100 = v17;
  int v21 = (char *)v89 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v106 = v23;
  uint64_t v107 = v22;
  uint64_t v97 = (void (*)(char *, uint64_t, double))v23[2];
  uint64_t v98 = v23 + 2;
  v97(v21, v17, v19);
  if (!a1)
  {
    uint64_t v38 = sub_25F3F5E80();
    os_log_type_t v39 = sub_25F3F64C0();
    if (os_log_type_enabled(v38, v39))
    {
      uint64_t v40 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v40 = 0;
      _os_log_impl(&dword_25F2F5000, v38, v39, "Cannot begin recording. isRecording already true", v40, 2u);
      MEMORY[0x2611F21E0](v40, -1, -1);
    }

    ((void (*)(char *, uint64_t))v106[1])(v21, v107);
    long long aBlock = xmmword_25F4015F0;
    LOBYTE(v110) = 3;
    swift_storeEnumTagMultiPayload();
    type metadata accessor for TTSVBError(0);
    sub_25F3EAD60((unint64_t *)&qword_26B3988A8, (void (*)(uint64_t))type metadata accessor for TTSVBError);
    uint64_t v41 = (void *)swift_allocError();
    TTSVBError.init(_:_:_:)((uint64_t)&aBlock, (uint64_t)v16, 0, v42);
    swift_willThrow();
    uint64_t v107 = *(void *)(v105 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_calloutQueue);
    uint64_t v67 = (void *)swift_allocObject();
    v67[2] = a8;
    v67[3] = a9;
    v67[4] = v41;
    *(void *)&long long v111 = sub_25F3EC204;
    *((void *)&v111 + 1) = v67;
    *(void *)&long long aBlock = MEMORY[0x263EF8330];
    *((void *)&aBlock + 1) = 1107296256;
    *(void *)&long long v110 = sub_25F302590;
    *((void *)&v110 + 1) = &block_descriptor_206_0;
    uint64_t v68 = _Block_copy(&aBlock);
    uint64_t v105 = sub_25F3F5FB0();
    uint64_t v106 = v89;
    uint64_t v69 = *(void *)(v105 - 8);
    MEMORY[0x270FA5388](v105);
    id v71 = (char *)v89 - ((v70 + 15) & 0xFFFFFFFFFFFFFFF0);
    swift_retain();
    id v72 = v41;
    sub_25F3F5F80();
    uint64_t v73 = sub_25F3F5F70();
    uint64_t v104 = v89;
    uint64_t v74 = *(void *)(v73 - 8);
    MEMORY[0x270FA5388](v73);
    uint64_t v76 = (char *)v89 - ((v75 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v108 = MEMORY[0x263F8EE78];
    sub_25F3E5338((unint64_t *)&unk_26B3991D0, MEMORY[0x270FCDAA0]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B3991E0);
    sub_25F335CF0((unint64_t *)&unk_26B3991F0, (uint64_t *)&unk_26B3991E0);
    sub_25F3F67A0();
    MEMORY[0x2611F0F70](0, v71, v76, v68);
    _Block_release(v68);

    (*(void (**)(char *, uint64_t))(v74 + 8))(v76, v73);
    (*(void (**)(char *, uint64_t))(v69 + 8))(v71, v105);
    goto LABEL_21;
  }
  int v93 = a7;
  uint64_t v95 = a8;
  uint64_t v96 = a9;
  uint64_t v24 = sub_25F3F5B60();
  uint64_t v25 = *(void *)(v24 - 8);
  double v26 = MEMORY[0x270FA5388](v24);
  uint64_t v28 = (char *)v89 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = *(void (**)(char *, uint64_t, uint64_t, double))(v25 + 16);
  uint64_t v92 = a2;
  uint64_t v91 = v25 + 16;
  uint64_t v90 = v29;
  v29(v28, a2, v24, v26);
  uint64_t v30 = sub_25F3F5E80();
  os_log_type_t v31 = sub_25F3F64A0();
  BOOL v32 = os_log_type_enabled(v30, v31);
  uint64_t v94 = a4;
  if (v32)
  {
    uint64_t v33 = (uint8_t *)swift_slowAlloc();
    uint64_t v34 = swift_slowAlloc();
    *(void *)&long long aBlock = v34;
    v89[1] = v89;
    *(_DWORD *)uint64_t v33 = 136315138;
    v89[0] = v33 + 4;
    uint64_t v35 = sub_25F3F5B40();
    uint64_t v108 = sub_25F2FE464(v35, v36, (uint64_t *)&aBlock);
    sub_25F3F66A0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v28, v24);
    _os_log_impl(&dword_25F2F5000, v30, v31, "Will begin new audio recording: %s", v33, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611F21E0](v34, -1, -1);
    MEMORY[0x2611F21E0](v33, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v25 + 8))(v28, v24);
  }

  unint64_t v37 = (void (*)(char *, uint64_t))v106[1];
  v37(v21, v107);
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B398888);
  uint64_t v44 = *(void *)(*(void *)(v43 - 8) + 64);
  double v45 = MEMORY[0x270FA5388](v43 - 8);
  unint64_t v46 = (v44 + 15) & 0xFFFFFFFFFFFFFFF0;
  unint64_t v47 = *(void (**)(char *, uint64_t, uint64_t, uint64_t, double))(v25 + 56);
  v47((char *)v89 - v46, 1, 1, v24, v45);
  uint64_t v48 = v103
      + OBJC_IVAR____TtCC31TextToSpeechVoiceBankingSupport17TTSVBAudioServiceP33_2F288AB684677915D8A6F8C1A2A5794F5State_audioFileURL;
  swift_beginAccess();
  uint64_t v49 = sub_25F3EB4E4((uint64_t)v89 - v46, v48);
  double v50 = MEMORY[0x270FA5388](v49);
  v90((char *)v89 - v46, v92, v24, v50);
  ((void (*)(char *, void, uint64_t, uint64_t))v47)((char *)v89 - v46, 0, 1, v24);
  sub_25F307B78(v48, &qword_26B398888);
  sub_25F307A7C((uint64_t)v89 - v46, v48, &qword_26B398888);
  swift_endAccess();
  id v51 = (id)*sub_25F3486EC();
  NSUserDefaults.ttsvb_recordingMode.getter();

  if (aBlock == 2)
  {
    uint64_t v53 = (char *)v105;
    uint64_t v54 = v94;
    char v55 = v93;
  }
  else
  {
    uint64_t v53 = (char *)v105;
    uint64_t v54 = v94;
    char v55 = v93;
    if (aBlock) {
      goto LABEL_14;
    }
  }
  char v56 = v55 & 1;
  double v57 = MEMORY[0x270FA5388](v52);
  uint64_t v59 = (char *)v89 - ((v58 + 15) & 0xFFFFFFFFFFFFFFF0);
  ((void (*)(char *, uint64_t, uint64_t, double))v97)(v59, v100, v107, v57);
  uint64_t v60 = sub_25F3F5E80();
  os_log_type_t v61 = sub_25F3F64A0();
  if (os_log_type_enabled(v60, v61))
  {
    uint64_t v62 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v62 = 0;
    _os_log_impl(&dword_25F2F5000, v60, v61, "Will generate new speech recognition task", v62, 2u);
    MEMORY[0x2611F21E0](v62, -1, -1);
  }

  v37(v59, v107);
  uint64_t v63 = *(void **)&v53[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_speechRecognitionService];
  long long v64 = v101[1];
  long long aBlock = *v101;
  long long v110 = v64;
  long long v111 = v101[2];
  LOBYTE(v108) = v56;
  (*(void (**)(uint64_t, uint64_t, long long *, uint64_t *))((*MEMORY[0x263F8EED0] & *v63) + 0x1A0))(v54, v102, &aBlock, &v108);
LABEL_14:
  sub_25F3D5700();
  uint64_t v65 = v96;
  uint64_t v66 = v95;
  id v77 = objc_msgSend(*(id *)&v53[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioSession], sel_currentRoute);
  id v78 = objc_msgSend(v77, sel_inputs);

  sub_25F3236F0(0, &qword_26A78DBA8);
  unint64_t v79 = sub_25F3F6300();

  if (v79 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v88 = sub_25F3F6980();
    swift_bridgeObjectRelease();
    if (!v88) {
      goto LABEL_20;
    }
  }
  else if (!*(void *)((v79 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_20:
    swift_bridgeObjectRelease();
    LOBYTE(aBlock) = 0;
    uint64_t v86 = (void *)swift_allocObject();
    v86[2] = v103;
    v86[3] = v53;
    v86[4] = v66;
    v86[5] = v65;
    swift_retain();
    unint64_t v87 = v53;
    swift_retain();
    sub_25F3D91FC((unsigned __int8 *)&aBlock, (uint64_t)sub_25F3EBC98, (uint64_t)v86);
LABEL_21:
    swift_release();
    return;
  }
  if ((v79 & 0xC000000000000001) != 0)
  {
    id v80 = (id)MEMORY[0x2611F12D0](0, v79);
    goto LABEL_19;
  }
  if (*(void *)((v79 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v80 = *(id *)(v79 + 32);
LABEL_19:
    uint64_t v81 = v80;
    swift_bridgeObjectRelease();
    id v82 = objc_msgSend(v81, sel_portType);
    uint64_t v83 = sub_25F3F6130();
    uint64_t v85 = v84;

    static TTSVBAnalytics.beganRecording(inputSourceName:)(v83, v85);
    goto LABEL_20;
  }
  __break(1u);
}

uint64_t sub_25F3D8D1C(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  v43.value = 0;
  v43.is_nil = 1;
  double v7 = TTSVBTimestampInSeconds(when:)(v43);
  double aBlock = v7;
  uint64_t v38 = 0;
  LOBYTE(v39) = 0;
  swift_retain();
  sub_25F3F5F00();
  swift_release();
  uint64_t v8 = sub_25F3EF940();
  uint64_t v9 = sub_25F3F5EA0();
  uint64_t v10 = *(void *)(v9 - 8);
  double v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, double))(v10 + 16))(v13, v8, v9, v11);
  uint64_t v14 = sub_25F3F5E80();
  os_log_type_t v15 = sub_25F3F64D0();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v34 = a3;
    uint64_t v16 = swift_slowAlloc();
    uint64_t v35 = a4;
    uint64_t v17 = (uint8_t *)v16;
    uint64_t v18 = swift_slowAlloc();
    double aBlock = *(double *)&v18;
    *(_DWORD *)uint64_t v17 = 136315138;
    uint64_t v19 = sub_25F34B3C4(v7);
    uint64_t v33 = a2;
    uint64_t v36 = sub_25F2FE464(v19, v20, (uint64_t *)&aBlock);
    a3 = v34;
    sub_25F3F66A0();
    a2 = v33;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25F2F5000, v14, v15, "StartRecording. hostTime=%s", v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611F21E0](v18, -1, -1);
    int v21 = v17;
    a4 = v35;
    MEMORY[0x2611F21E0](v21, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  uint64_t v35 = *(void *)(a2 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_calloutQueue);
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = a3;
  *(void *)(v22 + 24) = a4;
  uint64_t v41 = sub_25F3EC104;
  uint64_t v42 = v22;
  double aBlock = MEMORY[0x263EF8330];
  uint64_t v38 = 1107296256;
  os_log_type_t v39 = sub_25F302590;
  uint64_t v40 = &block_descriptor_215;
  uint64_t v23 = _Block_copy(&aBlock);
  uint64_t v24 = sub_25F3F5FB0();
  uint64_t v34 = &v33;
  uint64_t v25 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  uint64_t v27 = (char *)&v33 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  sub_25F3F5F80();
  uint64_t v28 = sub_25F3F5F70();
  uint64_t v33 = (uint64_t)&v33;
  uint64_t v29 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  os_log_type_t v31 = (char *)&v33 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = MEMORY[0x263F8EE78];
  sub_25F3E5338((unint64_t *)&unk_26B3991D0, MEMORY[0x270FCDAA0]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B3991E0);
  sub_25F335CF0((unint64_t *)&unk_26B3991F0, (uint64_t *)&unk_26B3991E0);
  sub_25F3F67A0();
  MEMORY[0x2611F0F70](0, v27, v31, v23);
  _Block_release(v23);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v31, v28);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v27, v24);
  return swift_release();
}

void sub_25F3D91FC(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  double v4 = v3;
  int v7 = *a1;
  uint64_t v8 = sub_25F3F5FE0();
  uint64_t v9 = *(void *)(v8 - 8);
  double v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (uint64_t *)((char *)&v51 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = *(void **)&v4[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioQueue];
  *uint64_t v12 = v13;
  (*(void (**)(void *, void, uint64_t, double))(v9 + 104))(v12, *MEMORY[0x263F8F0E8], v8, v10);
  id v14 = v13;
  LOBYTE(v13) = sub_25F3F6000();
  (*(void (**)(void *, uint64_t))(v9 + 8))(v12, v8);
  if (v13)
  {
    sub_25F3D5700();
    os_log_type_t v15 = (uint64_t *)&v4[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_cachedSoundEffects];
    swift_beginAccess();
    uint64_t v16 = *v15;
    uint64_t v17 = *(void *)(*v15 + 16);
    uint64_t v54 = a3;
    if (v17 && (unint64_t v18 = sub_25F3E6C84(v7), (v19 & 1) != 0))
    {
      int v20 = v7;
      int v21 = *(void **)(*(void *)(v16 + 56) + 8 * v18);
      swift_endAccess();
      id v22 = v21;
    }
    else
    {
      uint64_t v55 = a2;
      swift_endAccess();
      uint64_t v53 = sub_25F3F5B60();
      uint64_t v23 = *(void *)(v53 - 8);
      uint64_t v24 = *(void *)(v23 + 64);
      MEMORY[0x270FA5388](v53);
      LOBYTE(aBlock[0]) = v7;
      sub_25F3D4ED0((uint64_t)&v51 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
      uint64_t v25 = (void *)static TTSVBAudioTools.readPCMBuffer(fromAudioFile:)((uint64_t)&v51 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
      (*(void (**)(char *, uint64_t))(v23 + 8))((char *)&v51 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0), v53);
      swift_beginAccess();
      id v22 = v25;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v58 = *v15;
      uint64_t *v15 = 0x8000000000000000;
      int v20 = v7;
      sub_25F3E7170((uint64_t)v22, v7, isUniquelyReferenced_nonNull_native);
      uint64_t *v15 = v58;
      swift_bridgeObjectRelease();
      swift_endAccess();
      a3 = v54;
      a2 = v55;
    }
    id v57 = v22;
    uint64_t v27 = sub_25F3EF940();
    uint64_t v28 = sub_25F3F5EA0();
    char v56 = &v51;
    uint64_t v29 = *(void *)(v28 - 8);
    double v30 = MEMORY[0x270FA5388](v28);
    BOOL v32 = (char *)&v51 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, uint64_t, uint64_t, double))(v29 + 16))(v32, v27, v28, v30);
    uint64_t v33 = v4;
    uint64_t v34 = sub_25F3F5E80();
    os_log_type_t v35 = sub_25F3F64A0();
    uint64_t v36 = &unk_26A78D000;
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v37 = swift_slowAlloc();
      uint64_t v55 = swift_slowAlloc();
      aBlock[0] = v55;
      uint64_t v38 = "recordingWillStart";
      *(_DWORD *)uint64_t v37 = 136315394;
      LODWORD(v52) = v20;
      if (v20) {
        uint64_t v38 = "recordingDidFinish";
      }
      uint64_t v58 = sub_25F2FE464(0xD000000000000012, (unint64_t)(v38 - 32) | 0x8000000000000000, aBlock);
      sub_25F3F66A0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v37 + 12) = 1024;
      unsigned int v39 = objc_msgSend(*(id *)&v33[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioPlayerNode], sel_isPlaying);

      LODWORD(v58) = v39;
      sub_25F3F66A0();

      _os_log_impl(&dword_25F2F5000, v34, v35, "Asked to play sound effect '%s'. Scheduling audio file. isPlaying=%{BOOL}d", (uint8_t *)v37, 0x12u);
      uint64_t v40 = v55;
      swift_arrayDestroy();
      a3 = v54;
      MEMORY[0x2611F21E0](v40, -1, -1);
      uint64_t v41 = v37;
      uint64_t v36 = (void *)&unk_26A78D000;
      MEMORY[0x2611F21E0](v41, -1, -1);

      uint64_t v42 = v32;
      char v43 = v52;
      (*(void (**)(char *, uint64_t))(v29 + 8))(v42, v28);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v29 + 8))(v32, v28);
      char v43 = v20;
    }
    uint64_t v44 = v36[355];
    double v45 = *(void **)&v33[v44];
    uint64_t v46 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v47 = swift_allocObject();
    *(unsigned char *)(v47 + 16) = v43;
    *(void *)(v47 + 24) = v46;
    *(void *)(v47 + 32) = 0;
    *(void *)(v47 + 40) = a2;
    *(void *)(v47 + 48) = a3;
    aBlock[4] = (uint64_t)sub_25F3EB770;
    aBlock[5] = v47;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_25F3DDA18;
    aBlock[3] = (uint64_t)&block_descriptor_190;
    uint64_t v48 = _Block_copy(aBlock);
    swift_retain();
    id v49 = v45;
    swift_release();
    double v50 = v57;
    objc_msgSend(v49, sel_scheduleBuffer_atTime_options_completionCallbackType_completionHandler_, v57, 0, 0, 2, v48);

    _Block_release(v48);
    objc_msgSend(*(id *)&v33[v44], sel_play);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_25F3DA254(void (*a1)(char *), uint64_t a2, void *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B398D28);
  MEMORY[0x270FA5388](v5);
  int v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25F30CB70((uint64_t)&v14);
  uint64_t v8 = v14;
  uint64_t v9 = v15;
  unsigned __int8 v10 = v16;
  v12[0] = v14;
  v12[1] = v15;
  unsigned __int8 v13 = v16;
  static TTSVBError.map(_:_:)(a3, (uint64_t)v12, (uint64_t)v7);
  sub_25F307C20(v8, v9, v10);
  swift_storeEnumTagMultiPayload();
  a1(v7);
  return sub_25F307B78((uint64_t)v7, &qword_26B398D28);
}

uint64_t TTSVBAudioService.finishCurrentRecording(outputFormat:audioOverrides:userPhrase:userScore:sampleID:completion:)(uint64_t a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6, uint64_t *a7, uint64_t a8, uint64_t a9)
{
  unsigned __int8 v10 = v9;
  uint64_t v51 = a7;
  uint64_t v48 = a5;
  id v49 = a6;
  uint64_t v47 = a3;
  uint64_t v13 = a9;
  int v14 = *a2;
  int v45 = a2[1];
  int v46 = v14;
  uint64_t v15 = (void *)*((void *)a2 + 1);
  uint64_t v16 = sub_25F3EF940();
  uint64_t v17 = sub_25F3F5EA0();
  uint64_t v18 = *(void *)(v17 - 8);
  double v19 = MEMORY[0x270FA5388](v17);
  int v21 = (char *)&v44 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, double))(v18 + 16))(v21, v16, v17, v19);
  id v22 = sub_25F3F5E80();
  os_log_type_t v23 = sub_25F3F64D0();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = (uint8_t *)swift_slowAlloc();
    double v50 = v10;
    uint64_t v25 = a8;
    uint64_t v26 = v24;
    *(_WORD *)uint64_t v24 = 0;
    _os_log_impl(&dword_25F2F5000, v22, v23, "Will finish current recording", v24, 2u);
    uint64_t v27 = v26;
    a8 = v25;
    uint64_t v13 = a9;
    unsigned __int8 v10 = v50;
    MEMORY[0x2611F21E0](v27, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v18 + 8))(v21, v17);
  double v50 = *(char **)&v10[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioQueue];
  uint64_t v28 = *(void *)&v10[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_state];
  uint64_t v29 = swift_allocObject();
  *(void *)(v29 + 16) = v28;
  *(void *)(v29 + 24) = v10;
  *(unsigned char *)(v29 + 32) = v46;
  *(unsigned char *)(v29 + 33) = v45;
  uint64_t v30 = v47;
  *(void *)(v29 + 40) = v15;
  *(void *)(v29 + 48) = v30;
  uint64_t v31 = v48;
  *(void *)(v29 + 56) = a4;
  *(void *)(v29 + 64) = v31;
  BOOL v32 = v51;
  *(void *)(v29 + 72) = v49;
  *(void *)(v29 + 80) = v32;
  *(void *)(v29 + 88) = a8;
  *(void *)(v29 + 96) = v13;
  aBlock[4] = sub_25F3E8430;
  aBlock[5] = v29;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_25F302590;
  aBlock[3] = &block_descriptor_45_0;
  uint64_t v33 = _Block_copy(aBlock);
  uint64_t v48 = sub_25F3F5FB0();
  id v49 = &v44;
  uint64_t v34 = *(void *)(v48 - 8);
  MEMORY[0x270FA5388](v48);
  uint64_t v36 = (char *)&v44 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v37 = v15;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain_n();
  uint64_t v38 = v10;
  sub_25F3F5F80();
  uint64_t v39 = sub_25F3F5F70();
  uint64_t v51 = &v44;
  uint64_t v40 = *(void *)(v39 - 8);
  MEMORY[0x270FA5388](v39);
  uint64_t v42 = (char *)&v44 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = MEMORY[0x263F8EE78];
  sub_25F3E5338((unint64_t *)&unk_26B3991D0, MEMORY[0x270FCDAA0]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B3991E0);
  sub_25F335CF0((unint64_t *)&unk_26B3991F0, (uint64_t *)&unk_26B3991E0);
  sub_25F3F67A0();
  MEMORY[0x2611F0F70](0, v36, v42, v33);
  _Block_release(v33);
  swift_release();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v42, v39);
  (*(void (**)(char *, uint64_t))(v34 + 8))(v36, v48);
  return swift_release();
}

uint64_t sub_25F3DA804(uint64_t a1, unsigned char *a2, unsigned int a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned char *a9, uint64_t a10, uint64_t a11)
{
  v197 = a2;
  uint64_t v18 = a11;
  uint64_t v195 = type metadata accessor for TTSVBError.Reason(0);
  MEMORY[0x270FA5388](v195);
  v196 = &v169[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_retain();
  sub_25F3F5EF0();
  swift_release();
  if ((_BYTE)v201)
  {
    uint64_t v20 = sub_25F3EF940();
    uint64_t v21 = sub_25F3F5EA0();
    uint64_t v22 = *(void *)(v21 - 8);
    double v23 = MEMORY[0x270FA5388](v21);
    uint64_t v25 = &v169[-((v24 + 15) & 0xFFFFFFFFFFFFFFF0)];
    (*(void (**)(unsigned char *, uint64_t, uint64_t, double))(v22 + 16))(v25, v20, v21, v23);
    uint64_t v26 = sub_25F3F5E80();
    os_log_type_t v27 = sub_25F3F64C0();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v28 = 0;
      _os_log_impl(&dword_25F2F5000, v26, v27, "Cannot stop recording. isRecording already false", v28, 2u);
      MEMORY[0x2611F21E0](v28, -1, -1);
    }

    (*(void (**)(unsigned char *, uint64_t))(v22 + 8))(v25, v21);
    long long aBlock = xmmword_25F401600;
    LOBYTE(v201) = 3;
    uint64_t v29 = (uint64_t)v196;
    swift_storeEnumTagMultiPayload();
    type metadata accessor for TTSVBError(0);
    sub_25F3EAD60((unint64_t *)&qword_26B3988A8, (void (*)(uint64_t))type metadata accessor for TTSVBError);
    uint64_t v30 = (void *)swift_allocError();
    TTSVBError.init(_:_:_:)((uint64_t)&aBlock, v29, 0, v31);
    swift_willThrow();
    uint64_t v32 = a10;
    goto LABEL_41;
  }
  uint64_t v180 = a6;
  unsigned int v181 = a3;
  uint64_t v178 = a7;
  swift_retain();
  sub_25F3F5EF0();
  swift_release();
  double v33 = *(double *)&aBlock;
  int v34 = v201;
  v205.value = 0;
  v205.is_nil = 1;
  double v35 = TTSVBTimestampInSeconds(when:)(v205);
  double v36 = v35;
  uint64_t v188 = a10;
  uint64_t v177 = a5;
  if (!v34 || (double v37 = 0.0, v34 == 1)) {
    double v37 = v33;
  }
  *(double *)&long long aBlock = v37;
  *((double *)&aBlock + 1) = v35;
  LOBYTE(v201) = 1;
  swift_retain();
  sub_25F3F5F00();
  swift_release();
  uint64_t v38 = sub_25F3EF940();
  uint64_t v39 = sub_25F3F5EA0();
  unint64_t v187 = v169;
  uint64_t v40 = *(void *)(v39 - 8);
  double v41 = MEMORY[0x270FA5388](v39);
  id v191 = v42;
  objc_super v192 = (unsigned char *)v38;
  char v43 = &v169[-((unint64_t)(v42 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v44 = *(unsigned char **)(v40 + 16);
  uint64_t v190 = v40 + 16;
  v194 = v44;
  ((void (*)(unsigned char *, uint64_t, uint64_t, double))v44)(v43, v38, v39, v41);
  int v45 = sub_25F3F5E80();
  os_log_type_t v46 = sub_25F3F64D0();
  BOOL v47 = os_log_type_enabled(v45, v46);
  uint64_t v193 = a1;
  uint64_t v186 = a11;
  id v182 = a4;
  uint64_t v179 = a8;
  unint64_t v189 = v39;
  uint64_t v185 = v40;
  if (v47)
  {
    uint64_t v48 = (uint8_t *)swift_slowAlloc();
    uint64_t v49 = swift_slowAlloc();
    *(void *)&long long aBlock = v49;
    *(_DWORD *)uint64_t v48 = 136315138;
    v206.value = 0;
    v206.is_nil = 1;
    double v50 = TTSVBTimestampInSeconds(when:)(v206);
    uint64_t v51 = sub_25F34B3C4(v50);
    uint64_t v198 = sub_25F2FE464(v51, v52, (uint64_t *)&aBlock);
    unint64_t v53 = v189;
    sub_25F3F66A0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25F2F5000, v45, v46, "FinishRecording. hostTime=%s", v48, 0xCu);
    swift_arrayDestroy();
    uint64_t v54 = v49;
    a1 = v193;
    MEMORY[0x2611F21E0](v54, -1, -1);
    MEMORY[0x2611F21E0](v48, -1, -1);

    uint64_t v55 = *(char **)(v40 + 8);
    char v56 = v43;
    unint64_t v57 = v53;
    ((void (*)(unsigned char *, unint64_t))v55)(v56, v53);
  }
  else
  {

    uint64_t v55 = *(char **)(v40 + 8);
    ((void (*)(unsigned char *, uint64_t))v55)(v43, v39);
    unint64_t v57 = v39;
  }
  LOBYTE(aBlock) = 1;
  sub_25F3D91FC((unsigned __int8 *)&aBlock, (uint64_t)nullsub_1, 0);
  uint64_t v58 = *(uint64_t (**)(uint64_t, double, double))(**(void **)(a1
                                                                        + OBJC_IVAR____TtCC31TextToSpeechVoiceBankingSupport17TTSVBAudioServiceP33_2F288AB684677915D8A6F8C1A2A5794F5State_bufferHistory)
                                                          + 272);
  uint64_t v59 = swift_retain();
  unint64_t v60 = v58(v59, v37, v36);
  uint64_t v61 = swift_release();
  uint64_t v62 = v191;
  double v63 = MEMORY[0x270FA5388](v61);
  long long v64 = v192;
  ((void (*)(unsigned char *, unsigned char *, unint64_t, double))v194)(&v169[-((unint64_t)(v62 + 15) & 0xFFFFFFFFFFFFFFF0)], v192, v57, v63);
  swift_bridgeObjectRetain_n();
  unint64_t v187 = &v169[-((unint64_t)(v62 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v65 = sub_25F3F5E80();
  LODWORD(v183) = sub_25F3F64D0();
  BOOL v66 = os_log_type_enabled(v65, (os_log_type_t)v183);
  unint64_t v184 = v55;
  if (v66)
  {
    v176 = v169;
    uint64_t v67 = swift_slowAlloc();
    *(_DWORD *)uint64_t v67 = 134218240;
    if (v60 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v68 = sub_25F3F6980();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v68 = *(void *)((v60 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    *(void *)&long long aBlock = v68;
    sub_25F3F66A0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v67 + 12) = 2048;
    os_log_t v175 = v65;
    if (v60 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t result = sub_25F3F6980();
      uint64_t v69 = result;
      if (result) {
        goto LABEL_16;
      }
    }
    else
    {
      uint64_t v69 = *(void *)((v60 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t result = swift_bridgeObjectRetain();
      if (v69)
      {
LABEL_16:
        if (v69 < 1)
        {
          __break(1u);
          return result;
        }
        uint64_t v71 = 0;
        double v72 = 0.0;
        do
        {
          if ((v60 & 0xC000000000000001) != 0) {
            id v73 = (id)MEMORY[0x2611F12D0](v71, v60);
          }
          else {
            id v73 = *(id *)(v60 + 8 * v71 + 32);
          }
          uint64_t v74 = v73;
          ++v71;
          id v75 = objc_msgSend(v73, sel_format);
          objc_msgSend(v75, sel_sampleRate);
          double v77 = v76;

          LODWORD(v75) = objc_msgSend(v74, sel_frameLength);
          double v72 = v72 + (double)v75 / v77;
        }
        while (v69 != v71);
        goto LABEL_25;
      }
    }
    double v72 = 0.0;
LABEL_25:
    swift_bridgeObjectRelease();
    *(double *)&long long aBlock = v72;
    sub_25F3F66A0();
    swift_bridgeObjectRelease_n();
    os_log_t v79 = v175;
    _os_log_impl(&dword_25F2F5000, v175, (os_log_type_t)v183, "Will compute audio assessment of %ld buffers. Duration=%f", (uint8_t *)v67, 0x16u);
    MEMORY[0x2611F21E0](v67, -1, -1);

    long long v64 = v192;
    a1 = v193;
    unint64_t v57 = v189;
    uint64_t v55 = v184;
    uint64_t v62 = v191;
    uint64_t v78 = v185;
    goto LABEL_26;
  }

  swift_bridgeObjectRelease_n();
  uint64_t v78 = v185;
LABEL_26:
  id v80 = (unsigned char *)(v78 + 8);
  ((void (*)(unsigned char *, unint64_t))v55)(v187, v57);
  uint64_t v81 = self;
  sub_25F3236F0(0, &qword_26A78D730);
  id v82 = (void *)sub_25F3F62E0();
  id v83 = objc_msgSend(v81, sel_assessAudioForBuffers_, v82);

  objc_super v192 = v169;
  double v85 = MEMORY[0x270FA5388](v84);
  uint64_t v86 = &v169[-((unint64_t)(v62 + 15) & 0xFFFFFFFFFFFFFFF0)];
  ((void (*)(unsigned char *, unsigned char *, unint64_t, double))v194)(v86, v64, v57, v85);
  swift_bridgeObjectRetain_n();
  id v87 = v83;
  uint64_t v88 = sub_25F3F5E80();
  os_log_type_t v89 = sub_25F3F64D0();
  if (os_log_type_enabled(v88, v89))
  {
    uint64_t v90 = swift_slowAlloc();
    v194 = (unsigned char *)swift_slowAlloc();
    *(_DWORD *)uint64_t v90 = 134218242;
    id v191 = v80;
    if (v60 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v91 = sub_25F3F6980();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v91 = *(void *)((v60 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    *(void *)&long long aBlock = v91;
    sub_25F3F66A0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v90 + 12) = 2112;
    *(void *)&long long aBlock = v87;
    id v92 = v87;
    id v93 = v87;
    sub_25F3F66A0();
    id v94 = v194;
    *(void *)v194 = v92;

    id v87 = v92;
    _os_log_impl(&dword_25F2F5000, v88, v89, "Did compute audio assessment of %ld buffers: %@", (uint8_t *)v90, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B398EB0);
    swift_arrayDestroy();
    MEMORY[0x2611F21E0](v94, -1, -1);
    MEMORY[0x2611F21E0](v90, -1, -1);

    a1 = v193;
    ((void (*)(unsigned char *, unint64_t))v184)(v86, v189);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    ((void (*)(unsigned char *, unint64_t))v55)(v86, v57);
  }
  uint64_t v95 = *(void **)(a1
                 + OBJC_IVAR____TtCC31TextToSpeechVoiceBankingSupport17TTSVBAudioServiceP33_2F288AB684677915D8A6F8C1A2A5794F5State_recordingFormat);
  if (!v95)
  {
    swift_bridgeObjectRelease();
    uint64_t v32 = v188;
LABEL_40:
    long long aBlock = xmmword_25F401600;
    LOBYTE(v201) = 3;
    uint64_t v125 = (uint64_t)v196;
    swift_storeEnumTagMultiPayload();
    type metadata accessor for TTSVBError(0);
    sub_25F3EAD60((unint64_t *)&qword_26B3988A8, (void (*)(uint64_t))type metadata accessor for TTSVBError);
    uint64_t v30 = (void *)swift_allocError();
    TTSVBError.init(_:_:_:)((uint64_t)&aBlock, v125, 0, v126);
    swift_willThrow();

    uint64_t v18 = v186;
LABEL_41:
    v197 = *(unsigned char **)&v197[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_calloutQueue];
    id v127 = (void *)swift_allocObject();
    v127[2] = v32;
    v127[3] = v18;
    v127[4] = v30;
    v203 = sub_25F3EC200;
    v204 = v127;
    *(void *)&long long aBlock = MEMORY[0x263EF8330];
    *((void *)&aBlock + 1) = 1107296256;
    v201 = sub_25F302590;
    v202 = &block_descriptor_141;
    uint64_t v128 = _Block_copy(&aBlock);
    uint64_t v195 = sub_25F3F5FB0();
    v196 = v169;
    uint64_t v129 = *(void *)(v195 - 8);
    MEMORY[0x270FA5388](v195);
    uint64_t v131 = &v169[-((v130 + 15) & 0xFFFFFFFFFFFFFFF0)];
    swift_retain();
    id v132 = v30;
    sub_25F3F5F80();
    uint64_t v133 = sub_25F3F5F70();
    v194 = v169;
    uint64_t v134 = *(void *)(v133 - 8);
    MEMORY[0x270FA5388](v133);
    id v136 = &v169[-((v135 + 15) & 0xFFFFFFFFFFFFFFF0)];
    uint64_t v199 = MEMORY[0x263F8EE78];
    sub_25F3E5338((unint64_t *)&unk_26B3991D0, MEMORY[0x270FCDAA0]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B3991E0);
    sub_25F335CF0((unint64_t *)&unk_26B3991F0, (uint64_t *)&unk_26B3991E0);
    sub_25F3F67A0();
    MEMORY[0x2611F0F70](0, v131, v136, v128);
    _Block_release(v128);

    (*(void (**)(unsigned char *, uint64_t))(v134 + 8))(v136, v133);
    (*(void (**)(unsigned char *, uint64_t))(v129 + 8))(v131, v195);
    return swift_release();
  }
  v194 = v87;
  uint64_t v96 = sub_25F3F5B60();
  objc_super v192 = v169;
  uint64_t v97 = *(void *)(v96 - 8);
  uint64_t v98 = *(char **)(v97 + 64);
  MEMORY[0x270FA5388](v96);
  unint64_t v189 = (unint64_t)(v98 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v99 = &v169[-v189];
  uint64_t v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B398888);
  id v191 = v169;
  uint64_t v101 = *(void *)(*(void *)(v100 - 8) + 64);
  MEMORY[0x270FA5388](v100 - 8);
  unint64_t v102 = (v101 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v103 = a1
       + OBJC_IVAR____TtCC31TextToSpeechVoiceBankingSupport17TTSVBAudioServiceP33_2F288AB684677915D8A6F8C1A2A5794F5State_audioFileURL;
  swift_beginAccess();
  sub_25F3EB000(v103, (uint64_t)&v169[-v102]);
  uint64_t v190 = v97;
  unint64_t v187 = *(unsigned char **)(v97 + 48);
  uint64_t v104 = ((uint64_t (*)(unsigned char *, uint64_t, uint64_t))v187)(&v169[-v102], 1, v96);
  if (v104)
  {
    swift_bridgeObjectRelease();
    sub_25F307B78((uint64_t)&v169[-v102], &qword_26B398888);
    uint64_t v32 = v188;
LABEL_39:
    id v87 = v194;
    goto LABEL_40;
  }
  v176 = v169;
  double v105 = MEMORY[0x270FA5388](v104);
  uint64_t v185 = v96;
  uint64_t v106 = &v169[-v189];
  unint64_t v184 = v98;
  uint64_t v107 = v190;
  uint64_t v108 = *(char **)(v190 + 16);
  unint64_t v174 = v190 + 16;
  v173 = v108;
  ((void (*)(unsigned char *, unsigned char *, uint64_t, double))v108)(&v169[-v189], &v169[-v102], v185, v105);
  id v183 = v95;
  sub_25F307B78((uint64_t)&v169[-v102], &qword_26B398888);
  sub_25F3F5AB0();
  uint64_t v109 = *(NSObject **)(v107 + 8);
  long long v110 = v106;
  uint64_t v111 = v185;
  ((void (*)(unsigned char *, uint64_t))v109)(v110, v185);
  uint64_t v172 = sub_25F3F5A70();
  id v191 = v112;
  os_log_t v175 = v109;
  v176 = (unsigned char *)(v107 + 8);
  uint64_t v113 = ((uint64_t (*)(unsigned char *, uint64_t))v109)(v99, v111);
  objc_super v192 = v169;
  MEMORY[0x270FA5388](v113);
  unint64_t v114 = &v169[-v189];
  unint64_t v189 = (unint64_t)v169;
  MEMORY[0x270FA5388](v115);
  uint64_t v116 = &v169[-v102];
  MEMORY[0x270FA5388](v117);
  uint64_t v118 = &v169[-v102];
  sub_25F3EB000(v103, (uint64_t)&v169[-v102]);
  uint64_t v119 = ((uint64_t (*)(unsigned char *, uint64_t, uint64_t))v187)(&v169[-v102], 1, v111);
  if (v119)
  {
    sub_25F307B78((uint64_t)&v169[-v102], &qword_26B398888);
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v190 + 56))(&v169[-v102], 1, 1, v111);
    uint64_t v32 = v188;
LABEL_38:
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    sub_25F307B78((uint64_t)v116, &qword_26B398888);
    goto LABEL_39;
  }
  double v120 = MEMORY[0x270FA5388](v119);
  unint64_t v122 = (v121 + 15) & 0xFFFFFFFFFFFFFFF0;
  ((void (*)(unsigned char *, unsigned char *, uint64_t, double))v173)(&v169[-v122], v118, v185, v120);
  sub_25F307B78((uint64_t)v118, &qword_26B398888);
  sub_25F3F5AF0();
  uint64_t v123 = v185;
  ((void (*)(unsigned char *, uint64_t))v175)(&v169[-v122], v185);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v190 + 56))(v116, 0, 1, v123);
  int v124 = ((uint64_t (*)(unsigned char *, uint64_t, uint64_t))v187)(v116, 1, v123);
  uint64_t v32 = v188;
  if (v124 == 1) {
    goto LABEL_38;
  }
  unint64_t v187 = a9;
  unsigned int v170 = v181 >> 8;
  uint64_t v137 = v190 + 32;
  uint64_t v190 = *(void *)(v190 + 32);
  uint64_t v171 = v114;
  uint64_t v138 = ((uint64_t (*)(unsigned char *, unsigned char *, uint64_t))v190)(v114, v116, v123);
  v196 = v169;
  uint64_t v195 = *(void *)&v197[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioIOQueue];
  id v139 = v184;
  double v140 = MEMORY[0x270FA5388](v138);
  uint64_t v141 = &v169[-v122];
  ((void (*)(unsigned char *, unsigned char *, uint64_t, double))v173)(&v169[-v122], v114, v123, v140);
  unint64_t v142 = (*(unsigned __int8 *)(v137 + 48) + 48) & ~(unint64_t)*(unsigned __int8 *)(v137 + 48);
  unint64_t v184 = (char *)((unint64_t)&v139[v142 + 7] & 0xFFFFFFFFFFFFFFF8);
  unint64_t v189 = (unint64_t)(v184 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v174 = (v189 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v143 = (v174 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v144 = (v143 + 15) & 0xFFFFFFFFFFFFFFF8;
  v173 = (char *)((v144 + 23) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v145 = (unint64_t)(v173 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v146 = swift_allocObject();
  id v147 = v183;
  *(void *)(v146 + 16) = v60;
  *(void *)(v146 + 24) = v147;
  *(unsigned char *)(v146 + 32) = v181;
  *(unsigned char *)(v146 + 33) = v170;
  *(void *)(v146 + 40) = v182;
  ((void (*)(unint64_t, unsigned char *, uint64_t))v190)(v146 + v142, v141, v123);
  double v148 = (uint64_t *)&v184[v146];
  v149 = v191;
  *double v148 = v172;
  v148[1] = (uint64_t)v149;
  id v150 = v197;
  *(void *)(v146 + v189) = v197;
  uint64_t v151 = v193;
  *(void *)(v146 + v174) = v194;
  *(void *)(v146 + v143) = v151;
  uint64_t v152 = (void *)(v146 + v144);
  uint64_t v153 = v180;
  *uint64_t v152 = v177;
  v152[1] = v153;
  *(void *)&v173[v146] = v178;
  uint64_t v154 = (void *)(v146 + v145);
  v155 = v187;
  *uint64_t v154 = v179;
  v154[1] = v155;
  uint64_t v156 = (void *)(v146 + ((v145 + 23) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v157 = v186;
  *uint64_t v156 = v188;
  v156[1] = v157;
  v203 = sub_25F3EB1F0;
  v204 = (void *)v146;
  *(void *)&long long aBlock = MEMORY[0x263EF8330];
  *((void *)&aBlock + 1) = 1107296256;
  v201 = sub_25F302590;
  v202 = &block_descriptor_147;
  double v158 = _Block_copy(&aBlock);
  uint64_t v190 = sub_25F3F5FB0();
  id v191 = v169;
  uint64_t v159 = *(void *)(v190 - 8);
  MEMORY[0x270FA5388](v190);
  uint64_t v161 = &v169[-((v160 + 15) & 0xFFFFFFFFFFFFFFF0)];
  id v162 = v182;
  id v163 = v150;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  v194 = v194;
  id v164 = v183;
  sub_25F3F5F80();
  uint64_t v165 = sub_25F3F5F70();
  v197 = v169;
  uint64_t v166 = *(void *)(v165 - 8);
  MEMORY[0x270FA5388](v165);
  v168 = &v169[-((v167 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v199 = MEMORY[0x263F8EE78];
  sub_25F3E5338((unint64_t *)&unk_26B3991D0, MEMORY[0x270FCDAA0]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B3991E0);
  sub_25F335CF0((unint64_t *)&unk_26B3991F0, (uint64_t *)&unk_26B3991E0);
  sub_25F3F67A0();
  MEMORY[0x2611F0F70](0, v161, v168, v158);
  _Block_release(v158);

  (*(void (**)(unsigned char *, uint64_t))(v166 + 8))(v168, v165);
  (*(void (**)(unsigned char *, uint64_t))(v159 + 8))(v161, v190);
  ((void (*)(unsigned char *, uint64_t))v175)(v171, v185);
  return swift_release();
}

uint64_t sub_25F3DC0BC(unint64_t a1, unint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5, void **a6, void *a7, char *a8, void *a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, void **a16, void **a17)
{
  uint64_t v68 = a6;
  uint64_t v69 = a7;
  char v19 = a3;
  unint64_t v67 = a2;
  uint64_t v71 = a17;
  double v72 = a8;
  uint64_t v70 = a16;
  unsigned int v21 = a3 >> 8;
  uint64_t v22 = sub_25F3F5B60();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = *(void *)(v23 + 64);
  MEMORY[0x270FA5388](v22);
  unint64_t v25 = (v24 + 15) & 0xFFFFFFFFFFFFFFF0;
  LOBYTE(aBlock) = v19;
  BYTE1(aBlock) = v21;
  uint64_t v75 = a4;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B398888);
  double v27 = MEMORY[0x270FA5388](v26 - 8);
  uint64_t v29 = (char *)&v58 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = *(void (**)(char *, uint64_t, uint64_t, double))(v23 + 16);
  v30(v29, a5, v22, v27);
  uint64_t v65 = v23;
  uint64_t v66 = v22;
  (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v29, 0, 1, v22);
  static TTSVBAudioTools.createAudioFileFromBuffers(_:convertFrom:audioOverrides:saveTo:filename:)(a1, v67, (unsigned __int8 *)&aBlock, (uint64_t)v29, v68, v69, (long long *)((char *)&v58 - v25));
  uint64_t v62 = a15;
  uint64_t v63 = a14;
  uint64_t v69 = a12;
  uint64_t v60 = a11;
  uint64_t v61 = a13;
  uint64_t v59 = a10;
  uint64_t v58 = a9;
  uint64_t v31 = sub_25F307B78((uint64_t)v29, &qword_26B398888);
  uint64_t v68 = &v58;
  unint64_t v67 = *(void *)&v72[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioQueue];
  double v32 = MEMORY[0x270FA5388](v31);
  double v33 = (char *)&v58 - v25;
  long long v64 = (char *)&v58 - v25;
  uint64_t v34 = v66;
  v30((char *)&v58 - v25, (uint64_t)&v58 - v25, v66, v32);
  uint64_t v35 = v65;
  unint64_t v36 = (*(unsigned __int8 *)(v65 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v65 + 80);
  unint64_t v37 = (v24 + v36 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v38 = (char *)swift_allocObject();
  uint64_t v39 = v58;
  uint64_t v40 = v59;
  *((void *)v38 + 2) = v58;
  *((void *)v38 + 3) = v40;
  double v41 = v69;
  *((void *)v38 + 4) = v60;
  *((void *)v38 + 5) = v41;
  uint64_t v42 = v62;
  uint64_t v43 = v63;
  *((void *)v38 + 6) = v61;
  *((void *)v38 + 7) = v43;
  *((void *)v38 + 8) = v42;
  (*(void (**)(char *, char *, uint64_t))(v35 + 32))(&v38[v36], v33, v34);
  uint64_t v44 = v71;
  int v45 = v72;
  *(void *)&v38[v37] = v72;
  os_log_type_t v46 = (void ***)&v38[(v37 + 15) & 0xFFFFFFFFFFFFFFF8];
  *os_log_type_t v46 = v70;
  v46[1] = v44;
  uint64_t v78 = sub_25F3EB434;
  os_log_t v79 = v38;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v75 = 1107296256;
  double v76 = sub_25F302590;
  double v77 = &block_descriptor_159;
  BOOL v47 = _Block_copy(&aBlock);
  uint64_t v63 = sub_25F3F5FB0();
  uint64_t v70 = &v58;
  uint64_t v48 = *(void *)(v63 - 8);
  MEMORY[0x270FA5388](v63);
  double v50 = (char *)&v58 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v51 = v39;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v52 = v45;
  swift_retain();
  sub_25F3F5F80();
  uint64_t v53 = sub_25F3F5F70();
  uint64_t v54 = *(void *)(v53 - 8);
  MEMORY[0x270FA5388](v53);
  char v56 = (char *)&v58 - ((v55 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = MEMORY[0x263F8EE78];
  sub_25F3E5338((unint64_t *)&unk_26B3991D0, MEMORY[0x270FCDAA0]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B3991E0);
  sub_25F335CF0((unint64_t *)&unk_26B3991F0, (uint64_t *)&unk_26B3991E0);
  sub_25F3F67A0();
  MEMORY[0x2611F0F70](0, v50, v56, v47);
  _Block_release(v47);
  (*(void (**)(char *, uint64_t))(v54 + 8))(v56, v53);
  (*(void (**)(char *, uint64_t))(v48 + 8))(v50, v63);
  (*(void (**)(char *, uint64_t))(v65 + 8))(v64, v66);
  return swift_release();
}

uint64_t sub_25F3DC8F0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, void *a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v74 = a6;
  uint64_t v75 = a8;
  uint64_t v81 = (void *)a5;
  uint64_t v16 = (int *)type metadata accessor for TTSVBAudioService.RecordingResult(0);
  uint64_t v78 = (void *)*((void *)v16 - 1);
  MEMORY[0x270FA5388](v16);
  os_log_t v79 = v17;
  id v80 = (char *)v68 - (((unint64_t)v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)v68 - v19;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B398888);
  MEMORY[0x270FA5388](v21 - 8);
  uint64_t v76 = v22;
  uint64_t v23 = (char *)v68 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = a2
      + OBJC_IVAR____TtCC31TextToSpeechVoiceBankingSupport17TTSVBAudioServiceP33_2F288AB684677915D8A6F8C1A2A5794F5State_audioFileURL;
  swift_beginAccess();
  uint64_t v77 = v24;
  sub_25F3EB000(v24, (uint64_t)v23);
  uint64_t v25 = sub_25F3F5B60();
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v26 + 48))(v23, 1, v25);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v72 = a10;
    uint64_t v73 = a11;
    uint64_t v71 = a9;
    *(void *)uint64_t v20 = a1;
    (*(void (**)(char *, char *, uint64_t))(v26 + 32))(&v20[v16[5]], v23, v25);
    uint64_t v28 = &v20[v16[6]];
    *(void *)uint64_t v28 = a3;
    *((void *)v28 + 1) = a4;
    *(void *)&v20[v16[7]] = v81;
    uint64_t v29 = v16[8];
    uint64_t v81 = v20;
    uint64_t v30 = &v20[v29];
    *(void *)uint64_t v30 = v74;
    *((void *)v30 + 1) = a7;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v31 = a1;
    uint64_t v32 = sub_25F3EF940();
    uint64_t v33 = sub_25F3F5EA0();
    uint64_t v34 = *(void *)(v33 - 8);
    double v35 = MEMORY[0x270FA5388](v33);
    unint64_t v37 = (char *)v68 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v38 = (*(uint64_t (**)(char *, uint64_t, uint64_t, double))(v34 + 16))(v37, v32, v33, v35);
    uint64_t v74 = v68;
    double v39 = MEMORY[0x270FA5388](v38);
    double v41 = (char *)v68 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, void *, uint64_t, double))(v26 + 16))(v41, v75, v25, v39);
    uint64_t v42 = sub_25F3F5E80();
    os_log_type_t v43 = sub_25F3F64A0();
    if (os_log_type_enabled(v42, v43))
    {
      uint64_t v44 = swift_slowAlloc();
      uint64_t v75 = v68;
      int v45 = (uint8_t *)v44;
      uint64_t v69 = swift_slowAlloc();
      aBlock[0] = v69;
      uint64_t v70 = v33;
      *(_DWORD *)int v45 = 136315138;
      v68[1] = v45 + 4;
      uint64_t v46 = sub_25F3F5B40();
      uint64_t v82 = sub_25F2FE464(v46, v47, aBlock);
      sub_25F3F66A0();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v26 + 8))(v41, v25);
      _os_log_impl(&dword_25F2F5000, v42, v43, "Will end audio recording: %s", v45, 0xCu);
      uint64_t v48 = v69;
      swift_arrayDestroy();
      MEMORY[0x2611F21E0](v48, -1, -1);
      MEMORY[0x2611F21E0](v45, -1, -1);

      uint64_t v49 = (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v37, v70);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v26 + 8))(v41, v25);

      uint64_t v49 = (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v37, v33);
    }
    uint64_t v50 = (uint64_t)v80;
    id v51 = v78;
    double v52 = MEMORY[0x270FA5388](v49);
    uint64_t v54 = (char *)v68 - ((v53 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t, double))(v26 + 56))(v54, 1, 1, v25, v52);
    uint64_t v55 = v77;
    swift_beginAccess();
    sub_25F3EB4E4((uint64_t)v54, v55);
    swift_endAccess();
    id v80 = *(char **)(v71 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_calloutQueue);
    sub_25F3E84A4((uint64_t)v81, v50, type metadata accessor for TTSVBAudioService.RecordingResult);
    unint64_t v56 = (*((unsigned __int8 *)v51 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v51 + 80);
    uint64_t v57 = swift_allocObject();
    uint64_t v58 = v73;
    *(void *)(v57 + 16) = v72;
    *(void *)(v57 + 24) = v58;
    sub_25F3EB668(v50, v57 + v56);
    aBlock[4] = (uint64_t)sub_25F3EB6CC;
    aBlock[5] = v57;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_25F302590;
    aBlock[3] = (uint64_t)&block_descriptor_165;
    uint64_t v59 = _Block_copy(aBlock);
    uint64_t v60 = sub_25F3F5FB0();
    os_log_t v79 = v68;
    uint64_t v61 = *(void *)(v60 - 8);
    MEMORY[0x270FA5388](v60);
    uint64_t v63 = (char *)v68 - ((v62 + 15) & 0xFFFFFFFFFFFFFFF0);
    swift_retain();
    sub_25F3F5F80();
    uint64_t v64 = sub_25F3F5F70();
    uint64_t v78 = v68;
    uint64_t v65 = *(void *)(v64 - 8);
    MEMORY[0x270FA5388](v64);
    unint64_t v67 = (char *)v68 - ((v66 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v82 = MEMORY[0x263F8EE78];
    sub_25F3E5338((unint64_t *)&unk_26B3991D0, MEMORY[0x270FCDAA0]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B3991E0);
    sub_25F335CF0((unint64_t *)&unk_26B3991F0, (uint64_t *)&unk_26B3991E0);
    sub_25F3F67A0();
    MEMORY[0x2611F0F70](0, v63, v67, v59);
    _Block_release(v59);
    (*(void (**)(char *, uint64_t))(v65 + 8))(v67, v64);
    (*(void (**)(char *, uint64_t))(v61 + 8))(v63, v60);
    sub_25F3E9DBC((uint64_t)v81, type metadata accessor for TTSVBAudioService.RecordingResult);
    return swift_release();
  }
  return result;
}

uint64_t sub_25F3DD158(void (*a1)(char *), uint64_t a2, uint64_t a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DC70);
  MEMORY[0x270FA5388](v5);
  int v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25F3E84A4(a3, (uint64_t)v7, type metadata accessor for TTSVBAudioService.RecordingResult);
  swift_storeEnumTagMultiPayload();
  a1(v7);
  return sub_25F307B78((uint64_t)v7, &qword_26A78DC70);
}

uint64_t sub_25F3DD230(void (*a1)(char *), uint64_t a2, void *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DC70);
  MEMORY[0x270FA5388](v5);
  int v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v9 = xmmword_25F401600;
  char v10 = 3;
  static TTSVBError.map(_:_:)(a3, (uint64_t)&v9, (uint64_t)v7);
  swift_storeEnumTagMultiPayload();
  a1(v7);
  return sub_25F307B78((uint64_t)v7, &qword_26A78DC70);
}

unint64_t sub_25F3DD310(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DC78);
  uint64_t v2 = (void *)sub_25F3F69B0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  double v4 = (id *)(a1 + 40);
  while (1)
  {
    char v5 = *((unsigned char *)v4 - 8);
    id v6 = *v4;
    unint64_t result = sub_25F3E6C84(v5);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(unsigned char *)(v2[6] + result) = v5;
    *(void *)(v2[7] + 8 * result) = v6;
    uint64_t v9 = v2[2];
    BOOL v10 = __OFADD__(v9, 1);
    uint64_t v11 = v9 + 1;
    if (v10) {
      goto LABEL_11;
    }
    v2[2] = v11;
    v4 += 2;
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

uint64_t sub_25F3DD414(char a1, uint64_t a2, id a3, void *a4, double a5)
{
  uint64_t v9 = (void (*)(void, void))(a2 + 16);
  uint64_t v10 = sub_25F3EF940();
  uint64_t v11 = sub_25F3F5EA0();
  uint64_t v12 = *(void *)(v11 - 8);
  double v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, double))(v12 + 16))(v15, v10, v11, v13);
  uint64_t v16 = sub_25F3F5E80();
  os_log_type_t v17 = sub_25F3F64A0();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v50 = v9;
    uint64_t v18 = swift_slowAlloc();
    id v51 = a3;
    uint64_t v19 = (uint8_t *)v18;
    uint64_t v20 = swift_slowAlloc();
    double v52 = a4;
    uint64_t v21 = v20;
    *(_DWORD *)uint64_t v19 = 136315138;
    aBlock[0] = v20;
    if (a1) {
      unint64_t v22 = 0x800000025F407F70;
    }
    else {
      unint64_t v22 = 0x800000025F407F50;
    }
    uint64_t aBlock[6] = sub_25F2FE464(0xD000000000000012, v22, aBlock);
    uint64_t v9 = v50;
    sub_25F3F66A0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25F2F5000, v16, v17, "Did finish playing sound effect '%s'. Calling completion", v19, 0xCu);
    swift_arrayDestroy();
    uint64_t v23 = v21;
    a4 = v52;
    MEMORY[0x2611F21E0](v23, -1, -1);
    uint64_t v24 = v19;
    a3 = v51;
    MEMORY[0x2611F21E0](v24, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
  swift_beginAccess();
  uint64_t result = MEMORY[0x2611F22B0](v9);
  if (result)
  {
    uint64_t v26 = (void *)result;
    id v51 = *(id *)(result + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioQueue);

    uint64_t v27 = sub_25F3F5FD0();
    double v52 = v45;
    uint64_t v49 = v27;
    uint64_t v28 = *(void *)(v27 - 8);
    MEMORY[0x270FA5388](v27);
    uint64_t v30 = (char *)v45 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
    MEMORY[0x270FA5388](v31);
    uint64_t v33 = (char *)v45 - v32;
    sub_25F3F5FC0();
    MEMORY[0x2611F0A10](v33, a5);
    uint64_t v34 = *(void (**)(void, void))(v28 + 8);
    uint64_t v48 = v28 + 8;
    uint64_t v50 = v34;
    v34(v33, v27);
    uint64_t v35 = swift_allocObject();
    *(void *)(v35 + 16) = a3;
    *(void *)(v35 + 24) = a4;
    aBlock[4] = (uint64_t)sub_25F37CB0C;
    aBlock[5] = v35;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_25F302590;
    aBlock[3] = (uint64_t)&block_descriptor_196;
    uint64_t v36 = _Block_copy(aBlock);
    uint64_t v46 = sub_25F3F5FB0();
    unint64_t v47 = v45;
    uint64_t v37 = *(void *)(v46 - 8);
    MEMORY[0x270FA5388](v46);
    double v39 = (char *)v45 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
    swift_retain();
    sub_25F3F5F80();
    uint64_t v40 = sub_25F3F5F70();
    v45[1] = v45;
    uint64_t v41 = *(void *)(v40 - 8);
    MEMORY[0x270FA5388](v40);
    os_log_type_t v43 = (char *)v45 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v53 = MEMORY[0x263F8EE78];
    sub_25F3E5338((unint64_t *)&unk_26B3991D0, MEMORY[0x270FCDAA0]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B3991E0);
    sub_25F335CF0((unint64_t *)&unk_26B3991F0, (uint64_t *)&unk_26B3991E0);
    sub_25F3F67A0();
    uint64_t v44 = v51;
    MEMORY[0x2611F0F30](v30, v39, v43, v36);
    _Block_release(v36);

    (*(void (**)(char *, uint64_t))(v41 + 8))(v43, v40);
    (*(void (**)(char *, uint64_t))(v37 + 8))(v39, v46);
    v50(v30, v49);
    return swift_release();
  }
  return result;
}

uint64_t sub_25F3DDA18(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

void sub_25F3DDA6C(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = type metadata accessor for TTSVBError(0);
  MEMORY[0x270FA5388](v5 - 8);
  int v7 = (char *)&v181 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for TTSVBError.Reason(0);
  MEMORY[0x270FA5388](v8);
  unint64_t v189 = (char *)&v181 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  v201 = (uint8_t *)&v181 - v11;
  uint64_t v12 = sub_25F3F5FE0();
  uint64_t v13 = *(void *)(v12 - 8);
  double v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (uint64_t *)((char *)&v181 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  os_log_type_t v17 = *(void **)&v3[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioQueue];
  *uint64_t v16 = v17;
  (*(void (**)(void *, void, uint64_t, double))(v13 + 104))(v16, *MEMORY[0x263F8F0E8], v12, v14);
  id v18 = v17;
  LOBYTE(v17) = sub_25F3F6000();
  (*(void (**)(void *, uint64_t))(v13 + 8))(v16, v12);
  if ((v17 & 1) == 0)
  {
    __break(1u);
    return;
  }
  uint64_t v190 = v7;
  uint64_t v19 = (uint64_t *)*MEMORY[0x263EF9058];
  uint64_t v20 = *(void **)&v3[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioSession];
  id v21 = objc_msgSend(v20, sel_category);
  id v22 = objc_msgSend(v20, sel_categoryOptions);
  Swift::UInt64_optional v206 = objc_msgSend(v20, sel_mode);
  id v191 = v20;
  id v23 = objc_msgSend(v20, sel_preferredInput);
  if (v23)
  {
    uint64_t v24 = v23;
    id v25 = objc_msgSend(v23, sel_portType);
  }
  else
  {
    id v25 = 0;
  }
  v200 = (uint8_t *)v8;
  id v204 = v21;
  uint64_t v26 = sub_25F3F6130();
  uint64_t v28 = v27;
  v207 = v19;
  uint64_t v29 = sub_25F3F6130();
  id v202 = v25;
  uint64_t v203 = v2;
  id v199 = v22;
  if (v26 == v29 && v28 == v30)
  {
    swift_bridgeObjectRelease_n();
    if (v22 != (id)44) {
      goto LABEL_29;
    }
LABEL_11:
    uint64_t v32 = sub_25F3F6130();
    uint64_t v34 = v33;
    if (v32 == sub_25F3F6130() && v34 == v35)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v36 = sub_25F3F6B80();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v36 & 1) == 0) {
        goto LABEL_29;
      }
    }
    uint64_t v37 = OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_state;
    swift_retain();
    sub_25F3F5EF0();
    swift_release();
    double v38 = v213;
    if (v213 == 0.0)
    {
      if (v25) {
        goto LABEL_29;
      }
    }
    else
    {
      id v39 = objc_msgSend(*(id *)&v213, sel_portType);

      if (v25)
      {
        if (!v39) {
          goto LABEL_29;
        }
        uint64_t v40 = sub_25F3F6130();
        uint64_t v42 = v41;
        if (v40 == sub_25F3F6130() && v42 == v43)
        {

          swift_bridgeObjectRelease_n();
        }
        else
        {
          char v44 = sub_25F3F6B80();

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v44 & 1) == 0) {
            goto LABEL_29;
          }
        }
      }
      else if (v39)
      {

        goto LABEL_29;
      }
    }
    v200 = (uint8_t *)v37;
    uint64_t v45 = sub_25F3EF940();
    uint64_t v46 = sub_25F3F5EA0();
    Swift::UInt64_optional v205 = &v181;
    uint64_t v47 = *(void *)(v46 - 8);
    double v48 = MEMORY[0x270FA5388](v46);
    uint64_t v50 = (char *)&v181 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, uint64_t, uint64_t, double))(v47 + 16))(v50, v45, v46, v48);
    id v51 = v207;
    double v52 = v3;
    v201 = v51;
    uint64_t v53 = v52;
    uint64_t v54 = sub_25F3F5E80();
    LODWORD(v199) = sub_25F3F64D0();
    if (os_log_type_enabled(v54, (os_log_type_t)v199))
    {
      v196 = v53;
      v197 = v54;
      uint64_t v198 = v50;
      uint64_t v55 = swift_slowAlloc();
      uint64_t v195 = swift_slowAlloc();
      uint64_t v216 = v195;
      *(_DWORD *)uint64_t v55 = 136315650;
      double v213 = COERCE_DOUBLE(sub_25F3F6130());
      uint64_t v214 = v56;
      double v210 = -2.31584178e77;
      unint64_t v211 = 0x800000025F408020;
      uint64_t v208 = 0;
      unint64_t v209 = 0xE000000000000000;
      unint64_t v179 = sub_25F2FDE6C();
      uint64_t v180 = v179;
      uint64_t v177 = (char *)MEMORY[0x263F8D310];
      unint64_t v178 = v179;
      uint64_t v57 = sub_25F3F6700();
      unint64_t v59 = v58;
      swift_bridgeObjectRelease();
      double v213 = COERCE_DOUBLE(sub_25F2FE464(v57, v59, &v216));
      sub_25F3F66A0();
      uint64_t v60 = v201;

      swift_bridgeObjectRelease();
      *(_WORD *)(v55 + 12) = 2080;
      uint64_t v61 = sub_25F3E0E44(44);
      double v213 = COERCE_DOUBLE(sub_25F2FE464(v61, v62, &v216));
      sub_25F3F66A0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v55 + 22) = 2080;
      swift_retain();
      sub_25F3F5EF0();
      swift_release();
      double v63 = v213;
      if (v213 == 0.0)
      {
        uint64_t v65 = 7104878;
        unint64_t v67 = 0xE300000000000000;
      }
      else
      {
        id v64 = objc_msgSend(*(id *)&v213, sel_portName);

        uint64_t v65 = sub_25F3F6130();
        unint64_t v67 = v66;
      }
      uint64_t v159 = v202;
      uint64_t v160 = v198;
      double v213 = COERCE_DOUBLE(sub_25F2FE464(v65, v67, &v216));
      sub_25F3F66A0();
      uint64_t v161 = v196;

      swift_bridgeObjectRelease();
      id v162 = v197;
      _os_log_impl(&dword_25F2F5000, v197, (os_log_type_t)v199, "Will not reconfigure audio session. Already in expected configuration category=%s options=%s portType=%s", (uint8_t *)v55, 0x20u);
      uint64_t v163 = v195;
      swift_arrayDestroy();
      MEMORY[0x2611F21E0](v163, -1, -1);
      MEMORY[0x2611F21E0](v55, -1, -1);

      (*(void (**)(char *, uint64_t))(v47 + 8))(v160, v46);
    }
    else
    {

      uint64_t v157 = v201;
      (*(void (**)(char *, uint64_t))(v47 + 8))(v50, v46);
    }
    return;
  }
  char v31 = sub_25F3F6B80();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v31 & 1) != 0 && v199 == (id)44) {
    goto LABEL_11;
  }
LABEL_29:
  uint64_t v68 = sub_25F3EF940();
  uint64_t v69 = sub_25F3F5EA0();
  v196 = (char *)&v181;
  double v70 = MEMORY[0x270FA5388](v69);
  uint64_t v192 = v71;
  uint64_t v72 = (char *)&v181 - ((v71 + 15) & 0xFFFFFFFFFFFFFFF0);
  Swift::UInt64_optional v205 = v73;
  uint64_t v74 = (void (*)(void, void, void, double))v73[2];
  uint64_t v195 = v68;
  v194 = v73 + 2;
  uint64_t v193 = v74;
  v74(v72, v68, v69, v70);
  uint64_t v75 = v3;
  uint64_t v76 = v207;
  uint64_t v77 = v75;
  id v78 = v204;
  os_log_t v79 = v206;
  id v80 = a1;
  uint64_t v81 = v76;
  uint64_t v82 = v77;
  id v83 = v78;
  Swift::UInt64_optional v206 = v79;
  id v84 = v80;
  double v85 = sub_25F3F5E80();
  int v86 = sub_25F3F64D0();
  BOOL v87 = os_log_type_enabled(v85, (os_log_type_t)v86);
  v197 = v83;
  uint64_t v198 = (char *)v69;
  if (v87)
  {
    int v183 = v86;
    os_log_t v184 = v85;
    id v186 = v84;
    unint64_t v187 = v81;
    uint64_t v185 = v72;
    uint64_t v188 = v82;
    uint64_t v88 = swift_slowAlloc();
    uint64_t v182 = swift_slowAlloc();
    uint64_t v216 = v182;
    *(_DWORD *)uint64_t v88 = 136316930;
    double v213 = COERCE_DOUBLE(sub_25F3F6130());
    uint64_t v214 = v89;
    double v210 = -2.31584178e77;
    unint64_t v211 = 0x800000025F408020;
    id v204 = (id)0x800000025F408020;
    uint64_t v208 = 0;
    unint64_t v209 = 0xE000000000000000;
    unint64_t v90 = sub_25F2FDE6C();
    unint64_t v179 = v90;
    uint64_t v180 = v90;
    uint64_t v177 = (char *)MEMORY[0x263F8D310];
    unint64_t v178 = v90;
    uint64_t v91 = sub_25F3F6700();
    unint64_t v93 = v92;
    swift_bridgeObjectRelease();
    double v213 = COERCE_DOUBLE(sub_25F2FE464(v91, v93, &v216));
    sub_25F3F66A0();

    id v94 = v206;
    swift_bridgeObjectRelease();
    *(_WORD *)(v88 + 12) = 2080;
    uint64_t v95 = sub_25F3E0E44((char)v199);
    double v213 = COERCE_DOUBLE(sub_25F2FE464(v95, v96, &v216));
    sub_25F3F66A0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v88 + 22) = 2080;
    uint64_t v97 = sub_25F3F6130();
    double v213 = COERCE_DOUBLE(sub_25F2FE464(v97, v98, &v216));
    sub_25F3F66A0();

    swift_bridgeObjectRelease();
    *(_WORD *)(v88 + 32) = 2080;
    id v99 = objc_msgSend(v191, sel_preferredInput);
    if (v99)
    {
      uint64_t v100 = v99;
      id v101 = objc_msgSend(v99, sel_portName);

      uint64_t v102 = sub_25F3F6130();
      unint64_t v104 = v103;
    }
    else
    {
      unint64_t v104 = 0xE300000000000000;
      uint64_t v102 = 7104878;
    }
    double v213 = COERCE_DOUBLE(sub_25F2FE464(v102, v104, &v216));
    sub_25F3F66A0();
    uint64_t v111 = v188;

    swift_bridgeObjectRelease();
    *(_WORD *)(v88 + 42) = 2080;
    double v213 = COERCE_DOUBLE(sub_25F3F6130());
    uint64_t v214 = v112;
    double v210 = -2.31584178e77;
    unint64_t v211 = (unint64_t)v204;
    uint64_t v208 = 0;
    unint64_t v209 = 0xE000000000000000;
    unint64_t v179 = v90;
    uint64_t v180 = v90;
    unint64_t v178 = v90;
    uint64_t v177 = (char *)MEMORY[0x263F8D310];
    uint64_t v113 = sub_25F3F6700();
    unint64_t v115 = v114;
    swift_bridgeObjectRelease();
    double v213 = COERCE_DOUBLE(sub_25F2FE464(v113, v115, &v216));
    sub_25F3F66A0();
    uint64_t v116 = v187;

    swift_bridgeObjectRelease();
    *(_WORD *)(v88 + 52) = 2080;
    uint64_t v117 = sub_25F3E0E44(44);
    double v213 = COERCE_DOUBLE(sub_25F2FE464(v117, v118, &v216));
    sub_25F3F66A0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v88 + 62) = 2080;
    uint64_t v119 = v186;
    uint64_t v120 = sub_25F3F6130();
    double v213 = COERCE_DOUBLE(sub_25F2FE464(v120, v121, &v216));
    sub_25F3F66A0();

    swift_bridgeObjectRelease();
    *(_WORD *)(v88 + 72) = 2080;
    swift_retain();
    sub_25F3F5EF0();
    swift_release();
    double v122 = v213;
    if (v213 == 0.0)
    {
      unint64_t v126 = 0xE300000000000000;
      uint64_t v109 = (void *)v203;
      id v127 = v205;
      uint64_t v107 = v201;
      uint64_t v128 = v182;
      uint64_t v124 = 7104878;
    }
    else
    {
      id v123 = objc_msgSend(*(id *)&v213, sel_portName);

      uint64_t v124 = sub_25F3F6130();
      unint64_t v126 = v125;

      uint64_t v109 = (void *)v203;
      id v127 = v205;
      uint64_t v107 = v201;
      uint64_t v128 = v182;
    }
    double v213 = COERCE_DOUBLE(sub_25F2FE464(v124, v126, &v216));
    sub_25F3F66A0();
    uint64_t v108 = v188;

    swift_bridgeObjectRelease();
    os_log_t v129 = v184;
    _os_log_impl(&dword_25F2F5000, v184, (os_log_type_t)v183, "Will reconfigure audio session from [category=%s options=%s mode=%s portType=%s] to [category=%s options=%s mode=%s] portType=%s", (uint8_t *)v88, 0x52u);
    swift_arrayDestroy();
    MEMORY[0x2611F21E0](v128, -1, -1);
    MEMORY[0x2611F21E0](v88, -1, -1);

    uint64_t v110 = (uint64_t)v198;
    id v204 = (id)v127[1];
    uint64_t v106 = ((uint64_t (*)(char *, char *))v204)(v185, v198);
    uint64_t v81 = v187;
  }
  else
  {

    double v105 = v206;
    id v204 = (id)v205[1];
    uint64_t v106 = ((uint64_t (*)(char *, uint64_t))v204)(v72, v69);
    uint64_t v107 = v201;
    uint64_t v108 = v82;
    uint64_t v109 = (void *)v203;
    uint64_t v110 = v69;
  }
  MEMORY[0x270FA5388](v106);
  uint64_t v177 = v108;
  unint64_t v178 = (unint64_t)v81;
  unint64_t v179 = v130;
  uint64_t v180 = 44;
  double v213 = COERCE_DOUBLE(sub_25F3F6130());
  uint64_t v214 = v131;
  unsigned __int8 v215 = 1;
  swift_storeEnumTagMultiPayload();
  static TTSVBError.perform<A>(_:problem:reason:)((void (*)(uint64_t))sub_25F3EAEC4, (uint64_t)(&v181 - 6), (uint64_t)&v213, (uint64_t)v107);
  id v132 = v109;
  if (v109)
  {
    sub_25F3E9DBC((uint64_t)v107, type metadata accessor for TTSVBError.Reason);
    uint64_t v133 = sub_25F307C20(*(uint64_t *)&v213, v214, v215);
    double v137 = MEMORY[0x270FA5388](v133);
    id v139 = (char *)&v181 - ((v138 + 15) & 0xFFFFFFFFFFFFFFF0);
    v140(v139, v137);
    id v141 = v109;
    id v142 = v109;
    unint64_t v143 = sub_25F3F5E80();
    os_log_type_t v144 = sub_25F3F64C0();
    if (os_log_type_enabled(v143, v144))
    {
      unint64_t v145 = (uint8_t *)swift_slowAlloc();
      uint64_t v203 = swift_slowAlloc();
      uint64_t v208 = v203;
      *(_DWORD *)unint64_t v145 = 136315138;
      v200 = v145 + 4;
      v201 = v145;
      sub_25F30CB70((uint64_t)&v213);
      v207 = &v181;
      double v146 = v213;
      uint64_t v147 = v214;
      LOBYTE(v145) = v215;
      double v210 = v213;
      unint64_t v211 = v214;
      unsigned __int8 v212 = v215;
      uint64_t v148 = (uint64_t)v190;
      static TTSVBError.map(_:_:)(v132, (uint64_t)&v210, (uint64_t)v190);
      sub_25F307C20(*(uint64_t *)&v146, v147, v145);
      uint64_t v149 = TTSVBError.description.getter();
      unint64_t v151 = v150;
      sub_25F3E9DBC(v148, type metadata accessor for TTSVBError);
      double v213 = COERCE_DOUBLE(sub_25F2FE464(v149, v151, &v208));
      sub_25F3F66A0();
      swift_bridgeObjectRelease();

      uint64_t v152 = v201;
      _os_log_impl(&dword_25F2F5000, v143, v144, "%s", v201, 0xCu);
      uint64_t v153 = v203;
      swift_arrayDestroy();
      MEMORY[0x2611F21E0](v153, -1, -1);
      MEMORY[0x2611F21E0](v152, -1, -1);

      uint64_t v154 = v139;
      v155 = v198;
    }
    else
    {

      uint64_t v154 = v139;
      v155 = (char *)v110;
    }
    ((void (*)(char *, char *))v204)(v154, v155);
    uint64_t v156 = v202;
    swift_willThrow();
  }
  else
  {
    sub_25F3E9DBC((uint64_t)v107, type metadata accessor for TTSVBError.Reason);
    uint64_t v134 = sub_25F307C20(*(uint64_t *)&v213, v214, v215);
    MEMORY[0x270FA5388](v134);
    unint64_t v179 = (unint64_t)v108;
    double v213 = -2.31584178e77;
    uint64_t v214 = 0x800000025F408570;
    unsigned __int8 v215 = 0;
    uint64_t v135 = (uint64_t)v189;
    sub_25F335D38();
    static TTSVBError.perform<A>(_:problem:reason:)((void (*)(uint64_t))sub_25F3EAF4C, (uint64_t)&v177, (uint64_t)&v213, v135);
    sub_25F3E9DBC(v135, type metadata accessor for TTSVBError.Reason);
    sub_25F307C20(*(uint64_t *)&v213, v214, v215);
    id v136 = sub_25F3E13A8();
    double v158 = v136;
    if (v136)
    {
      sub_25F3E2244(v136);
    }
    sub_25F3E3844();
    double v165 = MEMORY[0x270FA5388](v164);
    uint64_t v167 = (char *)&v181 - ((v166 + 15) & 0xFFFFFFFFFFFFFFF0);
    v193(v167, v195, v110, v165);
    v168 = v108;
    v207 = (uint64_t *)v167;
    uint64_t v169 = sub_25F3F5E80();
    os_log_type_t v170 = sub_25F3F64D0();
    if (os_log_type_enabled(v169, v170))
    {
      uint64_t v171 = swift_slowAlloc();
      *(_DWORD *)uint64_t v171 = 67109632;
      id v172 = v191;
      LODWORD(v213) = objc_msgSend(v191, sel_isInputGainSettable);
      uint64_t v203 = 0;
      sub_25F3F66A0();

      *(_WORD *)(v171 + 8) = 2048;
      objc_msgSend(v172, sel_inputGain);
      double v213 = v173;
      sub_25F3F66A0();

      *(_WORD *)(v171 + 18) = 2048;
      objc_msgSend(v172, sel_sampleRate);
      double v213 = v174;
      uint64_t v110 = (uint64_t)v198;
      sub_25F3F66A0();

      _os_log_impl(&dword_25F2F5000, v169, v170, "isInputGainSettable=%{BOOL}d inputGain%f sampleRate=%f", (uint8_t *)v171, 0x1Cu);
      MEMORY[0x2611F21E0](v171, -1, -1);
      v168 = v197;
      os_log_t v175 = v206;
      v176 = v202;
    }
    else
    {

      uint64_t v169 = v206;
      v176 = v202;
      os_log_t v175 = v197;
    }

    ((void (*)(uint64_t *, uint64_t))v204)(v207, v110);
  }
}

void sub_25F3DF09C()
{
  uint64_t v2 = type metadata accessor for TTSVBError.Reason(0);
  MEMORY[0x270FA5388](v2);
  double v4 = (char *)&v75 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_25F3F5FE0();
  uint64_t v6 = *(void *)(v5 - 8);
  double v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (uint64_t *)((char *)&v75 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = *(void **)(v0 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioQueue);
  *uint64_t v9 = v10;
  (*(void (**)(void *, void, uint64_t, double))(v6 + 104))(v9, *MEMORY[0x263F8F0E8], v5, v7);
  id v11 = v10;
  char v12 = sub_25F3F6000();
  (*(void (**)(void *, uint64_t))(v6 + 8))(v9, v5);
  if (v12)
  {
    if (objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioSession), sel_isInputAvailable))
    {
      uint64_t v83 = v2;
      uint64_t v85 = v0;
      uint64_t v79 = v1;
      uint64_t v13 = sub_25F3EF940();
      uint64_t v14 = sub_25F3F5EA0();
      uint64_t v15 = *(void **)(v14 - 8);
      uint64_t v16 = v15[8];
      double v17 = MEMORY[0x270FA5388](v14);
      uint64_t v81 = (void (*)(char *, uint64_t, uint64_t, double))v15[2];
      uint64_t v82 = (uint64_t *)v13;
      v81((char *)&v75 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), v13, v14, v17);
      id v18 = sub_25F3F5E80();
      os_log_type_t v19 = sub_25F3F64D0();
      BOOL v20 = os_log_type_enabled(v18, v19);
      uint64_t v84 = v14;
      if (v20)
      {
        id v21 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v21 = 0;
        _os_log_impl(&dword_25F2F5000, v18, v19, "Will install audio tap", v21, 2u);
        id v22 = v21;
        uint64_t v14 = v84;
        MEMORY[0x2611F21E0](v22, -1, -1);
      }

      id v23 = v15 + 1;
      id v80 = (uint64_t (*)(char *, uint64_t))v15[1];
      uint64_t v24 = v80((char *)&v75 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), v14);
      uint64_t v25 = OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_state;
      if (*(unsigned char *)(*(void *)(v85 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_state)
                    + OBJC_IVAR____TtCC31TextToSpeechVoiceBankingSupport17TTSVBAudioServiceP33_2F288AB684677915D8A6F8C1A2A5794F5State_audioEngineTapInstalled) == 1)
      {
        id v78 = &v75;
        double v26 = MEMORY[0x270FA5388](v24);
        v81((char *)&v75 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t)v82, v14, v26);
        uint64_t v27 = sub_25F3F5E80();
        os_log_type_t v28 = sub_25F3F64D0();
        if (os_log_type_enabled(v27, v28))
        {
          uint64_t v29 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v29 = 0;
          _os_log_impl(&dword_25F2F5000, v27, v28, "An old audio tap appears to be installed already. Will remove it first", v29, 2u);
          uint64_t v30 = v29;
          uint64_t v14 = v84;
          MEMORY[0x2611F21E0](v30, -1, -1);
        }

        id v23 = v15 + 1;
        v80((char *)&v75 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), v14);
        sub_25F3DFA60();
      }
      id v31 = sub_25F3D0F40();
      id v32 = objc_msgSend(v31, sel_inputNode);

      id v33 = objc_msgSend(v32, sel_inputFormatForBus_, 0);
      objc_msgSend(v33, sel_sampleRate);
      if (v34 == 0.0 || !objc_msgSend(v33, sel_channelCount))
      {
        long long aBlock = xmmword_25F401610;
        LOBYTE(v88) = 3;
        objc_msgSend(v33, sel_sampleRate);
        uint64_t v36 = v35;
        unsigned int v37 = objc_msgSend(v33, sel_channelCount);
        *(void *)double v4 = v36;
        *((_DWORD *)v4 + 2) = v37;
        swift_storeEnumTagMultiPayload();
        type metadata accessor for TTSVBError(0);
        sub_25F3EAD60((unint64_t *)&qword_26B3988A8, (void (*)(uint64_t))type metadata accessor for TTSVBError);
        swift_allocError();
        TTSVBError.init(_:_:_:)((uint64_t)&aBlock, (uint64_t)v4, 0, v38);
        swift_willThrow();
      }
      else
      {
        uint64_t v83 = v25;
        uint64_t v40 = *(void *)(v85 + v25);
        uint64_t v41 = *(void **)(v40
                       + OBJC_IVAR____TtCC31TextToSpeechVoiceBankingSupport17TTSVBAudioServiceP33_2F288AB684677915D8A6F8C1A2A5794F5State_recordingFormat);
        *(void *)(v40
                  + OBJC_IVAR____TtCC31TextToSpeechVoiceBankingSupport17TTSVBAudioServiceP33_2F288AB684677915D8A6F8C1A2A5794F5State_recordingFormat) = v33;
        id v42 = v33;

        double v44 = MEMORY[0x270FA5388](v43);
        uint64_t v45 = (char *)&v75 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
        uint64_t v46 = v84;
        v81(v45, (uint64_t)v82, v84, v44);
        id v47 = v32;
        id v48 = v42;
        id v49 = v47;
        id v50 = v48;
        id v51 = v49;
        double v52 = sub_25F3F5E80();
        os_log_type_t v53 = sub_25F3F64D0();
        int v54 = v53;
        if (os_log_type_enabled(v52, v53))
        {
          uint64_t v55 = swift_slowAlloc();
          uint64_t v81 = (void (*)(char *, uint64_t, uint64_t, double))swift_slowAlloc();
          *(void *)&long long aBlock = v81;
          *(_DWORD *)uint64_t v55 = 136315650;
          os_log_t v77 = v52;
          id v56 = objc_msgSend(v51, sel_debugDescription);
          int v76 = v54;
          id v57 = v56;
          uint64_t v58 = sub_25F3F6130();
          uint64_t v82 = &v75;
          uint64_t v59 = v58;
          id v78 = v23;
          unint64_t v61 = v60;

          uint64_t v86 = sub_25F2FE464(v59, v61, (uint64_t *)&aBlock);
          sub_25F3F66A0();

          swift_bridgeObjectRelease();
          *(_WORD *)(v55 + 12) = 2080;
          id v62 = objc_msgSend(v51, sel_AUAudioUnit, v55 + 14);
          id v63 = objc_msgSend(v62, sel_debugDescription);

          uint64_t v64 = sub_25F3F6130();
          unint64_t v66 = v65;

          uint64_t v86 = sub_25F2FE464(v64, v66, (uint64_t *)&aBlock);
          sub_25F3F66A0();

          swift_bridgeObjectRelease();
          *(_WORD *)(v55 + 22) = 2080;
          uint64_t v67 = sub_25F3DFD1C();
          uint64_t v86 = sub_25F2FE464(v67, v68, (uint64_t *)&aBlock);
          sub_25F3F66A0();

          swift_bridgeObjectRelease();
          os_log_t v69 = v77;
          _os_log_impl(&dword_25F2F5000, v77, (os_log_type_t)v76, "Installing audio tap input=[%s - %s] format=[%s]", (uint8_t *)v55, 0x20u);
          double v70 = v81;
          swift_arrayDestroy();
          MEMORY[0x2611F21E0](v70, -1, -1);
          MEMORY[0x2611F21E0](v55, -1, -1);
        }
        else
        {
        }
        v80(v45, v46);
        uint64_t v71 = swift_allocObject();
        uint64_t v72 = v85;
        swift_unknownObjectWeakInit();
        unint64_t v90 = sub_25F3EB80C;
        uint64_t v91 = v71;
        *(void *)&long long aBlock = MEMORY[0x263EF8330];
        *((void *)&aBlock + 1) = 1107296256;
        uint64_t v88 = sub_25F3E057C;
        uint64_t v89 = &block_descriptor_200_0;
        uint64_t v73 = _Block_copy(&aBlock);
        id v74 = v50;
        swift_release();
        objc_msgSend(v51, sel_installTapOnBus_bufferSize_format_block_, 0, 1024, v74, v73);

        _Block_release(v73);
        *(unsigned char *)(*(void *)(v72 + v83)
                 + OBJC_IVAR____TtCC31TextToSpeechVoiceBankingSupport17TTSVBAudioServiceP33_2F288AB684677915D8A6F8C1A2A5794F5State_audioEngineTapInstalled) = 1;
      }
    }
    else
    {
      long long aBlock = xmmword_25F401610;
      LOBYTE(v88) = 3;
      swift_storeEnumTagMultiPayload();
      type metadata accessor for TTSVBError(0);
      sub_25F3EAD60((unint64_t *)&qword_26B3988A8, (void (*)(uint64_t))type metadata accessor for TTSVBError);
      swift_allocError();
      TTSVBError.init(_:_:_:)((uint64_t)&aBlock, (uint64_t)v4, 0, v39);
      swift_willThrow();
    }
  }
  else
  {
    __break(1u);
  }
}

void sub_25F3DFA60()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25F3F5FE0();
  uint64_t v3 = *(void *)(v2 - 8);
  double v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (uint64_t *)((char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  double v7 = *(void **)(v1 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioQueue);
  *uint64_t v6 = v7;
  (*(void (**)(void *, void, uint64_t, double))(v3 + 104))(v6, *MEMORY[0x263F8F0E8], v2, v4);
  id v8 = v7;
  LOBYTE(v7) = sub_25F3F6000();
  (*(void (**)(void *, uint64_t))(v3 + 8))(v6, v2);
  if (v7)
  {
    uint64_t v9 = OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_state;
    if (*(unsigned char *)(*(void *)(v1 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_state)
                  + OBJC_IVAR____TtCC31TextToSpeechVoiceBankingSupport17TTSVBAudioServiceP33_2F288AB684677915D8A6F8C1A2A5794F5State_audioEngineTapInstalled) == 1)
    {
      uint64_t v10 = sub_25F3EF940();
      uint64_t v11 = sub_25F3F5EA0();
      uint64_t v12 = *(void *)(v11 - 8);
      double v13 = MEMORY[0x270FA5388](v11);
      uint64_t v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, uint64_t, uint64_t, double))(v12 + 16))(v15, v10, v11, v13);
      uint64_t v16 = sub_25F3F5E80();
      os_log_type_t v17 = sub_25F3F64D0();
      if (os_log_type_enabled(v16, v17))
      {
        id v18 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v18 = 0;
        _os_log_impl(&dword_25F2F5000, v16, v17, "Removing audio tap", v18, 2u);
        MEMORY[0x2611F21E0](v18, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
      id v19 = sub_25F3D0F40();
      id v20 = objc_msgSend(v19, sel_inputNode);

      objc_msgSend(v20, sel_removeTapOnBus_, 0);
      *(unsigned char *)(*(void *)(v1 + v9)
               + OBJC_IVAR____TtCC31TextToSpeechVoiceBankingSupport17TTSVBAudioServiceP33_2F288AB684677915D8A6F8C1A2A5794F5State_audioEngineTapInstalled) = 0;
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_25F3DFD1C()
{
  uint64_t v29 = 0;
  unint64_t v30 = 0xE000000000000000;
  sub_25F3F6880();
  sub_25F3F61E0();
  objc_msgSend(v0, sel_isStandard);
  sub_25F3F61E0();
  swift_bridgeObjectRelease();
  sub_25F3F61E0();
  LODWORD(v27) = objc_msgSend(v0, sel_channelCount);
  sub_25F3F6B60();
  sub_25F3F61E0();
  swift_bridgeObjectRelease();
  sub_25F3F61E0();
  objc_msgSend(v0, sel_sampleRate);
  sub_25F3F63C0();
  sub_25F3F61E0();
  objc_msgSend(v0, sel_isInterleaved);
  sub_25F3F61E0();
  swift_bridgeObjectRelease();
  sub_25F3F61E0();
  objc_msgSend(v0, sel_commonFormat);
  sub_25F3F61E0();
  swift_bridgeObjectRelease();
  uint64_t v32 = 0;
  unint64_t v33 = 0xE000000000000000;
  id v1 = objc_msgSend(v0, sel_settings);
  uint64_t v2 = sub_25F3F6040();

  int64_t v3 = 0;
  uint64_t v22 = v2 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(v2 + 64);
  int64_t v23 = (unint64_t)(v4 + 63) >> 6;
  while (1)
  {
    if (v6)
    {
      unint64_t v7 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v8 = v7 | (v3 << 6);
LABEL_7:
      uint64_t v9 = *(void *)(v2 + 56);
      uint64_t v10 = (void *)(*(void *)(v2 + 48) + 16 * v8);
      uint64_t v11 = v10[1];
      *(void *)&long long v27 = *v10;
      *((void *)&v27 + 1) = v11;
      sub_25F301A40(v9 + 32 * v8, (uint64_t)v28);
      swift_bridgeObjectRetain();
      goto LABEL_26;
    }
    int64_t v12 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
LABEL_39:
      __break(1u);
      JUMPOUT(0x25F3E0380);
    }
    if (v12 < v23)
    {
      unint64_t v13 = *(void *)(v22 + 8 * v12);
      if (v13) {
        goto LABEL_11;
      }
      int64_t v14 = v3 + 2;
      ++v3;
      if (v12 + 1 < v23)
      {
        unint64_t v13 = *(void *)(v22 + 8 * v14);
        if (v13) {
          goto LABEL_14;
        }
        int64_t v3 = v12 + 1;
        if (v12 + 2 < v23)
        {
          unint64_t v13 = *(void *)(v22 + 8 * (v12 + 2));
          if (v13)
          {
            v12 += 2;
            goto LABEL_11;
          }
          int64_t v14 = v12 + 3;
          int64_t v3 = v12 + 2;
          if (v12 + 3 < v23)
          {
            unint64_t v13 = *(void *)(v22 + 8 * v14);
            if (v13)
            {
LABEL_14:
              int64_t v12 = v14;
LABEL_11:
              unint64_t v6 = (v13 - 1) & v13;
              unint64_t v8 = __clz(__rbit64(v13)) + (v12 << 6);
              int64_t v3 = v12;
              goto LABEL_7;
            }
            while (1)
            {
              int64_t v12 = v14 + 1;
              if (__OFADD__(v14, 1)) {
                goto LABEL_39;
              }
              if (v12 >= v23) {
                break;
              }
              unint64_t v13 = *(void *)(v22 + 8 * v12);
              ++v14;
              if (v13) {
                goto LABEL_11;
              }
            }
            int64_t v3 = v23 - 1;
          }
        }
      }
    }
    unint64_t v6 = 0;
    memset(v28, 0, sizeof(v28));
    long long v27 = 0u;
LABEL_26:
    sub_25F307A7C((uint64_t)&v27, (uint64_t)&v29, &qword_26A78D710);
    unint64_t v15 = v30;
    if (!v30) {
      break;
    }
    uint64_t v16 = v29;
    sub_25F3237C8(&v31, &v27);
    if (v16 == sub_25F3F6130() && v17 == v15)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v19 = sub_25F3F6B80();
      swift_bridgeObjectRelease();
      if ((v19 & 1) == 0)
      {
        uint64_t v25 = 0;
        unint64_t v26 = 0xE000000000000000;
        sub_25F3F61E0();
        sub_25F3F61E0();
        swift_bridgeObjectRelease();
        sub_25F3F61E0();
        sub_25F3F6950();
        goto LABEL_36;
      }
    }
    sub_25F301A40((uint64_t)&v27, (uint64_t)&v25);
    sub_25F3236F0(0, &qword_26B398CD8);
    if ((swift_dynamicCast() & 1) == 0) {
      goto LABEL_4;
    }
    unsigned int v20 = objc_msgSend(v24, sel_unsignedIntValue);

    uint64_t v25 = 32;
    unint64_t v26 = 0xE100000000000000;
    sub_25F3F61E0();
    swift_bridgeObjectRelease();
    sub_25F3F61E0();
    sub_25F3E5D1C(v20);
    sub_25F3F61E0();
    swift_bridgeObjectRelease();
LABEL_36:
    sub_25F3F61E0();
LABEL_4:
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v27);
  }
  swift_release();
  return v32;
}

uint64_t sub_25F3E0394(int64_t a1, int64_t a2, uint64_t a3, uint64_t a4)
{
  int64_t v7 = a1;
  int64_t v8 = 0;
  int64_t v9 = a1;
  while (1)
  {
    BOOL v10 = v9 <= a2;
    if (a3 > 0) {
      BOOL v10 = v9 >= a2;
    }
    if (v10) {
      break;
    }
    BOOL v11 = __OFADD__(v9, a3);
    v9 += a3;
    if (v11) {
      int64_t v9 = (v9 >> 63) ^ 0x8000000000000000;
    }
    BOOL v11 = __OFADD__(v8++, 1);
    if (v11)
    {
      __break(1u);
      break;
    }
  }
  uint64_t v24 = MEMORY[0x263F8EE78];
  sub_25F3E744C(0, v8, 0);
  uint64_t result = v24;
  if (v8)
  {
    while (1)
    {
      BOOL v13 = v7 <= a2;
      if (a3 > 0) {
        BOOL v13 = v7 >= a2;
      }
      if (v13) {
        break;
      }
      int v14 = *(_DWORD *)(a4 + 4 * v7);
      if (__OFADD__(v7, a3)) {
        int64_t v15 = ((v7 + a3) >> 63) ^ 0x8000000000000000;
      }
      else {
        int64_t v15 = v7 + a3;
      }
      uint64_t v25 = result;
      unint64_t v17 = *(void *)(result + 16);
      unint64_t v16 = *(void *)(result + 24);
      if (v17 >= v16 >> 1)
      {
        sub_25F3E744C(v16 > 1, v17 + 1, 1);
        uint64_t result = v25;
      }
      *(void *)(result + 16) = v17 + 1;
      *(_DWORD *)(result + 4 * v17 + 32) = v14;
      int64_t v7 = v15;
      if (!--v8) {
        goto LABEL_22;
      }
    }
    __break(1u);
  }
  else
  {
    int64_t v15 = v7;
LABEL_22:
    BOOL v18 = v15 <= a2;
    if (a3 > 0) {
      BOOL v18 = v15 >= a2;
    }
    if (!v18)
    {
      unint64_t v19 = *(void *)(result + 16);
      do
      {
        if (__OFADD__(v15, a3)) {
          int64_t v20 = ((v15 + a3) >> 63) ^ 0x8000000000000000;
        }
        else {
          int64_t v20 = v15 + a3;
        }
        int v21 = *(_DWORD *)(a4 + 4 * v15);
        uint64_t v26 = result;
        unint64_t v22 = *(void *)(result + 24);
        if (v19 >= v22 >> 1)
        {
          sub_25F3E744C(v22 > 1, v19 + 1, 1);
          uint64_t result = v26;
        }
        *(void *)(result + 16) = v19 + 1;
        *(_DWORD *)(result + 4 * v19 + 32) = v21;
        BOOL v23 = v20 <= a2;
        if (a3 > 0) {
          BOOL v23 = v20 >= a2;
        }
        ++v19;
        int64_t v15 = v20;
      }
      while (!v23);
    }
  }
  return result;
}

void sub_25F3E057C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(id, id))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(v7, v6);
  swift_release();
}

uint64_t TTSVBAudioService.configureAudioSessionForAudioFilePlayback(completion:)(uint64_t a1, uint64_t a2)
{
  return sub_25F3E0628(a1, a2, (uint64_t)&unk_270B97828, (uint64_t)sub_25F3E8478, (uint64_t)&block_descriptor_51);
}

uint64_t sub_25F3E0628(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v22[0] = *(void *)&v5[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioQueue];
  BOOL v10 = (void *)swift_allocObject();
  void v10[2] = v5;
  v10[3] = a1;
  v10[4] = a2;
  aBlock[4] = a4;
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_25F302590;
  aBlock[3] = a5;
  BOOL v11 = _Block_copy(aBlock);
  uint64_t v12 = sub_25F3F5FB0();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  int64_t v15 = (char *)v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v16 = v5;
  swift_retain();
  sub_25F3F5F80();
  uint64_t v17 = sub_25F3F5F70();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  int64_t v20 = (char *)v22 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22[1] = MEMORY[0x263F8EE78];
  sub_25F3E5338((unint64_t *)&unk_26B3991D0, MEMORY[0x270FCDAA0]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B3991E0);
  sub_25F335CF0((unint64_t *)&unk_26B3991F0, (uint64_t *)&unk_26B3991E0);
  sub_25F3F67A0();
  MEMORY[0x2611F0F70](0, v15, v20, v11);
  _Block_release(v11);
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  return swift_release();
}

uint64_t sub_25F3E08D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25F3DDA6C((void *)*MEMORY[0x263EF9110]);
  void v17[3] = *(void *)(a1 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_calloutQueue);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a2;
  *(void *)(v6 + 24) = a3;
  aBlock[4] = sub_25F3EAEA8;
  aBlock[5] = v6;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_25F302590;
  aBlock[3] = &block_descriptor_135;
  id v7 = _Block_copy(aBlock);
  uint64_t v8 = sub_25F3F5FB0();
  void v17[2] = v17;
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  BOOL v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  sub_25F3F5F80();
  uint64_t v12 = sub_25F3F5F70();
  v17[1] = v17;
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  int64_t v15 = (char *)v17 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  void v17[4] = MEMORY[0x263F8EE78];
  sub_25F3E5338((unint64_t *)&unk_26B3991D0, MEMORY[0x270FCDAA0]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B3991E0);
  sub_25F335CF0((unint64_t *)&unk_26B3991F0, (uint64_t *)&unk_26B3991E0);
  sub_25F3F67A0();
  MEMORY[0x2611F0F70](0, v11, v15, v7);
  _Block_release(v7);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return swift_release();
}

uint64_t sub_25F3E0E44(char a1)
{
  if ((a1 & 1) == 0)
  {
    uint64_t v2 = (char *)MEMORY[0x263F8EE78];
    if ((a1 & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_7;
  }
  uint64_t v2 = sub_25F3225B8(0, 1, 1, MEMORY[0x263F8EE78]);
  unint64_t v4 = *((void *)v2 + 2);
  unint64_t v3 = *((void *)v2 + 3);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_25F3225B8((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v4 + 1;
  uint64_t v5 = &v2[16 * v4];
  strcpy(v5 + 32, "mixWithOthers");
  *((_WORD *)v5 + 23) = -4864;
  if ((a1 & 2) != 0)
  {
LABEL_7:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v2 = sub_25F3225B8(0, *((void *)v2 + 2) + 1, 1, v2);
    }
    unint64_t v7 = *((void *)v2 + 2);
    unint64_t v6 = *((void *)v2 + 3);
    if (v7 >= v6 >> 1) {
      uint64_t v2 = sub_25F3225B8((char *)(v6 > 1), v7 + 1, 1, v2);
    }
    *((void *)v2 + 2) = v7 + 1;
    uint64_t v8 = &v2[16 * v7];
    *((void *)v8 + 4) = 0x6568744F6B637564;
    *((void *)v8 + 5) = 0xEA00000000007372;
  }
LABEL_12:
  if ((a1 & 4) != 0)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v2 = sub_25F3225B8(0, *((void *)v2 + 2) + 1, 1, v2);
    }
    unint64_t v10 = *((void *)v2 + 2);
    unint64_t v9 = *((void *)v2 + 3);
    if (v10 >= v9 >> 1) {
      uint64_t v2 = sub_25F3225B8((char *)(v9 > 1), v10 + 1, 1, v2);
    }
    *((void *)v2 + 2) = v10 + 1;
    BOOL v11 = &v2[16 * v10];
    strcpy(v11 + 32, "allowBluetooth");
    v11[47] = -18;
  }
  if ((a1 & 8) != 0)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v2 = sub_25F3225B8(0, *((void *)v2 + 2) + 1, 1, v2);
    }
    unint64_t v13 = *((void *)v2 + 2);
    unint64_t v12 = *((void *)v2 + 3);
    if (v13 >= v12 >> 1) {
      uint64_t v2 = sub_25F3225B8((char *)(v12 > 1), v13 + 1, 1, v2);
    }
    *((void *)v2 + 2) = v13 + 1;
    uint64_t v14 = &v2[16 * v13];
    *((void *)v14 + 4) = 0xD000000000000010;
    *((void *)v14 + 5) = 0x800000025F4080C0;
  }
  if ((~a1 & 0x11) != 0)
  {
    if ((a1 & 0x20) == 0) {
      goto LABEL_26;
    }
  }
  else
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v2 = sub_25F3225B8(0, *((void *)v2 + 2) + 1, 1, v2);
    }
    unint64_t v18 = *((void *)v2 + 2);
    unint64_t v17 = *((void *)v2 + 3);
    if (v18 >= v17 >> 1) {
      uint64_t v2 = sub_25F3225B8((char *)(v17 > 1), v18 + 1, 1, v2);
    }
    *((void *)v2 + 2) = v18 + 1;
    uint64_t v19 = &v2[16 * v18];
    *((void *)v19 + 4) = 0xD000000000000024;
    *((void *)v19 + 5) = 0x800000025F408090;
    if ((a1 & 0x20) == 0)
    {
LABEL_26:
      if ((a1 & 0x40) == 0) {
        goto LABEL_27;
      }
      goto LABEL_41;
    }
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_25F3225B8(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v21 = *((void *)v2 + 2);
  unint64_t v20 = *((void *)v2 + 3);
  if (v21 >= v20 >> 1) {
    uint64_t v2 = sub_25F3225B8((char *)(v20 > 1), v21 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v21 + 1;
  unint64_t v22 = &v2[16 * v21];
  *((void *)v22 + 4) = 0xD000000000000012;
  *((void *)v22 + 5) = 0x800000025F408070;
  if ((a1 & 0x40) == 0)
  {
LABEL_27:
    if ((a1 & 0x80) == 0) {
      goto LABEL_28;
    }
LABEL_46:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v2 = sub_25F3225B8(0, *((void *)v2 + 2) + 1, 1, v2);
    }
    unint64_t v27 = *((void *)v2 + 2);
    unint64_t v26 = *((void *)v2 + 3);
    unint64_t v15 = v27 + 1;
    if (v27 >= v26 >> 1) {
      uint64_t v2 = sub_25F3225B8((char *)(v26 > 1), v27 + 1, 1, v2);
    }
    *((void *)v2 + 2) = v15;
    os_log_type_t v28 = &v2[16 * v27];
    *((void *)v28 + 4) = 0xD000000000000023;
    *((void *)v28 + 5) = 0x800000025F408040;
    if (v27) {
      goto LABEL_29;
    }
LABEL_51:
    uint64_t v16 = *((void *)v2 + 4);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    return v16;
  }
LABEL_41:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_25F3225B8(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v24 = *((void *)v2 + 2);
  unint64_t v23 = *((void *)v2 + 3);
  if (v24 >= v23 >> 1) {
    uint64_t v2 = sub_25F3225B8((char *)(v23 > 1), v24 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v24 + 1;
  uint64_t v25 = &v2[16 * v24];
  strcpy(v25 + 32, "allowAirPlay");
  v25[45] = 0;
  *((_WORD *)v25 + 23) = -5120;
  if (a1 < 0) {
    goto LABEL_46;
  }
LABEL_28:
  unint64_t v15 = *((void *)v2 + 2);
  if (v15 == 1) {
    goto LABEL_51;
  }
LABEL_29:
  if (v15)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B398C98);
    sub_25F335CF0((unint64_t *)&qword_26B398CA0, &qword_26B398C98);
    sub_25F3F6070();
    swift_bridgeObjectRelease();
    sub_25F3F61E0();
    swift_bridgeObjectRelease();
    sub_25F3F61E0();
    return 91;
  }
  else
  {
    swift_bridgeObjectRelease();
    return 1701736270;
  }
}

id sub_25F3E13A8()
{
  uint64_t v137 = *MEMORY[0x263EF8340];
  uint64_t v2 = sub_25F3F5FE0();
  uint64_t v3 = *(void *)(v2 - 8);
  double v4 = MEMORY[0x270FA5388](v2);
  unint64_t v6 = &v121[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  unint64_t v7 = *(void **)(v0 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioQueue);
  *unint64_t v6 = v7;
  (*(void (**)(void *, void, uint64_t, double))(v3 + 104))(v6, *MEMORY[0x263F8F0E8], v2, v4);
  id v8 = v7;
  LOBYTE(v7) = sub_25F3F6000();
  (*(void (**)(void *, uint64_t))(v3 + 8))(v6, v2);
  if ((v7 & 1) == 0) {
    goto LABEL_102;
  }
  id v136 = 0;
  id v122 = *(id *)(v0 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioSession);
  id v9 = objc_msgSend(v122, sel_availableInputs);
  if (v9)
  {
    unint64_t v10 = v9;
    sub_25F3236F0(0, &qword_26A78DBA8);
    sub_25F3F6300();
  }
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DC60);
  uint64_t inited = swift_initStackObject();
  unint64_t v12 = (void **)MEMORY[0x263EF9210];
  *(_OWORD *)(inited + 16) = xmmword_25F3FF0B0;
  unint64_t v13 = *v12;
  uint64_t v14 = (void *)*MEMORY[0x263EF9218];
  *(void *)(inited + 32) = *v12;
  *(void *)(inited + 40) = v14;
  unint64_t v15 = (void *)*MEMORY[0x263EF9230];
  uint64_t v16 = (void *)*MEMORY[0x263EF9228];
  *(void *)(inited + 48) = *MEMORY[0x263EF9230];
  *(void *)(inited + 56) = v16;
  id v17 = (id)*MEMORY[0x263EF91D8];
  id v18 = v13;
  id v19 = v14;
  id v20 = v15;
  id v21 = v16;
  unint64_t v22 = sub_25F3E6A64((void *)1, 5, 1, (void *)inited);
  void v22[2] = 5;
  v22[8] = v17;

  id v23 = objc_msgSend(v122, sel_availableInputs);
  if (v23)
  {
    unint64_t v24 = v23;
    sub_25F3236F0(0, &qword_26A78DBA8);
    unint64_t v25 = sub_25F3F6300();

    if (!(v25 >> 62)) {
      goto LABEL_6;
    }
LABEL_78:
    swift_bridgeObjectRetain();
    id v1 = sub_25F3F6980();
    swift_bridgeObjectRelease();
    if (v1) {
      goto LABEL_7;
    }
    goto LABEL_79;
  }
  unint64_t v25 = MEMORY[0x263F8EE78];
  if (MEMORY[0x263F8EE78] >> 62) {
    goto LABEL_78;
  }
LABEL_6:
  id v1 = *(NSObject **)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v1)
  {
LABEL_7:
    unint64_t v26 = 0;
    unint64_t v27 = 0;
    os_log_type_t v28 = (unsigned char *)v22[2];
    unint64_t v130 = v25 & 0xC000000000000001;
    id v127 = (unsigned char *)(v25 & 0xFFFFFFFFFFFFFF8);
    unint64_t v126 = (id *)(v25 + 32);
    uint64_t v131 = v28;
    id v123 = v28 - 2;
    os_log_t v128 = v1;
    unint64_t v125 = v25;
    while (1)
    {
      if (v130)
      {
        id v29 = (id)MEMORY[0x2611F12D0](v26, v25);
      }
      else
      {
        if ((unint64_t)v26 >= *((void *)v127 + 2)) {
          goto LABEL_97;
        }
        id v29 = v126[(void)v26];
      }
      unint64_t v30 = v29;
      BOOL v31 = __OFADD__(v26, 1);
      unint64_t v26 = ((char *)v26 + 1);
      if (v31)
      {
        __break(1u);
LABEL_96:
        __break(1u);
LABEL_97:
        __break(1u);
LABEL_98:
        __break(1u);
LABEL_99:
        __break(1u);
LABEL_100:
        __break(1u);
LABEL_101:
        __break(1u);
LABEL_102:
        __break(1u);
LABEL_103:
        swift_bridgeObjectRelease();

        __break(1u);
      }
      swift_bridgeObjectRetain();
      id v32 = objc_msgSend(v30, sel_portType);
      if (!v131)
      {
        swift_bridgeObjectRelease();
LABEL_24:

        goto LABEL_72;
      }
      if (!v22[2]) {
        goto LABEL_96;
      }
      id v132 = v27;
      uint64_t v33 = sub_25F3F6130();
      uint64_t v35 = v34;
      if (v33 == sub_25F3F6130() && v35 == v36) {
        break;
      }
      char v38 = sub_25F3F6B80();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v38)
      {
        swift_bridgeObjectRelease();

        goto LABEL_26;
      }
      if (v131 == (unsigned char *)1)
      {
        swift_bridgeObjectRelease();
        unint64_t v27 = v132;
        goto LABEL_24;
      }
      if (v22[2] < 2uLL) {
        goto LABEL_101;
      }
      uint64_t v53 = sub_25F3F6130();
      uint64_t v55 = v54;
      if (v53 == sub_25F3F6130() && v55 == v56)
      {
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease_n();
LABEL_48:
        uint64_t v39 = 1;
        goto LABEL_49;
      }
      char v58 = sub_25F3F6B80();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v58)
      {
        swift_bridgeObjectRelease();

        goto LABEL_48;
      }
      id v1 = v25;
      uint64_t v67 = 0;
      while (1)
      {
        unint64_t v68 = v67;
        if (v123 == v67)
        {
          swift_bridgeObjectRelease();
          unint64_t v25 = (unint64_t)v1;
          id v1 = v128;
          unint64_t v27 = v132;
          goto LABEL_24;
        }
        if ((unint64_t)(v67 + 2) >= v22[2]) {
          goto LABEL_99;
        }
        uint64_t v69 = sub_25F3F6130();
        uint64_t v71 = v70;
        if (v69 == sub_25F3F6130() && v71 == v72) {
          break;
        }
        char v74 = sub_25F3F6B80();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v67 = v68 + 1;
        if (v74)
        {
          swift_bridgeObjectRelease();

          goto LABEL_76;
        }
      }
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease_n();
LABEL_76:
      uint64_t v39 = (uint64_t)(v68 + 2);
      unint64_t v25 = (unint64_t)v1;
LABEL_49:
      id v1 = v128;
      uint64_t v40 = v132;
      if (v132)
      {
LABEL_27:
        os_log_t v129 = (void (*)(unsigned char *, void *))v39;
        swift_bridgeObjectRetain();
        id v41 = v40;
        id v1 = objc_msgSend(v41, sel_portType);
        uint64_t v42 = v22[2];
        if (!v42) {
          goto LABEL_103;
        }
        uint64_t v43 = sub_25F3F6130();
        uint64_t v45 = v44;
        if (v43 == sub_25F3F6130() && v45 == v46)
        {
          swift_bridgeObjectRelease();

          swift_bridgeObjectRelease_n();
          uint64_t v47 = 0;
        }
        else
        {
          char v48 = sub_25F3F6B80();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v48)
          {
            swift_bridgeObjectRelease();

            uint64_t v47 = 0;
          }
          else
          {
            if (v42 == 1) {
              goto LABEL_103;
            }
            if (v22[2] < 2uLL) {
              goto LABEL_100;
            }
            uint64_t v49 = sub_25F3F6130();
            uint64_t v51 = v50;
            if (v49 == sub_25F3F6130() && v51 == v52)
            {
              swift_bridgeObjectRelease();

              swift_bridgeObjectRelease_n();
              uint64_t v47 = 1;
            }
            else
            {
              char v57 = sub_25F3F6B80();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              if (v57)
              {
                swift_bridgeObjectRelease();

                uint64_t v47 = 1;
              }
              else
              {
                uint64_t v59 = 0;
                uint64_t v124 = v42 - 2;
                while (1)
                {
                  uint64_t v60 = v59;
                  if (v124 == v59) {
                    goto LABEL_103;
                  }
                  if ((unint64_t)(v59 + 2) >= v22[2]) {
                    goto LABEL_98;
                  }
                  uint64_t v61 = sub_25F3F6130();
                  uint64_t v63 = v62;
                  if (v61 == sub_25F3F6130() && v63 == v64) {
                    break;
                  }
                  char v66 = sub_25F3F6B80();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  uint64_t v59 = v60 + 1;
                  if (v66)
                  {
                    swift_bridgeObjectRelease();

                    goto LABEL_70;
                  }
                }
                swift_bridgeObjectRelease();

                swift_bridgeObjectRelease_n();
LABEL_70:
                uint64_t v47 = v60 + 2;
              }
            }
          }
        }
        unint64_t v27 = v132;

        unint64_t v25 = v125;
        id v1 = v128;
        if ((uint64_t)v129 < v47)
        {

          goto LABEL_9;
        }
LABEL_72:

        if (v26 == v1) {
          goto LABEL_79;
        }
      }
      else
      {
LABEL_9:
        id v136 = v30;
        unint64_t v27 = v30;
        if (v26 == v1) {
          goto LABEL_79;
        }
      }
    }
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease_n();
LABEL_26:
    uint64_t v39 = 0;
    uint64_t v40 = v132;
    if (!v132) {
      goto LABEL_9;
    }
    goto LABEL_27;
  }
LABEL_79:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v75 = sub_25F3EF940();
  uint64_t v76 = sub_25F3F5EA0();
  os_log_t v77 = *(void **)(v76 - 8);
  id v78 = v77[8];
  double v79 = MEMORY[0x270FA5388](v76);
  id v80 = &v121[-(((unint64_t)&v78[1].isa + 7) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v131 = (unsigned char *)v77[2];
  ((void (*)(unsigned char *, uint64_t, uint64_t, double))v131)(v80, v75, v76, v79);
  uint64_t v81 = sub_25F3F5E80();
  os_log_type_t v82 = sub_25F3F64D0();
  BOOL v83 = os_log_type_enabled(v81, v82);
  id v132 = v77 + 2;
  if (v83)
  {
    id v127 = v121;
    os_log_t v128 = v78;
    os_log_t v129 = (void (*)(unsigned char *, void *))v75;
    unint64_t v130 = (unint64_t)v77;
    uint64_t v84 = (uint8_t *)swift_slowAlloc();
    uint64_t v85 = swift_slowAlloc();
    v135[0] = v85;
    *(_DWORD *)uint64_t v84 = 136315138;
    swift_beginAccess();
    if (v136)
    {
      id v86 = v136;
      id v87 = objc_msgSend(v86, sel_portName);
      unint64_t v126 = (id *)v85;
      uint64_t v88 = v76;
      id v89 = v87;
      uint64_t v90 = sub_25F3F6130();
      unint64_t v92 = v91;

      uint64_t v76 = v88;
      uint64_t v85 = (uint64_t)v126;
    }
    else
    {
      uint64_t v90 = 7104878;
      unint64_t v92 = 0xE300000000000000;
    }
    id v134 = (id)sub_25F2FE464(v90, v92, v135);
    sub_25F3F66A0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25F2F5000, v81, v82, "Will set preferred input: %s", v84, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611F21E0](v85, -1, -1);
    MEMORY[0x2611F21E0](v84, -1, -1);

    os_log_t v77 = (void *)v130;
    unint64_t v93 = *(void (**)(unsigned char *, uint64_t))(v130 + 8);
    v93(v80, v76);
    uint64_t v75 = (uint64_t)v129;
    id v78 = v128;
  }
  else
  {

    unint64_t v93 = (void (*)(unsigned char *, uint64_t))v77[1];
    v93(&v121[-(((unint64_t)&v78[1].isa + 7) & 0xFFFFFFFFFFFFFFF0)], v76);
  }
  swift_beginAccess();
  id v94 = v136;
  id v134 = 0;
  if (objc_msgSend(v122, sel_setPreferredInput_error_, v136, &v134))
  {
    id v95 = v134;
  }
  else
  {
    id v96 = v134;
    uint64_t v97 = (void *)sub_25F3F5980();

    uint64_t v98 = swift_willThrow();
    double v99 = MEMORY[0x270FA5388](v98);
    uint64_t v100 = &v121[-(((unint64_t)&v78[1].isa + 7) & 0xFFFFFFFFFFFFFFF0)];
    ((void (*)(unsigned char *, uint64_t, uint64_t, double))v131)(v100, v75, v76, v99);
    id v101 = v97;
    id v102 = v97;
    unint64_t v103 = sub_25F3F5E80();
    int v104 = sub_25F3F64C0();
    if (os_log_type_enabled(v103, (os_log_type_t)v104))
    {
      LODWORD(v127) = v104;
      os_log_t v128 = v103;
      unint64_t v130 = (unint64_t)v77;
      uint64_t v131 = v121;
      id v132 = (void *)v76;
      double v105 = v97;
      uint64_t v106 = swift_slowAlloc();
      unint64_t v126 = (id *)swift_slowAlloc();
      id v134 = v126;
      *(_DWORD *)uint64_t v106 = 136315394;
      os_log_t v129 = (void (*)(unsigned char *, void *))v93;
      if (v136)
      {
        id v107 = v136;
        id v108 = objc_msgSend(v107, sel_portName);
        uint64_t v109 = sub_25F3F6130();
        unint64_t v111 = v110;
      }
      else
      {
        uint64_t v109 = 7104878;
        unint64_t v111 = 0xE300000000000000;
      }
      uint64_t v133 = sub_25F2FE464(v109, v111, (uint64_t *)&v134);
      sub_25F3F66A0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v106 + 12) = 2080;
      uint64_t v112 = v105;
      uint64_t v113 = (void *)sub_25F3F5970();
      id v114 = objc_msgSend(v113, sel_description);

      uint64_t v115 = sub_25F3F6130();
      unint64_t v117 = v116;

      uint64_t v133 = sub_25F2FE464(v115, v117, (uint64_t *)&v134);
      sub_25F3F66A0();
      swift_bridgeObjectRelease();

      os_log_t v118 = v128;
      _os_log_impl(&dword_25F2F5000, v128, (os_log_type_t)v127, "Could not set preferred input: %s. Error=%s", (uint8_t *)v106, 0x16u);
      uint64_t v119 = v126;
      swift_arrayDestroy();
      MEMORY[0x2611F21E0](v119, -1, -1);
      MEMORY[0x2611F21E0](v106, -1, -1);

      v129(v100, v132);
    }
    else
    {

      v93(v100, v76);
    }
    swift_willThrow();
  }
  return v94;
}

void sub_25F3E2244(id a1)
{
  v202[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v5 = sub_25F3F5FE0();
  uint64_t v6 = *(void *)(v5 - 8);
  double v7 = MEMORY[0x270FA5388](v5);
  unint64_t v9 = (unint64_t)&v181 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = *(void **)(v1 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioQueue);
  *(void *)unint64_t v9 = v10;
  (*(void (**)(unint64_t, void, uint64_t, double))(v6 + 104))(v9, *MEMORY[0x263F8F0E8], v5, v7);
  id v11 = v10;
  LOBYTE(v10) = sub_25F3F6000();
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v9, v5);
  if ((v10 & 1) == 0)
  {
    __break(1u);
    goto LABEL_35;
  }
  id v12 = (id)*sub_25F3486EC();
  id v13 = NSUserDefaults.ttsvb_overrideBuiltInMicPolarPattern.getter();

  int v14 = TTSVBIsInternalUIBuild();
  id v182 = a1;
  id v183 = v13;
  if (v14 && v13)
  {
    uint64_t v15 = sub_25F3EF940();
    uint64_t v16 = sub_25F3F5EA0();
    uint64_t v17 = *(void *)(v16 - 8);
    double v18 = MEMORY[0x270FA5388](v16);
    id v20 = (char *)&v181 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, uint64_t, uint64_t, double))(v17 + 16))(v20, v15, v16, v18);
    id v21 = v13;
    unint64_t v22 = sub_25F3F5E80();
    os_log_type_t v23 = sub_25F3F64A0();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = swift_slowAlloc();
      v200 = &v181;
      unint64_t v25 = (uint8_t *)v24;
      unint64_t v26 = (void *)swift_slowAlloc();
      id v199 = (uint64_t *)v16;
      unint64_t v27 = v26;
      v202[0] = v26;
      *(_DWORD *)unint64_t v25 = 136315138;
      uint64_t v198 = v25 + 4;
      uint64_t v28 = sub_25F3F6130();
      uint64_t v201 = sub_25F2FE464(v28, v29, (uint64_t *)v202);
      sub_25F3F66A0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25F2F5000, v22, v23, "Will consider override polar pattern: %s", v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611F21E0](v27, -1, -1);
      MEMORY[0x2611F21E0](v25, -1, -1);

      (*(void (**)(char *, uint64_t *))(v17 + 8))(v20, v199);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v17 + 8))(v20, v16);
    }
    unsigned int v37 = v21;
    a1 = v182;
  }
  else
  {
    id v30 = (id)*MEMORY[0x263EF9198];
    uint64_t v31 = sub_25F3EF940();
    uint64_t v32 = sub_25F3F5EA0();
    uint64_t v33 = *(void *)(v32 - 8);
    double v34 = MEMORY[0x270FA5388](v32);
    uint64_t v36 = (char *)&v181 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, uint64_t, uint64_t, double))(v33 + 16))(v36, v31, v32, v34);
    unsigned int v37 = v30;
    char v38 = sub_25F3F5E80();
    os_log_type_t v39 = sub_25F3F64A0();
    if (os_log_type_enabled(v38, v39))
    {
      os_log_t v184 = v37;
      uint64_t v40 = (uint8_t *)swift_slowAlloc();
      id v41 = (void *)swift_slowAlloc();
      v200 = &v181;
      uint64_t v42 = v41;
      v202[0] = v41;
      *(_DWORD *)uint64_t v40 = 136315138;
      uint64_t v43 = sub_25F3F6130();
      id v199 = (uint64_t *)v32;
      uint64_t v201 = sub_25F2FE464(v43, v44, (uint64_t *)v202);
      unsigned int v37 = v184;
      sub_25F3F66A0();

      a1 = v182;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25F2F5000, v38, v39, "Will consider default polar pattern: %s", v40, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611F21E0](v42, -1, -1);
      MEMORY[0x2611F21E0](v40, -1, -1);

      (*(void (**)(char *, uint64_t *))(v33 + 8))(v36, v199);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v33 + 8))(v36, v32);
    }
  }
  id v45 = objc_msgSend(a1, sel_portType);
  uint64_t v46 = sub_25F3F6130();
  uint64_t v48 = v47;
  if (v46 == sub_25F3F6130() && v48 == v49)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v50 = sub_25F3F6B80();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v50 & 1) == 0)
    {
      uint64_t v85 = sub_25F3EF940();
      uint64_t v86 = sub_25F3F5EA0();
      uint64_t v87 = *(void *)(v86 - 8);
      double v88 = MEMORY[0x270FA5388](v86);
      uint64_t v90 = (char *)&v181 - ((v89 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, uint64_t, uint64_t, double))(v87 + 16))(v90, v85, v86, v88);
      id v91 = a1;
      unint64_t v92 = sub_25F3F5E80();
      os_log_type_t v93 = sub_25F3F64B0();
      if (os_log_type_enabled(v92, v93))
      {
        v200 = &v181;
        id v94 = (uint8_t *)swift_slowAlloc();
        uint64_t v198 = (void *)swift_slowAlloc();
        v202[0] = v198;
        os_log_t v184 = v37;
        *(_DWORD *)id v94 = 136315138;
        v196 = (void (*)(char *, void *, uint64_t, double))(v94 + 4);
        v197 = v94;
        id v95 = objc_msgSend(v91, sel_portName);
        id v199 = (uint64_t *)v86;
        id v96 = v95;
        uint64_t v97 = sub_25F3F6130();
        unint64_t v99 = v98;

        uint64_t v201 = sub_25F2FE464(v97, v99, (uint64_t *)v202);
        sub_25F3F66A0();

        swift_bridgeObjectRelease();
        uint64_t v100 = v197;
        _os_log_impl(&dword_25F2F5000, v92, v93, "Will not set polar pattern. input is not built-in mic: %s", v197, 0xCu);
        id v101 = v198;
        swift_arrayDestroy();
        MEMORY[0x2611F21E0](v101, -1, -1);
        MEMORY[0x2611F21E0](v100, -1, -1);

        (*(void (**)(char *, uint64_t *))(v87 + 8))(v90, v199);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v87 + 8))(v90, v86);
      }
      return;
    }
  }
  id v51 = objc_msgSend(a1, sel_dataSources);
  os_log_t v184 = v37;
  if (v51)
  {
    uint64_t v52 = v51;
    sub_25F3236F0(0, &qword_26A78DC58);
    unint64_t v189 = sub_25F3F6300();
  }
  else
  {
    unint64_t v189 = MEMORY[0x263F8EE78];
  }
  uint64_t v53 = sub_25F3EF940();
  uint64_t v2 = sub_25F3F5EA0();
  uint64_t v54 = *(void *)(v2 - 8);
  double v55 = MEMORY[0x270FA5388](v2);
  char v57 = (char *)&v181 - ((v56 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v58 = *(void (**)(char *, void *, uint64_t, double))(v54 + 16);
  v197 = (uint8_t *)(v54 + 16);
  uint64_t v198 = (void *)v53;
  uint64_t v195 = v56;
  v196 = v58;
  v58(v57, (void *)v53, v2, v55);
  uint64_t v59 = sub_25F3F5E80();
  os_log_type_t v60 = sub_25F3F64B0();
  if (os_log_type_enabled(v59, v60))
  {
    uint64_t v61 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v61 = 0;
    _os_log_impl(&dword_25F2F5000, v59, v60, "Available datasources for built-in mic:", v61, 2u);
    MEMORY[0x2611F21E0](v61, -1, -1);
  }

  uint64_t v62 = *(void (**)(void, void))(v54 + 8);
  uint64_t v3 = v54 + 8;
  a1 = v62;
  v62(v57, v2);
  unint64_t v9 = v189;
  if (v189 >> 62)
  {
LABEL_35:
    swift_bridgeObjectRetain();
    uint64_t v63 = sub_25F3F6980();
    uint64_t v190 = v3;
    if (v63) {
      goto LABEL_22;
    }
    goto LABEL_36;
  }
  uint64_t v63 = *(void *)((v189 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  uint64_t v190 = v3;
  if (v63)
  {
LABEL_22:
    if (v63 < 1) {
      __break(1u);
    }
    unint64_t v65 = 0;
    id v193 = (id)(v9 & 0xC000000000000001);
    *(void *)&long long v64 = 136315138;
    long long v187 = v64;
    uint64_t v186 = MEMORY[0x263F8EE58] + 8;
    id v194 = (id)v63;
    uint64_t v188 = v2;
    do
    {
      if (v193) {
        id v66 = (id)MEMORY[0x2611F12D0](v65, v9);
      }
      else {
        id v66 = *(id *)(v9 + 8 * (void)v65 + 32);
      }
      uint64_t v67 = v66;
      v200 = &v181;
      double v68 = MEMORY[0x270FA5388](v66);
      uint64_t v70 = (char *)&v181 - ((v69 + 15) & 0xFFFFFFFFFFFFFFF0);
      v196(v70, v198, v2, v68);
      id v71 = v67;
      uint64_t v72 = sub_25F3F5E80();
      os_log_type_t v73 = sub_25F3F64B0();
      LODWORD(v199) = v73;
      if (os_log_type_enabled(v72, v73))
      {
        uint64_t v74 = swift_slowAlloc();
        uint64_t v192 = (void *)swift_slowAlloc();
        v202[0] = v192;
        *(_DWORD *)uint64_t v74 = v187;
        id v75 = objc_msgSend(v71, sel_dataSourceName);
        os_log_t v191 = v72;
        id v76 = v75;
        uint64_t v77 = sub_25F3F6130();
        unint64_t v79 = v78;

        uint64_t v80 = v77;
        id v81 = a1;
        unint64_t v9 = v189;
        *(void *)(v74 + 4) = sub_25F2FE464(v80, v79, (uint64_t *)v202);

        uint64_t v2 = v188;
        swift_bridgeObjectRelease();
        os_log_t v82 = v191;
        uint64_t v83 = v74;
        _os_log_impl(&dword_25F2F5000, v191, (os_log_type_t)v199, "  - %s", (uint8_t *)v74, 0xCu);
        uint64_t v84 = v192;
        swift_arrayDestroy();
        MEMORY[0x2611F21E0](v84, -1, -1);
        MEMORY[0x2611F21E0](v83, -1, -1);

        a1 = v81;
      }
      else
      {
      }
      ((void (*)(char *, uint64_t))a1)(v70, v2);
      unint64_t v65 = (char *)v65 + 1;
    }
    while (v194 != v65);
  }
LABEL_36:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v102 = v185;
  unint64_t v103 = sub_25F3E7A68(v9, 0x746E6F7246, 0xE500000000000000);
  uint64_t v185 = v102;
  swift_bridgeObjectRelease();
  uint64_t v104 = swift_bridgeObjectRelease();
  if (v103)
  {
    v200 = (uint64_t *)a1;
    id v105 = objc_msgSend(v103, sel_supportedPolarPatterns);
    if (v105)
    {
      uint64_t v106 = v105;
      type metadata accessor for PolarPattern(0);
      uint64_t v107 = sub_25F3F6300();
    }
    else
    {
      uint64_t v107 = MEMORY[0x263F8EE78];
    }
    id v116 = (id)*MEMORY[0x263EF9198];
    char v117 = sub_25F3E3C00((uint64_t)v116, v107);
    swift_bridgeObjectRelease();

    id v199 = &v181;
    double v119 = MEMORY[0x270FA5388](v118);
    unint64_t v121 = (char *)&v181 - ((v120 + 15) & 0xFFFFFFFFFFFFFFF0);
    v196(v121, v198, v2, v119);
    if (v117)
    {
      id v122 = v184;
      id v123 = v182;
      id v124 = v103;
      os_log_t v125 = v122;
      id v126 = v123;
      id v127 = v124;
      os_log_t v128 = sub_25F3F5E80();
      os_log_type_t v129 = sub_25F3F64D0();
      LODWORD(v192) = v129;
      if (os_log_type_enabled(v128, v129))
      {
        uint64_t v130 = swift_slowAlloc();
        id v194 = v126;
        uint64_t v131 = v130;
        unint64_t v189 = swift_slowAlloc();
        v202[0] = (id)v189;
        *(_DWORD *)uint64_t v131 = 136315650;
        id v193 = v127;
        uint64_t v132 = sub_25F3F6130();
        uint64_t v201 = sub_25F2FE464(v132, v133, (uint64_t *)v202);
        sub_25F3F66A0();

        swift_bridgeObjectRelease();
        *(_WORD *)(v131 + 12) = 2080;
        id v134 = objc_msgSend(v194, sel_portName);
        uint64_t v135 = sub_25F3F6130();
        uint64_t v188 = v2;
        uint64_t v136 = v135;
        os_log_t v191 = v125;
        unint64_t v138 = v137;

        uint64_t v201 = sub_25F2FE464(v136, v138, (uint64_t *)v202);
        sub_25F3F66A0();

        swift_bridgeObjectRelease();
        *(_WORD *)(v131 + 22) = 2080;
        id v139 = objc_msgSend(v193, sel_dataSourceName);
        uint64_t v140 = sub_25F3F6130();
        unint64_t v142 = v141;

        id v127 = v193;
        uint64_t v201 = sub_25F2FE464(v140, v142, (uint64_t *)v202);
        os_log_t v125 = v191;
        sub_25F3F66A0();

        uint64_t v2 = v188;
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25F2F5000, v128, (os_log_type_t)v192, "Will set preferred polor pattern to %s: input=%s datasource=%s", (uint8_t *)v131, 0x20u);
        unint64_t v143 = v128;
        unint64_t v144 = v189;
        swift_arrayDestroy();
        MEMORY[0x2611F21E0](v144, -1, -1);
        uint64_t v145 = v131;
        id v126 = v194;
        MEMORY[0x2611F21E0](v145, -1, -1);
      }
      else
      {
      }
      ((void (*)(char *, uint64_t))v200)(v121, v2);
      v202[0] = 0;
      unsigned int v150 = objc_msgSend(v127, sel_setPreferredPolarPattern_error_, v116, v202);
      id v151 = v202[0];
      if (v150
        && (v202[0] = 0,
            id v152 = v151,
            unsigned int v153 = objc_msgSend(v126, sel_setPreferredDataSource_error_, v127, v202),
            id v151 = v202[0],
            v153))
      {
        id v154 = v202[0];
      }
      else
      {
        id v155 = v151;
        uint64_t v156 = (void *)sub_25F3F5980();

        uint64_t v157 = swift_willThrow();
        double v158 = MEMORY[0x270FA5388](v157);
        uint64_t v160 = (char *)&v181 - ((v159 + 15) & 0xFFFFFFFFFFFFFFF0);
        v196(v160, v198, v2, v158);
        uint64_t v161 = v125;
        id v162 = v156;
        uint64_t v163 = v161;
        id v164 = v156;
        double v165 = sub_25F3F5E80();
        os_log_type_t v166 = sub_25F3F64C0();
        int v167 = v166;
        if (os_log_type_enabled(v165, v166))
        {
          uint64_t v168 = swift_slowAlloc();
          id v199 = &v181;
          uint64_t v169 = v168;
          uint64_t v198 = (void *)swift_slowAlloc();
          v202[0] = v198;
          *(_DWORD *)uint64_t v169 = 136315394;
          uint64_t v188 = v2;
          uint64_t v170 = sub_25F3F6130();
          uint64_t v201 = sub_25F2FE464(v170, v171, (uint64_t *)v202);
          id v193 = v127;
          sub_25F3F66A0();

          swift_bridgeObjectRelease();
          *(_WORD *)(v169 + 12) = 2080;
          v196 = (void (*)(char *, void *, uint64_t, double))(v169 + 14);
          id v172 = (void *)sub_25F3F5970();
          id v173 = objc_msgSend(v172, sel_description);
          LODWORD(v197) = v167;
          id v174 = v173;

          uint64_t v175 = sub_25F3F6130();
          unint64_t v177 = v176;

          uint64_t v201 = sub_25F2FE464(v175, v177, (uint64_t *)v202);
          id v127 = v193;
          sub_25F3F66A0();
          swift_bridgeObjectRelease();

          _os_log_impl(&dword_25F2F5000, v165, (os_log_type_t)v197, "Could not set polar pattern to %s. Error=%s", (uint8_t *)v169, 0x16u);
          unint64_t v178 = v198;
          swift_arrayDestroy();
          MEMORY[0x2611F21E0](v178, -1, -1);
          MEMORY[0x2611F21E0](v169, -1, -1);

          unint64_t v179 = v160;
          uint64_t v180 = v188;
        }
        else
        {

          unint64_t v179 = v160;
          uint64_t v180 = v2;
        }
        ((void (*)(char *, uint64_t))v200)(v179, v180);
        swift_willThrow();
      }
    }
    else
    {
      double v146 = sub_25F3F5E80();
      os_log_type_t v147 = sub_25F3F64B0();
      if (os_log_type_enabled(v146, v147))
      {
        uint64_t v148 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v148 = 0;
        _os_log_impl(&dword_25F2F5000, v146, v147, "Will not set polar pattern. Datasource does not support this pattern", v148, 2u);
        MEMORY[0x2611F21E0](v148, -1, -1);
        uint64_t v149 = v184;
      }
      else
      {
        uint64_t v149 = v146;
        double v146 = v184;
      }

      ((void (*)(char *, uint64_t))v200)(v121, v2);
    }
  }
  else
  {
    double v108 = MEMORY[0x270FA5388](v104);
    unint64_t v110 = (char *)&v181 - ((v109 + 15) & 0xFFFFFFFFFFFFFFF0);
    v196(v110, v198, v2, v108);
    swift_bridgeObjectRetain_n();
    unint64_t v111 = sub_25F3F5E80();
    os_log_type_t v112 = sub_25F3F64B0();
    if (os_log_type_enabled(v111, v112))
    {
      uint64_t v113 = swift_slowAlloc();
      v200 = (uint64_t *)a1;
      id v114 = (uint8_t *)v113;
      uint64_t v115 = (void *)swift_slowAlloc();
      v202[0] = v115;
      *(_DWORD *)id v114 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v201 = sub_25F2FE464(0x746E6F7246, 0xE500000000000000, (uint64_t *)v202);
      sub_25F3F66A0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25F2F5000, v111, v112, "Will not set polar pattern. No datasource name matching '%s'", v114, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611F21E0](v115, -1, -1);
      MEMORY[0x2611F21E0](v114, -1, -1);

      ((void (*)(char *, uint64_t))v200)(v110, v2);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      ((void (*)(char *, uint64_t))a1)(v110, v2);
    }
  }
}

void sub_25F3E3844()
{
  unint64_t v1 = sub_25F3F5FE0();
  uint64_t v2 = *(void *)(v1 - 8);
  double v3 = MEMORY[0x270FA5388](v1);
  uint64_t v5 = (void *)((char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = *(void **)(v0 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioQueue);
  *uint64_t v5 = v6;
  (*(void (**)(void *, void, unint64_t, double))(v2 + 104))(v5, *MEMORY[0x263F8F0E8], v1, v3);
  id v7 = v6;
  LOBYTE(v6) = sub_25F3F6000();
  (*(void (**)(void *, unint64_t))(v2 + 8))(v5, v1);
  if ((v6 & 1) == 0)
  {
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_25F3F6980();
    swift_bridgeObjectRelease();
    if (!v11) {
      goto LABEL_8;
    }
    goto LABEL_4;
  }
  uint64_t v8 = *(void **)(v0 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioSession);
  swift_retain();
  id v9 = objc_msgSend(v8, sel_currentRoute);
  id v10 = objc_msgSend(v9, sel_inputs);

  sub_25F3236F0(0, &qword_26A78DBA8);
  unint64_t v1 = sub_25F3F6300();

  if (v1 >> 62) {
    goto LABEL_10;
  }
  uint64_t v11 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v11)
  {
LABEL_8:
    swift_bridgeObjectRelease();
    v13[1] = v11;
    sub_25F3F5F00();
    swift_release();
    return;
  }
LABEL_4:
  if ((v1 & 0xC000000000000001) != 0)
  {
    id v12 = (id)MEMORY[0x2611F12D0](0, v1);
    goto LABEL_7;
  }
  if (*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v12 = *(id *)(v1 + 32);
LABEL_7:
    uint64_t v11 = (uint64_t)v12;
    goto LABEL_8;
  }
  __break(1u);
}

uint64_t sub_25F3E3A78()
{
  unint64_t v1 = v0;
  sub_25F3F6880();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_inputs);
  sub_25F3236F0(0, &qword_26A78DBA8);
  unint64_t v3 = sub_25F3F6300();

  sub_25F3E60E8(v3);
  swift_bridgeObjectRelease();
  sub_25F3F61E0();
  swift_bridgeObjectRelease();
  sub_25F3F61E0();
  id v4 = objc_msgSend(v1, sel_outputs);
  unint64_t v5 = sub_25F3F6300();

  sub_25F3E60E8(v5);
  swift_bridgeObjectRelease();
  sub_25F3F61E0();
  swift_bridgeObjectRelease();
  sub_25F3F61E0();
  return 0x6E492D6574756F52;
}

uint64_t sub_25F3E3C00(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_25F3F6130();
  uint64_t v5 = v4;
  if (v3 == sub_25F3F6130() && v5 == v6)
  {
LABEL_20:
    swift_bridgeObjectRelease_n();
    return 1;
  }
  char v8 = sub_25F3F6B80();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if (v8)
  {
LABEL_7:
    swift_bridgeObjectRelease();
    return 1;
  }
  if (v2 == 1)
  {
LABEL_17:
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v10 = 5;
  while (1)
  {
    uint64_t v11 = v10 - 3;
    if (__OFADD__(v10 - 4, 1)) {
      break;
    }
    uint64_t v12 = sub_25F3F6130();
    uint64_t v14 = v13;
    if (v12 == sub_25F3F6130() && v14 == v15)
    {
      swift_bridgeObjectRelease();
      goto LABEL_20;
    }
    char v17 = sub_25F3F6B80();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    if (v17) {
      goto LABEL_7;
    }
    ++v10;
    if (v11 == v2) {
      goto LABEL_17;
    }
  }
  __break(1u);
  return result;
}

id TTSVBAudioService.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_25F3E3E6C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for TTSVBAudioService.AudioSessionEvent(0);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (id *)((char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_25F3E84A4(v2, (uint64_t)v6, type metadata accessor for TTSVBAudioService.AudioSessionEvent);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:

      uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DBC8);
      uint64_t v12 = (char *)v6 + *(int *)(v11 + 48);

      uint64_t v13 = sub_25F3F5CC0();
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v13 - 8) + 32))(a1, v12, v13);
    case 2u:
    case 3u:
    case 6u:
    case 7u:
    case 8u:

      id v7 = (uint64_t *)&unk_26A78DBB0;
      goto LABEL_3;
    case 4u:

      id v7 = (uint64_t *)&unk_26A78DBC0;
      goto LABEL_3;
    case 5u:

      id v7 = (uint64_t *)&unk_26A78DBB8;
      goto LABEL_3;
    default:

      id v7 = (uint64_t *)&unk_26A78DBD0;
LABEL_3:
      char v8 = (char *)v6 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(v7) + 48);
      uint64_t v9 = sub_25F3F5CC0();
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v9 - 8) + 32))(a1, v8, v9);
  }
}

unint64_t sub_25F3E404C()
{
  uint64_t v1 = type metadata accessor for TTSVBAudioService.AudioSessionEvent(0);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (id *)((char *)&v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_25F3E84A4(v0, (uint64_t)v3, type metadata accessor for TTSVBAudioService.AudioSessionEvent);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:

      uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DBC8);
      char v8 = (char *)v3 + *(int *)(v7 + 48);

      uint64_t v9 = sub_25F3F5CC0();
      (*(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
      unint64_t v6 = 0x6843206574756F52;
      break;
    case 2u:

      uint64_t v10 = (char *)v3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A78DBB0) + 48);
      uint64_t v11 = sub_25F3F5CC0();
      (*(void (**)(char *, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
      unint64_t v6 = 0xD000000000000013;
      break;
    case 3u:

      uint64_t v12 = (char *)v3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A78DBB0) + 48);
      uint64_t v13 = sub_25F3F5CC0();
      (*(void (**)(char *, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
      unint64_t v6 = 0xD000000000000014;
      break;
    case 4u:
      unint64_t v6 = 0xD000000000000017;

      uint64_t v14 = (char *)v3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A78DBC0) + 48);
      uint64_t v15 = sub_25F3F5CC0();
      (*(void (**)(char *, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
      break;
    case 5u:

      uint64_t v16 = (char *)v3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A78DBB8) + 48);
      uint64_t v17 = sub_25F3F5CC0();
      (*(void (**)(char *, uint64_t))(*(void *)(v17 - 8) + 8))(v16, v17);
      unint64_t v6 = 0xD00000000000001CLL;
      break;
    case 6u:

      double v18 = (char *)v3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A78DBB0) + 48);
      uint64_t v19 = sub_25F3F5CC0();
      (*(void (**)(char *, uint64_t))(*(void *)(v19 - 8) + 8))(v18, v19);
      unint64_t v6 = 0xD000000000000016;
      break;
    case 7u:
      unint64_t v6 = 0xD000000000000017;

      id v20 = (char *)v3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A78DBB0) + 48);
      uint64_t v21 = sub_25F3F5CC0();
      (*(void (**)(char *, uint64_t))(*(void *)(v21 - 8) + 8))(v20, v21);
      break;
    case 8u:

      unint64_t v22 = (char *)v3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A78DBB0) + 48);
      uint64_t v23 = sub_25F3F5CC0();
      (*(void (**)(char *, uint64_t))(*(void *)(v23 - 8) + 8))(v22, v23);
      unint64_t v6 = 0xD000000000000025;
      break;
    default:

      uint64_t v4 = (char *)v3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A78DBD0) + 48);
      uint64_t v5 = sub_25F3F5CC0();
      (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
      unint64_t v6 = 0x7075727265746E49;
      break;
  }
  return v6;
}

uint64_t sub_25F3E451C()
{
  uint64_t v1 = type metadata accessor for TTSVBAudioService.AudioSessionEvent(0);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (id *)((char *)&v40 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_25F3E84A4(v0, (uint64_t)v3, type metadata accessor for TTSVBAudioService.AudioSessionEvent);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:

      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DBC8);
      uint64_t v16 = *(id *)((char *)v3 + *(int *)(v15 + 80));
      uint64_t v44 = 0;
      unint64_t v45 = 0xE000000000000000;
      sub_25F3F6880();
      swift_bridgeObjectRelease();
      uint64_t v44 = 0x3D6E6F73616552;
      unint64_t v45 = 0xE700000000000000;
      unint64_t v22 = (char *)v3 + *(int *)(v15 + 48);
      sub_25F3F61E0();
      swift_bridgeObjectRelease();
      sub_25F3F61E0();
      sub_25F3E3A78();
      sub_25F3F61E0();

      goto LABEL_18;
    case 2u:
    case 3u:
    case 6u:
    case 7u:
    case 8u:

      uint64_t v4 = (char *)v3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A78DBB0) + 48);
      uint64_t v5 = sub_25F3F5CC0();
      (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
      return 0;
    case 4u:

      uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DBC0);
      uint64_t v44 = 0x3D746E6948;
      unint64_t v45 = 0xE500000000000000;
      goto LABEL_17;
    case 5u:

      uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DBB8);
      uint64_t v44 = 0x3D64656C62616E45;
      unint64_t v45 = 0xE800000000000000;
LABEL_17:
      unint64_t v22 = (char *)v3 + *(int *)(v17 + 48);
      sub_25F3F61E0();
LABEL_18:
      swift_bridgeObjectRelease();
      uint64_t v6 = v44;
      uint64_t v23 = sub_25F3F5CC0();
      (*(void (**)(char *, uint64_t))(*(void *)(v23 - 8) + 8))(v22, v23);
      return v6;
    default:

      uint64_t v7 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26A78DBD0);
      uint64_t v8 = *(uint64_t *)((char *)v3 + v7[16]);
      char v9 = *((unsigned char *)v3 + v7[20] + 8);
      char v10 = *((unsigned char *)v3 + v7[24] + 8);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A78C900);
      uint64_t inited = swift_initStackObject();
      uint64_t v12 = (void *)inited;
      *(_OWORD *)(inited + 16) = xmmword_25F3F8520;
      if (v8 == 1)
      {
        unint64_t v13 = 0xE500000000000000;
        uint64_t v14 = 0x6E61676542;
      }
      else if (v8)
      {
        unint64_t v13 = 0xE700000000000000;
        uint64_t v14 = 0x6E776F6E6B6E55;
      }
      else
      {
        unint64_t v13 = 0xE500000000000000;
        uint64_t v14 = 0x6465646E45;
      }
      *(void *)(inited + 32) = v14;
      *(void *)(inited + 40) = v13;
      uint64_t v43 = v14;
      if (v9)
      {
        uint64_t v18 = 0;
        unint64_t v19 = 0;
      }
      else
      {
        uint64_t v44 = 0x3D736E6F6974704FLL;
        unint64_t v45 = 0xE800000000000000;
        sub_25F3F61E0();
        swift_bridgeObjectRelease();
        uint64_t v18 = v44;
        unint64_t v19 = v45;
      }
      v12[6] = v18;
      v12[7] = v19;
      uint64_t v41 = v18;
      uint64_t v42 = v7;
      if (v10)
      {
        uint64_t v20 = 0;
        unint64_t v21 = 0;
      }
      else
      {
        uint64_t v44 = 0x3D6E6F73616552;
        unint64_t v45 = 0xE700000000000000;
        sub_25F3F61E0();
        swift_bridgeObjectRelease();
        uint64_t v20 = v44;
        unint64_t v21 = v45;
      }
      v12[8] = v20;
      v12[9] = v21;
      swift_bridgeObjectRetain();
      uint64_t v24 = sub_25F3225B8(0, 1, 1, MEMORY[0x263F8EE78]);
      unint64_t v26 = *((void *)v24 + 2);
      unint64_t v25 = *((void *)v24 + 3);
      unint64_t v27 = v26 + 1;
      if (v26 >= v25 >> 1) {
        uint64_t v24 = sub_25F3225B8((char *)(v25 > 1), v26 + 1, 1, v24);
      }
      *((void *)v24 + 2) = v27;
      uint64_t v28 = &v24[16 * v26];
      *((void *)v28 + 4) = v43;
      *((void *)v28 + 5) = v13;
      if (!v19)
      {
        uint64_t v32 = v42;
        if (!v21) {
          goto LABEL_30;
        }
        goto LABEL_27;
      }
      unint64_t v29 = *((void *)v24 + 3);
      unint64_t v30 = v26 + 2;
      swift_bridgeObjectRetain();
      if (v27 >= v29 >> 1) {
        uint64_t v24 = sub_25F3225B8((char *)(v29 > 1), v26 + 2, 1, v24);
      }
      uint64_t v31 = v41;
      uint64_t v32 = v42;
      *((void *)v24 + 2) = v30;
      uint64_t v33 = &v24[16 * v27];
      *((void *)v33 + 4) = v31;
      *((void *)v33 + 5) = v19;
      if (v21)
      {
LABEL_27:
        unint64_t v35 = *((void *)v24 + 2);
        unint64_t v34 = *((void *)v24 + 3);
        swift_bridgeObjectRetain();
        if (v35 >= v34 >> 1) {
          uint64_t v24 = sub_25F3225B8((char *)(v34 > 1), v35 + 1, 1, v24);
        }
        *((void *)v24 + 2) = v35 + 1;
        uint64_t v36 = &v24[16 * v35];
        *((void *)v36 + 4) = v20;
        *((void *)v36 + 5) = v21;
      }
LABEL_30:
      swift_release();
      unsigned int v37 = (char *)v3 + v32[12];
      uint64_t v44 = (uint64_t)v24;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B398C98);
      sub_25F335CF0((unint64_t *)&qword_26B398CA0, &qword_26B398C98);
      uint64_t v6 = sub_25F3F6070();
      swift_bridgeObjectRelease();
      uint64_t v38 = sub_25F3F5CC0();
      (*(void (**)(char *, uint64_t))(*(void *)(v38 - 8) + 8))(v37, v38);
      return v6;
  }
}

unint64_t sub_25F3E4D78()
{
  sub_25F3F6880();
  swift_bridgeObjectRelease();
  unint64_t v18 = 0xD000000000000013;
  unint64_t v19 = 0x800000025F408290;
  uint64_t v0 = sub_25F3F5CC0();
  uint64_t v14 = *(void *)(v0 - 8);
  uint64_t v15 = v0;
  MEMORY[0x270FA5388](v0);
  uint64_t v2 = (char *)&v13 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25F3E3E6C((uint64_t)v2);
  uint64_t v3 = sub_25F3F5C10();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25F3F5C00();
  uint64_t v7 = sub_25F3F5BF0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  char v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25F3F5BE0();
  sub_25F3F5C90();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v2, v15);
  sub_25F3F61E0();
  swift_bridgeObjectRelease();
  sub_25F3F61E0();
  sub_25F3E404C();
  sub_25F3F61E0();
  swift_bridgeObjectRelease();
  sub_25F3E451C();
  if (v11)
  {
    uint64_t v16 = 2108704;
    unint64_t v17 = 0xE300000000000000;
    sub_25F3F61E0();
    swift_bridgeObjectRelease();
  }
  sub_25F3F61E0();
  swift_bridgeObjectRelease();
  return v18;
}

uint64_t sub_25F3E5080()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_25F307B78(v0+ OBJC_IVAR____TtCC31TextToSpeechVoiceBankingSupport17TTSVBAudioServiceP33_2F288AB684677915D8A6F8C1A2A5794F5State_audioFileURL, &qword_26B398888);
  swift_release();
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtCC31TextToSpeechVoiceBankingSupport17TTSVBAudioServiceP33_2F288AB684677915D8A6F8C1A2A5794F5State_recordingFormat));
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

void *sub_25F3E5144()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DC80);
  swift_allocObject();
  v0[2] = sub_25F3F5F10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DCC8);
  swift_allocObject();
  v0[3] = sub_25F3F5F10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DCA0);
  swift_allocObject();
  v0[4] = sub_25F3F5F10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DCB0);
  swift_allocObject();
  v0[5] = sub_25F3F5F10();
  swift_allocObject();
  v0[6] = sub_25F3F5F10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DC90);
  swift_allocObject();
  v0[7] = sub_25F3F5F10();
  swift_allocObject();
  v0[8] = sub_25F3F5F10();
  uint64_t v2 = (char *)v0
     + OBJC_IVAR____TtCC31TextToSpeechVoiceBankingSupport17TTSVBAudioServiceP33_2F288AB684677915D8A6F8C1A2A5794F5State_audioFileURL;
  uint64_t v3 = sub_25F3F5B60();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 1, 1, v3);
  uint64_t v4 = OBJC_IVAR____TtCC31TextToSpeechVoiceBankingSupport17TTSVBAudioServiceP33_2F288AB684677915D8A6F8C1A2A5794F5State_bufferHistory;
  type metadata accessor for TTSVBAudioBufferHistory();
  *(void *)((char *)v1 + v4) = sub_25F34DD94(300);
  *((unsigned char *)v1
  + OBJC_IVAR____TtCC31TextToSpeechVoiceBankingSupport17TTSVBAudioServiceP33_2F288AB684677915D8A6F8C1A2A5794F5State_audioEngineTapInstalled) = 0;
  *(void *)((char *)v1
            + OBJC_IVAR____TtCC31TextToSpeechVoiceBankingSupport17TTSVBAudioServiceP33_2F288AB684677915D8A6F8C1A2A5794F5State_recordingFormat) = 0;
  return v1;
}

uint64_t sub_25F3E5338(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_25F3E5380()
{
  unint64_t result = qword_26A78DB68;
  if (!qword_26A78DB68)
  {
    sub_25F3236F0(255, (unint64_t *)&qword_26B399220);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A78DB68);
  }
  return result;
}

uint64_t sub_25F3E53DC()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_25F3E5414()
{
  uint64_t v1 = v0 + 16;
  uint64_t v2 = sub_25F3F5880();
  if (!v2)
  {
    long long v11 = 0u;
    long long v12 = 0u;
LABEL_11:
    sub_25F307B78((uint64_t)&v11, (uint64_t *)&unk_26A78D2B0);
    uint64_t v7 = 0;
    goto LABEL_12;
  }
  uint64_t v3 = v2;
  *(void *)&long long v11 = sub_25F3F6130();
  *((void *)&v11 + 1) = v4;
  sub_25F3F6830();
  if (*(void *)(v3 + 16) && (unint64_t v5 = sub_25F3AE5A4((uint64_t)v10), (v6 & 1) != 0))
  {
    sub_25F301A40(*(void *)(v3 + 56) + 32 * v5, (uint64_t)&v11);
  }
  else
  {
    long long v11 = 0u;
    long long v12 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_25F3AEC24((uint64_t)v10);
  if (!*((void *)&v12 + 1)) {
    goto LABEL_11;
  }
  type metadata accessor for RateDidChangeReason(0);
  if (swift_dynamicCast()) {
    uint64_t v7 = (void *)v10[0];
  }
  else {
    uint64_t v7 = 0;
  }
LABEL_12:
  swift_beginAccess();
  uint64_t v8 = MEMORY[0x2611F22B0](v1);
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    sub_25F3E7604();
  }
}

void sub_25F3E5550()
{
  swift_beginAccess();
  uint64_t v1 = MEMORY[0x2611F22B0](v0 + 16);
  if (v1)
  {
    uint64_t v2 = (void *)v1;
    sub_25F3F5870();
    if (v7)
    {
      sub_25F3237C8(&v6, &v8);
      sub_25F3236F0(0, &qword_26A78DCF0);
      swift_dynamicCast();
      id v3 = v5;
      id v4 = sub_25F3D0F40();

      if (v3 == v4) {
        sub_25F3D2D40();
      }
    }
    else
    {
      __break(1u);
    }
  }
}

void sub_25F3E563C(uint64_t a1)
{
  sub_25F3D31C0(a1, v1);
}

void sub_25F3E5644(uint64_t a1)
{
  sub_25F3D3D74(a1, v1);
}

void sub_25F3E564C(uint64_t a1)
{
  sub_25F3D465C(a1, v1);
}

void sub_25F3E566C(uint64_t a1)
{
  sub_25F3D465C(a1, v1);
}

void sub_25F3E568C(uint64_t a1)
{
  sub_25F3D4124(a1, v1);
}

void sub_25F3E5694(uint64_t a1)
{
  sub_25F3D43C0(a1, v1);
}

void sub_25F3E569C(uint64_t a1)
{
  sub_25F3D465C(a1, v1);
}

void sub_25F3E56BC(uint64_t a1)
{
  sub_25F3D465C(a1, v1);
}

uint64_t sub_25F3E56DC()
{
  return swift_release();
}

uint64_t sub_25F3E5730@<X0>(uint64_t *a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DC80);
  sub_25F335CF0(&qword_26A78DC88, &qword_26A78DC80);
  uint64_t result = sub_25F3F5F20();
  *a1 = result;
  return result;
}

uint64_t sub_25F3E57CC@<X0>(BOOL *a1@<X8>)
{
  swift_retain();
  sub_25F3F5EF0();
  uint64_t result = swift_release();
  *a1 = v3 == 0;
  return result;
}

uint64_t sub_25F3E5840@<X0>(uint64_t *a1@<X8>)
{
  return sub_25F3D4888(*(void *)(v1 + 16), a1);
}

uint64_t sub_25F3E586C()
{
  return swift_release();
}

uint64_t sub_25F3E58C0@<X0>(uint64_t *a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DC80);
  sub_25F335CF0(&qword_26A78DC88, &qword_26A78DC80);
  uint64_t result = sub_25F3F5F20();
  *a1 = result;
  return result;
}

uint64_t sub_25F3E595C()
{
  return swift_release();
}

uint64_t sub_25F3E59B0@<X0>(uint64_t *a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DCB0);
  sub_25F335CF0(&qword_26A78DCB8, &qword_26A78DCB0);
  uint64_t result = sub_25F3F5F20();
  *a1 = result;
  return result;
}

uint64_t sub_25F3E5A4C()
{
  return swift_release();
}

uint64_t sub_25F3E5AA0@<X0>(uint64_t *a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DCA0);
  sub_25F335CF0(&qword_26A78DCA8, &qword_26A78DCA0);
  uint64_t result = sub_25F3F5F20();
  *a1 = result;
  return result;
}

uint64_t sub_25F3E5B3C()
{
  return swift_release();
}

uint64_t sub_25F3E5B90@<X0>(uint64_t *a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DC90);
  sub_25F335CF0(&qword_26A78DC98, &qword_26A78DC90);
  uint64_t result = sub_25F3F5F20();
  *a1 = result;
  return result;
}

uint64_t sub_25F3E5C2C()
{
  return swift_release();
}

uint64_t sub_25F3E5C80@<X0>(uint64_t *a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DC80);
  sub_25F335CF0(&qword_26A78DC88, &qword_26A78DC80);
  uint64_t result = sub_25F3F5F20();
  *a1 = result;
  return result;
}

uint64_t sub_25F3E5D1C(unsigned int a1)
{
  uint64_t v31 = 0;
  unint64_t v32 = 0xE000000000000000;
  unsigned int v2 = HIBYTE(a1);
  char v30 = 0;
  char v29 = 0;
  char v3 = sub_25F3E6B74(0, 1, 1, MEMORY[0x263F8EE78]);
  unint64_t v5 = *((void *)v3 + 2);
  unint64_t v4 = *((void *)v3 + 3);
  if (v5 >= v4 >> 1) {
    char v3 = sub_25F3E6B74((char *)(v4 > 1), v5 + 1, 1, v3);
  }
  *((void *)v3 + 2) = v5 + 1;
  *(_DWORD *)&v3[4 * v5 + 32] = v2;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    char v3 = sub_25F3E6B74(0, *((void *)v3 + 2) + 1, 1, v3);
  }
  unint64_t v7 = *((void *)v3 + 2);
  unint64_t v6 = *((void *)v3 + 3);
  unint64_t v8 = v7 + 1;
  if (v7 >= v6 >> 1) {
    char v3 = sub_25F3E6B74((char *)(v6 > 1), v7 + 1, 1, v3);
  }
  *((void *)v3 + 2) = v8;
  *(_DWORD *)&v3[4 * v7 + 32] = BYTE2(a1);
  if ((v30 & 1) == 0)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      char v3 = sub_25F3E6B74(0, *((void *)v3 + 2) + 1, 1, v3);
    }
    unint64_t v10 = *((void *)v3 + 2);
    unint64_t v9 = *((void *)v3 + 3);
    unint64_t v8 = v10 + 1;
    if (v10 >= v9 >> 1) {
      char v3 = sub_25F3E6B74((char *)(v9 > 1), v10 + 1, 1, v3);
    }
    *((void *)v3 + 2) = v8;
    *(_DWORD *)&v3[4 * v10 + 32] = BYTE1(a1);
  }
  if ((v29 & 1) == 0)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      char v3 = sub_25F3E6B74(0, *((void *)v3 + 2) + 1, 1, v3);
    }
    unint64_t v12 = *((void *)v3 + 2);
    unint64_t v11 = *((void *)v3 + 3);
    unint64_t v8 = v12 + 1;
    if (v12 >= v11 >> 1) {
      char v3 = sub_25F3E6B74((char *)(v11 > 1), v12 + 1, 1, v3);
    }
    *((void *)v3 + 2) = v8;
    *(_DWORD *)&v3[4 * v12 + 32] = a1;
  }
  uint64_t v13 = 0;
  do
  {
    unsigned int v14 = *(_DWORD *)&v3[4 * v13 + 32];
    if (v14 >= 0x80)
    {
      int v16 = (*(_DWORD *)&v3[4 * v13 + 32] & 0x3F) << 8;
      if (v14 >= 0x800)
      {
        unsigned int v17 = v14 >> 12;
        int v18 = (v16 | (v14 >> 6) & 0x3F) << 8;
        unsigned int v19 = HIWORD(v14);
        unsigned int v15 = (((v18 | (v14 >> 12) & 0x3F) << 8) | (v14 >> 18)) - 2122219023;
        int v20 = (v18 | v17) + 8487393;
        if (!v19) {
          unsigned int v15 = v20;
        }
      }
      else
      {
        unsigned int v15 = (v16 | (v14 >> 6)) + 33217;
      }
    }
    else
    {
      unsigned int v15 = v14 + 1;
    }
    ++v13;
    v28[0] = (v15 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << (8 * (4 - (__clz(v15) >> 3))));
    MEMORY[0x2611F0BB0](v28);
    sub_25F3F61E0();
    swift_bridgeObjectRelease();
  }
  while (v8 != v13);
  swift_bridgeObjectRelease();
  v28[0] = v31;
  v28[1] = v32;
  uint64_t v21 = sub_25F3F5840();
  uint64_t v22 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  uint64_t v24 = (char *)&v28[-1] - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25F3F5820();
  sub_25F2FDE6C();
  uint64_t v25 = sub_25F3F66F0();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v21);
  swift_bridgeObjectRelease();
  return v25;
}

uint64_t sub_25F3E60E8(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_25F3F6980();
    uint64_t v2 = result;
    if (result) {
      goto LABEL_3;
    }
LABEL_15:
    unint64_t v5 = (char *)MEMORY[0x263F8EE78];
    goto LABEL_16;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
  if (!v2) {
    goto LABEL_15;
  }
LABEL_3:
  if (v2 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v4 = 0;
  unint64_t v5 = (char *)MEMORY[0x263F8EE78];
  do
  {
    if ((a1 & 0xC000000000000001) != 0) {
      id v6 = (id)MEMORY[0x2611F12D0](v4, a1);
    }
    else {
      id v6 = *(id *)(a1 + 8 * v4 + 32);
    }
    unint64_t v7 = v6;
    id v8 = objc_msgSend(v6, sel_portName);
    uint64_t v9 = sub_25F3F6130();
    uint64_t v11 = v10;

    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v5 = sub_25F3225B8(0, *((void *)v5 + 2) + 1, 1, v5);
    }
    unint64_t v13 = *((void *)v5 + 2);
    unint64_t v12 = *((void *)v5 + 3);
    if (v13 >= v12 >> 1) {
      unint64_t v5 = sub_25F3225B8((char *)(v12 > 1), v13 + 1, 1, v5);
    }
    ++v4;
    *((void *)v5 + 2) = v13 + 1;
    unsigned int v14 = &v5[16 * v13];
    *((void *)v14 + 4) = v9;
    *((void *)v14 + 5) = v11;
  }
  while (v2 != v4);
LABEL_16:
  swift_bridgeObjectRelease();
  uint64_t v15 = *((void *)v5 + 2);
  if (v15 == 1)
  {
    uint64_t v16 = *((void *)v5 + 4);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  else if (v15)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B398C98);
    sub_25F335CF0((unint64_t *)&qword_26B398CA0, &qword_26B398C98);
    sub_25F3F6070();
    swift_bridgeObjectRelease();
    sub_25F3F61E0();
    swift_bridgeObjectRelease();
    sub_25F3F61E0();
    return 91;
  }
  else
  {
    swift_bridgeObjectRelease();
    return 1701736270;
  }
  return v16;
}

uint64_t RecordingMode.localizedTitle.getter()
{
  uint64_t v0 = (void *)sub_25F3F6100();
  id v1 = TTSVBSupportLocString(v0);

  uint64_t v2 = sub_25F3F6130();
  return v2;
}

TextToSpeechVoiceBankingSupport::RecordingMode_optional __swiftcall RecordingMode.init(rawValue:)(Swift::Int rawValue)
{
  if (rawValue == 1) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (!rawValue) {
    char v2 = 0;
  }
  *id v1 = v2;
  return (TextToSpeechVoiceBankingSupport::RecordingMode_optional)rawValue;
}

void *static RecordingMode.allCases.getter()
{
  return &unk_270B975C0;
}

uint64_t RecordingMode.rawValue.getter()
{
  return *v0;
}

void sub_25F3E6414(void *a1@<X8>)
{
  *a1 = &unk_270B975E8;
}

BOOL static RecordingState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t RecordingState.hash(into:)()
{
  return sub_25F3F6C30();
}

uint64_t RecordingState.hashValue.getter()
{
  return sub_25F3F6C70();
}

BOOL static RecordingEnvironment.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t RecordingEnvironment.hash(into:)()
{
  return sub_25F3F6C30();
}

uint64_t RecordingEnvironment.hashValue.getter()
{
  return sub_25F3F6C70();
}

uint64_t sub_25F3E6538(uint64_t a1, uint64_t a2)
{
  return sub_25F3E6A20(a1, a2, MEMORY[0x270FA9BE0]);
}

void *sub_25F3E6544@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_25F3E6550(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_25F3E6558@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_25F3E656C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_25F3E6580@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_25F3E6594(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_25F3E65C4@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_25F3E65F0@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_25F3E6614(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_25F3E6628(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_25F3E663C(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_25F3E6650@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_25F3E6664(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_25F3E6678(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_25F3E668C(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_25F3E66A0()
{
  return *v0 == 0;
}

void *sub_25F3E66B0(void *result)
{
  *v1 &= ~*result;
  return result;
}

uint64_t sub_25F3E66C4(uint64_t a1)
{
  uint64_t v2 = sub_25F3EAD60(&qword_26A78DD78, type metadata accessor for RateDidChangeReason);
  uint64_t v3 = sub_25F3EAD60(&qword_26A78DD80, type metadata accessor for RateDidChangeReason);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_25F3E6780(uint64_t a1)
{
  uint64_t v2 = sub_25F3EAD60(&qword_26A78DC50, type metadata accessor for NSKeyValueChangeKey);
  uint64_t v3 = sub_25F3EAD60(&qword_26A78DDA8, type metadata accessor for NSKeyValueChangeKey);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_25F3E683C(uint64_t a1)
{
  uint64_t v2 = sub_25F3EAD60(&qword_26A78DD88, type metadata accessor for Port);
  uint64_t v3 = sub_25F3EAD60(&qword_26A78DD90, type metadata accessor for Port);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_25F3E68F8(uint64_t a1)
{
  uint64_t v2 = sub_25F3EAD60(&qword_26A78DD98, type metadata accessor for PolarPattern);
  uint64_t v3 = sub_25F3EAD60(&qword_26A78DDA0, type metadata accessor for PolarPattern);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

BOOL sub_25F3E69B4(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_25F3E69C8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = sub_25F3E75CC(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t sub_25F3E6A08(uint64_t a1, uint64_t a2)
{
  return sub_25F3E6A20(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_25F3E6A20(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_25F3F6130();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

void *sub_25F3E6A64(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DC60);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      void v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      unint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      unint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
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
    sub_25F3E7960(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_25F3E6B74(char *result, int64_t a2, char a3, char *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DC68);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 29;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 2);
      unint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)MEMORY[0x263F8EE78];
      unint64_t v13 = (char *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 32]) {
          memmove(v13, a4 + 32, 4 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_25F3E7C10(0, v8, v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_25F3E6C84(char a1)
{
  sub_25F3F6C20();
  sub_25F3F61A0();
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_25F3F6C70();

  return sub_25F3E6D28(a1 & 1, v2);
}

unint64_t sub_25F3E6D28(char a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    if (a1) {
      unint64_t v6 = 0x800000025F407F70;
    }
    else {
      unint64_t v6 = 0x800000025F407F50;
    }
    while (1)
    {
      uint64_t v7 = *(unsigned char *)(*(void *)(v2 + 48) + v4) ? "recordingDidFinish" : "recordingWillStart";
      if (((unint64_t)(v7 - 32) | 0x8000000000000000) == v6) {
        break;
      }
      char v8 = sub_25F3F6B80();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v8 & 1) == 0)
      {
        unint64_t v4 = (v4 + 1) & v5;
        if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4)) {
          continue;
        }
      }
      return v4;
    }
    swift_bridgeObjectRelease_n();
  }
  return v4;
}

uint64_t sub_25F3E6E50(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DC78);
  char v6 = a2;
  uint64_t v7 = sub_25F3F69A0();
  uint64_t v8 = v7;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(v5 + 64);
  uint64_t v33 = v2;
  int64_t v34 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v19 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v20 = v19 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v14 + 1;
    if (__OFADD__(v14, 1))
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
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v14;
    if (!v23)
    {
      int64_t v14 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v14);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v33;
          if ((v6 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v14 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v14);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v24;
      }
    }
LABEL_30:
    unint64_t v11 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_31:
    char v29 = *(unsigned char *)(*(void *)(v5 + 48) + v20);
    char v30 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v6 & 1) == 0) {
      id v31 = v30;
    }
    sub_25F3F6C20();
    sub_25F3F61A0();
    swift_bridgeObjectRelease();
    uint64_t result = sub_25F3F6C70();
    uint64_t v15 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v17 == v26;
        if (v17 == v26) {
          unint64_t v17 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v12 + 8 * v17);
      }
      while (v28 == -1);
      unint64_t v18 = __clz(__rbit64(~v28)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    *(unsigned char *)(*(void *)(v8 + 48) + v18) = v29;
    *(void *)(*(void *)(v8 + 56) + 8 * v18) = v30;
    ++*(void *)(v8 + 16);
  }
  swift_release();
  uint64_t v3 = v33;
  uint64_t v22 = (void *)(v5 + 64);
  if ((v6 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
  if (v32 >= 64) {
    bzero(v22, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v22 = -1 << v32;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v8;
  return result;
}

void sub_25F3E7170(uint64_t a1, char a2, char a3)
{
  unint64_t v4 = v3;
  char v7 = a2 & 1;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_25F3E6C84(a2 & 1);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= v13 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= v13 && (a3 & 1) == 0)
  {
    sub_25F3E72A8();
LABEL_7:
    unint64_t v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      uint64_t v17 = v16[7];

      *(void *)(v17 + 8 * v10) = a1;
      return;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    *(unsigned char *)(v16[6] + v10) = v7;
    *(void *)(v16[7] + 8 * v10) = a1;
    uint64_t v20 = v16[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (!v21)
    {
      id v16[2] = v22;
      return;
    }
    goto LABEL_14;
  }
  sub_25F3E6E50(v13, a3 & 1);
  unint64_t v18 = sub_25F3E6C84(v7);
  if ((v14 & 1) == (v19 & 1))
  {
    unint64_t v10 = v18;
    unint64_t v16 = (void *)*v4;
    if (v14) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  sub_25F3F6BC0();
  __break(1u);
}

id sub_25F3E72A8()
{
  id v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DC78);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25F3F6990();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *id v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v17 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v18 - 1) & v18;
    unint64_t v15 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_12:
    unint64_t v16 = *(void **)(*(void *)(v2 + 56) + 8 * v15);
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
    *(void *)(*(void *)(v4 + 56) + 8 * v15) = v16;
    id result = v16;
  }
  int64_t v19 = v17 + 2;
  if (v19 >= v13) {
    goto LABEL_26;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_25F3E744C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25F3E746C(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_25F3E746C(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A78D3D8);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 29;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  int64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8]) {
      memmove(v13, v14, 4 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[4 * v8] || v13 >= &v14[4 * v8])
  {
    memcpy(v13, v14, 4 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_25F3F69C0();
  __break(1u);
  return result;
}

uint64_t sub_25F3E75CC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t result = 0;
  uint64_t v4 = (uint64_t *)(a1 + 32);
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

uint64_t sub_25F3E7604()
{
  uint64_t v1 = sub_25F3F5FE0();
  uint64_t v2 = *(void *)(v1 - 8);
  double v3 = MEMORY[0x270FA5388](v1);
  uint64_t v5 = (void *)((char *)v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = *(void **)&v0[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioQueue];
  *uint64_t v5 = v6;
  (*(void (**)(void *, void, uint64_t, double))(v2 + 104))(v5, *MEMORY[0x263F8F0E8], v1, v3);
  id v7 = v6;
  LOBYTE(v6) = sub_25F3F6000();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v2 + 8))(v5, v1);
  if (v6)
  {
    uint64_t v9 = sub_25F3EF940();
    uint64_t v10 = sub_25F3F5EA0();
    uint64_t v11 = *(void *)(v10 - 8);
    double v12 = MEMORY[0x270FA5388](v10);
    unint64_t v14 = (char *)v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, uint64_t, uint64_t, double))(v11 + 16))(v14, v9, v10, v12);
    unint64_t v15 = v0;
    unint64_t v16 = sub_25F3F5E80();
    os_log_type_t v17 = sub_25F3F64D0();
    unint64_t v18 = &selRef_addObject_;
    if (os_log_type_enabled(v16, v17))
    {
      int64_t v19 = (uint8_t *)swift_slowAlloc();
      v28[1] = v28;
      uint64_t v20 = v19;
      *(_DWORD *)int64_t v19 = 134217984;
      id v21 = sub_25F3D111C();
      objc_msgSend(v21, sel_rate);
      float v23 = v22;

      *(double *)&void v28[2] = v23;
      unint64_t v18 = &selRef_addObject_;
      sub_25F3F66A0();

      _os_log_impl(&dword_25F2F5000, v16, v17, "Got player rate change: %f", v20, 0xCu);
      MEMORY[0x2611F21E0](v20, -1, -1);
    }
    else
    {

      unint64_t v16 = v15;
    }

    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
    id v24 = sub_25F3D111C();
    [v24 v18[479]];
    float v26 = v25;

    if (v26 == 0.0)
    {
      id v27 = sub_25F3D111C();
      objc_msgSend(v27, sel_replaceCurrentItemWithPlayerItem_, 0);
    }
    BOOL v29 = v26 != 0.0;
    swift_retain();
    sub_25F3F5F00();
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_25F3E7960(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 8 * a1 + 32;
    unint64_t v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      type metadata accessor for Port(0);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_25F3F69C0();
  __break(1u);
  return result;
}

void *sub_25F3E7A68(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  unint64_t v7 = a1;
  if (a1 >> 62)
  {
LABEL_20:
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_25F3F6980();
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v8 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v8)
    {
LABEL_3:
      uint64_t v22 = v4;
      unint64_t v23 = v7;
      unint64_t v24 = v7 & 0xC000000000000001;
      uint64_t v4 = 4;
      do
      {
        uint64_t v9 = v4 - 4;
        if (v24)
        {
          id v10 = (id)MEMORY[0x2611F12D0](v4 - 4, v7);
          uint64_t v11 = v4 - 3;
          if (__OFADD__(v9, 1)) {
            goto LABEL_19;
          }
        }
        else
        {
          id v10 = *(id *)(v7 + 8 * v4);
          uint64_t v11 = v4 - 3;
          if (__OFADD__(v9, 1))
          {
LABEL_19:
            __break(1u);
            goto LABEL_20;
          }
        }
        uint64_t v12 = v8;
        uint64_t v13 = v10;
        uint64_t v14 = a3;
        id v15 = objc_msgSend(v10, sel_dataSourceName, v22);
        uint64_t v16 = sub_25F3F6130();
        uint64_t v18 = v17;

        a3 = v14;
        BOOL v19 = v16 == a2 && v18 == v14;
        if (v19)
        {
          swift_bridgeObjectRelease();
LABEL_18:
          swift_bridgeObjectRelease();
          return v13;
        }
        char v20 = sub_25F3F6B80();
        swift_bridgeObjectRelease();
        if (v20) {
          goto LABEL_18;
        }

        ++v4;
        uint64_t v8 = v12;
        BOOL v19 = v11 == v12;
        unint64_t v7 = v23;
      }
      while (!v19);
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

char *sub_25F3E7C10(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + 4 * a1 + 32);
    size_t v6 = 4 * v4;
    unint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_25F3F69C0();
  __break(1u);
  return result;
}

uint64_t _s31TextToSpeechVoiceBankingSupport17TTSVBAudioServiceC12observeValue10forKeyPath2of6change7contextySSSg_ypSgSDySo05NSKeyj6ChangeL0aypGSgSvSgtF_0(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    if (result == 0xD000000000000010 && a2 == 0x800000025F408000 || (uint64_t result = sub_25F3F6B80(), (result & 1) != 0))
    {
      v14[2] = *(void *)&v2[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioQueue];
      uint64_t v3 = swift_allocObject();
      *(void *)(v3 + 16) = v2;
      aBlock[4] = sub_25F3EBD20;
      aBlock[5] = v3;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_25F302590;
      aBlock[3] = &block_descriptor_263;
      uint64_t v4 = _Block_copy(aBlock);
      uint64_t v5 = sub_25F3F5FB0();
      v14[1] = v14;
      uint64_t v6 = *(void *)(v5 - 8);
      MEMORY[0x270FA5388](v5);
      uint64_t v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v9 = v2;
      sub_25F3F5F80();
      uint64_t v10 = sub_25F3F5F70();
      v14[0] = v14;
      uint64_t v11 = *(void *)(v10 - 8);
      MEMORY[0x270FA5388](v10);
      uint64_t v13 = (char *)v14 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
      v14[3] = MEMORY[0x263F8EE78];
      sub_25F3E5338((unint64_t *)&unk_26B3991D0, MEMORY[0x270FCDAA0]);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B3991E0);
      sub_25F335CF0((unint64_t *)&unk_26B3991F0, (uint64_t *)&unk_26B3991E0);
      sub_25F3F67A0();
      MEMORY[0x2611F0F70](0, v8, v13, v4);
      _Block_release(v4);
      (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_25F3E8010()
{
  return sub_25F3D5198(v0[2], v0[3], v0[4]);
}

uint64_t block_copy_helper_7(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_7()
{
  return swift_release();
}

uint64_t sub_25F3E8038()
{
  return sub_25F3D5C84(v0[2], v0[3], v0[4]);
}

uint64_t sub_25F3E8044()
{
  uint64_t v1 = sub_25F3F5B60();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();

  return MEMORY[0x270FA0238](v0, v6 + 16, v5);
}

uint64_t sub_25F3E8130()
{
  uint64_t v1 = *(void *)(sub_25F3F5B60() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v4 = v0 + v2;
  uint64_t v5 = (uint64_t *)(v0 + ((*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v6 = *v5;
  uint64_t v7 = v5[1];

  return sub_25F3D6698(v3, v4, v6, v7);
}

uint64_t sub_25F3E81C8()
{
  return sub_25F3D710C(v0[2], v0[3], v0[4]);
}

uint64_t sub_25F3E81D4()
{
  uint64_t v1 = sub_25F3F5B60();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, ((((v6 + 15) & 0xFFFFFFFFFFFFFFF8) + 79) & 0xFFFFFFFFFFFFFFF8) + 16, v5);
}

void sub_25F3E8310()
{
  uint64_t v1 = *(void *)(sub_25F3F5B60() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v3 = (*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v4 = (v3 + 15) & 0xFFFFFFFFFFFFFFF8;
  sub_25F3D80D4(*(void *)(v0 + 16), v0 + v2, *(void *)(v0 + v3), *(void *)(v0 + v4), *(void *)(v0 + v4 + 8), (long long *)(v0 + ((v4 + 23) & 0xFFFFFFFFFFFFFFF8)), *(unsigned __int8 *)(v0 + ((v4 + 23) & 0xFFFFFFFFFFFFFFF8) + 48), *(void *)(v0 + ((v4 + 79) & 0xFFFFFFFFFFFFFFF8)), *(void *)(v0 + ((v4 + 79) & 0xFFFFFFFFFFFFFFF8) + 8));
}

uint64_t sub_25F3E83D0()
{
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 104, 7);
}

uint64_t sub_25F3E8430()
{
  return sub_25F3DA804(*(void *)(v0 + 16), *(unsigned char **)(v0 + 24), *(unsigned __int16 *)(v0 + 32), *(void **)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56), *(void *)(v0 + 64), *(void *)(v0 + 72), *(unsigned char **)(v0 + 80), *(void *)(v0 + 88), *(void *)(v0 + 96));
}

uint64_t sub_25F3E8478()
{
  return sub_25F3E08D0(v0[2], v0[3], v0[4]);
}

uint64_t type metadata accessor for TTSVBAudioService.AudioSessionEvent(uint64_t a1)
{
  return sub_25F3227C4(a1, (uint64_t *)&unk_26A79FAE0);
}

uint64_t sub_25F3E84A4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_25F3E8510()
{
  unint64_t result = qword_26A78DBD8;
  if (!qword_26A78DBD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A78DBD8);
  }
  return result;
}

uint64_t sub_25F3E8564()
{
  return sub_25F3E5338(&qword_26A78D190, MEMORY[0x270FA9318]);
}

unint64_t sub_25F3E8598()
{
  unint64_t result = qword_26A78DBE0;
  if (!qword_26A78DBE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A78DBE0);
  }
  return result;
}

uint64_t sub_25F3E85EC()
{
  return sub_25F335CF0(&qword_26A78DBE8, &qword_26A78DBF0);
}

unint64_t sub_25F3E862C()
{
  unint64_t result = qword_26A78DBF8;
  if (!qword_26A78DBF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A78DBF8);
  }
  return result;
}

unint64_t sub_25F3E8684()
{
  unint64_t result = qword_26A78DC00;
  if (!qword_26A78DC00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A78DC00);
  }
  return result;
}

uint64_t type metadata accessor for TTSVBAudioService()
{
  return self;
}

void **initializeBufferWithCopyOfBuffer for TTSVBAudioService.RecordingResult(void **a1, void **a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  unint64_t v4 = (char *)*a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (void **)&v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    uint64_t v7 = a1;
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_25F3F5B60();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    uint64_t v13 = v4;
    v12(v9, v10, v11);
    uint64_t v14 = a3[6];
    uint64_t v15 = a3[7];
    uint64_t v16 = (void **)((char *)v7 + v14);
    uint64_t v17 = (void **)((char *)a2 + v14);
    uint64_t v18 = v17[1];
    *uint64_t v16 = *v17;
    v16[1] = v18;
    *(void **)((char *)v7 + v15) = *(void **)((char *)a2 + v15);
    uint64_t v19 = a3[8];
    char v20 = (void **)((char *)v7 + v19);
    id v21 = (void **)((char *)a2 + v19);
    uint64_t v22 = v21[1];
    *char v20 = *v21;
    v20[1] = v22;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v7;
}

uint64_t destroy for TTSVBAudioService.RecordingResult(id *a1, uint64_t a2)
{
  unint64_t v4 = (char *)a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_25F3F5B60();
  (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void **initializeWithCopy for TTSVBAudioService.RecordingResult(void **a1, void **a2, int *a3)
{
  unint64_t v6 = *a2;
  *a1 = *a2;
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_25F3F5B60();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  id v12 = v6;
  v11(v8, v9, v10);
  uint64_t v13 = a3[6];
  uint64_t v14 = a3[7];
  uint64_t v15 = (void **)((char *)a1 + v13);
  uint64_t v16 = (void **)((char *)a2 + v13);
  uint64_t v17 = v16[1];
  void *v15 = *v16;
  v15[1] = v17;
  *(void **)((char *)a1 + v14) = *(void **)((char *)a2 + v14);
  uint64_t v18 = a3[8];
  uint64_t v19 = (void **)((char *)a1 + v18);
  char v20 = (void **)((char *)a2 + v18);
  uint64_t v21 = v20[1];
  *uint64_t v19 = *v20;
  v19[1] = v21;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void **assignWithCopy for TTSVBAudioService.RecordingResult(void **a1, void **a2, int *a3)
{
  unint64_t v6 = *a2;
  uint64_t v7 = *a1;
  *a1 = *a2;
  id v8 = v6;

  uint64_t v9 = a3[5];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_25F3F5B60();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  uint64_t v13 = a3[6];
  uint64_t v14 = (void **)((char *)a1 + v13);
  uint64_t v15 = (void **)((char *)a2 + v13);
  *uint64_t v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void **)((char *)a1 + a3[7]) = *(void **)((char *)a2 + a3[7]);
  uint64_t v16 = a3[8];
  uint64_t v17 = (void **)((char *)a1 + v16);
  uint64_t v18 = (void **)((char *)a2 + v16);
  *uint64_t v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *initializeWithTake for TTSVBAudioService.RecordingResult(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  id v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25F3F5B60();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *(_OWORD *)((char *)a1 + a3[6]) = *(_OWORD *)((char *)a2 + a3[6]);
  *(void *)((char *)a1 + v10) = *(void *)((char *)a2 + v10);
  *(_OWORD *)((char *)a1 + a3[8]) = *(_OWORD *)((char *)a2 + a3[8]);
  return a1;
}

void **assignWithTake for TTSVBAudioService.RecordingResult(void **a1, void **a2, int *a3)
{
  uint64_t v6 = *a1;
  *a1 = *a2;

  uint64_t v7 = a3[5];
  id v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_25F3F5B60();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = (void **)((char *)a1 + v11);
  uint64_t v13 = (uint64_t *)((char *)a2 + v11);
  uint64_t v15 = *v13;
  uint64_t v14 = v13[1];
  *uint64_t v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  uint64_t v16 = a3[8];
  *(void **)((char *)a1 + a3[7]) = *(void **)((char *)a2 + a3[7]);
  uint64_t v17 = (void **)((char *)a1 + v16);
  uint64_t v18 = (uint64_t *)((char *)a2 + v16);
  uint64_t v20 = *v18;
  uint64_t v19 = v18[1];
  *uint64_t v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TTSVBAudioService.RecordingResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25F3E8C38);
}

uint64_t sub_25F3E8C38(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_25F3F5B60();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for TTSVBAudioService.RecordingResult(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25F3E8CFC);
}

void *sub_25F3E8CFC(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *unint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_25F3F5B60();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_25F3E8DA4()
{
  uint64_t result = sub_25F3F5B60();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for TTSVBAudioService.SoundEffect()
{
  return &type metadata for TTSVBAudioService.SoundEffect;
}

char *sub_25F3E8E6C(char *a1, char **a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    *(void *)a1 = *a2;
    a1 = &v19[(v5 + 16) & ~(unint64_t)v5];
    swift_retain();
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v20 = *a2;
        *(void *)a1 = *a2;
        uint64_t v21 = v20;
        uint64_t v22 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26A78DBC8);
        uint64_t v23 = v22[12];
        unint64_t v24 = &a1[v23];
        float v25 = (char *)a2 + v23;
        uint64_t v26 = sub_25F3F5CC0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 16))(v24, v25, v26);
        *(void *)&a1[v22[16]] = *(char **)((char *)a2 + v22[16]);
        uint64_t v27 = v22[20];
        uint64_t v28 = *(char **)((char *)a2 + v27);
        *(void *)&a1[v27] = v28;
        id v29 = v28;
        break;
      case 2u:
      case 3u:
      case 6u:
      case 7u:
      case 8u:
        uint64_t v44 = *a2;
        *(void *)a1 = *a2;
        unint64_t v45 = v44;
        uint64_t v46 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A78DBB0) + 48);
        uint64_t v47 = &a1[v46];
        uint64_t v48 = (char *)a2 + v46;
        uint64_t v49 = sub_25F3F5CC0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v49 - 8) + 16))(v47, v48, v49);
        break;
      case 4u:
        char v30 = *a2;
        *(void *)a1 = *a2;
        id v31 = v30;
        uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DBC0);
        uint64_t v33 = *(int *)(v32 + 48);
        int64_t v34 = &a1[v33];
        uint64_t v35 = (char *)a2 + v33;
        uint64_t v36 = sub_25F3F5CC0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v36 - 8) + 16))(v34, v35, v36);
        *(void *)&a1[*(int *)(v32 + 64)] = *(char **)((char *)a2 + *(int *)(v32 + 64));
        break;
      case 5u:
        unsigned int v37 = *a2;
        *(void *)a1 = *a2;
        uint64_t v38 = v37;
        uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DBB8);
        uint64_t v40 = *(int *)(v39 + 48);
        uint64_t v41 = &a1[v40];
        uint64_t v42 = (char *)a2 + v40;
        uint64_t v43 = sub_25F3F5CC0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v43 - 8) + 16))(v41, v42, v43);
        a1[*(int *)(v39 + 64)] = *((unsigned char *)a2 + *(int *)(v39 + 64));
        break;
      default:
        uint64_t v6 = *a2;
        *(void *)a1 = *a2;
        uint64_t v7 = v6;
        uint64_t v8 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26A78DBD0);
        uint64_t v9 = v8[12];
        uint64_t v10 = &a1[v9];
        uint64_t v11 = (char *)a2 + v9;
        uint64_t v12 = sub_25F3F5CC0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
        *(void *)&a1[v8[16]] = *(char **)((char *)a2 + v8[16]);
        uint64_t v13 = v8[20];
        uint64_t v14 = &a1[v13];
        uint64_t v15 = (char *)a2 + v13;
        v14[8] = v15[8];
        *(void *)uint64_t v14 = *(void *)v15;
        uint64_t v16 = v8[24];
        uint64_t v17 = &a1[v16];
        uint64_t v18 = (char *)a2 + v16;
        v17[8] = v18[8];
        *(void *)uint64_t v17 = *(void *)v18;
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void sub_25F3E93C4(id *a1)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:

      unint64_t v2 = &qword_26A78DBD0;
      goto LABEL_3;
    case 1u:

      uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DBC8);
      uint64_t v7 = (char *)a1 + *(int *)(v6 + 48);
      uint64_t v8 = sub_25F3F5CC0();
      (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
      uint64_t v9 = *(id *)((char *)a1 + *(int *)(v6 + 80));

      return;
    case 2u:
    case 3u:
    case 6u:
    case 7u:
    case 8u:

      unint64_t v2 = &qword_26A78DBB0;
      goto LABEL_3;
    case 4u:

      unint64_t v2 = &qword_26A78DBC0;
      goto LABEL_3;
    case 5u:

      unint64_t v2 = &qword_26A78DBB8;
LABEL_3:
      int v3 = (char *)a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(v2) + 48);
      uint64_t v4 = sub_25F3F5CC0();
      int v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
      v5(v3, v4);
      break;
    default:
      return;
  }
}

void **sub_25F3E956C(void **a1, void **a2)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      unint64_t v24 = *a2;
      *a1 = *a2;
      id v25 = v24;
      uint64_t v26 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26A78DBC8);
      uint64_t v27 = v26[12];
      uint64_t v28 = (char *)a1 + v27;
      id v29 = (char *)a2 + v27;
      uint64_t v30 = sub_25F3F5CC0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 16))(v28, v29, v30);
      *(void **)((char *)a1 + v26[16]) = *(void **)((char *)a2 + v26[16]);
      uint64_t v31 = v26[20];
      uint64_t v32 = *(void **)((char *)a2 + v31);
      *(void **)((char *)a1 + v31) = v32;
      id v33 = v32;
      break;
    case 2u:
    case 3u:
    case 6u:
    case 7u:
    case 8u:
      uint64_t v4 = *a2;
      *a1 = *a2;
      id v5 = v4;
      uint64_t v6 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A78DBB0) + 48);
      uint64_t v7 = (char *)a1 + v6;
      uint64_t v8 = (char *)a2 + v6;
      uint64_t v9 = sub_25F3F5CC0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
      break;
    case 4u:
      int64_t v34 = *a2;
      *a1 = *a2;
      id v35 = v34;
      uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DBC0);
      uint64_t v37 = *(int *)(v36 + 48);
      uint64_t v38 = (char *)a1 + v37;
      uint64_t v39 = (char *)a2 + v37;
      uint64_t v40 = sub_25F3F5CC0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v40 - 8) + 16))(v38, v39, v40);
      *(void **)((char *)a1 + *(int *)(v36 + 64)) = *(void **)((char *)a2 + *(int *)(v36 + 64));
      break;
    case 5u:
      uint64_t v41 = *a2;
      *a1 = *a2;
      id v42 = v41;
      uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DBB8);
      uint64_t v44 = *(int *)(v43 + 48);
      unint64_t v45 = (char *)a1 + v44;
      uint64_t v46 = (char *)a2 + v44;
      uint64_t v47 = sub_25F3F5CC0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v47 - 8) + 16))(v45, v46, v47);
      *((unsigned char *)a1 + *(int *)(v43 + 64)) = *((unsigned char *)a2 + *(int *)(v43 + 64));
      break;
    default:
      uint64_t v11 = *a2;
      *a1 = *a2;
      id v12 = v11;
      uint64_t v13 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26A78DBD0);
      uint64_t v14 = v13[12];
      uint64_t v15 = (char *)a1 + v14;
      uint64_t v16 = (char *)a2 + v14;
      uint64_t v17 = sub_25F3F5CC0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
      *(void **)((char *)a1 + v13[16]) = *(void **)((char *)a2 + v13[16]);
      uint64_t v18 = v13[20];
      uint64_t v19 = (char *)a1 + v18;
      uint64_t v20 = (char *)a2 + v18;
      v19[8] = v20[8];
      *(void *)uint64_t v19 = *(void *)v20;
      uint64_t v21 = v13[24];
      uint64_t v22 = (char *)a1 + v21;
      uint64_t v23 = (char *)a2 + v21;
      v22[8] = v23[8];
      *(void *)uint64_t v22 = *(void *)v23;
      break;
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void **sub_25F3E9890(void **a1, void **a2)
{
  if (a1 != a2)
  {
    sub_25F3E9DBC((uint64_t)a1, type metadata accessor for TTSVBAudioService.AudioSessionEvent);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v19 = *a2;
        *a1 = *a2;
        id v20 = v19;
        uint64_t v21 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26A78DBC8);
        uint64_t v22 = v21[12];
        uint64_t v23 = (char *)a1 + v22;
        unint64_t v24 = (char *)a2 + v22;
        uint64_t v25 = sub_25F3F5CC0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 16))(v23, v24, v25);
        *(void **)((char *)a1 + v21[16]) = *(void **)((char *)a2 + v21[16]);
        uint64_t v26 = v21[20];
        uint64_t v27 = *(void **)((char *)a2 + v26);
        *(void **)((char *)a1 + v26) = v27;
        id v28 = v27;
        break;
      case 2u:
      case 3u:
      case 6u:
      case 7u:
      case 8u:
        uint64_t v43 = *a2;
        *a1 = *a2;
        id v44 = v43;
        uint64_t v45 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A78DBB0) + 48);
        uint64_t v46 = (char *)a1 + v45;
        uint64_t v47 = (char *)a2 + v45;
        uint64_t v48 = sub_25F3F5CC0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v48 - 8) + 16))(v46, v47, v48);
        break;
      case 4u:
        id v29 = *a2;
        *a1 = *a2;
        id v30 = v29;
        uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DBC0);
        uint64_t v32 = *(int *)(v31 + 48);
        id v33 = (char *)a1 + v32;
        int64_t v34 = (char *)a2 + v32;
        uint64_t v35 = sub_25F3F5CC0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v35 - 8) + 16))(v33, v34, v35);
        *(void **)((char *)a1 + *(int *)(v31 + 64)) = *(void **)((char *)a2 + *(int *)(v31 + 64));
        break;
      case 5u:
        uint64_t v36 = *a2;
        *a1 = *a2;
        id v37 = v36;
        uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DBB8);
        uint64_t v39 = *(int *)(v38 + 48);
        uint64_t v40 = (char *)a1 + v39;
        uint64_t v41 = (char *)a2 + v39;
        uint64_t v42 = sub_25F3F5CC0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v42 - 8) + 16))(v40, v41, v42);
        *((unsigned char *)a1 + *(int *)(v38 + 64)) = *((unsigned char *)a2 + *(int *)(v38 + 64));
        break;
      default:
        uint64_t v4 = *a2;
        *a1 = *a2;
        id v5 = v4;
        uint64_t v6 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26A78DBD0);
        uint64_t v7 = v6[12];
        uint64_t v8 = (char *)a1 + v7;
        uint64_t v9 = (char *)a2 + v7;
        uint64_t v10 = sub_25F3F5CC0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
        *(void **)((char *)a1 + v6[16]) = *(void **)((char *)a2 + v6[16]);
        uint64_t v11 = v6[20];
        id v12 = (char *)a1 + v11;
        uint64_t v13 = (char *)a2 + v11;
        char v14 = v13[8];
        *(void *)id v12 = *(void *)v13;
        v12[8] = v14;
        uint64_t v15 = v6[24];
        uint64_t v16 = (char *)a1 + v15;
        uint64_t v17 = (char *)a2 + v15;
        char v18 = v17[8];
        *(void *)uint64_t v16 = *(void *)v17;
        v16[8] = v18;
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_25F3E9DBC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void *sub_25F3E9E1C(void *a1, void *a2)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      *a1 = *a2;
      uint64_t v19 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26A78DBC8);
      uint64_t v20 = v19[12];
      uint64_t v21 = (char *)a1 + v20;
      uint64_t v22 = (char *)a2 + v20;
      uint64_t v23 = sub_25F3F5CC0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 32))(v21, v22, v23);
      *(void *)((char *)a1 + v19[16]) = *(void *)((char *)a2 + v19[16]);
      uint64_t v24 = v19[20];
      goto LABEL_6;
    case 2u:
    case 3u:
    case 6u:
    case 7u:
    case 8u:
      *a1 = *a2;
      uint64_t v4 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A78DBB0) + 48);
      id v5 = (char *)a1 + v4;
      uint64_t v6 = (char *)a2 + v4;
      uint64_t v7 = sub_25F3F5CC0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
      break;
    case 4u:
      *a1 = *a2;
      uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DBC0);
      uint64_t v26 = *(int *)(v25 + 48);
      uint64_t v27 = (char *)a1 + v26;
      id v28 = (char *)a2 + v26;
      uint64_t v29 = sub_25F3F5CC0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 32))(v27, v28, v29);
      uint64_t v24 = *(int *)(v25 + 64);
LABEL_6:
      *(void *)((char *)a1 + v24) = *(void *)((char *)a2 + v24);
      break;
    case 5u:
      *a1 = *a2;
      uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DBB8);
      uint64_t v31 = *(int *)(v30 + 48);
      uint64_t v32 = (char *)a1 + v31;
      id v33 = (char *)a2 + v31;
      uint64_t v34 = sub_25F3F5CC0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 32))(v32, v33, v34);
      *((unsigned char *)a1 + *(int *)(v30 + 64)) = *((unsigned char *)a2 + *(int *)(v30 + 64));
      break;
    default:
      *a1 = *a2;
      uint64_t v8 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26A78DBD0);
      uint64_t v9 = v8[12];
      uint64_t v10 = (char *)a1 + v9;
      uint64_t v11 = (char *)a2 + v9;
      uint64_t v12 = sub_25F3F5CC0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
      *(void *)((char *)a1 + v8[16]) = *(void *)((char *)a2 + v8[16]);
      uint64_t v13 = v8[20];
      char v14 = (char *)a1 + v13;
      uint64_t v15 = (char *)a2 + v13;
      v14[8] = v15[8];
      *(void *)char v14 = *(void *)v15;
      uint64_t v16 = v8[24];
      uint64_t v17 = (char *)a1 + v16;
      char v18 = (char *)a2 + v16;
      v17[8] = v18[8];
      *(void *)uint64_t v17 = *(void *)v18;
      break;
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *sub_25F3EA120(void *a1, void *a2)
{
  if (a1 != a2)
  {
    sub_25F3E9DBC((uint64_t)a1, type metadata accessor for TTSVBAudioService.AudioSessionEvent);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        *a1 = *a2;
        uint64_t v15 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26A78DBC8);
        uint64_t v16 = v15[12];
        uint64_t v17 = (char *)a1 + v16;
        char v18 = (char *)a2 + v16;
        uint64_t v19 = sub_25F3F5CC0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v17, v18, v19);
        *(void *)((char *)a1 + v15[16]) = *(void *)((char *)a2 + v15[16]);
        *(void *)((char *)a1 + v15[20]) = *(void *)((char *)a2 + v15[20]);
        break;
      case 2u:
      case 3u:
      case 6u:
      case 7u:
      case 8u:
        *a1 = *a2;
        uint64_t v30 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A78DBB0) + 48);
        uint64_t v31 = (char *)a1 + v30;
        uint64_t v32 = (char *)a2 + v30;
        uint64_t v33 = sub_25F3F5CC0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v33 - 8) + 32))(v31, v32, v33);
        break;
      case 4u:
        *a1 = *a2;
        uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DBC0);
        uint64_t v21 = *(int *)(v20 + 48);
        uint64_t v22 = (char *)a1 + v21;
        uint64_t v23 = (char *)a2 + v21;
        uint64_t v24 = sub_25F3F5CC0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 32))(v22, v23, v24);
        *(void *)((char *)a1 + *(int *)(v20 + 64)) = *(void *)((char *)a2 + *(int *)(v20 + 64));
        break;
      case 5u:
        *a1 = *a2;
        uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DBB8);
        uint64_t v26 = *(int *)(v25 + 48);
        uint64_t v27 = (char *)a1 + v26;
        id v28 = (char *)a2 + v26;
        uint64_t v29 = sub_25F3F5CC0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 32))(v27, v28, v29);
        *((unsigned char *)a1 + *(int *)(v25 + 64)) = *((unsigned char *)a2 + *(int *)(v25 + 64));
        break;
      default:
        *a1 = *a2;
        uint64_t v4 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26A78DBD0);
        uint64_t v5 = v4[12];
        uint64_t v6 = (char *)a1 + v5;
        uint64_t v7 = (char *)a2 + v5;
        uint64_t v8 = sub_25F3F5CC0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
        *(void *)((char *)a1 + v4[16]) = *(void *)((char *)a2 + v4[16]);
        uint64_t v9 = v4[20];
        uint64_t v10 = (char *)a1 + v9;
        uint64_t v11 = (char *)a2 + v9;
        v10[8] = v11[8];
        *(void *)uint64_t v10 = *(void *)v11;
        uint64_t v12 = v4[24];
        uint64_t v13 = (char *)a1 + v12;
        char v14 = (char *)a2 + v12;
        v13[8] = v14[8];
        *(void *)uint64_t v13 = *(void *)v14;
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_25F3EA624()
{
  uint64_t v0 = MEMORY[0x263F8CF48] + 64;
  uint64_t v13 = MEMORY[0x263F8CF48] + 64;
  uint64_t result = sub_25F3F5CC0();
  if (v2 <= 0x3F)
  {
    uint64_t v3 = *(void *)(result - 8) + 64;
    uint64_t v4 = MEMORY[0x263F8CF70] + 64;
    uint64_t v17 = "\t";
    swift_getTupleTypeLayout();
    uint64_t v19 = &v18;
    uint64_t v13 = v0;
    uint64_t v14 = v3;
    uint64_t v15 = v4;
    uint64_t v16 = v0;
    swift_getTupleTypeLayout();
    uint64_t v20 = &v12;
    swift_getTupleTypeLayout2();
    uint64_t v21 = &v11;
    swift_getTupleTypeLayout2();
    uint64_t v22 = &v10;
    swift_getTupleTypeLayout3();
    uint64_t v23 = &v9;
    swift_getTupleTypeLayout3();
    uint64_t v24 = &v8;
    swift_getTupleTypeLayout2();
    uint64_t v25 = &v7;
    swift_getTupleTypeLayout2();
    uint64_t v26 = &v6;
    swift_getTupleTypeLayout2();
    uint64_t v27 = &v5;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_25F3EA7D8()
{
  return type metadata accessor for TTSVBAudioService.State(0);
}

void sub_25F3EA7E0()
{
  sub_25F3EA8A0();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_25F3EA8A0()
{
  if (!qword_26B398890)
  {
    sub_25F3F5B60();
    unint64_t v0 = sub_25F3F6680();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B398890);
    }
  }
}

ValueMetadata *type metadata accessor for RecordingMode()
{
  return &type metadata for RecordingMode;
}

uint64_t getEnumTagSinglePayload for RecordingState(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for RecordingState(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25F3EAA64);
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

ValueMetadata *type metadata accessor for RecordingState()
{
  return &type metadata for RecordingState;
}

unsigned char *_s31TextToSpeechVoiceBankingSupport20RecordingEnvironmentOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25F3EAB68);
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

ValueMetadata *type metadata accessor for RecordingEnvironment()
{
  return &type metadata for RecordingEnvironment;
}

uint64_t getEnumTagSinglePayload for TTSVBAudioService.RecordingStatus(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for TTSVBAudioService.RecordingStatus(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_25F3EAC2C(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_25F3EAC44(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)uint64_t result = a2 - 2;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for TTSVBAudioService.RecordingStatus()
{
  return &type metadata for TTSVBAudioService.RecordingStatus;
}

void type metadata accessor for InterruptionReason(uint64_t a1)
{
}

void type metadata accessor for InterruptionOptions(uint64_t a1)
{
}

void type metadata accessor for InterruptionType(uint64_t a1)
{
}

void type metadata accessor for RouteChangeReason(uint64_t a1)
{
}

void type metadata accessor for SilenceSecondaryAudioHintType(uint64_t a1)
{
}

uint64_t sub_25F3EACD0()
{
  return sub_25F3EAD60(&qword_26A78DC30, type metadata accessor for InterruptionOptions);
}

uint64_t sub_25F3EAD18()
{
  return sub_25F3EAD60(&qword_26A78DC38, type metadata accessor for InterruptionOptions);
}

uint64_t sub_25F3EAD60(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25F3EADA8()
{
  return sub_25F3EAD60(&qword_26A78DC40, type metadata accessor for InterruptionOptions);
}

uint64_t sub_25F3EADF0()
{
  return sub_25F3EAD60(&qword_26A78DC48, type metadata accessor for InterruptionOptions);
}

void type metadata accessor for NSKeyValueChangeKey(uint64_t a1)
{
}

uint64_t sub_25F3EAE50()
{
  return sub_25F3DA254(*(void (**)(char *))(v0 + 16), *(void *)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_25F3EAE70()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25F3EAEA8()
{
  return sub_25F3D625C(*(void (**)(char *))(v0 + 16));
}

id sub_25F3EAEC4()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[5];
  int v4 = *(void **)(v0[2] + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioSession);
  id v7 = 0;
  if (objc_msgSend(v4, sel_setCategory_mode_options_error_, v1, v2, v3, &v7)) {
    return v7;
  }
  id v6 = v7;
  sub_25F3F5980();

  return (id)swift_willThrow();
}

id sub_25F3EAF4C()
{
  uint64_t v1 = *(void **)(*(void *)(v0 + 16)
                + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioSession);
  id v4 = 0;
  if (objc_msgSend(v1, sel_setActive_error_, 1, &v4)) {
    return v4;
  }
  id v3 = v4;
  sub_25F3F5980();

  return (id)swift_willThrow();
}

void type metadata accessor for PolarPattern(uint64_t a1)
{
}

void type metadata accessor for Port(uint64_t a1)
{
}

uint64_t sub_25F3EB000(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B398888);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25F3EB068()
{
  uint64_t v1 = sub_25F3F5B60();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  unint64_t v5 = (((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v8 = v3 | 7;
  swift_bridgeObjectRelease();

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, ((((((((((v6 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)+ 23) & 0xFFFFFFFFFFFFFFF8)+ 16, v8);
}

uint64_t sub_25F3EB1F0()
{
  uint64_t v1 = *(void *)(sub_25F3F5B60() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v3 = (*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v4 = (v3 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v5 = (v4 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v7 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v9 = (v8 + 15) & 0xFFFFFFFFFFFFFFF8;
  return sub_25F3DC0BC(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned __int16 *)(v0 + 32), *(void *)(v0 + 40), v0 + v2, *(void ***)(v0 + v3), *(void **)(v0 + v3 + 8), *(char **)(v0 + v4), *(void **)(v0 + v5), *(void *)(v0 + v6), *(void *)(v0 + v7), *(void **)(v0 + v7 + 8), *(void *)(v0 + v8), *(void *)(v0 + v9), *(void *)(v0 + v9 + 8), *(void ***)(v0 + ((v9 + 23) & 0xFFFFFFFFFFFFFFF8)), *(void ***)(v0 + ((v9 + 23) & 0xFFFFFFFFFFFFFFF8) + 8));
}

uint64_t sub_25F3EB300()
{
  return sub_25F3DD230(*(void (**)(char *))(v0 + 16), *(void *)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_25F3EB320()
{
  uint64_t v1 = sub_25F3F5B60();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 72) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  swift_release();

  return MEMORY[0x270FA0238](v0, ((v6 + 15) & 0xFFFFFFFFFFFFFFF8) + 16, v5);
}

uint64_t sub_25F3EB434()
{
  uint64_t v1 = *(void *)(sub_25F3F5B60() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v3 = (*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  return sub_25F3DC8F0(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void **)(v0 + 56), *(void *)(v0 + 64), (void *)(v0 + v2), *(void *)(v0 + v3), *(void *)(v0 + ((v3 + 15) & 0xFFFFFFFFFFFFFFF8)), *(void *)(v0 + ((v3 + 15) & 0xFFFFFFFFFFFFFFF8) + 8));
}

uint64_t sub_25F3EB4E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B398888);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_25F3EB54C()
{
  uint64_t v1 = (int *)(type metadata accessor for TTSVBAudioService.RecordingResult(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  swift_release();

  uint64_t v6 = v0 + v3 + v1[7];
  uint64_t v7 = sub_25F3F5B60();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_25F3EB668(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TTSVBAudioService.RecordingResult(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25F3EB6CC()
{
  uint64_t v1 = *(void *)(type metadata accessor for TTSVBAudioService.RecordingResult(0) - 8);
  uint64_t v2 = *(void (**)(char *))(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  return sub_25F3DD158(v2, v3, v4);
}

uint64_t sub_25F3EB730()
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_25F3EB770()
{
  return sub_25F3DD414(*(unsigned char *)(v0 + 16), *(void *)(v0 + 24), *(id *)(v0 + 40), *(void **)(v0 + 48), *(double *)(v0 + 32));
}

id sub_25F3EB784()
{
  id v0 = sub_25F3D0F40();
  id v4 = 0;
  unsigned int v1 = objc_msgSend(v0, sel_startAndReturnError_, &v4);

  if (v1) {
    return v4;
  }
  id v3 = v4;
  sub_25F3F5980();

  return (id)swift_willThrow();
}

void sub_25F3EB80C(void *a1, void *a2)
{
  swift_beginAccess();
  uint64_t v5 = MEMORY[0x2611F22B0](v2 + 16);
  if (v5)
  {
    uint64_t v6 = (char *)v5;
    uint64_t v7 = *(void **)(v5 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_speechRecognitionService);
    unint64_t v8 = *(void (**)(void *))((*MEMORY[0x263F8EED0] & *v7) + 0x1A8);
    unint64_t v9 = v7;
    v8(a1);

    uint64_t v10 = *(void *)(*(void *)&v6[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_state]
                    + OBJC_IVAR____TtCC31TextToSpeechVoiceBankingSupport17TTSVBAudioServiceP33_2F288AB684677915D8A6F8C1A2A5794F5State_bufferHistory);
    swift_retain();
    v35.value = (Swift::UInt64)objc_msgSend(a2, sel_hostTime);
    v35.is_nil = 0;
    v11.n128_f64[0] = TTSVBTimestampInSeconds(when:)(v35);
    (*(void (**)(void *, __n128))(*(void *)v10 + 264))(a1, v11);
    swift_release();
    char v12 = (uint64_t *)objc_msgSend(a1, sel_floatChannelData);
    if (!v12)
    {
LABEL_22:

      return;
    }
    uint64_t v13 = *v12;
    unsigned int v14 = objc_msgSend(a1, sel_frameLength);
    id v15 = objc_msgSend(a1, sel_stride);
    if (!v15)
    {
      __break(1u);
      return;
    }
    uint64_t v16 = sub_25F3E0394(0, v14, (uint64_t)v15, v13);
    int64_t v17 = *(void *)(v16 + 16);
    if (v17)
    {
      uint64_t v34 = MEMORY[0x263F8EE78];
      sub_25F3E744C(0, v17, 0);
      uint64_t v18 = 0;
      uint64_t v19 = v34;
      unint64_t v20 = *(void *)(v34 + 16);
      do
      {
        float v21 = *(float *)(v16 + 4 * v18 + 32);
        unint64_t v22 = *(void *)(v34 + 24);
        if (v20 >= v22 >> 1) {
          sub_25F3E744C(v22 > 1, v20 + 1, 1);
        }
        ++v18;
        *(void *)(v34 + 16) = v20 + 1;
        *(float *)(v34 + 4 * v20++ + 32) = v21 * v21;
      }
      while (v17 != v18);
      swift_bridgeObjectRelease();
      uint64_t v23 = *(void *)(v34 + 16);
      if (v23)
      {
LABEL_10:
        if (v23 == 1)
        {
          uint64_t v24 = 0;
          float v25 = 0.0;
        }
        else
        {
          uint64_t v24 = v23 & 0x7FFFFFFFFFFFFFFELL;
          uint64_t v26 = (float *)(v19 + 36);
          float v25 = 0.0;
          uint64_t v27 = v23 & 0x7FFFFFFFFFFFFFFELL;
          do
          {
            float v25 = (float)(v25 + *(v26 - 1)) + *v26;
            v26 += 2;
            v27 -= 2;
          }
          while (v27);
          if (v23 == v24)
          {
LABEL_19:
            swift_bridgeObjectRelease();
            log10f(sqrtf(v25 / (float)objc_msgSend(a1, sel_frameLength)));
            uint64_t v31 = &v6[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_numberOfAudioMagnitudes];
            swift_beginAccess();
            if (*(uint64_t *)v31 > 0)
            {
              type metadata accessor for AudioPowerLevelNormalizer();
              swift_retain();
              double v32 = sub_25F34D63C();
              (*(void (**)(uint64_t, id, void))(*(void *)v33 + 496))(v13, objc_msgSend(a1, sel_frameLength, v32), *(void *)v31);
              swift_release();
              sub_25F3F5F00();
              swift_release();
            }
            swift_retain();
            sub_25F3F5F00();
            swift_release();
            goto LABEL_22;
          }
        }
        uint64_t v28 = v23 - v24;
        uint64_t v29 = (float *)(v19 + 4 * v24 + 32);
        do
        {
          float v30 = *v29++;
          float v25 = v25 + v30;
          --v28;
        }
        while (v28);
        goto LABEL_19;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v19 = MEMORY[0x263F8EE78];
      uint64_t v23 = *(void *)(MEMORY[0x263F8EE78] + 16);
      if (v23) {
        goto LABEL_10;
      }
    }
    float v25 = 0.0;
    goto LABEL_19;
  }
}

uint64_t sub_25F3EBC50()
{
  swift_release();

  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_25F3EBC98()
{
  return sub_25F3D8D1C(*(void *)(v0 + 16), *(void *)(v0 + 24), *(uint64_t **)(v0 + 32), *(void *)(v0 + 40));
}

uint64_t objectdestroy_125Tm()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_25F3EBCE8()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25F3EBD20()
{
  unsigned int v1 = *(void **)(*(void *)(v0 + 16)
                + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioSession);
  swift_retain();
  objc_msgSend(v1, sel_isInputAvailable);
  sub_25F3F5F00();
  return swift_release();
}

void type metadata accessor for RateDidChangeReason(uint64_t a1)
{
}

uint64_t sub_25F3EBDA4()
{
  return sub_25F3EAD60(&qword_26A78DD18, type metadata accessor for NSKeyValueChangeKey);
}

uint64_t sub_25F3EBDEC()
{
  return sub_25F3EAD60(&qword_26A78DD20, type metadata accessor for NSKeyValueChangeKey);
}

uint64_t sub_25F3EBE34()
{
  return sub_25F3EAD60(&qword_26A78DD28, type metadata accessor for PolarPattern);
}

uint64_t sub_25F3EBE7C()
{
  return sub_25F3EAD60(&qword_26A78DD30, type metadata accessor for PolarPattern);
}

uint64_t sub_25F3EBEC4()
{
  return sub_25F3EAD60(&qword_26A78DD38, type metadata accessor for PolarPattern);
}

uint64_t sub_25F3EBF0C()
{
  return sub_25F3EAD60(&qword_26A78DD40, type metadata accessor for Port);
}

uint64_t sub_25F3EBF54()
{
  return sub_25F3EAD60(&qword_26A78DD48, type metadata accessor for Port);
}

uint64_t sub_25F3EBF9C()
{
  return sub_25F3EAD60(&qword_26A78DD50, type metadata accessor for Port);
}

uint64_t sub_25F3EBFE4()
{
  return sub_25F3EAD60(&qword_26A78DD58, type metadata accessor for RateDidChangeReason);
}

uint64_t sub_25F3EC02C()
{
  return sub_25F3EAD60(&qword_26A78DD60, type metadata accessor for RateDidChangeReason);
}

uint64_t sub_25F3EC074()
{
  return sub_25F3EAD60(&qword_26A78DD68, type metadata accessor for RateDidChangeReason);
}

uint64_t sub_25F3EC0BC()
{
  return sub_25F3EAD60(&qword_26A78DD70, type metadata accessor for NSKeyValueChangeKey);
}

uint64_t static TTSVBLocalVoiceModelMO.findOrFetch(modelID:moc:)(uint64_t a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A78D0C0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_25F3FE240;
  sub_25F3236F0(0, &qword_26A78D0B8);
  *(void *)(v3 + 56) = MEMORY[0x263F8D310];
  *(void *)(v3 + 64) = sub_25F336038();
  *(void *)(v3 + 32) = 0x44496C65646F6DLL;
  *(void *)(v3 + 40) = 0xE700000000000000;
  uint64_t v4 = sub_25F3F5CF0();
  *(void *)(v3 + 96) = sub_25F3236F0(0, &qword_26A78D0D0);
  *(void *)(v3 + 104) = sub_25F336080();
  *(void *)(v3 + 72) = v4;
  uint64_t v5 = (void *)sub_25F3F6460();
  uint64_t v6 = type metadata accessor for TTSVBLocalVoiceModelMO();
  static DSO<>.findOrFetch(in:matching:)(a2, v5, v6, (uint64_t)&protocol witness table for TTSVBLocalVoiceModelMO);
  uint64_t v8 = v7;

  return v8;
}

uint64_t type metadata accessor for TTSVBLocalVoiceModelMO()
{
  return self;
}

uint64_t static TTSVBLocalVoiceModelMO.requireModelWithID(_:moc:)(uint64_t a1, void *a2)
{
  uint64_t v4 = type metadata accessor for TTSVBError.Reason(0);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v17[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A78D0C0);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_25F3FE240;
  sub_25F3236F0(0, &qword_26A78D0B8);
  *(void *)(v7 + 56) = MEMORY[0x263F8D310];
  *(void *)(v7 + 64) = sub_25F336038();
  *(void *)(v7 + 32) = 0x44496C65646F6DLL;
  *(void *)(v7 + 40) = 0xE700000000000000;
  uint64_t v8 = sub_25F3F5CF0();
  *(void *)(v7 + 96) = sub_25F3236F0(0, &qword_26A78D0D0);
  *(void *)(v7 + 104) = sub_25F336080();
  *(void *)(v7 + 72) = v8;
  unint64_t v9 = (void *)sub_25F3F6460();
  uint64_t v10 = type metadata accessor for TTSVBLocalVoiceModelMO();
  static DSO<>.findOrFetch(in:matching:)(a2, v9, v10, (uint64_t)&protocol witness table for TTSVBLocalVoiceModelMO);
  uint64_t v12 = v11;

  if (!v12)
  {
    v17[0] = 0;
    v17[1] = 0;
    char v18 = 3;
    uint64_t v13 = sub_25F3F5D30();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16))(v6, a1, v13);
    swift_storeEnumTagMultiPayload();
    uint64_t v12 = type metadata accessor for TTSVBError(0);
    sub_25F3EE520((unint64_t *)&qword_26B3988A8, 255, (void (*)(uint64_t))type metadata accessor for TTSVBError);
    swift_allocError();
    TTSVBError.init(_:_:_:)((uint64_t)v17, (uint64_t)v6, 0, v14);
    swift_willThrow();
  }
  return v12;
}

id sub_25F3EC5A8()
{
  id v0 = objc_allocWithZone(MEMORY[0x263EFF260]);
  unsigned int v1 = (void *)sub_25F3F6100();
  id v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

void sub_25F3EC614(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_25F3EC620(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

void sub_25F3EC62C(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_25F3EC638(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

void sub_25F3EC644(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_25F3EC650(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

void sub_25F3EC65C(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_25F3EC668(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

id sub_25F3EC674@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_isDownloaded);
  *a2 = result;
  return result;
}

id sub_25F3EC6B0(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIsDownloaded_, *a1);
}

uint64_t sub_25F3EC6C4@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_25F3EC8C8(a1, (SEL *)&selRef_modelID, MEMORY[0x270FA93E0], MEMORY[0x270FA9540], a2);
}

void sub_25F3EC6E0(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

void sub_25F3EC704(uint64_t a1, void **a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void), SEL *a8)
{
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(a5);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25F3078D4(a1, (uint64_t)v16, a5);
  int64_t v17 = *a2;
  uint64_t v18 = a6(0);
  uint64_t v19 = *(void *)(v18 - 8);
  unint64_t v20 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v16, 1, v18) != 1)
  {
    unint64_t v20 = (void *)a7();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v16, v18);
  }
  objc_msgSend(v17, *a8, v20);
}

void sub_25F3EC84C(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_25F3EC858(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

id sub_25F3EC864@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_status_);
  *a2 = (_WORD)result;
  return result;
}

id sub_25F3EC898(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setStatus__, *a1);
}

uint64_t sub_25F3EC8AC@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_25F3EC8C8(a1, (SEL *)&selRef_trainingFinishedDate, MEMORY[0x270FA90E0], MEMORY[0x270FA92B0], a2);
}

uint64_t sub_25F3EC8C8@<X0>(id *a1@<X0>, SEL *a2@<X3>, void (*a3)(void)@<X4>, uint64_t (*a4)(void)@<X5>, uint64_t a5@<X8>)
{
  id v8 = [*a1 *a2];
  if (v8)
  {
    unint64_t v9 = v8;
    a3();

    uint64_t v10 = ((uint64_t (*)(void))a4)(0);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56);
    uint64_t v12 = v10;
    uint64_t v13 = a5;
    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v15 = a4();
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
    uint64_t v12 = v15;
    uint64_t v13 = a5;
    uint64_t v14 = 1;
  }

  return v11(v13, v14, 1, v12);
}

void sub_25F3EC9A8(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

void sub_25F3EC9CC(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_25F3EC9D8(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

id sub_25F3EC9E4@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_trainingStatus_);
  *a2 = (_WORD)result;
  return result;
}

id sub_25F3ECA18(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setTrainingStatus__, *a1);
}

id sub_25F3ECA2C@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_trainingTaskProgress);
  *a2 = v4;
  return result;
}

id sub_25F3ECA60(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setTrainingTaskProgress_, *a1);
}

void sub_25F3ECA74(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_25F3ECA80(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

id sub_25F3ECA8C@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_files);
  *a2 = result;
  return result;
}

id sub_25F3ECAC8(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setFiles_, *a1);
}

uint64_t sub_25F3ECADC@<X0>(void *a1@<X0>, char *a2@<X8>)
{
  if (a1)
  {
    uint64_t v6 = a1;
    goto LABEL_5;
  }
  id v7 = objc_msgSend(v2, sel_voice);
  if (v7)
  {
    uint64_t v6 = v7;
LABEL_5:
    id v8 = a1;
    id v9 = objc_msgSend(v6, sel_name);
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v36 = v2;
      id v37 = a2;
      uint64_t v11 = sub_25F3F6130();
      uint64_t v13 = v12;

      id v14 = objc_msgSend(v6, sel_voiceID, v36);
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3988A0);
      MEMORY[0x270FA5388](v15 - 8);
      uint64_t v3 = (char *)&v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
      if (v14)
      {
        uint64_t v17 = sub_25F3F5D30();
        uint64_t v18 = *(void *)(v17 - 8);
        MEMORY[0x270FA5388](v17);
        unint64_t v20 = (char *)&v36 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
        sub_25F3F5D10();

        (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v3, v20, v17);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v3, 0, 1, v17);
        uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48))(v3, 1, v17);
        if (result != 1)
        {
          uint64_t v22 = type metadata accessor for TTSVBLocalVoiceModelMO();
          uint64_t v24 = sub_25F3EE520(&qword_26A78D470, v23, (void (*)(uint64_t))type metadata accessor for TTSVBLocalVoiceModelMO);
          TTSVBCommonVoiceModelMO.immutableModel(voiceName:voiceID:)(v11, v13, v22, v24, v37);

          swift_bridgeObjectRelease();
          return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v3, v17);
        }
LABEL_15:
        __break(1u);
        return result;
      }
    }
    else
    {
      __break(1u);
    }
    uint64_t v35 = sub_25F3F5D30();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v3, 1, 1, v35);
    goto LABEL_15;
  }
  uint64_t v25 = sub_25F3EFA00();
  uint64_t v26 = sub_25F3F5EA0();
  uint64_t v27 = *(void *)(v26 - 8);
  double v28 = MEMORY[0x270FA5388](v26);
  float v30 = (char *)&v36 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, double))(v27 + 16))(v30, v25, v26, v28);
  uint64_t v31 = sub_25F3F5E80();
  os_log_type_t v32 = sub_25F3F64C0();
  if (os_log_type_enabled(v31, v32))
  {
    uint64_t v33 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v33 = 0;
    _os_log_impl(&dword_25F2F5000, v31, v32, "Cannot return immutableModel. no related voice was found.", v33, 2u);
    MEMORY[0x2611F21E0](v33, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v27 + 8))(v30, v26);
  uint64_t v34 = type metadata accessor for TTSVBVoiceModel();
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(a2, 1, 1, v34);
}

id TTSVBLocalVoiceModelMO.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  id v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id TTSVBLocalVoiceModelMO.init(entity:insertInto:)(void *a1, void *a2)
{
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for TTSVBLocalVoiceModelMO();
  id v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id TTSVBLocalVoiceModelMO.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TTSVBLocalVoiceModelMO();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_25F3ED070@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for TTSVBLocalVoiceModelMO();
  uint64_t result = sub_25F3F68A0();
  *a1 = result;
  return result;
}

uint64_t sub_25F3ED0B0@<X0>(uint64_t a1@<X8>)
{
  return sub_25F3EDD10((SEL *)&selRef_creationDate, MEMORY[0x270FA90E0], MEMORY[0x270FA92B0], a1);
}

void sub_25F3ED0CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

uint64_t (*sub_25F3ED0E8(void *a1))()
{
  objc_super v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_25F3ED140(v2);
  return sub_25F337360;
}

void (*sub_25F3ED140(void *a1))(uint64_t a1, char a2)
{
  objc_super v2 = v1;
  *a1 = v1;
  size_t v4 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B398898) - 8) + 64);
  a1[1] = v4;
  id v5 = malloc(v4);
  a1[2] = v5;
  id v6 = objc_msgSend(v2, sel_creationDate);
  objc_super v7 = malloc(v4);
  a1[3] = v7;
  if (v6)
  {
    sub_25F3F5C80();

    uint64_t v8 = sub_25F3F5CC0();
    (*(void (**)(void *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = sub_25F3F5CC0();
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  sub_25F307A7C((uint64_t)v7, (uint64_t)v5, &qword_26B398898);
  return sub_25F3ED290;
}

void sub_25F3ED290(uint64_t a1, char a2)
{
}

uint64_t sub_25F3ED2B4(uint64_t a1, uint64_t a2)
{
  return sub_25F337404(a1, a2, (SEL *)&selRef_creationDeviceModel);
}

void sub_25F3ED2C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

uint64_t (*sub_25F3ED2CC(uint64_t **a1))()
{
  objc_super v2 = (uint64_t *)malloc(0x28uLL);
  *a1 = v2;
  v2[4] = (uint64_t)sub_25F3ED324(v2);
  return sub_25F337360;
}

void (*sub_25F3ED324(uint64_t *a1))(uint64_t a1, char a2)
{
  a1[2] = (uint64_t)v1;
  id v3 = objc_msgSend(v1, sel_creationDeviceModel);
  if (v3)
  {
    size_t v4 = v3;
    uint64_t v5 = sub_25F3F6130();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  *a1 = v5;
  a1[1] = v7;
  return sub_25F3ED3AC;
}

void sub_25F3ED3AC(uint64_t a1, char a2)
{
}

uint64_t sub_25F3ED3B8(uint64_t a1, uint64_t a2)
{
  return sub_25F337404(a1, a2, (SEL *)&selRef_creationDeviceName);
}

void sub_25F3ED3C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

uint64_t (*sub_25F3ED3D0(uint64_t **a1))()
{
  objc_super v2 = (uint64_t *)malloc(0x28uLL);
  *a1 = v2;
  v2[4] = (uint64_t)sub_25F3ED428(v2);
  return sub_25F337360;
}

void (*sub_25F3ED428(uint64_t *a1))(uint64_t a1, char a2)
{
  a1[2] = (uint64_t)v1;
  id v3 = objc_msgSend(v1, sel_creationDeviceName);
  if (v3)
  {
    size_t v4 = v3;
    uint64_t v5 = sub_25F3F6130();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  *a1 = v5;
  a1[1] = v7;
  return sub_25F3ED4B0;
}

void sub_25F3ED4B0(uint64_t a1, char a2)
{
}

uint64_t sub_25F3ED4BC(uint64_t a1, uint64_t a2)
{
  return sub_25F337404(a1, a2, (SEL *)&selRef_creationDeviceUDID);
}

void sub_25F3ED4C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

uint64_t (*sub_25F3ED4D4(uint64_t **a1))()
{
  objc_super v2 = (uint64_t *)malloc(0x28uLL);
  *a1 = v2;
  v2[4] = (uint64_t)sub_25F3ED52C(v2);
  return sub_25F337360;
}

void (*sub_25F3ED52C(uint64_t *a1))(uint64_t a1, char a2)
{
  a1[2] = (uint64_t)v1;
  id v3 = objc_msgSend(v1, sel_creationDeviceUDID);
  if (v3)
  {
    size_t v4 = v3;
    uint64_t v5 = sub_25F3F6130();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  *a1 = v5;
  a1[1] = v7;
  return sub_25F3ED5B4;
}

void sub_25F3ED5B4(uint64_t a1, char a2)
{
}

uint64_t sub_25F3ED5C0(uint64_t a1, uint64_t a2)
{
  return sub_25F337404(a1, a2, (SEL *)&selRef_creationOSBuild);
}

void sub_25F3ED5CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

uint64_t (*sub_25F3ED5D8(uint64_t **a1))()
{
  objc_super v2 = (uint64_t *)malloc(0x28uLL);
  *a1 = v2;
  v2[4] = (uint64_t)sub_25F3ED630(v2);
  return sub_25F337360;
}

void (*sub_25F3ED630(uint64_t *a1))(uint64_t a1, char a2)
{
  a1[2] = (uint64_t)v1;
  id v3 = objc_msgSend(v1, sel_creationOSBuild);
  if (v3)
  {
    size_t v4 = v3;
    uint64_t v5 = sub_25F3F6130();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  *a1 = v5;
  a1[1] = v7;
  return sub_25F3ED6B8;
}

void sub_25F3ED6B8(uint64_t a1, char a2)
{
}

id sub_25F3ED6C4()
{
  id v1 = objc_msgSend(v0, sel_isDownloaded);

  return v1;
}

void sub_25F3ED6FC(void *a1)
{
  objc_msgSend(v1, sel_setIsDownloaded_, a1);
}

void (*sub_25F3ED744(void *a1))(id *a1)
{
  a1[1] = v1;
  *a1 = objc_msgSend(v1, sel_isDownloaded);
  return sub_25F3ED7A0;
}

void sub_25F3ED7A0(id *a1)
{
  id v1 = *a1;
  objc_msgSend(a1[1], sel_setIsDownloaded_);
}

uint64_t sub_25F3ED7E8@<X0>(uint64_t a1@<X8>)
{
  return sub_25F3EDD10((SEL *)&selRef_modelID, MEMORY[0x270FA93E0], MEMORY[0x270FA9540], a1);
}

void sub_25F3ED804(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

uint64_t (*sub_25F3ED820(void *a1))()
{
  objc_super v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_25F3ED878(v2);
  return sub_25F337360;
}

void (*sub_25F3ED878(void *a1))(uint64_t a1, char a2)
{
  objc_super v2 = v1;
  *a1 = v1;
  size_t v4 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B3988A0) - 8) + 64);
  a1[1] = v4;
  uint64_t v5 = malloc(v4);
  a1[2] = v5;
  id v6 = objc_msgSend(v2, sel_modelID);
  uint64_t v7 = malloc(v4);
  a1[3] = v7;
  if (v6)
  {
    sub_25F3F5D10();

    uint64_t v8 = sub_25F3F5D30();
    (*(void (**)(void *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = sub_25F3F5D30();
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  sub_25F307A7C((uint64_t)v7, (uint64_t)v5, &qword_26B3988A0);
  return sub_25F3ED9C8;
}

void sub_25F3ED9C8(uint64_t a1, char a2)
{
}

void sub_25F3ED9EC(uint64_t a1, char a2, uint64_t (*a3)(void), uint64_t (*a4)(void), SEL *a5, uint64_t *a6)
{
  uint64_t v10 = *(void **)(a1 + 16);
  if (a2)
  {
    MEMORY[0x270FA5388](a1);
    uint64_t v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_25F3078D4((uint64_t)v10, (uint64_t)v13, v14);
    uint64_t v15 = a3(0);
    uint64_t v16 = *(void *)(v15 - 8);
    uint64_t v17 = 0;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v13, 1, v15) != 1)
    {
      uint64_t v17 = (void *)a4();
      (*(void (**)(char *, uint64_t))(v16 + 8))(v13, v15);
      uint64_t v10 = *(void **)(a1 + 16);
    }
    uint64_t v18 = *(void **)(a1 + 24);
    objc_msgSend(*(id *)a1, *a5, v17);

    free(v18);
    sub_25F307B78((uint64_t)v10, a6);
    free(v10);
  }
  else
  {
    uint64_t v19 = a3(0);
    uint64_t v20 = *(void *)(v19 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v20 + 48))(v10, 1, v19) == 1)
    {
      uint64_t v21 = 0;
    }
    else
    {
      uint64_t v21 = (void *)a4();
      (*(void (**)(void *, uint64_t))(v20 + 8))(v10, v19);
      uint64_t v10 = *(void **)(a1 + 16);
    }
    uint64_t v22 = *(void **)(a1 + 24);
    objc_msgSend(*(id *)a1, *a5, v21);

    free(v22);
    free(v10);
  }
}

id sub_25F3EDC50()
{
  return objc_msgSend(v0, sel_status_);
}

id sub_25F3EDC74(__int16 a1)
{
  return objc_msgSend(v1, sel_setStatus__, a1);
}

id (*sub_25F3EDC88(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  *(_WORD *)(a1 + 8) = (unsigned __int16)objc_msgSend(v1, sel_status_);
  return sub_25F3EDCDC;
}

id sub_25F3EDCDC(uint64_t a1)
{
  return objc_msgSend(*(id *)a1, sel_setStatus__, *(__int16 *)(a1 + 8));
}

uint64_t sub_25F3EDCF4@<X0>(uint64_t a1@<X8>)
{
  return sub_25F3EDD10((SEL *)&selRef_trainingFinishedDate, MEMORY[0x270FA90E0], MEMORY[0x270FA92B0], a1);
}

uint64_t sub_25F3EDD10@<X0>(SEL *a1@<X2>, void (*a2)(void)@<X3>, uint64_t (*a3)(void)@<X4>, uint64_t a4@<X8>)
{
  id v8 = [v4 *a1];
  if (v8)
  {
    uint64_t v9 = v8;
    a2();

    uint64_t v10 = ((uint64_t (*)(void))a3)(0);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56);
    uint64_t v12 = v10;
    uint64_t v13 = a4;
    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v15 = a3();
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
    uint64_t v12 = v15;
    uint64_t v13 = a4;
    uint64_t v14 = 1;
  }

  return v11(v13, v14, 1, v12);
}

void sub_25F3EDDF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_25F3EDE0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t (*a5)(void), SEL *a6)
{
  uint64_t v9 = v6;
  uint64_t v11 = a4(0);
  uint64_t v12 = *(void *)(v11 - 8);
  int v13 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(a1, 1, v11);
  id v14 = 0;
  if (v13 != 1)
  {
    id v15 = (id)a5();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a1, v11);
    id v14 = v15;
  }
  id v16 = v14;
  [v9 *a6];
}

uint64_t (*sub_25F3EDF18(void *a1))()
{
  objc_super v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_25F3EDF70(v2);
  return sub_25F337360;
}

void (*sub_25F3EDF70(void *a1))(uint64_t a1, char a2)
{
  objc_super v2 = v1;
  *a1 = v1;
  size_t v4 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B398898) - 8) + 64);
  a1[1] = v4;
  uint64_t v5 = malloc(v4);
  a1[2] = v5;
  id v6 = objc_msgSend(v2, sel_trainingFinishedDate);
  uint64_t v7 = malloc(v4);
  a1[3] = v7;
  if (v6)
  {
    sub_25F3F5C80();

    uint64_t v8 = sub_25F3F5CC0();
    (*(void (**)(void *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = sub_25F3F5CC0();
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  sub_25F307A7C((uint64_t)v7, (uint64_t)v5, &qword_26B398898);
  return sub_25F3EE0C0;
}

void sub_25F3EE0C0(uint64_t a1, char a2)
{
}

uint64_t sub_25F3EE0E4(uint64_t a1, uint64_t a2)
{
  return sub_25F337404(a1, a2, (SEL *)&selRef_trainingMode);
}

void sub_25F3EE0F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

uint64_t (*sub_25F3EE0FC(uint64_t **a1))()
{
  objc_super v2 = (uint64_t *)malloc(0x28uLL);
  *a1 = v2;
  v2[4] = (uint64_t)sub_25F3EE154(v2);
  return sub_25F337360;
}

void (*sub_25F3EE154(uint64_t *a1))(uint64_t a1, char a2)
{
  a1[2] = (uint64_t)v1;
  id v3 = objc_msgSend(v1, sel_trainingMode);
  if (v3)
  {
    size_t v4 = v3;
    uint64_t v5 = sub_25F3F6130();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  *a1 = v5;
  a1[1] = v7;
  return sub_25F3EE1DC;
}

void sub_25F3EE1DC(uint64_t a1, char a2)
{
}

id sub_25F3EE1E8()
{
  return objc_msgSend(v0, sel_trainingStatus_);
}

id sub_25F3EE20C(__int16 a1)
{
  return objc_msgSend(v1, sel_setTrainingStatus__, a1);
}

id (*sub_25F3EE220(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  *(_WORD *)(a1 + 8) = (unsigned __int16)objc_msgSend(v1, sel_trainingStatus_);
  return sub_25F3EE274;
}

id sub_25F3EE274(uint64_t a1)
{
  return objc_msgSend(*(id *)a1, sel_setTrainingStatus__, *(__int16 *)(a1 + 8));
}

id sub_25F3EE28C()
{
  return objc_msgSend(v0, sel_trainingTaskProgress);
}

id sub_25F3EE29C()
{
  return objc_msgSend(v0, sel_setTrainingTaskProgress_);
}

id (*sub_25F3EE2AC(void *a1))(uint64_t a1)
{
  a1[1] = v1;
  objc_msgSend(v1, sel_trainingTaskProgress);
  *a1 = v3;
  return sub_25F3EE300;
}

id sub_25F3EE300(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 8), sel_setTrainingTaskProgress_, *(double *)a1);
}

uint64_t sub_25F3EE318(uint64_t a1, uint64_t a2)
{
  return sub_25F337404(a1, a2, (SEL *)&selRef_version);
}

void sub_25F3EE324(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

uint64_t (*sub_25F3EE330(uint64_t **a1))()
{
  objc_super v2 = (uint64_t *)malloc(0x28uLL);
  *a1 = v2;
  v2[4] = (uint64_t)sub_25F3EE388(v2);
  return sub_25F337360;
}

void (*sub_25F3EE388(uint64_t *a1))(uint64_t a1, char a2)
{
  a1[2] = (uint64_t)v1;
  id v3 = objc_msgSend(v1, sel_version);
  if (v3)
  {
    size_t v4 = v3;
    uint64_t v5 = sub_25F3F6130();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  *a1 = v5;
  a1[1] = v7;
  return sub_25F3EE410;
}

void sub_25F3EE410(uint64_t a1, char a2)
{
}

uint64_t sub_25F3EE41C(uint64_t a1, uint64_t a2)
{
  return sub_25F337404(a1, a2, (SEL *)&selRef_trainingLocaleID);
}

void sub_25F3EE428(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

uint64_t (*sub_25F3EE434(uint64_t **a1))()
{
  objc_super v2 = (uint64_t *)malloc(0x28uLL);
  *a1 = v2;
  v2[4] = (uint64_t)sub_25F3EE48C(v2);
  return sub_25F337360;
}

void (*sub_25F3EE48C(uint64_t *a1))(uint64_t a1, char a2)
{
  a1[2] = (uint64_t)v1;
  id v3 = objc_msgSend(v1, sel_trainingLocaleID);
  if (v3)
  {
    size_t v4 = v3;
    uint64_t v5 = sub_25F3F6130();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  *a1 = v5;
  a1[1] = v7;
  return sub_25F3EE514;
}

void sub_25F3EE514(uint64_t a1, char a2)
{
}

uint64_t sub_25F3EE520(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_25F3EE568(uint64_t a1)
{
  unint64_t result = sub_25F3EE590();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_25F3EE590()
{
  unint64_t result = qword_26A78D478;
  if (!qword_26A78D478)
  {
    type metadata accessor for TTSVBLocalVoiceModelMO();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A78D478);
  }
  return result;
}

char *keypath_get_selector_creationDeviceModel()
{
  return sel_creationDeviceModel;
}

char *keypath_get_selector_creationDeviceName()
{
  return sel_creationDeviceName;
}

char *keypath_get_selector_creationDeviceUDID()
{
  return sel_creationDeviceUDID;
}

char *keypath_get_selector_creationOSBuild()
{
  return sel_creationOSBuild;
}

char *keypath_get_selector_isDownloaded()
{
  return sel_isDownloaded;
}

char *keypath_get_selector_modelID()
{
  return sel_modelID;
}

char *keypath_get_selector_trainingLocaleID()
{
  return sel_trainingLocaleID;
}

char *keypath_get_selector_status_()
{
  return sel_status_;
}

char *keypath_get_selector_trainingFinishedDate()
{
  return sel_trainingFinishedDate;
}

char *keypath_get_selector_trainingMode()
{
  return sel_trainingMode;
}

char *keypath_get_selector_trainingStatus_()
{
  return sel_trainingStatus_;
}

char *keypath_get_selector_trainingTaskProgress()
{
  return sel_trainingTaskProgress;
}

char *keypath_get_selector_version()
{
  return sel_version;
}

char *keypath_get_selector_files()
{
  return sel_files;
}

uint64_t method lookup function for TTSVBLocalVoiceModelMO(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TTSVBLocalVoiceModelMO);
}

uint64_t dispatch thunk of static TTSVBLocalVoiceModelMO.fetchRequest()()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

id sub_25F3EE6AC()
{
  id v0 = objc_allocWithZone(MEMORY[0x263EFF260]);
  id v1 = (void *)sub_25F3F6100();
  id v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

uint64_t static TTSVBCloudVoiceSampleMO.requireSampleWithID(_:voiceID:moc:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v8 = type metadata accessor for TTSVBError.Reason(0);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (void *)((char *)&v15[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t result = _s31TextToSpeechVoiceBankingSupport010TTSVBCloudD8SampleMOC11findOrFetch8sampleID05voiceN03mocACSgSS_10Foundation4UUIDVSo22NSManagedObjectContextCtFZ_0(a1, a2, a3, a4);
  if (!result)
  {
    v15[0] = 0;
    v15[1] = 0;
    char v16 = 3;
    *uint64_t v10 = a1;
    v10[1] = a2;
    swift_storeEnumTagMultiPayload();
    type metadata accessor for TTSVBError(0);
    sub_25F2FE028();
    swift_allocError();
    uint64_t v13 = v12;
    swift_bridgeObjectRetain();
    TTSVBError.init(_:_:_:)((uint64_t)v15, (uint64_t)v10, 0, v13);
    return swift_willThrow();
  }
  return result;
}

void sub_25F3EE844(uint64_t a1, void **a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B398898);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25F33B428(a1, (uint64_t)v6);
  uint64_t v7 = *a2;
  uint64_t v8 = sub_25F3F5CC0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) != 1)
  {
    uint64_t v10 = (void *)sub_25F3F5C40();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
  }
  objc_msgSend(v7, sel_setRecordingDate_, v10);
}

id sub_25F3EE970@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_audioFuture);
  *a2 = result;
  return result;
}

id sub_25F3EE9AC(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setAudioFuture_, *a1);
}

uint64_t sub_25F3EE9C0@<X0>(char *a1@<X8>)
{
  uint64_t ObjectType = swift_getObjectType();
  id v4 = objc_msgSend(v1, sel_voice);
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = objc_msgSend(v4, sel_voiceID);
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3988A0);
    MEMORY[0x270FA5388](v7 - 8);
    uint64_t v9 = (char *)&v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v49 = ObjectType;
    char v50 = a1;
    if (v6)
    {
      uint64_t v10 = sub_25F3F5D30();
      uint64_t v11 = *(void *)(v10 - 8);
      MEMORY[0x270FA5388](v10);
      uint64_t v13 = (char *)&v47 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
      sub_25F3F5D10();

      id v14 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
      v14(v9, v13, v10);
      id v15 = *(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56);
      v15(v9, 0, 1, v10);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) != 1)
      {

        char v16 = v50;
        v14(v50, v9, v10);
        return ((uint64_t (*)(char *, void, uint64_t, uint64_t))v15)(v16, 0, 1, v10);
      }
    }
    else
    {
      uint64_t v32 = sub_25F3F5D30();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v9, 1, 1, v32);
    }
    sub_25F307B78((uint64_t)v9, &qword_26B3988A0);
    uint64_t v33 = sub_25F3EFA00();
    uint64_t v34 = sub_25F3F5EA0();
    uint64_t v35 = *(void *)(v34 - 8);
    double v36 = MEMORY[0x270FA5388](v34);
    uint64_t v38 = (char *)&v47 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, uint64_t, uint64_t, double))(v35 + 16))(v38, v33, v34, v36);
    uint64_t v39 = sub_25F3F5E80();
    os_log_type_t v40 = sub_25F3F64C0();
    if (os_log_type_enabled(v39, v40))
    {
      uint64_t v48 = &v47;
      uint64_t v41 = (uint8_t *)swift_slowAlloc();
      uint64_t v42 = swift_slowAlloc();
      uint64_t v52 = v42;
      *(_DWORD *)uint64_t v41 = 136315138;
      uint64_t v47 = v41 + 4;
      uint64_t v43 = sub_25F3F6CD0();
      uint64_t v51 = sub_25F2FE464(v43, v44, &v52);
      sub_25F3F66A0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25F2F5000, v39, v40, "'voiceID' on voice for on %s was unexpectedly nil", v41, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611F21E0](v42, -1, -1);
      MEMORY[0x2611F21E0](v41, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v35 + 8))(v38, v34);
    uint64_t v45 = v50;
    uint64_t v46 = sub_25F3F5D30();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v46 - 8) + 56))(v45, 1, 1, v46);
  }
  else
  {
    uint64_t v18 = sub_25F3EFA00();
    uint64_t v19 = sub_25F3F5EA0();
    uint64_t v20 = *(void *)(v19 - 8);
    double v21 = MEMORY[0x270FA5388](v19);
    uint64_t v23 = (char *)&v47 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, uint64_t, uint64_t, double))(v20 + 16))(v23, v18, v19, v21);
    uint64_t v24 = sub_25F3F5E80();
    os_log_type_t v25 = sub_25F3F64C0();
    if (os_log_type_enabled(v24, v25))
    {
      char v50 = a1;
      uint64_t v26 = swift_slowAlloc();
      uint64_t v48 = &v47;
      uint64_t v27 = (uint8_t *)v26;
      uint64_t v28 = swift_slowAlloc();
      uint64_t v52 = v28;
      *(_DWORD *)uint64_t v27 = 136315138;
      uint64_t v29 = sub_25F3F6CD0();
      uint64_t v51 = sub_25F2FE464(v29, v30, &v52);
      sub_25F3F66A0();
      a1 = v50;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25F2F5000, v24, v25, "'voice' property on %s was unexpectedly nil", v27, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611F21E0](v28, -1, -1);
      MEMORY[0x2611F21E0](v27, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v20 + 8))(v23, v19);
    uint64_t v31 = sub_25F3F5D30();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(a1, 1, 1, v31);
  }
}

id TTSVBCloudVoiceSampleMO.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  id v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id TTSVBCloudVoiceSampleMO.init(entity:insertInto:)(void *a1, void *a2)
{
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for TTSVBCloudVoiceSampleMO();
  id v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id TTSVBCloudVoiceSampleMO.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TTSVBCloudVoiceSampleMO();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_25F3EF17C@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for TTSVBCloudVoiceSampleMO();
  uint64_t result = sub_25F3F68A0();
  *a1 = result;
  return result;
}

uint64_t (*sub_25F3EF1BC(void *a1))()
{
  objc_super v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_25F3EF214(v2);
  return sub_25F337360;
}

void (*sub_25F3EF214(void *a1))(uint64_t a1, char a2)
{
  objc_super v2 = v1;
  *a1 = v1;
  size_t v4 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B398898) - 8) + 64);
  a1[1] = v4;
  id v5 = malloc(v4);
  a1[2] = v5;
  id v6 = objc_msgSend(v2, sel_recordingDate);
  objc_super v7 = malloc(v4);
  a1[3] = v7;
  if (v6)
  {
    sub_25F3F5C80();

    uint64_t v8 = sub_25F3F5CC0();
    (*(void (**)(void *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = sub_25F3F5CC0();
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  sub_25F33E98C((uint64_t)v7, (uint64_t)v5);
  return sub_25F3EF35C;
}

void sub_25F3EF35C(uint64_t a1, char a2)
{
  id v3 = *(void **)(a1 + 16);
  if (a2)
  {
    MEMORY[0x270FA5388](a1);
    id v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_25F33B428((uint64_t)v3, (uint64_t)v5);
    uint64_t v6 = sub_25F3F5CC0();
    uint64_t v7 = *(void *)(v6 - 8);
    uint64_t v8 = 0;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) != 1)
    {
      uint64_t v8 = (void *)sub_25F3F5C40();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v5, v6);
      id v3 = *(void **)(a1 + 16);
    }
    uint64_t v9 = *(void **)(a1 + 24);
    objc_msgSend(*(id *)a1, sel_setRecordingDate_, v8);

    free(v9);
    sub_25F307B78((uint64_t)v3, &qword_26B398898);
    free(v3);
  }
  else
  {
    uint64_t v10 = sub_25F3F5CC0();
    uint64_t v11 = *(void *)(v10 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v11 + 48))(v3, 1, v10) == 1)
    {
      uint64_t v12 = 0;
    }
    else
    {
      uint64_t v12 = (void *)sub_25F3F5C40();
      (*(void (**)(void *, uint64_t))(v11 + 8))(v3, v10);
      id v3 = *(void **)(a1 + 16);
    }
    uint64_t v13 = *(void **)(a1 + 24);
    objc_msgSend(*(id *)a1, sel_setRecordingDate_, v12);

    free(v13);
    free(v3);
  }
}

uint64_t sub_25F3EF59C()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x58))();
}

uint64_t _s31TextToSpeechVoiceBankingSupport010TTSVBCloudD8SampleMOC11findOrFetch8sampleID05voiceN03mocACSgSS_10Foundation4UUIDVSo22NSManagedObjectContextCtFZ_0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A78D0C0);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_25F3FF0B0;
  uint64_t v8 = MEMORY[0x263F8D310];
  *(void *)(v7 + 56) = MEMORY[0x263F8D310];
  unint64_t v9 = sub_25F336038();
  *(void *)(v7 + 32) = 0x4449656C706D6173;
  *(void *)(v7 + 40) = 0xE800000000000000;
  *(void *)(v7 + 96) = v8;
  *(void *)(v7 + 104) = v9;
  *(void *)(v7 + 64) = v9;
  *(void *)(v7 + 72) = a1;
  *(void *)(v7 + 80) = a2;
  sub_25F3236F0(0, &qword_26A78D0B8);
  *(void *)(v7 + 136) = v8;
  *(void *)(v7 + 144) = v9;
  strcpy((char *)(v7 + 112), "voice.voiceID");
  *(_WORD *)(v7 + 126) = -4864;
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_25F3F5CF0();
  *(void *)(v7 + 176) = sub_25F3236F0(0, &qword_26A78D0D0);
  *(void *)(v7 + 184) = sub_25F336080();
  *(void *)(v7 + 152) = v10;
  uint64_t v11 = (void *)sub_25F3F6460();
  uint64_t v12 = type metadata accessor for TTSVBCloudVoiceSampleMO();
  static DSO<>.findOrFetch(in:matching:)(a4, v11, v12, (uint64_t)&protocol witness table for TTSVBCloudVoiceSampleMO);
  uint64_t v14 = v13;

  return v14;
}

uint64_t type metadata accessor for TTSVBCloudVoiceSampleMO()
{
  return self;
}

unint64_t sub_25F3EF768(uint64_t a1)
{
  unint64_t result = sub_25F3EF790();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_25F3EF790()
{
  unint64_t result = qword_26A78D510;
  if (!qword_26A78D510)
  {
    type metadata accessor for TTSVBCloudVoiceSampleMO();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A78D510);
  }
  return result;
}

char *keypath_get_selector_audioFuture()
{
  return sel_audioFuture;
}

uint64_t method lookup function for TTSVBCloudVoiceSampleMO(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TTSVBCloudVoiceSampleMO);
}

uint64_t dispatch thunk of static TTSVBCloudVoiceSampleMO.fetchRequest()()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of TTSVBCloudVoiceSampleMO.voiceID.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x58))();
}

uint64_t sub_25F3EF844()
{
  uint64_t result = *MEMORY[0x263F21258];
  if (*MEMORY[0x263F21258])
  {
    uint64_t result = sub_25F3F61F0();
    qword_26B399730 = result;
    qword_26B399738 = v1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_25F3EF880(uint64_t a1)
{
  return sub_25F3EFC60(a1, qword_26B399498);
}

uint64_t sub_25F3EF89C()
{
  return sub_25F3EFF2C(&qword_26B3994B0, (uint64_t)qword_26B399498);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t static TTSVBLog.common.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25F3EFDEC(&qword_26B3994B0, (uint64_t)qword_26B399498, a1);
}

uint64_t sub_25F3EF91C(uint64_t a1)
{
  return sub_25F3EFC60(a1, qword_26A7A0BA8);
}

uint64_t sub_25F3EF940()
{
  return sub_25F3EFF2C(&qword_26A7A0BA0, (uint64_t)qword_26A7A0BA8);
}

uint64_t static TTSVBLog.audio.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25F3EFDEC(&qword_26A7A0BA0, (uint64_t)qword_26A7A0BA8, a1);
}

uint64_t sub_25F3EF988(uint64_t a1)
{
  return sub_25F3EFC60(a1, qword_26A7A0BC8);
}

uint64_t static TTSVBLog.speech.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25F3EFDEC(&qword_26A7A0BC0, (uint64_t)qword_26A7A0BC8, a1);
}

uint64_t sub_25F3EF9D4(uint64_t a1)
{
  return sub_25F3EFC60(a1, qword_26B3994D0);
}

uint64_t sub_25F3EFA00()
{
  return sub_25F3EFF2C(&qword_26B3994E8, (uint64_t)qword_26B3994D0);
}

uint64_t static TTSVBLog.coredata.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25F3EFDEC(&qword_26B3994E8, (uint64_t)qword_26B3994D0, a1);
}

uint64_t sub_25F3EFA48(uint64_t a1)
{
  return sub_25F3EFC60(a1, qword_26B399460);
}

uint64_t sub_25F3EFA6C()
{
  return sub_25F3EFF2C(&qword_26B3992C8, (uint64_t)qword_26B399460);
}

uint64_t static TTSVBLog.sync.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25F3EFDEC(&qword_26B3992C8, (uint64_t)qword_26B399460, a1);
}

uint64_t sub_25F3EFAB4(uint64_t a1)
{
  return sub_25F3EFB3C(a1, qword_26B399478, (uint64_t (*)(void))LogTTSVBTrain);
}

uint64_t sub_25F3EFAD4()
{
  return sub_25F3EFF2C(&qword_26B399490, (uint64_t)qword_26B399478);
}

uint64_t static TTSVBLog.train.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25F3EFDEC(&qword_26B399490, (uint64_t)qword_26B399478, a1);
}

uint64_t sub_25F3EFB1C(uint64_t a1)
{
  return sub_25F3EFB3C(a1, qword_26A7A0BE8, (uint64_t (*)(void))LogTTSVBSiri);
}

uint64_t sub_25F3EFB3C(uint64_t a1, uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t v5 = sub_25F3F5EA0();
  __swift_allocate_value_buffer(v5, a2);
  __swift_project_value_buffer(v5, (uint64_t)a2);
  id v6 = (id)a3();
  return sub_25F3F5EB0();
}

uint64_t static TTSVBLog.siri.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25F3EFDEC(&qword_26A7A0BE0, (uint64_t)qword_26A7A0BE8, a1);
}

uint64_t sub_25F3EFBC8(uint64_t a1)
{
  return sub_25F3EFC60(a1, qword_26B3994B8);
}

uint64_t sub_25F3EFBF0()
{
  return sub_25F3EFF2C(&qword_26B3992D0, (uint64_t)qword_26B3994B8);
}

uint64_t static TTSVBLog.daemon.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25F3EFDEC(&qword_26B3992D0, (uint64_t)qword_26B3994B8, a1);
}

uint64_t sub_25F3EFC38(uint64_t a1)
{
  return sub_25F3EFC60(a1, qword_26B3992D8);
}

uint64_t sub_25F3EFC60(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_25F3F5EA0();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  if (qword_26B399740 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  return sub_25F3F5E90();
}

uint64_t sub_25F3EFD1C()
{
  return sub_25F3EFF2C(&qword_26B3992C0, (uint64_t)qword_26B3992D8);
}

uint64_t static TTSVBLog.service.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25F3EFDEC(&qword_26B3992C0, (uint64_t)qword_26B3992D8, a1);
}

id sub_25F3EFD64()
{
  uint64_t v0 = sub_25F3F5EA0();
  __swift_allocate_value_buffer(v0, qword_26A7A0C08);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A7A0C08);
  id result = (id)AXLogTemp();
  if (result) {
    return (id)sub_25F3F5EB0();
  }
  __break(1u);
  return result;
}

uint64_t static TTSVBLog.TMP.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25F3EFDEC(&qword_26A7A0C00, (uint64_t)qword_26A7A0C08, a1);
}

uint64_t sub_25F3EFDEC@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_25F3F5EA0();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v7(a3, v6, v5);
}

uint64_t sub_25F3EFE84()
{
  uint64_t v0 = sub_25F3F5EA0();
  __swift_allocate_value_buffer(v0, qword_26A7A0C28);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A7A0C28);
  return sub_25F3F5E90();
}

uint64_t sub_25F3EFF08()
{
  return sub_25F3EFF2C(&qword_26A7A0C20, (uint64_t)qword_26A7A0C28);
}

uint64_t sub_25F3EFF2C(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_25F3F5EA0();

  return __swift_project_value_buffer(v3, a2);
}

uint64_t static TTSVBLog.liveSpeech.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26A7A0C20 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25F3F5EA0();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26A7A0C28);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t static TTSVBLog.liveSpeech.setter(uint64_t a1)
{
  if (qword_26A7A0C20 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25F3F5EA0();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26A7A0C28);
  swift_beginAccess();
  uint64_t v4 = *(void *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*static TTSVBLog.liveSpeech.modify())()
{
  if (qword_26A7A0C20 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_25F3F5EA0();
  __swift_project_value_buffer(v0, (uint64_t)qword_26A7A0C28);
  swift_beginAccess();
  return j__swift_endAccess;
}

ValueMetadata *type metadata accessor for TTSVBLog()
{
  return &type metadata for TTSVBLog;
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

uint64_t TTSVBVoiceStatus.description.getter()
{
  return 0x6E776F6E6B6E55;
}

uint64_t TTSVBVoiceStatus.localizedTitle.getter()
{
  uint64_t v0 = (void *)sub_25F3F6100();
  id v1 = TTSVBSupportLocString(v0);

  uint64_t v2 = sub_25F3F6130();
  return v2;
}

BOOL TTSVBVoiceStatus.isFinal.getter(uint64_t a1)
{
  return a1 == 4 || a1 == 7;
}

uint64_t sub_25F3F0510()
{
  return sub_25F3F62B0();
}

uint64_t sub_25F3F058C()
{
  return sub_25F3F6290();
}

uint64_t sub_25F3F05F8()
{
  return sub_25F3F06EC(&qword_26A78DDB0);
}

uint64_t sub_25F3F062C()
{
  return sub_25F3F6C70();
}

uint64_t sub_25F3F0674()
{
  return sub_25F3F6C30();
}

uint64_t sub_25F3F06A0()
{
  return sub_25F3F6C70();
}

uint64_t sub_25F3F06E4()
{
  return TTSVBVoiceStatus.description.getter();
}

uint64_t sub_25F3F06EC(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for TTSVBVoiceStatus(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t TTSVBVoice.name.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t type metadata accessor for TTSVBVoice()
{
  uint64_t result = qword_26A7A11D0;
  if (!qword_26A7A11D0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t TTSVBVoice.localeID.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for TTSVBVoice() + 24));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TTSVBVoice.init(name:voiceID:localeID:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  *a6 = a1;
  a6[1] = a2;
  uint64_t v10 = type metadata accessor for TTSVBVoice();
  uint64_t v11 = (char *)a6 + *(int *)(v10 + 20);
  uint64_t v12 = sub_25F3F5D30();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 32))(v11, a3, v12);
  uint64_t v14 = (void *)((char *)a6 + *(int *)(v10 + 24));
  *uint64_t v14 = a4;
  v14[1] = a5;
  return result;
}

uint64_t TTSVBVoice.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v33 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DDC0);
  uint64_t v34 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for TTSVBVoice();
  MEMORY[0x270FA5388](v7);
  unint64_t v9 = (void *)((char *)v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25F3F0C5C();
  sub_25F3F6C80();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  uint64_t v32 = v7;
  char v37 = 0;
  uint64_t v10 = v4;
  *unint64_t v9 = sub_25F3F6A30();
  v9[1] = v12;
  uint64_t v13 = sub_25F3F5D30();
  unint64_t v30 = v28;
  uint64_t v31 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  id v15 = (char *)v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v36 = 1;
  sub_25F3F172C(&qword_26A78CF68);
  sub_25F3F6A80();
  uint64_t v16 = *(int *)(v32 + 20);
  v28[1] = v13;
  uint64_t v29 = v9;
  (*(void (**)(char *, char *, uint64_t))(v31 + 32))((char *)v9 + v16, v15, v13);
  char v35 = 2;
  uint64_t v17 = sub_25F3F6A10();
  uint64_t v19 = v18;
  if (v18)
  {
    uint64_t v20 = v17;
  }
  else
  {
    double v21 = sub_25F307E5C();
    uint64_t v20 = *(void *)v21;
    uint64_t v19 = *((void *)v21 + 1);
    swift_bridgeObjectRetain();
  }
  uint64_t v22 = v33;
  uint64_t v23 = v10;
  uint64_t v24 = v32;
  (*(void (**)(char *, uint64_t))(v34 + 8))(v6, v23);
  uint64_t v25 = *(int *)(v24 + 24);
  uint64_t v26 = (uint64_t)v29;
  uint64_t v27 = (uint64_t *)((char *)v29 + v25);
  *uint64_t v27 = v20;
  v27[1] = v19;
  sub_25F3F0CB0(v26, v22);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return sub_25F3F0D14(v26);
}

unint64_t sub_25F3F0C5C()
{
  unint64_t result = qword_26A7A0F40[0];
  if (!qword_26A7A0F40[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A7A0F40);
  }
  return result;
}

uint64_t sub_25F3F0CB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TTSVBVoice();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25F3F0D14(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TTSVBVoice();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t _s31TextToSpeechVoiceBankingSupport10TTSVBVoiceV7voiceID10Foundation4UUIDVvg_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for TTSVBVoice() + 20);
  uint64_t v4 = sub_25F3F5D30();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t TTSVBVoice.convertToData()()
{
  sub_25F3F5810();
  swift_allocObject();
  sub_25F3F5800();
  type metadata accessor for TTSVBVoice();
  sub_25F3F17A4(&qword_26A78C8D8);
  uint64_t v0 = sub_25F3F57F0();
  swift_release();
  return v0;
}

uint64_t TTSVBVoice.init(data:)(uint64_t a1, unint64_t a2)
{
  sub_25F3F57E0();
  swift_allocObject();
  sub_25F3F57D0();
  type metadata accessor for TTSVBVoice();
  sub_25F3F17A4(&qword_26A78C8D0);
  sub_25F3F57C0();
  sub_25F307390(a1, a2);

  return swift_release();
}

uint64_t TTSVBVoice.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_25F3F61A0();
  swift_bridgeObjectRelease();
  type metadata accessor for TTSVBVoice();
  sub_25F3F5D30();
  sub_25F3F172C((unint64_t *)&qword_26A78CB68);
  sub_25F3F6050();
  swift_bridgeObjectRetain();
  sub_25F3F61A0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_25F3F1084()
{
  uint64_t v1 = 0x44496563696F76;
  if (*v0 != 1) {
    uint64_t v1 = 0x4449656C61636F6CLL;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 1701667182;
  }
}

uint64_t sub_25F3F10D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25F3F20AC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25F3F1100(uint64_t a1)
{
  unint64_t v2 = sub_25F3F0C5C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25F3F113C(uint64_t a1)
{
  unint64_t v2 = sub_25F3F0C5C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t TTSVBVoice.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A78DDC8);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25F3F0C5C();
  sub_25F3F6C90();
  v8[15] = 0;
  sub_25F3F6AE0();
  if (!v1)
  {
    type metadata accessor for TTSVBVoice();
    v8[14] = 1;
    sub_25F3F5D30();
    sub_25F3F172C(&qword_26A78CD68);
    sub_25F3F6B30();
    v8[13] = 2;
    sub_25F3F6AE0();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t TTSVBVoice.hashValue.getter()
{
  return sub_25F3F6C70();
}

uint64_t sub_25F3F13EC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return TTSVBVoice.init(from:)(a1, a2);
}

uint64_t sub_25F3F1404(void *a1)
{
  return TTSVBVoice.encode(to:)(a1);
}

uint64_t sub_25F3F141C()
{
  return sub_25F3F6C70();
}

uint64_t sub_25F3F14BC()
{
  sub_25F3F61A0();
  sub_25F3F5D30();
  sub_25F3F172C((unint64_t *)&qword_26A78CB68);
  sub_25F3F6050();

  return sub_25F3F61A0();
}

uint64_t sub_25F3F1554()
{
  return sub_25F3F6C70();
}

uint64_t sub_25F3F15F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 20);
  uint64_t v5 = sub_25F3F5D30();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

uint64_t _s31TextToSpeechVoiceBankingSupport10TTSVBVoiceV2eeoiySbAC_ACtFZ_0(void *a1, void *a2)
{
  BOOL v4 = *a1 == *a2 && a1[1] == a2[1];
  if (v4 || (char v5 = sub_25F3F6B80(), result = 0, (v5 & 1) != 0))
  {
    uint64_t v7 = type metadata accessor for TTSVBVoice();
    if (sub_25F3F5D00())
    {
      uint64_t v8 = *(int *)(v7 + 24);
      uint64_t v9 = *(void *)((char *)a1 + v8);
      uint64_t v10 = *(void *)((char *)a1 + v8 + 8);
      uint64_t v11 = (void *)((char *)a2 + v8);
      if (v9 == *v11 && v10 == v11[1])
      {
        return 1;
      }
      else
      {
        return sub_25F3F6B80();
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t sub_25F3F172C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_25F3F5D30();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25F3F1770()
{
  return sub_25F3F17A4(&qword_26A78DDD0);
}

uint64_t sub_25F3F17A4(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for TTSVBVoice();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25F3F17E8()
{
  return sub_25F3F172C((unint64_t *)&qword_26A78CB68);
}

uint64_t *initializeBufferWithCopyOfBuffer for TTSVBVoice(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  BOOL v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    uint64_t *v4 = *a2;
    BOOL v4 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
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
    uint64_t v11 = sub_25F3F5D30();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = *(int *)(a3 + 24);
    uint64_t v14 = (uint64_t *)((char *)v4 + v13);
    id v15 = (uint64_t *)((char *)a2 + v13);
    uint64_t v16 = v15[1];
    *uint64_t v14 = *v15;
    v14[1] = v16;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for TTSVBVoice(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_25F3F5D30();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for TTSVBVoice(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_25F3F5D30();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = (void *)((char *)a1 + v12);
  uint64_t v14 = (void *)((char *)a2 + v12);
  uint64_t v15 = v14[1];
  *uint64_t v13 = *v14;
  v13[1] = v15;
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for TTSVBVoice(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25F3F5D30();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *initializeWithTake for TTSVBVoice(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25F3F5D30();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void *assignWithTake for TTSVBVoice(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_25F3F5D30();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  uint64_t v15 = *v13;
  uint64_t v14 = v13[1];
  *uint64_t v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TTSVBVoice(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25F3F1C9C);
}

uint64_t sub_25F3F1C9C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_25F3F5D30();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for TTSVBVoice(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25F3F1D60);
}

uint64_t sub_25F3F1D60(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_25F3F5D30();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_25F3F1E08()
{
  uint64_t result = sub_25F3F5D30();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for TTSVBVoice.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 2;
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
        JUMPOUT(0x25F3F1F6CLL);
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
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TTSVBVoice.CodingKeys()
{
  return &type metadata for TTSVBVoice.CodingKeys;
}

unint64_t sub_25F3F1FA8()
{
  unint64_t result = qword_26A7A12E0[0];
  if (!qword_26A7A12E0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A7A12E0);
  }
  return result;
}

unint64_t sub_25F3F2000()
{
  unint64_t result = qword_26A7A13F0;
  if (!qword_26A7A13F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7A13F0);
  }
  return result;
}

unint64_t sub_25F3F2058()
{
  unint64_t result = qword_26A7A13F8[0];
  if (!qword_26A7A13F8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A7A13F8);
  }
  return result;
}

uint64_t sub_25F3F20AC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v2 || (sub_25F3F6B80() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x44496563696F76 && a2 == 0xE700000000000000 || (sub_25F3F6B80() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x4449656C61636F6CLL && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_25F3F6B80();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_25F3F21F4()
{
  uint64_t v0 = sub_25F3F5E20();
  __swift_allocate_value_buffer(v0, qword_26A7A1488);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A7A1488);
  return sub_25F3F5E10();
}

uint64_t sub_25F3F2278()
{
  if (qword_26A7A1480 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_25F3F5E20();

  return __swift_project_value_buffer(v0, (uint64_t)qword_26A7A1488);
}

uint64_t static TTSVBSignposter.download.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26A7A1480 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25F3F5E20();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26A7A1488);
  unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

char **sub_25F3F2384()
{
  return &off_265539CF0;
}

const char *static StaticString.TTSVBDownloadASRInterval.getter()
{
  return "DownloadASRInterval";
}

ValueMetadata *type metadata accessor for TTSVBSignposter()
{
  return &type metadata for TTSVBSignposter;
}

void *TTSVBCommonVoiceSampleMO.trainingValidity.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X8>)
{
  char v6 = (void *)(*(uint64_t (**)(void))(a2 + 328))();
  float v7 = (*(float (**)(uint64_t, uint64_t))(a2 + 352))(a1, a2);
  float v8 = (*(float (**)(uint64_t, uint64_t))(a2 + 400))(a1, a2);
  float v9 = (*(float (**)(uint64_t, uint64_t))(a2 + 376))(a1, a2);
  float v10 = (*(float (**)(uint64_t, uint64_t))(a2 + 424))(a1, a2);

  return static TTSVBVoiceSampleTrainingValidity.evaluate(userScore:spl:splThreshold:snr:snrThreshold:)(v6, a3, v7, v8, v9, v10);
}

uint64_t TTSVBCommonVoiceSampleMO.flags.getter@<X0>(uint64_t a1@<X1>, _DWORD *a2@<X8>)
{
  uint64_t v3 = (*(uint64_t (**)(void))(a1 + 448))();

  return TTSVBVoiceSampleFlags.init(rawValue:)(v3, a2);
}

uint64_t sub_25F3F2500@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, _DWORD *a3@<X8>)
{
  uint64_t result = TTSVBCommonVoiceSampleMO.flags.getter(*(void *)(a2 + a1 - 8), &v5);
  *a3 = v5;
  return result;
}

uint64_t sub_25F3F2548(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a4 + a3 - 16);
  uint64_t v4 = *(void *)(a4 + a3 - 8);
  unsigned int v7 = *a1;
  return TTSVBCommonVoiceSampleMO.flags.setter(&v7, v5, v4);
}

uint64_t TTSVBCommonVoiceSampleMO.flags.setter(unsigned int *a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 456))(*a1);
}

uint64_t (*TTSVBCommonVoiceSampleMO.flags.modify(void *a1, uint64_t a2, uint64_t a3))(uint64_t a1)
{
  uint64_t v4 = a1 + 3;
  a1[1] = a3;
  a1[2] = v3;
  *a1 = a2;
  uint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 448))(a2, a3);
  TTSVBVoiceSampleFlags.init(rawValue:)(v5, v4);
  return sub_25F3F2618;
}

uint64_t sub_25F3F2618(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 8) + 456))(*(unsigned int *)(a1 + 24), *(void *)a1);
}

uint64_t TTSVBCommonVoiceSampleMO.hasVoiceRecording.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25F3F5B60();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unsigned int v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B398888);
  MEMORY[0x270FA5388](v8 - 8);
  float v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  TTSVBCommonVoiceSampleMO.url.getter(a1, a2, (uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4) == 1)
  {
    sub_25F307B78((uint64_t)v10, &qword_26B398888);
    unsigned __int8 v11 = 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v10, v4);
    v13[1] = *sub_25F39FB9C();
    unsigned __int8 v11 = _TTSVBFileManager.fileExists(_:)();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  return v11 & 1;
}

uint64_t TTSVBCommonVoiceSampleMO.url.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for TTSVBPath();
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_25F3F5D30();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3988A0);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)v43 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t, uint64_t))(a2 + 472))(a1, a2);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v15, 1, v9) == 1)
  {
    sub_25F307B78((uint64_t)v15, &qword_26B3988A0);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v15, v9);
    uint64_t v16 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 208))(a1, a2);
    if (v17)
    {
      uint64_t v18 = v16;
      uint64_t v19 = v17;
      uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A78C890);
      double v21 = &v8[*(int *)(v20 + 48)];
      uint64_t v22 = &v8[*(int *)(v20 + 64)];
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v8, v12, v9);
      *(void *)double v21 = v18;
      *((void *)v21 + 1) = v19;
      uint64_t v23 = sub_25F381A40();
      uint64_t v24 = (void *)v23[1];
      *(_WORD *)uint64_t v22 = *(_WORD *)v23;
      *((void *)v22 + 1) = v24;
      swift_storeEnumTagMultiPayload();
      id v25 = v24;
      TTSVBPath.url.getter(a3);
      sub_25F3F36A8((uint64_t)v8);
      (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
      uint64_t v26 = sub_25F3F5B60();
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(a3, 0, 1, v26);
    }
    uint64_t v28 = sub_25F3EFA00();
    uint64_t v29 = sub_25F3F5EA0();
    uint64_t v46 = v43;
    uint64_t v30 = *(void *)(v29 - 8);
    MEMORY[0x270FA5388](v29);
    uint64_t v32 = (char *)v43 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v33 = *(void (**)(char *, uint64_t))(v30 + 16);
    uint64_t v47 = v34;
    v33(v32, v28);
    char v35 = sub_25F3F5E80();
    os_log_type_t v36 = sub_25F3F64C0();
    if (os_log_type_enabled(v35, v36))
    {
      char v37 = (uint8_t *)swift_slowAlloc();
      uint64_t v45 = swift_slowAlloc();
      uint64_t v49 = v45;
      unint64_t v44 = v37;
      *(_DWORD *)char v37 = 136315138;
      v43[1] = v37 + 4;
      uint64_t v38 = sub_25F3F6CD0();
      uint64_t v48 = sub_25F2FE464(v38, v39, &v49);
      sub_25F3F66A0();
      swift_bridgeObjectRelease();
      os_log_type_t v40 = v44;
      _os_log_impl(&dword_25F2F5000, v35, v36, "'sampleID' property on %s was unexpectedly nil", v44, 0xCu);
      uint64_t v41 = v45;
      swift_arrayDestroy();
      MEMORY[0x2611F21E0](v41, -1, -1);
      MEMORY[0x2611F21E0](v40, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v30 + 8))(v32, v47);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  uint64_t v42 = sub_25F3F5B60();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56))(a3, 1, 1, v42);
}

uint64_t TTSVBCommonVoiceSampleMO.displayPhrase.getter(uint64_t a1, uint64_t a2)
{
  uint64_t result = (*(uint64_t (**)(void))(a2 + 160))();
  if (!v3) {
    return 0;
  }
  return result;
}

uint64_t TTSVBCommonVoiceSampleMO.immutableSample()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(a2 + 208))();
  if (!v7)
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v8 = result;
  uint64_t v9 = v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B398888);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  TTSVBCommonVoiceSampleMO.url.getter(a1, a2, (uint64_t)v12);
  double v13 = (*(double (**)(uint64_t, uint64_t))(a2 + 184))(a1, a2);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 136))(a1, a2);
  if (!v14)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v15 = result;
  uint64_t v16 = v14;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 160))(a1, a2);
  uint64_t v52 = v17;
  if (!v17)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v18 = result;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 256))(a1, a2);
  uint64_t v50 = v19;
  uint64_t v51 = result;
  if (!v19)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v48 = v18;
  uint64_t v49 = v16;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 40))(a1, a2);
  uint64_t v47 = result;
  if (!v20)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v21 = v20;
  uint64_t v42 = v15;
  uint64_t v43 = v12;
  uint64_t v44 = v9;
  uint64_t v45 = v8;
  uint64_t v46 = a3;
  int v22 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 112))(a1, a2);
  int v23 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 232))(a1, a2);
  double v24 = (*(double (**)(uint64_t, uint64_t))(a2 + 64))(a1, a2);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 88))(a1, a2);
  uint64_t v41 = result;
  if (v25)
  {
    uint64_t v26 = v25;
    v40[0] = v22;
    uint64_t v27 = v23;
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B398898);
    v40[1] = (uint64_t)v40;
    MEMORY[0x270FA5388](v28 - 8);
    uint64_t v30 = (char *)v40 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(uint64_t, uint64_t))(a2 + 304))(a1, a2);
    uint64_t v31 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 280))(a1, a2);
    uint64_t v33 = v32;
    uint64_t v34 = (*(__int16 (**)(uint64_t, uint64_t))(a2 + 328))(a1, a2);
    float v35 = (*(float (**)(uint64_t, uint64_t))(a2 + 352))(a1, a2);
    float v36 = (*(float (**)(uint64_t, uint64_t))(a2 + 376))(a1, a2);
    float v37 = (*(float (**)(uint64_t, uint64_t))(a2 + 400))(a1, a2);
    float v38 = (*(float (**)(uint64_t, uint64_t))(a2 + 424))(a1, a2);
    uint64_t v39 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 448))(a1, a2);
    TTSVBVoiceSampleFlags.init(rawValue:)(v39, v53);
    return TTSVBVoiceSample.init(sampleID:url:recordingDuration:phonemes:phrase:transcript:bookTitle:paragraphIndex:sentenceIndex:estimatedDuration:locale:recordingDate:userPhrase:userScore:spl:snr:splThreshold:snrThreshold:flags:)(v45, v44, (uint64_t)v43, v42, v49, v48, v52, v51, v46, v13, v24, v35, v36, v37, v38, v50, v47, v21, v40[0],
             v27,
             v41,
             v26,
             (uint64_t)v30,
             v31,
             v33,
             v34,
             v53);
  }
LABEL_13:
  __break(1u);
  return result;
}

uint64_t TTSVBCommonVoiceSampleMO.shallowUpdate(fromSample:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(ObjectType, a2);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(a4 + 24))(v8, a3, a4);
  uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 40))(ObjectType, a2);
  (*(void (**)(uint64_t))(a4 + 48))(v9);
  (*(void (**)(uint64_t, uint64_t))(a2 + 64))(ObjectType, a2);
  (*(void (**)(uint64_t, uint64_t))(a4 + 72))(a3, a4);
  uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 88))(ObjectType, a2);
  (*(void (**)(uint64_t))(a4 + 96))(v10);
  uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 112))(ObjectType, a2);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(a4 + 120))(v11, a3, a4);
  uint64_t v12 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 136))(ObjectType, a2);
  (*(void (**)(uint64_t))(a4 + 144))(v12);
  uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 160))(ObjectType, a2);
  (*(void (**)(uint64_t))(a4 + 168))(v13);
  (*(void (**)(uint64_t, uint64_t))(a2 + 184))(ObjectType, a2);
  (*(void (**)(uint64_t, uint64_t))(a4 + 192))(a3, a4);
  uint64_t v14 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 208))(ObjectType, a2);
  (*(void (**)(uint64_t))(a4 + 216))(v14);
  uint64_t v15 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 232))(ObjectType, a2);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(a4 + 240))(v15, a3, a4);
  uint64_t v16 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 256))(ObjectType, a2);
  (*(void (**)(uint64_t))(a4 + 264))(v16);
  uint64_t v17 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 280))(ObjectType, a2);
  (*(void (**)(uint64_t))(a4 + 288))(v17);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B398898);
  MEMORY[0x270FA5388](v18 - 8);
  uint64_t v20 = (char *)&v24 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t, uint64_t))(a2 + 304))(ObjectType, a2);
  (*(void (**)(char *, uint64_t, uint64_t))(a4 + 312))(v20, a3, a4);
  uint64_t v21 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 328))(ObjectType, a2);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(a4 + 336))(v21, a3, a4);
  (*(void (**)(uint64_t, uint64_t))(a2 + 352))(ObjectType, a2);
  (*(void (**)(uint64_t, uint64_t))(a4 + 360))(a3, a4);
  (*(void (**)(uint64_t, uint64_t))(a2 + 376))(ObjectType, a2);
  (*(void (**)(uint64_t, uint64_t))(a4 + 384))(a3, a4);
  (*(void (**)(uint64_t, uint64_t))(a2 + 400))(ObjectType, a2);
  (*(void (**)(uint64_t, uint64_t))(a4 + 408))(a3, a4);
  (*(void (**)(uint64_t, uint64_t))(a2 + 424))(ObjectType, a2);
  (*(void (**)(uint64_t, uint64_t))(a4 + 432))(a3, a4);
  uint64_t v22 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 448))(ObjectType, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a4 + 456))(v22, a3, a4);
}

uint64_t sub_25F3F36A8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TTSVBPath();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25F3F3704()
{
  return 16;
}

__n128 sub_25F3F3710(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.apiVersion.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.apiVersion.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.apiVersion.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.bookTitle.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.bookTitle.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.bookTitle.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.estimatedDuration.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.estimatedDuration.setter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.estimatedDuration.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 80))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.locale.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 88))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.locale.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 96))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.locale.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 104))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.paragraphIndex.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 112))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.paragraphIndex.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 120))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.paragraphIndex.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 128))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.phonemes.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 136))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.phonemes.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 144))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.phonemes.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 152))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.phrase.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 160))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.phrase.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 168))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.phrase.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 176))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.recordingDuration.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 184))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.recordingDuration.setter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 192))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.recordingDuration.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 200))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.sampleID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 208))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.sampleID.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 216))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.sampleID.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 224))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.sentenceIndex.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 232))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.sentenceIndex.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 240))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.sentenceIndex.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 248))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.transcript.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 256))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.transcript.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 264))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.transcript.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 272))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.userPhrase.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 280))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.userPhrase.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 288))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.userPhrase.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 296))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.recordingDate.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 304))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.recordingDate.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 312))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.recordingDate.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 320))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.userScore.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 328))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.userScore.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 336))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.userScore.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 344))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.spl.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 352))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.spl.setter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 360))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.spl.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 368))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.snr.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 376))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.snr.setter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 384))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.snr.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 392))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.splThreshold.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 400))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.splThreshold.setter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 408))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.splThreshold.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 416))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.snrThreshold.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 424))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.snrThreshold.setter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 432))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.snrThreshold.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 440))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.flags_.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 448))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.flags_.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 456))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.flags_.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 464))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.voiceID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 472))();
}

uint64_t TTSVBVoiceTrainingStatus.description.getter()
{
  return 0x6E776F6E6B6E55;
}

uint64_t TTSVBVoiceTrainingStatus.localizedTitle.getter()
{
  uint64_t v0 = (void *)sub_25F3F6100();
  id v1 = TTSVBSupportLocString(v0);

  uint64_t v2 = sub_25F3F6130();
  return v2;
}

uint64_t sub_25F3F3DD4()
{
  return sub_25F3F62B0();
}

uint64_t sub_25F3F3E50()
{
  return sub_25F3F6290();
}

uint64_t sub_25F3F3EBC()
{
  return sub_25F3F3EF8(&qword_26A78DDD8);
}

uint64_t sub_25F3F3EF0()
{
  return TTSVBVoiceTrainingStatus.description.getter();
}

uint64_t sub_25F3F3EF8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for TTSVBVoiceTrainingStatus(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t static TTSVBCloudVoiceModelMO.findOrFetch(modelID:moc:)(uint64_t a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A78D0C0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_25F3FE240;
  sub_25F3236F0(0, &qword_26A78D0B8);
  *(void *)(v3 + 56) = MEMORY[0x263F8D310];
  *(void *)(v3 + 64) = sub_25F336038();
  *(void *)(v3 + 32) = 0x44496C65646F6DLL;
  *(void *)(v3 + 40) = 0xE700000000000000;
  uint64_t v4 = sub_25F3F5CF0();
  *(void *)(v3 + 96) = sub_25F3236F0(0, &qword_26A78D0D0);
  *(void *)(v3 + 104) = sub_25F336080();
  *(void *)(v3 + 72) = v4;
  uint64_t v5 = (void *)sub_25F3F6460();
  uint64_t v6 = type metadata accessor for TTSVBCloudVoiceModelMO();
  static DSO<>.findOrFetch(in:matching:)(a2, v5, v6, (uint64_t)&protocol witness table for TTSVBCloudVoiceModelMO);
  uint64_t v8 = v7;

  return v8;
}

uint64_t type metadata accessor for TTSVBCloudVoiceModelMO()
{
  return self;
}

uint64_t static TTSVBCloudVoiceModelMO.requireModelWithID(_:moc:)(uint64_t a1, void *a2)
{
  uint64_t v4 = type metadata accessor for TTSVBError.Reason(0);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v17[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A78D0C0);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_25F3FE240;
  sub_25F3236F0(0, &qword_26A78D0B8);
  *(void *)(v7 + 56) = MEMORY[0x263F8D310];
  *(void *)(v7 + 64) = sub_25F336038();
  *(void *)(v7 + 32) = 0x44496C65646F6DLL;
  *(void *)(v7 + 40) = 0xE700000000000000;
  uint64_t v8 = sub_25F3F5CF0();
  *(void *)(v7 + 96) = sub_25F3236F0(0, &qword_26A78D0D0);
  *(void *)(v7 + 104) = sub_25F336080();
  *(void *)(v7 + 72) = v8;
  uint64_t v9 = (void *)sub_25F3F6460();
  uint64_t v10 = type metadata accessor for TTSVBCloudVoiceModelMO();
  static DSO<>.findOrFetch(in:matching:)(a2, v9, v10, (uint64_t)&protocol witness table for TTSVBCloudVoiceModelMO);
  uint64_t v12 = v11;

  if (!v12)
  {
    v17[0] = 0;
    v17[1] = 0;
    char v18 = 3;
    uint64_t v13 = sub_25F3F5D30();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16))(v6, a1, v13);
    swift_storeEnumTagMultiPayload();
    uint64_t v12 = type metadata accessor for TTSVBError(0);
    sub_25F3F5538((unint64_t *)&qword_26B3988A8, 255, (void (*)(uint64_t))type metadata accessor for TTSVBError);
    swift_allocError();
    TTSVBError.init(_:_:_:)((uint64_t)v17, (uint64_t)v6, 0, v14);
    swift_willThrow();
  }
  return v12;
}

id sub_25F3F42DC()
{
  id v0 = objc_allocWithZone(MEMORY[0x263EFF260]);
  id v1 = (void *)sub_25F3F6100();
  id v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

uint64_t sub_25F3F4348@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_25F3EC8C8(a1, (SEL *)&selRef_creationDate, MEMORY[0x270FA90E0], MEMORY[0x270FA92B0], a2);
}

void sub_25F3F4364(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

uint64_t sub_25F3F4388@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_25F3EC8C8(a1, (SEL *)&selRef_modelID, MEMORY[0x270FA93E0], MEMORY[0x270FA9540], a2);
}

void sub_25F3F43A4(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

void sub_25F3F43C8(uint64_t a1, void **a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void), SEL *a8)
{
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(a5);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25F3078D4(a1, (uint64_t)v16, a5);
  uint64_t v17 = *a2;
  uint64_t v18 = a6(0);
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v16, 1, v18) != 1)
  {
    uint64_t v20 = (void *)a7();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v16, v18);
  }
  objc_msgSend(v17, *a8, v20);
}

uint64_t sub_25F3F4510@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_25F3EC8C8(a1, (SEL *)&selRef_trainingFinishedDate, MEMORY[0x270FA90E0], MEMORY[0x270FA92B0], a2);
}

void sub_25F3F452C(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

uint64_t sub_25F3F4550()
{
  id v1 = objc_msgSend(v0, sel_files);
  if (!v1
    || (id v2 = v1,
        id v3 = objc_msgSend(v1, sel_allObjects),
        v2,
        uint64_t v4 = sub_25F3F6300(),
        v3,
        uint64_t v5 = sub_25F3F45F8(v4),
        swift_bridgeObjectRelease(),
        !v5))
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  return v5;
}

uint64_t sub_25F3F45F8(uint64_t a1)
{
  uint64_t v6 = MEMORY[0x263F8EE78];
  uint64_t v2 = *(void *)(a1 + 16);
  sub_25F3F6920();
  if (!v2) {
    return v6;
  }
  for (uint64_t i = a1 + 32; ; i += 32)
  {
    sub_25F301A40(i, (uint64_t)v5);
    type metadata accessor for TTSVBCloudVoiceModelFileMO();
    if (!swift_dynamicCast()) {
      break;
    }
    sub_25F3F6900();
    sub_25F3F6930();
    sub_25F3F6940();
    sub_25F3F6910();
    if (!--v2) {
      return v6;
    }
  }
  swift_release();

  return 0;
}

uint64_t sub_25F3F46F4@<X0>(void *a1@<X0>, char *a2@<X8>)
{
  if (a1)
  {
    uint64_t v6 = a1;
    goto LABEL_5;
  }
  id v7 = objc_msgSend(v2, sel_voice);
  if (v7)
  {
    uint64_t v6 = v7;
LABEL_5:
    id v8 = a1;
    id v9 = objc_msgSend(v6, sel_name);
    if (v9)
    {
      uint64_t v10 = v9;
      float v36 = v2;
      float v37 = a2;
      uint64_t v11 = sub_25F3F6130();
      uint64_t v13 = v12;

      id v14 = objc_msgSend(v6, sel_voiceID, v36);
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3988A0);
      MEMORY[0x270FA5388](v15 - 8);
      id v3 = (char *)&v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
      if (v14)
      {
        uint64_t v17 = sub_25F3F5D30();
        uint64_t v18 = *(void *)(v17 - 8);
        MEMORY[0x270FA5388](v17);
        uint64_t v20 = (char *)&v36 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
        sub_25F3F5D10();

        (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v3, v20, v17);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v3, 0, 1, v17);
        uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48))(v3, 1, v17);
        if (result != 1)
        {
          uint64_t v22 = type metadata accessor for TTSVBCloudVoiceModelMO();
          uint64_t v24 = sub_25F3F5538(&qword_26A78D0E0, v23, (void (*)(uint64_t))type metadata accessor for TTSVBCloudVoiceModelMO);
          TTSVBCommonVoiceModelMO.immutableModel(voiceName:voiceID:)(v11, v13, v22, v24, v37);

          swift_bridgeObjectRelease();
          return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v3, v17);
        }
LABEL_15:
        __break(1u);
        return result;
      }
    }
    else
    {
      __break(1u);
    }
    uint64_t v35 = sub_25F3F5D30();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v3, 1, 1, v35);
    goto LABEL_15;
  }
  uint64_t v25 = sub_25F3EFA00();
  uint64_t v26 = sub_25F3F5EA0();
  uint64_t v27 = *(void *)(v26 - 8);
  double v28 = MEMORY[0x270FA5388](v26);
  uint64_t v30 = (char *)&v36 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, double))(v27 + 16))(v30, v25, v26, v28);
  uint64_t v31 = sub_25F3F5E80();
  os_log_type_t v32 = sub_25F3F64C0();
  if (os_log_type_enabled(v31, v32))
  {
    uint64_t v33 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v33 = 0;
    _os_log_impl(&dword_25F2F5000, v31, v32, "Cannot return immutableModel. no related voice was found.", v33, 2u);
    MEMORY[0x2611F21E0](v33, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v27 + 8))(v30, v26);
  uint64_t v34 = type metadata accessor for TTSVBVoiceModel();
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(a2, 1, 1, v34);
}

id TTSVBCloudVoiceModelMO.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  id v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id TTSVBCloudVoiceModelMO.init(entity:insertInto:)(void *a1, void *a2)
{
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for TTSVBCloudVoiceModelMO();
  id v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id TTSVBCloudVoiceModelMO.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TTSVBCloudVoiceModelMO();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_25F3F4C88@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for TTSVBCloudVoiceModelMO();
  uint64_t result = sub_25F3F68A0();
  *a1 = result;
  return result;
}

uint64_t sub_25F3F4CC8@<X0>(uint64_t a1@<X8>)
{
  return sub_25F3EDD10((SEL *)&selRef_creationDate, MEMORY[0x270FA90E0], MEMORY[0x270FA92B0], a1);
}

void sub_25F3F4CE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

uint64_t (*sub_25F3F4D00(void *a1))()
{
  objc_super v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_25F3F4D58(v2);
  return sub_25F337360;
}

void (*sub_25F3F4D58(void *a1))(uint64_t a1, char a2)
{
  objc_super v2 = v1;
  *a1 = v1;
  size_t v4 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B398898) - 8) + 64);
  a1[1] = v4;
  id v5 = malloc(v4);
  a1[2] = v5;
  id v6 = objc_msgSend(v2, sel_creationDate);
  objc_super v7 = malloc(v4);
  a1[3] = v7;
  if (v6)
  {
    sub_25F3F5C80();

    uint64_t v8 = sub_25F3F5CC0();
    (*(void (**)(void *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = sub_25F3F5CC0();
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  sub_25F307A7C((uint64_t)v7, (uint64_t)v5, &qword_26B398898);
  return sub_25F3F4EA8;
}

void sub_25F3F4EA8(uint64_t a1, char a2)
{
}

uint64_t sub_25F3F4ECC@<X0>(uint64_t a1@<X8>)
{
  return sub_25F3EDD10((SEL *)&selRef_modelID, MEMORY[0x270FA93E0], MEMORY[0x270FA9540], a1);
}

void sub_25F3F4EE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

uint64_t (*sub_25F3F4F04(void *a1))()
{
  objc_super v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_25F3F4F5C(v2);
  return sub_25F337360;
}

void (*sub_25F3F4F5C(void *a1))(uint64_t a1, char a2)
{
  objc_super v2 = v1;
  *a1 = v1;
  size_t v4 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B3988A0) - 8) + 64);
  a1[1] = v4;
  id v5 = malloc(v4);
  a1[2] = v5;
  id v6 = objc_msgSend(v2, sel_modelID);
  objc_super v7 = malloc(v4);
  a1[3] = v7;
  if (v6)
  {
    sub_25F3F5D10();

    uint64_t v8 = sub_25F3F5D30();
    (*(void (**)(void *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = sub_25F3F5D30();
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  sub_25F307A7C((uint64_t)v7, (uint64_t)v5, &qword_26B3988A0);
  return sub_25F3F50AC;
}

void sub_25F3F50AC(uint64_t a1, char a2)
{
}

void sub_25F3F50D0(uint64_t a1, char a2, uint64_t (*a3)(void), uint64_t (*a4)(void), SEL *a5, uint64_t *a6)
{
  uint64_t v10 = *(void **)(a1 + 16);
  if (a2)
  {
    MEMORY[0x270FA5388](a1);
    uint64_t v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_25F3078D4((uint64_t)v10, (uint64_t)v13, v14);
    uint64_t v15 = a3(0);
    uint64_t v16 = *(void *)(v15 - 8);
    uint64_t v17 = 0;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v13, 1, v15) != 1)
    {
      uint64_t v17 = (void *)a4();
      (*(void (**)(char *, uint64_t))(v16 + 8))(v13, v15);
      uint64_t v10 = *(void **)(a1 + 16);
    }
    uint64_t v18 = *(void **)(a1 + 24);
    objc_msgSend(*(id *)a1, *a5, v17);

    free(v18);
    sub_25F307B78((uint64_t)v10, a6);
    free(v10);
  }
  else
  {
    uint64_t v19 = a3(0);
    uint64_t v20 = *(void *)(v19 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v20 + 48))(v10, 1, v19) == 1)
    {
      uint64_t v21 = 0;
    }
    else
    {
      uint64_t v21 = (void *)a4();
      (*(void (**)(void *, uint64_t))(v20 + 8))(v10, v19);
      uint64_t v10 = *(void **)(a1 + 16);
    }
    uint64_t v22 = *(void **)(a1 + 24);
    objc_msgSend(*(id *)a1, *a5, v21);

    free(v22);
    free(v10);
  }
}

uint64_t sub_25F3F5334@<X0>(uint64_t a1@<X8>)
{
  return sub_25F3EDD10((SEL *)&selRef_trainingFinishedDate, MEMORY[0x270FA90E0], MEMORY[0x270FA92B0], a1);
}

void sub_25F3F5350(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

uint64_t (*sub_25F3F536C(void *a1))()
{
  objc_super v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_25F3F53C4(v2);
  return sub_25F337360;
}

void (*sub_25F3F53C4(void *a1))(uint64_t a1, char a2)
{
  objc_super v2 = v1;
  *a1 = v1;
  size_t v4 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B398898) - 8) + 64);
  a1[1] = v4;
  id v5 = malloc(v4);
  a1[2] = v5;
  id v6 = objc_msgSend(v2, sel_trainingFinishedDate);
  objc_super v7 = malloc(v4);
  a1[3] = v7;
  if (v6)
  {
    sub_25F3F5C80();

    uint64_t v8 = sub_25F3F5CC0();
    (*(void (**)(void *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = sub_25F3F5CC0();
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  sub_25F307A7C((uint64_t)v7, (uint64_t)v5, &qword_26B398898);
  return sub_25F3F5514;
}

void sub_25F3F5514(uint64_t a1, char a2)
{
}

uint64_t sub_25F3F5538(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_25F3F5580(uint64_t a1)
{
  unint64_t result = sub_25F3F55A8();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_25F3F55A8()
{
  unint64_t result = qword_26A78D518;
  if (!qword_26A78D518)
  {
    type metadata accessor for TTSVBCloudVoiceModelMO();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A78D518);
  }
  return result;
}

uint64_t method lookup function for TTSVBCloudVoiceModelMO(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TTSVBCloudVoiceModelMO);
}

uint64_t dispatch thunk of static TTSVBCloudVoiceModelMO.fetchRequest()()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of TTSVBCloudVoiceModelMO.fileFutures.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x58))();
}

uint64_t __getSiriTTSTrainerTaskClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getSiriTTSTrainerAudioQualityHelperClass_block_invoke_cold_1(v0);
}

uint64_t __getSiriTTSTrainerAudioQualityHelperClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __63__TTSVBSiriTTSTrainerSession_installAsset_progress_completion___block_invoke_cold_1(v0);
}

void __getSiriTTSTrainerSessionClass_block_invoke_cold_1()
{
}

uint64_t sub_25F3F57C0()
{
  return MEMORY[0x270EEDDD8]();
}

uint64_t sub_25F3F57D0()
{
  return MEMORY[0x270EEDE08]();
}

uint64_t sub_25F3F57E0()
{
  return MEMORY[0x270EEDE20]();
}

uint64_t sub_25F3F57F0()
{
  return MEMORY[0x270EEDEF0]();
}

uint64_t sub_25F3F5800()
{
  return MEMORY[0x270EEDF28]();
}

uint64_t sub_25F3F5810()
{
  return MEMORY[0x270EEDF40]();
}

uint64_t sub_25F3F5820()
{
  return MEMORY[0x270EEE0A0]();
}

uint64_t sub_25F3F5830()
{
  return MEMORY[0x270EEE180]();
}

uint64_t sub_25F3F5840()
{
  return MEMORY[0x270EEE250]();
}

uint64_t sub_25F3F5850()
{
  return MEMORY[0x270EEE368]();
}

uint64_t sub_25F3F5860()
{
  return MEMORY[0x270EEE370]();
}

uint64_t sub_25F3F5870()
{
  return MEMORY[0x270EEE3A0]();
}

uint64_t sub_25F3F5880()
{
  return MEMORY[0x270EEE3B0]();
}

uint64_t sub_25F3F5890()
{
  return MEMORY[0x270EEE3C8]();
}

uint64_t sub_25F3F58A0()
{
  return MEMORY[0x270EEE918]();
}

uint64_t sub_25F3F58B0()
{
  return MEMORY[0x270EEE948]();
}

uint64_t sub_25F3F58C0()
{
  return MEMORY[0x270EEE990]();
}

uint64_t sub_25F3F58D0()
{
  return MEMORY[0x270EEE9B0]();
}

uint64_t sub_25F3F58E0()
{
  return MEMORY[0x270EEEEE8]();
}

uint64_t sub_25F3F58F0()
{
  return MEMORY[0x270EEEF20]();
}

uint64_t sub_25F3F5900()
{
  return MEMORY[0x270EEEF58]();
}

uint64_t sub_25F3F5910()
{
  return MEMORY[0x270EEEF80]();
}

uint64_t sub_25F3F5920()
{
  return MEMORY[0x270EEEF98]();
}

uint64_t sub_25F3F5930()
{
  return MEMORY[0x270EEEFC8]();
}

uint64_t sub_25F3F5940()
{
  return MEMORY[0x270EEEFF0]();
}

uint64_t sub_25F3F5950()
{
  return MEMORY[0x270EEF000]();
}

uint64_t sub_25F3F5960()
{
  return MEMORY[0x270EEF768]();
}

uint64_t sub_25F3F5970()
{
  return MEMORY[0x270EEF828]();
}

uint64_t sub_25F3F5980()
{
  return MEMORY[0x270EEF838]();
}

uint64_t sub_25F3F5990()
{
  return MEMORY[0x270EEF980]();
}

uint64_t sub_25F3F59A0()
{
  return MEMORY[0x270EEF990]();
}

uint64_t sub_25F3F59B0()
{
  return MEMORY[0x270EEFA10]();
}

uint64_t sub_25F3F59C0()
{
  return MEMORY[0x270EEFA20]();
}

uint64_t sub_25F3F59D0()
{
  return MEMORY[0x270EEFA80]();
}

uint64_t sub_25F3F59E0()
{
  return MEMORY[0x270EEFB18]();
}

uint64_t sub_25F3F59F0()
{
  return MEMORY[0x270EEFB30]();
}

uint64_t sub_25F3F5A00()
{
  return MEMORY[0x270EEFBA0]();
}

uint64_t sub_25F3F5A10()
{
  return MEMORY[0x270EEFBC8]();
}

uint64_t sub_25F3F5A20()
{
  return MEMORY[0x270EEFC08]();
}

uint64_t sub_25F3F5A30()
{
  return MEMORY[0x270EEFC18]();
}

uint64_t sub_25F3F5A40()
{
  return MEMORY[0x270EEFC68]();
}

uint64_t sub_25F3F5A50()
{
  return MEMORY[0x270EEFC80]();
}

uint64_t sub_25F3F5A60()
{
  return MEMORY[0x270EEFCA8]();
}

uint64_t sub_25F3F5A70()
{
  return MEMORY[0x270EEFCD8]();
}

uint64_t sub_25F3F5A80()
{
  return MEMORY[0x270EEFCF0]();
}

uint64_t sub_25F3F5A90()
{
  return MEMORY[0x270EEFD18]();
}

uint64_t sub_25F3F5AA0()
{
  return MEMORY[0x270EEFD20]();
}

uint64_t sub_25F3F5AB0()
{
  return MEMORY[0x270EEFD50]();
}

uint64_t sub_25F3F5AC0()
{
  return MEMORY[0x270EEFD80]();
}

uint64_t sub_25F3F5AD0()
{
  return MEMORY[0x270EEFD88]();
}

uint64_t sub_25F3F5AE0()
{
  return MEMORY[0x270EEFDB0]();
}

uint64_t sub_25F3F5AF0()
{
  return MEMORY[0x270EEFDC8]();
}

uint64_t sub_25F3F5B00()
{
  return MEMORY[0x270EEFDE8]();
}

uint64_t sub_25F3F5B10()
{
  return MEMORY[0x270EEFDF8]();
}

uint64_t sub_25F3F5B20()
{
  return MEMORY[0x270EEFE28]();
}

uint64_t sub_25F3F5B30()
{
  return MEMORY[0x270EEFE70]();
}

uint64_t sub_25F3F5B40()
{
  return MEMORY[0x270EEFE78]();
}

uint64_t sub_25F3F5B50()
{
  return MEMORY[0x270EEFF48]();
}

uint64_t sub_25F3F5B60()
{
  return MEMORY[0x270EEFF70]();
}

uint64_t sub_25F3F5B70()
{
  return MEMORY[0x270EEFFD0]();
}

uint64_t sub_25F3F5B80()
{
  return MEMORY[0x270EF0128]();
}

uint64_t sub_25F3F5B90()
{
  return MEMORY[0x270EF0160]();
}

uint64_t sub_25F3F5BA0()
{
  return MEMORY[0x270EF0170]();
}

uint64_t sub_25F3F5BB0()
{
  return MEMORY[0x270EF01C8]();
}

uint64_t sub_25F3F5BC0()
{
  return MEMORY[0x270EF02C0]();
}

uint64_t sub_25F3F5BD0()
{
  return MEMORY[0x270EF02D0]();
}

uint64_t sub_25F3F5BE0()
{
  return MEMORY[0x270EF0318]();
}

uint64_t sub_25F3F5BF0()
{
  return MEMORY[0x270EF0328]();
}

uint64_t sub_25F3F5C00()
{
  return MEMORY[0x270EF0350]();
}

uint64_t sub_25F3F5C10()
{
  return MEMORY[0x270EF0368]();
}

uint64_t sub_25F3F5C20()
{
  return MEMORY[0x270EF0708]();
}

uint64_t sub_25F3F5C30()
{
  return MEMORY[0x270EF07D8]();
}

uint64_t sub_25F3F5C40()
{
  return MEMORY[0x270EF0990]();
}

uint64_t sub_25F3F5C50()
{
  return MEMORY[0x270EF09B0]();
}

uint64_t sub_25F3F5C60()
{
  return MEMORY[0x270EF09D0]();
}

uint64_t sub_25F3F5C70()
{
  return MEMORY[0x270EF0B90]();
}

uint64_t sub_25F3F5C80()
{
  return MEMORY[0x270EF0BB0]();
}

uint64_t sub_25F3F5C90()
{
  return MEMORY[0x270EF0BF8]();
}

uint64_t sub_25F3F5CA0()
{
  return MEMORY[0x270EF0C08]();
}

uint64_t sub_25F3F5CB0()
{
  return MEMORY[0x270EF0C28]();
}

uint64_t sub_25F3F5CC0()
{
  return MEMORY[0x270EF0C38]();
}

uint64_t sub_25F3F5CD0()
{
  return MEMORY[0x270EF0C50]();
}

uint64_t sub_25F3F5CE0()
{
  return MEMORY[0x270EF0C60]();
}

uint64_t sub_25F3F5CF0()
{
  return MEMORY[0x270EF0C90]();
}

uint64_t sub_25F3F5D00()
{
  return MEMORY[0x270EF0CA8]();
}

uint64_t sub_25F3F5D10()
{
  return MEMORY[0x270EF0CC0]();
}

uint64_t sub_25F3F5D20()
{
  return MEMORY[0x270EF0D00]();
}

uint64_t sub_25F3F5D30()
{
  return MEMORY[0x270EF0D10]();
}

uint64_t sub_25F3F5D40()
{
  return MEMORY[0x270EF0D70]();
}

uint64_t sub_25F3F5D50()
{
  return MEMORY[0x270EF0D88]();
}

uint64_t sub_25F3F5D60()
{
  return MEMORY[0x270EF0EE8]();
}

uint64_t sub_25F3F5D70()
{
  return MEMORY[0x270EF0EF0]();
}

uint64_t sub_25F3F5D80()
{
  return MEMORY[0x270EF0F38]();
}

uint64_t sub_25F3F5D90()
{
  return MEMORY[0x270EF10B0]();
}

uint64_t sub_25F3F5DA0()
{
  return MEMORY[0x270FA1160]();
}

uint64_t sub_25F3F5DB0()
{
  return MEMORY[0x270F9C888]();
}

uint64_t sub_25F3F5DC0()
{
  return MEMORY[0x270FA2A68]();
}

uint64_t sub_25F3F5DD0()
{
  return MEMORY[0x270FA2CE0]();
}

uint64_t sub_25F3F5DE0()
{
  return MEMORY[0x270FA2CF0]();
}

uint64_t sub_25F3F5DF0()
{
  return MEMORY[0x270FA2D08]();
}

uint64_t sub_25F3F5E00()
{
  return MEMORY[0x270FA2D50]();
}

uint64_t sub_25F3F5E10()
{
  return MEMORY[0x270FA2D60]();
}

uint64_t sub_25F3F5E20()
{
  return MEMORY[0x270FA2D80]();
}

uint64_t sub_25F3F5E30()
{
  return MEMORY[0x270FA2D98]();
}

uint64_t sub_25F3F5E40()
{
  return MEMORY[0x270FA2DB8]();
}

uint64_t sub_25F3F5E50()
{
  return MEMORY[0x270FA2DC8]();
}

uint64_t sub_25F3F5E60()
{
  return MEMORY[0x270FA2DD8]();
}

uint64_t sub_25F3F5E70()
{
  return MEMORY[0x270FA2DE8]();
}

uint64_t sub_25F3F5E80()
{
  return MEMORY[0x270FA2DF8]();
}

uint64_t sub_25F3F5E90()
{
  return MEMORY[0x270FA2E10]();
}

uint64_t sub_25F3F5EA0()
{
  return MEMORY[0x270FA2E28]();
}

uint64_t sub_25F3F5EB0()
{
  return MEMORY[0x270FA2E38]();
}

uint64_t sub_25F3F5EC0()
{
  return MEMORY[0x270EE3B98]();
}

uint64_t sub_25F3F5ED0()
{
  return MEMORY[0x270EE3C50]();
}

uint64_t sub_25F3F5EE0()
{
  return MEMORY[0x270EE3C70]();
}

uint64_t sub_25F3F5EF0()
{
  return MEMORY[0x270EE3C98]();
}

uint64_t sub_25F3F5F00()
{
  return MEMORY[0x270EE3CA0]();
}

uint64_t sub_25F3F5F10()
{
  return MEMORY[0x270EE3CB8]();
}

uint64_t sub_25F3F5F20()
{
  return MEMORY[0x270EE3E08]();
}

uint64_t sub_25F3F5F30()
{
  return MEMORY[0x270EE3E78]();
}

uint64_t sub_25F3F5F40()
{
  return MEMORY[0x270EE3F78]();
}

uint64_t sub_25F3F5F50()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_25F3F5F60()
{
  return MEMORY[0x270EE4020]();
}

uint64_t sub_25F3F5F70()
{
  return MEMORY[0x270FA09A0]();
}

uint64_t sub_25F3F5F80()
{
  return MEMORY[0x270FA09F0]();
}

uint64_t sub_25F3F5F90()
{
  return MEMORY[0x270FA09F8]();
}

uint64_t sub_25F3F5FA0()
{
  return MEMORY[0x270FA0A20]();
}

uint64_t sub_25F3F5FB0()
{
  return MEMORY[0x270FA0A50]();
}

uint64_t sub_25F3F5FC0()
{
  return MEMORY[0x270FA0AB8]();
}

uint64_t sub_25F3F5FD0()
{
  return MEMORY[0x270FA0AF8]();
}

uint64_t sub_25F3F5FE0()
{
  return MEMORY[0x270FA0BA0]();
}

uint64_t sub_25F3F5FF0()
{
  return MEMORY[0x270FA0BC0]();
}

uint64_t sub_25F3F6000()
{
  return MEMORY[0x270FA0BF8]();
}

uint64_t sub_25F3F6010()
{
  return MEMORY[0x270EF1800]();
}

uint64_t sub_25F3F6020()
{
  return MEMORY[0x270EF1810]();
}

uint64_t sub_25F3F6030()
{
  return MEMORY[0x270EF1838]();
}

uint64_t sub_25F3F6040()
{
  return MEMORY[0x270EF1848]();
}

uint64_t sub_25F3F6050()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_25F3F6060()
{
  return MEMORY[0x270F9D3D8]();
}

uint64_t sub_25F3F6070()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_25F3F6080()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_25F3F6090()
{
  return MEMORY[0x270F9D4A0]();
}

uint64_t sub_25F3F60A0()
{
  return MEMORY[0x270F9D4A8]();
}

uint64_t sub_25F3F60B0()
{
  return MEMORY[0x270F9D4B0]();
}

uint64_t sub_25F3F60C0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_25F3F60D0()
{
  return MEMORY[0x270EF1878]();
}

uint64_t sub_25F3F60E0()
{
  return MEMORY[0x270EF1970]();
}

uint64_t sub_25F3F60F0()
{
  return MEMORY[0x270EF1998]();
}

uint64_t sub_25F3F6100()
{
  return MEMORY[0x270EF19A8]();
}

uint64_t sub_25F3F6110()
{
  return MEMORY[0x270EF19D0]();
}

uint64_t sub_25F3F6120()
{
  return MEMORY[0x270EF19D8]();
}

uint64_t sub_25F3F6130()
{
  return MEMORY[0x270EF19F0]();
}

uint64_t sub_25F3F6140()
{
  return MEMORY[0x270EF1A00]();
}

uint64_t sub_25F3F6150()
{
  return MEMORY[0x270EF1A48]();
}

uint64_t sub_25F3F6160()
{
  return MEMORY[0x270EF1AA0]();
}

uint64_t sub_25F3F6170()
{
  return MEMORY[0x270EF1AD8]();
}

uint64_t sub_25F3F6180()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_25F3F6190()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_25F3F61A0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25F3F61B0()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_25F3F61C0()
{
  return MEMORY[0x270F9D748]();
}

uint64_t sub_25F3F61D0()
{
  return MEMORY[0x270F9D760]();
}

uint64_t sub_25F3F61E0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25F3F61F0()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t sub_25F3F6200()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25F3F6210()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_25F3F6220()
{
  return MEMORY[0x270F9D8A8]();
}

uint64_t sub_25F3F6230()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_25F3F6240()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_25F3F6250()
{
  return MEMORY[0x270EF1B48]();
}

uint64_t sub_25F3F6260()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_25F3F6270()
{
  return MEMORY[0x270F9D990]();
}

uint64_t sub_25F3F6280()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_25F3F6290()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t sub_25F3F62A0()
{
  return MEMORY[0x270F9DAB8]();
}

uint64_t sub_25F3F62B0()
{
  return MEMORY[0x270F9DB18]();
}

uint64_t sub_25F3F62C0()
{
  return MEMORY[0x270F9DB38]();
}

uint64_t sub_25F3F62D0()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_25F3F62E0()
{
  return MEMORY[0x270EF1B90]();
}

uint64_t sub_25F3F62F0()
{
  return MEMORY[0x270EF1BA0]();
}

uint64_t sub_25F3F6300()
{
  return MEMORY[0x270EF1BB0]();
}

uint64_t sub_25F3F6310()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_25F3F6320()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_25F3F6330()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_25F3F6340()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_25F3F6350()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_25F3F6360()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_25F3F6370()
{
  return MEMORY[0x270EF1BD0]();
}

uint64_t sub_25F3F6380()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_25F3F6390()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_25F3F63A0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_25F3F63B0()
{
  return MEMORY[0x270EF1C10]();
}

uint64_t sub_25F3F63C0()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_25F3F63D0()
{
  return MEMORY[0x270EF1C50]();
}

uint64_t sub_25F3F63E0()
{
  return MEMORY[0x270F9DE48]();
}

uint64_t sub_25F3F63F0()
{
  return MEMORY[0x270EF1CA0]();
}

uint64_t sub_25F3F6400()
{
  return MEMORY[0x270EF1CB0]();
}

uint64_t sub_25F3F6410()
{
  return MEMORY[0x270EF1CC8]();
}

uint64_t sub_25F3F6420()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_25F3F6430()
{
  return MEMORY[0x270EF1CE8]();
}

uint64_t sub_25F3F6440()
{
  return MEMORY[0x270F9E140]();
}

uint64_t sub_25F3F6450()
{
  return MEMORY[0x270FA2BE0]();
}

uint64_t sub_25F3F6460()
{
  return MEMORY[0x270EF1DC0]();
}

uint64_t sub_25F3F6470()
{
  return MEMORY[0x270EF1E00]();
}

uint64_t sub_25F3F6480()
{
  return MEMORY[0x270EF1E58]();
}

uint64_t sub_25F3F6490()
{
  return MEMORY[0x270EF1EF0]();
}

uint64_t sub_25F3F64A0()
{
  return MEMORY[0x270FA2E48]();
}

uint64_t sub_25F3F64B0()
{
  return MEMORY[0x270FA2E50]();
}

uint64_t sub_25F3F64C0()
{
  return MEMORY[0x270FA2E68]();
}

uint64_t sub_25F3F64D0()
{
  return MEMORY[0x270FA2E88]();
}

uint64_t sub_25F3F64E0()
{
  return MEMORY[0x270EF1F30]();
}

uint64_t sub_25F3F64F0()
{
  return MEMORY[0x270EF1F68]();
}

uint64_t sub_25F3F6500()
{
  return MEMORY[0x270FA0C58]();
}

uint64_t sub_25F3F6510()
{
  return MEMORY[0x270FA0C80]();
}

uint64_t sub_25F3F6520()
{
  return MEMORY[0x270FA0CD8]();
}

uint64_t sub_25F3F6530()
{
  return MEMORY[0x270FA0D48]();
}

uint64_t sub_25F3F6540()
{
  return MEMORY[0x270FA0D80]();
}

uint64_t sub_25F3F6550()
{
  return MEMORY[0x270FA0D98]();
}

uint64_t sub_25F3F6560()
{
  return MEMORY[0x270FA0DC0]();
}

uint64_t sub_25F3F6570()
{
  return MEMORY[0x270FA2E98]();
}

uint64_t sub_25F3F6580()
{
  return MEMORY[0x270FA2EA0]();
}

uint64_t sub_25F3F6590()
{
  return MEMORY[0x270EF2008]();
}

uint64_t sub_25F3F65A0()
{
  return MEMORY[0x270EF2018]();
}

uint64_t sub_25F3F65B0()
{
  return MEMORY[0x270FA0F18]();
}

uint64_t sub_25F3F65C0()
{
  return MEMORY[0x270FA0F20]();
}

uint64_t sub_25F3F65D0()
{
  return MEMORY[0x270EE4218]();
}

uint64_t sub_25F3F65E0()
{
  return MEMORY[0x270EE4230]();
}

uint64_t sub_25F3F65F0()
{
  return MEMORY[0x270EE4238]();
}

uint64_t sub_25F3F6610()
{
  return MEMORY[0x270F9C900]();
}

uint64_t sub_25F3F6620()
{
  return MEMORY[0x270EF20F0]();
}

uint64_t sub_25F3F6630()
{
  return MEMORY[0x270EF2188]();
}

uint64_t sub_25F3F6640()
{
  return MEMORY[0x270FA1178]();
}

uint64_t sub_25F3F6650()
{
  return MEMORY[0x270FA1188]();
}

uint64_t sub_25F3F6660()
{
  return MEMORY[0x270FA1198]();
}

uint64_t sub_25F3F6670()
{
  return MEMORY[0x270FA2EC0]();
}

uint64_t sub_25F3F6680()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_25F3F6690()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_25F3F66A0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25F3F66B0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25F3F66C0()
{
  return MEMORY[0x270EF23D0]();
}

uint64_t sub_25F3F66D0()
{
  return MEMORY[0x270EF2420]();
}

uint64_t sub_25F3F66E0()
{
  return MEMORY[0x270EF2460]();
}

uint64_t sub_25F3F66F0()
{
  return MEMORY[0x270EF2480]();
}

uint64_t sub_25F3F6700()
{
  return MEMORY[0x270EF24A8]();
}

uint64_t sub_25F3F6710()
{
  return MEMORY[0x270EF24D8]();
}

uint64_t sub_25F3F6720()
{
  return MEMORY[0x270EF2510]();
}

uint64_t sub_25F3F6730()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_25F3F6740()
{
  return MEMORY[0x270F9E730]();
}

uint64_t sub_25F3F6750()
{
  return MEMORY[0x270F9E740]();
}

uint64_t sub_25F3F6760()
{
  return MEMORY[0x270F9E760]();
}

uint64_t sub_25F3F6770()
{
  return MEMORY[0x270F9E798]();
}

uint64_t sub_25F3F6790()
{
  return MEMORY[0x270F9E7E0]();
}

uint64_t sub_25F3F67A0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_25F3F67B0()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_25F3F67C0()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_25F3F67D0()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_25F3F67E0()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_25F3F67F0()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_25F3F6800()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_25F3F6810()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_25F3F6820()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_25F3F6830()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_25F3F6840()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_25F3F6850()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_25F3F6860()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_25F3F6870()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_25F3F6880()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25F3F6890()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25F3F68A0()
{
  return MEMORY[0x270F9E9D8]();
}

uint64_t sub_25F3F68B0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_25F3F68C0()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_25F3F68D0()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_25F3F68E0()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_25F3F68F0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25F3F6900()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_25F3F6910()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_25F3F6920()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_25F3F6930()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_25F3F6940()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_25F3F6950()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_25F3F6960()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25F3F6970()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_25F3F6980()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25F3F6990()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_25F3F69A0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_25F3F69B0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25F3F69C0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25F3F69E0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_25F3F69F0()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_25F3F6A00()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_25F3F6A10()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_25F3F6A20()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_25F3F6A30()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_25F3F6A40()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_25F3F6A50()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_25F3F6A60()
{
  return MEMORY[0x270F9F300]();
}

uint64_t sub_25F3F6A70()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_25F3F6A80()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_25F3F6A90()
{
  return MEMORY[0x270F9F350]();
}

uint64_t sub_25F3F6AA0()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_25F3F6AB0()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_25F3F6AC0()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_25F3F6AD0()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_25F3F6AE0()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_25F3F6AF0()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_25F3F6B00()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_25F3F6B10()
{
  return MEMORY[0x270F9F440]();
}

uint64_t sub_25F3F6B20()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_25F3F6B30()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_25F3F6B40()
{
  return MEMORY[0x270F9F490]();
}

uint64_t sub_25F3F6B50()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_25F3F6B60()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25F3F6B70()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_25F3F6B80()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25F3F6B90()
{
  return MEMORY[0x270F9FA40]();
}

uint64_t sub_25F3F6BA0()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_25F3F6BB0()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_25F3F6BC0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25F3F6BD0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25F3F6BE0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25F3F6BF0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25F3F6C00()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25F3F6C10()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_25F3F6C20()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25F3F6C30()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25F3F6C40()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_25F3F6C50()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_25F3F6C60()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_25F3F6C70()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25F3F6C80()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_25F3F6C90()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_25F3F6CC0()
{
  return MEMORY[0x270FA00C0]();
}

uint64_t sub_25F3F6CD0()
{
  return MEMORY[0x270FA0128]();
}

uint64_t AXDeviceGetType()
{
  return MEMORY[0x270F091A0]();
}

uint64_t AXDeviceSupportsVoiceBankingSpeech()
{
  return MEMORY[0x270F09228]();
}

uint64_t AXDeviceSupportsVoiceBankingTraining()
{
  return MEMORY[0x270F09230]();
}

uint64_t AXLogTemp()
{
  return MEMORY[0x270F093B0]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x270EE45E0](bundle);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x270EE7E00](time);
  return result;
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x270F4AE20]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x270F4AE40]();
}

uint64_t MobileGestalt_copy_computerName_obj()
{
  return MEMORY[0x270F96040]();
}

uint64_t MobileGestalt_copy_hwModelStr_obj()
{
  return MEMORY[0x270F96068]();
}

uint64_t MobileGestalt_copy_uniqueDeviceID_obj()
{
  return MEMORY[0x270F960B8]();
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x270F960E8]();
}

uint64_t MobileGestalt_get_wapiCapability()
{
  return MEMORY[0x270F961A0]();
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C50]();
}

uint64_t TCCAccessCopyInformation()
{
  return MEMORY[0x270F795C8]();
}

uint64_t TCCAccessCopyInformationForBundleId()
{
  return MEMORY[0x270F795E0]();
}

uint64_t TCCAccessResetForBundleId()
{
  return MEMORY[0x270F79640]();
}

uint64_t TCCAccessSetForBundleId()
{
  return MEMORY[0x270F79668]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

{
  return MEMORY[0x270F9A3B8]();
}

{
  return MEMORY[0x270F9A3D0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void bzero(void *a1, size_t a2)
{
}

int clonefile(const char *a1, const char *a2, uint32_t a3)
{
  return MEMORY[0x270ED8F08](a1, a2, *(void *)&a3);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94C0](value);
}

void free(void *a1)
{
}

float log10f(float a1)
{
  MEMORY[0x270EDA0B8](a1);
  return result;
}

long double log2(long double __x)
{
  MEMORY[0x270EDA0D8](__x);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA130]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA280](info);
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

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
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

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

float powf(float a1, float a2)
{
  MEMORY[0x270EDAD08](a1, a2);
  return result;
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_dynamicCastUnknownClass()
{
  return MEMORY[0x270FA02B0]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x270FA0490]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
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

FFTSetup vDSP_create_fftsetup(vDSP_Length __Log2n, FFTRadix __Radix)
{
  return (FFTSetup)MEMORY[0x270EDE9C8](__Log2n, *(void *)&__Radix);
}

void vDSP_ctoz(const DSPComplex *__C, vDSP_Stride __IC, const DSPSplitComplex *__Z, vDSP_Stride __IZ, vDSP_Length __N)
{
}

void vDSP_destroy_fftsetup(FFTSetup __setup)
{
}

void vDSP_fft_zrip(FFTSetup __Setup, const DSPSplitComplex *__C, vDSP_Stride __IC, vDSP_Length __Log2N, FFTDirection __Direction)
{
}

void vDSP_hann_window(float *__C, vDSP_Length __N, int __Flag)
{
}

void vDSP_meamgv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
}

void vDSP_vmul(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsmul(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_zvmags(const DSPSplitComplex *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vvsqrtf(float *a1, const float *a2, const int *a3)
{
}