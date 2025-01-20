void sub_25657B830(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_25657B844()
{
  qword_269F5FC90 = 0x5D414D535BLL;
  *(void *)algn_269F5FC98 = 0xE500000000000000;
}

uint64_t sub_25657B864()
{
  return sub_256584570();
}

id sub_25657B890()
{
  id v0 = objc_allocWithZone(MEMORY[0x263F08958]);
  return objc_msgSend(v0, sel_init);
}

id sub_25657B8C8()
{
  id v1 = objc_allocWithZone(v0);
  return sub_25657FFA4();
}

NSObject *sub_25657B91C()
{
  v2 = v1;
  uint64_t v3 = v0;
  v4 = sub_256584560();
  os_log_type_t v5 = sub_256584800();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v40 = v7;
    *(_DWORD *)v6 = 136315138;
    if (qword_269F5F750 != -1) {
      swift_once();
    }
    uint64_t v8 = qword_269F5FC90;
    unint64_t v9 = *(void *)algn_269F5FC98;
    sub_2565847C0();
    sub_25657F44C(v8, v9, &v40);
    sub_256584810();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25657A000, v4, v5, "%s Sending proposeNonce request...", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A2A7F00](v7, -1, -1);
    MEMORY[0x25A2A7F00](v6, -1, -1);
  }

  v10 = *(void **)(v3 + OBJC_IVAR____TtC24SecureMobileAssetExclave33MobileAssetExclaveServicesManager_lock);
  objc_msgSend(v10, sel_lock);
  swift_retain();
  sub_256581188();
  if (v2)
  {
    swift_release();
    objc_msgSend(v10, sel_unlock);
    id v11 = v2;
    id v12 = v2;
    v13 = sub_256584560();
    os_log_type_t v14 = sub_2565847F0();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = swift_slowAlloc();
      v16 = (void *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      uint64_t v40 = v17;
      *(_DWORD *)uint64_t v15 = 136315394;
      if (qword_269F5F750 != -1) {
        swift_once();
      }
      uint64_t v18 = qword_269F5FC90;
      unint64_t v19 = *(void *)algn_269F5FC98;
      sub_2565847C0();
      sub_25657F44C(v18, v19, &v40);
      sub_256584810();
      swift_bridgeObjectRelease();
      *(_WORD *)(v15 + 12) = 2112;
      id v20 = v2;
      uint64_t v39 = _swift_stdlib_bridgeErrorToNSError();
      sub_256584810();
      void *v16 = v39;

      _os_log_impl(&dword_25657A000, v13, v14, "%s proposeNonce request failed: %@", (uint8_t *)v15, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269F5F760);
      swift_arrayDestroy();
      MEMORY[0x25A2A7F00](v16, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x25A2A7F00](v17, -1, -1);
      MEMORY[0x25A2A7F00](v15, -1, -1);
    }
    else
    {
    }
    swift_willThrow();
  }
  else
  {
    swift_release();
    objc_msgSend(v10, sel_unlock);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269F5F768);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_256584ED0;
    *(void *)(inited + 32) = 0x65636E6F4E776172;
    *(void *)(inited + 40) = 0xE800000000000000;
    uint64_t v22 = sub_2565847C0();
    uint64_t v23 = sub_256580AC0(v22);
    uint64_t v25 = v24;
    swift_bridgeObjectRelease();
    *(void *)(inited + 48) = v23;
    *(void *)(inited + 56) = v25;
    *(void *)(inited + 64) = 0x6F4E747365676964;
    *(void *)(inited + 72) = 0xEB0000000065636ELL;
    uint64_t v26 = sub_2565847C0();
    uint64_t v27 = sub_256580AC0(v26);
    uint64_t v29 = v28;
    swift_bridgeObjectRelease();
    *(void *)(inited + 80) = v27;
    *(void *)(inited + 88) = v29;
    unint64_t v30 = sub_25657BF38(inited);
    v31 = sub_256584560();
    os_log_type_t v32 = sub_256584800();
    if (os_log_type_enabled(v31, v32))
    {
      unint64_t v38 = v30;
      v33 = (uint8_t *)swift_slowAlloc();
      uint64_t v37 = swift_slowAlloc();
      uint64_t v40 = v37;
      *(_DWORD *)v33 = 136315138;
      if (qword_269F5F750 != -1) {
        swift_once();
      }
      uint64_t v34 = qword_269F5FC90;
      unint64_t v35 = *(void *)algn_269F5FC98;
      sub_2565847C0();
      sub_25657F44C(v34, v35, &v40);
      sub_256584810();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25657A000, v31, v32, "%s proposeNonce request succeeded.", v33, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2A7F00](v37, -1, -1);
      MEMORY[0x25A2A7F00](v33, -1, -1);

      unint64_t v30 = v38;
    }
    else
    {
    }
    v13 = sub_25657C24C(v30);
    swift_bridgeObjectRelease();
    sub_25657C060();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v13;
}

unint64_t sub_25657BF38(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269F5F838);
  v2 = (void *)sub_2565848B0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (unint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v7 = *(v4 - 1);
    unint64_t v8 = *v4;
    sub_2565847C0();
    sub_256580B80(v7, v8);
    unint64_t result = sub_25657FB1C(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    id v11 = (uint64_t *)(v2[6] + 16 * result);
    *id v11 = v5;
    v11[1] = v6;
    id v12 = (uint64_t *)(v2[7] + 16 * result);
    *id v12 = v7;
    v12[1] = v8;
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

void sub_25657C060()
{
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  oslog = sub_256584560();
  os_log_type_t v0 = sub_256584800();
  if (os_log_type_enabled(oslog, v0))
  {
    id v1 = (uint8_t *)swift_slowAlloc();
    uint64_t v2 = swift_slowAlloc();
    uint64_t v8 = v2;
    *(_DWORD *)id v1 = 136315138;
    uint64_t v3 = sub_2565847C0();
    uint64_t v4 = MEMORY[0x25A2A7930](v3, MEMORY[0x263F8E778]);
    unint64_t v6 = v5;
    swift_bridgeObjectRelease();
    sub_25657F44C(v4, v6, &v8);
    sub_256584810();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25657A000, oslog, v0, "Returning: %s", v1, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A2A7F00](v2, -1, -1);
    MEMORY[0x25A2A7F00](v1, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
}

uint64_t sub_25657C24C(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269F5F830);
    uint64_t v2 = sub_2565848B0();
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE80];
  }
  uint64_t v31 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v30 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = v2 + 64;
  sub_2565847C0();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v30) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v31 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v30) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v31 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v30) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v31 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v30) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v31 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
