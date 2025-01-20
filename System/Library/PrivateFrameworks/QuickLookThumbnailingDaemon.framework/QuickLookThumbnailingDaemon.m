void sub_1DDC6102C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1DDC6128C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
}

void sub_1DDC616B0(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 96));
  _Unwind_Resume(a1);
}

id _log()
{
  uint64_t v0 = MEMORY[0x1E4F3A768];
  uint64_t v1 = *(void **)(MEMORY[0x1E4F3A768] + 56);
  if (!v1)
  {
    QLTInitLogging();
    uint64_t v1 = *(void **)(v0 + 56);
  }
  return v1;
}

id _log_0()
{
  uint64_t v0 = MEMORY[0x1E4F3A768];
  uint64_t v1 = *(void **)(MEMORY[0x1E4F3A768] + 8);
  if (!v1)
  {
    QLTInitLogging();
    uint64_t v1 = *(void **)(v0 + 8);
  }
  return v1;
}

id _log_1()
{
  uint64_t v0 = MEMORY[0x1E4F3A768];
  uint64_t v1 = *(void **)(MEMORY[0x1E4F3A768] + 72);
  if (!v1)
  {
    QLTInitLogging();
    uint64_t v1 = *(void **)(v0 + 72);
  }
  return v1;
}

id _log_2()
{
  uint64_t v0 = (void **)MEMORY[0x1E4F3A768];
  uint64_t v1 = (void *)*MEMORY[0x1E4F3A768];
  if (!*MEMORY[0x1E4F3A768])
  {
    QLTInitLogging();
    uint64_t v1 = *v0;
  }
  return v1;
}

id _log_3()
{
  uint64_t v0 = MEMORY[0x1E4F3A768];
  uint64_t v1 = *(void **)(MEMORY[0x1E4F3A768] + 24);
  if (!v1)
  {
    QLTInitLogging();
    uint64_t v1 = *(void **)(v0 + 24);
  }
  return v1;
}

id _log_4()
{
  uint64_t v0 = MEMORY[0x1E4F3A768];
  uint64_t v1 = *(void **)(MEMORY[0x1E4F3A768] + 128);
  if (!v1)
  {
    QLTInitLogging();
    uint64_t v1 = *(void **)(v0 + 128);
  }
  return v1;
}

id _log_5()
{
  uint64_t v0 = MEMORY[0x1E4F3A768];
  uint64_t v1 = *(void **)(MEMORY[0x1E4F3A768] + 40);
  if (!v1)
  {
    QLTInitLogging();
    uint64_t v1 = *(void **)(v0 + 40);
  }
  return v1;
}

id _log_6()
{
  uint64_t v0 = MEMORY[0x1E4F3A768];
  uint64_t v1 = *(void **)(MEMORY[0x1E4F3A768] + 176);
  if (!v1)
  {
    QLTInitLogging();
    uint64_t v1 = *(void **)(v0 + 176);
  }
  return v1;
}

id _log_7()
{
  uint64_t v0 = MEMORY[0x1E4F3A768];
  uint64_t v1 = *(void **)(MEMORY[0x1E4F3A768] + 64);
  if (!v1)
  {
    QLTInitLogging();
    uint64_t v1 = *(void **)(v0 + 64);
  }
  return v1;
}

id _log_8()
{
  uint64_t v0 = MEMORY[0x1E4F3A768];
  uint64_t v1 = *(void **)(MEMORY[0x1E4F3A768] + 48);
  if (!v1)
  {
    QLTInitLogging();
    uint64_t v1 = *(void **)(v0 + 48);
  }
  return v1;
}

id _log_9()
{
  uint64_t v0 = MEMORY[0x1E4F3A768];
  uint64_t v1 = *(void **)(MEMORY[0x1E4F3A768] + 168);
  if (!v1)
  {
    QLTInitLogging();
    uint64_t v1 = *(void **)(v0 + 168);
  }
  return v1;
}

void sub_1DDC65380(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DDC65AE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, os_activity_scope_state_s state)
{
}

void sub_1DDC664F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
}

id _dbLog()
{
  uint64_t v0 = MEMORY[0x1E4F3A768];
  uint64_t v1 = *(void **)(MEMORY[0x1E4F3A768] + 88);
  if (!v1)
  {
    QLTInitLogging();
    uint64_t v1 = *(void **)(v0 + 88);
  }
  return v1;
}

void sub_1DDC68EE4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DDC690E4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DDC69280(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DDC6A7C4(void *a1@<X8>)
{
  sub_1DDC6AA5C(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t sub_1DDC6A7E4(void *a1, uint64_t a2)
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v5 = type metadata accessor for ThumbnailExtensionMonitor.Predicate(0);
  MEMORY[0x1F4188790](v5);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1DDCB4A40();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x1F4188790](v8);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10);
  v14 = (char *)&v22 - v13;
  id v15 = objc_msgSend(a1, sel_contentType);
  if (!v15) {
    return 0;
  }
  v16 = v15;
  sub_1DDCB49D0();

  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v14, v12, v8);
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v7, v14, v8);
  id v17 = objc_msgSend(a1, sel_shouldUseRestrictedExtension);
  v7[*(int *)(v5 + 20)] = (char)v17;
  *(void *)&v7[*(int *)(v5 + 24)] = a2;
  MEMORY[0x1F4188790](v17);
  *(&v22 - 4) = v2;
  *(&v22 - 3) = (uint64_t)v7;
  *(&v22 - 2) = ObjectType;
  id v19 = v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE9E470);
  sub_1DDCB4CC0();

  uint64_t v20 = v24;
  sub_1DDC6B728((uint64_t)v7);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
  return v20;
}

void sub_1DDC6AA5C(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  v53 = a3;
  uint64_t v48 = type metadata accessor for ThumbnailExtensionMonitor.Predicate(0);
  MEMORY[0x1F4188790](v48);
  v49 = &v45[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = sub_1DDCB4A80();
  uint64_t v51 = *(void *)(v6 - 8);
  uint64_t v52 = v6;
  MEMORY[0x1F4188790](v6);
  v50 = &v45[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE9E418);
  uint64_t v9 = MEMORY[0x1F4188790](v8 - 8);
  uint64_t v11 = &v45[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v9);
  uint64_t v13 = &v45[-v12];
  uint64_t v14 = sub_1DDCB4920();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v14);
  id v17 = &v45[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  id v18 = (uint64_t *)(a1 + OBJC_IVAR___QLThumbnailExtensionMonitor_matchingExtensionsCache);
  swift_beginAccess();
  uint64_t v19 = *v18;
  if (!*(void *)(*v18 + 16))
  {
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v13, 1, 1, v14);
LABEL_7:
    sub_1DDC716E0((uint64_t)v13, &qword_1EBE9E418);
    goto LABEL_13;
  }
  swift_bridgeObjectRetain();
  unint64_t v20 = sub_1DDC6B4D8(a2);
  if (v21)
  {
    (*(void (**)(unsigned char *, unint64_t, uint64_t))(v15 + 16))(v13, *(void *)(v19 + 56) + *(void *)(v15 + 72) * v20, v14);
    uint64_t v22 = 0;
  }
  else
  {
    uint64_t v22 = 1;
  }
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v13, v22, 1, v14);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1) {
    goto LABEL_7;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v15 + 32))(v17, v13, v14);
  v23 = (uint64_t *)(a1 + OBJC_IVAR___QLThumbnailExtensionMonitor_extensionByIdentifier);
  swift_beginAccess();
  uint64_t v24 = *v23;
  if (*(void *)(*v23 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v25 = sub_1DDC6BA08((uint64_t)v17);
    if (v26)
    {
      id v27 = *(id *)(*(void *)(v24 + 56) + 8 * v25);
      swift_bridgeObjectRelease();
      (*(void (**)(unsigned char *, uint64_t))(v15 + 8))(v17, v14);
      goto LABEL_21;
    }
    swift_bridgeObjectRelease();
  }
  swift_beginAccess();
  sub_1DDCA8334(a2, (uint64_t)v11);
  sub_1DDC716E0((uint64_t)v11, &qword_1EBE9E418);
  swift_endAccess();
  (*(void (**)(unsigned char *, uint64_t))(v15 + 8))(v17, v14);
LABEL_13:
  v28 = (void *)sub_1DDC71044(a2);
  unint64_t v31 = v30;
  if (v28)
  {
    id v32 = v28;
    swift_bridgeObjectRelease();
    id v27 = (id)sub_1DDCA66FC(a2, v32);
  }
  else
  {
    uint64_t v33 = v29;
    if (qword_1EBE9E478 != -1) {
      swift_once();
    }
    uint64_t v34 = v52;
    uint64_t v35 = __swift_project_value_buffer(v52, (uint64_t)qword_1EBE9EA10);
    v37 = v50;
    uint64_t v36 = v51;
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v51 + 16))(v50, v35, v34);
    v38 = v49;
    sub_1DDC6B840(a2, (uint64_t)v49);
    swift_bridgeObjectRetain();
    v39 = sub_1DDCB4A60();
    os_log_type_t v40 = sub_1DDCB4C90();
    int v41 = v40;
    if (os_log_type_enabled(v39, v40))
    {
      uint64_t v42 = swift_slowAlloc();
      uint64_t v47 = swift_slowAlloc();
      uint64_t v56 = v47;
      *(_DWORD *)uint64_t v42 = 136315394;
      int v46 = v41;
      uint64_t v54 = sub_1DDCB4990();
      unint64_t v55 = v43;
      swift_bridgeObjectRetain();
      sub_1DDCB4B80();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v54 = sub_1DDC6D1CC(v54, v55, &v56);
      sub_1DDCB4D10();
      swift_bridgeObjectRelease();
      sub_1DDC6B728((uint64_t)v38);
      *(_WORD *)(v42 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v54 = sub_1DDC6D1CC(v33, v31, &v56);
      sub_1DDCB4D10();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1DDC5E000, v39, (os_log_type_t)v46, "No extension found for %s, reason: %s", (uint8_t *)v42, 0x16u);
      uint64_t v44 = v47;
      swift_arrayDestroy();
      MEMORY[0x1E01C6640](v44, -1, -1);
      MEMORY[0x1E01C6640](v42, -1, -1);

      (*(void (**)(unsigned char *, uint64_t))(v51 + 8))(v50, v52);
    }
    else
    {
      sub_1DDC6B728((uint64_t)v38);
      swift_bridgeObjectRelease_n();

      (*(void (**)(unsigned char *, uint64_t))(v36 + 8))(v37, v34);
    }
    id v27 = 0;
  }
LABEL_21:
  void *v53 = v27;
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

id sub_1DDC6B47C()
{
  swift_bridgeObjectRetain();
  uint64_t v0 = (void *)sub_1DDCB4B30();
  swift_bridgeObjectRelease();
  return v0;
}

unint64_t sub_1DDC6B4D8(uint64_t a1)
{
  sub_1DDCB4F70();
  sub_1DDCB4A40();
  sub_1DDC6BCC4((unint64_t *)&unk_1EBE9E420, MEMORY[0x1E4FBCEA8]);
  sub_1DDCB4B10();
  type metadata accessor for ThumbnailExtensionMonitor.Predicate(0);
  sub_1DDCB4F90();
  sub_1DDCB4F80();
  uint64_t v2 = sub_1DDCB4FA0();
  return sub_1DDC6B5B8(a1, v2);
}

