uint64_t sub_100003294(void (*a1)(void), uint64_t a2)
{
  char *v2;
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  void (*v29)(char *, char *, uint64_t);
  void (*v30)(char *, char *, uint64_t);
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  BOOL v35;
  uint8_t *v36;
  uint64_t v37;
  unint64_t v38;
  void (*v39)(char *, uint64_t);
  uint64_t v40;
  char *v41;
  char v42;
  void *v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  char *v51;
  void (*v52)(char *, char *, uint64_t);
  NSObject *v53;
  os_log_type_t v54;
  BOOL v55;
  uint64_t v56;
  uint64_t v57;
  uint8_t *v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  char *v62;
  NSObject *v63;
  os_log_type_t v64;
  uint64_t v65;
  uint64_t v66;
  uint8_t *v67;
  uint64_t v68;
  unint64_t v69;
  void (*v70)(char *, uint64_t);
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  char *v76;
  uint64_t v77;
  char *v78;
  NSObject *v79;
  os_log_type_t v80;
  uint64_t v81;
  uint8_t *v82;
  uint64_t v83;
  unint64_t v84;
  void *v85;
  char *v86;
  uint64_t v87;
  NSObject *v88;
  os_log_type_t v89;
  uint64_t v90;
  uint8_t *v91;
  uint64_t v92;
  unint64_t v93;
  char *v94;
  uint64_t (*v95)(char *, uint64_t);
  char *v96;
  uint64_t (*v97)(char *, uint64_t);
  void v98[2];
  void (*v99)(char *, uint64_t);
  char *v100;
  char *v101;
  char *v102;
  char *v103;
  char *v104;
  uint64_t v105;
  void (*v106)(void);
  void (*v107)(char *, uint64_t);
  char *v108;
  char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  char *v114;
  void (*v115)(char *, char *, uint64_t);
  uint64_t v116;
  uint64_t v117;
  uint64_t v118[2];

  v3 = v2;
  v105 = a2;
  v106 = a1;
  v113 = sub_10000A138();
  v110 = *(void *)(v113 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v5 = (char *)v98 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_10000A098();
  v7 = *(void *)(v6 - 8);
  v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  v103 = (char *)v98 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __chkstk_darwin(v8);
  v12 = (char *)v98 - v11;
  v13 = __chkstk_darwin(v10);
  v100 = (char *)v98 - v14;
  v15 = __chkstk_darwin(v13);
  v104 = (char *)v98 - v16;
  v17 = __chkstk_darwin(v15);
  v19 = (char *)v98 - v18;
  v20 = __chkstk_darwin(v17);
  v22 = (char *)v98 - v21;
  v23 = __chkstk_darwin(v20);
  v25 = (char *)v98 - v24;
  __chkstk_darwin(v23);
  v27 = (char *)v98 - v26;
  v116 = v7;
  v30 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  v28 = v7 + 16;
  v29 = v30;
  v114 = v3;
  v30((char *)v98 - v26, v3, v6);
  if (qword_100010680 != -1) {
    swift_once();
  }
  v109 = v19;
  v102 = v5;
  v31 = sub_10000A238();
  v32 = sub_100004DDC(v31, (uint64_t)qword_1000108C0);
  v112 = v28;
  v115 = v29;
  v29(v25, v27, v6);
  v111 = v32;
  v33 = sub_10000A218();
  v34 = sub_10000A2D8();
  v35 = os_log_type_enabled(v33, v34);
  v101 = v12;
  if (v35)
  {
    v36 = (uint8_t *)swift_slowAlloc();
    v118[0] = swift_slowAlloc();
    v108 = v27;
    *(_DWORD *)v36 = 136315138;
    sub_100004E58();
    v37 = sub_10000A3F8();
    v117 = sub_1000070FC(v37, v38, v118);
    v27 = v108;
    sub_10000A328();
    swift_bridgeObjectRelease();
    v39 = *(void (**)(char *, uint64_t))(v116 + 8);
    v39(v25, v6);
    _os_log_impl((void *)&_mh_execute_header, v33, v34, "Attempting to run subtask %s", v36, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    v39 = *(void (**)(char *, uint64_t))(v116 + 8);
    v39(v25, v6);
  }

  v40 = type metadata accessor for PluginSubtask();
  v41 = &v114[*(int *)(v40 + 20)];
  sub_100004E14(v41, *((void *)v41 + 3));
  v42 = sub_10000A148();
  v115(v22, v27, v6);
  if (v42)
  {
    v39(v22, v6);
LABEL_11:
    v62 = v109;
    v115(v109, v27, v6);
    v63 = sub_10000A218();
    v64 = sub_10000A2C8();
    if (os_log_type_enabled(v63, v64))
    {
      v65 = swift_slowAlloc();
      v115 = (void (*)(char *, char *, uint64_t))v40;
      v66 = v6;
      v67 = (uint8_t *)v65;
      v118[0] = swift_slowAlloc();
      *(_DWORD *)v67 = 136315138;
      v107 = v39;
      sub_100004E58();
      v68 = sub_10000A3F8();
      v117 = sub_1000070FC(v68, v69, v118);
      sub_10000A328();
      swift_bridgeObjectRelease();
      v70 = v107;
      v107(v62, v66);
      _os_log_impl((void *)&_mh_execute_header, v63, v64, "Skipping subtask %s", v67, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v71 = v66;
      v40 = (uint64_t)v115;
      v70(v27, v71);
    }
    else
    {

      v39(v62, v6);
      v39(v27, v6);
    }
    v72 = v113;
    v73 = &v114[*(int *)(v40 + 24)];
    v74 = v110;
    (*(void (**)(char *, uint64_t))(v110 + 8))(v73, v113);
    return (*(uint64_t (**)(char *, void, uint64_t))(v74 + 104))(v73, enum case for ComputationState.taskSkipped(_:), v72);
  }
  v43 = (void *)sub_10000A0A8();
  v44 = sub_10000A308();

  v45 = v116 + 8;
  v39(v22, v6);
  if ((v44 & 1) == 0) {
    goto LABEL_11;
  }
  v107 = v39;
  v46 = v113;
  v47 = &v114[*(int *)(v40 + 24)];
  v48 = v110;
  v49 = v110 + 8;
  v99 = *(void (**)(char *, uint64_t))(v110 + 8);
  v99(v47, v113);
  v50 = *(char **)(v48 + 104);
  v116 = v48 + 104;
  v114 = v50;
  ((void (*)(char *, void, uint64_t))v50)(v47, enum case for ComputationState.taskStarted(_:), v46);
  v51 = v104;
  v108 = v27;
  v52 = v115;
  v115(v104, v27, v6);
  v53 = sub_10000A218();
  v54 = sub_10000A2C8();
  v55 = os_log_type_enabled(v53, v54);
  v109 = v47;
  if (v55)
  {
    v56 = swift_slowAlloc();
    v98[0] = v49;
    v57 = v6;
    v58 = (uint8_t *)v56;
    v59 = swift_slowAlloc();
    v98[1] = v45;
    v118[0] = v59;
    *(_DWORD *)v58 = 136315138;
    sub_100004E58();
    v60 = sub_10000A3F8();
    v117 = sub_1000070FC(v60, v61, v118);
    v52 = v115;
    sub_10000A328();
    swift_bridgeObjectRelease();
    v107(v51, v57);
    _os_log_impl((void *)&_mh_execute_header, v53, v54, "Running subtask %s", v58, 0xCu);
    swift_arrayDestroy();
    v47 = v109;
    swift_slowDealloc();
    v6 = v57;
    swift_slowDealloc();
  }
  else
  {
    v107(v51, v6);
  }

  v106();
  v76 = v108;
  v77 = v113;
  v99(v47, v113);
  ((void (*)(char *, void, uint64_t))v114)(v47, enum case for ComputationState.taskCompleted(_:), v77);
  sub_100004E14(v41, *((void *)v41 + 3));
  if (sub_10000A148())
  {
    v78 = v100;
    v52(v100, v76, v6);
    v79 = sub_10000A218();
    v80 = sub_10000A2C8();
    if (os_log_type_enabled(v79, v80))
    {
      v81 = swift_slowAlloc();
      v110 = v6;
      v82 = (uint8_t *)v81;
      v118[0] = swift_slowAlloc();
      *(_DWORD *)v82 = 136315138;
      sub_100004E58();
      v83 = sub_10000A3F8();
      v117 = sub_1000070FC(v83, v84, v118);
      v47 = v109;
      sub_10000A328();
      swift_bridgeObjectRelease();
      v107(v78, v110);
      _os_log_impl((void *)&_mh_execute_header, v79, v80, "Plugin was asked to stop while running subtask %s", v82, 0xCu);
      swift_arrayDestroy();
      v76 = v108;
      swift_slowDealloc();
      v6 = v110;
      v52 = v115;
      swift_slowDealloc();
    }
    else
    {
      v107(v78, v6);
    }

    v86 = v101;
    v87 = v113;
    v99(v47, v113);
    ((void (*)(char *, void, uint64_t))v114)(v47, enum case for ComputationState.taskStopped(_:), v87);
  }
  else
  {
    v85 = (void *)sub_10000A0A8();
    sub_10000A318();

    v86 = v101;
  }
  v52(v86, v76, v6);
  v88 = sub_10000A218();
  v89 = sub_10000A2D8();
  if (os_log_type_enabled(v88, v89))
  {
    v90 = v6;
    v91 = (uint8_t *)swift_slowAlloc();
    v118[0] = swift_slowAlloc();
    *(_DWORD *)v91 = 136315138;
    sub_100004E58();
    v92 = sub_10000A3F8();
    v117 = sub_1000070FC(v92, v93, v118);
    sub_10000A328();
    swift_bridgeObjectRelease();
    v94 = v86;
    v95 = (uint64_t (*)(char *, uint64_t))v107;
    v107(v94, v90);
    _os_log_impl((void *)&_mh_execute_header, v88, v89, "Finished running subtask %s", v91, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    return v95(v108, v90);
  }
  else
  {

    v96 = v86;
    v97 = (uint64_t (*)(char *, uint64_t))v107;
    v107(v96, v6);
    return v97(v76, v6);
  }
}

uint64_t *sub_100004220(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_10000A098();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    long long v9 = *(_OWORD *)((char *)a2 + v8 + 24);
    *(_OWORD *)((char *)a1 + v8 + 24) = v9;
    (**(void (***)(void))(v9 - 8))();
    uint64_t v10 = *(int *)(a3 + 24);
    v11 = (char *)a1 + v10;
    v12 = (char *)a2 + v10;
    uint64_t v13 = sub_10000A138();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
  }
  return a1;
}

uint64_t sub_10000437C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000A098();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  sub_100004430(a1 + *(int *)(a2 + 20));
  uint64_t v5 = a1 + *(int *)(a2 + 24);
  uint64_t v6 = sub_10000A138();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  return v7(v5, v6);
}

uint64_t sub_100004430(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100004480(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10000A098();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  long long v8 = *(_OWORD *)(a2 + v7 + 24);
  *(_OWORD *)(a1 + v7 + 24) = v8;
  (**(void (***)(void))(v8 - 8))();
  uint64_t v9 = *(int *)(a3 + 24);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_10000A138();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
  return a1;
}

uint64_t sub_10000458C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10000A098();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  sub_100004654((uint64_t *)(a1 + *(int *)(a3 + 20)), (uint64_t *)(a2 + *(int *)(a3 + 20)));
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_10000A138();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t *sub_100004654(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        result = (uint64_t *)swift_release();
        uint64_t *v3 = v12;
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
          *result = *a2;
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
          uint64_t *v3 = *a2;
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

uint64_t sub_100004884(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10000A098();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  long long v11 = *(_OWORD *)(v10 + 16);
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *(_OWORD *)(v9 + 16) = v11;
  *(void *)(v9 + 32) = *(void *)(v10 + 32);
  uint64_t v12 = a1 + v8;
  uint64_t v13 = a2 + v8;
  uint64_t v14 = sub_10000A138();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
  return a1;
}

uint64_t sub_100004954(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10000A098();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  sub_100004430(a1 + v7);
  long long v10 = *(_OWORD *)(v9 + 16);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  *(_OWORD *)(v8 + 16) = v10;
  *(void *)(v8 + 32) = *(void *)(v9 + 32);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_10000A138();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t sub_100004A38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100004A4C);
}

uint64_t sub_100004A4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10000A098();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 24);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
  else
  {
    uint64_t v11 = sub_10000A138();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 24);
    return v12(v14, a2, v13);
  }
}