LABEL_28:
    uint64_t v17 = 16 * v12;
    uint64_t v18 = (void *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v19 = v18[1];
    id v20 = (uint64_t *)(*(void *)(a1 + 56) + v17);
    uint64_t v21 = *v20;
    unint64_t v22 = v20[1];
    *(void *)&v40[0] = *v18;
    *((void *)&v40[0] + 1) = v19;
    sub_2565847C0();
    sub_256580B80(v21, v22);
    swift_dynamicCast();
    swift_dynamicCast();
    long long v36 = v32;
    long long v37 = v33;
    uint64_t v38 = v34;
    sub_256580F9C(&v35, v39);
    long long v32 = v36;
    long long v33 = v37;
    uint64_t v34 = v38;
    sub_256580F9C(v39, v40);
    sub_256580F9C(v40, &v36);
    uint64_t result = sub_256584830();
    uint64_t v23 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v24 = result & ~v23;
    unint64_t v25 = v24 >> 6;
    if (((-1 << v24) & ~*(void *)(v6 + 8 * (v24 >> 6))) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v24) & ~*(void *)(v6 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v29 = *(void *)(v6 + 8 * v25);
      }
      while (v29 == -1);
      unint64_t v9 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(void *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    uint64_t v10 = *(void *)(v2 + 48) + 40 * v9;
    *(_OWORD *)uint64_t v10 = v32;
    *(_OWORD *)(v10 + 16) = v33;
    *(void *)(v10 + 32) = v34;
    uint64_t result = (uint64_t)sub_256580F9C(&v36, (_OWORD *)(*(void *)(v2 + 56) + 32 * v9));
    ++*(void *)(v2 + 16);
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v30)
  {
LABEL_37:
    swift_release();
    sub_256580FAC();
    return v2;
  }
  unint64_t v14 = *(void *)(v31 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v30) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v31 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

void sub_25657C6DC(unsigned int a1, int a2, uint64_t a3, NSObject *a4, NSObject *a5, id a6, uint64_t a7, unint64_t a8, unsigned char *a9)
{
  uint64_t v10 = v9;
  unint64_t v151 = a8;
  *(void *)&long long v150 = a7;
  os_log_t v143 = a5;
  int v145 = a2;
  unsigned int v146 = a1;
  uint64_t v14 = sub_2565845C0();
  uint64_t v152 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388]();
  int64_t v16 = (char *)&v139 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = v9 + OBJC_IVAR____TtC24SecureMobileAssetExclave33MobileAssetExclaveServicesManager_log;
  uint64_t v18 = sub_256584560();
  os_log_type_t v19 = sub_256584800();
  BOOL v20 = os_log_type_enabled(v18, v19);
  uint64_t v148 = v17;
  uint64_t v149 = v10;
  if (v20)
  {
    v141 = (uint8_t *)a3;
    os_log_t v142 = a4;
    id v144 = a6;
    uint64_t v21 = (uint8_t *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    uint64_t v154 = v22;
    *(_DWORD *)uint64_t v21 = 136315138;
    if (qword_269F5F750 != -1) {
      swift_once();
    }
    uint64_t v23 = qword_269F5FC90;
    unint64_t v24 = *(void *)algn_269F5FC98;
    sub_2565847C0();
    uint64_t v153 = sub_25657F44C(v23, v24, &v154);
    sub_256584810();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25657A000, v18, v19, "%s Sending checkManifest request...", v21, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A2A7F00](v22, -1, -1);
    MEMORY[0x25A2A7F00](v21, -1, -1);

    uint64_t v10 = v149;
    a6 = v144;
    a3 = (uint64_t)v141;
    a4 = v142;
  }
  else
  {
  }
  id v144 = *(id *)(v10 + OBJC_IVAR____TtC24SecureMobileAssetExclave33MobileAssetExclaveServicesManager_lock);
  objc_msgSend(v144, sel_lock);
  sub_256580B80(a3, (unint64_t)a4);
  sub_25657FDE8(a3, (unint64_t)a4);
  sub_256580BD8(a3, (unint64_t)a4);
  sub_25657D8CC();
  swift_release();
  sub_2565810E8(&qword_269F5F770, MEMORY[0x263F045C0]);
  uint64_t v25 = sub_2565845D0();
  uint64_t v27 = v26;
  BOOL v28 = *(void (**)(char *, uint64_t))(v152 + 8);
  v28(v16, v14);
  uint64_t v29 = sub_25657FC78(v25, v27);
  swift_bridgeObjectRelease();
  os_log_t v30 = v143;
  sub_256580B80((uint64_t)v143, (unint64_t)a6);
  sub_25657FDE8((uint64_t)v30, (unint64_t)a6);
  sub_256580BD8((uint64_t)v30, (unint64_t)a6);
  sub_25657D8CC();
  swift_release();
  uint64_t v31 = sub_2565845D0();
  uint64_t v33 = v32;
  v28(v16, v14);
  uint64_t v152 = sub_25657FC78(v31, v33);
  swift_bridgeObjectRelease();
  uint64_t v34 = v150;
  unint64_t v35 = v151;
  sub_256580B80(v150, v151);
  sub_25657FDE8(v34, v35);
  sub_256580BD8(v34, v35);
  sub_25657D8CC();
  swift_release();
  uint64_t v36 = sub_2565845D0();
  uint64_t v38 = v37;
  uint64_t v39 = v16;
  uint64_t v40 = v29;
  v28(v39, v14);
  uint64_t v41 = sub_25657FC78(v36, v38);
  swift_bridgeObjectRelease();
  swift_retain_n();
  v42 = sub_256584560();
  int v43 = sub_2565847E0();
  BOOL v44 = os_log_type_enabled(v42, (os_log_type_t)v43);
  unint64_t v151 = v41;
  if (v44)
  {
    LODWORD(v141) = v43;
    os_log_t v143 = v42;
    uint64_t v45 = swift_slowAlloc();
    uint64_t v140 = swift_slowAlloc();
    uint64_t v154 = v140;
    *(_DWORD *)uint64_t v45 = 136315394;
    if (qword_269F5F750 != -1) {
      swift_once();
    }
    uint64_t v47 = qword_269F5FC90;
    unint64_t v46 = *(void *)algn_269F5FC98;
    sub_2565847C0();
    uint64_t v153 = sub_25657F44C(v47, v46, &v154);
    sub_256584810();
    swift_bridgeObjectRelease();
    os_log_t v142 = (os_log_t)v45;
    *(_WORD *)(v45 + 12) = 2080;
    uint64_t v48 = *(void *)(v29 + 16);
    if (v48)
    {
      swift_retain();
      uint64_t v49 = 0;
      v50 = (void *)MEMORY[0x263F8EE78];
      long long v150 = xmmword_256584EE0;
      uint64_t v51 = MEMORY[0x263F8E7C0];
      do
      {
        v52 = v40;
        char v53 = *((unsigned char *)&v40[4].isa + v49);
        __swift_instantiateConcreteTypeFromMangledName(&qword_269F5F778);
        uint64_t v54 = swift_allocObject();
        *(_OWORD *)(v54 + 16) = v150;
        *(void *)(v54 + 56) = MEMORY[0x263F8E778];
        *(void *)(v54 + 64) = v51;
        *(unsigned char *)(v54 + 32) = v53;
        uint64_t v55 = sub_256584770();
        uint64_t v57 = v56;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          v50 = sub_25657F22C(0, v50[2] + 1, 1, v50);
        }
        unint64_t v59 = v50[2];
        unint64_t v58 = v50[3];
        if (v59 >= v58 >> 1) {
          v50 = sub_25657F22C((void *)(v58 > 1), v59 + 1, 1, v50);
        }
        ++v49;
        v50[2] = v59 + 1;
        v60 = &v50[2 * v59];
        v60[4] = v55;
        v60[5] = v57;
        uint64_t v40 = v52;
      }
      while (v48 != v49);
      swift_release();
    }
    else
    {
      v50 = (void *)MEMORY[0x263F8EE78];
    }
    v61 = (uint8_t *)v142;
    uint64_t v153 = (uint64_t)v50;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269F5F780);
    sub_256580FB4((unint64_t *)&unk_269F5F788, &qword_269F5F780);
    uint64_t v62 = sub_256584760();
    unint64_t v64 = v63;
    swift_bridgeObjectRelease();
    uint64_t v153 = sub_25657F44C(v62, v64, &v154);
    sub_256584810();
    swift_release_n();
    swift_bridgeObjectRelease();
    os_log_t v65 = v143;
    _os_log_impl(&dword_25657A000, v143, (os_log_type_t)v141, "%s manifestHash=%s", v61, 0x16u);
    uint64_t v66 = v140;
    swift_arrayDestroy();
    MEMORY[0x25A2A7F00](v66, -1, -1);
    MEMORY[0x25A2A7F00](v61, -1, -1);

    uint64_t v41 = v151;
  }
  else
  {
    swift_release_n();
  }
  uint64_t v67 = v152;
  swift_retain_n();
  v68 = sub_256584560();
  int v69 = sub_2565847E0();
  if (os_log_type_enabled(v68, (os_log_type_t)v69))
  {
    LODWORD(v140) = v69;
    os_log_t v142 = v68;
    uint64_t v70 = swift_slowAlloc();
    uint64_t v139 = swift_slowAlloc();
    uint64_t v154 = v139;
    *(_DWORD *)uint64_t v70 = 136315394;
    if (qword_269F5F750 != -1) {
      swift_once();
    }
    uint64_t v72 = qword_269F5FC90;
    unint64_t v71 = *(void *)algn_269F5FC98;
    sub_2565847C0();
    uint64_t v153 = sub_25657F44C(v72, v71, &v154);
    sub_256584810();
    swift_bridgeObjectRelease();
    v141 = (uint8_t *)v70;
    *(_WORD *)(v70 + 12) = 2080;
    uint64_t v73 = *(void *)(v67 + 16);
    if (v73)
    {
      os_log_t v143 = v40;
      swift_retain();
      uint64_t v74 = 0;
      v75 = (void *)MEMORY[0x263F8EE78];
      long long v150 = xmmword_256584EE0;
      uint64_t v76 = MEMORY[0x263F8E778];
      uint64_t v77 = MEMORY[0x263F8E7C0];
      do
      {
        char v78 = *(unsigned char *)(v152 + v74 + 32);
        __swift_instantiateConcreteTypeFromMangledName(&qword_269F5F778);
        uint64_t v79 = swift_allocObject();
        *(_OWORD *)(v79 + 16) = v150;
        *(void *)(v79 + 56) = v76;
        *(void *)(v79 + 64) = v77;
        *(unsigned char *)(v79 + 32) = v78;
        uint64_t v80 = sub_256584770();
        uint64_t v82 = v81;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          v75 = sub_25657F22C(0, v75[2] + 1, 1, v75);
        }
        unint64_t v84 = v75[2];
        unint64_t v83 = v75[3];
        if (v84 >= v83 >> 1) {
          v75 = sub_25657F22C((void *)(v83 > 1), v84 + 1, 1, v75);
        }
        ++v74;
        v75[2] = v84 + 1;
        v85 = &v75[2 * v84];
        v85[4] = v80;
        v85[5] = v82;
      }
      while (v73 != v74);
      uint64_t v86 = v152;
      swift_release();
      uint64_t v40 = v143;
    }
    else
    {
      v75 = (void *)MEMORY[0x263F8EE78];
      uint64_t v86 = v67;
    }
    v87 = v141;
    uint64_t v153 = (uint64_t)v75;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269F5F780);
    sub_256580FB4((unint64_t *)&unk_269F5F788, &qword_269F5F780);
    uint64_t v88 = sub_256584760();
    unint64_t v90 = v89;
    swift_bridgeObjectRelease();
    uint64_t v153 = sub_25657F44C(v88, v90, &v154);
    sub_256584810();
    swift_release_n();
    swift_bridgeObjectRelease();
    os_log_t v91 = v142;
    _os_log_impl(&dword_25657A000, v142, (os_log_type_t)v140, "%s infoPlistHash=%s", v87, 0x16u);
    uint64_t v92 = v139;
    swift_arrayDestroy();
    MEMORY[0x25A2A7F00](v92, -1, -1);
    MEMORY[0x25A2A7F00](v87, -1, -1);

    uint64_t v67 = v86;
    uint64_t v41 = v151;
  }
  else
  {
    swift_release_n();
  }
  swift_retain_n();
  v93 = sub_256584560();
  int v94 = sub_2565847E0();
  if (os_log_type_enabled(v93, (os_log_type_t)v94))
  {
    LODWORD(v140) = v94;
    os_log_t v142 = v93;
    uint64_t v95 = swift_slowAlloc();
    uint64_t v139 = swift_slowAlloc();
    uint64_t v154 = v139;
    *(_DWORD *)uint64_t v95 = 136315394;
    if (qword_269F5F750 != -1) {
      swift_once();
    }
    uint64_t v97 = qword_269F5FC90;
    unint64_t v96 = *(void *)algn_269F5FC98;
    sub_2565847C0();
    uint64_t v153 = sub_25657F44C(v97, v96, &v154);
    sub_256584810();
    swift_bridgeObjectRelease();
    v141 = (uint8_t *)v95;
    *(_WORD *)(v95 + 12) = 2080;
    uint64_t v98 = v41;
    uint64_t v99 = *(void *)(v41 + 16);
    if (v99)
    {
      os_log_t v143 = v40;
      swift_retain();
      uint64_t v100 = 0;
      v101 = (void *)MEMORY[0x263F8EE78];
      long long v150 = xmmword_256584EE0;
      uint64_t v102 = MEMORY[0x263F8E778];
      uint64_t v103 = MEMORY[0x263F8E7C0];
      do
      {
        char v104 = *(unsigned char *)(v151 + v100 + 32);
        __swift_instantiateConcreteTypeFromMangledName(&qword_269F5F778);
        uint64_t v105 = swift_allocObject();
        *(_OWORD *)(v105 + 16) = v150;
        *(void *)(v105 + 56) = v102;
        *(void *)(v105 + 64) = v103;
        *(unsigned char *)(v105 + 32) = v104;
        uint64_t v106 = sub_256584770();
        uint64_t v108 = v107;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          v101 = sub_25657F22C(0, v101[2] + 1, 1, v101);
        }
        unint64_t v110 = v101[2];
        unint64_t v109 = v101[3];
        if (v110 >= v109 >> 1) {
          v101 = sub_25657F22C((void *)(v109 > 1), v110 + 1, 1, v101);
        }
        ++v100;
        v101[2] = v110 + 1;
        v111 = &v101[2 * v110];
        v111[4] = v106;
        v111[5] = v108;
      }
      while (v99 != v100);
      uint64_t v41 = v151;
      swift_release();
      uint64_t v40 = v143;
    }
    else
    {
      v101 = (void *)MEMORY[0x263F8EE78];
      uint64_t v41 = v98;
    }
    v112 = v141;
    uint64_t v153 = (uint64_t)v101;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269F5F780);
    sub_256580FB4((unint64_t *)&unk_269F5F788, &qword_269F5F780);
    uint64_t v113 = sub_256584760();
    unint64_t v115 = v114;
    swift_bridgeObjectRelease();
    uint64_t v153 = sub_25657F44C(v113, v115, &v154);
    sub_256584810();
    swift_release_n();
    swift_bridgeObjectRelease();
    os_log_t v116 = v142;
    _os_log_impl(&dword_25657A000, v142, (os_log_type_t)v140, "%s catalogHash=%s", v112, 0x16u);
    uint64_t v117 = v139;
    swift_arrayDestroy();
    MEMORY[0x25A2A7F00](v117, -1, -1);
    MEMORY[0x25A2A7F00](v112, -1, -1);

    uint64_t v67 = v152;
  }
  else
  {
    swift_release_n();
  }
  swift_retain();
  v118 = v147;
  char v119 = sub_256581464(v146, v145 & 1, (uint64_t)v40, v67, v41);
  v120 = v118;
  if (v118)
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    objc_msgSend(v144, sel_unlock);
    id v121 = v118;
    id v122 = v118;
    v123 = sub_256584560();
    os_log_type_t v124 = sub_2565847F0();
    if (os_log_type_enabled(v123, v124))
    {
      uint64_t v125 = swift_slowAlloc();
      v126 = (void *)swift_slowAlloc();
      uint64_t v127 = swift_slowAlloc();
      uint64_t v154 = v127;
      *(_DWORD *)uint64_t v125 = 136315394;
      if (qword_269F5F750 != -1) {
        swift_once();
      }
      uint64_t v128 = qword_269F5FC90;
      unint64_t v129 = *(void *)algn_269F5FC98;
      sub_2565847C0();
      uint64_t v153 = sub_25657F44C(v128, v129, &v154);
      sub_256584810();
      swift_bridgeObjectRelease();
      *(_WORD *)(v125 + 12) = 2112;
      id v130 = v120;
      uint64_t v131 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v153 = v131;
      sub_256584810();
      void *v126 = v131;

      _os_log_impl(&dword_25657A000, v123, v124, "%s checkManifest request failed: %@", (uint8_t *)v125, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269F5F760);
      swift_arrayDestroy();
      MEMORY[0x25A2A7F00](v126, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x25A2A7F00](v127, -1, -1);
      MEMORY[0x25A2A7F00](v125, -1, -1);
    }
    else
    {
    }
    swift_willThrow();
  }
  else
  {
    char v132 = v119;
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    objc_msgSend(v144, sel_unlock);
    v133 = sub_256584560();
    os_log_type_t v134 = sub_256584800();
    if (os_log_type_enabled(v133, v134))
    {
      v135 = (uint8_t *)swift_slowAlloc();
      uint64_t v136 = swift_slowAlloc();
      uint64_t v154 = v136;
      *(_DWORD *)v135 = 136315138;
      if (qword_269F5F750 != -1) {
        swift_once();
      }
      uint64_t v137 = qword_269F5FC90;
      unint64_t v138 = *(void *)algn_269F5FC98;
      sub_2565847C0();
      uint64_t v153 = sub_25657F44C(v137, v138, &v154);
      sub_256584810();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25657A000, v133, v134, "%s checkManifest request succeeded.", v135, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2A7F00](v136, -1, -1);
      MEMORY[0x25A2A7F00](v135, -1, -1);
    }

    *a9 = v132 & 1;
  }
}

