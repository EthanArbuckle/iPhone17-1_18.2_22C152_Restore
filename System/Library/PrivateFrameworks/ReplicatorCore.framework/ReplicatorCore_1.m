uint64_t sub_25B0EBB48@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  int v16;
  int v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  int v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;

  v41 = a2;
  v3 = sub_25B0F30E8();
  v42 = *(void *)(v3 - 8);
  v43 = v3;
  MEMORY[0x270FA5388](v3);
  v44 = (char *)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_25B0F2A18();
  v6 = *(void *)(v5 - 8);
  v7 = MEMORY[0x270FA5388](v5);
  v9 = (void **)((char *)&v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v7);
  v11 = (char *)&v41 - v10;
  v12 = sub_25B0F30D8();
  v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  v15 = (char *)&v41 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25B0F2F68();
  v16 = (*(uint64_t (**)(char *, uint64_t))(v13 + 88))(v15, v12);
  if (v16 == *MEMORY[0x263F64000])
  {
    (*(void (**)(void *, uint64_t, uint64_t))(v6 + 16))(v9, a1, v5);
    v17 = (*(uint64_t (**)(void *, uint64_t))(v6 + 88))(v9, v5);
    if (v17 == *MEMORY[0x263F63CC0])
    {
      (*(void (**)(void *, uint64_t))(v6 + 96))(v9, v5);
      v18 = v41;
      *v41 = *v9;
      v19 = *MEMORY[0x263F63B30];
      v20 = sub_25B0F2428();
      return (*(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v20 - 8) + 104))(v18, v19, v20);
    }
    if (v17 != *MEMORY[0x263F63CD0])
    {
      if (qword_26B33BF20 != -1) {
        swift_once();
      }
      v27 = sub_25B0F3708();
      __swift_project_value_buffer(v27, (uint64_t)qword_26B33CF20);
      v28 = sub_25B0F36E8();
      v29 = sub_25B0F3AD8();
      if (os_log_type_enabled(v28, v29))
      {
        v30 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v30 = 0;
        _os_log_impl(&dword_25B042000, v28, v29, "Unknown destination", v30, 2u);
        MEMORY[0x26115E470](v30, -1, -1);
      }

      (*(void (**)(char *, void, uint64_t))(v42 + 104))(v44, *MEMORY[0x263F64010], v43);
      sub_25B0F3108();
      sub_25B0F1B60((unint64_t *)&unk_26A4D7B50, MEMORY[0x263F64028]);
      swift_allocError();
      sub_25B0F30F8();
      swift_willThrow();
      return (*(uint64_t (**)(void *, uint64_t))(v6 + 8))(v9, v5);
    }
LABEL_23:
    v35 = *MEMORY[0x263F63B38];
    v36 = sub_25B0F2428();
    return (*(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v36 - 8) + 104))(v41, v35, v36);
  }
  if (v16 == *MEMORY[0x263F63FE8])
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v11, a1, v5);
    v22 = (*(uint64_t (**)(char *, uint64_t))(v6 + 88))(v11, v5);
    if (v22 == *MEMORY[0x263F63CC0])
    {
      (*(void (**)(char *, uint64_t))(v6 + 96))(v11, v5);
      swift_bridgeObjectRelease();
      if (qword_26B33BF20 != -1) {
        swift_once();
      }
      v23 = sub_25B0F3708();
      __swift_project_value_buffer(v23, (uint64_t)qword_26B33CF20);
      v24 = sub_25B0F36E8();
      v25 = sub_25B0F3AD8();
      if (os_log_type_enabled(v24, v25))
      {
        v26 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v26 = 0;
        MEMORY[0x26115E470](v26, -1, -1);
      }

      (*(void (**)(char *, void, uint64_t))(v42 + 104))(v44, *MEMORY[0x263F64010], v43);
      sub_25B0F3108();
      sub_25B0F1B60((unint64_t *)&unk_26A4D7B50, MEMORY[0x263F64028]);
      swift_allocError();
      sub_25B0F30F8();
      return swift_willThrow();
    }
    else
    {
      if (v22 == *MEMORY[0x263F63CD0]) {
        goto LABEL_23;
      }
      if (qword_26B33BF20 != -1) {
        swift_once();
      }
      v37 = sub_25B0F3708();
      __swift_project_value_buffer(v37, (uint64_t)qword_26B33CF20);
      v38 = sub_25B0F36E8();
      v39 = sub_25B0F3AD8();
      if (os_log_type_enabled(v38, v39))
      {
        v40 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v40 = 0;
        _os_log_impl(&dword_25B042000, v38, v39, "Unknown destination", v40, 2u);
        MEMORY[0x26115E470](v40, -1, -1);
      }

      (*(void (**)(char *, void, uint64_t))(v42 + 104))(v44, *MEMORY[0x263F64010], v43);
      sub_25B0F3108();
      sub_25B0F1B60((unint64_t *)&unk_26A4D7B50, MEMORY[0x263F64028]);
      swift_allocError();
      sub_25B0F30F8();
      swift_willThrow();
      return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v11, v5);
    }
  }
  else
  {
    if (qword_26B33BF20 != -1) {
      swift_once();
    }
    v31 = sub_25B0F3708();
    __swift_project_value_buffer(v31, (uint64_t)qword_26B33CF20);
    v32 = sub_25B0F36E8();
    v33 = sub_25B0F3AD8();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_25B042000, v32, v33, "Unknown publication method", v34, 2u);
      MEMORY[0x26115E470](v34, -1, -1);
    }

    (*(void (**)(char *, void, uint64_t))(v42 + 104))(v44, *MEMORY[0x263F64010], v43);
    sub_25B0F3108();
    sub_25B0F1B60((unint64_t *)&unk_26A4D7B50, MEMORY[0x263F64028]);
    swift_allocError();
    sub_25B0F30F8();
    swift_willThrow();
    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
}

uint64_t sub_25B0EC484(uint64_t a1, void (**a2)(char *, uint64_t), unint64_t a3)
{
  v64 = a2;
  v66[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v5 = sub_25B0F1D68();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  v9 = (char *)v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  v63 = (char *)v51 - v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B33BC18);
  MEMORY[0x270FA5388](v11 - 8);
  v54 = (char *)v51 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B33BF20 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_25B0F3708();
  uint64_t v14 = __swift_project_value_buffer(v13, (uint64_t)qword_26B33CF20);
  swift_bridgeObjectRetain_n();
  uint64_t v61 = v14;
  v15 = sub_25B0F36E8();
  os_log_type_t v16 = sub_25B0F3AD8();
  BOOL v17 = os_log_type_enabled(v15, v16);
  uint64_t v18 = MEMORY[0x263F8EE58];
  v62 = v9;
  if (v17)
  {
    v19 = (uint8_t *)swift_slowAlloc();
    uint64_t v20 = v6;
    v21 = (void *)swift_slowAlloc();
    v66[0] = v21;
    *(_DWORD *)v19 = 136446210;
    swift_bridgeObjectRetain();
    uint64_t v65 = sub_25B06D730((uint64_t)v64, a3, (uint64_t *)v66);
    v9 = v62;
    uint64_t v18 = MEMORY[0x263F8EE58];
    sub_25B0F3C28();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25B042000, v15, v16, "%{public}s", v19, 0xCu);
    swift_arrayDestroy();
    v22 = v21;
    uint64_t v6 = v20;
    MEMORY[0x26115E470](v22, -1, -1);
    MEMORY[0x26115E470](v19, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v23 = *(void *)(a1 + 16);
  v24 = v63;
  v51[2] = a1;
  if (v23)
  {
    v27 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
    uint64_t v26 = v6 + 16;
    v25 = v27;
    uint64_t v28 = v18;
    uint64_t v29 = a1 + ((*(unsigned __int8 *)(v26 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 64));
    uint64_t v30 = *(void *)(v26 + 56);
    v59 = (unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 32);
    v55 = (void (**)(char *, char *, uint64_t))(v26 + 16);
    uint64_t v56 = v30;
    v64 = (void (**)(char *, uint64_t))(v26 - 8);
    swift_bridgeObjectRetain();
    v60 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v26 + 40);
    v51[1] = (v26 + 40) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    *(void *)&long long v31 = 136446210;
    long long v52 = v31;
    v51[3] = v28 + 8;
    v32 = v54;
    uint64_t v53 = v26;
    v57 = v27;
    while (1)
    {
      v25(v32, v29, v5);
      v58 = *v60;
      v58(v32, 0, 1, v5);
      if ((*v59)(v32, 1, v5) == 1) {
        break;
      }
      (*v55)(v24, v32, v5);
      v25(v9, (uint64_t)v24, v5);
      v34 = sub_25B0F36E8();
      os_log_type_t v35 = sub_25B0F3AD8();
      if (os_log_type_enabled(v34, v35))
      {
        uint64_t v36 = v5;
        v37 = v9;
        uint64_t v38 = swift_slowAlloc();
        v39 = (void *)swift_slowAlloc();
        v66[0] = v39;
        *(_DWORD *)uint64_t v38 = v52;
        sub_25B0F1B60((unint64_t *)&qword_26B33BC10, MEMORY[0x263F06EA8]);
        uint64_t v40 = sub_25B0F3F08();
        *(void *)(v38 + 4) = sub_25B06D730(v40, v41, (uint64_t *)v66);
        swift_bridgeObjectRelease();
        v42 = *v64;
        v43 = v37;
        uint64_t v5 = v36;
        v32 = v54;
        (*v64)(v43, v5);
        _os_log_impl(&dword_25B042000, v34, v35, "Removing URL: %{public}s", (uint8_t *)v38, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x26115E470](v39, -1, -1);
        MEMORY[0x26115E470](v38, -1, -1);
      }
      else
      {
        v42 = *v64;
        (*v64)(v9, v5);
      }

      id v44 = objc_msgSend(self, sel_defaultManager);
      v24 = v63;
      v45 = (void *)sub_25B0F1CF8();
      v66[0] = 0;
      unsigned int v46 = objc_msgSend(v44, sel_removeItemAtURL_error_, v45, v66);

      if (v46)
      {
        id v33 = v66[0];
      }
      else
      {
        id v47 = v66[0];
        v48 = (void *)sub_25B0F1C98();

        swift_willThrow();
      }
      v25 = v57;
      v42(v24, v5);
      v29 += v56;
      --v23;
      v9 = v62;
      if (!v23)
      {
        v58(v32, 1, 1, v5);
        return swift_bridgeObjectRelease();
      }
    }
  }
  else
  {
    v49 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
    swift_bridgeObjectRetain();
    v49(v54, 1, 1, v5);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_25B0ECAE8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v33 = a1;
  uint64_t v2 = sub_25B0F2818();
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v31 = (uint64_t)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  v37 = (char *)v25 - v5;
  uint64_t v34 = sub_25B0F27A8();
  uint64_t v32 = *(void *)(v34 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v34);
  uint64_t v8 = (char *)v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v25 - v9;
  uint64_t v11 = sub_25B0F1E88();
  uint64_t v30 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_25B0F2838();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  BOOL v17 = (char *)v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = sub_25B0E7FB8((uint64_t)v17);
  if (!v1)
  {
    uint64_t v26 = v11;
    v27 = v8;
    uint64_t v28 = v15;
    uint64_t v29 = v14;
    uint64_t v19 = (uint64_t)v37;
    uint64_t v20 = v34;
    uint64_t v35 = sub_25B0F2D88();
    uint64_t v36 = v21;
    sub_25B0F2138();
    swift_bridgeObjectRelease();
    uint64_t v22 = sub_25B0F1E58();
    v25[1] = v23;
    v25[2] = v22;
    (*(void (**)(char *, uint64_t))(v30 + 8))(v13, v26);
    sub_25B0F2808();
    sub_25B0F2828();
    uint64_t v24 = v32;
    (*(void (**)(char *, char *, uint64_t))(v32 + 16))(v27, v10, v20);
    sub_25B0AF014(v19, v31);
    sub_25B0F27E8();
    sub_25B07587C(v19, MEMORY[0x263F63C28]);
    (*(void (**)(char *, uint64_t))(v24 + 8))(v10, v20);
    return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v17, v29);
  }
  return result;
}

uint64_t sub_25B0ECE6C(uint64_t *a1, uint64_t a2, void (*a3)(uint64_t, uint64_t, unint64_t), uint64_t a4, uint64_t *a5, uint64_t a6)
{
  uint64_t v28 = a6;
  uint64_t v29 = a4;
  uint64_t v30 = a3;
  uint64_t v34 = sub_25B0F30E8();
  uint64_t v31 = *(void *)(v34 - 8);
  MEMORY[0x270FA5388](v34);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_25B0F2DD8();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_25B0F3698();
  if (!v15)
  {
    uint64_t v20 = *a5;
    uint64_t v32 = 0;
    unint64_t v33 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    sub_25B0F3DB8();
    sub_25B0F3988();
    sub_25B0F3578();
    sub_25B0F1B60(&qword_26B33BE68, MEMORY[0x263F63EF8]);
    sub_25B0F3F08();
    sub_25B0F3988();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    v30(v20, v32, v33);
    goto LABEL_5;
  }
  uint64_t v16 = v15;
  uint64_t v26 = v14;
  v27 = v9;
  uint64_t v17 = sub_25B0F3678();
  if (v18 >> 60 == 15)
  {
    swift_bridgeObjectRelease();
    uint64_t v19 = *a5;
    uint64_t v32 = 0;
    unint64_t v33 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    sub_25B0F3DB8();
    sub_25B0F3988();
    sub_25B0F3578();
    sub_25B0F1B60(&qword_26B33BE68, MEMORY[0x263F63EF8]);
    sub_25B0F3F08();
    sub_25B0F3988();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    v30(v19, v32, v33);
    uint64_t v9 = v27;
LABEL_5:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, void, uint64_t))(v31 + 104))(v9, *MEMORY[0x263F64010], v34);
    sub_25B0F3108();
    sub_25B0F1B60((unint64_t *)&unk_26A4D7B50, MEMORY[0x263F64028]);
    swift_allocError();
    sub_25B0F30F8();
    return swift_willThrow();
  }
  uint64_t v22 = v17;
  unint64_t v23 = v18;
  sub_25B0888B4(v17, v18);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v32 = *a1;
  *a1 = 0x8000000000000000;
  sub_25B0C16E8(v22, v23, v26, v16, isUniquelyReferenced_nonNull_native);
  *a1 = v32;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return sub_25B0AEF84(v22, v23);
}