unint64_t sub_1DDC6B5B8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for ThumbnailExtensionMonitor.Predicate(0);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v10 = a2 & ~v9;
  if ((*(void *)(v2 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = ~v9;
    uint64_t v12 = *(void *)(v6 + 72);
    while (1)
    {
      sub_1DDC6B840(*(void *)(v2 + 48) + v10 * v12, (uint64_t)v8);
      if ((sub_1DDCB49C0() & 1) != 0
        && v8[*(int *)(v5 + 20)] == *(unsigned char *)(a1 + *(int *)(v5 + 20))
        && *(void *)&v8[*(int *)(v5 + 24)] == *(void *)(a1 + *(int *)(v5 + 24)))
      {
        break;
      }
      sub_1DDC6B728((uint64_t)v8);
      unint64_t v10 = (v10 + 1) & v11;
      if (((*(void *)(v2 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        return v10;
      }
    }
    sub_1DDC6B728((uint64_t)v8);
  }
  return v10;
}

uint64_t sub_1DDC6B728(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ThumbnailExtensionMonitor.Predicate(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1DDC6B784(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t type metadata accessor for ThumbnailExtensionMonitor.Predicate(uint64_t a1)
{
  return sub_1DDC6B784(a1, qword_1EBE9E6C0);
}

uint64_t sub_1DDC6B7DC(uint64_t a1)
{
  uint64_t v2 = sub_1DDCB4A40();
  v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t sub_1DDC6B840(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ThumbnailExtensionMonitor.Predicate(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DDC6B8A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1DDCB4A40();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  return a1;
}

unint64_t sub_1DDC6BA08(uint64_t a1)
{
  sub_1DDCB4920();
  uint64_t v2 = (void (*)(uint64_t))MEMORY[0x1E4F27990];
  sub_1DDC6BCC4(&qword_1EBE9E400, MEMORY[0x1E4F27990]);
  uint64_t v3 = sub_1DDCB4B00();
  return sub_1DDC6BADC(a1, v3, MEMORY[0x1E4F27990], (unint64_t *)&unk_1EBE9E408, v2, MEMORY[0x1E4F279B0]);
}

unint64_t sub_1DDC6BADC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), unint64_t *a4, void (*a5)(uint64_t), uint64_t a6)
{
  uint64_t v24 = a5;
  uint64_t v25 = a6;
  v23 = a4;
  v21[1] = a1;
  uint64_t v8 = a3(0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v11 = (char *)v21 - v10;
  uint64_t v22 = v6;
  uint64_t v12 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v13 = a2 & ~v12;
  v21[0] = v6 + 64;
  if ((*(void *)(v6 + 64 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    uint64_t v14 = ~v12;
    id v17 = *(void (**)(char *, unint64_t, uint64_t))(v9 + 16);
    uint64_t v16 = v9 + 16;
    uint64_t v15 = v17;
    uint64_t v18 = *(void *)(v16 + 56);
    do
    {
      v15(v11, *(void *)(v22 + 48) + v18 * v13, v8);
      sub_1DDC6BCC4(v23, v24);
      char v19 = sub_1DDCB4B20();
      (*(void (**)(char *, uint64_t))(v16 - 8))(v11, v8);
      if (v19) {
        break;
      }
      unint64_t v13 = (v13 + 1) & v14;
    }
    while (((*(void *)(v21[0] + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) != 0);
  }
  return v13;
}

uint64_t sub_1DDC6BC7C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1DDC6BCC4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1DDC6D1CC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1DDC6D2FC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1DDC6D2A0((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x1E4FBB9B0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1DDC6D2A0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1DDC6D2A0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1DDC6D2FC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1DDCB4D20();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1DDC6FB90(a5, a6);
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
  uint64_t v8 = sub_1DDCB4DD0();
  if (!v8)
  {
    sub_1DDCB4E50();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1DDCB4EA0();
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void sub_1DDC6DCB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

void sub_1DDC6E5D0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1DDC6E6FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1DDC6F68C(uint64_t a1, unint64_t a2)
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
      uint64_t v3 = sub_1DDC6FA2C(v2, 0);
      if (v2 < 0) {
        break;
      }
      uint64_t v4 = v3;
      uint64_t v5 = sub_1DDCB4DB0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_1DDCB4E50();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1DDCB4BA0();
      if (!v2) {
        return MEMORY[0x1E4FBC860];
      }
    }
    sub_1DDCB4EA0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_1DDCB4E50();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC860];
  }
  return result;
}

size_t sub_1DDC6F804(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE9E580);
  uint64_t v3 = *(void *)(sub_1DDCB4A40() - 8);
  uint64_t v4 = *(void *)(v3 + 72);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  char v6 = (void *)swift_allocObject();
  size_t result = _swift_stdlib_malloc_size(v6);
  if (v4)
  {
    if (result - v5 != 0x8000000000000000 || v4 != -1)
    {
      v6[2] = v1;
      v6[3] = 2 * ((uint64_t)(result - v5) / v4);
      uint64_t v9 = sub_1DDC706EC(&v10, (uint64_t)v6 + v5, v1, a1);
      swift_bridgeObjectRetain();
      sub_1DDC70ADC();
      if (v9 == v1) {
        return (size_t)v6;
      }
      __break(1u);
      return MEMORY[0x1E4FBC860];
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

unint64_t sub_1DDC6F958(uint64_t a1)
{
  sub_1DDCB4A40();
  uint64_t v2 = (void (*)(uint64_t))MEMORY[0x1E4FBCEA8];
  sub_1DDC6BCC4((unint64_t *)&unk_1EBE9E420, MEMORY[0x1E4FBCEA8]);
  uint64_t v3 = sub_1DDCB4B00();
  return sub_1DDC6BADC(a1, v3, MEMORY[0x1E4FBCEA8], (unint64_t *)&unk_1EBE9E430, v2, MEMORY[0x1E4FBCEC0]);
}

void *sub_1DDC6FA2C(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE9E590);
  uint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_1DDC6FA94(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE9E588);
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
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  unint64_t v13 = v10 + 32;
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

uint64_t sub_1DDC6FB90(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1DDC6F68C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1DDCA0D80(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1DDCA0D80(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1DDC6FC28(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1DDCB4A40();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x1F4188790](v4);
  v130 = (char *)&v125 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x1F4188790](v6);
  v143 = (char *)&v125 - v9;
  uint64_t v10 = MEMORY[0x1F4188790](v8);
  v139 = (char *)&v125 - v11;
  MEMORY[0x1F4188790](v10);
  v138 = (char *)&v125 - v12;
  uint64_t v13 = a1[1];
  uint64_t result = sub_1DDCB4EF0();
  if (result >= v13)
  {
    if (v13 < 0) {
      goto LABEL_140;
    }
    if (v13) {
      return sub_1DDCABEC4(0, v13, 1, a1);
    }
    return result;
  }
  if (v13 >= 0) {
    uint64_t v15 = v13;
  }
  else {
    uint64_t v15 = v13 + 1;
  }
  if (v13 < -1) {
    goto LABEL_148;
  }
  uint64_t v127 = result;
  uint64_t v133 = v5;
  if (v13 < 2)
  {
    char v19 = (char *)MEMORY[0x1E4FBC860];
    unint64_t v132 = MEMORY[0x1E4FBC860]
         + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    uint64_t v126 = MEMORY[0x1E4FBC860];
    if (v13 != 1)
    {
      unint64_t v21 = *(void *)(MEMORY[0x1E4FBC860] + 16);
LABEL_106:
      if (v21 >= 2)
      {
        v117 = (char *)*a1;
        do
        {
          unint64_t v118 = v21 - 2;
          if (v21 < 2) {
            goto LABEL_135;
          }
          if (!v117) {
            goto LABEL_147;
          }
          v119 = v19;
          v120 = v19 + 32;
          uint64_t v121 = *(void *)&v19[16 * v118 + 32];
          uint64_t v122 = *(void *)&v19[16 * v21 + 24];
          sub_1DDCAC188((unint64_t)&v117[*(void *)(v133 + 72) * v121], (unint64_t)&v117[*(void *)(v133 + 72) * *(void *)&v120[16 * v21 - 16]], (unint64_t)&v117[*(void *)(v133 + 72) * v122], v132);
          if (v2) {
            break;
          }
          if (v122 < v121) {
            goto LABEL_136;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v119 = sub_1DDCAC83C((uint64_t)v119);
          }
          if (v118 >= *((void *)v119 + 2)) {
            goto LABEL_137;
          }
          v123 = &v119[16 * v118 + 32];
          *(void *)v123 = v121;
          *((void *)v123 + 1) = v122;
          unint64_t v124 = *((void *)v119 + 2);
          if (v21 > v124) {
            goto LABEL_138;
          }
          char v19 = v119;
          memmove(&v119[16 * v21 + 16], &v119[16 * v21 + 32], 16 * (v124 - v21));
          *((void *)v119 + 2) = v124 - 1;
          unint64_t v21 = v124 - 1;
        }
        while (v124 > 2);
      }
LABEL_117:
      swift_bridgeObjectRelease();
      *(void *)(v126 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v5 = v133;
  }
  else
  {
    uint64_t v16 = v15 >> 1;
    uint64_t v17 = sub_1DDCB4C00();
    *(void *)(v17 + 16) = v16;
    uint64_t v18 = *(unsigned __int8 *)(v5 + 80);
    uint64_t v126 = v17;
    unint64_t v132 = v17 + ((v18 + 32) & ~v18);
  }
  uint64_t v20 = 0;
  v136 = (void (**)(char *, uint64_t))(v5 + 8);
  uint64_t v137 = v5 + 16;
  v145 = (void (**)(char *, char *, uint64_t))(v5 + 32);
  char v19 = (char *)MEMORY[0x1E4FBC860];
  v141 = a1;
  uint64_t v146 = v4;
  while (1)
  {
    uint64_t v22 = v20 + 1;
    uint64_t v131 = v20;
    if (v20 + 1 >= v13)
    {
      uint64_t v29 = v20;
      goto LABEL_58;
    }
    v134 = (char *)*a1;
    uint64_t v23 = v133;
    uint64_t v144 = *(void *)(v133 + 72);
    uint64_t v24 = v138;
    uint64_t v135 = *(void *)(v133 + 16);
    ((void (*)(char *, char *, uint64_t))v135)(v138, &v134[v144 * v22], v4);
    uint64_t v25 = v139;
    sub_1DDCB49A0();
    int v26 = sub_1DDCB49C0();
    uint64_t v140 = v13;
    id v27 = *(void (**)(char *, uint64_t))(v23 + 8);
    v27(v25, v4);
    uint64_t v28 = v140;
    v27(v24, v4);
    uint64_t v29 = v131;
    uint64_t v142 = v131 + 2;
    if (v131 + 2 < v28)
    {
      unint64_t v30 = &v134[v144 * (v131 + 2)];
      while (1)
      {
        unint64_t v31 = v138;
        uint64_t v32 = v146;
        ((void (*)(char *, char *, uint64_t))v135)(v138, v30, v146);
        uint64_t v33 = v139;
        sub_1DDCB49A0();
        int v34 = sub_1DDCB49C0();
        v27(v33, v32);
        v27(v31, v32);
        if ((v26 ^ v34)) {
          break;
        }
        v30 += v144;
        ++v142;
        uint64_t v28 = v140;
        if (v140 == v142)
        {
          uint64_t v142 = v140;
          uint64_t v29 = v131;
          goto LABEL_24;
        }
      }
      uint64_t v29 = v131;
      uint64_t v28 = v140;
    }
LABEL_24:
    a1 = v141;
    uint64_t v4 = v146;
    if ((v26 & 1) == 0) {
      break;
    }
    uint64_t v22 = v142;
    if (v142 < v29) {
      goto LABEL_141;
    }
    if (v29 >= v142) {
      goto LABEL_38;
    }
    v125 = v19;
    uint64_t v35 = 0;
    uint64_t v36 = v29;
    uint64_t v37 = v144;
    uint64_t v38 = v144 * (v142 - 1);
    uint64_t v39 = v142 * v144;
    uint64_t v40 = v36;
    uint64_t v41 = v36 * v144;
    do
    {
      if (v40 != v22 + v35 - 1)
      {
        if (!v134) {
          goto LABEL_146;
        }
        uint64_t v129 = v2;
        unint64_t v43 = &v134[v41];
        uint64_t v44 = &v134[v38];
        v45 = v134;
        int v46 = *v145;
        (*v145)(v130, &v134[v41], v146);
        if (v41 < v38 || v43 >= &v45[v39])
        {
          uint64_t v42 = v146;
          swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          uint64_t v42 = v146;
          if (v41 != v38) {
            swift_arrayInitWithTakeBackToFront();
          }
        }
        v46(v44, v130, v42);
        uint64_t v2 = v129;
        uint64_t v22 = v142;
        uint64_t v37 = v144;
      }
      ++v40;
      --v35;
      v38 -= v37;
      v39 -= v37;
      v41 += v37;
    }
    while (v40 < v22 + v35);
    uint64_t v28 = v140;
    a1 = v141;
    char v19 = v125;
    uint64_t v4 = v146;
    uint64_t v29 = v131;
    if (v22 < v140) {
      goto LABEL_39;
    }
LABEL_58:
    if (v22 < v29) {
      goto LABEL_134;
    }
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v142 = v22;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      char v19 = sub_1DDC6FA94(0, *((void *)v19 + 2) + 1, 1, v19);
    }
    unint64_t v66 = *((void *)v19 + 2);
    unint64_t v65 = *((void *)v19 + 3);
    unint64_t v21 = v66 + 1;
    if (v66 >= v65 >> 1) {
      char v19 = sub_1DDC6FA94((char *)(v65 > 1), v66 + 1, 1, v19);
    }
    *((void *)v19 + 2) = v21;
    v67 = v19 + 32;
    v68 = &v19[16 * v66 + 32];
    uint64_t v69 = v142;
    *(void *)v68 = v29;
    *((void *)v68 + 1) = v69;
    if (v66)
    {
      while (1)
      {
        unint64_t v70 = v21 - 1;
        if (v21 >= 4)
        {
          v75 = &v67[16 * v21];
          uint64_t v76 = *((void *)v75 - 8);
          uint64_t v77 = *((void *)v75 - 7);
          BOOL v81 = __OFSUB__(v77, v76);
          uint64_t v78 = v77 - v76;
          if (v81) {
            goto LABEL_123;
          }
          uint64_t v80 = *((void *)v75 - 6);
          uint64_t v79 = *((void *)v75 - 5);
          BOOL v81 = __OFSUB__(v79, v80);
          uint64_t v73 = v79 - v80;
          char v74 = v81;
          if (v81) {
            goto LABEL_124;
          }
          unint64_t v82 = v21 - 2;
          v83 = &v67[16 * v21 - 32];
          uint64_t v85 = *(void *)v83;
          uint64_t v84 = *((void *)v83 + 1);
          BOOL v81 = __OFSUB__(v84, v85);
          uint64_t v86 = v84 - v85;
          if (v81) {
            goto LABEL_126;
          }
          BOOL v81 = __OFADD__(v73, v86);
          uint64_t v87 = v73 + v86;
          if (v81) {
            goto LABEL_129;
          }
          if (v87 >= v78)
          {
            v105 = &v67[16 * v70];
            uint64_t v107 = *(void *)v105;
            uint64_t v106 = *((void *)v105 + 1);
            BOOL v81 = __OFSUB__(v106, v107);
            uint64_t v108 = v106 - v107;
            if (v81) {
              goto LABEL_133;
            }
            BOOL v98 = v73 < v108;
            goto LABEL_95;
          }
        }
        else
        {
          if (v21 != 3)
          {
            uint64_t v99 = *((void *)v19 + 4);
            uint64_t v100 = *((void *)v19 + 5);
            BOOL v81 = __OFSUB__(v100, v99);
            uint64_t v92 = v100 - v99;
            char v93 = v81;
            goto LABEL_89;
          }
          uint64_t v72 = *((void *)v19 + 4);
          uint64_t v71 = *((void *)v19 + 5);
          BOOL v81 = __OFSUB__(v71, v72);
          uint64_t v73 = v71 - v72;
          char v74 = v81;
        }
        if (v74) {
          goto LABEL_125;
        }
        unint64_t v82 = v21 - 2;
        v88 = &v67[16 * v21 - 32];
        uint64_t v90 = *(void *)v88;
        uint64_t v89 = *((void *)v88 + 1);
        BOOL v91 = __OFSUB__(v89, v90);
        uint64_t v92 = v89 - v90;
        char v93 = v91;
        if (v91) {
          goto LABEL_128;
        }
        v94 = &v67[16 * v70];
        uint64_t v96 = *(void *)v94;
        uint64_t v95 = *((void *)v94 + 1);
        BOOL v81 = __OFSUB__(v95, v96);
        uint64_t v97 = v95 - v96;
        if (v81) {
          goto LABEL_131;
        }
        if (__OFADD__(v92, v97)) {
          goto LABEL_132;
        }
        if (v92 + v97 >= v73)
        {
          BOOL v98 = v73 < v97;
LABEL_95:
          if (v98) {
            unint64_t v70 = v82;
          }
          goto LABEL_97;
        }
LABEL_89:
        if (v93) {
          goto LABEL_127;
        }
        v101 = &v67[16 * v70];
        uint64_t v103 = *(void *)v101;
        uint64_t v102 = *((void *)v101 + 1);
        BOOL v81 = __OFSUB__(v102, v103);
        uint64_t v104 = v102 - v103;
        if (v81) {
          goto LABEL_130;
        }
        if (v104 < v92) {
          goto LABEL_15;
        }
LABEL_97:
        unint64_t v109 = v70 - 1;
        if (v70 - 1 >= v21)
        {
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
LABEL_142:
          __break(1u);
          goto LABEL_143;
        }
        uint64_t v110 = *a1;
        if (!*a1) {
          goto LABEL_145;
        }
        v111 = v19;
        v112 = &v67[16 * v109];
        uint64_t v113 = *(void *)v112;
        v114 = &v67[16 * v70];
        uint64_t v115 = *((void *)v114 + 1);
        sub_1DDCAC188(v110 + *(void *)(v133 + 72) * *(void *)v112, v110 + *(void *)(v133 + 72) * *(void *)v114, v110 + *(void *)(v133 + 72) * v115, v132);
        if (v2) {
          goto LABEL_117;
        }
        if (v115 < v113) {
          goto LABEL_120;
        }
        if (v70 > *((void *)v111 + 2)) {
          goto LABEL_121;
        }
        *(void *)v112 = v113;
        *(void *)&v67[16 * v109 + 8] = v115;
        unint64_t v116 = *((void *)v111 + 2);
        if (v70 >= v116) {
          goto LABEL_122;
        }
        char v19 = v111;
        unint64_t v21 = v116 - 1;
        memmove(&v67[16 * v70], v114 + 16, 16 * (v116 - 1 - v70));
        *((void *)v111 + 2) = v116 - 1;
        a1 = v141;
        uint64_t v4 = v146;
        if (v116 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v21 = 1;
LABEL_15:
    uint64_t v13 = a1[1];
    uint64_t v20 = v142;
    if (v142 >= v13) {
      goto LABEL_106;
    }
  }
  uint64_t v22 = v142;
LABEL_38:
  if (v22 >= v28) {
    goto LABEL_58;
  }
LABEL_39:
  if (__OFSUB__(v22, v29)) {
    goto LABEL_139;
  }
  if (v22 - v29 >= v127) {
    goto LABEL_58;
  }
  if (__OFADD__(v29, v127)) {
    goto LABEL_142;
  }
  if (v29 + v127 >= v28) {
    uint64_t v47 = v28;
  }
  else {
    uint64_t v47 = v29 + v127;
  }
  if (v47 >= v29)
  {
    if (v22 != v47)
    {
      v125 = v19;
      uint64_t v128 = v47;
      uint64_t v129 = v2;
      uint64_t v48 = *(void *)(v133 + 72);
      v134 = *(char **)(v133 + 16);
      uint64_t v135 = v48;
      uint64_t v140 = v48 * (v22 - 1);
      uint64_t v49 = v22 * v48;
      do
      {
        uint64_t v51 = 0;
        uint64_t v142 = v22;
        while (1)
        {
          uint64_t v52 = v49;
          uint64_t v53 = v49 + v51 + *a1;
          uint64_t v54 = a1;
          unint64_t v55 = v138;
          ((void (*)(char *, uint64_t, uint64_t))v134)(v138, v53, v4);
          uint64_t v56 = v139;
          sub_1DDCB49A0();
          LODWORD(v144) = sub_1DDCB49C0();
          v57 = *v136;
          v58 = v56;
          uint64_t v4 = v146;
          (*v136)(v58, v146);
          v57(v55, v4);
          if ((v144 & 1) == 0) {
            break;
          }
          uint64_t v59 = *v54;
          if (!*v54) {
            goto LABEL_144;
          }
          uint64_t v49 = v52;
          v60 = (char *)(v59 + v52 + v51);
          v61 = (char *)(v140 + v51 + v59);
          v62 = *v145;
          uint64_t v63 = v146;
          (*v145)(v143, v60, v146);
          uint64_t v4 = v63;
          swift_arrayInitWithTakeFrontToBack();
          v62(v61, v143, v63);
          ++v29;
          v51 -= v135;
          a1 = v141;
          uint64_t v50 = v142;
          if (v142 == v29) {
            goto LABEL_49;
          }
        }
        uint64_t v50 = v142;
        a1 = v54;
        uint64_t v49 = v52;
LABEL_49:
        uint64_t v22 = v50 + 1;
        v140 += v135;
        v49 += v135;
        uint64_t v29 = v131;
      }
      while (v22 != v128);
      uint64_t v22 = v128;
      uint64_t v2 = v129;
      char v19 = v125;
    }
    goto LABEL_58;
  }
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
  uint64_t result = sub_1DDCB4E50();
  __break(1u);
  return result;
}

id sub_1DDC706CC(id result)
{
  if (result != (id)1) {
    return result;
  }
  return result;
}

void sub_1DDC706DC(id a1)
{
  if (a1 != (id)1) {
}
  }

uint64_t sub_1DDC706EC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_1DDCB4A40();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x1F4188790](v8);
  uint64_t v42 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x1F4188790](v10);
  uint64_t v41 = (char *)&v32 - v13;
  uint64_t v43 = a4;
  uint64_t v16 = *(void *)(a4 + 64);
  uint64_t v15 = a4 + 64;
  uint64_t v14 = v16;
  uint64_t v37 = v15;
  uint64_t v17 = -1 << *(unsigned char *)(v15 - 32);
  if (-v17 < 64) {
    uint64_t v18 = ~(-1 << -(char)v17);
  }
  else {
    uint64_t v18 = -1;
  }
  unint64_t v19 = v18 & v14;
  if (!a2)
  {
    int64_t v20 = 0;
    a3 = 0;
LABEL_38:
    uint64_t v31 = v37;
    *a1 = v43;
    a1[1] = v31;
    a1[2] = ~v17;
    a1[3] = v20;
    a1[4] = v19;
    return a3;
  }
  if (!a3)
  {
    int64_t v20 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v34 = -1 << *(unsigned char *)(v15 - 32);
  uint64_t v35 = a1;
  int64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v38 = v9 + 32;
  uint64_t v39 = v9 + 16;
  int64_t v36 = (unint64_t)(63 - v17) >> 6;
  int64_t v33 = v36 - 1;
  uint64_t v40 = a3;
  uint64_t v22 = v41;
  if (!v19) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v23 = __clz(__rbit64(v19));
  v19 &= v19 - 1;
  unint64_t v24 = v23 | (v20 << 6);
  while (1)
  {
    ++v21;
    uint64_t v28 = v42;
    uint64_t v29 = *(void *)(v9 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v9 + 16))(v42, *(void *)(v43 + 48) + v29 * v24, v8);
    unint64_t v30 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
    v30(v22, v28, v8);
    uint64_t result = ((uint64_t (*)(uint64_t, char *, uint64_t))v30)(a2, v22, v8);
    a3 = v40;
    if (v21 == v40) {
      goto LABEL_37;
    }
    a2 += v29;
    if (v19) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v25 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v25 >= v36) {
      goto LABEL_32;
    }
    unint64_t v26 = *(void *)(v37 + 8 * v25);
    if (!v26) {
      break;
    }
LABEL_18:
    unint64_t v19 = (v26 - 1) & v26;
    unint64_t v24 = __clz(__rbit64(v26)) + (v25 << 6);
    int64_t v20 = v25;
  }
  v20 += 2;
  if (v25 + 1 >= v36)
  {
    unint64_t v19 = 0;
    int64_t v20 = v25;
    goto LABEL_36;
  }
  unint64_t v26 = *(void *)(v37 + 8 * v20);
  if (v26) {
    goto LABEL_14;
  }
  int64_t v27 = v25 + 2;
  if (v25 + 2 >= v36) {
    goto LABEL_32;
  }
  unint64_t v26 = *(void *)(v37 + 8 * v27);
  if (v26) {
    goto LABEL_17;
  }
  int64_t v20 = v25 + 3;
  if (v25 + 3 >= v36)
  {
    unint64_t v19 = 0;
    int64_t v20 = v25 + 2;
    goto LABEL_36;
  }
  unint64_t v26 = *(void *)(v37 + 8 * v20);
  if (v26)
  {
LABEL_14:
    int64_t v25 = v20;
    goto LABEL_18;
  }
  int64_t v27 = v25 + 4;
  if (v25 + 4 >= v36)
  {
LABEL_32:
    unint64_t v19 = 0;
LABEL_36:
    a3 = v21;
LABEL_37:
    uint64_t v17 = v34;
    a1 = v35;
    goto LABEL_38;
  }
  unint64_t v26 = *(void *)(v37 + 8 * v27);
  if (v26)
  {
LABEL_17:
    int64_t v25 = v27;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v25 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v25 >= v36)
    {
      unint64_t v19 = 0;
      int64_t v20 = v33;
      goto LABEL_36;
    }
    unint64_t v26 = *(void *)(v37 + 8 * v25);
    ++v27;
    if (v26) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1DDC70A34(void **a1)
{
  uint64_t v2 = *(void *)(sub_1DDCB4A40() - 8);
  unint64_t v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v3 = (void *)sub_1DDCAC850(v3);
  }
  uint64_t v4 = v3[2];
  v6[0] = (char *)v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  uint64_t result = sub_1DDC6FC28(v6);
  *a1 = v3;
  return result;
}

uint64_t sub_1DDC70ADC()
{
  return swift_release();
}

uint64_t sub_1DDC70AE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1DDCB4A40();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x1F4188790](v4);
  v45 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v35 - v8;
  uint64_t v10 = (uint64_t *)(a1 + OBJC_IVAR___QLThumbnailExtensionMonitor_identitiesByType);
  swift_beginAccess();
  uint64_t v42 = v10;
  uint64_t v11 = *v10;
  swift_bridgeObjectRetain_n();
  uint64_t v12 = (void *)sub_1DDC6F804(v11);
  swift_bridgeObjectRelease();
  int v46 = v12;
  sub_1DDC70A34(&v46);
  swift_bridgeObjectRelease();
  uint64_t v13 = v46;
  id v14 = (id)v46[2];
  if (!v14)
  {
LABEL_25:
    swift_release();
    return (uint64_t)v14;
  }
  unint64_t v15 = 0;
  uint64_t v16 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v17 = (void (**)(char *, uint64_t))(v5 + 8);
  uint64_t v37 = a2;
  uint64_t v38 = (void (**)(char *, uint64_t))(v5 + 8);
  id v35 = v14;
  uint64_t v36 = v5;
  uint64_t v43 = v5 + 16;
  uint64_t v44 = (char *)v46 + ((v16 + 32) & ~v16);
  uint64_t v40 = v9;
  uint64_t v41 = v4;
  uint64_t v39 = v46;
  while (1)
  {
    if (v15 >= v13[2]) {
      goto LABEL_29;
    }
    uint64_t v18 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
    v18(v9, &v44[*(void *)(v5 + 72) * v15], v4);
    if (sub_1DDCB4A20()) {
      break;
    }
    (*v17)(v9, v4);
LABEL_4:
    if ((id)++v15 == v14)
    {
      swift_release();
      return 0;
    }
  }
  uint64_t v19 = (uint64_t)v45;
  v18(v45, v9, v4);
  uint64_t v20 = *v42;
  uint64_t v21 = *(void *)(*v42 + 16);
  swift_bridgeObjectRetain();
  if (v21)
  {
    unint64_t v22 = sub_1DDC6F958(v19);
    unint64_t v23 = MEMORY[0x1E4FBC860];
    if (v24)
    {
      unint64_t v23 = *(void *)(*(void *)(v20 + 56) + 8 * v22);
      swift_bridgeObjectRetain();
    }
  }
  else
  {
    unint64_t v23 = MEMORY[0x1E4FBC860];
  }
  swift_bridgeObjectRelease();
  if (!(v23 >> 62))
  {
    uint64_t v25 = *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v25) {
      goto LABEL_13;
    }
    goto LABEL_21;
  }
  swift_bridgeObjectRetain_n();
  uint64_t v25 = sub_1DDCB4E60();
  swift_bridgeObjectRelease();
  if (!v25)
  {
LABEL_21:
    swift_bridgeObjectRelease_n();
    uint64_t v17 = v38;
    uint64_t v31 = *v38;
    uint64_t v4 = v41;
    (*v38)(v45, v41);
    uint64_t v9 = v40;
    v31(v40, v4);
    uint64_t v5 = v36;
    uint64_t v13 = v39;
    id v14 = v35;
    goto LABEL_4;
  }
LABEL_13:
  uint64_t v26 = 4;
  while (1)
  {
    uint64_t v27 = v26 - 4;
    if ((v23 & 0xC000000000000001) == 0) {
      break;
    }
    id v28 = (id)MEMORY[0x1E01C4FF0](v26 - 4, v23);
    uint64_t v29 = v26 - 3;
    if (__OFADD__(v27, 1)) {
      goto LABEL_28;
    }
LABEL_19:
    id v14 = v28;
    id v30 = objc_msgSend(v14, sel_bundleIdentifier);
    sub_1DDCB4B60();

    LOBYTE(v30) = sub_1DDCA2864();
    swift_bridgeObjectRelease();
    if (v30)
    {
      swift_bridgeObjectRelease_n();
      uint64_t v32 = *v38;
      uint64_t v33 = v41;
      (*v38)(v45, v41);
      v32(v40, v33);
      goto LABEL_25;
    }

    ++v26;
    if (v29 == v25) {
      goto LABEL_21;
    }
  }
  id v28 = *(id *)(v23 + 8 * v26);
  uint64_t v29 = v26 - 3;
  if (!__OFADD__(v27, 1)) {
    goto LABEL_19;
  }
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

void *sub_1DDC70F10(uint64_t a1, uint64_t a2, void (*a3)(char *__return_ptr, id *))
{
  uint64_t v4 = (void **)(a1 + 16);
  unint64_t v3 = *(void **)(a1 + 16);
  uint64_t v5 = v3;
  if (v3 == (void *)1)
  {
    if (a2)
    {
      unint64_t v7 = swift_bridgeObjectRetain();
      uint64_t v5 = sub_1DDCA61E8(v7, a3);
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v5 = 0;
    }
    swift_beginAccess();
    uint64_t v8 = *v4;
    *uint64_t v4 = v5;
    id v9 = v5;
    sub_1DDC706DC(v8);
  }
  sub_1DDC706CC(v3);
  return v5;
}

void *sub_1DDC70FC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (void **)(a1 + 16);
  unint64_t v3 = *(void **)(a1 + 16);
  uint64_t v5 = v3;
  if (v3 == (void *)1)
  {
    uint64_t v5 = (void *)sub_1DDC70AE4(a2, a3);
    swift_beginAccess();
    uint64_t v6 = *v4;
    *uint64_t v4 = v5;
    id v7 = v5;
    sub_1DDC706DC(v6);
  }
  sub_1DDC706CC(v3);
  return v5;
}

uint64_t sub_1DDC71044(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1DDCB4A40();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x1F4188790](v4);
  uint64_t v41 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  id v9 = (char *)&v40 - v8;
  uint64_t v10 = sub_1DDCB4AC0();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (uint64_t *)((char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  id v14 = *(void **)(v2 + OBJC_IVAR___QLThumbnailExtensionMonitor_queue);
  *uint64_t v13 = v14;
  (*(void (**)(void *, void, uint64_t))(v11 + 104))(v13, *MEMORY[0x1E4FBCBF0], v10);
  id v15 = v14;
  LOBYTE(v14) = sub_1DDCB4AD0();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v11 + 8))(v13, v10);
  if (v14)
  {
    uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v17(v9, a1, v4);
    uint64_t v18 = type metadata accessor for ThumbnailExtensionMonitor.Predicate(0);
    uint64_t v42 = *(void *)(a1 + *(int *)(v18 + 24));
    uint64_t v19 = (uint64_t *)(v2 + OBJC_IVAR___QLThumbnailExtensionMonitor_identitiesByType);
    swift_beginAccess();
    uint64_t v20 = *v19;
    uint64_t v21 = *(void *)(v20 + 16);
    uint64_t v44 = v4;
    uint64_t v40 = v2;
    if (v21)
    {
      swift_bridgeObjectRetain();
      unint64_t v22 = sub_1DDC6F958((uint64_t)v9);
      if (v23)
      {
        uint64_t v24 = *(void *)(*(void *)(v20 + 56) + 8 * v22);
        swift_bridgeObjectRetain();
      }
      else
      {
        uint64_t v24 = 0;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v24 = 0;
    }
    uint64_t v25 = swift_allocObject();
    *(void *)(v25 + 16) = 1;
    uint64_t v45 = swift_allocObject();
    *(void *)(v45 + 16) = 1;
    uint64_t v43 = swift_allocObject();
    *(void *)(v43 + 16) = 1;
    if (*(unsigned char *)(a1 + *(int *)(v18 + 20)) == 1)
    {
      if (v24)
      {
        unint64_t v26 = swift_bridgeObjectRetain();
        uint64_t v27 = sub_1DDCA6300(v26);
        swift_bridgeObjectRelease();
        if (v27) {
          goto LABEL_19;
        }
      }
    }
    if (v42 != 1)
    {
      uint64_t v33 = self;
      uint64_t v34 = (void *)sub_1DDCB49B0();
      LODWORD(v33) = objc_msgSend(v33, sel_contentTypeIsIWorkType_, v34, v40);

      if (v33)
      {
        if (v24)
        {
          unint64_t v35 = swift_bridgeObjectRetain();
          uint64_t v27 = sub_1DDCA64B0(v35);
          swift_bridgeObjectRelease();
          if (v27)
          {
LABEL_19:
            swift_bridgeObjectRelease();
            uint64_t v32 = v44;
LABEL_31:
            (*(void (**)(char *, uint64_t))(v5 + 8))(v9, v32);
            swift_release();
            swift_release();
            swift_release();
            return (uint64_t)v27;
          }
        }
      }
    }
    id v28 = self;
    uint64_t v29 = (void *)sub_1DDCB49B0();
    unsigned int v30 = objc_msgSend(v28, sel_contentTypeIsInternallyClaimed_, v29);

    if (v30)
    {
      uint64_t v27 = sub_1DDC70F10(v25, v24, (void (*)(char *__return_ptr, id *))sub_1DDCA615C);
      swift_bridgeObjectRelease();
      uint64_t v31 = (uint64_t)v41;
      uint64_t v32 = v44;
      v17(v41, (uint64_t)v9, v44);
      if (!v27) {
        uint64_t v27 = sub_1DDC70FC0(v43, v40, v31);
      }
      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v31, v32);
      goto LABEL_31;
    }
    uint64_t v36 = v45;
    if (v42 == 1)
    {
      uint64_t v27 = sub_1DDC70F10(v25, v24, (void (*)(char *__return_ptr, id *))sub_1DDCA615C);
      if (!v27)
      {
        swift_bridgeObjectRelease();
LABEL_30:
        uint64_t v27 = sub_1DDC70FC0(v43, v40, (uint64_t)v9);
        uint64_t v32 = v44;
        goto LABEL_31;
      }
      goto LABEL_27;
    }
    uint64_t v37 = (void *)sub_1DDCB49B0();
    unsigned int v38 = objc_msgSend(v28, sel_externalGeneratorPreferredForType_, v37);

    if (v38 && (uint64_t v39 = sub_1DDC70F10(v36, v24, (void (*)(char *__return_ptr, id *))sub_1DDCA666C)) != 0)
    {
      uint64_t v27 = v39;
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v27 = sub_1DDC70F10(v25, v24, (void (*)(char *__return_ptr, id *))sub_1DDCA615C);
      if (v27)
      {
LABEL_27:
        swift_bridgeObjectRelease();
        goto LABEL_28;
      }
      uint64_t v27 = sub_1DDC70F10(v36, v24, (void (*)(char *__return_ptr, id *))sub_1DDCA666C);
      swift_bridgeObjectRelease();
      if (!v27) {
        goto LABEL_30;
      }
    }
LABEL_28:
    uint64_t v32 = v44;
    goto LABEL_31;
  }
  __break(1u);
  return result;
}

uint64_t sub_1DDC716E0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_1DDC719AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DDC7643C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_1DDC766A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t traceSQL(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = MEMORY[0x1E4F3A768];
  uint64_t v5 = *(NSObject **)(MEMORY[0x1E4F3A768] + 8);
  if (a2)
  {
    if (!v5)
    {
      QLTInitLogging();
      uint64_t v5 = *(NSObject **)(v4 + 8);
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      traceSQL_cold_2(v5, a2, a3);
    }
  }
  else
  {
    if (!v5)
    {
      QLTInitLogging();
      uint64_t v5 = *(NSObject **)(v4 + 8);
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      traceSQL_cold_1();
    }
  }
  return 0;
}

void sub_1DDC787B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_3_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void OUTLINED_FUNCTION_5(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_9(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_1DDC7C1D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_1DDC7C6FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 184), 8);
  _Block_object_dispose((const void *)(v34 - 152), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

uint64_t UIKitLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = UIKitLibraryCore_frameworkLibrary;
  uint64_t v5 = UIKitLibraryCore_frameworkLibrary;
  if (!UIKitLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E6D0C8D8;
    long long v7 = *(_OWORD *)&off_1E6D0C8E8;
    v3[3] = _sl_dlopen();
    UIKitLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_1DDC7CED4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __UIKitLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  UIKitLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t UIKitLibrary()
{
  uint64_t v0 = UIKitLibraryCore();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id getUIImageClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getUIImageClass_softClass;
  uint64_t v7 = getUIImageClass_softClass;
  if (!getUIImageClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getUIImageClass_block_invoke;
    v3[3] = &unk_1E6D0C928;
    v3[4] = &v4;
    __getUIImageClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DDC7D0A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getUIImageClass_block_invoke(uint64_t a1)
{
  UIKitLibrary();
  Class result = objc_getClass("UIImage");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getUIImageClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getUIImageClass_block_invoke_cold_1();
    return (Class)getUIGraphicsBeginImageContextWithOptionsSymbolLoc(v3);
  }
  return result;
}

uint64_t getUIGraphicsBeginImageContextWithOptionsSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getUIGraphicsBeginImageContextWithOptionsSymbolLoc_ptr;
  uint64_t v6 = getUIGraphicsBeginImageContextWithOptionsSymbolLoc_ptr;
  if (!getUIGraphicsBeginImageContextWithOptionsSymbolLoc_ptr)
  {
    id v1 = (void *)UIKitLibrary();
    v4[3] = (uint64_t)dlsym(v1, "UIGraphicsBeginImageContextWithOptions");
    getUIGraphicsBeginImageContextWithOptionsSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1DDC7D1EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getUIGraphicsBeginImageContextWithOptionsSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)UIKitLibrary();
  Class result = dlsym(v2, "UIGraphicsBeginImageContextWithOptions");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getUIGraphicsBeginImageContextWithOptionsSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t _UIGraphicsBeginImageContextWithOptions(uint64_t a1, double a2, double a3, double a4)
{
  UIGraphicsBeginImageContextWithOptionsSymbolLoc = (uint64_t (*)(uint64_t, __n128, __n128, __n128))getUIGraphicsBeginImageContextWithOptionsSymbolLoc();
  if (UIGraphicsBeginImageContextWithOptionsSymbolLoc)
  {
    v9.n128_f64[0] = a2;
    v10.n128_f64[0] = a3;
    v11.n128_f64[0] = a4;
    return UIGraphicsBeginImageContextWithOptionsSymbolLoc(a1, v9, v10, v11);
  }
  else
  {
    uint64_t v13 = _UIGraphicsBeginImageContextWithOptions_cold_1();
    return getUIGraphicsGetCurrentContextSymbolLoc(v13);
  }
}

uint64_t getUIGraphicsGetCurrentContextSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getUIGraphicsGetCurrentContextSymbolLoc_ptr;
  uint64_t v6 = getUIGraphicsGetCurrentContextSymbolLoc_ptr;
  if (!getUIGraphicsGetCurrentContextSymbolLoc_ptr)
  {
    id v1 = (void *)UIKitLibrary();
    v4[3] = (uint64_t)dlsym(v1, "UIGraphicsGetCurrentContext");
    getUIGraphicsGetCurrentContextSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1DDC7D398(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getUIGraphicsGetCurrentContextSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)UIKitLibrary();
  Class result = dlsym(v2, "UIGraphicsGetCurrentContext");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getUIGraphicsGetCurrentContextSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t _UIGraphicsGetCurrentContext()
{
  CurrentContextSymbolLoc = (uint64_t (*)(void))getUIGraphicsGetCurrentContextSymbolLoc();
  if (CurrentContextSymbolLoc)
  {
    return CurrentContextSymbolLoc();
  }
  else
  {
    uint64_t v2 = _UIGraphicsBeginImageContextWithOptions_cold_1();
    return getUIGraphicsEndImageContextSymbolLoc(v2);
  }
}

uint64_t getUIGraphicsEndImageContextSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getUIGraphicsEndImageContextSymbolLoc_ptr;
  uint64_t v6 = getUIGraphicsEndImageContextSymbolLoc_ptr;
  if (!getUIGraphicsEndImageContextSymbolLoc_ptr)
  {
    id v1 = (void *)UIKitLibrary();
    v4[3] = (uint64_t)dlsym(v1, "UIGraphicsEndImageContext");
    getUIGraphicsEndImageContextSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1DDC7D508(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getUIGraphicsEndImageContextSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)UIKitLibrary();
  Class result = dlsym(v2, "UIGraphicsEndImageContext");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getUIGraphicsEndImageContextSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t _UIGraphicsEndImageContext()
{
  UIGraphicsEndImageContextSymbolLoc = (uint64_t (*)(void))getUIGraphicsEndImageContextSymbolLoc();
  if (UIGraphicsEndImageContextSymbolLoc)
  {
    return UIGraphicsEndImageContextSymbolLoc();
  }
  else
  {
    uint64_t v2 = _UIGraphicsBeginImageContextWithOptions_cold_1();
    return getUIGraphicsPushContextSymbolLoc(v2);
  }
}

uint64_t getUIGraphicsPushContextSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getUIGraphicsPushContextSymbolLoc_ptr;
  uint64_t v6 = getUIGraphicsPushContextSymbolLoc_ptr;
  if (!getUIGraphicsPushContextSymbolLoc_ptr)
  {
    id v1 = (void *)UIKitLibrary();
    v4[3] = (uint64_t)dlsym(v1, "UIGraphicsPushContext");
    getUIGraphicsPushContextSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1DDC7D678(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getUIGraphicsPushContextSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)UIKitLibrary();
  Class result = dlsym(v2, "UIGraphicsPushContext");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getUIGraphicsPushContextSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t _UIGraphicsPushContext(uint64_t a1)
{
  UIGraphicsPushContextSymbolLoc = (uint64_t (*)(uint64_t))getUIGraphicsPushContextSymbolLoc();
  if (UIGraphicsPushContextSymbolLoc)
  {
    return UIGraphicsPushContextSymbolLoc(a1);
  }
  else
  {
    uint64_t v4 = _UIGraphicsBeginImageContextWithOptions_cold_1();
    return getUIGraphicsPopContextSymbolLoc(v4);
  }
}

uint64_t getUIGraphicsPopContextSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getUIGraphicsPopContextSymbolLoc_ptr;
  uint64_t v6 = getUIGraphicsPopContextSymbolLoc_ptr;
  if (!getUIGraphicsPopContextSymbolLoc_ptr)
  {
    id v1 = (void *)UIKitLibrary();
    v4[3] = (uint64_t)dlsym(v1, "UIGraphicsPopContext");
    getUIGraphicsPopContextSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1DDC7D7FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getUIGraphicsPopContextSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)UIKitLibrary();
  Class result = dlsym(v2, "UIGraphicsPopContext");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getUIGraphicsPopContextSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

QLExtensionHostContextThumbnailOperation *_UIGraphicsPopContext()
{
  UIGraphicsPopContextSymbolLoc = (uint64_t (*)(void))getUIGraphicsPopContextSymbolLoc();
  if (UIGraphicsPopContextSymbolLoc)
  {
    return (QLExtensionHostContextThumbnailOperation *)UIGraphicsPopContextSymbolLoc();
  }
  else
  {
    uint64_t v2 = (QLExtensionHostContextThumbnailOperation *)_UIGraphicsBeginImageContextWithOptions_cold_1();
    return [(QLExtensionHostContextThumbnailOperation *)v2 initWithAppex:v4 request:v5 completionHandler:v6];
  }
}

void sub_1DDC7DD54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DDC7E644(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id a32)
{
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

BOOL file_exists(char *a1, unsigned char *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (v7 == a1) {
    unint64_t v4 = 0;
  }
  else {
    unint64_t v4 = __strlcpy_chk();
  }
  if (*a2)
  {
    if (strcmp(a1, "/")) {
      unint64_t v4 = __strlcat_chk();
    }
    if (v4 > 0x3FF) {
      return 0;
    }
    unint64_t v4 = __strlcat_chk();
  }
  if (v4 >= 0x400) {
    return 0;
  }
  memset(&v6, 0, sizeof(v6));
  return stat(v7, &v6) == 0;
}

BOOL DiskStoreKeyEqual(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2 && a1[1] == a2[1];
}

uint64_t DiskStoreKeyHash(int *a1)
{
  return *a1;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_1DDC80DD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DDC81218(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
}

void sub_1DDC82D40(_Unwind_Exception *a1)
{
}

id cancelledError(void *a1)
{
  id v1 = (void *)MEMORY[0x1E4F3A6C8];
  uint64_t v2 = [a1 request];
  SEL v3 = [v1 errorWithCode:5 request:v2 additionalUserInfo:0];

  return v3;
}

void sub_1DDC83914(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

void sub_1DDC83C14(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

id generationFailedErrorWithUnderlyingError(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = objc_opt_new();
  __n128 v9 = v8;
  if (v6) {
    [v8 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
  }
  if (v7) {
    [v9 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F28228]];
  }
  uint64_t v10 = (void *)MEMORY[0x1E4F3A6C8];
  __n128 v11 = [v5 request];
  uint64_t v12 = [v10 errorWithCode:0 request:v11 additionalUserInfo:v9];

  return v12;
}

void sub_1DDC83E84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DDC85CE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id generationFailedError(void *a1)
{
  id v1 = (void *)MEMORY[0x1E4F3A6C8];
  uint64_t v2 = [a1 request];
  SEL v3 = [v1 errorWithCode:0 request:v2 additionalUserInfo:0];

  return v3;
}

double CGCeiling(double a1)
{
  return ceil(a1);
}

double CGFloor(double a1)
{
  return floor(a1);
}

void sub_1DDC8ABFC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DDC8AD8C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

unsigned char *OUTLINED_FUNCTION_3_2(unsigned char *result, unsigned char *a2)
{
  *Class result = 0;
  *a2 = 0;
  return result;
}

void OUTLINED_FUNCTION_2_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_3_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return [v0 length];
}

void OUTLINED_FUNCTION_9_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_12(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x34u);
}

id QLGetValidCacheLocation()
{
  if (overrideCacheLocation) {
    [(id)overrideCacheLocation stringByAppendingPathComponent:*MEMORY[0x1E4F3A760]];
  }
  else {
  uint64_t v0 = QLTGetDefaultCacheLocation();
  }
  return v0;
}

void sub_1DDC8E0AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DDC8E360(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void OUTLINED_FUNCTION_1_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_5_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

uint64_t OUTLINED_FUNCTION_8_2()
{
  return [v1 bufferPointedToByBlobInfo:v0];
}

void OUTLINED_FUNCTION_12_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1DDC8F0A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DDC8F2F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DDC8F7D0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DDC8FBFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ql_create_tables_initial(void *a1, void *a2)
{
  id v3 = a1;
  if ([v3 execute:@"CREATE TABLE thumbnails( docid integer not null, vol_uuid blob not null, last_hit_date integer not null, last_seen_path text not null, PRIMARY KEY (docid, vol_uuid))"])
  {
    uint64_t v4 = [v3 setUserVersion:1];
    if (!a2) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if (!a2) {
      goto LABEL_7;
    }
  }
  if ((v4 & 1) == 0)
  {
    *a2 = [v3 lastError];
  }
LABEL_7:

  return v4;
}

uint64_t ql_add_cache_delete(void *a1, void *a2)
{
  id v3 = a1;
  if ([v3 execute:@"ALTER TABLE thumbnails ADD COLUMN size integer"]
    && [v3 execute:@"CREATE INDEX thumbnail_last_hit_date ON thumbnails(last_hit_date)"])
  {
    uint64_t v4 = [v3 setUserVersion:2];
    if (!a2) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if (!a2) {
      goto LABEL_8;
    }
  }
  if ((v4 & 1) == 0)
  {
    *a2 = [v3 lastError];
  }
LABEL_8:

  return v4;
}

uint64_t ql_add_index_on_volume_uuid(void *a1, void *a2)
{
  id v3 = a1;
  if ([v3 execute:@"CREATE INDEX thumbnail_vol_uuid ON thumbnails(vol_uuid)"])
  {
    uint64_t v4 = [v3 setUserVersion:3];
    if (!a2) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if (!a2) {
      goto LABEL_7;
    }
  }
  if ((v4 & 1) == 0)
  {
    *a2 = [v3 lastError];
  }
LABEL_7:

  return v4;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void sub_1DDC9028C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DDC907D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DDC90C6C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DDC91150(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DDC915CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DDC9182C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DDC91AA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DDC91DEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_5_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_1DDC9387C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DDC93A34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

uint64_t QLCacheInDebugMode()
{
  if (QLCacheInDebugMode_onceToken != -1) {
    dispatch_once(&QLCacheInDebugMode_onceToken, &__block_literal_global_7);
  }
  return QLCacheInDebugMode__cacheIsInDebugMode;
}

uint64_t __QLCacheInDebugMode_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  QLCacheInDebugMode__cacheIsInDebugMode = result;
  return result;
}

void sub_1DDC95F24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void sub_1DDC9614C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DDC968C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DDC96E08(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1DDC97100(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DDC97238(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1DDC99F54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id location)
{
  objc_destroyWeak(v31);
  objc_destroyWeak(v30);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DDC9AA50(_Unwind_Exception *a1)
{
}

void sub_1DDC9AF6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, os_activity_scope_state_s state)
{
}

uint64_t sub_1DDC9B69C(uint64_t a1)
{
  uint64_t v2 = sub_1DDC9C120(&qword_1EAB91C00, type metadata accessor for QLThumbnailError);
  return MEMORY[0x1F40E6E20](a1, v2);
}

uint64_t sub_1DDC9B708(uint64_t a1)
{
  uint64_t v2 = sub_1DDC9C120(&qword_1EAB91C00, type metadata accessor for QLThumbnailError);
  return MEMORY[0x1F40E6E10](a1, v2);
}

uint64_t sub_1DDC9B778(uint64_t a1)
{
  uint64_t v2 = sub_1DDC9C120(&qword_1EAB91C38, type metadata accessor for QLThumbnailError);
  return MEMORY[0x1F40E4480](a1, v2);
}

id sub_1DDC9B7E4()
{
  return *v0;
}

uint64_t sub_1DDC9B7EC@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_1DDC9B7F4(uint64_t a1, uint64_t a2)
{
  return sub_1DDC9B8EC(a1, a2, MEMORY[0x1E4FBB198]);
}

uint64_t sub_1DDC9B80C()
{
  sub_1DDCB4B60();
  sub_1DDCB4B70();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DDC9B860()
{
  sub_1DDCB4B60();
  sub_1DDCB4F70();
  sub_1DDCB4B70();
  uint64_t v0 = sub_1DDCB4FA0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1DDC9B8D4(uint64_t a1, uint64_t a2)
{
  return sub_1DDC9B8EC(a1, a2, MEMORY[0x1E4F27EB8]);
}

uint64_t sub_1DDC9B8EC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_1DDCB4B60();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1DDC9B930(uint64_t a1, id *a2)
{
  uint64_t result = sub_1DDCB4B40();
  *a2 = 0;
  return result;
}

uint64_t sub_1DDC9B9A8(uint64_t a1, id *a2)
{
  char v3 = sub_1DDCB4B50();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1DDC9BA28@<X0>(uint64_t *a1@<X8>)
{
  sub_1DDCB4B60();
  uint64_t v2 = sub_1DDCB4B30();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

BOOL sub_1DDC9BA6C(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1DDC9BA80()
{
  return sub_1DDCB4FA0();
}

uint64_t sub_1DDC9BAC8()
{
  return sub_1DDCB4F80();
}

uint64_t sub_1DDC9BAF4()
{
  return sub_1DDCB4FA0();
}

uint64_t sub_1DDC9BB38()
{
  return sub_1DDCB4B60();
}

uint64_t sub_1DDC9BB48(uint64_t a1)
{
  uint64_t v2 = sub_1DDC9C120(&qword_1EAB91C38, type metadata accessor for QLThumbnailError);
  return MEMORY[0x1F40E44F0](a1, v2);
}

uint64_t sub_1DDC9BBB4(uint64_t a1)
{
  uint64_t v2 = sub_1DDC9C120(&qword_1EAB91C38, type metadata accessor for QLThumbnailError);
  return MEMORY[0x1F40E44A8](a1, v2);
}

uint64_t sub_1DDC9BC20(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_1DDC9C120(&qword_1EAB91C38, type metadata accessor for QLThumbnailError);
  id v5 = a1;
  return MEMORY[0x1F40E4498](v5, a2, v4);
}

uint64_t sub_1DDC9BCB0()
{
  id v1 = *v0;
  uint64_t v2 = sub_1DDCB4D00();

  return v2;
}

uint64_t sub_1DDC9BCE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1DDC9C120(&qword_1EAB91C38, type metadata accessor for QLThumbnailError);
  return MEMORY[0x1F40E44D8](a1, a2, v4);
}

uint64_t sub_1DDC9BD64()
{
  return sub_1DDCB4FA0();
}

void *sub_1DDC9BDC4@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_1DDC9BDD4(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_1DDC9BDE0()
{
  uint64_t v0 = sub_1DDCB4B60();
  uint64_t v2 = v1;
  if (v0 == sub_1DDCB4B60() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_1DDCB4F00();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

void sub_1DDC9BE6C(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_1DDC9BE78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1DDC9C120(&qword_1EAB91C38, type metadata accessor for QLThumbnailError);
  return MEMORY[0x1F40E44B8](a1, a2, a3, v6);
}

BOOL sub_1DDC9BEFC(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1DDC9BF10@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_1DDCB4B30();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1DDC9BF58@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1DDCB4B60();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void type metadata accessor for QLThumbnailError(uint64_t a1)
{
}

void type metadata accessor for QLFileThumbnailRequestOptions(uint64_t a1)
{
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

void type metadata accessor for QLExtensionMatchingType(uint64_t a1)
{
}

uint64_t sub_1DDC9BFD4()
{
  return sub_1DDC9C120(&qword_1EAB91BD8, type metadata accessor for QLExtensionMatchingType);
}

uint64_t sub_1DDC9C01C(uint64_t a1)
{
  uint64_t v2 = sub_1DDC9C120(&qword_1EBE9E4E8, type metadata accessor for QLFileThumbnailRequestOptions);
  uint64_t v3 = sub_1DDC9C120(&qword_1EAB91C40, type metadata accessor for QLFileThumbnailRequestOptions);
  uint64_t v4 = MEMORY[0x1E4FBB1B0];
  return MEMORY[0x1F4185450](a1, v2, v3, v4);
}

uint64_t sub_1DDC9C0D8()
{
  return sub_1DDC9C120(&qword_1EAB91BE0, type metadata accessor for QLFileThumbnailRequestOptions);
}

uint64_t sub_1DDC9C120(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1DDC9C168()
{
  return sub_1DDC9C120(&qword_1EAB91BE8, type metadata accessor for QLFileThumbnailRequestOptions);
}

uint64_t sub_1DDC9C1B0()
{
  return sub_1DDC9C120(&qword_1EAB91BF0, type metadata accessor for QLThumbnailError);
}

uint64_t sub_1DDC9C1F8()
{
  return sub_1DDC9C120(&qword_1EAB91BF8, type metadata accessor for QLThumbnailError);
}

uint64_t sub_1DDC9C240()
{
  return sub_1DDC9C120(&qword_1EAB91C00, type metadata accessor for QLThumbnailError);
}

uint64_t sub_1DDC9C288()
{
  return sub_1DDC9C120(&qword_1EAB91C08, type metadata accessor for QLThumbnailError);
}

uint64_t sub_1DDC9C2D0()
{
  return sub_1DDC9C120(&qword_1EAB91C10, type metadata accessor for QLThumbnailError);
}

uint64_t sub_1DDC9C318()
{
  return sub_1DDC9C120(&qword_1EAB91C18, type metadata accessor for Code);
}

void type metadata accessor for Code(uint64_t a1)
{
}

void sub_1DDC9C374(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_1DDC9C3BC()
{
  return sub_1DDC9C120(&qword_1EAB91C20, type metadata accessor for Code);
}

unint64_t sub_1DDC9C408()
{
  unint64_t result = qword_1EAB91C28;
  if (!qword_1EAB91C28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAB91C28);
  }
  return result;
}

uint64_t sub_1DDC9C45C()
{
  return sub_1DDC9C120(&qword_1EAB91C30, type metadata accessor for Code);
}

uint64_t sub_1DDC9C4A4()
{
  return sub_1DDC9C120(&qword_1EAB91C38, type metadata accessor for QLThumbnailError);
}

uint64_t sub_1DDC9C4EC()
{
  return sub_1DDC9C120(&qword_1EBE9E4F0, type metadata accessor for QLFileThumbnailRequestOptions);
}

uint64_t sub_1DDC9C540()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE9E580);
  sub_1DDCB4A40();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1DDCB9B40;
  sub_1DDCB4A10();
  sub_1DDCB49E0();
  sub_1DDCB4A30();
  sub_1DDCB49F0();
  sub_1DDCB4A00();
  uint64_t v1 = sub_1DDCA0ED0(v0);
  swift_setDeallocating();
  swift_arrayDestroy();
  uint64_t result = swift_deallocClassInstance();
  qword_1EAB92AE0 = v1;
  return result;
}

uint64_t sub_1DDC9C670()
{
  uint64_t v0 = sub_1DDCB4A80();
  __swift_allocate_value_buffer(v0, qword_1EBE9E9E0);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EBE9E9E0);
  return sub_1DDCB4A70();
}

uint64_t sub_1DDC9C6F0()
{
  uint64_t v0 = sub_1DDCB4CA0();
  MEMORY[0x1F4188790](v0);
  uint64_t v1 = sub_1DDCB4AB0();
  MEMORY[0x1F4188790](v1 - 8);
  uint64_t v2 = sub_1DDCB4CB0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  char v5 = (char *)v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DDCA2014(0, (unint64_t *)&unk_1EBE9E4D0);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E4FBCC68], v2);
  sub_1DDCB4AA0();
  v7[1] = MEMORY[0x1E4FBC860];
  sub_1DDC6BC7C((unint64_t *)&unk_1EBE9E4C0, MEMORY[0x1E4FBCC10]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE9E4B0);
  sub_1DDCA1EF8();
  sub_1DDCB4D40();
  uint64_t result = sub_1DDCB4CE0();
  qword_1EAB92AE8 = result;
  return result;
}

BOOL sub_1DDC9C928(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1DDC9C93C()
{
  return sub_1DDCB4FA0();
}

uint64_t sub_1DDC9C984()
{
  return sub_1DDCB4F80();
}

uint64_t sub_1DDC9C9B0()
{
  return sub_1DDCB4FA0();
}

uint64_t sub_1DDC9C9F4()
{
  uint64_t v0 = qword_1EAB91C50;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_1DDC9CA34(uint64_t a1)
{
  unint64_t v2 = sub_1DDCA18FC();
  return MEMORY[0x1F40E6E20](a1, v2);
}

uint64_t sub_1DDC9CA70(uint64_t a1)
{
  unint64_t v2 = sub_1DDCA18FC();
  return MEMORY[0x1F40E6E10](a1, v2);
}

uint64_t sub_1DDC9CAB0(uint64_t a1, uint64_t a2, int a3, char a4, uint64_t a5)
{
  *(void *)(v6 + 280) = a5;
  *(void *)(v6 + 288) = v5;
  *(unsigned char *)(v6 + 540) = a4;
  *(_DWORD *)(v6 + 536) = a3;
  *(void *)(v6 + 264) = a1;
  *(void *)(v6 + 272) = a2;
  uint64_t v7 = sub_1DDCB4A40();
  *(void *)(v6 + 296) = v7;
  *(void *)(v6 + 304) = *(void *)(v7 - 8);
  *(void *)(v6 + 312) = swift_task_alloc();
  *(void *)(v6 + 320) = swift_task_alloc();
  *(void *)(v6 + 328) = swift_task_alloc();
  *(void *)(v6 + 336) = swift_task_alloc();
  *(void *)(v6 + 344) = swift_task_alloc();
  *(void *)(v6 + 352) = swift_task_alloc();
  *(void *)(v6 + 360) = swift_task_alloc();
  *(void *)(v6 + 368) = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1DDC9CBD4, 0, 0);
}

uint64_t sub_1DDC9CBD4()
{
  uint64_t v39 = v0;
  uint64_t v1 = *(void **)(v0 + 272);
  id v2 = objc_msgSend(*(id *)(v0 + 264), sel_request);
  *(void *)(v0 + 216) = 3;
  *(void *)(v0 + 376) = v2;
  id v3 = objc_msgSend(v1, sel_contentType);
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v6 = *(void *)(v0 + 360);
    uint64_t v5 = *(void *)(v0 + 368);
    uint64_t v7 = *(void *)(v0 + 296);
    uint64_t v8 = *(void *)(v0 + 304);
    sub_1DDCB49D0();

    uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32);
    *(void *)(v0 + 384) = v9;
    *(void *)(v0 + 392) = (v8 + 32) & 0xFFFFFFFFFFFFLL | 0x48D8000000000000;
    v9(v5, v6, v7);
    if (qword_1EBE9E680 != -1) {
      swift_once();
    }
    uint64_t v10 = *(void *)(v0 + 368);
    swift_beginAccess();
    id v11 = (id)qword_1EBE9E3F0;
    uint64_t v12 = (unsigned char *)sub_1DDCA4AC0(v10, (char)objc_msgSend(v2, sel_shouldUseRestrictedExtension), 3);
    *(void *)(v0 + 400) = v12;

    if (v12)
    {
      if ((v12[OBJC_IVAR___QLThumbnailExtension_externalResourcesAccessAllowed] & 1) == 0) {
        objc_msgSend(*(id *)(v0 + 272), sel_setParentDirectoryWrapper_, 0);
      }
      if (qword_1EBE9E480 != -1) {
        swift_once();
      }
      uint64_t v13 = *(void **)(v0 + 272);
      uint64_t v14 = sub_1DDCB4A80();
      *(void *)(v0 + 408) = __swift_project_value_buffer(v14, (uint64_t)qword_1EBE9E9E0);
      id v15 = v2;
      id v16 = v13;
      uint64_t v17 = v12;
      id v18 = v15;
      id v19 = v16;
      uint64_t v20 = v17;
      uint64_t v21 = sub_1DDCB4A60();
      os_log_type_t v22 = sub_1DDCB4C70();
      BOOL v23 = os_log_type_enabled(v21, v22);
      uint64_t v24 = *(void **)(v0 + 272);
      if (v23)
      {
        os_log_type_t type = v22;
        uint64_t v25 = swift_slowAlloc();
        unint64_t v35 = (void *)swift_slowAlloc();
        uint64_t v37 = swift_slowAlloc();
        v38[0] = v37;
        *(_DWORD *)uint64_t v25 = 138413058;
        *(void *)(v0 + 232) = v24;
        id v26 = v24;
        sub_1DDCB4D10();
        *unint64_t v35 = v24;

        *(_WORD *)(v25 + 12) = 2080;
        objc_msgSend(v18, sel_size);
        uint64_t v27 = sub_1DDCB4CF0();
        *(void *)(v0 + 240) = sub_1DDC6D1CC(v27, v28, v38);
        sub_1DDCB4D10();

        swift_bridgeObjectRelease();
        *(_WORD *)(v25 + 22) = 2048;
        id v29 = objc_msgSend(v18, sel_badgeType);

        *(void *)(v0 + 248) = v29;
        sub_1DDCB4D10();

        *(_WORD *)(v25 + 32) = 2112;
        *(void *)(v0 + 256) = v20;
        unsigned int v30 = v20;
        sub_1DDCB4D10();
        v35[1] = v12;

        _os_log_impl(&dword_1DDC5E000, v21, type, "Generating thumbnail for %@ (size %s) with badge type %lu with extension %@", (uint8_t *)v25, 0x2Au);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBE9E510);
        swift_arrayDestroy();
        MEMORY[0x1E01C6640](v35, -1, -1);
        swift_arrayDestroy();
        MEMORY[0x1E01C6640](v37, -1, -1);
        MEMORY[0x1E01C6640](v25, -1, -1);
      }
      else
      {
      }
      uint64_t v34 = *(void *)&v20[OBJC_IVAR___QLThumbnailExtension_queueLock];
      *(void *)(swift_task_alloc() + 16) = v20;
      os_unfair_lock_lock((os_unfair_lock_t)(v34 + 24));
      sub_1DDCA0300((void **)(v34 + 16), v38);
      *(void *)(v0 + 416) = 0;
      os_unfair_lock_unlock((os_unfair_lock_t)(v34 + 24));
      *(void *)(v0 + 424) = v38[0];
      swift_task_dealloc();
      return MEMORY[0x1F4188298](sub_1DDC9D1D4, 0, 0);
    }
    (*(void (**)(void, void))(*(void *)(v0 + 304) + 8))(*(void *)(v0 + 368), *(void *)(v0 + 296));
  }
  sub_1DDC9EFA4();
  swift_allocError();
  *uint64_t v31 = 0;
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v32 = *(uint64_t (**)(void))(v0 + 8);
  return v32();
}

uint64_t sub_1DDC9D1D4()
{
  uint64_t v1 = *(void **)(v0 + 424);
  uint64_t v2 = *(void *)(v0 + 400);
  id v3 = *(void **)(v0 + 376);
  uint64_t v5 = *(void *)(v0 + 280);
  uint64_t v4 = *(void *)(v0 + 288);
  char v6 = *(unsigned char *)(v0 + 540);
  int v7 = *(_DWORD *)(v0 + 536);
  uint64_t v8 = *(void **)(v0 + 272);
  *(void *)(v0 + 80) = v0;
  *(void *)(v0 + 120) = v0 + 224;
  *(void *)(v0 + 88) = sub_1DDC9D2D0;
  uint64_t v9 = swift_continuation_init();
  sub_1DDC9EFF8(v9, v7, v6, v3, (uint64_t *)(v0 + 216), v8, v5, v2, v4, v1);
  return MEMORY[0x1F41881E8](v0 + 80);
}

uint64_t sub_1DDC9D2D0()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 112);
  *(void *)(*v0 + 432) = v2;
  if (v2)
  {
    swift_willThrow();
    id v3 = sub_1DDC9E1A8;
  }
  else
  {
    *(void *)(v1 + 440) = *(void *)(v1 + 224);
    id v3 = sub_1DDC9D3F4;
  }
  return MEMORY[0x1F4188298](v3, 0, 0);
}

uint64_t sub_1DDC9D3F4()
{
  uint64_t v4 = *(void **)(v0 + 440);
  uint64_t v5 = *(void *)(v0 + 288);
  char v6 = *(void **)(v5 + OBJC_IVAR___QLThumbnailExtensionGenerator_operation);
  *(void *)(v5 + OBJC_IVAR___QLThumbnailExtensionGenerator_operation) = 0;

  id v7 = objc_msgSend(v4, sel_metadata);
  *(void *)(v0 + 448) = v7;
  id v8 = objc_msgSend(v4, sel_bitmapImages);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v0 + 416);
    uint64_t v11 = *(void **)(v0 + 376);
    uint64_t v12 = *(void **)(v0 + 288);
    sub_1DDCA2014(0, &qword_1EBE9E620);
    unint64_t v13 = sub_1DDCB4BD0();

    id v14 = v11;
    id v15 = v12;
    uint64_t v16 = sub_1DDCA11E8(v13, v14);
    if (v10)
    {
      uint64_t v17 = *(void **)(v0 + 424);
      id v18 = *(void **)(v0 + 400);
      id v19 = *(void **)(v0 + 376);
      uint64_t v140 = *(void *)(v0 + 368);
      uint64_t v20 = *(void *)(v0 + 296);
      uint64_t v21 = *(void *)(v0 + 304);
      os_log_type_t v22 = *(void **)(v0 + 288);

      (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v140, v20);
      swift_bridgeObjectRelease();
LABEL_62:
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v121 = *(uint64_t (**)(void))(v0 + 8);
      return v121();
    }
    unint64_t v1 = v16;
    uint64_t v31 = *(void **)(v0 + 376);
    uint64_t v32 = *(void **)(v0 + 288);
    swift_bridgeObjectRelease();
  }
  else
  {
    id v23 = objc_msgSend(*(id *)(v0 + 440), sel_ioSurface);
    if (!v23)
    {
      id v58 = objc_msgSend(*(id *)(v0 + 440), sel_item);
      *(void *)(v0 + 456) = v58;
      if (!v58)
      {
        uint64_t v96 = *(void **)(v0 + 440);
        uint64_t v97 = v7;
        BOOL v98 = *(void **)(v0 + 424);
        uint64_t v99 = *(void **)(v0 + 400);
        uint64_t v100 = *(void **)(v0 + 376);
        uint64_t v144 = *(void *)(v0 + 368);
        uint64_t v101 = *(void *)(v0 + 296);
        uint64_t v102 = *(void *)(v0 + 304);
        sub_1DDC9EFA4();
        swift_allocError();
        *uint64_t v103 = 2;
        swift_willThrow();

        (*(void (**)(uint64_t, uint64_t))(v102 + 8))(v144, v101);
        goto LABEL_62;
      }
      uint64_t v59 = v58;
      unint64_t v132 = v7;
      id v60 = objc_msgSend(v58, sel_contentType);
      if (!v60)
      {
LABEL_61:
        v114 = *(void **)(v0 + 440);
        uint64_t v115 = *(void **)(v0 + 424);
        unint64_t v116 = *(void **)(v0 + 400);
        v117 = *(void **)(v0 + 376);
        uint64_t v145 = *(void *)(v0 + 368);
        uint64_t v119 = *(void *)(v0 + 296);
        uint64_t v118 = *(void *)(v0 + 304);
        sub_1DDC9EFA4();
        swift_allocError();
        unsigned char *v120 = 2;
        swift_willThrow();

        (*(void (**)(uint64_t, uint64_t))(v118 + 8))(v145, v119);
        goto LABEL_62;
      }
      v61 = v60;
      uint64_t v131 = v59;
      v62 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 384);
      uint64_t v64 = *(void *)(v0 + 344);
      uint64_t v63 = *(void *)(v0 + 352);
      uint64_t v65 = *(void *)(v0 + 296);
      sub_1DDCB49D0();

      v62(v63, v64, v65);
      if (qword_1EAB91BB0 != -1) {
        swift_once();
      }
      unint64_t v66 = *(void **)(v0 + 304);
      uint64_t v35 = qword_1EAB92AE0;
      uint64_t v135 = (void (*)(uint64_t, unint64_t, uint64_t))v66[2];
      v135(*(void *)(v0 + 336), *(void *)(v0 + 352), *(void *)(v0 + 296));
      uint64_t v133 = v35 + 56;
      uint64_t v67 = -1;
      uint64_t v68 = -1 << *(unsigned char *)(v35 + 32);
      if (-v68 < 64) {
        uint64_t v67 = ~(-1 << -(char)v68);
      }
      unint64_t v69 = v67 & *(void *)(v35 + 56);
      int64_t v134 = (unint64_t)(63 - v68) >> 6;
      unint64_t v137 = (unint64_t)(v66 + 1);
      uint64_t v141 = v35;
      swift_bridgeObjectRetain_n();
      int64_t v70 = 0;
      do
      {
        if (v69)
        {
          unint64_t v71 = __clz(__rbit64(v69));
          v69 &= v69 - 1;
          unint64_t v72 = v71 | (v70 << 6);
        }
        else
        {
          int64_t v77 = v70 + 1;
          if (__OFADD__(v70, 1))
          {
LABEL_72:
            __break(1u);
            goto LABEL_73;
          }
          if (v77 >= v134) {
            goto LABEL_60;
          }
          unint64_t v78 = *(void *)(v133 + 8 * v77);
          ++v70;
          if (!v78)
          {
            int64_t v70 = v77 + 1;
            if (v77 + 1 >= v134) {
              goto LABEL_60;
            }
            unint64_t v78 = *(void *)(v133 + 8 * v70);
            if (!v78)
            {
              int64_t v70 = v77 + 2;
              if (v77 + 2 >= v134) {
                goto LABEL_60;
              }
              unint64_t v78 = *(void *)(v133 + 8 * v70);
              if (!v78)
              {
                int64_t v70 = v77 + 3;
                if (v77 + 3 >= v134) {
                  goto LABEL_60;
                }
                unint64_t v78 = *(void *)(v133 + 8 * v70);
                if (!v78)
                {
                  int64_t v70 = v77 + 4;
                  if (v77 + 4 >= v134) {
                    goto LABEL_60;
                  }
                  unint64_t v78 = *(void *)(v133 + 8 * v70);
                  if (!v78)
                  {
                    int64_t v79 = v77 + 5;
                    if (v79 >= v134)
                    {
LABEL_60:
                      uint64_t v111 = *(void *)(v0 + 352);
                      uint64_t v112 = *(void *)(v0 + 296);
                      uint64_t v113 = *(void (**)(uint64_t, uint64_t))v137;
                      (*(void (**)(void, uint64_t))v137)(*(void *)(v0 + 336), v112);
                      swift_release();
                      swift_bridgeObjectRelease();
                      v113(v111, v112);
                      uint64_t v59 = v131;
                      goto LABEL_61;
                    }
                    unint64_t v78 = *(void *)(v133 + 8 * v79);
                    if (!v78)
                    {
                      while (1)
                      {
                        int64_t v70 = v79 + 1;
                        if (__OFADD__(v79, 1)) {
                          break;
                        }
                        if (v70 >= v134) {
                          goto LABEL_60;
                        }
                        unint64_t v78 = *(void *)(v133 + 8 * v70);
                        ++v79;
                        if (v78) {
                          goto LABEL_48;
                        }
                      }
                      __break(1u);
LABEL_76:
                      swift_once();
LABEL_57:
                      objc_msgSend((id)v35, sel_setGenerationQueue_, qword_1EAB92AE8, v131);
                      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE9E598);
                      uint64_t v109 = swift_allocObject();
                      *(void *)(v0 + 488) = v109;
                      *(_OWORD *)(v109 + 16) = xmmword_1DDCB9B50;
                      *(void *)(v0 + 16) = v0;
                      *(void *)(v0 + 56) = v0 + 208;
                      *(void *)(v0 + 24) = sub_1DDC9E29C;
                      uint64_t v110 = swift_continuation_init();
                      *(void *)(v0 + 144) = MEMORY[0x1E4F143A8];
                      *(void *)(v0 + 152) = 0x40000000;
                      *(void *)(v0 + 160) = sub_1DDC9F704;
                      *(void *)(v0 + 168) = &block_descriptor;
                      *(void *)(v0 + 176) = v110;
                      objc_msgSend((id)v35, sel_generateThumbnailWithCompletionHandler_, v0 + 144);
                      return MEMORY[0x1F41881E8](v0 + 16);
                    }
                    int64_t v70 = v79;
                  }
                }
              }
            }
          }
LABEL_48:
          unint64_t v69 = (v78 - 1) & v78;
          unint64_t v72 = __clz(__rbit64(v78)) + (v70 << 6);
        }
        unint64_t v1 = *(void *)(v0 + 384);
        uint64_t v73 = *(void *)(v0 + 328);
        uint64_t v74 = *(void *)(v0 + 320);
        uint64_t v75 = *(void *)(v0 + 296);
        v135(v73, *(void *)(v141 + 48) + v66[9] * v72, v75);
        ((void (*)(uint64_t, uint64_t, uint64_t))v1)(v74, v73, v75);
        uint64_t v35 = sub_1DDCB4A20();
        uint64_t v76 = (void (*)(uint64_t, uint64_t))v66[1];
        *(void *)(v0 + 464) = v76;
        *(void *)(v0 + 472) = v137 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
        v76(v74, v75);
      }
      while ((v35 & 1) == 0);
      uint64_t v104 = *(void *)(v0 + 312);
      uint64_t v105 = *(void *)(v0 + 296);
      v76(*(void *)(v0 + 336), v105);
      swift_release();
      swift_bridgeObjectRelease();
      sub_1DDCB49E0();
      char v106 = sub_1DDCB4A20();
      v76(v104, v105);
      if (v106)
      {
        uint64_t v107 = *(unsigned __int8 *)(v0 + 540);
        id v108 = objc_msgSend(objc_allocWithZone((Class)QLTGeneratorThumbnailRequest), sel_initWithRequest_generationHandler_, *(void *)(v0 + 376), 0);
        uint64_t v35 = (uint64_t)objc_msgSend(objc_allocWithZone((Class)QLPreviewThumbnailGenerator), sel_initWithGeneratorRequest_lowQuality_thumbnailItem_, v108, v107, v131);
        *(void *)(v0 + 480) = v35;

        if (qword_1EAB91BB8 != -1) {
          goto LABEL_76;
        }
        goto LABEL_57;
      }
      uint64_t v122 = *(void **)(v0 + 440);
      id v123 = objc_msgSend(v122, sel_iconFlavor);
      id v124 = objc_msgSend(v122, sel_metadata);
      id v125 = objc_msgSend(v124, sel_additionalProperties);

      if (v125)
      {
        uint64_t v126 = sub_1DDCB4AF0();
      }
      else
      {
        uint64_t v126 = sub_1DDC9F7C4(MEMORY[0x1E4FBC860]);
      }
      uint64_t v127 = sub_1DDC9F8F0(v126);
      *(void *)(v0 + 504) = v127;
      swift_bridgeObjectRelease();
      uint64_t v128 = (void *)swift_task_alloc();
      *(void *)(v0 + 512) = v128;
      *uint64_t v128 = v0;
      v128[1] = sub_1DDC9E7DC;
      uint64_t v129 = *(unsigned __int8 *)(v0 + 540);
      uint64_t v130 = *(void *)(v0 + 264);
      return sub_1DDC9CAB0(v130, v131, v123, v129, v127);
    }
    uint64_t v24 = v23;
    uint64_t v25 = *(void **)(v0 + 376);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE9E598);
    unint64_t v1 = swift_allocObject();
    *(_OWORD *)(v1 + 16) = xmmword_1DDCB9B50;
    objc_msgSend(v25, sel_scale);
    double v27 = v26;
    uint64_t v28 = CGImageCreateFromIOSurface();
    if (!v28)
    {
      uint64_t v80 = *(void **)(v0 + 440);
      BOOL v81 = v7;
      unint64_t v82 = *(void **)(v0 + 400);
      v83 = *(void **)(v0 + 376);
      uint64_t v142 = *(void *)(v0 + 368);
      uint64_t v84 = *(void *)(v0 + 304);
      v136 = *(void **)(v0 + 424);
      uint64_t v138 = *(void *)(v0 + 296);
      sub_1DDC9EFA4();
      swift_allocError();
      *uint64_t v85 = 2;
      swift_willThrow();
      *(void *)(v1 + 16) = 0;

      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v84 + 8))(v142, v138);
      goto LABEL_62;
    }
    id v29 = (void *)v28;
    id v30 = objc_msgSend(self, sel_imageWithCGImage_scale_orientation_, v28, 1, v27);

    *(void *)(v1 + 32) = v30;
    sub_1DDCB4BE0();
  }
  uint64_t v33 = *(void **)(v0 + 376);
  objc_msgSend(v33, sel_minimumDimension);
  double v2 = v34;
  uint64_t v35 = (uint64_t)&selRef_contentVersion;
  objc_msgSend(v33, sel_scale);
  double v3 = v36;
  if (v1 >> 62)
  {
LABEL_73:
    swift_bridgeObjectRetain_n();
    uint64_t v37 = sub_1DDCB4E60();
    if (v37)
    {
LABEL_10:
      uint64_t v38 = 0;
      double v39 = v2 * v3;
      while (1)
      {
        if ((v1 & 0xC000000000000001) != 0) {
          id v40 = (id)MEMORY[0x1E01C4FF0](v38, v1);
        }
        else {
          id v40 = *(id *)(v1 + 8 * v38 + 32);
        }
        uint64_t v41 = v40;
        uint64_t v42 = v38 + 1;
        if (__OFADD__(v38, 1))
        {
          __break(1u);
          goto LABEL_72;
        }
        objc_msgSend(v40, sel_size);
        double v44 = v43;
        [v41 *(SEL *)(v35 + 3856)];
        if (v39 > v44 * v45) {
          break;
        }
        objc_msgSend(v41, sel_size);
        double v2 = v46;
        [v41 *(SEL *)(v35 + 3856)];
        double v3 = v47;

        if (v39 > v2 * v3) {
          goto LABEL_51;
        }
        ++v38;
        if (v42 == v37) {
          goto LABEL_18;
        }
      }

LABEL_51:
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      uint64_t v86 = sub_1DDCB4A60();
      os_log_type_t v87 = sub_1DDCB4C90();
      if (os_log_type_enabled(v86, v87))
      {
        v88 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v88 = 0;
        _os_log_impl(&dword_1DDC5E000, v86, v87, "Thumbnail generator returned an image smaller than the minimum size, returning no thumbnail", v88, 2u);
        MEMORY[0x1E01C6640](v88, -1, -1);
      }
      uint64_t v90 = *(void **)(v0 + 440);
      uint64_t v89 = *(void **)(v0 + 448);
      BOOL v91 = *(void **)(v0 + 424);
      uint64_t v92 = *(void **)(v0 + 400);
      char v93 = *(void **)(v0 + 376);
      uint64_t v94 = *(void *)(v0 + 304);
      uint64_t v139 = *(void *)(v0 + 296);
      uint64_t v143 = *(void *)(v0 + 368);

      sub_1DDC9EFA4();
      swift_allocError();
      *uint64_t v95 = 2;
      swift_willThrow();

      (*(void (**)(uint64_t, uint64_t))(v94 + 8))(v143, v139);
      goto LABEL_62;
    }
  }
  else
  {
    uint64_t v37 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    if (v37) {
      goto LABEL_10;
    }
  }
LABEL_18:
  uint64_t v48 = *(void **)(v0 + 440);
  uint64_t v49 = *(void **)(v0 + 424);
  uint64_t v50 = *(void **)(v0 + 400);
  uint64_t v51 = *(void *)(v0 + 368);
  uint64_t v52 = *(void **)(v0 + 376);
  uint64_t v53 = *(void *)(v0 + 304);
  uint64_t v54 = *(void *)(v0 + 296);
  swift_bridgeObjectRelease_n();
  (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v51, v54);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v55 = *(uint64_t (**)(unint64_t, uint64_t))(v0 + 8);
  uint64_t v56 = *(void *)(v0 + 448);
  return v55(v1, v56);
}

uint64_t sub_1DDC9E1A8()
{
  unint64_t v1 = *(void **)(v0 + 400);
  uint64_t v2 = *(void *)(v0 + 368);
  double v3 = *(void **)(v0 + 376);
  uint64_t v4 = *(void *)(v0 + 296);
  uint64_t v5 = *(void *)(v0 + 304);

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  char v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_1DDC9E29C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 496) = v1;
  if (v1) {
    uint64_t v2 = sub_1DDC9ED3C;
  }
  else {
    uint64_t v2 = sub_1DDC9E3AC;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1DDC9E3AC()
{
  uint64_t v2 = (void *)v0[60];
  unint64_t v1 = v0[61];
  double v3 = (void (*)(uint64_t, uint64_t))v0[58];
  uint64_t v4 = (void *)v0[57];
  uint64_t v5 = v0[44];
  uint64_t v6 = v0[37];
  *(void *)(v1 + 32) = v0[26];
  unint64_t v46 = v1;
  sub_1DDCB4BE0();

  v3(v5, v6);
  id v7 = (void *)v0[47];
  objc_msgSend(v7, sel_minimumDimension);
  double v9 = v8;
  objc_msgSend(v7, sel_scale);
  double v11 = v10;
  if (!(v46 >> 62))
  {
    uint64_t v12 = *(void *)((v46 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    if (v12) {
      goto LABEL_3;
    }
LABEL_11:
    id v23 = (void *)v0[55];
    uint64_t v24 = (void *)v0[53];
    uint64_t v25 = (void *)v0[50];
    uint64_t v26 = v0[46];
    double v27 = (void *)v0[47];
    uint64_t v28 = v0[38];
    uint64_t v29 = v0[37];
    swift_bridgeObjectRelease_n();
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v26, v29);

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    id v30 = (uint64_t (*)(unint64_t, uint64_t))v0[1];
    uint64_t v31 = v0[56];
    return v30(v46, v31);
  }
LABEL_21:
  swift_bridgeObjectRetain_n();
  uint64_t v12 = sub_1DDCB4E60();
  if (!v12) {
    goto LABEL_11;
  }
LABEL_3:
  uint64_t v13 = 0;
  double v14 = v9 * v11;
  while (1)
  {
    if ((v46 & 0xC000000000000001) != 0) {
      id v15 = (id)MEMORY[0x1E01C4FF0](v13, v46);
    }
    else {
      id v15 = *(id *)(v46 + 8 * v13 + 32);
    }
    uint64_t v16 = v15;
    uint64_t v17 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_21;
    }
    objc_msgSend(v15, sel_size);
    double v19 = v18;
    objc_msgSend(v16, sel_scale);
    if (v14 > v19 * v20) {
      break;
    }
    objc_msgSend(v16, sel_size);
    double v9 = v21;
    objc_msgSend(v16, sel_scale);
    double v11 = v22;

    if (v14 > v9 * v11) {
      goto LABEL_15;
    }
    ++v13;
    if (v17 == v12) {
      goto LABEL_11;
    }
  }

LABEL_15:
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  uint64_t v33 = sub_1DDCB4A60();
  os_log_type_t v34 = sub_1DDCB4C90();
  if (os_log_type_enabled(v33, v34))
  {
    uint64_t v35 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v35 = 0;
    _os_log_impl(&dword_1DDC5E000, v33, v34, "Thumbnail generator returned an image smaller than the minimum size, returning no thumbnail", v35, 2u);
    MEMORY[0x1E01C6640](v35, -1, -1);
  }
  uint64_t v37 = (void *)v0[55];
  double v36 = (void *)v0[56];
  uint64_t v38 = (void *)v0[53];
  double v39 = (void *)v0[50];
  id v40 = (void *)v0[47];
  uint64_t v45 = v0[46];
  uint64_t v41 = v0[37];
  uint64_t v42 = v0[38];

  sub_1DDC9EFA4();
  swift_allocError();
  *double v43 = 2;
  swift_willThrow();

  (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v45, v41);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  double v44 = (uint64_t (*)(void))v0[1];
  return v44();
}

uint64_t sub_1DDC9E7DC(uint64_t a1, void *a2)
{
  uint64_t v6 = *v3;
  *(void *)(*v3 + 520) = v2;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v2)
  {
    id v7 = sub_1DDC9EE88;
  }
  else
  {

    *(void *)(v6 + 528) = a1;
    id v7 = sub_1DDC9E928;
  }
  return MEMORY[0x1F4188298](v7, 0, 0);
}

uint64_t sub_1DDC9E928()
{
  unint64_t v1 = *(void (**)(uint64_t, uint64_t))(v0 + 464);
  uint64_t v2 = *(void *)(v0 + 352);
  uint64_t v3 = *(void *)(v0 + 296);

  v1(v2, v3);
  unint64_t v4 = *(void *)(v0 + 528);
  uint64_t v5 = *(void **)(v0 + 376);
  objc_msgSend(v5, sel_minimumDimension);
  double v7 = v6;
  objc_msgSend(v5, sel_scale);
  double v9 = v8;
  if (!(v4 >> 62))
  {
    uint64_t v10 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    if (v10) {
      goto LABEL_3;
    }
LABEL_11:
    double v21 = *(void **)(v0 + 440);
    double v22 = *(void **)(v0 + 424);
    id v23 = *(void **)(v0 + 400);
    uint64_t v24 = *(void *)(v0 + 368);
    uint64_t v25 = *(void **)(v0 + 376);
    uint64_t v26 = *(void *)(v0 + 304);
    uint64_t v27 = *(void *)(v0 + 296);
    swift_bridgeObjectRelease_n();
    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v24, v27);

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v28 = *(uint64_t (**)(unint64_t, uint64_t))(v0 + 8);
    uint64_t v29 = *(void *)(v0 + 448);
    return v28(v4, v29);
  }
LABEL_21:
  swift_bridgeObjectRetain_n();
  uint64_t v10 = sub_1DDCB4E60();
  if (!v10) {
    goto LABEL_11;
  }
LABEL_3:
  uint64_t v11 = 0;
  double v12 = v7 * v9;
  while (1)
  {
    if ((v4 & 0xC000000000000001) != 0) {
      id v13 = (id)MEMORY[0x1E01C4FF0](v11, v4);
    }
    else {
      id v13 = *(id *)(v4 + 8 * v11 + 32);
    }
    double v14 = v13;
    uint64_t v15 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_21;
    }
    objc_msgSend(v13, sel_size);
    double v17 = v16;
    objc_msgSend(v14, sel_scale);
    if (v12 > v17 * v18) {
      break;
    }
    objc_msgSend(v14, sel_size);
    double v7 = v19;
    objc_msgSend(v14, sel_scale);
    double v9 = v20;

    if (v12 > v7 * v9) {
      goto LABEL_15;
    }
    ++v11;
    if (v15 == v10) {
      goto LABEL_11;
    }
  }

LABEL_15:
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  uint64_t v31 = sub_1DDCB4A60();
  os_log_type_t v32 = sub_1DDCB4C90();
  if (os_log_type_enabled(v31, v32))
  {
    uint64_t v33 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v33 = 0;
    _os_log_impl(&dword_1DDC5E000, v31, v32, "Thumbnail generator returned an image smaller than the minimum size, returning no thumbnail", v33, 2u);
    MEMORY[0x1E01C6640](v33, -1, -1);
  }
  uint64_t v35 = *(void **)(v0 + 440);
  os_log_type_t v34 = *(void **)(v0 + 448);
  double v36 = *(void **)(v0 + 424);
  uint64_t v37 = *(void **)(v0 + 400);
  uint64_t v38 = *(void **)(v0 + 376);
  uint64_t v43 = *(void *)(v0 + 368);
  uint64_t v39 = *(void *)(v0 + 296);
  uint64_t v40 = *(void *)(v0 + 304);

  sub_1DDC9EFA4();
  swift_allocError();
  *uint64_t v41 = 2;
  swift_willThrow();

  (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v43, v39);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v42 = *(uint64_t (**)(void))(v0 + 8);
  return v42();
}

uint64_t sub_1DDC9ED3C()
{
  uint64_t v1 = v0[61];
  uint64_t v2 = (void *)v0[60];
  uint64_t v3 = (void (*)(uint64_t, uint64_t))v0[58];
  uint64_t v5 = (void *)v0[55];
  unint64_t v4 = (void *)v0[56];
  double v6 = (void *)v0[53];
  uint64_t v10 = (void *)v0[50];
  uint64_t v11 = (void *)v0[57];
  uint64_t v14 = v0[46];
  double v12 = (void *)v0[47];
  uint64_t v13 = v0[44];
  uint64_t v7 = v0[37];
  swift_willThrow();
  *(void *)(v1 + 16) = 0;
  swift_release();

  v3(v13, v7);
  v3(v14, v7);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  double v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_1DDC9EE88()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(v0 + 464);
  uint64_t v3 = *(void **)(v0 + 448);
  uint64_t v2 = *(void **)(v0 + 456);
  unint64_t v4 = *(void **)(v0 + 440);
  uint64_t v5 = *(void **)(v0 + 400);
  double v6 = *(void **)(v0 + 376);
  uint64_t v11 = *(void *)(v0 + 368);
  uint64_t v7 = *(void *)(v0 + 352);
  uint64_t v8 = *(void *)(v0 + 296);

  v1(v7, v8);
  v1(v11, v8);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  double v9 = *(uint64_t (**)(void))(v0 + 8);
  return v9();
}

unint64_t sub_1DDC9EFA4()
{
  unint64_t result = qword_1EAB91C68;
  if (!qword_1EAB91C68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAB91C68);
  }
  return result;
}

void sub_1DDC9EFF8(uint64_t a1, int a2, char a3, id a4, uint64_t *a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  uint64_t v17 = MEMORY[0x1E4FBC868];
  double v18 = (void *)MEMORY[0x1E4FBC150];
  if (a2)
  {
    double v19 = (void *)*MEMORY[0x1E4F3A710];
    uint64_t v63 = (void *)MEMORY[0x1E4FBC150];
    LODWORD(aBlock) = a2;
    sub_1DDCA1F9C(&aBlock, v67);
    id v20 = v19;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v66 = v17;
    sub_1DDCA9BB0(v67, v20, isUniquelyReferenced_nonNull_native);
    uint64_t v17 = v66;

    swift_bridgeObjectRelease();
  }
  if (a3)
  {
    double v22 = (void *)*MEMORY[0x1E4F3A730];
    uint64_t v63 = (void *)MEMORY[0x1E4FBB390];
    LOBYTE(aBlock) = 1;
    sub_1DDCA1F9C(&aBlock, v67);
    id v23 = v22;
    char v24 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v66 = v17;
    sub_1DDCA9BB0(v67, v23, v24);
    uint64_t v17 = v66;

    swift_bridgeObjectRelease();
  }
  if (objc_msgSend(a4, sel_interpolationQuality))
  {
    id v25 = (id)*MEMORY[0x1E4F3A718];
    unsigned int v26 = objc_msgSend(a4, sel_interpolationQuality);
    uint64_t v63 = v18;
    LODWORD(aBlock) = v26;
    sub_1DDCA1F9C(&aBlock, v67);
    char v27 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v66 = v17;
    sub_1DDCA9BB0(v67, v25, v27);
    uint64_t v17 = v66;

    swift_bridgeObjectRelease();
  }
  if (objc_msgSend(a4, sel_badgeType))
  {
    id v28 = (id)*MEMORY[0x1E4F3A708];
    id v29 = objc_msgSend(a4, sel_badgeType);
    uint64_t v63 = (void *)MEMORY[0x1E4FBB808];
    *(void *)&long long aBlock = v29;
    sub_1DDCA1F9C(&aBlock, v67);
    char v30 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v66 = v17;
    sub_1DDCA9BB0(v67, v28, v30);
    uint64_t v17 = v66;

    swift_bridgeObjectRelease();
  }
  uint64_t v60 = a8;
  if (objc_msgSend(a4, sel_thirdPartyVideoDecodersAllowed))
  {
    id v31 = (id)*MEMORY[0x1E4F3A728];
    unsigned __int8 v32 = objc_msgSend(a4, sel_thirdPartyVideoDecodersAllowed);
    uint64_t v63 = (void *)MEMORY[0x1E4FBB390];
    LOBYTE(aBlock) = v32;
    sub_1DDCA1F9C(&aBlock, v67);
    char v33 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v66 = v17;
    sub_1DDCA9BB0(v67, v31, v33);
    uint64_t v17 = v66;

    swift_bridgeObjectRelease();
  }
  os_log_type_t v34 = (void *)*MEMORY[0x1E4F3A720];
  uint64_t v35 = *a5;
  id v36 = objc_allocWithZone(NSNumber);
  id v37 = v34;
  id v38 = objc_msgSend(v36, sel_initWithInteger_, v35);
  uint64_t v63 = (void *)sub_1DDCA2014(0, (unint64_t *)&unk_1EBE9E500);
  *(void *)&long long aBlock = v38;
  sub_1DDCA1F9C(&aBlock, v67);
  char v39 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v66 = v17;
  sub_1DDCA9BB0(v67, v37, v39);

  swift_bridgeObjectRelease();
  objc_msgSend(a4, sel_size);
  double v41 = v40;
  double v43 = v42;
  objc_msgSend(a4, sel_minimumDimension);
  double v45 = v44;
  objc_msgSend(a4, sel_scale);
  double v47 = v46;
  if (!a7)
  {
    id v48 = objc_msgSend(a4, sel_externalThumbnailGeneratorData);
    sub_1DDCB4AF0();
  }
  id v49 = objc_allocWithZone(MEMORY[0x1E4F3A690]);
  type metadata accessor for QLFileThumbnailRequestOptions(0);
  sub_1DDC6BC7C(&qword_1EBE9E4E8, type metadata accessor for QLFileThumbnailRequestOptions);
  swift_bridgeObjectRetain();
  id v50 = a6;
  uint64_t v51 = (void *)sub_1DDCB4AE0();
  swift_bridgeObjectRelease();
  uint64_t v52 = (void *)sub_1DDCB4AE0();
  swift_bridgeObjectRelease();
  id v53 = objc_msgSend(v49, sel_initWithItem_maximumSize_minimumSize_scale_options_generationData_, v50, v51, v52, v41, v43, v45, v47);

  uint64_t v54 = swift_allocObject();
  *(void *)(v54 + 16) = a1;
  id v55 = objc_allocWithZone((Class)QLExtensionHostContextThumbnailOperation);
  uint64_t v64 = sub_1DDCA2060;
  uint64_t v65 = v54;
  *(void *)&long long aBlock = MEMORY[0x1E4F143A8];
  *((void *)&aBlock + 1) = 1107296256;
  v62 = sub_1DDCA031C;
  uint64_t v63 = &block_descriptor_34;
  uint64_t v56 = _Block_copy(&aBlock);
  id v57 = objc_msgSend(v55, sel_initWithAppex_request_completionHandler_, v60, v53, v56);
  _Block_release(v56);
  swift_release();
  id v58 = *(void **)(a9 + OBJC_IVAR___QLThumbnailExtensionGenerator_operation);
  *(void *)(a9 + OBJC_IVAR___QLThumbnailExtensionGenerator_operation) = v57;
  id v59 = v57;

  objc_msgSend(a10, sel_addOperation_, v59);
}

uint64_t sub_1DDC9F5CC(void *a1, void *a2, uint64_t a3)
{
  if (a1)
  {
    **(void **)(*(void *)(a3 + 64) + 40) = a1;
    id v4 = a1;
    return MEMORY[0x1F4188200](a3);
  }
  else
  {
    if (a2)
    {
      double v6 = a2;
    }
    else
    {
      type metadata accessor for QLThumbnailError(0);
      sub_1DDCA03F4(MEMORY[0x1E4FBC860]);
      sub_1DDC6BC7C(&qword_1EAB91C38, type metadata accessor for QLThumbnailError);
      sub_1DDCB48D0();
      double v6 = v10;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB91CD0);
    swift_allocError();
    void *v7 = v6;
    id v8 = a2;
    return swift_continuation_throwingResumeWithError();
  }
}

uint64_t sub_1DDC9F704(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB91CD0);
    swift_allocError();
    *uint64_t v5 = a3;
    id v6 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    if (a2)
    {
      **(void **)(*(void *)(v3 + 64) + 40) = a2;
      id v8 = a2;
      a1 = v3;
    }
    else
    {
      __break(1u);
    }
    return MEMORY[0x1F4188200](a1);
  }
}

unint64_t sub_1DDC9F7C4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB91CE0);
  uint64_t v2 = sub_1DDCB4E90();
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
    sub_1DDCA1FAC(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_1DDCA7FCC(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_1DDCA1F9C(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_1DDC9F8F0(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB91CD8);
    uint64_t v2 = sub_1DDCB4E90();
  }
  else
  {
    uint64_t v2 = MEMORY[0x1E4FBC868];
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
    if (v13 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v28 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v28 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v27) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v28 + 8 * v15);
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
    long long v17 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_1DDC6D2A0(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(void *)&long long v39 = v19;
    *((void *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v19;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_1DDCA1F9C(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_1DDCA1F9C(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_1DDCA1F9C(v36, v37);
    sub_1DDCA1F9C(v37, &v33);
    uint64_t result = sub_1DDCB4D60();
    uint64_t v20 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v6 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v21) & ~*(void *)(v6 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v6 + 8 * v22);
      }
      while (v26 == -1);
      unint64_t v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    uint64_t v10 = *(void *)(v2 + 48) + 40 * v9;
    *(_OWORD *)uint64_t v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(void *)(v10 + 32) = v31;
    uint64_t result = (uint64_t)sub_1DDCA1F9C(&v33, (_OWORD *)(*(void *)(v2 + 56) + 32 * v9));
    ++*(void *)(v2 + 16);
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_1DDC70ADC();
    return v2;
  }
  unint64_t v14 = *(void *)(v28 + 8 * v16);
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
    if (v15 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_1DDC9FE68(void *a1, void *a2, int a3, char a4, uint64_t a5, void *aBlock, void *a7)
{
  v7[3] = a2;
  v7[4] = a7;
  void v7[2] = a1;
  v7[5] = _Block_copy(aBlock);
  if (a5) {
    a5 = sub_1DDCB4AF0();
  }
  v7[6] = a5;
  id v14 = a1;
  id v15 = a2;
  a7;
  int64_t v16 = (void *)swift_task_alloc();
  v7[7] = v16;
  void *v16 = v7;
  v16[1] = sub_1DDC9FF9C;
  return sub_1DDC9CAB0((uint64_t)v14, (uint64_t)v15, a3, a4 & 1, a5);
}

uint64_t sub_1DDC9FF9C(uint64_t a1, void *a2)
{
  uint64_t v4 = v2;
  uint64_t v6 = *v3;
  uint64_t v7 = *(void **)(*v3 + 32);
  int64_t v8 = *(void **)(*v3 + 24);
  unint64_t v9 = *(void **)(*v3 + 16);
  uint64_t v10 = *v3;
  swift_task_dealloc();

  unint64_t v11 = *(void (***)(void, void, void, void))(v6 + 40);
  swift_bridgeObjectRelease();
  if (v4)
  {
    unint64_t v12 = (void *)sub_1DDCB48E0();

    ((void (**)(void, void, void, void *))v11)[2](v11, 0, 0, v12);
    _Block_release(v11);
  }
  else
  {
    sub_1DDCA2014(0, &qword_1EBE9E628);
    int64_t v13 = (void *)sub_1DDCB4BC0();
    ((void (**)(void, void *, void *, void))v11)[2](v11, v13, a2, 0);

    _Block_release(v11);
    swift_bridgeObjectRelease();
  }
  id v14 = *(uint64_t (**)(void))(v10 + 8);
  return v14();
}

id sub_1DDCA01CC()
{
  return objc_msgSend(*(id *)(v0 + OBJC_IVAR___QLThumbnailExtensionGenerator_operation), sel_cancel);
}

id ThumbnailExtensionGenerator.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id ThumbnailExtensionGenerator.init()()
{
  *(void *)&v0[OBJC_IVAR___QLThumbnailExtensionGenerator_operation] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ThumbnailExtensionGenerator();
  return objc_msgSendSuper2(&v2, sel_init);
}

id ThumbnailExtensionGenerator.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ThumbnailExtensionGenerator();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_1DDCA0300@<X0>(void **a1@<X0>, void *a2@<X8>)
{
  return sub_1DDCA72A8(a1, *(void *)(v2 + 16), a2);
}

void sub_1DDCA031C(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_1DDCA03A8(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_1DDCA03B8(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

unint64_t sub_1DDCA03F4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB91CE0);
  uint64_t v2 = sub_1DDCB4E90();
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
    sub_1DDCA1FAC(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_1DDCA0520(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    unint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *unint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_1DDCA1F9C(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_1DDCA0520(uint64_t a1, uint64_t a2)
{
  sub_1DDCB4F70();
  sub_1DDCB4B70();
  uint64_t v4 = sub_1DDCB4FA0();
  return sub_1DDCA0598(a1, a2, v4);
}

unint64_t sub_1DDCA0598(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t i = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_1DDCB4F00() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      unint64_t i = (i + 1) & v12;
      if ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
      {
        BOOL v13 = (void *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_1DDCB4F00() & 1) == 0)
        {
          for (unint64_t i = (i + 1) & v12; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v12)
          {
            uint64_t v15 = (void *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2) {
              break;
            }
            if (sub_1DDCB4F00()) {
              break;
            }
          }
        }
      }
    }
  }
  return i;
}

uint64_t sub_1DDCA06E0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_1DDCA20E4;
  return v6();
}

uint64_t sub_1DDCA07AC(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_1DDCA20E4;
  return v7();
}

uint64_t sub_1DDCA0878(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1DDCB4C40();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1DDCB4C30();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1DDCA1D50(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1DDCB4C20();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1DDCA0A1C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1DDCA0AF8;
  return v6(a1);
}

uint64_t sub_1DDCA0AF8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1DDCA0BF0(uint64_t (*a1)(void))
{
  return a1();
}

void sub_1DDCA0C18(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_1DDCB4D10();
  *a1 = v7;
  uint64_t v8 = *a2;
  if (*a2)
  {
    *uint64_t v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

unsigned char **sub_1DDCA0CD0(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  *uint64_t v4 = a4;
  *unint64_t result = v4 + 1;
  return result;
}

uint64_t sub_1DDCA0CE0(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1DDCA0D08(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_1DDC6D1CC(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_1DDCB4D10();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_1DDCA0D80(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE9E590);
    char v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    char v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  BOOL v13 = a4 + 32;
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
  uint64_t result = sub_1DDCB4EA0();
  __break(1u);
  return result;
}

uint64_t sub_1DDCA0ED0(uint64_t a1)
{
  uint64_t v2 = sub_1DDCB4A40();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x1F4188790](v2);
  unint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  id v37 = (char *)&v30 - v7;
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB91CF0);
    uint64_t v9 = sub_1DDCB4D90();
    uint64_t v10 = 0;
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    uint64_t v35 = v12;
    uint64_t v36 = v9 + 56;
    uint64_t v13 = *(unsigned __int8 *)(v11 + 64);
    uint64_t v32 = v8;
    uint64_t v33 = a1 + ((v13 + 32) & ~v13);
    uint64_t v14 = *(void *)(v11 + 56);
    uint64_t v15 = (void (**)(char *, uint64_t))(v11 - 8);
    uint64_t v31 = (uint64_t (**)(unint64_t, char *, uint64_t))(v11 + 16);
    while (1)
    {
      uint64_t v34 = v10;
      v35(v37, v33 + v14 * v10, v2);
      sub_1DDC6BC7C((unint64_t *)&unk_1EBE9E420, MEMORY[0x1E4FBCEA8]);
      uint64_t v16 = sub_1DDCB4B00();
      uint64_t v17 = ~(-1 << *(unsigned char *)(v9 + 32));
      unint64_t v18 = v16 & v17;
      unint64_t v19 = (v16 & (unint64_t)v17) >> 6;
      uint64_t v20 = *(void *)(v36 + 8 * v19);
      uint64_t v21 = 1 << (v16 & v17);
      if ((v21 & v20) != 0)
      {
        while (1)
        {
          uint64_t v22 = v11;
          v35(v6, *(void *)(v9 + 48) + v18 * v14, v2);
          sub_1DDC6BC7C((unint64_t *)&unk_1EBE9E430, MEMORY[0x1E4FBCEA8]);
          char v23 = sub_1DDCB4B20();
          unint64_t v24 = *v15;
          (*v15)(v6, v2);
          if (v23) {
            break;
          }
          unint64_t v18 = (v18 + 1) & v17;
          unint64_t v19 = v18 >> 6;
          uint64_t v20 = *(void *)(v36 + 8 * (v18 >> 6));
          uint64_t v21 = 1 << v18;
          uint64_t v11 = v22;
          if ((v20 & (1 << v18)) == 0) {
            goto LABEL_8;
          }
        }
        v24(v37, v2);
        uint64_t v11 = v22;
      }
      else
      {
LABEL_8:
        BOOL v25 = v37;
        *(void *)(v36 + 8 * v19) = v21 | v20;
        uint64_t result = (*v31)(*(void *)(v9 + 48) + v18 * v14, v25, v2);
        uint64_t v27 = *(void *)(v9 + 16);
        BOOL v28 = __OFADD__(v27, 1);
        uint64_t v29 = v27 + 1;
        if (v28)
        {
          __break(1u);
          return result;
        }
        *(void *)(v9 + 16) = v29;
      }
      uint64_t v10 = v34 + 1;
      if (v34 + 1 == v32) {
        return v9;
      }
    }
  }
  return MEMORY[0x1E4FBC870];
}

uint64_t sub_1DDCA11E8(unint64_t a1, void *a2)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_1DDCB4E60();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t result = MEMORY[0x1E4FBC860];
  if (v3)
  {
    uint64_t v20 = MEMORY[0x1E4FBC860];
    uint64_t result = sub_1DDCB4E00();
    if (v3 < 0)
    {
      __break(1u);
    }
    else
    {
      uint64_t v5 = 0;
      while (1)
      {
        id v6 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x1E01C4FF0](v5, a1) : *(id *)(a1 + 8 * v5 + 32);
        uint64_t v7 = v6;
        objc_msgSend(a2, sel_scale);
        double v9 = v8;
        id v10 = objc_msgSend(v7, sel_data);
        uint64_t v11 = sub_1DDCB4900();
        unint64_t v13 = v12;

        uint64_t v14 = (void *)sub_1DDCB48F0();
        sub_1DDCA1EA0(v11, v13);
        id v15 = objc_msgSend(v7, sel_format);
        uint64_t v16 = (void *)QLCreateCGImageWithDataAndFormat();

        if (!v16) {
          break;
        }
        ++v5;
        id v17 = objc_msgSend(self, sel_imageWithCGImage_scale_orientation_, v16, 1, v9);

        sub_1DDCB4DE0();
        sub_1DDCB4E10();
        sub_1DDCB4E20();
        sub_1DDCB4DF0();
        if (v3 == v5) {
          return v20;
        }
      }
      sub_1DDC9EFA4();
      swift_allocError();
      *unint64_t v18 = 2;
      swift_willThrow();

      return swift_release();
    }
  }
  return result;
}

uint64_t type metadata accessor for ThumbnailExtensionGenerator()
{
  return self;
}

uint64_t method lookup function for ThumbnailExtensionGenerator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ThumbnailExtensionGenerator);
}

uint64_t dispatch thunk of ThumbnailExtensionGenerator.generateThumbnail(thumbnailRequest:item:flavor:wantsLowQuality:generationData:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v12 = *(int **)((*MEMORY[0x1E4FBC8C8] & *v5) + 0x70);
  id v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)v12 + *v12);
  unint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v13;
  *unint64_t v13 = v6;
  v13[1] = sub_1DDCA15A8;
  return v15(a1, a2, a3, a4, a5);
}

uint64_t sub_1DDCA15A8(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *v2;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8);
  return v5(a1, a2);
}

uint64_t dispatch thunk of ThumbnailExtensionGenerator.cancel()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x78))();
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ThumbnailExtensionGenerator.Errors(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ThumbnailExtensionGenerator.Errors(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1DDCA1854);
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

uint64_t sub_1DDCA187C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1DDCA1888(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ThumbnailExtensionGenerator.Errors()
{
  return &type metadata for ThumbnailExtensionGenerator.Errors;
}

unint64_t sub_1DDCA18A8()
{
  unint64_t result = qword_1EAB91C80;
  if (!qword_1EAB91C80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAB91C80);
  }
  return result;
}

unint64_t sub_1DDCA18FC()
{
  unint64_t result = qword_1EAB91C88;
  if (!qword_1EAB91C88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAB91C88);
  }
  return result;
}

uint64_t sub_1DDCA1950()
{
  _Block_release(*(const void **)(v0 + 48));
  return MEMORY[0x1F4186498](v0, 64, 7);
}

uint64_t sub_1DDCA19A8()
{
  int v2 = *(void **)(v0 + 16);
  int v3 = *(void **)(v0 + 24);
  int v4 = *(_DWORD *)(v0 + 32);
  char v5 = *(unsigned char *)(v0 + 36);
  uint64_t v6 = *(void *)(v0 + 40);
  BOOL v7 = *(void **)(v0 + 48);
  int v8 = *(void **)(v0 + 56);
  double v9 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v9;
  *double v9 = v1;
  v9[1] = sub_1DDCA1A88;
  id v10 = (uint64_t (*)(void *, void *, int, char, uint64_t, void *, void *))((char *)&dword_1EAB91C90
                                                                                   + dword_1EAB91C90);
  return v10(v2, v3, v4, v5, v6, v7, v8);
}

uint64_t sub_1DDCA1A88()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1DDCA1B80()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  char v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *char v5 = v1;
  v5[1] = sub_1DDCA20E4;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1EAB91CA0 + dword_1EAB91CA0);
  return v6(v2, v3, v4);
}

uint64_t objectdestroy_16Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1DDCA1C84(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  BOOL v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_1DDCA20E4;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1EAB91CB0 + dword_1EAB91CB0);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_1DDCA1D50(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE9E618);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1DDCA1DB0()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1DDCA1DE8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1DDCA1A88;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1EAB91CC0 + dword_1EAB91CC0);
  return v6(a1, v4);
}

uint64_t sub_1DDCA1EA0(uint64_t a1, unint64_t a2)
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

unint64_t sub_1DDCA1EF8()
{
  unint64_t result = qword_1EBE9E4B8;
  if (!qword_1EBE9E4B8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EBE9E4B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBE9E4B8);
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

_OWORD *sub_1DDCA1F9C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1DDCA1FAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB91CE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DDCA2014(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1DDCA2050()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1DDCA2060(void *a1, void *a2)
{
  return sub_1DDC9F5CC(a1, a2, *(void *)(v2 + 16));
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

uint64_t sub_1DDCA20E8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  id v6 = objc_msgSend(v2, sel_attributes);
  uint64_t v7 = sub_1DDCB4AF0();

  if (!*(void *)(v7 + 16))
  {
    long long v15 = 0u;
    long long v16 = 0u;
LABEL_7:
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_1DDCA7FCC(a1, a2);
  if ((v9 & 1) == 0)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  sub_1DDC6D2A0(*(void *)(v7 + 56) + 32 * v8, (uint64_t)&v15);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*((void *)&v16 + 1))
  {
    sub_1DDCA1F9C(&v15, &v17);
    goto LABEL_15;
  }
LABEL_8:
  id v10 = objc_msgSend(v3, sel_nsExtensionAttributes, v15, (void)v16, *((void *)&v16 + 1));
  uint64_t v11 = sub_1DDCB4AF0();

  if (*(void *)(v11 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v12 = sub_1DDCA7FCC(a1, a2);
    if (v13)
    {
      sub_1DDC6D2A0(*(void *)(v11 + 56) + 32 * v12, (uint64_t)&v17);
    }
    else
    {
      long long v17 = 0u;
      long long v18 = 0u;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_1DDC716E0((uint64_t)&v15, qword_1EBE9E5A0);
LABEL_15:
  __swift_instantiateConcreteTypeFromMangledName(qword_1EBE9E5A0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBE9E4A0);
  if (swift_dynamicCast()) {
    return v15;
  }
  else {
    return 0;
  }
}

uint64_t sub_1DDCA22CC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  id v6 = objc_msgSend(v2, sel_attributes);
  uint64_t v7 = sub_1DDCB4AF0();

  if (!*(void *)(v7 + 16))
  {
    long long v15 = 0u;
    long long v16 = 0u;
LABEL_7:
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_1DDCA7FCC(a1, a2);
  if ((v9 & 1) == 0)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  sub_1DDC6D2A0(*(void *)(v7 + 56) + 32 * v8, (uint64_t)&v15);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*((void *)&v16 + 1))
  {
    sub_1DDCA1F9C(&v15, &v17);
    goto LABEL_15;
  }
LABEL_8:
  id v10 = objc_msgSend(v3, sel_nsExtensionAttributes, v15, (void)v16, *((void *)&v16 + 1));
  uint64_t v11 = sub_1DDCB4AF0();

  if (*(void *)(v11 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v12 = sub_1DDCA7FCC(a1, a2);
    if (v13)
    {
      sub_1DDC6D2A0(*(void *)(v11 + 56) + 32 * v12, (uint64_t)&v17);
    }
    else
    {
      long long v17 = 0u;
      long long v18 = 0u;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_1DDC716E0((uint64_t)&v15, qword_1EBE9E5A0);
LABEL_15:
  __swift_instantiateConcreteTypeFromMangledName(qword_1EBE9E5A0);
  if (swift_dynamicCast()) {
    return v15;
  }
  else {
    return 2;
  }
}

uint64_t sub_1DDCA24A8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  id v6 = objc_msgSend(v2, sel_attributes);
  uint64_t v7 = sub_1DDCB4AF0();

  if (!*(void *)(v7 + 16))
  {
    long long v15 = 0u;
    long long v16 = 0u;
LABEL_7:
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_1DDCA7FCC(a1, a2);
  if ((v9 & 1) == 0)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  sub_1DDC6D2A0(*(void *)(v7 + 56) + 32 * v8, (uint64_t)&v15);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*((void *)&v16 + 1))
  {
    sub_1DDCA1F9C(&v15, &v17);
    goto LABEL_15;
  }
LABEL_8:
  id v10 = objc_msgSend(v3, sel_nsExtensionAttributes, v15, (void)v16, *((void *)&v16 + 1));
  uint64_t v11 = sub_1DDCB4AF0();

  if (*(void *)(v11 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v12 = sub_1DDCA7FCC(a1, a2);
    if (v13)
    {
      sub_1DDC6D2A0(*(void *)(v11 + 56) + 32 * v12, (uint64_t)&v17);
    }
    else
    {
      long long v17 = 0u;
      long long v18 = 0u;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_1DDC716E0((uint64_t)&v15, qword_1EBE9E5A0);
LABEL_15:
  __swift_instantiateConcreteTypeFromMangledName(qword_1EBE9E5A0);
  if (swift_dynamicCast()) {
    return v15;
  }
  else {
    return 0;
  }
}

uint64_t sub_1DDCA2684(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  id v6 = objc_msgSend(v2, sel_attributes);
  uint64_t v7 = sub_1DDCB4AF0();

  if (!*(void *)(v7 + 16))
  {
    long long v17 = 0u;
    long long v18 = 0u;
LABEL_7:
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_1DDCA7FCC(a1, a2);
  if ((v9 & 1) == 0)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  sub_1DDC6D2A0(*(void *)(v7 + 56) + 32 * v8, (uint64_t)&v17);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*((void *)&v18 + 1))
  {
    sub_1DDCA1F9C(&v17, &v19);
    goto LABEL_15;
  }
LABEL_8:
  id v10 = objc_msgSend(v3, sel_nsExtensionAttributes, v17, (void)v18, *((void *)&v18 + 1));
  uint64_t v11 = sub_1DDCB4AF0();

  if (*(void *)(v11 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v12 = sub_1DDCA7FCC(a1, a2);
    if (v13)
    {
      sub_1DDC6D2A0(*(void *)(v11 + 56) + 32 * v12, (uint64_t)&v19);
    }
    else
    {
      long long v19 = 0u;
      long long v20 = 0u;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_1DDC716E0((uint64_t)&v17, qword_1EBE9E5A0);
LABEL_15:
  __swift_instantiateConcreteTypeFromMangledName(qword_1EBE9E5A0);
  int v14 = swift_dynamicCast();
  uint64_t v15 = v17;
  if (!v14) {
    return 0;
  }
  return v15;
}

uint64_t sub_1DDCA2864()
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v0 = sub_1DDCB4B90();
  if (v1)
  {
    uint64_t v2 = v0;
    uint64_t v3 = v1;
    do
    {
      uint64_t v6 = sub_1DDCB4B90();
      if (!v7)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return 1;
      }
      if (v2 == v6 && v3 == v7)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        char v4 = sub_1DDCB4F00();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v4 & 1) == 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return 0;
        }
      }
      uint64_t v2 = sub_1DDCB4B90();
      uint64_t v3 = v5;
    }
    while (v5);
  }
  swift_bridgeObjectRelease();
  sub_1DDCB4B90();
  uint64_t v9 = v8;
  swift_bridgeObjectRelease();
  BOOL v10 = v9 == 0;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1DDCA29CC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE9E418);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1DDCB4920();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  unint64_t v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1, 1, v9) == 1)
  {
    sub_1DDC716E0(a1, &qword_1EBE9E418);
    sub_1DDCA8334(a2, (uint64_t)v8);
    sub_1DDC6B728(a2);
    return sub_1DDC716E0((uint64_t)v8, &qword_1EBE9E418);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 32))(v12, a1, v9);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v16 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_1DDCA9CF4((uint64_t)v12, a2, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v16;
    swift_bridgeObjectRelease();
    return sub_1DDC6B728(a2);
  }
}

uint64_t sub_1DDCA2B98()
{
  id v0 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ThumbnailExtensionMonitor()), sel_init);
  uint64_t result = sub_1DDCA360C();
  qword_1EBE9E3F0 = (uint64_t)v0;
  return result;
}

id static ThumbnailExtensionMonitor.shared.getter()
{
  if (qword_1EBE9E680 != -1) {
    swift_once();
  }
  swift_beginAccess();
  id v0 = (void *)qword_1EBE9E3F0;
  return v0;
}

void static ThumbnailExtensionMonitor.shared.setter(uint64_t a1)
{
  if (qword_1EBE9E680 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v2 = (void *)qword_1EBE9E3F0;
  qword_1EBE9E3F0 = a1;
}

uint64_t (*static ThumbnailExtensionMonitor.shared.modify())()
{
  if (qword_1EBE9E680 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_1DDCA2DEC()
{
  uint64_t v0 = sub_1DDCB4990();
  type metadata accessor for ThumbnailExtensionMonitor.Predicate(0);
  swift_bridgeObjectRetain();
  sub_1DDCB4B80();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1DDCA2E98()
{
  return sub_1DDCB4FA0();
}

uint64_t sub_1DDCA2F50()
{
  return sub_1DDCB4F80();
}

uint64_t sub_1DDCA2FF4()
{
  return sub_1DDCB4FA0();
}

BOOL sub_1DDCA30AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (sub_1DDCB49C0() & 1) != 0
      && *(unsigned __int8 *)(a1 + *(int *)(a3 + 20)) == *(unsigned __int8 *)(a2 + *(int *)(a3 + 20))
      && *(void *)(a1 + *(int *)(a3 + 24)) == *(void *)(a2 + *(int *)(a3 + 24));
}

uint64_t sub_1DDCA3114()
{
  uint64_t v0 = sub_1DDCB4A80();
  __swift_allocate_value_buffer(v0, qword_1EBE9EA10);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EBE9EA10);
  return sub_1DDCB4A70();
}

id ThumbnailExtensionMonitor.init()()
{
  uint64_t v25 = sub_1DDCB4CB0();
  uint64_t v1 = *(void *)(v25 - 8);
  MEMORY[0x1F4188790](v25);
  uint64_t v3 = (char *)v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1DDCB4CA0();
  MEMORY[0x1F4188790](v4);
  uint64_t v5 = sub_1DDCB4AB0();
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v24 = OBJC_IVAR___QLThumbnailExtensionMonitor_queue;
  v23[1] = sub_1DDCA2014(0, (unint64_t *)&unk_1EBE9E4D0);
  uint64_t v6 = v0;
  sub_1DDCB4AA0();
  uint64_t v27 = MEMORY[0x1E4FBC860];
  sub_1DDC6BCC4((unint64_t *)&unk_1EBE9E4C0, MEMORY[0x1E4FBCC10]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE9E4B0);
  sub_1DDCA50E0((unint64_t *)&qword_1EBE9E4B8, &qword_1EBE9E4B0);
  sub_1DDCB4D40();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4FBCC58], v25);
  *(void *)(v23[2] + v24) = sub_1DDCB4CE0();
  uint64_t v7 = MEMORY[0x1E4FBC868];
  *(void *)&v6[OBJC_IVAR___QLThumbnailExtensionMonitor_identitiesByType] = MEMORY[0x1E4FBC868];
  *(void *)&v6[OBJC_IVAR___QLThumbnailExtensionMonitor_extensionByIdentifier] = v7;
  *(void *)&v6[OBJC_IVAR___QLThumbnailExtensionMonitor_matchingExtensionsCache] = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE9E598);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1DDCB9CC0;
  id v9 = objc_allocWithZone(MEMORY[0x1E4F25880]);
  uint64_t v10 = (void *)sub_1DDCB4B30();
  id v11 = objc_msgSend(v9, sel_initWithExtensionPointIdentifier_, v10);

  *(void *)(v8 + 32) = v11;
  id v12 = objc_allocWithZone(MEMORY[0x1E4F25880]);
  char v13 = (void *)sub_1DDCB4B30();
  id v14 = objc_msgSend(v12, sel_initWithExtensionPointIdentifier_, v13);

  *(void *)(v8 + 40) = v14;
  id v15 = objc_allocWithZone(MEMORY[0x1E4F25880]);
  uint64_t v16 = (void *)sub_1DDCB4B30();
  id v17 = objc_msgSend(v15, sel_initWithExtensionPointIdentifier_, v16);

  *(void *)(v8 + 48) = v17;
  uint64_t v27 = v8;
  sub_1DDCB4BE0();
  id v18 = objc_allocWithZone(MEMORY[0x1E4F25888]);
  sub_1DDCA2014(0, &qword_1EBE9E520);
  long long v19 = (void *)sub_1DDCB4BC0();
  swift_bridgeObjectRelease();
  id v20 = objc_msgSend(v18, sel_initWithQueries_, v19);

  *(void *)&v6[OBJC_IVAR___QLThumbnailExtensionMonitor_queryController] = v20;
  uint64_t v21 = (objc_class *)type metadata accessor for ThumbnailExtensionMonitor();
  v26.receiver = v6;
  v26.super_class = v21;
  return objc_msgSendSuper2(&v26, sel_init);
}

uint64_t type metadata accessor for ThumbnailExtensionMonitor()
{
  return self;
}

uint64_t sub_1DDCA360C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE9E618);
  MEMORY[0x1F4188790](v1 - 8);
  uint64_t v35 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1DDCB4A90();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v33 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = sub_1DDCB4AB0();
  uint64_t v32 = *(void *)(v34 - 8);
  MEMORY[0x1F4188790](v34);
  uint64_t v31 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EBE9E478 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_1DDCB4A80();
  __swift_project_value_buffer(v7, (uint64_t)qword_1EBE9EA10);
  uint64_t v8 = v0;
  id v9 = sub_1DDCB4A60();
  os_log_type_t v10 = sub_1DDCB4C80();
  if (os_log_type_enabled(v9, v10))
  {
    id v11 = (uint8_t *)swift_slowAlloc();
    id v12 = (void *)swift_slowAlloc();
    *(_DWORD *)id v11 = 138412290;
    aBlock[0] = v8;
    char v13 = v8;
    uint64_t v30 = v4;
    uint64_t v14 = v3;
    id v15 = v13;
    sub_1DDCB4D10();
    void *v12 = v8;

    uint64_t v3 = v14;
    uint64_t v4 = v30;
    _os_log_impl(&dword_1DDC5E000, v9, v10, "Setup cache for %@", v11, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBE9E510);
    swift_arrayDestroy();
    MEMORY[0x1E01C6640](v12, -1, -1);
    MEMORY[0x1E01C6640](v11, -1, -1);
  }
  else
  {
  }
  uint64_t v16 = *(void **)&v8[OBJC_IVAR___QLThumbnailExtensionMonitor_queue];
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v8;
  aBlock[4] = sub_1DDCACCE0;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1DDCA3C40;
  aBlock[3] = &block_descriptor_42;
  id v18 = _Block_copy(aBlock);
  long long v19 = v8;
  id v20 = v16;
  uint64_t v21 = v31;
  sub_1DDCB4AA0();
  uint64_t v36 = MEMORY[0x1E4FBC860];
  sub_1DDC6BCC4(&qword_1EBE9E488, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE9E490);
  sub_1DDCA50E0(&qword_1EBE9E498, &qword_1EBE9E490);
  uint64_t v22 = v33;
  sub_1DDCB4D40();
  MEMORY[0x1E01C4F00](0, v21, v22, v18);
  _Block_release(v18);

  (*(void (**)(char *, uint64_t))(v4 + 8))(v22, v3);
  (*(void (**)(char *, uint64_t))(v32 + 8))(v21, v34);
  swift_release();
  uint64_t v23 = OBJC_IVAR___QLThumbnailExtensionMonitor_queryController;
  objc_msgSend(*(id *)&v19[OBJC_IVAR___QLThumbnailExtensionMonitor_queryController], sel_setDelegate_, v19);
  objc_msgSend(*(id *)&v19[v23], sel_resume);
  uint64_t v24 = sub_1DDCB4C40();
  uint64_t v25 = (uint64_t)v35;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v35, 1, 1, v24);
  objc_super v26 = (void *)swift_allocObject();
  v26[2] = 0;
  v26[3] = 0;
  v26[4] = v19;
  uint64_t v27 = v19;
  sub_1DDCA4468(v25, (uint64_t)&unk_1EAB91D98, (uint64_t)v26);
  return swift_release();
}

uint64_t sub_1DDCA3B40(uint64_t a1)
{
  id v1 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(a1
                                                             + OBJC_IVAR___QLThumbnailExtensionMonitor_queryController), sel_queries));
  if (!v1)
  {
    sub_1DDCA2014(0, &qword_1EBE9E520);
    sub_1DDCB4BD0();
    id v1 = (id)sub_1DDCB4BC0();
    swift_bridgeObjectRelease();
  }
  id v2 = objc_msgSend(self, sel_executeQueries_, v1);

  sub_1DDCA2014(0, &qword_1EBE9E4E0);
  unint64_t v3 = sub_1DDCB4BD0();

  sub_1DDCA5248(v3);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DDCA3C40(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_1DDCA3C84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[9] = a4;
  uint64_t v5 = sub_1DDCB4A90();
  v4[10] = v5;
  v4[11] = *(void *)(v5 - 8);
  v4[12] = swift_task_alloc();
  uint64_t v6 = sub_1DDCB4AB0();
  v4[13] = v6;
  v4[14] = *(void *)(v6 - 8);
  v4[15] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE9E6D8);
  v4[16] = swift_task_alloc();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE9E650);
  v4[17] = v7;
  v4[18] = *(void *)(v7 - 8);
  v4[19] = swift_task_alloc();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE9E648);
  v4[20] = v8;
  v4[21] = *(void *)(v8 - 8);
  v4[22] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1DDCA3E90, 0, 0);
}