uint64_t sub_100004B7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100004B90);
}

uint64_t sub_100004B90(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_10000A098();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 24) = (a2 - 1);
  }
  else
  {
    uint64_t v11 = sub_10000A138();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 24);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

uint64_t type metadata accessor for PluginSubtask()
{
  uint64_t result = qword_1000106E8;
  if (!qword_1000106E8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100004D0C()
{
  uint64_t result = sub_10000A098();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_10000A138();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_100004DDC(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void *sub_100004E14(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_100004E58()
{
  unint64_t result = qword_100010728;
  if (!qword_100010728)
  {
    sub_10000A098();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010728);
  }
  return result;
}

uint64_t sub_100004EB0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100004EF4()
{
  uint64_t v0 = sub_10000A238();
  sub_100008B44(v0, qword_1000108C0);
  sub_100004DDC(v0, (uint64_t)qword_1000108C0);
  return sub_10000A228();
}

void *sub_100004F68()
{
  uint64_t v1 = type metadata accessor for PluginSubtask();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v45 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004EB0(&qword_100010810);
  uint64_t v5 = *(void *)(v2 + 72);
  unint64_t v6 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_10000AA00;
  uint64_t v48 = v7;
  uint64_t v8 = v7 + v6;
  uint64_t v9 = v0 + OBJC_IVAR___PeopleSuggesterLighthousePlugin_localTrainingSubtask;
  swift_beginAccess();
  sub_100008A8C(v9, v8);
  uint64_t v10 = v8 + v5;
  uint64_t v11 = v0 + OBJC_IVAR___PeopleSuggesterLighthousePlugin_modelMonitoringSubtask;
  swift_beginAccess();
  sub_100008A8C(v11, v8 + v5);
  uint64_t v12 = v0 + OBJC_IVAR___PeopleSuggesterLighthousePlugin_shadowEvaluationSubtask;
  swift_beginAccess();
  uint64_t v46 = v8 + 2 * v5;
  sub_100008A8C(v12, v46);
  v50 = &_swiftEmptyArrayStorage;
  sub_1000086DC(0, 3, 0);
  uint64_t v47 = v8;
  sub_100008A8C(v8, (uint64_t)v4);
  uint64_t v13 = sub_10000A088();
  uint64_t v15 = v14;
  uint64_t v49 = v1;
  uint64_t v16 = sub_10000A128();
  uint64_t v18 = v17;
  sub_100007934((uint64_t)v4);
  v19 = v50;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_1000086DC(0, v19[2] + 1, 1);
    v19 = v50;
  }
  unint64_t v21 = v19[2];
  unint64_t v20 = v19[3];
  if (v21 >= v20 >> 1)
  {
    sub_1000086DC(v20 > 1, v21 + 1, 1);
    v19 = v50;
  }
  v19[2] = v21 + 1;
  v22 = &v19[4 * v21];
  v22[4] = v13;
  v22[5] = v15;
  v22[6] = v16;
  v22[7] = v18;
  sub_100008A8C(v10, (uint64_t)v4);
  uint64_t v23 = sub_10000A088();
  uint64_t v25 = v24;
  uint64_t v26 = sub_10000A128();
  uint64_t v28 = v27;
  sub_100007934((uint64_t)v4);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    sub_1000086DC(0, v19[2] + 1, 1);
  }
  v29 = v50;
  unint64_t v31 = v50[2];
  unint64_t v30 = v50[3];
  if (v31 >= v30 >> 1)
  {
    sub_1000086DC(v30 > 1, v31 + 1, 1);
    v29 = v50;
  }
  v29[2] = v31 + 1;
  v32 = &v29[4 * v31];
  v32[4] = v23;
  v32[5] = v25;
  v32[6] = v26;
  v32[7] = v28;
  sub_100008A8C(v46, (uint64_t)v4);
  uint64_t v33 = sub_10000A088();
  uint64_t v35 = v34;
  uint64_t v36 = sub_10000A128();
  uint64_t v38 = v37;
  sub_100007934((uint64_t)v4);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_1000086DC(0, v29[2] + 1, 1);
    v29 = v50;
  }
  unint64_t v40 = v29[2];
  unint64_t v39 = v29[3];
  if (v40 >= v39 >> 1)
  {
    sub_1000086DC(v39 > 1, v40 + 1, 1);
    v29 = v50;
  }
  v29[2] = v40 + 1;
  v41 = &v29[4 * v40];
  v41[4] = v33;
  v41[5] = v35;
  v41[6] = v36;
  v41[7] = v38;
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  if (v29[2])
  {
    sub_100004EB0(&qword_1000107F8);
    v42 = (void *)sub_10000A3D8();
  }
  else
  {
    v42 = &_swiftEmptyDictionarySingleton;
  }
  v50 = v42;
  v43 = (void *)swift_bridgeObjectRetain();
  sub_1000079F0(v43, 1, &v50);
  swift_release();
  return v50;
}

id sub_1000053C0()
{
  uint64_t v1 = &v0[OBJC_IVAR___PeopleSuggesterLighthousePlugin_executionManager];
  uint64_t v2 = v0;
  _s31PeopleSuggesterLighthousePlugin0D0C16executionManager33_F9833457DB168D2D6A134FD34B1C926ELL0abC0021SynchronizedExecutionF0Vvpfi_0();
  uint64_t v3 = &v2[OBJC_IVAR___PeopleSuggesterLighthousePlugin_localTrainingSubtask];
  uint64_t v4 = enum case for SubtaskName.attemptLocalTraining(_:);
  uint64_t v5 = sub_10000A098();
  unint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 104);
  v21(v3, v4, v5);
  swift_beginAccess();
  uint64_t v6 = type metadata accessor for PluginSubtask();
  uint64_t v7 = (uint64_t *)&v3[*(int *)(v6 + 20)];
  uint64_t v8 = sub_10000A208();
  v7[3] = v8;
  v7[4] = (uint64_t)&protocol witness table for SynchronizedExecutionManager;
  uint64_t v9 = sub_1000078D0(v7);
  unint64_t v20 = *(void (**)(uint64_t *, char *, uint64_t))(*(void *)(v8 - 8) + 16);
  v20(v9, v1, v8);
  uint64_t v10 = &v3[*(int *)(v6 + 24)];
  uint64_t v11 = enum case for ComputationState.taskNotExecuted(_:);
  uint64_t v12 = sub_10000A138();
  v22 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 104);
  v22(v10, v11, v12);
  uint64_t v13 = &v2[OBJC_IVAR___PeopleSuggesterLighthousePlugin_modelMonitoringSubtask];
  v21(&v2[OBJC_IVAR___PeopleSuggesterLighthousePlugin_modelMonitoringSubtask], enum case for SubtaskName.attemptModelMonitoring(_:), v5);
  uint64_t v14 = (uint64_t *)&v13[*(int *)(v6 + 20)];
  v14[3] = v8;
  v14[4] = (uint64_t)&protocol witness table for SynchronizedExecutionManager;
  uint64_t v15 = sub_1000078D0(v14);
  v20(v15, v1, v8);
  v22(&v13[*(int *)(v6 + 24)], v11, v12);
  uint64_t v16 = &v2[OBJC_IVAR___PeopleSuggesterLighthousePlugin_shadowEvaluationSubtask];
  v21(&v2[OBJC_IVAR___PeopleSuggesterLighthousePlugin_shadowEvaluationSubtask], enum case for SubtaskName.attemptShadowEvaluation(_:), v5);
  uint64_t v17 = (uint64_t *)&v16[*(int *)(v6 + 20)];
  v17[3] = v8;
  v17[4] = (uint64_t)&protocol witness table for SynchronizedExecutionManager;
  uint64_t v18 = sub_1000078D0(v17);
  v20(v18, v1, v8);
  v22(&v16[*(int *)(v6 + 24)], v11, v12);

  v23.receiver = v2;
  v23.super_class = (Class)type metadata accessor for Plugin();
  return objc_msgSendSuper2(&v23, "init");
}