uint64_t sub_25657D8CC()
{
  uint64_t v0 = sub_2565845E0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2565810E8(&qword_269F5F828, MEMORY[0x263F047F8]);
  sub_2565845B0();
  sub_2565847C0();
  sub_256584590();
  swift_bridgeObjectRelease();
  sub_2565845A0();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

void sub_25657DB7C(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v10 = sub_256584560();
  os_log_type_t v11 = sub_256584800();
  if (os_log_type_enabled(v10, v11))
  {
    unint64_t v36 = a4;
    unint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    uint64_t v42 = v13;
    *(_DWORD *)unint64_t v12 = 136315138;
    if (qword_269F5F750 != -1) {
      swift_once();
    }
    uint64_t v14 = qword_269F5FC90;
    unint64_t v15 = *(void *)algn_269F5FC98;
    sub_2565847C0();
    sub_25657F44C(v14, v15, &v42);
    sub_256584810();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25657A000, v10, v11, "%s Sending storeManifest request...", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A2A7F00](v13, -1, -1);
    MEMORY[0x25A2A7F00](v12, -1, -1);

    a4 = v36;
  }
  else
  {
  }
  int64_t v16 = *(void **)(v39 + OBJC_IVAR____TtC24SecureMobileAssetExclave33MobileAssetExclaveServicesManager_lock);
  objc_msgSend(v16, sel_lock);
  sub_256580B80(a1, a2);
  uint64_t v17 = sub_25657FDE8(a1, a2);
  sub_256580BD8(a1, a2);
  sub_256580B80(a3, a4);
  uint64_t v18 = sub_25657FDE8(a3, a4);
  sub_256580BD8(a3, a4);
  sub_256580B80(a5, a6);
  os_log_type_t v19 = sub_25657FDE8(a5, a6);
  sub_256580BD8(a5, a6);
  swift_retain();
  sub_25658181C((uint64_t)v17, (uint64_t)v18, (uint64_t)v19);
  if (v40)
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    objc_msgSend(v16, sel_unlock);
    id v20 = v40;
    id v21 = v40;
    uint64_t v22 = sub_256584560();
    os_log_type_t v23 = sub_2565847F0();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = swift_slowAlloc();
      uint64_t v25 = (void *)swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      uint64_t v42 = v26;
      *(_DWORD *)uint64_t v24 = 136315394;
      if (qword_269F5F750 != -1) {
        swift_once();
      }
      uint64_t v27 = qword_269F5FC90;
      unint64_t v28 = *(void *)algn_269F5FC98;
      sub_2565847C0();
      sub_25657F44C(v27, v28, &v42);
      sub_256584810();
      swift_bridgeObjectRelease();
      *(_WORD *)(v24 + 12) = 2112;
      id v29 = v40;
      uint64_t v41 = _swift_stdlib_bridgeErrorToNSError();
      sub_256584810();
      *uint64_t v25 = v41;

      _os_log_impl(&dword_25657A000, v22, v23, "%s storeManifest request failed: %@", (uint8_t *)v24, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269F5F760);
      swift_arrayDestroy();
      MEMORY[0x25A2A7F00](v25, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x25A2A7F00](v26, -1, -1);
      MEMORY[0x25A2A7F00](v24, -1, -1);
    }
    else
    {
    }
    swift_willThrow();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    objc_msgSend(v16, sel_unlock);
    os_log_t v30 = sub_256584560();
    os_log_type_t v31 = sub_256584800();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = (uint8_t *)swift_slowAlloc();
      uint64_t v33 = swift_slowAlloc();
      uint64_t v42 = v33;
      *(_DWORD *)uint64_t v32 = 136315138;
      if (qword_269F5F750 != -1) {
        swift_once();
      }
      uint64_t v34 = qword_269F5FC90;
      unint64_t v35 = *(void *)algn_269F5FC98;
      sub_2565847C0();
      sub_25657F44C(v34, v35, &v42);
      sub_256584810();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25657A000, v30, v31, "%s storeManifest request succeeded.", v32, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2A7F00](v33, -1, -1);
      MEMORY[0x25A2A7F00](v32, -1, -1);
    }
  }
}

void sub_25657E2B0(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6)
{
}

void sub_25657E400(unint64_t a1)
{
  uint64_t v4 = v2;
  uint64_t v6 = sub_256584560();
  os_log_type_t v7 = sub_256584800();
  unint64_t v38 = a1;
  if (!os_log_type_enabled(v6, v7))
  {

    goto LABEL_5;
  }
  uint64_t v8 = swift_slowAlloc();
  uint64_t v3 = swift_slowAlloc();
  uint64_t v40 = v3;
  *(_DWORD *)uint64_t v8 = 136315138;
  if (qword_269F5F750 != -1) {
    goto LABEL_34;
  }
  while (1)
  {
    uint64_t v9 = qword_269F5FC90;
    unint64_t v10 = *(void *)algn_269F5FC98;
    sub_2565847C0();
    sub_25657F44C(v9, v10, &v40);
    sub_256584810();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25657A000, v6, v7, "%s Sending commitStagedManifestForFSTags request...", (uint8_t *)v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A2A7F00](v3, -1, -1);
    MEMORY[0x25A2A7F00](v8, -1, -1);

    a1 = v38;
LABEL_5:
    os_log_type_t v11 = *(void **)(v1 + OBJC_IVAR____TtC24SecureMobileAssetExclave33MobileAssetExclaveServicesManager_lock);
    objc_msgSend(v11, sel_lock, v36);
    if (a1 >> 62)
    {
      sub_2565847C0();
      uint64_t v8 = sub_2565848A0();
    }
    else
    {
      uint64_t v8 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      sub_2565847C0();
    }
    uint64_t v37 = v4;
    id v36 = v11;
    if (!v8)
    {
      uint64_t v14 = (char *)MEMORY[0x263F8EE78];
      goto LABEL_20;
    }
    if (v8 >= 1) {
      break;
    }
    __break(1u);
LABEL_34:
    swift_once();
  }
  uint64_t v12 = 0;
  unint64_t v13 = a1 & 0xC000000000000001;
  uint64_t v14 = (char *)MEMORY[0x263F8EE78];
  do
  {
    if (v13) {
      id v15 = (id)MEMORY[0x25A2A79C0](v12, a1);
    }
    else {
      id v15 = *(id *)(a1 + 8 * v12 + 32);
    }
    int64_t v16 = v15;
    unsigned int v17 = objc_msgSend(v15, sel_unsignedIntValue, v36);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v14 = sub_25657F33C(0, *((void *)v14 + 2) + 1, 1, v14);
    }
    unint64_t v19 = *((void *)v14 + 2);
    unint64_t v18 = *((void *)v14 + 3);
    if (v19 >= v18 >> 1) {
      uint64_t v14 = sub_25657F33C((char *)(v18 > 1), v19 + 1, 1, v14);
    }
    ++v12;
    *((void *)v14 + 2) = v19 + 1;
    *(_DWORD *)&v14[4 * v19 + 32] = v17;

    a1 = v38;
  }
  while (v8 != v12);