uint64_t sub_25B0ED2B4@<X0>(void *a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X8>)
{
  int v39 = a3;
  uint64_t v40 = a2;
  unint64_t v41 = a1;
  uint64_t v42 = a4;
  uint64_t v51 = *MEMORY[0x263EF8340];
  uint64_t v5 = sub_25B0F1CC8();
  v37 = *(void **)(v5 - 8);
  uint64_t v38 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = sub_25B0F1D68();
  uint64_t v47 = *(void *)(v43 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v43);
  uint64_t v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  id v44 = (char *)&v34 - v11;
  uint64_t v12 = sub_25B0F1E88();
  uint64_t v45 = *(void *)(v12 - 8);
  uint64_t v46 = v12;
  MEMORY[0x270FA5388](v12);
  v48 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_25B0F3708();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25B0F36D8();
  sub_25B0F36C8();
  unint64_t v18 = sub_25B0F36E8();
  os_log_type_t v19 = sub_25B0F3AF8();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v20 = 0;
    _os_log_impl(&dword_25B042000, v18, v19, "Ingesting file handle", v20, 2u);
    MEMORY[0x26115E470](v20, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  uint64_t v21 = v48;
  sub_25B0F1E78();
  sub_25B0B9600((uint64_t)v10);
  if (!v4)
  {
    uint64_t v49 = 0x7364726F636572;
    unint64_t v50 = 0xE700000000000000;
    unsigned int v36 = *MEMORY[0x263F06E50];
    unint64_t v23 = v37;
    uint64_t v22 = v38;
    uint64_t v35 = (void (*)(char *))v37[13];
    v35(v7);
    unint64_t v34 = sub_25B075990();
    sub_25B0F1D58();
    uint64_t v24 = (void (*)(char *, uint64_t))v23[1];
    v24(v7, v22);
    swift_bridgeObjectRelease();
    uint64_t v25 = *(void **)(v47 + 8);
    v47 += 8;
    v37 = v25;
    ((void (*)(char *, uint64_t))v25)(v10, v43);
    uint64_t v49 = sub_25B0F1E58();
    unint64_t v50 = v26;
    ((void (*)(char *, void, uint64_t))v35)(v7, v36, v22);
    uint64_t v27 = v42;
    sub_25B0F1D58();
    v24(v7, v22);
    swift_bridgeObjectRelease();
    uint64_t v28 = v41;
    if (v39) {
      sub_25B0F3A88();
    }
    else {
      sub_25B0F3A98();
    }
    uint64_t v49 = 0;
    if (objc_msgSend(v28, sel_closeAndReturnError_, &v49))
    {
      id v29 = (id)v49;
      ((void (*)(char *, uint64_t))v37)(v44, v43);
      return (*(uint64_t (**)(char *, uint64_t))(v45 + 8))(v48, v46);
    }
    id v31 = (id)v49;
    sub_25B0F1C98();

    swift_willThrow();
    uint64_t v32 = v43;
    unint64_t v33 = (void (*)(char *, uint64_t))v37;
    ((void (*)(uint64_t, uint64_t))v37)(v27, v43);
    v33(v44, v32);
    uint64_t v21 = v48;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v45 + 8))(v21, v46);
}

uint64_t sub_25B0ED81C()
{
  return sub_25B0ED85C("Deleting all records in %{public}s::%{public}s", (uint64_t (*)(char *))sub_25B098840);
}

uint64_t sub_25B0ED83C()
{
  return sub_25B0ED85C("Deleting all remotely owned records in %{public}s::%{public}s", (uint64_t (*)(char *))sub_25B098840);
}

uint64_t sub_25B0ED85C(const char *a1, uint64_t (*a2)(char *))
{
  uint64_t v5 = v2;
  uint64_t v6 = sub_25B0F2538();
  uint64_t v49 = *(void *)(v6 - 8);
  uint64_t v50 = v6;
  MEMORY[0x270FA5388](v6);
  v48 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25B0F2838();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_25B0F27A8();
  uint64_t v46 = *(void *)(v12 - 8);
  uint64_t v47 = v12;
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B33BF20 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_25B0F3708();
  uint64_t v16 = __swift_project_value_buffer(v15, (uint64_t)qword_26B33CF20);
  swift_retain_n();
  uint64_t v44 = v16;
  uint64_t v17 = sub_25B0F36E8();
  os_log_type_t v18 = sub_25B0F3AD8();
  BOOL v19 = os_log_type_enabled(v17, v18);
  uint64_t v51 = v14;
  if (v19)
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v52 = (uint64_t)a2;
    uint64_t v21 = v20;
    uint64_t v45 = swift_slowAlloc();
    v54[0] = v45;
    *(_DWORD *)uint64_t v21 = 136446466;
    uint64_t v43 = a1;
    uint64_t v22 = sub_25B0F3018();
    uint64_t v53 = sub_25B06D730(v22, v23, v54);
    sub_25B0F3C28();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v21 + 12) = 2082;
    uint64_t v24 = sub_25B0F2F98();
    uint64_t v53 = sub_25B06D730(v24, v25, v54);
    sub_25B0F3C28();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25B042000, v17, v18, v43, (uint8_t *)v21, 0x16u);
    uint64_t v26 = v45;
    swift_arrayDestroy();
    MEMORY[0x26115E470](v26, -1, -1);
    uint64_t v27 = v21;
    uint64_t v14 = v51;
    a2 = (uint64_t (*)(char *))v52;
    MEMORY[0x26115E470](v27, -1, -1);

    uint64_t v28 = (void *)&unk_26B33C000;
  }
  else
  {

    swift_release_n();
    uint64_t v28 = &unk_26B33C000;
  }
  sub_25B0F2F98();
  uint64_t v45 = v5 + v28[479];
  sub_25B0F3018();
  sub_25B0F2788();
  __swift_project_boxed_opaque_existential_5Tm((void *)(v5 + OBJC_IVAR____TtC14ReplicatorCore16ClientDataSource_recordDataStore), *(void *)(v5 + OBJC_IVAR____TtC14ReplicatorCore16ClientDataSource_recordDataStore + 24));
  uint64_t v52 = a2(v14);
  uint64_t v29 = *(void *)(v52 + 16);
  if (v29)
  {
    uint64_t v32 = *(void (**)(char *, unint64_t, uint64_t))(v9 + 16);
    uint64_t v30 = v9 + 16;
    id v31 = v32;
    unint64_t v33 = v52 + ((*(unsigned __int8 *)(v30 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v30 + 64));
    uint64_t v34 = *(void *)(v30 + 56);
    do
    {
      v31(v11, v33, v8);
      sub_25B0EDEFC((uint64_t)v11);
      (*(void (**)(char *, uint64_t))(v30 - 8))(v11, v8);
      v33 += v34;
      --v29;
    }
    while (v29);
  }
  __swift_project_boxed_opaque_existential_5Tm((void *)(v5 + OBJC_IVAR____TtC14ReplicatorCore16ClientDataSource_replicator), *(void *)(v5 + OBJC_IVAR____TtC14ReplicatorCore16ClientDataSource_replicator + 24));
  uint64_t v35 = v48;
  sub_25B0F2528();
  sub_25B0F2078();
  (*(void (**)(char *, uint64_t))(v49 + 8))(v35, v50);
  swift_bridgeObjectRelease();
  uint64_t v37 = v46;
  uint64_t v36 = v47;
  uint64_t v38 = v51;
  uint64_t v39 = *(void *)(v5 + OBJC_IVAR____TtC14ReplicatorCore16ClientDataSource_notificationPoster + 32);
  __swift_project_boxed_opaque_existential_5Tm((void *)(v5 + OBJC_IVAR____TtC14ReplicatorCore16ClientDataSource_notificationPoster), *(void *)(v5 + OBJC_IVAR____TtC14ReplicatorCore16ClientDataSource_notificationPoster + 24));
  uint64_t v40 = sub_25B0F2FE8();
  (*(void (**)(uint64_t))(v39 + 8))(v40);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v38, v36);
}

uint64_t sub_25B0EDEFC(uint64_t a1)
{
  v55[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v3 = sub_25B0F1D68();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v39 - v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B33BC18);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *(void *)(v1 + OBJC_IVAR____TtC14ReplicatorCore16ClientDataSource_recordDataStore + 24);
  uint64_t v40 = (void *)(v1 + OBJC_IVAR____TtC14ReplicatorCore16ClientDataSource_recordDataStore);
  __swift_project_boxed_opaque_existential_5Tm((void *)(v1 + OBJC_IVAR____TtC14ReplicatorCore16ClientDataSource_recordDataStore), v13);
  uint64_t v41 = a1;
  uint64_t v14 = sub_25B098820(a1);
  uint64_t v16 = *(void *)(v14 + 16);
  v39[1] = v14;
  if (v16)
  {
    uint64_t v53 = *(void (**)(char *, unint64_t, uint64_t))(v4 + 16);
    uint64_t v54 = v4 + 16;
    unint64_t v17 = v14 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    uint64_t v50 = *(void *)(v4 + 72);
    uint64_t v51 = (unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48);
    v48 = (void (**)(char *, uint64_t))(v4 + 8);
    uint64_t v49 = (void (**)(char *, char *, uint64_t))(v4 + 32);
    uint64_t v52 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56);
    v39[0] = (v4 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    *(void *)&long long v15 = 136446210;
    long long v44 = v15;
    uint64_t v42 = v9;
    uint64_t v43 = MEMORY[0x263F8EE58] + 8;
    uint64_t v47 = v12;
    v53(v12, v17, v3);
    while (1)
    {
      uint64_t v20 = *v52;
      (*v52)(v12, 0, 1, v3);
      if ((*v51)(v12, 1, v3) == 1) {
        goto LABEL_16;
      }
      (*v49)(v9, v12, v3);
      id v21 = objc_msgSend(self, sel_defaultManager);
      uint64_t v22 = (void *)sub_25B0F1CF8();
      v55[0] = 0;
      unint64_t v23 = v9;
      unsigned int v24 = objc_msgSend(v21, sel_removeItemAtURL_error_, v22, v55);

      if (v24) {
        break;
      }
      id v25 = v55[0];
      uint64_t v26 = (void *)sub_25B0F1C98();

      swift_willThrow();
      if (qword_26B33BF20 != -1) {
        swift_once();
      }
      uint64_t v27 = sub_25B0F3708();
      __swift_project_value_buffer(v27, (uint64_t)qword_26B33CF20);
      v53(v7, (unint64_t)v23, v3);
      uint64_t v28 = sub_25B0F36E8();
      uint64_t v29 = v7;
      os_log_type_t v30 = sub_25B0F3AD8();
      if (!os_log_type_enabled(v28, v30))
      {

        uint64_t v37 = *v48;
        (*v48)(v29, v3);
        v37(v23, v3);
        uint64_t v7 = v29;
        uint64_t v12 = v47;
        goto LABEL_4;
      }
      uint64_t v31 = swift_slowAlloc();
      id v46 = v26;
      uint64_t v32 = v31;
      uint64_t v45 = (void *)swift_slowAlloc();
      v55[0] = v45;
      *(_DWORD *)uint64_t v32 = v44;
      sub_25B0F1B60((unint64_t *)&qword_26B33BC10, MEMORY[0x263F06EA8]);
      uint64_t v33 = sub_25B0F3F08();
      *(void *)(v32 + 4) = sub_25B06D730(v33, v34, (uint64_t *)v55);
      swift_bridgeObjectRelease();
      uint64_t v35 = *v48;
      (*v48)(v29, v3);
      _os_log_impl(&dword_25B042000, v28, v30, "Failed to delete URL: %{public}s", (uint8_t *)v32, 0xCu);
      uint64_t v36 = v45;
      swift_arrayDestroy();
      MEMORY[0x26115E470](v36, -1, -1);
      MEMORY[0x26115E470](v32, -1, -1);

      uint64_t v9 = v42;
      v35(v42, v3);
      uint64_t v7 = v29;
      uint64_t v12 = v47;
LABEL_5:
      v17 += v50;
      if (!--v16)
      {
        v20(v12, 1, 1, v3);
        goto LABEL_16;
      }
      v53(v12, v17, v3);
    }
    os_log_type_t v18 = *v48;
    id v19 = v55[0];
    v18(v23, v3);
LABEL_4:
    uint64_t v9 = v23;
    goto LABEL_5;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v12, 1, 1, v3);
LABEL_16:
  swift_bridgeObjectRelease();
  __swift_project_boxed_opaque_existential_5Tm(v40, v40[3]);
  return sub_25B098620();
}