void sub_1000056A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v27 = a2;
  uint64_t v6 = sub_10000A0F8();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100010680 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_10000A238();
  sub_100004DDC(v10, (uint64_t)qword_1000108C0);
  uint64_t v11 = sub_10000A218();
  os_log_type_t v12 = sub_10000A2C8();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Plugin refreshing Trial assets", v13, 2u);
    swift_slowDealloc();
  }

  uint64_t v14 = self;
  id v15 = objc_msgSend(v14, "mlr_clientWithMLRTask:", a3);
  if (v15)
  {
    uint64_t v16 = v15;
    id v17 = objc_msgSend(v14, "mlr_namespaceNameWithMLRTask:", a3);
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v26 = a1;
      uint64_t v19 = sub_10000A288();
      unint64_t v21 = v20;

      id v22 = v16;
      sub_100008D08(v22, v19, v21);
      if (v3)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_10000A0E8();
        sub_1000096C0(v22);
        swift_bridgeObjectRelease();

        (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v26, v9, v6);
      }
    }
    else
    {
      sub_100008AF0();
      swift_allocError();
      *uint64_t v24 = 0xD000000000000015;
      v24[1] = 0x800000010000B9B0;
      swift_willThrow();
    }
  }
  else
  {
    sub_100008AF0();
    swift_allocError();
    *objc_super v23 = 0xD000000000000018;
    v23[1] = 0x800000010000B990;
    swift_willThrow();
  }
}

id Plugin.perform(_:)(void *a1)
{
  uint64_t v3 = v2;
  uint64_t v4 = v1;
  uint64_t v6 = sub_10000A118();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v58 = (uint64_t)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v54 = (char *)&v46 - v10;
  uint64_t v55 = sub_10000A0F8();
  uint64_t v53 = *(void *)(v55 - 8);
  uint64_t v11 = __chkstk_darwin(v55);
  uint64_t v56 = (uint64_t)&v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v51 = (char *)&v46 - v13;
  uint64_t v57 = (uint64_t)a1;
  id v14 = [a1 parameters];
  id v15 = [v14 dictionaryRepresentation];

  sub_10000A258();
  if (qword_100010680 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_10000A238();
  uint64_t v17 = sub_100004DDC(v16, (uint64_t)qword_1000108C0);
  swift_bridgeObjectRetain();
  uint64_t v52 = v17;
  uint64_t v18 = sub_10000A218();
  os_log_type_t v19 = sub_10000A2D8();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v48 = v7;
    unint64_t v21 = (uint8_t *)v20;
    uint64_t v22 = swift_slowAlloc();
    uint64_t v49 = v6;
    v59[0] = v22;
    uint64_t v47 = v2;
    *(_DWORD *)unint64_t v21 = 136315138;
    uint64_t v46 = v21 + 4;
    swift_bridgeObjectRetain();
    v50 = v4;
    uint64_t v23 = sub_10000A268();
    unint64_t v25 = v24;
    swift_bridgeObjectRelease();
    unint64_t v60 = sub_1000070FC(v23, v25, v59);
    uint64_t v3 = v47;
    sub_10000A328();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "Parameters: %s", v21, 0xCu);
    uint64_t v4 = v50;
    swift_arrayDestroy();
    uint64_t v6 = v49;
    swift_slowDealloc();
    uint64_t v7 = v48;
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v26 = v56;
  sub_1000056A8(v56, v58, v57);
  if (v3)
  {
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v27 = sub_10000A218();
    os_log_type_t v28 = sub_10000A2F8();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc();
      unint64_t v30 = (void *)swift_slowAlloc();
      *(_DWORD *)v29 = 138412290;
      swift_errorRetain();
      uint64_t v31 = _swift_stdlib_bridgeErrorToNSError();
      v59[0] = v31;
      sub_10000A328();
      *unint64_t v30 = v31;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "Unable to read trial config %@", v29, 0xCu);
      sub_100004EB0(&qword_100010730);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    v42 = sub_100004F68();
    sub_1000061D4((uint64_t)v42);
    swift_bridgeObjectRelease();
    id v43 = objc_allocWithZone((Class)MLRTaskResult);
    Class isa = sub_10000A248().super.isa;
    swift_bridgeObjectRelease();
    id v41 = [v43 initWithJSONResult:isa unprivatizedVector:0];

    swift_errorRelease();
  }
  else
  {
    v32 = v51;
    (*(void (**)(char *, uint64_t, uint64_t))(v53 + 32))(v51, v26, v55);
    uint64_t v33 = v54;
    (*(void (**)(void))(v7 + 32))();
    unint64_t v60 = sub_100006540((uint64_t)&_swiftEmptyArrayStorage);
    __chkstk_darwin(v60);
    *(&v46 - 2) = (uint8_t *)v32;
    *(&v46 - 1) = v4;
    swift_beginAccess();
    sub_100003294((void (*)(void))sub_100007754, (uint64_t)(&v46 - 4));
    uint64_t v34 = swift_endAccess();
    __chkstk_darwin(v34);
    *(&v46 - 2) = (uint8_t *)v32;
    *(&v46 - 1) = v4;
    swift_beginAccess();
    sub_100003294((void (*)(void))sub_100007770, (uint64_t)(&v46 - 4));
    uint64_t v35 = swift_endAccess();
    __chkstk_darwin(v35);
    *(&v46 - 4) = (uint8_t *)v32;
    *(&v46 - 3) = v4;
    *(&v46 - 2) = (uint8_t *)v33;
    *(&v46 - 1) = (uint8_t *)&v60;
    swift_beginAccess();
    sub_100003294((void (*)(void))sub_10000778C, (uint64_t)(&v46 - 6));
    swift_endAccess();
    uint64_t v36 = sub_100004F68();
    uint64_t v37 = swift_bridgeObjectRetain();
    uint64_t v38 = sub_100006D78(v37, (uint64_t)v36);
    sub_1000061D4(v38);
    swift_bridgeObjectRelease();
    id v39 = objc_allocWithZone((Class)MLRTaskResult);
    Class v40 = sub_10000A248().super.isa;
    swift_bridgeObjectRelease();
    id v41 = [v39 initWithJSONResult:v40 unprivatizedVector:0];

    (*(void (**)(char *, uint64_t))(v7 + 8))(v54, v6);
    (*(void (**)(char *, uint64_t))(v53 + 8))(v32, v55);
    swift_bridgeObjectRelease();
  }
  return v41;
}