LABEL_20:
  swift_bridgeObjectRelease();
  swift_retain();
  sub_256581B6C((uint64_t)v14);
  if (v37)
  {
    swift_release();
    swift_bridgeObjectRelease();
    objc_msgSend(v36, sel_unlock);
    id v20 = v37;
    id v21 = v37;
    uint64_t v22 = sub_256584560();
    os_log_type_t v23 = sub_2565847F0();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = swift_slowAlloc();
      uint64_t v25 = (void *)swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      uint64_t v40 = v26;
      *(_DWORD *)uint64_t v24 = 136315394;
      if (qword_269F5F750 != -1) {
        swift_once();
      }
      uint64_t v27 = qword_269F5FC90;
      unint64_t v28 = *(void *)algn_269F5FC98;
      sub_2565847C0();
      sub_25657F44C(v27, v28, &v40);
      sub_256584810();
      swift_bridgeObjectRelease();
      *(_WORD *)(v24 + 12) = 2112;
      id v29 = v37;
      uint64_t v39 = _swift_stdlib_bridgeErrorToNSError();
      sub_256584810();
      *uint64_t v25 = v39;

      _os_log_impl(&dword_25657A000, v22, v23, "%s commitStagedManifestForFSTags request failed: %@", (uint8_t *)v24, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269F5F760);
      swift_arrayDestroy();
      MEMORY[0x25A2A7F00](v25, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x25A2A7F00](v26, -1, -1);
      MEMORY[0x25A2A7F00](v24, -1, -1);
    }
    else
    {
    }
    swift_willThrow();
  }
  else
  {
    swift_release();
    swift_bridgeObjectRelease();
    objc_msgSend(v36, sel_unlock);
    os_log_t v30 = sub_256584560();
    os_log_type_t v31 = sub_256584800();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = (uint8_t *)swift_slowAlloc();
      uint64_t v33 = swift_slowAlloc();
      uint64_t v40 = v33;
      *(_DWORD *)uint64_t v32 = 136315138;
      if (qword_269F5F750 != -1) {
        swift_once();
      }
      uint64_t v34 = qword_269F5FC90;
      unint64_t v35 = *(void *)algn_269F5FC98;
      sub_2565847C0();
      sub_25657F44C(v34, v35, &v40);
      sub_256584810();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25657A000, v30, v31, "%s commitStagedManifestForFSTags request succeeded.", v32, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2A7F00](v33, -1, -1);
      MEMORY[0x25A2A7F00](v32, -1, -1);
    }
  }
}

void sub_25657EB14(int a1)
{
  uint64_t v3 = v2;
  uint64_t v4 = v1;
  uint64_t v6 = sub_256584560();
  os_log_type_t v7 = sub_256584800();
  if (os_log_type_enabled(v6, v7))
  {
    id v29 = v2;
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v32 = v9;
    *(_DWORD *)uint64_t v8 = 136315138;
    if (qword_269F5F750 != -1) {
      swift_once();
    }
    uint64_t v11 = qword_269F5FC90;
    unint64_t v10 = *(void *)algn_269F5FC98;
    sub_2565847C0();
    uint64_t v30 = sub_25657F44C(v11, v10, &v32);
    sub_256584810();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25657A000, v6, v7, "%s Sending invalidateManifestForFSTag request...", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A2A7F00](v9, -1, -1);
    MEMORY[0x25A2A7F00](v8, -1, -1);

    uint64_t v3 = v29;
  }
  else
  {
  }
  uint64_t v12 = *(void **)(v4 + OBJC_IVAR____TtC24SecureMobileAssetExclave33MobileAssetExclaveServicesManager_lock);
  objc_msgSend(v12, sel_lock, v29, v30);
  swift_retain();
  sub_256581F00(a1);
  if (v3)
  {
    swift_release();
    objc_msgSend(v12, sel_unlock);
    id v13 = v3;
    id v14 = v3;
    id v15 = sub_256584560();
    os_log_type_t v16 = sub_2565847F0();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = swift_slowAlloc();
      unint64_t v18 = (void *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      uint64_t v32 = v19;
      *(_DWORD *)uint64_t v17 = 136315394;
      if (qword_269F5F750 != -1) {
        swift_once();
      }
      uint64_t v20 = qword_269F5FC90;
      unint64_t v21 = *(void *)algn_269F5FC98;
      sub_2565847C0();
      sub_25657F44C(v20, v21, &v32);
      sub_256584810();
      swift_bridgeObjectRelease();
      *(_WORD *)(v17 + 12) = 2112;
      id v22 = v3;
      uint64_t v31 = _swift_stdlib_bridgeErrorToNSError();
      sub_256584810();
      *unint64_t v18 = v31;

      _os_log_impl(&dword_25657A000, v15, v16, "%s invalidateManifestForFSTag request failed: %@", (uint8_t *)v17, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269F5F760);
      swift_arrayDestroy();
      MEMORY[0x25A2A7F00](v18, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x25A2A7F00](v19, -1, -1);
      MEMORY[0x25A2A7F00](v17, -1, -1);
    }
    else
    {
    }
    swift_willThrow();
  }
  else
  {
    swift_release();
    objc_msgSend(v12, sel_unlock);
    os_log_type_t v23 = sub_256584560();
    os_log_type_t v24 = sub_256584800();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      uint64_t v32 = v26;
      *(_DWORD *)uint64_t v25 = 136315138;
      if (qword_269F5F750 != -1) {
        swift_once();
      }
      uint64_t v27 = qword_269F5FC90;
      unint64_t v28 = *(void *)algn_269F5FC98;
      sub_2565847C0();
      sub_25657F44C(v27, v28, &v32);
      sub_256584810();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25657A000, v23, v24, "%s invalidateManifestForFSTag request succeeded.", v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2A7F00](v26, -1, -1);
      MEMORY[0x25A2A7F00](v25, -1, -1);
    }
  }
}

id sub_25657F0D0()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void sub_25657F104()
{
}