uint64_t sub_1DDCA3E90()
{
  uint64_t v2 = v0[18];
  uint64_t v1 = v0[19];
  uint64_t v3 = v0[17];
  sub_1DDCB4940();
  sub_1DDCB4C50();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v0[23] = OBJC_IVAR___QLThumbnailExtensionMonitor_queue;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[24] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_1DDCA3F88;
  uint64_t v5 = v0[20];
  uint64_t v6 = v0[16];
  return MEMORY[0x1F4187D58](v6, 0, 0, v5);
}

uint64_t sub_1DDCA3F88()
{
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1DDCA4084, 0, 0);
}

uint64_t sub_1DDCA4084()
{
  uint64_t v1 = v0[16];
  uint64_t v2 = sub_1DDCB4930();
  int v3 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(v1, 1, v2);
  uint64_t v4 = v0[12];
  if (v3 == 1)
  {
    (*(void (**)(void, void))(v0[21] + 8))(v0[22], v0[20]);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v5 = (uint64_t (*)(void))v0[1];
    return v5();
  }
  else
  {
    uint64_t v7 = v0[15];
    uint64_t v19 = v0[14];
    uint64_t v20 = v0[13];
    uint64_t v8 = v0[10];
    uint64_t v18 = v0[11];
    id v9 = (char *)v0[9];
    uint64_t v10 = *(void **)&v9[v0[23]];
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v9;
    v0[6] = sub_1DDCACECC;
    v0[7] = v11;
    v0[2] = MEMORY[0x1E4F143A8];
    v0[3] = 1107296256;
    v0[4] = sub_1DDCA3C40;
    v0[5] = &block_descriptor_58;
    id v12 = _Block_copy(v0 + 2);
    id v13 = v10;
    uint64_t v14 = v9;
    sub_1DDCB4AA0();
    v0[8] = MEMORY[0x1E4FBC860];
    sub_1DDC6BCC4(&qword_1EBE9E488, MEMORY[0x1E4FBCB00]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE9E490);
    sub_1DDCA50E0(&qword_1EBE9E498, &qword_1EBE9E490);
    sub_1DDCB4D40();
    MEMORY[0x1E01C4F00](0, v7, v4, v12);
    _Block_release(v12);

    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v4, v8);
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v7, v20);
    swift_release();
    sub_1DDC716E0(v1, &qword_1EBE9E6D8);
    id v15 = (void *)swift_task_alloc();
    v0[24] = v15;
    *id v15 = v0;
    v15[1] = sub_1DDCA3F88;
    uint64_t v16 = v0[20];
    uint64_t v17 = v0[16];
    return MEMORY[0x1F4187D58](v17, 0, 0, v16);
  }
}