unint64_t sub_1000061D4(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    sub_100004EB0(&qword_100010808);
    uint64_t v2 = (void *)sub_10000A3D8();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v32 = v1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(v1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(v1 + 64);
  int64_t v31 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = &v37;
  uint64_t v7 = &v39;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t i = 0;
  uint64_t v10 = (char *)&type metadata for Any + 8;
  uint64_t v11 = &type metadata for String;
  if (v5) {
    goto LABEL_10;
  }
LABEL_11:
  int64_t v20 = i + 1;
  if (__OFADD__(i, 1)) {
    goto LABEL_35;
  }
  if (v20 >= v31) {
    goto LABEL_32;
  }
  unint64_t v21 = *(void *)(v32 + 8 * v20);
  int64_t v22 = i + 1;
  if (!v21)
  {
    int64_t v22 = i + 2;
    if (i + 2 >= v31) {
      goto LABEL_32;
    }
    unint64_t v21 = *(void *)(v32 + 8 * v22);
    if (!v21)
    {
      int64_t v22 = i + 3;
      if (i + 3 >= v31) {
        goto LABEL_32;
      }
      unint64_t v21 = *(void *)(v32 + 8 * v22);
      if (!v21)
      {
        int64_t v22 = i + 4;
        if (i + 4 >= v31) {
          goto LABEL_32;
        }
        unint64_t v21 = *(void *)(v32 + 8 * v22);
        if (!v21)
        {
          int64_t v23 = i + 5;
          if (i + 5 < v31)
          {
            unint64_t v21 = *(void *)(v32 + 8 * v23);
            if (v21)
            {
              int64_t v22 = i + 5;
              goto LABEL_26;
            }
            while (1)
            {
              int64_t v22 = v23 + 1;
              if (__OFADD__(v23, 1)) {
                goto LABEL_36;
              }
              if (v22 >= v31) {
                break;
              }
              unint64_t v21 = *(void *)(v32 + 8 * v22);
              ++v23;
              if (v21) {
                goto LABEL_26;
              }
            }
          }
LABEL_32:
          sub_100008A74();
          return (unint64_t)v2;
        }
      }
    }
  }
LABEL_26:
  uint64_t v34 = (v21 - 1) & v21;
  unint64_t v19 = __clz(__rbit64(v21)) + (v22 << 6);
  for (i = v22; ; unint64_t v19 = __clz(__rbit64(v5)) | (i << 6))
  {
    unint64_t v24 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v19);
    uint64_t v35 = *v24;
    uint64_t v36 = v24[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_100008A7C(v6, v7);
    sub_100008A7C(v7, v40);
    sub_100008A7C(v40, &v38);
    unint64_t result = sub_10000809C(v35, v36);
    unint64_t v25 = result;
    if (v26)
    {
      int64_t v33 = i;
      uint64_t v12 = v7;
      uint64_t v13 = v6;
      uint64_t v14 = v1;
      id v15 = v11;
      uint64_t v16 = v10;
      uint64_t v17 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *uint64_t v17 = v35;
      v17[1] = v36;
      uint64_t v10 = v16;
      uint64_t v11 = v15;
      uint64_t v1 = v14;
      uint64_t v6 = v13;
      uint64_t v7 = v12;
      int64_t i = v33;
      uint64_t v18 = (_OWORD *)(v2[7] + 32 * v25);
      sub_100004430((uint64_t)v18);
      unint64_t result = (unint64_t)sub_100008A7C(&v38, v18);
      unint64_t v5 = v34;
      if (!v34) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v27 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v27 = v35;
    v27[1] = v36;
    unint64_t result = (unint64_t)sub_100008A7C(&v38, (_OWORD *)(v2[7] + 32 * result));
    uint64_t v28 = v2[2];
    BOOL v29 = __OFADD__(v28, 1);
    uint64_t v30 = v28 + 1;
    if (v29) {
      goto LABEL_34;
    }
    v2[2] = v30;
    unint64_t v5 = v34;
    if (!v34) {
      goto LABEL_11;
    }
LABEL_10:
    uint64_t v34 = (v5 - 1) & v5;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

unint64_t sub_100006540(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100004EB0(&qword_1000107F8);
  uint64_t v2 = (void *)sub_10000A3D8();
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
    unint64_t result = sub_10000809C(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v11 = v5;
    v11[1] = v6;
    uint64_t v12 = (void *)(v2[7] + 16 * result);
    void *v12 = v8;
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

uint64_t sub_100006664(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000A0F8();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = &v16[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = sub_10000A178();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = &v16[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t result = sub_10000A0B8();
  if (result)
  {
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
    uint64_t v13 = sub_10000A208();
    v17[3] = v13;
    v17[4] = (uint64_t)&protocol witness table for SynchronizedExecutionManager;
    BOOL v14 = sub_1000078D0(v17);
    uint64_t v15 = a2 + OBJC_IVAR___PeopleSuggesterLighthousePlugin_executionManager;
    swift_beginAccess();
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16))(v14, v15, v13);
    sub_10000A168();
    sub_10000A158();
    return (*(uint64_t (**)(unsigned char *, uint64_t))(v9 + 8))(v11, v8);
  }
  return result;
}

uint64_t sub_100006874(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000A0F8();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = &v16[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = sub_10000A1A8();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = &v16[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t result = sub_10000A0C8();
  if (result)
  {
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
    uint64_t v13 = sub_10000A208();
    v17[3] = v13;
    v17[4] = (uint64_t)&protocol witness table for SynchronizedExecutionManager;
    BOOL v14 = sub_1000078D0(v17);
    uint64_t v15 = a2 + OBJC_IVAR___PeopleSuggesterLighthousePlugin_executionManager;
    swift_beginAccess();
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16))(v14, v15, v13);
    sub_10000A198();
    sub_10000A188();
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(unsigned char *, uint64_t))(v9 + 8))(v11, v8);
  }
  return result;
}

uint64_t sub_100006A88(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  unint64_t v24 = a4;
  uint64_t v25 = a3;
  uint64_t v6 = sub_100004EB0(&qword_100010800);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10000A0F8();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10000A1D8();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = sub_10000A0D8();
  if (result)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a1, v9);
    uint64_t v18 = sub_10000A208();
    v26[3] = v18;
    v26[4] = (uint64_t)&protocol witness table for SynchronizedExecutionManager;
    unint64_t v19 = sub_1000078D0(v26);
    uint64_t v20 = a2 + OBJC_IVAR___PeopleSuggesterLighthousePlugin_executionManager;
    swift_beginAccess();
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v18 - 8) + 16))(v19, v20, v18);
    uint64_t v21 = sub_10000A118();
    uint64_t v22 = *(void *)(v21 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v8, v25, v21);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v8, 0, 1, v21);
    sub_10000A1C8();
    unint64_t v23 = sub_10000A1B8();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    if (v23)
    {
      *unint64_t v24 = v23;
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t sub_100006D78(uint64_t a1, uint64_t a2)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = a2;
  sub_100007D90(a1, (uint64_t)sub_100008888, 0, isUniquelyReferenced_nonNull_native, &v8);
  uint64_t v6 = v8;
  swift_bridgeObjectRelease();
  if (v2) {
    swift_bridgeObjectRelease();
  }
  return v6;
}