id sub_25657F164()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MobileAssetExclaveServicesManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void *sub_25657F22C(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_269F5F818);
      unint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      id v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      unint64_t v10 = (void *)MEMORY[0x263F8EE78];
      id v13 = (void *)(MEMORY[0x263F8EE78] + 32);
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
    sub_256580DB8(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_25657F33C(char *result, int64_t a2, char a3, char *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_269F5F810);
      unint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 29;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 2);
      id v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      unint64_t v10 = (char *)MEMORY[0x263F8EE78];
      id v13 = (char *)(MEMORY[0x263F8EE78] + 32);
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
    sub_256580EAC(0, v8, v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_25657F44C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_25657F520(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25658108C((uint64_t)v12, *a3);
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
      sub_25658108C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    sub_2565847C0();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_25657F520(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_256584820();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_25657F6DC(a5, a6);
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
  uint64_t v8 = sub_256584870();
  if (!v8)
  {
    sub_256584880();
    __break(1u);
LABEL_17:
    uint64_t result = sub_2565848C0();
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

uint64_t sub_25657F6DC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25657F774(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_25657F954(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_25657F954(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25657F774(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_25657F8EC(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_256584850();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_256584880();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_2565847A0();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_2565848C0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_256584880();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_25657F8EC(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_269F5F820);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_25657F954(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269F5F820);
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
  id v13 = a4 + 32;
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
  uint64_t result = sub_2565848C0();
  __break(1u);
  return result;
}

unsigned char *sub_25657FAA4@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X1>, void *a3@<X8>)
{
  if (!result) {
    goto LABEL_4;
  }
  uint64_t v4 = a2 - result;
  if (a2 == result)
  {
    uint64_t result = 0;
LABEL_4:
    unint64_t v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    uint64_t result = (unsigned char *)sub_2565808FC(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    uint64_t result = (unsigned char *)sub_2565809C0((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000;
  }
  else
  {
    uint64_t result = (unsigned char *)sub_256580A3C((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

unint64_t sub_25657FB1C(uint64_t a1, uint64_t a2)
{
  sub_256584930();
  sub_256584780();
  uint64_t v4 = sub_256584950();
  return sub_25657FB94(a1, a2, v4);
}

unint64_t sub_25657FB94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_2565848E0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        id v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_2565848E0() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_25657FC78(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = (void *)MEMORY[0x263F8EE78];
  if (v2 != a2)
  {
    if (v2 > a2)
    {
      uint64_t v5 = a2;
      if (a2 < 0)
      {
LABEL_31:
        __break(1u);
        goto LABEL_32;
      }
      if (!v2)
      {
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
      uint64_t v6 = result;
      uint64_t result = sub_2565847C0();
      size_t v4 = 0;
      uint64_t v7 = v3 + 4;
      while (1)
      {
        char v8 = *(unsigned char *)(v6 + v5 + 32);
        if (!v4)
        {
          unint64_t v9 = v3[3];
          if ((uint64_t)((v9 >> 1) + 0x4000000000000000) < 0) {
            goto LABEL_29;
          }
          int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
          if (v10 <= 1) {
            uint64_t v11 = 1;
          }
          else {
            uint64_t v11 = v10;
          }
          __swift_instantiateConcreteTypeFromMangledName(&qword_269F5F820);
          uint64_t v12 = (void *)swift_allocObject();
          size_t v13 = 2 * _swift_stdlib_malloc_size(v12) - 64;
          v12[2] = v11;
          uint64_t v12[3] = v13;
          unint64_t v14 = (unint64_t)(v12 + 4);
          size_t v15 = v3[3] >> 1;
          if (v3[2])
          {
            if (v12 != v3 || v14 >= (unint64_t)v3 + v15 + 32) {
              memmove(v12 + 4, v3 + 4, v15);
            }
            v3[2] = 0;
          }
          uint64_t v7 = (unsigned char *)(v14 + v15);
          size_t v4 = (v13 >> 1) - v15;
          uint64_t result = swift_release();
          uint64_t v3 = v12;
        }
        BOOL v17 = __OFSUB__(v4--, 1);
        if (v17) {
          break;
        }
        ++v5;
        *v7++ = v8;
        if (v2 == v5)
        {
          uint64_t result = swift_bridgeObjectRelease();
          goto LABEL_24;
        }
      }
      __break(1u);
LABEL_29:
      __break(1u);
    }
    __break(1u);
    goto LABEL_31;
  }
  size_t v4 = 0;
LABEL_24:
  unint64_t v18 = v3[3];
  if (v18 < 2) {
    return (uint64_t)v3;
  }
  unint64_t v19 = v18 >> 1;
  BOOL v17 = __OFSUB__(v19, v4);
  unint64_t v20 = v19 - v4;
  if (!v17)
  {
    v3[2] = v20;
    return (uint64_t)v3;
  }
LABEL_33:
  __break(1u);
  return result;
}

void *sub_25657FDE8(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_256584550();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v8 = (void *)MEMORY[0x263F8EE78];
  switch(a2 >> 62)
  {
    case 1uLL:
      if (__OFSUB__(HIDWORD(a1), a1)) {
        goto LABEL_12;
      }
      uint64_t v9 = HIDWORD(a1) - (int)a1;
LABEL_6:
      if (v9)
      {
        if (v9 >= 1)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_269F5F820);
          char v8 = (void *)swift_allocObject();
          size_t v12 = _swift_stdlib_malloc_size(v8);
          v8[2] = v9;
          v8[3] = 2 * v12 - 64;
        }
        sub_256580B80(a1, a2);
        uint64_t v13 = sub_256584520();
        sub_256580BD8(a1, a2);
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
        if (v13 != v9)
        {
          __break(1u);
LABEL_12:
          __break(1u);
LABEL_13:
          __break(1u);
          JUMPOUT(0x25657FF94);
        }
      }
      return v8;
    case 2uLL:
      uint64_t v11 = *(void *)(a1 + 16);
      uint64_t v10 = *(void *)(a1 + 24);
      uint64_t v9 = v10 - v11;
      if (!__OFSUB__(v10, v11)) {
        goto LABEL_6;
      }
      goto LABEL_13;
    case 3uLL:
      return v8;
    default:
      uint64_t v9 = BYTE6(a2);
      goto LABEL_6;
  }
}

id sub_25657FFA4()
{
  id v1 = v0;
  uint64_t v2 = &v0[OBJC_IVAR____TtC24SecureMobileAssetExclave33MobileAssetExclaveServicesManager_log];
  uint64_t v3 = v1;
  sub_256584570();
  uint64_t v4 = OBJC_IVAR____TtC24SecureMobileAssetExclave33MobileAssetExclaveServicesManager_lock;
  unint64_t v5 = 0x2653FE000uLL;
  *(void *)&v3[v4] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08958]), sel_init);
  id result = (id)MobileGestalt_get_current_device();
  if (result)
  {
    uint64_t v7 = result;
    int exclaveCapability = MobileGestalt_get_exclaveCapability();

    uint64_t v9 = sub_256584560();
    os_log_type_t v10 = sub_256584800();
    BOOL v11 = os_log_type_enabled(v9, v10);
    if (exclaveCapability)
    {
      if (v11)
      {
        size_t v12 = (uint8_t *)swift_slowAlloc();
        uint64_t v13 = swift_slowAlloc();
        uint64_t v30 = v13;
        *(_DWORD *)size_t v12 = 136315138;
        if (qword_269F5F750 != -1) {
          swift_once();
        }
        uint64_t v14 = qword_269F5FC90;
        unint64_t v15 = *(void *)algn_269F5FC98;
        sub_2565847C0();
        uint64_t v29 = sub_25657F44C(v14, v15, &v30);
        sub_256584810();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25657A000, v9, v10, "%s Starting com.apple.mobileasset.conclave...", v12, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x25A2A7F00](v13, -1, -1);
        MEMORY[0x25A2A7F00](v12, -1, -1);

        unint64_t v5 = 0x2653FE000;
      }
      else
      {
      }
      type metadata accessor for MAExclaveManifestStorageService.Service();
      sub_2565810E8(&qword_269F5F850, (void (*)(uint64_t))type metadata accessor for MAExclaveManifestStorageService.Service);
      sub_256584740();
      *(void *)&v3[OBJC_IVAR____TtC24SecureMobileAssetExclave33MobileAssetExclaveServicesManager_tbClient] = v30;
      unint64_t v20 = sub_256584560();
      os_log_type_t v21 = sub_256584800();
      if (os_log_type_enabled(v20, v21))
      {
        id v22 = (uint8_t *)swift_slowAlloc();
        uint64_t v23 = swift_slowAlloc();
        uint64_t v30 = v23;
        *(_DWORD *)id v22 = 136315138;
        if (qword_269F5F750 != -1) {
          swift_once();
        }
        uint64_t v24 = qword_269F5FC90;
        unint64_t v25 = *(void *)algn_269F5FC98;
        sub_2565847C0();
        uint64_t v29 = sub_25657F44C(v24, v25, &v30);
        sub_256584810();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25657A000, v20, v21, "%s Successfully started com.apple.mobileasset.conclave", v22, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x25A2A7F00](v23, -1, -1);
        MEMORY[0x25A2A7F00](v22, -1, -1);
      }

      v28.receiver = v3;
      v28.super_class = (Class)type metadata accessor for MobileAssetExclaveServicesManager();
      return objc_msgSendSuper2(&v28, *(SEL *)(v5 + 1888));
    }
    else
    {
      if (v11)
      {
        os_log_type_t v16 = (uint8_t *)swift_slowAlloc();
        uint64_t v17 = swift_slowAlloc();
        uint64_t v30 = v17;
        *(_DWORD *)os_log_type_t v16 = 136315138;
        if (qword_269F5F750 != -1) {
          swift_once();
        }
        uint64_t v18 = qword_269F5FC90;
        unint64_t v19 = *(void *)algn_269F5FC98;
        sub_2565847C0();
        uint64_t v29 = sub_25657F44C(v18, v19, &v30);
        sub_256584810();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25657A000, v9, v10, "%s Exclaves not supported", v16, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x25A2A7F00](v17, -1, -1);
        MEMORY[0x25A2A7F00](v16, -1, -1);
      }

      uint64_t v26 = sub_256584580();
      (*(void (**)(char *, uint64_t))(*(void *)(v26 - 8) + 8))(v2, v26);
      uint64_t v27 = *(void **)&v3[v4];

      type metadata accessor for MobileAssetExclaveServicesManager();
      swift_deallocPartialClassInstance();
      return 0;
    }
  }
  else
  {
    __break(1u);
  }
  return result;
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

uint64_t sub_2565808FC(unsigned char *__src, unsigned char *a2)
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

uint64_t sub_2565809C0(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_256584500();
  swift_allocObject();
  uint64_t result = sub_2565844F0();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_256584530();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_256580A3C(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_256584500();
  swift_allocObject();
  uint64_t result = sub_2565844F0();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0) {
    return v2 << 32;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_256580AC0(uint64_t a1)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F5F840);
  uint64_t v10 = sub_256580FB4(&qword_269F5F848, &qword_269F5F840);
  v8[0] = a1;
  uint64_t v2 = __swift_project_boxed_opaque_existential_1(v8, v9);
  uint64_t v3 = (unsigned char *)(*v2 + 32);
  uint64_t v4 = &v3[*(void *)(*v2 + 16)];
  sub_2565847C0();
  sub_25657FAA4(v3, v4, &v7);
  uint64_t v5 = v7;
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v8);
  return v5;
}

uint64_t sub_256580B80(uint64_t a1, unint64_t a2)
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

uint64_t sub_256580BD8(uint64_t a1, unint64_t a2)
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

uint64_t type metadata accessor for MobileAssetExclaveServicesManager()
{
  uint64_t result = qword_269F5F7F8;
  if (!qword_269F5F7F8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_256580CC4()
{
  return type metadata accessor for MobileAssetExclaveServicesManager();
}

uint64_t sub_256580CCC()
{
  uint64_t result = sub_256584580();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

unint64_t sub_256580D78()
{
  unint64_t result = qword_269F5F808;
  if (!qword_269F5F808)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269F5F808);
  }
  return result;
}

uint64_t sub_256580DB8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_2565848C0();
  __break(1u);
  return result;
}

char *sub_256580EAC(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
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
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_2565848C0();
  __break(1u);
  return result;
}

_OWORD *sub_256580F9C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_256580FAC()
{
  return swift_release();
}

uint64_t sub_256580FB4(unint64_t *a1, uint64_t *a2)
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

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_25658108C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2565810E8(unint64_t *a1, void (*a2)(uint64_t))
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

void type metadata accessor for TransportError()
{
  if (!qword_269F5F860)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_269F5F860);
    }
  }
}

uint64_t sub_256581188()
{
  uint64_t v2 = sub_256584660();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2565846D0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)(v0 + 16);
  sub_256584700();
  if (!v1)
  {
    uint64_t v20 = v6;
    uint64_t v17 = v2;
    uint64_t v18 = v3;
    uint64_t v19 = v7;
    sub_2565846E0();
    sub_2565846B0();
    sub_2565846C0();
    sub_256584710();
    swift_release();
    swift_retain();
    sub_256584650();
    uint64_t v11 = sub_256583E18();
    uint64_t v12 = v20;
    uint64_t v10 = v11;
    if (v13)
    {
      sub_2565841E4();
      swift_allocError();
      *uint64_t v14 = v10;
      swift_willThrow();
    }
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v5, v17);
    (*(void (**)(char *, uint64_t))(v19 + 8))(v9, v12);
  }
  return v10;
}

uint64_t sub_256581464(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = sub_256584660();
  uint64_t v24 = *(void *)(v10 - 8);
  uint64_t v25 = v10;
  MEMORY[0x270FA5388]();
  uint64_t v23 = (char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_2565846D0();
  uint64_t v12 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v14 = (char *)v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (__OFADD__(sub_256583F0C(a3, a4, a5), 13))
  {
    __break(1u);
  }
  else
  {
    uint64_t v26 = v12;
    uint64_t v15 = *(void *)(v5 + 16);
    uint64_t v16 = sub_256584700();
    if (v6) {
      return v15 & 1;
    }
    v22[1] = v16;
    sub_2565846E0();
    sub_2565846B0();
    sub_2565846A0();
    sub_256584670();
    sub_2565823E4(a3, a4, a5);
    sub_2565846C0();
    sub_256584710();
    swift_release();
    swift_retain();
    uint64_t v18 = v23;
    sub_256584650();
    int v19 = sub_256584610();
    uint64_t v20 = v26;
    if (!v19)
    {
      LOBYTE(v15) = sub_2565845F0();
      swift_release();
      swift_release();
      (*(void (**)(char *, uint64_t))(v24 + 8))(v18, v25);
      (*(void (**)(char *, uint64_t))(v20 + 8))(v14, v27);
      return v15 & 1;
    }
    if (v19 == 1)
    {
      LOBYTE(v15) = sub_256583D2C();
      sub_2565841E4();
      swift_allocError();
      *os_log_type_t v21 = v15;
      swift_willThrow();
      swift_release();
      swift_release();
      (*(void (**)(char *, uint64_t))(v24 + 8))(v18, v25);
      (*(void (**)(char *, uint64_t))(v20 + 8))(v14, v27);
      return v15 & 1;
    }
  }
  uint64_t result = sub_256584890();
  __break(1u);
  return result;
}

uint64_t sub_25658181C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_256584660();
  uint64_t v19 = *(void *)(v7 - 8);
  uint64_t v20 = v7;
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_2565846D0();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (__OFADD__(sub_256583F0C(a1, a2, a3), 8))
  {
    __break(1u);
LABEL_10:
    uint64_t result = sub_256584890();
    __break(1u);
    return result;
  }
  uint64_t v21 = v10;
  uint64_t v22 = v11;
  uint64_t result = sub_256584700();
  if (!v3)
  {
    sub_2565846E0();
    sub_2565846B0();
    sub_2565823E4(a1, a2, a3);
    sub_2565846C0();
    sub_256584710();
    swift_release();
    swift_retain();
    sub_256584650();
    int v15 = sub_256584610();
    if (!v15) {
      goto LABEL_8;
    }
    if (v15 == 1)
    {
      char v16 = sub_256583D2C();
      sub_2565841E4();
      swift_allocError();
      *uint64_t v17 = v16;
      swift_willThrow();
LABEL_8:
      swift_release();
      swift_release();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v9, v20);
      return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v13, v21);
    }
    goto LABEL_10;
  }
  return result;
}