uint64_t sub_1DDCA43D4(uint64_t a1)
{
  id v1 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(a1
                                                             + OBJC_IVAR___QLThumbnailExtensionMonitor_queryController), sel_extensionIdentities));
  sub_1DDCA2014(0, &qword_1EBE9E4E0);
  unint64_t v2 = sub_1DDCB4BD0();

  sub_1DDCA5248(v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DDCA4468(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1DDCB4C40();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1DDCB4C30();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1DDC716E0(a1, &qword_1EBE9E618);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1DDCB4C20();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

BOOL sub_1DDCA4614(uint64_t a1, double a2, double a3)
{
  double v5 = COERCE_DOUBLE(sub_1DDCA47C0(a1));
  if (v6) {
    return 0;
  }
  if (a2 == 0.0 && a3 == 0.0) {
    return 1;
  }
  if (v5 <= a2) {
    return v5 <= a3;
  }
  return 0;
}

uint64_t sub_1DDCA47C0(uint64_t a1)
{
  v23[0] = swift_getObjectType();
  uint64_t v2 = type metadata accessor for ThumbnailExtensionMonitor.Predicate(0);
  MEMORY[0x1F4188790](v2);
  uint64_t v4 = (char *)v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1DDCB4A40();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x1F4188790](v5);
  id v9 = (char *)v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  uint64_t v11 = (char *)v23 - v10;
  sub_1DDCB49E0();
  char v12 = sub_1DDCB4A20();
  id v13 = *(void (**)(char *, uint64_t))(v6 + 8);
  v13(v11, v5);
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v14(v9, a1, v5);
  if (v12)
  {
    v13(v9, v5);
    return 0x4031000000000000;
  }
  if (qword_1EAB91BC0 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v5, (uint64_t)qword_1EAB92AF0);
  char v15 = sub_1DDCB4A20();
  v13(v9, v5);
  if (v15) {
    return 0x4031000000000000;
  }
  uint64_t v18 = ((uint64_t (*)(char *, uint64_t, uint64_t))v14)(v4, a1, v5);
  v4[*(int *)(v2 + 20)] = 0;
  *(void *)&v4[*(int *)(v2 + 24)] = 3;
  MEMORY[0x1F4188790](v18);
  v23[-4] = v19;
  v23[-3] = v4;
  v23[-2] = v23[0];
  id v21 = v20;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE9E470);
  sub_1DDCB4CC0();

  uint64_t v22 = (char *)v23[3];
  sub_1DDC6B728((uint64_t)v4);
  if (!v22) {
    return 0;
  }
  uint64_t v16 = *(void *)&v22[OBJC_IVAR___QLThumbnailExtension_minimumThumbnailDimension];

  return v16;
}