Swift::Void __swiftcall Plugin.stop()()
{
  if (qword_100010680 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10000A238();
  sub_100004DDC(v0, (uint64_t)qword_1000108C0);
  uint64_t v1 = sub_10000A218();
  os_log_type_t v2 = sub_10000A2C8();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "PeopleSuggesterLighthousePlugin was signaled to Stop", v3, 2u);
    swift_slowDealloc();
  }

  swift_beginAccess();
  sub_10000A1E8();
  swift_endAccess();
}

id Plugin.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Plugin();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_1000070FC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000071D0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100007990((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_100007990((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100004430((uint64_t)v12);
  return v7;
}

uint64_t sub_1000071D0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_10000A338();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10000738C(a5, a6);
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
  uint64_t v8 = sub_10000A378();
  if (!v8)
  {
    sub_10000A398();
    __break(1u);
LABEL_17:
    uint64_t result = sub_10000A3E8();
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

uint64_t sub_10000738C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100007424(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100007604(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100007604(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100007424(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10000759C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_10000A368();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_10000A398();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_10000A2B8();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_10000A3E8();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_10000A398();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10000759C(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_100004EB0(&qword_1000107F0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100007604(char a1, int64_t a2, char a3, char *a4)
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
    sub_100004EB0(&qword_1000107F0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
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
  uint64_t result = sub_10000A3E8();
  __break(1u);
  return result;
}

uint64_t sub_100007754()
{
  return sub_100006664(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_100007770()
{
  return sub_100006874(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_10000778C()
{
  return sub_100006A88(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(unint64_t **)(v0 + 40));
}

uint64_t type metadata accessor for Plugin()
{
  uint64_t result = qword_1000107E0;
  if (!qword_1000107E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000077F8()
{
  return type metadata accessor for Plugin();
}

uint64_t sub_100007800()
{
  uint64_t result = sub_10000A208();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for PluginSubtask();
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

uint64_t *sub_1000078D0(uint64_t *a1)
{
  unint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_100007934(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PluginSubtask();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100007990(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000079F0(void *a1, char a2, void *a3)
{
  uint64_t v3 = a1[2];
  if (!v3) {
    return swift_bridgeObjectRelease();
  }
  uint64_t v7 = a1[4];
  uint64_t v6 = a1[5];
  uint64_t v8 = a1[7];
  uint64_t v44 = a1[6];
  swift_bridgeObjectRetain();
  int64_t v9 = (void *)*a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v11 = sub_10000809C(v7, v6);
  uint64_t v12 = v9[2];
  BOOL v13 = (v10 & 1) == 0;
  uint64_t v14 = v12 + v13;
  if (__OFADD__(v12, v13)) {
    goto LABEL_23;
  }
  char v15 = v10;
  if (v9[3] >= v14)
  {
    if (a2)
    {
      if (v10) {
        goto LABEL_10;
      }
    }
    else
    {
      sub_100008114();
      if (v15) {
        goto LABEL_10;
      }
    }
LABEL_13:
    unint64_t v19 = (void *)*a3;
    *(void *)(*a3 + 8 * (v11 >> 6) + 64) |= 1 << v11;
    uint64_t v20 = (uint64_t *)(v19[6] + 16 * v11);
    *uint64_t v20 = v7;
    v20[1] = v6;
    uint64_t v21 = (void *)(v19[7] + 16 * v11);
    *uint64_t v21 = v44;
    v21[1] = v8;
    uint64_t v22 = v19[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (v23)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v19[2] = v24;
    uint64_t v25 = v3 - 1;
    if (v3 == 1) {
      return swift_bridgeObjectRelease_n();
    }
    for (int64_t i = a1 + 11; ; i += 4)
    {
      uint64_t v28 = *(i - 3);
      uint64_t v27 = *(i - 2);
      uint64_t v29 = *(i - 1);
      uint64_t v30 = *i;
      int64_t v31 = (void *)*a3;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v32 = sub_10000809C(v28, v27);
      uint64_t v34 = v31[2];
      BOOL v35 = (v33 & 1) == 0;
      BOOL v23 = __OFADD__(v34, v35);
      uint64_t v36 = v34 + v35;
      if (v23) {
        break;
      }
      char v37 = v33;
      if (v31[3] < v36)
      {
        sub_1000082D0(v36, 1);
        unint64_t v32 = sub_10000809C(v28, v27);
        if ((v37 & 1) != (v38 & 1)) {
          goto LABEL_25;
        }
      }
      if (v37) {
        goto LABEL_10;
      }
      uint64_t v39 = (void *)*a3;
      *(void *)(*a3 + 8 * (v32 >> 6) + 64) |= 1 << v32;
      Class v40 = (uint64_t *)(v39[6] + 16 * v32);
      *Class v40 = v28;
      v40[1] = v27;
      id v41 = (void *)(v39[7] + 16 * v32);
      void *v41 = v29;
      v41[1] = v30;
      uint64_t v42 = v39[2];
      BOOL v23 = __OFADD__(v42, 1);
      uint64_t v43 = v42 + 1;
      if (v23) {
        goto LABEL_24;
      }
      v39[2] = v43;
      if (!--v25) {
        return swift_bridgeObjectRelease_n();
      }
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  sub_1000082D0(v14, a2 & 1);
  unint64_t v16 = sub_10000809C(v7, v6);
  if ((v15 & 1) == (v17 & 1))
  {
    unint64_t v11 = v16;
    if ((v15 & 1) == 0) {
      goto LABEL_13;
    }
LABEL_10:
    swift_allocError();
    swift_willThrow();
    swift_errorRetain();
    sub_100004EB0(&qword_100010818);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      return swift_errorRelease();
    }
    goto LABEL_26;
  }
LABEL_25:
  sub_10000A418();
  __break(1u);
LABEL_26:
  sub_10000A358(30);
  v46._object = (void *)0x800000010000B950;
  v46._countAndFlagsBits = 0xD00000000000001BLL;
  sub_10000A2A8(v46);
  sub_10000A388();
  v47._countAndFlagsBits = 39;
  v47._object = (void *)0xE100000000000000;
  sub_10000A2A8(v47);
  uint64_t result = sub_10000A3A8();
  __break(1u);
  return result;
}

uint64_t sub_100007D90(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v7 = sub_1000088D0();
  if (!v8) {
    goto LABEL_24;
  }
  uint64_t v11 = v7;
  uint64_t v12 = v8;
  uint64_t v13 = v9;
  uint64_t v14 = v10;
  char v15 = (void *)*a5;
  unint64_t v17 = sub_10000809C(v7, v8);
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
      uint64_t v24 = (void *)*a5;
      if (v16) {
        goto LABEL_9;
      }
    }
    else
    {
      sub_100008114();
      uint64_t v24 = (void *)*a5;
      if (v21) {
        goto LABEL_9;
      }
    }
LABEL_11:
    v24[(v17 >> 6) + 8] |= 1 << v17;
    char v26 = (uint64_t *)(v24[6] + 16 * v17);
    *char v26 = v11;
    v26[1] = v12;
    uint64_t v27 = (void *)(v24[7] + 16 * v17);
    *uint64_t v27 = v13;
    v27[1] = v14;
    uint64_t v28 = v24[2];
    BOOL v29 = __OFADD__(v28, 1);
    uint64_t v30 = v28 + 1;
    if (v29)
    {
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
    v24[2] = v30;
LABEL_13:
    uint64_t v31 = sub_1000088D0();
    if (v32)
    {
      uint64_t v35 = v31;
      uint64_t v36 = v32;
      uint64_t v37 = v33;
      uint64_t v38 = v34;
      do
      {
        uint64_t v43 = (void *)*a5;
        unint64_t v45 = sub_10000809C(v35, v36);
        uint64_t v46 = v43[2];
        BOOL v47 = (v44 & 1) == 0;
        uint64_t v48 = v46 + v47;
        if (__OFADD__(v46, v47)) {
          goto LABEL_25;
        }
        char v49 = v44;
        if (v43[3] < v48)
        {
          sub_1000082D0(v48, 1);
          unint64_t v50 = sub_10000809C(v35, v36);
          if ((v49 & 1) != (v51 & 1)) {
            goto LABEL_27;
          }
          unint64_t v45 = v50;
        }
        uint64_t v52 = (void *)*a5;
        if (v49)
        {
          swift_bridgeObjectRelease();
          uint64_t v39 = (void *)(v52[7] + 16 * v45);
          swift_bridgeObjectRelease();
          *uint64_t v39 = v37;
          v39[1] = v38;
        }
        else
        {
          v52[(v45 >> 6) + 8] |= 1 << v45;
          uint64_t v53 = (uint64_t *)(v52[6] + 16 * v45);
          *uint64_t v53 = v35;
          v53[1] = v36;
          v54 = (void *)(v52[7] + 16 * v45);
          void *v54 = v37;
          v54[1] = v38;
          uint64_t v55 = v52[2];
          BOOL v29 = __OFADD__(v55, 1);
          uint64_t v56 = v55 + 1;
          if (v29) {
            goto LABEL_26;
          }
          v52[2] = v56;
        }
        uint64_t v35 = sub_1000088D0();
        uint64_t v36 = v40;
        uint64_t v37 = v41;
        uint64_t v38 = v42;
      }
      while (v40);
    }
LABEL_24:
    swift_release();
    swift_bridgeObjectRelease();
    sub_100008A74();
    return swift_release();
  }
  sub_1000082D0(v20, a4 & 1);
  unint64_t v22 = sub_10000809C(v11, v12);
  if ((v21 & 1) == (v23 & 1))
  {
    unint64_t v17 = v22;
    uint64_t v24 = (void *)*a5;
    if ((v21 & 1) == 0) {
      goto LABEL_11;
    }
LABEL_9:
    swift_bridgeObjectRelease();
    uint64_t v25 = (void *)(v24[7] + 16 * v17);
    swift_bridgeObjectRelease();
    *uint64_t v25 = v13;
    v25[1] = v14;
    goto LABEL_13;
  }
LABEL_27:
  uint64_t result = sub_10000A418();
  __break(1u);
  return result;
}

unint64_t sub_10000809C(uint64_t a1, uint64_t a2)
{
  sub_10000A478();
  sub_10000A298();
  Swift::Int v4 = sub_10000A498();
  return sub_1000085F8(a1, a2, v4);
}

void *sub_100008114()
{
  unint64_t v1 = v0;
  sub_100004EB0(&qword_1000107F8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10000A3B8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *unint64_t v1 = v4;
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
    unint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = (uint64_t *)(*(void *)(v2 + 56) + v16);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    char v23 = (void *)(*(void *)(v4 + 48) + v16);
    *char v23 = v19;
    v23[1] = v18;
    uint64_t v24 = (void *)(*(void *)(v4 + 56) + v16);
    *uint64_t v24 = v21;
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

uint64_t sub_1000082D0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100004EB0(&qword_1000107F8);
  char v42 = a2;
  uint64_t v6 = sub_10000A3C8();
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
    sub_10000A478();
    sub_10000A298();
    uint64_t result = sub_10000A498();
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
    void *v19 = v34;
    v19[1] = v33;
    uint64_t v20 = (void *)(*(void *)(v7 + 56) + v18);
    *uint64_t v20 = v36;
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

unint64_t sub_1000085F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_10000A408() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        int64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_10000A408() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_1000086DC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000086FC(a1, a2, a3, (void *)*v3);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_1000086FC(char a1, int64_t a2, char a3, void *a4)
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
    sub_100004EB0(&qword_100010820);
    unint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 5);
  }
  else
  {
    unint64_t v10 = &_swiftEmptyArrayStorage;
  }
  unint64_t v13 = (unint64_t)(v10 + 4);
  unint64_t v14 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v13 >= v14 + 32 * v8) {
      memmove(v10 + 4, a4 + 4, 32 * v8);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 32 * v8 || v13 >= v14 + 32 * v8)
  {
    sub_100004EB0(&qword_100010828);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_10000A3E8();
  __break(1u);
  return result;
}

uint64_t sub_100008888@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = a1[2];
  uint64_t v4 = a1[3];
  *a2 = *a1;
  a2[1] = v2;
  a2[2] = v3;
  a2[3] = v4;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1000088D0()
{
  void (*v14)(uint64_t *__return_ptr, void *);
  uint64_t result;
  int64_t v16;
  int64_t v17;
  uint64_t v18;
  unint64_t v19;
  int64_t v20;
  int64_t v21;
  uint64_t v22;
  void v23[4];

  uint64_t v1 = *v0;
  int64_t v3 = v0[3];
  unint64_t v2 = v0[4];
  int64_t v4 = v3;
  if (v2)
  {
    uint64_t v5 = (v2 - 1) & v2;
    unint64_t v6 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_3:
    uint64_t v7 = 16 * v6;
    uint64_t v8 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v6);
    uint64_t v9 = *v8;
    uint64_t v10 = v8[1];
    int64_t v11 = (uint64_t *)(*(void *)(v1 + 56) + v7);
    uint64_t v12 = *v11;
    uint64_t v13 = v11[1];
    v0[3] = v4;
    v0[4] = v5;
    unint64_t v14 = (void (*)(uint64_t *__return_ptr, void *))v0[5];
    v23[0] = v9;
    v23[1] = v10;
    v23[2] = v12;
    v23[3] = v13;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v14(&v22, v23);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v22;
  }
  unint64_t v16 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
  }
  else
  {
    unint64_t v17 = (unint64_t)(v0[2] + 64) >> 6;
    if (v16 < v17)
    {
      uint64_t v18 = v0[1];
      uint64_t v19 = *(void *)(v18 + 8 * v16);
      if (v19)
      {
LABEL_7:
        uint64_t v5 = (v19 - 1) & v19;
        unint64_t v6 = __clz(__rbit64(v19)) + (v16 << 6);
        int64_t v4 = v16;
        goto LABEL_3;
      }
      uint64_t v20 = v3 + 2;
      int64_t v4 = v3 + 1;
      if (v3 + 2 < v17)
      {
        uint64_t v19 = *(void *)(v18 + 8 * v20);
        if (v19)
        {
LABEL_10:
          unint64_t v16 = v20;
          goto LABEL_7;
        }
        int64_t v4 = v3 + 2;
        if (v3 + 3 < v17)
        {
          uint64_t v19 = *(void *)(v18 + 8 * (v3 + 3));
          if (v19)
          {
            unint64_t v16 = v3 + 3;
            goto LABEL_7;
          }
          uint64_t v20 = v3 + 4;
          int64_t v4 = v3 + 3;
          if (v3 + 4 < v17)
          {
            uint64_t v19 = *(void *)(v18 + 8 * v20);
            if (v19) {
              goto LABEL_10;
            }
            unint64_t v16 = v3 + 5;
            int64_t v4 = v3 + 4;
            if (v3 + 5 < v17)
            {
              uint64_t v19 = *(void *)(v18 + 8 * v16);
              if (v19) {
                goto LABEL_7;
              }
              int64_t v4 = v17 - 1;
              unint64_t v21 = v3 + 6;
              while (v17 != v21)
              {
                uint64_t v19 = *(void *)(v18 + 8 * v21++);
                if (v19)
                {
                  unint64_t v16 = v21 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }
    uint64_t result = 0;
    v0[3] = v4;
    v0[4] = 0;
  }
  return result;
}

uint64_t sub_100008A74()
{
  return swift_release();
}

_OWORD *sub_100008A7C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100008A8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PluginSubtask();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_100008AF0()
{
  unint64_t result = qword_100010830;
  if (!qword_100010830)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010830);
  }
  return result;
}

uint64_t *sub_100008B44(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void *initializeBufferWithCopyOfBuffer for PluginError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for PluginError()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for PluginError(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for PluginError(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for PluginError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PluginError(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PluginError(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_100008CE8()
{
  return 0;
}

ValueMetadata *type metadata accessor for PluginError()
{
  return &type metadata for PluginError;
}

void sub_100008D08(void *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v65 = sub_10000A038();
  uint64_t v63 = *(void *)(v65 - 8);
  __chkstk_darwin(v65);
  v61 = (char *)&v57 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100004EB0(&qword_1000108A8);
  __chkstk_darwin(v7 - 8);
  unint64_t v60 = (char *)&v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = sub_10000A058();
  uint64_t v62 = *(void *)(v64 - 8);
  __chkstk_darwin(v64);
  uint64_t v10 = (char *)&v57 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100010680 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_10000A238();
  sub_100004DDC(v11, (uint64_t)qword_1000108C0);
  uint64_t v12 = sub_10000A218();
  os_log_type_t v13 = sub_10000A2C8();
  if (os_log_type_enabled(v12, v13))
  {
    unint64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Reading Trial config", v14, 2u);
    swift_slowDealloc();
  }

  if (qword_100010688 != -1) {
    swift_once();
  }
  NSString v15 = sub_10000A278();
  uint64_t v59 = a2;
  NSString v16 = sub_10000A278();
  unint64_t v17 = a3;
  id v18 = [a1 levelForFactor:v15 withNamespaceName:v16];

  if (v18)
  {
    id v58 = v18;
    id v19 = [v18 fileValue];
    if (v19)
    {
      uint64_t v20 = v19;
      id v21 = [v19 path];

      if (v21)
      {
        sub_10000A288();

        uint64_t v22 = v62;
        uint64_t v23 = v64;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v62 + 56))(v60, 1, 1, v64);
        (*(void (**)(char *, void, uint64_t))(v63 + 104))(v61, enum case for URL.DirectoryHint.inferFromPath(_:), v65);
        sub_10000A048();
        uint64_t v24 = v66;
        uint64_t v25 = sub_10000A068();
        if (v24)
        {
          (*(void (**)(char *, uint64_t))(v22 + 8))(v10, v23);
        }
        else
        {
          uint64_t v49 = v25;
          unint64_t v50 = v26;
          (*(void (**)(char *, uint64_t))(v22 + 8))(v10, v23);
          char v51 = self;
          Class isa = sub_10000A078().super.isa;
          v68[0] = 0;
          id v53 = [v51 JSONObjectWithData:isa options:0 error:v68];

          if (v53)
          {
            id v54 = v68[0];
            sub_10000A348();
            sub_100009DB4(v49, v50);

            swift_unknownObjectRelease();
            sub_100004EB0(&qword_1000108B0);
            swift_dynamicCast();
            return;
          }
          id v56 = v68[0];
          sub_10000A028();

          swift_willThrow();
          sub_100009DB4(v49, v50);
        }
        swift_errorRetain();
        swift_errorRetain();
        char v27 = sub_10000A218();
        os_log_type_t v28 = sub_10000A2E8();
        if (os_log_type_enabled(v27, v28))
        {
          BOOL v29 = (uint8_t *)swift_slowAlloc();
          uint64_t v30 = (void *)swift_slowAlloc();
          *(_DWORD *)BOOL v29 = 138412290;
          swift_errorRetain();
          uint64_t v31 = (void *)_swift_stdlib_bridgeErrorToNSError();
          v68[0] = v31;
          sub_10000A328();
          *uint64_t v30 = v31;
          swift_errorRelease();
          swift_errorRelease();
          _os_log_impl((void *)&_mh_execute_header, v27, v28, "TrialRecipe: Failed to retrieve the recipe. Error: %@.", v29, 0xCu);
          sub_100004EB0(&qword_100010730);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
          swift_errorRelease();
          swift_errorRelease();
        }

        sub_100009C74();
        swift_allocError();
        *uint64_t v48 = 6;
        swift_willThrow();

        swift_errorRelease();
      }
      else
      {
        unint64_t v41 = v17;
        id v42 = a1;
        swift_bridgeObjectRetain_n();
        id v43 = v42;
        char v44 = sub_10000A218();
        os_log_type_t v45 = sub_10000A2E8();
        if (os_log_type_enabled(v44, v45))
        {
          uint64_t v46 = (uint8_t *)swift_slowAlloc();
          v68[0] = (id)swift_slowAlloc();
          *(_DWORD *)uint64_t v46 = 136315138;
          swift_bridgeObjectRetain();
          uint64_t v67 = sub_1000070FC(v59, v41, (uint64_t *)v68);
          sub_10000A328();

          swift_bridgeObjectRelease_n();
          _os_log_impl((void *)&_mh_execute_header, v44, v45, "Config recipe path not found in %s namespace", v46, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        sub_100009C74();
        swift_allocError();
        *uint64_t v55 = 4;
        swift_willThrow();
      }
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    id v32 = a1;
    swift_bridgeObjectRetain_n();
    id v33 = v32;
    uint64_t v34 = sub_10000A218();
    os_log_type_t v35 = sub_10000A2E8();
    int v36 = v35;
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v37 = swift_slowAlloc();
      LODWORD(v65) = v36;
      uint64_t v38 = v37;
      v66 = (void *)swift_slowAlloc();
      v68[0] = v66;
      *(_DWORD *)uint64_t v38 = 136315394;
      uint64_t v39 = qword_1000108D8;
      unint64_t v40 = unk_1000108E0;
      swift_bridgeObjectRetain();
      uint64_t v67 = sub_1000070FC(v39, v40, (uint64_t *)v68);
      sub_10000A328();
      swift_bridgeObjectRelease();
      *(_WORD *)(v38 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v67 = sub_1000070FC(v59, v17, (uint64_t *)v68);
      sub_10000A328();

      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v34, (os_log_type_t)v65, "Trial factor %s not found in %s namespace", (uint8_t *)v38, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    sub_100009C74();
    swift_allocError();
    *BOOL v47 = 5;
    swift_willThrow();
  }
}

void sub_1000096C0(void *a1)
{
  if (qword_100010680 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10000A238();
  sub_100004DDC(v2, (uint64_t)qword_1000108C0);
  uint64_t v3 = sub_10000A218();
  os_log_type_t v4 = sub_10000A2C8();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Reading Trial identifier", v5, 2u);
    swift_slowDealloc();
  }

  NSString v6 = sub_10000A278();
  id v7 = [a1 backgroundMLTaskIdentifiersWithNamespaceName:v6];

  if (v7)
  {
    id v8 = [v7 treatmentId];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = sub_10000A288();
      unint64_t v12 = v11;
    }
    else
    {
      uint64_t v10 = 0;
      unint64_t v12 = 0;
    }
    id v17 = [v7 factorPackId];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = sub_10000A288();
      unint64_t v21 = v20;

      if (!v12)
      {
        if (v21)
        {
          uint64_t v10 = v19;
          unint64_t v12 = v21;
          goto LABEL_18;
        }
        goto LABEL_21;
      }
    }
    else if (!v12)
    {
LABEL_21:
      id v32 = sub_10000A218();
      os_log_type_t v33 = sub_10000A2E8();
      if (os_log_type_enabled(v32, v33))
      {
        uint64_t v34 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v34 = 0;
        _os_log_impl((void *)&_mh_execute_header, v32, v33, "Both the treatmentId and factorPackId were nil", v34, 2u);
        swift_slowDealloc();
      }

      sub_100009C74();
      swift_allocError();
      *os_log_type_t v35 = 8;
      swift_willThrow();

      return;
    }
    swift_bridgeObjectRelease();
LABEL_18:
    id v22 = [v7 bmltTaskId];
    sub_10000A288();

    swift_bridgeObjectRetain();
    LODWORD(v37) = [v7 deploymentId];
    sub_10000A3F8();
    sub_10000A108();
    id v23 = v7;
    swift_bridgeObjectRetain();
    id v24 = v23;
    uint64_t v25 = sub_10000A218();
    os_log_type_t v26 = sub_10000A2D8();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = swift_slowAlloc();
      uint64_t v37 = swift_slowAlloc();
      *(_DWORD *)uint64_t v27 = 136315650;
      uint64_t v36 = v10;
      id v28 = [v24 bmltTaskId];
      uint64_t v29 = sub_10000A288();
      unint64_t v31 = v30;

      sub_1000070FC(v29, v31, &v37);
      sub_10000A328();

      swift_bridgeObjectRelease();
      *(_WORD *)(v27 + 12) = 2080;
      swift_bridgeObjectRetain();
      sub_1000070FC(v36, v12, &v37);
      sub_10000A328();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v27 + 22) = 1024;
      [v24 deploymentId];

      sub_10000A328();
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "Trial info - task: %s treatment: %s deployment: %d", (uint8_t *)v27, 0x1Cu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return;
  }
  os_log_type_t v13 = sub_10000A218();
  os_log_type_t v14 = sub_10000A2E8();
  if (os_log_type_enabled(v13, v14))
  {
    NSString v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)NSString v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Not enrolled in any background ML task for the given namespace", v15, 2u);
    swift_slowDealloc();
  }

  sub_100009C74();
  swift_allocError();
  *NSString v16 = 7;
  swift_willThrow();
}

unint64_t sub_100009C74()
{
  unint64_t result = qword_1000108A0;
  if (!qword_1000108A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000108A0);
  }
  return result;
}

BOOL sub_100009CC8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_100009CDC()
{
  Swift::UInt v1 = *v0;
  sub_10000A478();
  sub_10000A488(v1);
  return sub_10000A498();
}

void sub_100009D24()
{
  sub_10000A488(*v0);
}

Swift::Int sub_100009D50()
{
  Swift::UInt v1 = *v0;
  sub_10000A478();
  sub_10000A488(v1);
  return sub_10000A498();
}

void sub_100009D94()
{
  qword_1000108D8 = 0x657069636572;
  unk_1000108E0 = 0xE600000000000000;
}

uint64_t sub_100009DB4(uint64_t a1, unint64_t a2)
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

unsigned char *initializeBufferWithCopyOfBuffer for TrialAssetError(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for TrialAssetError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for TrialAssetError(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 8;
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
        JUMPOUT(0x100009F78);
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
          *uint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

uint64_t sub_100009FA0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100009FA8(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for TrialAssetError()
{
  return &type metadata for TrialAssetError;
}

unint64_t sub_100009FC4()
{
  unint64_t result = qword_1000108B8;
  if (!qword_1000108B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000108B8);
  }
  return result;
}

uint64_t sub_10000A018()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_10000A028()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_10000A038()
{
  return type metadata accessor for URL.DirectoryHint();
}

uint64_t sub_10000A048()
{
  return URL.init(filePath:directoryHint:relativeTo:)();
}

uint64_t sub_10000A058()
{
  return type metadata accessor for URL();
}

uint64_t sub_10000A068()
{
  return Data.init(contentsOf:options:)();
}

NSData sub_10000A078()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_10000A088()
{
  return SubtaskName.description.getter();
}

uint64_t sub_10000A098()
{
  return type metadata accessor for SubtaskName();
}

uint64_t sub_10000A0A8()
{
  return userDefaults.getter();
}

uint64_t sub_10000A0B8()
{
  return ConfigManager.shouldAttemptLocalTraining.getter();
}

uint64_t sub_10000A0C8()
{
  return ConfigManager.shouldAttemptModelMonitoring.getter();
}

uint64_t sub_10000A0D8()
{
  return ConfigManager.shouldAttemptShadowEvaluation.getter();
}

uint64_t sub_10000A0E8()
{
  return ConfigManager.init(recipe:)();
}

uint64_t sub_10000A0F8()
{
  return type metadata accessor for ConfigManager();
}

uint64_t sub_10000A108()
{
  return TrialIdentifier.init(task:treatment:deployment:)();
}

uint64_t sub_10000A118()
{
  return type metadata accessor for TrialIdentifier();
}

uint64_t sub_10000A128()
{
  return ComputationState.description.getter();
}

uint64_t sub_10000A138()
{
  return type metadata accessor for ComputationState();
}

uint64_t sub_10000A148()
{
  return dispatch thunk of ExecutionManager.shouldStop.getter();
}

void sub_10000A158()
{
}

uint64_t sub_10000A168()
{
  return LocalTrainingManager.init(config:executionManager:)();
}

uint64_t sub_10000A178()
{
  return type metadata accessor for LocalTrainingManager();
}

unint64_t sub_10000A188()
{
  return (unint64_t)ModelMonitoringManager.attemptModelMonitoring()();
}

uint64_t sub_10000A198()
{
  return ModelMonitoringManager.init(config:executionManager:)();
}

uint64_t sub_10000A1A8()
{
  return type metadata accessor for ModelMonitoringManager();
}

unint64_t sub_10000A1B8()
{
  return (unint64_t)ShadowEvaluationManager.attemptShadowEvaluation()();
}

uint64_t sub_10000A1C8()
{
  return ShadowEvaluationManager.init(config:executionManager:trialIdentifier:)();
}

uint64_t sub_10000A1D8()
{
  return type metadata accessor for ShadowEvaluationManager();
}

void sub_10000A1E8()
{
}

uint64_t _s31PeopleSuggesterLighthousePlugin0D0C16executionManager33_F9833457DB168D2D6A134FD34B1C926ELL0abC0021SynchronizedExecutionF0Vvpfi_0()
{
  return SynchronizedExecutionManager.init()();
}

uint64_t sub_10000A208()
{
  return type metadata accessor for SynchronizedExecutionManager();
}

uint64_t sub_10000A218()
{
  return Logger.logObject.getter();
}

uint64_t sub_10000A228()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10000A238()
{
  return type metadata accessor for Logger();
}

NSDictionary sub_10000A248()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_10000A258()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000A268()
{
  return Dictionary.description.getter();
}

NSString sub_10000A278()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10000A288()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000A298()
{
  return String.hash(into:)();
}

void sub_10000A2A8(Swift::String a1)
{
}

Swift::Int sub_10000A2B8()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_10000A2C8()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_10000A2D8()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_10000A2E8()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_10000A2F8()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_10000A308()
{
  return NSUserDefaults.shouldCompute(_:)();
}

uint64_t sub_10000A318()
{
  return NSUserDefaults.saveComputationDate(_:)();
}

uint64_t sub_10000A328()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_10000A338()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_10000A348()
{
  return _bridgeAnyObjectToAny(_:)();
}

void sub_10000A358(Swift::Int a1)
{
}

uint64_t sub_10000A368()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_10000A378()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_10000A388()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_10000A398()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10000A3A8()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10000A3B8()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_10000A3C8()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_10000A3D8()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_10000A3E8()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_10000A3F8()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_10000A408()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10000A418()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_10000A428()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_10000A438()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_10000A448()
{
  return Error._code.getter();
}

uint64_t sub_10000A458()
{
  return Error._domain.getter();
}

uint64_t sub_10000A468()
{
  return Error._userInfo.getter();
}

uint64_t sub_10000A478()
{
  return Hasher.init(_seed:)();
}

void sub_10000A488(Swift::UInt a1)
{
}

Swift::Int sub_10000A498()
{
  return Hasher._finalize()();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
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

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
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
  return _objc_msgSendSuper2(a1, a2);
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

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
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

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
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

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}