uint64_t sub_256581B6C(uint64_t a1)
{
  uint64_t v3 = sub_256584660();
  uint64_t v27 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2565846D0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11)
  {
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)(a1 + 16);
    do
    {
      if ((unint64_t)(v11 - 0x2000000000000000) < 0xE000000000000001)
      {
        __break(1u);
        goto LABEL_25;
      }
      v12 += 4;
      --v13;
    }
    while (v13);
    BOOL v8 = __OFADD__(v12, 8);
    uint64_t v14 = v12 + 8;
    if (v8) {
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v14 = 8;
    if (v8)
    {
LABEL_15:
      __break(1u);
      goto LABEL_16;
    }
  }
  if (__OFADD__(v14, 8))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v26 = v3;
  uint64_t result = sub_256584700();
  if (v1) {
    return result;
  }
  uint64_t v25 = result;
  sub_2565846E0();
  sub_2565846B0();
  sub_2565846B0();
  if (v11)
  {
    uint64_t v24 = v7;
    uint64_t v16 = v6;
    sub_2565847C0();
    for (uint64_t i = 0; i != v11; ++i)
      sub_2565846A0();
    swift_bridgeObjectRelease();
    uint64_t v6 = v16;
    uint64_t v7 = v24;
  }
  sub_2565846C0();
  sub_256584710();
LABEL_16:
  swift_release();
  swift_retain();
  sub_256584650();
  int v18 = sub_256584610();
  if (v18)
  {
    uint64_t v19 = v26;
    if (v18 == 1)
    {
      char v20 = sub_256583D2C();
      if (!v1)
      {
        char v21 = v20;
        sub_2565841E4();
        swift_allocError();
        *uint64_t v22 = v21;
        swift_willThrow();
      }
      (*(void (**)(char *, uint64_t))(v27 + 8))(v5, v19);
      goto LABEL_22;
    }
LABEL_26:
    uint64_t result = sub_256584890();
    __break(1u);
    return result;
  }
  (*(void (**)(char *, uint64_t))(v27 + 8))(v5, v26);
LABEL_22:
  swift_release();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

uint64_t sub_256581F00(int a1)
{
  int v24 = a1;
  uint64_t v2 = sub_256584660();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2565846D0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = sub_256584700();
  if (!v1)
  {
    uint64_t v19 = v5;
    uint64_t v20 = v3;
    uint64_t v21 = v2;
    uint64_t v22 = v6;
    uint64_t v23 = v7;
    sub_2565846E0();
    sub_2565846B0();
    sub_2565846A0();
    sub_2565846C0();
    sub_256584710();
    swift_release();
    swift_retain();
    uint64_t v11 = v19;
    sub_256584650();
    int v12 = sub_256584610();
    uint64_t v13 = v22;
    if (v12)
    {
      uint64_t v14 = v23;
      uint64_t v15 = v20;
      if (v12 == 1)
      {
        char v16 = sub_256583D2C();
        sub_2565841E4();
        swift_allocError();
        *uint64_t v17 = v16;
        swift_willThrow();
        swift_release();
        swift_release();
        (*(void (**)(char *, uint64_t))(v15 + 8))(v11, v21);
        return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v9, v13);
      }
      else
      {
        uint64_t result = sub_256584890();
        __break(1u);
      }
    }
    else
    {
      swift_release();
      swift_release();
      (*(void (**)(char *, uint64_t))(v20 + 8))(v11, v21);
      return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v9, v13);
    }
  }
  return result;
}

BOOL sub_256582244(char *a1, char *a2)
{
  return dword_256585154[*a1] == dword_256585154[*a2];
}

uint64_t sub_256582268()
{
  return sub_256584950();
}

uint64_t sub_2565822B8()
{
  return sub_256584940();
}

uint64_t sub_2565822F0()
{
  return sub_256584950();
}

uint64_t sub_25658233C@<X0>(int *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_256583A2C(*a1);
  *a2 = result;
  return result;
}

void sub_256582368(_DWORD *a1@<X8>)
{
  *a1 = dword_256585154[*v1];
}

uint64_t sub_256582384(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_256584448();
  unint64_t v5 = sub_25658449C();
  return MEMORY[0x270F9FB50](a1, a2, v4, v5);
}