uint64_t sub_1DDCA4AC0(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v8 = type metadata accessor for ThumbnailExtensionMonitor.Predicate(0);
  uint64_t v9 = v8 - 8;
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = &v17[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v12 = sub_1DDCB4A40();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16))(v11, a1, v12);
  v11[*(int *)(v9 + 28)] = a2;
  *(void *)&v11[*(int *)(v9 + 32)] = a3;
  id v13 = *(void **)(v3 + OBJC_IVAR___QLThumbnailExtensionMonitor_queue);
  uint64_t v18 = v3;
  uint64_t v19 = v11;
  uint64_t v20 = ObjectType;
  id v14 = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE9E470);
  sub_1DDCB4CC0();

  uint64_t v15 = v21;
  sub_1DDC6B728((uint64_t)v11);
  return v15;
}

uint64_t sub_1DDCA4D34(void *a1)
{
  uint64_t v3 = sub_1DDCB4A90();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17[0] = sub_1DDCB4AB0();
  uint64_t v7 = *(void *)(v17[0] - 8);
  MEMORY[0x1F4188790](v17[0]);
  uint64_t v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void **)&v1[OBJC_IVAR___QLThumbnailExtensionMonitor_queue];
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v1;
  *(void *)(v11 + 24) = a1;
  aBlock[4] = sub_1DDCA50C0;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1DDCA3C40;
  aBlock[3] = &block_descriptor_0;
  uint64_t v12 = _Block_copy(aBlock);
  id v13 = v10;
  id v14 = v1;
  id v15 = a1;
  sub_1DDCB4AA0();
  v17[1] = MEMORY[0x1E4FBC860];
  sub_1DDC6BCC4(&qword_1EBE9E488, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE9E490);
  sub_1DDCA50E0(&qword_1EBE9E498, &qword_1EBE9E490);
  sub_1DDCB4D40();
  MEMORY[0x1E01C4F00](0, v9, v6, v12);
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  (*(void (**)(char *, void))(v7 + 8))(v9, v17[0]);
  return swift_release();
}