uint64_t sub_25B0EE470(uint64_t a1, uint64_t a2)
{
  uint64_t v85 = a2;
  uint64_t v86 = sub_25B0F2F18();
  uint64_t v84 = *(void *)(v86 - 8);
  MEMORY[0x270FA5388](v86);
  v83 = (char *)&v78 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v89 = sub_25B0F2538();
  uint64_t v88 = *(void *)(v89 - 8);
  MEMORY[0x270FA5388](v89);
  v87 = (char *)&v78 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_25B0F30E8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v78 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v106 = sub_25B0F27A8();
  uint64_t v9 = *(void *)(v106 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v106);
  v105 = (char *)&v78 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  v104 = (char *)&v78 - v12;
  uint64_t v13 = sub_25B0F2818();
  uint64_t v14 = MEMORY[0x270FA5388](v13 - 8);
  uint64_t v103 = (uint64_t)&v78 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  v112 = (char *)&v78 - v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v102 = (uint64_t)&v78 - v18;
  uint64_t v19 = sub_25B0F2838();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  v117 = (char *)&v78 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  v101 = (char *)&v78 - v24;
  MEMORY[0x270FA5388](v23);
  v116 = (char *)&v78 - v25;
  uint64_t v26 = sub_25B0F2DB8();
  uint64_t v27 = MEMORY[0x270FA5388](v26 - 8);
  v111 = (char *)&v78 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v27);
  v108 = (char *)&v78 - v29;
  uint64_t v109 = sub_25B0F2DD8();
  uint64_t v30 = *(void *)(v109 - 8);
  uint64_t v31 = MEMORY[0x270FA5388](v109);
  MEMORY[0x270FA5388](v31);
  unint64_t v34 = (char *)&v78 - v33;
  uint64_t v35 = *(void *)(a1 + 16);
  if (v35)
  {
    v81 = v32;
    uint64_t v78 = v6;
    uint64_t v79 = v5;
    v80 = v8;
    uint64_t v37 = *(void (**)(char *, uint64_t, uint64_t))(v30 + 16);
    uint64_t v36 = v30 + 16;
    v107 = v37;
    uint64_t v38 = a1 + ((*(unsigned __int8 *)(v36 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v36 + 64));
    v95 = (void (**)(char *, char *, uint64_t))(v9 + 16);
    v94 = (void (**)(char *, uint64_t))(v9 + 8);
    v115 = (void (**)(char *, char *, uint64_t))(v20 + 32);
    v93 = (void (**)(char *, uint64_t, uint64_t))(v20 + 16);
    uint64_t v92 = v20 + 8;
    v100 = (void (**)(char *, uint64_t))(v36 - 8);
    uint64_t v91 = *(void *)(v36 + 56);
    uint64_t v82 = a1;
    swift_bridgeObjectRetain();
    unint64_t v39 = MEMORY[0x263F8EE78];
    uint64_t v40 = v109;
    uint64_t v98 = v19;
    v99 = v34;
    uint64_t v97 = v20;
    uint64_t v96 = v36;
    while (1)
    {
      uint64_t v114 = v35;
      v107(v34, v38, v40);
      uint64_t v41 = (uint64_t)v108;
      sub_25B0F2DC8();
      char v42 = sub_25B0F2DA8();
      sub_25B07587C(v41, MEMORY[0x263F63EF0]);
      if ((v42 & 1) == 0) {
        break;
      }
      unint64_t v113 = v39;
      uint64_t v43 = v111;
      sub_25B0F2DC8();
      uint64_t v44 = sub_25B0F1E88();
      uint64_t v45 = *(void *)(v44 - 8);
      uint64_t v46 = 1;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v45 + 48))(v43, 1, v44) != 1)
      {
        (*(void (**)(char *, char *, uint64_t))(v45 + 32))(v112, v111, v44);
        uint64_t v46 = 0;
      }
      uint64_t v47 = (uint64_t)v112;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v45 + 56))(v112, v46, 1, v44);
      uint64_t v48 = v102;
      sub_25B0CF248(v47, v102);
      sub_25B0F2D98();
      sub_25B0F2D68();
      uint64_t v49 = v104;
      sub_25B0F2788();
      sub_25B0F2D88();
      uint64_t v50 = v106;
      (*v95)(v105, v49, v106);
      sub_25B0AF014(v48, v103);
      uint64_t v51 = v101;
      sub_25B0F27E8();
      (*v94)(v49, v50);
      sub_25B07587C(v48, MEMORY[0x263F63C28]);
      uint64_t v52 = (uint64_t)v116;
      uint64_t v53 = *v115;
      uint64_t v54 = v98;
      (*v115)(v116, v51, v98);
      sub_25B0EDEFC(v52);
      (*v93)(v117, v52, v54);
      unint64_t v39 = v113;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v39 = sub_25B06CE80(0, *(void *)(v39 + 16) + 1, 1, v39);
      }
      uint64_t v55 = v97;
      unint64_t v57 = *(void *)(v39 + 16);
      unint64_t v56 = *(void *)(v39 + 24);
      unint64_t v34 = v99;
      if (v57 >= v56 >> 1) {
        unint64_t v39 = sub_25B06CE80(v56 > 1, v57 + 1, 1, v39);
      }
      *(void *)(v39 + 16) = v57 + 1;
      v53((char *)(v39+ ((*(unsigned __int8 *)(v55 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v55 + 80))+ *(void *)(v55 + 72) * v57), v117, v54);
      (*(void (**)(char *, uint64_t))(v55 + 8))(v116, v54);
      uint64_t v40 = v109;
      (*v100)(v34, v109);
      v38 += v91;
      uint64_t v35 = v114 - 1;
      if (v114 == 1)
      {
        swift_bridgeObjectRelease();
        goto LABEL_17;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26B33BF20 != -1) {
      swift_once();
    }
    uint64_t v58 = sub_25B0F3708();
    __swift_project_value_buffer(v58, (uint64_t)qword_26B33CF20);
    v59 = v81;
    v107(v81, (uint64_t)v34, v40);
    v60 = sub_25B0F36E8();
    uint64_t v61 = v40;
    os_log_type_t v62 = sub_25B0F3AD8();
    if (os_log_type_enabled(v60, v62))
    {
      v63 = (uint8_t *)swift_slowAlloc();
      uint64_t v64 = swift_slowAlloc();
      uint64_t v119 = v64;
      *(_DWORD *)v63 = 136446210;
      v117 = (char *)(v63 + 4);
      sub_25B0F1B60(&qword_26B33BE68, MEMORY[0x263F63EF8]);
      uint64_t v65 = sub_25B0F3F08();
      uint64_t v118 = sub_25B06D730(v65, v66, &v119);
      sub_25B0F3C28();
      swift_bridgeObjectRelease();
      v67 = *v100;
      (*v100)(v59, v61);
      _os_log_impl(&dword_25B042000, v60, v62, "Cannot mutate a remotely-owned record: %{public}s", v63, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x26115E470](v64, -1, -1);
      MEMORY[0x26115E470](v63, -1, -1);
    }
    else
    {
      v67 = *v100;
      (*v100)(v59, v61);
    }

    (*(void (**)(char *, void, uint64_t))(v78 + 104))(v80, *MEMORY[0x263F64008], v79);
    sub_25B0F3108();
    sub_25B0F1B60((unint64_t *)&unk_26A4D7B50, MEMORY[0x263F64028]);
    swift_allocError();
    sub_25B0F30F8();
    swift_willThrow();
    return ((uint64_t (*)(char *, uint64_t))v67)(v34, v61);
  }
  else
  {
LABEL_17:
    v68 = v87;
    uint64_t v69 = v86;
    uint64_t v70 = v85;
    __swift_project_boxed_opaque_existential_5Tm((void *)(v110 + OBJC_IVAR____TtC14ReplicatorCore16ClientDataSource_replicator), *(void *)(v110 + OBJC_IVAR____TtC14ReplicatorCore16ClientDataSource_replicator + 24));
    uint64_t v71 = v84;
    v72 = v83;
    (*(void (**)(char *, uint64_t, uint64_t))(v84 + 16))(v83, v70, v69);
    int v73 = (*(uint64_t (**)(char *, uint64_t))(v71 + 88))(v72, v69);
    if (v73 == *MEMORY[0x263F63F60])
    {
      sub_25B0F2528();
    }
    else
    {
      if (v73 != *MEMORY[0x263F63F58])
      {
        uint64_t result = sub_25B0F3E78();
        __break(1u);
        return result;
      }
      sub_25B0F2518();
    }
    uint64_t v74 = v90;
    sub_25B0F2078();
    (*(void (**)(char *, uint64_t))(v88 + 8))(v68, v89);
    if (!v74)
    {
      swift_bridgeObjectRelease();
      uint64_t v75 = *(void *)(v110 + OBJC_IVAR____TtC14ReplicatorCore16ClientDataSource_notificationPoster + 32);
      __swift_project_boxed_opaque_existential_5Tm((void *)(v110 + OBJC_IVAR____TtC14ReplicatorCore16ClientDataSource_notificationPoster), *(void *)(v110 + OBJC_IVAR____TtC14ReplicatorCore16ClientDataSource_notificationPoster + 24));
      uint64_t v76 = sub_25B0F2FE8();
      (*(void (**)(uint64_t))(v75 + 8))(v76);
    }
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_25B0EF210()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC14ReplicatorCore16ClientDataSource_clientDescriptor;
  uint64_t v2 = sub_25B0F3028();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC14ReplicatorCore16ClientDataSource_zoneDescriptor;
  uint64_t v4 = sub_25B0F2FA8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  __swift_destroy_boxed_opaque_existential_0Tm(v0 + OBJC_IVAR____TtC14ReplicatorCore16ClientDataSource_recordDataStore);
  __swift_destroy_boxed_opaque_existential_0Tm(v0 + OBJC_IVAR____TtC14ReplicatorCore16ClientDataSource_notificationPoster);
  __swift_destroy_boxed_opaque_existential_0Tm(v0 + OBJC_IVAR____TtC14ReplicatorCore16ClientDataSource_replicator);
  return swift_deallocClassInstance();
}

uint64_t sub_25B0EF324()
{
  return type metadata accessor for ClientDataSource();
}

uint64_t type metadata accessor for ClientDataSource()
{
  uint64_t result = qword_26B33BCB8;
  if (!qword_26B33BCB8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25B0EF378()
{
  uint64_t result = sub_25B0F3028();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_25B0F2FA8();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_updateClassMetadata2();
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_25B0EF450@<X0>(uint64_t a1@<X1>, char *a2@<X3>, uint64_t a3@<X8>)
{
  v59 = a2;
  uint64_t v60 = a3;
  uint64_t v58 = sub_25B0F2838();
  uint64_t v52 = *(void *)(v58 - 8);
  MEMORY[0x270FA5388](v58);
  unint64_t v57 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = sub_25B0F21F8();
  uint64_t v54 = *(void *)(v56 - 8);
  MEMORY[0x270FA5388](v56);
  uint64_t v55 = (char *)&v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25B0F3138();
  uint64_t v50 = *(void *)(v7 - 8);
  uint64_t v51 = v7;
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v49 = (char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v48 = (char *)&v47 - v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B33BC18);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D8200);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v47 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_25B0F2898();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v47 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x270FA5388](v17);
  uint64_t v22 = (char *)&v47 - v21;
  MEMORY[0x270FA5388](v20);
  uint64_t v24 = (char *)&v47 - v23;
  uint64_t v53 = v3;
  __swift_project_boxed_opaque_existential_5Tm((void *)(v3 + OBJC_IVAR____TtC14ReplicatorCore16ClientDataSource_recordDataStore), *(void *)(v3 + OBJC_IVAR____TtC14ReplicatorCore16ClientDataSource_recordDataStore + 24));
  sub_25B098184(a1, v59, (uint64_t)v14);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v24, v14, v15);
    sub_25B0F2868();
    sub_25B0F2888();
    sub_25B0F2878();
    sub_25B0F2858();
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v19, v22, v15);
    uint64_t v36 = v48;
    sub_25B0F2F78();
    uint64_t v37 = v49;
    uint64_t v38 = v50;
    uint64_t v39 = v51;
    (*(void (**)(char *, char *, uint64_t))(v50 + 16))(v49, v36, v51);
    int v40 = (*(uint64_t (**)(char *, uint64_t))(v38 + 88))(v37, v39);
    if (v40 == *MEMORY[0x263F64048])
    {
      uint64_t v41 = (unsigned int *)MEMORY[0x263F63AF8];
      uint64_t v42 = v60;
    }
    else
    {
      uint64_t v42 = v60;
      if (v40 == *MEMORY[0x263F64050])
      {
        uint64_t v41 = (unsigned int *)MEMORY[0x263F63B00];
      }
      else
      {
        if (v40 != *MEMORY[0x263F64038])
        {
          uint64_t result = sub_25B0F3E78();
          __break(1u);
          return result;
        }
        uint64_t v41 = (unsigned int *)MEMORY[0x263F63AF0];
      }
    }
    (*(void (**)(char *, void, uint64_t))(v54 + 104))(v55, *v41, v56);
    (*(void (**)(char *, uint64_t))(v38 + 8))(v36, v39);
    sub_25B0F2588();
    uint64_t v45 = *(void (**)(char *, uint64_t))(v16 + 8);
    v45(v22, v15);
    v45(v24, v15);
    uint64_t v46 = sub_25B0F2598();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v46 - 8) + 56))(v42, 0, 1, v46);
  }
  sub_25B075D08((uint64_t)v14, &qword_26A4D8200);
  if (qword_26B33BF20 != -1) {
    swift_once();
  }
  uint64_t v25 = sub_25B0F3708();
  __swift_project_value_buffer(v25, (uint64_t)qword_26B33CF20);
  uint64_t v26 = v52;
  uint64_t v27 = v57;
  uint64_t v28 = v58;
  (*(void (**)(char *, uint64_t, uint64_t))(v52 + 16))(v57, a1, v58);
  uint64_t v29 = sub_25B0F36E8();
  os_log_type_t v30 = sub_25B0F3AD8();
  if (os_log_type_enabled(v29, v30))
  {
    uint64_t v31 = (uint8_t *)swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    uint64_t v62 = v32;
    *(_DWORD *)uint64_t v31 = 136446210;
    sub_25B0F1B60((unint64_t *)&qword_26A4D8108, MEMORY[0x263F63C30]);
    uint64_t v33 = sub_25B0F3F08();
    uint64_t v61 = sub_25B06D730(v33, v34, &v62);
    uint64_t v35 = v60;
    sub_25B0F3C28();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v27, v28);
    _os_log_impl(&dword_25B042000, v29, v30, "Can't find record for ID: %{public}s", v31, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x26115E470](v32, -1, -1);
    MEMORY[0x26115E470](v31, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v26 + 8))(v27, v28);

    uint64_t v35 = v60;
  }
  uint64_t v43 = sub_25B0F2598();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v43 - 8) + 56))(v35, 1, 1, v43);
}