uint64_t sub_2565823E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 16);
  sub_2565846B0();
  if (v5)
  {
    sub_2565847C0();
    for (uint64_t i = 0; i != v5; ++i)
      sub_256584690();
    swift_bridgeObjectRelease();
  }
  uint64_t v7 = *(void *)(a2 + 16);
  sub_2565846B0();
  if (v7)
  {
    sub_2565847C0();
    for (uint64_t j = 0; j != v7; ++j)
      sub_256584690();
    swift_bridgeObjectRelease();
  }
  uint64_t v9 = *(void *)(a3 + 16);
  uint64_t result = sub_2565846B0();
  if (v9)
  {
    sub_2565847C0();
    for (uint64_t k = 0; k != v9; ++k)
      sub_256584690();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_2565824D8()
{
  swift_release();
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t sub_256582510@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_2565846F0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  sub_256584730();
  swift_allocObject();
  uint64_t v9 = sub_256584720();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  *(void *)(v8 + 16) = v9;
  *a2 = v8;
  return result;
}

uint64_t sub_256582640(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_2565846D0();
  uint64_t v5 = *(void *)(v4 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  unint64_t v90 = &v87[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_instantiateConcreteTypeFromMangledName(&qword_269F5F8D8);
  uint64_t v7 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v9 = &v87[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  int v12 = &v87[-v11];
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  os_log_t v91 = &v87[-v14];
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  v93 = &v87[-v16];
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v19 = &v87[-v18];
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = &v87[-v20];
  uint64_t v22 = sub_256584660();
  MEMORY[0x270FA5388](v22);
  int v24 = &v87[-((v23 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v96 = v26;
  uint64_t v97 = v25;
  (*(void (**)(unsigned char *, uint64_t))(v26 + 16))(v24, a1);
  uint64_t v94 = v4;
  uint64_t v95 = v5;
  objc_super v28 = *(void (**)(unsigned char *, void, uint64_t, uint64_t))(v5 + 56);
  uint64_t v27 = (unsigned char *)(v5 + 56);
  uint64_t v92 = v28;
  v28(v21, 1, 1, v4);
  switch(sub_256583F58())
  {
    case 1u:
      unint64_t v64 = v2 + 3;
      uint64_t v65 = v2[6];
      uint64_t v66 = v2[7];
      __swift_project_boxed_opaque_existential_1(v64, v65);
      unint64_t v67 = sub_256584630();
      v93 = v24;
      v68 = v98;
      unint64_t v69 = sub_256583434(0, v67);
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v66 + 32))(v69, v65, v66);
      if (!v68)
      {
        swift_bridgeObjectRelease();
        int v70 = 23;
LABEL_34:
        sub_256584640();
        uint64_t v71 = v94;
        v92(v12, 0, 1, v94);
        sub_25658413C((uint64_t)v12, (uint64_t)v21);
        uint64_t v73 = *(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v95 + 48);
        if (v73(v21, 1, v71)) {
          goto LABEL_42;
        }
        if (v70 == 23) {
          goto LABEL_36;
        }
        goto LABEL_40;
      }
      swift_bridgeObjectRelease();
      id v100 = v68;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269F5F858);
      if (swift_dynamicCast())
      {
        int v70 = v99;

        goto LABEL_34;
      }
      goto LABEL_50;
    case 2u:
      uint64_t v53 = v2[6];
      uint64_t v54 = v2[7];
      __swift_project_boxed_opaque_existential_1(v2 + 3, v53);
      uint64_t v55 = sub_256584620();
      uint64_t v56 = v98;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v54 + 40))(v55, v53, v54);
      if (!v56)
      {
        int v52 = 23;
        goto LABEL_20;
      }
      id v100 = v56;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269F5F858);
      if (swift_dynamicCast())
      {
        int v52 = v99;

LABEL_20:
        sub_256584640();
        v93 = v24;
        uint64_t v71 = v94;
        v92(v9, 0, 1, v94);
        uint64_t v72 = (uint64_t)v9;
LABEL_21:
        sub_25658413C(v72, (uint64_t)v21);
        uint64_t v73 = *(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v95 + 48);
        if (v73(v21, 1, v71)) {
          goto LABEL_42;
        }
        if (v52 == 23)
        {
LABEL_36:
          sub_256584690();
          goto LABEL_41;
        }
LABEL_40:
        sub_256584690();
        sub_256584680();
        goto LABEL_41;
      }
      goto LABEL_50;
    case 3u:
      uint64_t v57 = v2[6];
      uint64_t v58 = v2[7];
      __swift_project_boxed_opaque_existential_1(v2 + 3, v57);
      unint64_t v59 = v98;
      uint64_t v60 = (*(uint64_t (**)(uint64_t, uint64_t))(v58 + 8))(v57, v58);
      if (v59)
      {
        id v100 = v59;
        __swift_instantiateConcreteTypeFromMangledName(&qword_269F5F858);
        if (swift_dynamicCast())
        {
          uint64_t v62 = v99;

          uint64_t v63 = 0;
          goto LABEL_28;
        }
LABEL_50:

        sub_256584890();
        __break(1u);
        JUMPOUT(0x256583304);
      }
      uint64_t v62 = v60;
      uint64_t v74 = *(void *)(v60 + 16);
      BOOL v75 = __OFADD__(v74, 8);
      uint64_t v76 = v74 + 8;
      if (v75)
      {
        __break(1u);
      }
      else
      {
        uint64_t v63 = v61;
        uint64_t v77 = *(void *)(v61 + 16);
        BOOL v75 = __OFADD__(v77, 8);
        uint64_t v78 = v77 + 8;
        if (!v75)
        {
          BOOL v75 = __OFADD__(v76, v78);
          uint64_t v79 = v76 + v78;
          if (!v75)
          {
            if (!__OFADD__(v79, 1))
            {
LABEL_28:
              sub_256584640();
              v93 = v24;
              uint64_t v71 = v94;
              v92(v19, 0, 1, v94);
              sub_25658413C((uint64_t)v19, (uint64_t)v21);
              uint64_t v73 = *(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v95 + 48);
              if (v73(v21, 1, v71))
              {
                sub_2565841A4(v62, v63, v59 != 0);
                goto LABEL_42;
              }
              sub_256584690();
              sub_256583688(v62, v63);
              sub_2565841A4(v62, v63, 0);
              goto LABEL_41;
            }
            goto LABEL_49;
          }
LABEL_48:
          __break(1u);
LABEL_49:
          __break(1u);
          goto LABEL_50;
        }
      }
      __break(1u);
      goto LABEL_48;
    case 4u:
      uint64_t v41 = v2[6];
      uint64_t v42 = v2[7];
      __swift_project_boxed_opaque_existential_1(v2 + 3, v41);
      unint64_t v43 = sub_256584630();
      BOOL v44 = v98;
      unint64_t v45 = sub_256583318(0, v43);
      unint64_t v46 = sub_256584630();
      unint64_t v47 = sub_256583318(0, v46);
      unint64_t v48 = sub_256584630();
      v93 = v24;
      unint64_t v49 = sub_256583318(0, v48);
      (*(void (**)(unint64_t, unint64_t, unint64_t, uint64_t, uint64_t))(v42 + 24))(v45, v47, v49, v41, v42);
      if (v44)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        id v100 = v44;
        __swift_instantiateConcreteTypeFromMangledName(&qword_269F5F858);
        char v50 = swift_dynamicCast();
        uint64_t v51 = v91;
        if ((v50 & 1) == 0) {
          goto LABEL_50;
        }
        int v52 = v99;
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        int v52 = 23;
        uint64_t v51 = v91;
      }
      sub_256584640();
      uint64_t v71 = v94;
      v92(v51, 0, 1, v94);
      uint64_t v72 = (uint64_t)v51;
      goto LABEL_21;
    default:
      os_log_t v91 = v27;
      uint64_t v29 = v2[6];
      uint64_t v30 = v2[7];
      unint64_t v89 = __swift_project_boxed_opaque_existential_1(v2 + 3, v29);
      unsigned int v88 = sub_256584620();
      char v31 = sub_2565845F0();
      unint64_t v32 = sub_256584630();
      uint64_t v33 = v98;
      unint64_t v34 = sub_256583318(0, v32);
      unint64_t v35 = sub_256584630();
      unint64_t v36 = sub_256583318(0, v35);
      unint64_t v37 = sub_256584630();
      unint64_t v38 = sub_256583318(0, v37);
      char v39 = (*(uint64_t (**)(void, void, unint64_t, unint64_t, unint64_t, uint64_t, uint64_t))(v30 + 16))(v88, v31 & 1, v34, v36, v38, v29, v30);
      if (v33)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        id v100 = v33;
        __swift_instantiateConcreteTypeFromMangledName(&qword_269F5F858);
        if ((swift_dynamicCast() & 1) == 0) {
          goto LABEL_50;
        }
        unsigned int v40 = v99 | 0xFFFFFF80;
      }
      else
      {
        char v80 = v39;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        unsigned int v40 = v80 & 1;
      }
      uint64_t v81 = (uint64_t)v93;
      sub_256584640();
      v93 = v24;
      uint64_t v71 = v94;
      v92((unsigned char *)v81, 0, 1, v94);
      sub_25658413C(v81, (uint64_t)v21);
      uint64_t v73 = *(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v95 + 48);
      if (v73(v21, 1, v71)) {
        goto LABEL_42;
      }
      if ((v40 & 0x80000000) != 0) {
        goto LABEL_40;
      }
      sub_256584690();
      sub_256584670();
LABEL_41:
      uint64_t v71 = v94;
LABEL_42:
      if (v73(v21, 1, v71))
      {
        uint64_t v82 = 0;
      }
      else
      {
        uint64_t v83 = v95;
        unint64_t v84 = v90;
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v95 + 16))(v90, v21, v71);
        uint64_t v82 = sub_2565846C0();
        (*(void (**)(unsigned char *, uint64_t))(v83 + 8))(v84, v71);
      }
      v85 = v93;
      sub_2565840DC((uint64_t)v21);
      (*(void (**)(unsigned char *, uint64_t))(v96 + 8))(v85, v97);
      return v82;
  }
}

unint64_t sub_256583318(unint64_t result, unint64_t a2)
{
  unint64_t v3 = result;
  uint64_t v4 = a2 - result;
  if (a2 < result)
  {
    if ((uint64_t)(result - a2) < 0)
    {
LABEL_16:
      __break(1u);
      goto LABEL_17;
    }
    uint64_t v4 = a2 - result;
LABEL_5:
    uint64_t v5 = MEMORY[0x263F8EE78];
    if (!v4) {
      return v5;
    }
    uint64_t v10 = MEMORY[0x263F8EE78];
    uint64_t result = sub_25658373C(0, v4 & ~(v4 >> 63), 0);
    uint64_t v6 = a2 - v3;
    if (a2 >= v3 && (v4 & 0x8000000000000000) == 0)
    {
      uint64_t v5 = v10;
      while (1)
      {
        uint64_t result = sub_256584610();
        char v7 = result;
        unint64_t v9 = *(void *)(v10 + 16);
        unint64_t v8 = *(void *)(v10 + 24);
        if (v9 >= v8 >> 1) {
          uint64_t result = sub_25658373C(v8 > 1, v9 + 1, 1);
        }
        *(void *)(v10 + 16) = v9 + 1;
        *(unsigned char *)(v10 + v9 + 32) = v7;
        if (!v6) {
          break;
        }
        --v6;
        if (!--v4) {
          return v5;
        }
      }
      __break(1u);
    }
    __break(1u);
    goto LABEL_16;
  }
  if ((uint64_t)(a2 - result) >= 0) {
    goto LABEL_5;
  }
LABEL_17:
  __break(1u);
  return result;
}

unint64_t sub_256583434(unint64_t result, unint64_t a2)
{
  unint64_t v3 = result;
  uint64_t v4 = a2 - result;
  if (a2 < result)
  {
    if ((uint64_t)(result - a2) < 0)
    {
LABEL_16:
      __break(1u);
      goto LABEL_17;
    }
    uint64_t v4 = a2 - result;
LABEL_5:
    uint64_t v5 = MEMORY[0x263F8EE78];
    if (!v4) {
      return v5;
    }
    uint64_t v10 = MEMORY[0x263F8EE78];
    uint64_t result = sub_25658375C(0, v4 & ~(v4 >> 63), 0);
    uint64_t v6 = a2 - v3;
    if (a2 >= v3 && (v4 & 0x8000000000000000) == 0)
    {
      uint64_t v5 = v10;
      while (1)
      {
        uint64_t result = sub_256584620();
        int v7 = result;
        unint64_t v9 = *(void *)(v10 + 16);
        unint64_t v8 = *(void *)(v10 + 24);
        if (v9 >= v8 >> 1) {
          uint64_t result = sub_25658375C(v8 > 1, v9 + 1, 1);
        }
        *(void *)(v10 + 16) = v9 + 1;
        *(_DWORD *)(v10 + 4 * v9 + 32) = v7;
        if (!v6) {
          break;
        }
        --v6;
        if (!--v4) {
          return v5;
        }
      }
      __break(1u);
    }
    __break(1u);
    goto LABEL_16;
  }
  if ((uint64_t)(a2 - result) >= 0) {
    goto LABEL_5;
  }
LABEL_17:
  __break(1u);
  return result;
}

uint64_t sub_256583550()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 24);
  return MEMORY[0x270FA0228](v0, 64, 7);
}

uint64_t sub_256583590(uint64_t a1)
{
  return sub_256582640(a1);
}

uint64_t sub_2565835B4()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for MAExclaveManifestStorageService()
{
  return self;
}

uint64_t type metadata accessor for MAExclaveManifestStorageService.Service()
{
  return self;
}

uint64_t type metadata accessor for MAExclaveManifestStorageService.Server()
{
  return self;
}

unint64_t sub_256583634()
{
  unint64_t result = qword_269F5F8D0;
  if (!qword_269F5F8D0)
  {
    type metadata accessor for MAExclaveManifestStorageService.Server();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F5F8D0);
  }
  return result;
}