uint64_t sub_1DDCA4FF0(int a1, id a2)
{
  id v2 = objc_msgSend(a2, sel_extensionIdentities);
  sub_1DDCA2014(0, &qword_1EBE9E4E0);
  unint64_t v3 = sub_1DDCB4BD0();

  sub_1DDCA5248(v3);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DDCA5080()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1DDCA50C0()
{
  return sub_1DDCA4FF0(*(void *)(v0 + 16), *(id *)(v0 + 24));
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

uint64_t sub_1DDCA50E0(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_1DDCA5248(unint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE9E418);
  ((void (*)(void))MEMORY[0x1F4188790])();
  uint64_t v115 = (char *)&v105 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBE9E448);
  ((void (*)(void))MEMORY[0x1F4188790])();
  uint64_t v5 = (char *)&v105 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1DDCB4A40();
  uint64_t v119 = *(void *)(v6 - 8);
  uint64_t v7 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  uint64_t v133 = (uint64_t *)((char *)&v105 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = MEMORY[0x1F4188790](v7);
  uint64_t v122 = (char *)&v105 - v10;
  MEMORY[0x1F4188790](v9);
  uint64_t v131 = (char *)&v105 - v11;
  uint64_t v132 = sub_1DDCB4920();
  unint64_t v116 = *(void **)(v132 - 8);
  uint64_t v12 = MEMORY[0x1F4188790](v132);
  uint64_t v127 = (char *)&v105 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x1F4188790](v12);
  uint64_t v112 = (char *)&v105 - v15;
  MEMORY[0x1F4188790](v14);
  uint64_t v126 = (uint64_t)&v105 - v16;
  uint64_t v17 = sub_1DDCB4AC0();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x1F4188790](v17);
  uint64_t v20 = (uint64_t *)((char *)&v105 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v21 = *(void **)(v1 + OBJC_IVAR___QLThumbnailExtensionMonitor_queue);
  *uint64_t v20 = v21;
  (*(void (**)(void *, void, uint64_t))(v18 + 104))(v20, *MEMORY[0x1E4FBCBF0], v17);
  id v22 = v21;
  LOBYTE(v21) = sub_1DDCB4AD0();
  uint64_t v24 = *(void (**)(void *, uint64_t))(v18 + 8);
  unint64_t v23 = v18 + 8;
  v24(v20, v17);
  if ((v21 & 1) == 0) {
    goto LABEL_39;
  }
  uint64_t v136 = MEMORY[0x1E4FBC870];
  uint64_t v105 = v1;
  unint64_t v23 = v1 + OBJC_IVAR___QLThumbnailExtensionMonitor_identitiesByType;
  swift_beginAccess();
  if (*(void *)(*(void *)v23 + 16))
  {
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v135 = *(void *)v23;
    *(void *)unint64_t v23 = 0x8000000000000000;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBE9E538);
    sub_1DDCB4E40();
    *(void *)unint64_t v23 = v135;
    swift_bridgeObjectRelease();
  }
  swift_endAccess();
  if (a1 >> 62)
  {
LABEL_40:
    swift_bridgeObjectRetain();
    uint64_t v25 = sub_1DDCB4E60();
    if (v25)
    {
LABEL_6:
      uint64_t v128 = (uint64_t *)v23;
      objc_super v26 = 0;
      unint64_t v27 = 0;
      unint64_t v23 = a1 & 0xC000000000000001;
      uint64_t v107 = a1 & 0xFFFFFFFFFFFFFF8;
      unint64_t v106 = a1 + 32;
      uint64_t v111 = (void (**)(uint64_t, uint64_t))(v116 + 1);
      uint64_t v129 = (unsigned int (**)(char *, uint64_t, uint64_t))(v119 + 48);
      uint64_t v130 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v119 + 56);
      uint64_t v121 = (void (**)(char *, char *, uint64_t))(v119 + 32);
      id v125 = (char **)(v119 + 16);
      v120 = (void (**)(char *, uint64_t))(v119 + 8);
      uint64_t v114 = 0x80000001DDCBF560;
      unint64_t v110 = a1;
      uint64_t v109 = v25;
      unint64_t v108 = a1 & 0xC000000000000001;
      do
      {
        if (v23)
        {
          id v28 = (id)MEMORY[0x1E01C4FF0](v27, a1);
        }
        else
        {
          if (v27 >= *(void *)(v107 + 16)) {
            goto LABEL_38;
          }
          id v28 = *(id *)(v106 + 8 * v27);
        }
        uint64_t v29 = v28;
        BOOL v30 = __OFADD__(v27++, 1);
        if (v30) {
          goto LABEL_37;
        }
        uint64_t v31 = sub_1DDCA20E8(0xD000000000000017, v114);
        if (v31)
        {
          uint64_t v32 = v31;
          uint64_t v118 = v26;
          unint64_t v33 = v23;
          id v34 = objc_msgSend(v29, sel_uniqueIdentifier);
          uint64_t v117 = v32;
          id v35 = v34;
          uint64_t v36 = v112;
          sub_1DDCB4910();

          uint64_t v37 = v126;
          sub_1DDCAAEB0(v126, v36);
          uint64_t v38 = v37;
          uint64_t v39 = v117;
          (*v111)(v38, v132);
          unint64_t v23 = *(void *)(v39 + 16);
          if (v23)
          {
            id v124 = v29;
            unint64_t v113 = v27;
            double v40 = (void (**)(void))self;
            a1 = v39 + 40;
            double v41 = &selRef_setGenerationQueue_;
            objc_super v26 = v118;
            id v123 = v40;
            while (1)
            {
              swift_bridgeObjectRetain();
              double v45 = (void *)sub_1DDCB4B30();
              swift_bridgeObjectRelease();
              id v46 = objc_msgSend(v40, v41[382], v45, 1);

              if (v46)
              {
                (*v130)(v5, 1, 1, v6);
                sub_1DDC6BCC4(&qword_1EBE9E440, MEMORY[0x1E4FBCEA8]);
                sub_1DDCB4ED0();

                if ((*v129)(v5, 1, v6) != 1)
                {
                  double v47 = v122;
                  id v48 = *v121;
                  id v49 = v5;
                  (*v121)(v122, v5, v6);
                  id v50 = v131;
                  v48(v131, v47, v6);
                  uint64_t v5 = *v125;
                  uint64_t v51 = v133;
                  ((void (*)(void *, char *, uint64_t))*v125)(v133, v50, v6);
                  uint64_t v52 = v128;
                  swift_beginAccess();
                  id v53 = v124;
                  sub_1DDCACC98((uint64_t)v26);
                  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
                  uint64_t v135 = *v52;
                  uint64_t v55 = v135;
                  *uint64_t v52 = 0x8000000000000000;
                  unint64_t v57 = sub_1DDC6F958((uint64_t)v51);
                  uint64_t v58 = *(void *)(v55 + 16);
                  BOOL v59 = (v56 & 1) == 0;
                  uint64_t v60 = v58 + v59;
                  if (__OFADD__(v58, v59))
                  {
                    __break(1u);
LABEL_36:
                    __break(1u);
LABEL_37:
                    __break(1u);
LABEL_38:
                    __break(1u);
LABEL_39:
                    __break(1u);
                    goto LABEL_40;
                  }
                  char v61 = v56;
                  if (*(void *)(v55 + 24) >= v60)
                  {
                    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
                    {
                      sub_1DDCAA6C0();
                      uint64_t v55 = v135;
                    }
                  }
                  else
                  {
                    sub_1DDCA8C4C(v60, isUniquelyReferenced_nonNull_native);
                    uint64_t v55 = v135;
                    unint64_t v62 = sub_1DDC6F958((uint64_t)v133);
                    if ((v61 & 1) != (v63 & 1)) {
                      goto LABEL_83;
                    }
                    unint64_t v57 = v62;
                  }
                  uint64_t v64 = v128;
                  *uint64_t v128 = v55;
                  swift_bridgeObjectRelease();
                  uint64_t v65 = (void *)*v64;
                  if (v61)
                  {
                    swift_bridgeObjectRetain();
                  }
                  else
                  {
                    v65[(v57 >> 6) + 8] |= 1 << v57;
                    unint64_t v66 = v65[6] + *(void *)(v119 + 72) * v57;
                    swift_bridgeObjectRetain();
                    ((void (*)(unint64_t, void *, uint64_t))v5)(v66, v133, v6);
                    *(void *)(v65[7] + 8 * v57) = MEMORY[0x1E4FBC860];
                    uint64_t v67 = v65[2];
                    BOOL v30 = __OFADD__(v67, 1);
                    uint64_t v68 = v67 + 1;
                    if (v30) {
                      goto LABEL_36;
                    }
                    v65[2] = v68;
                  }
                  uint64_t v42 = v65[7];
                  uint64_t v43 = swift_bridgeObjectRelease();
                  MEMORY[0x1E01C4DE0](v43);
                  uint64_t v5 = v49;
                  if (*(void *)((*(void *)(v42 + 8 * v57) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v42 + 8 * v57) & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                    sub_1DDCB4BF0();
                  }
                  sub_1DDCB4C10();
                  sub_1DDCB4BE0();
                  double v44 = *v120;
                  (*v120)((char *)v133, v6);
                  swift_endAccess();
                  v44(v131, v6);
                  objc_super v26 = sub_1DDCA614C;
                  double v41 = &selRef_setGenerationQueue_;
                  double v40 = v123;
                }
              }
              a1 += 16;
              if (!--v23)
              {

                swift_bridgeObjectRelease();
                a1 = v110;
                uint64_t v25 = v109;
                unint64_t v27 = v113;
                unint64_t v23 = v108;
                goto LABEL_8;
              }
            }
          }

          swift_bridgeObjectRelease();
          unint64_t v23 = v33;
          objc_super v26 = v118;
        }
        else
        {
        }
LABEL_8:
        ;
      }
      while (v27 != v25);
      goto LABEL_42;
    }
  }
  else
  {
    uint64_t v25 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v25) {
      goto LABEL_6;
    }
  }
  objc_super v26 = 0;
LABEL_42:
  swift_bridgeObjectRelease();
  unint64_t v69 = (uint64_t *)(v105 + OBJC_IVAR___QLThumbnailExtensionMonitor_extensionByIdentifier);
  swift_beginAccess();
  int64_t v70 = (void *)*v69;
  uint64_t v71 = *(void *)(*v69 + 64);
  v120 = (void (**)(char *, uint64_t))(*v69 + 64);
  uint64_t v72 = 1 << *((unsigned char *)v70 + 32);
  if (v72 < 64) {
    uint64_t v73 = ~(-1 << v72);
  }
  else {
    uint64_t v73 = -1;
  }
  unint64_t v74 = v73 & v71;
  uint64_t v122 = (char *)((unint64_t)(v72 + 63) >> 6);
  uint64_t v131 = (char *)(v116 + 2);
  id v124 = v116 + 6;
  id v125 = (char **)(v116 + 7);
  id v123 = (void (**)(void))(v116 + 4);
  uint64_t v133 = v116 + 1;
  uint64_t v128 = v70;
  swift_bridgeObjectRetain();
  uint64_t v75 = 0;
  uint64_t v76 = v132;
  uint64_t v118 = v26;
  uint64_t v121 = (void (**)(char *, char *, uint64_t))v69;
  while (1)
  {
    uint64_t v80 = v115;
    if (!v74) {
      break;
    }
    unint64_t v81 = __clz(__rbit64(v74));
    uint64_t v82 = (v74 - 1) & v74;
    unint64_t v83 = v81 | (v75 << 6);
LABEL_68:
    os_log_type_t v87 = v116;
    uint64_t v88 = v116[9];
    uint64_t v89 = (void (*)(char *, unint64_t, uint64_t))v116[2];
    v89(v115, v128[6] + v88 * v83, v76);
    ((void (*)(char *, void, uint64_t, uint64_t))v87[7])(v80, 0, 1, v76);
    if (((unsigned int (*)(char *, uint64_t, uint64_t))v87[6])(v80, 1, v76) == 1) {
      goto LABEL_80;
    }
    uint64_t v130 = (void (**)(char *, uint64_t, uint64_t, uint64_t))v82;
    uint64_t v79 = (uint64_t)v127;
    (*v123)();
    uint64_t v90 = v136;
    if (*(void *)(v136 + 16))
    {
      uint64_t v129 = (unsigned int (**)(char *, uint64_t, uint64_t))v75;
      sub_1DDC6BCC4(&qword_1EBE9E400, MEMORY[0x1E4F27990]);
      swift_bridgeObjectRetain();
      uint64_t v91 = sub_1DDCB4B00();
      uint64_t v92 = -1 << *(unsigned char *)(v90 + 32);
      unint64_t v93 = v91 & ~v92;
      if (((*(void *)(v90 + 56 + ((v93 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v93) & 1) == 0)
      {
LABEL_74:
        swift_bridgeObjectRelease();
        objc_super v26 = v118;
        unint64_t v69 = (uint64_t *)v121;
        uint64_t v75 = (uint64_t)v129;
        goto LABEL_75;
      }
      uint64_t v94 = ~v92;
      while (1)
      {
        uint64_t v95 = v126;
        uint64_t v96 = v132;
        v89((char *)v126, *(void *)(v90 + 48) + v93 * v88, v132);
        sub_1DDC6BCC4((unint64_t *)&unk_1EBE9E408, MEMORY[0x1E4F27990]);
        char v97 = sub_1DDCB4B20();
        BOOL v98 = (void (*)(char *, uint64_t))*v133;
        ((void (*)(uint64_t, uint64_t))*v133)(v95, v96);
        if (v97) {
          break;
        }
        unint64_t v93 = (v93 + 1) & v94;
        uint64_t v79 = (uint64_t)v127;
        if (((*(void *)(v90 + 56 + ((v93 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v93) & 1) == 0) {
          goto LABEL_74;
        }
      }
      swift_bridgeObjectRelease();
      uint64_t v76 = v132;
      v98(v127, v132);
      objc_super v26 = v118;
      unint64_t v69 = (uint64_t *)v121;
      uint64_t v75 = (uint64_t)v129;
      unint64_t v74 = (unint64_t)v130;
    }
    else
    {
LABEL_75:
      swift_beginAccess();
      swift_bridgeObjectRetain();
      unint64_t v99 = sub_1DDC6BA08(v79);
      char v101 = v100;
      swift_bridgeObjectRelease();
      if (v101)
      {
        int v102 = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v103 = *v69;
        int64_t v134 = (void (*)(char *, char *, uint64_t))*v69;
        *unint64_t v69 = 0x8000000000000000;
        if (!v102)
        {
          sub_1DDCAA428();
          uint64_t v103 = (uint64_t)v134;
        }
        ((void (*)(unint64_t, uint64_t))*v133)(*(void *)(v103 + 48) + v99 * v88, v132);
        uint64_t v77 = (uint64_t)v134;
        unint64_t v78 = *(void **)(*((void *)v134 + 7) + 8 * v99);
        sub_1DDCA955C(v99, (uint64_t)v134);
        *unint64_t v69 = v77;

        swift_bridgeObjectRelease();
        uint64_t v79 = (uint64_t)v127;
      }
      swift_endAccess();
      uint64_t v76 = v132;
      ((void (*)(uint64_t, uint64_t))*v133)(v79, v132);
      unint64_t v74 = (unint64_t)v130;
    }
  }
  uint64_t v84 = v75 + 1;
  if (__OFADD__(v75, 1))
  {
    __break(1u);
    goto LABEL_82;
  }
  if (v84 >= (uint64_t)v122) {
    goto LABEL_79;
  }
  unint64_t v85 = (unint64_t)v120[v84];
  ++v75;
  if (v85) {
    goto LABEL_67;
  }
  uint64_t v75 = v84 + 1;
  if (v84 + 1 >= (uint64_t)v122) {
    goto LABEL_79;
  }
  unint64_t v85 = (unint64_t)v120[v75];
  if (v85) {
    goto LABEL_67;
  }
  uint64_t v75 = v84 + 2;
  if (v84 + 2 >= (uint64_t)v122) {
    goto LABEL_79;
  }
  unint64_t v85 = (unint64_t)v120[v75];
  if (v85) {
    goto LABEL_67;
  }
  uint64_t v75 = v84 + 3;
  if (v84 + 3 >= (uint64_t)v122) {
    goto LABEL_79;
  }
  unint64_t v85 = (unint64_t)v120[v75];
  if (v85) {
    goto LABEL_67;
  }
  uint64_t v75 = v84 + 4;
  if (v84 + 4 >= (uint64_t)v122) {
    goto LABEL_79;
  }
  unint64_t v85 = (unint64_t)v120[v75];
  if (v85)
  {
LABEL_67:
    uint64_t v82 = (v85 - 1) & v85;
    unint64_t v83 = __clz(__rbit64(v85)) + (v75 << 6);
    goto LABEL_68;
  }
  uint64_t v86 = v84 + 5;
  if (v86 >= (uint64_t)v122)
  {
LABEL_79:
    ((void (*)(char *, uint64_t, uint64_t, uint64_t))*v125)(v115, 1, 1, v76);
LABEL_80:
    swift_release();
    swift_bridgeObjectRelease();
    return sub_1DDCACC98((uint64_t)v26);
  }
  unint64_t v85 = (unint64_t)v120[v86];
  if (v85)
  {
    uint64_t v75 = v86;
    goto LABEL_67;
  }
  while (1)
  {
    uint64_t v75 = v86 + 1;
    if (__OFADD__(v86, 1)) {
      break;
    }
    if (v75 >= (uint64_t)v122) {
      goto LABEL_79;
    }
    unint64_t v85 = (unint64_t)v120[v75];
    ++v86;
    if (v85) {
      goto LABEL_67;
    }
  }
LABEL_82:
  __break(1u);
LABEL_83:
  uint64_t result = sub_1DDCB4F20();
  __break(1u);
  return result;
}

void sub_1DDCA614C(void *a1@<X8>)
{
  *a1 = MEMORY[0x1E4FBC860];
}

uint64_t sub_1DDCA615C@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_bundleIdentifier);
  sub_1DDCB4B60();

  LOBYTE(v3) = sub_1DDCA2864();
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3 & 1;
  return result;
}

void *sub_1DDCA61E8(unint64_t a1, void (*a2)(char *__return_ptr, id *))
{
  if (a1 >> 62) {
    goto LABEL_14;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v4; uint64_t v4 = sub_1DDCB4E60())
  {
    uint64_t v5 = 4;
    while (1)
    {
      id v6 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x1E01C4FF0](v5 - 4, a1) : *(id *)(a1 + 8 * v5);
      uint64_t v7 = v6;
      uint64_t v8 = v5 - 3;
      if (__OFADD__(v5 - 4, 1)) {
        break;
      }
      id v11 = v6;
      a2(&v10, &v11);
      if (v10 == 1)
      {
        swift_bridgeObjectRelease();
        return v7;
      }

      ++v5;
      if (v8 == v4) {
        goto LABEL_10;
      }
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
  }
LABEL_10:
  swift_bridgeObjectRelease();
  return 0;
}

void *sub_1DDCA6300(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_18;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v2; uint64_t v2 = sub_1DDCB4E60())
  {
    uint64_t v3 = 4;
    while (1)
    {
      id v4 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x1E01C4FF0](v3 - 4, a1) : *(id *)(a1 + 8 * v3);
      uint64_t v5 = v4;
      uint64_t v6 = v3 - 3;
      if (__OFADD__(v3 - 4, 1)) {
        break;
      }
      id v7 = objc_msgSend(v4, sel_extensionPointIdentifier);
      uint64_t v8 = sub_1DDCB4B60();
      uint64_t v10 = v9;

      if (v8 == sub_1DDCB4B60() && v10 == v11)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_16:
        swift_bridgeObjectRelease();
        return v5;
      }
      char v13 = sub_1DDCB4F00();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v13) {
        goto LABEL_16;
      }

      ++v3;
      if (v6 == v2) {
        goto LABEL_19;
      }
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
  }
LABEL_19:
  swift_bridgeObjectRelease();
  return 0;
}

void *sub_1DDCA64B0(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_15;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v2; uint64_t v2 = sub_1DDCB4E60())
  {
    unint64_t v3 = v1 & 0xC000000000000001;
    uint64_t v4 = 4;
    unint64_t v13 = v1;
    while (1)
    {
      id v5 = v3 ? (id)MEMORY[0x1E01C4FF0](v4 - 4, v1) : *(id *)(v1 + 8 * v4);
      uint64_t v6 = v5;
      uint64_t v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1)) {
        break;
      }
      id v8 = objc_msgSend(v5, sel_containingBundleRecord);
      if (v8)
      {
        uint64_t v9 = v8;
        id v10 = objc_msgSend(v8, sel_bundleIdentifier);

        if (v10)
        {
          sub_1DDCB4B60();

          char v11 = sub_1DDCA2864();
          unint64_t v1 = v13;
          swift_bridgeObjectRelease();
          if (v11)
          {
            swift_bridgeObjectRelease();
            return v6;
          }
        }
      }

      ++v4;
      if (v7 == v2) {
        goto LABEL_16;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
  }
LABEL_16:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_1DDCA666C@<X0>(id *a1@<X0>, BOOL *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_bundleIdentifier);
  sub_1DDCB4B60();

  LOBYTE(v3) = sub_1DDCA2864();
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = (v3 & 1) == 0;
  return result;
}

uint64_t sub_1DDCA66FC(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v43 = a1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE9E418);
  MEMORY[0x1F4188790](v5 - 8);
  double v45 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for ThumbnailExtensionMonitor.Predicate(0);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v44 = (uint64_t)&v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = sub_1DDCB4920();
  uint64_t v9 = *(void *)(v42 - 8);
  uint64_t v10 = MEMORY[0x1F4188790](v42);
  uint64_t v12 = (char *)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10);
  uint64_t v14 = (char *)&v41 - v13;
  uint64_t v15 = sub_1DDCB4AC0();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x1F4188790](v15);
  uint64_t v18 = (uint64_t *)((char *)&v41 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v19 = *(void **)(v3 + OBJC_IVAR___QLThumbnailExtensionMonitor_queue);
  *uint64_t v18 = v19;
  (*(void (**)(void *, void, uint64_t))(v16 + 104))(v18, *MEMORY[0x1E4FBCBF0], v15);
  id v20 = v19;
  char v21 = sub_1DDCB4AD0();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v16 + 8))(v18, v15);
  if (v21)
  {
    id v23 = objc_msgSend(a2, sel_uniqueIdentifier);
    sub_1DDCB4910();

    uint64_t v24 = (uint64_t *)(v3 + OBJC_IVAR___QLThumbnailExtensionMonitor_extensionByIdentifier);
    swift_beginAccess();
    uint64_t v25 = *v24;
    if (*(void *)(*v24 + 16))
    {
      swift_bridgeObjectRetain();
      unint64_t v26 = sub_1DDC6BA08((uint64_t)v14);
      if (v27)
      {
        id v28 = *(id *)(*(void *)(v25 + 56) + 8 * v26);
        swift_bridgeObjectRelease();
        uint64_t v29 = v14;
        uint64_t v30 = v42;
        (*(void (**)(char *, uint64_t))(v9 + 8))(v29, v42);
LABEL_7:
        uint64_t v38 = v44;
        sub_1DDC6B840(v43, v44);
        id v39 = objc_msgSend(a2, sel_uniqueIdentifier);
        uint64_t v40 = (uint64_t)v45;
        sub_1DDCB4910();

        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v9 + 56))(v40, 0, 1, v30);
        swift_beginAccess();
        sub_1DDCA29CC(v40, v38);
        swift_endAccess();
        return (uint64_t)v28;
      }
      swift_bridgeObjectRelease();
    }
    uint64_t v31 = *(void (**)(char *, uint64_t))(v9 + 8);
    uint64_t v32 = v14;
    uint64_t v30 = v42;
    v31(v32, v42);
    id v33 = objc_allocWithZone((Class)type metadata accessor for ThumbnailExtension(0));
    id v34 = a2;
    id v35 = sub_1DDCAC8B0(v34);

    id v36 = objc_msgSend(v34, sel_uniqueIdentifier);
    sub_1DDCB4910();

    swift_beginAccess();
    id v28 = v35;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v46 = *v24;
    *uint64_t v24 = 0x8000000000000000;
    sub_1DDCA9EBC((uint64_t)v28, (uint64_t)v12, isUniquelyReferenced_nonNull_native);
    *uint64_t v24 = v46;
    swift_bridgeObjectRelease();
    v31(v12, v30);
    swift_endAccess();
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

id ThumbnailExtensionMonitor.__deallocating_deinit(uint64_t a1)
{
  return sub_1DDCA74A8(a1, type metadata accessor for ThumbnailExtensionMonitor);
}

uint64_t sub_1DDCA6C08()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBE9E448);
  MEMORY[0x1F4188790](v0 - 8);
  uint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1DDCB4A40();
  __swift_allocate_value_buffer(v3, qword_1EAB92AF0);
  uint64_t v4 = __swift_project_value_buffer(v3, (uint64_t)qword_1EAB92AF0);
  sub_1DDCB4A50();
  uint64_t v5 = *(void *)(v3 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v2, 1, v3);
  if (result != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(v4, v2, v3);
  }
  __break(1u);
  return result;
}

uint64_t sub_1DDCA6D38(char a1)
{
  return qword_1DDCB9F20[a1];
}

uint64_t sub_1DDCA6D58(char *a1, char *a2)
{
  return sub_1DDCA6D64(*a1, *a2);
}

uint64_t sub_1DDCA6D64(char a1, char a2)
{
  if (qword_1DDCB9F20[a1] == qword_1DDCB9F20[a2] && qword_1DDCB9F38[a1] == qword_1DDCB9F38[a2]) {
    char v3 = 1;
  }
  else {
    char v3 = sub_1DDCB4F00();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_1DDCA6DEC()
{
  return sub_1DDCA6DF4();
}

uint64_t sub_1DDCA6DF4()
{
  return sub_1DDCB4FA0();
}

uint64_t sub_1DDCA6E60()
{
  return sub_1DDCA6E68();
}

uint64_t sub_1DDCA6E68()
{
  sub_1DDCB4B70();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DDCA6EBC()
{
  return sub_1DDCA6EC4();
}

uint64_t sub_1DDCA6EC4()
{
  return sub_1DDCB4FA0();
}

uint64_t sub_1DDCA6F2C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1DDCAC864();
  *a1 = result;
  return result;
}

uint64_t sub_1DDCA6F5C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1DDCA6D38(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t ThumbnailExtension.supportsInteractiveThumbnailBadges.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR___QLThumbnailExtension_supportsInteractiveThumbnailBadges);
}

uint64_t ThumbnailExtension.generatorIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___QLThumbnailExtension_generatorIdentifier);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ThumbnailExtension.generatorVersion.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___QLThumbnailExtension_generatorVersion);
  swift_bridgeObjectRetain();
  return v1;
}

double ThumbnailExtension.minimumThumbnailDimension.getter()
{
  return *(double *)(v0 + OBJC_IVAR___QLThumbnailExtension_minimumThumbnailDimension);
}

uint64_t sub_1DDCA7090()
{
  return sub_1DDCB4950();
}

uint64_t sub_1DDCA70DC()
{
  return (6u >> (*(unsigned char *)(v0 + OBJC_IVAR___QLThumbnailExtension_supportedConcurrencyLevel) & 7)) & 1;
}

uint64_t sub_1DDCA7104()
{
  return 1;
}

uint64_t sub_1DDCA7174()
{
  id v1 = objc_msgSend(v0, sel_description);
  sub_1DDCB4B60();

  sub_1DDCB4B80();
  swift_bridgeObjectRelease();
  sub_1DDCB4B80();
  swift_bridgeObjectRetain();
  sub_1DDCB4B80();
  swift_bridgeObjectRelease();
  sub_1DDCB4B80();
  sub_1DDCB4970();
  sub_1DDCB4E30();
  return 0;
}

uint64_t sub_1DDCA727C()
{
  return sub_1DDCB4960();
}

id sub_1DDCA72A8@<X0>(void **a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v4 = *a1;
  if (*a1)
  {
    *a3 = v4;
  }
  else
  {
    id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28F08]), sel_init);
    sub_1DDCB4DA0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_1DDCB4B80();
    swift_bridgeObjectRelease();
    uint64_t v8 = (void *)sub_1DDCB4B30();
    swift_bridgeObjectRelease();
    objc_msgSend(v7, sel_setName_, v8, 0xD000000000000015, 0x80000001DDCBF5C0);

    objc_msgSend(v7, sel_setMaxConcurrentOperationCount_, qword_1DDCB9F50[*(char *)(a2 + OBJC_IVAR___QLThumbnailExtension_supportedConcurrencyLevel)]);
    *a1 = v7;
    *a3 = v7;
    id v9 = v7;
    uint64_t v4 = 0;
  }
  return v4;
}

id ThumbnailExtension.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void ThumbnailExtension.init()()
{
}

id ThumbnailExtension.__deallocating_deinit()
{
  return sub_1DDCA74A8(0, (uint64_t (*)(void))type metadata accessor for ThumbnailExtension);
}

id sub_1DDCA74A8(uint64_t a1, uint64_t (*a2)(void))
{
  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

uint64_t type metadata accessor for ThumbnailExtension(uint64_t a1)
{
  return sub_1DDC6B784(a1, qword_1EBE9E458);
}

uint64_t sub_1DDCA7500()
{
  return sub_1DDC6BCC4(&qword_1EBE9E400, MEMORY[0x1E4F27990]);
}

uint64_t sub_1DDCA75F0()
{
  return sub_1DDCB4960();
}

uint64_t method lookup function for ThumbnailExtensionMonitor(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ThumbnailExtensionMonitor);
}

uint64_t dispatch thunk of ThumbnailExtensionMonitor.canGenerateThumbnail(with:at:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of ThumbnailExtensionMonitor.bestExtension(for:matching:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x108))();
}

uint64_t dispatch thunk of ThumbnailExtensionMonitor.bestExtension(for:shouldUseRestrictedExtension:matching:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x110))();
}

uint64_t dispatch thunk of ThumbnailExtensionMonitor.queryControllerDidUpdate(_:resultDifference:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x120))();
}

uint64_t sub_1DDCA7720()
{
  return type metadata accessor for ThumbnailExtension(0);
}

uint64_t sub_1DDCA7728()
{
  uint64_t result = sub_1DDCB4970();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for ThumbnailExtension(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ThumbnailExtension);
}

uint64_t dispatch thunk of ThumbnailExtension.exIdentity.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of ThumbnailExtension.supportsConcurrentRequests.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of ThumbnailExtension.enabled.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of ThumbnailExtension.id.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB0))();
}

uint64_t getEnumTagSinglePayload for ThumbnailExtension.ConcurrencyLevel(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ThumbnailExtension.ConcurrencyLevel(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1DDCA7A38);
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

ValueMetadata *type metadata accessor for ThumbnailExtension.ConcurrencyLevel()
{
  return &type metadata for ThumbnailExtension.ConcurrencyLevel;
}

void *sub_1DDCA7A70(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (void *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1DDCB4A40();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 24);
    *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
    *(void *)((char *)a1 + v8) = *(void *)((char *)a2 + v8);
  }
  return a1;
}

uint64_t sub_1DDCA7B44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1DDCB4A40();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_1DDCA7BCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1DDCB4A40();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  return a1;
}

uint64_t sub_1DDCA7C50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1DDCB4A40();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  return a1;
}

uint64_t sub_1DDCA7CD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1DDCA7CE8);
}

uint64_t sub_1DDCA7CE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1DDCB4A40();
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
      return ((v10 + 2147483646) & 0x7FFFFFFF) + 1;
    }
    else {
      return 0;
    }
  }
}

uint64_t sub_1DDCA7DB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1DDCA7DCC);
}

uint64_t sub_1DDCA7DCC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1DDCB4A40();
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

uint64_t sub_1DDCA7E88()
{
  uint64_t result = sub_1DDCB4A40();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1DDCA7F2C()
{
  return sub_1DDC6BCC4((unint64_t *)&unk_1EBE9E600, (void (*)(uint64_t))type metadata accessor for ThumbnailExtensionMonitor.Predicate);
}

unint64_t sub_1DDCA7F78()
{
  unint64_t result = qword_1EAB91D88;
  if (!qword_1EAB91D88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_1EAB91D88);
  }
  return result;
}

unint64_t sub_1DDCA7FCC(uint64_t a1, uint64_t a2)
{
  sub_1DDCB4F70();
  sub_1DDCB4B70();
  uint64_t v4 = sub_1DDCB4FA0();
  return sub_1DDCA80D8(a1, a2, v4);
}

unint64_t sub_1DDCA8044(uint64_t a1)
{
  sub_1DDCB4B60();
  sub_1DDCB4F70();
  sub_1DDCB4B70();
  uint64_t v2 = sub_1DDCB4FA0();
  swift_bridgeObjectRelease();
  return sub_1DDCA81BC(a1, v2);
}

unint64_t sub_1DDCA80D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unsigned int v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1DDCB4F00() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_1DDCB4F00() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_1DDCA81BC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_1DDCB4B60();
    uint64_t v8 = v7;
    if (v6 == sub_1DDCB4B60() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_1DDCB4F00();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_1DDCB4B60();
          uint64_t v15 = v14;
          if (v13 == sub_1DDCB4B60() && v15 == v16) {
            break;
          }
          char v18 = sub_1DDCB4F00();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

uint64_t sub_1DDCA8334@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_1DDC6B4D8(a1);
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
      sub_1DDCAA958();
      uint64_t v9 = v21;
    }
    uint64_t v10 = *(void *)(v9 + 48);
    uint64_t v11 = type metadata accessor for ThumbnailExtensionMonitor.Predicate(0);
    sub_1DDC6B728(v10 + *(void *)(*(void *)(v11 - 8) + 72) * v6);
    uint64_t v12 = *(void *)(v9 + 56);
    uint64_t v13 = sub_1DDCB4920();
    uint64_t v20 = *(void *)(v13 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v20 + 32))(a2, v12 + *(void *)(v20 + 72) * v6, v13);
    sub_1DDCA9854(v6, v9);
    *uint64_t v3 = v9;
    swift_bridgeObjectRelease();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
    uint64_t v15 = a2;
    uint64_t v16 = 0;
    uint64_t v17 = v13;
  }
  else
  {
    uint64_t v18 = sub_1DDCB4920();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    uint64_t v17 = v18;
    uint64_t v15 = a2;
    uint64_t v16 = 1;
  }
  return v14(v15, v16, 1, v17);
}