void sub_25B0EFC38(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v7 = (void *)MEMORY[0x26115DE00]();
  sub_25B0EFCAC(a1, a2, v3, a3);
}

uint64_t sub_25B0EFCAC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v70 = a3;
  uint64_t v67 = a2;
  uint64_t v71 = a4;
  uint64_t v68 = sub_25B0F2238();
  uint64_t v69 = *(void *)(v68 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v68);
  unint64_t v66 = (char *)&v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v60 = (char *)&v56 - v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D8200);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v65 = (uint64_t)&v56 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v59 = (uint64_t)&v56 - v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D8208);
  MEMORY[0x270FA5388](v12 - 8);
  v63 = (char *)&v56 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_25B0F27A8();
  uint64_t v64 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v56 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = sub_25B0F2308();
  uint64_t v17 = *(void *)(v62 - 8);
  MEMORY[0x270FA5388](v62);
  uint64_t v19 = (char *)&v56 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_25B0F27D8();
  uint64_t v61 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (char *)&v56 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_25B0F2818();
  MEMORY[0x270FA5388](v23 - 8);
  uint64_t v25 = (char *)&v56 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25B0F2828();
  uint64_t v26 = sub_25B0F1E88();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v26 - 8) + 48))(v25, 1, v26) != 1)
  {
    unint64_t v34 = v66;
    sub_25B0F1EC8();
    __swift_project_boxed_opaque_existential_5Tm((void *)(v70 + OBJC_IVAR____TtC14ReplicatorCore16ClientDataSource_recordDataStore), *(void *)(v70 + OBJC_IVAR____TtC14ReplicatorCore16ClientDataSource_recordDataStore + 24));
    uint64_t v35 = v65;
    sub_25B098184(a1, v34, v65);
    (*(void (**)(char *, uint64_t))(v69 + 8))(v34, v68);
    uint64_t v36 = sub_25B0F2898();
    LODWORD(v34) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 48))(v35, 1, v36);
    sub_25B075D08(v35, &qword_26A4D8200);
    if (v34 == 1)
    {
      uint64_t v37 = *MEMORY[0x263F63B98];
      uint64_t v38 = sub_25B0F25A8();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v38 - 8) + 104))(v71, v37, v38);
      return sub_25B07587C((uint64_t)v25, MEMORY[0x263F63C28]);
    }
    sub_25B07587C((uint64_t)v25, MEMORY[0x263F63C28]);
    uint64_t v48 = v71;
LABEL_13:
    uint64_t v53 = (unsigned int *)MEMORY[0x263F63BA0];
    goto LABEL_14;
  }
  uint64_t v65 = v14;
  unint64_t v66 = (char *)v20;
  uint64_t v58 = v22;
  uint64_t v27 = v61;
  uint64_t v28 = (uint64_t)v63;
  sub_25B0F2498();
  uint64_t v29 = sub_25B0F22E8();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v62);
  sub_25B0F2808();
  uint64_t v30 = *(void *)(v29 + 16);
  uint64_t v57 = a1;
  if (v30 && (unint64_t v31 = sub_25B079A28((uint64_t)v16), (v32 & 1) != 0))
  {
    (*(void (**)(uint64_t, unint64_t, char *))(v27 + 16))(v28, *(void *)(v29 + 56) + *(void *)(v27 + 72) * v31, v66);
    uint64_t v33 = 0;
  }
  else
  {
    uint64_t v33 = 1;
  }
  uint64_t v40 = v69;
  uint64_t v41 = v70;
  uint64_t v42 = v60;
  uint64_t v43 = v27;
  uint64_t v44 = *(void (**)(uint64_t, uint64_t, uint64_t, char *))(v27 + 56);
  uint64_t v45 = v66;
  v44(v28, v33, 1, v66);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v64 + 8))(v16, v65);
  if ((*(unsigned int (**)(uint64_t, uint64_t, char *))(v43 + 48))(v28, 1, v45) == 1)
  {
    sub_25B075D08(v28, &qword_26A4D8208);
    uint64_t v46 = *MEMORY[0x263F63B98];
    uint64_t v47 = sub_25B0F25A8();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v47 - 8) + 104))(v71, v46, v47);
  }
  uint64_t v49 = v58;
  (*(void (**)(char *, uint64_t, char *))(v43 + 32))(v58, v28, v45);
  __swift_project_boxed_opaque_existential_5Tm((void *)(v41 + OBJC_IVAR____TtC14ReplicatorCore16ClientDataSource_recordDataStore), *(void *)(v41 + OBJC_IVAR____TtC14ReplicatorCore16ClientDataSource_recordDataStore + 24));
  sub_25B0F2768();
  uint64_t v50 = v59;
  sub_25B098184(v57, v42, v59);
  (*(void (**)(char *, uint64_t))(v40 + 8))(v42, v68);
  (*(void (**)(char *, char *))(v43 + 8))(v49, v45);
  uint64_t v51 = sub_25B0F2898();
  int v52 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v51 - 8) + 48))(v50, 1, v51);
  sub_25B075D08(v50, &qword_26A4D8200);
  uint64_t v48 = v71;
  if (v52 != 1) {
    goto LABEL_13;
  }
  uint64_t v53 = (unsigned int *)MEMORY[0x263F63B98];
LABEL_14:
  uint64_t v54 = *v53;
  uint64_t v55 = sub_25B0F25A8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v55 - 8) + 104))(v48, v54, v55);
}

uint64_t sub_25B0F0448(void *a1)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B33BC18);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_25B0F1D68();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = a1;
  uint64_t v9 = *a1;
  unint64_t v10 = sub_25B0F2888();
  int v12 = v10;
  unsigned __int8 v13 = BYTE6(v11);
  switch(v11 >> 62)
  {
    case 1uLL:
      unint64_t v15 = HIDWORD(v10);
      sub_25B071E9C(v10, v11);
      LODWORD(v14) = v15 - v12;
      if (__OFSUB__(v15, v12)) {
        goto LABEL_27;
      }
      uint64_t v14 = (int)v14;
      break;
    case 2uLL:
      uint64_t v37 = v8;
      uint64_t v38 = v5;
      uint64_t v16 = v6;
      uint64_t v18 = *(void *)(v10 + 16);
      uint64_t v17 = *(void *)(v10 + 24);
      sub_25B071E9C(v10, v11);
      uint64_t v14 = v17 - v18;
      if (__OFSUB__(v17, v18)) {
        goto LABEL_28;
      }
      uint64_t v6 = v16;
      uint64_t v8 = v37;
      uint64_t v5 = v38;
      break;
    case 3uLL:
      sub_25B071E9C(v10, v11);
      uint64_t v14 = 0;
      break;
    default:
      sub_25B071E9C(v10, v11);
      uint64_t v14 = v13;
      break;
  }
  BOOL v19 = __OFADD__(v9, v14);
  uint64_t v20 = v9 + v14;
  if (v19)
  {
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  *uint64_t v40 = v20;
  sub_25B0F2878();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    uint64_t v21 = &qword_26B33BC18;
    uint64_t v22 = v4;
    return sub_25B075D08((uint64_t)v22, v21);
  }
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
  id v24 = objc_msgSend(self, sel_defaultManager);
  sub_25B0F1D28();
  uint64_t v25 = (void *)sub_25B0F38E8();
  swift_bridgeObjectRelease();
  *(void *)&long long v42 = 0;
  id v26 = objc_msgSend(v24, sel_attributesOfItemAtPath_error_, v25, &v42);

  uint64_t v27 = (void *)v42;
  if (!v26)
  {
    id v33 = (id)v42;
    unint64_t v34 = (void *)sub_25B0F1C98();

    swift_willThrow();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    uint64_t v39 = 0;
    return result;
  }
  type metadata accessor for FileAttributeKey(0);
  sub_25B0F1B60(&qword_26B33C030, type metadata accessor for FileAttributeKey);
  uint64_t v28 = sub_25B0F3898();
  id v29 = v27;

  if (*(void *)(v28 + 16))
  {
    id v30 = (id)*MEMORY[0x263F080B8];
    unint64_t v31 = sub_25B079F64((uint64_t)v30);
    if (v32)
    {
      sub_25B071F94(*(void *)(v28 + 56) + 32 * v31, (uint64_t)&v42);
    }
    else
    {
      long long v42 = 0u;
      long long v43 = 0u;
    }
  }
  else
  {
    long long v42 = 0u;
    long long v43 = 0u;
  }
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  if (!*((void *)&v43 + 1))
  {
    uint64_t v21 = &qword_26B33C210;
    uint64_t v22 = (char *)&v42;
    return sub_25B075D08((uint64_t)v22, v21);
  }
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    uint64_t v35 = v40[1];
    if (!__OFADD__(v35, v41))
    {
      v40[1] = v35 + v41;
      return result;
    }
LABEL_29:
    __break(1u);
  }
  return result;
}

uint64_t sub_25B0F08B0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_25B0F30D8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25B0F2F68();
  int v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if (v6 == *MEMORY[0x263F64000])
  {
    uint64_t v7 = (unsigned int *)MEMORY[0x263F63B28];
LABEL_5:
    uint64_t v8 = *v7;
    uint64_t v9 = sub_25B0F2418();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 104))(a1, v8, v9);
  }
  if (v6 == *MEMORY[0x263F63FE8])
  {
    uint64_t v7 = (unsigned int *)MEMORY[0x263F63B20];
    goto LABEL_5;
  }
  uint64_t result = sub_25B0F3E78();
  __break(1u);
  return result;
}

uint64_t sub_25B0F0A58()
{
  uint64_t v0 = sub_25B0F2A08();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  int v6 = (char *)&v9 - v5;
  sub_25B0F2F58();
  sub_25B0F29E8();
  uint64_t v7 = *(void (**)(char *, uint64_t))(v1 + 8);
  v7(v6, v0);
  sub_25B0F2F58();
  sub_25B0F29F8();
  v7(v4, v0);
  return sub_25B0F2208();
}

uint64_t sub_25B0F0BB0(uint64_t a1, uint64_t a2)
{
  return sub_25B0F102C(a2);
}

uint64_t sub_25B0F0BC4(uint64_t a1, uint64_t a2)
{
  return sub_25B0F18E0(a2);
}

uint64_t sub_25B0F0BD8(uint64_t a1, uint64_t a2)
{
  return sub_25B0F1974(a2);
}

uint64_t sub_25B0F0BE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, long long *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v35 = a7;
  uint64_t v36 = a9;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v34);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a7 - 8) + 32))(boxed_opaque_existential_1, a3, a7);
  uint64_t v32 = a8;
  uint64_t v33 = a10;
  uint64_t v18 = __swift_allocate_boxed_opaque_existential_1(v31);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a8 - 8) + 32))(v18, a4, a8);
  type metadata accessor for ClientDataSource();
  uint64_t v19 = swift_allocObject();
  uint64_t v20 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v31, v32);
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (uint64_t *)((char *)v31 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v23 + 16))(v22);
  uint64_t v24 = *v22;
  uint64_t v25 = (void *)(v19 + OBJC_IVAR____TtC14ReplicatorCore16ClientDataSource_recordDataStore);
  void v25[3] = type metadata accessor for RecordDataPersistentStore();
  v25[4] = &off_2708CDE90;
  *uint64_t v25 = v24;
  uint64_t v26 = v19 + OBJC_IVAR____TtC14ReplicatorCore16ClientDataSource_clientDescriptor;
  uint64_t v27 = sub_25B0F3028();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 32))(v26, a1, v27);
  uint64_t v28 = v19 + OBJC_IVAR____TtC14ReplicatorCore16ClientDataSource_zoneDescriptor;
  uint64_t v29 = sub_25B0F2FA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 32))(v28, a2, v29);
  sub_25B088C1C(&v34, v19 + OBJC_IVAR____TtC14ReplicatorCore16ClientDataSource_replicator);
  sub_25B088C1C(a5, v19 + OBJC_IVAR____TtC14ReplicatorCore16ClientDataSource_notificationPoster);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v31);
  return v19;
}

uint64_t sub_25B0F0E5C(uint64_t a1)
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

uint64_t sub_25B0F0EE4(uint64_t a1, unint64_t a2, void (*a3)(uint64_t, uint64_t, unint64_t), uint64_t a4, uint64_t *a5, uint64_t a6)
{
  uint64_t v19 = a1;
  unint64_t v10 = (void *)a1;
  if (a2 >> 62) {
    goto LABEL_13;
  }
  uint64_t v11 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v11; uint64_t v11 = sub_25B0F3E88())
  {
    for (uint64_t i = 4; ; ++i)
    {
      id v13 = (a2 & 0xC000000000000001) != 0 ? (id)MEMORY[0x26115DB20](i - 4, a2) : *(id *)(a2 + 8 * i);
      unint64_t v10 = v13;
      uint64_t v14 = i - 3;
      if (__OFADD__(i - 4, 1)) {
        break;
      }
      id v18 = v13;
      sub_25B0ECE6C(&v19, (uint64_t)&v18, a3, a4, a5, a6);
      if (v6)
      {
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        return (uint64_t)v10;
      }

      if (v14 == v11)
      {
        swift_bridgeObjectRelease();
        return v19;
      }
    }
    __break(1u);
LABEL_13:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v10;
}