uint64_t sub_256583688(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  sub_2565846B0();
  if (v3)
  {
    sub_2565847C0();
    for (uint64_t i = 0; i != v3; ++i)
      sub_256584690();
    swift_bridgeObjectRelease();
  }
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t result = sub_2565846B0();
  if (v5)
  {
    sub_2565847C0();
    for (uint64_t j = 0; j != v5; ++j)
      sub_256584690();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25658373C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25658377C(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_25658375C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2565838CC(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_25658377C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269F5F820);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  int v12 = v10 + 32;
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
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_2565848C0();
  __break(1u);
  return result;
}

uint64_t sub_2565838CC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269F5F810);
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
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
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
  uint64_t result = sub_2565848C0();
  __break(1u);
  return result;
}

uint64_t sub_256583A2C(int a1)
{
  uint64_t result = 1;
  switch(a1)
  {
    case 0:
      uint64_t result = 0;
      break;
    case 1:
      return result;
    case 2:
      uint64_t result = 2;
      break;
    case 3:
    case 4:
    case 6:
    case 7:
    case 8:
    case 10:
    case 11:
    case 14:
    case 15:
    case 16:
    case 18:
    case 19:
    case 23:
    case 24:
    case 25:
    case 26:
    case 27:
    case 29:
    case 31:
    case 32:
    case 33:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 52:
    case 53:
    case 54:
    case 56:
    case 57:
    case 58:
    case 59:
    case 60:
    case 61:
    case 62:
    case 64:
    case 65:
    case 66:
    case 67:
    case 68:
    case 69:
    case 71:
    case 72:
    case 73:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 79:
    case 81:
    case 82:
    case 83:
    case 84:
    case 85:
    case 86:
    case 87:
    case 88:
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 97:
    case 98:
    case 99:
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 106:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 113:
    case 114:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 120:
    case 121:
    case 122:
    case 123:
    case 124:
    case 125:
    case 126:
    case 127:
      goto LABEL_5;
    case 5:
      uint64_t result = 3;
      break;
    case 9:
      uint64_t result = 4;
      break;
    case 12:
      uint64_t result = 5;
      break;
    case 13:
      uint64_t result = 6;
      break;
    case 17:
      uint64_t result = 7;
      break;
    case 20:
      uint64_t result = 8;
      break;
    case 21:
      uint64_t result = 9;
      break;
    case 22:
      uint64_t result = 10;
      break;
    case 28:
      uint64_t result = 11;
      break;
    case 30:
      uint64_t result = 12;
      break;
    case 34:
      uint64_t result = 13;
      break;
    case 35:
      uint64_t result = 14;
      break;
    case 45:
      uint64_t result = 15;
      break;
    case 55:
      uint64_t result = 16;
      break;
    case 63:
      uint64_t result = 17;
      break;
    case 70:
      uint64_t result = 18;
      break;
    case 80:
      uint64_t result = 19;
      break;
    case 128:
      uint64_t result = 20;
      break;
    case 129:
      uint64_t result = 21;
      break;
    default:
      if (a1 == 9999) {
        uint64_t result = 22;
      }
      else {
LABEL_5:
      }
        uint64_t result = 23;
      break;
  }
  return result;
}

uint64_t sub_256583D2C()
{
  int v0 = sub_256584600();
  uint64_t result = sub_256583A2C(v0);
  if (result == 23)
  {
    sub_256584840();
    swift_bridgeObjectRelease();
    sub_2565848D0();
    sub_256584790();
    swift_bridgeObjectRelease();
    uint64_t result = sub_256584890();
    __break(1u);
  }
  return result;
}

uint64_t sub_256583E18()
{
  unint64_t v1 = v0;
  int v2 = sub_256584610();
  if (v2 == 1)
  {
    unsigned __int8 v3 = sub_256583D2C();
    if (!v0) {
      return v3;
    }
    return v1;
  }
  if (!v2)
  {
    unint64_t v4 = sub_256584630();
    unint64_t v1 = sub_256583318(0, v4);
    unint64_t v5 = sub_256584630();
    sub_256583318(0, v5);
    return v1;
  }
  uint64_t result = sub_256584890();
  __break(1u);
  return result;
}

uint64_t sub_256583F0C(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(result + 16);
  BOOL v4 = __OFADD__(v3, 8);
  uint64_t v5 = v3 + 8;
  if (v4)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v6 = *(void *)(a2 + 16);
  BOOL v4 = __OFADD__(v6, 8);
  uint64_t v7 = v6 + 8;
  if (v4)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  BOOL v4 = __OFADD__(v5, v7);
  uint64_t v8 = v5 + v7;
  if (v4)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v9 = *(void *)(a3 + 16);
  BOOL v4 = __OFADD__(v9, 8);
  uint64_t v10 = v9 + 8;
  if (v4)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  uint64_t result = v8 + v10;
  if (__OFADD__(v8, v10)) {
LABEL_11:
  }
    __break(1u);
  return result;
}

uint64_t sub_256583F58()
{
  uint64_t v0 = sub_256584630();
  if (v0 > 0x422BFAA998E697FDLL)
  {
    switch(v0)
    {
      case 0x422BFAA998E697FELL:
        return 3;
      case 0x784C0CECA4AF3CE9:
        return 4;
      case 0x61402D2633DA9042:
        return 1;
    }
    goto LABEL_13;
  }
  if (v0 == 0xAF59BA1DDE0196CDLL) {
    return 2;
  }
  if (v0 != 0x12C32D59FF853455)
  {
LABEL_13:
    sub_256584840();
    sub_256584790();
    sub_2565848D0();
    sub_256584790();
    swift_bridgeObjectRelease();
    uint64_t result = sub_256584890();
    __break(1u);
    return result;
  }
  return 0;
}

uint64_t sub_2565840DC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F5F8D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25658413C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F5F8D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_2565841A4(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_2565841E4()
{
  unint64_t result = qword_269F5F8E0;
  if (!qword_269F5F8E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F5F8E0);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MAStorageError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xEA) {
    goto LABEL_17;
  }
  if (a2 + 22 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 22) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 22;
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
      return (*a1 | (v4 << 8)) - 22;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 22;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x17;
  int v8 = v6 - 23;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for MAStorageError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 22 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 22) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xEA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xE9)
  {
    unsigned int v6 = ((a2 - 234) >> 8) + 1;
    *unint64_t result = a2 + 22;
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
        JUMPOUT(0x2565843A4);
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
          *unint64_t result = a2 + 22;
        break;
    }
  }
  return result;
}

uint64_t sub_2565843CC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_2565843D8(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for MAStorageError()
{
  return &type metadata for MAStorageError;
}

unint64_t sub_2565843F4()
{
  unint64_t result = qword_269F5F8E8;
  if (!qword_269F5F8E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F5F8E8);
  }
  return result;
}

unint64_t sub_256584448()
{
  unint64_t result = qword_269F5F8F0;
  if (!qword_269F5F8F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F5F8F0);
  }
  return result;
}

unint64_t sub_25658449C()
{
  unint64_t result = qword_269F5F8F8;
  if (!qword_269F5F8F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F5F8F8);
  }
  return result;
}

uint64_t sub_2565844F0()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_256584500()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_256584510()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_256584520()
{
  return MEMORY[0x270EF0048]();
}

uint64_t sub_256584530()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_256584540()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_256584550()
{
  return MEMORY[0x270EF0238]();
}

uint64_t sub_256584560()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_256584570()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_256584580()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_256584590()
{
  return MEMORY[0x270EEAA78]();
}

uint64_t sub_2565845A0()
{
  return MEMORY[0x270EEAA80]();
}

uint64_t sub_2565845B0()
{
  return MEMORY[0x270EEAA98]();
}

uint64_t sub_2565845C0()
{
  return MEMORY[0x270EEAAA8]();
}

uint64_t sub_2565845D0()
{
  return MEMORY[0x270EEB060]();
}

uint64_t sub_2565845E0()
{
  return MEMORY[0x270EEB090]();
}

uint64_t sub_2565845F0()
{
  return MEMORY[0x270F7DF58]();
}

uint64_t sub_256584600()
{
  return MEMORY[0x270F7DF80]();
}

uint64_t sub_256584610()
{
  return MEMORY[0x270F7DF88]();
}

uint64_t sub_256584620()
{
  return MEMORY[0x270F7DFA0]();
}

uint64_t sub_256584630()
{
  return MEMORY[0x270F7DFB0]();
}

uint64_t sub_256584640()
{
  return MEMORY[0x270F7DFC0]();
}

uint64_t sub_256584650()
{
  return MEMORY[0x270F7DFC8]();
}

uint64_t sub_256584660()
{
  return MEMORY[0x270F7DFD0]();
}

uint64_t sub_256584670()
{
  return MEMORY[0x270F7DFE0]();
}

uint64_t sub_256584680()
{
  return MEMORY[0x270F7DFF8]();
}

uint64_t sub_256584690()
{
  return MEMORY[0x270F7E000]();
}

uint64_t sub_2565846A0()
{
  return MEMORY[0x270F7E010]();
}

uint64_t sub_2565846B0()
{
  return MEMORY[0x270F7E018]();
}

uint64_t sub_2565846C0()
{
  return MEMORY[0x270F7E028]();
}

uint64_t sub_2565846D0()
{
  return MEMORY[0x270F7E038]();
}

uint64_t sub_2565846E0()
{
  return MEMORY[0x270F7E048]();
}

uint64_t sub_2565846F0()
{
  return MEMORY[0x270F7E058]();
}

uint64_t sub_256584700()
{
  return MEMORY[0x270F7E060]();
}

uint64_t sub_256584710()
{
  return MEMORY[0x270F7E068]();
}

uint64_t sub_256584720()
{
  return MEMORY[0x270F7E070]();
}

uint64_t sub_256584730()
{
  return MEMORY[0x270F7E088]();
}

uint64_t sub_256584740()
{
  return MEMORY[0x270F7E0A8]();
}

uint64_t sub_256584750()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_256584760()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_256584770()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_256584780()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_256584790()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2565847A0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2565847B0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_2565847C0()
{
  return MEMORY[0x270EF1BC0]();
}

uint64_t sub_2565847D0()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_2565847E0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_2565847F0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_256584800()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_256584810()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_256584820()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_256584830()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_256584840()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_256584850()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_256584860()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_256584870()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_256584880()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_256584890()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_2565848A0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_2565848B0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_2565848C0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2565848D0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_2565848E0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2565848F0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_256584900()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_256584910()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_256584930()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_256584940()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_256584950()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x270F960E8]();
}

uint64_t MobileGestalt_get_exclaveCapability()
{
  return MEMORY[0x270F96128]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
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

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}