uint64_t sub_1DDCA84EC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(qword_1EBE9E560);
  char v35 = a2;
  uint64_t v6 = sub_1DDCB4E80();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v34 = v5 + 64;
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
  while (1)
  {
    if (v10)
    {
      unint64_t v15 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v16 = v15 | (v13 << 6);
      goto LABEL_22;
    }
    int64_t v17 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v17 >= v33) {
      break;
    }
    uint64_t v18 = (void *)(v5 + 64);
    unint64_t v19 = *(void *)(v34 + 8 * v17);
    ++v13;
    if (!v19)
    {
      int64_t v13 = v17 + 1;
      if (v17 + 1 >= v33) {
        goto LABEL_34;
      }
      unint64_t v19 = *(void *)(v34 + 8 * v13);
      if (!v19)
      {
        int64_t v20 = v17 + 2;
        if (v20 >= v33)
        {
LABEL_34:
          swift_release();
          if ((v35 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v19 = *(void *)(v34 + 8 * v20);
        if (!v19)
        {
          while (1)
          {
            int64_t v13 = v20 + 1;
            if (__OFADD__(v20, 1)) {
              goto LABEL_43;
            }
            if (v13 >= v33) {
              goto LABEL_34;
            }
            unint64_t v19 = *(void *)(v34 + 8 * v13);
            ++v20;
            if (v19) {
              goto LABEL_21;
            }
          }
        }
        int64_t v13 = v20;
      }
    }
LABEL_21:
    unint64_t v10 = (v19 - 1) & v19;
    unint64_t v16 = __clz(__rbit64(v19)) + (v13 << 6);
LABEL_22:
    uint64_t v21 = *(void **)(*(void *)(v5 + 48) + 8 * v16);
    id v22 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v16);
    if (v35)
    {
      sub_1DDCA1F9C(v22, v36);
    }
    else
    {
      sub_1DDC6D2A0((uint64_t)v22, (uint64_t)v36);
      id v23 = v21;
    }
    sub_1DDCB4B60();
    sub_1DDCB4F70();
    sub_1DDCB4B70();
    uint64_t v24 = sub_1DDCB4FA0();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v26 = v24 & ~v25;
    unint64_t v27 = v26 >> 6;
    if (((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6))) != 0)
    {
      unint64_t v14 = __clz(__rbit64((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v28 = 0;
      unint64_t v29 = (unint64_t)(63 - v25) >> 6;
      do
      {
        if (++v27 == v29 && (v28 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v30 = v27 == v29;
        if (v27 == v29) {
          unint64_t v27 = 0;
        }
        v28 |= v30;
        uint64_t v31 = *(void *)(v11 + 8 * v27);
      }
      while (v31 == -1);
      unint64_t v14 = __clz(__rbit64(~v31)) + (v27 << 6);
    }
    *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    *(void *)(*(void *)(v7 + 48) + 8 * v14) = v21;
    uint64_t result = (uint64_t)sub_1DDCA1F9C(v36, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v18 = (void *)(v5 + 64);
  if ((v35 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
  if (v32 >= 64) {
    bzero(v18, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v18 = -1 << v32;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1DDCA8828(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_1DDCB4920();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE9E548);
  int v46 = a2;
  uint64_t v10 = sub_1DDCB4E80();
  uint64_t v11 = v9;
  uint64_t v12 = v10;
  if (!*(void *)(v11 + 16)) {
    goto LABEL_41;
  }
  uint64_t v13 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v14 = *(void *)(v11 + 64);
  uint64_t v42 = (void *)(v11 + 64);
  if (v13 < 64) {
    uint64_t v15 = ~(-1 << v13);
  }
  else {
    uint64_t v15 = -1;
  }
  unint64_t v16 = v15 & v14;
  uint64_t v40 = v3;
  int64_t v41 = (unint64_t)(v13 + 63) >> 6;
  uint64_t v43 = (void (**)(char *, unint64_t, uint64_t))(v6 + 16);
  uint64_t v45 = v6;
  int64_t v17 = (void (**)(char *, unint64_t, uint64_t))(v6 + 32);
  uint64_t v18 = v10 + 64;
  uint64_t result = swift_retain();
  int64_t v20 = 0;
  for (i = v11; ; uint64_t v11 = i)
  {
    if (v16)
    {
      unint64_t v22 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v23 = v22 | (v20 << 6);
      goto LABEL_22;
    }
    int64_t v24 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v24 >= v41) {
      break;
    }
    uint64_t v25 = v42;
    unint64_t v26 = v42[v24];
    ++v20;
    if (!v26)
    {
      int64_t v20 = v24 + 1;
      if (v24 + 1 >= v41) {
        goto LABEL_34;
      }
      unint64_t v26 = v42[v20];
      if (!v26)
      {
        int64_t v27 = v24 + 2;
        if (v27 >= v41)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v40;
          if ((v46 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v26 = v42[v27];
        if (!v26)
        {
          while (1)
          {
            int64_t v20 = v27 + 1;
            if (__OFADD__(v27, 1)) {
              goto LABEL_43;
            }
            if (v20 >= v41) {
              goto LABEL_34;
            }
            unint64_t v26 = v42[v20];
            ++v27;
            if (v26) {
              goto LABEL_21;
            }
          }
        }
        int64_t v20 = v27;
      }
    }
LABEL_21:
    unint64_t v16 = (v26 - 1) & v26;
    unint64_t v23 = __clz(__rbit64(v26)) + (v20 << 6);
LABEL_22:
    uint64_t v28 = *(void *)(v45 + 72);
    unint64_t v29 = *(void *)(v11 + 48) + v28 * v23;
    if (v46)
    {
      (*v17)(v8, v29, v5);
      id v30 = *(id *)(*(void *)(v11 + 56) + 8 * v23);
    }
    else
    {
      (*v43)(v8, v29, v5);
      id v30 = *(id *)(*(void *)(v11 + 56) + 8 * v23);
    }
    sub_1DDC6BCC4(&qword_1EBE9E400, MEMORY[0x1E4F27990]);
    uint64_t result = sub_1DDCB4B00();
    uint64_t v31 = -1 << *(unsigned char *)(v12 + 32);
    unint64_t v32 = result & ~v31;
    unint64_t v33 = v32 >> 6;
    if (((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6))) != 0)
    {
      unint64_t v21 = __clz(__rbit64((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v37 = *(void *)(v18 + 8 * v33);
      }
      while (v37 == -1);
      unint64_t v21 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(void *)(v18 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v17)(*(void *)(v12 + 48) + v28 * v21, v8, v5);
    *(void *)(*(void *)(v12 + 56) + 8 * v21) = v30;
    ++*(void *)(v12 + 16);
  }
  swift_release();
  uint64_t v3 = v40;
  uint64_t v25 = v42;
  if ((v46 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v38 = 1 << *(unsigned char *)(v11 + 32);
  if (v38 >= 64) {
    bzero(v25, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v25 = -1 << v38;
  }
  *(void *)(v11 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v12;
  return result;
}

uint64_t sub_1DDCA8C4C(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_1DDCB4A40();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBE9E550);
  int v46 = a2;
  uint64_t v10 = sub_1DDCB4E80();
  uint64_t v11 = v9;
  uint64_t v12 = v10;
  if (!*(void *)(v11 + 16)) {
    goto LABEL_41;
  }
  uint64_t v13 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v14 = *(void *)(v11 + 64);
  uint64_t v42 = (void *)(v11 + 64);
  if (v13 < 64) {
    uint64_t v15 = ~(-1 << v13);
  }
  else {
    uint64_t v15 = -1;
  }
  unint64_t v16 = v15 & v14;
  uint64_t v40 = v3;
  int64_t v41 = (unint64_t)(v13 + 63) >> 6;
  uint64_t v43 = (void (**)(char *, unint64_t, uint64_t))(v6 + 16);
  uint64_t v45 = v6;
  int64_t v17 = (void (**)(char *, unint64_t, uint64_t))(v6 + 32);
  uint64_t v18 = v10 + 64;
  uint64_t result = swift_retain();
  int64_t v20 = 0;
  for (i = v11; ; uint64_t v11 = i)
  {
    if (v16)
    {
      unint64_t v22 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v23 = v22 | (v20 << 6);
      goto LABEL_22;
    }
    int64_t v24 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v24 >= v41) {
      break;
    }
    uint64_t v25 = v42;
    unint64_t v26 = v42[v24];
    ++v20;
    if (!v26)
    {
      int64_t v20 = v24 + 1;
      if (v24 + 1 >= v41) {
        goto LABEL_34;
      }
      unint64_t v26 = v42[v20];
      if (!v26)
      {
        int64_t v27 = v24 + 2;
        if (v27 >= v41)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v40;
          if ((v46 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v26 = v42[v27];
        if (!v26)
        {
          while (1)
          {
            int64_t v20 = v27 + 1;
            if (__OFADD__(v27, 1)) {
              goto LABEL_43;
            }
            if (v20 >= v41) {
              goto LABEL_34;
            }
            unint64_t v26 = v42[v20];
            ++v27;
            if (v26) {
              goto LABEL_21;
            }
          }
        }
        int64_t v20 = v27;
      }
    }
LABEL_21:
    unint64_t v16 = (v26 - 1) & v26;
    unint64_t v23 = __clz(__rbit64(v26)) + (v20 << 6);
LABEL_22:
    uint64_t v28 = *(void *)(v45 + 72);
    unint64_t v29 = *(void *)(v11 + 48) + v28 * v23;
    if (v46)
    {
      (*v17)(v8, v29, v5);
      uint64_t v30 = *(void *)(*(void *)(v11 + 56) + 8 * v23);
    }
    else
    {
      (*v43)(v8, v29, v5);
      uint64_t v30 = *(void *)(*(void *)(v11 + 56) + 8 * v23);
      swift_bridgeObjectRetain();
    }
    sub_1DDC6BCC4((unint64_t *)&unk_1EBE9E420, MEMORY[0x1E4FBCEA8]);
    uint64_t result = sub_1DDCB4B00();
    uint64_t v31 = -1 << *(unsigned char *)(v12 + 32);
    unint64_t v32 = result & ~v31;
    unint64_t v33 = v32 >> 6;
    if (((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6))) != 0)
    {
      unint64_t v21 = __clz(__rbit64((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v37 = *(void *)(v18 + 8 * v33);
      }
      while (v37 == -1);
      unint64_t v21 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(void *)(v18 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v17)(*(void *)(v12 + 48) + v28 * v21, v8, v5);
    *(void *)(*(void *)(v12 + 56) + 8 * v21) = v30;
    ++*(void *)(v12 + 16);
  }
  swift_release();
  uint64_t v3 = v40;
  uint64_t v25 = v42;
  if ((v46 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v38 = 1 << *(unsigned char *)(v11 + 32);
  if (v38 >= 64) {
    bzero(v25, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v25 = -1 << v38;
  }
  *(void *)(v11 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v12;
  return result;
}

uint64_t sub_1DDCA9070(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v53 = sub_1DDCB4920();
  uint64_t v5 = *(void *)(v53 - 8);
  MEMORY[0x1F4188790](v53);
  uint64_t v52 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for ThumbnailExtensionMonitor.Predicate(0);
  uint64_t v49 = *(void *)(v7 - 8);
  uint64_t v50 = v7;
  MEMORY[0x1F4188790](v7);
  uint64_t v9 = (char *)&v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE9E610);
  int v51 = a2;
  uint64_t v11 = v10;
  uint64_t v12 = sub_1DDCB4E80();
  uint64_t v13 = v12;
  if (!*(void *)(v11 + 16)) {
    goto LABEL_41;
  }
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
  uint64_t v43 = v2;
  int64_t v44 = (unint64_t)(v14 + 63) >> 6;
  uint64_t v46 = v5 + 16;
  uint64_t v48 = v5;
  uint64_t v18 = (uint64_t (**)(unint64_t, char *, uint64_t))(v5 + 32);
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
    if (v25 >= v44) {
      break;
    }
    unint64_t v26 = v45;
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
    uint64_t v29 = *(void *)(v49 + 72);
    uint64_t v30 = *(void *)(v11 + 48) + v29 * v24;
    if (v51)
    {
      sub_1DDCACBF4(v30, (uint64_t)v9);
      uint64_t v31 = *(void *)(v11 + 56);
      uint64_t v32 = *(void *)(v48 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v48 + 32))(v52, v31 + v32 * v24, v53);
    }
    else
    {
      sub_1DDC6B840(v30, (uint64_t)v9);
      uint64_t v33 = *(void *)(v11 + 56);
      uint64_t v32 = *(void *)(v48 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v48 + 16))(v52, v33 + v32 * v24, v53);
    }
    sub_1DDCB4F70();
    sub_1DDCB4A40();
    sub_1DDC6BCC4((unint64_t *)&unk_1EBE9E420, MEMORY[0x1E4FBCEA8]);
    sub_1DDCB4B10();
    sub_1DDCB4F90();
    sub_1DDCB4F80();
    uint64_t result = sub_1DDCB4FA0();
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
    sub_1DDCACBF4((uint64_t)v9, *(void *)(v13 + 48) + v22 * v29);
    uint64_t result = (*v18)(*(void *)(v13 + 56) + v22 * v32, v52, v53);
    ++*(void *)(v13 + 16);
  }
  swift_release();
  uint64_t v3 = v43;
  unint64_t v26 = v45;
  if ((v51 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v41 = 1 << *(unsigned char *)(v11 + 32);
  if (v41 >= 64) {
    bzero(v26, ((unint64_t)(v41 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v26 = -1 << v41;
  }
  *(void *)(v11 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v13;
  return result;
}

unint64_t sub_1DDCA955C(int64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1DDCB4920();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = MEMORY[0x1F4188790]();
  uint64_t v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(void *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    uint64_t v11 = ~v9;
    uint64_t v34 = a2 + 64;
    unint64_t result = sub_1DDCB4D50();
    uint64_t v12 = v34;
    if ((*(void *)(v34 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      unint64_t v31 = (result + 1) & v11;
      uint64_t v32 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      uint64_t v33 = v5 + 16;
      uint64_t v13 = (uint64_t (**)(char *, uint64_t))(v5 + 8);
      uint64_t v14 = *(void *)(v5 + 72);
      do
      {
        uint64_t v15 = v14;
        int64_t v16 = v14 * v10;
        v32(v8, *(void *)(a2 + 48) + v14 * v10, v4);
        sub_1DDC6BCC4(&qword_1EBE9E400, MEMORY[0x1E4F27990]);
        uint64_t v17 = sub_1DDCB4B00();
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
            unint64_t v23 = (void *)(v22 + 8 * a1);
            unint64_t v24 = (void *)(v22 + 8 * v10);
            uint64_t v12 = v34;
            if (a1 != v10 || (a1 = v10, v23 >= v24 + 1))
            {
              void *v23 = *v24;
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
    int64_t v25 = (uint64_t *)(v12 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v26 = *v25;
    uint64_t v27 = (-1 << a1) - 1;
  }
  else
  {
    int64_t v25 = (uint64_t *)(a2 + 64 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v27 = *v25;
    uint64_t v26 = (-1 << a1) - 1;
  }
  *int64_t v25 = v27 & v26;
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

unint64_t sub_1DDCA9854(int64_t a1, uint64_t a2)
{
  uint64_t v31 = type metadata accessor for ThumbnailExtensionMonitor.Predicate(0);
  uint64_t v4 = *(void *)(v31 - 8);
  unint64_t result = MEMORY[0x1F4188790](v31);
  uint64_t v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = a2 + 64;
  uint64_t v9 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(void *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    uint64_t v11 = ~v9;
    unint64_t result = sub_1DDCB4D50();
    if ((*(void *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      uint64_t v29 = v11;
      unint64_t v30 = (result + 1) & v11;
      uint64_t v12 = *(void *)(v4 + 72);
      while (1)
      {
        uint64_t v13 = v12;
        int64_t v14 = v10 * v12;
        sub_1DDC6B840(*(void *)(a2 + 48) + v10 * v12, (uint64_t)v7);
        sub_1DDCB4F70();
        sub_1DDCB4A40();
        sub_1DDC6BCC4((unint64_t *)&unk_1EBE9E420, MEMORY[0x1E4FBCEA8]);
        sub_1DDCB4B10();
        sub_1DDCB4F90();
        sub_1DDCB4F80();
        uint64_t v15 = sub_1DDCB4FA0();
        unint64_t result = sub_1DDC6B728((uint64_t)v7);
        unint64_t v16 = v15 & v11;
        if (a1 < (uint64_t)v30) {
          break;
        }
        if (v16 >= v30)
        {
          uint64_t v12 = v13;
          if (a1 < (uint64_t)v16) {
            goto LABEL_6;
          }
          goto LABEL_13;
        }
LABEL_5:
        uint64_t v12 = v13;
LABEL_6:
        unint64_t v10 = (v10 + 1) & v11;
        if (((*(void *)(v8 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
          goto LABEL_25;
        }
      }
      uint64_t v12 = v13;
      if (v16 < v30 && a1 < (uint64_t)v16) {
        goto LABEL_6;
      }
LABEL_13:
      if (a1 * v12 < v14 || *(void *)(a2 + 48) + a1 * v12 >= (unint64_t)(*(void *)(a2 + 48) + v14 + v12))
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (a1 * v12 != v14)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      uint64_t v17 = *(void *)(a2 + 56);
      uint64_t v18 = *(void *)(*(void *)(sub_1DDCB4920() - 8) + 72);
      int64_t v19 = v18 * a1;
      unint64_t result = v17 + v18 * a1;
      int64_t v20 = v18 * v10;
      unint64_t v21 = v17 + v18 * v10 + v18;
      if (v19 >= v20 && result < v21)
      {
        a1 = v10;
        uint64_t v11 = v29;
        uint64_t v12 = v13;
        if (v19 != v20)
        {
          unint64_t result = swift_arrayInitWithTakeBackToFront();
          a1 = v10;
        }
        goto LABEL_6;
      }
      unint64_t result = swift_arrayInitWithTakeFrontToBack();
      a1 = v10;
      uint64_t v11 = v29;
      goto LABEL_5;
    }
LABEL_25:
    unint64_t v23 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v24 = *v23;
    uint64_t v25 = (-1 << a1) - 1;
  }
  else
  {
    unint64_t v23 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v25 = *v23;
    uint64_t v24 = (-1 << a1) - 1;
  }
  uint64_t *v23 = v25 & v24;
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

_OWORD *sub_1DDCA9BB0(_OWORD *a1, void *a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v7 = (void *)*v3;
  unint64_t v9 = sub_1DDCA8044((uint64_t)a2);
  uint64_t v10 = v7[2];
  BOOL v11 = (v8 & 1) == 0;
  uint64_t v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v13 = v8;
  uint64_t v14 = v7[3];
  if (v14 < v12 || (a3 & 1) == 0)
  {
    if (v14 >= v12 && (a3 & 1) == 0)
    {
      sub_1DDCAA260();
      goto LABEL_7;
    }
    sub_1DDCA84EC(v12, a3 & 1);
    unint64_t v18 = sub_1DDCA8044((uint64_t)a2);
    if ((v13 & 1) == (v19 & 1))
    {
      unint64_t v9 = v18;
      uint64_t v15 = *v4;
      if (v13) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    type metadata accessor for QLFileThumbnailRequestOptions(0);
    unint64_t result = (_OWORD *)sub_1DDCB4F20();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v15 = *v4;
  if (v13)
  {
LABEL_8:
    unint64_t v16 = (_OWORD *)(v15[7] + 32 * v9);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
    return sub_1DDCA1F9C(a1, v16);
  }
LABEL_13:
  sub_1DDCAA064(v9, (uint64_t)a2, a1, v15);
  return a2;
}

uint64_t sub_1DDCA9CF4(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = type metadata accessor for ThumbnailExtensionMonitor.Predicate(0);
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  BOOL v11 = (void *)*v3;
  unint64_t v13 = sub_1DDC6B4D8(a2);
  uint64_t v14 = v11[2];
  BOOL v15 = (v12 & 1) == 0;
  uint64_t v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v17 = v12;
  uint64_t v18 = v11[3];
  if (v18 < v16 || (a3 & 1) == 0)
  {
    if (v18 >= v16 && (a3 & 1) == 0)
    {
      sub_1DDCAA958();
      goto LABEL_7;
    }
    sub_1DDCA9070(v16, a3 & 1);
    unint64_t v27 = sub_1DDC6B4D8(a2);
    if ((v17 & 1) == (v28 & 1))
    {
      unint64_t v13 = v27;
      char v19 = *v4;
      if (v17) {
        goto LABEL_8;
      }
LABEL_13:
      sub_1DDC6B840(a2, (uint64_t)v10);
      return sub_1DDCAA0CC(v13, (uint64_t)v10, a1, v19);
    }
LABEL_15:
    uint64_t result = sub_1DDCB4F20();
    __break(1u);
    return result;
  }
LABEL_7:
  char v19 = *v4;
  if ((v17 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v20 = v19[7];
  uint64_t v21 = sub_1DDCB4920();
  uint64_t v22 = *(void *)(v21 - 8);
  unint64_t v23 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v22 + 40);
  uint64_t v24 = v21;
  uint64_t v25 = v20 + *(void *)(v22 + 72) * v13;
  return v23(v25, a1, v24);
}

void sub_1DDCA9EBC(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = sub_1DDCB4920();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  BOOL v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v12 = (void *)*v3;
  unint64_t v14 = sub_1DDC6BA08(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 >= v17 && (a3 & 1) != 0)
  {
LABEL_7:
    uint64_t v20 = *v4;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = v20[7];

      *(void *)(v21 + 8 * v14) = a1;
      return;
    }
    goto LABEL_11;
  }
  if (v19 >= v17 && (a3 & 1) == 0)
  {
    sub_1DDCAA428();
    goto LABEL_7;
  }
  sub_1DDCA8828(v17, a3 & 1);
  unint64_t v22 = sub_1DDC6BA08(a2);
  if ((v18 & 1) != (v23 & 1))
  {
LABEL_14:
    sub_1DDCB4F20();
    __break(1u);
    return;
  }
  unint64_t v14 = v22;
  uint64_t v20 = *v4;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  sub_1DDCAA1A8(v14, (uint64_t)v11, a1, v20);
}

_OWORD *sub_1DDCAA064(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(void *)(a4[6] + 8 * a1) = a2;
  uint64_t result = sub_1DDCA1F9C(a3, (_OWORD *)(a4[7] + 32 * a1));
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

uint64_t sub_1DDCAA0CC(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = type metadata accessor for ThumbnailExtensionMonitor.Predicate(0);
  sub_1DDCACBF4(a2, v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1);
  uint64_t v10 = a4[7];
  uint64_t v11 = sub_1DDCB4920();
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

uint64_t sub_1DDCAA1A8(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_1DDCB4920();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
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

id sub_1DDCAA260()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(qword_1EBE9E560);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1DDCB4E70();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *unint64_t v1 = v4;
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
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t v18 = 32 * v15;
    sub_1DDC6D2A0(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v22);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    sub_1DDCA1F9C(v22, (_OWORD *)(*(void *)(v4 + 56) + v18));
    id result = v17;
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

id sub_1DDCAA428()
{
  uint64_t v1 = sub_1DDCB4920();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE9E548);
  char v23 = v0;
  uint64_t v5 = *v0;
  uint64_t v6 = sub_1DDCB4E70();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
LABEL_23:
    id result = (id)swift_release();
    uint64_t *v23 = v7;
    return result;
  }
  id result = (id)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    id result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  uint64_t v24 = v5 + 64;
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v5 + 64);
  uint64_t v27 = v2 + 16;
  int64_t v25 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v26 = v2 + 32;
  while (1)
  {
    if (v13)
    {
      unint64_t v14 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v15 = v14 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v19 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v19);
    ++v10;
    if (!v20)
    {
      int64_t v10 = v19 + 1;
      if (v19 + 1 >= v25) {
        goto LABEL_23;
      }
      unint64_t v20 = *(void *)(v24 + 8 * v10);
      if (!v20) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_9:
    unint64_t v16 = *(void *)(v2 + 72) * v15;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(void *)(v5 + 48) + v16, v1);
    uint64_t v17 = 8 * v15;
    uint64_t v18 = *(void **)(*(void *)(v5 + 56) + v17);
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(void *)(v7 + 48) + v16, v4, v1);
    *(void *)(*(void *)(v7 + 56) + v17) = v18;
    id result = v18;
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v25) {
    goto LABEL_23;
  }
  unint64_t v20 = *(void *)(v24 + 8 * v21);
  if (v20)
  {
    int64_t v10 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v10 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v10);
    ++v21;
    if (v20) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

void *sub_1DDCAA6C0()
{
  uint64_t v1 = sub_1DDCB4A40();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBE9E550);
  char v23 = v0;
  uint64_t v5 = *v0;
  uint64_t v6 = sub_1DDCB4E70();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
LABEL_23:
    id result = (void *)swift_release();
    uint64_t *v23 = v7;
    return result;
  }
  id result = (void *)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    id result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v5 + 64);
  uint64_t v24 = v5 + 64;
  int64_t v25 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v26 = v2 + 32;
  uint64_t v27 = v2 + 16;
  while (1)
  {
    if (v13)
    {
      unint64_t v14 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v15 = v14 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v19 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v19);
    ++v10;
    if (!v20)
    {
      int64_t v10 = v19 + 1;
      if (v19 + 1 >= v25) {
        goto LABEL_23;
      }
      unint64_t v20 = *(void *)(v24 + 8 * v10);
      if (!v20) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_9:
    unint64_t v16 = *(void *)(v2 + 72) * v15;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(void *)(v5 + 48) + v16, v1);
    uint64_t v17 = 8 * v15;
    uint64_t v18 = *(void *)(*(void *)(v5 + 56) + 8 * v15);
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(void *)(v7 + 48) + v16, v4, v1);
    *(void *)(*(void *)(v7 + 56) + v17) = v18;
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v25) {
    goto LABEL_23;
  }
  unint64_t v20 = *(void *)(v24 + 8 * v21);
  if (v20)
  {
    int64_t v10 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v10 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v10);
    ++v21;
    if (v20) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

void *sub_1DDCAA958()
{
  uint64_t v1 = sub_1DDCB4920();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  uint64_t v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for ThumbnailExtensionMonitor.Predicate(0);
  uint64_t v30 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE9E610);
  int64_t v25 = v0;
  uint64_t v8 = *v0;
  uint64_t v9 = sub_1DDCB4E70();
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)(v8 + 16);
  if (!v11)
  {
LABEL_23:
    id result = (void *)swift_release();
    *int64_t v25 = v10;
    return result;
  }
  id result = (void *)(v9 + 64);
  unint64_t v13 = (unint64_t)((1 << *(unsigned char *)(v10 + 32)) + 63) >> 6;
  if (v10 != v8 || (unint64_t)result >= v8 + 64 + 8 * v13)
  {
    id result = memmove(result, (const void *)(v8 + 64), 8 * v13);
    uint64_t v11 = *(void *)(v8 + 16);
  }
  int64_t v14 = 0;
  *(void *)(v10 + 16) = v11;
  uint64_t v15 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v16 = -1;
  if (v15 < 64) {
    uint64_t v16 = ~(-1 << v15);
  }
  unint64_t v17 = v16 & *(void *)(v8 + 64);
  uint64_t v26 = v8 + 64;
  int64_t v27 = (unint64_t)(v15 + 63) >> 6;
  uint64_t v28 = v2 + 32;
  uint64_t v29 = v2 + 16;
  while (1)
  {
    if (v17)
    {
      unint64_t v18 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      unint64_t v19 = v18 | (v14 << 6);
      goto LABEL_9;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v22 >= v27) {
      goto LABEL_23;
    }
    unint64_t v23 = *(void *)(v26 + 8 * v22);
    ++v14;
    if (!v23)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v27) {
        goto LABEL_23;
      }
      unint64_t v23 = *(void *)(v26 + 8 * v14);
      if (!v23) {
        break;
      }
    }
LABEL_22:
    unint64_t v17 = (v23 - 1) & v23;
    unint64_t v19 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_9:
    unint64_t v20 = *(void *)(v30 + 72) * v19;
    sub_1DDC6B840(*(void *)(v8 + 48) + v20, (uint64_t)v7);
    unint64_t v21 = *(void *)(v2 + 72) * v19;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(void *)(v8 + 56) + v21, v1);
    sub_1DDCACBF4((uint64_t)v7, *(void *)(v10 + 48) + v20);
    id result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(void *)(v10 + 56) + v21, v4, v1);
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v27) {
    goto LABEL_23;
  }
  unint64_t v23 = *(void *)(v26 + 8 * v24);
  if (v23)
  {
    int64_t v14 = v24;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v14 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v14 >= v27) {
      goto LABEL_23;
    }
    unint64_t v23 = *(void *)(v26 + 8 * v14);
    ++v24;
    if (v23) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_1DDCAAC70(char a1, int64_t a2, char a3, void *a4)
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
    unint64_t v13 = (void *)MEMORY[0x1E4FBC860];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE9E580);
  uint64_t v10 = *(void *)(sub_1DDCB4A40() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = (void *)swift_allocObject();
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
  uint64_t v16 = *(void *)(sub_1DDCB4A40() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (char *)v13 + v17;
  unint64_t v19 = (char *)a4 + v17;
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
  unint64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_1DDCB4EA0();
  __break(1u);
  return result;
}

uint64_t sub_1DDCAAEB0(uint64_t a1, char *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_1DDCB4920();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  sub_1DDC6BCC4(&qword_1EBE9E400, MEMORY[0x1E4F27990]);
  swift_bridgeObjectRetain();
  uint64_t v33 = a2;
  uint64_t v11 = sub_1DDCB4B00();
  uint64_t v12 = -1 << *(unsigned char *)(v10 + 32);
  unint64_t v13 = v11 & ~v12;
  uint64_t v32 = v10 + 56;
  if ((*(void *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    uint64_t v28 = v2;
    uint64_t v29 = a1;
    uint64_t v30 = ~v12;
    uint64_t v27 = v7;
    uint64_t v16 = *(void (**)(void, void, void))(v7 + 16);
    uint64_t v15 = v7 + 16;
    size_t v14 = v16;
    uint64_t v31 = *(void *)(v15 + 56);
    unint64_t v17 = (void (**)(char *, uint64_t))(v15 - 8);
    v26[1] = v15 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    while (1)
    {
      uint64_t v18 = v10;
      unint64_t v19 = v31 * v13;
      uint64_t v20 = v14;
      v14(v9, *(void *)(v10 + 48) + v31 * v13, v6);
      sub_1DDC6BCC4((unint64_t *)&unk_1EBE9E408, MEMORY[0x1E4F27990]);
      char v21 = sub_1DDCB4B20();
      unint64_t v22 = *v17;
      (*v17)(v9, v6);
      if (v21) {
        break;
      }
      unint64_t v13 = (v13 + 1) & v30;
      uint64_t v10 = v18;
      size_t v14 = v20;
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
    size_t v14 = *(void (**)(void, void, void))(v7 + 16);
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    int64_t v24 = v33;
    v14(v9, v33, v6);
    uint64_t v34 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_1DDCAB5D0((uint64_t)v9, v13, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v34;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v24, v6);
    return 1;
  }
}

uint64_t sub_1DDCAB1D4()
{
  uint64_t v1 = v0;
  uint64_t v42 = sub_1DDCB4920();
  uint64_t v2 = *(void *)(v42 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v41 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBE9E528);
  uint64_t v5 = sub_1DDCB4D80();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    uint64_t v8 = *(void *)(v4 + 56);
    char v37 = (void *)(v4 + 56);
    if (v7 < 64) {
      uint64_t v9 = ~(-1 << v7);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & v8;
    unint64_t v35 = v0;
    int64_t v36 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v39 = v2;
    uint64_t v11 = v5 + 56;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    uint64_t v38 = v6;
    size_t v14 = v41;
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
      sub_1DDC6BCC4(&qword_1EBE9E400, MEMORY[0x1E4F27990]);
      uint64_t result = sub_1DDCB4B00();
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
  *uint64_t v1 = v6;
  return result;
}

uint64_t sub_1DDCAB5D0(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v31 = a1;
  uint64_t v6 = sub_1DDCB4920();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790]();
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
    sub_1DDCAB1D4();
  }
  else
  {
    if (v11 > v10)
    {
      sub_1DDCAB870();
      goto LABEL_12;
    }
    sub_1DDCABB14();
  }
  uint64_t v12 = *v3;
  sub_1DDC6BCC4(&qword_1EBE9E400, MEMORY[0x1E4F27990]);
  uint64_t v13 = sub_1DDCB4B00();
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
      sub_1DDC6BCC4((unint64_t *)&unk_1EBE9E408, MEMORY[0x1E4F27990]);
      char v21 = sub_1DDCB4B20();
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
  uint64_t result = sub_1DDCB4F10();
  __break(1u);
  return result;
}

void *sub_1DDCAB870()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1DDCB4920();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBE9E528);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_1DDCB4D70();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_27:
    *uint64_t v1 = v8;
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

uint64_t sub_1DDCABB14()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1DDCB4920();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBE9E528);
  uint64_t v7 = sub_1DDCB4D80();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v8;
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
    sub_1DDC6BCC4(&qword_1EBE9E400, MEMORY[0x1E4F27990]);
    uint64_t result = sub_1DDCB4B00();
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

uint64_t sub_1DDCABEC4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v30 = a1;
  uint64_t v7 = sub_1DDCB4A40();
  uint64_t v8 = MEMORY[0x1F4188790](v7);
  uint64_t v41 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x1F4188790](v8);
  int64_t v36 = (char *)&v28 - v11;
  uint64_t result = MEMORY[0x1F4188790](v10);
  uint64_t v35 = (char *)&v28 - v14;
  uint64_t v39 = a3;
  uint64_t v29 = a2;
  if (a3 != a2)
  {
    int64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
    uint64_t v15 = v13 + 16;
    uint64_t v17 = *(void *)(v15 + 56);
    uint64_t v32 = (void (**)(char *, uint64_t))(v15 - 8);
    uint64_t v33 = v16;
    uint64_t v34 = v15;
    int64_t v40 = (void (**)(char *, uint64_t, uint64_t))(v15 + 16);
    uint64_t v37 = v17;
    uint64_t v38 = v17 * (v39 - 1);
    uint64_t v42 = v17 * v39;
    BOOL v31 = a4;
LABEL_5:
    uint64_t v18 = 0;
    uint64_t v19 = v30;
    while (1)
    {
      int64_t v20 = v35;
      v33(v35, v42 + v18 + *a4, v7);
      unint64_t v21 = v36;
      sub_1DDCB49A0();
      char v22 = sub_1DDCB49C0();
      uint64_t v23 = *v32;
      uint64_t v24 = v21;
      a4 = v31;
      (*v32)(v24, v7);
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v23)(v20, v7);
      if ((v22 & 1) == 0)
      {
LABEL_4:
        v38 += v37;
        ++v39;
        v42 += v37;
        if (v39 == v29) {
          return result;
        }
        goto LABEL_5;
      }
      uint64_t v25 = *a4;
      if (!*a4) {
        break;
      }
      uint64_t v26 = v38 + v18 + v25;
      unint64_t v27 = *v40;
      (*v40)(v41, v25 + v42 + v18, v7);
      swift_arrayInitWithTakeFrontToBack();
      uint64_t result = ((uint64_t (*)(uint64_t, char *, uint64_t))v27)(v26, v41, v7);
      ++v19;
      v18 -= v37;
      if (v39 == v19) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_1DDCAC188(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v61 = a3;
  uint64_t v7 = sub_1DDCB4A40();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v7);
  unint64_t v62 = (char *)&v55 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  unint64_t v12 = (char *)&v55 - v11;
  uint64_t v14 = *(void *)(v13 + 72);
  if (!v14)
  {
    __break(1u);
LABEL_71:
    __break(1u);
LABEL_72:
    __break(1u);
    goto LABEL_73;
  }
  if (a2 - a1 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_71;
  }
  int64_t v15 = v61 - a2;
  if (v61 - a2 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_72;
  }
  uint64_t v16 = (uint64_t)(a2 - a1) / v14;
  unint64_t v65 = a1;
  unint64_t v64 = a4;
  uint64_t v17 = v15 / v14;
  if (v16 >= v15 / v14)
  {
    if ((v17 & 0x8000000000000000) == 0)
    {
      uint64_t v20 = v17 * v14;
      if (a4 < a2 || a2 + v20 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
        uint64_t v21 = v8;
      }
      else
      {
        uint64_t v21 = v8;
        if (a4 != a2) {
          swift_arrayInitWithTakeBackToFront();
        }
      }
      unint64_t v32 = a4 + v20;
      unint64_t v63 = a4 + v20;
      unint64_t v65 = a2;
      BOOL v33 = v20 < 1 || a1 >= a2;
      unint64_t v34 = v61;
      if (!v33)
      {
        uint64_t v35 = -v14;
        uint64_t v37 = *(void (**)(char *, unint64_t, uint64_t))(v21 + 16);
        unint64_t v36 = v21 + 16;
        uint64_t v58 = (void (**)(char *, uint64_t))(v36 - 8);
        BOOL v59 = v37;
        unint64_t v56 = a1;
        unint64_t v57 = a4;
        unint64_t v60 = v36;
        do
        {
          unint64_t v61 = a2;
          unint64_t v38 = v34 + v35;
          unint64_t v39 = v34;
          v59(v12, v32 + v35, v7);
          uint64_t v40 = v35;
          uint64_t v41 = v7;
          uint64_t v42 = v12;
          uint64_t v43 = v62;
          sub_1DDCB49A0();
          char v44 = sub_1DDCB49C0();
          uint64_t v45 = *v58;
          uint64_t v46 = v43;
          unint64_t v12 = v42;
          uint64_t v7 = v41;
          (*v58)(v46, v41);
          v45(v12, v41);
          if (v44)
          {
            unint64_t v47 = v61 + v40;
            uint64_t v35 = v40;
            unint64_t v48 = v38;
            if (v39 < v61 || v38 >= v61)
            {
              swift_arrayInitWithTakeFrontToBack();
              unint64_t v51 = v56;
              unint64_t v50 = v57;
            }
            else
            {
              BOOL v49 = v39 == v61;
              unint64_t v51 = v56;
              unint64_t v50 = v57;
              if (!v49) {
                swift_arrayInitWithTakeBackToFront();
              }
            }
            v65 += v35;
          }
          else
          {
            unint64_t v52 = v63;
            v63 += v40;
            BOOL v53 = v39 < v52 || v38 >= v52;
            uint64_t v35 = v40;
            unint64_t v48 = v38;
            if (v53)
            {
              swift_arrayInitWithTakeFrontToBack();
              unint64_t v47 = v61;
            }
            else
            {
              unint64_t v47 = v61;
              if (v39 != v52) {
                swift_arrayInitWithTakeBackToFront();
              }
            }
            unint64_t v51 = v56;
            unint64_t v50 = v57;
          }
          unint64_t v32 = v63;
          if (v63 <= v50) {
            break;
          }
          a2 = v47;
          unint64_t v34 = v48;
        }
        while (v47 > v51);
      }
      goto LABEL_69;
    }
  }
  else if ((v16 & 0x8000000000000000) == 0)
  {
    uint64_t v18 = v16 * v14;
    if (a4 < a1 || a1 + v18 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
      uint64_t v19 = v8;
    }
    else
    {
      uint64_t v19 = v8;
      if (a4 != a1) {
        swift_arrayInitWithTakeBackToFront();
      }
    }
    unint64_t v60 = a4 + v18;
    unint64_t v63 = a4 + v18;
    if (v18 >= 1 && a2 < v61)
    {
      BOOL v59 = *(void (**)(char *, unint64_t, uint64_t))(v19 + 16);
      uint64_t v23 = (void (**)(char *, uint64_t))(v19 + 8);
      uint64_t v24 = v62;
      do
      {
        v59(v12, a2, v7);
        sub_1DDCB49A0();
        char v25 = sub_1DDCB49C0();
        uint64_t v26 = *v23;
        (*v23)(v24, v7);
        v26(v12, v7);
        unint64_t v27 = v65;
        if (v25)
        {
          unint64_t v28 = a2 + v14;
          if (v65 < a2 || v65 >= v28)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v65 == a2)
          {
            unint64_t v27 = a2;
          }
          else
          {
            swift_arrayInitWithTakeBackToFront();
          }
        }
        else
        {
          unint64_t v30 = v64 + v14;
          if (v65 < v64 || v65 >= v30)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v65 != v64)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          unint64_t v64 = v30;
          unint64_t v28 = a2;
        }
        unint64_t v65 = v27 + v14;
        if (v64 >= v60) {
          break;
        }
        a2 = v28;
      }
      while (v28 < v61);
    }
LABEL_69:
    sub_1DDCAC6FC(&v65, &v64, (uint64_t *)&v63);
    return 1;
  }
LABEL_73:
  uint64_t result = sub_1DDCB4EA0();
  __break(1u);
  return result;
}

uint64_t sub_1DDCAC6FC(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  uint64_t v5 = *a3;
  uint64_t result = sub_1DDCB4A40();
  uint64_t v7 = *(void *)(*(void *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v8 = v5 - v4;
  if (v5 - v4 == 0x8000000000000000 && v7 == -1) {
    goto LABEL_18;
  }
  if (v8 / v7 < 0)
  {
LABEL_19:
    uint64_t result = sub_1DDCB4EA0();
    __break(1u);
    return result;
  }
  if (v3 < v4 || v3 >= v4 + v8 / v7 * v7)
  {
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (v3 != v4)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

char *sub_1DDCAC83C(uint64_t a1)
{
  return sub_1DDC6FA94(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_1DDCAC850(void *a1)
{
  return sub_1DDCAAC70(0, a1[2], 0, a1);
}

uint64_t sub_1DDCAC864()
{
  unint64_t v0 = sub_1DDCB4EE0();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

id sub_1DDCAC8B0(void *a1)
{
  uint64_t v3 = sub_1DDCB4970();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = v1;
  id v8 = a1;
  sub_1DDCB4980();
  (*(void (**)(unsigned char *, char *, uint64_t))(v4 + 32))(&v7[OBJC_IVAR___QLThumbnailExtension_identity], v6, v3);
  id v9 = objc_msgSend(v8, sel_bundleIdentifier);
  uint64_t v10 = sub_1DDCB4B60();
  uint64_t v12 = v11;

  uint64_t v13 = (uint64_t *)&v7[OBJC_IVAR___QLThumbnailExtension_generatorIdentifier];
  *uint64_t v13 = v10;
  v13[1] = v12;
  id v14 = objc_msgSend(v8, sel_bundleVersion);
  uint64_t v15 = sub_1DDCB4B60();
  uint64_t v17 = v16;

  uint64_t v18 = (uint64_t *)&v7[OBJC_IVAR___QLThumbnailExtension_generatorVersion];
  *uint64_t v18 = v15;
  v18[1] = v17;
  uint64_t v19 = *MEMORY[0x1E4F94610];
  sub_1DDCA2014(0, (unint64_t *)&unk_1EBE9E500);
  id v20 = objc_msgSend(v8, sel_entitlementNamed_ofClass_, v19, swift_getObjCClassFromMetadata());
  sub_1DDCB4D30();
  swift_unknownObjectRelease();
  if (swift_dynamicCast())
  {
    id v21 = v43;
    unsigned __int8 v22 = objc_msgSend(v43, sel_BOOLValue);
  }
  else
  {
    unsigned __int8 v22 = 0;
  }
  v7[OBJC_IVAR___QLThumbnailExtension_externalResourcesAccessAllowed] = v22;
  uint64_t v23 = sub_1DDCB4B60();
  char v25 = sub_1DDCA22CC(v23, v24);
  swift_bridgeObjectRelease();
  v7[OBJC_IVAR___QLThumbnailExtension_supportsInteractiveThumbnailBadges] = v25 & 1;
  uint64_t v26 = sub_1DDCB4B60();
  sub_1DDCA24A8(v26, v27);
  uint64_t v29 = v28;
  swift_bridgeObjectRelease();
  if (v29)
  {
    unint64_t v30 = sub_1DDCB4EE0();
    swift_bridgeObjectRelease();
    if (v30 >= 3) {
      char v31 = 1;
    }
    else {
      char v31 = v30;
    }
  }
  else
  {
    char v31 = 1;
  }
  v7[OBJC_IVAR___QLThumbnailExtension_supportedConcurrencyLevel] = v31;
  uint64_t v32 = sub_1DDCB4B60();
  uint64_t v34 = sub_1DDCA2684(v32, v33);
  char v36 = v35;
  swift_bridgeObjectRelease();
  double v37 = (double)v34;
  if (v36) {
    double v37 = 0.0;
  }
  *(double *)&v7[OBJC_IVAR___QLThumbnailExtension_minimumThumbnailDimension] = v37;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBE9E638);
  uint64_t v38 = swift_allocObject();
  *(_DWORD *)(v38 + 24) = 0;
  *(void *)(v38 + 16) = 0;
  *(void *)&v7[OBJC_IVAR___QLThumbnailExtension_queueLock] = v38;

  unint64_t v39 = (objc_class *)type metadata accessor for ThumbnailExtension(0);
  v42.receiver = v7;
  v42.super_class = v39;
  return objc_msgSendSuper2(&v42, sel_init);
}

uint64_t sub_1DDCACBF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ThumbnailExtensionMonitor.Predicate(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DDCACC58()
{
  uint64_t v1 = *(void **)(v0 + 16);
  if (v1 != (void *)1) {

  }
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1DDCACC98(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_1DDCACCA8()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1DDCACCE0()
{
  return sub_1DDCA3B40(*(void *)(v0 + 16));
}

uint64_t sub_1DDCACCE8()
{
  swift_unknownObjectRelease();

  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1DDCACD28(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_1DDCA1A88;
  return sub_1DDCA3C84(a1, v4, v5, v6);
}

uint64_t sub_1DDCACDDC()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1DDCACE14(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1DDCA1A88;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1EAB91DA8 + dword_1EAB91DA8);
  return v6(a1, v4);
}

uint64_t sub_1DDCACECC()
{
  return sub_1DDCA43D4(*(void *)(v0 + 16));
}

void sub_1DDCACEEC(void *a1@<X8>)
{
}

void traceSQL_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_1DDC5E000, v0, v1, "SQL %s", v2, v3, v4, v5, v6);
}

void traceSQL_cold_2(void *a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a1;
  uint8_t v6 = [a2 tracingPrefix];
  OUTLINED_FUNCTION_4();
  __int16 v8 = 2080;
  uint64_t v9 = a3;
  _os_log_debug_impl(&dword_1DDC5E000, v5, OS_LOG_TYPE_DEBUG, "SQL %@ %s", v7, 0x16u);
}

uint64_t __getUIImageClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return _UIGraphicsBeginImageContextWithOptions_cold_1(v0);
}

uint64_t _UIGraphicsBeginImageContextWithOptions_cold_1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return __48__QLExtensionHostContextThumbnailOperation_main__block_invoke_cold_1(v0);
}

uint64_t sub_1DDCB4850()
{
  return MEMORY[0x1F40E3618]();
}

uint64_t sub_1DDCB4860()
{
  return MEMORY[0x1F40E3620]();
}

uint64_t sub_1DDCB48D0()
{
  return MEMORY[0x1F40E44F8]();
}

uint64_t sub_1DDCB48E0()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1DDCB48F0()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1DDCB4900()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1DDCB4910()
{
  return MEMORY[0x1F40E53F8]();
}

uint64_t sub_1DDCB4920()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1DDCB4930()
{
  return MEMORY[0x1F40E08C0]();
}

uint64_t sub_1DDCB4940()
{
  return MEMORY[0x1F40E08C8]();
}

uint64_t sub_1DDCB4950()
{
  return MEMORY[0x1F40E0978]();
}

uint64_t sub_1DDCB4960()
{
  return MEMORY[0x1F40E0998]();
}

uint64_t sub_1DDCB4970()
{
  return MEMORY[0x1F40E09A0]();
}

uint64_t sub_1DDCB4980()
{
  return MEMORY[0x1F40E09A8]();
}

uint64_t sub_1DDCB4990()
{
  return MEMORY[0x1F4187858]();
}

uint64_t sub_1DDCB49A0()
{
  return MEMORY[0x1F4187890]();
}

uint64_t sub_1DDCB49B0()
{
  return MEMORY[0x1F41878C8]();
}

uint64_t sub_1DDCB49C0()
{
  return MEMORY[0x1F41878E8]();
}

uint64_t sub_1DDCB49D0()
{
  return MEMORY[0x1F41878F8]();
}

uint64_t sub_1DDCB49E0()
{
  return MEMORY[0x1F4187910]();
}

uint64_t sub_1DDCB49F0()
{
  return MEMORY[0x1F4187920]();
}

uint64_t sub_1DDCB4A00()
{
  return MEMORY[0x1F4187958]();
}

uint64_t sub_1DDCB4A10()
{
  return MEMORY[0x1F41879A0]();
}

uint64_t sub_1DDCB4A20()
{
  return MEMORY[0x1F41879E0]();
}

uint64_t sub_1DDCB4A30()
{
  return MEMORY[0x1F4187A08]();
}

uint64_t sub_1DDCB4A40()
{
  return MEMORY[0x1F4187A18]();
}

uint64_t sub_1DDCB4A50()
{
  return MEMORY[0x1F4187A20]();
}

uint64_t sub_1DDCB4A60()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1DDCB4A70()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1DDCB4A80()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1DDCB4A90()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1DDCB4AA0()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1DDCB4AB0()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1DDCB4AC0()
{
  return MEMORY[0x1F4186EF8]();
}

uint64_t sub_1DDCB4AD0()
{
  return MEMORY[0x1F4186F40]();
}

uint64_t sub_1DDCB4AE0()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1DDCB4AF0()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1DDCB4B00()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1DDCB4B10()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t sub_1DDCB4B20()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1DDCB4B30()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1DDCB4B40()
{
  return MEMORY[0x1F40E61B8]();
}

uint64_t sub_1DDCB4B50()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_1DDCB4B60()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1DDCB4B70()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1DDCB4B80()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1DDCB4B90()
{
  return MEMORY[0x1F4183A78]();
}

uint64_t sub_1DDCB4BA0()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1DDCB4BB0()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1DDCB4BC0()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1DDCB4BD0()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1DDCB4BE0()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1DDCB4BF0()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1DDCB4C00()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t sub_1DDCB4C10()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1DDCB4C20()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1DDCB4C30()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1DDCB4C40()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1DDCB4C50()
{
  return MEMORY[0x1F4187D50]();
}

uint64_t sub_1DDCB4C70()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_1DDCB4C80()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1DDCB4C90()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1DDCB4CA0()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1DDCB4CB0()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1DDCB4CC0()
{
  return MEMORY[0x1F41870D8]();
}

uint64_t sub_1DDCB4CD0()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1DDCB4CE0()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1DDCB4CF0()
{
  return MEMORY[0x1F40D9730]();
}

uint64_t sub_1DDCB4D00()
{
  return MEMORY[0x1F41874E0]();
}

uint64_t sub_1DDCB4D10()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1DDCB4D20()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1DDCB4D30()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1DDCB4D40()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1DDCB4D50()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1DDCB4D60()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1DDCB4D70()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1DDCB4D80()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1DDCB4D90()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1DDCB4DA0()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1DDCB4DB0()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1DDCB4DC0()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1DDCB4DD0()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1DDCB4DE0()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1DDCB4DF0()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1DDCB4E00()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_1DDCB4E10()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1DDCB4E20()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1DDCB4E30()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1DDCB4E40()
{
  return MEMORY[0x1F41851D8]();
}

uint64_t sub_1DDCB4E50()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1DDCB4E60()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1DDCB4E70()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1DDCB4E80()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1DDCB4E90()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1DDCB4EA0()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1DDCB4EB0()
{
  return MEMORY[0x1F40E6DE0]();
}

uint64_t sub_1DDCB4ED0()
{
  return MEMORY[0x1F41854A0]();
}

uint64_t sub_1DDCB4EE0()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1DDCB4EF0()
{
  return MEMORY[0x1F4185740]();
}

uint64_t sub_1DDCB4F00()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1DDCB4F10()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1DDCB4F20()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1DDCB4F50()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1DDCB4F60()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1DDCB4F70()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1DDCB4F80()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1DDCB4F90()
{
  return MEMORY[0x1F4185ED0]();
}

uint64_t sub_1DDCB4FA0()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1F40D71C8](theArray, range.location, range.length, value);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFRunLoopAddCommonMode(CFRunLoopRef rl, CFRunLoopMode mode)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B0]();
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x1F40D8128](mode, returnAfterSourceHandled, seconds);
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F40D8140](allocator, order, context);
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x1F40D8558](string, buffer, maxBufLen);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1F40D8848](allocator, buffer, bufLen, isDirectory);
}

CFURLEnumeratorRef CFURLEnumeratorCreateForMountedVolumes(CFAllocatorRef alloc, CFURLEnumeratorOptions option, CFArrayRef propertyKeys)
{
  return (CFURLEnumeratorRef)MEMORY[0x1F40D88D0](alloc, option, propertyKeys);
}

CFURLEnumeratorResult CFURLEnumeratorGetNextURL(CFURLEnumeratorRef enumerator, CFURLRef *url, CFErrorRef *error)
{
  return MEMORY[0x1F40D88E0](enumerator, url, error);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x1F40D8908](url, resolveAgainstBase, buffer, maxBufLen);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1F40D9818](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x1F40D9868](context);
}

BOOL CGColorSpaceIsWideGamutRGB(CGColorSpaceRef a1)
{
  return MEMORY[0x1F40D9C40](a1);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextBeginPath(CGContextRef c)
{
}

void CGContextClip(CGContextRef c)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetRGBFillColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
}

void CGContextSetRGBStrokeColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

CFDataRef CGDataProviderCopyData(CGDataProviderRef provider)
{
  return (CFDataRef)MEMORY[0x1F40DA2E8](provider);
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA300](data);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1F40DA868](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(void *)&bitmapInfo, provider);
}

uint64_t CGImageCreateFromIOSurface()
{
  return MEMORY[0x1F40E96E0]();
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9738](data, type, count, options);
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9758](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1F40E9760](idst);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA920](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1F40DA948](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1F40DA9B8](image);
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1F40DAA98](image);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1F40E9968](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E9998](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E99C8](url, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x1F40E99F8](isrc);
}

uint64_t CGPathCreateWithContinuousRoundedRect()
{
  return MEMORY[0x1F40DB090]();
}

void CGPathRelease(CGPathRef path)
{
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

uint64_t GSLibraryResolveDocumentId2()
{
  return MEMORY[0x1F411BB40]();
}

uint64_t LICreateIconFromCachedBitmap()
{
  return MEMORY[0x1F412F8C8]();
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E7110]();
}

void NSLog(NSString *format, ...)
{
}

void *__cdecl NSMapGet(NSMapTable *table, const void *key)
{
  return (void *)MEMORY[0x1F40E7180](table, key);
}

void NSMapInsert(NSMapTable *table, const void *key, const void *value)
{
}

void NSMapRemove(NSMapTable *table, const void *key)
{
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

uint64_t QLAdaptSizeInSize()
{
  return MEMORY[0x1F4147680]();
}

uint64_t QLAdaptSizeToRectWithRounding2()
{
  return MEMORY[0x1F4147688]();
}

uint64_t QLCGImageRefPNGRepresentation()
{
  return MEMORY[0x1F40F4DF8]();
}

uint64_t QLCheckIsPlatformWithExtensionAuditToken()
{
  return MEMORY[0x1F4147690]();
}

uint64_t QLCreateCGImageWithDataAndFormat()
{
  return MEMORY[0x1F40F4E00]();
}

uint64_t QLDrawLockIcon()
{
  return MEMORY[0x1F4147698]();
}

uint64_t QLGetCGPDFPageProxyRect()
{
  return MEMORY[0x1F41476A8]();
}

uint64_t QLGetDrawRectFromPageRectWithMinimumDimension()
{
  return MEMORY[0x1F41476B0]();
}

uint64_t QLImageCreateForDefaultThumbnailGenerationFromData()
{
  return MEMORY[0x1F40F4E08]();
}

uint64_t QLSInitLogging()
{
  return MEMORY[0x1F41476C8]();
}

uint64_t QLSThumbnailSizeIsSufficientForLowQuality()
{
  return MEMORY[0x1F41476D0]();
}

uint64_t QLTCreateCGContext()
{
  return MEMORY[0x1F40F4E10]();
}

uint64_t QLTGetDefaultCacheLocation()
{
  return MEMORY[0x1F40F4E18]();
}

uint64_t QLTInitLogging()
{
  return MEMORY[0x1F40F4E20]();
}

uint64_t QLThumbnailingImageIOCreateImageSourceFromData()
{
  return MEMORY[0x1F41476D8]();
}

uint64_t QLThumbnailingImageIOCreateThumbnailOfMinimumSizeWithImageSource()
{
  return MEMORY[0x1F41476E0]();
}

uint64_t QLThumbnailingImageIOGetSizeFromImageSourceAtIndex()
{
  return MEMORY[0x1F41476E8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFURLPromiseCopyPhysicalURL()
{
  return MEMORY[0x1F40D9368]();
}

uint64_t _FPRestorePersona()
{
  return MEMORY[0x1F40E0C40]();
}

uint64_t _QLSAppPreferencesIntValueForKey()
{
  return MEMORY[0x1F41476F0]();
}

uint64_t _QLThumbnailComputeBaselineFromData()
{
  return MEMORY[0x1F41476F8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x1F40C9CD0]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1F40C9CD8]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1F40C9F70](dso, description, activity, *(void *)&flags);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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
  return MEMORY[0x1F415B160]();
}

uint64_t _sqlite3_db_truncate()
{
  return MEMORY[0x1F4181F40]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

uint64_t container_create_or_lookup_path_for_current_user()
{
  return MEMORY[0x1F40CB580]();
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_block_cancel(dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C0](flags, block);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1F40CBA10](buffer, size, queue, destructor);
}

dispatch_data_t dispatch_data_create_subrange(dispatch_data_t data, size_t offset, size_t length)
{
  return (dispatch_data_t)MEMORY[0x1F40CBA38](data, offset, length);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

void exit(int a1)
{
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1F40CC058](*(void *)&a1, *(void *)&a2);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1F40CC0D8](*(void *)&a1, a2, a3, *(void *)&a4);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1F40CC1C0](__filename, __mode);
}

uint64_t fp_current_or_default_log()
{
  return MEMORY[0x1F40E0C70]();
}

void free(void *a1)
{
}

ssize_t fsgetpath(char *a1, size_t a2, fsid_t *a3, uint64_t a4)
{
  return MEMORY[0x1F40CC2B0](a1, a2, a3, a4);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1F40CC2F0](*(void *)&a1, a2);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1F40CC360](a1, a2, a3, a4, *(void *)&a5);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CC900](a1, a2);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

int mkstemps(char *a1, int a2)
{
  return MEMORY[0x1F40CCE18](a1, *(void *)&a2);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1F40CCE40](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int msync(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1F40CCE78](a1, a2, *(void *)&a3);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1F40CCE88](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

void objc_terminate(void)
{
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1F40CD558](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

uint64_t rootless_check_datavault_flag()
{
  return MEMORY[0x1F40CDD98]();
}

uint64_t rootless_convert_to_datavault()
{
  return MEMORY[0x1F40CDDA8]();
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181F90](a1, *(void *)&a2, a3, *(void *)&n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x1F4181FA8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x1F4181FB0](a1, *(void *)&a2, *(void *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x1F4181FB8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x1F4181FC0](a1, *(void *)&a2);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181FE8](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1F4182060](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1F4182070](a1, *(void *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F4182078](a1, *(void *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F4182088](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  MEMORY[0x1F4182098](a1, *(void *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820A0](a1, *(void *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820A8](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return (const char *)MEMORY[0x1F41820B0](a1, *(void *)&N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1F41820C8](a1, *(void *)&iCol);
}

int sqlite3_errcode(sqlite3 *db)
{
  return MEMORY[0x1F4182190](db);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1F4182198](a1);
}

const char *__cdecl sqlite3_errstr(int a1)
{
  return (const char *)MEMORY[0x1F41821A0](*(void *)&a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1F41821A8](a1, sql, callback, a4, errmsg);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41821D8](pStmt);
}

void sqlite3_free(void *a1)
{
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return MEMORY[0x1F4182230](a1);
}

int sqlite3_open(const char *filename, sqlite3 **ppDb)
{
  return MEMORY[0x1F4182278](filename, ppDb);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1F4182290](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41822C0](pStmt);
}

const char *__cdecl sqlite3_sql(sqlite3_stmt *pStmt)
{
  return (const char *)MEMORY[0x1F41823A0](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1F41823B0](a1);
}

int sqlite3_trace_v2(sqlite3 *a1, unsigned int uMask, int (__cdecl *xCallback)(unsigned int, void *, void *, void *), void *pCtx)
{
  return MEMORY[0x1F41823F8](a1, *(void *)&uMask, xCallback, pCtx);
}

char *__cdecl sqlite3_vmprintf(const char *a1, va_list a2)
{
  return (char *)MEMORY[0x1F4182480](a1, a2);
}

int sqlite3_wal_checkpoint_v2(sqlite3 *db, const char *zDb, int eMode, int *pnLog, int *pnCkpt)
{
  return MEMORY[0x1F4182490](db, zDb, *(void *)&eMode, pnLog, pnCkpt);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1F40CE118](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1F40CE178](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1F4186420]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1F4186428]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1F41881F0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x1F4188208]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1F4186488]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1F4186790]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1F4188258]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

int unlink(const char *a1)
{
  return MEMORY[0x1F40CE5E0](a1);
}

kern_return_t vm_copy(vm_map_t target_task, vm_address_t source_address, vm_size_t size, vm_address_t dest_address)
{
  return MEMORY[0x1F40CE6B8](*(void *)&target_task, source_address, size, dest_address);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1F40CE6C0](*(void *)&target_task, address, size);
}

uint64_t voucher_process_can_use_arbitrary_personas()
{
  return MEMORY[0x1F40CE768]();
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x1F40CE990](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}