uint64_t sub_25B0F102C(uint64_t a1)
{
  uint64_t v2 = sub_25B0F28B8();
  uint64_t v47 = *(void *)(v2 - 8);
  uint64_t v48 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v46 = &v44[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v60 = sub_25B0F2838();
  uint64_t v58 = *(void *)(v60 - 8);
  MEMORY[0x270FA5388](v60);
  uint64_t v57 = &v44[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_25B0F2898();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v50 = &v44[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = &v44[-v10];
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v55 = &v44[-v13];
  MEMORY[0x270FA5388](v12);
  unint64_t v15 = &v44[-v14];
  uint64_t v16 = sub_25B0F1D68();
  uint64_t v51 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  id v18 = &v44[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B33BC18);
  uint64_t v20 = MEMORY[0x270FA5388](v19 - 8);
  int v52 = &v44[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  uint64_t v24 = &v44[-v23];
  uint64_t v25 = MEMORY[0x270FA5388](v22);
  uint64_t v27 = &v44[-v26];
  MEMORY[0x270FA5388](v25);
  uint64_t v29 = &v44[-v28];
  uint64_t v59 = a1;
  sub_25B0F28A8();
  sub_25B0F2878();
  id v30 = *(void (**)(unsigned char *, uint64_t))(v6 + 8);
  uint64_t v56 = v5;
  uint64_t v31 = v5;
  uint64_t v32 = v51;
  uint64_t v54 = v6 + 8;
  v30(v15, v31);
  int v33 = (*(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v32 + 48))(v27, 1, v16);
  uint64_t v53 = v30;
  uint64_t v61 = v29;
  if (v33 == 1)
  {
    sub_25B075D08((uint64_t)v27, &qword_26B33BC18);
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v32 + 56))(v29, 1, 1, v16);
    uint64_t v34 = v49;
    uint64_t v35 = v50;
  }
  else
  {
    uint64_t v45 = v11;
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v32 + 32))(v18, v27, v16);
    sub_25B0E6938((uint64_t)v18, v24);
    (*(void (**)(unsigned char *, uint64_t))(v32 + 8))(v18, v16);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v32 + 56))(v24, 0, 1, v16);
    uint64_t v29 = v61;
    sub_25B07607C((uint64_t)v24, (uint64_t)v61, &qword_26B33BC18);
    uint64_t v34 = v49;
    uint64_t v35 = v50;
    uint64_t v11 = v45;
  }
  sub_25B0F28A8();
  sub_25B0F2868();
  uint64_t v36 = v11;
  uint64_t v37 = v56;
  uint64_t v38 = v53;
  v53(v36, v56);
  sub_25B0F28A8();
  sub_25B0F2888();
  v38(v35, v37);
  sub_25B0AEF98((uint64_t)v29, (uint64_t)v52);
  uint64_t v39 = v55;
  sub_25B0F2858();
  __swift_project_boxed_opaque_existential_5Tm((void *)(v34 + OBJC_IVAR____TtC14ReplicatorCore16ClientDataSource_recordDataStore), *(void *)(v34 + OBJC_IVAR____TtC14ReplicatorCore16ClientDataSource_recordDataStore + 24));
  uint64_t v40 = v57;
  sub_25B0F2848();
  sub_25B0983F4();
  (*(void (**)(unsigned char *, uint64_t))(v58 + 8))(v40, v60);
  uint64_t v41 = *(void *)(v34 + OBJC_IVAR____TtC14ReplicatorCore16ClientDataSource_notificationPoster + 32);
  __swift_project_boxed_opaque_existential_5Tm((void *)(v34 + OBJC_IVAR____TtC14ReplicatorCore16ClientDataSource_notificationPoster), *(void *)(v34 + OBJC_IVAR____TtC14ReplicatorCore16ClientDataSource_notificationPoster + 24));
  uint64_t v42 = sub_25B0F2FE8();
  (*(void (**)(uint64_t))(v41 + 8))(v42);
  swift_bridgeObjectRelease();
  v38(v39, v37);
  return sub_25B075D08((uint64_t)v61, &qword_26B33BC18);
}

