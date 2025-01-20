uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
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

uint64_t sub_25BA71B38()
{
  return sub_25BAA5310();
}

uint64_t sub_25BA71B5C()
{
  uint64_t v0 = swift_allocObject();
  sub_25BA71B94();
  return v0;
}

void *sub_25BA71B94()
{
  v1 = v0;
  uint64_t v2 = sub_25BAA5270();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25BAA52D0();
  MEMORY[0x270FA5388](v6);
  uint64_t v7 = sub_25BAA4FB0();
  MEMORY[0x270FA5388](v7 - 8);
  v11[0] = sub_25BA79720(0, (unint64_t *)&qword_26B34B458);
  sub_25BAA4FA0();
  v11[1] = MEMORY[0x263F8EE78];
  sub_25BA737A0(&qword_26B34B450, 255, MEMORY[0x263F8F198]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B34B440);
  sub_25BA76180(&qword_26B34B448, &qword_26B34B440);
  sub_25BAA5360();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F8F138], v2);
  uint64_t v8 = sub_25BAA52E0();
  uint64_t v9 = MEMORY[0x263F8EE80];
  v1[3] = v8;
  v1[4] = v9;
  v1[2] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6C1D0]), sel_initWithQueue_, v8);
  return v1;
}

BOOL sub_25BA71E2C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_25BA71E44()
{
  return sub_25BAA5630();
}

uint64_t sub_25BA71E8C()
{
  return sub_25BAA5600();
}

uint64_t sub_25BA71EB8()
{
  return sub_25BAA5630();
}

void sub_25BA71EFC(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5332B0);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = sub_25BAA4F70();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_25BA90A9C();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  v11 = sub_25BAA4F50();
  os_log_type_t v12 = sub_25BAA5260();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v21 = v3;
    uint64_t v14 = a1;
    v15 = v13;
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_25BA70000, v11, v12, "Will fetch list of eligible devices", v13, 2u);
    v16 = v15;
    a1 = v14;
    uint64_t v3 = v21;
    MEMORY[0x26116FA80](v16, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v17 = *(void **)(v22 + 16);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v3);
  unint64_t v18 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v19 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v19 + v18, (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
  aBlock[4] = sub_25BA76684;
  aBlock[5] = v19;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_25BA732E4;
  aBlock[3] = &block_descriptor_32;
  v20 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v17, sel_listCandidateDevicesForType_completionHandler_, 5, v20);
  _Block_release(v20);
}

uint64_t sub_25BA721E8(unint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_25BAA4F70();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  os_log_type_t v12 = (char *)&v31 - v11;
  if ((a1 & 0xC000000000000001) == 0)
  {
    if (!*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
LABEL_10:
    sub_25BA72FE0(MEMORY[0x263F8EE80], a1);
    uint64_t v34 = v29;
    char v35 = 0;
    goto LABEL_13;
  }
  if (sub_25BAA5390()) {
    goto LABEL_10;
  }
LABEL_5:
  v13 = sub_25BA90A9C();
  v32 = *(void (**)(char *))(v7 + 16);
  os_log_t v33 = v13;
  v32(v12);
  uint64_t v14 = sub_25BAA4F50();
  os_log_type_t v15 = sub_25BAA5260();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    uint64_t v31 = a3;
    v17 = v16;
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_25BA70000, v14, v15, "No devices are eligible", v16, 2u);
    unint64_t v18 = v17;
    a3 = v31;
    MEMORY[0x26116FA80](v18, -1, -1);
  }

  uint64_t v19 = *(void (**)(char *, uint64_t))(v7 + 8);
  v19(v12, v6);
  if (!a2) {
    goto LABEL_10;
  }
  ((void (*)(char *, os_log_t, uint64_t))v32)(v10, v33, v6);
  id v20 = a2;
  id v21 = a2;
  id v22 = a2;
  v23 = sub_25BAA4F50();
  os_log_type_t v24 = sub_25BAA5250();
  if (os_log_type_enabled(v23, v24))
  {
    os_log_t v33 = v23;
    v25 = (uint8_t *)swift_slowAlloc();
    v26 = (void *)swift_slowAlloc();
    uint64_t v31 = a3;
    v32 = (void (*)(char *))v19;
    *(_DWORD *)v25 = 138412290;
    id v27 = a2;
    uint64_t v28 = _swift_stdlib_bridgeErrorToNSError();
    uint64_t v34 = v28;
    uint64_t v19 = (void (*)(char *, uint64_t))v32;
    sub_25BAA5330();
    void *v26 = v28;

    _os_log_impl(&dword_25BA70000, v33, v24, "Failed to list candidate devices: %@", v25, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5332C8);
    swift_arrayDestroy();
    v23 = v33;
    MEMORY[0x26116FA80](v26, -1, -1);
    MEMORY[0x26116FA80](v25, -1, -1);
  }
  else
  {
  }
  v19(v10, v6);
  uint64_t v34 = (uint64_t)a2;
  char v35 = 1;
LABEL_13:
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5332B0);
  return sub_25BAA5100();
}

void sub_25BA7256C(uint64_t *a1, void **a2)
{
  v69 = a1;
  uint64_t v3 = sub_25BAA4F70();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v64 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)&v64 - v9;
  MEMORY[0x270FA5388](v8);
  os_log_type_t v12 = (char *)&v64 - v11;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5332D0);
  MEMORY[0x270FA5388](v13 - 8);
  os_log_type_t v15 = (char *)&v64 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_25BAA4DA0();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  v68 = (char *)&v64 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  v70 = (char *)&v64 - v21;
  MEMORY[0x270FA5388](v20);
  v71 = (char *)&v64 - v22;
  v23 = *a2;
  id v24 = objc_msgSend(v23, sel_uniqueID);
  uint64_t v72 = v3;
  uint64_t v73 = v4;
  if (!v24) {
    goto LABEL_4;
  }
  v25 = v24;
  sub_25BAA5080();

  sub_25BAA4D50();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16) == 1)
  {
    sub_25BA798DC((uint64_t)v15, &qword_26A5332D0);
    uint64_t v3 = v72;
    uint64_t v4 = v73;
LABEL_4:
    uint64_t v26 = sub_25BA90A9C();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v26, v3);
    id v27 = v23;
    uint64_t v28 = sub_25BAA4F50();
    uint64_t v29 = v4;
    os_log_type_t v30 = sub_25BAA5250();
    if (os_log_type_enabled(v28, v30))
    {
      uint64_t v31 = (uint8_t *)swift_slowAlloc();
      uint64_t v32 = swift_slowAlloc();
      uint64_t v75 = v32;
      *(_DWORD *)uint64_t v31 = 136446210;
      id v33 = objc_msgSend(v27, sel_uniqueID);
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = sub_25BAA5080();
        unint64_t v37 = v36;

        uint64_t v74 = sub_25BA76934(v35, v37, &v75);
        sub_25BAA5330();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_25BA70000, v28, v30, "Device ID is not a UUID: %{public}s", v31, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x26116FA80](v32, -1, -1);
        MEMORY[0x26116FA80](v31, -1, -1);

        (*(void (**)(char *, uint64_t))(v73 + 8))(v7, v72);
      }
      else
      {

        __break(1u);
      }
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v29 + 8))(v7, v3);
    }
    return;
  }
  v38 = v71;
  (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v71, v15, v16);
  v39 = v70;
  v67 = *(void (**)(char *, char *, uint64_t))(v17 + 16);
  v67(v70, v38, v16);
  LODWORD(v38) = objc_msgSend(v23, sel_enabledAsKey);
  uint64_t v40 = sub_25BA90A9C();
  uint64_t v41 = v72;
  v42 = *(void (**)(char *, uint64_t, uint64_t))(v73 + 16);
  if (v38)
  {
    v42(v12, v40, v72);
    v43 = v23;
    v44 = sub_25BAA4F50();
    os_log_type_t v45 = sub_25BAA5260();
    int v46 = v45;
    if (os_log_type_enabled(v44, v45))
    {
      LODWORD(v66) = v46;
      v47 = (uint8_t *)swift_slowAlloc();
      v48 = (void *)swift_slowAlloc();
      *(_DWORD *)v47 = 138543362;
      v64 = v47 + 4;
      v65 = v47;
      uint64_t v75 = (uint64_t)v43;
      v49 = v43;
      uint64_t v41 = v72;
      sub_25BAA5330();
      void *v48 = v43;

      v39 = v70;
      v50 = v65;
      _os_log_impl(&dword_25BA70000, v44, (os_log_type_t)v66, "Unlock enabled for device %{public}@", v65, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5332C8);
      swift_arrayDestroy();
      MEMORY[0x26116FA80](v48, -1, -1);
      MEMORY[0x26116FA80](v50, -1, -1);
    }
    else
    {

      v44 = v43;
    }
    v59 = v69;

    (*(void (**)(char *, uint64_t))(v73 + 8))(v12, v41);
    uint64_t v60 = (uint64_t)v68;
    v67(v68, v39, v16);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v75 = *v59;
    uint64_t *v59 = 0x8000000000000000;
    char v62 = 1;
  }
  else
  {
    v42(v10, v40, v72);
    v51 = v23;
    v52 = sub_25BAA4F50();
    os_log_type_t v53 = sub_25BAA5260();
    if (os_log_type_enabled(v52, v53))
    {
      v54 = (uint8_t *)swift_slowAlloc();
      uint64_t v55 = swift_slowAlloc();
      uint64_t v66 = v17 + 16;
      v56 = (void *)v55;
      *(_DWORD *)v54 = 138543362;
      v64 = v54 + 4;
      v65 = v54;
      uint64_t v75 = (uint64_t)v51;
      v57 = v51;
      uint64_t v41 = v72;
      sub_25BAA5330();
      void *v56 = v51;

      v39 = v70;
      v58 = v65;
      _os_log_impl(&dword_25BA70000, v52, v53, "Unlock not enabled for device %{public}@", v65, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5332C8);
      swift_arrayDestroy();
      MEMORY[0x26116FA80](v56, -1, -1);
      MEMORY[0x26116FA80](v58, -1, -1);
    }
    else
    {

      v52 = v51;
    }
    v59 = v69;

    (*(void (**)(char *, uint64_t))(v73 + 8))(v10, v41);
    uint64_t v60 = (uint64_t)v68;
    v67(v68, v39, v16);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v75 = *v59;
    uint64_t *v59 = 0x8000000000000000;
    char v62 = 0;
  }
  sub_25BA77E7C(v62, v60, isUniquelyReferenced_nonNull_native);
  uint64_t *v59 = v75;
  swift_bridgeObjectRelease();
  v63 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
  v63(v60, v16);
  v63((uint64_t)v39, v16);
  v63((uint64_t)v71, v16);
}

uint64_t sub_25BA72DB0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533278);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533220);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  os_log_type_t v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1, 1, v9) == 1)
  {
    sub_25BA798DC(a1, &qword_26A533278);
    sub_25BA76F8C(a2, (uint64_t)v8);
    uint64_t v13 = sub_25BAA4DA0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(a2, v13);
    return sub_25BA798DC((uint64_t)v8, &qword_26A533278);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 32))(v12, a1, v9);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v18 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_25BA78018((uint64_t)v12, a2, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v18;
    swift_bridgeObjectRelease();
    uint64_t v16 = sub_25BAA4DA0();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(a2, v16);
  }
}

void sub_25BA72FE0(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  unint64_t v4 = a2;
  uint64_t v21 = a1;
  if ((a2 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_25BAA5380();
    sub_25BA79720(0, &qword_26A5332B8);
    sub_25BA76708(&qword_26A5332C0, &qword_26A5332B8);
    sub_25BAA5240();
    unint64_t v4 = (unint64_t)v20[1];
    uint64_t v19 = v20[2];
    uint64_t v5 = (uint64_t)v20[3];
    uint64_t v6 = (char *)v20[4];
    unint64_t v7 = (unint64_t)v20[5];
  }
  else
  {
    uint64_t v8 = -1 << *(unsigned char *)(a2 + 32);
    uint64_t v19 = (void *)(a2 + 56);
    uint64_t v5 = ~v8;
    uint64_t v9 = -v8;
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v7 = v10 & *(void *)(a2 + 56);
    swift_bridgeObjectRetain();
    uint64_t v6 = 0;
  }
  int64_t v11 = (unint64_t)(v5 + 64) >> 6;
  if ((v4 & 0x8000000000000000) == 0) {
    goto LABEL_11;
  }
LABEL_8:
  if (!sub_25BAA53A0()) {
    goto LABEL_35;
  }
  sub_25BA79720(0, &qword_26A5332B8);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  id v12 = v20[0];
  swift_unknownObjectRelease();
  int64_t v13 = (int64_t)v6;
  uint64_t v14 = v7;
  if (!v12) {
    goto LABEL_35;
  }
  while (1)
  {
    v20[0] = v12;
    sub_25BA7256C(&v21, v20);
    if (v3)
    {
      swift_bridgeObjectRelease();

      sub_25BA7692C();
      return;
    }

    uint64_t v6 = (char *)v13;
    unint64_t v7 = v14;
    if ((v4 & 0x8000000000000000) != 0) {
      goto LABEL_8;
    }
LABEL_11:
    if (!v7) {
      break;
    }
    uint64_t v14 = (v7 - 1) & v7;
    unint64_t v15 = __clz(__rbit64(v7)) | ((void)v6 << 6);
    int64_t v13 = (int64_t)v6;
LABEL_24:
    id v12 = *(id *)(*(void *)(v4 + 48) + 8 * v15);
    if (!v12) {
      goto LABEL_35;
    }
  }
  int64_t v13 = (int64_t)(v6 + 1);
  if (__OFADD__(v6, 1))
  {
    __break(1u);
    return;
  }
  if (v13 >= v11) {
    goto LABEL_35;
  }
  unint64_t v16 = v19[v13];
  if (v16)
  {
LABEL_23:
    uint64_t v14 = (v16 - 1) & v16;
    unint64_t v15 = __clz(__rbit64(v16)) + (v13 << 6);
    goto LABEL_24;
  }
  int64_t v17 = (int64_t)(v6 + 2);
  if ((uint64_t)(v6 + 2) >= v11) {
    goto LABEL_35;
  }
  unint64_t v16 = v19[v17];
  if (v16) {
    goto LABEL_22;
  }
  int64_t v17 = (int64_t)(v6 + 3);
  if ((uint64_t)(v6 + 3) >= v11) {
    goto LABEL_35;
  }
  unint64_t v16 = v19[v17];
  if (v16) {
    goto LABEL_22;
  }
  int64_t v17 = (int64_t)(v6 + 4);
  if ((uint64_t)(v6 + 4) >= v11) {
    goto LABEL_35;
  }
  unint64_t v16 = v19[v17];
  if (v16)
  {
LABEL_22:
    int64_t v13 = v17;
    goto LABEL_23;
  }
  int64_t v13 = (int64_t)(v6 + 5);
  if ((uint64_t)(v6 + 5) >= v11) {
    goto LABEL_35;
  }
  unint64_t v16 = v19[v13];
  if (v16) {
    goto LABEL_23;
  }
  uint64_t v18 = v6 + 6;
  while ((char *)v11 != v18)
  {
    unint64_t v16 = v19[(void)v18++];
    if (v16)
    {
      int64_t v13 = (int64_t)(v18 - 1);
      goto LABEL_23;
    }
  }
LABEL_35:
  sub_25BA7692C();
}

void sub_25BA732E4(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v4 = *(void (**)(uint64_t, void *))(a1 + 32);
  sub_25BA79720(0, &qword_26A5332B8);
  sub_25BA76708(&qword_26A5332C0, &qword_26A5332B8);
  uint64_t v5 = sub_25BAA5230();
  swift_retain();
  id v6 = a3;
  v4(v5, a3);
  swift_release();
  swift_bridgeObjectRelease();
}

uint64_t sub_25BA733C0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v22 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533210);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533218);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533220);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  id v12 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v22 - v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A533228);
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F8F680], v4);
  sub_25BAA51C0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v15 = sub_25BAA5140();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v3, 1, 1, v15);
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
  uint64_t v17 = sub_25BA737A0(&qword_26A533238, v16, (void (*)(uint64_t))type metadata accessor for SharingController);
  unint64_t v18 = (*(unsigned __int8 *)(v9 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v19 = (char *)swift_allocObject();
  uint64_t v20 = v23;
  *((void *)v19 + 2) = v23;
  *((void *)v19 + 3) = v17;
  *((void *)v19 + 4) = v20;
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v19[v18], v12, v8);
  swift_retain_n();
  sub_25BA73934((uint64_t)v3, (uint64_t)&unk_26A533240, (uint64_t)v19);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v14, v8);
}

uint64_t sub_25BA73704(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v7;
  *unint64_t v7 = v5;
  v7[1] = sub_25BA79E70;
  return sub_25BA74F30(a5);
}

uint64_t sub_25BA737A0(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t type metadata accessor for SharingController()
{
  return self;
}

uint64_t sub_25BA73810()
{
  uint64_t v2 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A533220) - 8);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_25BA79E70;
  uint64_t v5 = (void *)swift_task_alloc();
  v4[2] = v5;
  void *v5 = v4;
  v5[1] = sub_25BA79E70;
  return sub_25BA74F30(v3);
}

uint64_t sub_25BA73934(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25BAA5140();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_25BAA5130();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_25BA798DC(a1, &qword_26A533210);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_25BAA50E0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_25BA73AF0(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  type metadata accessor for SharingController();
  v2[4] = sub_25BA737A0(&qword_26A533238, v3, (void (*)(uint64_t))type metadata accessor for SharingController);
  uint64_t v5 = sub_25BAA50E0();
  v2[5] = v5;
  v2[6] = v4;
  return MEMORY[0x270FA2498](sub_25BA73BA8, v5, v4);
}

uint64_t sub_25BA73BA8()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[2];
  uint64_t v3 = swift_task_alloc();
  v0[7] = v3;
  *(void *)(v3 + 16) = v1;
  *(void *)(v3 + 24) = v2;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[8] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_25BA73CA0;
  return MEMORY[0x270FA2360]();
}

uint64_t sub_25BA73CA0()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 72) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 40);
    uint64_t v4 = *(void *)(v2 + 48);
    uint64_t v5 = sub_25BA73DD4;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v3 = *(void *)(v2 + 40);
    uint64_t v4 = *(void *)(v2 + 48);
    uint64_t v5 = sub_25BA73DBC;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_25BA73DBC()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_25BA73DD4()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_25BA73E38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v21 = a1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533318);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_25BAA4DA0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  id v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = *(void **)(a2 + 16);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a3, v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v21, v5);
  unint64_t v13 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v14 = (v11 + *(unsigned __int8 *)(v6 + 80) + v13) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  unint64_t v15 = (v7 + v14 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v16 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v16 + v13, v12, v9);
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v16 + v14, v8, v5);
  uint64_t v17 = v20;
  *(void *)(v16 + v15) = v20;
  aBlock[4] = sub_25BA7961C;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_25BA74758;
  aBlock[3] = &block_descriptor_44;
  unint64_t v18 = _Block_copy(aBlock);
  id v19 = v17;
  swift_release();
  objc_msgSend(v19, sel_listEligibleDevicesForType_completionHandler_, 5, v18);
  _Block_release(v18);
}

void sub_25BA740E0(uint64_t a1)
{
  sub_25BA73E38(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

void sub_25BA740E8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v28 = a4;
  uint64_t v7 = sub_25BAA4DA0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_25BAA4F70();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  unint64_t v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v15 = sub_25BAA5390();
    if (v15) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v15 = *(void *)(a1 + 16);
    if (v15) {
      goto LABEL_8;
    }
  }
  uint64_t v26 = a2;
  uint64_t v27 = a3;
  uint64_t v16 = sub_25BA90A9C();
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v16, v11);
  uint64_t v17 = sub_25BAA4F50();
  os_log_type_t v18 = sub_25BAA5260();
  if (os_log_type_enabled(v17, v18))
  {
    id v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v19 = 0;
    _os_log_impl(&dword_25BA70000, v17, v18, "No devices are eligible", v19, 2u);
    MEMORY[0x26116FA80](v19, -1, -1);
  }

  uint64_t v15 = (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  a2 = v26;
LABEL_8:
  MEMORY[0x270FA5388](v15);
  *(&v25 - 2) = a2;
  sub_25BA74420(sub_25BA7975C, (uint64_t)(&v25 - 4), a1);
  if (v20)
  {
    uint64_t v21 = v20;
    id v22 = objc_msgSend(v28, sel_disableForType_device_, 5, v20);
    sub_25BAA4D80();

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A533318);
    sub_25BAA5100();
  }
  else
  {
    type metadata accessor for SharingController.SharingError();
    sub_25BA79884();
    uint64_t v23 = swift_allocError();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v24, a2, v7);
    uint64_t v29 = v23;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A533318);
    sub_25BAA50F0();
  }
}

void sub_25BA74420(uint64_t (*a1)(id *), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v5 = a3;
  if ((a3 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_25BAA5380();
    sub_25BA79720(0, &qword_26A533320);
    sub_25BA76708(&qword_26A533328, &qword_26A533320);
    sub_25BAA5240();
    uint64_t v5 = v24;
    uint64_t v23 = v25;
    uint64_t v7 = v26;
    int64_t v8 = v27;
    unint64_t v9 = v28;
  }
  else
  {
    uint64_t v10 = -1 << *(unsigned char *)(a3 + 32);
    uint64_t v23 = a3 + 56;
    uint64_t v11 = ~v10;
    uint64_t v12 = -v10;
    if (v12 < 64) {
      uint64_t v13 = ~(-1 << v12);
    }
    else {
      uint64_t v13 = -1;
    }
    unint64_t v9 = v13 & *(void *)(a3 + 56);
    swift_bridgeObjectRetain();
    uint64_t v7 = v11;
    int64_t v8 = 0;
  }
  int64_t v22 = (unint64_t)(v7 + 64) >> 6;
  if ((v5 & 0x8000000000000000) == 0) {
    goto LABEL_11;
  }
LABEL_8:
  if (!sub_25BAA53A0()) {
    goto LABEL_36;
  }
  sub_25BA79720(0, &qword_26A533320);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  id v14 = v29;
  swift_unknownObjectRelease();
  int64_t v15 = v8;
  uint64_t v16 = v9;
  if (!v14) {
    goto LABEL_36;
  }
  while (1)
  {
    id v29 = v14;
    char v20 = a1(&v29);
    if (v4)
    {

      goto LABEL_36;
    }
    if (v20) {
      goto LABEL_36;
    }

    int64_t v8 = v15;
    unint64_t v9 = v16;
    if (v5 < 0) {
      goto LABEL_8;
    }
LABEL_11:
    if (!v9) {
      break;
    }
    uint64_t v16 = (v9 - 1) & v9;
    unint64_t v17 = __clz(__rbit64(v9)) | (v8 << 6);
    int64_t v15 = v8;
LABEL_24:
    id v14 = *(id *)(*(void *)(v5 + 48) + 8 * v17);
    if (!v14) {
      goto LABEL_36;
    }
  }
  int64_t v15 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    return;
  }
  if (v15 >= v22) {
    goto LABEL_36;
  }
  unint64_t v18 = *(void *)(v23 + 8 * v15);
  if (v18)
  {
LABEL_23:
    uint64_t v16 = (v18 - 1) & v18;
    unint64_t v17 = __clz(__rbit64(v18)) + (v15 << 6);
    goto LABEL_24;
  }
  int64_t v19 = v8 + 2;
  if (v8 + 2 >= v22) {
    goto LABEL_36;
  }
  unint64_t v18 = *(void *)(v23 + 8 * v19);
  if (v18) {
    goto LABEL_22;
  }
  int64_t v19 = v8 + 3;
  if (v8 + 3 >= v22) {
    goto LABEL_36;
  }
  unint64_t v18 = *(void *)(v23 + 8 * v19);
  if (v18) {
    goto LABEL_22;
  }
  int64_t v19 = v8 + 4;
  if (v8 + 4 >= v22) {
    goto LABEL_36;
  }
  unint64_t v18 = *(void *)(v23 + 8 * v19);
  if (v18)
  {
LABEL_22:
    int64_t v15 = v19;
    goto LABEL_23;
  }
  int64_t v15 = v8 + 5;
  if (v8 + 5 >= v22) {
    goto LABEL_36;
  }
  unint64_t v18 = *(void *)(v23 + 8 * v15);
  if (v18) {
    goto LABEL_23;
  }
  int64_t v21 = v8 + 6;
  while (v22 != v21)
  {
    unint64_t v18 = *(void *)(v23 + 8 * v21++);
    if (v18)
    {
      int64_t v15 = v21 - 1;
      goto LABEL_23;
    }
  }
LABEL_36:
  sub_25BA7692C();
}

void sub_25BA74758(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void (**)(uint64_t, id))(a1 + 32);
  sub_25BA79720(0, &qword_26A533320);
  sub_25BA76708(&qword_26A533328, &qword_26A533320);
  uint64_t v5 = sub_25BAA5230();
  swift_retain();
  id v6 = a3;
  v4(v5, v6);
  swift_release();
  swift_bridgeObjectRelease();
}

uint64_t sub_25BA74834(void *a1, char a2)
{
  char v4 = a2 & 1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533220);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  int64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v9 = *(void *)(v2 + 32);
  uint64_t v10 = *(void *)(v9 + 64);
  uint64_t v22 = v9 + 64;
  uint64_t v11 = 1 << *(unsigned char *)(v9 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & v10;
  int64_t v23 = (unint64_t)(v11 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v15 = 0;
  while (1)
  {
    if (v13)
    {
      unint64_t v16 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v17 = v16 | (v15 << 6);
      goto LABEL_5;
    }
    int64_t v18 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v18 >= v23) {
      return swift_release();
    }
    unint64_t v19 = *(void *)(v22 + 8 * v18);
    ++v15;
    if (!v19)
    {
      int64_t v15 = v18 + 1;
      if (v18 + 1 >= v23) {
        return swift_release();
      }
      unint64_t v19 = *(void *)(v22 + 8 * v15);
      if (!v19)
      {
        int64_t v15 = v18 + 2;
        if (v18 + 2 >= v23) {
          return swift_release();
        }
        unint64_t v19 = *(void *)(v22 + 8 * v15);
        if (!v19)
        {
          int64_t v15 = v18 + 3;
          if (v18 + 3 >= v23) {
            return swift_release();
          }
          unint64_t v19 = *(void *)(v22 + 8 * v15);
          if (!v19) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v13 = (v19 - 1) & v19;
    unint64_t v17 = __clz(__rbit64(v19)) + (v15 << 6);
LABEL_5:
    (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v8, *(void *)(v9 + 56) + *(void *)(v6 + 72) * v17, v5);
    sub_25BA78F1C(a1, v4, (uint64_t)v8);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  int64_t v20 = v18 + 4;
  if (v20 >= v23) {
    return swift_release();
  }
  unint64_t v19 = *(void *)(v22 + 8 * v20);
  if (v19)
  {
    int64_t v15 = v20;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v15 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v15 >= v23) {
      return swift_release();
    }
    unint64_t v19 = *(void *)(v22 + 8 * v15);
    ++v20;
    if (v19) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_25BA74AB0()
{
  v1[4] = v0;
  uint64_t v2 = sub_25BAA4F70();
  v1[5] = v2;
  v1[6] = *(void *)(v2 - 8);
  v1[7] = swift_task_alloc();
  type metadata accessor for SharingController();
  v1[8] = sub_25BA737A0(&qword_26A533238, v3, (void (*)(uint64_t))type metadata accessor for SharingController);
  uint64_t v5 = sub_25BAA50E0();
  v1[9] = v5;
  v1[10] = v4;
  return MEMORY[0x270FA2498](sub_25BA74BC4, v5, v4);
}

uint64_t sub_25BA74BC4()
{
  uint64_t v2 = v0[6];
  uint64_t v1 = v0[7];
  uint64_t v3 = v0[5];
  uint64_t v4 = sub_25BA90A9C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  uint64_t v5 = sub_25BAA4F50();
  os_log_type_t v6 = sub_25BAA5260();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_25BA70000, v5, v6, "Authentication state changed", v7, 2u);
    MEMORY[0x26116FA80](v7, -1, -1);
  }
  uint64_t v9 = v0[7];
  uint64_t v8 = v0[8];
  uint64_t v10 = v0[5];
  uint64_t v11 = v0[6];
  uint64_t v12 = v0[4];

  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
  unint64_t v13 = (void *)swift_task_alloc();
  v0[11] = v13;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5332A8);
  void *v13 = v0;
  v13[1] = sub_25BA74D80;
  uint64_t v15 = v0[4];
  return MEMORY[0x270FA2318](v0 + 2, v12, v8, 0x697665447473696CLL, 0xED00002928736563, sub_25BA765DC, v15, v14);
}

uint64_t sub_25BA74D80()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 80);
  uint64_t v3 = *(void *)(v1 + 72);
  return MEMORY[0x270FA2498](sub_25BA74EA0, v3, v2);
}

uint64_t sub_25BA74EA0()
{
  uint64_t v1 = *(void **)(v0 + 16);
  char v2 = *(unsigned char *)(v0 + 24);
  sub_25BA74834(v1, v2);
  sub_25BA765E4(v1, v2);
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_25BA74F30(uint64_t a1)
{
  v2[14] = a1;
  v2[15] = v1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533220);
  v2[16] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v2[17] = v4;
  v2[18] = *(void *)(v4 + 64);
  v2[19] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A533210);
  v2[20] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A533278);
  v2[21] = swift_task_alloc();
  uint64_t v5 = sub_25BAA4DA0();
  v2[22] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v2[23] = v6;
  v2[24] = *(void *)(v6 + 64);
  v2[25] = swift_task_alloc();
  v2[26] = swift_task_alloc();
  type metadata accessor for SharingController();
  v2[27] = sub_25BA737A0(&qword_26A533238, v7, (void (*)(uint64_t))type metadata accessor for SharingController);
  uint64_t v9 = sub_25BAA50E0();
  return MEMORY[0x270FA2498](sub_25BA75124, v9, v8);
}

uint64_t sub_25BA75124()
{
  uint64_t v2 = v0[25];
  uint64_t v1 = v0[26];
  uint64_t v3 = v0[23];
  uint64_t v32 = v0[22];
  uint64_t v4 = v0[21];
  uint64_t v6 = v0[16];
  uint64_t v5 = v0[17];
  uint64_t v7 = v0[15];
  uint64_t v33 = v0[14];
  sub_25BAA4D90();
  swift_beginAccess();
  uint64_t v8 = *(void *)(*(void *)(v7 + 32) + 16);
  uint64_t v31 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v31(v2, v1, v32);
  uint64_t v9 = v33;
  uint64_t v34 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v34(v4, v9, v6);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v5 + 56))(v4, 0, 1, v6);
  swift_beginAccess();
  sub_25BA72DB0(v4, v2);
  swift_endAccess();
  if (!v8)
  {
    uint64_t v10 = v0[15];
    uint64_t v11 = *(void **)(v10 + 16);
    v0[6] = sub_25BA764A8;
    v0[7] = v10;
    v0[2] = MEMORY[0x263EF8330];
    v0[3] = 1107296256;
    v0[4] = sub_25BA756DC;
    v0[5] = &block_descriptor;
    uint64_t v12 = _Block_copy(v0 + 2);
    swift_retain();
    swift_release();
    objc_msgSend(v11, sel_startObservingForAuthenticationStateChanges_queue_, v12, *(void *)(v10 + 24));
    _Block_release(v12);
  }
  uint64_t v13 = v0[25];
  uint64_t v15 = v0[22];
  uint64_t v14 = v0[23];
  uint64_t v27 = v0[20];
  uint64_t v28 = v0[19];
  uint64_t v16 = v0[17];
  uint64_t v29 = v0[27];
  uint64_t v17 = v0[15];
  uint64_t v18 = v0[16];
  uint64_t v19 = v0[14];
  uint64_t v30 = v0[26];
  ((void (*)(uint64_t))v31)(v13);
  unint64_t v20 = (*(unsigned __int8 *)(v14 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = v17;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v14 + 32))(v21 + v20, v13, v15);
  swift_retain();
  sub_25BAA51D0();
  uint64_t v22 = sub_25BAA5140();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v27, 1, 1, v22);
  v34(v28, v19, v18);
  unint64_t v23 = (*(unsigned __int8 *)(v16 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v24 = (char *)swift_allocObject();
  *((void *)v24 + 2) = v17;
  *((void *)v24 + 3) = v29;
  *((void *)v24 + 4) = v17;
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 32))(&v24[v23], v28, v18);
  swift_retain_n();
  sub_25BA73934(v27, (uint64_t)&unk_26A533288, (uint64_t)v24);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v30, v15);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v25 = (uint64_t (*)(void))v0[1];
  return v25();
}

uint64_t sub_25BA75510(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533210);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_25BAA5140();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  uint64_t v7 = sub_25BA737A0(&qword_26A533238, v6, (void (*)(uint64_t))type metadata accessor for SharingController);
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = a1;
  v8[3] = v7;
  v8[4] = a1;
  swift_retain_n();
  sub_25BA73934((uint64_t)v4, (uint64_t)&unk_26A533298, (uint64_t)v8);
  return swift_release();
}

uint64_t sub_25BA7564C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_25BA79E70;
  return sub_25BA74AB0();
}

uint64_t sub_25BA756DC(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_25BA75720(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25BAA4DA0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533210);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_25BAA5140();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v4);
  unint64_t v11 = (*(unsigned __int8 *)(v5 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v12 = (char *)swift_allocObject();
  *((void *)v12 + 2) = 0;
  *((void *)v12 + 3) = 0;
  *((void *)v12 + 4) = a1;
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(&v12[v11], (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  swift_retain();
  sub_25BA73934((uint64_t)v9, (uint64_t)&unk_26A533300, (uint64_t)v12);
  return swift_release();
}

uint64_t sub_25BA758F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a4;
  v5[6] = a5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A533278);
  v5[7] = swift_task_alloc();
  type metadata accessor for SharingController();
  sub_25BA737A0(&qword_26A533238, v6, (void (*)(uint64_t))type metadata accessor for SharingController);
  uint64_t v8 = sub_25BAA50E0();
  return MEMORY[0x270FA2498](sub_25BA759DC, v8, v7);
}

uint64_t sub_25BA759DC()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = v0[7];
  uint64_t v3 = v0[5];
  swift_beginAccess();
  sub_25BA76F8C(v1, v2);
  sub_25BA798DC(v2, &qword_26A533278);
  swift_endAccess();
  if (!*(void *)(*(void *)(v3 + 32) + 16)) {
    objc_msgSend(*(id *)(v0[5] + 16), sel_stopObservingForAuthenticationStateChanges);
  }
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_25BA75AB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[6] = a4;
  v5[7] = a5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5332A0);
  v5[8] = v6;
  v5[9] = *(void *)(v6 - 8);
  v5[10] = swift_task_alloc();
  type metadata accessor for SharingController();
  v5[11] = sub_25BA737A0(&qword_26A533238, v7, (void (*)(uint64_t))type metadata accessor for SharingController);
  uint64_t v9 = sub_25BAA50E0();
  v5[12] = v9;
  v5[13] = v8;
  return MEMORY[0x270FA2498](sub_25BA75BD4, v9, v8);
}

uint64_t sub_25BA75BD4()
{
  uint64_t v1 = v0[11];
  uint64_t v2 = v0[6];
  uint64_t v3 = (void *)swift_task_alloc();
  v0[14] = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5332A8);
  *uint64_t v3 = v0;
  v3[1] = sub_25BA75CD0;
  uint64_t v5 = v0[6];
  return MEMORY[0x270FA2318](v0 + 2, v2, v1, 0x697665447473696CLL, 0xED00002928736563, sub_25BA765DC, v5, v4);
}

uint64_t sub_25BA75CD0()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 104);
  uint64_t v3 = *(void *)(v1 + 96);
  return MEMORY[0x270FA2498](sub_25BA75DF0, v3, v2);
}

uint64_t sub_25BA75DF0()
{
  uint64_t v2 = *(void *)(v0 + 72);
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v3 = *(void *)(v0 + 64);
  uint64_t v4 = *(void **)(v0 + 16);
  char v5 = *(unsigned char *)(v0 + 24);
  *(void *)(v0 + 32) = v4;
  *(unsigned char *)(v0 + 40) = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A533220);
  sub_25BAA51E0();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  sub_25BA765E4(v4, v5);
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_25BA75EC4()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 40, 7);
}

unint64_t sub_25BA75F10()
{
  unint64_t result = qword_26A533250;
  if (!qword_26A533250)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_26A533250);
  }
  return result;
}

uint64_t sub_25BA75F64()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SharingController.Unlockability(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
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
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SharingController.Unlockability(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25BA760F4);
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

uint64_t sub_25BA7611C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25BA76128(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SharingController.Unlockability()
{
  return &type metadata for SharingController.Unlockability;
}

uint64_t sub_25BA76144()
{
  return sub_25BA76180(&qword_26A533268, &qword_26A533270);
}

uint64_t sub_25BA76180(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_25BA761C4()
{
  uint64_t v1 = sub_25BAA4DA0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_25BA76290()
{
  uint64_t v1 = *(void *)(sub_25BAA4DA0() - 8);
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
  return sub_25BA75720(v2, v3);
}

uint64_t objectdestroyTm()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533220);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_25BA763D0()
{
  uint64_t v2 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A533220) - 8);
  uint64_t v3 = *(void *)(v0 + 32);
  uint64_t v4 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_25BA79E70;
  return sub_25BA75AB8((uint64_t)v5, v6, v7, v3, v4);
}

uint64_t sub_25BA764A8()
{
  return sub_25BA75510(v0);
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_25BA764C8()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_25BA76508()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_25BA79E70;
  uint64_t v2 = (void *)swift_task_alloc();
  v1[2] = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_25BA79E70;
  return sub_25BA74AB0();
}

void sub_25BA765DC(uint64_t a1)
{
  sub_25BA71EFC(a1, v1);
}

void sub_25BA765E4(id a1, char a2)
{
  if (a2) {

  }
  else {
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_25BA765F0()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5332B0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_25BA76684(unint64_t a1, void *a2)
{
  uint64_t v5 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A5332B0) - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  return sub_25BA721E8(a1, a2, v6);
}

uint64_t sub_25BA76708(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_25BA79720(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25BA76758(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_25BA76834;
  return v6(a1);
}

uint64_t sub_25BA76834()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_25BA7692C()
{
  return swift_release();
}

uint64_t sub_25BA76934(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_25BA76A08(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25BA78874((uint64_t)v12, *a3);
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
      sub_25BA78874((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_25BA76A08(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_25BAA5340();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_25BA76BC4(a5, a6);
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
  uint64_t v8 = sub_25BAA5410();
  if (!v8)
  {
    sub_25BAA5440();
    __break(1u);
LABEL_17:
    uint64_t result = sub_25BAA5490();
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

uint64_t sub_25BA76BC4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25BA76C5C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_25BA76E3C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_25BA76E3C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25BA76C5C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_25BA76DD4(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_25BAA53E0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_25BAA5440();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_25BAA50C0();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_25BAA5490();
    __break(1u);
LABEL_14:
    uint64_t result = sub_25BAA5440();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_25BA76DD4(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5332F0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_25BA76E3C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5332F0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
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
  uint64_t result = sub_25BAA5490();
  __break(1u);
  return result;
}

uint64_t sub_25BA76F8C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_25BA77164(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    uint64_t v21 = *v3;
    *unint64_t v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_25BA78B70();
      uint64_t v9 = v21;
    }
    uint64_t v10 = *(void *)(v9 + 48);
    uint64_t v11 = sub_25BAA4DA0();
    (*(void (**)(unint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10 + *(void *)(*(void *)(v11 - 8) + 72) * v6, v11);
    uint64_t v12 = *(void *)(v9 + 56);
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533220);
    uint64_t v20 = *(void *)(v13 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v20 + 32))(a2, v12 + *(void *)(v20 + 72) * v6, v13);
    sub_25BA77B2C(v6, v9);
    *unint64_t v3 = v9;
    swift_bridgeObjectRelease();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
    uint64_t v15 = a2;
    uint64_t v16 = 0;
    uint64_t v17 = v13;
  }
  else
  {
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533220);
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    uint64_t v17 = v18;
    uint64_t v15 = a2;
    uint64_t v16 = 1;
  }
  return v14(v15, v16, 1, v17);
}

unint64_t sub_25BA77164(uint64_t a1)
{
  sub_25BAA4DA0();
  sub_25BA737A0(&qword_26A5332E0, 255, MEMORY[0x263F07508]);
  uint64_t v2 = sub_25BAA5020();
  return sub_25BA783D0(a1, v2);
}

uint64_t sub_25BA77200(uint64_t a1, int a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = sub_25BAA4DA0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  int64_t v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5332D8);
  int v42 = a2;
  uint64_t v10 = sub_25BAA5470();
  uint64_t v11 = v10;
  if (*(void *)(v9 + 16))
  {
    unint64_t v37 = v2;
    uint64_t v12 = 1 << *(unsigned char *)(v9 + 32);
    uint64_t v13 = *(void *)(v9 + 64);
    v39 = (void *)(v9 + 64);
    if (v12 < 64) {
      uint64_t v14 = ~(-1 << v12);
    }
    else {
      uint64_t v14 = -1;
    }
    unint64_t v15 = v14 & v13;
    int64_t v38 = (unint64_t)(v12 + 63) >> 6;
    uint64_t v40 = (void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    v43 = (void (**)(char *, unint64_t, uint64_t))(v6 + 32);
    uint64_t v16 = v10 + 64;
    uint64_t result = swift_retain();
    int64_t v18 = 0;
    uint64_t v44 = v5;
    for (i = v6; ; uint64_t v6 = i)
    {
      if (v15)
      {
        unint64_t v20 = __clz(__rbit64(v15));
        v15 &= v15 - 1;
        unint64_t v21 = v20 | (v18 << 6);
      }
      else
      {
        int64_t v22 = v18 + 1;
        if (__OFADD__(v18, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v22 >= v38) {
          goto LABEL_34;
        }
        unint64_t v23 = v39[v22];
        ++v18;
        if (!v23)
        {
          int64_t v18 = v22 + 1;
          if (v22 + 1 >= v38) {
            goto LABEL_34;
          }
          unint64_t v23 = v39[v18];
          if (!v23)
          {
            int64_t v24 = v22 + 2;
            if (v24 >= v38)
            {
LABEL_34:
              swift_release();
              unint64_t v3 = v37;
              if (v42)
              {
                uint64_t v36 = 1 << *(unsigned char *)(v9 + 32);
                if (v36 >= 64) {
                  bzero(v39, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v39 = -1 << v36;
                }
                *(void *)(v9 + 16) = 0;
              }
              break;
            }
            unint64_t v23 = v39[v24];
            if (!v23)
            {
              while (1)
              {
                int64_t v18 = v24 + 1;
                if (__OFADD__(v24, 1)) {
                  goto LABEL_41;
                }
                if (v18 >= v38) {
                  goto LABEL_34;
                }
                unint64_t v23 = v39[v18];
                ++v24;
                if (v23) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v18 = v24;
          }
        }
LABEL_21:
        unint64_t v15 = (v23 - 1) & v23;
        unint64_t v21 = __clz(__rbit64(v23)) + (v18 << 6);
      }
      uint64_t v25 = *(void *)(v6 + 72);
      unint64_t v26 = *(void *)(v9 + 48) + v25 * v21;
      if (v42) {
        (*v43)(v8, v26, v44);
      }
      else {
        (*v40)(v8, v26, v44);
      }
      uint64_t v27 = v9;
      char v28 = *(unsigned char *)(*(void *)(v9 + 56) + v21);
      sub_25BA737A0(&qword_26A5332E0, 255, MEMORY[0x263F07508]);
      uint64_t result = sub_25BAA5020();
      uint64_t v29 = -1 << *(unsigned char *)(v11 + 32);
      unint64_t v30 = result & ~v29;
      unint64_t v31 = v30 >> 6;
      if (((-1 << v30) & ~*(void *)(v16 + 8 * (v30 >> 6))) != 0)
      {
        unint64_t v19 = __clz(__rbit64((-1 << v30) & ~*(void *)(v16 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
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
          uint64_t v35 = *(void *)(v16 + 8 * v31);
        }
        while (v35 == -1);
        unint64_t v19 = __clz(__rbit64(~v35)) + (v31 << 6);
      }
      *(void *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v43)(*(void *)(v11 + 48) + v19 * v25, v8, v44);
      *(unsigned char *)(*(void *)(v11 + 56) + v19) = v28;
      ++*(void *)(v11 + 16);
      uint64_t v9 = v27;
    }
  }
  uint64_t result = swift_release();
  *unint64_t v3 = v11;
  return result;
}

uint64_t sub_25BA77628(uint64_t a1, int a2)
{
  unint64_t v3 = v2;
  uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533220);
  uint64_t v5 = *(void *)(v53 - 8);
  MEMORY[0x270FA5388](v53);
  v52 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25BAA4DA0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A533308);
  int v50 = a2;
  uint64_t v12 = sub_25BAA5470();
  uint64_t v13 = v12;
  if (!*(void *)(v11 + 16)) {
    goto LABEL_41;
  }
  uint64_t v14 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v15 = *(void *)(v11 + 64);
  uint64_t v44 = (void *)(v11 + 64);
  if (v14 < 64) {
    uint64_t v16 = ~(-1 << v14);
  }
  else {
    uint64_t v16 = -1;
  }
  unint64_t v17 = v16 & v15;
  int v42 = v2;
  int64_t v43 = (unint64_t)(v14 + 63) >> 6;
  uint64_t v45 = v5 + 16;
  int v46 = (void (**)(char *, unint64_t, uint64_t))(v8 + 16);
  uint64_t v48 = v5;
  uint64_t v49 = v8;
  int64_t v18 = (void (**)(char *, unint64_t, uint64_t))(v8 + 32);
  v51 = (uint64_t (**)(unint64_t, char *, uint64_t))(v5 + 32);
  uint64_t v19 = v12 + 64;
  uint64_t result = swift_retain();
  int64_t v21 = 0;
  for (i = v11; ; uint64_t v11 = i)
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
    if (v25 >= v43) {
      break;
    }
    unint64_t v26 = v44;
    unint64_t v27 = v44[v25];
    ++v21;
    if (!v27)
    {
      int64_t v21 = v25 + 1;
      if (v25 + 1 >= v43) {
        goto LABEL_34;
      }
      unint64_t v27 = v44[v21];
      if (!v27)
      {
        int64_t v28 = v25 + 2;
        if (v28 >= v43)
        {
LABEL_34:
          swift_release();
          unint64_t v3 = v42;
          if ((v50 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v27 = v44[v28];
        if (!v27)
        {
          while (1)
          {
            int64_t v21 = v28 + 1;
            if (__OFADD__(v28, 1)) {
              goto LABEL_43;
            }
            if (v21 >= v43) {
              goto LABEL_34;
            }
            unint64_t v27 = v44[v21];
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
    uint64_t v29 = *(void *)(v49 + 72);
    unint64_t v30 = *(void *)(v11 + 48) + v29 * v24;
    if (v50)
    {
      (*v18)(v10, v30, v7);
      uint64_t v31 = *(void *)(v11 + 56);
      uint64_t v32 = *(void *)(v48 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v48 + 32))(v52, v31 + v32 * v24, v53);
    }
    else
    {
      (*v46)(v10, v30, v7);
      uint64_t v33 = *(void *)(v11 + 56);
      uint64_t v32 = *(void *)(v48 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v48 + 16))(v52, v33 + v32 * v24, v53);
    }
    sub_25BA737A0(&qword_26A5332E0, 255, MEMORY[0x263F07508]);
    uint64_t result = sub_25BAA5020();
    uint64_t v34 = -1 << *(unsigned char *)(v13 + 32);
    unint64_t v35 = result & ~v34;
    unint64_t v36 = v35 >> 6;
    if (((-1 << v35) & ~*(void *)(v19 + 8 * (v35 >> 6))) != 0)
    {
      unint64_t v22 = __clz(__rbit64((-1 << v35) & ~*(void *)(v19 + 8 * (v35 >> 6)))) | v35 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v37 = 0;
      unint64_t v38 = (unint64_t)(63 - v34) >> 6;
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
    (*v18)((char *)(*(void *)(v13 + 48) + v22 * v29), (unint64_t)v10, v7);
    uint64_t result = (*v51)(*(void *)(v13 + 56) + v22 * v32, v52, v53);
    ++*(void *)(v13 + 16);
  }
  swift_release();
  unint64_t v3 = v42;
  unint64_t v26 = v44;
  if ((v50 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v41 = 1 << *(unsigned char *)(v11 + 32);
  if (v41 >= 64) {
    bzero(v26, ((unint64_t)(v41 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v26 = -1 << v41;
  }
  *(void *)(v11 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *unint64_t v3 = v13;
  return result;
}

unint64_t sub_25BA77B2C(int64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25BAA4DA0();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a2 + 64;
  uint64_t v10 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v11 = (a1 + 1) & ~v10;
  if (((1 << v11) & *(void *)(a2 + 64 + 8 * (v11 >> 6))) != 0)
  {
    uint64_t v12 = ~v10;
    unint64_t result = sub_25BAA5370();
    if ((*(void *)(v9 + 8 * (v11 >> 6)) & (1 << v11)) != 0)
    {
      unint64_t v39 = (result + 1) & v12;
      uint64_t v14 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      uint64_t v13 = v5 + 16;
      uint64_t v15 = *(void *)(v13 + 56);
      uint64_t v40 = v13;
      char v37 = (uint64_t (**)(char *, uint64_t))(v13 - 8);
      unint64_t v38 = v14;
      uint64_t v36 = v12;
      do
      {
        uint64_t v16 = v9;
        uint64_t v17 = v15;
        int64_t v18 = v11 * v15;
        v38(v8, *(void *)(a2 + 48) + v11 * v15, v4);
        sub_25BA737A0(&qword_26A5332E0, 255, MEMORY[0x263F07508]);
        uint64_t v19 = sub_25BAA5020();
        unint64_t result = (*v37)(v8, v4);
        unint64_t v20 = v19 & v12;
        if (a1 >= (uint64_t)v39)
        {
          if (v20 >= v39 && a1 >= (uint64_t)v20)
          {
LABEL_16:
            if (a1 * v17 < v18
              || *(void *)(a2 + 48) + a1 * v17 >= (unint64_t)(*(void *)(a2 + 48) + v18 + v17))
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (a1 * v17 != v18)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            uint64_t v23 = *(void *)(a2 + 56);
            uint64_t v24 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A533220) - 8) + 72);
            int64_t v25 = v24 * a1;
            unint64_t result = v23 + v24 * a1;
            int64_t v26 = v24 * v11;
            unint64_t v27 = v23 + v24 * v11 + v24;
            BOOL v28 = v25 < v26 || result >= v27;
            uint64_t v9 = v16;
            if (v28)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
              a1 = v11;
              uint64_t v12 = v36;
            }
            else
            {
              a1 = v11;
              uint64_t v12 = v36;
              if (v25 != v26)
              {
                unint64_t result = swift_arrayInitWithTakeBackToFront();
                a1 = v11;
              }
            }
            goto LABEL_5;
          }
        }
        else if (v20 >= v39 || a1 >= (uint64_t)v20)
        {
          goto LABEL_16;
        }
        uint64_t v9 = v16;
LABEL_5:
        unint64_t v11 = (v11 + 1) & v12;
        uint64_t v15 = v17;
      }
      while (((*(void *)(v9 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
    }
    uint64_t v29 = (uint64_t *)(v9 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v30 = *v29;
    uint64_t v31 = (-1 << a1) - 1;
  }
  else
  {
    uint64_t v29 = (uint64_t *)(v9 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v31 = *v29;
    uint64_t v30 = (-1 << a1) - 1;
  }
  *uint64_t v29 = v31 & v30;
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

uint64_t sub_25BA77E7C(char a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = sub_25BAA4DA0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (void *)*v3;
  unint64_t v14 = sub_25BA77164(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t result = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 >= result && (a3 & 1) != 0) {
    goto LABEL_9;
  }
  if (v19 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_25BA78594();
    goto LABEL_9;
  }
  sub_25BA77200(result, a3 & 1);
  uint64_t result = sub_25BA77164(a2);
  if ((v18 & 1) != (v20 & 1))
  {
LABEL_14:
    uint64_t result = sub_25BAA55A0();
    __break(1u);
    return result;
  }
  unint64_t v14 = result;
LABEL_9:
  int64_t v21 = *v4;
  if (v18)
  {
    *(unsigned char *)(v21[7] + v14) = a1 & 1;
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
    return sub_25BA78220(v14, (uint64_t)v11, a1 & 1, v21);
  }
  return result;
}

uint64_t sub_25BA78018(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = sub_25BAA4DA0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unint64_t v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (void *)*v3;
  unint64_t v14 = sub_25BA77164(a2);
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
      sub_25BA78B70();
      goto LABEL_7;
    }
    sub_25BA77628(v17, a3 & 1);
    unint64_t v28 = sub_25BA77164(a2);
    if ((v18 & 1) == (v29 & 1))
    {
      unint64_t v14 = v28;
      char v20 = *v4;
      if (v18) {
        goto LABEL_8;
      }
LABEL_13:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
      return sub_25BA782D8(v14, (uint64_t)v11, a1, v20);
    }
LABEL_15:
    uint64_t result = sub_25BAA55A0();
    __break(1u);
    return result;
  }
LABEL_7:
  char v20 = *v4;
  if ((v18 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v21 = v20[7];
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533220);
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v23 + 40);
  uint64_t v25 = v22;
  uint64_t v26 = v21 + *(void *)(v23 + 72) * v14;
  return v24(v26, a1, v25);
}

uint64_t sub_25BA78220(unint64_t a1, uint64_t a2, char a3, void *a4)
{
  char v7 = a3 & 1;
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_25BAA4DA0();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  *(unsigned char *)(a4[7] + a1) = v7;
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

uint64_t sub_25BA782D8(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_25BAA4DA0();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  uint64_t v10 = a4[7];
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533220);
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

unint64_t sub_25BA783D0(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_25BAA4DA0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  char v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    uint64_t v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_25BA737A0(&qword_26A5332E8, 255, MEMORY[0x263F07508]);
      char v15 = sub_25BAA5040();
      (*(void (**)(char *, uint64_t))(v12 - 8))(v7, v4);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
    }
    while (((*(void *)(v18 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  return v9;
}

void *sub_25BA78594()
{
  uint64_t v1 = sub_25BAA4DA0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5332D8);
  uint64_t v23 = v0;
  uint64_t v5 = *v0;
  uint64_t v6 = sub_25BAA5460();
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(v5 + 16);
  if (!v8)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    uint64_t *v23 = v7;
    return result;
  }
  uint64_t result = (void *)(v6 + 64);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v10)
  {
    uint64_t result = memmove(result, (const void *)(v5 + 64), 8 * v10);
    uint64_t v8 = *(void *)(v5 + 16);
  }
  uint64_t v24 = v5 + 64;
  int64_t v11 = 0;
  *(void *)(v7 + 16) = v8;
  uint64_t v12 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v5 + 64);
  uint64_t v27 = v2 + 16;
  int64_t v25 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v26 = v2 + 32;
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
      goto LABEL_25;
    }
    if (v19 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v19);
    ++v11;
    if (!v20)
    {
      int64_t v11 = v19 + 1;
      if (v19 + 1 >= v25) {
        goto LABEL_23;
      }
      unint64_t v20 = *(void *)(v24 + 8 * v11);
      if (!v20) {
        break;
      }
    }
LABEL_22:
    unint64_t v14 = (v20 - 1) & v20;
    unint64_t v16 = __clz(__rbit64(v20)) + (v11 << 6);
LABEL_9:
    unint64_t v17 = *(void *)(v2 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(void *)(v5 + 48) + v17, v1);
    char v18 = *(unsigned char *)(*(void *)(v5 + 56) + v16);
    uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(void *)(v7 + 48) + v17, v4, v1);
    *(unsigned char *)(*(void *)(v7 + 56) + v16) = v18;
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v25) {
    goto LABEL_23;
  }
  unint64_t v20 = *(void *)(v24 + 8 * v21);
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
    if (v11 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v11);
    ++v21;
    if (v20) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_25BA78874(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_25BA788D4()
{
  uint64_t v1 = sub_25BAA4DA0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_25BA789A8()
{
  uint64_t v2 = *(void *)(sub_25BAA4DA0() - 8);
  uint64_t v3 = *(void *)(v0 + 32);
  uint64_t v4 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_25BA78A7C;
  return sub_25BA758F4((uint64_t)v5, v6, v7, v3, v4);
}

uint64_t sub_25BA78A7C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void *sub_25BA78B70()
{
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533220);
  uint64_t v45 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  uint64_t v41 = (char *)&v32 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_25BAA4DA0();
  uint64_t v44 = *(void *)(v40 - 8);
  MEMORY[0x270FA5388](v40);
  unint64_t v39 = (char *)&v32 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A533308);
  uint64_t v32 = v0;
  uint64_t v3 = *v0;
  uint64_t v4 = sub_25BAA5460();
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
    uint64_t v5 = *(void *)(v3 + 16);
  }
  int64_t v9 = 0;
  *(void *)(v6 + 16) = v5;
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
    int64_t v25 = v41;
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

uint64_t sub_25BA78F1C(void *a1, char a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5332A0);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  int64_t v9 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_25BAA4F70();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v39 - v15;
  if (a2)
  {
    uint64_t v46 = (uint64_t)a1;
    id v25 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A533310);
    swift_willThrowTypedImpl();
    uint64_t v26 = sub_25BA90A9C();
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v14, v26, v10);
    id v27 = a1;
    id v28 = a1;
    int64_t v29 = sub_25BAA4F50();
    os_log_type_t v30 = sub_25BAA5250();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = swift_slowAlloc();
      uint64_t v44 = a3;
      uint64_t v32 = (uint8_t *)v31;
      uint64_t v33 = swift_slowAlloc();
      uint64_t v43 = v10;
      int64_t v34 = (void *)v33;
      *(_DWORD *)uint64_t v32 = 138543362;
      id v35 = a1;
      uint64_t v36 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v46 = v36;
      sub_25BAA5330();
      *int64_t v34 = v36;
      sub_25BA765E4(a1, 1);
      sub_25BA765E4(a1, 1);
      _os_log_impl(&dword_25BA70000, v29, v30, "Failed to get info about device unlockability: %{public}@", v32, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5332C8);
      swift_arrayDestroy();
      uint64_t v37 = v34;
      uint64_t v10 = v43;
      MEMORY[0x26116FA80](v37, -1, -1);
      MEMORY[0x26116FA80](v32, -1, -1);
    }
    else
    {
      sub_25BA765E4(a1, 1);
      sub_25BA765E4(a1, 1);
    }

    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
    uint64_t v46 = (uint64_t)a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A533220);
    return sub_25BAA5200();
  }
  else
  {
    uint64_t v42 = v7;
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_25BA90A9C();
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v16, v17, v10);
    swift_bridgeObjectRetain_n();
    uint64_t v18 = sub_25BAA4F50();
    os_log_type_t v19 = sub_25BAA5260();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v44 = a3;
      unint64_t v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v40 = swift_slowAlloc();
      uint64_t v46 = v40;
      uint64_t v43 = v10;
      *(_DWORD *)unint64_t v20 = 136315138;
      unint64_t v39 = v20 + 4;
      sub_25BAA4DA0();
      uint64_t v41 = v6;
      sub_25BA737A0(&qword_26A5332E0, 255, MEMORY[0x263F07508]);
      swift_bridgeObjectRetain();
      uint64_t v21 = sub_25BAA5010();
      unint64_t v23 = v22;
      sub_25BA765E4(a1, 0);
      uint64_t v45 = sub_25BA76934(v21, v23, &v46);
      sub_25BAA5330();
      uint64_t v6 = v41;
      swift_bridgeObjectRelease();
      sub_25BA765E4(a1, 0);
      sub_25BA765E4(a1, 0);
      _os_log_impl(&dword_25BA70000, v18, v19, "Got info about device unlockability: %s", v20, 0xCu);
      uint64_t v24 = v40;
      swift_arrayDestroy();
      MEMORY[0x26116FA80](v24, -1, -1);
      MEMORY[0x26116FA80](v20, -1, -1);

      (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v43);
    }
    else
    {
      sub_25BA765E4(a1, 0);
      sub_25BA765E4(a1, 0);

      (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
    }
    uint64_t v46 = (uint64_t)a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A533220);
    sub_25BAA51F0();
    return (*(uint64_t (**)(char *, uint64_t))(v42 + 8))(v9, v6);
  }
}

uint64_t sub_25BA794B4()
{
  uint64_t v1 = sub_25BAA4DA0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533318);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v5 + v8) & ~v8;
  uint64_t v10 = v3 | v8 | 7;
  unint64_t v11 = (*(void *)(v7 + 64) + v9 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);

  return MEMORY[0x270FA0238](v0, v11 + 8, v10);
}

void sub_25BA7961C(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_25BAA4DA0() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = v4 + *(void *)(v3 + 64);
  uint64_t v6 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A533318) - 8);
  unint64_t v7 = (v5 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = *(void **)(v1 + ((*(void *)(v6 + 64) + v7 + 7) & 0xFFFFFFFFFFFFFFF8));
  sub_25BA740E8(a1, v1 + v4, v1 + v7, v8);
}

uint64_t sub_25BA79720(uint64_t a1, unint64_t *a2)
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

uint64_t sub_25BA7975C(id *a1)
{
  id v1 = objc_msgSend(*a1, sel_uniqueID);
  if (!v1)
  {
    sub_25BAA4D60();
    goto LABEL_9;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_25BAA5080();
  uint64_t v5 = v4;

  uint64_t v6 = sub_25BAA4D60();
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return 0;
  }
  if (v3 == v6 && v5 == v7)
  {
    swift_bridgeObjectRelease_n();
    return 1;
  }
  else
  {
    char v9 = sub_25BAA5570();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v9 & 1;
  }
}

uint64_t type metadata accessor for SharingController.SharingError()
{
  uint64_t result = qword_26A533BB8;
  if (!qword_26A533BB8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_25BA79884()
{
  unint64_t result = qword_26A533BB0;
  if (!qword_26A533BB0)
  {
    type metadata accessor for SharingController.SharingError();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A533BB0);
  }
  return result;
}

uint64_t sub_25BA798DC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25BA79938()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25BA79970(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_25BA78A7C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26A533330 + dword_26A533330);
  return v6(a1, v4);
}

uint64_t *sub_25BA79A28(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = sub_25BAA4DA0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  return a1;
}

uint64_t sub_25BA79AD8(uint64_t a1)
{
  uint64_t v2 = sub_25BAA4DA0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t sub_25BA79B3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25BAA4DA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_25BA79BA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25BAA4DA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_25BA79C04(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25BAA4DA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_25BA79C68(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25BAA4DA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_25BA79CCC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25BAA4DA0();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t sub_25BA79D38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25BAA4DA0();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  return v7(a1, a2, a3, v6);
}

uint64_t sub_25BA79DB4()
{
  return 0;
}

uint64_t sub_25BA79DBC(uint64_t a1)
{
  uint64_t result = sub_25BAA4DA0();
  if (v3 <= 0x3F)
  {
    uint64_t v4 = *(void *)(result - 8);
    swift_initEnumMetadataSingleCase();
    uint64_t result = 0;
    *(_DWORD *)(*(void *)(a1 - 8) + 84) = *(_DWORD *)(v4 + 84);
  }
  return result;
}

uint64_t CompanionDevice.relationshipID.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25BA7B7FC(MEMORY[0x263F07508], a1);
}

uint64_t CompanionDevice.idsDeviceID.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for CompanionDevice(0) + 20);
  uint64_t v4 = sub_25BAA4DA0();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for CompanionDevice(uint64_t a1)
{
  return sub_25BA7B994(a1, (uint64_t *)&unk_26A5341D0);
}

uint64_t CompanionDevice.name.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for CompanionDevice(0) + 24));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CompanionDevice.modelType.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for CompanionDevice(0);
  return sub_25BA7C6FC(v1 + *(int *)(v3 + 28), a1, &qword_26A533340);
}

uint64_t CompanionDevice.marketingName.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for CompanionDevice(0) + 32));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CompanionDevice.isBlocked.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for CompanionDevice(0) + 36));
}

uint64_t CompanionDevice.remoteWidgetsSupported.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for CompanionDevice(0) + 40));
}

uint64_t CompanionDevice.remoteScreenSupported.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for CompanionDevice(0) + 44));
}

BOOL static CompanionDevice.PairingState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t CompanionDevice.PairingState.hash(into:)()
{
  return sub_25BAA5600();
}

uint64_t CompanionDevice.PairingState.hashValue.getter()
{
  return sub_25BAA5630();
}

BOOL sub_25BA7A0D8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

double CompanionDevice.Screen.size.getter()
{
  return *(double *)v0;
}

double CompanionDevice.Screen.scale.getter()
{
  return *(double *)(v0 + 16);
}

uint64_t CompanionDevice.Screen.cornerRadius.getter()
{
  return *(void *)(v0 + 24);
}

uint64_t CompanionDevice.Screen.hash(into:)()
{
  int v1 = *(unsigned __int8 *)(v0 + 32);
  sub_25BAA5620();
  sub_25BAA5620();
  sub_25BAA5620();
  if (v1 == 1) {
    return sub_25BAA5610();
  }
  sub_25BAA5610();
  return sub_25BAA5620();
}

uint64_t CompanionDevice.Screen.hashValue.getter()
{
  int v1 = *(unsigned __int8 *)(v0 + 32);
  sub_25BAA55F0();
  sub_25BAA5620();
  sub_25BAA5620();
  sub_25BAA5620();
  sub_25BAA5610();
  if (v1 != 1) {
    sub_25BAA5620();
  }
  return sub_25BAA5630();
}

uint64_t sub_25BA7A24C@<X0>(uint64_t result@<X0>, char a2@<W1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>, double a6@<D2>)
{
  *(double *)a3 = a4;
  *(double *)(a3 + 8) = a5;
  *(double *)(a3 + 16) = a6;
  *(void *)(a3 + 24) = result;
  *(unsigned char *)(a3 + 32) = a2 & 1;
  return result;
}

uint64_t sub_25BA7A268()
{
  int v1 = *(unsigned __int8 *)(v0 + 32);
  sub_25BA7B8D4();
  sub_25BAA5620();
  if (v1 == 1) {
    return sub_25BAA5610();
  }
  sub_25BAA5610();
  return sub_25BAA5620();
}

uint64_t sub_25BA7A2D8()
{
  int v1 = *(unsigned __int8 *)(v0 + 32);
  sub_25BAA55F0();
  sub_25BA7B8D4();
  sub_25BAA5620();
  sub_25BAA5610();
  if (v1 != 1) {
    sub_25BAA5620();
  }
  return sub_25BAA5630();
}

uint64_t CompanionDevice.replicatorPairing.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for CompanionDevice(0);
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 48));
  return result;
}

__n128 CompanionDevice.deviceScreen.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for CompanionDevice(0) + 52);
  char v4 = *(unsigned char *)(v3 + 32);
  char v5 = *(unsigned char *)(v3 + 33);
  __n128 result = *(__n128 *)v3;
  long long v7 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v3;
  *(_OWORD *)(a1 + 16) = v7;
  *(unsigned char *)(a1 + 32) = v4;
  *(unsigned char *)(a1 + 33) = v5;
  return result;
}

uint64_t CompanionDevice.remoteScreenPairing.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for CompanionDevice(0);
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 56));
  return result;
}

BOOL static CompanionDevice.Proximity.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t CompanionDevice.Proximity.hash(into:)()
{
  return sub_25BAA5600();
}

uint64_t CompanionDevice.Proximity.hashValue.getter()
{
  return sub_25BAA5630();
}

uint64_t CompanionDevice.proximity.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for CompanionDevice(0);
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 60));
  return result;
}

uint64_t CompanionDevice.SessionInfo.start.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25BA7B7FC(MEMORY[0x263F07490], a1);
}

uint64_t CompanionDevice.SessionInfo.end.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for CompanionDevice.SessionInfo(0);
  return sub_25BA7C6FC(v1 + *(int *)(v3 + 20), a1, &qword_26A533348);
}

uint64_t CompanionDevice.SessionInfo.hash(into:)()
{
  uint64_t v1 = sub_25BAA4D40();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  char v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533348);
  MEMORY[0x270FA5388](v5 - 8);
  long long v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25BA7C7C4(&qword_26A533350, MEMORY[0x263F07490]);
  sub_25BAA5030();
  uint64_t v8 = type metadata accessor for CompanionDevice.SessionInfo(0);
  sub_25BA7C6FC(v0 + *(int *)(v8 + 20), (uint64_t)v7, &qword_26A533348);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v7, 1, v1) == 1) {
    return sub_25BAA5610();
  }
  (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v4, v7, v1);
  sub_25BAA5610();
  sub_25BAA5030();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t CompanionDevice.SessionInfo.hashValue.getter()
{
  uint64_t v1 = sub_25BAA4D40();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  char v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533348);
  MEMORY[0x270FA5388](v5 - 8);
  long long v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25BAA55F0();
  sub_25BA7C7C4(&qword_26A533350, MEMORY[0x263F07490]);
  sub_25BAA5030();
  uint64_t v8 = type metadata accessor for CompanionDevice.SessionInfo(0);
  sub_25BA7C6FC(v0 + *(int *)(v8 + 20), (uint64_t)v7, &qword_26A533348);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v7, 1, v1) == 1)
  {
    sub_25BAA5610();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v4, v7, v1);
    sub_25BAA5610();
    sub_25BAA5030();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  return sub_25BAA5630();
}

uint64_t sub_25BA7A944@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_25BAA4D40();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a3, a1, v6);
  uint64_t v7 = type metadata accessor for CompanionDevice.SessionInfo(0);
  return sub_25BA7C760(a2, a3 + *(int *)(v7 + 20), &qword_26A533348);
}

uint64_t sub_25BA7A9D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25BAA4D40();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533348);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25BA7C7C4(&qword_26A533350, MEMORY[0x263F07490]);
  sub_25BAA5030();
  sub_25BA7C6FC(v2 + *(int *)(a2 + 20), (uint64_t)v10, &qword_26A533348);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4) == 1) {
    return sub_25BAA5610();
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v10, v4);
  sub_25BAA5610();
  sub_25BAA5030();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_25BA7ABCC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25BAA4D40();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533348);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25BAA55F0();
  sub_25BA7C7C4(&qword_26A533350, MEMORY[0x263F07490]);
  sub_25BAA5030();
  sub_25BA7C6FC(v2 + *(int *)(a2 + 20), (uint64_t)v10, &qword_26A533348);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4) == 1)
  {
    sub_25BAA5610();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v10, v4);
    sub_25BAA5610();
    sub_25BAA5030();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  return sub_25BAA5630();
}

uint64_t CompanionDevice.latestSessionInfo.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for CompanionDevice(0);
  return sub_25BA7C6FC(v1 + *(int *)(v3 + 64), a1, &qword_26A533358);
}

uint64_t sub_25BA7AE18@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, char a10, char a11, char *a12, long long *a13, char *a14, char *a15, uint64_t a16)
{
  char v22 = *a12;
  long long v34 = *a13;
  uint64_t v33 = *((void *)a13 + 2);
  uint64_t v32 = *((void *)a13 + 3);
  char v30 = *((unsigned char *)a13 + 33);
  char v31 = *((unsigned char *)a13 + 32);
  char v35 = *a14;
  char v36 = *a15;
  uint64_t v23 = sub_25BAA4DA0();
  uint64_t v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 32);
  v24(a9, a1, v23);
  id v25 = (int *)type metadata accessor for CompanionDevice(0);
  v24(a9 + v25[5], a2, v23);
  uint64_t v26 = (void *)(a9 + v25[6]);
  void *v26 = a3;
  v26[1] = a4;
  sub_25BA7C760(a5, a9 + v25[7], &qword_26A533340);
  id v27 = (void *)(a9 + v25[8]);
  *id v27 = a6;
  v27[1] = a7;
  *(unsigned char *)(a9 + v25[9]) = a8;
  *(unsigned char *)(a9 + v25[10]) = a10;
  *(unsigned char *)(a9 + v25[11]) = a11;
  *(unsigned char *)(a9 + v25[12]) = v22;
  uint64_t v28 = a9 + v25[13];
  *(_OWORD *)uint64_t v28 = v34;
  *(void *)(v28 + 16) = v33;
  *(void *)(v28 + 24) = v32;
  *(unsigned char *)(v28 + 32) = v31;
  *(unsigned char *)(v28 + 33) = v30;
  *(unsigned char *)(a9 + v25[14]) = v35;
  *(unsigned char *)(a9 + v25[15]) = v36;
  return sub_25BA7C760(a16, a9 + v25[16], &qword_26A533358);
}

uint64_t CompanionDevice.hash(into:)()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25BAA4D40();
  uint64_t v31 = *(void *)(v2 - 8);
  uint64_t v32 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v28 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533348);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v29 = (uint64_t)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for CompanionDevice.SessionInfo(0);
  uint64_t v34 = *(void *)(v6 - 8);
  uint64_t v35 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v30 = (uint64_t)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533358);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v33 = (uint64_t)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_25BAA4F40();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533340);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25BAA4DA0();
  sub_25BA7C7C4(&qword_26A5332E0, MEMORY[0x263F07508]);
  sub_25BAA5030();
  uint64_t v17 = (int *)type metadata accessor for CompanionDevice(0);
  sub_25BAA5030();
  swift_bridgeObjectRetain();
  sub_25BAA50A0();
  swift_bridgeObjectRelease();
  sub_25BA7C6FC(v0 + v17[7], (uint64_t)v16, &qword_26A533340);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v16, 1, v10) == 1)
  {
    sub_25BAA5610();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v13, v16, v10);
    sub_25BAA5610();
    sub_25BA7C7C4(&qword_26A533360, MEMORY[0x263F8F3A0]);
    sub_25BAA5030();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  if (*(void *)(v0 + v17[8] + 8))
  {
    sub_25BAA5610();
    swift_bridgeObjectRetain();
    sub_25BAA50A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_25BAA5610();
  }
  sub_25BAA5610();
  sub_25BAA5610();
  sub_25BAA5610();
  if (*(unsigned char *)(v0 + v17[12]) == 3)
  {
    sub_25BAA5610();
  }
  else
  {
    sub_25BAA5610();
    sub_25BAA5600();
  }
  uint64_t v18 = v0 + v17[13];
  if (*(unsigned char *)(v18 + 33) == 1
    || (char v19 = *(unsigned char *)(v18 + 32), sub_25BAA5610(), sub_25BAA5620(), sub_25BAA5620(), sub_25BAA5620(), (v19 & 1) != 0))
  {
    sub_25BAA5610();
  }
  else
  {
    sub_25BAA5610();
    sub_25BAA5620();
  }
  if (*(unsigned char *)(v0 + v17[14]) == 3)
  {
    sub_25BAA5610();
  }
  else
  {
    sub_25BAA5610();
    sub_25BAA5600();
  }
  if (*(unsigned char *)(v0 + v17[15]) == 2)
  {
    sub_25BAA5610();
  }
  else
  {
    sub_25BAA5610();
    sub_25BAA5600();
  }
  uint64_t v20 = v33;
  sub_25BA7C6FC(v1 + v17[16], v33, &qword_26A533358);
  uint64_t v21 = v35;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v34 + 48))(v20, 1, v35) == 1) {
    return sub_25BAA5610();
  }
  uint64_t v23 = v30;
  sub_25BA7C80C(v20, v30);
  sub_25BAA5610();
  sub_25BA7C7C4(&qword_26A533350, MEMORY[0x263F07490]);
  uint64_t v24 = v32;
  sub_25BAA5030();
  uint64_t v25 = v29;
  sub_25BA7C6FC(v23 + *(int *)(v21 + 20), v29, &qword_26A533348);
  uint64_t v26 = v31;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v31 + 48))(v25, 1, v24) == 1)
  {
    sub_25BAA5610();
  }
  else
  {
    id v27 = v28;
    (*(void (**)(char *, uint64_t, uint64_t))(v26 + 32))(v28, v25, v24);
    sub_25BAA5610();
    sub_25BAA5030();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v27, v24);
  }
  return sub_25BA7C870(v23);
}

uint64_t CompanionDevice.hashValue.getter()
{
  return sub_25BAA5630();
}

uint64_t sub_25BA7B764()
{
  return sub_25BAA5630();
}

uint64_t sub_25BA7B7A8()
{
  return sub_25BAA5630();
}

uint64_t CompanionDevice.id.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25BA7B7FC(MEMORY[0x263F07508], a1);
}

uint64_t sub_25BA7B7FC@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = a1(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a2, v2, v4);
}

uint64_t sub_25BA7B86C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_25BAA4DA0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t sub_25BA7B8D4()
{
  return sub_25BAA5620();
}

uint64_t _s24ScreenContinuityServices15CompanionDeviceV0A0V2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  if (*(double *)a1 != *(double *)a2
    || *(double *)(a1 + 8) != *(double *)(a2 + 8)
    || *(double *)(a1 + 16) != *(double *)(a2 + 16))
  {
    return 0;
  }
  char v4 = *(unsigned char *)(a2 + 32);
  if (*(unsigned char *)(a1 + 32))
  {
    if ((*(unsigned char *)(a2 + 32) & 1) == 0) {
      return 0;
    }
  }
  else
  {
    if (*(double *)(a1 + 24) != *(double *)(a2 + 24)) {
      char v4 = 1;
    }
    if (v4) {
      return 0;
    }
  }
  return 1;
}

uint64_t type metadata accessor for CompanionDevice.SessionInfo(uint64_t a1)
{
  return sub_25BA7B994(a1, (uint64_t *)&unk_26A5341E0);
}

uint64_t sub_25BA7B994(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

BOOL _s24ScreenContinuityServices15CompanionDeviceV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CompanionDevice.SessionInfo(0);
  uint64_t v86 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v81 = &v74[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5333B0);
  MEMORY[0x270FA5388](v83);
  uint64_t v7 = &v74[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533358);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  v82 = &v74[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  v84 = &v74[-v12];
  MEMORY[0x270FA5388](v11);
  v85 = &v74[-v13];
  uint64_t v14 = sub_25BAA4F40();
  uint64_t v88 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  v87 = &v74[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5333B8);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = &v74[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533340);
  uint64_t v20 = MEMORY[0x270FA5388](v19 - 8);
  char v22 = &v74[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v23 = MEMORY[0x270FA5388](v20);
  uint64_t v25 = &v74[-v24];
  MEMORY[0x270FA5388](v23);
  id v27 = &v74[-v26];
  if ((sub_25BAA4D70() & 1) == 0) {
    return 0;
  }
  uint64_t v80 = v14;
  uint64_t v28 = type metadata accessor for CompanionDevice(0);
  if ((sub_25BAA4D70() & 1) == 0) {
    return 0;
  }
  uint64_t v29 = *(int *)(v28 + 24);
  uint64_t v30 = *(void *)(a1 + v29);
  uint64_t v31 = *(void *)(a1 + v29 + 8);
  uint64_t v79 = a2;
  uint64_t v32 = (void *)(a2 + v29);
  uint64_t v33 = a1;
  uint64_t v34 = (int *)v28;
  if (v30 != *v32 || v31 != v32[1])
  {
    char v35 = sub_25BAA5570();
    BOOL result = 0;
    if ((v35 & 1) == 0) {
      return result;
    }
  }
  uint64_t v77 = v4;
  v78 = v7;
  sub_25BA7C6FC(v33 + *(int *)(v28 + 28), (uint64_t)v27, &qword_26A533340);
  sub_25BA7C6FC(v79 + *(int *)(v28 + 28), (uint64_t)v25, &qword_26A533340);
  uint64_t v37 = (uint64_t)&v18[*(int *)(v16 + 48)];
  sub_25BA7C6FC((uint64_t)v27, (uint64_t)v18, &qword_26A533340);
  sub_25BA7C6FC((uint64_t)v25, v37, &qword_26A533340);
  uint64_t v38 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v88 + 48);
  uint64_t v39 = v80;
  if (v38((uint64_t)v18, 1, v80) == 1)
  {
    sub_25BA798DC((uint64_t)v25, &qword_26A533340);
    sub_25BA798DC((uint64_t)v27, &qword_26A533340);
    if (v38(v37, 1, v39) == 1)
    {
      sub_25BA798DC((uint64_t)v18, &qword_26A533340);
      goto LABEL_16;
    }
LABEL_11:
    uint64_t v40 = &qword_26A5333B8;
    uint64_t v41 = (uint64_t)v18;
LABEL_12:
    sub_25BA798DC(v41, v40);
    return 0;
  }
  sub_25BA7C6FC((uint64_t)v18, (uint64_t)v22, &qword_26A533340);
  if (v38(v37, 1, v39) == 1)
  {
    sub_25BA798DC((uint64_t)v25, &qword_26A533340);
    sub_25BA798DC((uint64_t)v27, &qword_26A533340);
    (*(void (**)(unsigned char *, uint64_t))(v88 + 8))(v22, v39);
    goto LABEL_11;
  }
  uint64_t v76 = v33;
  uint64_t v42 = v87;
  uint64_t v43 = v88;
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v88 + 32))(v87, v37, v39);
  sub_25BA7C7C4(&qword_26A5333C0, MEMORY[0x263F8F3A0]);
  int v75 = sub_25BAA5040();
  uint64_t v44 = *(void (**)(unsigned char *, uint64_t))(v43 + 8);
  v44(v42, v39);
  sub_25BA798DC((uint64_t)v25, &qword_26A533340);
  sub_25BA798DC((uint64_t)v27, &qword_26A533340);
  v44(v22, v39);
  uint64_t v33 = v76;
  sub_25BA798DC((uint64_t)v18, &qword_26A533340);
  if ((v75 & 1) == 0) {
    return 0;
  }
LABEL_16:
  uint64_t v45 = v34[8];
  uint64_t v46 = (void *)(v33 + v45);
  uint64_t v47 = *(void *)(v33 + v45 + 8);
  uint64_t v48 = (void *)(v79 + v45);
  uint64_t v49 = v48[1];
  if (v47)
  {
    uint64_t v51 = v77;
    uint64_t v50 = (uint64_t)v78;
    if (!v49) {
      return 0;
    }
    if (*v46 != *v48 || v47 != v49)
    {
      char v52 = sub_25BAA5570();
      BOOL result = 0;
      if ((v52 & 1) == 0) {
        return result;
      }
    }
  }
  else
  {
    uint64_t v51 = v77;
    uint64_t v50 = (uint64_t)v78;
    if (v49) {
      return 0;
    }
  }
  if (*(unsigned __int8 *)(v33 + v34[9]) != *(unsigned __int8 *)(v79 + v34[9])
    || *(unsigned __int8 *)(v33 + v34[10]) != *(unsigned __int8 *)(v79 + v34[10])
    || *(unsigned __int8 *)(v33 + v34[11]) != *(unsigned __int8 *)(v79 + v34[11]))
  {
    return 0;
  }
  uint64_t v53 = v34[12];
  int v54 = *(unsigned __int8 *)(v33 + v53);
  int v55 = *(unsigned __int8 *)(v79 + v53);
  if (v54 == 3)
  {
    if (v55 != 3) {
      return 0;
    }
  }
  else
  {
    BOOL result = 0;
    if (v55 == 3 || v54 != v55) {
      return result;
    }
  }
  uint64_t v56 = v34[13];
  uint64_t v57 = v33 + v56;
  char v58 = *(unsigned char *)(v33 + v56 + 33);
  uint64_t v59 = v79 + v56;
  char v60 = *(unsigned char *)(v59 + 33);
  if (v58) {
    goto LABEL_32;
  }
  if (*(unsigned char *)(v59 + 33)) {
    return 0;
  }
  BOOL result = 0;
  if (*(double *)v57 != *(double *)v59
    || *(double *)(v57 + 8) != *(double *)(v59 + 8)
    || *(double *)(v57 + 16) != *(double *)(v59 + 16))
  {
    return result;
  }
  char v60 = *(unsigned char *)(v59 + 32);
  if (*(unsigned char *)(v57 + 32))
  {
LABEL_32:
    if ((v60 & 1) == 0) {
      return 0;
    }
  }
  else
  {
    BOOL result = 0;
    if ((*(unsigned char *)(v59 + 32) & 1) != 0 || *(double *)(v57 + 24) != *(double *)(v59 + 24)) {
      return result;
    }
  }
  uint64_t v61 = v34[14];
  int v62 = *(unsigned __int8 *)(v33 + v61);
  int v63 = *(unsigned __int8 *)(v79 + v61);
  if (v62 == 3)
  {
    if (v63 != 3) {
      return 0;
    }
  }
  else
  {
    BOOL result = 0;
    if (v63 == 3 || v62 != v63) {
      return result;
    }
  }
  uint64_t v64 = v34[15];
  int v65 = *(unsigned __int8 *)(v33 + v64);
  int v66 = *(unsigned __int8 *)(v79 + v64);
  if (v65 == 2)
  {
    if (v66 != 2) {
      return 0;
    }
    goto LABEL_51;
  }
  BOOL result = 0;
  if (v66 != 2 && ((v66 ^ v65) & 1) == 0)
  {
LABEL_51:
    v67 = v85;
    sub_25BA7C6FC(v33 + v34[16], (uint64_t)v85, &qword_26A533358);
    v68 = v84;
    sub_25BA7C6FC(v79 + v34[16], (uint64_t)v84, &qword_26A533358);
    uint64_t v69 = v50 + *(int *)(v83 + 48);
    sub_25BA7C6FC((uint64_t)v67, v50, &qword_26A533358);
    sub_25BA7C6FC((uint64_t)v68, v69, &qword_26A533358);
    v70 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v86 + 48);
    if (v70(v50, 1, v51) == 1)
    {
      sub_25BA798DC((uint64_t)v68, &qword_26A533358);
      sub_25BA798DC((uint64_t)v67, &qword_26A533358);
      if (v70(v69, 1, v51) == 1)
      {
        sub_25BA798DC(v50, &qword_26A533358);
        return 1;
      }
    }
    else
    {
      v71 = v82;
      sub_25BA7C6FC(v50, (uint64_t)v82, &qword_26A533358);
      if (v70(v69, 1, v51) != 1)
      {
        uint64_t v72 = v81;
        sub_25BA7C80C(v69, (uint64_t)v81);
        BOOL v73 = _s24ScreenContinuityServices15CompanionDeviceV11SessionInfoV2eeoiySbAE_AEtFZ_0((uint64_t)v71, (uint64_t)v72);
        sub_25BA7C870((uint64_t)v72);
        sub_25BA798DC((uint64_t)v68, &qword_26A533358);
        sub_25BA798DC((uint64_t)v67, &qword_26A533358);
        sub_25BA7C870((uint64_t)v71);
        sub_25BA798DC(v50, &qword_26A533358);
        return v73;
      }
      sub_25BA798DC((uint64_t)v68, &qword_26A533358);
      sub_25BA798DC((uint64_t)v67, &qword_26A533358);
      sub_25BA7C870((uint64_t)v71);
    }
    uint64_t v40 = &qword_26A5333B0;
    uint64_t v41 = v50;
    goto LABEL_12;
  }
  return result;
}

BOOL _s24ScreenContinuityServices15CompanionDeviceV11SessionInfoV2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25BAA4D40();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5333C8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533348);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v17 = (char *)&v31 - v16;
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v31 - v18;
  if ((sub_25BAA4D20() & 1) == 0) {
    return 0;
  }
  uint64_t v32 = v7;
  uint64_t v20 = v5;
  uint64_t v21 = type metadata accessor for CompanionDevice.SessionInfo(0);
  sub_25BA7C6FC(a1 + *(int *)(v21 + 20), (uint64_t)v19, &qword_26A533348);
  uint64_t v22 = *(int *)(v21 + 20);
  uint64_t v23 = v20;
  sub_25BA7C6FC(a2 + v22, (uint64_t)v17, &qword_26A533348);
  uint64_t v24 = (uint64_t)&v10[*(int *)(v8 + 48)];
  sub_25BA7C6FC((uint64_t)v19, (uint64_t)v10, &qword_26A533348);
  sub_25BA7C6FC((uint64_t)v17, v24, &qword_26A533348);
  uint64_t v25 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v20 + 48);
  if (v25((uint64_t)v10, 1, v4) == 1)
  {
    sub_25BA798DC((uint64_t)v17, &qword_26A533348);
    sub_25BA798DC((uint64_t)v19, &qword_26A533348);
    if (v25(v24, 1, v4) == 1)
    {
      sub_25BA798DC((uint64_t)v10, &qword_26A533348);
      return 1;
    }
    goto LABEL_7;
  }
  sub_25BA7C6FC((uint64_t)v10, (uint64_t)v14, &qword_26A533348);
  if (v25(v24, 1, v4) == 1)
  {
    sub_25BA798DC((uint64_t)v17, &qword_26A533348);
    sub_25BA798DC((uint64_t)v19, &qword_26A533348);
    (*(void (**)(char *, uint64_t))(v20 + 8))(v14, v4);
LABEL_7:
    sub_25BA798DC((uint64_t)v10, &qword_26A5333C8);
    return 0;
  }
  uint64_t v26 = *(void (**)(char *, uint64_t, uint64_t))(v20 + 32);
  id v27 = v32;
  v26(v32, v24, v4);
  sub_25BA7C7C4(&qword_26A5333D0, MEMORY[0x263F07490]);
  char v28 = sub_25BAA5040();
  uint64_t v29 = *(void (**)(char *, uint64_t))(v23 + 8);
  v29(v27, v4);
  sub_25BA798DC((uint64_t)v17, &qword_26A533348);
  sub_25BA798DC((uint64_t)v19, &qword_26A533348);
  v29(v14, v4);
  sub_25BA798DC((uint64_t)v10, &qword_26A533348);
  return (v28 & 1) != 0;
}

uint64_t sub_25BA7C6FC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25BA7C760(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_25BA7C7C4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25BA7C80C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CompanionDevice.SessionInfo(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25BA7C870(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CompanionDevice.SessionInfo(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_25BA7C8D0()
{
  unint64_t result = qword_26A533368;
  if (!qword_26A533368)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A533368);
  }
  return result;
}

unint64_t sub_25BA7C928()
{
  unint64_t result = qword_26A533370;
  if (!qword_26A533370)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A533370);
  }
  return result;
}

unint64_t sub_25BA7C980()
{
  unint64_t result = qword_26A533378;
  if (!qword_26A533378)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A533378);
  }
  return result;
}

uint64_t sub_25BA7C9D4()
{
  return sub_25BA7C7C4(&qword_26A533380, (void (*)(uint64_t))type metadata accessor for CompanionDevice.SessionInfo);
}

uint64_t sub_25BA7CA1C()
{
  return sub_25BA7C7C4(&qword_26A533388, (void (*)(uint64_t))type metadata accessor for CompanionDevice);
}

uint64_t sub_25BA7CA64()
{
  return sub_25BA7C7C4(&qword_26A5332E0, MEMORY[0x263F07508]);
}

void *initializeBufferWithCopyOfBuffer for CompanionDevice(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v20 = *a2;
    *a1 = *a2;
    a1 = (void *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_25BAA4DA0();
    uint64_t v8 = *(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((void *)((char *)a1 + a3[5]), (void *)((char *)a2 + a3[5]), v7);
    uint64_t v9 = a3[6];
    uint64_t v10 = a3[7];
    uint64_t v11 = (void *)((char *)a1 + v9);
    uint64_t v12 = (void *)((char *)a2 + v9);
    uint64_t v13 = v12[1];
    void *v11 = *v12;
    v11[1] = v13;
    uint64_t v14 = (char *)a1 + v10;
    uint64_t v15 = (char *)a2 + v10;
    uint64_t v16 = sub_25BAA4F40();
    uint64_t v17 = *(void *)(v16 - 8);
    uint64_t v18 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48);
    swift_bridgeObjectRetain();
    if (v18(v15, 1, v16))
    {
      uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533340);
      memcpy(v14, v15, *(void *)(*(void *)(v19 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v14, v15, v16);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
    }
    uint64_t v21 = a3[8];
    uint64_t v22 = a3[9];
    uint64_t v23 = (void *)((char *)a1 + v21);
    uint64_t v24 = (void *)((char *)a2 + v21);
    uint64_t v25 = v24[1];
    void *v23 = *v24;
    v23[1] = v25;
    *((unsigned char *)a1 + v22) = *((unsigned char *)a2 + v22);
    uint64_t v26 = a3[11];
    *((unsigned char *)a1 + a3[10]) = *((unsigned char *)a2 + a3[10]);
    *((unsigned char *)a1 + v26) = *((unsigned char *)a2 + v26);
    uint64_t v27 = a3[13];
    *((unsigned char *)a1 + a3[12]) = *((unsigned char *)a2 + a3[12]);
    char v28 = (char *)a1 + v27;
    uint64_t v29 = (char *)a2 + v27;
    long long v30 = *((_OWORD *)v29 + 1);
    *(_OWORD *)char v28 = *(_OWORD *)v29;
    *((_OWORD *)v28 + 1) = v30;
    *((_WORD *)v28 + 16) = *((_WORD *)v29 + 16);
    uint64_t v31 = a3[15];
    *((unsigned char *)a1 + a3[14]) = *((unsigned char *)a2 + a3[14]);
    uint64_t v32 = a3[16];
    uint64_t v33 = (char *)a1 + v32;
    uint64_t v34 = (char *)a2 + v32;
    *((unsigned char *)a1 + v31) = *((unsigned char *)a2 + v31);
    uint64_t v35 = type metadata accessor for CompanionDevice.SessionInfo(0);
    uint64_t v36 = *(void *)(v35 - 8);
    uint64_t v37 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48);
    swift_bridgeObjectRetain();
    if (v37(v34, 1, v35))
    {
      uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533358);
      memcpy(v33, v34, *(void *)(*(void *)(v38 - 8) + 64));
    }
    else
    {
      uint64_t v39 = sub_25BAA4D40();
      uint64_t v40 = *(void *)(v39 - 8);
      uint64_t v41 = *(void (**)(char *, char *, uint64_t))(v40 + 16);
      v41(v33, v34, v39);
      uint64_t v42 = *(int *)(v35 + 20);
      uint64_t v43 = &v33[v42];
      uint64_t v44 = &v34[v42];
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48))(v44, 1, v39))
      {
        uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533348);
        memcpy(v43, v44, *(void *)(*(void *)(v45 - 8) + 64));
      }
      else
      {
        v41(v43, v44, v39);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v40 + 56))(v43, 0, 1, v39);
      }
      (*(void (**)(char *, void, uint64_t, uint64_t))(v36 + 56))(v33, 0, 1, v35);
    }
  }
  return a1;
}

uint64_t destroy for CompanionDevice(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_25BAA4DA0();
  int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(a1, v4);
  v5(a1 + a2[5], v4);
  swift_bridgeObjectRelease();
  uint64_t v6 = a1 + a2[7];
  uint64_t v7 = sub_25BAA4F40();
  uint64_t v8 = *(void *)(v7 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  }
  swift_bridgeObjectRelease();
  uint64_t v9 = a1 + a2[16];
  uint64_t v10 = type metadata accessor for CompanionDevice.SessionInfo(0);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48))(v9, 1, v10);
  if (!result)
  {
    uint64_t v12 = sub_25BAA4D40();
    uint64_t v13 = *(void *)(v12 - 8);
    uint64_t v15 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
    v15(v9, v12);
    uint64_t v14 = v9 + *(int *)(v10 + 20);
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v14, 1, v12);
    if (!result)
    {
      return ((uint64_t (*)(uint64_t, uint64_t))v15)(v14, v12);
    }
  }
  return result;
}

uint64_t initializeWithCopy for CompanionDevice(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25BAA4DA0();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v8 = a3[6];
  uint64_t v9 = a3[7];
  uint64_t v10 = (void *)(a1 + v8);
  uint64_t v11 = (void *)(a2 + v8);
  uint64_t v12 = v11[1];
  *uint64_t v10 = *v11;
  v10[1] = v12;
  uint64_t v13 = (void *)(a1 + v9);
  uint64_t v14 = (const void *)(a2 + v9);
  uint64_t v15 = sub_25BAA4F40();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v16 + 48);
  swift_bridgeObjectRetain();
  if (v17(v14, 1, v15))
  {
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533340);
    memcpy(v13, v14, *(void *)(*(void *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v16 + 16))(v13, v14, v15);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  }
  uint64_t v19 = a3[8];
  uint64_t v20 = a3[9];
  uint64_t v21 = (void *)(a1 + v19);
  uint64_t v22 = (void *)(a2 + v19);
  uint64_t v23 = v22[1];
  *uint64_t v21 = *v22;
  v21[1] = v23;
  *(unsigned char *)(a1 + v20) = *(unsigned char *)(a2 + v20);
  uint64_t v24 = a3[11];
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  *(unsigned char *)(a1 + v24) = *(unsigned char *)(a2 + v24);
  uint64_t v25 = a3[13];
  *(unsigned char *)(a1 + a3[12]) = *(unsigned char *)(a2 + a3[12]);
  uint64_t v26 = a1 + v25;
  uint64_t v27 = a2 + v25;
  long long v28 = *(_OWORD *)(v27 + 16);
  *(_OWORD *)uint64_t v26 = *(_OWORD *)v27;
  *(_OWORD *)(v26 + 16) = v28;
  *(_WORD *)(v26 + 32) = *(_WORD *)(v27 + 32);
  uint64_t v29 = a3[15];
  *(unsigned char *)(a1 + a3[14]) = *(unsigned char *)(a2 + a3[14]);
  uint64_t v30 = a3[16];
  uint64_t v31 = (char *)(a1 + v30);
  uint64_t v32 = (char *)(a2 + v30);
  *(unsigned char *)(a1 + v29) = *(unsigned char *)(a2 + v29);
  uint64_t v33 = type metadata accessor for CompanionDevice.SessionInfo(0);
  uint64_t v34 = *(void *)(v33 - 8);
  uint64_t v35 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48);
  swift_bridgeObjectRetain();
  if (v35(v32, 1, v33))
  {
    uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533358);
    memcpy(v31, v32, *(void *)(*(void *)(v36 - 8) + 64));
  }
  else
  {
    uint64_t v37 = sub_25BAA4D40();
    uint64_t v38 = *(void *)(v37 - 8);
    uint64_t v39 = *(void (**)(char *, char *, uint64_t))(v38 + 16);
    v39(v31, v32, v37);
    uint64_t v40 = *(int *)(v33 + 20);
    uint64_t v41 = &v31[v40];
    uint64_t v42 = &v32[v40];
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v38 + 48))(v42, 1, v37))
    {
      uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533348);
      memcpy(v41, v42, *(void *)(*(void *)(v43 - 8) + 64));
    }
    else
    {
      v39(v41, v42, v37);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v38 + 56))(v41, 0, 1, v37);
    }
    (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
  }
  return a1;
}

uint64_t assignWithCopy for CompanionDevice(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25BAA4DA0();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  *uint64_t v9 = *v10;
  v9[1] = v10[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v11 = a3[7];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  uint64_t v14 = sub_25BAA4F40();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v15 + 48);
  int v17 = v16(v12, 1, v14);
  int v18 = v16(v13, 1, v14);
  if (v17)
  {
    if (!v18)
    {
      (*(void (**)(void *, void *, uint64_t))(v15 + 16))(v12, v13, v14);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v18)
  {
    (*(void (**)(void *, uint64_t))(v15 + 8))(v12, v14);
LABEL_6:
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533340);
    memcpy(v12, v13, *(void *)(*(void *)(v19 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v15 + 24))(v12, v13, v14);
LABEL_7:
  uint64_t v20 = a3[8];
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = (void *)(a2 + v20);
  *uint64_t v21 = *v22;
  v21[1] = v22[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  *(unsigned char *)(a1 + a3[12]) = *(unsigned char *)(a2 + a3[12]);
  uint64_t v23 = a3[13];
  uint64_t v24 = a1 + v23;
  uint64_t v25 = (long long *)(a2 + v23);
  long long v26 = *v25;
  long long v27 = v25[1];
  *(_WORD *)(v24 + 32) = *((_WORD *)v25 + 16);
  *(_OWORD *)uint64_t v24 = v26;
  *(_OWORD *)(v24 + 16) = v27;
  *(unsigned char *)(a1 + a3[14]) = *(unsigned char *)(a2 + a3[14]);
  *(unsigned char *)(a1 + a3[15]) = *(unsigned char *)(a2 + a3[15]);
  uint64_t v28 = a3[16];
  uint64_t v29 = a1 + v28;
  uint64_t v30 = (char *)(a2 + v28);
  uint64_t v31 = type metadata accessor for CompanionDevice.SessionInfo(0);
  uint64_t v32 = *(void *)(v31 - 8);
  uint64_t v33 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v32 + 48);
  int v34 = v33(v29, 1, v31);
  int v35 = v33((uint64_t)v30, 1, v31);
  if (!v34)
  {
    if (!v35)
    {
      uint64_t v46 = sub_25BAA4D40();
      uint64_t v47 = *(void *)(v46 - 8);
      uint64_t v48 = *(void (**)(uint64_t, char *, uint64_t))(v47 + 24);
      v48(v29, v30, v46);
      uint64_t v49 = *(int *)(v31 + 20);
      uint64_t v50 = (void *)(v29 + v49);
      uint64_t v51 = &v30[v49];
      char v52 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v47 + 48);
      int v53 = v52(v50, 1, v46);
      int v54 = v52(v51, 1, v46);
      if (v53)
      {
        if (!v54)
        {
          (*(void (**)(void *, char *, uint64_t))(v47 + 16))(v50, v51, v46);
          (*(void (**)(void *, void, uint64_t, uint64_t))(v47 + 56))(v50, 0, 1, v46);
          return a1;
        }
      }
      else
      {
        if (!v54)
        {
          v48((uint64_t)v50, v51, v46);
          return a1;
        }
        (*(void (**)(void *, uint64_t))(v47 + 8))(v50, v46);
      }
      size_t v43 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A533348) - 8) + 64);
      uint64_t v44 = v50;
      uint64_t v45 = v51;
      goto LABEL_14;
    }
    sub_25BA7C870(v29);
LABEL_13:
    size_t v43 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A533358) - 8) + 64);
    uint64_t v44 = (void *)v29;
    uint64_t v45 = v30;
LABEL_14:
    memcpy(v44, v45, v43);
    return a1;
  }
  if (v35) {
    goto LABEL_13;
  }
  uint64_t v36 = sub_25BAA4D40();
  uint64_t v37 = *(void *)(v36 - 8);
  uint64_t v38 = *(void (**)(uint64_t, char *, uint64_t))(v37 + 16);
  v38(v29, v30, v36);
  uint64_t v39 = *(int *)(v31 + 20);
  uint64_t v40 = (void *)(v29 + v39);
  uint64_t v41 = &v30[v39];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v41, 1, v36))
  {
    uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533348);
    memcpy(v40, v41, *(void *)(*(void *)(v42 - 8) + 64));
  }
  else
  {
    v38((uint64_t)v40, v41, v36);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v37 + 56))(v40, 0, 1, v36);
  }
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v32 + 56))(v29, 0, 1, v31);
  return a1;
}

uint64_t initializeWithTake for CompanionDevice(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25BAA4DA0();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v8 = a3[7];
  *(_OWORD *)(a1 + a3[6]) = *(_OWORD *)(a2 + a3[6]);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (const void *)(a2 + v8);
  uint64_t v11 = sub_25BAA4F40();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533340);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 32))(v9, v10, v11);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  uint64_t v14 = a3[9];
  *(_OWORD *)(a1 + a3[8]) = *(_OWORD *)(a2 + a3[8]);
  *(unsigned char *)(a1 + v14) = *(unsigned char *)(a2 + v14);
  uint64_t v15 = a3[11];
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  *(unsigned char *)(a1 + v15) = *(unsigned char *)(a2 + v15);
  uint64_t v16 = a3[13];
  *(unsigned char *)(a1 + a3[12]) = *(unsigned char *)(a2 + a3[12]);
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  long long v19 = *(_OWORD *)(v18 + 16);
  *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
  *(_OWORD *)(v17 + 16) = v19;
  *(_WORD *)(v17 + 32) = *(_WORD *)(v18 + 32);
  uint64_t v20 = a3[15];
  *(unsigned char *)(a1 + a3[14]) = *(unsigned char *)(a2 + a3[14]);
  uint64_t v21 = a3[16];
  uint64_t v22 = (char *)(a1 + v21);
  uint64_t v23 = (char *)(a2 + v21);
  *(unsigned char *)(a1 + v20) = *(unsigned char *)(a2 + v20);
  uint64_t v24 = type metadata accessor for CompanionDevice.SessionInfo(0);
  uint64_t v25 = *(void *)(v24 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24))
  {
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533358);
    memcpy(v22, v23, *(void *)(*(void *)(v26 - 8) + 64));
  }
  else
  {
    uint64_t v27 = sub_25BAA4D40();
    uint64_t v28 = *(void *)(v27 - 8);
    uint64_t v29 = *(void (**)(char *, char *, uint64_t))(v28 + 32);
    v29(v22, v23, v27);
    uint64_t v30 = *(int *)(v24 + 20);
    uint64_t v31 = &v22[v30];
    uint64_t v32 = &v23[v30];
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v32, 1, v27))
    {
      uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533348);
      memcpy(v31, v32, *(void *)(*(void *)(v33 - 8) + 64));
    }
    else
    {
      v29(v31, v32, v27);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v28 + 56))(v31, 0, 1, v27);
    }
    (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
  }
  return a1;
}

uint64_t assignWithTake for CompanionDevice(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25BAA4DA0();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (uint64_t *)(a2 + v8);
  uint64_t v12 = *v10;
  uint64_t v11 = v10[1];
  *uint64_t v9 = v12;
  v9[1] = v11;
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[7];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (void *)(a2 + v13);
  uint64_t v16 = sub_25BAA4F40();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v17 + 48);
  int v19 = v18(v14, 1, v16);
  int v20 = v18(v15, 1, v16);
  if (v19)
  {
    if (!v20)
    {
      (*(void (**)(void *, void *, uint64_t))(v17 + 32))(v14, v15, v16);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v20)
  {
    (*(void (**)(void *, uint64_t))(v17 + 8))(v14, v16);
LABEL_6:
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533340);
    memcpy(v14, v15, *(void *)(*(void *)(v21 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v17 + 40))(v14, v15, v16);
LABEL_7:
  uint64_t v22 = a3[8];
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = (uint64_t *)(a2 + v22);
  uint64_t v26 = *v24;
  uint64_t v25 = v24[1];
  void *v23 = v26;
  v23[1] = v25;
  swift_bridgeObjectRelease();
  uint64_t v27 = a3[10];
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  *(unsigned char *)(a1 + v27) = *(unsigned char *)(a2 + v27);
  uint64_t v28 = a3[12];
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  *(unsigned char *)(a1 + v28) = *(unsigned char *)(a2 + v28);
  uint64_t v29 = a3[13];
  uint64_t v30 = a3[14];
  uint64_t v31 = a1 + v29;
  uint64_t v32 = (long long *)(a2 + v29);
  long long v33 = *v32;
  long long v34 = v32[1];
  *(_WORD *)(v31 + 32) = *((_WORD *)v32 + 16);
  *(_OWORD *)uint64_t v31 = v33;
  *(_OWORD *)(v31 + 16) = v34;
  *(unsigned char *)(a1 + v30) = *(unsigned char *)(a2 + v30);
  uint64_t v35 = a3[15];
  uint64_t v36 = a3[16];
  uint64_t v37 = a1 + v36;
  uint64_t v38 = (char *)(a2 + v36);
  *(unsigned char *)(a1 + v35) = *(unsigned char *)(a2 + v35);
  uint64_t v39 = type metadata accessor for CompanionDevice.SessionInfo(0);
  uint64_t v40 = *(void *)(v39 - 8);
  uint64_t v41 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v40 + 48);
  int v42 = v41(v37, 1, v39);
  int v43 = v41((uint64_t)v38, 1, v39);
  if (!v42)
  {
    if (!v43)
    {
      uint64_t v54 = sub_25BAA4D40();
      uint64_t v55 = *(void *)(v54 - 8);
      uint64_t v56 = *(void (**)(uint64_t, char *, uint64_t))(v55 + 40);
      v56(v37, v38, v54);
      uint64_t v57 = *(int *)(v39 + 20);
      char v58 = (void *)(v37 + v57);
      uint64_t v59 = &v38[v57];
      char v60 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v55 + 48);
      int v61 = v60(v58, 1, v54);
      int v62 = v60(v59, 1, v54);
      if (v61)
      {
        if (!v62)
        {
          (*(void (**)(void *, char *, uint64_t))(v55 + 32))(v58, v59, v54);
          (*(void (**)(void *, void, uint64_t, uint64_t))(v55 + 56))(v58, 0, 1, v54);
          return a1;
        }
      }
      else
      {
        if (!v62)
        {
          v56((uint64_t)v58, v59, v54);
          return a1;
        }
        (*(void (**)(void *, uint64_t))(v55 + 8))(v58, v54);
      }
      size_t v51 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A533348) - 8) + 64);
      char v52 = v58;
      int v53 = v59;
      goto LABEL_14;
    }
    sub_25BA7C870(v37);
LABEL_13:
    size_t v51 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A533358) - 8) + 64);
    char v52 = (void *)v37;
    int v53 = v38;
LABEL_14:
    memcpy(v52, v53, v51);
    return a1;
  }
  if (v43) {
    goto LABEL_13;
  }
  uint64_t v44 = sub_25BAA4D40();
  uint64_t v45 = *(void *)(v44 - 8);
  uint64_t v46 = *(void (**)(uint64_t, char *, uint64_t))(v45 + 32);
  v46(v37, v38, v44);
  uint64_t v47 = *(int *)(v39 + 20);
  uint64_t v48 = (void *)(v37 + v47);
  uint64_t v49 = &v38[v47];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v45 + 48))(v49, 1, v44))
  {
    uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533348);
    memcpy(v48, v49, *(void *)(*(void *)(v50 - 8) + 64));
  }
  else
  {
    v46((uint64_t)v48, v49, v44);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v45 + 56))(v48, 0, 1, v44);
  }
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v40 + 56))(v37, 0, 1, v39);
  return a1;
}

uint64_t getEnumTagSinglePayload for CompanionDevice(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25BA7E41C);
}

uint64_t sub_25BA7E41C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25BAA4DA0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_9:
    return v9(v10, a2, v8);
  }
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v11 = *(void *)(a1 + a3[6] + 8);
    if (v11 >= 0xFFFFFFFF) {
      LODWORD(v11) = -1;
    }
    return (v11 + 1);
  }
  else
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533340);
    uint64_t v14 = *(void *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == a2)
    {
      uint64_t v8 = v13;
      uint64_t v10 = a1 + a3[7];
      uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 48);
      goto LABEL_9;
    }
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533358);
    uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48);
    uint64_t v17 = v15;
    uint64_t v18 = a1 + a3[16];
    return v16(v18, a2, v17);
  }
}

uint64_t storeEnumTagSinglePayload for CompanionDevice(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25BA7E5BC);
}

uint64_t sub_25BA7E5BC(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result = sub_25BAA4DA0();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    unint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_7:
    return v11(v12, a2, a2, v10);
  }
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + a4[6] + 8) = (a2 - 1);
    return result;
  }
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533340);
  uint64_t v14 = *(void *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v12 = a1 + a4[7];
    unint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_7;
  }
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533358);
  uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  uint64_t v17 = v15;
  uint64_t v18 = a1 + a4[16];
  return v16(v18, a2, a2, v17);
}

void sub_25BA7E748()
{
  sub_25BAA4DA0();
  if (v0 <= 0x3F)
  {
    sub_25BA7E8C8(319, &qword_26A533390, MEMORY[0x263F8F3A0]);
    if (v1 <= 0x3F)
    {
      sub_25BA7E8C8(319, &qword_26A533398, (void (*)(uint64_t))type metadata accessor for CompanionDevice.SessionInfo);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_25BA7E8C8(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_25BAA5320();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t getEnumTagSinglePayload for CompanionDevice.PairingState(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for CompanionDevice.PairingState(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25BA7EA78);
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

unsigned char *sub_25BA7EAA0(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for CompanionDevice.PairingState()
{
  return &type metadata for CompanionDevice.PairingState;
}

uint64_t initializeBufferWithCopyOfBuffer for CompanionDevice.Screen(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
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

uint64_t getEnumTagSinglePayload for CompanionDevice.Screen(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 33)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for CompanionDevice.Screen(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
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
  *(unsigned char *)(result + 33) = v3;
  return result;
}

ValueMetadata *type metadata accessor for CompanionDevice.Screen()
{
  return &type metadata for CompanionDevice.Screen;
}

unsigned char *storeEnumTagSinglePayload for CompanionDevice.Proximity(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 1;
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
        JUMPOUT(0x25BA7EC2CLL);
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
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CompanionDevice.Proximity()
{
  return &type metadata for CompanionDevice.Proximity;
}

uint64_t *initializeBufferWithCopyOfBuffer for CompanionDevice.SessionInfo(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_25BAA4D40();
    uint64_t v8 = *(void *)(v7 - 8);
    uint64_t v9 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16);
    v9(a1, a2, v7);
    uint64_t v10 = *(int *)(a3 + 20);
    unint64_t v11 = (char *)a1 + v10;
    uint64_t v12 = (char *)a2 + v10;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v12, 1, v7))
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533348);
      memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      v9((uint64_t *)v11, (uint64_t *)v12, v7);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v11, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t destroy for CompanionDevice.SessionInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25BAA4D40();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v8(a1, v4);
  uint64_t v6 = a1 + *(int *)(a2 + 20);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v6, 1, v4);
  if (!result)
  {
    return ((uint64_t (*)(uint64_t, uint64_t))v8)(v6, v4);
  }
  return result;
}

char *initializeWithCopy for CompanionDevice.SessionInfo(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_25BAA4D40();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 16);
  v8(a1, a2, v6);
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = &a1[v9];
  unint64_t v11 = &a2[v9];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v11, 1, v6))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533348);
    memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    v8(v10, v11, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v6);
  }
  return a1;
}

char *assignWithCopy for CompanionDevice.SessionInfo(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_25BAA4D40();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 24);
  v8(a1, a2, v6);
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = &a1[v9];
  unint64_t v11 = &a2[v9];
  uint64_t v12 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(v7 + 48);
  int v13 = v12(&a1[v9], 1, v6);
  int v14 = v12(v11, 1, v6);
  if (!v13)
  {
    if (!v14)
    {
      v8(v10, v11, v6);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533348);
    memcpy(v10, v11, *(void *)(*(void *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v11, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v6);
  return a1;
}

char *initializeWithTake for CompanionDevice.SessionInfo(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_25BAA4D40();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 32);
  v8(a1, a2, v6);
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = &a1[v9];
  unint64_t v11 = &a2[v9];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v11, 1, v6))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533348);
    memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    v8(v10, v11, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v6);
  }
  return a1;
}

char *assignWithTake for CompanionDevice.SessionInfo(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_25BAA4D40();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 40);
  v8(a1, a2, v6);
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = &a1[v9];
  unint64_t v11 = &a2[v9];
  uint64_t v12 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(v7 + 48);
  int v13 = v12(&a1[v9], 1, v6);
  int v14 = v12(v11, 1, v6);
  if (!v13)
  {
    if (!v14)
    {
      v8(v10, v11, v6);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533348);
    memcpy(v10, v11, *(void *)(*(void *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v10, v11, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for CompanionDevice.SessionInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25BA7F500);
}

uint64_t sub_25BA7F500(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25BAA4D40();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533348);
    unint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t storeEnumTagSinglePayload for CompanionDevice.SessionInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25BA7F610);
}

uint64_t sub_25BA7F610(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_25BAA4D40();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533348);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

void sub_25BA7F718()
{
  sub_25BAA4D40();
  if (v0 <= 0x3F)
  {
    sub_25BA7E8C8(319, &qword_26A5333A0, MEMORY[0x263F07490]);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_25BA7F808(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_25BA7F828(uint64_t result, int a2, int a3)
{
  if (a2)
  {
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
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize()
{
  if (!qword_26A5333A8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_26A5333A8);
    }
  }
}

uint64_t ContinuityLaunchRequest.type.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ContinuityLaunchRequest.payload.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  sub_25BA7F90C(v1, *(void *)(v0 + 24));
  return v1;
}

uint64_t sub_25BA7F90C(uint64_t a1, unint64_t a2)
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

uint64_t sub_25BA7F964(char a1)
{
  if (a1) {
    return 0x64616F6C796170;
  }
  else {
    return 1701869940;
  }
}

uint64_t sub_25BA7F994()
{
  return sub_25BA7F964(*v0);
}

uint64_t sub_25BA7F99C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25BA80360(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25BA7F9C4()
{
  return 0;
}

void sub_25BA7F9D0(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_25BA7F9DC(uint64_t a1)
{
  unint64_t v2 = sub_25BA802B8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25BA7FA18(uint64_t a1)
{
  unint64_t v2 = sub_25BA802B8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25BA7FA54(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v12 = a4;
  uint64_t v13 = a5;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5333D8);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25BA802B8();
  sub_25BAA5650();
  LOBYTE(v14) = 0;
  sub_25BAA5510();
  if (!v5)
  {
    uint64_t v14 = v12;
    uint64_t v15 = v13;
    char v16 = 1;
    sub_25BA8030C();
    sub_25BAA5520();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_25BA7FBE4@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_25BA8043C(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

uint64_t sub_25BA7FC14(void *a1)
{
  return sub_25BA7FA54(a1, *v1, v1[1], v1[2], v1[3]);
}

uint64_t ContinuityLaunchRequest.init(type:payload:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

uint64_t ContinuityLaunchRequest.encode()()
{
  uint64_t v1 = *(void *)(v0 + 16);
  unint64_t v2 = *(void *)(v0 + 24);
  sub_25BAA4BE0();
  swift_allocObject();
  sub_25BAA4BD0();
  swift_bridgeObjectRetain();
  sub_25BA7F90C(v1, v2);
  sub_25BA7FD14();
  uint64_t v3 = sub_25BAA4BC0();
  swift_bridgeObjectRelease();
  swift_release();
  sub_25BA7FD68(v1, v2);
  return v3;
}

unint64_t sub_25BA7FD14()
{
  unint64_t result = qword_26A5341F0;
  if (!qword_26A5341F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5341F0);
  }
  return result;
}

uint64_t sub_25BA7FD68(uint64_t a1, unint64_t a2)
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

uint64_t ContinuityLaunchRequest.init(decoding:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v7 = sub_25BAA4F70();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25BAA4BB0();
  swift_allocObject();
  sub_25BAA4BA0();
  sub_25BA80018();
  sub_25BAA4B90();
  if (v3)
  {

    uint64_t v11 = sub_25BA9091C();
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v11, v7);
    uint64_t v12 = sub_25BAA4F50();
    os_log_type_t v13 = sub_25BAA5250();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      unint64_t v21 = a2;
      uint64_t v15 = v14;
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_25BA70000, v12, v13, "Error decoding ContinuityLaunchRequest, falling back to legacy notification.", v14, 2u);
      char v16 = v15;
      a2 = v21;
      MEMORY[0x26116FA80](v16, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    uint64_t result = swift_release();
    unint64_t v18 = 0xEC0000006E6F6974;
    uint64_t v19 = 0x6163696669746F6ELL;
  }
  else
  {
    swift_release();
    sub_25BA7FD68(a1, a2);
    uint64_t v19 = v20[0];
    unint64_t v18 = v20[1];
    a1 = v20[2];
    a2 = v20[3];
    swift_bridgeObjectRetain();
    sub_25BA7F90C(a1, a2);
    swift_bridgeObjectRelease();
    uint64_t result = sub_25BA7FD68(a1, a2);
  }
  *a3 = v19;
  a3[1] = v18;
  a3[2] = a1;
  a3[3] = a2;
  return result;
}

unint64_t sub_25BA80018()
{
  unint64_t result = qword_26A5341F8[0];
  if (!qword_26A5341F8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A5341F8);
  }
  return result;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

ValueMetadata *type metadata accessor for ContinuityLaunchRequest()
{
  return &type metadata for ContinuityLaunchRequest;
}

uint64_t _s24ScreenContinuityServices23ContinuityLaunchRequestVwxx_0(uint64_t a1)
{
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = *(void *)(a1 + 24);
  return sub_25BA7FD68(v2, v3);
}

void *_s24ScreenContinuityServices23ContinuityLaunchRequestVwcp_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[2];
  unint64_t v5 = a2[3];
  swift_bridgeObjectRetain();
  sub_25BA7F90C(v4, v5);
  a1[2] = v4;
  a1[3] = v5;
  return a1;
}

void *_s24ScreenContinuityServices23ContinuityLaunchRequestVwca_0(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[2];
  unint64_t v4 = a2[3];
  sub_25BA7F90C(v5, v4);
  uint64_t v6 = a1[2];
  unint64_t v7 = a1[3];
  a1[2] = v5;
  a1[3] = v4;
  sub_25BA7FD68(v6, v7);
  return a1;
}

void *_s24ScreenContinuityServices23ContinuityLaunchRequestVwta_0(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a1[2];
  unint64_t v6 = a1[3];
  *((_OWORD *)a1 + 1) = *(_OWORD *)(a2 + 16);
  sub_25BA7FD68(v5, v6);
  return a1;
}

uint64_t _s24ScreenContinuityServices23ContinuityLaunchRequestVwet_0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_25BA80224(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ContinuityLaunchRequest.CodableData()
{
  return &type metadata for ContinuityLaunchRequest.CodableData;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_25BA802B8()
{
  unint64_t result = qword_26A534300[0];
  if (!qword_26A534300[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A534300);
  }
  return result;
}

unint64_t sub_25BA8030C()
{
  unint64_t result = qword_26A5333E0;
  if (!qword_26A5333E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5333E0);
  }
  return result;
}

uint64_t sub_25BA80360(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 1701869940 && a2 == 0xE400000000000000;
  if (v3 || (sub_25BAA5570() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x64616F6C796170 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_25BAA5570();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_25BA8043C(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5333E8);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v6 = &v11[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25BA802B8();
  sub_25BAA5640();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  else
  {
    LOBYTE(v12) = 0;
    uint64_t v7 = sub_25BAA54D0();
    v11[15] = 1;
    sub_25BA80670();
    swift_bridgeObjectRetain();
    sub_25BAA54E0();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
    uint64_t v9 = v12;
    unint64_t v10 = v13;
    swift_bridgeObjectRetain();
    sub_25BA7F90C(v9, v10);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    swift_bridgeObjectRelease();
    sub_25BA7FD68(v9, v10);
  }
  return v7;
}

unint64_t sub_25BA80670()
{
  unint64_t result = qword_26A5333F0;
  if (!qword_26A5333F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5333F0);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for ContinuityLaunchRequest.CodableData.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25BA80790);
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

ValueMetadata *type metadata accessor for ContinuityLaunchRequest.CodableData.CodingKeys()
{
  return &type metadata for ContinuityLaunchRequest.CodableData.CodingKeys;
}

unint64_t sub_25BA807CC()
{
  unint64_t result = qword_26A534410[0];
  if (!qword_26A534410[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A534410);
  }
  return result;
}

unint64_t sub_25BA80824()
{
  unint64_t result = qword_26A534520;
  if (!qword_26A534520)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A534520);
  }
  return result;
}

unint64_t sub_25BA8087C()
{
  unint64_t result = qword_26A534528[0];
  if (!qword_26A534528[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A534528);
  }
  return result;
}

void *CompanionDeviceManager.__allocating_init()()
{
  uint64_t v0 = (void *)swift_allocObject();
  swift_defaultActor_initialize();
  type metadata accessor for ReplicatorController();
  v0[14] = sub_25BA8F968();
  type metadata accessor for SharingController();
  v0[15] = sub_25BA71B5C();
  type metadata accessor for RapportController();
  v0[16] = sub_25BA90BDC();
  type metadata accessor for SessionManager(0);
  v0[17] = sub_25BA97448();
  return v0;
}

void *CompanionDeviceManager.init()()
{
  swift_defaultActor_initialize();
  type metadata accessor for ReplicatorController();
  v0[14] = sub_25BA8F968();
  type metadata accessor for SharingController();
  v0[15] = sub_25BA71B5C();
  type metadata accessor for RapportController();
  v0[16] = sub_25BA90BDC();
  type metadata accessor for SessionManager(0);
  v0[17] = sub_25BA97448();
  return v0;
}

uint64_t CompanionDeviceManager.Options.rawValue.getter()
{
  return *(void *)v0;
}

ScreenContinuityServices::CompanionDeviceManager::Options __swiftcall CompanionDeviceManager.Options.init(rawValue:)(ScreenContinuityServices::CompanionDeviceManager::Options rawValue)
{
  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

void static CompanionDeviceManager.Options.remoteScreen.getter(void *a1@<X8>)
{
  *a1 = 1;
}

void static CompanionDeviceManager.Options.sessionInfo.getter(void *a1@<X8>)
{
  *a1 = 4;
}

void *sub_25BA80A00@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_25BA80A0C(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_25BA80A14@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_25BA80A28@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_25BA80A3C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_25BA80A50(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_25BA80A80@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_25BA80AAC@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_25BA80AD0(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_25BA80AE4(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_25BA80AF8(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_25BA80B0C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_25BA80B20(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_25BA80B34(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_25BA80B48(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_25BA80B5C()
{
  return *v0 == 0;
}

uint64_t sub_25BA80B6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9E7D8](a1, a4, a2, a5, a3);
}

void *sub_25BA80B84(void *result)
{
  *v1 &= ~*result;
  return result;
}

void *sub_25BA80B98@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_25BA80BA8(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_25BA80BB4(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_25BA80BCC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = 0;
    uint64_t v5 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v7 = *v5++;
      uint64_t v6 = v7;
      if ((v7 & ~v4) == 0) {
        uint64_t v6 = 0;
      }
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

uint64_t sub_25BA80C24@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v70 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5333F8);
  uint64_t v66 = *(void *)(v3 - 8);
  uint64_t v67 = v3;
  MEMORY[0x270FA5388](v3);
  int v65 = (char *)&v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533400);
  uint64_t v69 = *(void *)(v72 - 8);
  uint64_t v71 = *(void *)(v69 + 64);
  uint64_t v5 = MEMORY[0x270FA5388](v72);
  v68 = (char *)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  int v75 = (char *)&v52 - v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533210);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v73 = (uint64_t)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533408);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  unint64_t v13 = (char *)&v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533410);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(void *)(v15 + 64);
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v52 - v18;
  uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533418);
  uint64_t v61 = *(void *)(v63 - 8);
  uint64_t v62 = *(void *)(v61 + 64);
  uint64_t v20 = MEMORY[0x270FA5388](v63);
  char v60 = (char *)&v52 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  uint64_t v76 = (char *)&v52 - v22;
  uint64_t v74 = *a1;
  unsigned int v56 = *MEMORY[0x263F8F680];
  (*(void (**)(char *))(v11 + 104))(v13);
  sub_25BAA51C0();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  uint64_t v54 = sub_25BAA5140();
  uint64_t v23 = *(void *)(v54 - 8);
  int v53 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v23 + 56);
  uint64_t v55 = v23 + 56;
  uint64_t v24 = v73;
  v53(v73, 1, 1, v54);
  uint64_t v25 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
  uint64_t v26 = (char *)&v52 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = v19;
  uint64_t v27 = v14;
  v25(v26, v19, v14);
  uint64_t v29 = sub_25BA88108(&qword_26A533428, v28, (void (*)(uint64_t))type metadata accessor for CompanionDeviceManager);
  uint64_t v30 = *(unsigned __int8 *)(v15 + 80);
  uint64_t v59 = v15;
  uint64_t v31 = (v30 + 40) & ~v30;
  unint64_t v32 = (v16 + v31 + 7) & 0xFFFFFFFFFFFFFFF8;
  long long v33 = (char *)swift_allocObject();
  uint64_t v34 = v64;
  *((void *)v33 + 2) = v64;
  *((void *)v33 + 3) = v29;
  *((void *)v33 + 4) = v34;
  uint64_t v35 = *(void (**)(char *, char *, uint64_t))(v15 + 32);
  uint64_t v58 = v27;
  v35(&v33[v31], v26, v27);
  *(void *)&v33[v32] = v74;
  swift_retain_n();
  uint64_t v64 = sub_25BA73934(v24, (uint64_t)&unk_26A533430, (uint64_t)v33);
  swift_retain();
  sub_25BAA51D0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A533438);
  uint64_t v36 = v65;
  uint64_t v37 = v66;
  uint64_t v38 = v67;
  (*(void (**)(char *, void, uint64_t))(v66 + 104))(v65, v56, v67);
  uint64_t v39 = v75;
  sub_25BAA51C0();
  (*(void (**)(char *, uint64_t))(v37 + 8))(v36, v38);
  v53(v24, 1, 1, v54);
  uint64_t v40 = v60;
  uint64_t v41 = v61;
  uint64_t v42 = v63;
  (*(void (**)(char *, char *, uint64_t))(v61 + 16))(v60, v76, v63);
  uint64_t v44 = v68;
  uint64_t v43 = v69;
  uint64_t v45 = v72;
  (*(void (**)(char *, char *, uint64_t))(v69 + 16))(v68, v39, v72);
  unint64_t v46 = (*(unsigned __int8 *)(v41 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80);
  unint64_t v47 = (v62 + v46 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v48 = (*(unsigned __int8 *)(v43 + 80) + v47 + 8) & ~(unint64_t)*(unsigned __int8 *)(v43 + 80);
  uint64_t v49 = swift_allocObject();
  *(void *)(v49 + 16) = 0;
  *(void *)(v49 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v41 + 32))(v49 + v46, v40, v42);
  *(void *)(v49 + v47) = v74;
  (*(void (**)(unint64_t, char *, uint64_t))(v43 + 32))(v49 + v48, v44, v45);
  sub_25BA73934(v73, (uint64_t)&unk_26A533448, v49);
  uint64_t v50 = v75;
  sub_25BAA51D0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v43 + 8))(v50, v45);
  (*(void (**)(char *, uint64_t))(v59 + 8))(v57, v58);
  return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v76, v42);
}

uint64_t sub_25BA813B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[4] = a5;
  v6[5] = a6;
  v6[2] = a1;
  v6[3] = a4;
  return MEMORY[0x270FA2498](sub_25BA813D8, a4, 0);
}

uint64_t sub_25BA813D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 40);
  uint64_t v4 = sub_25BA88108(&qword_26A533428, a2, (void (*)(uint64_t))type metadata accessor for CompanionDeviceManager);
  uint64_t v5 = swift_task_alloc();
  *(void *)(v2 + 48) = v5;
  long long v11 = *(_OWORD *)(v2 + 24);
  *(_OWORD *)(v5 + 16) = v11;
  *(void *)(v5 + 32) = v3;
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 56) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_25BA81508;
  uint64_t v7 = *(void *)(v2 + 16);
  uint64_t v8 = MEMORY[0x263F8EE60] + 8;
  uint64_t v9 = MEMORY[0x263F8EE60] + 8;
  return MEMORY[0x270FA2320](v7, v8, v11, v4, &unk_26A533518, v5, v9);
}

uint64_t sub_25BA81508()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t type metadata accessor for CompanionDeviceManager()
{
  return self;
}

uint64_t sub_25BA8163C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533410);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_25BA81720(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A533410) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = v1 + v5;
  uint64_t v8 = *(void *)(v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[4] = v7;
  v9[5] = v8;
  v9[2] = a1;
  v9[3] = v6;
  v9[1] = sub_25BA79E70;
  return MEMORY[0x270FA2498](sub_25BA813D8, v6, 0);
}

uint64_t sub_25BA81848(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[4] = a4;
  v5[5] = a5;
  v5[2] = a2;
  v5[3] = a3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533410);
  v5[6] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v5[7] = v8;
  v5[8] = *(void *)(v8 + 64);
  v5[9] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25BA8191C, a3, 0);
}

uint64_t sub_25BA8191C()
{
  uint64_t v1 = v0[9];
  uint64_t v2 = v0[6];
  uint64_t v3 = v0[7];
  uint64_t v4 = v0[5];
  uint64_t v5 = *(void *)(v0[3] + 112);
  uint64_t v19 = *(void (**)(uint64_t, void, uint64_t))(v3 + 16);
  v19(v1, v0[4], v2);
  unint64_t v6 = (*(unsigned __int8 *)(v3 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (char *)swift_allocObject();
  *((void *)v7 + 2) = 0;
  *((void *)v7 + 3) = 0;
  *((void *)v7 + 4) = v5;
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 32);
  v18(&v7[v6], v1, v2);
  swift_retain();
  sub_25BA82114((uint64_t)&unk_26A533528, (uint64_t)v7);
  if (v4)
  {
    uint64_t v8 = v0[9];
    uint64_t v9 = v0[6];
    uint64_t v10 = *(void *)(v0[3] + 120);
    v19(v8, v0[4], v9);
    uint64_t v11 = (char *)swift_allocObject();
    *((void *)v11 + 2) = 0;
    *((void *)v11 + 3) = 0;
    *((void *)v11 + 4) = v10;
    v18(&v11[v6], v8, v9);
    swift_retain();
    sub_25BA82114((uint64_t)&unk_26A533548, (uint64_t)v11);
  }
  if ((v0[5] & 4) != 0)
  {
    uint64_t v12 = v0[9];
    uint64_t v13 = v0[6];
    uint64_t v14 = *(void *)(v0[3] + 136);
    v19(v12, v0[4], v13);
    uint64_t v15 = (char *)swift_allocObject();
    *((void *)v15 + 2) = 0;
    *((void *)v15 + 3) = 0;
    *((void *)v15 + 4) = v14;
    v18(&v15[v6], v12, v13);
    swift_retain();
    sub_25BA82114((uint64_t)&unk_26A533538, (uint64_t)v15);
  }
  swift_task_dealloc();
  uint64_t v16 = (uint64_t (*)(void))v0[1];
  return v16();
}

uint64_t sub_25BA81B60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[5] = a3;
  v4[6] = a4;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533550);
  v4[7] = v6;
  v4[8] = *(void *)(v6 - 8);
  v4[9] = swift_task_alloc();
  v4[10] = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533588);
  v4[11] = swift_task_alloc();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533590);
  v4[12] = v7;
  v4[13] = *(void *)(v7 - 8);
  v4[14] = swift_task_alloc();
  unint64_t v8 = (*(void *)a3 + 88) & 0xFFFFFFFFFFFFLL | 0xB12C000000000000;
  v4[15] = *(void *)(*(void *)a3 + 88);
  v4[16] = v8;
  return MEMORY[0x270FA2498](sub_25BA81CD8, a3, 0);
}

uint64_t sub_25BA81CD8()
{
  (*(void (**)(void))(v0 + 120))();
  return MEMORY[0x270FA2498](sub_25BA81D48, 0, 0);
}

uint64_t sub_25BA81D48()
{
  sub_25BA76180(&qword_26A533598, &qword_26A533588);
  sub_25BAA51B0();
  sub_25BA76180(&qword_26A5335A0, &qword_26A533590);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 136) = v1;
  void *v1 = v0;
  v1[1] = sub_25BA81E6C;
  return MEMORY[0x270FA1E88](v0 + 32, 0, 0);
}

uint64_t sub_25BA81E6C()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_25BA81F68, 0, 0);
}

uint64_t sub_25BA81F68()
{
  uint64_t v1 = *(void *)(v0 + 32);
  if (v1)
  {
    uint64_t v3 = *(void *)(v0 + 64);
    uint64_t v2 = *(void *)(v0 + 72);
    uint64_t v4 = *(void *)(v0 + 56);
    *(void *)(v0 + 16) = v1;
    *(unsigned char *)(v0 + 24) = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A533410);
    sub_25BAA51F0();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
    sub_25BA76180(&qword_26A5335A0, &qword_26A533590);
    uint64_t v5 = (void *)swift_task_alloc();
    *(void *)(v0 + 136) = v5;
    void *v5 = v0;
    v5[1] = sub_25BA81E6C;
    return MEMORY[0x270FA1E88](v0 + 32, 0, 0);
  }
  else
  {
    (*(void (**)(void, void))(*(void *)(v0 + 104) + 8))(*(void *)(v0 + 112), *(void *)(v0 + 96));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
    return v6();
  }
}

uint64_t sub_25BA82114(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533210);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)v21 - v10;
  uint64_t v12 = sub_25BAA5140();
  uint64_t v13 = *(void *)(v12 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  sub_25BA88150((uint64_t)v11, (uint64_t)v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v9, 1, v12) == 1)
  {
    sub_25BA798DC((uint64_t)v9, &qword_26A533210);
    if (*(void *)(a2 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v14 = sub_25BAA50E0();
      uint64_t v16 = v15;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_25BAA5130();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v9, v12);
    if (*(void *)(a2 + 16)) {
      goto LABEL_3;
    }
  }
  uint64_t v14 = 0;
  uint64_t v16 = 0;
LABEL_6:
  uint64_t v17 = *v3;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = a1;
  *(void *)(v18 + 24) = a2;
  uint64_t v19 = (void *)(v16 | v14);
  if (v16 | v14)
  {
    v22[0] = 0;
    v22[1] = 0;
    uint64_t v19 = v22;
    v22[2] = v14;
    v22[3] = v16;
  }
  v21[1] = 1;
  v21[2] = v19;
  v21[3] = v17;
  swift_task_create();
  return swift_release();
}

uint64_t sub_25BA82354(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[7] = a3;
  v4[8] = a4;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533550);
  v4[9] = v6;
  v4[10] = *(void *)(v6 - 8);
  v4[11] = swift_task_alloc();
  v4[12] = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533558);
  v4[13] = swift_task_alloc();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533560);
  v4[14] = v7;
  v4[15] = *(void *)(v7 - 8);
  v4[16] = swift_task_alloc();
  uint64_t v8 = (*(void *)a3 + 128) & 0xFFFFFFFFFFFFLL | 0xC1F000000000000;
  v4[17] = *(void *)(*(void *)a3 + 128);
  v4[18] = v8;
  type metadata accessor for SharingController();
  sub_25BA88108(&qword_26A533238, 255, (void (*)(uint64_t))type metadata accessor for SharingController);
  uint64_t v10 = sub_25BAA50E0();
  return MEMORY[0x270FA2498](sub_25BA82524, v10, v9);
}

uint64_t sub_25BA82524()
{
  (*(void (**)(void))(v0 + 136))();
  return MEMORY[0x270FA2498](sub_25BA82594, 0, 0);
}

uint64_t sub_25BA82594()
{
  *(void *)(v0 + 152) = swift_getOpaqueTypeConformance2();
  sub_25BAA51B0();
  swift_getAssociatedConformanceWitness();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 160) = v1;
  void *v1 = v0;
  v1[1] = sub_25BA826BC;
  return MEMORY[0x270FA1E88](v0 + 32, 0, 0);
}

uint64_t sub_25BA826BC()
{
  swift_task_dealloc();
  if (v0) {
    uint64_t v1 = sub_25BA82988;
  }
  else {
    uint64_t v1 = sub_25BA827CC;
  }
  return MEMORY[0x270FA2498](v1, 0, 0);
}

uint64_t sub_25BA827CC()
{
  uint64_t v1 = *(void *)(v0 + 32);
  if (v1)
  {
    uint64_t v3 = *(void *)(v0 + 80);
    uint64_t v2 = *(void *)(v0 + 88);
    uint64_t v4 = *(void *)(v0 + 72);
    *(void *)(v0 + 16) = v1;
    *(unsigned char *)(v0 + 24) = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A533410);
    sub_25BAA51F0();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
    swift_getAssociatedConformanceWitness();
    uint64_t v5 = (void *)swift_task_alloc();
    *(void *)(v0 + 160) = v5;
    void *v5 = v0;
    v5[1] = sub_25BA826BC;
    return MEMORY[0x270FA1E88](v0 + 32, 0, 0);
  }
  else
  {
    (*(void (**)(void, void))(*(void *)(v0 + 120) + 8))(*(void *)(v0 + 128), *(void *)(v0 + 112));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
    return v6();
  }
}

uint64_t sub_25BA82988()
{
  (*(void (**)(void, void))(v0[15] + 8))(v0[16], v0[14]);
  v0[6] = v0[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A533410);
  sub_25BAA5200();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_25BA82A40(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  v4[7] = a3;
  v4[8] = a4;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533550);
  v4[9] = v6;
  v4[10] = *(void *)(v6 - 8);
  v4[11] = swift_task_alloc();
  v4[12] = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533568);
  v4[13] = swift_task_alloc();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533570);
  v4[14] = v7;
  v4[15] = *(void *)(v7 - 8);
  v4[16] = swift_task_alloc();
  uint64_t v8 = *a3;
  v4[17] = *(void *)(*a3 + 400);
  v4[18] = (v8 + 400) & 0xFFFFFFFFFFFFLL | 0xAEB9000000000000;
  type metadata accessor for SessionManager(0);
  sub_25BA88108((unint64_t *)&unk_26A533478, 255, (void (*)(uint64_t))type metadata accessor for SessionManager);
  uint64_t v10 = sub_25BAA50E0();
  return MEMORY[0x270FA2498](sub_25BA82C28, v10, v9);
}

uint64_t sub_25BA82C28()
{
  (*(void (**)(void))(v0 + 136))();
  return MEMORY[0x270FA2498](sub_25BA82C98, 0, 0);
}

uint64_t sub_25BA82C98()
{
  *(void *)(v0 + 152) = swift_getOpaqueTypeConformance2();
  sub_25BAA51B0();
  swift_getAssociatedConformanceWitness();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 160) = v1;
  void *v1 = v0;
  v1[1] = sub_25BA82DC0;
  return MEMORY[0x270FA1E88](v0 + 32, 0, 0);
}

uint64_t sub_25BA82DC0()
{
  swift_task_dealloc();
  if (v0) {
    uint64_t v1 = sub_25BA88754;
  }
  else {
    uint64_t v1 = sub_25BA82ED0;
  }
  return MEMORY[0x270FA2498](v1, 0, 0);
}

uint64_t sub_25BA82ED0()
{
  uint64_t v1 = *(void *)(v0 + 32);
  if (v1)
  {
    uint64_t v3 = *(void *)(v0 + 80);
    uint64_t v2 = *(void *)(v0 + 88);
    uint64_t v4 = *(void *)(v0 + 72);
    *(void *)(v0 + 16) = v1;
    *(unsigned char *)(v0 + 24) = 3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A533410);
    sub_25BAA51F0();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
    swift_getAssociatedConformanceWitness();
    uint64_t v5 = (void *)swift_task_alloc();
    *(void *)(v0 + 160) = v5;
    void *v5 = v0;
    v5[1] = sub_25BA82DC0;
    return MEMORY[0x270FA1E88](v0 + 32, 0, 0);
  }
  else
  {
    (*(void (**)(void, void))(*(void *)(v0 + 120) + 8))(*(void *)(v0 + 128), *(void *)(v0 + 112));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
    return v6();
  }
}

uint64_t sub_25BA8308C()
{
  return sub_25BAA51A0();
}

uint64_t sub_25BA830B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[14] = a5;
  v6[15] = a6;
  v6[13] = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A533358);
  v6[16] = swift_task_alloc();
  uint64_t v7 = sub_25BAA4DA0();
  v6[17] = v7;
  v6[18] = *(void *)(v7 - 8);
  v6[19] = swift_task_alloc();
  v6[20] = swift_task_alloc();
  v6[21] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for CompanionDevice(0);
  v6[22] = v8;
  v6[23] = *(void *)(v8 - 8);
  v6[24] = swift_task_alloc();
  v6[25] = swift_task_alloc();
  v6[26] = swift_task_alloc();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5334F0);
  v6[27] = v9;
  v6[28] = *(void *)(v9 - 8);
  v6[29] = swift_task_alloc();
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5334F8);
  v6[30] = v10;
  v6[31] = *(void *)(v10 - 8);
  v6[32] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25BA832F8, 0, 0);
}

uint64_t sub_25BA832F8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A533418);
  sub_25BAA5180();
  *(_OWORD *)(v0 + 264) = 0u;
  *(_OWORD *)(v0 + 280) = 0u;
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 296) = v1;
  void *v1 = v0;
  v1[1] = sub_25BA833DC;
  uint64_t v2 = *(void *)(v0 + 240);
  return MEMORY[0x270FA20F8](v0 + 56, 0, 0, v2, v0 + 72);
}

uint64_t sub_25BA833DC()
{
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    uint64_t v1 = sub_25BA83DC8;
  }
  else
  {
    uint64_t v1 = sub_25BA834F4;
  }
  return MEMORY[0x270FA2498](v1, 0, 0);
}

uint64_t sub_25BA834F4()
{
  uint64_t v1 = v0 + 56;
  uint64_t v2 = *(void *)(v0 + 56);
  switch(*(unsigned char *)(v0 + 64))
  {
    case 0:
      swift_bridgeObjectRelease();
      uint64_t v4 = *(void *)(v0 + 280);
      uint64_t v3 = *(void *)(v0 + 288);
      uint64_t v5 = *(void *)(v0 + 272);
      swift_bridgeObjectRetain();
      uint64_t v6 = v2;
      uint64_t v2 = v3;
      uint64_t v7 = *(void *)(v0 + 112);
      if ((v7 & 1) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    case 1:
      uint64_t v5 = *(void *)(v0 + 272);
      uint64_t v4 = *(void *)(v0 + 280);
      goto LABEL_10;
    case 2:
      uint64_t v4 = *(void *)(v0 + 56);
      uint64_t v2 = *(void *)(v0 + 288);
      uint64_t v5 = *(void *)(v0 + 272);
      goto LABEL_10;
    case 3:
      uint64_t v5 = *(void *)(v0 + 56);
      uint64_t v4 = *(void *)(v0 + 280);
      uint64_t v2 = *(void *)(v0 + 288);
LABEL_10:
      uint64_t v10 = *(void *)(v0 + 264);
      swift_bridgeObjectRelease();
      if (!v10)
      {
        uint64_t v6 = 0;
        goto LABEL_61;
      }
      uint64_t v6 = *(void *)(v0 + 264);
      swift_bridgeObjectRetain();
      uint64_t v7 = *(void *)(v0 + 112);
      if ((v7 & 1) == 0) {
        goto LABEL_13;
      }
LABEL_12:
      if (!v4) {
        goto LABEL_15;
      }
LABEL_13:
      if ((v7 & 4) != 0 && !v5)
      {
LABEL_15:
        swift_bridgeObjectRelease();
LABEL_61:
        *(void *)(v0 + 280) = v4;
        *(void *)(v0 + 288) = v2;
        *(void *)(v0 + 264) = v6;
        *(void *)(v0 + 272) = v5;
        uint64_t v83 = (void *)swift_task_alloc();
        *(void *)(v0 + 296) = v83;
        *uint64_t v83 = v0;
        v83[1] = sub_25BA833DC;
        uint64_t v84 = *(void *)(v0 + 240);
        return MEMORY[0x270FA20F8](v1, 0, 0, v84, v0 + 72);
      }
      uint64_t v11 = *(void *)(v6 + 16);
      uint64_t v88 = v5;
      uint64_t v89 = v4;
      uint64_t v85 = v6;
      if (!v11)
      {
        uint64_t v70 = MEMORY[0x263F8EE80];
LABEL_51:
        swift_bridgeObjectRelease();
        uint64_t v71 = *(void *)(v70 + 16);
        if (v71)
        {
          uint64_t v72 = v70;
          uint64_t v73 = *(void *)(v0 + 184);
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A533500);
          uint64_t v74 = *(void *)(v73 + 72);
          unint64_t v75 = (*(unsigned __int8 *)(v73 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v73 + 80);
          uint64_t v76 = (void *)swift_allocObject();
          size_t v77 = _swift_stdlib_malloc_size(v76);
          if (!v74)
          {
LABEL_69:
            __break(1u);
            goto LABEL_70;
          }
          if (v77 - v75 == 0x8000000000000000 && v74 == -1)
          {
LABEL_71:
            __break(1u);
            JUMPOUT(0x25BA83DB8);
          }
          v76[2] = v71;
          v76[3] = 2 * ((uint64_t)(v77 - v75) / v74);
          uint64_t v79 = sub_25BA87908((void *)(v1 - 40), (uint64_t)v76 + v75, v71, v72);
          swift_bridgeObjectRetain();
          sub_25BA7692C();
          if (v79 != v71)
          {
LABEL_70:
            __break(1u);
            goto LABEL_71;
          }
          swift_bridgeObjectRelease();
        }
        else
        {
          swift_bridgeObjectRelease();
          uint64_t v76 = (void *)MEMORY[0x263F8EE78];
        }
        uint64_t v81 = *(void *)(v0 + 224);
        uint64_t v80 = *(void *)(v0 + 232);
        uint64_t v82 = *(void *)(v0 + 216);
        *(void *)(v0 + 96) = v76;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A533400);
        sub_25BAA51F0();
        (*(void (**)(uint64_t, uint64_t))(v81 + 8))(v80, v82);
        uint64_t v5 = v88;
        uint64_t v4 = v89;
        uint64_t v6 = v85;
        goto LABEL_61;
      }
      uint64_t v87 = v2;
      uint64_t v12 = *(void *)(v0 + 184);
      uint64_t v13 = v6 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
      uint64_t v14 = *(void *)(v12 + 72);
      swift_bridgeObjectRetain();
      uint64_t v91 = MEMORY[0x263F8EE80];
      uint64_t v86 = v14;
      break;
    default:
      (*(void (**)(void, void))(*(void *)(v0 + 248) + 8))(*(void *)(v0 + 256), *(void *)(v0 + 240));
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
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
      uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
      return v8();
  }
  while (1)
  {
    uint64_t v90 = v11;
    uint64_t v23 = *(void *)(v0 + 200);
    uint64_t v24 = *(void *)(v0 + 208);
    uint64_t v26 = *(void *)(v0 + 168);
    uint64_t v25 = *(void *)(v0 + 176);
    uint64_t v28 = *(void *)(v0 + 136);
    uint64_t v27 = *(void *)(v0 + 144);
    sub_25BA87C4C(v13, v24, type metadata accessor for CompanionDevice);
    uint64_t v29 = *(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 16);
    uint64_t v30 = v24 + *(int *)(v25 + 20);
    v29(v26, v30, v28);
    sub_25BA87C4C(v24, v23, type metadata accessor for CompanionDevice);
    if (v87)
    {
      if (*(void *)(v87 + 16))
      {
        unint64_t v31 = sub_25BA77164(*(void *)(v0 + 168));
        if (v32) {
          *(unsigned char *)(*(void *)(v0 + 200) + *(int *)(*(void *)(v0 + 176) + 60)) = *(unsigned char *)(*(void *)(v87 + 56)
        }
                                                                                                + v31);
      }
    }
    if (v89)
    {
      if (*(void *)(v89 + 16))
      {
        unint64_t v33 = sub_25BA77164(*(void *)(v0 + 168));
        if (v34)
        {
          uint64_t v35 = *(void *)(v0 + 200);
          uint64_t v36 = *(int *)(*(void *)(v0 + 176) + 56);
          if (*(unsigned char *)(*(void *)(v89 + 56) + v33))
          {
            char v37 = 2;
            goto LABEL_31;
          }
          *(unsigned char *)(v35 + v36) = 0;
          if (!v88) {
            goto LABEL_39;
          }
LABEL_32:
          CompanionDevice.id.getter(*(void *)(v0 + 160));
          if (*(void *)(v88 + 16))
          {
            unint64_t v38 = sub_25BA77164(*(void *)(v0 + 160));
            uint64_t v39 = *(void *)(v0 + 128);
            if (v40)
            {
              unint64_t v41 = v38;
              uint64_t v42 = *(void *)(v88 + 56);
              uint64_t v43 = type metadata accessor for CompanionDevice.SessionInfo(0);
              uint64_t v44 = *(void *)(v43 - 8);
              sub_25BA87C4C(v42 + *(void *)(v44 + 72) * v41, v39, type metadata accessor for CompanionDevice.SessionInfo);
              (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v44 + 56))(v39, 0, 1, v43);
LABEL_37:
              (*(void (**)(void, void))(*(void *)(v0 + 144) + 8))(*(void *)(v0 + 160), *(void *)(v0 + 136));
              goto LABEL_40;
            }
          }
          else
          {
            uint64_t v39 = *(void *)(v0 + 128);
          }
          uint64_t v45 = type metadata accessor for CompanionDevice.SessionInfo(0);
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v45 - 8) + 56))(v39, 1, 1, v45);
          goto LABEL_37;
        }
      }
    }
    uint64_t v35 = *(void *)(v0 + 200);
    uint64_t v36 = *(int *)(*(void *)(v0 + 176) + 56);
    char v37 = 3;
LABEL_31:
    *(unsigned char *)(v35 + v36) = v37;
    if (v88) {
      goto LABEL_32;
    }
LABEL_39:
    uint64_t v46 = *(void *)(v0 + 128);
    uint64_t v47 = type metadata accessor for CompanionDevice.SessionInfo(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v47 - 8) + 56))(v46, 1, 1, v47);
LABEL_40:
    uint64_t v48 = *(void *)(v0 + 192);
    uint64_t v49 = *(void *)(v0 + 200);
    uint64_t v50 = *(void *)(v0 + 152);
    uint64_t v51 = *(void *)(v0 + 136);
    sub_25BA870B4(*(void *)(v0 + 128), v49 + *(int *)(*(void *)(v0 + 176) + 64));
    v29(v50, v30, v51);
    sub_25BA87C4C(v49, v48, type metadata accessor for CompanionDevice);
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v0 + 88) = v91;
    unint64_t v54 = sub_25BA77164(v50);
    uint64_t v55 = *(void *)(v91 + 16);
    BOOL v56 = (v53 & 1) == 0;
    uint64_t v57 = v55 + v56;
    if (__OFADD__(v55, v56))
    {
      __break(1u);
LABEL_68:
      __break(1u);
      goto LABEL_69;
    }
    char v58 = v53;
    if (*(void *)(v91 + 24) >= v57)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
        sub_25BA875E0();
      }
      goto LABEL_46;
    }
    uint64_t v59 = *(void *)(v0 + 152);
    sub_25BA8711C(v57, isUniquelyReferenced_nonNull_native);
    unint64_t v60 = sub_25BA77164(v59);
    if ((v58 & 1) != (v61 & 1)) {
      break;
    }
    unint64_t v54 = v60;
LABEL_46:
    uint64_t v62 = *(void **)(v0 + 88);
    uint64_t v63 = *(void *)(v0 + 192);
    if (v58)
    {
      uint64_t v15 = v13;
      uint64_t v91 = *(void *)(v0 + 88);
      sub_25BA87BE8(v63, v62[7] + v54 * v86);
    }
    else
    {
      uint64_t v65 = *(void *)(v0 + 144);
      uint64_t v64 = *(void *)(v0 + 152);
      uint64_t v66 = *(void *)(v0 + 136);
      v62[(v54 >> 6) + 8] |= 1 << v54;
      v29(v62[6] + *(void *)(v65 + 72) * v54, v64, v66);
      sub_25BA86F84(v63, v62[7] + v54 * v86);
      uint64_t v67 = v62[2];
      BOOL v68 = __OFADD__(v67, 1);
      uint64_t v69 = v67 + 1;
      if (v68) {
        goto LABEL_68;
      }
      uint64_t v15 = v13;
      v62[2] = v69;
      uint64_t v91 = *(void *)(v0 + 88);
    }
    uint64_t v17 = *(void *)(v0 + 200);
    uint64_t v16 = *(void *)(v0 + 208);
    uint64_t v18 = *(void *)(v0 + 168);
    uint64_t v19 = *(void *)(v0 + 144);
    uint64_t v20 = *(void *)(v0 + 152);
    uint64_t v21 = *(void *)(v0 + 136);
    swift_bridgeObjectRelease();
    uint64_t v22 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
    v22(v20, v21);
    v22(v18, v21);
    sub_25BA884A0(v17, type metadata accessor for CompanionDevice);
    sub_25BA884A0(v16, type metadata accessor for CompanionDevice);
    uint64_t v13 = v15 + v86;
    uint64_t v11 = v90 - 1;
    if (v90 == 1)
    {
      swift_bridgeObjectRelease();
      uint64_t v1 = v0 + 56;
      uint64_t v2 = v87;
      uint64_t v70 = v91;
      goto LABEL_51;
    }
  }
  return sub_25BAA55A0();
}

uint64_t sub_25BA83DC8()
{
  (*(void (**)(void, void))(v0[31] + 8))(v0[32], v0[30]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v0[10] = v0[9];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A533400);
  sub_25BAA5200();
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

uint64_t sub_25BA83EF8()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533418);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  unint64_t v5 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533400);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v5 + v8 + 8) & ~v8;
  uint64_t v10 = v9 + *(void *)(v7 + 64);
  uint64_t v11 = v3 | v8 | 7;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);
  return MEMORY[0x270FA0238](v0, v10, v11);
}

uint64_t sub_25BA84064()
{
  uint64_t v2 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A533418) - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v4 = (*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v5 = *(unsigned __int8 *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A533400) - 8) + 80);
  uint64_t v6 = v4 + v5 + 8;
  uint64_t v7 = v0 + v3;
  uint64_t v8 = *(void *)(v0 + v4);
  uint64_t v9 = v0 + (v6 & ~v5);
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v10;
  *uint64_t v10 = v1;
  v10[1] = sub_25BA78A7C;
  return sub_25BA830B0((uint64_t)v10, v11, v12, v7, v8, v9);
}

uint64_t sub_25BA841B4(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](sub_25BA841D4, v1, 0);
}

uint64_t sub_25BA841D4()
{
  unint64_t v4 = (uint64_t (*)(uint64_t))(*(void *)(**(void **)(v0[3] + 112) + 96)
                                       + **(int **)(**(void **)(v0[3] + 112) + 96));
  uint64_t v1 = (void *)swift_task_alloc();
  v0[4] = v1;
  void *v1 = v0;
  v1[1] = sub_25BA842D8;
  uint64_t v2 = v0[2];
  return v4(v2);
}

uint64_t sub_25BA842D8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_25BA843CC(uint64_t a1)
{
  v2[2] = v1;
  uint64_t v4 = sub_25BAA4DA0();
  v2[3] = v4;
  v2[4] = *(void *)(v4 - 8);
  uint64_t v5 = swift_task_alloc();
  v2[5] = v5;
  uint64_t v6 = (void *)swift_task_alloc();
  v2[6] = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_25BA844D4;
  return sub_25BA8498C(v5, a1);
}

uint64_t sub_25BA844D4()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 16);
  *(void *)(*(void *)v1 + 56) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v3 = sub_25BA848AC;
  }
  else {
    uint64_t v3 = sub_25BA845FC;
  }
  return MEMORY[0x270FA2498](v3, v2, 0);
}

uint64_t sub_25BA845FC()
{
  uint64_t v4 = (uint64_t (*)(uint64_t))(*(void *)(**(void **)(v0[2] + 120) + 136)
                                       + **(int **)(**(void **)(v0[2] + 120) + 136));
  uint64_t v1 = (void *)swift_task_alloc();
  v0[8] = v1;
  void *v1 = v0;
  v1[1] = sub_25BA84700;
  uint64_t v2 = v0[5];
  return v4(v2);
}

uint64_t sub_25BA84700()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 72) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 16);
  if (v0) {
    uint64_t v4 = sub_25BA84910;
  }
  else {
    uint64_t v4 = sub_25BA8482C;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_25BA8482C()
{
  (*(void (**)(void, void))(v0[4] + 8))(v0[5], v0[3]);
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_25BA848AC()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25BA84910()
{
  (*(void (**)(void, void))(v0[4] + 8))(v0[5], v0[3]);
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_25BA8498C(uint64_t a1, uint64_t a2)
{
  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5334D8);
  v3[6] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for CompanionDevice(0);
  v3[7] = v4;
  v3[8] = *(void *)(v4 - 8);
  v3[9] = swift_task_alloc();
  v3[10] = swift_task_alloc();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5334E0);
  v3[11] = v5;
  v3[12] = *(void *)(v5 - 8);
  v3[13] = swift_task_alloc();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5334D0);
  v3[14] = v6;
  v3[15] = *(void *)(v6 - 8);
  v3[16] = swift_task_alloc();
  v3[17] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25BA84B60, v2, 0);
}

uint64_t sub_25BA84B60()
{
  uint64_t v4 = v0;
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v3 = 0;
  (*(void (**)(uint64_t *))(*(void *)v1 + 128))(&v3);
  return MEMORY[0x270FA2498](sub_25BA84BF4, 0, 0);
}

uint64_t sub_25BA84BF4()
{
  (*(void (**)(void, void, void))(v0[15] + 16))(v0[16], v0[17], v0[14]);
  sub_25BA76180(&qword_26A5334C8, &qword_26A5334D0);
  sub_25BAA51B0();
  uint64_t v1 = sub_25BA76180(&qword_26A5334E8, &qword_26A5334E0);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[18] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_25BA84D30;
  uint64_t v3 = v0[11];
  return MEMORY[0x270FA1E80](v0 + 2, v3, v1);
}

uint64_t sub_25BA84D30()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 152) = v0;
  swift_task_dealloc();
  if (v0)
  {
    (*(void (**)(void, void))(v2[12] + 8))(v2[13], v2[11]);
    uint64_t v3 = sub_25BA85054;
  }
  else
  {
    uint64_t v3 = sub_25BA84E5C;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_25BA84E5C()
{
  uint64_t v1 = v0[2];
  v0[20] = v1;
  uint64_t v2 = v0[17];
  uint64_t v3 = v0[14];
  uint64_t v4 = v0[15];
  uint64_t v5 = v0[5];
  (*(void (**)(void, void))(v0[12] + 8))(v0[13], v0[11]);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  if (v1) {
    uint64_t v6 = sub_25BA85178;
  }
  else {
    uint64_t v6 = sub_25BA84F24;
  }
  return MEMORY[0x270FA2498](v6, v5, 0);
}

uint64_t sub_25BA84F24()
{
  uint64_t v1 = *(void *)(v0 + 32);
  type metadata accessor for CompanionDeviceManager.CompanionDeviceError();
  sub_25BA86F2C();
  swift_allocError();
  uint64_t v3 = v2;
  uint64_t v4 = sub_25BAA4DA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(v3, v1, v4);
  swift_storeEnumTagMultiPayload();
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_25BA85054()
{
  uint64_t v1 = v0[5];
  (*(void (**)(void, void))(v0[15] + 8))(v0[17], v0[14]);
  return MEMORY[0x270FA2498](sub_25BA850D0, v1, 0);
}

uint64_t sub_25BA850D0()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25BA85178()
{
  uint64_t v1 = v0[20];
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v3 = v0[8];
    uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    uint64_t v5 = *(void *)(v3 + 72);
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_25BA87C4C(v4, v0[9], type metadata accessor for CompanionDevice);
      if (sub_25BAA4D70()) {
        break;
      }
      sub_25BA884A0(v0[9], type metadata accessor for CompanionDevice);
      v4 += v5;
      if (!--v2)
      {
        swift_bridgeObjectRelease();
        goto LABEL_6;
      }
    }
    uint64_t v7 = v0[9];
    uint64_t v8 = v0[6];
    swift_bridgeObjectRelease();
    sub_25BA86F84(v7, v8);
    uint64_t v6 = 0;
  }
  else
  {
LABEL_6:
    uint64_t v6 = 1;
  }
  uint64_t v9 = v0[7];
  uint64_t v10 = v0[8];
  uint64_t v11 = v0[6];
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56))(v11, v6, 1, v9);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v11, 1, v9) == 1)
  {
    sub_25BA798DC(v0[6], &qword_26A5334D8);
    uint64_t v12 = v0[4];
    type metadata accessor for CompanionDeviceManager.CompanionDeviceError();
    sub_25BA86F2C();
    swift_allocError();
    uint64_t v14 = v13;
    uint64_t v15 = sub_25BAA4DA0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(v14, v12, v15);
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
  }
  else
  {
    uint64_t v17 = v0[10];
    uint64_t v18 = v0[7];
    uint64_t v19 = v0[3];
    sub_25BA86F84(v0[6], v17);
    uint64_t v20 = v17 + *(int *)(v18 + 20);
    uint64_t v21 = sub_25BAA4DA0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 16))(v19, v20, v21);
    sub_25BA884A0(v17, type metadata accessor for CompanionDevice);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v16 = (uint64_t (*)(void))v0[1];
  return v16();
}

uint64_t sub_25BA85490(uint64_t a1, uint64_t a2)
{
  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5334D8);
  v3[6] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for CompanionDevice(0);
  v3[7] = v4;
  v3[8] = *(void *)(v4 - 8);
  v3[9] = swift_task_alloc();
  v3[10] = swift_task_alloc();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5334E0);
  v3[11] = v5;
  v3[12] = *(void *)(v5 - 8);
  v3[13] = swift_task_alloc();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5334D0);
  v3[14] = v6;
  v3[15] = *(void *)(v6 - 8);
  v3[16] = swift_task_alloc();
  v3[17] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25BA85664, v2, 0);
}

uint64_t sub_25BA85664()
{
  uint64_t v4 = v0;
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v3 = 0;
  (*(void (**)(uint64_t *))(*(void *)v1 + 128))(&v3);
  return MEMORY[0x270FA2498](sub_25BA856F8, 0, 0);
}

uint64_t sub_25BA856F8()
{
  (*(void (**)(void, void, void))(v0[15] + 16))(v0[16], v0[17], v0[14]);
  sub_25BA76180(&qword_26A5334C8, &qword_26A5334D0);
  sub_25BAA51B0();
  uint64_t v1 = sub_25BA76180(&qword_26A5334E8, &qword_26A5334E0);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[18] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_25BA85834;
  uint64_t v3 = v0[11];
  return MEMORY[0x270FA1E80](v0 + 2, v3, v1);
}

uint64_t sub_25BA85834()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 152) = v0;
  swift_task_dealloc();
  if (v0)
  {
    (*(void (**)(void, void))(v2[12] + 8))(v2[13], v2[11]);
    uint64_t v3 = sub_25BA85B58;
  }
  else
  {
    uint64_t v3 = sub_25BA85960;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_25BA85960()
{
  uint64_t v1 = v0[2];
  v0[20] = v1;
  uint64_t v2 = v0[17];
  uint64_t v3 = v0[14];
  uint64_t v4 = v0[15];
  uint64_t v5 = v0[5];
  (*(void (**)(void, void))(v0[12] + 8))(v0[13], v0[11]);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  if (v1) {
    uint64_t v6 = sub_25BA85BD4;
  }
  else {
    uint64_t v6 = sub_25BA85A28;
  }
  return MEMORY[0x270FA2498](v6, v5, 0);
}

uint64_t sub_25BA85A28()
{
  uint64_t v1 = *(void *)(v0 + 32);
  type metadata accessor for CompanionDeviceManager.CompanionDeviceError();
  sub_25BA86F2C();
  swift_allocError();
  uint64_t v3 = v2;
  uint64_t v4 = sub_25BAA4DA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(v3, v1, v4);
  swift_storeEnumTagMultiPayload();
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_25BA85B58()
{
  uint64_t v1 = v0[5];
  (*(void (**)(void, void))(v0[15] + 8))(v0[17], v0[14]);
  return MEMORY[0x270FA2498](sub_25BA8874C, v1, 0);
}

uint64_t sub_25BA85BD4()
{
  uint64_t v1 = v0[20];
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v3 = v0[8];
    uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    uint64_t v5 = *(void *)(v3 + 72);
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_25BA87C4C(v4, v0[9], type metadata accessor for CompanionDevice);
      if (sub_25BAA4D70()) {
        break;
      }
      sub_25BA884A0(v0[9], type metadata accessor for CompanionDevice);
      v4 += v5;
      if (!--v2)
      {
        swift_bridgeObjectRelease();
        goto LABEL_6;
      }
    }
    uint64_t v7 = v0[9];
    uint64_t v8 = v0[6];
    swift_bridgeObjectRelease();
    sub_25BA86F84(v7, v8);
    uint64_t v6 = 0;
  }
  else
  {
LABEL_6:
    uint64_t v6 = 1;
  }
  uint64_t v9 = v0[7];
  uint64_t v10 = v0[8];
  uint64_t v11 = v0[6];
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56))(v11, v6, 1, v9);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v11, 1, v9) == 1)
  {
    sub_25BA798DC(v0[6], &qword_26A5334D8);
    uint64_t v12 = v0[4];
    type metadata accessor for CompanionDeviceManager.CompanionDeviceError();
    sub_25BA86F2C();
    swift_allocError();
    uint64_t v14 = v13;
    uint64_t v15 = sub_25BAA4DA0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(v14, v12, v15);
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
  }
  else
  {
    uint64_t v17 = v0[10];
    uint64_t v18 = v0[3];
    sub_25BA86F84(v0[6], v17);
    uint64_t v19 = sub_25BAA4DA0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16))(v18, v17, v19);
    sub_25BA884A0(v17, type metadata accessor for CompanionDevice);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v16 = (uint64_t (*)(void))v0[1];
  return v16();
}

uint64_t sub_25BA85EE0(uint64_t a1)
{
  v2[2] = v1;
  uint64_t v4 = sub_25BAA4DA0();
  v2[3] = v4;
  v2[4] = *(void *)(v4 - 8);
  uint64_t v5 = swift_task_alloc();
  v2[5] = v5;
  uint64_t v6 = (void *)swift_task_alloc();
  v2[6] = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_25BA85FE8;
  return sub_25BA85490(v5, a1);
}

uint64_t sub_25BA85FE8()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 16);
  *(void *)(*(void *)v1 + 56) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v3 = sub_25BA8873C;
  }
  else {
    uint64_t v3 = sub_25BA86110;
  }
  return MEMORY[0x270FA2498](v3, v2, 0);
}

uint64_t sub_25BA86110()
{
  uint64_t v1 = *(void **)(v0[2] + 136);
  v0[8] = v1;
  uint64_t v2 = *v1 + 480;
  v0[9] = *(void *)v2;
  v0[10] = v2 & 0xFFFFFFFFFFFFLL | 0x3CAE000000000000;
  type metadata accessor for SessionManager(0);
  sub_25BA88108((unint64_t *)&unk_26A533478, 255, (void (*)(uint64_t))type metadata accessor for SessionManager);
  uint64_t v4 = sub_25BAA50E0();
  return MEMORY[0x270FA2498](sub_25BA861F8, v4, v3);
}

uint64_t sub_25BA861F8()
{
  uint64_t v1 = *(void *)(v0 + 56);
  (*(void (**)(void))(v0 + 72))(*(void *)(v0 + 40));
  *(void *)(v0 + 88) = v1;
  uint64_t v2 = *(void *)(v0 + 16);
  if (v1) {
    uint64_t v3 = sub_25BA88750;
  }
  else {
    uint64_t v3 = sub_25BA88758;
  }
  return MEMORY[0x270FA2498](v3, v2, 0);
}

uint64_t sub_25BA86288(uint64_t a1)
{
  v2[2] = v1;
  uint64_t v4 = sub_25BAA4DA0();
  v2[3] = v4;
  v2[4] = *(void *)(v4 - 8);
  uint64_t v5 = swift_task_alloc();
  v2[5] = v5;
  uint64_t v6 = (void *)swift_task_alloc();
  v2[6] = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_25BA86390;
  return sub_25BA85490(v5, a1);
}

uint64_t sub_25BA86390()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 16);
  *(void *)(*(void *)v1 + 56) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v3 = sub_25BA8873C;
  }
  else {
    uint64_t v3 = sub_25BA864B8;
  }
  return MEMORY[0x270FA2498](v3, v2, 0);
}

uint64_t sub_25BA864B8()
{
  uint64_t v1 = *(void **)(v0[2] + 136);
  v0[8] = v1;
  uint64_t v2 = *v1 + 488;
  v0[9] = *(void *)v2;
  v0[10] = v2 & 0xFFFFFFFFFFFFLL | 0xDEA8000000000000;
  type metadata accessor for SessionManager(0);
  sub_25BA88108((unint64_t *)&unk_26A533478, 255, (void (*)(uint64_t))type metadata accessor for SessionManager);
  uint64_t v4 = sub_25BAA50E0();
  return MEMORY[0x270FA2498](sub_25BA865A0, v4, v3);
}

uint64_t sub_25BA865A0()
{
  uint64_t v1 = *(void *)(v0 + 56);
  (*(void (**)(void))(v0 + 72))(*(void *)(v0 + 40));
  *(void *)(v0 + 88) = v1;
  uint64_t v2 = *(void *)(v0 + 16);
  if (v1) {
    uint64_t v3 = sub_25BA86630;
  }
  else {
    uint64_t v3 = sub_25BA88758;
  }
  return MEMORY[0x270FA2498](v3, v2, 0);
}

uint64_t sub_25BA86630()
{
  (*(void (**)(void, void))(v0[4] + 8))(v0[5], v0[3]);
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t CompanionDeviceManager.deinit()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t CompanionDeviceManager.__deallocating_deinit()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_defaultActor_destroy();
  return MEMORY[0x270FA2418](v0);
}

uint64_t CompanionDeviceManager.unownedExecutor.getter()
{
  return v0;
}

unint64_t sub_25BA8674C()
{
  unint64_t result = qword_26A533488;
  if (!qword_26A533488)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A533488);
  }
  return result;
}

unint64_t sub_25BA867A4()
{
  unint64_t result = qword_26A533490;
  if (!qword_26A533490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A533490);
  }
  return result;
}

unint64_t sub_25BA867FC()
{
  unint64_t result = qword_26A533498;
  if (!qword_26A533498)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A533498);
  }
  return result;
}

unint64_t sub_25BA86854()
{
  unint64_t result = qword_26A5334A0;
  if (!qword_26A5334A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5334A0);
  }
  return result;
}

uint64_t sub_25BA868A8()
{
  return v0;
}

uint64_t method lookup function for CompanionDeviceManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CompanionDeviceManager);
}

uint64_t dispatch thunk of CompanionDeviceManager.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of CompanionDeviceManager.devices(with:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of CompanionDeviceManager.pairDevice(with:)(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 136) + **(int **)(*(void *)v1 + 136));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_25BA78A7C;
  return v6(a1);
}

uint64_t dispatch thunk of CompanionDeviceManager.unpairDevice(with:)(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 144) + **(int **)(*(void *)v1 + 144));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_25BA79E70;
  return v6(a1);
}

uint64_t dispatch thunk of CompanionDeviceManager.startSession(for:)(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 168) + **(int **)(*(void *)v1 + 168));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_25BA79E70;
  return v6(a1);
}

uint64_t dispatch thunk of CompanionDeviceManager.endSession(for:)(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 176) + **(int **)(*(void *)v1 + 176));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_25BA79E70;
  return v6(a1);
}

ValueMetadata *type metadata accessor for CompanionDeviceManager.Options()
{
  return &type metadata for CompanionDeviceManager.Options;
}

uint64_t sub_25BA86D24()
{
  return sub_25BA76180(&qword_26A5334C8, &qword_26A5334D0);
}

uint64_t initializeBufferWithCopyOfBuffer for CompanionDeviceManager.Change(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for CompanionDeviceManager.Change()
{
  return swift_bridgeObjectRelease();
}

uint64_t assignWithCopy for CompanionDeviceManager.Change(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)unint64_t result = v2;
  return result;
}

uint64_t assignWithTake for CompanionDeviceManager.Change(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CompanionDeviceManager.Change(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 3) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CompanionDeviceManager.Change(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_25BA86EC0(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_25BA86EC8(uint64_t result, char a2)
{
  *(unsigned char *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for CompanionDeviceManager.Change()
{
  return &type metadata for CompanionDeviceManager.Change;
}

uint64_t type metadata accessor for CompanionDeviceManager.CompanionDeviceError()
{
  uint64_t result = qword_26A5348B8;
  if (!qword_26A5348B8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_25BA86F2C()
{
  unint64_t result = qword_26A5348B0;
  if (!qword_26A5348B0)
  {
    type metadata accessor for CompanionDeviceManager.CompanionDeviceError();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5348B0);
  }
  return result;
}

uint64_t sub_25BA86F84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CompanionDevice(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25BA86FE8(int *a1)
{
  uint64_t v4 = (uint64_t (*)(void))((char *)a1 + *a1);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_25BA76834;
  return v4();
}

uint64_t sub_25BA870B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533358);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_25BA8711C(uint64_t a1, int a2)
{
  unsigned int v3 = v2;
  uint64_t v5 = type metadata accessor for CompanionDevice(0);
  uint64_t v48 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v53 = (uint64_t)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25BAA4DA0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v50 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A533508);
  int v49 = a2;
  uint64_t v11 = v10;
  uint64_t v12 = sub_25BAA5470();
  uint64_t v13 = v12;
  if (*(void *)(v11 + 16))
  {
    uint64_t v43 = v2;
    uint64_t v14 = 1 << *(unsigned char *)(v11 + 32);
    uint64_t v15 = *(void *)(v11 + 64);
    uint64_t v45 = (void *)(v11 + 64);
    if (v14 < 64) {
      uint64_t v16 = ~(-1 << v14);
    }
    else {
      uint64_t v16 = -1;
    }
    unint64_t v17 = v16 & v15;
    int64_t v44 = (unint64_t)(v14 + 63) >> 6;
    uint64_t v46 = (void (**)(char *, unint64_t, uint64_t))(v8 + 16);
    uint64_t v51 = (void (**)(char *, unint64_t, uint64_t))(v8 + 32);
    uint64_t v52 = v7;
    uint64_t v18 = v12 + 64;
    uint64_t result = swift_retain();
    int64_t v20 = 0;
    uint64_t v47 = v11;
    uint64_t v21 = v50;
    while (1)
    {
      if (v17)
      {
        unint64_t v23 = __clz(__rbit64(v17));
        v17 &= v17 - 1;
        unint64_t v24 = v23 | (v20 << 6);
      }
      else
      {
        if (__OFADD__(v20++, 1)) {
          goto LABEL_39;
        }
        if (v20 >= v44)
        {
LABEL_32:
          swift_release();
          unsigned int v3 = v43;
          if (v49)
          {
            uint64_t v41 = 1 << *(unsigned char *)(v11 + 32);
            if (v41 >= 64) {
              bzero(v45, ((unint64_t)(v41 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
            }
            else {
              *uint64_t v45 = -1 << v41;
            }
            *(void *)(v11 + 16) = 0;
          }
          break;
        }
        unint64_t v26 = v45[v20];
        if (!v26)
        {
          int64_t v27 = v20 + 1;
          if (v20 + 1 >= v44) {
            goto LABEL_32;
          }
          unint64_t v26 = v45[v27];
          if (!v26)
          {
            while (1)
            {
              int64_t v20 = v27 + 1;
              if (__OFADD__(v27, 1)) {
                break;
              }
              if (v20 >= v44) {
                goto LABEL_32;
              }
              unint64_t v26 = v45[v20];
              ++v27;
              if (v26) {
                goto LABEL_19;
              }
            }
LABEL_38:
            __break(1u);
LABEL_39:
            __break(1u);
            return result;
          }
          ++v20;
        }
LABEL_19:
        unint64_t v17 = (v26 - 1) & v26;
        unint64_t v24 = __clz(__rbit64(v26)) + (v20 << 6);
      }
      uint64_t v28 = v8;
      uint64_t v29 = *(void *)(v8 + 72);
      unint64_t v30 = *(void *)(v11 + 48) + v29 * v24;
      if (v49)
      {
        (*v51)(v21, v30, v52);
        uint64_t v31 = *(void *)(v11 + 56);
        uint64_t v32 = *(void *)(v48 + 72);
        sub_25BA86F84(v31 + v32 * v24, v53);
      }
      else
      {
        (*v46)(v21, v30, v52);
        uint64_t v33 = *(void *)(v11 + 56);
        uint64_t v32 = *(void *)(v48 + 72);
        sub_25BA87C4C(v33 + v32 * v24, v53, type metadata accessor for CompanionDevice);
      }
      sub_25BA88108(&qword_26A5332E0, 255, MEMORY[0x263F07508]);
      uint64_t result = sub_25BAA5020();
      uint64_t v34 = -1 << *(unsigned char *)(v13 + 32);
      unint64_t v35 = result & ~v34;
      unint64_t v36 = v35 >> 6;
      if (((-1 << v35) & ~*(void *)(v18 + 8 * (v35 >> 6))) != 0)
      {
        unint64_t v22 = __clz(__rbit64((-1 << v35) & ~*(void *)(v18 + 8 * (v35 >> 6)))) | v35 & 0x7FFFFFFFFFFFFFC0;
        uint64_t v21 = v50;
      }
      else
      {
        char v37 = 0;
        unint64_t v38 = (unint64_t)(63 - v34) >> 6;
        uint64_t v21 = v50;
        do
        {
          if (++v36 == v38 && (v37 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v39 = v36 == v38;
          if (v36 == v38) {
            unint64_t v36 = 0;
          }
          v37 |= v39;
          uint64_t v40 = *(void *)(v18 + 8 * v36);
        }
        while (v40 == -1);
        unint64_t v22 = __clz(__rbit64(~v40)) + (v36 << 6);
      }
      *(void *)(v18 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
      (*v51)((char *)(*(void *)(v13 + 48) + v29 * v22), (unint64_t)v21, v52);
      uint64_t result = sub_25BA86F84(v53, *(void *)(v13 + 56) + v32 * v22);
      ++*(void *)(v13 + 16);
      uint64_t v11 = v47;
      uint64_t v8 = v28;
    }
  }
  uint64_t result = swift_release();
  *unsigned int v3 = v13;
  return result;
}

void *sub_25BA875E0()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for CompanionDevice(0);
  uint64_t v32 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v31 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_25BAA4DA0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A533508);
  uint64_t v8 = *v0;
  uint64_t v9 = sub_25BAA5460();
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_23:
    uint64_t *v1 = v10;
    return result;
  }
  unint64_t v26 = v1;
  uint64_t result = (void *)(v9 + 64);
  unint64_t v12 = (unint64_t)((1 << *(unsigned char *)(v10 + 32)) + 63) >> 6;
  if (v10 != v8 || (unint64_t)result >= v8 + 64 + 8 * v12) {
    uint64_t result = memmove(result, (const void *)(v8 + 64), 8 * v12);
  }
  int64_t v13 = 0;
  *(void *)(v10 + 16) = *(void *)(v8 + 16);
  uint64_t v14 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v15 = -1;
  if (v14 < 64) {
    uint64_t v15 = ~(-1 << v14);
  }
  unint64_t v16 = v15 & *(void *)(v8 + 64);
  uint64_t v27 = v8 + 64;
  int64_t v28 = (unint64_t)(v14 + 63) >> 6;
  uint64_t v29 = v5 + 32;
  uint64_t v30 = v5 + 16;
  for (i = (uint64_t)v31; ; uint64_t result = (void *)sub_25BA86F84(i, *(void *)(v10 + 56) + v21))
  {
    if (v16)
    {
      unint64_t v18 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v19 = v18 | (v13 << 6);
      goto LABEL_9;
    }
    if (__OFADD__(v13++, 1)) {
      goto LABEL_25;
    }
    if (v13 >= v28)
    {
LABEL_21:
      uint64_t result = (void *)swift_release();
      uint64_t v1 = v26;
      goto LABEL_23;
    }
    unint64_t v23 = *(void *)(v27 + 8 * v13);
    if (!v23) {
      break;
    }
LABEL_20:
    unint64_t v16 = (v23 - 1) & v23;
    unint64_t v19 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_9:
    unint64_t v20 = *(void *)(v5 + 72) * v19;
    (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v7, *(void *)(v8 + 48) + v20, v4);
    unint64_t v21 = *(void *)(v32 + 72) * v19;
    sub_25BA87C4C(*(void *)(v8 + 56) + v21, i, type metadata accessor for CompanionDevice);
    (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(*(void *)(v10 + 48) + v20, v7, v4);
  }
  int64_t v24 = v13 + 1;
  if (v13 + 1 >= v28) {
    goto LABEL_21;
  }
  unint64_t v23 = *(void *)(v27 + 8 * v24);
  if (v23)
  {
    ++v13;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v13 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v13 >= v28) {
      goto LABEL_21;
    }
    unint64_t v23 = *(void *)(v27 + 8 * v13);
    ++v24;
    if (v23) {
      goto LABEL_20;
    }
  }
  __break(1u);
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_25BA87908(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for CompanionDevice(0);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8 - 8);
  unint64_t v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v10);
  uint64_t v15 = (char *)&v30 - v14;
  uint64_t v35 = a4;
  uint64_t v18 = *(void *)(a4 + 64);
  uint64_t v17 = a4 + 64;
  uint64_t v16 = v18;
  uint64_t v19 = -1 << *(unsigned char *)(v17 - 32);
  if (-v19 < 64) {
    uint64_t v20 = ~(-1 << -(char)v19);
  }
  else {
    uint64_t v20 = -1;
  }
  unint64_t v21 = v20 & v16;
  if (!a2)
  {
    int64_t v22 = 0;
    a3 = 0;
LABEL_38:
    *a1 = v35;
    a1[1] = v17;
    a1[2] = ~v19;
    a1[3] = v22;
    a1[4] = v21;
    return a3;
  }
  if (!a3)
  {
    int64_t v22 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v32 = -1 << *(unsigned char *)(v17 - 32);
  uint64_t v33 = a1;
  int64_t v22 = 0;
  uint64_t v23 = 0;
  int64_t v34 = (unint64_t)(63 - v19) >> 6;
  int64_t v31 = v34 - 1;
  if (!v21) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v24 = __clz(__rbit64(v21));
  v21 &= v21 - 1;
  unint64_t v25 = v24 | (v22 << 6);
  while (1)
  {
    ++v23;
    uint64_t v29 = *(void *)(v9 + 72);
    sub_25BA87C4C(*(void *)(v35 + 56) + v29 * v25, (uint64_t)v12, type metadata accessor for CompanionDevice);
    sub_25BA86F84((uint64_t)v12, (uint64_t)v15);
    uint64_t result = sub_25BA86F84((uint64_t)v15, a2);
    if (v23 == a3) {
      goto LABEL_37;
    }
    a2 += v29;
    if (v21) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v26 = v22 + 1;
    if (__OFADD__(v22, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v26 >= v34) {
      goto LABEL_32;
    }
    unint64_t v27 = *(void *)(v17 + 8 * v26);
    if (!v27) {
      break;
    }
LABEL_18:
    unint64_t v21 = (v27 - 1) & v27;
    unint64_t v25 = __clz(__rbit64(v27)) + (v26 << 6);
    int64_t v22 = v26;
  }
  v22 += 2;
  if (v26 + 1 >= v34)
  {
    unint64_t v21 = 0;
    int64_t v22 = v26;
    goto LABEL_36;
  }
  unint64_t v27 = *(void *)(v17 + 8 * v22);
  if (v27) {
    goto LABEL_14;
  }
  int64_t v28 = v26 + 2;
  if (v26 + 2 >= v34) {
    goto LABEL_32;
  }
  unint64_t v27 = *(void *)(v17 + 8 * v28);
  if (v27) {
    goto LABEL_17;
  }
  int64_t v22 = v26 + 3;
  if (v26 + 3 >= v34)
  {
    unint64_t v21 = 0;
    int64_t v22 = v26 + 2;
    goto LABEL_36;
  }
  unint64_t v27 = *(void *)(v17 + 8 * v22);
  if (v27)
  {
LABEL_14:
    int64_t v26 = v22;
    goto LABEL_18;
  }
  int64_t v28 = v26 + 4;
  if (v26 + 4 >= v34)
  {
LABEL_32:
    unint64_t v21 = 0;
LABEL_36:
    a3 = v23;
LABEL_37:
    uint64_t v19 = v32;
    a1 = v33;
    goto LABEL_38;
  }
  unint64_t v27 = *(void *)(v17 + 8 * v28);
  if (v27)
  {
LABEL_17:
    int64_t v26 = v28;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v26 = v28 + 1;
    if (__OFADD__(v28, 1)) {
      break;
    }
    if (v26 >= v34)
    {
      unint64_t v21 = 0;
      int64_t v22 = v31;
      goto LABEL_36;
    }
    unint64_t v27 = *(void *)(v17 + 8 * v26);
    ++v28;
    if (v27) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_25BA87BE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CompanionDevice(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_25BA87C4C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25BA87CB4()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25BA87CEC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = v2[2];
  uint64_t v6 = v2[3];
  uint64_t v7 = v2[4];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v8;
  *uint64_t v8 = v3;
  v8[1] = sub_25BA79E70;
  return sub_25BA81848((uint64_t)v8, a2, v5, v6, v7);
}

uint64_t sub_25BA87DA0()
{
  uint64_t v2 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A533410) - 8);
  uint64_t v3 = *(void *)(v0 + 32);
  uint64_t v4 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_25BA79E70;
  return sub_25BA81B60((uint64_t)v5, v6, v3, v4);
}

uint64_t sub_25BA87E7C()
{
  uint64_t v2 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A533410) - 8);
  uint64_t v3 = *(uint64_t **)(v0 + 32);
  uint64_t v4 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_25BA79E70;
  return sub_25BA82A40((uint64_t)v5, v6, v3, v4);
}

uint64_t objectdestroy_36Tm()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533410);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_25BA88030()
{
  uint64_t v2 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A533410) - 8);
  uint64_t v3 = *(void *)(v0 + 32);
  uint64_t v4 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_25BA79E70;
  return sub_25BA82354((uint64_t)v5, v6, v3, v4);
}

uint64_t sub_25BA88108(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_25BA88150(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533210);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25BA881B8()
{
  uint64_t v2 = *(int **)(v0 + 16);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_25BA79E70;
  uint64_t v4 = (uint64_t (*)(int *))((char *)&dword_26A533578 + dword_26A533578);
  return v4(v2);
}

uint64_t *sub_25BA88264(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    swift_getEnumCaseMultiPayload();
    uint64_t v6 = sub_25BAA4DA0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_25BA88354(uint64_t a1, uint64_t a2)
{
  swift_getEnumCaseMultiPayload();
  uint64_t v4 = sub_25BAA4DA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_25BA883E8(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_25BA884A0(a1, (uint64_t (*)(void))type metadata accessor for CompanionDeviceManager.CompanionDeviceError);
    swift_getEnumCaseMultiPayload();
    uint64_t v4 = sub_25BAA4DA0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_25BA884A0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25BA88500(uint64_t a1, uint64_t a2)
{
  swift_getEnumCaseMultiPayload();
  uint64_t v4 = sub_25BAA4DA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_25BA88594(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_25BA884A0(a1, (uint64_t (*)(void))type metadata accessor for CompanionDeviceManager.CompanionDeviceError);
    swift_getEnumCaseMultiPayload();
    uint64_t v4 = sub_25BAA4DA0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_25BA8864C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_25BA88674(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_25BA886A0()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_25BA886B0()
{
  uint64_t result = sub_25BAA4DA0();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_25BA8875C()
{
  return 1;
}

uint64_t sub_25BA88764()
{
  return sub_25BAA5630();
}

uint64_t sub_25BA887A8()
{
  return sub_25BAA5600();
}

uint64_t sub_25BA887D0()
{
  return sub_25BAA5630();
}

uint64_t sub_25BA88810@<X0>(uint64_t a1@<X8>)
{
  uint64_t v63 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5335A8);
  uint64_t v58 = *(void *)(v1 - 8);
  uint64_t v59 = v1;
  MEMORY[0x270FA5388](v1);
  uint64_t v57 = (char *)v47 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5335B0);
  uint64_t v61 = *(void *)(v64 - 8);
  uint64_t v62 = *(void *)(v61 + 64);
  uint64_t v3 = MEMORY[0x270FA5388](v64);
  unint64_t v60 = (char *)v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  BOOL v56 = (char *)v47 - v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533210);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v71 = (uint64_t)v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5335B8);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5335C0);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)v47 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)v47 - v17;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5335C8);
  uint64_t v53 = *(void *)(v19 - 8);
  uint64_t v54 = v19;
  uint64_t v55 = *(void *)(v53 + 64);
  uint64_t v20 = MEMORY[0x270FA5388](v19);
  uint64_t v52 = (char *)v47 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  uint64_t v70 = (char *)v47 - v22;
  sub_25BAA4E00();
  swift_allocObject();
  uint64_t v72 = sub_25BAA4DF0();
  unsigned int v50 = *MEMORY[0x263F8F580];
  (*(void (**)(char *))(v9 + 104))(v11);
  uint64_t v66 = v18;
  sub_25BAA5150();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v68 = sub_25BAA5140();
  uint64_t v23 = *(void *)(v68 - 8);
  uint64_t v67 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v23 + 56);
  uint64_t v69 = v23 + 56;
  uint64_t v24 = v71;
  v67(v71, 1, 1, v68);
  uint64_t v48 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
  v48(v16, v18, v12);
  uint64_t v25 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v51 = v13;
  uint64_t v26 = (v25 + 40) & ~v25;
  v47[1] = v26 + v14;
  unint64_t v27 = (char *)swift_allocObject();
  *((void *)v27 + 2) = 0;
  *((void *)v27 + 3) = 0;
  *((void *)v27 + 4) = v72;
  int64_t v28 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
  v28(&v27[v26], v16, v12);
  swift_retain();
  uint64_t v65 = sub_25BA73934(v24, (uint64_t)&unk_26A5335D8, (uint64_t)v27);
  v67(v24, 1, 1, v68);
  v48(v16, v66, v12);
  uint64_t v29 = (char *)swift_allocObject();
  *((void *)v29 + 2) = 0;
  *((void *)v29 + 3) = 0;
  *((void *)v29 + 4) = v72;
  uint64_t v49 = v12;
  v28(&v29[v26], v16, v12);
  swift_retain();
  uint64_t v30 = v71;
  uint64_t v31 = sub_25BA73934(v71, (uint64_t)&unk_26A5335E8, (uint64_t)v29);
  uint64_t v48 = (void (*)(char *, char *, uint64_t))v31;
  uint64_t v32 = swift_allocObject();
  *(void *)(v32 + 16) = v65;
  *(void *)(v32 + 24) = v31;
  swift_retain();
  swift_retain();
  sub_25BAA5160();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A533438);
  int64_t v34 = v57;
  uint64_t v33 = v58;
  uint64_t v35 = v59;
  (*(void (**)(char *, void, uint64_t))(v58 + 104))(v57, v50, v59);
  unint64_t v36 = v56;
  sub_25BAA5150();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v34, v35);
  v67(v30, 1, 1, v68);
  char v37 = v52;
  uint64_t v38 = v53;
  uint64_t v39 = v54;
  (*(void (**)(char *, char *, uint64_t))(v53 + 16))(v52, v70, v54);
  uint64_t v41 = v60;
  uint64_t v40 = v61;
  uint64_t v42 = v64;
  (*(void (**)(char *, char *, uint64_t))(v61 + 16))(v60, v36, v64);
  unint64_t v43 = (*(unsigned __int8 *)(v38 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80);
  unint64_t v44 = (v55 + *(unsigned __int8 *)(v40 + 80) + v43) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80);
  uint64_t v45 = swift_allocObject();
  *(void *)(v45 + 16) = 0;
  *(void *)(v45 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v38 + 32))(v45 + v43, v37, v39);
  (*(void (**)(unint64_t, char *, uint64_t))(v40 + 32))(v45 + v44, v41, v42);
  sub_25BA73934(v71, (uint64_t)&unk_26A5335F8, v45);
  sub_25BAA5160();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v36, v42);
  (*(void (**)(char *, uint64_t))(v51 + 8))(v66, v49);
  return (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v70, v39);
}

uint64_t sub_25BA89044(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[4] = a4;
  v5[5] = a5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5336B0);
  v5[6] = v6;
  v5[7] = *(void *)(v6 - 8);
  v5[8] = swift_task_alloc();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5336C8);
  v5[9] = v7;
  v5[10] = *(void *)(v7 - 8);
  v5[11] = swift_task_alloc();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5336D0);
  v5[12] = v8;
  v5[13] = *(void *)(v8 - 8);
  v5[14] = swift_task_alloc();
  uint64_t v9 = sub_25BAA4F70();
  v5[15] = v9;
  v5[16] = *(void *)(v9 - 8);
  v5[17] = swift_task_alloc();
  v5[18] = swift_task_alloc();
  v5[19] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25BA89240, 0, 0);
}

uint64_t sub_25BA89240()
{
  uint64_t v1 = v0[19];
  uint64_t v2 = v0[15];
  uint64_t v3 = v0[16];
  uint64_t v4 = sub_25BA909E0();
  v0[20] = v4;
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v0[21] = v5;
  v0[22] = (v3 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v5(v1, v4, v2);
  uint64_t v6 = sub_25BAA4F50();
  os_log_type_t v7 = sub_25BAA5260();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_25BA70000, v6, v7, "Will wait for enabled state updates", v8, 2u);
    MEMORY[0x26116FA80](v8, -1, -1);
  }
  uint64_t v9 = v0[19];
  uint64_t v10 = v0[15];
  uint64_t v11 = v0[16];
  uint64_t v12 = v0[10];
  uint64_t v13 = v0[11];
  uint64_t v14 = v0[9];

  uint64_t v15 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
  v0[23] = v15;
  v0[24] = (v11 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v15(v9, v10);
  sub_25BAA4DC0();
  sub_25BAA5180();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v13, v14);
  uint64_t v16 = (void *)swift_task_alloc();
  v0[25] = v16;
  void *v16 = v0;
  v16[1] = sub_25BA89420;
  uint64_t v17 = v0[12];
  return MEMORY[0x270FA1F68]((char *)v0 + 25, 0, 0, v17);
}

uint64_t sub_25BA89420()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_25BA8951C, 0, 0);
}

uint64_t sub_25BA8951C()
{
  int v1 = *(unsigned __int8 *)(v0 + 25);
  if (v1 == 2)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 104) + 8))(*(void *)(v0 + 112), *(void *)(v0 + 96));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
    return v2();
  }
  uint64_t v4 = *(void (**)(void, uint64_t, uint64_t))(v0 + 168);
  uint64_t v5 = *(void *)(v0 + 160);
  uint64_t v6 = *(void *)(v0 + 120);
  uint64_t v20 = v1 & 1;
  if ((v1 & 1) == 0)
  {
    os_log_type_t v7 = (uint64_t *)(v0 + 136);
    v4(*(void *)(v0 + 136), v5, v6);
    uint64_t v8 = sub_25BAA4F50();
    os_log_type_t v9 = sub_25BAA5260();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      uint64_t v11 = "Replicator is disabled";
      goto LABEL_10;
    }
LABEL_11:
    uint64_t v12 = *v7;
    goto LABEL_12;
  }
  os_log_type_t v7 = (uint64_t *)(v0 + 144);
  v4(*(void *)(v0 + 144), v5, v6);
  uint64_t v8 = sub_25BAA4F50();
  os_log_type_t v9 = sub_25BAA5260();
  if (!os_log_type_enabled(v8, v9)) {
    goto LABEL_11;
  }
  uint64_t v10 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)uint64_t v10 = 0;
  uint64_t v11 = "Replicator is enabled";
LABEL_10:
  _os_log_impl(&dword_25BA70000, v8, v9, v11, v10, 2u);
  uint64_t v12 = *v7;
  MEMORY[0x26116FA80](v10, -1, -1);
LABEL_12:
  uint64_t v13 = *(void (**)(uint64_t, uint64_t))(v0 + 184);
  uint64_t v14 = *(void *)(v0 + 120);
  uint64_t v16 = *(void *)(v0 + 56);
  uint64_t v15 = *(void *)(v0 + 64);
  uint64_t v17 = *(void *)(v0 + 48);

  v13(v12, v14);
  *(void *)(v0 + 16) = v20;
  *(unsigned char *)(v0 + 24) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5335C0);
  sub_25BAA5170();
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
  uint64_t v18 = (void *)swift_task_alloc();
  *(void *)(v0 + 200) = v18;
  *uint64_t v18 = v0;
  v18[1] = sub_25BA89420;
  uint64_t v19 = *(void *)(v0 + 96);
  return MEMORY[0x270FA1F68](v0 + 25, 0, 0, v19);
}

uint64_t sub_25BA897E4()
{
  uint64_t v2 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A5335C0) - 8);
  uint64_t v3 = *(void *)(v0 + 32);
  uint64_t v4 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_25BA79E70;
  return sub_25BA89044((uint64_t)v5, v6, v7, v3, v4);
}

uint64_t sub_25BA898BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a4;
  v5[6] = a5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5336B0);
  v5[7] = v6;
  v5[8] = *(void *)(v6 - 8);
  v5[9] = swift_task_alloc();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5336B8);
  v5[10] = v7;
  v5[11] = *(void *)(v7 - 8);
  v5[12] = swift_task_alloc();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5336C0);
  v5[13] = v8;
  v5[14] = *(void *)(v8 - 8);
  v5[15] = swift_task_alloc();
  uint64_t v9 = sub_25BAA4F70();
  v5[16] = v9;
  v5[17] = *(void *)(v9 - 8);
  v5[18] = swift_task_alloc();
  v5[19] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25BA89AAC, 0, 0);
}

uint64_t sub_25BA89AAC()
{
  uint64_t v1 = v0[19];
  uint64_t v2 = v0[16];
  uint64_t v3 = v0[17];
  uint64_t v4 = sub_25BA909E0();
  v0[20] = v4;
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v0[21] = v5;
  v0[22] = (v3 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v5(v1, v4, v2);
  uint64_t v6 = sub_25BAA4F50();
  os_log_type_t v7 = sub_25BAA5260();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_25BA70000, v6, v7, "Will wait for device updates", v8, 2u);
    MEMORY[0x26116FA80](v8, -1, -1);
  }
  uint64_t v9 = v0[19];
  uint64_t v10 = v0[16];
  uint64_t v11 = v0[17];
  uint64_t v12 = v0[11];
  uint64_t v13 = v0[12];
  uint64_t v14 = v0[10];

  uint64_t v15 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
  v0[23] = v15;
  v0[24] = (v11 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v15(v9, v10);
  sub_25BAA4DB0();
  sub_25BAA5180();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v13, v14);
  uint64_t v16 = (void *)swift_task_alloc();
  v0[25] = v16;
  void *v16 = v0;
  v16[1] = sub_25BA89C8C;
  uint64_t v17 = v0[13];
  return MEMORY[0x270FA1F68](v0 + 4, 0, 0, v17);
}

uint64_t sub_25BA89C8C()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_25BA89D88, 0, 0);
}

uint64_t sub_25BA89D88()
{
  uint64_t v25 = v0;
  uint64_t v1 = *(void *)(v0 + 32);
  if (v1)
  {
    (*(void (**)(void, void, void))(v0 + 168))(*(void *)(v0 + 144), *(void *)(v0 + 160), *(void *)(v0 + 128));
    swift_bridgeObjectRetain_n();
    uint64_t v2 = sub_25BAA4F50();
    os_log_type_t v3 = sub_25BAA5260();
    BOOL v4 = os_log_type_enabled(v2, v3);
    uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v0 + 184);
    uint64_t v6 = *(void *)(v0 + 144);
    uint64_t v7 = *(void *)(v0 + 128);
    if (v4)
    {
      uint64_t v23 = *(void (**)(uint64_t, uint64_t))(v0 + 184);
      uint64_t v8 = swift_slowAlloc();
      uint64_t v22 = v6;
      uint64_t v9 = swift_slowAlloc();
      uint64_t v24 = v9;
      *(_DWORD *)uint64_t v8 = 136446210;
      uint64_t v10 = sub_25BAA4F10();
      uint64_t v11 = swift_bridgeObjectRetain();
      uint64_t v12 = MEMORY[0x26116EFA0](v11, v10);
      unint64_t v14 = v13;
      swift_bridgeObjectRelease();
      *(void *)(v8 + 4) = sub_25BA76934(v12, v14, &v24);
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25BA70000, v2, v3, "Got devices: %{public}s", (uint8_t *)v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x26116FA80](v9, -1, -1);
      MEMORY[0x26116FA80](v8, -1, -1);

      v23(v22, v7);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      v5(v6, v7);
    }
    uint64_t v18 = *(void *)(v0 + 64);
    uint64_t v17 = *(void *)(v0 + 72);
    uint64_t v19 = *(void *)(v0 + 56);
    *(void *)(v0 + 16) = v1;
    *(unsigned char *)(v0 + 24) = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5335C0);
    sub_25BAA5170();
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
    uint64_t v20 = (void *)swift_task_alloc();
    *(void *)(v0 + 200) = v20;
    void *v20 = v0;
    v20[1] = sub_25BA89C8C;
    uint64_t v21 = *(void *)(v0 + 104);
    return MEMORY[0x270FA1F68](v0 + 32, 0, 0, v21);
  }
  else
  {
    (*(void (**)(void, void))(*(void *)(v0 + 112) + 8))(*(void *)(v0 + 120), *(void *)(v0 + 104));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v15 = *(uint64_t (**)(void))(v0 + 8);
    return v15();
  }
}

uint64_t objectdestroyTm_0()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5335C0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_25BA8A180()
{
  uint64_t v2 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A5335C0) - 8);
  uint64_t v3 = *(void *)(v0 + 32);
  uint64_t v4 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_25BA79E70;
  return sub_25BA898BC((uint64_t)v5, v6, v7, v3, v4);
}

uint64_t sub_25BA8A258()
{
  uint64_t v0 = sub_25BAA4F70();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_25BA909E0();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  uint64_t v5 = sub_25BAA4F50();
  os_log_type_t v6 = sub_25BAA5260();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_25BA70000, v5, v6, "Change accumulator terminated", v7, 2u);
    MEMORY[0x26116FA80](v7, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_25BAA51A0();
  return sub_25BAA51A0();
}

uint64_t sub_25BA8A3FC()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25BA8A43C()
{
  return sub_25BA8A258();
}

uint64_t sub_25BA8A444(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[9] = a4;
  v5[10] = a5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533690);
  v5[11] = v6;
  v5[12] = *(void *)(v6 - 8);
  v5[13] = swift_task_alloc();
  uint64_t v7 = sub_25BAA4F10();
  v5[14] = v7;
  v5[15] = *(void *)(v7 - 8);
  v5[16] = swift_task_alloc();
  v5[17] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for CompanionDevice(0);
  v5[18] = v8;
  v5[19] = *(void *)(v8 - 8);
  v5[20] = swift_task_alloc();
  v5[21] = swift_task_alloc();
  v5[22] = swift_task_alloc();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533698);
  v5[23] = v9;
  v5[24] = *(void *)(v9 - 8);
  v5[25] = swift_task_alloc();
  uint64_t v10 = sub_25BAA4F70();
  v5[26] = v10;
  v5[27] = *(void *)(v10 - 8);
  v5[28] = swift_task_alloc();
  v5[29] = swift_task_alloc();
  v5[30] = swift_task_alloc();
  v5[31] = swift_task_alloc();
  v5[32] = swift_task_alloc();
  v5[33] = swift_task_alloc();
  v5[34] = swift_task_alloc();
  v5[35] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25BA8A700, 0, 0);
}

uint64_t sub_25BA8A700()
{
  uint64_t v1 = *(void *)(v0 + 280);
  uint64_t v2 = *(void *)(v0 + 208);
  uint64_t v3 = *(void *)(v0 + 216);
  uint64_t v4 = sub_25BA909E0();
  *(void *)(v0 + 288) = v4;
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  *(void *)(v0 + 296) = v5;
  *(void *)(v0 + 304) = (v3 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v5(v1, v4, v2);
  uint64_t v6 = sub_25BAA4F50();
  os_log_type_t v7 = sub_25BAA5260();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_25BA70000, v6, v7, "Will wait for changes", v8, 2u);
    MEMORY[0x26116FA80](v8, -1, -1);
  }
  uint64_t v9 = *(void *)(v0 + 280);
  uint64_t v10 = *(void *)(v0 + 208);
  uint64_t v11 = *(void *)(v0 + 216);

  uint64_t v12 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
  *(void *)(v0 + 312) = v12;
  *(void *)(v0 + 320) = (v11 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v12(v9, v10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5335C8);
  sub_25BAA5180();
  *(unsigned char *)(v0 + 25) = 2;
  *(void *)(v0 + 328) = 0;
  unint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v0 + 336) = v13;
  void *v13 = v0;
  v13[1] = sub_25BA8A8BC;
  uint64_t v14 = *(void *)(v0 + 184);
  return MEMORY[0x270FA1F68](v0 + 16, 0, 0, v14);
}

uint64_t sub_25BA8A8BC()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_25BA8A9B8, 0, 0);
}

uint64_t sub_25BA8A9B8()
{
  v113 = v0;
  uint64_t v2 = v0 + 2;
  uint64_t v1 = v0[2];
  LODWORD(v3) = *((unsigned __int8 *)v0 + 24);
  if (v3 != 255)
  {
    ((void (*)(void, void, void))v0[37])(v0[34], v0[36], v0[26]);
    char v4 = v3 & 1;
    sub_25BA8FCB8(v1, v3 & 1);
    sub_25BA8FCB8(v1, v3 & 1);
    uint64_t v5 = sub_25BAA4F50();
    os_log_type_t v6 = sub_25BAA5260();
    BOOL v7 = os_log_type_enabled(v5, v6);
    uint64_t v8 = (void (*)(uint64_t, uint64_t))v0[39];
    uint64_t v9 = v0[34];
    uint64_t v110 = v0[26];
    if (v7)
    {
      uint64_t v104 = v0[34];
      uint64_t v10 = swift_slowAlloc();
      v101 = v8;
      unsigned __int8 v11 = v3;
      uint64_t v3 = swift_slowAlloc();
      uint64_t v112 = v3;
      *(_DWORD *)uint64_t v10 = 136446210;
      v0[4] = v1;
      *((unsigned char *)v0 + 40) = v4;
      sub_25BA8FCB8(v1, v4);
      uint64_t v12 = sub_25BAA5090();
      *(void *)(v10 + 4) = sub_25BA76934(v12, v13, &v112);
      uint64_t v2 = v0 + 2;
      swift_bridgeObjectRelease();
      sub_25BA90808(v1, v11);
      sub_25BA90808(v1, v11);
      _os_log_impl(&dword_25BA70000, v5, v6, "Got change: %{public}s", (uint8_t *)v10, 0xCu);
      swift_arrayDestroy();
      uint64_t v14 = v3;
      LOBYTE(v3) = v11;
      MEMORY[0x26116FA80](v14, -1, -1);
      MEMORY[0x26116FA80](v10, -1, -1);

      v101(v104, v110);
    }
    else
    {
      sub_25BA90808(v1, v3);
      sub_25BA90808(v1, v3);

      v8(v9, v110);
    }
    uint64_t v17 = v1;
    v111 = v0;
    v103 = v2;
    if (v3)
    {
      unsigned __int8 v102 = v3;
      int64_t v18 = *(void *)(v1 + 16);
      uint64_t v19 = MEMORY[0x263F8EE78];
      uint64_t v99 = v17;
      if (v18)
      {
        uint64_t v20 = v2 + 4;
        uint64_t v21 = v0[15];
        v0[6] = MEMORY[0x263F8EE78];
        sub_25BA8FEDC(0, v18, 0);
        unint64_t v22 = v17 + ((*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80));
        v105 = *(void (**)(uint64_t, unint64_t, uint64_t))(v21 + 16);
        uint64_t v107 = *(void *)(v21 + 72);
        do
        {
          uint64_t v23 = v0[22];
          uint64_t v25 = v0[16];
          uint64_t v24 = v0[17];
          uint64_t v26 = v0[14];
          uint64_t v27 = v0[15];
          v105(v24, v22, v26);
          v105(v25, v24, v26);
          uint64_t v0 = v111;
          sub_25BA8B8AC(v25, v23);
          (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v24, v26);
          uint64_t v19 = v111[6];
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_25BA8FEDC(0, *(void *)(v19 + 16) + 1, 1);
            uint64_t v19 = *v20;
          }
          unint64_t v29 = *(void *)(v19 + 16);
          unint64_t v28 = *(void *)(v19 + 24);
          if (v29 >= v28 >> 1)
          {
            sub_25BA8FEDC(v28 > 1, v29 + 1, 1);
            uint64_t v19 = *v20;
          }
          uint64_t v30 = v111[22];
          uint64_t v31 = v111[19];
          *(void *)(v19 + 16) = v29 + 1;
          sub_25BA86F84(v30, v19+ ((*(unsigned __int8 *)(v31 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80))+ *(void *)(v31 + 72) * v29);
          v22 += v107;
          --v18;
        }
        while (v18);
      }
      uint64_t v38 = v0[41];
      uint64_t v39 = v17;
      unsigned __int8 v40 = v102;
      if (!v38)
      {
LABEL_46:
        sub_25BA90808(v39, v40);
        LODWORD(v49) = *((unsigned __int8 *)v0 + 25);
        if (v49 == 2)
        {
          ((void (*)(void, void, void))v0[37])(v0[30], v0[36], v0[26]);
          uint64_t v79 = sub_25BAA4F50();
          os_log_type_t v80 = sub_25BAA5260();
          if (os_log_type_enabled(v79, v80))
          {
            uint64_t v81 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v81 = 0;
            _os_log_impl(&dword_25BA70000, v79, v80, "Waiting for enablement", v81, 2u);
            uint64_t v0 = v111;
            MEMORY[0x26116FA80](v81, -1, -1);
          }
          uint64_t v82 = (void (*)(uint64_t, uint64_t))v0[39];
          uint64_t v83 = v0[30];
          uint64_t v84 = v111[26];

          uint64_t v0 = v111;
          v82(v83, v84);
          LOBYTE(v49) = 2;
          goto LABEL_54;
        }
        swift_bridgeObjectRetain();
        if ((v49 & 1) == 0)
        {
LABEL_51:
          char v109 = v49;
          uint64_t v85 = (void (*)(uint64_t, uint64_t, uint64_t))v0[37];
          uint64_t v86 = v0[36];
          uint64_t v87 = v0[28];
          uint64_t v88 = v0[26];
          swift_bridgeObjectRelease();
          v85(v87, v86, v88);
          uint64_t v49 = sub_25BAA4F50();
          os_log_type_t v89 = sub_25BAA5260();
          if (os_log_type_enabled((os_log_t)v49, v89))
          {
            uint64_t v90 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v90 = 0;
            _os_log_impl(&dword_25BA70000, (os_log_t)v49, v89, "Disabled", v90, 2u);
            MEMORY[0x26116FA80](v90, -1, -1);
          }
          uint64_t v91 = (void (*)(uint64_t, uint64_t))v0[39];
          uint64_t v92 = v0[28];
          uint64_t v93 = v0[26];
          uint64_t v94 = v0[13];
          uint64_t v95 = v111[12];
          uint64_t v96 = v111[11];

          v91(v92, v93);
          v111[7] = MEMORY[0x263F8EE78];
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A5335B0);
          sub_25BAA5170();
          (*(void (**)(uint64_t, uint64_t))(v95 + 8))(v94, v96);
          LOBYTE(v49) = v109;
          uint64_t v0 = v111;
          goto LABEL_54;
        }
LABEL_31:
        ((void (*)(void, void, void))v0[37])(v0[29], v0[36], v0[26]);
        swift_bridgeObjectRetain_n();
        unsigned int v50 = sub_25BAA4F50();
        os_log_type_t v51 = sub_25BAA5260();
        BOOL v52 = os_log_type_enabled(v50, v51);
        uint64_t v53 = (void (*)(uint64_t, uint64_t))v0[39];
        uint64_t v54 = v0[29];
        uint64_t v55 = v0[26];
        if (v52)
        {
          uint64_t v106 = v0[29];
          uint64_t v56 = v0[18];
          char v108 = v49;
          uint64_t v49 = swift_slowAlloc();
          uint64_t v57 = swift_slowAlloc();
          uint64_t v112 = v57;
          *(_DWORD *)uint64_t v49 = 136315138;
          uint64_t v58 = swift_bridgeObjectRetain();
          uint64_t v59 = MEMORY[0x26116EFA0](v58, v56);
          v100 = v53;
          unint64_t v61 = v60;
          swift_bridgeObjectRelease();
          *(void *)(v49 + 4) = sub_25BA76934(v59, v61, &v112);
          swift_bridgeObjectRelease_n();
          uint64_t v0 = v111;
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_25BA70000, v50, v51, "Returning devices: %s", (uint8_t *)v49, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x26116FA80](v57, -1, -1);
          uint64_t v62 = v49;
          LOBYTE(v49) = v108;
          MEMORY[0x26116FA80](v62, -1, -1);

          v100(v106, v55);
        }
        else
        {

          swift_bridgeObjectRelease_n();
          v53(v54, v55);
        }
        uint64_t v70 = v0[12];
        uint64_t v69 = v0[13];
        uint64_t v71 = v111[11];
        v111[8] = v19;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A5335B0);
        sub_25BAA5170();
        uint64_t v0 = v111;
        (*(void (**)(uint64_t, uint64_t))(v70 + 8))(v69, v71);
LABEL_54:
        uint64_t v2 = v103;
LABEL_55:
        *((unsigned char *)v0 + 25) = v49;
        v0[41] = v19;
        goto LABEL_56;
      }
      uint64_t v41 = *(void *)(v19 + 16);
      if (v41 != *(void *)(v38 + 16))
      {
LABEL_45:
        swift_bridgeObjectRelease();
        uint64_t v0 = v111;
        goto LABEL_46;
      }
      if (v41 && v19 != v38)
      {
        uint64_t v42 = v111[19];
        unint64_t v43 = (*(unsigned __int8 *)(v42 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80);
        uint64_t v44 = *(void *)(v42 + 72);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        while (1)
        {
          uint64_t v46 = v111[20];
          uint64_t v45 = v111[21];
          sub_25BA8FE1C(v19 + v43, v45);
          sub_25BA8FE1C(v38 + v43, v46);
          sub_25BA90820(&qword_26A533388, 255, (void (*)(uint64_t))type metadata accessor for CompanionDevice);
          char v47 = sub_25BAA5040();
          sub_25BA8FE80(v46);
          sub_25BA8FE80(v45);
          if ((v47 & 1) == 0) {
            break;
          }
          v43 += v44;
          if (!--v41)
          {
            swift_bridgeObjectRelease_n();
            uint64_t v48 = v111;
            uint64_t v39 = v99;
            goto LABEL_39;
          }
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v39 = v99;
        unsigned __int8 v40 = v102;
        goto LABEL_45;
      }
      uint64_t v48 = v111;
LABEL_39:
      uint64_t v72 = (void (*)(uint64_t, uint64_t, uint64_t))v48[37];
      uint64_t v73 = v48[36];
      int64_t v34 = v48 + 32;
      uint64_t v74 = v48[32];
      uint64_t v75 = v48[26];
      swift_bridgeObjectRelease();
      v72(v74, v73, v75);
      uint64_t v76 = sub_25BAA4F50();
      os_log_type_t v77 = sub_25BAA5260();
      if (os_log_type_enabled(v76, v77))
      {
        v78 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v78 = 0;
        _os_log_impl(&dword_25BA70000, v76, v77, "ignoring no-op devices change", v78, 2u);
        MEMORY[0x26116FA80](v78, -1, -1);
      }

      sub_25BA90808(v39, v102);
      uint64_t v0 = v111;
      uint64_t v2 = v103;
    }
    else
    {
      int v32 = *((unsigned __int8 *)v0 + 25);
      if (v32 == 2 || ((v1 ^ ((v32 & 1) == 0)) & 1) == 0)
      {
        uint64_t v49 = v1 & 1;
        uint64_t v19 = v0[41];
        if (!v19)
        {
          ((void (*)(void, void, void))v0[37])(v0[31], v0[36], v0[26]);
          uint64_t v63 = sub_25BAA4F50();
          os_log_type_t v64 = sub_25BAA5260();
          if (os_log_type_enabled(v63, v64))
          {
            uint64_t v65 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v65 = 0;
            _os_log_impl(&dword_25BA70000, v63, v64, "Waiting for devices", v65, 2u);
            MEMORY[0x26116FA80](v65, -1, -1);
          }
          uint64_t v66 = (void (*)(uint64_t, uint64_t))v0[39];
          uint64_t v67 = v0[31];
          uint64_t v68 = v0[26];

          v66(v67, v68);
          uint64_t v19 = 0;
          goto LABEL_55;
        }
        swift_bridgeObjectRetain();
        if (!v49) {
          goto LABEL_51;
        }
        goto LABEL_31;
      }
      unsigned __int8 v33 = v3;
      int64_t v34 = v0 + 33;
      ((void (*)(void, void, void))v0[37])(v0[33], v0[36], v0[26]);
      uint64_t v35 = sub_25BAA4F50();
      os_log_type_t v36 = sub_25BAA5260();
      if (os_log_type_enabled(v35, v36))
      {
        char v37 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)char v37 = 0;
        _os_log_impl(&dword_25BA70000, v35, v36, "ignoring no-op enablement change", v37, 2u);
        MEMORY[0x26116FA80](v37, -1, -1);

        sub_25BA90808(v17, v33);
      }
      else
      {
      }
    }
    ((void (*)(void, void))v0[39])(*v34, v0[26]);
LABEL_56:
    v97 = (void *)swift_task_alloc();
    v0[42] = v97;
    void *v97 = v0;
    v97[1] = sub_25BA8A8BC;
    uint64_t v98 = v0[23];
    return MEMORY[0x270FA1F68](v2, 0, 0, v98);
  }
  (*(void (**)(void, void))(v0[24] + 8))(v0[25], v0[23]);
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
  uint64_t v15 = (uint64_t (*)(void))v0[1];
  return v15();
}

uint64_t sub_25BA8B610()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5335C8);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5335B0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v4 + v5 + v8) & ~v8;
  uint64_t v10 = v9 + *(void *)(v7 + 64);
  uint64_t v11 = v3 | v8 | 7;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);
  return MEMORY[0x270FA0238](v0, v10, v11);
}

uint64_t sub_25BA8B770()
{
  uint64_t v2 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A5335C8) - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v2 + 64);
  uint64_t v5 = *(unsigned __int8 *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A5335B0) - 8) + 80);
  unint64_t v6 = v3 + v4 + v5;
  uint64_t v7 = v0 + v3;
  uint64_t v8 = v0 + (v6 & ~v5);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v9;
  *uint64_t v9 = v1;
  v9[1] = sub_25BA79E70;
  return sub_25BA8A444((uint64_t)v9, v10, v11, v7, v8);
}

uint64_t sub_25BA8B8AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v77 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533358);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v76 = (char *)&v61 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5336A0);
  MEMORY[0x270FA5388](v5 - 8);
  *(void *)&long long v75 = (char *)&v61 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25BAA4E70();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v61 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  *(void *)&long long v71 = (char *)&v61 - v12;
  uint64_t v64 = sub_25BAA4E20();
  uint64_t v13 = *(void *)(v64 - 8);
  MEMORY[0x270FA5388](v64);
  uint64_t v15 = (char *)&v61 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = sub_25BAA4DA0();
  uint64_t v62 = *(void *)(v63 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v63);
  uint64_t v74 = (char *)&v61 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v72 = (char *)&v61 - v18;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5336A8);
  MEMORY[0x270FA5388](v19 - 8);
  uint64_t v21 = (char *)&v61 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533340);
  uint64_t v23 = MEMORY[0x270FA5388](v22 - 8);
  uint64_t v78 = (uint64_t)&v61 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23);
  uint64_t v26 = (char *)&v61 - v25;
  sub_25BAA4E30();
  if (v27)
  {
    uint64_t v28 = sub_25BAA4F20();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v21, 1, 1, v28);
    sub_25BAA4F30();
  }
  else
  {
    uint64_t v29 = sub_25BAA4F40();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v26, 1, 1, v29);
  }
  uint64_t v30 = (uint64_t)v72;
  sub_25BAA4E50();
  uint64_t v31 = (uint64_t)v74;
  sub_25BAA4E90();
  uint64_t v70 = sub_25BAA4EA0();
  uint64_t v69 = v32;
  sub_25BA90868((uint64_t)v26, v78);
  uint64_t v68 = sub_25BAA4E40();
  uint64_t v67 = v33;
  int v66 = sub_25BAA4F00();
  sub_25BAA4E60();
  unint64_t v65 = sub_25BAA4E10();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v64);
  uint64_t v34 = v71;
  sub_25BAA4E80();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, v34, v7);
  int v35 = (*(uint64_t (**)(char *, uint64_t))(v8 + 88))(v11, v7);
  int v36 = *MEMORY[0x263F63ED0];
  uint64_t v73 = v26;
  if (v35 == v36)
  {
    (*(void (**)(char *, uint64_t))(v8 + 96))(v11, v7);
    char v37 = 2;
    uint64_t v38 = v75;
    uint64_t v39 = v63;
    uint64_t v40 = v62;
LABEL_6:
    (*(void (**)(char *, uint64_t))(v40 + 8))(v11, v39);
    goto LABEL_14;
  }
  uint64_t v38 = v75;
  if (v35 == *MEMORY[0x263F63EA8])
  {
    char v37 = 0;
  }
  else if (v35 == *MEMORY[0x263F63EC0])
  {
    char v37 = 1;
  }
  else if (v35 == *MEMORY[0x263F63EB8])
  {
    char v37 = 2;
  }
  else
  {
    char v37 = 3;
    uint64_t v40 = v8;
    uint64_t v39 = v7;
    if (v35 != *MEMORY[0x263F63EC8]) {
      goto LABEL_6;
    }
  }
LABEL_14:
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v34, v7);
  v85[0] = v37;
  sub_25BAA4EF0();
  uint64_t v41 = sub_25BAA4EE0();
  uint64_t v42 = *(void *)(v41 - 8);
  int v43 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v42 + 48))(v38, 1, v41);
  if (v43 == 1)
  {
    sub_25BA798DC(v38, &qword_26A5336A0);
    char v44 = 0;
    long long v45 = 0uLL;
    long long v46 = 0uLL;
  }
  else
  {
    sub_25BAA4EC0();
    double v48 = v47;
    double v50 = v49;
    sub_25BAA4ED0();
    double v52 = v51;
    uint64_t v53 = sub_25BAA4EB0();
    sub_25BA7A24C(v53, v54 & 1, (uint64_t)&v81, v48, v50, v52);
    long long v75 = v81;
    long long v71 = v82;
    char v44 = v83;
    (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v38, v41);
    long long v46 = v71;
    long long v45 = v75;
  }
  BOOL v55 = v43 == 1;
  long long v81 = v45;
  long long v82 = v46;
  char v56 = v65 > 8;
  char v83 = v44;
  BOOL v84 = v55;
  char v80 = 3;
  char v79 = 2;
  uint64_t v57 = type metadata accessor for CompanionDevice.SessionInfo(0);
  uint64_t v58 = (uint64_t)v76;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v57 - 8) + 56))(v76, 1, 1, v57);
  sub_25BA7AE18(v30, v31, v70, v69, v78, v68, v67, v66 & 1, v77, 1, v56, v85, &v81, &v80, &v79, v58);
  uint64_t v59 = sub_25BAA4F10();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v59 - 8) + 8))(a1, v59);
  return sub_25BA798DC((uint64_t)v73, &qword_26A533340);
}

uint64_t sub_25BA8C0B8()
{
  uint64_t v0 = sub_25BAA4F70();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_25BA909E0();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  uint64_t v5 = sub_25BAA4F50();
  os_log_type_t v6 = sub_25BAA5260();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_25BA70000, v5, v6, "Combined stream terminated", v7, 2u);
    MEMORY[0x26116FA80](v7, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return sub_25BAA51A0();
}

uint64_t sub_25BA8C238()
{
  return sub_25BA8C0B8();
}

uint64_t sub_25BA8C240(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](sub_25BA8C260, v1, 0);
}

uint64_t sub_25BA8C260(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2[2];
  uint64_t v3 = v2[3];
  sub_25BA90820((unint64_t *)&unk_26A533608, a2, (void (*)(uint64_t))type metadata accessor for ReplicatorController);
  uint64_t v5 = swift_task_alloc();
  v2[4] = v5;
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  os_log_type_t v6 = (void *)swift_task_alloc();
  v2[5] = v6;
  *os_log_type_t v6 = v2;
  v6[1] = sub_25BA8C38C;
  return MEMORY[0x270FA2360]();
}

uint64_t sub_25BA8C38C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 48) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 24);
    uint64_t v4 = sub_25BA8C4B0;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 24);
    swift_task_dealloc();
    uint64_t v4 = sub_25BA73DBC;
    uint64_t v3 = v5;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_25BA8C4B0()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t type metadata accessor for ReplicatorController()
{
  return self;
}

uint64_t sub_25BA8C538(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v48 = a3;
  uint64_t v43 = a1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533318);
  uint64_t v46 = *(void *)(v4 - 8);
  uint64_t v47 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v44 = v5;
  long long v45 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25BAA4DA0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v40 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v37 - v10;
  uint64_t v12 = sub_25BAA4F70();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_25BA909E0();
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
  uint64_t v39 = v12;
  v17(v15, v16, v12);
  uint64_t v50 = v7;
  uint64_t v18 = a2;
  uint64_t v41 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v41(v11, a2, v6);
  uint64_t v19 = sub_25BAA4F50();
  os_log_type_t v20 = sub_25BAA5260();
  BOOL v21 = os_log_type_enabled(v19, v20);
  uint64_t v49 = a2;
  if (v21)
  {
    uint64_t v22 = (uint8_t *)swift_slowAlloc();
    uint64_t v38 = swift_slowAlloc();
    uint64_t v52 = v38;
    *(_DWORD *)uint64_t v22 = 136315138;
    char v37 = v22 + 4;
    sub_25BA90820(&qword_26A533628, 255, MEMORY[0x263F07508]);
    uint64_t v23 = sub_25BAA5530();
    uint64_t v51 = sub_25BA76934(v23, v24, &v52);
    sub_25BAA5330();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v50 + 8))(v11, v6);
    _os_log_impl(&dword_25BA70000, v19, v20, "Will pair device with ID %s", v22, 0xCu);
    uint64_t v25 = v38;
    swift_arrayDestroy();
    MEMORY[0x26116FA80](v25, -1, -1);
    uint64_t v18 = v49;
    MEMORY[0x26116FA80](v22, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v50 + 8))(v11, v6);
  }

  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v39);
  sub_25BAA4E00();
  swift_allocObject();
  uint64_t v39 = sub_25BAA4DF0();
  uint64_t v26 = v40;
  v41(v40, v18, v6);
  uint64_t v28 = v45;
  uint64_t v27 = v46;
  uint64_t v29 = v47;
  (*(void (**)(char *, uint64_t, uint64_t))(v46 + 16))(v45, v43, v47);
  uint64_t v30 = v50;
  unint64_t v31 = (*(unsigned __int8 *)(v50 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v50 + 80);
  unint64_t v32 = (v42 + *(unsigned __int8 *)(v27 + 80) + v31) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80);
  uint64_t v33 = v6;
  unint64_t v34 = (v44 + v32 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v35 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v30 + 32))(v35 + v31, v26, v33);
  (*(void (**)(unint64_t, char *, uint64_t))(v27 + 32))(v35 + v32, v28, v29);
  *(void *)(v35 + v34) = v48;
  swift_retain();
  sub_25BAA4DD0();
  swift_release();
  return swift_release();
}

uint64_t sub_25BA8CA40(uint64_t a1)
{
  return sub_25BA8C538(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_25BA8CA48(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v46 = a4;
  uint64_t v47 = a2;
  uint64_t v48 = a3;
  uint64_t v5 = sub_25BAA4F70();
  uint64_t v50 = *(void *)(v5 - 8);
  uint64_t v51 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v49 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533318);
  uint64_t v45 = *(void *)(v7 - 8);
  uint64_t v8 = *(void *)(v45 + 64);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_25BAA4DA0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v44 - v15;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533210);
  MEMORY[0x270FA5388](v17 - 8);
  uint64_t v19 = (char *)&v44 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    uint64_t v46 = v7;
    id v20 = a1;
    uint64_t v21 = sub_25BA909E0();
    (*(void (**)(char *, uint64_t, uint64_t))(v50 + 16))(v49, v21, v51);
    uint64_t v22 = v10;
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v14, v47, v10);
    id v23 = a1;
    id v24 = a1;
    uint64_t v25 = sub_25BAA4F50();
    os_log_type_t v26 = sub_25BAA5250();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = swift_slowAlloc();
      uint64_t v45 = swift_slowAlloc();
      uint64_t v47 = swift_slowAlloc();
      uint64_t v53 = v47;
      *(_DWORD *)uint64_t v27 = 136315394;
      sub_25BA90820(&qword_26A533628, 255, MEMORY[0x263F07508]);
      uint64_t v28 = sub_25BAA5530();
      uint64_t v52 = sub_25BA76934(v28, v29, &v53);
      sub_25BAA5330();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v22);
      *(_WORD *)(v27 + 12) = 2112;
      id v30 = a1;
      uint64_t v31 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v52 = v31;
      sub_25BAA5330();
      uint64_t v32 = v45;
      *(void *)uint64_t v45 = v31;

      _os_log_impl(&dword_25BA70000, v25, v26, "Pairing device %s failed: %@", (uint8_t *)v27, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5332C8);
      swift_arrayDestroy();
      MEMORY[0x26116FA80](v32, -1, -1);
      uint64_t v33 = v47;
      swift_arrayDestroy();
      MEMORY[0x26116FA80](v33, -1, -1);
      MEMORY[0x26116FA80](v27, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v22);
    }
    (*(void (**)(char *, uint64_t))(v50 + 8))(v49, v51);
    uint64_t v53 = (uint64_t)a1;
    return sub_25BAA50F0();
  }
  else
  {
    uint64_t v34 = sub_25BAA5140();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v19, 1, 1, v34);
    uint64_t v35 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
    uint64_t v44 = v10;
    v35(v16, v47, v10);
    uint64_t v36 = v45;
    (*(void (**)(char *, uint64_t, uint64_t))(v45 + 16))((char *)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v48, v7);
    uint64_t v51 = sub_25BA90820((unint64_t *)&unk_26A533608, v37, (void (*)(uint64_t))type metadata accessor for ReplicatorController);
    unint64_t v38 = (*(unsigned __int8 *)(v11 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
    unint64_t v39 = (v12 + *(unsigned __int8 *)(v36 + 80) + v38) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80);
    uint64_t v40 = (char *)swift_allocObject();
    uint64_t v41 = v46;
    uint64_t v42 = v51;
    *((void *)v40 + 2) = v46;
    *((void *)v40 + 3) = v42;
    *((void *)v40 + 4) = v41;
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v40[v38], v16, v44);
    (*(void (**)(char *, char *, uint64_t))(v36 + 32))(&v40[v39], v9, v7);
    swift_retain_n();
    sub_25BA73934((uint64_t)v19, (uint64_t)&unk_26A533670, (uint64_t)v40);
    return swift_release();
  }
}

uint64_t sub_25BA8D07C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[6] = a5;
  v6[7] = a6;
  v6[5] = a4;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533618);
  v6[8] = v8;
  v6[9] = *(void *)(v8 - 8);
  v6[10] = swift_task_alloc();
  uint64_t v9 = sub_25BAA4DA0();
  v6[11] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v6[12] = v10;
  v6[13] = *(void *)(v10 + 64);
  v6[14] = swift_task_alloc();
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533588);
  v6[15] = v11;
  v6[16] = *(void *)(v11 - 8);
  v6[17] = swift_task_alloc();
  v6[18] = swift_task_alloc();
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533620);
  v6[19] = v12;
  v6[20] = *(void *)(v12 - 8);
  v6[21] = swift_task_alloc();
  v6[22] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25BA8D28C, a4, 0);
}

uint64_t sub_25BA8D28C()
{
  uint64_t v1 = *(void *)(v0 + 144);
  uint64_t v11 = *(void *)(v0 + 136);
  uint64_t v2 = *(void *)(v0 + 120);
  uint64_t v3 = *(void *)(v0 + 128);
  uint64_t v4 = *(void *)(v0 + 112);
  uint64_t v6 = *(void *)(v0 + 88);
  uint64_t v5 = *(void *)(v0 + 96);
  uint64_t v7 = *(void *)(v0 + 48);
  (*(void (**)(void))(**(void **)(v0 + 40) + 88))();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v7, v6);
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v9 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v5 + 32))(v9 + v8, v4, v6);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v11, v1, v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A533438);
  sub_25BA76180(&qword_26A533598, &qword_26A533588);
  sub_25BAA5430();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  return MEMORY[0x270FA2498](sub_25BA8D454, 0, 0);
}

uint64_t sub_25BA8D454()
{
  (*(void (**)(void, void, void))(v0[20] + 16))(v0[21], v0[22], v0[19]);
  sub_25BA76180(&qword_26A533648, &qword_26A533620);
  sub_25BAA51B0();
  uint64_t v1 = sub_25BA76180(&qword_26A533650, &qword_26A533618);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[23] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_25BA8D590;
  uint64_t v3 = v0[8];
  return MEMORY[0x270FA1E80](v0 + 2, v3, v1);
}

uint64_t sub_25BA8D590()
{
  uint64_t v2 = (void *)*v1;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = v2[10];
    uint64_t v4 = v2[8];
    uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v2[9] + 8);
    return v5(v3, v4);
  }
  else
  {
    return MEMORY[0x270FA2498](sub_25BA8D6C4, 0, 0);
  }
}

uint64_t sub_25BA8D6C4()
{
  uint64_t v1 = v0[2];
  v0[24] = v1;
  if (v1)
  {
    v0[4] = v1;
    uint64_t v5 = (uint64_t (*)(void *))((char *)&dword_26A533688 + dword_26A533688);
    uint64_t v2 = (void *)swift_task_alloc();
    v0[25] = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_25BA8D7E0;
    return v5(v0 + 4);
  }
  else
  {
    uint64_t v4 = v0[5];
    (*(void (**)(void, void))(v0[9] + 8))(v0[10], v0[8]);
    return MEMORY[0x270FA2498](sub_25BA8DB5C, v4, 0);
  }
}

uint64_t sub_25BA8D7E0(char a1)
{
  uint64_t v4 = *v2;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v6 = *(void *)(v4 + 72);
    uint64_t v5 = *(void *)(v4 + 80);
    uint64_t v7 = *(void *)(v4 + 64);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    unint64_t v8 = nullsub_1;
  }
  else
  {
    *(unsigned char *)(v4 + 216) = a1 & 1;
    unint64_t v8 = sub_25BA8D92C;
  }
  return MEMORY[0x270FA2498](v8, 0, 0);
}

uint64_t sub_25BA8D92C()
{
  if (*(unsigned char *)(v0 + 216))
  {
    uint64_t v1 = *(void *)(v0 + 40);
    (*(void (**)(void, void))(*(void *)(v0 + 72) + 8))(*(void *)(v0 + 80), *(void *)(v0 + 64));
    *(void *)(v0 + 208) = *(void *)(v0 + 32);
    return MEMORY[0x270FA2498](sub_25BA8DA78, v1, 0);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_25BA76180(&qword_26A533650, &qword_26A533618);
    uint64_t v3 = (void *)swift_task_alloc();
    *(void *)(v0 + 184) = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_25BA8D590;
    uint64_t v4 = *(void *)(v0 + 64);
    return MEMORY[0x270FA1E80](v0 + 16, v4, v2);
  }
}

uint64_t sub_25BA8DA78()
{
  uint64_t v1 = v0[22];
  uint64_t v2 = v0[19];
  uint64_t v3 = v0[20];
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A533318);
  sub_25BAA5100();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_25BA8DB5C()
{
  uint64_t v1 = v0[22];
  uint64_t v2 = v0[19];
  uint64_t v3 = v0[20];
  sub_25BA8FA9C();
  v0[3] = swift_allocError();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A533318);
  sub_25BAA50F0();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_25BA8DC60(uint64_t a1, void *a2, uint64_t a3)
{
  v3[2] = a1;
  v3[3] = a3;
  v3[4] = *a2;
  return MEMORY[0x270FA2498](sub_25BA8DC88, 0, 0);
}

uint64_t sub_25BA8DC88()
{
  uint64_t v2 = v0[3];
  uint64_t v1 = v0[4];
  uint64_t v3 = (uint64_t *)v0[2];
  uint64_t v4 = swift_task_alloc();
  *(void *)(v4 + 16) = v2;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_25BA8DD44((uint64_t (*)(char *))sub_25BA907D8, v4, v1);
  swift_task_dealloc();
  *uint64_t v3 = v5;
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_25BA8DD44(uint64_t (*a1)(char *), uint64_t a2, uint64_t a3)
{
  uint64_t v7 = type metadata accessor for CompanionDevice(0);
  uint64_t v24 = *(void *)(v7 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v23 = (uint64_t)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v20 - v11;
  uint64_t v13 = MEMORY[0x263F8EE78];
  uint64_t v25 = MEMORY[0x263F8EE78];
  uint64_t v22 = *(void *)(a3 + 16);
  if (v22)
  {
    unint64_t v14 = 0;
    uint64_t v15 = MEMORY[0x263F8EE78];
    v20[1] = a2;
    uint64_t v21 = a3;
    v20[0] = a1;
    while (v14 < *(void *)(a3 + 16))
    {
      unint64_t v16 = (*(unsigned __int8 *)(v24 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
      uint64_t v13 = *(void *)(v24 + 72);
      sub_25BA8FE1C(a3 + v16 + v13 * v14, (uint64_t)v12);
      char v17 = a1(v12);
      if (v3)
      {
        sub_25BA8FE80((uint64_t)v12);
        swift_release();
        swift_bridgeObjectRelease();
        return v13;
      }
      if (v17)
      {
        sub_25BA86F84((uint64_t)v12, v23);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_25BA8FEDC(0, *(void *)(v15 + 16) + 1, 1);
        }
        uint64_t v15 = v25;
        unint64_t v19 = *(void *)(v25 + 16);
        unint64_t v18 = *(void *)(v25 + 24);
        if (v19 >= v18 >> 1)
        {
          sub_25BA8FEDC(v18 > 1, v19 + 1, 1);
          uint64_t v15 = v25;
        }
        *(void *)(v15 + 16) = v19 + 1;
        uint64_t result = sub_25BA86F84(v23, v15 + v16 + v19 * v13);
        a3 = v21;
        a1 = (uint64_t (*)(char *))v20[0];
      }
      else
      {
        uint64_t result = sub_25BA8FE80((uint64_t)v12);
      }
      if (v22 == ++v14)
      {
        uint64_t v13 = v25;
        goto LABEL_15;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_15:
    swift_bridgeObjectRelease();
    return v13;
  }
  return result;
}

uint64_t sub_25BA8DF78(void *a1)
{
  *(void *)(v1 + 16) = *a1;
  return MEMORY[0x270FA2498](sub_25BA8DF9C, 0, 0);
}

uint64_t sub_25BA8DF9C()
{
  return (*(uint64_t (**)(BOOL))(v0 + 8))(*(void *)(*(void *)(v0 + 16) + 16) != 0);
}

uint64_t sub_25BA8DFC4(uint64_t a1)
{
  v2[7] = a1;
  v2[8] = v1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533618);
  v2[9] = v3;
  v2[10] = *(void *)(v3 - 8);
  v2[11] = swift_task_alloc();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533588);
  v2[12] = v4;
  v2[13] = *(void *)(v4 - 8);
  v2[14] = swift_task_alloc();
  v2[15] = swift_task_alloc();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533620);
  v2[16] = v5;
  v2[17] = *(void *)(v5 - 8);
  v2[18] = swift_task_alloc();
  v2[19] = swift_task_alloc();
  uint64_t v6 = sub_25BAA4DA0();
  v2[20] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v2[21] = v7;
  v2[22] = *(void *)(v7 + 64);
  v2[23] = swift_task_alloc();
  v2[24] = swift_task_alloc();
  v2[25] = swift_task_alloc();
  uint64_t v8 = sub_25BAA4F70();
  v2[26] = v8;
  v2[27] = *(void *)(v8 - 8);
  v2[28] = swift_task_alloc();
  v2[29] = swift_task_alloc();
  v2[30] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25BA8E260, v1, 0);
}

uint64_t sub_25BA8E260()
{
  uint64_t v51 = v0;
  uint64_t v1 = v0[7];
  uint64_t v2 = v0[30];
  uint64_t v3 = v0[27];
  uint64_t v4 = v0[25];
  uint64_t v6 = v0[20];
  uint64_t v5 = v0[21];
  uint64_t v7 = sub_25BA909E0();
  v0[31] = v7;
  uint64_t v8 = *(void (**)(void))(v3 + 16);
  v0[32] = v8;
  v0[33] = (v3 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  uint64_t v47 = v7;
  uint64_t v45 = (void (*)(void, uint64_t, void))v8;
  v8(v2);
  uint64_t v9 = *(void (**)(os_log_t, uint64_t, uint64_t))(v5 + 16);
  v0[34] = v9;
  v0[35] = (v5 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  uint64_t v49 = v9;
  v9(v4, v1, v6);
  uint64_t v10 = sub_25BAA4F50();
  os_log_type_t v11 = sub_25BAA5260();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v40 = v0[27];
    os_log_t log = (os_log_t)v0[26];
    uint64_t v44 = v0[30];
    uint64_t v12 = v0[21];
    uint64_t v38 = v0[20];
    uint64_t v39 = v0[25];
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v50 = v14;
    *(_DWORD *)uint64_t v13 = 136315138;
    sub_25BA90820(&qword_26A533628, 255, MEMORY[0x263F07508]);
    uint64_t v15 = sub_25BAA5530();
    v0[6] = sub_25BA76934(v15, v16, &v50);
    sub_25BAA5330();
    swift_bridgeObjectRelease();
    char v17 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    v17(v39, v38);
    _os_log_impl(&dword_25BA70000, v10, v11, "Will unpair device with ID %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x26116FA80](v14, -1, -1);
    MEMORY[0x26116FA80](v13, -1, -1);

    unint64_t v18 = *(void (**)(uint64_t, os_log_t))(v40 + 8);
    v18(v44, log);
  }
  else
  {
    uint64_t v19 = v0[30];
    id v20 = v0[26];
    uint64_t v21 = v0[27];
    char v17 = *(void (**)(uint64_t, uint64_t))(v0[21] + 8);
    v17(v0[25], v0[20]);

    unint64_t v18 = *(void (**)(uint64_t, os_log_t))(v21 + 8);
    v18(v19, v20);
  }
  v0[36] = v17;
  v0[37] = v18;
  sub_25BAA4E00();
  swift_allocObject();
  v0[38] = sub_25BAA4DF0();
  sub_25BAA4DE0();
  v45(v0[29], v47, v0[26]);
  uint64_t v22 = sub_25BAA4F50();
  os_log_type_t v23 = sub_25BAA5260();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v24 = 0;
    _os_log_impl(&dword_25BA70000, v22, v23, "Waiting for paired device to be removed", v24, 2u);
    MEMORY[0x26116FA80](v24, -1, -1);
  }
  uint64_t v25 = v0[29];
  uint64_t v26 = v0[26];
  uint64_t v27 = v0[21];
  os_log_t loga = (os_log_t)v0[24];
  uint64_t v41 = v0[20];
  uint64_t v28 = v0[15];
  uint64_t v46 = v0[14];
  uint64_t v29 = v0[13];
  uint64_t v48 = v0[12];
  id v30 = v22;
  uint64_t v32 = v0[7];
  uint64_t v31 = v0[8];

  uint64_t v33 = ((uint64_t (*)(uint64_t, uint64_t))v18)(v25, v26);
  uint64_t v34 = v28;
  (*(void (**)(uint64_t))(*(void *)v31 + 88))(v33);
  v49(loga, v32, v41);
  unint64_t v35 = (*(unsigned __int8 *)(v27 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80);
  uint64_t v36 = swift_allocObject();
  (*(void (**)(unint64_t, os_log_t, uint64_t))(v27 + 32))(v36 + v35, loga, v41);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 16))(v46, v34, v48);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A533438);
  sub_25BA76180(&qword_26A533598, &qword_26A533588);
  sub_25BAA5430();
  (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v34, v48);
  return MEMORY[0x270FA2498](sub_25BA8EB00, 0, 0);
}

uint64_t sub_25BA8EB00()
{
  (*(void (**)(void, void, void))(v0[17] + 16))(v0[18], v0[19], v0[16]);
  sub_25BA76180(&qword_26A533648, &qword_26A533620);
  sub_25BAA51B0();
  uint64_t v1 = sub_25BA76180(&qword_26A533650, &qword_26A533618);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[39] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_25BA8EC3C;
  uint64_t v3 = v0[9];
  return MEMORY[0x270FA1E80](v0 + 4, v3, v1);
}

uint64_t sub_25BA8EC3C()
{
  uint64_t v2 = (void *)*v1;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = v2[11];
    uint64_t v4 = v2[9];
    uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v2[10] + 8);
    return v5(v3, v4);
  }
  else
  {
    return MEMORY[0x270FA2498](sub_25BA8ED70, 0, 0);
  }
}

uint64_t sub_25BA8ED70()
{
  uint64_t v1 = v0[4];
  v0[40] = v1;
  if (v1)
  {
    v0[5] = v1;
    uint64_t v5 = (uint64_t (*)(void *))((char *)&dword_26A533640 + dword_26A533640);
    uint64_t v2 = (void *)swift_task_alloc();
    v0[41] = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_25BA8EE88;
    return v5(v0 + 5);
  }
  else
  {
    uint64_t v4 = v0[8];
    (*(void (**)(void, void))(v0[10] + 8))(v0[11], v0[9]);
    return MEMORY[0x270FA2498](sub_25BA8F24C, v4, 0);
  }
}

uint64_t sub_25BA8EE88(char a1)
{
  uint64_t v4 = *v2;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v6 = *(void *)(v4 + 80);
    uint64_t v5 = *(void *)(v4 + 88);
    uint64_t v7 = *(void *)(v4 + 72);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    uint64_t v8 = nullsub_1;
  }
  else
  {
    *(unsigned char *)(v4 + 344) = a1 & 1;
    uint64_t v8 = sub_25BA8EFD4;
  }
  return MEMORY[0x270FA2498](v8, 0, 0);
}

uint64_t sub_25BA8EFD4()
{
  if (*(unsigned char *)(v0 + 344))
  {
    uint64_t v1 = *(void *)(v0 + 64);
    (*(void (**)(void, void))(*(void *)(v0 + 80) + 8))(*(void *)(v0 + 88), *(void *)(v0 + 72));
    *(void *)(v0 + 336) = *(void *)(v0 + 40);
    return MEMORY[0x270FA2498](sub_25BA8F11C, v1, 0);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_25BA76180(&qword_26A533650, &qword_26A533618);
    uint64_t v3 = (void *)swift_task_alloc();
    *(void *)(v0 + 312) = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_25BA8EC3C;
    uint64_t v4 = *(void *)(v0 + 72);
    return MEMORY[0x270FA1E80](v0 + 32, v4, v2);
  }
}

uint64_t sub_25BA8F11C()
{
  uint64_t v1 = v0[19];
  uint64_t v3 = v0[16];
  uint64_t v2 = v0[17];
  swift_release();
  swift_bridgeObjectRelease();
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
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_25BA8F24C()
{
  uint64_t v33 = v0;
  uint64_t v1 = *(void *)(v0 + 152);
  uint64_t v3 = *(void *)(v0 + 128);
  uint64_t v2 = *(void *)(v0 + 136);
  sub_25BA8FA9C();
  uint64_t v4 = (void *)swift_allocError();
  swift_willThrow();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 272);
  uint64_t v6 = *(void *)(v0 + 184);
  uint64_t v7 = *(void *)(v0 + 160);
  uint64_t v8 = *(void *)(v0 + 56);
  (*(void (**)(void, void, void))(v0 + 256))(*(void *)(v0 + 224), *(void *)(v0 + 248), *(void *)(v0 + 208));
  v5(v6, v8, v7);
  id v9 = v4;
  id v31 = v4;
  id v10 = v4;
  os_log_type_t v11 = sub_25BAA4F50();
  os_log_type_t v12 = sub_25BAA5250();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v0 + 288);
    uint64_t v29 = *(void *)(v0 + 224);
    id v30 = *(void (**)(uint64_t, uint64_t))(v0 + 296);
    uint64_t v28 = *(void *)(v0 + 208);
    uint64_t v13 = *(void *)(v0 + 184);
    uint64_t v14 = *(void *)(v0 + 160);
    uint64_t v15 = swift_slowAlloc();
    uint64_t v26 = (void *)swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    uint64_t v32 = v27;
    *(_DWORD *)uint64_t v15 = 136446466;
    sub_25BA90820(&qword_26A533628, 255, MEMORY[0x263F07508]);
    uint64_t v16 = sub_25BAA5530();
    *(void *)(v0 + 16) = sub_25BA76934(v16, v17, &v32);
    sub_25BAA5330();
    swift_bridgeObjectRelease();
    v25(v13, v14);
    *(_WORD *)(v15 + 12) = 2114;
    id v18 = v31;
    uint64_t v19 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 24) = v19;
    sub_25BAA5330();
    void *v26 = v19;

    _os_log_impl(&dword_25BA70000, v11, v12, "Failed to unpair device with ID %{public}s: %{public}@", (uint8_t *)v15, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5332C8);
    swift_arrayDestroy();
    MEMORY[0x26116FA80](v26, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x26116FA80](v27, -1, -1);
    MEMORY[0x26116FA80](v15, -1, -1);

    v30(v29, v28);
  }
  else
  {
    id v20 = *(void (**)(uint64_t, uint64_t))(v0 + 296);
    uint64_t v21 = *(void *)(v0 + 224);
    uint64_t v22 = *(void *)(v0 + 208);
    (*(void (**)(void, void))(v0 + 288))(*(void *)(v0 + 184), *(void *)(v0 + 160));

    v20(v21, v22);
  }
  swift_willThrow();
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
  os_log_type_t v23 = *(uint64_t (**)(void))(v0 + 8);
  return v23();
}

uint64_t sub_25BA8F664(uint64_t a1, void *a2, uint64_t a3)
{
  v3[2] = a1;
  v3[3] = a3;
  v3[4] = *a2;
  return MEMORY[0x270FA2498](sub_25BA8F68C, 0, 0);
}

uint64_t sub_25BA8F68C()
{
  uint64_t v2 = v0[3];
  uint64_t v1 = v0[4];
  uint64_t v3 = (uint64_t *)v0[2];
  uint64_t v4 = swift_task_alloc();
  *(void *)(v4 + 16) = v2;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_25BA8DD44((uint64_t (*)(char *))sub_25BA908D4, v4, v1);
  swift_task_dealloc();
  *uint64_t v3 = v5;
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_25BA8F748(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CompanionDevice(0);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = &v12[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_25BAA4DA0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = &v12[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  CompanionDevice.id.getter((uint64_t)v8);
  char v9 = sub_25BAA4D70();
  (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
  sub_25BA8FE1C(a1, (uint64_t)v4);
  if ((v9 & 1) != 0 && v4[*(int *)(v2 + 48)] != 3)
  {
    v12[15] = v4[*(int *)(v2 + 48)];
    v12[14] = 2;
    sub_25BA7C8D0();
    char v10 = sub_25BAA5040();
    sub_25BA8FE80((uint64_t)v4);
  }
  else
  {
    sub_25BA8FE80((uint64_t)v4);
    char v10 = 0;
  }
  return v10 & 1;
}

uint64_t sub_25BA8F8EC(void *a1)
{
  *(void *)(v1 + 16) = *a1;
  return MEMORY[0x270FA2498](sub_25BA8F910, 0, 0);
}

uint64_t sub_25BA8F910()
{
  return (*(uint64_t (**)(BOOL))(v0 + 8))(*(void *)(*(void *)(v0 + 16) + 16) == 0);
}

uint64_t sub_25BA8F938()
{
  swift_defaultActor_destroy();
  return MEMORY[0x270FA2418](v0);
}

uint64_t sub_25BA8F968()
{
  uint64_t v0 = swift_allocObject();
  swift_defaultActor_initialize();
  return v0;
}

uint64_t sub_25BA8F9A4(uint64_t a1, uint64_t *a2)
{
  uint64_t v6 = *(void *)(sub_25BAA4DA0() - 8);
  uint64_t v7 = v2 + ((*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v8;
  *uint64_t v8 = v3;
  v8[1] = sub_25BA79E70;
  v8[2] = a1;
  uint64_t v9 = *a2;
  v8[3] = v7;
  v8[4] = v9;
  return MEMORY[0x270FA2498](sub_25BA8F68C, 0, 0);
}

unint64_t sub_25BA8FA9C()
{
  unint64_t result = qword_26A533658;
  if (!qword_26A533658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A533658);
  }
  return result;
}

unint64_t sub_25BA8FAF4()
{
  unint64_t result = qword_26A533660;
  if (!qword_26A533660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_26A533660);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ReplicatorController.ReplicatorControllerError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for ReplicatorController.ReplicatorControllerError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25BA8FC38);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for ReplicatorController.ReplicatorControllerError()
{
  return &type metadata for ReplicatorController.ReplicatorControllerError;
}

uint64_t initializeBufferWithCopyOfBuffer for ReplicatorController.Change(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  sub_25BA8FCB8(*(void *)a2, v4);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  return a1;
}

uint64_t sub_25BA8FCB8(uint64_t a1, char a2)
{
  if (a2) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for ReplicatorController.Change(uint64_t a1)
{
  return sub_25BA8FCD4(*(void *)a1, *(unsigned char *)(a1 + 8));
}

uint64_t sub_25BA8FCD4(uint64_t a1, char a2)
{
  if (a2) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t assignWithCopy for ReplicatorController.Change(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  sub_25BA8FCB8(*(void *)a2, v4);
  uint64_t v5 = *(void *)a1;
  char v6 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  sub_25BA8FCD4(v5, v6);
  return a1;
}

uint64_t assignWithTake for ReplicatorController.Change(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  char v4 = *((unsigned char *)a2 + 8);
  uint64_t v5 = *(void *)a1;
  char v6 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  sub_25BA8FCD4(v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ReplicatorController.Change(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ReplicatorController.Change(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_25BA8FE00(uint64_t result, char a2)
{
  *(unsigned char *)(result + 8) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ReplicatorController.Change()
{
  return &type metadata for ReplicatorController.Change;
}

uint64_t sub_25BA8FE1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CompanionDevice(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25BA8FE80(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CompanionDevice(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25BA8FEDC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25BA8FEFC(a1, a2, a3, (void *)*v3);
  *unsigned int v3 = result;
  return result;
}

uint64_t sub_25BA8FEFC(char a1, int64_t a2, char a3, void *a4)
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
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A533500);
  uint64_t v10 = *(void *)(type metadata accessor for CompanionDevice(0) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
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
  uint64_t v16 = *(void *)(type metadata accessor for CompanionDevice(0) - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  id v18 = (char *)v13 + v17;
  uint64_t v19 = (char *)a4 + v17;
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
  uint64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_25BAA5490();
  __break(1u);
  return result;
}

uint64_t sub_25BA9013C()
{
  uint64_t v1 = sub_25BAA4DA0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533318);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v5 + v8) & ~v8;
  uint64_t v10 = v3 | v8 | 7;
  unint64_t v11 = (*(void *)(v7 + 64) + v9 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);
  swift_release();
  return MEMORY[0x270FA0238](v0, v11 + 8, v10);
}

uint64_t sub_25BA902A4(void *a1)
{
  uint64_t v3 = *(void *)(sub_25BAA4DA0() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = v4 + *(void *)(v3 + 64);
  uint64_t v6 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A533318) - 8);
  unint64_t v7 = (v5 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = *(void *)(v1 + ((*(void *)(v6 + 64) + v7 + 7) & 0xFFFFFFFFFFFFFFF8));
  return sub_25BA8CA48(a1, v1 + v4, v1 + v7, v8);
}

uint64_t sub_25BA903A8()
{
  uint64_t v1 = sub_25BAA4DA0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533318);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v5 + v8) & ~v8;
  uint64_t v10 = v9 + *(void *)(v7 + 64);
  uint64_t v11 = v3 | v8 | 7;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);
  return MEMORY[0x270FA0238](v0, v10, v11);
}

uint64_t sub_25BA9050C()
{
  uint64_t v2 = *(void *)(sub_25BAA4DA0() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v4 = v3 + *(void *)(v2 + 64);
  uint64_t v5 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A533318) - 8);
  unint64_t v6 = (v4 + *(unsigned __int8 *)(v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = *(void *)(v0 + 32);
  uint64_t v8 = v0 + v3;
  uint64_t v9 = v0 + v6;
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v10;
  *uint64_t v10 = v1;
  v10[1] = sub_25BA79E70;
  return sub_25BA8D07C((uint64_t)v10, v11, v12, v7, v8, v9);
}

uint64_t objectdestroy_16Tm()
{
  uint64_t v1 = sub_25BAA4DA0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_25BA906E0(uint64_t a1, uint64_t *a2)
{
  uint64_t v6 = *(void *)(sub_25BAA4DA0() - 8);
  uint64_t v7 = v2 + ((*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v8;
  *uint64_t v8 = v3;
  v8[1] = sub_25BA78A7C;
  v8[2] = a1;
  uint64_t v9 = *a2;
  v8[3] = v7;
  v8[4] = v9;
  return MEMORY[0x270FA2498](sub_25BA8DC88, 0, 0);
}

uint64_t sub_25BA907D8(uint64_t a1)
{
  return sub_25BA8F748(a1) & 1;
}

uint64_t sub_25BA90808(uint64_t result, unsigned __int8 a2)
{
  if (a2 != 255) {
    return sub_25BA8FCD4(result, a2 & 1);
  }
  return result;
}

uint64_t sub_25BA90820(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_25BA90868(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533340);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25BA908D4(uint64_t a1)
{
  return sub_25BA907D8(a1) & 1;
}

uint64_t sub_25BA908F0(uint64_t a1)
{
  return sub_25BA90A24(a1, qword_26A5360E0);
}

uint64_t sub_25BA9091C()
{
  return sub_25BA90AC0(&qword_26A534B50, (uint64_t)qword_26A5360E0);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_25BA90978(uint64_t a1)
{
  return sub_25BA90A24(a1, qword_26A5360F8);
}

uint64_t sub_25BA90998()
{
  return sub_25BA90AC0(&qword_26A534B58, (uint64_t)qword_26A5360F8);
}

uint64_t sub_25BA909BC(uint64_t a1)
{
  return sub_25BA90A24(a1, qword_26A536110);
}

uint64_t sub_25BA909E0()
{
  return sub_25BA90AC0(&qword_26A534B60, (uint64_t)qword_26A536110);
}

uint64_t sub_25BA90A04(uint64_t a1)
{
  return sub_25BA90A24(a1, qword_26A536128);
}

uint64_t sub_25BA90A24(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_25BAA4F70();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_25BAA4F60();
}

uint64_t sub_25BA90A9C()
{
  return sub_25BA90AC0(qword_26A534B68, (uint64_t)qword_26A536128);
}

uint64_t sub_25BA90AC0(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_25BAA4F70();
  return __swift_project_value_buffer(v3, a2);
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

unint64_t sub_25BA90B78()
{
  unint64_t result = qword_26B34B458;
  if (!qword_26B34B458)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B34B458);
  }
  return result;
}

uint64_t sub_25BA90BB8()
{
  return sub_25BAA5310();
}

uint64_t sub_25BA90BDC()
{
  uint64_t v0 = swift_allocObject();
  sub_25BA90C14();
  return v0;
}

uint64_t sub_25BA90C14()
{
  uint64_t v1 = sub_25BAA5270();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_25BAA52D0();
  MEMORY[0x270FA5388](v5);
  uint64_t v6 = sub_25BAA4FB0();
  MEMORY[0x270FA5388](v6 - 8);
  v8[0] = sub_25BA90B78();
  sub_25BAA4FA0();
  v8[1] = MEMORY[0x263F8EE78];
  sub_25BA95A74(&qword_26B34B450, MEMORY[0x263F8F198]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B34B440);
  sub_25BA76180(&qword_26B34B448, &qword_26B34B440);
  sub_25BAA5360();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F8F138], v1);
  *(void *)(v0 + 16) = sub_25BAA52E0();
  *(void *)(v0 + 24) = -70;
  return v0;
}

uint64_t sub_25BA90E70@<X0>(char a1@<W0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5332D0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_25BAA4DA0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for RapportController.Change();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsigned char *v16 = a1;
  id v17 = objc_msgSend(a2, sel_idsDeviceIdentifier);
  if (!v17)
  {

    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56))(a3, 1, 1, v13);
  }
  id v18 = v17;
  uint64_t v24 = v13;
  uint64_t v25 = a3;
  sub_25BAA5080();

  sub_25BAA4D50();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {

    sub_25BA798DC((uint64_t)v8, &qword_26A5332D0);
    uint64_t v13 = v24;
    a3 = v25;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56))(a3, 1, 1, v13);
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v8, v9);
  uint64_t v20 = v24;
  (*(void (**)(unsigned char *, char *, uint64_t))(v10 + 16))(&v16[*(int *)(v24 + 20)], v12, v9);
  unsigned int v21 = objc_msgSend(a2, sel_proximity);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  char v22 = 0;
  if (v21 == 10)
  {
    uint64_t v23 = v25;
  }
  else
  {
    uint64_t v23 = v25;
    if (v21 != 20)
    {
      if (v21 == 30) {
        char v22 = 1;
      }
      else {
        char v22 = 2;
      }
    }
  }
  v16[*(int *)(v20 + 24)] = v22;
  sub_25BA95ABC((uint64_t)v16, v23);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v14 + 56))(v23, 0, 1, v20);
  return sub_25BA9506C((uint64_t)v16);
}

uint64_t sub_25BA9119C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v85 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533210);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v86 = (char *)&v68 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5336D8);
  uint64_t v79 = *(void *)(v80 - 8);
  MEMORY[0x270FA5388](v80);
  uint64_t v78 = (char *)&v68 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5336E0);
  uint64_t v82 = *(void *)(v84 - 8);
  uint64_t v83 = *(void *)(v82 + 64);
  uint64_t v6 = MEMORY[0x270FA5388](v84);
  long long v81 = (char *)&v68 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  v97 = (char *)&v68 - v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5336E8);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v68 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5336F0);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v95 = *(void *)(v14 + 64);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  id v17 = (char *)&v68 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v68 - v18;
  uint64_t v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5336F8);
  uint64_t v75 = *(void *)(v76 - 8);
  uint64_t v77 = *(void *)(v75 + 64);
  uint64_t v20 = MEMORY[0x270FA5388](v76);
  uint64_t v74 = (char *)&v68 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  uint64_t v96 = (char *)&v68 - v22;
  id v23 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F62BC8]), sel_init);
  id v98 = v23;
  objc_msgSend(v23, sel_setRssiThreshold_, -70);
  objc_msgSend(v23, sel_setDispatchQueue_, *(void *)(v2 + 16));
  type metadata accessor for RapportController.Change();
  unsigned int v72 = *MEMORY[0x263F8F680];
  (*(void (**)(char *))(v10 + 104))(v12);
  uint64_t v99 = v19;
  sub_25BAA51C0();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  uint64_t v93 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
  v93(v17, v19, v13);
  uint64_t v94 = v14 + 16;
  uint64_t v71 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v73 = v14;
  uint64_t v91 = ((v71 + 24) & ~v71) + v95;
  uint64_t v92 = (v71 + 24) & ~v71;
  uint64_t v24 = v92;
  uint64_t v89 = v71 | 7;
  uint64_t v25 = swift_allocObject();
  uint64_t v26 = v2;
  *(void *)(v25 + 16) = v2;
  uint64_t v90 = *(void (**)(uint64_t, char *, uint64_t))(v14 + 32);
  v90(v25 + v24, v17, v13);
  uint64_t v70 = v14 + 32;
  v105 = sub_25BA920C8;
  uint64_t v106 = v25;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v102 = 1107296256;
  uint64_t v88 = &v103;
  v103 = sub_25BA756DC;
  uint64_t v104 = &block_descriptor_0;
  uint64_t v27 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v98, sel_setInterruptionHandler_, v27);
  _Block_release(v27);
  uint64_t v87 = v17;
  uint64_t v28 = v99;
  uint64_t v29 = v13;
  uint64_t v100 = v13;
  id v30 = v93;
  v93(v17, v99, v13);
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = v26;
  uint64_t v69 = v26;
  uint64_t v32 = v92;
  uint64_t v33 = v90;
  v90(v31 + v92, v17, v29);
  v105 = sub_25BA9214C;
  uint64_t v106 = v31;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v102 = 1107296256;
  v103 = sub_25BA9215C;
  uint64_t v104 = &block_descriptor_6;
  uint64_t v34 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  id v35 = v98;
  objc_msgSend(v98, sel_setDeviceFoundHandler_, v34);
  _Block_release(v34);
  uint64_t v36 = v87;
  uint64_t v37 = v100;
  v30(v87, v28, v100);
  uint64_t v38 = swift_allocObject();
  uint64_t v39 = v69;
  *(void *)(v38 + 16) = v69;
  v33(v38 + v32, v36, v37);
  v105 = sub_25BA926F4;
  uint64_t v106 = v38;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v102 = 1107296256;
  v103 = sub_25BA9215C;
  uint64_t v104 = &block_descriptor_12;
  uint64_t v40 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v35, sel_setDeviceLostHandler_, v40);
  _Block_release(v40);
  uint64_t v41 = v87;
  uint64_t v43 = v99;
  uint64_t v42 = v100;
  v30(v87, v99, v100);
  uint64_t v44 = swift_allocObject();
  *(void *)(v44 + 16) = v39;
  uint64_t v45 = v90;
  v90(v44 + v92, v41, v42);
  v105 = sub_25BA92F30;
  uint64_t v106 = v44;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v102 = 1107296256;
  v103 = sub_25BA92FB8;
  uint64_t v104 = &block_descriptor_18;
  uint64_t v46 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  id v47 = v98;
  objc_msgSend(v98, sel_setDeviceChangedHandler_, v46);
  _Block_release(v46);
  v93(v41, v43, v42);
  uint64_t v48 = (v71 + 16) & ~v71;
  uint64_t v49 = swift_allocObject();
  v45(v49 + v48, v41, v42);
  v105 = sub_25BA933F0;
  uint64_t v106 = v49;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v102 = 1107296256;
  v103 = sub_25BA93464;
  uint64_t v104 = &block_descriptor_24;
  uint64_t v50 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v47, sel_activateWithCompletion_, v50);
  _Block_release(v50);
  *(void *)(swift_allocObject() + 16) = v47;
  id v98 = v47;
  sub_25BAA51D0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A533700);
  uint64_t v51 = v79;
  uint64_t v52 = v78;
  uint64_t v53 = v80;
  (*(void (**)(char *, void, uint64_t))(v79 + 104))(v78, v72, v80);
  char v54 = v97;
  sub_25BAA51C0();
  (*(void (**)(char *, uint64_t))(v51 + 8))(v52, v53);
  uint64_t v55 = sub_25BAA5140();
  uint64_t v56 = (uint64_t)v86;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v55 - 8) + 56))(v86, 1, 1, v55);
  uint64_t v57 = v75;
  uint64_t v58 = v74;
  uint64_t v59 = v76;
  (*(void (**)(char *, char *, uint64_t))(v75 + 16))(v74, v96, v76);
  uint64_t v60 = v82;
  uint64_t v61 = v81;
  uint64_t v62 = v84;
  (*(void (**)(char *, char *, uint64_t))(v82 + 16))(v81, v54, v84);
  unint64_t v63 = (*(unsigned __int8 *)(v57 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v57 + 80);
  unint64_t v64 = (v77 + *(unsigned __int8 *)(v60 + 80) + v63) & ~(unint64_t)*(unsigned __int8 *)(v60 + 80);
  uint64_t v65 = swift_allocObject();
  *(void *)(v65 + 16) = 0;
  *(void *)(v65 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v57 + 32))(v65 + v63, v58, v59);
  (*(void (**)(unint64_t, char *, uint64_t))(v60 + 32))(v65 + v64, v61, v62);
  sub_25BA73934(v56, (uint64_t)&unk_26A533710, v65);
  int v66 = v97;
  sub_25BAA51D0();

  (*(void (**)(char *, uint64_t))(v60 + 8))(v66, v62);
  (*(void (**)(char *, uint64_t))(v73 + 8))(v99, v100);
  return (*(uint64_t (**)(char *, uint64_t))(v57 + 8))(v96, v59);
}

uint64_t type metadata accessor for RapportController.Change()
{
  uint64_t result = qword_26A534D70;
  if (!qword_26A534D70) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25BA91E34(uint64_t a1)
{
  uint64_t v2 = sub_25BAA4FF0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (void *)((char *)v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = sub_25BAA4F70();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_25BA90998();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  uint64_t v11 = sub_25BAA4F50();
  os_log_type_t v12 = sub_25BAA5260();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    v19[0] = a1;
    uint64_t v14 = v13;
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_25BA70000, v11, v12, "Interrupted", v13, 2u);
    a1 = v19[0];
    MEMORY[0x26116FA80](v14, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v15 = *(void **)(a1 + 16);
  void *v5 = v15;
  (*(void (**)(void *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F8F0E0], v2);
  id v16 = v15;
  char v17 = sub_25BAA5000();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v3 + 8))(v5, v2);
  if (v17)
  {
    sub_25BA95B20();
    v19[1] = swift_allocError();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5336F0);
    return sub_25BAA5200();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_25BA920C8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5336F0);
  uint64_t v1 = *(void *)(v0 + 16);
  return sub_25BA91E34(v1);
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_25BA9214C(void *a1)
{
  return sub_25BA92704(a1, "Found device: %{public}@", 0);
}

void sub_25BA9215C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_25BA921C4(void *a1, uint64_t a2, uint64_t a3, const char *a4, int a5)
{
  int v49 = a5;
  uint64_t v48 = a4;
  uint64_t v45 = a3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533748);
  uint64_t v44 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v43 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533728);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for RapportController.Change();
  uint64_t v50 = *(void *)(v12 - 8);
  uint64_t v51 = v12;
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v46 = (uint64_t)&v40 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v47 = (uint64_t)&v40 - v15;
  uint64_t v16 = sub_25BAA4FF0();
  uint64_t v55 = *(void *)(v16 - 8);
  uint64_t v56 = v16;
  MEMORY[0x270FA5388](v16);
  char v54 = (uint64_t *)((char *)&v40 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v18 = sub_25BAA4F70();
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v40 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_25BA90998();
  uint64_t v52 = v19;
  uint64_t v53 = v18;
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v21, v22, v18);
  id v23 = a1;
  uint64_t v24 = sub_25BAA4F50();
  os_log_type_t v25 = sub_25BAA5260();
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v40 = a2;
    uint64_t v26 = (uint8_t *)swift_slowAlloc();
    uint64_t v27 = (void *)swift_slowAlloc();
    uint64_t v41 = v11;
    *(_DWORD *)uint64_t v26 = 138543362;
    uint64_t v57 = v23;
    uint64_t v28 = v23;
    uint64_t v42 = v7;
    uint64_t v29 = v28;
    a2 = v40;
    uint64_t v11 = v41;
    sub_25BAA5330();
    id v30 = v23;
    *uint64_t v27 = v23;

    uint64_t v7 = v42;
    _os_log_impl(&dword_25BA70000, v24, v25, v48, v26, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5332C8);
    swift_arrayDestroy();
    MEMORY[0x26116FA80](v27, -1, -1);
    MEMORY[0x26116FA80](v26, -1, -1);
  }
  else
  {

    id v30 = v23;
    uint64_t v24 = v23;
  }

  (*(void (**)(char *, uint64_t))(v52 + 8))(v21, v53);
  uint64_t v31 = *(void **)(a2 + 16);
  uint64_t v33 = v54;
  uint64_t v32 = v55;
  void *v54 = v31;
  uint64_t v34 = v56;
  (*(void (**)(void *, void, uint64_t))(v32 + 104))(v33, *MEMORY[0x263F8F0E0], v56);
  id v35 = v31;
  LOBYTE(v31) = sub_25BAA5000();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v32 + 8))(v33, v34);
  if (v31)
  {
    uint64_t v37 = v30;
    sub_25BA90E70(v49, v37, (uint64_t)v11);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v50 + 48))(v11, 1, v51) == 1)
    {
      return sub_25BA798DC((uint64_t)v11, &qword_26A533728);
    }
    else
    {
      uint64_t v38 = v47;
      sub_25BA95008((uint64_t)v11, v47);
      sub_25BA95ABC(v38, v46);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5336F0);
      uint64_t v39 = v43;
      sub_25BAA51F0();
      (*(void (**)(char *, uint64_t))(v44 + 8))(v39, v7);
      return sub_25BA9506C(v38);
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_25BA926F4(void *a1)
{
  return sub_25BA92704(a1, "Lost device: %{public}@", 2);
}

uint64_t sub_25BA92704(void *a1, const char *a2, int a3)
{
  uint64_t v7 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A5336F0) - 8);
  return sub_25BA921C4(a1, *(void *)(v3 + 16), v3 + ((*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80)), a2, a3);
}

uint64_t sub_25BA92788(void *a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v62 = a4;
  uint64_t v72 = a3;
  int v71 = a2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533748);
  uint64_t v60 = *(void *)(v5 - 8);
  uint64_t v61 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v59 = (char *)&v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533728);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for RapportController.Change();
  uint64_t v68 = *(void *)(v10 - 8);
  uint64_t v69 = v10;
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v57 = (uint64_t)&v53 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v58 = (uint64_t)&v53 - v13;
  uint64_t v14 = sub_25BAA4FF0();
  uint64_t v74 = *(void (**)(char *, uint64_t))(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v73 = (uint64_t *)((char *)&v53 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v16 = sub_25BAA4F70();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v53 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v53 - v21;
  uint64_t v23 = sub_25BA90998();
  uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t))(v17 + 16);
  uint64_t v65 = v23;
  uint64_t v66 = v17 + 16;
  unint64_t v64 = v24;
  ((void (*)(char *))v24)(v22);
  os_log_type_t v25 = a1;
  uint64_t v26 = sub_25BAA4F50();
  os_log_type_t v27 = sub_25BAA5260();
  BOOL v28 = os_log_type_enabled(v26, v27);
  uint64_t v70 = v9;
  unint64_t v63 = v25;
  if (v28)
  {
    uint64_t v29 = swift_slowAlloc();
    uint64_t v56 = v17;
    id v30 = (uint8_t *)v29;
    char v54 = (void *)swift_slowAlloc();
    uint64_t v67 = v16;
    *(_DWORD *)id v30 = 138543362;
    uint64_t v55 = v14;
    uint64_t v75 = v25;
    uint64_t v31 = v25;
    uint64_t v14 = v55;
    uint64_t v16 = v67;
    sub_25BAA5330();
    uint64_t v32 = v54;
    void *v54 = v25;

    _os_log_impl(&dword_25BA70000, v26, v27, "Device changed: %{public}@", v30, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5332C8);
    swift_arrayDestroy();
    MEMORY[0x26116FA80](v32, -1, -1);
    uint64_t v33 = v30;
    uint64_t v17 = v56;
    MEMORY[0x26116FA80](v33, -1, -1);
  }
  else
  {

    uint64_t v26 = v25;
  }

  uint64_t v34 = *(void (**)(char *, uint64_t))(v17 + 8);
  v34(v22, v16);
  id v35 = v73;
  uint64_t v36 = *(void **)(v72 + 16);
  *uint64_t v73 = v36;
  uint64_t v37 = v74;
  (*((void (**)(void *, void, uint64_t))v74 + 13))(v35, *MEMORY[0x263F8F0E0], v14);
  id v38 = v36;
  LOBYTE(v36) = sub_25BAA5000();
  uint64_t result = (*((uint64_t (**)(void *, uint64_t))v37 + 1))(v35, v14);
  if (v36)
  {
    if ((v71 & 0x80) != 0)
    {
      v64(v20, v65, v16);
      uint64_t v40 = v63;
      uint64_t v41 = sub_25BAA4F50();
      os_log_type_t v42 = sub_25BAA5260();
      if (os_log_type_enabled(v41, v42))
      {
        uint64_t v43 = swift_slowAlloc();
        uint64_t v67 = v16;
        uint64_t v44 = (uint8_t *)v43;
        uint64_t v73 = (void *)swift_slowAlloc();
        uint64_t v74 = v34;
        uint64_t v75 = v40;
        *(_DWORD *)uint64_t v44 = 138543362;
        uint64_t v45 = v20;
        uint64_t v46 = v40;
        uint64_t v34 = v74;
        sub_25BAA5330();
        uint64_t v47 = v73;
        *uint64_t v73 = v40;

        uint64_t v20 = v45;
        _os_log_impl(&dword_25BA70000, v41, v42, "Device proximity changed: %{public}@", v44, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A5332C8);
        swift_arrayDestroy();
        MEMORY[0x26116FA80](v47, -1, -1);
        uint64_t v48 = v44;
        uint64_t v16 = v67;
        MEMORY[0x26116FA80](v48, -1, -1);
      }
      else
      {

        uint64_t v41 = v40;
      }

      v34(v20, v16);
      int v49 = v40;
      uint64_t v50 = (uint64_t)v70;
      sub_25BA90E70(1, v49, (uint64_t)v70);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v68 + 48))(v50, 1, v69) == 1)
      {
        return sub_25BA798DC(v50, &qword_26A533728);
      }
      else
      {
        uint64_t v51 = v58;
        sub_25BA95008(v50, v58);
        sub_25BA95ABC(v51, v57);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A5336F0);
        uint64_t v52 = v59;
        sub_25BAA51F0();
        (*(void (**)(char *, uint64_t))(v60 + 8))(v52, v61);
        return sub_25BA9506C(v51);
      }
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t objectdestroyTm_1()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5336F0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_25BA92F30(void *a1, int a2)
{
  uint64_t v5 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A5336F0) - 8);
  uint64_t v6 = *(void *)(v2 + 16);
  uint64_t v7 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  return sub_25BA92788(a1, a2, v6, v7);
}

void sub_25BA92FB8(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_25BA9302C(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_25BAA4F70();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v28 - v9;
  if (a1)
  {
    id v11 = a1;
    uint64_t v12 = sub_25BA90998();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v12, v4);
    id v13 = a1;
    id v14 = a1;
    uint64_t v15 = sub_25BAA4F50();
    os_log_type_t v16 = sub_25BAA5250();
    if (os_log_type_enabled(v15, v16))
    {
      v28[1] = a2;
      uint64_t v17 = swift_slowAlloc();
      uint64_t v29 = v4;
      uint64_t v18 = (uint8_t *)v17;
      uint64_t v19 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v18 = 138543362;
      id v20 = a1;
      uint64_t v21 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v30 = v21;
      sub_25BAA5330();
      *uint64_t v19 = v21;

      _os_log_impl(&dword_25BA70000, v15, v16, "Activation failed: %{public}@", v18, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5332C8);
      swift_arrayDestroy();
      MEMORY[0x26116FA80](v19, -1, -1);
      uint64_t v22 = v18;
      uint64_t v4 = v29;
      MEMORY[0x26116FA80](v22, -1, -1);
    }
    else
    {
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    uint64_t v30 = (uint64_t)a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5336F0);
    return sub_25BAA5200();
  }
  else
  {
    uint64_t v23 = sub_25BA90998();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v10, v23, v4);
    uint64_t v24 = sub_25BAA4F50();
    os_log_type_t v25 = sub_25BAA5260();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v26 = 0;
      _os_log_impl(&dword_25BA70000, v24, v25, "Activation finished", v26, 2u);
      MEMORY[0x26116FA80](v26, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  }
}

uint64_t sub_25BA9335C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5336F0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_25BA933F0(void *a1)
{
  uint64_t v3 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A5336F0) - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return sub_25BA9302C(a1, v4);
}

void sub_25BA93464(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

id sub_25BA934D0(void *a1)
{
  uint64_t v2 = sub_25BAA4F70();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25BA90998();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  uint64_t v7 = sub_25BAA4F50();
  os_log_type_t v8 = sub_25BAA5260();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_25BA70000, v7, v8, "Change accumulator terminated", v9, 2u);
    MEMORY[0x26116FA80](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return objc_msgSend(a1, sel_invalidate);
}

uint64_t sub_25BA9363C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_25BA93674()
{
  return sub_25BA934D0(*(void **)(v0 + 16));
}

uint64_t sub_25BA9367C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[18] = a4;
  v5[19] = a5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533720);
  v5[20] = v6;
  v5[21] = *(void *)(v6 - 8);
  v5[22] = swift_task_alloc();
  uint64_t v7 = sub_25BAA4DA0();
  v5[23] = v7;
  v5[24] = *(void *)(v7 - 8);
  v5[25] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for RapportController.Change();
  v5[26] = v8;
  v5[27] = *(void *)(v8 - 8);
  v5[28] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A533728);
  v5[29] = swift_task_alloc();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533730);
  v5[30] = v9;
  v5[31] = *(void *)(v9 - 8);
  v5[32] = swift_task_alloc();
  uint64_t v10 = sub_25BAA4F70();
  v5[33] = v10;
  v5[34] = *(void *)(v10 - 8);
  v5[35] = swift_task_alloc();
  v5[36] = swift_task_alloc();
  v5[37] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25BA93900, 0, 0);
}

uint64_t sub_25BA93900()
{
  v0[13] = MEMORY[0x263F8EE80];
  uint64_t v1 = v0[37];
  uint64_t v2 = v0[33];
  uint64_t v3 = v0[34];
  uint64_t v4 = sub_25BA90998();
  v0[38] = v4;
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v0[39] = v5;
  v0[40] = (v3 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v5(v1, v4, v2);
  uint64_t v6 = sub_25BAA4F50();
  os_log_type_t v7 = sub_25BAA5260();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_25BA70000, v6, v7, "Will wait for changes", v8, 2u);
    MEMORY[0x26116FA80](v8, -1, -1);
  }
  uint64_t v9 = v0[37];
  uint64_t v10 = v0[33];
  uint64_t v11 = v0[34];

  uint64_t v12 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
  v0[41] = v12;
  v0[42] = (v11 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v12(v9, v10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5336F8);
  sub_25BAA5180();
  swift_beginAccess();
  id v13 = (void *)swift_task_alloc();
  v0[43] = v13;
  void *v13 = v0;
  v13[1] = sub_25BA93AE0;
  uint64_t v14 = v0[29];
  uint64_t v15 = v0[30];
  return MEMORY[0x270FA20F8](v14, 0, 0, v15, v0 + 16);
}

uint64_t sub_25BA93AE0()
{
  swift_task_dealloc();
  if (v0) {
    uint64_t v1 = sub_25BA9420C;
  }
  else {
    uint64_t v1 = sub_25BA93BF0;
  }
  return MEMORY[0x270FA2498](v1, 0, 0);
}

uint64_t sub_25BA93BF0()
{
  uint64_t v62 = v0;
  uint64_t v1 = *(void *)(v0 + 232);
  uint64_t v2 = *(void *)(v0 + 208);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 216) + 48))(v1, 1, v2) == 1)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 248) + 8))(*(void *)(v0 + 256), *(void *)(v0 + 240));
    swift_bridgeObjectRelease();
    swift_task_dealloc();
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
  uint64_t v5 = (uint64_t *)(v0 + 104);
  uint64_t v6 = *(unsigned __int8 **)(v0 + 224);
  sub_25BA95008(v1, (uint64_t)v6);
  uint64_t v7 = (uint64_t)&v6[*(int *)(v2 + 20)];
  if (*v6 > 1u)
  {
    swift_beginAccess();
    swift_bridgeObjectRetain();
    unint64_t v9 = sub_25BA77164(v7);
    char v25 = v24;
    swift_bridgeObjectRelease();
    if ((v25 & 1) == 0) {
      goto LABEL_23;
    }
    uint64_t v14 = (uint64_t *)(v0 + 120);
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v27 = *v5;
    *(void *)(v0 + 120) = *v5;
    uint64_t *v5 = 0x8000000000000000;
    if (isUniquelyReferenced_nonNull_native) {
      goto LABEL_14;
    }
    goto LABEL_30;
  }
  uint64_t v8 = *(void *)(v0 + 224);
  unint64_t v9 = *(void *)(v0 + 200);
  uint64_t v10 = *(void *)(v0 + 208);
  uint64_t v11 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v0 + 192) + 16);
  v11(v9, v7, *(void *)(v0 + 184));
  char v12 = *(unsigned char *)(v8 + *(int *)(v10 + 24));
  swift_beginAccess();
  int v13 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v14 = *(uint64_t **)(v0 + 104);
  *(void *)(v0 + 136) = v14;
  *(void *)(v0 + 104) = 0x8000000000000000;
  unint64_t v16 = sub_25BA77164(v9);
  uint64_t v17 = v14[2];
  BOOL v18 = (v15 & 1) == 0;
  uint64_t v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
LABEL_30:
    sub_25BA957E4();
    uint64_t v27 = *v14;
LABEL_14:
    (*(void (**)(unint64_t, void))(*(void *)(v0 + 192) + 8))(*(void *)(v27 + 48) + *(void *)(*(void *)(v0 + 192) + 72) * v9, *(void *)(v0 + 184));
    uint64_t v28 = *(void *)(v0 + 120);
    sub_25BA954EC(v9, v28);
    *(void *)(v0 + 104) = v28;
    swift_bridgeObjectRelease();
    goto LABEL_23;
  }
  char v20 = v15;
  if (v14[3] >= v19)
  {
    if ((v13 & 1) == 0) {
      sub_25BA957E4();
    }
    goto LABEL_18;
  }
  uint64_t v21 = *(void *)(v0 + 200);
  sub_25BA950C8(v19, v13);
  unint64_t v22 = sub_25BA77164(v21);
  if ((v20 & 1) == (v23 & 1))
  {
    unint64_t v16 = v22;
LABEL_18:
    uint64_t v29 = *(void **)(v0 + 136);
    if (v20)
    {
      *(unsigned char *)(v29[7] + v16) = v12;
    }
    else
    {
      uint64_t v31 = *(void *)(v0 + 192);
      uint64_t v30 = *(void *)(v0 + 200);
      uint64_t v32 = *(void *)(v0 + 184);
      v29[(v16 >> 6) + 8] |= 1 << v16;
      uint64_t v33 = v11(v29[6] + *(void *)(v31 + 72) * v16, v30, v32);
      *(unsigned char *)(v29[7] + v16) = v12;
      uint64_t v38 = v29[2];
      BOOL v39 = __OFADD__(v38, 1);
      uint64_t v40 = v38 + 1;
      if (v39)
      {
        __break(1u);
        return MEMORY[0x270FA20F8](v33, v34, v35, v36, v37);
      }
      v29[2] = v40;
    }
    uint64_t v42 = *(void *)(v0 + 192);
    uint64_t v41 = *(void *)(v0 + 200);
    uint64_t v43 = *(void *)(v0 + 184);
    *(void *)(v0 + 104) = v29;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v41, v43);
LABEL_23:
    swift_endAccess();
    (*(void (**)(void, void, void))(v0 + 312))(*(void *)(v0 + 288), *(void *)(v0 + 304), *(void *)(v0 + 264));
    uint64_t v44 = sub_25BAA4F50();
    os_log_type_t v45 = sub_25BAA5260();
    BOOL v46 = os_log_type_enabled(v44, v45);
    uint64_t v47 = *(void (**)(uint64_t, uint64_t))(v0 + 328);
    uint64_t v48 = *(void *)(v0 + 288);
    uint64_t v49 = *(void *)(v0 + 264);
    if (v46)
    {
      uint64_t v50 = swift_slowAlloc();
      uint64_t v60 = v47;
      uint64_t v51 = swift_slowAlloc();
      uint64_t v61 = v51;
      *(_DWORD *)uint64_t v50 = 136315138;
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A533738);
      sub_25BA95A74(&qword_26A5332E0, MEMORY[0x263F07508]);
      uint64_t v52 = sub_25BAA5010();
      unint64_t v54 = v53;
      swift_bridgeObjectRelease();
      *(void *)(v50 + 4) = sub_25BA76934(v52, v54, &v61);
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25BA70000, v44, v45, "Producing snapshot: %s", (uint8_t *)v50, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x26116FA80](v51, -1, -1);
      MEMORY[0x26116FA80](v50, -1, -1);

      v60(v48, v49);
    }
    else
    {

      v47(v48, v49);
    }
    uint64_t v55 = *(void *)(v0 + 224);
    uint64_t v57 = *(void *)(v0 + 168);
    uint64_t v56 = *(void *)(v0 + 176);
    uint64_t v58 = *(void *)(v0 + 160);
    *(void *)(v0 + 112) = *(void *)(v0 + 104);
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5336E0);
    sub_25BAA51F0();
    (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v56, v58);
    sub_25BA9506C(v55);
    uint64_t v59 = (void *)swift_task_alloc();
    *(void *)(v0 + 344) = v59;
    void *v59 = v0;
    v59[1] = sub_25BA93AE0;
    uint64_t v33 = *(void *)(v0 + 232);
    uint64_t v36 = *(void *)(v0 + 240);
    uint64_t v34 = 0;
    uint64_t v35 = 0;
    uint64_t v37 = v0 + 128;
    return MEMORY[0x270FA20F8](v33, v34, v35, v36, v37);
  }
  return sub_25BAA55A0();
}

uint64_t sub_25BA9420C()
{
  uint64_t v1 = (void (*)(uint64_t, uint64_t, uint64_t))v0[39];
  uint64_t v2 = v0[38];
  uint64_t v3 = v0[35];
  uint64_t v4 = v0[33];
  (*(void (**)(void, void))(v0[31] + 8))(v0[32], v0[30]);
  swift_bridgeObjectRelease();
  uint64_t v5 = (void *)v0[16];
  v1(v3, v2, v4);
  id v6 = v5;
  id v7 = v5;
  uint64_t v8 = sub_25BAA4F50();
  os_log_type_t v9 = sub_25BAA5250();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 138543362;
    id v12 = v5;
    uint64_t v13 = _swift_stdlib_bridgeErrorToNSError();
    v0[12] = v13;
    sub_25BAA5330();
    void *v11 = v13;

    _os_log_impl(&dword_25BA70000, v8, v9, "Throwing error: %{public}@", v10, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5332C8);
    swift_arrayDestroy();
    MEMORY[0x26116FA80](v11, -1, -1);
    MEMORY[0x26116FA80](v10, -1, -1);
  }
  else
  {
  }
  uint64_t v14 = (void (*)(uint64_t, uint64_t))v0[41];
  uint64_t v15 = v0[35];
  uint64_t v16 = v0[33];

  v14(v15, v16);
  v0[11] = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5336E0);
  sub_25BAA5200();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v17 = (uint64_t (*)(void))v0[1];
  return v17();
}

uint64_t sub_25BA9447C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5336F8);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5336E0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v4 + v5 + v8) & ~v8;
  uint64_t v10 = v9 + *(void *)(v7 + 64);
  uint64_t v11 = v3 | v8 | 7;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);
  return MEMORY[0x270FA0238](v0, v10, v11);
}

uint64_t sub_25BA945DC()
{
  uint64_t v2 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A5336F8) - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v2 + 64);
  uint64_t v5 = *(unsigned __int8 *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A5336E0) - 8) + 80);
  unint64_t v6 = v3 + v4 + v5;
  uint64_t v7 = v0 + v3;
  uint64_t v8 = v0 + (v6 & ~v5);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v9;
  *uint64_t v9 = v1;
  v9[1] = sub_25BA78A7C;
  return sub_25BA9367C((uint64_t)v9, v10, v11, v7, v8);
}

uint64_t sub_25BA94718()
{
  uint64_t v0 = sub_25BAA4F70();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  unint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_25BA90998();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  uint64_t v5 = sub_25BAA4F50();
  os_log_type_t v6 = sub_25BAA5260();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_25BA70000, v5, v6, "Result terminated", v7, 2u);
    MEMORY[0x26116FA80](v7, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return sub_25BAA51A0();
}

uint64_t sub_25BA94898()
{
  return sub_25BA94718();
}

uint64_t sub_25BA948A0()
{
  return MEMORY[0x270FA0228](v0, 32, 7);
}

unint64_t sub_25BA948DC()
{
  unint64_t result = qword_26A533718;
  if (!qword_26A533718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A533718);
  }
  return result;
}

uint64_t sub_25BA94930()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

unsigned char *storeEnumTagSinglePayload for RapportControllerError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25BA949F0);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for RapportControllerError()
{
  return &type metadata for RapportControllerError;
}

uint64_t type metadata accessor for RapportController()
{
  return self;
}

void *sub_25BA94A4C(unsigned char *a1, void *a2, uint64_t a3)
{
  unsigned int v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *unsigned int v4 = *a2;
    unsigned int v4 = (void *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *(unsigned char *)a2;
    uint64_t v7 = *(int *)(a3 + 20);
    uint64_t v8 = &a1[v7];
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_25BAA4DA0();
    (*(void (**)(unsigned char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    *((unsigned char *)v4 + *(int *)(a3 + 24)) = *((unsigned char *)a2 + *(int *)(a3 + 24));
  }
  return v4;
}

uint64_t sub_25BA94B34(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  uint64_t v3 = sub_25BAA4DA0();
  unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
  return v4(v2, v3);
}

unsigned char *sub_25BA94B9C(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_25BAA4DA0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  a1[*(int *)(a3 + 24)] = a2[*(int *)(a3 + 24)];
  return a1;
}

unsigned char *sub_25BA94C34(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_25BAA4DA0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  a1[*(int *)(a3 + 24)] = a2[*(int *)(a3 + 24)];
  return a1;
}

unsigned char *sub_25BA94CCC(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_25BAA4DA0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  a1[*(int *)(a3 + 24)] = a2[*(int *)(a3 + 24)];
  return a1;
}

unsigned char *sub_25BA94D64(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_25BAA4DA0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  a1[*(int *)(a3 + 24)] = a2[*(int *)(a3 + 24)];
  return a1;
}

uint64_t sub_25BA94DFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25BA94E10);
}

uint64_t sub_25BA94E10(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 253)
  {
    unsigned int v4 = *a1;
    if (v4 >= 3) {
      return v4 - 2;
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v8 = sub_25BAA4DA0();
    uint64_t v9 = *(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = &a1[*(int *)(a3 + 20)];
    return v9(v11, a2, v10);
  }
}

uint64_t sub_25BA94EB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25BA94ECC);
}

unsigned char *sub_25BA94ECC(unsigned char *result, uint64_t a2, int a3, uint64_t a4)
{
  int v5 = result;
  if (a3 == 253)
  {
    *unint64_t result = a2 + 2;
  }
  else
  {
    uint64_t v7 = sub_25BAA4DA0();
    uint64_t v8 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = &v5[*(int *)(a4 + 20)];
    return (unsigned char *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_25BA94F70()
{
  uint64_t result = sub_25BAA4DA0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_25BA95008(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RapportController.Change();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25BA9506C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for RapportController.Change();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25BA950C8(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_25BAA4DA0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A533740);
  int v42 = a2;
  uint64_t v10 = sub_25BAA5470();
  uint64_t v11 = v10;
  if (*(void *)(v9 + 16))
  {
    uint64_t v37 = v2;
    uint64_t v12 = 1 << *(unsigned char *)(v9 + 32);
    uint64_t v13 = *(void *)(v9 + 64);
    BOOL v39 = (void *)(v9 + 64);
    if (v12 < 64) {
      uint64_t v14 = ~(-1 << v12);
    }
    else {
      uint64_t v14 = -1;
    }
    unint64_t v15 = v14 & v13;
    int64_t v38 = (unint64_t)(v12 + 63) >> 6;
    uint64_t v40 = (void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    uint64_t v43 = (void (**)(char *, unint64_t, uint64_t))(v6 + 32);
    uint64_t v16 = v10 + 64;
    uint64_t result = swift_retain();
    int64_t v18 = 0;
    uint64_t v44 = v5;
    for (i = v6; ; uint64_t v6 = i)
    {
      if (v15)
      {
        unint64_t v20 = __clz(__rbit64(v15));
        v15 &= v15 - 1;
        unint64_t v21 = v20 | (v18 << 6);
      }
      else
      {
        int64_t v22 = v18 + 1;
        if (__OFADD__(v18, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v22 >= v38) {
          goto LABEL_34;
        }
        unint64_t v23 = v39[v22];
        ++v18;
        if (!v23)
        {
          int64_t v18 = v22 + 1;
          if (v22 + 1 >= v38) {
            goto LABEL_34;
          }
          unint64_t v23 = v39[v18];
          if (!v23)
          {
            int64_t v24 = v22 + 2;
            if (v24 >= v38)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v37;
              if (v42)
              {
                uint64_t v36 = 1 << *(unsigned char *)(v9 + 32);
                if (v36 >= 64) {
                  bzero(v39, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v39 = -1 << v36;
                }
                *(void *)(v9 + 16) = 0;
              }
              break;
            }
            unint64_t v23 = v39[v24];
            if (!v23)
            {
              while (1)
              {
                int64_t v18 = v24 + 1;
                if (__OFADD__(v24, 1)) {
                  goto LABEL_41;
                }
                if (v18 >= v38) {
                  goto LABEL_34;
                }
                unint64_t v23 = v39[v18];
                ++v24;
                if (v23) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v18 = v24;
          }
        }
LABEL_21:
        unint64_t v15 = (v23 - 1) & v23;
        unint64_t v21 = __clz(__rbit64(v23)) + (v18 << 6);
      }
      uint64_t v25 = *(void *)(v6 + 72);
      unint64_t v26 = *(void *)(v9 + 48) + v25 * v21;
      if (v42) {
        (*v43)(v8, v26, v44);
      }
      else {
        (*v40)(v8, v26, v44);
      }
      uint64_t v27 = v9;
      char v28 = *(unsigned char *)(*(void *)(v9 + 56) + v21);
      sub_25BA95A74(&qword_26A5332E0, MEMORY[0x263F07508]);
      uint64_t result = sub_25BAA5020();
      uint64_t v29 = -1 << *(unsigned char *)(v11 + 32);
      unint64_t v30 = result & ~v29;
      unint64_t v31 = v30 >> 6;
      if (((-1 << v30) & ~*(void *)(v16 + 8 * (v30 >> 6))) != 0)
      {
        unint64_t v19 = __clz(__rbit64((-1 << v30) & ~*(void *)(v16 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
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
          uint64_t v35 = *(void *)(v16 + 8 * v31);
        }
        while (v35 == -1);
        unint64_t v19 = __clz(__rbit64(~v35)) + (v31 << 6);
      }
      *(void *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v43)(*(void *)(v11 + 48) + v25 * v19, v8, v44);
      *(unsigned char *)(*(void *)(v11 + 56) + v19) = v28;
      ++*(void *)(v11 + 16);
      uint64_t v9 = v27;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v11;
  return result;
}

unint64_t sub_25BA954EC(int64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25BAA4DA0();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(void *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    uint64_t v11 = ~v9;
    uint64_t v34 = a2 + 64;
    unint64_t result = sub_25BAA5370();
    uint64_t v12 = v34;
    if ((*(void *)(v34 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      unint64_t v31 = (result + 1) & v11;
      char v32 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      uint64_t v33 = v5 + 16;
      uint64_t v13 = (uint64_t (**)(char *, uint64_t))(v5 + 8);
      uint64_t v14 = *(void *)(v5 + 72);
      do
      {
        uint64_t v15 = v14;
        int64_t v16 = v14 * v10;
        v32(v8, *(void *)(a2 + 48) + v14 * v10, v4);
        sub_25BA95A74(&qword_26A5332E0, MEMORY[0x263F07508]);
        uint64_t v17 = sub_25BAA5020();
        unint64_t result = (*v13)(v8, v4);
        unint64_t v18 = v17 & v11;
        if (a1 >= (uint64_t)v31)
        {
          if (v18 >= v31 && a1 >= (uint64_t)v18)
          {
LABEL_16:
            uint64_t v21 = *(void *)(a2 + 48);
            uint64_t v14 = v15;
            unint64_t result = v21 + v15 * a1;
            if (v15 * a1 < v16 || result >= v21 + v16 + v15)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
            }
            else if (v15 * a1 != v16)
            {
              unint64_t result = swift_arrayInitWithTakeBackToFront();
            }
            uint64_t v22 = *(void *)(a2 + 56);
            unint64_t v23 = (unsigned char *)(v22 + a1);
            int64_t v24 = (unsigned char *)(v22 + v10);
            uint64_t v12 = v34;
            if (a1 != v10 || (a1 = v10, v23 >= v24 + 1))
            {
              unsigned char *v23 = *v24;
              a1 = v10;
            }
            goto LABEL_5;
          }
        }
        else if (v18 >= v31 || a1 >= (uint64_t)v18)
        {
          goto LABEL_16;
        }
        uint64_t v12 = v34;
        uint64_t v14 = v15;
LABEL_5:
        unint64_t v10 = (v10 + 1) & v11;
      }
      while (((*(void *)(v12 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    uint64_t v25 = (uint64_t *)(v12 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v26 = *v25;
    uint64_t v27 = (-1 << a1) - 1;
  }
  else
  {
    uint64_t v25 = (uint64_t *)(a2 + 64 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v27 = *v25;
    uint64_t v26 = (-1 << a1) - 1;
  }
  uint64_t *v25 = v27 & v26;
  uint64_t v28 = *(void *)(a2 + 16);
  BOOL v29 = __OFSUB__(v28, 1);
  uint64_t v30 = v28 - 1;
  if (v29)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v30;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void *sub_25BA957E4()
{
  uint64_t v1 = sub_25BAA4DA0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A533740);
  uint64_t v22 = v0;
  uint64_t v5 = *v0;
  uint64_t v6 = sub_25BAA5460();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
LABEL_23:
    unint64_t result = (void *)swift_release();
    *uint64_t v22 = v7;
    return result;
  }
  unint64_t result = (void *)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    unint64_t result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  uint64_t v23 = v5 + 64;
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v5 + 64);
  uint64_t v26 = v2 + 16;
  int64_t v24 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v25 = v2 + 32;
  while (1)
  {
    if (v13)
    {
      unint64_t v14 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v15 = v14 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v18 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v18 >= v24) {
      goto LABEL_23;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v18);
    ++v10;
    if (!v19)
    {
      int64_t v10 = v18 + 1;
      if (v18 + 1 >= v24) {
        goto LABEL_23;
      }
      unint64_t v19 = *(void *)(v23 + 8 * v10);
      if (!v19) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v10 << 6);
LABEL_9:
    unint64_t v16 = *(void *)(v2 + 72) * v15;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(void *)(v5 + 48) + v16, v1);
    char v17 = *(unsigned char *)(*(void *)(v5 + 56) + v15);
    unint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(void *)(v7 + 48) + v16, v4, v1);
    *(unsigned char *)(*(void *)(v7 + 56) + v15) = v17;
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v24) {
    goto LABEL_23;
  }
  unint64_t v19 = *(void *)(v23 + 8 * v20);
  if (v19)
  {
    int64_t v10 = v20;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v10 >= v24) {
      goto LABEL_23;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v10);
    ++v20;
    if (v19) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_25BA95A74(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25BA95ABC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RapportController.Change();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_25BA95B20()
{
  unint64_t result = qword_26A533750;
  if (!qword_26A533750)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A533750);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for RapportController.Change.Kind(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25BA95C40);
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

ValueMetadata *type metadata accessor for RapportController.Change.Kind()
{
  return &type metadata for RapportController.Change.Kind;
}

unint64_t sub_25BA95C7C()
{
  unint64_t result = qword_26A534D80[0];
  if (!qword_26A534D80[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A534D80);
  }
  return result;
}

uint64_t sub_25BA95CF0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (void *)(*(uint64_t (**)(void))(a2 + 16))();
  uint64_t v3 = sub_25BAA5310();

  return v3;
}

uint64_t sub_25BA95D44(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v21 = a2;
  uint64_t v22 = a4;
  int v12 = a3 & 1;
  uint64_t v13 = sub_25BAA4FE0();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  unint64_t v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v17 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a7 + 16))(a6, a7);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, a1, v13);
  uint64_t v18 = *(void *)(a7 + 8);
  swift_unknownObjectRetain();
  swift_retain();
  uint64_t v19 = sub_25BA968F8(v17, v7, (uint64_t)v16, v21, v12, v22, a5, a6, v18);

  swift_unknownObjectRelease();
  swift_release();
  return v19;
}

id sub_25BA95EAC(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  int v12 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a6 + 16))(a5, a6);
  uint64_t v13 = *(void *)(a6 + 8);
  uint64_t v14 = (objc_class *)MEMORY[0x263F08A48];
  swift_unknownObjectRetain();
  id v15 = a1;
  id v16 = a2;
  swift_retain();
  id v17 = objc_msgSend(objc_allocWithZone(v14), sel_init);
  id v18 = v15;
  objc_msgSend(v17, sel_setUnderlyingQueue_, v12);
  uint64_t v19 = swift_allocObject();
  swift_unknownObjectWeakInit();
  int64_t v20 = (void *)swift_allocObject();
  void v20[2] = a5;
  v20[3] = v13;
  void v20[4] = v19;
  v20[5] = v12;
  v20[6] = a3;
  v20[7] = a4;
  v26[4] = sub_25BA971C8;
  v26[5] = v20;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 1107296256;
  v26[2] = sub_25BA966F8;
  v26[3] = &block_descriptor_1;
  uint64_t v21 = _Block_copy(v26);
  id v22 = v16;
  id v23 = v17;
  id v24 = v12;
  swift_retain();
  swift_release();
  objc_msgSend(v18, sel_addObserverForName_object_queue_usingBlock_, v22, 0, v23, v21);
  swift_release();

  swift_unknownObjectRelease();
  _Block_release(v21);

  return v18;
}

uint64_t sub_25BA960C0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = sub_25BAA4FF0();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (uint64_t *)((char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_beginAccess();
  uint64_t result = MEMORY[0x26116FB40](a1 + 16);
  if (result)
  {
    *uint64_t v14 = a2;
    (*(void (**)(void *, void, uint64_t))(v12 + 104))(v14, *MEMORY[0x263F8F0E0], v11);
    id v16 = a2;
    char v17 = sub_25BAA5000();
    uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v12 + 8))(v14, v11);
    if (v17)
    {
      MEMORY[0x270FA5388](result);
      *(&v19 - 4) = a5;
      *(&v19 - 3) = a6;
      uint64_t v18 = a4;
      sub_25BA9629C((uint64_t)sub_25BA973C0, (uint64_t)(&v19 - 6), (uint64_t)"ScreenContinuityServices/QueueIsolatedActor.swift", 49, 2, 70, a5, MEMORY[0x263F8EE60] + 8, a6);
      return swift_unknownObjectRelease();
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_25BA9629C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_25BAA50E0();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    goto LABEL_6;
  }
  id v15 = (void *)swift_allocObject();
  v15[2] = a7;
  v15[3] = a8;
  v15[4] = a9;
  v15[5] = a1;
  v15[6] = a2;
  sub_25BA96848((uint64_t)sub_25BA97200, (uint64_t)v15, v9, a7, a8, a9);
  if (v10) {
    return swift_release();
  }
  int isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation)
  {
    __break(1u);
LABEL_6:
    sub_25BAA53D0();
    sub_25BAA50B0();
    sub_25BAA5560();
    sub_25BAA50B0();
    uint64_t result = sub_25BAA5450();
    __break(1u);
  }
  return result;
}

uint64_t sub_25BA96454()
{
  return sub_25BAA5360();
}

uint64_t sub_25BA9651C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = sub_25BAA4FF0();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (uint64_t *)((char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_beginAccess();
  uint64_t result = MEMORY[0x26116FB40](a1 + 16);
  if (result)
  {
    *uint64_t v14 = a2;
    (*(void (**)(void *, void, uint64_t))(v12 + 104))(v14, *MEMORY[0x263F8F0E0], v11);
    id v16 = a2;
    char v17 = sub_25BAA5000();
    uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v12 + 8))(v14, v11);
    if (v17)
    {
      MEMORY[0x270FA5388](result);
      *(&v19 - 4) = a5;
      *(&v19 - 3) = a6;
      uint64_t v18 = a4;
      sub_25BA9629C((uint64_t)sub_25BA97428, (uint64_t)(&v19 - 6), (uint64_t)"ScreenContinuityServices/QueueIsolatedActor.swift", 49, 2, 120, a5, MEMORY[0x263F8EE60] + 8, a6);
      return swift_unknownObjectRelease();
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_25BA966F8(uint64_t a1)
{
  uint64_t v2 = sub_25BAA4C00();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsigned int v6 = *(void (**)(char *))(a1 + 32);
  sub_25BAA4BF0();
  swift_retain();
  v6(v5);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

void sub_25BA967EC(void *a1, void *a2)
{
  objc_msgSend(a1, sel_removeObserver_);
  swift_unknownObjectRelease();
}

uint64_t sub_25BA96848(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = a4;
  uint64_t v12[3] = a5;
  v12[4] = a6;
  v12[5] = a1;
  v12[6] = a2;
  swift_retain();
  uint64_t v14 = a3;
  sub_25BA97260(&v14);
  return swift_release();
}

uint64_t sub_25BA968F8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v53 = a8;
  uint64_t v54 = a6;
  uint64_t v55 = a7;
  int v59 = a5;
  double v48 = *(double *)&a4;
  uint64_t v63 = a3;
  uint64_t v51 = a2;
  uint64_t v50 = a1;
  uint64_t v52 = a9;
  uint64_t v9 = sub_25BAA4F80();
  uint64_t v61 = *(void *)(v9 - 8);
  uint64_t v62 = v9;
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v49 = (uint64_t *)((char *)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v10);
  uint64_t v60 = (uint64_t *)((char *)&v47 - v12);
  uint64_t v13 = sub_25BAA4F90();
  uint64_t v57 = *(void *)(v13 - 8);
  uint64_t v58 = v13;
  MEMORY[0x270FA5388](v13);
  id v15 = (char *)&v47 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = sub_25BAA4FB0();
  uint64_t v16 = *(void *)(v56 - 8);
  MEMORY[0x270FA5388](v56);
  uint64_t v18 = (char *)&v47 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_25BAA5280();
  uint64_t v20 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  id v22 = (char *)&v47 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25BA9728C();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_25BA97328(&qword_26A533828, MEMORY[0x263F8F148]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A533830);
  sub_25BA97370(&qword_26A533838, &qword_26A533830);
  sub_25BAA5360();
  id v23 = v50;
  uint64_t v24 = sub_25BAA5290();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
  swift_getObjectType();
  uint64_t v25 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v26 = (void *)swift_allocObject();
  uint64_t v27 = v52;
  v26[2] = v53;
  v26[3] = v27;
  v26[4] = v25;
  v26[5] = v23;
  uint64_t v28 = v23;
  uint64_t v29 = v55;
  void v26[6] = v54;
  v26[7] = v29;
  aBlock[4] = sub_25BA97318;
  aBlock[5] = v26;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_25BA756DC;
  aBlock[3] = &block_descriptor_21;
  uint64_t v30 = _Block_copy(aBlock);
  swift_unknownObjectRetain();
  swift_retain();
  id v31 = v28;
  swift_retain();
  sub_25BAA4FA0();
  sub_25BA96454();
  sub_25BAA52A0();
  _Block_release(v30);
  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v57 + 8))(v15, v58);
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v56);
  swift_release();
  swift_release();
  if (v59)
  {
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v40 = v60;
    uint64_t v39 = v61;
    uint64_t v41 = *(void (**)(void *, void, uint64_t))(v61 + 104);
    uint64_t v42 = v62;
    v41(v60, *MEMORY[0x263F8F010], v62);
    uint64_t v43 = v49;
    void *v49 = 0;
    v41(v43, *MEMORY[0x263F8EFE0], v42);
    swift_unknownObjectRetain();
    uint64_t v37 = v63;
    MEMORY[0x26116F1C0](v63, v40, v43, ObjectType);
    swift_unknownObjectRelease();
    uint64_t v44 = *(void (**)(void *, uint64_t))(v39 + 8);
    v44(v43, v42);
    v44(v40, v42);
  }
  else
  {
    double v32 = v48;
    uint64_t v33 = swift_getObjectType();
    uint64_t v35 = v60;
    uint64_t v34 = v61;
    *uint64_t v60 = 0;
    uint64_t v36 = v62;
    (*(void (**)(void *, void, uint64_t))(v34 + 104))(v35, *MEMORY[0x263F8EFE0], v62);
    swift_unknownObjectRetain();
    uint64_t v37 = v63;
    MEMORY[0x26116F1D0](v63, v35, v33, v32);
    swift_unknownObjectRelease();
    (*(void (**)(void *, uint64_t))(v34 + 8))(v35, v36);
  }
  swift_getObjectType();
  swift_unknownObjectRetain();
  sub_25BAA52C0();
  swift_unknownObjectRelease();
  uint64_t v45 = sub_25BAA4FE0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v45 - 8) + 8))(v37, v45);
  return v24;
}

uint64_t sub_25BA96F48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t sub_25BA96F54()
{
  swift_getObjectType();
  sub_25BAA52B0();
  return swift_unknownObjectRelease();
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void *sub_25BA96FA0(void *a1, void *a2)
{
  *a1 = *a2;
  swift_unknownObjectRelease();
  return a1;
}

uint64_t sub_25BA96FD4(uint64_t *a1, int a2)
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

uint64_t sub_25BA9701C(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 8) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_25BA97058()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_25BA97070(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

void sub_25BA97078(void **a1)
{
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t sub_25BA9709C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_unknownObjectRelease();
  return a1;
}

uint64_t sub_25BA970EC(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_25BA97134(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_25BA97174()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_25BA9718C()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25BA971C8()
{
  return sub_25BA9651C(*(void *)(v0 + 32), *(void **)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56), *(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_25BA971F0()
{
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_25BA97200()
{
  return (*(uint64_t (**)(void))(v0 + 40))();
}

uint64_t sub_25BA97228()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_25BA97260(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 40))(*a1);
}

unint64_t sub_25BA9728C()
{
  unint64_t result = qword_26A533820;
  if (!qword_26A533820)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A533820);
  }
  return result;
}

uint64_t objectdestroy_7Tm()
{
  swift_release();

  swift_release();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_25BA97318()
{
  return sub_25BA960C0(*(void *)(v0 + 32), *(void **)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56), *(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_25BA97328(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25BA97370(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_25BA973C0()
{
  return (*(uint64_t (**)(void))(v0 + 32))();
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_25BA97428()
{
  return sub_25BA973C0();
}

uint64_t sub_25BA97448()
{
  uint64_t v0 = swift_allocObject();
  sub_25BA97480();
  return v0;
}

uint64_t sub_25BA97480()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25BAA4C80();
  uint64_t v39 = *(void *)(v2 - 8);
  uint64_t v40 = v2;
  MEMORY[0x270FA5388](v2);
  int64_t v38 = (char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B34AE90);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v44 = (uint64_t)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v45 = (char *)&v37 - v8;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v42 = (char *)&v37 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v43 = (uint64_t)&v37 - v11;
  uint64_t v12 = sub_25BAA5270();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  id v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_25BAA52D0();
  MEMORY[0x270FA5388](v16);
  uint64_t v17 = sub_25BAA4FB0();
  MEMORY[0x270FA5388](v17 - 8);
  unint64_t v41 = sub_25BA90B78();
  sub_25BAA4FA0();
  uint64_t v46 = MEMORY[0x263F8EE78];
  sub_25BA9A548(&qword_26B34B450, MEMORY[0x263F8F198]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B34B440);
  sub_25BA76180(&qword_26B34B448, &qword_26B34B440);
  sub_25BAA5360();
  (*(void (**)(char *, void, uint64_t))(v13 + 104))(v15, *MEMORY[0x263F8F138], v12);
  *(void *)(v0 + 16) = sub_25BAA52E0();
  uint64_t v18 = OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_notificationCenter;
  *(void *)(v1 + v18) = objc_msgSend(self, sel_defaultCenter);
  *(void *)(v1 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_deadlineTimer) = 0;
  uint64_t v19 = OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_remoteNotificationName;
  *(void *)(v1 + v19) = sub_25BAA5050();
  uint64_t v20 = (void *)(v1 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_observer);
  v20[1] = 0;
  void v20[2] = 0;
  void *v20 = 0;
  uint64_t v21 = MEMORY[0x263F8EE80];
  *(void *)(v1 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_sessions) = MEMORY[0x263F8EE80];
  *(void *)(v1 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_interpretedSessionInfo) = v21;
  *(void *)(v1 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_observers) = v21;
  *(void *)(v1 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_activeDeviceIDs) = MEMORY[0x263F8EE88];
  *(void *)(v1 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_keepAliveTimer) = 0;
  id v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08850]), sel_init);
  id v23 = (void *)sub_25BAA5050();
  id v24 = objc_msgSend(v22, sel_containerURLForSecurityApplicationGroupIdentifier_, v23);

  if (v24)
  {
    uint64_t v25 = (uint64_t)v42;
    sub_25BAA4CB0();

    uint64_t v26 = sub_25BAA4CD0();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v25, 0, 1, v26);
  }
  else
  {
    uint64_t v26 = sub_25BAA4CD0();
    uint64_t v25 = (uint64_t)v42;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v42, 1, 1, v26);
  }
  uint64_t v27 = v43;
  sub_25BA7C760(v25, v43, &qword_26B34AE90);
  uint64_t v28 = v44;
  sub_25BA7C6FC(v27, v44, &qword_26B34AE90);
  sub_25BAA4CD0();
  uint64_t v29 = *(void *)(v26 - 8);
  int v30 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v29 + 48))(v28, 1, v26);
  uint64_t v31 = (uint64_t)v45;
  if (v30 == 1)
  {
    sub_25BA798DC(v27, &qword_26B34AE90);
    sub_25BA798DC(v28, &qword_26B34AE90);
    uint64_t v32 = 1;
  }
  else
  {
    uint64_t v34 = v38;
    uint64_t v33 = v39;
    uint64_t v35 = v40;
    (*(void (**)(char *, void, uint64_t))(v39 + 104))(v38, *MEMORY[0x263F06E50], v40);
    sub_25BA97B44();
    sub_25BAA4CC0();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v34, v35);
    sub_25BA798DC(v27, &qword_26B34AE90);
    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v28, v26);
    uint64_t v32 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 56))(v31, v32, 1, v26);
  sub_25BA7C760(v31, v1 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_plistURL, &qword_26B34AE90);
  return v1;
}

unint64_t sub_25BA97B44()
{
  unint64_t result = qword_26B34B468;
  if (!qword_26B34B468)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B34B468);
  }
  return result;
}

unint64_t sub_25BA97B98(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5339D8);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5339A0);
  uint64_t v6 = sub_25BAA5480();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = (uint64_t)&v5[*(int *)(v2 + 48)];
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v24[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_25BA7C6FC(v12, (uint64_t)v5, &qword_26A5339D8);
    unint64_t result = sub_25BA77164((uint64_t)v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = sub_25BAA4DA0();
    (*(void (**)(unint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v17 + *(void *)(*(void *)(v18 - 8) + 72) * v16, v5, v18);
    uint64_t v19 = v7[7];
    uint64_t v20 = type metadata accessor for Session(0);
    unint64_t result = sub_25BAA2B9C(v9, v19 + *(void *)(*(void *)(v20 - 8) + 72) * v16, type metadata accessor for Session);
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

uint64_t sub_25BA97DC8(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v33 = a1;
  uint64_t v34 = sub_25BAA4CD0();
  uint64_t v3 = *(void *)(v34 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v34);
  uint64_t v5 = sub_25BAA4F80();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (uint64_t *)((char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = sub_25BAA4FE0();
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v10);
  unint64_t v16 = (char *)&v30 - v15;
  uint64_t v17 = OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_deadlineTimer;
  uint64_t v35 = v2;
  if (!*(void *)(v2 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_deadlineTimer))
  {
    uint64_t v31 = result;
    uint64_t v18 = v14;
    sub_25BAA4FC0();
    *uint64_t v8 = 120;
    (*(void (**)(void *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F8F018], v5);
    sub_25BAA4FD0();
    (*(void (**)(void *, uint64_t))(v6 + 8))(v8, v5);
    uint64_t v19 = *(void (**)(char *, uint64_t))(v18 + 8);
    uint64_t v32 = v18 + 8;
    uint64_t v20 = v31;
    v19(v12, v31);
    uint64_t v21 = v34;
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v33, v34);
    unint64_t v22 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
    uint64_t v23 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v23 + v22, (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v21);
    uint64_t v24 = type metadata accessor for SessionManager(0);
    uint64_t v25 = sub_25BA9A548(&qword_26A5338F8, (void (*)(uint64_t))type metadata accessor for SessionManager);
    uint64_t v26 = v24;
    uint64_t v27 = v35;
    uint64_t v28 = sub_25BA95D44((uint64_t)v16, 0, 1, (uint64_t)sub_25BAA3A5C, v23, v26, v25);
    swift_release();
    v19(v16, v20);
    uint64_t v29 = *(void *)(v27 + v17);
    *(void *)(v27 + v17) = v28;
    return sub_25BAA2CCC(v29);
  }
  return result;
}

uint64_t sub_25BA98134(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_deadlineTimer);
  *(void *)(v1 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_deadlineTimer) = 0;
  sub_25BAA2CCC(v3);
  uint64_t v4 = (uint64_t *)(v1 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_interpretedSessionInfo);
  swift_beginAccess();
  uint64_t v5 = *v4;
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_25BAA4CE0();
  unint64_t v8 = v7;
  sub_25BAA4C30();
  swift_allocObject();
  sub_25BAA4C20();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A533908);
  sub_25BA9F120();
  sub_25BAA4C10();
  swift_release();
  sub_25BA7FD68(v6, v8);
  uint64_t v9 = (void *)(v1 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_sessions);
  swift_beginAccess();
  *uint64_t v9 = v14;
  swift_bridgeObjectRelease();
  uint64_t v10 = swift_bridgeObjectRetain();
  uint64_t v11 = sub_25BA9EA38(v10);
  swift_bridgeObjectRelease();
  *uint64_t v4 = v11;
  swift_bridgeObjectRelease();
  sub_25BA98330(a1);
  uint64_t v12 = *v4;
  swift_bridgeObjectRetain();
  LOBYTE(v11) = sub_25BA9E408(v5, v12);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if ((v11 & 1) == 0) {
    return sub_25BA987FC();
  }
  return result;
}

uint64_t sub_25BA98330(uint64_t a1)
{
  uint64_t v43 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533348);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v51 = (uint64_t)&v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5339B0);
  uint64_t v4 = MEMORY[0x270FA5388](v50);
  uint64_t v49 = (char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v48 = (uint64_t)&v42 - v7;
  MEMORY[0x270FA5388](v6);
  uint64_t v47 = (char *)&v42 - v8;
  uint64_t v44 = v1;
  uint64_t v9 = (uint64_t *)(v1 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_interpretedSessionInfo);
  swift_beginAccess();
  uint64_t v10 = *v9;
  uint64_t v11 = *(void *)(*v9 + 64);
  uint64_t v45 = *v9 + 64;
  uint64_t v12 = 1 << *(unsigned char *)(v10 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & v11;
  int64_t v46 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v52 = v10;
  uint64_t result = swift_bridgeObjectRetain_n();
  int64_t v16 = 0;
  uint64_t v17 = v49;
  while (v14)
  {
    uint64_t v53 = (v14 - 1) & v14;
    int64_t v54 = v16;
    unint64_t v18 = __clz(__rbit64(v14)) | (v16 << 6);
LABEL_5:
    uint64_t v19 = v52;
    uint64_t v20 = *(void *)(v52 + 48);
    uint64_t v21 = sub_25BAA4DA0();
    uint64_t v22 = *(void *)(v21 - 8);
    uint64_t v23 = v22;
    uint64_t v24 = *(void (**)(char *, unint64_t, uint64_t))(v22 + 16);
    uint64_t v25 = v47;
    v24(v47, v20 + *(void *)(v22 + 72) * v18, v21);
    uint64_t v26 = *(void *)(v19 + 56);
    uint64_t v27 = (int *)(type metadata accessor for CompanionDevice.SessionInfo(0) - 8);
    uint64_t v28 = v26 + *(void *)(*(void *)v27 + 72) * v18;
    uint64_t v29 = v50;
    sub_25BAA2C64(v28, (uint64_t)&v25[*(int *)(v50 + 48)], type metadata accessor for CompanionDevice.SessionInfo);
    uint64_t v30 = (uint64_t)v25;
    uint64_t v31 = v48;
    sub_25BA7C760(v30, v48, &qword_26A5339B0);
    uint64_t v32 = *(int *)(v29 + 48);
    uint64_t v33 = (uint64_t)&v17[v32];
    uint64_t v34 = v31 + v32;
    v24(v17, v31, v21);
    sub_25BAA2C64(v34, v33, type metadata accessor for CompanionDevice.SessionInfo);
    uint64_t v35 = v51;
    sub_25BA7C6FC(v33 + v27[7], v51, &qword_26A533348);
    sub_25BAA2C04(v33, type metadata accessor for CompanionDevice.SessionInfo);
    uint64_t v36 = sub_25BAA4D40();
    int v37 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 48))(v35, 1, v36);
    sub_25BA798DC(v35, &qword_26A533348);
    (*(void (**)(char *, uint64_t))(v23 + 8))(v17, v21);
    uint64_t result = sub_25BA798DC(v31, &qword_26A5339B0);
    unint64_t v14 = v53;
    int64_t v16 = v54;
    if (v37 == 1)
    {
      swift_release();
      swift_bridgeObjectRelease();
      return sub_25BA97DC8(v43);
    }
  }
  int64_t v38 = v16 + 1;
  if (__OFADD__(v16, 1))
  {
    __break(1u);
    goto LABEL_29;
  }
  if (v38 >= v46) {
    goto LABEL_26;
  }
  unint64_t v39 = *(void *)(v45 + 8 * v38);
  int64_t v40 = v16 + 1;
  if (v39) {
    goto LABEL_24;
  }
  int64_t v40 = v16 + 2;
  if (v16 + 2 >= v46) {
    goto LABEL_26;
  }
  unint64_t v39 = *(void *)(v45 + 8 * v40);
  if (v39) {
    goto LABEL_24;
  }
  int64_t v40 = v16 + 3;
  if (v16 + 3 >= v46) {
    goto LABEL_26;
  }
  unint64_t v39 = *(void *)(v45 + 8 * v40);
  if (v39) {
    goto LABEL_24;
  }
  int64_t v40 = v16 + 4;
  if (v16 + 4 >= v46) {
    goto LABEL_26;
  }
  unint64_t v39 = *(void *)(v45 + 8 * v40);
  if (v39) {
    goto LABEL_24;
  }
  int64_t v40 = v16 + 5;
  if (v16 + 5 >= v46) {
    goto LABEL_26;
  }
  unint64_t v39 = *(void *)(v45 + 8 * v40);
  if (v39)
  {
LABEL_24:
    uint64_t v53 = (v39 - 1) & v39;
    int64_t v54 = v40;
    unint64_t v18 = __clz(__rbit64(v39)) + (v40 << 6);
    goto LABEL_5;
  }
  uint64_t v41 = v16 + 6;
  if (v16 + 6 >= v46)
  {
LABEL_26:
    swift_release();
    return swift_bridgeObjectRelease();
  }
  unint64_t v39 = *(void *)(v45 + 8 * v41);
  if (v39)
  {
    int64_t v40 = v16 + 6;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v40 = v41 + 1;
    if (__OFADD__(v41, 1)) {
      break;
    }
    if (v40 >= v46) {
      goto LABEL_26;
    }
    unint64_t v39 = *(void *)(v45 + 8 * v40);
    ++v41;
    if (v39) {
      goto LABEL_24;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_25BA987FC()
{
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5338C0);
  uint64_t v1 = *(void *)(v30 - 8);
  MEMORY[0x270FA5388](v30);
  uint64_t v3 = (char *)&v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5338D8);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v25 - v9;
  uint64_t v11 = (uint64_t *)(v0 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_observers);
  swift_beginAccess();
  uint64_t v12 = *v11;
  uint64_t v13 = *(void *)(*v11 + 64);
  uint64_t v25 = *v11 + 64;
  uint64_t v14 = 1 << *(unsigned char *)(v12 + 32);
  uint64_t v15 = -1;
  if (v14 < 64) {
    uint64_t v15 = ~(-1 << v14);
  }
  unint64_t v16 = v15 & v13;
  uint64_t v17 = (uint64_t *)(v0 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_interpretedSessionInfo);
  uint64_t v31 = v12;
  swift_bridgeObjectRetain();
  uint64_t v29 = v17;
  uint64_t result = swift_beginAccess();
  int64_t v19 = 0;
  uint64_t v28 = v5 + 16;
  int64_t v26 = (unint64_t)(v14 + 63) >> 6;
  uint64_t v27 = v5 + 32;
  while (1)
  {
    if (v16)
    {
      unint64_t v20 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v21 = v20 | (v19 << 6);
      goto LABEL_5;
    }
    int64_t v22 = v19 + 1;
    if (__OFADD__(v19, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v22 >= v26) {
      return swift_release();
    }
    unint64_t v23 = *(void *)(v25 + 8 * v22);
    ++v19;
    if (!v23)
    {
      int64_t v19 = v22 + 1;
      if (v22 + 1 >= v26) {
        return swift_release();
      }
      unint64_t v23 = *(void *)(v25 + 8 * v19);
      if (!v23)
      {
        int64_t v19 = v22 + 2;
        if (v22 + 2 >= v26) {
          return swift_release();
        }
        unint64_t v23 = *(void *)(v25 + 8 * v19);
        if (!v23)
        {
          int64_t v19 = v22 + 3;
          if (v22 + 3 >= v26) {
            return swift_release();
          }
          unint64_t v23 = *(void *)(v25 + 8 * v19);
          if (!v23) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v16 = (v23 - 1) & v23;
    unint64_t v21 = __clz(__rbit64(v23)) + (v19 << 6);
LABEL_5:
    (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v10, *(void *)(v31 + 56) + *(void *)(v5 + 72) * v21, v4);
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v8, v10, v4);
    uint64_t v32 = *v29;
    swift_bridgeObjectRetain();
    sub_25BAA51F0();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v30);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  int64_t v24 = v22 + 4;
  if (v24 >= v26) {
    return swift_release();
  }
  unint64_t v23 = *(void *)(v25 + 8 * v24);
  if (v23)
  {
    int64_t v19 = v24;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v19 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v19 >= v26) {
      return swift_release();
    }
    unint64_t v23 = *(void *)(v25 + 8 * v19);
    ++v24;
    if (v23) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_25BA98B9C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5338C8);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25BAA4DA0();
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v10 + 16))(v9, a1);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5338D8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v6, 1, 1, v11);
  uint64_t v12 = v2 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_observers;
  swift_beginAccess();
  sub_25BA98D50((uint64_t)v6, (uint64_t)v9);
  uint64_t result = swift_endAccess();
  if (!*(void *)(*(void *)v12 + 16))
  {
    uint64_t v14 = (void *)(v2 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_observer);
    uint64_t v15 = *(void *)(v2 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_observer);
    uint64_t v16 = *(void *)(v2 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_observer + 8);
    uint64_t v17 = *(void *)(v2 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_observer + 16);
    v14[1] = 0;
    v14[2] = 0;
    *uint64_t v14 = 0;
    return sub_25BA9A590(v15, v16, v17);
  }
  return result;
}

uint64_t sub_25BA98D50(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5338C8);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5338D8);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1, 1, v9) == 1)
  {
    sub_25BA798DC(a1, &qword_26A5338C8);
    sub_25BA9FBE8(a2, (uint64_t)v8);
    uint64_t v13 = sub_25BAA4DA0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(a2, v13);
    return sub_25BA798DC((uint64_t)v8, &qword_26A5338C8);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 32))(v12, a1, v9);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v18 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_25BAA0654((uint64_t)v12, a2, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v18;
    swift_bridgeObjectRelease();
    uint64_t v16 = sub_25BAA4DA0();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(a2, v16);
  }
}

uint64_t sub_25BA98F80(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533920);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Session(0);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v12 + 48))(a1, 1) == 1)
  {
    sub_25BA798DC(a1, &qword_26A533920);
    sub_25BA9FDC0(a2, type metadata accessor for Session, type metadata accessor for Session, type metadata accessor for Session, &qword_26A5339A0, (uint64_t)v8);
    uint64_t v13 = sub_25BAA4DA0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(a2, v13);
    return sub_25BA798DC((uint64_t)v8, &qword_26A533920);
  }
  else
  {
    sub_25BAA2B9C(a1, (uint64_t)v11, type metadata accessor for Session);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v18 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_25BAA085C((uint64_t)v11, a2, isUniquelyReferenced_nonNull_native, type metadata accessor for Session, &qword_26A5339A0, type metadata accessor for Session, type metadata accessor for Session);
    *uint64_t v3 = v18;
    swift_bridgeObjectRelease();
    uint64_t v16 = sub_25BAA4DA0();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(a2, v16);
  }
}

uint64_t sub_25BA991FC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533358);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for CompanionDevice.SessionInfo(0);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v12 + 48))(a1, 1) == 1)
  {
    sub_25BA798DC(a1, &qword_26A533358);
    sub_25BA9FDC0(a2, type metadata accessor for CompanionDevice.SessionInfo, type metadata accessor for CompanionDevice.SessionInfo, type metadata accessor for CompanionDevice.SessionInfo, &qword_26A5339D0, (uint64_t)v8);
    uint64_t v13 = sub_25BAA4DA0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(a2, v13);
    return sub_25BA798DC((uint64_t)v8, &qword_26A533358);
  }
  else
  {
    sub_25BAA2B9C(a1, (uint64_t)v11, type metadata accessor for CompanionDevice.SessionInfo);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v18 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_25BAA085C((uint64_t)v11, a2, isUniquelyReferenced_nonNull_native, type metadata accessor for CompanionDevice.SessionInfo, &qword_26A5339D0, type metadata accessor for CompanionDevice.SessionInfo, type metadata accessor for CompanionDevice.SessionInfo);
    *uint64_t v3 = v18;
    swift_bridgeObjectRelease();
    uint64_t v16 = sub_25BAA4DA0();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(a2, v16);
  }
}

uint64_t sub_25BA99478@<X0>(uint64_t a1@<X8>)
{
  uint64_t v92 = a1;
  uint64_t v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5338C0);
  uint64_t v82 = *(void *)(v85 - 8);
  MEMORY[0x270FA5388](v85);
  uint64_t v84 = (char *)&v76 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5338C8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v83 = (char *)&v76 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B34AE90);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v76 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v98 = sub_25BAA4CD0();
  uint64_t v96 = *(void *)(v98 - 8);
  uint64_t v7 = *(void *)(v96 + 64);
  uint64_t v8 = MEMORY[0x270FA5388](v98);
  uint64_t v79 = (char *)&v76 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v94 = (char *)&v76 - v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5338D0);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v76 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5338D8);
  uint64_t v87 = *(void *)(v93 - 8);
  MEMORY[0x270FA5388](v93);
  uint64_t v15 = (char *)&v76 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5338E0);
  uint64_t v90 = *(void *)(v91 - 8);
  MEMORY[0x270FA5388](v91);
  uint64_t v17 = (char *)&v76 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v97 = sub_25BAA4DA0();
  uint64_t v88 = *(void *)(v97 - 8);
  uint64_t v18 = *(void *)(v88 + 64);
  uint64_t v19 = MEMORY[0x270FA5388](v97);
  uint64_t v86 = (char *)&v76 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  unint64_t v21 = (char *)&v76 - v20;
  sub_25BAA4D90();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5338E8);
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, *MEMORY[0x263F8F680], v10);
  uint64_t v89 = v17;
  int64_t v22 = v15;
  sub_25BAA51C0();
  unint64_t v23 = v13;
  uint64_t v25 = v95;
  uint64_t v24 = v96;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v23, v10);
  uint64_t v26 = v98;
  sub_25BA7C6FC(v25 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_plistURL, (uint64_t)v6, &qword_26B34AE90);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v6, 1, v26) == 1)
  {
    sub_25BA798DC((uint64_t)v6, &qword_26B34AE90);
    sub_25BA99F98();
    uint64_t v27 = swift_allocError();
    *uint64_t v28 = 3;
    uint64_t v101 = v27;
    uint64_t v29 = v93;
    sub_25BAA5200();
    (*(void (**)(char *, uint64_t))(v87 + 8))(v22, v29);
    (*(void (**)(char *, uint64_t))(v88 + 8))(v21, v97);
  }
  else
  {
    uint64_t v78 = v18;
    uint64_t v80 = v21;
    long long v81 = v22;
    uint64_t v30 = v24;
    uint64_t v31 = *(void (**)(char *, char *, uint64_t))(v24 + 32);
    v31(v94, v6, v26);
    uint64_t v32 = v25 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_observers;
    swift_beginAccess();
    uint64_t v33 = v93;
    uint64_t v34 = (uint64_t)v86;
    if (!*(void *)(*(void *)v32 + 16))
    {
      uint64_t v35 = (uint64_t *)(v25 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_observer);
      if (!*(void *)(v25 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_observer))
      {
        uint64_t v77 = *(void **)(v95 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_notificationCenter);
        uint64_t v76 = *(void **)(v95 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_remoteNotificationName);
        uint64_t v36 = v96 + 16;
        int v37 = v79;
        uint64_t v38 = v98;
        (*(void (**)(char *, char *, uint64_t))(v96 + 16))(v79, v94, v98);
        unint64_t v39 = (*(unsigned __int8 *)(v36 + 64) + 16) & ~(unint64_t)*(unsigned __int8 *)(v36 + 64);
        uint64_t v40 = swift_allocObject();
        uint64_t v41 = v38;
        uint64_t v34 = (uint64_t)v86;
        v31((char *)(v40 + v39), v37, v41);
        uint64_t v42 = type metadata accessor for SessionManager(0);
        uint64_t v43 = sub_25BA9A548(&qword_26A5338F8, (void (*)(uint64_t))type metadata accessor for SessionManager);
        id v44 = sub_25BA95EAC(v77, v76, (uint64_t)sub_25BA9A350, v40, v42, v43);
        uint64_t v46 = v45;
        uint64_t v48 = v47;
        swift_release();
        uint64_t v49 = *v35;
        uint64_t v50 = v35[1];
        uint64_t v51 = v35[2];
        *uint64_t v35 = (uint64_t)v44;
        v35[1] = v46;
        v35[2] = v48;
        sub_25BA9A590(v49, v50, v51);
      }
      uint64_t v52 = (uint64_t)v94;
      uint64_t v53 = sub_25BAA4CE0();
      unint64_t v55 = v54;
      sub_25BAA4C30();
      swift_allocObject();
      sub_25BAA4C20();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A533908);
      sub_25BA9F120();
      sub_25BAA4C10();
      swift_release();
      sub_25BA7FD68(v53, v55);
      uint64_t v56 = v100;
      uint64_t v57 = v95;
      uint64_t v58 = (void *)(v95 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_sessions);
      swift_beginAccess();
      void *v58 = v56;
      swift_bridgeObjectRelease();
      uint64_t v59 = swift_bridgeObjectRetain();
      uint64_t v60 = sub_25BA9EA38(v59);
      swift_bridgeObjectRelease();
      uint64_t v61 = (uint64_t *)(v57 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_interpretedSessionInfo);
      swift_beginAccess();
      *uint64_t v61 = v60;
      uint64_t v25 = v57;
      swift_bridgeObjectRelease();
      sub_25BA98330(v52);
      uint64_t v30 = v96;
      uint64_t v33 = v93;
    }
    uint64_t v62 = v87;
    uint64_t v63 = v88;
    uint64_t v96 = *(void *)(v88 + 16);
    unint64_t v64 = v80;
    ((void (*)(uint64_t, char *, uint64_t))v96)(v34, v80, v97);
    uint64_t v65 = (uint64_t)v83;
    (*(void (**)(char *, char *, uint64_t))(v62 + 16))(v83, v81, v33);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v62 + 56))(v65, 0, 1, v33);
    swift_beginAccess();
    sub_25BA98D50(v65, v34);
    swift_endAccess();
    uint64_t v66 = swift_allocObject();
    swift_weakInit();
    uint64_t v67 = v64;
    uint64_t v68 = v30;
    uint64_t v69 = v97;
    ((void (*)(uint64_t, char *, uint64_t))v96)(v34, v67, v97);
    unint64_t v70 = (*(unsigned __int8 *)(v63 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v63 + 80);
    uint64_t v71 = swift_allocObject();
    *(void *)(v71 + 16) = v66;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v63 + 32))(v71 + v70, v34, v69);
    uint64_t v72 = v81;
    sub_25BAA51D0();
    uint64_t v73 = (uint64_t *)(v25 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_interpretedSessionInfo);
    swift_beginAccess();
    uint64_t v99 = *v73;
    swift_bridgeObjectRetain();
    uint64_t v74 = v84;
    sub_25BAA51F0();
    (*(void (**)(char *, uint64_t))(v82 + 8))(v74, v85);
    (*(void (**)(char *, uint64_t))(v68 + 8))(v94, v98);
    (*(void (**)(char *, uint64_t))(v62 + 8))(v72, v33);
    (*(void (**)(char *, uint64_t))(v63 + 8))(v80, v69);
  }
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v90 + 32))(v92, v89, v91);
}

unint64_t sub_25BA99F98()
{
  unint64_t result = qword_26A5338F0;
  if (!qword_26A5338F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5338F0);
  }
  return result;
}

uint64_t sub_25BA99FEC()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25BA9A024(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_25BAA4DA0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533210);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v10 = result;
    uint64_t v11 = sub_25BAA5140();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v3);
    unint64_t v12 = (*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
    uint64_t v13 = (char *)swift_allocObject();
    *((void *)v13 + 2) = 0;
    *((void *)v13 + 3) = 0;
    *((void *)v13 + 4) = v10;
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(&v13[v12], (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
    sub_25BA73934((uint64_t)v8, (uint64_t)&unk_26A5339E8, (uint64_t)v13);
    return swift_release();
  }
  return result;
}

uint64_t sub_25BA9A21C()
{
  uint64_t v1 = sub_25BAA4DA0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_25BA9A2E8()
{
  uint64_t v1 = *(void *)(sub_25BAA4DA0() - 8);
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
  return sub_25BA9A024(v2, v3);
}

uint64_t sub_25BA9A350(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_25BAA4CD0() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  uint64_t v5 = sub_25BAA4CE0();
  unint64_t v7 = v6;
  sub_25BAA4C30();
  swift_allocObject();
  sub_25BAA4C20();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A533908);
  sub_25BA9F120();
  sub_25BAA4C10();
  swift_release();
  sub_25BA7FD68(v5, v7);
  uint64_t v8 = (void *)(a1 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_sessions);
  swift_beginAccess();
  *uint64_t v8 = v13;
  swift_bridgeObjectRelease();
  uint64_t v9 = swift_bridgeObjectRetain();
  uint64_t v10 = sub_25BA9EA38(v9);
  swift_bridgeObjectRelease();
  uint64_t v11 = (uint64_t *)(a1 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_interpretedSessionInfo);
  swift_beginAccess();
  uint64_t *v11 = v10;
  swift_bridgeObjectRelease();
  sub_25BA987FC();
  return sub_25BA98330(v4);
}

uint64_t type metadata accessor for SessionManager(uint64_t a1)
{
  return sub_25BA7B994(a1, qword_26B34B4E0);
}

uint64_t sub_25BA9A548(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25BA9A590(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    v4[0] = result;
    v4[1] = a2;
    v4[2] = a3;
    uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533900);
    return (*(uint64_t (**)(void *, uint64_t))(*(void *)(v3 - 8) + 8))(v4, v3);
  }
  return result;
}

uint64_t sub_25BA9A5F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 16) = a4;
  *(void *)(v5 + 24) = a5;
  type metadata accessor for SessionManager(0);
  sub_25BA9A548((unint64_t *)&unk_26A533478, (void (*)(uint64_t))type metadata accessor for SessionManager);
  uint64_t v7 = sub_25BAA50E0();
  return MEMORY[0x270FA2498](sub_25BA9A6B4, v7, v6);
}

uint64_t sub_25BA9A6B4()
{
  sub_25BA98B9C(*(void *)(v0 + 24));
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25BA9A714(uint64_t a1, uint64_t a2)
{
  uint64_t v38 = a2;
  uint64_t v45 = a1;
  uint64_t v42 = sub_25BAA4CD0();
  uint64_t v40 = *(void *)(v42 - 8);
  uint64_t v3 = *(void *)(v40 + 64);
  MEMORY[0x270FA5388](v42);
  unint64_t v39 = (char *)&v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_25BAA4F80();
  uint64_t v36 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (uint64_t *)((char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v43 = sub_25BAA4FE0();
  uint64_t v41 = *(void *)(v43 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v43);
  uint64_t v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  int v37 = (char *)&v36 - v10;
  uint64_t v11 = sub_25BAA4DA0();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v36 - v16;
  uint64_t v44 = v2;
  uint64_t v18 = v2 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_activeDeviceIDs;
  swift_beginAccess();
  uint64_t v19 = *(void *)(*(void *)v18 + 16);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, v45, v11);
  swift_beginAccess();
  sub_25BAA135C((uint64_t)v17, v15);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v17, v11);
  uint64_t result = swift_endAccess();
  if (!v19)
  {
    sub_25BAA4FC0();
    *uint64_t v6 = 60;
    uint64_t v21 = v36;
    (*(void (**)(void *, void, uint64_t))(v36 + 104))(v6, *MEMORY[0x263F8F018], v4);
    uint64_t v22 = (uint64_t)v37;
    sub_25BAA4FD0();
    (*(void (**)(void *, uint64_t))(v21 + 8))(v6, v4);
    unint64_t v23 = *(void (**)(char *, uint64_t))(v41 + 8);
    uint64_t v24 = v43;
    v23(v9, v43);
    uint64_t v26 = v39;
    uint64_t v25 = v40;
    uint64_t v27 = v42;
    (*(void (**)(char *, uint64_t, uint64_t))(v40 + 16))(v39, v38, v42);
    unint64_t v28 = (*(unsigned __int8 *)(v25 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);
    uint64_t v29 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v25 + 32))(v29 + v28, v26, v27);
    uint64_t v30 = type metadata accessor for SessionManager(0);
    uint64_t v31 = sub_25BA9A548(&qword_26A5338F8, (void (*)(uint64_t))type metadata accessor for SessionManager);
    uint64_t v32 = v30;
    uint64_t v33 = v44;
    uint64_t v34 = sub_25BA95D44(v22, 0x404E000000000000, 0, (uint64_t)sub_25BAA39B0, v29, v32, v31);
    swift_release();
    v23((char *)v22, v24);
    uint64_t v35 = *(void *)(v33 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_keepAliveTimer);
    *(void *)(v33 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_keepAliveTimer) = v34;
    return sub_25BAA2CCC(v35);
  }
  return result;
}

uint64_t sub_25BA9ABB0(uint64_t a1)
{
  uint64_t v66 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533920);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v64 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Session(0);
  uint64_t v77 = *(void *)(v5 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v75 = (uint64_t)&v64 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v72 = (char *)&v64 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v76 = (uint64_t)&v64 - v10;
  uint64_t v11 = sub_25BAA4DA0();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v78 = (char *)&v64 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v64 - v15;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5332D0);
  MEMORY[0x270FA5388](v17 - 8);
  uint64_t v19 = (char *)&v64 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = sub_25BAA4D40();
  uint64_t v20 = *(void *)(v74 - 8);
  MEMORY[0x270FA5388](v74);
  uint64_t v73 = (char *)&v64 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25BAA4D30();
  uint64_t v22 = (uint64_t *)(v1 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_activeDeviceIDs);
  swift_beginAccess();
  uint64_t v23 = *v22;
  uint64_t v24 = *(void *)(*v22 + 56);
  uint64_t v81 = *v22 + 56;
  uint64_t v25 = 1 << *(unsigned char *)(v23 + 32);
  uint64_t v26 = -1;
  if (v25 < 64) {
    uint64_t v26 = ~(-1 << v25);
  }
  unint64_t v27 = v26 & v24;
  unint64_t v28 = (void *)(v1 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_sessions);
  uint64_t v88 = v23;
  swift_bridgeObjectRetain();
  uint64_t v90 = v28;
  swift_beginAccess();
  int64_t v29 = 0;
  int64_t v82 = (unint64_t)(v25 + 63) >> 6;
  uint64_t v89 = v12 + 16;
  uint64_t v86 = v12 + 48;
  uint64_t v87 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56);
  uint64_t v85 = (void (**)(char *, char *, uint64_t))(v12 + 32);
  uint64_t v84 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v77 + 56);
  uint64_t v80 = (uint64_t (**)(char *, uint64_t, uint64_t))(v77 + 48);
  uint64_t v65 = v20;
  uint64_t v71 = (void (**)(char *, uint64_t, uint64_t))(v20 + 16);
  uint64_t v83 = (void (**)(char *, uint64_t))(v12 + 8);
  uint64_t v79 = v19;
  uint64_t v69 = v4;
  uint64_t v68 = v5;
  uint64_t v67 = v16;
  uint64_t v70 = v12;
  while (1)
  {
    if (v27)
    {
      unint64_t v30 = __clz(__rbit64(v27));
      v27 &= v27 - 1;
      unint64_t v31 = v30 | (v29 << 6);
      goto LABEL_22;
    }
    int64_t v32 = v29 + 1;
    if (__OFADD__(v29, 1))
    {
      __break(1u);
LABEL_45:
      __break(1u);
      goto LABEL_46;
    }
    if (v32 >= v82) {
      goto LABEL_42;
    }
    unint64_t v33 = *(void *)(v81 + 8 * v32);
    ++v29;
    if (!v33)
    {
      int64_t v29 = v32 + 1;
      if (v32 + 1 >= v82) {
        goto LABEL_42;
      }
      unint64_t v33 = *(void *)(v81 + 8 * v29);
      if (!v33)
      {
        int64_t v29 = v32 + 2;
        if (v32 + 2 >= v82) {
          goto LABEL_42;
        }
        unint64_t v33 = *(void *)(v81 + 8 * v29);
        if (!v33) {
          break;
        }
      }
    }
LABEL_21:
    unint64_t v27 = (v33 - 1) & v33;
    unint64_t v31 = __clz(__rbit64(v33)) + (v29 << 6);
LABEL_22:
    uint64_t v25 = *(void *)(v12 + 72);
    uint64_t v35 = *(void (**)(char *, unint64_t, uint64_t))(v12 + 16);
    v35(v19, *(void *)(v88 + 48) + v25 * v31, v11);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v19, 0, 1, v11);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v19, 1, v11) == 1) {
      goto LABEL_43;
    }
    int64_t v91 = v29;
    (*v85)(v16, v19, v11);
    uint64_t v36 = *v90;
    if (!*(void *)(*v90 + 16))
    {
      (*v84)(v4, 1, 1, v5);
      goto LABEL_5;
    }
    swift_bridgeObjectRetain();
    unint64_t v37 = sub_25BA77164((uint64_t)v16);
    if (v38)
    {
      sub_25BAA2C64(*(void *)(v36 + 56) + *(void *)(v77 + 72) * v37, (uint64_t)v4, type metadata accessor for Session);
      uint64_t v39 = 0;
    }
    else
    {
      uint64_t v39 = 1;
    }
    (*v84)(v4, v39, 1, v5);
    swift_bridgeObjectRelease();
    int v40 = (*v80)(v4, 1, v5);
    uint64_t v19 = v79;
    if (v40 == 1)
    {
LABEL_5:
      (*v83)(v16, v11);
      sub_25BA798DC((uint64_t)v4, &qword_26A533920);
      int64_t v29 = v91;
    }
    else
    {
      uint64_t v41 = v76;
      sub_25BAA2B9C((uint64_t)v4, v76, type metadata accessor for Session);
      if (*(unsigned char *)(v41 + *(int *)(v5 + 20)))
      {
        sub_25BAA2C04(v41, type metadata accessor for Session);
        (*v83)(v16, v11);
        int64_t v29 = v91;
      }
      else
      {
        v35(v78, (unint64_t)v16, v11);
        uint64_t v42 = v41;
        uint64_t v43 = *v71;
        uint64_t v44 = (uint64_t)v72;
        uint64_t v45 = v74;
        (*v71)(v72, v42, v74);
        v43((char *)(v44 + *(int *)(v5 + 24)), (uint64_t)v73, v45);
        *(unsigned char *)(v44 + *(int *)(v5 + 20)) = 0;
        uint64_t v46 = v90;
        swift_beginAccess();
        sub_25BAA2B9C(v44, v75, type metadata accessor for Session);
        int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v94 = (void *)*v46;
        uint64_t v48 = v94;
        *uint64_t v46 = 0x8000000000000000;
        unint64_t v50 = sub_25BA77164((uint64_t)v78);
        uint64_t v51 = v48[2];
        BOOL v52 = (v49 & 1) == 0;
        uint64_t v53 = v51 + v52;
        if (__OFADD__(v51, v52)) {
          goto LABEL_45;
        }
        char v54 = v49;
        if (v48[3] >= v53)
        {
          uint64_t v12 = v70;
          if (isUniquelyReferenced_nonNull_native)
          {
            uint64_t v57 = v94;
            if (v49) {
              goto LABEL_37;
            }
          }
          else
          {
            sub_25BAA0FF0(type metadata accessor for Session, &qword_26A5339A0, type metadata accessor for Session);
            uint64_t v57 = v94;
            if (v54) {
              goto LABEL_37;
            }
          }
        }
        else
        {
          sub_25BA9F708(v53, isUniquelyReferenced_nonNull_native, type metadata accessor for Session, &qword_26A5339A0, type metadata accessor for Session);
          unint64_t v55 = sub_25BA77164((uint64_t)v78);
          uint64_t v12 = v70;
          if ((v54 & 1) != (v56 & 1)) {
            goto LABEL_48;
          }
          unint64_t v50 = v55;
          uint64_t v57 = v94;
          if (v54)
          {
LABEL_37:
            sub_25BAA3BF4(v75, v57[7] + *(void *)(v77 + 72) * v50, type metadata accessor for Session);
            goto LABEL_41;
          }
        }
        v57[(v50 >> 6) + 8] |= 1 << v50;
        v35((char *)(v57[6] + v50 * v25), (unint64_t)v78, v11);
        sub_25BAA2B9C(v75, v57[7] + *(void *)(v77 + 72) * v50, type metadata accessor for Session);
        uint64_t v58 = v57[2];
        BOOL v59 = __OFADD__(v58, 1);
        uint64_t v60 = v58 + 1;
        if (v59) {
          goto LABEL_47;
        }
        v57[2] = v60;
        uint64_t v57 = v94;
LABEL_41:
        *uint64_t v90 = v57;
        swift_bridgeObjectRelease();
        uint64_t v25 = (uint64_t)v83;
        uint64_t v61 = *v83;
        (*v83)(v78, v11);
        swift_endAccess();
        sub_25BAA2C04(v76, type metadata accessor for Session);
        uint64_t v16 = v67;
        v61(v67, v11);
        uint64_t v4 = v69;
        uint64_t v5 = v68;
        int64_t v29 = v91;
      }
    }
  }
  int64_t v34 = v32 + 3;
  if (v34 >= v82)
  {
LABEL_42:
    (*v87)(v19, 1, 1, v11);
LABEL_43:
    swift_release();
    uint64_t v62 = (void *)swift_bridgeObjectRetain();
    sub_25BAA296C(v62, v66);
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v65 + 8))(v73, v74);
  }
  unint64_t v33 = *(void *)(v81 + 8 * v34);
  if (v33)
  {
    int64_t v29 = v34;
    goto LABEL_21;
  }
  while (1)
  {
    int64_t v29 = v34 + 1;
    if (__OFADD__(v34, 1)) {
      break;
    }
    if (v29 >= v82) {
      goto LABEL_42;
    }
    unint64_t v33 = *(void *)(v81 + 8 * v29);
    ++v34;
    if (v33) {
      goto LABEL_21;
    }
  }
LABEL_46:
  __break(1u);
LABEL_47:
  __break(1u);
LABEL_48:
  sub_25BAA55A0();
  __break(1u);
  uint64_t v92 = 0;
  unint64_t v93 = 0xE000000000000000;
  sub_25BAA53D0();
  sub_25BAA50B0();
  uint64_t v94 = (void *)v25;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A533310);
  sub_25BAA5420();
  uint64_t result = sub_25BAA5450();
  __break(1u);
  return result;
}

uint64_t sub_25BA9B70C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5332D0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = v2 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_activeDeviceIDs;
  swift_beginAccess();
  sub_25BAA2370(a1, (uint64_t)v6);
  sub_25BA798DC((uint64_t)v6, &qword_26A5332D0);
  uint64_t result = swift_endAccess();
  if (!*(void *)(*(void *)v7 + 16))
  {
    uint64_t v9 = *(void *)(v2 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_keepAliveTimer);
    *(void *)(v2 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_keepAliveTimer) = 0;
    return sub_25BAA2CCC(v9);
  }
  return result;
}

uint64_t sub_25BA9B7F8(uint64_t a1)
{
  uint64_t v109 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533920);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v102 = (char *)&v89 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v107 = sub_25BAA4DA0();
  uint64_t v110 = *(void *)(v107 - 8);
  MEMORY[0x270FA5388](v107);
  uint64_t v106 = (char *)&v89 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v104 = sub_25BAA4D40();
  uint64_t v105 = *(void *)(v104 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v104);
  uint64_t v101 = (char *)&v89 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v98 = (char *)&v89 - v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533348);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v100 = (char *)&v89 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  v103 = (char *)&v89 - v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533358);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  uint64_t v99 = (uint64_t)&v89 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v89 - v15;
  uint64_t v17 = type metadata accessor for CompanionDevice.SessionInfo(0);
  uint64_t v108 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v89 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B34AE90);
  MEMORY[0x270FA5388](v20 - 8);
  uint64_t v22 = (char *)&v89 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_25BAA4CD0();
  MEMORY[0x270FA5388](v23);
  uint64_t v25 = (char *)&v89 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = v26;
  sub_25BA7C6FC(v1 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_plistURL, (uint64_t)v22, &qword_26B34AE90);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v22, 1, v23) == 1)
  {
    sub_25BA798DC((uint64_t)v22, &qword_26B34AE90);
    sub_25BA99F98();
    swift_allocError();
    *unint64_t v28 = 3;
    return swift_willThrow();
  }
  uint64_t v94 = v16;
  uint64_t v89 = v19;
  uint64_t v97 = v17;
  uint64_t v30 = v27;
  unint64_t v31 = v112;
  int64_t v32 = v106;
  (*(void (**)(char *, char *, uint64_t))(v30 + 32))(v25, v22, v23);
  uint64_t v33 = v1 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_observers;
  swift_beginAccess();
  uint64_t v34 = *(void *)(*(void *)v33 + 16);
  uint64_t v35 = (void *)&unk_26B34B000;
  uint64_t v36 = (void *)&unk_26B34B000;
  uint64_t v93 = v23;
  uint64_t v92 = v30;
  uint64_t v95 = v25;
  uint64_t v96 = v1;
  uint64_t v90 = v33;
  if (v34)
  {
    uint64_t v37 = (uint64_t)v32;
    uint64_t v39 = v108;
    uint64_t v38 = v109;
    int v40 = v31;
    uint64_t v41 = v97;
  }
  else
  {
    uint64_t v42 = sub_25BAA4CE0();
    if (v31)
    {

      unint64_t v44 = sub_25BA97B98(MEMORY[0x263F8EE78]);
      uint64_t v41 = v97;
      uint64_t v39 = v108;
    }
    else
    {
      uint64_t v45 = v42;
      unint64_t v46 = v43;
      sub_25BAA4C30();
      swift_allocObject();
      sub_25BAA4C20();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A533908);
      sub_25BA9F120();
      sub_25BAA4C10();
      swift_release();
      sub_25BA7FD68(v45, v46);
      unint64_t v44 = v111;
      uint64_t v41 = v97;
      uint64_t v39 = v108;
      uint64_t v35 = &unk_26B34B000;
    }
    uint64_t v47 = v96;
    uint64_t v48 = (unint64_t *)(v96 + v35[152]);
    swift_beginAccess();
    unint64_t *v48 = v44;
    swift_bridgeObjectRelease();
    uint64_t v49 = swift_bridgeObjectRetain();
    uint64_t v50 = sub_25BA9EA38(v49);
    int v40 = 0;
    swift_bridgeObjectRelease();
    uint64_t v51 = (uint64_t *)(v47 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_interpretedSessionInfo);
    swift_beginAccess();
    uint64_t *v51 = v50;
    uint64_t v1 = v47;
    swift_bridgeObjectRelease();
    uint64_t v36 = &unk_26B34B000;
    uint64_t v37 = (uint64_t)v32;
    uint64_t v38 = v109;
  }
  uint64_t v52 = (uint64_t)v103;
  uint64_t v53 = (char *)(v1 + v36[143]);
  swift_beginAccess();
  uint64_t v54 = *(void *)v53;
  uint64_t v55 = *(void *)(*(void *)v53 + 16);
  v103 = v53;
  if (!v55)
  {
    uint64_t v112 = v40;
    uint64_t v58 = (uint64_t)v94;
    int64_t v91 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v39 + 56);
    v91(v94, 1, 1, v41);
LABEL_16:
    uint64_t v62 = v107;
    uint64_t v63 = v110;
    uint64_t v64 = v105;
    uint64_t v65 = v98;
    uint64_t v66 = v104;
    sub_25BA798DC(v58, &qword_26A533358);
    goto LABEL_17;
  }
  swift_bridgeObjectRetain();
  unint64_t v56 = sub_25BA77164(v38);
  if (v57)
  {
    uint64_t v58 = (uint64_t)v94;
    sub_25BAA2C64(*(void *)(v54 + 56) + *(void *)(v39 + 72) * v56, (uint64_t)v94, type metadata accessor for CompanionDevice.SessionInfo);
    BOOL v59 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v39 + 56);
    uint64_t v60 = v58;
    uint64_t v61 = 0;
  }
  else
  {
    BOOL v59 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v39 + 56);
    uint64_t v58 = (uint64_t)v94;
    uint64_t v60 = (uint64_t)v94;
    uint64_t v61 = 1;
  }
  int64_t v91 = v59;
  v59((char *)v60, v61, 1, v41);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v39 + 48))(v58, 1, v41) == 1)
  {
    uint64_t v112 = v40;
    goto LABEL_16;
  }
  uint64_t v82 = (uint64_t)v89;
  sub_25BAA2B9C(v58, (uint64_t)v89, type metadata accessor for CompanionDevice.SessionInfo);
  uint64_t v83 = *(int *)(v41 + 20);
  uint64_t v84 = v82;
  sub_25BA7C6FC(v82 + v83, v52, &qword_26A533348);
  uint64_t v64 = v105;
  uint64_t v85 = v104;
  int v86 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v105 + 48))(v52, 1, v104);
  sub_25BA798DC(v52, &qword_26A533348);
  if (v86 == 1)
  {
    sub_25BA99F98();
    swift_allocError();
    unsigned char *v87 = 0;
    swift_willThrow();
    sub_25BAA2C04(v84, type metadata accessor for CompanionDevice.SessionInfo);
    return (*(uint64_t (**)(char *, uint64_t))(v92 + 8))(v95, v93);
  }
  uint64_t v112 = v40;
  uint64_t v66 = v85;
  sub_25BAA2C04(v84, type metadata accessor for CompanionDevice.SessionInfo);
  uint64_t v37 = (uint64_t)v32;
  uint64_t v62 = v107;
  uint64_t v38 = v109;
  uint64_t v63 = v110;
  uint64_t v65 = v98;
LABEL_17:
  sub_25BAA4D30();
  uint64_t v67 = *(char **)(v63 + 16);
  uint64_t v110 = v63 + 16;
  uint64_t v106 = v67;
  ((void (*)(uint64_t, uint64_t, uint64_t))v67)(v37, v38, v62);
  uint64_t v68 = *(void (**)(char *, char *, uint64_t))(v64 + 16);
  uint64_t v69 = v102;
  uint64_t v70 = v66;
  v68(v102, v65, v66);
  uint64_t v71 = type metadata accessor for Session(0);
  sub_25BAA4D30();
  v69[*(int *)(v71 + 20)] = 0;
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v71 - 8) + 56))(v69, 0, 1, v71);
  swift_beginAccess();
  uint64_t v72 = (uint64_t)v69;
  uint64_t v73 = v65;
  uint64_t v74 = v109;
  sub_25BA98F80(v72, v37);
  swift_endAccess();
  ((void (*)(uint64_t, uint64_t, uint64_t))v106)(v37, v74, v107);
  uint64_t v75 = (uint64_t)v101;
  v68(v101, v73, v70);
  uint64_t v76 = v64;
  uint64_t v77 = (uint64_t)v100;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v64 + 56))(v100, 1, 1, v70);
  uint64_t v78 = v99;
  sub_25BA7A944(v75, v77, v99);
  v91((char *)v78, 0, 1, v97);
  swift_beginAccess();
  sub_25BA991FC(v78, v37);
  swift_endAccess();
  uint64_t v79 = (void *)swift_bridgeObjectRetain();
  uint64_t v80 = (uint64_t)v95;
  uint64_t v81 = v112;
  sub_25BAA296C(v79, (uint64_t)v95);
  if (v81)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v88 = v96;
    sub_25BA987FC();
    objc_msgSend(*(id *)(v88 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_notificationCenter), sel_postNotificationName_object_, *(void *)(v88 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_remoteNotificationName), 0);
    if (*(void *)(*(void *)v90 + 16)) {
      sub_25BA97DC8(v80);
    }
    sub_25BA9A714(v74, v80);
  }
  (*(void (**)(char *, uint64_t))(v76 + 8))(v73, v70);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v92 + 8))(v80, v93);
}

uint64_t sub_25BA9C3FC(uint64_t a1)
{
  uint64_t v121 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533358);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v109 = (uint64_t)&v96 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v112 = sub_25BAA4DA0();
  uint64_t v108 = *(void *)(v112 - 8);
  MEMORY[0x270FA5388](v112);
  uint64_t v116 = (uint64_t)&v96 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v110 = sub_25BAA4D40();
  uint64_t v115 = *(void *)(v110 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v110);
  v113 = (char *)&v96 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v104 = (char *)&v96 - v8;
  MEMORY[0x270FA5388](v7);
  v117 = (char *)&v96 - v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533348);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v107 = (char *)&v96 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  unint64_t v111 = (char *)&v96 - v13;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533920);
  uint64_t v15 = MEMORY[0x270FA5388](v14 - 8);
  uint64_t v106 = (char *)&v96 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v96 - v17;
  uint64_t v19 = type metadata accessor for Session(0);
  uint64_t v119 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (char *)&v96 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B34AE90);
  MEMORY[0x270FA5388](v22 - 8);
  uint64_t v24 = (char *)&v96 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_25BAA4CD0();
  uint64_t v26 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  unint64_t v28 = (char *)&v96 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = v1;
  sub_25BA7C6FC(v1 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_plistURL, (uint64_t)v24, &qword_26B34AE90);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v24, 1, v25) == 1)
  {
    sub_25BA798DC((uint64_t)v24, &qword_26B34AE90);
    sub_25BA99F98();
    swift_allocError();
    *uint64_t v30 = 3;
    return swift_willThrow();
  }
  unint64_t v103 = (unint64_t)v18;
  uint64_t v105 = v19;
  uint64_t v114 = v21;
  (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v28, v24, v25);
  uint64_t v32 = v1 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_observers;
  swift_beginAccess();
  uint64_t v33 = *(void *)(*(void *)v32 + 16);
  uint64_t v34 = (void *)&unk_26B34B000;
  uint64_t v102 = v25;
  uint64_t v35 = (uint64_t)v28;
  if (v33)
  {
    uint64_t v36 = (uint64_t)v114;
    uint64_t v37 = v121;
  }
  else
  {
    uint64_t v38 = v118;
    uint64_t v39 = sub_25BAA4CE0();
    uint64_t v37 = v121;
    uint64_t v101 = v28;
    if (v38)
    {

      unint64_t v41 = sub_25BA97B98(MEMORY[0x263F8EE78]);
    }
    else
    {
      uint64_t v42 = v39;
      unint64_t v43 = v40;
      sub_25BAA4C30();
      swift_allocObject();
      sub_25BAA4C20();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A533908);
      sub_25BA9F120();
      v118 = (void *)v42;
      sub_25BAA4C10();
      swift_release();
      sub_25BA7FD68((uint64_t)v118, v43);
      unint64_t v41 = v120;
    }
    unint64_t v44 = (unint64_t *)(v29 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_sessions);
    swift_beginAccess();
    unint64_t *v44 = v41;
    swift_bridgeObjectRelease();
    uint64_t v45 = swift_bridgeObjectRetain();
    uint64_t v46 = sub_25BA9EA38(v45);
    v118 = 0;
    swift_bridgeObjectRelease();
    uint64_t v47 = (uint64_t *)(v29 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_interpretedSessionInfo);
    swift_beginAccess();
    uint64_t *v47 = v46;
    swift_bridgeObjectRelease();
    uint64_t v34 = &unk_26B34B000;
    uint64_t v36 = (uint64_t)v114;
    uint64_t v35 = (uint64_t)v101;
  }
  uint64_t v48 = v105;
  uint64_t v49 = (uint64_t *)(v29 + v34[152]);
  swift_beginAccess();
  uint64_t v50 = *v49;
  if (!*(void *)(*v49 + 16))
  {
    uint64_t v54 = v103;
    (*(void (**)(unint64_t, uint64_t, uint64_t, uint64_t))(v119 + 56))(v103, 1, 1, v48);
LABEL_15:
    sub_25BA798DC(v54, &qword_26A533920);
    sub_25BA99F98();
    swift_allocError();
    unsigned char *v59 = 1;
    swift_willThrow();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v26 + 8))(v35, v102);
  }
  uint64_t v100 = v49;
  swift_bridgeObjectRetain();
  unint64_t v51 = sub_25BA77164(v37);
  uint64_t v53 = v119;
  if (v52)
  {
    uint64_t v54 = v103;
    sub_25BAA2C64(*(void *)(v50 + 56) + *(void *)(v119 + 72) * v51, v103, type metadata accessor for Session);
    uint64_t v55 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v53 + 56);
    unint64_t v56 = v54;
    uint64_t v57 = 0;
  }
  else
  {
    uint64_t v55 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v119 + 56);
    uint64_t v54 = v103;
    unint64_t v56 = v103;
    uint64_t v57 = 1;
  }
  uint64_t v99 = v55;
  v55(v56, v57, 1, v48);
  uint64_t v58 = v117;
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v53 + 48))(v54, 1, v48) == 1) {
    goto LABEL_15;
  }
  uint64_t v101 = (char *)v35;
  sub_25BAA2B9C(v54, v36, type metadata accessor for Session);
  char v60 = *(unsigned char *)(v36 + *(int *)(v48 + 20));
  uint64_t v61 = v36 + *(int *)(v48 + 24);
  uint64_t v98 = v26;
  if ((v60 & 1) == 0)
  {
    sub_25BAA4D10();
    uint64_t v68 = v104;
    sub_25BAA4D30();
    char v69 = sub_25BAA4D00();
    uint64_t v64 = v110;
    uint64_t v70 = v115;
    uint64_t v71 = v58;
    uint64_t v72 = *(void (**)(char *, uint64_t))(v115 + 8);
    v72(v68, v110);
    v72(v71, v64);
    if (v69)
    {
      uint64_t v73 = *(char **)(v70 + 56);
      unint64_t v103 = (v70 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
      uint64_t v63 = (uint64_t)v111;
      uint64_t v104 = v73;
      ((void (*)(char *, uint64_t, uint64_t, uint64_t))v73)(v111, 1, 1, v64);
      uint64_t v62 = v70;
      uint64_t v67 = v116;
      goto LABEL_23;
    }
    uint64_t v63 = (uint64_t)v111;
    sub_25BAA4D10();
    uint64_t v75 = v70 + 56;
    uint64_t v74 = *(char **)(v70 + 56);
    ((void (*)(uint64_t, void, uint64_t, uint64_t))v74)(v63, 0, 1, v64);
    int v76 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v70 + 48))(v63, 1, v64);
    uint64_t v62 = v70;
    uint64_t v36 = (uint64_t)v114;
    uint64_t v67 = v116;
    if (v76 == 1)
    {
      unint64_t v103 = v75 & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
      uint64_t v104 = v74;
      goto LABEL_23;
    }
LABEL_25:
    sub_25BA798DC(v63, &qword_26A533348);
    sub_25BA99F98();
    swift_allocError();
    *uint64_t v95 = 2;
    swift_willThrow();
    sub_25BAA2C04(v36, type metadata accessor for Session);
    return (*(uint64_t (**)(char *, uint64_t))(v98 + 8))(v101, v102);
  }
  uint64_t v62 = v115;
  uint64_t v63 = (uint64_t)v111;
  uint64_t v64 = v110;
  (*(void (**)(char *, uint64_t, uint64_t))(v115 + 16))(v111, v61, v110);
  uint64_t v65 = *(char **)(v62 + 56);
  ((void (*)(uint64_t, void, uint64_t, uint64_t))v65)(v63, 0, 1, v64);
  int v66 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v62 + 48))(v63, 1, v64);
  uint64_t v67 = v116;
  if (v66 != 1) {
    goto LABEL_25;
  }
  unint64_t v103 = (v62 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
  uint64_t v104 = v65;
LABEL_23:
  sub_25BA798DC(v63, &qword_26A533348);
  uint64_t v77 = v121;
  uint64_t v97 = v29;
  sub_25BA9B70C(v121);
  uint64_t v78 = v113;
  sub_25BAA4D30();
  unint64_t v111 = *(char **)(v108 + 16);
  ((void (*)(uint64_t, uint64_t, uint64_t))v111)(v67, v77, v112);
  uint64_t v79 = *(void (**)(char *, char *, uint64_t))(v62 + 16);
  uint64_t v80 = (uint64_t)v106;
  v79(v106, v114, v64);
  uint64_t v81 = v105;
  v79((char *)(v80 + *(int *)(v105 + 24)), v78, v64);
  *(unsigned char *)(v80 + *(int *)(v81 + 20)) = 1;
  uint64_t v82 = v81;
  uint64_t v83 = v78;
  v99(v80, 0, 1, v82);
  swift_beginAccess();
  uint64_t v84 = v116;
  sub_25BA98F80(v80, v116);
  swift_endAccess();
  ((void (*)(uint64_t, uint64_t, uint64_t))v111)(v84, v77, v112);
  uint64_t v85 = (uint64_t)v114;
  uint64_t v86 = (uint64_t)v117;
  v79(v117, v114, v64);
  uint64_t v87 = v107;
  v79(v107, v83, v64);
  ((void (*)(char *, void, uint64_t, uint64_t))v104)(v87, 0, 1, v64);
  uint64_t v88 = v109;
  uint64_t v89 = (uint64_t)v87;
  uint64_t v90 = v97;
  sub_25BA7A944(v86, v89, v109);
  uint64_t v91 = type metadata accessor for CompanionDevice.SessionInfo(0);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v91 - 8) + 56))(v88, 0, 1, v91);
  swift_beginAccess();
  sub_25BA991FC(v88, v84);
  swift_endAccess();
  uint64_t v92 = (void *)swift_bridgeObjectRetain();
  uint64_t v93 = (uint64_t)v101;
  uint64_t v94 = (uint64_t)v118;
  sub_25BAA296C(v92, (uint64_t)v101);
  swift_bridgeObjectRelease();
  if (!v94)
  {
    sub_25BA987FC();
    objc_msgSend(*(id *)(v90 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_notificationCenter), sel_postNotificationName_object_, *(void *)(v90 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_remoteNotificationName), 0);
  }
  (*(void (**)(char *, uint64_t))(v115 + 8))(v113, v64);
  sub_25BAA2C04(v85, type metadata accessor for Session);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v98 + 8))(v93, v102);
}

uint64_t sub_25BA9D1C4()
{
  sub_25BA798DC(v0 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_plistURL, &qword_26B34AE90);
  sub_25BAA2CCC(*(void *)(v0 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_deadlineTimer));

  sub_25BA9A590(*(void *)(v0 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_observer), *(void *)(v0 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_observer + 8), *(void *)(v0 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_observer + 16));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25BAA2CCC(*(void *)(v0 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_keepAliveTimer));
  return v0;
}

uint64_t sub_25BA9D294()
{
  sub_25BA9D1C4();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_25BA9D2EC()
{
  uint64_t v0 = type metadata accessor for SessionManager(0);
  uint64_t v1 = sub_25BA9A548(&qword_26A5338F8, (void (*)(uint64_t))type metadata accessor for SessionManager);
  return sub_25BA95CF0(v0, v1);
}

id sub_25BA9D360()
{
  return *(id *)(v0 + 16);
}

uint64_t sub_25BA9D368()
{
  return 0;
}

void sub_25BA9D374(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_25BA9D380(uint64_t a1)
{
  unint64_t v2 = sub_25BAA4794();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25BA9D3BC(uint64_t a1)
{
  unint64_t v2 = sub_25BAA4794();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25BA9D3F8(void *a1, int a2)
{
  int v18 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533A18);
  uint64_t v16 = *(void *)(v3 - 8);
  uint64_t v17 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533A20);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533A28);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v15 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25BAA46EC();
  sub_25BAA5650();
  if (v18)
  {
    char v20 = 1;
    sub_25BAA4740();
    sub_25BAA5500();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v17);
  }
  else
  {
    char v19 = 0;
    sub_25BAA4794();
    sub_25BAA5500();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

uint64_t sub_25BA9D6A0()
{
  if (*v0) {
    return 0x6465646E65;
  }
  else {
    return 0x657669746361;
  }
}

uint64_t sub_25BA9D6D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25BAA4080(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25BA9D6FC(uint64_t a1)
{
  unint64_t v2 = sub_25BAA46EC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25BA9D738(uint64_t a1)
{
  unint64_t v2 = sub_25BAA46EC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25BA9D774@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_25BA9D7A4(uint64_t a1)
{
  unint64_t v2 = sub_25BAA4740();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25BA9D7E0(uint64_t a1)
{
  unint64_t v2 = sub_25BAA4740();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25BA9D81C@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_25BAA4164(a1);
  if (!v2) {
    *a2 = result & 1;
  }
  return result;
}

uint64_t sub_25BA9D84C(void *a1)
{
  return sub_25BA9D3F8(a1, *v1);
}

uint64_t sub_25BA9D878(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533990);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25BAA38B0();
  sub_25BAA5650();
  char v14 = 0;
  sub_25BAA4D40();
  sub_25BA9A548(&qword_26A533998, MEMORY[0x263F07490]);
  sub_25BAA5520();
  if (!v2)
  {
    char v13 = *(unsigned char *)(v3 + *(int *)(type metadata accessor for Session(0) + 20));
    char v12 = 1;
    sub_25BAA3958();
    sub_25BAA5520();
    char v11 = 2;
    sub_25BAA5520();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_25BA9DA84@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v24 = a2;
  uint64_t v28 = sub_25BAA4D40();
  uint64_t v25 = *(void *)(v28 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v28);
  uint64_t v6 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v27 = (char *)v21 - v7;
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533970);
  uint64_t v26 = *(void *)(v29 - 8);
  MEMORY[0x270FA5388](v29);
  uint64_t v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Session(0);
  MEMORY[0x270FA5388](v10);
  char v12 = (char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25BAA38B0();
  sub_25BAA5640();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  uint64_t v22 = v6;
  uint64_t v23 = a1;
  uint64_t v13 = (uint64_t)v12;
  char v33 = 0;
  uint64_t v14 = sub_25BA9A548(&qword_26A533978, MEMORY[0x263F07490]);
  uint64_t v16 = v27;
  uint64_t v15 = v28;
  sub_25BAA54E0();
  v21[1] = v14;
  uint64_t v17 = v16;
  int v18 = *(void (**)(char *, char *, uint64_t))(v25 + 32);
  v18(v12, v17, v15);
  char v31 = 1;
  sub_25BAA3904();
  sub_25BAA54E0();
  uint64_t v27 = (char *)v18;
  v12[*(int *)(v10 + 20)] = v32;
  char v30 = 2;
  char v19 = v22;
  sub_25BAA54E0();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v9, v29);
  ((void (*)(uint64_t, char *, uint64_t))v27)(v13 + *(int *)(v10 + 24), v19, v15);
  sub_25BAA2C64(v13, v24, type metadata accessor for Session);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v23);
  return sub_25BAA2C04(v13, type metadata accessor for Session);
}

uint64_t sub_25BA9DEAC()
{
  uint64_t v1 = 0x6574617473;
  if (*v0 != 1) {
    uint64_t v1 = 1716482913;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x7472617473;
  }
}

uint64_t sub_25BA9DEF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25BAA45B4(a1, a2);
  *a3 = result;
  return result;
}

void sub_25BA9DF20(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_25BA9DF2C(uint64_t a1)
{
  unint64_t v2 = sub_25BAA38B0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25BA9DF68(uint64_t a1)
{
  unint64_t v2 = sub_25BAA38B0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25BA9DFA4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_25BA9DA84(a1, a2);
}

uint64_t sub_25BA9DFBC(void *a1)
{
  return sub_25BA9D878(a1);
}

uint64_t sub_25BA9DFD4(uint64_t a1, uint64_t a2)
{
  return sub_25BA9E270(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_25BA9DFEC(uint64_t a1, id *a2)
{
  uint64_t result = sub_25BAA5060();
  *a2 = 0;
  return result;
}

uint64_t sub_25BA9E064(uint64_t a1, id *a2)
{
  char v3 = sub_25BAA5070();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_25BA9E0E4@<X0>(uint64_t *a1@<X8>)
{
  sub_25BAA5080();
  uint64_t v2 = sub_25BAA5050();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_25BA9E128@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_25BAA5050();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_25BA9E170@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25BAA5080();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25BA9E19C(uint64_t a1)
{
  uint64_t v2 = sub_25BA9A548(&qword_26A533980, (void (*)(uint64_t))type metadata accessor for Name);
  uint64_t v3 = sub_25BA9A548(&qword_26A533988, (void (*)(uint64_t))type metadata accessor for Name);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_25BA9E258(uint64_t a1, uint64_t a2)
{
  return sub_25BA9E270(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_25BA9E270(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_25BAA5080();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_25BA9E2B4()
{
  sub_25BAA5080();
  sub_25BAA50A0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25BA9E308()
{
  sub_25BAA5080();
  sub_25BAA55F0();
  sub_25BAA50A0();
  uint64_t v0 = sub_25BAA5630();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_25BA9E37C()
{
  uint64_t v0 = sub_25BAA5080();
  uint64_t v2 = v1;
  if (v0 == sub_25BAA5080() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_25BAA5570();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_25BA9E408(uint64_t a1, uint64_t a2)
{
  uint64_t v56 = type metadata accessor for CompanionDevice.SessionInfo(0);
  uint64_t v60 = *(void *)(v56 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v56);
  uint64_t v55 = (uint64_t)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v46 - v6;
  uint64_t v61 = sub_25BAA4DA0();
  uint64_t v54 = *(void *)(v61 - 8);
  MEMORY[0x270FA5388](v61);
  uint64_t v57 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5339A8);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  char v12 = (char *)&v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v10);
  uint64_t v15 = (char *)&v46 - v14;
  if (a1 == a2) {
    return 1;
  }
  if (*(void *)(a1 + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  uint64_t v53 = a2;
  int64_t v58 = 0;
  uint64_t v50 = a1;
  uint64_t v18 = *(void *)(a1 + 64);
  uint64_t v17 = a1 + 64;
  uint64_t v16 = v18;
  uint64_t v19 = 1 << *(unsigned char *)(v17 - 32);
  uint64_t v20 = -1;
  if (v19 < 64) {
    uint64_t v20 = ~(-1 << v19);
  }
  unint64_t v21 = v20 & v16;
  uint64_t v49 = v54 + 16;
  unint64_t v51 = (void (**)(uint64_t, uint64_t))(v54 + 8);
  char v52 = (void (**)(uint64_t, char *, uint64_t))(v54 + 32);
  uint64_t v47 = v17;
  int64_t v48 = (unint64_t)(v19 + 63) >> 6;
  int64_t v46 = v48 - 1;
  uint64_t v22 = (uint64_t)v57;
  while (1)
  {
    if (v21)
    {
      unint64_t v23 = __clz(__rbit64(v21));
      uint64_t v24 = (v21 - 1) & v21;
      unint64_t v25 = v23 | (v58 << 6);
LABEL_8:
      uint64_t v26 = v50;
      (*(void (**)(char *, unint64_t, uint64_t))(v54 + 16))(v12, *(void *)(v50 + 48) + *(void *)(v54 + 72) * v25, v61);
      uint64_t v27 = *(void *)(v26 + 56) + *(void *)(v60 + 72) * v25;
      uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5339B0);
      sub_25BAA2C64(v27, (uint64_t)&v12[*(int *)(v28 + 48)], type metadata accessor for CompanionDevice.SessionInfo);
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v12, 0, 1, v28);
      goto LABEL_30;
    }
    int64_t v29 = v58 + 1;
    if (__OFADD__(v58, 1))
    {
      __break(1u);
      goto LABEL_39;
    }
    if (v29 < v48)
    {
      unint64_t v30 = *(void *)(v47 + 8 * v29);
      if (v30) {
        goto LABEL_12;
      }
      int64_t v31 = v58 + 2;
      ++v58;
      if (v29 + 1 < v48)
      {
        unint64_t v30 = *(void *)(v47 + 8 * v31);
        if (v30) {
          goto LABEL_15;
        }
        int64_t v58 = v29 + 1;
        if (v29 + 2 < v48)
        {
          unint64_t v30 = *(void *)(v47 + 8 * (v29 + 2));
          if (v30)
          {
            v29 += 2;
            goto LABEL_12;
          }
          int64_t v58 = v29 + 2;
          if (v29 + 3 < v48)
          {
            unint64_t v30 = *(void *)(v47 + 8 * (v29 + 3));
            if (v30)
            {
              v29 += 3;
              goto LABEL_12;
            }
            int64_t v31 = v29 + 4;
            int64_t v58 = v29 + 3;
            if (v29 + 4 < v48) {
              break;
            }
          }
        }
      }
    }
LABEL_29:
    uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5339B0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v12, 1, 1, v32);
    uint64_t v24 = 0;
LABEL_30:
    sub_25BA7C760((uint64_t)v12, (uint64_t)v15, &qword_26A5339A8);
    uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5339B0);
    int v34 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v33 - 8) + 48))(v15, 1, v33);
    BOOL v59 = v34 == 1;
    if (v34 == 1) {
      return v59;
    }
    unint64_t v35 = v24;
    uint64_t v36 = (uint64_t)&v15[*(int *)(v33 + 48)];
    uint64_t v37 = v15;
    uint64_t v38 = v15;
    uint64_t v39 = v61;
    (*v52)(v22, v38, v61);
    sub_25BAA2B9C(v36, (uint64_t)v7, type metadata accessor for CompanionDevice.SessionInfo);
    uint64_t v40 = v53;
    unint64_t v41 = sub_25BA77164(v22);
    char v43 = v42;
    (*v51)(v22, v39);
    if ((v43 & 1) == 0)
    {
      sub_25BAA2C04((uint64_t)v7, type metadata accessor for CompanionDevice.SessionInfo);
      return 0;
    }
    uint64_t v44 = v55;
    sub_25BAA2C64(*(void *)(v40 + 56) + *(void *)(v60 + 72) * v41, v55, type metadata accessor for CompanionDevice.SessionInfo);
    sub_25BA9A548(&qword_26A533380, (void (*)(uint64_t))type metadata accessor for CompanionDevice.SessionInfo);
    char v45 = sub_25BAA5040();
    sub_25BAA2C04(v44, type metadata accessor for CompanionDevice.SessionInfo);
    uint64_t result = sub_25BAA2C04((uint64_t)v7, type metadata accessor for CompanionDevice.SessionInfo);
    uint64_t v15 = v37;
    unint64_t v21 = v35;
    if ((v45 & 1) == 0) {
      return v59;
    }
  }
  unint64_t v30 = *(void *)(v47 + 8 * v31);
  if (v30)
  {
LABEL_15:
    int64_t v29 = v31;
LABEL_12:
    uint64_t v24 = (v30 - 1) & v30;
    unint64_t v25 = __clz(__rbit64(v30)) + (v29 << 6);
    int64_t v58 = v29;
    goto LABEL_8;
  }
  while (1)
  {
    int64_t v29 = v31 + 1;
    if (__OFADD__(v31, 1)) {
      break;
    }
    if (v29 >= v48)
    {
      int64_t v58 = v46;
      goto LABEL_29;
    }
    unint64_t v30 = *(void *)(v47 + 8 * v29);
    ++v31;
    if (v30) {
      goto LABEL_12;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_25BA9EA38(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533348);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = &v56[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_25BAA4D40();
  uint64_t v80 = *(char **)(v5 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v61 = &v56[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v60 = &v56[-v9];
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = &v56[-v10];
  uint64_t v12 = type metadata accessor for CompanionDevice.SessionInfo(0);
  uint64_t v75 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v74 = &v56[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v14 = type metadata accessor for Session(0);
  uint64_t v72 = *(void *)(v14 - 8);
  uint64_t v73 = v14;
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = &v56[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v17 = sub_25BAA4DA0();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v82 = &v56[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v19);
  uint64_t v70 = &v56[-v21];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5339D0);
  uint64_t result = sub_25BAA5460();
  int64_t v23 = 0;
  uint64_t v76 = a1;
  uint64_t v26 = *(void *)(a1 + 64);
  uint64_t v25 = a1 + 64;
  uint64_t v24 = v26;
  uint64_t v27 = 1 << *(unsigned char *)(v25 - 32);
  uint64_t v28 = -1;
  if (v27 < 64) {
    uint64_t v28 = ~(-1 << v27);
  }
  unint64_t v29 = v28 & v24;
  uint64_t v62 = v25;
  int64_t v63 = (unint64_t)(v27 + 63) >> 6;
  uint64_t v30 = v18 + 16;
  uint64_t v71 = v18;
  uint64_t v81 = v18 + 32;
  int64_t v31 = (void *)result;
  uint64_t v68 = (void (**)(unsigned char *, unsigned char *, uint64_t))(v80 + 16);
  uint64_t v69 = v30;
  BOOL v59 = (void (**)(unsigned char *, uint64_t))(v80 + 8);
  uint64_t v66 = result + 64;
  uint64_t v67 = (void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v80 + 56);
  uint64_t v64 = (void *)result;
  int64_t v58 = v4;
  uint64_t v57 = v11;
  uint64_t v65 = v17;
  if (!v29) {
    goto LABEL_5;
  }
LABEL_4:
  uint64_t v77 = (v29 - 1) & v29;
  int64_t v78 = v23;
  for (unint64_t i = __clz(__rbit64(v29)) | (v23 << 6); ; unint64_t i = __clz(__rbit64(v34)) + (v35 << 6))
  {
    uint64_t v37 = v76;
    uint64_t v38 = *(void *)(v76 + 48);
    uint64_t v40 = v70;
    uint64_t v39 = v71;
    unint64_t v79 = *(void *)(v71 + 72) * i;
    (*(void (**)(unsigned char *, unint64_t, uint64_t))(v71 + 16))(v70, v38 + v79, v17);
    sub_25BAA2C64(*(void *)(v37 + 56) + *(void *)(v72 + 72) * i, (uint64_t)v16, type metadata accessor for Session);
    unint64_t v41 = *(char **)(v39 + 32);
    ((void (*)(unsigned char *, unsigned char *, uint64_t))v41)(v82, v40, v17);
    char v42 = *v68;
    (*v68)(v11, v16, v5);
    char v43 = v16[*(int *)(v73 + 20)];
    uint64_t v44 = v16;
    char v45 = &v16[*(int *)(v73 + 24)];
    uint64_t v80 = v41;
    if (v43)
    {
      v42(v4, v45, v5);
      uint64_t v46 = 0;
    }
    else
    {
      uint64_t v47 = v60;
      sub_25BAA4D10();
      int64_t v48 = v61;
      sub_25BAA4D30();
      char v49 = sub_25BAA4D00();
      uint64_t v50 = *v59;
      (*v59)(v48, v5);
      v50(v47, v5);
      if (v49)
      {
        uint64_t v46 = 1;
        uint64_t v4 = v58;
      }
      else
      {
        uint64_t v4 = v58;
        sub_25BAA4D10();
        uint64_t v46 = 0;
      }
      uint64_t v11 = v57;
    }
    uint64_t v16 = v44;
    int64_t v31 = v64;
    uint64_t v17 = v65;
    unint64_t v51 = v79;
    (*v67)(v4, v46, 1, v5);
    char v52 = v74;
    sub_25BA7A944((uint64_t)v11, (uint64_t)v4, (uint64_t)v74);
    sub_25BAA2C04((uint64_t)v16, type metadata accessor for Session);
    *(void *)(v66 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    ((void (*)(unint64_t, unsigned char *, uint64_t))v80)(v31[6] + v51, v82, v17);
    uint64_t result = sub_25BAA2B9C((uint64_t)v52, v31[7] + *(void *)(v75 + 72) * i, type metadata accessor for CompanionDevice.SessionInfo);
    uint64_t v53 = v31[2];
    BOOL v54 = __OFADD__(v53, 1);
    uint64_t v55 = v53 + 1;
    if (v54)
    {
      __break(1u);
LABEL_30:
      __break(1u);
      goto LABEL_31;
    }
    v31[2] = v55;
    unint64_t v29 = v77;
    int64_t v23 = v78;
    if (v77) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v33 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      goto LABEL_30;
    }
    if (v33 >= v63) {
      return (uint64_t)v31;
    }
    unint64_t v34 = *(void *)(v62 + 8 * v33);
    int64_t v35 = v23 + 1;
    if (!v34)
    {
      int64_t v35 = v23 + 2;
      if (v23 + 2 >= v63) {
        return (uint64_t)v31;
      }
      unint64_t v34 = *(void *)(v62 + 8 * v35);
      if (!v34)
      {
        int64_t v35 = v23 + 3;
        if (v23 + 3 >= v63) {
          return (uint64_t)v31;
        }
        unint64_t v34 = *(void *)(v62 + 8 * v35);
        if (!v34) {
          break;
        }
      }
    }
LABEL_18:
    uint64_t v77 = (v34 - 1) & v34;
    int64_t v78 = v35;
  }
  uint64_t v36 = v23 + 4;
  if (v23 + 4 >= v63) {
    return (uint64_t)v31;
  }
  unint64_t v34 = *(void *)(v62 + 8 * v36);
  if (v34)
  {
    int64_t v35 = v23 + 4;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v35 = v36 + 1;
    if (__OFADD__(v36, 1)) {
      break;
    }
    if (v35 >= v63) {
      return (uint64_t)v31;
    }
    unint64_t v34 = *(void *)(v62 + 8 * v35);
    ++v36;
    if (v34) {
      goto LABEL_18;
    }
  }
LABEL_31:
  __break(1u);
  return result;
}

unint64_t sub_25BA9F120()
{
  unint64_t result = qword_26A533910;
  if (!qword_26A533910)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A533908);
    sub_25BA9A548(&qword_26A533918, MEMORY[0x263F07508]);
    sub_25BAA3BB0(qword_26A534F90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A533910);
  }
  return result;
}

uint64_t type metadata accessor for Session(uint64_t a1)
{
  return sub_25BA7B994(a1, qword_26A535220);
}

uint64_t sub_25BA9F208(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5338D8);
  uint64_t v5 = *(void *)(v53 - 8);
  MEMORY[0x270FA5388](v53);
  char v52 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25BAA4DA0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5339F0);
  int v50 = a2;
  uint64_t v12 = sub_25BAA5470();
  uint64_t v13 = v12;
  if (!*(void *)(v11 + 16)) {
    goto LABEL_41;
  }
  uint64_t v14 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v15 = *(void *)(v11 + 64);
  uint64_t v44 = (void *)(v11 + 64);
  if (v14 < 64) {
    uint64_t v16 = ~(-1 << v14);
  }
  else {
    uint64_t v16 = -1;
  }
  unint64_t v17 = v16 & v15;
  char v42 = v2;
  int64_t v43 = (unint64_t)(v14 + 63) >> 6;
  uint64_t v45 = v5 + 16;
  uint64_t v46 = (void (**)(char *, unint64_t, uint64_t))(v8 + 16);
  uint64_t v48 = v5;
  uint64_t v49 = v8;
  uint64_t v18 = (void (**)(char *, unint64_t, uint64_t))(v8 + 32);
  unint64_t v51 = (uint64_t (**)(unint64_t, char *, uint64_t))(v5 + 32);
  uint64_t v19 = v12 + 64;
  uint64_t result = swift_retain();
  int64_t v21 = 0;
  for (i = v11; ; uint64_t v11 = i)
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
    if (v25 >= v43) {
      break;
    }
    uint64_t v26 = v44;
    unint64_t v27 = v44[v25];
    ++v21;
    if (!v27)
    {
      int64_t v21 = v25 + 1;
      if (v25 + 1 >= v43) {
        goto LABEL_34;
      }
      unint64_t v27 = v44[v21];
      if (!v27)
      {
        int64_t v28 = v25 + 2;
        if (v28 >= v43)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v42;
          if ((v50 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v27 = v44[v28];
        if (!v27)
        {
          while (1)
          {
            int64_t v21 = v28 + 1;
            if (__OFADD__(v28, 1)) {
              goto LABEL_43;
            }
            if (v21 >= v43) {
              goto LABEL_34;
            }
            unint64_t v27 = v44[v21];
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
    uint64_t v29 = *(void *)(v49 + 72);
    unint64_t v30 = *(void *)(v11 + 48) + v29 * v24;
    if (v50)
    {
      (*v18)(v10, v30, v7);
      uint64_t v31 = *(void *)(v11 + 56);
      uint64_t v32 = *(void *)(v48 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v48 + 32))(v52, v31 + v32 * v24, v53);
    }
    else
    {
      (*v46)(v10, v30, v7);
      uint64_t v33 = *(void *)(v11 + 56);
      uint64_t v32 = *(void *)(v48 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v48 + 16))(v52, v33 + v32 * v24, v53);
    }
    sub_25BA9A548(&qword_26A5332E0, MEMORY[0x263F07508]);
    uint64_t result = sub_25BAA5020();
    uint64_t v34 = -1 << *(unsigned char *)(v13 + 32);
    unint64_t v35 = result & ~v34;
    unint64_t v36 = v35 >> 6;
    if (((-1 << v35) & ~*(void *)(v19 + 8 * (v35 >> 6))) != 0)
    {
      unint64_t v22 = __clz(__rbit64((-1 << v35) & ~*(void *)(v19 + 8 * (v35 >> 6)))) | v35 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v37 = 0;
      unint64_t v38 = (unint64_t)(63 - v34) >> 6;
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
    (*v18)((char *)(*(void *)(v13 + 48) + v29 * v22), (unint64_t)v10, v7);
    uint64_t result = (*v51)(*(void *)(v13 + 56) + v32 * v22, v52, v53);
    ++*(void *)(v13 + 16);
  }
  swift_release();
  uint64_t v3 = v42;
  uint64_t v26 = v44;
  if ((v50 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v41 = 1 << *(unsigned char *)(v11 + 32);
  if (v41 >= 64) {
    bzero(v26, ((unint64_t)(v41 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v26 = -1 << v41;
  }
  *(void *)(v11 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v13;
  return result;
}

uint64_t sub_25BA9F708(uint64_t a1, int a2, uint64_t (*a3)(void), uint64_t *a4, uint64_t (*a5)(void))
{
  int64_t v58 = a5;
  uint64_t v7 = v5;
  uint64_t v9 = a3(0);
  uint64_t v52 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v57 = (uint64_t)&v47 - v10;
  uint64_t v11 = sub_25BAA4DA0();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  BOOL v54 = (char *)&v47 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *v5;
  __swift_instantiateConcreteTypeFromMangledName(a4);
  int v53 = a2;
  uint64_t v15 = v14;
  uint64_t v16 = sub_25BAA5470();
  uint64_t v17 = v16;
  if (!*(void *)(v14 + 16)) {
    goto LABEL_41;
  }
  uint64_t v18 = 1 << *(unsigned char *)(v14 + 32);
  uint64_t v19 = *(void *)(v14 + 64);
  uint64_t v49 = (void *)(v14 + 64);
  if (v18 < 64) {
    uint64_t v20 = ~(-1 << v18);
  }
  else {
    uint64_t v20 = -1;
  }
  unint64_t v21 = v20 & v19;
  uint64_t v47 = v5;
  int64_t v48 = (unint64_t)(v18 + 63) >> 6;
  int v50 = (void (**)(char *, unint64_t, uint64_t))(v12 + 16);
  uint64_t v55 = (void (**)(char *, unint64_t, uint64_t))(v12 + 32);
  uint64_t v56 = v11;
  uint64_t v22 = v16 + 64;
  uint64_t result = swift_retain();
  int64_t v24 = 0;
  uint64_t v51 = v15;
  int64_t v25 = v54;
  while (1)
  {
    if (v21)
    {
      unint64_t v27 = __clz(__rbit64(v21));
      v21 &= v21 - 1;
      unint64_t v28 = v27 | (v24 << 6);
      goto LABEL_22;
    }
    int64_t v29 = v24 + 1;
    if (__OFADD__(v24, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v29 >= v48) {
      break;
    }
    unint64_t v30 = v49;
    unint64_t v31 = v49[v29];
    ++v24;
    if (!v31)
    {
      int64_t v24 = v29 + 1;
      if (v29 + 1 >= v48) {
        goto LABEL_34;
      }
      unint64_t v31 = v49[v24];
      if (!v31)
      {
        int64_t v32 = v29 + 2;
        if (v32 >= v48)
        {
LABEL_34:
          swift_release();
          uint64_t v7 = v47;
          if ((v53 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v31 = v49[v32];
        if (!v31)
        {
          while (1)
          {
            int64_t v24 = v32 + 1;
            if (__OFADD__(v32, 1)) {
              goto LABEL_43;
            }
            if (v24 >= v48) {
              goto LABEL_34;
            }
            unint64_t v31 = v49[v24];
            ++v32;
            if (v31) {
              goto LABEL_21;
            }
          }
        }
        int64_t v24 = v32;
      }
    }
LABEL_21:
    unint64_t v21 = (v31 - 1) & v31;
    unint64_t v28 = __clz(__rbit64(v31)) + (v24 << 6);
    int64_t v25 = v54;
LABEL_22:
    uint64_t v33 = v12;
    uint64_t v34 = *(void *)(v12 + 72);
    unint64_t v35 = *(void *)(v15 + 48) + v34 * v28;
    if (v53)
    {
      (*v55)(v25, v35, v56);
      uint64_t v36 = *(void *)(v15 + 56);
      uint64_t v37 = *(void *)(v52 + 72);
      sub_25BAA2B9C(v36 + v37 * v28, v57, v58);
    }
    else
    {
      (*v50)(v25, v35, v56);
      uint64_t v38 = *(void *)(v15 + 56);
      uint64_t v37 = *(void *)(v52 + 72);
      sub_25BAA2C64(v38 + v37 * v28, v57, v58);
    }
    sub_25BA9A548(&qword_26A5332E0, MEMORY[0x263F07508]);
    uint64_t result = sub_25BAA5020();
    uint64_t v39 = -1 << *(unsigned char *)(v17 + 32);
    unint64_t v40 = result & ~v39;
    unint64_t v41 = v40 >> 6;
    if (((-1 << v40) & ~*(void *)(v22 + 8 * (v40 >> 6))) != 0)
    {
      unint64_t v26 = __clz(__rbit64((-1 << v40) & ~*(void *)(v22 + 8 * (v40 >> 6)))) | v40 & 0x7FFFFFFFFFFFFFC0;
      int64_t v25 = v54;
    }
    else
    {
      char v42 = 0;
      unint64_t v43 = (unint64_t)(63 - v39) >> 6;
      int64_t v25 = v54;
      do
      {
        if (++v41 == v43 && (v42 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v44 = v41 == v43;
        if (v41 == v43) {
          unint64_t v41 = 0;
        }
        v42 |= v44;
        uint64_t v45 = *(void *)(v22 + 8 * v41);
      }
      while (v45 == -1);
      unint64_t v26 = __clz(__rbit64(~v45)) + (v41 << 6);
    }
    *(void *)(v22 + ((v26 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v26;
    (*v55)((char *)(*(void *)(v17 + 48) + v34 * v26), (unint64_t)v25, v56);
    uint64_t result = sub_25BAA2B9C(v57, *(void *)(v17 + 56) + v37 * v26, v58);
    ++*(void *)(v17 + 16);
    uint64_t v15 = v51;
    uint64_t v12 = v33;
  }
  swift_release();
  uint64_t v7 = v47;
  unint64_t v30 = v49;
  if ((v53 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v46 = 1 << *(unsigned char *)(v15 + 32);
  if (v46 >= 64) {
    bzero(v30, ((unint64_t)(v46 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v30 = -1 << v46;
  }
  *(void *)(v15 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v7 = v17;
  return result;
}

uint64_t sub_25BA9FBE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_25BA77164(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    uint64_t v21 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_25BAA0C44();
      uint64_t v9 = v21;
    }
    uint64_t v10 = *(void *)(v9 + 48);
    uint64_t v11 = sub_25BAA4DA0();
    (*(void (**)(unint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10 + *(void *)(*(void *)(v11 - 8) + 72) * v6, v11);
    uint64_t v12 = *(void *)(v9 + 56);
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5338D8);
    uint64_t v20 = *(void *)(v13 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v20 + 32))(a2, v12 + *(void *)(v20 + 72) * v6, v13);
    sub_25BA9FFB4(v6, v9);
    *uint64_t v3 = v9;
    swift_bridgeObjectRelease();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
    uint64_t v15 = a2;
    uint64_t v16 = 0;
    uint64_t v17 = v13;
  }
  else
  {
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5338D8);
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    uint64_t v17 = v18;
    uint64_t v15 = a2;
    uint64_t v16 = 1;
  }
  return v14(v15, v16, 1, v17);
}

uint64_t sub_25BA9FDC0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t (*a3)(void)@<X2>, uint64_t (*a4)(void)@<X3>, uint64_t *a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v11 = v6;
  swift_bridgeObjectRetain();
  unint64_t v14 = sub_25BA77164(a1);
  LOBYTE(a1) = v15;
  swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v17 = *v11;
    uint64_t v29 = *v11;
    uint64_t *v11 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_25BAA0FF0(a4, a5, a3);
      uint64_t v17 = v29;
    }
    uint64_t v18 = *(void *)(v17 + 48);
    uint64_t v19 = sub_25BAA4DA0();
    (*(void (**)(unint64_t, uint64_t))(*(void *)(v19 - 8) + 8))(v18 + *(void *)(*(void *)(v19 - 8) + 72) * v14, v19);
    uint64_t v20 = *(void *)(v17 + 56);
    uint64_t v21 = a2(0);
    uint64_t v28 = *(void *)(v21 - 8);
    sub_25BAA2B9C(v20 + *(void *)(v28 + 72) * v14, a6, a3);
    sub_25BAA0300(v14, v17, a4);
    uint64_t *v11 = v17;
    swift_bridgeObjectRelease();
    uint64_t v22 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v28 + 56);
    uint64_t v23 = a6;
    uint64_t v24 = 0;
    uint64_t v25 = v21;
  }
  else
  {
    uint64_t v26 = a2(0);
    uint64_t v22 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56);
    uint64_t v25 = v26;
    uint64_t v23 = a6;
    uint64_t v24 = 1;
  }
  return v22(v23, v24, 1, v25);
}

unint64_t sub_25BA9FFB4(int64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25BAA4DA0();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a2 + 64;
  uint64_t v10 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v11 = (a1 + 1) & ~v10;
  if (((1 << v11) & *(void *)(a2 + 64 + 8 * (v11 >> 6))) != 0)
  {
    uint64_t v12 = ~v10;
    unint64_t result = sub_25BAA5370();
    if ((*(void *)(v9 + 8 * (v11 >> 6)) & (1 << v11)) != 0)
    {
      unint64_t v39 = (result + 1) & v12;
      unint64_t v14 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      uint64_t v13 = v5 + 16;
      uint64_t v15 = *(void *)(v13 + 56);
      uint64_t v40 = v13;
      uint64_t v37 = (uint64_t (**)(char *, uint64_t))(v13 - 8);
      uint64_t v38 = v14;
      uint64_t v36 = v12;
      do
      {
        uint64_t v16 = v9;
        uint64_t v17 = v15;
        int64_t v18 = v15 * v11;
        v38(v8, *(void *)(a2 + 48) + v15 * v11, v4);
        sub_25BA9A548(&qword_26A5332E0, MEMORY[0x263F07508]);
        uint64_t v19 = sub_25BAA5020();
        unint64_t result = (*v37)(v8, v4);
        unint64_t v20 = v19 & v12;
        if (a1 >= (uint64_t)v39)
        {
          if (v20 >= v39 && a1 >= (uint64_t)v20)
          {
LABEL_16:
            if (v17 * a1 < v18
              || *(void *)(a2 + 48) + v17 * a1 >= (unint64_t)(*(void *)(a2 + 48) + v18 + v17))
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (v17 * a1 != v18)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            uint64_t v23 = *(void *)(a2 + 56);
            uint64_t v24 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A5338D8) - 8) + 72);
            int64_t v25 = v24 * a1;
            unint64_t result = v23 + v24 * a1;
            int64_t v26 = v24 * v11;
            unint64_t v27 = v23 + v24 * v11 + v24;
            BOOL v28 = v25 < v26 || result >= v27;
            uint64_t v9 = v16;
            if (v28)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
              a1 = v11;
              uint64_t v12 = v36;
            }
            else
            {
              a1 = v11;
              uint64_t v12 = v36;
              if (v25 != v26)
              {
                unint64_t result = swift_arrayInitWithTakeBackToFront();
                a1 = v11;
              }
            }
            goto LABEL_5;
          }
        }
        else if (v20 >= v39 || a1 >= (uint64_t)v20)
        {
          goto LABEL_16;
        }
        uint64_t v9 = v16;
LABEL_5:
        unint64_t v11 = (v11 + 1) & v12;
        uint64_t v15 = v17;
      }
      while (((*(void *)(v9 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
    }
    uint64_t v29 = (uint64_t *)(v9 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v30 = *v29;
    uint64_t v31 = (-1 << a1) - 1;
  }
  else
  {
    uint64_t v29 = (uint64_t *)(v9 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v31 = *v29;
    uint64_t v30 = (-1 << a1) - 1;
  }
  *uint64_t v29 = v31 & v30;
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

unint64_t sub_25BAA0300(int64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v37 = a3;
  uint64_t v5 = sub_25BAA4DA0();
  uint64_t v6 = *(void *)(v5 - 8);
  unint64_t result = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = a2 + 64;
  uint64_t v11 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v12 = (a1 + 1) & ~v11;
  if (((1 << v12) & *(void *)(a2 + 64 + 8 * (v12 >> 6))) != 0)
  {
    uint64_t v13 = ~v11;
    unint64_t result = sub_25BAA5370();
    if ((*(void *)(v10 + 8 * (v12 >> 6)) & (1 << v12)) != 0)
    {
      unint64_t v40 = (result + 1) & v13;
      uint64_t v15 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
      uint64_t v14 = v6 + 16;
      uint64_t v16 = *(void *)(v14 + 56);
      uint64_t v41 = v14;
      uint64_t v38 = (uint64_t (**)(char *, uint64_t))(v14 - 8);
      unint64_t v39 = v15;
      uint64_t v36 = v13;
      do
      {
        uint64_t v17 = v10;
        uint64_t v18 = v16;
        int64_t v19 = v16 * v12;
        v39(v9, *(void *)(a2 + 48) + v16 * v12, v5);
        sub_25BA9A548(&qword_26A5332E0, MEMORY[0x263F07508]);
        uint64_t v20 = sub_25BAA5020();
        unint64_t result = (*v38)(v9, v5);
        unint64_t v21 = v20 & v13;
        if (a1 >= (uint64_t)v40)
        {
          if (v21 >= v40 && a1 >= (uint64_t)v21)
          {
LABEL_16:
            if (v18 * a1 < v19
              || *(void *)(a2 + 48) + v18 * a1 >= (unint64_t)(*(void *)(a2 + 48) + v19 + v18))
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (v18 * a1 != v19)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            uint64_t v24 = *(void *)(a2 + 56);
            uint64_t v25 = *(void *)(*(void *)(v37(0) - 8) + 72);
            int64_t v26 = v25 * a1;
            unint64_t result = v24 + v25 * a1;
            int64_t v27 = v25 * v12;
            unint64_t v28 = v24 + v25 * v12 + v25;
            BOOL v29 = v26 < v27 || result >= v28;
            uint64_t v10 = v17;
            if (v29)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
              a1 = v12;
              uint64_t v13 = v36;
            }
            else
            {
              a1 = v12;
              uint64_t v13 = v36;
              if (v26 != v27)
              {
                unint64_t result = swift_arrayInitWithTakeBackToFront();
                a1 = v12;
              }
            }
            goto LABEL_5;
          }
        }
        else if (v21 >= v40 || a1 >= (uint64_t)v21)
        {
          goto LABEL_16;
        }
        uint64_t v10 = v17;
LABEL_5:
        unint64_t v12 = (v12 + 1) & v13;
        uint64_t v16 = v18;
      }
      while (((*(void *)(v10 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12) & 1) != 0);
    }
    uint64_t v30 = (uint64_t *)(v10 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v31 = *v30;
    uint64_t v32 = (-1 << a1) - 1;
  }
  else
  {
    uint64_t v30 = (uint64_t *)(v10 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v32 = *v30;
    uint64_t v31 = (-1 << a1) - 1;
  }
  *uint64_t v30 = v32 & v31;
  uint64_t v33 = *(void *)(a2 + 16);
  BOOL v34 = __OFSUB__(v33, 1);
  uint64_t v35 = v33 - 1;
  if (v34)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v35;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_25BAA0654(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = sub_25BAA4DA0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v12 = (void *)*v3;
  unint64_t v14 = sub_25BA77164(a2);
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
      sub_25BAA0C44();
      goto LABEL_7;
    }
    sub_25BA9F208(v17, a3 & 1);
    unint64_t v28 = sub_25BA77164(a2);
    if ((v18 & 1) == (v29 & 1))
    {
      unint64_t v14 = v28;
      uint64_t v20 = *v4;
      if (v18) {
        goto LABEL_8;
      }
LABEL_13:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
      return sub_25BAA0A58(v14, (uint64_t)v11, a1, v20);
    }
LABEL_15:
    uint64_t result = sub_25BAA55A0();
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
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5338D8);
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v23 + 40);
  uint64_t v25 = v22;
  uint64_t v26 = v21 + *(void *)(v23 + 72) * v14;
  return v24(v26, a1, v25);
}

uint64_t sub_25BAA085C(uint64_t a1, uint64_t a2, char a3, uint64_t (*a4)(void), uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void))
{
  uint64_t v31 = a7;
  uint64_t v32 = a5;
  uint64_t v10 = (void **)v7;
  uint64_t v33 = a1;
  uint64_t v30 = sub_25BAA4DA0();
  uint64_t v13 = *(void *)(v30 - 8);
  MEMORY[0x270FA5388](v30);
  uint64_t v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  BOOL v16 = (void *)*v7;
  unint64_t v18 = sub_25BA77164(a2);
  uint64_t v19 = v16[2];
  BOOL v20 = (v17 & 1) == 0;
  uint64_t v21 = v19 + v20;
  if (__OFADD__(v19, v20))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v22 = v17;
  uint64_t v23 = v16[3];
  if (v23 >= v21 && (a3 & 1) != 0)
  {
LABEL_7:
    uint64_t v24 = *v10;
    if (v22)
    {
LABEL_8:
      uint64_t v25 = v24[7];
      uint64_t v26 = v31(0);
      return sub_25BAA3BF4(v33, v25 + *(void *)(*(void *)(v26 - 8) + 72) * v18, a4);
    }
    goto LABEL_11;
  }
  if (v23 >= v21 && (a3 & 1) == 0)
  {
    sub_25BAA0FF0(a4, v32, a6);
    goto LABEL_7;
  }
  sub_25BA9F708(v21, a3 & 1, a4, v32, a6);
  unint64_t v28 = sub_25BA77164(a2);
  if ((v22 & 1) != (v29 & 1))
  {
LABEL_14:
    uint64_t result = sub_25BAA55A0();
    __break(1u);
    return result;
  }
  unint64_t v18 = v28;
  uint64_t v24 = *v10;
  if (v22) {
    goto LABEL_8;
  }
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, a2, v30);
  return sub_25BAA0B50(v18, (uint64_t)v15, v33, v24, a4, a6);
}

uint64_t sub_25BAA0A58(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_25BAA4DA0();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  uint64_t v10 = a4[7];
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5338D8);
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

uint64_t sub_25BAA0B50(unint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t (*a5)(void), uint64_t (*a6)(void))
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v12 = a4[6];
  uint64_t v13 = sub_25BAA4DA0();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 32))(v12 + *(void *)(*(void *)(v13 - 8) + 72) * a1, a2, v13);
  uint64_t v14 = a4[7];
  uint64_t v15 = a5(0);
  uint64_t result = sub_25BAA2B9C(a3, v14 + *(void *)(*(void *)(v15 - 8) + 72) * a1, a6);
  uint64_t v17 = a4[2];
  BOOL v18 = __OFADD__(v17, 1);
  uint64_t v19 = v17 + 1;
  if (v18) {
    __break(1u);
  }
  else {
    a4[2] = v19;
  }
  return result;
}

void *sub_25BAA0C44()
{
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5338D8);
  uint64_t v45 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  uint64_t v41 = (char *)&v32 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_25BAA4DA0();
  uint64_t v44 = *(void *)(v40 - 8);
  MEMORY[0x270FA5388](v40);
  unint64_t v39 = (char *)&v32 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5339F0);
  uint64_t v32 = v0;
  uint64_t v3 = *v0;
  uint64_t v4 = sub_25BAA5460();
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
  uint64_t v15 = v39;
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

void *sub_25BAA0FF0(uint64_t (*a1)(void), uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t v44 = a3;
  uint64_t v5 = a1(0);
  uint64_t v43 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v42 = (char *)&v35 - v6;
  uint64_t v41 = sub_25BAA4DA0();
  uint64_t v7 = *(void *)(v41 - 8);
  MEMORY[0x270FA5388](v41);
  uint64_t v40 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v35 = v3;
  uint64_t v9 = *v3;
  uint64_t v10 = sub_25BAA5460();
  uint64_t v11 = *(void *)(v9 + 16);
  uint64_t v46 = v10;
  if (!v11)
  {
    uint64_t result = (void *)swift_release();
    uint64_t v34 = v46;
    uint64_t v33 = v35;
LABEL_25:
    *uint64_t v33 = v34;
    return result;
  }
  uint64_t v12 = v10;
  uint64_t result = (void *)(v10 + 64);
  unint64_t v14 = (unint64_t)((1 << *(unsigned char *)(v12 + 32)) + 63) >> 6;
  if (v12 != v9 || (unint64_t)result >= v9 + 64 + 8 * v14)
  {
    uint64_t result = memmove(result, (const void *)(v9 + 64), 8 * v14);
    uint64_t v12 = v46;
  }
  uint64_t v36 = v9 + 64;
  int64_t v15 = 0;
  *(void *)(v12 + 16) = *(void *)(v9 + 16);
  uint64_t v16 = 1 << *(unsigned char *)(v9 + 32);
  uint64_t v45 = v9;
  uint64_t v17 = -1;
  if (v16 < 64) {
    uint64_t v17 = ~(-1 << v16);
  }
  unint64_t v18 = v17 & *(void *)(v9 + 64);
  uint64_t v39 = v7 + 16;
  int64_t v37 = (unint64_t)(v16 + 63) >> 6;
  uint64_t v38 = v7 + 32;
  unint64_t v20 = v40;
  uint64_t v19 = v41;
  uint64_t v21 = (uint64_t)v42;
  for (i = v46; ; uint64_t result = (void *)sub_25BAA2B9C(v21, *(void *)(i + 56) + v29, v28))
  {
    if (v18)
    {
      unint64_t v23 = __clz(__rbit64(v18));
      v18 &= v18 - 1;
      unint64_t v24 = v23 | (v15 << 6);
      uint64_t v25 = v45;
      goto LABEL_9;
    }
    int64_t v30 = v15 + 1;
    uint64_t v25 = v45;
    if (__OFADD__(v15, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v30 >= v37) {
      goto LABEL_23;
    }
    unint64_t v31 = *(void *)(v36 + 8 * v30);
    ++v15;
    if (!v31)
    {
      int64_t v15 = v30 + 1;
      if (v30 + 1 >= v37) {
        goto LABEL_23;
      }
      unint64_t v31 = *(void *)(v36 + 8 * v15);
      if (!v31) {
        break;
      }
    }
LABEL_22:
    unint64_t v18 = (v31 - 1) & v31;
    unint64_t v24 = __clz(__rbit64(v31)) + (v15 << 6);
LABEL_9:
    unint64_t v26 = *(void *)(v7 + 72) * v24;
    (*(void (**)(char *, unint64_t, uint64_t))(v7 + 16))(v20, *(void *)(v25 + 48) + v26, v19);
    uint64_t v27 = *(void *)(v25 + 56);
    int64_t v28 = v44;
    unint64_t v29 = *(void *)(v43 + 72) * v24;
    sub_25BAA2C64(v27 + v29, v21, v44);
    (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(*(void *)(i + 48) + v26, v20, v19);
  }
  int64_t v32 = v30 + 2;
  if (v32 >= v37)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    uint64_t v33 = v35;
    uint64_t v34 = v46;
    goto LABEL_25;
  }
  unint64_t v31 = *(void *)(v36 + 8 * v32);
  if (v31)
  {
    int64_t v15 = v32;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v15 = v32 + 1;
    if (__OFADD__(v32, 1)) {
      break;
    }
    if (v15 >= v37) {
      goto LABEL_23;
    }
    unint64_t v31 = *(void *)(v36 + 8 * v15);
    ++v32;
    if (v31) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_25BAA135C(uint64_t a1, char *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_25BAA4DA0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  sub_25BA9A548(&qword_26A5332E0, MEMORY[0x263F07508]);
  swift_bridgeObjectRetain();
  uint64_t v33 = a2;
  uint64_t v11 = sub_25BAA5020();
  uint64_t v12 = -1 << *(unsigned char *)(v10 + 32);
  unint64_t v13 = v11 & ~v12;
  uint64_t v32 = v10 + 56;
  if ((*(void *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    int64_t v28 = v2;
    uint64_t v29 = a1;
    uint64_t v30 = ~v12;
    uint64_t v27 = v7;
    uint64_t v16 = *(void (**)(void, void, void))(v7 + 16);
    uint64_t v15 = v7 + 16;
    unint64_t v14 = v16;
    uint64_t v31 = *(void *)(v15 + 56);
    uint64_t v17 = (void (**)(char *, uint64_t))(v15 - 8);
    v26[1] = v15 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    while (1)
    {
      uint64_t v18 = v10;
      unint64_t v19 = v31 * v13;
      unint64_t v20 = v14;
      v14(v9, *(void *)(v10 + 48) + v31 * v13, v6);
      sub_25BA9A548(&qword_26A5332E8, MEMORY[0x263F07508]);
      char v21 = sub_25BAA5040();
      unint64_t v22 = *v17;
      (*v17)(v9, v6);
      if (v21) {
        break;
      }
      unint64_t v13 = (v13 + 1) & v30;
      uint64_t v10 = v18;
      unint64_t v14 = v20;
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
    unint64_t v14 = *(void (**)(void, void, void))(v7 + 16);
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v24 = v33;
    v14(v9, v33, v6);
    uint64_t v34 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_25BAA1A7C((uint64_t)v9, v13, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v34;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v24, v6);
    return 1;
  }
}

uint64_t sub_25BAA1680()
{
  uint64_t v1 = v0;
  uint64_t v42 = sub_25BAA4DA0();
  uint64_t v2 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  uint64_t v41 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5339B8);
  uint64_t v5 = sub_25BAA53C0();
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
    uint64_t v35 = v0;
    int64_t v36 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v39 = v2;
    uint64_t v11 = v5 + 56;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    uint64_t v38 = v6;
    unint64_t v14 = v41;
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
                uint64_t v1 = v35;
                uint64_t v34 = 1 << *(unsigned char *)(v4 + 32);
                if (v34 > 63) {
                  bzero(v37, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *int64_t v37 = -1 << v34;
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
      unint64_t v26 = *(void (**)(char *, unint64_t, uint64_t))(v39 + 32);
      v26(v14, v24 + v25 * v18, v15);
      uint64_t v6 = v38;
      sub_25BA9A548(&qword_26A5332E0, MEMORY[0x263F07508]);
      uint64_t result = sub_25BAA5020();
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

uint64_t sub_25BAA1A7C(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v31 = a1;
  uint64_t v6 = sub_25BAA4DA0();
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
    sub_25BAA1680();
  }
  else
  {
    if (v11 > v10)
    {
      sub_25BAA1D1C();
      goto LABEL_12;
    }
    sub_25BAA1FC0();
  }
  uint64_t v12 = *v3;
  sub_25BA9A548(&qword_26A5332E0, MEMORY[0x263F07508]);
  uint64_t v13 = sub_25BAA5020();
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
      sub_25BA9A548(&qword_26A5332E8, MEMORY[0x263F07508]);
      char v21 = sub_25BAA5040();
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
  uint64_t result = sub_25BAA5590();
  __break(1u);
  return result;
}

void *sub_25BAA1D1C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25BAA4DA0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5339B8);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_25BAA53B0();
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
    uint64_t v1 = v22;
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

uint64_t sub_25BAA1FC0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25BAA4DA0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5339B8);
  uint64_t v7 = sub_25BAA53C0();
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
    sub_25BA9A548(&qword_26A5332E0, MEMORY[0x263F07508]);
    uint64_t result = sub_25BAA5020();
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
    uint64_t v1 = v34;
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

uint64_t sub_25BAA2370@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_25BAA4DA0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  sub_25BA9A548(&qword_26A5332E0, MEMORY[0x263F07508]);
  swift_bridgeObjectRetain();
  uint64_t v31 = a1;
  uint64_t v10 = sub_25BAA5020();
  uint64_t v11 = -1 << *(unsigned char *)(v9 + 32);
  unint64_t v12 = v10 & ~v11;
  uint64_t v13 = v9;
  uint64_t v30 = v9 + 56;
  if ((*(void *)(v9 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12))
  {
    uint64_t v26 = v2;
    uint64_t v27 = v6;
    uint64_t v28 = a2;
    uint64_t v29 = ~v11;
    int64_t v16 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    uint64_t v15 = v6 + 16;
    unint64_t v14 = v16;
    uint64_t v17 = *(void *)(v15 + 56);
    while (1)
    {
      uint64_t v18 = v13;
      v14(v8, *(void *)(v13 + 48) + v17 * v12, v5);
      sub_25BA9A548(&qword_26A5332E8, MEMORY[0x263F07508]);
      char v19 = sub_25BAA5040();
      (*(void (**)(char *, uint64_t))(v15 - 8))(v8, v5);
      if (v19) {
        break;
      }
      unint64_t v12 = (v12 + 1) & v29;
      uint64_t v13 = v18;
      if (((*(void *)(v30 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v20 = 1;
        uint64_t v6 = v27;
        a2 = v28;
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(a2, v20, 1, v5);
      }
    }
    swift_bridgeObjectRelease();
    unint64_t v21 = v26;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v23 = *v21;
    uint64_t v32 = *v21;
    *unint64_t v21 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_25BAA1D1C();
      uint64_t v23 = v32;
    }
    uint64_t v6 = v27;
    a2 = v28;
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v27 + 32))(v28, *(void *)(v23 + 48) + v17 * v12, v5);
    sub_25BAA2650(v12);
    *unint64_t v21 = v32;
    swift_bridgeObjectRelease();
    uint64_t v20 = 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v20 = 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(a2, v20, 1, v5);
}

uint64_t sub_25BAA2650(int64_t a1)
{
  uint64_t v3 = sub_25BAA4DA0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = *v1;
  uint64_t v8 = *v1 + 56;
  uint64_t v9 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(void *)(v8 + 8 * (v10 >> 6))) != 0)
  {
    uint64_t v31 = v1;
    uint64_t v11 = ~v9;
    uint64_t v35 = result;
    swift_retain();
    uint64_t v12 = sub_25BAA5370();
    if ((*(void *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      unint64_t v33 = (v12 + 1) & v11;
      unint64_t v14 = *(void (**)(char *, unint64_t, uint64_t))(v4 + 16);
      uint64_t v13 = v4 + 16;
      uint64_t v32 = v14;
      uint64_t v15 = *(void *)(v13 + 56);
      uint64_t v34 = v13;
      int64_t v16 = (void (**)(char *, uint64_t))(v13 - 8);
      uint64_t v17 = v35;
      do
      {
        uint64_t v18 = v8;
        uint64_t v19 = v15;
        int64_t v20 = v15 * v10;
        v32(v6, *(void *)(v17 + 48) + v15 * v10, v3);
        sub_25BA9A548(&qword_26A5332E0, MEMORY[0x263F07508]);
        uint64_t v21 = sub_25BAA5020();
        (*v16)(v6, v3);
        unint64_t v22 = v21 & v11;
        if (a1 >= (uint64_t)v33)
        {
          if (v22 < v33 || a1 < (uint64_t)v22)
          {
LABEL_4:
            uint64_t v8 = v18;
            uint64_t v15 = v19;
            uint64_t v17 = v35;
            goto LABEL_5;
          }
        }
        else if (v22 < v33 && a1 < (uint64_t)v22)
        {
          goto LABEL_4;
        }
        uint64_t v17 = v35;
        int64_t v25 = v19 * a1;
        uint64_t v8 = v18;
        if (v19 * a1 < v20
          || (uint64_t v15 = v19, *(void *)(v35 + 48) + v19 * a1 >= (unint64_t)(*(void *)(v35 + 48) + v20 + v19)))
        {
          swift_arrayInitWithTakeFrontToBack();
          goto LABEL_21;
        }
        a1 = v10;
        if (v25 != v20)
        {
          swift_arrayInitWithTakeBackToFront();
LABEL_21:
          uint64_t v17 = v35;
          uint64_t v15 = v19;
          a1 = v10;
        }
LABEL_5:
        unint64_t v10 = (v10 + 1) & v11;
      }
      while (((*(void *)(v8 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    *(void *)(v8 + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
    uint64_t result = swift_release();
    uint64_t v1 = v31;
  }
  else
  {
    *(void *)(v8 + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
  }
  uint64_t v26 = *v1;
  uint64_t v27 = *(void *)(*v1 + 16);
  BOOL v28 = __OFSUB__(v27, 1);
  uint64_t v29 = v27 - 1;
  if (v28)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v26 + 16) = v29;
    ++*(_DWORD *)(v26 + 36);
  }
  return result;
}

uint64_t sub_25BAA296C(void *a1, uint64_t a2)
{
  v21[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v5 = sub_25BAA4CD0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25BAA4C60();
  swift_allocObject();
  sub_25BAA4C50();
  v21[0] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A533908);
  sub_25BAA3AE8();
  uint64_t v9 = sub_25BAA4C40();
  if (!v2)
  {
    uint64_t v11 = v9;
    unint64_t v12 = v10;
    uint64_t v13 = a2;
    id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08850]), sel_init);
    v20[1] = v13;
    sub_25BAA4CA0();
    uint64_t v15 = (void *)sub_25BAA4C90();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v21[0] = 0;
    unsigned int v16 = objc_msgSend(v14, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v15, 1, 0, v21);

    id v17 = v21[0];
    if (v16)
    {
      sub_25BAA4CF0();
    }
    else
    {
      uint64_t v18 = v17;
      sub_25BAA4C70();

      swift_willThrow();
    }
    sub_25BA7FD68(v11, v12);
  }
  return swift_release();
}

uint64_t sub_25BAA2B9C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_25BAA2C04(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25BAA2C64(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25BAA2CCC(uint64_t result)
{
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533928);
    return (*(uint64_t (**)(uint64_t *, uint64_t))(*(void *)(v1 - 8) + 8))(&v2, v1);
  }
  return result;
}

unint64_t sub_25BAA2D34()
{
  unint64_t result = qword_26A533930;
  if (!qword_26A533930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A533930);
  }
  return result;
}

uint64_t sub_25BAA2D88(uint64_t a1)
{
  uint64_t result = sub_25BA9A548((unint64_t *)&unk_26A533478, (void (*)(uint64_t))type metadata accessor for SessionManager);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t getEnumTagSinglePayload for SessionError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SessionError(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 3;
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
        JUMPOUT(0x25BAA2F3CLL);
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
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SessionError()
{
  return &type metadata for SessionError;
}

uint64_t sub_25BAA2F74()
{
  return type metadata accessor for SessionManager(0);
}

void sub_25BAA2F7C()
{
  sub_25BAA3050();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_25BAA3050()
{
  if (!qword_26B34B460)
  {
    sub_25BAA4CD0();
    unint64_t v0 = sub_25BAA5320();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B34B460);
    }
  }
}

uint64_t sub_25BAA30A8()
{
  if (MEMORY[0x263F8EEE0]) {
    return __swift_instantiateConcreteTypeFromMangledName(&qword_26A533938);
  }
  else {
    return MEMORY[0x263F8EE60] + 8;
  }
}

uint64_t sub_25BAA30D0()
{
  if (MEMORY[0x263F8EEE0]) {
    return __swift_instantiateConcreteTypeFromMangledName(&qword_26A533940);
  }
  else {
    return MEMORY[0x263F8EE60] + 8;
  }
}

uint64_t sub_25BAA30F8()
{
  return sub_25BA76180(&qword_26A533948, &qword_26A5338E0);
}

void type metadata accessor for Name()
{
  if (!qword_26A533950)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_26A533950);
    }
  }
}

void *sub_25BAA318C(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (void *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_25BAA4D40();
    int v8 = *(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    uint64_t v9 = *(int *)(a3 + 24);
    *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
    v8((void *)((char *)a1 + v9), (void *)((char *)a2 + v9), v7);
  }
  return a1;
}

uint64_t sub_25BAA327C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25BAA4D40();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v7)((void *)(v4 - 8), a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 24);
  return v7(v5, v4);
}

uint64_t sub_25BAA331C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25BAA4D40();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  uint64_t v8 = *(int *)(a3 + 24);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  v7(a1 + v8, a2 + v8, v6);
  return a1;
}

uint64_t sub_25BAA33BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25BAA4D40();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  v7(a1 + *(int *)(a3 + 24), a2 + *(int *)(a3 + 24), v6);
  return a1;
}

uint64_t sub_25BAA3460(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25BAA4D40();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  uint64_t v8 = *(int *)(a3 + 24);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  v7(a1 + v8, a2 + v8, v6);
  return a1;
}

uint64_t sub_25BAA3500(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25BAA4D40();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  uint64_t v8 = *(int *)(a3 + 24);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  v7(a1 + v8, a2 + v8, v6);
  return a1;
}

uint64_t sub_25BAA35A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25BAA35B4);
}

uint64_t sub_25BAA35B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25BAA4D40();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unsigned int v10 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 2) {
      return v10 - 1;
    }
    else {
      return 0;
    }
  }
}

uint64_t sub_25BAA3670(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25BAA3684);
}

uint64_t sub_25BAA3684(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_25BAA4D40();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unsigned int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 20)) = a2 + 1;
  }
  return result;
}

uint64_t sub_25BAA3740()
{
  uint64_t result = sub_25BAA4D40();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_25BAA37D8()
{
  return sub_25BA9A548(&qword_26A533958, (void (*)(uint64_t))type metadata accessor for Name);
}

uint64_t sub_25BAA3820()
{
  return sub_25BA9A548(&qword_26A533960, (void (*)(uint64_t))type metadata accessor for Name);
}

uint64_t sub_25BAA3868()
{
  return sub_25BA9A548(&qword_26A533968, (void (*)(uint64_t))type metadata accessor for Name);
}

unint64_t sub_25BAA38B0()
{
  unint64_t result = qword_26A535630;
  if (!qword_26A535630)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A535630);
  }
  return result;
}

unint64_t sub_25BAA3904()
{
  unint64_t result = qword_26A535638;
  if (!qword_26A535638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A535638);
  }
  return result;
}

unint64_t sub_25BAA3958()
{
  unint64_t result = qword_26A535640;
  if (!qword_26A535640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A535640);
  }
  return result;
}

uint64_t sub_25BAA39B0(uint64_t a1)
{
  return sub_25BAA3A74(a1, (uint64_t (*)(unint64_t))sub_25BA9ABB0);
}

uint64_t objectdestroy_5Tm()
{
  uint64_t v1 = sub_25BAA4CD0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_25BAA3A5C(uint64_t a1)
{
  return sub_25BAA3A74(a1, (uint64_t (*)(unint64_t))sub_25BA98134);
}

uint64_t sub_25BAA3A74(uint64_t a1, uint64_t (*a2)(unint64_t))
{
  uint64_t v4 = *(void *)(sub_25BAA4CD0() - 8);
  return a2(v2 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)));
}

unint64_t sub_25BAA3AE8()
{
  unint64_t result = qword_26A5339C0;
  if (!qword_26A5339C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A533908);
    sub_25BA9A548(&qword_26A5339C8, MEMORY[0x263F07508]);
    sub_25BAA3BB0(&qword_26A535648);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5339C0);
  }
  return result;
}

uint64_t sub_25BAA3BB0(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for Session(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25BAA3BF4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_25BAA3C5C()
{
  uint64_t v1 = sub_25BAA4DA0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_25BAA3D30()
{
  uint64_t v2 = *(void *)(sub_25BAA4DA0() - 8);
  uint64_t v3 = *(void *)(v0 + 32);
  uint64_t v4 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_25BA78A7C;
  return sub_25BA9A5F8((uint64_t)v5, v6, v7, v3, v4);
}

unsigned char *storeEnumTagSinglePayload for Session.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25BAA3ED0);
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

ValueMetadata *type metadata accessor for Session.CodingKeys()
{
  return &type metadata for Session.CodingKeys;
}

ValueMetadata *type metadata accessor for Session.State()
{
  return &type metadata for Session.State;
}

unint64_t sub_25BAA3F24()
{
  unint64_t result = qword_26A535650[0];
  if (!qword_26A535650[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A535650);
  }
  return result;
}

unint64_t sub_25BAA3F7C()
{
  unint64_t result = qword_26A535860[0];
  if (!qword_26A535860[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A535860);
  }
  return result;
}

unint64_t sub_25BAA3FD4()
{
  unint64_t result = qword_26A535A70;
  if (!qword_26A535A70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A535A70);
  }
  return result;
}

unint64_t sub_25BAA402C()
{
  unint64_t result = qword_26A535A78;
  if (!qword_26A535A78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A535A78);
  }
  return result;
}

uint64_t sub_25BAA4080(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x657669746361 && a2 == 0xE600000000000000;
  if (v2 || (sub_25BAA5570() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6465646E65 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_25BAA5570();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_25BAA4164(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5339F8);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v22 = v2;
  uint64_t v23 = v3;
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533A00);
  uint64_t v25 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A533A08);
  uint64_t v24 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1((void *)a1, *(void *)(a1 + 24));
  sub_25BAA46EC();
  uint64_t v12 = v26;
  sub_25BAA5640();
  if (v12) {
    goto LABEL_7;
  }
  uint64_t v13 = v25;
  uint64_t v21 = v6;
  uint64_t v26 = a1;
  uint64_t v14 = sub_25BAA54F0();
  if (*(void *)(v14 + 16) != 1)
  {
    uint64_t v16 = sub_25BAA5400();
    swift_allocError();
    uint64_t v18 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A533A10);
    *uint64_t v18 = &type metadata for Session.State;
    sub_25BAA54C0();
    sub_25BAA53F0();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v16 - 8) + 104))(v18, *MEMORY[0x263F8DCB0], v16);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v11, v9);
    a1 = v26;
LABEL_7:
    __swift_destroy_boxed_opaque_existential_0(a1);
    return a1;
  }
  a1 = *(unsigned __int8 *)(v14 + 32);
  if (a1)
  {
    LODWORD(v25) = *(unsigned __int8 *)(v14 + 32);
    char v28 = 1;
    sub_25BAA4740();
    sub_25BAA54B0();
    uint64_t v15 = v24;
    (*(void (**)(char *, uint64_t))(v23 + 8))(v5, v22);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v11, v9);
    a1 = v25;
  }
  else
  {
    char v27 = 0;
    sub_25BAA4794();
    sub_25BAA54B0();
    uint64_t v19 = v24;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v8, v21);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v11, v9);
  }
  __swift_destroy_boxed_opaque_existential_0(v26);
  return a1;
}

uint64_t sub_25BAA45B4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x7472617473 && a2 == 0xE500000000000000;
  if (v2 || (sub_25BAA5570() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6574617473 && a2 == 0xE500000000000000 || (sub_25BAA5570() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1716482913 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_25BAA5570();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

unint64_t sub_25BAA46EC()
{
  unint64_t result = qword_26A535B00;
  if (!qword_26A535B00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A535B00);
  }
  return result;
}

unint64_t sub_25BAA4740()
{
  unint64_t result = qword_26A535B08;
  if (!qword_26A535B08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A535B08);
  }
  return result;
}

unint64_t sub_25BAA4794()
{
  unint64_t result = qword_26A535B10[0];
  if (!qword_26A535B10[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A535B10);
  }
  return result;
}

unsigned char *_s24ScreenContinuityServices7SessionV5StateOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25BAA48B4);
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

ValueMetadata *type metadata accessor for Session.State.CodingKeys()
{
  return &type metadata for Session.State.CodingKeys;
}

ValueMetadata *type metadata accessor for Session.State.ActiveCodingKeys()
{
  return &type metadata for Session.State.ActiveCodingKeys;
}

ValueMetadata *type metadata accessor for Session.State.EndedCodingKeys()
{
  return &type metadata for Session.State.EndedCodingKeys;
}

unint64_t sub_25BAA4910()
{
  unint64_t result = qword_26A535E20[0];
  if (!qword_26A535E20[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A535E20);
  }
  return result;
}

unint64_t sub_25BAA4968()
{
  unint64_t result = qword_26A535F30;
  if (!qword_26A535F30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A535F30);
  }
  return result;
}

unint64_t sub_25BAA49C0()
{
  unint64_t result = qword_26A535F38[0];
  if (!qword_26A535F38[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A535F38);
  }
  return result;
}

unint64_t sub_25BAA4A18()
{
  unint64_t result = qword_26A535FC0;
  if (!qword_26A535FC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A535FC0);
  }
  return result;
}

unint64_t sub_25BAA4A70()
{
  unint64_t result = qword_26A535FC8[0];
  if (!qword_26A535FC8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A535FC8);
  }
  return result;
}

unint64_t sub_25BAA4AC8()
{
  unint64_t result = qword_26A536050;
  if (!qword_26A536050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A536050);
  }
  return result;
}

unint64_t sub_25BAA4B20()
{
  unint64_t result = qword_26A536058[0];
  if (!qword_26A536058[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A536058);
  }
  return result;
}

uint64_t sub_25BAA4B90()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_25BAA4BA0()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_25BAA4BB0()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_25BAA4BC0()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_25BAA4BD0()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_25BAA4BE0()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_25BAA4BF0()
{
  return MEMORY[0x270EEE378]();
}

uint64_t sub_25BAA4C00()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_25BAA4C10()
{
  return MEMORY[0x270EEF238]();
}

uint64_t sub_25BAA4C20()
{
  return MEMORY[0x270EEF250]();
}

uint64_t sub_25BAA4C30()
{
  return MEMORY[0x270EEF268]();
}

uint64_t sub_25BAA4C40()
{
  return MEMORY[0x270EEF288]();
}

uint64_t sub_25BAA4C50()
{
  return MEMORY[0x270EEF2A8]();
}

uint64_t sub_25BAA4C60()
{
  return MEMORY[0x270EEF2B8]();
}

uint64_t sub_25BAA4C70()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_25BAA4C80()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_25BAA4C90()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_25BAA4CA0()
{
  return MEMORY[0x270EEFDC0]();
}

uint64_t sub_25BAA4CB0()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_25BAA4CC0()
{
  return MEMORY[0x270EEFF30]();
}

uint64_t sub_25BAA4CD0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_25BAA4CE0()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_25BAA4CF0()
{
  return MEMORY[0x270EF01C0]();
}

uint64_t sub_25BAA4D00()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t sub_25BAA4D10()
{
  return MEMORY[0x270EF09C0]();
}

uint64_t sub_25BAA4D20()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t sub_25BAA4D30()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_25BAA4D40()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_25BAA4D50()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_25BAA4D60()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_25BAA4D70()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_25BAA4D80()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_25BAA4D90()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_25BAA4DA0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_25BAA4DB0()
{
  return MEMORY[0x270F5B410]();
}

uint64_t sub_25BAA4DC0()
{
  return MEMORY[0x270F5B418]();
}

uint64_t sub_25BAA4DD0()
{
  return MEMORY[0x270F5B420]();
}

uint64_t sub_25BAA4DE0()
{
  return MEMORY[0x270F5B428]();
}

uint64_t sub_25BAA4DF0()
{
  return MEMORY[0x270F5B430]();
}

uint64_t sub_25BAA4E00()
{
  return MEMORY[0x270F5B438]();
}

uint64_t sub_25BAA4E10()
{
  return MEMORY[0x270F5B488]();
}

uint64_t sub_25BAA4E20()
{
  return MEMORY[0x270F5B4A0]();
}

uint64_t sub_25BAA4E30()
{
  return MEMORY[0x270F5B688]();
}

uint64_t sub_25BAA4E40()
{
  return MEMORY[0x270F5B698]();
}

uint64_t sub_25BAA4E50()
{
  return MEMORY[0x270F5B6A0]();
}

uint64_t sub_25BAA4E60()
{
  return MEMORY[0x270F5B6A8]();
}

uint64_t sub_25BAA4E70()
{
  return MEMORY[0x270F5B6C0]();
}

uint64_t sub_25BAA4E80()
{
  return MEMORY[0x270F5B6D0]();
}

uint64_t sub_25BAA4E90()
{
  return MEMORY[0x270F5B6E0]();
}

uint64_t sub_25BAA4EA0()
{
  return MEMORY[0x270F5B6F8]();
}

uint64_t sub_25BAA4EB0()
{
  return MEMORY[0x270F5B708]();
}

uint64_t sub_25BAA4EC0()
{
  return MEMORY[0x270F5B718]();
}

uint64_t sub_25BAA4ED0()
{
  return MEMORY[0x270F5B720]();
}

uint64_t sub_25BAA4EE0()
{
  return MEMORY[0x270F5B728]();
}

uint64_t sub_25BAA4EF0()
{
  return MEMORY[0x270F5B730]();
}

uint64_t sub_25BAA4F00()
{
  return MEMORY[0x270F5B738]();
}

uint64_t sub_25BAA4F10()
{
  return MEMORY[0x270F5B748]();
}

uint64_t sub_25BAA4F20()
{
  return MEMORY[0x270FA1670]();
}

uint64_t sub_25BAA4F30()
{
  return MEMORY[0x270FA1748]();
}

uint64_t sub_25BAA4F40()
{
  return MEMORY[0x270FA1938]();
}

uint64_t sub_25BAA4F50()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25BAA4F60()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_25BAA4F70()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25BAA4F80()
{
  return MEMORY[0x270FA0970]();
}

uint64_t sub_25BAA4F90()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_25BAA4FA0()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_25BAA4FB0()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_25BAA4FC0()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_25BAA4FD0()
{
  return MEMORY[0x270FA0AD0]();
}

uint64_t sub_25BAA4FE0()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_25BAA4FF0()
{
  return MEMORY[0x270FA0BA8]();
}

uint64_t sub_25BAA5000()
{
  return MEMORY[0x270FA0BF0]();
}

uint64_t sub_25BAA5010()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_25BAA5020()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_25BAA5030()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_25BAA5040()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_25BAA5050()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25BAA5060()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_25BAA5070()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_25BAA5080()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25BAA5090()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_25BAA50A0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25BAA50B0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25BAA50C0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25BAA50D0()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_25BAA50E0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_25BAA50F0()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_25BAA5100()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_25BAA5130()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_25BAA5140()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_25BAA5150()
{
  return MEMORY[0x270FA1F18]();
}

uint64_t sub_25BAA5160()
{
  return MEMORY[0x270FA1F30]();
}

uint64_t sub_25BAA5170()
{
  return MEMORY[0x270FA1F48]();
}

uint64_t sub_25BAA5180()
{
  return MEMORY[0x270FA1F60]();
}

uint64_t sub_25BAA51A0()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_25BAA51B0()
{
  return MEMORY[0x270FA2080]();
}

uint64_t sub_25BAA51C0()
{
  return MEMORY[0x270FA20B0]();
}

uint64_t sub_25BAA51D0()
{
  return MEMORY[0x270FA20C0]();
}

uint64_t sub_25BAA51E0()
{
  return MEMORY[0x270FA20D0]();
}

uint64_t sub_25BAA51F0()
{
  return MEMORY[0x270FA20D8]();
}

uint64_t sub_25BAA5200()
{
  return MEMORY[0x270FA20E0]();
}

uint64_t sub_25BAA5210()
{
  return MEMORY[0x270FA20F0]();
}

uint64_t sub_25BAA5230()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_25BAA5240()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_25BAA5250()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25BAA5260()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_25BAA5270()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_25BAA5280()
{
  return MEMORY[0x270FA0DE8]();
}

uint64_t sub_25BAA5290()
{
  return MEMORY[0x270FA0E28]();
}

uint64_t sub_25BAA52A0()
{
  return MEMORY[0x270FA0EA0]();
}

uint64_t sub_25BAA52B0()
{
  return MEMORY[0x270FA0EC0]();
}

uint64_t sub_25BAA52C0()
{
  return MEMORY[0x270FA0EE0]();
}

uint64_t sub_25BAA52D0()
{
  return MEMORY[0x270FA0F30]();
}

uint64_t sub_25BAA52E0()
{
  return MEMORY[0x270FA0F48]();
}

uint64_t sub_25BAA52F0()
{
  return MEMORY[0x270FA0F58]();
}

uint64_t sub_25BAA5300()
{
  return MEMORY[0x270FA0F68]();
}

uint64_t sub_25BAA5310()
{
  return MEMORY[0x270FA0FA8]();
}

uint64_t sub_25BAA5320()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_25BAA5330()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25BAA5340()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25BAA5360()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_25BAA5370()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_25BAA5380()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_25BAA5390()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_25BAA53A0()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_25BAA53B0()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_25BAA53C0()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_25BAA53D0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25BAA53E0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25BAA53F0()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_25BAA5400()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_25BAA5410()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25BAA5420()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_25BAA5430()
{
  return MEMORY[0x270FA2240]();
}

uint64_t sub_25BAA5440()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25BAA5450()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_25BAA5460()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_25BAA5470()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_25BAA5480()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25BAA5490()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25BAA54B0()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_25BAA54C0()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_25BAA54D0()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_25BAA54E0()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_25BAA54F0()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_25BAA5500()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_25BAA5510()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_25BAA5520()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_25BAA5530()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25BAA5560()
{
  return MEMORY[0x270F9F770]();
}

uint64_t sub_25BAA5570()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25BAA5590()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_25BAA55A0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25BAA55B0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25BAA55C0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25BAA55D0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25BAA55E0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25BAA55F0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25BAA5600()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25BAA5610()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_25BAA5620()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_25BAA5630()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25BAA5640()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_25BAA5650()
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initEnumMetadataSingleCase()
{
  return MEMORY[0x270FA0468]();
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