uint64_t sub_25B0F18E0(uint64_t a1)
{
  sub_25B0EDEFC(a1);
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC14ReplicatorCore16ClientDataSource_notificationPoster + 32);
  __swift_project_boxed_opaque_existential_5Tm((void *)(v1 + OBJC_IVAR____TtC14ReplicatorCore16ClientDataSource_notificationPoster), *(void *)(v1 + OBJC_IVAR____TtC14ReplicatorCore16ClientDataSource_notificationPoster + 24));
  uint64_t v3 = sub_25B0F2FE8();
  (*(void (**)(uint64_t))(v2 + 8))(v3);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25B0F1974(uint64_t a1)
{
  uint64_t v3 = sub_25B0F2898();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (void *)MEMORY[0x26115DE00](v5);
  __swift_project_boxed_opaque_existential_5Tm((void *)(v1 + OBJC_IVAR____TtC14ReplicatorCore16ClientDataSource_recordDataStore), *(void *)(v1 + OBJC_IVAR____TtC14ReplicatorCore16ClientDataSource_recordDataStore + 24));
  uint64_t v9 = sub_25B098164(a1);
  v21[0] = 0;
  v21[1] = 0;
  uint64_t v10 = *(void *)(v9 + 16);
  if (v10)
  {
    uint64_t v19 = v8;
    uint64_t v20 = a1;
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v4 + 16);
    uint64_t v11 = v4 + 16;
    uint64_t v12 = v13;
    unint64_t v14 = v9 + ((*(unsigned __int8 *)(v11 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 64));
    uint64_t v15 = *(void *)(v11 + 56);
    swift_bridgeObjectRetain();
    do
    {
      v12(v7, v14, v3);
      sub_25B0F0448(v21);
      (*(void (**)(char *, uint64_t))(v11 - 8))(v7, v3);
      v14 += v15;
      --v10;
    }
    while (v10);
    swift_bridgeObjectRelease_n();
    uint64_t v8 = v19;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  sub_25B0F27F8();
  uint64_t v16 = sub_25B0F3978();
  swift_bridgeObjectRelease();
  return v16;
}

uint64_t sub_25B0F1B60(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25B0F1BA8()
{
  return MEMORY[0x270EEDB78]();
}

uint64_t sub_25B0F1BB8()
{
  return MEMORY[0x270EEDB90]();
}

uint64_t sub_25B0F1BC8()
{
  return MEMORY[0x270EEE618]();
}

uint64_t sub_25B0F1BD8()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_25B0F1BE8()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_25B0F1BF8()
{
  return MEMORY[0x270EEE648]();
}

uint64_t sub_25B0F1C08()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_25B0F1C18()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_25B0F1C28()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_25B0F1C38()
{
  return MEMORY[0x270EEEA60]();
}

uint64_t sub_25B0F1C48()
{
  return MEMORY[0x270EEF238]();
}

uint64_t sub_25B0F1C58()
{
  return MEMORY[0x270EEF250]();
}

uint64_t sub_25B0F1C68()
{
  return MEMORY[0x270EEF268]();
}

uint64_t sub_25B0F1C78()
{
  return MEMORY[0x270EEF800]();
}

uint64_t sub_25B0F1C88()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_25B0F1C98()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_25B0F1CA8()
{
  return MEMORY[0x270EEFA08]();
}

uint64_t sub_25B0F1CB8()
{
  return MEMORY[0x270EEFA18]();
}

uint64_t sub_25B0F1CC8()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_25B0F1CD8()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_25B0F1CE8()
{
  return MEMORY[0x270F5B3D8]();
}

uint64_t sub_25B0F1CF8()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_25B0F1D08()
{
  return MEMORY[0x270EEFD70]();
}

uint64_t sub_25B0F1D18()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_25B0F1D28()
{
  return MEMORY[0x270EEFE68]();
}

uint64_t sub_25B0F1D38()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_25B0F1D48()
{
  return MEMORY[0x270EEFF18]();
}

uint64_t sub_25B0F1D58()
{
  return MEMORY[0x270EEFF40]();
}

uint64_t sub_25B0F1D68()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_25B0F1D78()
{
  return MEMORY[0x270EEFFB0]();
}

uint64_t sub_25B0F1D88()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_25B0F1D98()
{
  return MEMORY[0x270EF0090]();
}

uint64_t sub_25B0F1DA8()
{
  return MEMORY[0x270EF00B0]();
}

uint64_t sub_25B0F1DB8()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_25B0F1DC8()
{
  return MEMORY[0x270EF0268]();
}

uint64_t sub_25B0F1DD8()
{
  return MEMORY[0x270EF02B0]();
}

uint64_t sub_25B0F1DE8()
{
  return MEMORY[0x270EF02C8]();
}

uint64_t sub_25B0F1DF8()
{
  return MEMORY[0x270EF0700]();
}

uint64_t sub_25B0F1E08()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_25B0F1E18()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_25B0F1E28()
{
  return MEMORY[0x270EF0BD8]();
}

uint64_t sub_25B0F1E38()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_25B0F1E48()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_25B0F1E58()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_25B0F1E68()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_25B0F1E78()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_25B0F1E88()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_25B0F1E98()
{
  return MEMORY[0x270F5AE40]();
}

uint64_t sub_25B0F1EA8()
{
  return MEMORY[0x270F5AE48]();
}

uint64_t sub_25B0F1EB8()
{
  return MEMORY[0x270F5AE50]();
}

uint64_t sub_25B0F1EC8()
{
  return MEMORY[0x270F5AE58]();
}

uint64_t sub_25B0F1ED8()
{
  return MEMORY[0x270F5AE60]();
}

uint64_t sub_25B0F1EE8()
{
  return MEMORY[0x270F5AE68]();
}

uint64_t sub_25B0F1EF8()
{
  return MEMORY[0x270F5AE70]();
}

uint64_t sub_25B0F1F08()
{
  return MEMORY[0x270F5AE78]();
}

uint64_t sub_25B0F1F18()
{
  return MEMORY[0x270F5AE80]();
}

uint64_t sub_25B0F1F28()
{
  return MEMORY[0x270F5AE98]();
}

uint64_t sub_25B0F1F38()
{
  return MEMORY[0x270F5AEA0]();
}

uint64_t sub_25B0F1F48()
{
  return MEMORY[0x270F5AEA8]();
}

uint64_t sub_25B0F1F58()
{
  return MEMORY[0x270F5AEB0]();
}

uint64_t sub_25B0F1F68()
{
  return MEMORY[0x270F5AEB8]();
}

uint64_t sub_25B0F1F78()
{
  return MEMORY[0x270F5AEC0]();
}

uint64_t sub_25B0F1F88()
{
  return MEMORY[0x270F5AEC8]();
}

uint64_t sub_25B0F1F98()
{
  return MEMORY[0x270F5AED0]();
}

uint64_t sub_25B0F1FA8()
{
  return MEMORY[0x270F5AED8]();
}

uint64_t sub_25B0F1FB8()
{
  return MEMORY[0x270F5AEE0]();
}

uint64_t sub_25B0F1FC8()
{
  return MEMORY[0x270F5AEE8]();
}

uint64_t sub_25B0F1FD8()
{
  return MEMORY[0x270F5AEF0]();
}

uint64_t sub_25B0F1FE8()
{
  return MEMORY[0x270F5AEF8]();
}

uint64_t sub_25B0F1FF8()
{
  return MEMORY[0x270F5AF00]();
}

uint64_t sub_25B0F2008()
{
  return MEMORY[0x270F5AF08]();
}

uint64_t sub_25B0F2018()
{
  return MEMORY[0x270F5AF10]();
}

uint64_t sub_25B0F2028()
{
  return MEMORY[0x270F5AF18]();
}

uint64_t sub_25B0F2038()
{
  return MEMORY[0x270F5AF20]();
}

uint64_t sub_25B0F2048()
{
  return MEMORY[0x270F5AF28]();
}

uint64_t sub_25B0F2058()
{
  return MEMORY[0x270F5AF30]();
}

uint64_t sub_25B0F2068()
{
  return MEMORY[0x270F5AF38]();
}

uint64_t sub_25B0F2078()
{
  return MEMORY[0x270F5AF40]();
}

uint64_t sub_25B0F2088()
{
  return MEMORY[0x270F5AF48]();
}

uint64_t sub_25B0F2098()
{
  return MEMORY[0x270F5AF50]();
}

uint64_t sub_25B0F20A8()
{
  return MEMORY[0x270F5AF58]();
}

uint64_t sub_25B0F20B8()
{
  return MEMORY[0x270F5AF60]();
}

uint64_t sub_25B0F20C8()
{
  return MEMORY[0x270F5AF68]();
}

uint64_t sub_25B0F20D8()
{
  return MEMORY[0x270F5AF70]();
}

uint64_t sub_25B0F20E8()
{
  return MEMORY[0x270F5AF78]();
}

uint64_t sub_25B0F20F8()
{
  return MEMORY[0x270F5AF80]();
}

uint64_t sub_25B0F2108()
{
  return MEMORY[0x270F5AF88]();
}

uint64_t sub_25B0F2118()
{
  return MEMORY[0x270F5AF90]();
}

uint64_t sub_25B0F2128()
{
  return MEMORY[0x270F5AF98]();
}

uint64_t sub_25B0F2138()
{
  return MEMORY[0x270F5AFA0]();
}

uint64_t sub_25B0F2148()
{
  return MEMORY[0x270F5AFD8]();
}

uint64_t sub_25B0F2158()
{
  return MEMORY[0x270F5AFE0]();
}

uint64_t sub_25B0F2168()
{
  return MEMORY[0x270F5AFE8]();
}

uint64_t sub_25B0F2178()
{
  return MEMORY[0x270F5AFF0]();
}

uint64_t sub_25B0F2188()
{
  return MEMORY[0x270F5AFF8]();
}

uint64_t sub_25B0F2198()
{
  return MEMORY[0x270F5B000]();
}

uint64_t sub_25B0F21A8()
{
  return MEMORY[0x270F5B008]();
}

uint64_t sub_25B0F21B8()
{
  return MEMORY[0x270F5B010]();
}

uint64_t sub_25B0F21C8()
{
  return MEMORY[0x270F5B018]();
}

uint64_t sub_25B0F21D8()
{
  return MEMORY[0x270F5B020]();
}

uint64_t sub_25B0F21E8()
{
  return MEMORY[0x270F5B028]();
}

uint64_t sub_25B0F21F8()
{
  return MEMORY[0x270F5B030]();
}

uint64_t sub_25B0F2208()
{
  return MEMORY[0x270F5B038]();
}

uint64_t sub_25B0F2218()
{
  return MEMORY[0x270F5B040]();
}

uint64_t sub_25B0F2228()
{
  return MEMORY[0x270F5B048]();
}

uint64_t sub_25B0F2238()
{
  return MEMORY[0x270F5B050]();
}

uint64_t sub_25B0F2248()
{
  return MEMORY[0x270F5B058]();
}

uint64_t sub_25B0F2258()
{
  return MEMORY[0x270F5B060]();
}

uint64_t sub_25B0F2268()
{
  return MEMORY[0x270F5B068]();
}

uint64_t sub_25B0F2278()
{
  return MEMORY[0x270F5B070]();
}

uint64_t sub_25B0F2288()
{
  return MEMORY[0x270F5B078]();
}

uint64_t sub_25B0F2298()
{
  return MEMORY[0x270F5B080]();
}

uint64_t sub_25B0F22A8()
{
  return MEMORY[0x270F5B088]();
}

uint64_t sub_25B0F22B8()
{
  return MEMORY[0x270F5B090]();
}

uint64_t sub_25B0F22C8()
{
  return MEMORY[0x270F5B098]();
}

uint64_t sub_25B0F22D8()
{
  return MEMORY[0x270F5B0A0]();
}

uint64_t sub_25B0F22E8()
{
  return MEMORY[0x270F5B0A8]();
}

uint64_t sub_25B0F22F8()
{
  return MEMORY[0x270F5B0B0]();
}

uint64_t sub_25B0F2308()
{
  return MEMORY[0x270F5B0B8]();
}

uint64_t sub_25B0F2318()
{
  return MEMORY[0x270F5B0C0]();
}

uint64_t sub_25B0F2328()
{
  return MEMORY[0x270F5B0C8]();
}

uint64_t sub_25B0F2338()
{
  return MEMORY[0x270F5B0D0]();
}

uint64_t sub_25B0F2348()
{
  return MEMORY[0x270F5B0D8]();
}

uint64_t sub_25B0F2358()
{
  return MEMORY[0x270F5B0E0]();
}

uint64_t sub_25B0F2368()
{
  return MEMORY[0x270F5B0E8]();
}

uint64_t sub_25B0F2378()
{
  return MEMORY[0x270F5B0F0]();
}

uint64_t sub_25B0F2388()
{
  return MEMORY[0x270F5B0F8]();
}

uint64_t sub_25B0F2398()
{
  return MEMORY[0x270F5B100]();
}

uint64_t sub_25B0F23A8()
{
  return MEMORY[0x270F5B108]();
}

uint64_t sub_25B0F23B8()
{
  return MEMORY[0x270F5B110]();
}

uint64_t sub_25B0F23C8()
{
  return MEMORY[0x270F5B118]();
}

uint64_t sub_25B0F23D8()
{
  return MEMORY[0x270F5B120]();
}

uint64_t sub_25B0F23E8()
{
  return MEMORY[0x270F5B128]();
}

uint64_t sub_25B0F23F8()
{
  return MEMORY[0x270F5B130]();
}

uint64_t sub_25B0F2408()
{
  return MEMORY[0x270F5B138]();
}

uint64_t sub_25B0F2418()
{
  return MEMORY[0x270F5B140]();
}

uint64_t sub_25B0F2428()
{
  return MEMORY[0x270F5B148]();
}

uint64_t sub_25B0F2438()
{
  return MEMORY[0x270F5B150]();
}

uint64_t sub_25B0F2448()
{
  return MEMORY[0x270F5B158]();
}

uint64_t sub_25B0F2458()
{
  return MEMORY[0x270F5B160]();
}

uint64_t sub_25B0F2468()
{
  return MEMORY[0x270F5B168]();
}

uint64_t sub_25B0F2478()
{
  return MEMORY[0x270F5B170]();
}

uint64_t sub_25B0F2488()
{
  return MEMORY[0x270F5B178]();
}

uint64_t sub_25B0F2498()
{
  return MEMORY[0x270F5B180]();
}

uint64_t sub_25B0F24A8()
{
  return MEMORY[0x270F5B188]();
}

uint64_t sub_25B0F24B8()
{
  return MEMORY[0x270F5B190]();
}

uint64_t sub_25B0F24C8()
{
  return MEMORY[0x270F5B198]();
}

uint64_t sub_25B0F24D8()
{
  return MEMORY[0x270F5B1A0]();
}

uint64_t sub_25B0F24E8()
{
  return MEMORY[0x270F5B1A8]();
}

uint64_t sub_25B0F24F8()
{
  return MEMORY[0x270F5B1B0]();
}

uint64_t sub_25B0F2508()
{
  return MEMORY[0x270F5B1B8]();
}

uint64_t sub_25B0F2518()
{
  return MEMORY[0x270F5B1C0]();
}

uint64_t sub_25B0F2528()
{
  return MEMORY[0x270F5B1C8]();
}

uint64_t sub_25B0F2538()
{
  return MEMORY[0x270F5B1D0]();
}

uint64_t sub_25B0F2548()
{
  return MEMORY[0x270F5B1D8]();
}

uint64_t sub_25B0F2558()
{
  return MEMORY[0x270F5B1E0]();
}

uint64_t sub_25B0F2568()
{
  return MEMORY[0x270F5B1E8]();
}

uint64_t sub_25B0F2578()
{
  return MEMORY[0x270F5B1F0]();
}

uint64_t sub_25B0F2588()
{
  return MEMORY[0x270F5B1F8]();
}

uint64_t sub_25B0F2598()
{
  return MEMORY[0x270F5B200]();
}

uint64_t sub_25B0F25A8()
{
  return MEMORY[0x270F5B208]();
}

uint64_t sub_25B0F25B8()
{
  return MEMORY[0x270F5B210]();
}

uint64_t sub_25B0F25C8()
{
  return MEMORY[0x270F5B218]();
}

uint64_t sub_25B0F25D8()
{
  return MEMORY[0x270F5B220]();
}

uint64_t sub_25B0F25E8()
{
  return MEMORY[0x270F5B228]();
}

uint64_t sub_25B0F25F8()
{
  return MEMORY[0x270F5B230]();
}

uint64_t sub_25B0F2608()
{
  return MEMORY[0x270F5B238]();
}

uint64_t sub_25B0F2618()
{
  return MEMORY[0x270F5B240]();
}

uint64_t sub_25B0F2628()
{
  return MEMORY[0x270F5B248]();
}

uint64_t sub_25B0F2638()
{
  return MEMORY[0x270F5B250]();
}

uint64_t sub_25B0F2648()
{
  return MEMORY[0x270F5B258]();
}

uint64_t sub_25B0F2658()
{
  return MEMORY[0x270F5B260]();
}

uint64_t sub_25B0F2668()
{
  return MEMORY[0x270F5B268]();
}

uint64_t sub_25B0F2678()
{
  return MEMORY[0x270F5B270]();
}

uint64_t sub_25B0F2688()
{
  return MEMORY[0x270F5B278]();
}

uint64_t sub_25B0F2698()
{
  return MEMORY[0x270F5B280]();
}

uint64_t sub_25B0F26A8()
{
  return MEMORY[0x270F5B288]();
}

uint64_t sub_25B0F26B8()
{
  return MEMORY[0x270F5B290]();
}

uint64_t sub_25B0F26C8()
{
  return MEMORY[0x270F5B298]();
}

uint64_t sub_25B0F26D8()
{
  return MEMORY[0x270F5B2A0]();
}

uint64_t sub_25B0F26E8()
{
  return MEMORY[0x270F5B2A8]();
}

uint64_t sub_25B0F26F8()
{
  return MEMORY[0x270F5B2B0]();
}

uint64_t sub_25B0F2708()
{
  return MEMORY[0x270F5B2B8]();
}

uint64_t sub_25B0F2718()
{
  return MEMORY[0x270F5B2C0]();
}

uint64_t sub_25B0F2728()
{
  return MEMORY[0x270F5B2C8]();
}

uint64_t sub_25B0F2738()
{
  return MEMORY[0x270F5B2D0]();
}

uint64_t sub_25B0F2748()
{
  return MEMORY[0x270F5B2D8]();
}

uint64_t sub_25B0F2758()
{
  return MEMORY[0x270F5B2E0]();
}

uint64_t sub_25B0F2768()
{
  return MEMORY[0x270F5B2E8]();
}

uint64_t sub_25B0F2778()
{
  return MEMORY[0x270F5B2F0]();
}

uint64_t sub_25B0F2788()
{
  return MEMORY[0x270F5B2F8]();
}

uint64_t sub_25B0F2798()
{
  return MEMORY[0x270F5B300]();
}

uint64_t sub_25B0F27A8()
{
  return MEMORY[0x270F5B308]();
}

uint64_t sub_25B0F27B8()
{
  return MEMORY[0x270F5B310]();
}

uint64_t sub_25B0F27C8()
{
  return MEMORY[0x270F5B318]();
}

uint64_t sub_25B0F27D8()
{
  return MEMORY[0x270F5B320]();
}

uint64_t sub_25B0F27E8()
{
  return MEMORY[0x270F5B328]();
}

uint64_t sub_25B0F27F8()
{
  return MEMORY[0x270F5B330]();
}

uint64_t sub_25B0F2808()
{
  return MEMORY[0x270F5B338]();
}

uint64_t sub_25B0F2818()
{
  return MEMORY[0x270F5B340]();
}

uint64_t sub_25B0F2828()
{
  return MEMORY[0x270F5B348]();
}

uint64_t sub_25B0F2838()
{
  return MEMORY[0x270F5B350]();
}

uint64_t sub_25B0F2848()
{
  return MEMORY[0x270F5B358]();
}

uint64_t sub_25B0F2858()
{
  return MEMORY[0x270F5B360]();
}

uint64_t sub_25B0F2868()
{
  return MEMORY[0x270F5B368]();
}

uint64_t sub_25B0F2878()
{
  return MEMORY[0x270F5B370]();
}

uint64_t sub_25B0F2888()
{
  return MEMORY[0x270F5B378]();
}

uint64_t sub_25B0F2898()
{
  return MEMORY[0x270F5B380]();
}

uint64_t sub_25B0F28A8()
{
  return MEMORY[0x270F5B388]();
}

uint64_t sub_25B0F28B8()
{
  return MEMORY[0x270F5B390]();
}

uint64_t sub_25B0F28C8()
{
  return MEMORY[0x270F5B398]();
}

uint64_t sub_25B0F28D8()
{
  return MEMORY[0x270F5B3A0]();
}

uint64_t sub_25B0F28E8()
{
  return MEMORY[0x270F5B3A8]();
}

uint64_t sub_25B0F28F8()
{
  return MEMORY[0x270F5B3B0]();
}

uint64_t sub_25B0F2908()
{
  return MEMORY[0x270F5B3B8]();
}

uint64_t sub_25B0F2918()
{
  return MEMORY[0x270F5B3C0]();
}

uint64_t sub_25B0F2928()
{
  return MEMORY[0x270F5B3C8]();
}

uint64_t sub_25B0F2938()
{
  return MEMORY[0x270F5B3D0]();
}

uint64_t sub_25B0F2948()
{
  return MEMORY[0x270F5B3E0]();
}

uint64_t sub_25B0F2958()
{
  return MEMORY[0x270F5B3E8]();
}

uint64_t sub_25B0F2968()
{
  return MEMORY[0x270F5B3F0]();
}

uint64_t sub_25B0F2978()
{
  return MEMORY[0x270F5B3F8]();
}

uint64_t sub_25B0F2988()
{
  return MEMORY[0x270F5B400]();
}

uint64_t sub_25B0F2998()
{
  return MEMORY[0x270F5B440]();
}

uint64_t sub_25B0F29A8()
{
  return MEMORY[0x270F5B458]();
}

uint64_t sub_25B0F29B8()
{
  return MEMORY[0x270F5B468]();
}

uint64_t sub_25B0F29C8()
{
  return MEMORY[0x270F5B470]();
}

uint64_t sub_25B0F29D8()
{
  return MEMORY[0x270F5B480]();
}

uint64_t sub_25B0F29E8()
{
  return MEMORY[0x270F5B488]();
}

uint64_t sub_25B0F29F8()
{
  return MEMORY[0x270F5B498]();
}

uint64_t sub_25B0F2A08()
{
  return MEMORY[0x270F5B4A0]();
}

uint64_t sub_25B0F2A18()
{
  return MEMORY[0x270F5B4B8]();
}

uint64_t sub_25B0F2A28()
{
  return MEMORY[0x270F5B4C0]();
}

uint64_t sub_25B0F2A38()
{
  return MEMORY[0x270F5B4C8]();
}

uint64_t sub_25B0F2A48()
{
  return MEMORY[0x270F5B4D0]();
}

uint64_t sub_25B0F2A58()
{
  return MEMORY[0x270F5B4D8]();
}

uint64_t sub_25B0F2A68()
{
  return MEMORY[0x270F5B4E0]();
}

uint64_t sub_25B0F2A78()
{
  return MEMORY[0x270F5B4E8]();
}

uint64_t sub_25B0F2A88()
{
  return MEMORY[0x270F5B4F0]();
}

uint64_t sub_25B0F2A98()
{
  return MEMORY[0x270F5B4F8]();
}

uint64_t sub_25B0F2AA8()
{
  return MEMORY[0x270F5B500]();
}

uint64_t sub_25B0F2AB8()
{
  return MEMORY[0x270F5B508]();
}

uint64_t sub_25B0F2AC8()
{
  return MEMORY[0x270F5B510]();
}

uint64_t sub_25B0F2AD8()
{
  return MEMORY[0x270F5B518]();
}

uint64_t sub_25B0F2AE8()
{
  return MEMORY[0x270F5B520]();
}

uint64_t sub_25B0F2AF8()
{
  return MEMORY[0x270F5B528]();
}

uint64_t sub_25B0F2B08()
{
  return MEMORY[0x270F5B530]();
}

uint64_t sub_25B0F2B18()
{
  return MEMORY[0x270F5B538]();
}

uint64_t sub_25B0F2B28()
{
  return MEMORY[0x270F5B540]();
}

uint64_t sub_25B0F2B38()
{
  return MEMORY[0x270F5B548]();
}

uint64_t sub_25B0F2B48()
{
  return MEMORY[0x270F5B550]();
}

uint64_t sub_25B0F2B58()
{
  return MEMORY[0x270F5B558]();
}

uint64_t sub_25B0F2B68()
{
  return MEMORY[0x270F5B560]();
}

uint64_t sub_25B0F2B78()
{
  return MEMORY[0x270F5B568]();
}

uint64_t sub_25B0F2B88()
{
  return MEMORY[0x270F5B570]();
}

uint64_t sub_25B0F2B98()
{
  return MEMORY[0x270F5B578]();
}

uint64_t sub_25B0F2BA8()
{
  return MEMORY[0x270F5B580]();
}

uint64_t sub_25B0F2BB8()
{
  return MEMORY[0x270F5B588]();
}

uint64_t sub_25B0F2BC8()
{
  return MEMORY[0x270F5B590]();
}

uint64_t sub_25B0F2BD8()
{
  return MEMORY[0x270F5B598]();
}

uint64_t sub_25B0F2BE8()
{
  return MEMORY[0x270F5B5A0]();
}

uint64_t sub_25B0F2BF8()
{
  return MEMORY[0x270F5B5A8]();
}

uint64_t sub_25B0F2C08()
{
  return MEMORY[0x270F5B5B0]();
}

uint64_t sub_25B0F2C18()
{
  return MEMORY[0x270F5B5B8]();
}

uint64_t sub_25B0F2C28()
{
  return MEMORY[0x270F5B5C0]();
}

uint64_t sub_25B0F2C38()
{
  return MEMORY[0x270F5B5C8]();
}

uint64_t sub_25B0F2C48()
{
  return MEMORY[0x270F5B5D0]();
}

uint64_t sub_25B0F2C58()
{
  return MEMORY[0x270F5B620]();
}

uint64_t sub_25B0F2C68()
{
  return MEMORY[0x270F5B658]();
}

uint64_t sub_25B0F2C78()
{
  return MEMORY[0x270F5B670]();
}

uint64_t sub_25B0F2C88()
{
  return MEMORY[0x270F5B680]();
}

uint64_t sub_25B0F2C98()
{
  return MEMORY[0x270F5B690]();
}

uint64_t sub_25B0F2CA8()
{
  return MEMORY[0x270F5B6A0]();
}

uint64_t sub_25B0F2CB8()
{
  return MEMORY[0x270F5B6A8]();
}

uint64_t sub_25B0F2CC8()
{
  return MEMORY[0x270F5B6C0]();
}

uint64_t sub_25B0F2CD8()
{
  return MEMORY[0x270F5B6D0]();
}

uint64_t sub_25B0F2CE8()
{
  return MEMORY[0x270F5B6E0]();
}

uint64_t sub_25B0F2CF8()
{
  return MEMORY[0x270F5B6E8]();
}

uint64_t sub_25B0F2D08()
{
  return MEMORY[0x270F5B6F0]();
}

uint64_t sub_25B0F2D18()
{
  return MEMORY[0x270F5B6F8]();
}

uint64_t sub_25B0F2D28()
{
  return MEMORY[0x270F5B700]();
}

uint64_t sub_25B0F2D38()
{
  return MEMORY[0x270F5B710]();
}

uint64_t sub_25B0F2D48()
{
  return MEMORY[0x270F5B728]();
}

uint64_t sub_25B0F2D58()
{
  return MEMORY[0x270F5B748]();
}

uint64_t sub_25B0F2D68()
{
  return MEMORY[0x270F5B758]();
}

uint64_t sub_25B0F2D78()
{
  return MEMORY[0x270F5B760]();
}

uint64_t sub_25B0F2D88()
{
  return MEMORY[0x270F5B770]();
}

uint64_t sub_25B0F2D98()
{
  return MEMORY[0x270F5B778]();
}

uint64_t sub_25B0F2DA8()
{
  return MEMORY[0x270F5B780]();
}

uint64_t sub_25B0F2DB8()
{
  return MEMORY[0x270F5B790]();
}

uint64_t sub_25B0F2DC8()
{
  return MEMORY[0x270F5B7A8]();
}

uint64_t sub_25B0F2DD8()
{
  return MEMORY[0x270F5B7B8]();
}

uint64_t sub_25B0F2DE8()
{
  return MEMORY[0x270F5B7C0]();
}

uint64_t sub_25B0F2DF8()
{
  return MEMORY[0x270F5B7D0]();
}

uint64_t sub_25B0F2E08()
{
  return MEMORY[0x270F5B7D8]();
}

uint64_t sub_25B0F2E18()
{
  return MEMORY[0x270F5B7E0]();
}

uint64_t sub_25B0F2E28()
{
  return MEMORY[0x270F5B7F0]();
}

uint64_t sub_25B0F2E38()
{
  return MEMORY[0x270F5B7F8]();
}

uint64_t sub_25B0F2E48()
{
  return MEMORY[0x270F5B808]();
}

uint64_t sub_25B0F2E58()
{
  return MEMORY[0x270F5B810]();
}

uint64_t sub_25B0F2E68()
{
  return MEMORY[0x270F5B820]();
}

uint64_t sub_25B0F2E78()
{
  return MEMORY[0x270F5B828]();
}

uint64_t sub_25B0F2E88()
{
  return MEMORY[0x270F5B830]();
}

uint64_t sub_25B0F2E98()
{
  return MEMORY[0x270F5B838]();
}

uint64_t sub_25B0F2EA8()
{
  return MEMORY[0x270F5B840]();
}

uint64_t sub_25B0F2EB8()
{
  return MEMORY[0x270F5B848]();
}

uint64_t sub_25B0F2EC8()
{
  return MEMORY[0x270F5B850]();
}

uint64_t sub_25B0F2ED8()
{
  return MEMORY[0x270F5B858]();
}

uint64_t sub_25B0F2EE8()
{
  return MEMORY[0x270F5B860]();
}

uint64_t sub_25B0F2EF8()
{
  return MEMORY[0x270F5B868]();
}

uint64_t sub_25B0F2F08()
{
  return MEMORY[0x270F5B870]();
}

uint64_t sub_25B0F2F18()
{
  return MEMORY[0x270F5B880]();
}

uint64_t sub_25B0F2F28()
{
  return MEMORY[0x270F5B890]();
}

uint64_t sub_25B0F2F38()
{
  return MEMORY[0x270F5B898]();
}

uint64_t sub_25B0F2F48()
{
  return MEMORY[0x270F5B8A0]();
}

uint64_t sub_25B0F2F58()
{
  return MEMORY[0x270F5B8A8]();
}

uint64_t sub_25B0F2F68()
{
  return MEMORY[0x270F5B8B0]();
}

uint64_t sub_25B0F2F78()
{
  return MEMORY[0x270F5B8B8]();
}

uint64_t sub_25B0F2F88()
{
  return MEMORY[0x270F5B8C0]();
}

uint64_t sub_25B0F2F98()
{
  return MEMORY[0x270F5B8D0]();
}

uint64_t sub_25B0F2FA8()
{
  return MEMORY[0x270F5B8E0]();
}

uint64_t sub_25B0F2FB8()
{
  return MEMORY[0x270F5B8E8]();
}

uint64_t sub_25B0F2FC8()
{
  return MEMORY[0x270F5B8F0]();
}

uint64_t sub_25B0F2FD8()
{
  return MEMORY[0x270F5B8F8]();
}

uint64_t sub_25B0F2FE8()
{
  return MEMORY[0x270F5B900]();
}

uint64_t sub_25B0F2FF8()
{
  return MEMORY[0x270F5B908]();
}

uint64_t sub_25B0F3008()
{
  return MEMORY[0x270F5B918]();
}

uint64_t sub_25B0F3018()
{
  return MEMORY[0x270F5B920]();
}

uint64_t sub_25B0F3028()
{
  return MEMORY[0x270F5B928]();
}

uint64_t sub_25B0F3038()
{
  return MEMORY[0x270F5B940]();
}

uint64_t sub_25B0F3048()
{
  return MEMORY[0x270F5B948]();
}

uint64_t sub_25B0F3058()
{
  return MEMORY[0x270F5B950]();
}

uint64_t sub_25B0F3068()
{
  return MEMORY[0x270F5B958]();
}

uint64_t sub_25B0F3078()
{
  return MEMORY[0x270F5B968]();
}

uint64_t sub_25B0F3088()
{
  return MEMORY[0x270F5B970]();
}

uint64_t sub_25B0F3098()
{
  return MEMORY[0x270F5B978]();
}

uint64_t sub_25B0F30A8()
{
  return MEMORY[0x270F5B980]();
}

uint64_t sub_25B0F30B8()
{
  return MEMORY[0x270F5B988]();
}

uint64_t sub_25B0F30C8()
{
  return MEMORY[0x270F5B990]();
}

uint64_t sub_25B0F30D8()
{
  return MEMORY[0x270F5B9A0]();
}

uint64_t sub_25B0F30E8()
{
  return MEMORY[0x270F5B9C0]();
}

uint64_t sub_25B0F30F8()
{
  return MEMORY[0x270F5B9C8]();
}

uint64_t sub_25B0F3108()
{
  return MEMORY[0x270F5B9D0]();
}

uint64_t sub_25B0F3118()
{
  return MEMORY[0x270F5B9D8]();
}

uint64_t sub_25B0F3128()
{
  return MEMORY[0x270F5B9E0]();
}

uint64_t sub_25B0F3138()
{
  return MEMORY[0x270F5B9E8]();
}

uint64_t sub_25B0F3148()
{
  return MEMORY[0x270F5B9F8]();
}

uint64_t sub_25B0F3158()
{
  return MEMORY[0x270F5BA00]();
}

uint64_t sub_25B0F3168()
{
  return MEMORY[0x270F5BA08]();
}

uint64_t sub_25B0F3178()
{
  return MEMORY[0x270F5BA10]();
}

uint64_t sub_25B0F3188()
{
  return MEMORY[0x270F5BA18]();
}

uint64_t sub_25B0F3198()
{
  return MEMORY[0x270F5BA20]();
}

uint64_t sub_25B0F31A8()
{
  return MEMORY[0x270F5BA28]();
}

uint64_t sub_25B0F31B8()
{
  return MEMORY[0x270F5BA30]();
}

uint64_t sub_25B0F31C8()
{
  return MEMORY[0x270F5BA38]();
}

uint64_t sub_25B0F31D8()
{
  return MEMORY[0x270F5BA40]();
}

uint64_t sub_25B0F31E8()
{
  return MEMORY[0x270F5BA48]();
}

uint64_t sub_25B0F31F8()
{
  return MEMORY[0x270F5BA50]();
}

uint64_t sub_25B0F3208()
{
  return MEMORY[0x270F5BA58]();
}

uint64_t sub_25B0F3218()
{
  return MEMORY[0x270F5BA60]();
}

uint64_t sub_25B0F3228()
{
  return MEMORY[0x270F5BA68]();
}

uint64_t sub_25B0F3238()
{
  return MEMORY[0x270F5BA70]();
}

uint64_t sub_25B0F3248()
{
  return MEMORY[0x270F5BA78]();
}

uint64_t sub_25B0F3258()
{
  return MEMORY[0x270F5BA80]();
}

uint64_t sub_25B0F3268()
{
  return MEMORY[0x270F5BA88]();
}

uint64_t sub_25B0F3278()
{
  return MEMORY[0x270F5BA90]();
}

uint64_t sub_25B0F3288()
{
  return MEMORY[0x270F5BA98]();
}

uint64_t sub_25B0F3298()
{
  return MEMORY[0x270F5BAA0]();
}

uint64_t sub_25B0F32A8()
{
  return MEMORY[0x270F5BAA8]();
}

uint64_t sub_25B0F32B8()
{
  return MEMORY[0x270F5BAB0]();
}

uint64_t sub_25B0F32C8()
{
  return MEMORY[0x270F5BAB8]();
}

uint64_t sub_25B0F32D8()
{
  return MEMORY[0x270F5BAC0]();
}

uint64_t sub_25B0F32E8()
{
  return MEMORY[0x270F5BAC8]();
}

uint64_t sub_25B0F32F8()
{
  return MEMORY[0x270F5BAD0]();
}

uint64_t sub_25B0F3308()
{
  return MEMORY[0x270F5BAD8]();
}

uint64_t sub_25B0F3318()
{
  return MEMORY[0x270F5BAE0]();
}

uint64_t sub_25B0F3328()
{
  return MEMORY[0x270F5BAE8]();
}

uint64_t sub_25B0F3338()
{
  return MEMORY[0x270F5BAF0]();
}

uint64_t sub_25B0F3348()
{
  return MEMORY[0x270F5BAF8]();
}

uint64_t sub_25B0F3358()
{
  return MEMORY[0x270F5BB00]();
}

uint64_t sub_25B0F3368()
{
  return MEMORY[0x270F5BB08]();
}

uint64_t sub_25B0F3378()
{
  return MEMORY[0x270F5BB10]();
}

uint64_t sub_25B0F3388()
{
  return MEMORY[0x270F5BB18]();
}

uint64_t sub_25B0F3398()
{
  return MEMORY[0x270F5BB20]();
}

uint64_t sub_25B0F33A8()
{
  return MEMORY[0x270F5BB28]();
}

uint64_t sub_25B0F33B8()
{
  return MEMORY[0x270F5BB30]();
}

uint64_t sub_25B0F33C8()
{
  return MEMORY[0x270F5BB38]();
}

uint64_t sub_25B0F33D8()
{
  return MEMORY[0x270F5BB40]();
}

uint64_t sub_25B0F33E8()
{
  return MEMORY[0x270F5BB48]();
}

uint64_t sub_25B0F33F8()
{
  return MEMORY[0x270F5BB50]();
}

uint64_t sub_25B0F3408()
{
  return MEMORY[0x270F5BB58]();
}

uint64_t sub_25B0F3418()
{
  return MEMORY[0x270F5BB60]();
}

uint64_t sub_25B0F3428()
{
  return MEMORY[0x270F5BB68]();
}

uint64_t sub_25B0F3438()
{
  return MEMORY[0x270F5BB70]();
}

uint64_t sub_25B0F3448()
{
  return MEMORY[0x270F5BB78]();
}

uint64_t sub_25B0F3458()
{
  return MEMORY[0x270F5BB80]();
}

uint64_t sub_25B0F3468()
{
  return MEMORY[0x270F5BB88]();
}

uint64_t sub_25B0F3478()
{
  return MEMORY[0x270F5BB90]();
}

uint64_t sub_25B0F3488()
{
  return MEMORY[0x270F5BB98]();
}

uint64_t sub_25B0F3498()
{
  return MEMORY[0x270F5BBA0]();
}

uint64_t sub_25B0F34A8()
{
  return MEMORY[0x270F5BBA8]();
}

uint64_t sub_25B0F34B8()
{
  return MEMORY[0x270F5BBB0]();
}

uint64_t sub_25B0F34C8()
{
  return MEMORY[0x270F5BBB8]();
}

uint64_t sub_25B0F34D8()
{
  return MEMORY[0x270F5BBC0]();
}

uint64_t sub_25B0F34E8()
{
  return MEMORY[0x270F5BBC8]();
}

uint64_t sub_25B0F34F8()
{
  return MEMORY[0x270F5BBD0]();
}

uint64_t sub_25B0F3508()
{
  return MEMORY[0x270F5BBD8]();
}

uint64_t sub_25B0F3518()
{
  return MEMORY[0x270F5BBE0]();
}

uint64_t sub_25B0F3528()
{
  return MEMORY[0x270F5BBE8]();
}

uint64_t sub_25B0F3538()
{
  return MEMORY[0x270F5BBF0]();
}

uint64_t sub_25B0F3548()
{
  return MEMORY[0x270F5BBF8]();
}

uint64_t sub_25B0F3558()
{
  return MEMORY[0x270F5BC00]();
}

uint64_t sub_25B0F3568()
{
  return MEMORY[0x270F5BC08]();
}

uint64_t sub_25B0F3578()
{
  return MEMORY[0x270F5BC10]();
}

uint64_t sub_25B0F3588()
{
  return MEMORY[0x270F5BC18]();
}

uint64_t sub_25B0F3598()
{
  return MEMORY[0x270F5BC20]();
}

uint64_t sub_25B0F35A8()
{
  return MEMORY[0x270F5BC28]();
}

uint64_t sub_25B0F35B8()
{
  return MEMORY[0x270F5BC30]();
}

uint64_t sub_25B0F35C8()
{
  return MEMORY[0x270F5BC38]();
}

uint64_t sub_25B0F35D8()
{
  return MEMORY[0x270F5BC40]();
}

uint64_t sub_25B0F35E8()
{
  return MEMORY[0x270F5BC48]();
}

uint64_t sub_25B0F35F8()
{
  return MEMORY[0x270F5BC50]();
}

uint64_t sub_25B0F3608()
{
  return MEMORY[0x270F5BC58]();
}

uint64_t sub_25B0F3618()
{
  return MEMORY[0x270F5BC60]();
}

uint64_t sub_25B0F3628()
{
  return MEMORY[0x270F5BC68]();
}

uint64_t sub_25B0F3638()
{
  return MEMORY[0x270F5BC70]();
}

uint64_t sub_25B0F3648()
{
  return MEMORY[0x270F5BC78]();
}

uint64_t sub_25B0F3658()
{
  return MEMORY[0x270F5BC80]();
}

uint64_t sub_25B0F3668()
{
  return MEMORY[0x270F5BC88]();
}

uint64_t sub_25B0F3678()
{
  return MEMORY[0x270F5BC90]();
}

uint64_t sub_25B0F3688()
{
  return MEMORY[0x270F5BC98]();
}

uint64_t sub_25B0F3698()
{
  return MEMORY[0x270F5BCA0]();
}

uint64_t sub_25B0F36A8()
{
  return MEMORY[0x270F5BCA8]();
}

uint64_t sub_25B0F36B8()
{
  return MEMORY[0x270F5BCB0]();
}

uint64_t sub_25B0F36C8()
{
  return MEMORY[0x270F5BCB8]();
}

uint64_t sub_25B0F36D8()
{
  return MEMORY[0x270F5BCC0]();
}

uint64_t sub_25B0F36E8()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25B0F36F8()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_25B0F3708()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25B0F3718()
{
  return MEMORY[0x270FA2C50]();
}

uint64_t sub_25B0F3728()
{
  return MEMORY[0x270EE3B98]();
}

uint64_t sub_25B0F3738()
{
  return MEMORY[0x270EE3C50]();
}

uint64_t sub_25B0F3748()
{
  return MEMORY[0x270EE3C70]();
}

uint64_t sub_25B0F3758()
{
  return MEMORY[0x270EE3C88]();
}

uint64_t sub_25B0F3768()
{
  return MEMORY[0x270EE3CB8]();
}

uint64_t sub_25B0F3778()
{
  return MEMORY[0x270EE3E08]();
}

uint64_t sub_25B0F3788()
{
  return MEMORY[0x270EE3F78]();
}

uint64_t sub_25B0F3798()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_25B0F37A8()
{
  return MEMORY[0x270FA0970]();
}

uint64_t sub_25B0F37B8()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_25B0F37C8()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_25B0F37D8()
{
  return MEMORY[0x270FA09D8]();
}

uint64_t sub_25B0F37E8()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_25B0F37F8()
{
  return MEMORY[0x270FA0A00]();
}

uint64_t sub_25B0F3808()
{
  return MEMORY[0x270FA0A18]();
}

uint64_t sub_25B0F3818()
{
  return MEMORY[0x270FA0A28]();
}

uint64_t sub_25B0F3828()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_25B0F3838()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_25B0F3848()
{
  return MEMORY[0x270FA0AD0]();
}

uint64_t sub_25B0F3858()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_25B0F3868()
{
  return MEMORY[0x270FA0BA8]();
}

uint64_t sub_25B0F3878()
{
  return MEMORY[0x270FA0BF0]();
}

uint64_t sub_25B0F3888()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_25B0F3898()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_25B0F38A8()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_25B0F38B8()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_25B0F38C8()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_25B0F38D8()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_25B0F38E8()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25B0F38F8()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_25B0F3908()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_25B0F3918()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25B0F3928()
{
  return MEMORY[0x270EF1B18]();
}

uint64_t sub_25B0F3938()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_25B0F3948()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_25B0F3958()
{
  return MEMORY[0x270F9D668]();
}

uint64_t sub_25B0F3968()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25B0F3978()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_25B0F3988()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25B0F3998()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t sub_25B0F39A8()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25B0F39B8()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_25B0F39C8()
{
  return MEMORY[0x270F9D880]();
}

uint64_t sub_25B0F39D8()
{
  return MEMORY[0x270F9D968]();
}

uint64_t sub_25B0F39E8()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_25B0F39F8()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_25B0F3A08()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_25B0F3A18()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_25B0F3A28()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_25B0F3A38()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_25B0F3A48()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_25B0F3A58()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_25B0F3A68()
{
  return MEMORY[0x270F9DF28]();
}

uint64_t sub_25B0F3A78()
{
  return MEMORY[0x270EF1E08]();
}

uint64_t sub_25B0F3A88()
{
  return MEMORY[0x270F5BCC8]();
}

uint64_t sub_25B0F3A98()
{
  return MEMORY[0x270F5BCD0]();
}

uint64_t sub_25B0F3AA8()
{
  return MEMORY[0x270EF1EE8]();
}

uint64_t sub_25B0F3AB8()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_25B0F3AC8()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_25B0F3AD8()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25B0F3AE8()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_25B0F3AF8()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_25B0F3B08()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_25B0F3B18()
{
  return MEMORY[0x270FA0C78]();
}

uint64_t sub_25B0F3B28()
{
  return MEMORY[0x270FA0CD0]();
}

uint64_t sub_25B0F3B38()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_25B0F3B48()
{
  return MEMORY[0x270FA0D88]();
}

uint64_t sub_25B0F3B58()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_25B0F3B68()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_25B0F3B78()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_25B0F3B88()
{
  return MEMORY[0x270FA0E38]();
}

uint64_t sub_25B0F3B98()
{
  return MEMORY[0x270FA0EA0]();
}

uint64_t sub_25B0F3BA8()
{
  return MEMORY[0x270FA0EE0]();
}

uint64_t sub_25B0F3BB8()
{
  return MEMORY[0x270F5BCD8]();
}

uint64_t sub_25B0F3BC8()
{
  return MEMORY[0x270F5BCE0]();
}

uint64_t sub_25B0F3BD8()
{
  return MEMORY[0x270EF2090]();
}

uint64_t sub_25B0F3BE8()
{
  return MEMORY[0x270EF20A0]();
}

uint64_t sub_25B0F3BF8()
{
  return MEMORY[0x270EF20A8]();
}

uint64_t sub_25B0F3C08()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_25B0F3C18()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_25B0F3C28()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25B0F3C38()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25B0F3C48()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_25B0F3C58()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_25B0F3C68()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_25B0F3C78()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_25B0F3C88()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_25B0F3C98()
{
  return MEMORY[0x270F9E7F8]();
}

uint64_t sub_25B0F3CA8()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_25B0F3CB8()
{
  return MEMORY[0x270F9E810]();
}

uint64_t sub_25B0F3CC8()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_25B0F3CD8()
{
  return MEMORY[0x270F9E820]();
}

uint64_t sub_25B0F3CE8()
{
  return MEMORY[0x270F9E838]();
}

uint64_t sub_25B0F3CF8()
{
  return MEMORY[0x270F9E840]();
}

uint64_t sub_25B0F3D08()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_25B0F3D18()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_25B0F3D28()
{
  return MEMORY[0x270F9E860]();
}

uint64_t sub_25B0F3D38()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_25B0F3D48()
{
  return MEMORY[0x270F9E878]();
}

uint64_t sub_25B0F3D58()
{
  return MEMORY[0x270F9E888]();
}

uint64_t sub_25B0F3D68()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_25B0F3D78()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_25B0F3D88()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_25B0F3D98()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_25B0F3DA8()
{
  return MEMORY[0x270F9E988]();
}

uint64_t sub_25B0F3DB8()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25B0F3DC8()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25B0F3DD8()
{
  return MEMORY[0x270F9E9E8]();
}

uint64_t sub_25B0F3DE8()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_25B0F3DF8()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25B0F3E08()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_25B0F3E18()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_25B0F3E28()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_25B0F3E38()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_25B0F3E48()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_25B0F3E58()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_25B0F3E68()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25B0F3E78()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_25B0F3E88()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25B0F3E98()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_25B0F3EA8()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_25B0F3EB8()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25B0F3EC8()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25B0F3EE8()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_25B0F3EF8()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_25B0F3F08()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25B0F3F18()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25B0F3F28()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_25B0F3F38()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25B0F3F48()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_25B0F3F58()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25B0F3F68()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25B0F3F78()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25B0F3F88()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25B0F3F98()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_25B0F3FA8()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_25B0F3FB8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25B0F3FC8()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25B0F3FD8()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_25B0F3FE8()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25B0F3FF8()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_25B0F4008()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_25B0F4038()
{
  return MEMORY[0x270FA0128]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x270F4AE20]();
}

uint64_t MKBEventsRegister()
{
  return MEMORY[0x270F4AE28]();
}

uint64_t MKBEventsUnregister()
{
  return MEMORY[0x270F4AE30]();
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void exit(int a1)
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x270EDAA78]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x270EDAA80]();
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

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x270EDB4D0](*(void *)&a1, a2);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x270EDB648](__dst, __src, __n);
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x270FA0410]();
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

uint64_t swift_weakAssign()
{
  return MEMORY[0x270FA0630]();
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

int usleep(useconds_t a1)
{
  return MEMORY[0x270EDB9E8](*(void *)&a1);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}