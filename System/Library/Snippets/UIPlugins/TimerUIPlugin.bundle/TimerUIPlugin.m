uint64_t sub_1DD4()
{
  uint64_t v0;

  v0 = sub_1DD20();
  sub_4DF0(v0, qword_28168);
  sub_4D88(v0, (uint64_t)qword_28168);
  return sub_1DD10();
}

void sub_1E4C(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for TimerSelectorModel(0);
  __chkstk_darwin(v4 - 8);
  v6 = (char *)v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E390();
  sub_5B58(&qword_281C0, (void (*)(uint64_t))&type metadata accessor for Context);
  *a2 = sub_1DE20();
  a2[1] = v7;
  v8 = (int *)type metadata accessor for TimerSelector(0);
  uint64_t v9 = v8[7];
  id v10 = [objc_allocWithZone((Class)MTTimerManager) init];
  *(uint64_t *)((char *)a2 + v9) = (uint64_t)v10;
  uint64_t v11 = qword_28160;
  id v12 = v10;
  if (v11 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_1DD20();
  sub_4D88(v13, (uint64_t)qword_28168);
  sub_5698(a1, (uint64_t)v6, type metadata accessor for TimerSelectorModel);
  v14 = sub_1DD00();
  os_log_type_t v15 = sub_1E490();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v16 = 134217984;
    v24[0] = v16 + 4;
    v17 = a2;
    v18 = v8;
    id v19 = v12;
    uint64_t v20 = a1;
    uint64_t v21 = *(void *)(*(void *)v6 + 16);
    sub_6418((uint64_t)v6, type metadata accessor for TimerSelectorModel);
    v24[1] = v21;
    a1 = v20;
    id v12 = v19;
    v8 = v18;
    a2 = v17;
    sub_1E4E0();
    _os_log_impl(&dword_0, v14, v15, "[TimerSelector.init] Initializing for %ld timers.", v16, 0xCu);
    swift_slowDealloc();
  }
  else
  {
    sub_6418((uint64_t)v6, type metadata accessor for TimerSelectorModel);
  }

  sub_5698(a1, (uint64_t)a2 + v8[5], type metadata accessor for TimerSelectorModel);
  id v22 = [v12 timersSync];

  if (v22)
  {
    sub_64EC(0, &qword_281C8);
    uint64_t v23 = sub_1E430();

    sub_6418(a1, type metadata accessor for TimerSelectorModel);
    *(uint64_t *)((char *)a2 + v8[6]) = v23;
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_2168@<X0>(uint64_t a1@<X8>)
{
  uint64_t v44 = a1;
  uint64_t v1 = sub_1E360();
  uint64_t v42 = *(void *)(v1 - 8);
  uint64_t v43 = v1;
  __chkstk_darwin(v1);
  v41 = (char *)v36 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1DD70();
  uint64_t v39 = *(void *)(v3 - 8);
  uint64_t v40 = v3;
  __chkstk_darwin(v3);
  v38 = (char *)v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_4F84(&qword_28278);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (void *)((char *)v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = type metadata accessor for TimerSelector(0);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  __chkstk_darwin(v8 - 8);
  uint64_t v11 = sub_4F84(&qword_28280);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = sub_4F84(&qword_28288);
  uint64_t v15 = *(void *)(v37 - 8);
  __chkstk_darwin(v37);
  v17 = (char *)v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36[0] = sub_4F84(&qword_28290);
  __chkstk_darwin(v36[0]);
  id v19 = (char *)v36 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_5698(v36[1], (uint64_t)v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for TimerSelector);
  unint64_t v20 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v21 = swift_allocObject();
  sub_62E4((uint64_t)v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v21 + v20, type metadata accessor for TimerSelector);
  sub_4F84(&qword_28298);
  sub_7BA8(&qword_282A0, &qword_28298);
  sub_1E2C0();
  *uint64_t v7 = sub_1E150();
  uint64_t v22 = enum case for HostBackground.color(_:);
  uint64_t v23 = sub_1E2D0();
  uint64_t v24 = *(void *)(v23 - 8);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v24 + 104))(v7, v22, v23);
  (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v24 + 56))(v7, 0, 1, v23);
  sub_7BA8(&qword_282A8, &qword_28280);
  sub_1E0B0();
  sub_6528((uint64_t)v7, &qword_28278);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  uint64_t KeyPath = swift_getKeyPath();
  v27 = v38;
  uint64_t v26 = v39;
  uint64_t v28 = v40;
  (*(void (**)(char *, void, uint64_t))(v39 + 104))(v38, enum case for ColorScheme.dark(_:), v40);
  v29 = (uint64_t *)&v19[*(int *)(v36[0] + 36)];
  uint64_t v30 = sub_4F84(&qword_282B0);
  (*(void (**)(char *, char *, uint64_t))(v26 + 16))((char *)v29 + *(int *)(v30 + 28), v27, v28);
  uint64_t *v29 = KeyPath;
  uint64_t v31 = v37;
  (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v19, v17, v37);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v27, v28);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v31);
  v33 = v41;
  uint64_t v32 = v42;
  uint64_t v34 = v43;
  (*(void (**)(char *, void, uint64_t))(v42 + 104))(v41, enum case for ComponentStackBottomSpacing.none(_:), v43);
  sub_5764();
  sub_1E0C0();
  (*(void (**)(char *, uint64_t))(v32 + 8))(v33, v34);
  return sub_6528((uint64_t)v19, &qword_28290);
}

uint64_t sub_27A8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TimerSelector(0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2);
  uint64_t v5 = sub_1E330();
  __chkstk_darwin(v5 - 8);
  type metadata accessor for TimerSelectorModel(0);
  sub_4F84(&qword_281D0);
  sub_1DC60();
  uint64_t v11 = &type metadata for String;
  uint64_t v12 = &protocol witness table for String;
  uint64_t v10 = 0;
  memset(v9, 0, sizeof(v9));
  sub_1E320();
  sub_5698(a1, (uint64_t)v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for TimerSelector);
  unint64_t v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = swift_allocObject();
  sub_62E4((uint64_t)v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6, type metadata accessor for TimerSelector);
  sub_4F84(&qword_282C8);
  sub_5A2C();
  return sub_1E310();
}

uint64_t sub_29AC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TimerSelector(0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2 - 8);
  uint64_t v5 = swift_bridgeObjectRetain();
  size_t v6 = sub_5BA0(v5);
  swift_bridgeObjectRelease();
  v13[3] = v6;
  swift_getKeyPath();
  sub_5698(a1, (uint64_t)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for TimerSelector);
  unint64_t v7 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v8 = swift_allocObject();
  sub_62E4((uint64_t)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v8 + v7, type metadata accessor for TimerSelector);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = sub_5F48;
  *(void *)(v9 + 24) = v8;
  sub_4F84(&qword_282E0);
  sub_4F84(&qword_282E8);
  sub_7BA8(&qword_282F0, &qword_282E0);
  uint64_t v10 = type metadata accessor for TimerItemView(255);
  uint64_t v11 = sub_5B58(&qword_282D8, (void (*)(uint64_t))type metadata accessor for TimerItemView);
  v13[1] = v10;
  v13[2] = v11;
  swift_getOpaqueTypeConformance2();
  return sub_1E280();
}

uint64_t sub_2C18@<X0>(uint64_t a1@<X1>, id *a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v34 = a3;
  uint64_t v5 = type metadata accessor for TimerSelector(0);
  uint64_t v6 = v5 - 8;
  uint64_t v28 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v29 = v7;
  uint64_t v33 = (uint64_t)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for SiriTimerSnippetModel(0);
  uint64_t v27 = *(void *)(v8 - 8);
  uint64_t v9 = *(void *)(v27 + 64);
  uint64_t v10 = __chkstk_darwin(v8 - 8);
  uint64_t v11 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v27 - v12;
  uint64_t v31 = type metadata accessor for TimerItemView(0);
  __chkstk_darwin(v31);
  uint64_t v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = sub_4F84(&qword_282E8);
  uint64_t v30 = *(void *)(v32 - 8);
  __chkstk_darwin(v32);
  v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_5698(a1, (uint64_t)v13, type metadata accessor for SiriTimerSnippetModel);
  unint64_t v18 = *(unint64_t *)((char *)a2 + *(int *)(v6 + 32));
  uint64_t v36 = a1;
  swift_bridgeObjectRetain();
  id v19 = sub_314C(sub_6068, (uint64_t)v35, v18);
  swift_bridgeObjectRelease();
  unint64_t v20 = *(id *)((char *)a2 + *(int *)(v6 + 36));
  if (*a2)
  {
    sub_3274((uint64_t)v13, v19, v20, 0, 0xE000000000000000, *a2, (uint64_t)v15);
    sub_5698(a1, (uint64_t)v11, type metadata accessor for SiriTimerSnippetModel);
    uint64_t v21 = v33;
    sub_5698((uint64_t)a2, v33, type metadata accessor for TimerSelector);
    unint64_t v22 = (*(unsigned __int8 *)(v27 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80);
    unint64_t v23 = (v9 + *(unsigned __int8 *)(v28 + 80) + v22) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80);
    uint64_t v24 = swift_allocObject();
    sub_62E4((uint64_t)v11, v24 + v22, type metadata accessor for SiriTimerSnippetModel);
    sub_62E4(v21, v24 + v23, type metadata accessor for TimerSelector);
    sub_5B58(&qword_282D8, (void (*)(uint64_t))type metadata accessor for TimerItemView);
    sub_1E0A0();
    swift_release();
    sub_6418((uint64_t)v15, type metadata accessor for TimerItemView);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v30 + 32))(v34, v17, v32);
  }
  else
  {
    sub_1E390();
    sub_5B58(&qword_281C0, (void (*)(uint64_t))&type metadata accessor for Context);
    id v26 = v20;
    uint64_t result = sub_1DE10();
    __break(1u);
  }
  return result;
}

uint64_t sub_30B0(id *a1, void *a2)
{
  id v3 = [*a1 timerIDString];
  uint64_t v4 = sub_1E3E0();
  uint64_t v6 = v5;

  if (v4 == *a2 && v6 == a2[1]) {
    char v8 = 1;
  }
  else {
    char v8 = sub_1E840();
  }
  swift_bridgeObjectRelease();
  return v8 & 1;
}

void *sub_314C(uint64_t (*a1)(id *), uint64_t a2, unint64_t a3)
{
  if (a3 >> 62) {
    goto LABEL_16;
  }
  uint64_t v6 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain();
  for (; v6; uint64_t v6 = sub_1E5B0())
  {
    uint64_t v7 = 4;
    while (1)
    {
      id v8 = (a3 & 0xC000000000000001) != 0 ? (id)sub_1E560() : *(id *)(a3 + 8 * v7);
      uint64_t v9 = v8;
      uint64_t v10 = v7 - 3;
      if (__OFADD__(v7 - 4, 1)) {
        break;
      }
      id v13 = v8;
      char v11 = a1(&v13);
      if (v3)
      {
        swift_bridgeObjectRelease();

        return v9;
      }
      if (v11)
      {
        swift_bridgeObjectRelease();
        return v9;
      }

      ++v7;
      if (v10 == v6) {
        goto LABEL_11;
      }
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
  }
LABEL_11:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_3274@<X0>(uint64_t a1@<X0>, void *a2@<X1>, void *a3@<X2>, void *a4@<X3>, uint64_t a5@<X4>, void *a6@<X5>, uint64_t a7@<X8>)
{
  id v75 = a4;
  id v76 = a3;
  uint64_t v12 = sub_4F84(&qword_28308);
  __chkstk_darwin(v12 - 8);
  v77 = (char *)&v68 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = type metadata accessor for SiriTimerSnippetModel(0);
  uint64_t v14 = __chkstk_darwin(v74);
  uint64_t v16 = (char *)&v68 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __chkstk_darwin(v14);
  id v19 = (char *)&v68 - v18;
  __chkstk_darwin(v17);
  uint64_t v21 = (uint64_t *)((char *)&v68 - v20);
  uint64_t v78 = 0;
  sub_4F84(&qword_28310);
  sub_1E200();
  *(_OWORD *)a7 = v80;
  sub_19DA8();
  uint64_t v78 = v22;
  uint64_t v79 = v23;
  sub_4F84(&qword_28318);
  sub_1E200();
  uint64_t v24 = v81;
  *(_OWORD *)(a7 + 16) = v80;
  *(void *)(a7 + 32) = v24;
  if (qword_28160 != -1) {
    swift_once();
  }
  uint64_t v25 = sub_1DD20();
  sub_4D88(v25, (uint64_t)qword_28168);
  sub_5698(a1, (uint64_t)v21, type metadata accessor for SiriTimerSnippetModel);
  id v26 = sub_1DD00();
  os_log_type_t v27 = sub_1E490();
  if (os_log_type_enabled(v26, v27))
  {
    v71 = v19;
    uint64_t v28 = swift_slowAlloc();
    uint64_t v69 = a5;
    uint64_t v29 = (uint8_t *)v28;
    uint64_t v30 = swift_slowAlloc();
    uint64_t v73 = a1;
    *(void *)&long long v80 = v30;
    v72 = a2;
    *(_DWORD *)uint64_t v29 = 136315138;
    v68 = v29 + 4;
    uint64_t v31 = v16;
    v70 = a6;
    uint64_t v33 = *v21;
    unint64_t v32 = v21[1];
    swift_bridgeObjectRetain();
    uint64_t v34 = v33;
    uint64_t v16 = v31;
    id v19 = v71;
    uint64_t v78 = sub_1C718(v34, v32, (uint64_t *)&v80);
    a2 = v72;
    sub_1E4E0();
    a6 = v70;
    swift_bridgeObjectRelease();
    sub_6418((uint64_t)v21, type metadata accessor for SiriTimerSnippetModel);
    _os_log_impl(&dword_0, v26, v27, "[TimerItemView.init] Initializing for timer with ID %s.", v29, 0xCu);
    swift_arrayDestroy();
    a1 = v73;
    swift_slowDealloc();
    a5 = v69;
    swift_slowDealloc();
  }
  else
  {
    sub_6418((uint64_t)v21, type metadata accessor for SiriTimerSnippetModel);
  }

  v35 = (int *)type metadata accessor for TimerItemView(0);
  sub_5698(a1, a7 + v35[7], type metadata accessor for SiriTimerSnippetModel);
  uint64_t v36 = (void *)(a7 + v35[8]);
  *uint64_t v36 = v75;
  v36[1] = a5;
  id v37 = v76;
  *(void *)(a7 + v35[10]) = v76;
  *(void *)(a7 + v35[9]) = a6;
  v38 = *(void **)a7;
  *(void *)a7 = a2;
  *(void *)(a7 + 8) = 0;
  id v76 = v37;
  id v39 = a6;
  id v40 = a2;

  swift_release();
  if (a2)
  {
    [v40 remainingTime];
    double v42 = v41;
    sub_5698(a1, (uint64_t)v19, type metadata accessor for SiriTimerSnippetModel);
    sub_6418((uint64_t)v19, type metadata accessor for SiriTimerSnippetModel);
    [v40 duration];
    double v44 = v43;
    sub_5698(a1, (uint64_t)v16, type metadata accessor for SiriTimerSnippetModel);
    sub_6418((uint64_t)v16, type metadata accessor for SiriTimerSnippetModel);
    *(double *)(a7 + 40) = v42 / v44;
    *(void *)(a7 + 48) = 0;
    id v45 = v40;
    if ([v45 state] != (char *)&dword_0 + 1) {
      objc_msgSend(v45, "remainingTime", 0.0);
    }
    sub_19DA8();
    uint64_t v47 = v46;
    uint64_t v49 = v48;
  }
  else
  {
    sub_5698(a1, (uint64_t)v19, type metadata accessor for SiriTimerSnippetModel);
    id v75 = v39;
    uint64_t v50 = v74;
    v51 = &v19[*(int *)(v74 + 40)];
    double v52 = *(double *)v51;
    int v53 = v51[8];
    sub_6418((uint64_t)v19, type metadata accessor for SiriTimerSnippetModel);
    if (v53) {
      double v52 = 0.0;
    }
    sub_5698(a1, (uint64_t)v16, type metadata accessor for SiriTimerSnippetModel);
    v54 = &v16[*(int *)(v50 + 36)];
    double v55 = *(double *)v54;
    int v56 = v54[8];
    sub_6418((uint64_t)v16, type metadata accessor for SiriTimerSnippetModel);
    uint64_t v47 = 0;
    uint64_t v49 = 0;
    double v57 = 1.0;
    if (!v56) {
      double v57 = v55;
    }
    *(double *)(a7 + 40) = v52 / v57;
    *(void *)(a7 + 48) = 0;
    uint64_t v58 = *(int *)(v50 + 40);
    id v39 = v75;
    if ((*(unsigned char *)(a1 + v58 + 8) & 1) == 0)
    {
      sub_19DA8();
      uint64_t v47 = v59;
      uint64_t v49 = v60;
    }
  }
  swift_bridgeObjectRelease();
  swift_release();
  *(void *)(a7 + 16) = v47;
  *(void *)(a7 + 24) = v49;
  *(void *)(a7 + 32) = 0;
  id v61 = [self mainRunLoop];
  sub_64EC(0, (unint64_t *)&qword_28320);
  uint64_t v62 = sub_1E4C0();
  uint64_t v63 = (uint64_t)v77;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v62 - 8) + 56))(v77, 1, 1, v62);
  uint64_t v64 = sub_1E4B0();
  sub_6528(v63, &qword_28308);
  *(void *)&long long v80 = v64;
  sub_1E4A0();
  sub_5B58((unint64_t *)&qword_28328, (void (*)(uint64_t))&type metadata accessor for NSTimer.TimerPublisher);
  uint64_t v65 = sub_1DD30();
  swift_release();
  *(void *)&long long v80 = v65;
  sub_4F84(&qword_28330);
  sub_7BA8(&qword_28338, &qword_28330);
  uint64_t v66 = sub_1DD40();

  sub_6418(a1, type metadata accessor for SiriTimerSnippetModel);
  uint64_t result = swift_release();
  *(void *)(a7 + v35[11]) = v66;
  return result;
}

void *sub_39E0(void *result, id *a2)
{
  unint64_t v2 = result[3];
  if (v2)
  {
    uint64_t v3 = result[4];
    if (v3)
    {
      uint64_t v5 = result[2];
      if (qword_28160 != -1) {
        swift_once();
      }
      uint64_t v6 = sub_1DD20();
      sub_4D88(v6, (uint64_t)qword_28168);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      uint64_t v7 = sub_1DD00();
      os_log_type_t v8 = sub_1E490();
      if (os_log_type_enabled(v7, v8))
      {
        uint64_t v9 = swift_slowAlloc();
        uint64_t v16 = swift_slowAlloc();
        *(_DWORD *)uint64_t v9 = 136315394;
        swift_bridgeObjectRetain();
        sub_1C718(v5, v2, &v16);
        sub_1E4E0();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v9 + 12) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v10 = a2;
        uint64_t v11 = sub_1E3A0();
        unint64_t v13 = v12;
        swift_bridgeObjectRelease();
        uint64_t v14 = v11;
        a2 = v10;
        sub_1C718(v14, v13, &v16);
        sub_1E4E0();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_0, v7, v8, "[TimerItemView.componentTapped]: Performing direct invocation with ID = %s, payload = %s", (uint8_t *)v9, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
      }
      if (*a2)
      {
        id v15 = *a2;
        sub_3CDC(v3);
        sub_1E380();

        return (void *)swift_bridgeObjectRelease();
      }
      else
      {
        sub_1E390();
        sub_5B58(&qword_281C0, (void (*)(uint64_t))&type metadata accessor for Context);
        uint64_t result = (void *)sub_1DE10();
        __break(1u);
      }
    }
  }
  return result;
}

uint64_t sub_3CDC(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_4F84(&qword_28300);
    unint64_t v2 = (void *)sub_1E5E0();
  }
  else
  {
    unint64_t v2 = &_swiftEmptyDictionarySingleton;
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
  uint64_t v6 = (char *)(v2 + 8);
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
    uint64_t v17 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_6478(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(void *)&long long v39 = v19;
    *((void *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v19;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_64D4(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_64D4(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_64D4(v36, v37);
    sub_64D4(v37, &v33);
    uint64_t result = sub_1E530(v2[5]);
    uint64_t v20 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)&v6[8 * (v21 >> 6)]) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v21) & ~*(void *)&v6[8 * (v21 >> 6)])) | v21 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v26 = *(void *)&v6[8 * v22];
      }
      while (v26 == -1);
      unint64_t v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)&v6[(v9 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v9;
    uint64_t v10 = v2[6] + 40 * v9;
    *(_OWORD *)uint64_t v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(void *)(v10 + 32) = v31;
    uint64_t result = (uint64_t)sub_64D4(&v33, (_OWORD *)(v2[7] + 32 * v9));
    ++v2[2];
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_64E4();
    return (uint64_t)v2;
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

uint64_t sub_40A4()
{
  return sub_1DE30();
}

uint64_t sub_40C8(uint64_t a1)
{
  uint64_t v2 = sub_1DD70();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_1DE40();
}

uint64_t sub_419C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v74 = type metadata accessor for TimerItemView(0);
  uint64_t v3 = *(void *)(v74 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  uint64_t v5 = __chkstk_darwin(v74);
  __chkstk_darwin(v5);
  uint64_t v64 = (uint64_t)v63 - v6;
  uint64_t v7 = sub_1E350();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)v63 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = sub_4F84(&qword_283F8);
  __chkstk_darwin(v65);
  unint64_t v12 = (char *)v63 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *(void *)(v1 + 32);
  long long v91 = *(_OWORD *)(v1 + 16);
  uint64_t v92 = v13;
  sub_4F84(&qword_28400);
  sub_1E210();
  uint64_t v14 = *((void *)&v88 + 1);
  uint64_t v72 = v7;
  uint64_t v73 = a1;
  uint64_t v70 = (uint64_t)v63 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = v8;
  uint64_t v68 = v4;
  uint64_t v69 = v10;
  uint64_t v66 = v12;
  uint64_t v67 = v3;
  if (*((void *)&v88 + 1)) {
    uint64_t v15 = v88;
  }
  else {
    sub_19DA8();
  }
  *(void *)&long long v91 = v15;
  *((void *)&v91 + 1) = v14;
  v63[1] = sub_7820();
  uint64_t v16 = sub_1E070();
  uint64_t v18 = v17;
  char v20 = v19 & 1;
  sub_1E180();
  uint64_t v21 = sub_1E040();
  uint64_t v23 = v22;
  char v25 = v24;
  uint64_t v27 = v26;
  swift_release();
  sub_7874(v16, v18, v20);
  swift_bridgeObjectRelease();
  v93 = &type metadata for Text;
  v94 = &protocol witness table for Text;
  uint64_t v28 = swift_allocObject();
  *(void *)&long long v91 = v28;
  *(void *)(v28 + 16) = v21;
  *(void *)(v28 + 24) = v23;
  *(unsigned char *)(v28 + 32) = v25 & 1;
  *(void *)(v28 + 40) = v27;
  uint64_t v90 = 0;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v29 = v75;
  long long v85 = *v75;
  sub_4F84(&qword_28410);
  sub_1E210();
  long long v30 = (void *)v82;
  if ((void)v82)
  {
    id v31 = [(id)v82 displayTitle];

    uint64_t v32 = sub_1E3E0();
    unint64_t v34 = v33;

    uint64_t v35 = v64;
    sub_5698((uint64_t)v29, v64, type metadata accessor for TimerItemView);
    if (v34) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v35 = v64;
    sub_5698((uint64_t)v29, v64, type metadata accessor for TimerItemView);
  }
  uint64_t v36 = *(int *)(v74 + 28);
  id v37 = (uint64_t *)(v35 + v36 + *(int *)(type metadata accessor for SiriTimerSnippetModel(0) + 32));
  unint64_t v34 = v37[1];
  if (v34)
  {
    uint64_t v32 = *v37;
    swift_bridgeObjectRetain();
  }
  else
  {
    unint64_t v34 = 0xE500000000000000;
    uint64_t v32 = 0x72656D6954;
  }
LABEL_11:
  sub_6418(v35, type metadata accessor for TimerItemView);
  *(void *)&long long v85 = v32;
  *((void *)&v85 + 1) = v34;
  uint64_t v38 = sub_1E070();
  uint64_t v40 = v39;
  char v42 = v41 & 1;
  sub_1E180();
  uint64_t v43 = sub_1E040();
  uint64_t v45 = v44;
  char v47 = v46;
  uint64_t v49 = v48;
  swift_release();
  sub_7874(v38, v40, v42);
  swift_bridgeObjectRelease();
  v86 = &type metadata for Text;
  v87 = &protocol witness table for Text;
  uint64_t v50 = swift_allocObject();
  *(void *)&long long v85 = v50;
  *(void *)(v50 + 16) = v43;
  *(void *)(v50 + 24) = v45;
  *(unsigned char *)(v50 + 32) = v47 & 1;
  *(void *)(v50 + 40) = v49;
  uint64_t v84 = 0;
  long long v82 = 0u;
  long long v83 = 0u;
  uint64_t v81 = 0;
  long long v79 = 0u;
  long long v80 = 0u;
  uint64_t v78 = 0;
  long long v76 = 0u;
  long long v77 = 0u;
  v51 = v69;
  sub_1E340();
  uint64_t v52 = *(void *)((char *)v75 + *(int *)(v74 + 44));
  uint64_t v53 = v70;
  sub_5698((uint64_t)v75, v70, type metadata accessor for TimerItemView);
  unint64_t v54 = (*(unsigned __int8 *)(v67 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v67 + 80);
  uint64_t v55 = swift_allocObject();
  sub_62E4(v53, v55 + v54, type metadata accessor for TimerItemView);
  uint64_t v57 = v71;
  uint64_t v56 = v72;
  uint64_t v58 = (uint64_t)v66;
  (*(void (**)(char *, char *, uint64_t))(v71 + 16))(v66, v51, v72);
  uint64_t v59 = v65;
  *(void *)(v58 + *(int *)(v65 + 52)) = v52;
  uint64_t v60 = (uint64_t (**)())(v58 + *(int *)(v59 + 56));
  *uint64_t v60 = sub_7AAC;
  v60[1] = (uint64_t (*)())v55;
  id v61 = *(void (**)(char *, uint64_t))(v57 + 8);
  swift_retain();
  v61(v51, v56);
  return sub_7B08(v58, v73, &qword_283F8);
}

uint64_t sub_476C()
{
  uint64_t v1 = (uint64_t)v0;
  uint64_t v2 = type metadata accessor for TimerItemView(0);
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v5 = (char *)v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)v36 - v6;
  uint64_t v8 = *v0;
  uint64_t v9 = v0[1];
  *(void *)&long long v37 = *v0;
  *((void *)&v37 + 1) = v9;
  sub_4F84(&qword_28410);
  sub_1E210();
  id v10 = v36[0];

  if (!v10)
  {
    uint64_t v15 = v1 + *(int *)(v2 + 28);
    uint64_t v14 = 0;
    if (*(unsigned char *)(v15 + *(int *)(type metadata accessor for SiriTimerSnippetModel(0) + 40) + 8)) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  *(void *)&long long v37 = v8;
  *((void *)&v37 + 1) = v9;
  sub_1E210();
  if (!v36[0])
  {
    if (qword_28160 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_1DD20();
    sub_4D88(v16, (uint64_t)qword_28168);
    uint64_t v17 = sub_1DD00();
    os_log_type_t v18 = sub_1E470();
    if (os_log_type_enabled(v17, v18))
    {
      char v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v19 = 0;
      _os_log_impl(&dword_0, v17, v18, "TimerItemView: MTTimer missing in call for durationString(for:)", v19, 2u);
      swift_slowDealloc();
    }

LABEL_13:
    sub_19DA8();
    id v10 = v20;
    uint64_t v14 = v21;
    goto LABEL_14;
  }
  id v11 = v36[0];
  if ([v11 state] != (char *)&dword_0 + 1) {
    objc_msgSend(v11, "remainingTime", 0.0);
  }
  sub_19DA8();
  id v10 = v12;
  uint64_t v14 = v13;

LABEL_14:
  uint64_t v22 = *(void *)(v1 + 32);
  long long v37 = *(_OWORD *)(v1 + 16);
  uint64_t v38 = v22;
  v36[0] = v10;
  v36[1] = v14;
  sub_4F84(&qword_28400);
  sub_1E220();
  if (sub_4BF4() == 1)
  {
    uint64_t v23 = *(void *)(v1 + 48);
    *(void *)&long long v37 = *(void *)(v1 + 40);
    *((void *)&v37 + 1) = v23;
    v36[0] = 0;
  }
  else
  {
    *(void *)&long long v37 = v8;
    *((void *)&v37 + 1) = v9;
    sub_1E210();
    id v24 = v36[0];
    if (v36[0])
    {
      [v36[0] remainingTime];
      double v26 = v25;

      sub_5698(v1, (uint64_t)v7, type metadata accessor for TimerItemView);
      sub_6418((uint64_t)v7, type metadata accessor for TimerItemView);
    }
    else
    {
      sub_5698(v1, (uint64_t)v7, type metadata accessor for TimerItemView);
      uint64_t v27 = *(int *)(v2 + 28);
      uint64_t v28 = &v7[v27 + *(int *)(type metadata accessor for SiriTimerSnippetModel(0) + 40)];
      double v26 = *(double *)v28;
      LODWORD(v27) = v28[8];
      sub_6418((uint64_t)v7, type metadata accessor for TimerItemView);
      if (v27) {
        double v26 = 0.0;
      }
    }
    long long v37 = *(_OWORD *)v1;
    sub_1E210();
    id v29 = v36[0];
    if (v36[0])
    {
      [v36[0] duration];
      double v31 = v30;

      sub_5698(v1, (uint64_t)v5, type metadata accessor for TimerItemView);
      sub_6418((uint64_t)v5, type metadata accessor for TimerItemView);
    }
    else
    {
      sub_5698(v1, (uint64_t)v5, type metadata accessor for TimerItemView);
      uint64_t v32 = *(int *)(v2 + 28);
      unint64_t v33 = &v5[v32 + *(int *)(type metadata accessor for SiriTimerSnippetModel(0) + 36)];
      double v31 = *(double *)v33;
      LODWORD(v32) = v33[8];
      sub_6418((uint64_t)v5, type metadata accessor for TimerItemView);
      if (v32) {
        double v31 = 1.0;
      }
    }
    uint64_t v34 = *(void *)(v1 + 48);
    *(void *)&long long v37 = *(void *)(v1 + 40);
    *((void *)&v37 + 1) = v34;
    *(double *)uint64_t v36 = v26 / v31;
  }
  sub_4F84(&qword_28418);
  return sub_1E220();
}

uint64_t sub_4BF4()
{
  long long v6 = *v0;
  sub_4F84(&qword_28410);
  sub_1E210();
  if (v7)
  {
    id v1 = objc_msgSend(v7, "state", v6);
  }
  else
  {
    uint64_t v2 = (char *)v0 + *(int *)(type metadata accessor for TimerItemView(0) + 28);
    id v1 = 0;
    if ((v2[*(int *)(type metadata accessor for SiriTimerSnippetModel(0) + 44) + 8] & 1) == 0)
    {
      uint64_t v3 = sub_1DCE0();
      if (v4)
      {
        return 0;
      }
      else if (v3 == 1)
      {
        return 3;
      }
      else
      {
        return 2 * (v3 == 2);
      }
    }
  }
  return (uint64_t)v1;
}

uint64_t sub_4CBC()
{
  return sub_1E110();
}

uint64_t variable initialization expression of SiriTimerSnippetModel.label()
{
  return 0;
}

uint64_t variable initialization expression of SiriTimerSnippetModel.directInvocationPayload()
{
  return 0;
}

uint64_t variable initialization expression of SiriTimerSnippetModel.punchoutURL@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_1DB00();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(a1, 1, 1, v2);
}

uint64_t variable initialization expression of SiriTimerSnippetModel.duration()
{
  return 0;
}

uint64_t type metadata accessor for TimerSelector(uint64_t a1)
{
  return sub_5B20(a1, qword_28230);
}

uint64_t sub_4D88(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void *sub_4DC0@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_4DD0(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_4DDC(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t *sub_4DF0(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

char *sub_4E54(char *a1, char **a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  char v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    id v7 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    id v7 = a1;
    *((void *)a1 + 1) = a2[1];
    uint64_t v8 = a3[5];
    uint64_t v9 = &a1[v8];
    uint64_t v10 = (uint64_t)a2 + v8;
    *(void *)&a1[v8] = *(char **)((char *)a2 + v8);
    uint64_t v11 = *(int *)(type metadata accessor for TimerSelectorModel(0) + 20);
    unint64_t v12 = &v9[v11];
    uint64_t v13 = v10 + v11;
    uint64_t v14 = v4;
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_4F84(&qword_281D0);
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(v12, v13, v15);
    uint64_t v16 = a3[7];
    *(void *)&v7[a3[6]] = *(char **)((char *)a2 + a3[6]);
    uint64_t v17 = *(char **)((char *)a2 + v16);
    *(void *)&v7[v16] = v17;
    swift_bridgeObjectRetain();
    id v18 = v17;
  }
  return v7;
}

uint64_t sub_4F84(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void sub_4FC8(id *a1, uint64_t a2)
{
  char v4 = (char *)a1 + *(int *)(a2 + 20);
  swift_bridgeObjectRelease();
  uint64_t v5 = &v4[*(int *)(type metadata accessor for TimerSelectorModel(0) + 20)];
  uint64_t v6 = sub_4F84(&qword_281D0);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  id v7 = *(id *)((char *)a1 + *(int *)(a2 + 28));
}

void *sub_507C(void *a1, uint64_t a2, int *a3)
{
  id v7 = *(void **)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v6;
  uint64_t v8 = a3[5];
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = a2 + v8;
  *(void *)((char *)a1 + v8) = *(void *)(a2 + v8);
  uint64_t v11 = *(int *)(type metadata accessor for TimerSelectorModel(0) + 20);
  unint64_t v12 = &v9[v11];
  uint64_t v13 = v10 + v11;
  id v14 = v7;
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_4F84(&qword_281D0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(v12, v13, v15);
  uint64_t v16 = a3[7];
  *(void *)((char *)a1 + a3[6]) = *(void *)(a2 + a3[6]);
  uint64_t v17 = *(void **)(a2 + v16);
  *(void *)((char *)a1 + v16) = v17;
  swift_bridgeObjectRetain();
  id v18 = v17;
  return a1;
}

uint64_t sub_5158(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void **)a1;
  id v7 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v8 = v7;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v9 = a3[5];
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  *(void *)(a1 + v9) = *(void *)(a2 + v9);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v12 = *(int *)(type metadata accessor for TimerSelectorModel(0) + 20);
  uint64_t v13 = v10 + v12;
  uint64_t v14 = v11 + v12;
  uint64_t v15 = sub_4F84(&qword_281D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 24))(v13, v14, v15);
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v16 = a3[7];
  uint64_t v17 = *(void **)(a2 + v16);
  id v18 = *(void **)(a1 + v16);
  *(void *)(a1 + v16) = v17;
  id v19 = v17;

  return a1;
}

_OWORD *sub_525C(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  id v7 = (char *)a1 + v6;
  id v8 = (char *)a2 + v6;
  *(void *)((char *)a1 + v6) = *(void *)((char *)a2 + v6);
  uint64_t v9 = *(int *)(type metadata accessor for TimerSelectorModel(0) + 20);
  uint64_t v10 = &v7[v9];
  uint64_t v11 = &v8[v9];
  uint64_t v12 = sub_4F84(&qword_281D0);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
  uint64_t v13 = a3[7];
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  *(void *)((char *)a1 + v13) = *(void *)((char *)a2 + v13);
  return a1;
}

uint64_t sub_531C(uint64_t a1, void *a2, int *a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  *(void *)(a1 + v7) = *(void *)((char *)a2 + v7);
  swift_bridgeObjectRelease();
  uint64_t v10 = *(int *)(type metadata accessor for TimerSelectorModel(0) + 20);
  uint64_t v11 = v8 + v10;
  uint64_t v12 = &v9[v10];
  uint64_t v13 = sub_4F84(&qword_281D0);
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v13 - 8) + 40))(v11, v12, v13);
  *(void *)(a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  swift_bridgeObjectRelease();
  uint64_t v14 = a3[7];
  uint64_t v15 = *(void **)(a1 + v14);
  *(void *)(a1 + v14) = *(void *)((char *)a2 + v14);

  return a1;
}

uint64_t sub_5408(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_541C);
}

uint64_t sub_541C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TimerSelectorModel(0);
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
    unint64_t v12 = *(void *)(a1 + *(int *)(a3 + 24));
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    return (v12 + 1);
  }
}

uint64_t sub_54E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_54F4);
}

uint64_t sub_54F4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for TimerSelectorModel(0);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
    unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_55B4()
{
  uint64_t result = type metadata accessor for TimerSelectorModel(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void type metadata accessor for CFLocale(uint64_t a1)
{
}

uint64_t sub_567C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_5698(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_5704()
{
  return sub_59A8(sub_27A8);
}

uint64_t sub_571C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_5764()
{
  unint64_t result = qword_282B8;
  if (!qword_282B8)
  {
    sub_571C(&qword_28290);
    sub_571C(&qword_28280);
    sub_7BA8(&qword_282A8, &qword_28280);
    swift_getOpaqueTypeConformance2();
    sub_7BA8(&qword_282C0, &qword_282B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_282B8);
  }
  return result;
}

uint64_t sub_5868()
{
  unint64_t v1 = (int *)(type metadata accessor for TimerSelector(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;

  uint64_t v7 = v6 + v1[7];
  swift_bridgeObjectRelease();
  uint64_t v8 = v7 + *(int *)(type metadata accessor for TimerSelectorModel(0) + 20);
  uint64_t v9 = sub_4F84(&qword_281D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, v4, v5);
}

uint64_t sub_5990()
{
  return sub_59A8(sub_29AC);
}

uint64_t sub_59A8(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for TimerSelector(0) - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));

  return a1(v3);
}

unint64_t sub_5A2C()
{
  unint64_t result = qword_282D0;
  if (!qword_282D0)
  {
    sub_571C(&qword_282C8);
    type metadata accessor for TimerItemView(255);
    sub_5B58(&qword_282D8, (void (*)(uint64_t))type metadata accessor for TimerItemView);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_282D0);
  }
  return result;
}

uint64_t type metadata accessor for TimerItemView(uint64_t a1)
{
  return sub_5B20(a1, qword_283A8);
}

uint64_t sub_5B20(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_5B58(unint64_t *a1, void (*a2)(uint64_t))
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

size_t sub_5BA0(uint64_t a1)
{
  uint64_t v43 = sub_4F84(&qword_282F8);
  uint64_t v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v48 = (char *)v41 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __chkstk_darwin(v2);
  char v47 = (void *)((char *)v41 - v5);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v41 - v6;
  uint64_t v49 = v8;
  uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  uint64_t v11 = &_swiftEmptyArrayStorage;
  uint64_t v46 = v10;
  v41[0] = a1;
  if (v10)
  {
    uint64_t v42 = (v9 + 32) & ~v9;
    unint64_t v12 = (char *)&_swiftEmptyArrayStorage + v42;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = *(void *)(type metadata accessor for SiriTimerSnippetModel(0) - 8);
    uint64_t v16 = a1 + ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80));
    uint64_t v17 = *(void *)(v15 + 72);
    uint64_t v44 = v7;
    uint64_t v45 = v17;
    v41[1] = v9 | 7;
    id v18 = &_swiftEmptyArrayStorage;
    uint64_t v19 = v43;
    while (1)
    {
      uint64_t v21 = (uint64_t)&v48[*(int *)(v19 + 48)];
      sub_5698(v16, v21, type metadata accessor for SiriTimerSnippetModel);
      uint64_t v22 = (uint64_t)v47;
      uint64_t v23 = (uint64_t)v47 + *(int *)(v19 + 48);
      *char v47 = v13;
      sub_62E4(v21, v23, type metadata accessor for SiriTimerSnippetModel);
      size_t result = sub_7B08(v22, (uint64_t)v7, &qword_282F8);
      if (v14)
      {
        uint64_t v11 = v18;
        BOOL v20 = __OFSUB__(v14--, 1);
        if (v20) {
          goto LABEL_27;
        }
      }
      else
      {
        unint64_t v25 = v18[3];
        if ((uint64_t)((v25 >> 1) + 0x4000000000000000) < 0)
        {
          __break(1u);
LABEL_34:
          __break(1u);
LABEL_35:
          __break(1u);
LABEL_36:
          __break(1u);
          return result;
        }
        int64_t v26 = v25 & 0xFFFFFFFFFFFFFFFELL;
        if (v26 <= 1) {
          uint64_t v27 = 1;
        }
        else {
          uint64_t v27 = v26;
        }
        sub_4F84(&qword_28340);
        uint64_t v28 = *(void *)(v49 + 72);
        uint64_t v29 = v42;
        uint64_t v11 = (void *)swift_allocObject();
        size_t result = j__malloc_size(v11);
        if (!v28) {
          goto LABEL_34;
        }
        int64_t v30 = result - v29;
        if (result - v29 == 0x8000000000000000 && v28 == -1) {
          goto LABEL_35;
        }
        uint64_t v32 = v30 / v28;
        v11[2] = v27;
        v11[3] = 2 * (v30 / v28);
        unint64_t v33 = (char *)v11 + v29;
        uint64_t v34 = v18[3] >> 1;
        uint64_t v35 = v34 * v28;
        if (v18[2])
        {
          if (v11 < v18 || v33 >= (char *)v18 + v42 + v35)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v11 != v18)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          v18[2] = 0;
        }
        unint64_t v12 = &v33[v35];
        uint64_t v37 = (v32 & 0x7FFFFFFFFFFFFFFFLL) - v34;
        swift_release();
        uint64_t v19 = v43;
        BOOL v20 = __OFSUB__(v37, 1);
        uint64_t v14 = v37 - 1;
        if (v20)
        {
LABEL_27:
          __break(1u);
          break;
        }
      }
      ++v13;
      uint64_t v7 = v44;
      sub_7B08((uint64_t)v44, (uint64_t)v12, &qword_282F8);
      v12 += *(void *)(v49 + 72);
      v16 += v45;
      id v18 = v11;
      if (v46 == v13) {
        goto LABEL_29;
      }
    }
  }
  uint64_t v14 = 0;
LABEL_29:
  size_t result = swift_bridgeObjectRelease();
  unint64_t v38 = v11[3];
  if (v38 >= 2)
  {
    unint64_t v39 = v38 >> 1;
    BOOL v20 = __OFSUB__(v39, v14);
    uint64_t v40 = v39 - v14;
    if (v20) {
      goto LABEL_36;
    }
    v11[2] = v40;
  }
  return (size_t)v11;
}

uint64_t sub_5F48@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for TimerSelector(0) - 8);
  uint64_t v6 = (id *)(v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80)));

  return sub_2C18(a1, v6, a2);
}

uint64_t sub_5FD0()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_6008(char *a1)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t, char *))(v1 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = sub_4F84(&qword_282F8);
  return v3(v4, &a1[*(int *)(v5 + 48)]);
}

uint64_t sub_6068(id *a1)
{
  return sub_30B0(a1, *(void **)(v1 + 16)) & 1;
}

uint64_t sub_6088()
{
  uint64_t v1 = type metadata accessor for SiriTimerSnippetModel(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v17 = *(void *)(*(void *)(v1 - 8) + 64);
  uint64_t v4 = type metadata accessor for TimerSelector(0);
  uint64_t v5 = *(unsigned __int8 *)(*(void *)(v4 - 8) + 80);
  uint64_t v6 = *(void *)(*(void *)(v4 - 8) + 64);
  uint64_t v18 = v0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v7 = v0 + v3 + *(int *)(v1 + 28);
  uint64_t v8 = sub_1DB00();
  uint64_t v9 = *(void *)(v8 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8)) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  }
  uint64_t v10 = (v3 + v17 + v5) & ~v5;
  uint64_t v11 = v10 + v6;
  swift_bridgeObjectRelease();
  unint64_t v12 = (id *)(v18 + v10);

  uint64_t v13 = (char *)v12 + *(int *)(v4 + 20);
  swift_bridgeObjectRelease();
  uint64_t v14 = &v13[*(int *)(type metadata accessor for TimerSelectorModel(0) + 20)];
  uint64_t v15 = sub_4F84(&qword_281D0);
  (*(void (**)(char *, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v18, v11, v2 | v5 | 7);
}

uint64_t sub_62E4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void *sub_634C()
{
  uint64_t v1 = *(void *)(type metadata accessor for SiriTimerSnippetModel(0) - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(void *)(v1 + 64);
  uint64_t v4 = *(void *)(type metadata accessor for TimerSelector(0) - 8);
  uint64_t v5 = (id *)(v0 + ((v2 + v3 + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)));

  return sub_39E0((void *)(v0 + v2), v5);
}

uint64_t sub_6418(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_6478(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_64D4(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_64E4()
{
  return swift_release();
}

uint64_t sub_64EC(uint64_t a1, unint64_t *a2)
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

uint64_t sub_6528(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_4F84(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

char *sub_6588(char *a1, char **a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = &v4[(v3 + 16) & ~(unint64_t)v3];
  }
  else
  {
    uint64_t v7 = a1;
    uint64_t v8 = a2[2];
    *((void *)a1 + 1) = a2[1];
    *((void *)a1 + 2) = v8;
    uint64_t v48 = a2[4];
    *((void *)a1 + 3) = a2[3];
    *((void *)a1 + 4) = v48;
    uint64_t v9 = a2[6];
    *((void *)a1 + 5) = a2[5];
    *((void *)a1 + 6) = v9;
    uint64_t v10 = a3[7];
    uint64_t v11 = &a1[v10];
    uint64_t v12 = (uint64_t)a2 + v10;
    uint64_t v13 = *(uint64_t *)((char *)a2 + v10 + 8);
    *(void *)uint64_t v11 = *(char **)((char *)a2 + v10);
    *((void *)v11 + 1) = v13;
    uint64_t v14 = *(uint64_t *)((char *)a2 + v10 + 24);
    *((void *)v11 + 2) = *(char **)((char *)a2 + v10 + 16);
    *((void *)v11 + 3) = v14;
    *((void *)v11 + 4) = *(char **)((char *)a2 + v10 + 32);
    uint64_t v15 = (int *)type metadata accessor for SiriTimerSnippetModel(0);
    uint64_t v16 = v15[7];
    __dst = &v11[v16];
    uint64_t v17 = (const void *)(v12 + v16);
    uint64_t v18 = sub_1DB00();
    uint64_t v46 = *(void *)(v18 - 8);
    char v47 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v46 + 48);
    uint64_t v19 = v4;
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v47(v17, 1, v18))
    {
      uint64_t v20 = sub_4F84(&qword_28348);
      memcpy(__dst, v17, *(void *)(*(void *)(v20 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, const void *, uint64_t))(v46 + 16))(__dst, v17, v18);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v46 + 56))(__dst, 0, 1, v18);
    }
    uint64_t v21 = v15[8];
    uint64_t v22 = &v11[v21];
    uint64_t v23 = (void *)(v12 + v21);
    uint64_t v24 = v23[1];
    *(void *)uint64_t v22 = *v23;
    *((void *)v22 + 1) = v24;
    uint64_t v25 = v15[9];
    int64_t v26 = &v11[v25];
    uint64_t v27 = v12 + v25;
    v26[8] = *(unsigned char *)(v27 + 8);
    *(void *)int64_t v26 = *(void *)v27;
    uint64_t v28 = v15[10];
    uint64_t v29 = &v11[v28];
    uint64_t v30 = v12 + v28;
    v29[8] = *(unsigned char *)(v30 + 8);
    *(void *)uint64_t v29 = *(void *)v30;
    uint64_t v31 = v15[11];
    uint64_t v32 = &v11[v31];
    uint64_t v33 = v12 + v31;
    *(void *)uint64_t v32 = *(void *)v33;
    v32[8] = *(unsigned char *)(v33 + 8);
    uint64_t v34 = a3[8];
    uint64_t v35 = a3[9];
    uint64_t v36 = &v7[v34];
    uint64_t v37 = (char **)((char *)a2 + v34);
    uint64_t v38 = v37[1];
    *(void *)uint64_t v36 = *v37;
    *((void *)v36 + 1) = v38;
    unint64_t v39 = *(char **)((char *)a2 + v35);
    *(void *)&v7[v35] = v39;
    uint64_t v40 = a3[10];
    uint64_t v41 = a3[11];
    uint64_t v42 = *(char **)((char *)a2 + v40);
    *(void *)&v7[v40] = v42;
    *(void *)&v7[v41] = *(char **)((char *)a2 + v41);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v43 = v39;
    id v44 = v42;
  }
  swift_retain();
  return v7;
}

uint64_t sub_6864(id *a1, int *a2)
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v4 = (char *)a1 + a2[7];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = &v4[*(int *)(type metadata accessor for SiriTimerSnippetModel(0) + 28)];
  uint64_t v6 = sub_1DB00();
  uint64_t v7 = *(void *)(v6 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6)) {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v5, v6);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_release();
}

void *sub_69C0(void *a1, uint64_t a2, int *a3)
{
  uint64_t v45 = *(void **)a2;
  uint64_t v46 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v46;
  uint64_t v5 = *(void *)(a2 + 24);
  a1[2] = *(void *)(a2 + 16);
  a1[3] = v5;
  uint64_t v6 = *(void *)(a2 + 40);
  a1[4] = *(void *)(a2 + 32);
  a1[5] = v6;
  a1[6] = *(void *)(a2 + 48);
  uint64_t v7 = a3[7];
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void *)(a2 + v7 + 8);
  void *v8 = *(void *)(a2 + v7);
  v8[1] = v10;
  uint64_t v11 = *(void *)(a2 + v7 + 24);
  v8[2] = *(void *)(a2 + v7 + 16);
  v8[3] = v11;
  v8[4] = *(void *)(a2 + v7 + 32);
  uint64_t v12 = (int *)type metadata accessor for SiriTimerSnippetModel(0);
  uint64_t v13 = v12[7];
  __dst = (char *)v8 + v13;
  id v44 = (const void *)(v9 + v13);
  uint64_t v14 = sub_1DB00();
  uint64_t v15 = *(void *)(v14 - 8);
  id v43 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v15 + 48);
  id v16 = v45;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v43(v44, 1, v14))
  {
    uint64_t v17 = sub_4F84(&qword_28348);
    memcpy(__dst, v44, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, const void *, uint64_t))(v15 + 16))(__dst, v44, v14);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(__dst, 0, 1, v14);
  }
  uint64_t v18 = v12[8];
  uint64_t v19 = (void *)((char *)v8 + v18);
  uint64_t v20 = (void *)(v9 + v18);
  uint64_t v21 = v20[1];
  *uint64_t v19 = *v20;
  v19[1] = v21;
  uint64_t v22 = v12[9];
  uint64_t v23 = (char *)v8 + v22;
  uint64_t v24 = v9 + v22;
  v23[8] = *(unsigned char *)(v24 + 8);
  *(void *)uint64_t v23 = *(void *)v24;
  uint64_t v25 = v12[10];
  int64_t v26 = (char *)v8 + v25;
  uint64_t v27 = v9 + v25;
  v26[8] = *(unsigned char *)(v27 + 8);
  *(void *)int64_t v26 = *(void *)v27;
  uint64_t v28 = v12[11];
  uint64_t v29 = (char *)v8 + v28;
  uint64_t v30 = v9 + v28;
  *(void *)uint64_t v29 = *(void *)v30;
  v29[8] = *(unsigned char *)(v30 + 8);
  uint64_t v31 = a3[8];
  uint64_t v32 = a3[9];
  uint64_t v33 = (void *)((char *)a1 + v31);
  uint64_t v34 = (void *)(a2 + v31);
  uint64_t v35 = v34[1];
  void *v33 = *v34;
  v33[1] = v35;
  uint64_t v36 = *(void **)(a2 + v32);
  *(void *)((char *)a1 + v32) = v36;
  uint64_t v37 = a3[10];
  uint64_t v38 = a3[11];
  unint64_t v39 = *(void **)(a2 + v37);
  *(void *)((char *)a1 + v37) = v39;
  *(void *)((char *)a1 + v38) = *(void *)(a2 + v38);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v40 = v36;
  id v41 = v39;
  swift_retain();
  return a1;
}

uint64_t sub_6C60(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v8 = v7;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_release();
  uint64_t v50 = a3;
  uint64_t v9 = a3[7];
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (void *)(a2 + v9);
  *uint64_t v10 = *(void *)(a2 + v9);
  v10[1] = *(void *)(a2 + v9 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10[2] = v11[2];
  v10[3] = v11[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10[4] = v11[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v48 = (int *)type metadata accessor for SiriTimerSnippetModel(0);
  uint64_t v12 = v48[7];
  uint64_t v13 = (char *)v10 + v12;
  uint64_t v14 = (char *)v11 + v12;
  uint64_t v15 = sub_1DB00();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  uint64_t v49 = v13;
  LODWORD(v13) = v17(v13, 1, v15);
  int v18 = v17(v14, 1, v15);
  if (v13)
  {
    if (!v18)
    {
      (*(void (**)(void *, char *, uint64_t))(v16 + 16))(v49, v14, v15);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v16 + 56))(v49, 0, 1, v15);
      goto LABEL_9;
    }
    size_t v19 = *(void *)(*(void *)(sub_4F84(&qword_28348) - 8) + 64);
    uint64_t v20 = v49;
  }
  else
  {
    if (!v18)
    {
      (*(void (**)(void *, char *, uint64_t))(v16 + 24))(v49, v14, v15);
      goto LABEL_9;
    }
    (*(void (**)(void *, uint64_t))(v16 + 8))(v49, v15);
    size_t v19 = *(void *)(*(void *)(sub_4F84(&qword_28348) - 8) + 64);
    uint64_t v20 = v49;
  }
  memcpy(v20, v14, v19);
LABEL_9:
  uint64_t v21 = v48[8];
  uint64_t v22 = (void *)((char *)v10 + v21);
  uint64_t v23 = (void *)((char *)v11 + v21);
  *uint64_t v22 = *v23;
  v22[1] = v23[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v24 = v48[9];
  uint64_t v25 = (char *)v10 + v24;
  int64_t v26 = (char *)v11 + v24;
  uint64_t v27 = *(void *)v26;
  v25[8] = v26[8];
  *(void *)uint64_t v25 = v27;
  uint64_t v28 = v48[10];
  uint64_t v29 = (char *)v10 + v28;
  uint64_t v30 = (char *)v11 + v28;
  uint64_t v31 = *(void *)v30;
  v29[8] = v30[8];
  *(void *)uint64_t v29 = v31;
  uint64_t v32 = v48[11];
  uint64_t v33 = (char *)v10 + v32;
  uint64_t v34 = (char *)v11 + v32;
  uint64_t v35 = *(void *)v34;
  v33[8] = v34[8];
  *(void *)uint64_t v33 = v35;
  uint64_t v36 = v50[8];
  uint64_t v37 = (void *)(a1 + v36);
  uint64_t v38 = (void *)(a2 + v36);
  *uint64_t v37 = *v38;
  v37[1] = v38[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v39 = v50[9];
  id v40 = *(void **)(a2 + v39);
  id v41 = *(void **)(a1 + v39);
  *(void *)(a1 + v39) = v40;
  id v42 = v40;

  uint64_t v43 = v50[10];
  id v44 = *(void **)(a2 + v43);
  uint64_t v45 = *(void **)(a1 + v43);
  *(void *)(a1 + v43) = v44;
  id v46 = v44;

  *(void *)(a1 + v50[11]) = *(void *)(a2 + v50[11]);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_7010(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  uint64_t v7 = a3[7];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  long long v10 = *(_OWORD *)(a2 + v7 + 16);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)(a2 + v7);
  *(_OWORD *)(v8 + 16) = v10;
  *(void *)(v8 + 32) = *(void *)(a2 + v7 + 32);
  uint64_t v11 = (int *)type metadata accessor for SiriTimerSnippetModel(0);
  uint64_t v12 = v11[7];
  uint64_t v13 = (void *)(v8 + v12);
  uint64_t v14 = (const void *)(v9 + v12);
  uint64_t v15 = sub_1DB00();
  uint64_t v16 = *(void *)(v15 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
  {
    uint64_t v17 = sub_4F84(&qword_28348);
    memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v16 + 32))(v13, v14, v15);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  }
  *(_OWORD *)(v8 + v11[8]) = *(_OWORD *)(v9 + v11[8]);
  uint64_t v18 = v11[9];
  uint64_t v19 = v8 + v18;
  uint64_t v20 = v9 + v18;
  *(unsigned char *)(v19 + 8) = *(unsigned char *)(v20 + 8);
  *(void *)uint64_t v19 = *(void *)v20;
  uint64_t v21 = v11[10];
  uint64_t v22 = v8 + v21;
  uint64_t v23 = v9 + v21;
  *(void *)uint64_t v22 = *(void *)v23;
  *(unsigned char *)(v22 + 8) = *(unsigned char *)(v23 + 8);
  uint64_t v24 = v11[11];
  uint64_t v25 = v8 + v24;
  uint64_t v26 = v9 + v24;
  *(void *)uint64_t v25 = *(void *)v26;
  *(unsigned char *)(v25 + 8) = *(unsigned char *)(v26 + 8);
  uint64_t v27 = a3[9];
  *(_OWORD *)(a1 + a3[8]) = *(_OWORD *)(a2 + a3[8]);
  *(void *)(a1 + v27) = *(void *)(a2 + v27);
  uint64_t v28 = a3[11];
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  *(void *)(a1 + v28) = *(void *)(a2 + v28);
  return a1;
}

uint64_t sub_71FC(uint64_t a1, void *a2, int *a3)
{
  long long v6 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  swift_release();
  uint64_t v7 = a2[3];
  *(void *)(a1 + 16) = a2[2];
  *(void *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = a2[4];
  swift_release();
  *(void *)(a1 + 40) = a2[5];
  *(void *)(a1 + 48) = a2[6];
  swift_release();
  uint64_t v8 = a3[7];
  uint64_t v9 = (void *)(a1 + v8);
  long long v10 = (void *)((char *)a2 + v8);
  uint64_t v11 = *(void *)((char *)a2 + v8 + 8);
  *uint64_t v9 = *(void *)((char *)a2 + v8);
  v9[1] = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = v10[3];
  _OWORD v9[2] = v10[2];
  v9[3] = v12;
  swift_bridgeObjectRelease();
  v9[4] = v10[4];
  swift_bridgeObjectRelease();
  id v46 = (int *)type metadata accessor for SiriTimerSnippetModel(0);
  uint64_t v13 = v46[7];
  uint64_t v14 = (char *)v9 + v13;
  uint64_t v15 = (char *)v10 + v13;
  uint64_t v16 = sub_1DB00();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 48);
  char v47 = v14;
  LODWORD(v14) = v18(v14, 1, v16);
  int v19 = v18(v15, 1, v16);
  if (v14)
  {
    if (!v19)
    {
      (*(void (**)(void *, char *, uint64_t))(v17 + 32))(v47, v15, v16);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(v47, 0, 1, v16);
      goto LABEL_9;
    }
    size_t v20 = *(void *)(*(void *)(sub_4F84(&qword_28348) - 8) + 64);
    uint64_t v21 = v47;
  }
  else
  {
    if (!v19)
    {
      (*(void (**)(void *, char *, uint64_t))(v17 + 40))(v47, v15, v16);
      goto LABEL_9;
    }
    (*(void (**)(void *, uint64_t))(v17 + 8))(v47, v16);
    size_t v20 = *(void *)(*(void *)(sub_4F84(&qword_28348) - 8) + 64);
    uint64_t v21 = v47;
  }
  memcpy(v21, v15, v20);
LABEL_9:
  uint64_t v22 = v46[8];
  uint64_t v23 = (void *)((char *)v9 + v22);
  uint64_t v24 = (void *)((char *)v10 + v22);
  uint64_t v26 = *v24;
  uint64_t v25 = v24[1];
  *uint64_t v23 = v26;
  v23[1] = v25;
  swift_bridgeObjectRelease();
  uint64_t v27 = v46[9];
  uint64_t v28 = (char *)v9 + v27;
  uint64_t v29 = (char *)v10 + v27;
  *(void *)uint64_t v28 = *(void *)v29;
  v28[8] = v29[8];
  uint64_t v30 = v46[10];
  uint64_t v31 = (char *)v9 + v30;
  uint64_t v32 = (char *)v10 + v30;
  v31[8] = v32[8];
  *(void *)uint64_t v31 = *(void *)v32;
  uint64_t v33 = v46[11];
  uint64_t v34 = (char *)v9 + v33;
  uint64_t v35 = (char *)v10 + v33;
  *(void *)uint64_t v34 = *(void *)v35;
  v34[8] = v35[8];
  uint64_t v36 = a3[8];
  uint64_t v37 = (void *)(a1 + v36);
  uint64_t v38 = (void *)((char *)a2 + v36);
  uint64_t v40 = *v38;
  uint64_t v39 = v38[1];
  *uint64_t v37 = v40;
  v37[1] = v39;
  swift_bridgeObjectRelease();
  uint64_t v41 = a3[9];
  id v42 = *(void **)(a1 + v41);
  *(void *)(a1 + v41) = *(void *)((char *)a2 + v41);

  uint64_t v43 = a3[10];
  id v44 = *(void **)(a1 + v43);
  *(void *)(a1 + v43) = *(void *)((char *)a2 + v43);

  *(void *)(a1 + a3[11]) = *(void *)((char *)a2 + a3[11]);
  swift_release();
  return a1;
}

uint64_t sub_7528(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_753C);
}

uint64_t sub_753C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SiriTimerSnippetModel(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 28);
    long long v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else
  {
    unint64_t v12 = *(void *)(a1 + *(int *)(a3 + 32) + 8);
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    return (v12 + 1);
  }
}

uint64_t sub_7604(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_7618);
}

uint64_t sub_7618(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for SiriTimerSnippetModel(0);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + *(int *)(a4 + 28);
    unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 32) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t sub_76DC()
{
  uint64_t result = type metadata accessor for SiriTimerSnippetModel(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_77A8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_7804()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_7820()
{
  unint64_t result = qword_28408;
  if (!qword_28408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_28408);
  }
  return result;
}

uint64_t sub_7874(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_7884()
{
  sub_7874(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32));
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_78C8()
{
  unint64_t v1 = (int *)type metadata accessor for TimerItemView(0);
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v10 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v4 = v0 + v3;

  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v5 = v0 + v3 + v1[7];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = v5 + *(int *)(type metadata accessor for SiriTimerSnippetModel(0) + 28);
  uint64_t v7 = sub_1DB00();
  uint64_t v8 = *(void *)(v7 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();

  return _swift_deallocObject(v0, v3 + v10, v2 | 7);
}

uint64_t sub_7AAC()
{
  return sub_476C();
}

uint64_t sub_7B08(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_4F84(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_7B6C()
{
  return sub_7BA8(&qword_28420, &qword_283F8);
}

uint64_t sub_7BA8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_571C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void type metadata accessor for MTTimerState(uint64_t a1)
{
}

void sub_7C00(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t TimerSelectorModel.header.getter()
{
  type metadata accessor for TimerSelectorModel(0);
  sub_4F84(&qword_281D0);
  sub_1DC60();
  return v1;
}

uint64_t type metadata accessor for TimerSelectorModel(uint64_t a1)
{
  return sub_5B20(a1, (uint64_t *)&unk_28740);
}

void sub_7CB8()
{
  *(_WORD *)&algn_2ABD8[6] = -4864;
}

uint64_t *SiriTimePluginModel.bundleName.unsafeMutableAddressor()
{
  if (qword_28180 != -1) {
    swift_once();
  }
  return &static SiriTimePluginModel.bundleName;
}

uint64_t static SiriTimePluginModel.bundleName.getter()
{
  if (qword_28180 != -1) {
    swift_once();
  }
  uint64_t v0 = static SiriTimePluginModel.bundleName;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t SiriTimePluginModel.snippetHidden(for:idiom:)()
{
  uint64_t v1 = sub_1DCD0();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for SiriTimePluginModel(0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_E014(v0, (uint64_t)v7, type metadata accessor for SiriTimePluginModel);
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for DeviceIdiom.car(_:), v1);
  char v8 = sub_1DCC0();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  sub_86D0((uint64_t)v7, type metadata accessor for SiriTimePluginModel);
  return v8 & 1;
}

uint64_t type metadata accessor for SiriTimePluginModel(uint64_t a1)
{
  return sub_5B20(a1, qword_28600);
}

uint64_t sub_7F40(char a1)
{
  if (a1) {
    return 0x6C655372656D6974;
  }
  else {
    return 0x6C754D72656D6974;
  }
}

uint64_t sub_7F90()
{
  return sub_7F40(*v0);
}

uint64_t sub_7F98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_DB58(a1, a2);
  *a3 = result;
  return result;
}

void sub_7FC0(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_7FCC(uint64_t a1)
{
  unint64_t v2 = sub_8628();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_8008(uint64_t a1)
{
  unint64_t v2 = sub_8628();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_8044()
{
  return 1;
}

uint64_t sub_8058@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_DC70(a1, a2);
  *a3 = result & 1;
  return result;
}

void sub_8084(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_8090(uint64_t a1)
{
  unint64_t v2 = sub_8730();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_80CC(uint64_t a1)
{
  unint64_t v2 = sub_8730();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_8108(uint64_t a1)
{
  unint64_t v2 = sub_867C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_8144(uint64_t a1)
{
  unint64_t v2 = sub_867C();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t SiriTimePluginModel.encode(to:)(void *a1)
{
  uint64_t v2 = sub_4F84(&qword_28430);
  uint64_t v26 = *(void *)(v2 - 8);
  uint64_t v27 = v2;
  __chkstk_darwin(v2);
  uint64_t v25 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = type metadata accessor for TimerSelectorModel(0);
  __chkstk_darwin(v23);
  uint64_t v24 = (uint64_t)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_4F84(&qword_28438);
  uint64_t v21 = *(void *)(v5 - 8);
  uint64_t v22 = v5;
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for SiriTimePluginModel(0);
  __chkstk_darwin(v8);
  uint64_t v10 = (uint64_t *)((char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = sub_4F84(&qword_28440);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_85E4(a1, a1[3]);
  sub_8628();
  sub_1E8E0();
  sub_E014(v28, (uint64_t)v10, type metadata accessor for SiriTimePluginModel);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = v24;
    sub_8E40((uint64_t)v10, v24, type metadata accessor for TimerSelectorModel);
    char v31 = 1;
    sub_867C();
    uint64_t v16 = v25;
    sub_1E6D0();
    sub_8DF8(&qword_28458, (void (*)(uint64_t))type metadata accessor for TimerSelectorModel);
    uint64_t v17 = v27;
    sub_1E720();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v16, v17);
    sub_86D0(v15, type metadata accessor for TimerSelectorModel);
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  else
  {
    uint64_t v19 = *v10;
    char v30 = 0;
    sub_8730();
    sub_1E6D0();
    uint64_t v29 = v19;
    sub_8784();
    uint64_t v20 = v22;
    sub_1E720();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v7, v20);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    return swift_bridgeObjectRelease();
  }
}

void *sub_85E4(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_8628()
{
  unint64_t result = qword_28448;
  if (!qword_28448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_28448);
  }
  return result;
}

unint64_t sub_867C()
{
  unint64_t result = qword_28450;
  if (!qword_28450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_28450);
  }
  return result;
}

uint64_t sub_86D0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_8730()
{
  unint64_t result = qword_28460;
  if (!qword_28460)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_28460);
  }
  return result;
}

unint64_t sub_8784()
{
  unint64_t result = qword_28468;
  if (!qword_28468)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_28468);
  }
  return result;
}

uint64_t SiriTimePluginModel.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v40 = a2;
  uint64_t v3 = sub_4F84(&qword_28470);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v42 = v3;
  uint64_t v43 = v4;
  __chkstk_darwin(v3);
  char v47 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = sub_4F84(&qword_28478);
  uint64_t v41 = *(void *)(v46 - 8);
  __chkstk_darwin(v46);
  uint64_t v45 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_4F84(&qword_28480);
  uint64_t v44 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for SiriTimePluginModel(0);
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v16 = (char *)&v37 - v15;
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v37 - v17;
  uint64_t v19 = a1[3];
  uint64_t v48 = a1;
  sub_85E4(a1, v19);
  sub_8628();
  uint64_t v20 = v49;
  sub_1E8D0();
  if (v20) {
    return sub_1113C((uint64_t)v48);
  }
  uint64_t v37 = v16;
  uint64_t v38 = v18;
  uint64_t v39 = v13;
  uint64_t v21 = v45;
  uint64_t v22 = v46;
  uint64_t v23 = v47;
  uint64_t v49 = v10;
  uint64_t v24 = sub_1E6A0();
  uint64_t v25 = v9;
  if (*(void *)(v24 + 16) != 1)
  {
    uint64_t v31 = sub_1E580();
    swift_allocError();
    uint64_t v33 = v32;
    sub_4F84(&qword_28488);
    uint64_t *v33 = v49;
    sub_1E630();
    sub_1E570();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v31 - 8) + 104))(v33, enum case for DecodingError.typeMismatch(_:), v31);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v44 + 8))(v9, v7);
    return sub_1113C((uint64_t)v48);
  }
  if (*(unsigned char *)(v24 + 32))
  {
    char v52 = 1;
    sub_867C();
    uint64_t v26 = v23;
    sub_1E620();
    type metadata accessor for TimerSelectorModel(0);
    sub_8DF8(&qword_28490, (void (*)(uint64_t))type metadata accessor for TimerSelectorModel);
    uint64_t v27 = (uint64_t)v39;
    uint64_t v28 = v42;
    sub_1E690();
    (*(void (**)(char *, uint64_t))(v43 + 8))(v26, v28);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v44 + 8))(v25, v7);
    uint64_t v29 = (uint64_t)v48;
    swift_storeEnumTagMultiPayload();
    uint64_t v30 = v27;
  }
  else
  {
    char v51 = 0;
    sub_8730();
    sub_1E620();
    sub_8EA8();
    sub_1E690();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v21, v22);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v44 + 8))(v9, v7);
    uint64_t v29 = (uint64_t)v48;
    uint64_t v35 = v37;
    *uint64_t v37 = v50;
    swift_storeEnumTagMultiPayload();
    uint64_t v30 = (uint64_t)v35;
  }
  uint64_t v36 = (uint64_t)v38;
  sub_8E40(v30, (uint64_t)v38, type metadata accessor for SiriTimePluginModel);
  sub_8E40(v36, v40, type metadata accessor for SiriTimePluginModel);
  return sub_1113C(v29);
}

uint64_t sub_8DF8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_8E40(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_8EA8()
{
  unint64_t result = qword_28498;
  if (!qword_28498)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_28498);
  }
  return result;
}

uint64_t sub_8F00@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return SiriTimePluginModel.init(from:)(a1, a2);
}

uint64_t sub_8F18(void *a1)
{
  return SiriTimePluginModel.encode(to:)(a1);
}

uint64_t TimerSelectorModel.timers.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v1 = a1;
  return result;
}

TimerUIPlugin::TimerSnippetModel (__swiftcall *TimerSelectorModel.timers.modify())(Swift::OpaquePointer timers)
{
  return TimerSnippetModel.init(timers:);
}

void *TimerSnippetModel.init(from:)(void *a1)
{
  return sub_DCE0(a1);
}

uint64_t TimerSnippetModel.encode(to:)(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_4F84(&qword_284A0);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_85E4(a1, a1[3]);
  sub_DE90();
  sub_1E8E0();
  v9[1] = a2;
  sub_4F84(&qword_284B0);
  sub_E1D8(&qword_284B8, &qword_284C0);
  sub_1E720();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

Swift::Int sub_9124()
{
  return sub_1E8C0();
}

void sub_9168()
{
}

Swift::Int sub_9190()
{
  return sub_1E8C0();
}

uint64_t sub_91D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10B3C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_9200(uint64_t a1)
{
  unint64_t v2 = sub_DE90();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_923C(uint64_t a1)
{
  unint64_t v2 = sub_DE90();

  return CodingKey.debugDescription.getter(a1, v2);
}

void *sub_9278@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_DCE0(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_92A4(void *a1)
{
  return TimerSnippetModel.encode(to:)(a1, *v1);
}

uint64_t SiriTimerSnippetModel.timerIdentifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SiriTimerSnippetModel.timerIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t SiriTimerSnippetModel.directInvocationUri.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SiriTimerSnippetModel.directInvocationUri.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

TimerUIPlugin::TimerSnippetModel (__swiftcall *SiriTimerSnippetModel.directInvocationUri.modify())(Swift::OpaquePointer timers)
{
  return TimerSnippetModel.init(timers:);
}

uint64_t SiriTimerSnippetModel.directInvocationPayload.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SiriTimerSnippetModel.directInvocationPayload.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 32) = a1;
  return result;
}

TimerUIPlugin::TimerSnippetModel (__swiftcall *SiriTimerSnippetModel.directInvocationPayload.modify())(Swift::OpaquePointer timers)
{
  return TimerSnippetModel.init(timers:);
}

uint64_t SiriTimerSnippetModel.punchoutURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for SiriTimerSnippetModel(0);
  return sub_111E4(v1 + *(int *)(v3 + 28), a1, &qword_28348);
}

uint64_t SiriTimerSnippetModel.punchoutURL.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for SiriTimerSnippetModel(0) + 28);

  return sub_DF04(a1, v3);
}

TimerUIPlugin::TimerSnippetModel (__swiftcall *SiriTimerSnippetModel.punchoutURL.modify())(Swift::OpaquePointer timers)
{
  return TimerSnippetModel.init(timers:);
}

uint64_t SiriTimerSnippetModel.label.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for SiriTimerSnippetModel(0) + 32));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SiriTimerSnippetModel.label.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for SiriTimerSnippetModel(0) + 32));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

TimerUIPlugin::TimerSnippetModel (__swiftcall *SiriTimerSnippetModel.label.modify())(Swift::OpaquePointer timers)
{
  return TimerSnippetModel.init(timers:);
}

uint64_t SiriTimerSnippetModel.duration.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for SiriTimerSnippetModel(0) + 36));
}

uint64_t SiriTimerSnippetModel.duration.setter(uint64_t a1, char a2)
{
  uint64_t result = type metadata accessor for SiriTimerSnippetModel(0);
  uint64_t v6 = v2 + *(int *)(result + 36);
  *(void *)uint64_t v6 = a1;
  *(unsigned char *)(v6 + 8) = a2 & 1;
  return result;
}

TimerUIPlugin::TimerSnippetModel (__swiftcall *SiriTimerSnippetModel.duration.modify())(Swift::OpaquePointer timers)
{
  return TimerSnippetModel.init(timers:);
}

uint64_t SiriTimerSnippetModel.remainingTime.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for SiriTimerSnippetModel(0) + 40));
}

uint64_t SiriTimerSnippetModel.remainingTime.setter(uint64_t a1, char a2)
{
  uint64_t result = type metadata accessor for SiriTimerSnippetModel(0);
  uint64_t v6 = v2 + *(int *)(result + 40);
  *(void *)uint64_t v6 = a1;
  *(unsigned char *)(v6 + 8) = a2 & 1;
  return result;
}

TimerUIPlugin::TimerSnippetModel (__swiftcall *SiriTimerSnippetModel.remainingTime.modify())(Swift::OpaquePointer timers)
{
  return TimerSnippetModel.init(timers:);
}

uint64_t SiriTimerSnippetModel.state.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for SiriTimerSnippetModel(0) + 44));
}

uint64_t SiriTimerSnippetModel.state.setter(uint64_t a1, char a2)
{
  uint64_t result = type metadata accessor for SiriTimerSnippetModel(0);
  uint64_t v6 = v2 + *(int *)(result + 44);
  *(void *)uint64_t v6 = a1;
  *(unsigned char *)(v6 + 8) = a2 & 1;
  return result;
}

TimerUIPlugin::TimerSnippetModel (__swiftcall *SiriTimerSnippetModel.state.modify())(Swift::OpaquePointer timers)
{
  return TimerSnippetModel.init(timers:);
}

uint64_t SiriTimerSnippetModel.init(timerIdentifier:directInvocation:label:duration:remainingTime:state:punchoutURL:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, int a7@<W6>, uint64_t a8@<X7>, void *a9@<X8>, unsigned __int8 a10, uint64_t a11, unsigned __int8 a12, uint64_t a13)
{
  uint64_t v58 = a8;
  int v57 = a7;
  uint64_t v55 = a5;
  uint64_t v56 = a6;
  uint64_t v53 = a13;
  uint64_t v54 = a4;
  uint64_t v17 = sub_4F84(&qword_284C8);
  uint64_t v18 = __chkstk_darwin(v17 - 8);
  uint64_t v20 = &v44[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v18);
  uint64_t v22 = &v44[-v21];
  uint64_t v23 = (int *)type metadata accessor for SiriTimerSnippetModel(0);
  a9[3] = 0;
  a9[4] = 0;
  a9[2] = 0;
  uint64_t v24 = (uint64_t)a9 + v23[7];
  uint64_t v25 = sub_1DB00();
  uint64_t v26 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56);
  uint64_t v51 = v24;
  v26(v24, 1, 1, v25);
  uint64_t v27 = (void *)((char *)a9 + v23[8]);
  void *v27 = 0;
  v27[1] = 0;
  uint64_t v28 = (char *)a9 + v23[9];
  *(void *)uint64_t v28 = 0;
  uint64_t v50 = v28;
  v28[8] = 1;
  uint64_t v29 = (char *)a9 + v23[10];
  *(void *)uint64_t v29 = 0;
  uint64_t v49 = v29;
  v29[8] = 1;
  uint64_t v30 = (char *)a9 + v23[11];
  *(void *)uint64_t v30 = 0;
  uint64_t v48 = v30;
  v30[8] = 1;
  *a9 = a1;
  a9[1] = a2;
  uint64_t v52 = a3;
  sub_111E4(a3, (uint64_t)v22, &qword_284C8);
  uint64_t v31 = sub_1DCB0();
  uint64_t v32 = *(void *)(v31 - 8);
  uint64_t v33 = *(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v32 + 48);
  if (v33(v22, 1, v31) == 1)
  {
    sub_6528((uint64_t)v22, &qword_284C8);
    uint64_t v34 = 0;
    uint64_t v35 = 0;
  }
  else
  {
    uint64_t v34 = sub_1DC90();
    uint64_t v35 = v36;
    (*(void (**)(unsigned char *, uint64_t))(v32 + 8))(v22, v31);
  }
  int v47 = a12;
  uint64_t v46 = a11;
  int v45 = a10;
  swift_bridgeObjectRelease();
  a9[2] = v34;
  a9[3] = v35;
  uint64_t v37 = v52;
  sub_111E4(v52, (uint64_t)v20, &qword_284C8);
  if (v33(v20, 1, v31) == 1)
  {
    sub_6528(v37, &qword_284C8);
    sub_6528((uint64_t)v20, &qword_284C8);
    uint64_t v38 = 0;
  }
  else
  {
    uint64_t v38 = sub_1DCA0();
    sub_6528(v37, &qword_284C8);
    (*(void (**)(unsigned char *, uint64_t))(v32 + 8))(v20, v31);
  }
  swift_bridgeObjectRelease();
  a9[4] = v38;
  sub_DF04(v53, v51);
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v40 = v55;
  void *v27 = v54;
  v27[1] = v40;
  uint64_t v41 = v50;
  *uint64_t v50 = v56;
  *((unsigned char *)v41 + 8) = v57 & 1;
  uint64_t v42 = v49;
  *uint64_t v49 = v58;
  *((unsigned char *)v42 + 8) = v45 & 1;
  uint64_t v43 = v48;
  *uint64_t v48 = v46;
  *((unsigned char *)v43 + 8) = v47 & 1;
  return result;
}

uint64_t SiriTimerSnippetModel.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v56 = a2;
  uint64_t v3 = sub_4F84(&qword_284D0);
  __chkstk_darwin(v3 - 8);
  uint64_t v53 = (char *)&v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_4F84(&qword_284D8);
  uint64_t v54 = *(void *)(v5 - 8);
  uint64_t v55 = v5;
  __chkstk_darwin(v5);
  uint64_t v52 = (char *)&v51 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_4F84(&qword_28348);
  __chkstk_darwin(v7 - 8);
  uint64_t v58 = (char *)&v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = sub_4F84(&qword_284E0);
  uint64_t v57 = *(void *)(v59 - 8);
  __chkstk_darwin(v59);
  uint64_t v10 = (char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for SiriTimerSnippetModel(0);
  uint64_t v12 = (int *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (uint64_t *)((char *)&v51 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  v14[3] = 0;
  v14[4] = 0;
  v14[2] = 0;
  uint64_t v15 = (uint64_t)v14 + v12[9];
  uint64_t v16 = sub_1DB00();
  uint64_t v17 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  uint64_t v60 = v15;
  v17(v15, 1, 1, v16);
  uint64_t v18 = (uint64_t *)((char *)v14 + v12[10]);
  uint64_t *v18 = 0;
  v18[1] = 0;
  uint64_t v62 = v14;
  uint64_t v63 = v18;
  uint64_t v19 = (char *)v14 + v12[11];
  *(void *)uint64_t v19 = 0;
  v19[8] = 1;
  uint64_t v20 = (char *)v14 + v12[12];
  *(void *)uint64_t v20 = 0;
  v20[8] = 1;
  uint64_t v21 = (uint64_t *)((char *)v14 + v12[13]);
  *uint64_t v21 = 0;
  *((unsigned char *)v21 + 8) = 1;
  uint64_t v22 = a1[3];
  id v61 = a1;
  sub_85E4(a1, v22);
  sub_DF6C();
  uint64_t v23 = v64;
  sub_1E8D0();
  if (v23)
  {
    sub_1113C((uint64_t)v61);
    uint64_t v30 = v60;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_6528(v30, &qword_28348);
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v24 = v19;
    uint64_t v51 = v21;
    uint64_t v64 = v16;
    uint64_t v25 = v57;
    uint64_t v26 = (uint64_t)v58;
    char v71 = 0;
    uint64_t v27 = v10;
    uint64_t v28 = sub_1E640();
    if (v29) {
      uint64_t v32 = v28;
    }
    else {
      uint64_t v32 = 0;
    }
    unint64_t v33 = 0xE000000000000000;
    if (v29) {
      unint64_t v33 = v29;
    }
    uint64_t v34 = v62;
    *uint64_t v62 = v32;
    v34[1] = v33;
    char v70 = 1;
    uint64_t v35 = sub_1E640();
    uint64_t v36 = v63;
    v34[2] = v35;
    v34[3] = v37;
    char v69 = 3;
    *uint64_t v36 = sub_1E640();
    v36[1] = v38;
    char v68 = 4;
    *(void *)uint64_t v24 = sub_1E660();
    v24[8] = v39 & 1;
    char v67 = 5;
    *(void *)uint64_t v20 = sub_1E660();
    v20[8] = v40 & 1;
    char v66 = 6;
    uint64_t v41 = sub_1E670();
    uint64_t v42 = v51;
    uint64_t *v51 = v41;
    *((unsigned char *)v42 + 8) = v43 & 1;
    char v65 = 7;
    sub_8DF8(&qword_284F0, (void (*)(uint64_t))&type metadata accessor for URL);
    sub_1E680();
    uint64_t v44 = v25;
    uint64_t v64 = (uint64_t)v27;
    sub_DF04(v26, v60);
    int v45 = v61;
    sub_85E4(v61, v61[3]);
    sub_DFC0();
    uint64_t v46 = v53;
    sub_1E8D0();
    uint64_t v48 = v54;
    uint64_t v47 = v55;
    (*(void (**)(char *, void, uint64_t, uint64_t))(v54 + 56))(v46, 0, 1, v55);
    uint64_t v49 = (uint64_t)v52;
    (*(void (**)(char *, char *, uint64_t))(v48 + 32))(v52, v46, v47);
    uint64_t v50 = sub_A1FC(v49);
    (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v49, v47);
    (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v64, v59);
    swift_bridgeObjectRelease();
    v34[4] = v50;
    sub_E014((uint64_t)v34, v56, type metadata accessor for SiriTimerSnippetModel);
    sub_1113C((uint64_t)v45);
    return sub_86D0((uint64_t)v34, type metadata accessor for SiriTimerSnippetModel);
  }
}

uint64_t sub_A1FC(uint64_t a1)
{
  uint64_t v2 = sub_4F84(&qword_284D0);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v92 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_4F84(&qword_284D8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v95 = (char *)v92 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v101 = (void *)sub_BD90((uint64_t)&_swiftEmptyArrayStorage);
  uint64_t v98 = v5;
  uint64_t v8 = sub_1E6A0();
  uint64_t v9 = *(void *)(v8 + 16);
  if (!v9)
  {
LABEL_62:
    swift_bridgeObjectRelease();
    return (uint64_t)v101;
  }
  v97 = v4;
  v96 = (void (**)(char *, void, uint64_t, uint64_t))(v6 + 56);
  v94 = (void (**)(char *, char *, uint64_t))(v6 + 32);
  v93 = (void (**)(char *, uint64_t))(v6 + 8);
  v92[1] = v8;
  uint64_t v10 = (unsigned char *)(v8 + 56);
  uint64_t v99 = a1;
  while (1)
  {
    uint64_t v12 = *((void *)v10 - 3);
    uint64_t v13 = *((void *)v10 - 2);
    uint64_t v14 = *((void *)v10 - 1);
    char v15 = *v10;
    *(void *)&long long v104 = v12;
    *((void *)&v104 + 1) = v13;
    uint64_t v105 = v14;
    LOBYTE(v106) = v15;
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_1E670();
    if ((v17 & 1) == 0) {
      break;
    }
    *(void *)&long long v104 = v12;
    *((void *)&v104 + 1) = v13;
    uint64_t v105 = v14;
    LOBYTE(v106) = v15;
    uint64_t v28 = sub_1E660();
    if ((v29 & 1) == 0)
    {
      v106 = &type metadata for Double;
      *(void *)&long long v104 = v28;
      sub_64D4(&v104, &v103);
      uint64_t v30 = v101;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v102 = v30;
      unint64_t v21 = sub_D1DC(v12, v13);
      uint64_t v33 = v30[2];
      BOOL v34 = (v32 & 1) == 0;
      uint64_t v35 = v33 + v34;
      if (__OFADD__(v33, v34)) {
        goto LABEL_66;
      }
      char v36 = v32;
      if (v30[3] >= v35)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
          sub_D81C();
        }
      }
      else
      {
        sub_D4B0(v35, isUniquelyReferenced_nonNull_native);
        unint64_t v37 = sub_D1DC(v12, v13);
        if ((v36 & 1) != (v38 & 1)) {
          goto LABEL_73;
        }
        unint64_t v21 = v37;
      }
      id v75 = v102;
      v101 = v102;
      if ((v36 & 1) == 0)
      {
        v102[(v21 >> 6) + 8] |= 1 << v21;
        v87 = (uint64_t *)(v101[6] + 16 * v21);
        uint64_t *v87 = v12;
        v87[1] = v13;
        sub_64D4(&v103, (_OWORD *)(v101[7] + 32 * v21));
        long long v77 = v101;
        uint64_t v88 = v101[2];
        BOOL v79 = __OFADD__(v88, 1);
        uint64_t v80 = v88 + 1;
        if (v79) {
          goto LABEL_71;
        }
        goto LABEL_61;
      }
      goto LABEL_3;
    }
    *(void *)&long long v104 = v12;
    *((void *)&v104 + 1) = v13;
    uint64_t v105 = v14;
    LOBYTE(v106) = v15;
    uint64_t v39 = sub_1E640();
    if (v40)
    {
      v106 = &type metadata for String;
      *(void *)&long long v104 = v39;
      *((void *)&v104 + 1) = v40;
      sub_64D4(&v104, &v103);
      uint64_t v42 = v101;
      char v43 = swift_isUniquelyReferenced_nonNull_native();
      v102 = v42;
      unint64_t v21 = sub_D1DC(v12, v13);
      uint64_t v45 = v42[2];
      BOOL v46 = (v44 & 1) == 0;
      uint64_t v47 = v45 + v46;
      if (__OFADD__(v45, v46)) {
        goto LABEL_64;
      }
      char v48 = v44;
      if (v42[3] >= v47)
      {
        if ((v43 & 1) == 0) {
          sub_D81C();
        }
      }
      else
      {
        sub_D4B0(v47, v43);
        unint64_t v49 = sub_D1DC(v12, v13);
        if ((v48 & 1) != (v50 & 1)) {
          goto LABEL_73;
        }
        unint64_t v21 = v49;
      }
      id v75 = v102;
      v101 = v102;
      if ((v48 & 1) == 0)
      {
        v102[(v21 >> 6) + 8] |= 1 << v21;
        uint64_t v81 = (uint64_t *)(v101[6] + 16 * v21);
        *uint64_t v81 = v12;
        v81[1] = v13;
        sub_64D4(&v103, (_OWORD *)(v101[7] + 32 * v21));
        long long v77 = v101;
        uint64_t v82 = v101[2];
        BOOL v79 = __OFADD__(v82, 1);
        uint64_t v80 = v82 + 1;
        if (v79) {
          goto LABEL_69;
        }
        goto LABEL_61;
      }
LABEL_3:
      uint64_t v11 = (_OWORD *)(v75[7] + 32 * v21);
      sub_1113C((uint64_t)v11);
      sub_64D4(&v103, v11);
LABEL_4:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_5;
    }
    *(void *)&long long v104 = v12;
    *((void *)&v104 + 1) = v13;
    uint64_t v105 = v14;
    LOBYTE(v106) = v15;
    char v41 = sub_1E650();
    if (v41 != 2)
    {
      v106 = &type metadata for Bool;
      LOBYTE(v104) = v41 & 1;
      sub_64D4(&v104, &v103);
      char v66 = v101;
      char v67 = swift_isUniquelyReferenced_nonNull_native();
      v102 = v66;
      unint64_t v21 = sub_D1DC(v12, v13);
      uint64_t v69 = v66[2];
      BOOL v70 = (v68 & 1) == 0;
      uint64_t v71 = v69 + v70;
      if (__OFADD__(v69, v70)) {
        goto LABEL_67;
      }
      char v72 = v68;
      if (v66[3] >= v71)
      {
        if ((v67 & 1) == 0) {
          sub_D81C();
        }
      }
      else
      {
        sub_D4B0(v71, v67);
        unint64_t v73 = sub_D1DC(v12, v13);
        if ((v72 & 1) != (v74 & 1)) {
          goto LABEL_73;
        }
        unint64_t v21 = v73;
      }
      id v75 = v102;
      v101 = v102;
      if ((v72 & 1) == 0)
      {
        v102[(v21 >> 6) + 8] |= 1 << v21;
        long long v89 = (uint64_t *)(v101[6] + 16 * v21);
        *long long v89 = v12;
        v89[1] = v13;
        sub_64D4(&v103, (_OWORD *)(v101[7] + 32 * v21));
        long long v77 = v101;
        uint64_t v90 = v101[2];
        BOOL v79 = __OFADD__(v90, 1);
        uint64_t v80 = v90 + 1;
        if (v79) {
          goto LABEL_72;
        }
        goto LABEL_61;
      }
      goto LABEL_3;
    }
    uint64_t v100 = v9;
    *(void *)&long long v104 = v12;
    *((void *)&v104 + 1) = v13;
    uint64_t v105 = v14;
    LOBYTE(v106) = v15;
    sub_DFC0();
    uint64_t v51 = v97;
    uint64_t v52 = v98;
    sub_1E620();
    (*v96)(v51, 0, 1, v52);
    uint64_t v53 = v95;
    (*v94)(v95, v51, v52);
    uint64_t v54 = sub_A1FC(v53);
    v106 = (void *)sub_4F84(&qword_28830);
    *(void *)&long long v104 = v54;
    sub_64D4(&v104, &v103);
    uint64_t v55 = v101;
    char v56 = swift_isUniquelyReferenced_nonNull_native();
    v102 = v55;
    unint64_t v58 = sub_D1DC(v12, v13);
    uint64_t v59 = v55[2];
    BOOL v60 = (v57 & 1) == 0;
    uint64_t v61 = v59 + v60;
    if (__OFADD__(v59, v60)) {
      goto LABEL_65;
    }
    char v62 = v57;
    uint64_t v63 = v52;
    if (v55[3] >= v61)
    {
      uint64_t v9 = v100;
      if ((v56 & 1) == 0) {
        sub_D81C();
      }
    }
    else
    {
      sub_D4B0(v61, v56);
      unint64_t v64 = sub_D1DC(v12, v13);
      uint64_t v9 = v100;
      if ((v62 & 1) != (v65 & 1)) {
        goto LABEL_73;
      }
      unint64_t v58 = v64;
    }
    v101 = v102;
    if (v62)
    {
      long long v83 = (_OWORD *)(v102[7] + 32 * v58);
      sub_1113C((uint64_t)v83);
      sub_64D4(&v103, v83);
    }
    else
    {
      v102[(v58 >> 6) + 8] |= 1 << v58;
      uint64_t v84 = (uint64_t *)(v101[6] + 16 * v58);
      *uint64_t v84 = v12;
      v84[1] = v13;
      sub_64D4(&v103, (_OWORD *)(v101[7] + 32 * v58));
      uint64_t v85 = v101[2];
      BOOL v79 = __OFADD__(v85, 1);
      uint64_t v86 = v85 + 1;
      if (v79) {
        goto LABEL_70;
      }
      v101[2] = v86;
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*v93)(v95, v63);
LABEL_5:
    v10 += 32;
    if (!--v9) {
      goto LABEL_62;
    }
  }
  v106 = &type metadata for Int;
  *(void *)&long long v104 = v16;
  sub_64D4(&v104, &v103);
  uint64_t v18 = v101;
  char v19 = swift_isUniquelyReferenced_nonNull_native();
  v102 = v18;
  unint64_t v21 = sub_D1DC(v12, v13);
  uint64_t v22 = v18[2];
  BOOL v23 = (v20 & 1) == 0;
  uint64_t v24 = v22 + v23;
  if (!__OFADD__(v22, v23))
  {
    char v25 = v20;
    if (v18[3] >= v24)
    {
      if ((v19 & 1) == 0) {
        sub_D81C();
      }
    }
    else
    {
      sub_D4B0(v24, v19);
      unint64_t v26 = sub_D1DC(v12, v13);
      if ((v25 & 1) != (v27 & 1)) {
        goto LABEL_73;
      }
      unint64_t v21 = v26;
    }
    id v75 = v102;
    v101 = v102;
    if (v25) {
      goto LABEL_3;
    }
    v102[(v21 >> 6) + 8] |= 1 << v21;
    long long v76 = (uint64_t *)(v101[6] + 16 * v21);
    *long long v76 = v12;
    v76[1] = v13;
    sub_64D4(&v103, (_OWORD *)(v101[7] + 32 * v21));
    long long v77 = v101;
    uint64_t v78 = v101[2];
    BOOL v79 = __OFADD__(v78, 1);
    uint64_t v80 = v78 + 1;
    if (v79) {
      goto LABEL_68;
    }
LABEL_61:
    v77[2] = v80;
    swift_bridgeObjectRetain();
    goto LABEL_4;
  }
  __break(1u);
LABEL_64:
  __break(1u);
LABEL_65:
  __break(1u);
LABEL_66:
  __break(1u);
LABEL_67:
  __break(1u);
LABEL_68:
  __break(1u);
LABEL_69:
  __break(1u);
LABEL_70:
  __break(1u);
LABEL_71:
  __break(1u);
LABEL_72:
  __break(1u);
LABEL_73:
  uint64_t result = sub_1E850();
  __break(1u);
  return result;
}

uint64_t SiriTimerSnippetModel.encode(to:)(void *a1)
{
  uint64_t v3 = sub_4F84(&qword_28500);
  uint64_t v25 = *(void *)(v3 - 8);
  uint64_t v26 = v3;
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_4F84(&qword_28508);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_85E4(a1, a1[3]);
  sub_DF6C();
  sub_1E8E0();
  LOBYTE(v28) = 0;
  uint64_t v10 = v27;
  sub_1E6E0();
  if (v10) {
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  uint64_t v24 = v5;
  uint64_t v27 = v7;
  long long v28 = *(_OWORD *)(v1 + 16);
  char v29 = 1;
  sub_4F84(&qword_28318);
  sub_E07C(&qword_28510, &qword_28318);
  sub_1E720();
  BOOL v23 = (int *)type metadata accessor for SiriTimerSnippetModel(0);
  long long v28 = *(_OWORD *)(v1 + v23[8]);
  char v29 = 3;
  sub_1E720();
  uint64_t v12 = v27;
  uint64_t v13 = (uint64_t *)(v1 + v23[9]);
  uint64_t v14 = *v13;
  LOBYTE(v13) = *((unsigned char *)v13 + 8);
  *(void *)&long long v28 = v14;
  BYTE8(v28) = (_BYTE)v13;
  char v29 = 4;
  sub_4F84(&qword_28518);
  sub_E07C(&qword_28520, &qword_28518);
  sub_1E720();
  char v15 = (uint64_t *)(v1 + v23[10]);
  uint64_t v16 = *v15;
  LOBYTE(v15) = *((unsigned char *)v15 + 8);
  *(void *)&long long v28 = v16;
  BYTE8(v28) = (_BYTE)v15;
  char v29 = 5;
  sub_1E720();
  char v17 = (uint64_t *)(v1 + v23[11]);
  uint64_t v18 = *v17;
  LOBYTE(v17) = *((unsigned char *)v17 + 8);
  *(void *)&long long v28 = v18;
  BYTE8(v28) = (_BYTE)v17;
  char v29 = 6;
  sub_4F84(&qword_28528);
  sub_E07C(&qword_28530, &qword_28528);
  sub_1E720();
  LOBYTE(v28) = 7;
  sub_4F84(&qword_28348);
  sub_E0E0();
  sub_1E720();
  uint64_t v19 = *(void *)(v1 + 32);
  if (!v19) {
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v9, v6);
  }
  sub_85E4(a1, a1[3]);
  sub_DFC0();
  char v20 = v9;
  uint64_t v21 = (uint64_t)v24;
  sub_1E8E0();
  sub_B1F0(v21, v19);
  (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v21, v26);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v20, v6);
}

uint64_t sub_B1F0(uint64_t a1, uint64_t a2)
{
  uint64_t v43 = a1;
  uint64_t v32 = sub_4F84(&qword_28500);
  __chkstk_darwin(v32);
  long long v28 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = a2 + 64;
  uint64_t v7 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v8 = -1;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  unint64_t v9 = v8 & *(void *)(a2 + 64);
  int64_t v31 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v27 = (void (**)(char *, uint64_t))(v4 + 8);
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v11 = 0;
  uint64_t v30 = (char *)&type metadata for Any + 8;
  while (v9)
  {
    unint64_t v12 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    unint64_t v13 = v12 | (v11 << 6);
LABEL_23:
    char v17 = (uint64_t *)(*(void *)(a2 + 48) + 16 * v13);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    if (*(void *)(a2 + 16))
    {
      swift_bridgeObjectRetain_n();
      unint64_t v20 = sub_D1DC(v18, v19);
      if (v21)
      {
        sub_6478(*(void *)(a2 + 56) + 32 * v20, (uint64_t)&v41);
      }
      else
      {
        long long v41 = 0u;
        long long v42 = 0u;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      long long v41 = 0u;
      long long v42 = 0u;
      swift_bridgeObjectRetain();
    }
    sub_111E4((uint64_t)&v41, (uint64_t)&v37, &qword_28820);
    if (v40)
    {
      if ((swift_dynamicCast() & 1) == 0) {
        goto LABEL_34;
      }
      uint64_t v37 = v18;
      uint64_t v38 = v19;
      uint64_t v39 = 0;
      LOBYTE(v40) = 1;
      sub_1E6E0();
      if (v2)
      {
        swift_bridgeObjectRelease();
LABEL_65:
        sub_6528((uint64_t)&v41, &qword_28820);
        swift_bridgeObjectRelease();
        return swift_release();
      }
      sub_6528((uint64_t)&v41, &qword_28820);
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
    }
    else
    {
      sub_6528((uint64_t)&v37, &qword_28820);
LABEL_34:
      sub_111E4((uint64_t)&v41, (uint64_t)&v37, &qword_28820);
      if (v40)
      {
        if (swift_dynamicCast())
        {
          uint64_t v37 = v18;
          uint64_t v38 = v19;
          uint64_t v39 = 0;
          LOBYTE(v40) = 1;
          sub_1E710();
          if (v2) {
            goto LABEL_65;
          }
          goto LABEL_5;
        }
      }
      else
      {
        sub_6528((uint64_t)&v37, &qword_28820);
      }
      sub_111E4((uint64_t)&v41, (uint64_t)&v37, &qword_28820);
      if (v40)
      {
        if (swift_dynamicCast())
        {
          uint64_t v37 = v18;
          uint64_t v38 = v19;
          uint64_t v39 = 0;
          LOBYTE(v40) = 1;
          sub_1E700();
          if (v2) {
            goto LABEL_65;
          }
          goto LABEL_5;
        }
      }
      else
      {
        sub_6528((uint64_t)&v37, &qword_28820);
      }
      sub_111E4((uint64_t)&v41, (uint64_t)&v37, &qword_28820);
      if (!v40)
      {
        sub_6528((uint64_t)&v37, &qword_28820);
        goto LABEL_48;
      }
      if (swift_dynamicCast())
      {
        uint64_t v37 = v18;
        uint64_t v38 = v19;
        uint64_t v39 = 0;
        LOBYTE(v40) = 1;
        sub_1E6F0();
        if (v2) {
          goto LABEL_65;
        }
LABEL_5:
        sub_6528((uint64_t)&v41, &qword_28820);
        uint64_t result = swift_bridgeObjectRelease();
      }
      else
      {
LABEL_48:
        sub_111E4((uint64_t)&v41, (uint64_t)&v37, &qword_28820);
        if (v40)
        {
          sub_4F84(&qword_28830);
          if ((swift_dynamicCast() & 1) == 0) {
            goto LABEL_53;
          }
          uint64_t v22 = v6;
          uint64_t v29 = v33;
          uint64_t v37 = v18;
          uint64_t v38 = v19;
          uint64_t v39 = 0;
          LOBYTE(v40) = 1;
          sub_DFC0();
          BOOL v23 = v28;
          uint64_t v24 = v32;
          sub_1E6D0();
          swift_bridgeObjectRelease();
          sub_B1F0(v23, v29);
          swift_bridgeObjectRelease();
          (*v27)(v23, v24);
          uint64_t result = sub_6528((uint64_t)&v41, &qword_28820);
          if (v2) {
            return swift_release();
          }
          uint64_t v6 = v22;
        }
        else
        {
          sub_6528((uint64_t)&v37, &qword_28820);
LABEL_53:
          sub_111E4((uint64_t)&v41, (uint64_t)&v37, &qword_28820);
          if (!v40)
          {
            sub_6528((uint64_t)&v37, &qword_28820);
            goto LABEL_58;
          }
          sub_4F84(&qword_28828);
          if (swift_dynamicCast())
          {
            uint64_t v25 = v33;
            uint64_t v33 = v18;
            uint64_t v34 = v19;
            uint64_t v35 = 0;
            char v36 = 1;
            sub_1E6C0();
            swift_bridgeObjectRelease();
            sub_B8F0((uint64_t)&v37, v25);
            swift_bridgeObjectRelease();
            sub_1113C((uint64_t)&v37);
            uint64_t result = sub_6528((uint64_t)&v41, &qword_28820);
            if (v2) {
              return swift_release();
            }
          }
          else
          {
LABEL_58:
            uint64_t v37 = v18;
            uint64_t v38 = v19;
            uint64_t v39 = 0;
            LOBYTE(v40) = 1;
            sub_1E730();
            sub_6528((uint64_t)&v41, &qword_28820);
            uint64_t result = swift_bridgeObjectRelease();
            if (v2) {
              return swift_release();
            }
          }
        }
      }
    }
  }
  if (__OFADD__(v11++, 1))
  {
    __break(1u);
    goto LABEL_68;
  }
  if (v11 >= v31) {
    return swift_release();
  }
  unint64_t v15 = *(void *)(v6 + 8 * v11);
  if (v15)
  {
LABEL_22:
    unint64_t v9 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v11 << 6);
    goto LABEL_23;
  }
  int64_t v16 = v11 + 1;
  if (v11 + 1 >= v31) {
    return swift_release();
  }
  unint64_t v15 = *(void *)(v6 + 8 * v16);
  if (v15) {
    goto LABEL_21;
  }
  int64_t v16 = v11 + 2;
  if (v11 + 2 >= v31) {
    return swift_release();
  }
  unint64_t v15 = *(void *)(v6 + 8 * v16);
  if (v15) {
    goto LABEL_21;
  }
  int64_t v16 = v11 + 3;
  if (v11 + 3 >= v31) {
    return swift_release();
  }
  unint64_t v15 = *(void *)(v6 + 8 * v16);
  if (v15) {
    goto LABEL_21;
  }
  int64_t v16 = v11 + 4;
  if (v11 + 4 >= v31) {
    return swift_release();
  }
  unint64_t v15 = *(void *)(v6 + 8 * v16);
  if (v15) {
    goto LABEL_21;
  }
  int64_t v16 = v11 + 5;
  if (v11 + 5 >= v31) {
    return swift_release();
  }
  unint64_t v15 = *(void *)(v6 + 8 * v16);
  if (v15)
  {
LABEL_21:
    int64_t v11 = v16;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v11 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v11 >= v31) {
      return swift_release();
    }
    unint64_t v15 = *(void *)(v6 + 8 * v11);
    ++v16;
    if (v15) {
      goto LABEL_22;
    }
  }
LABEL_68:
  __break(1u);
  return result;
}

uint64_t sub_B8F0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_4F84(&qword_28500);
  uint64_t result = __chkstk_darwin(v6);
  uint64_t v10 = *(void *)(a2 + 16);
  if (!v10) {
    return result;
  }
  uint64_t v19 = result;
  unint64_t v20 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = a2 + 32;
  uint64_t v18 = (void (**)(char *, uint64_t))(v8 + 8);
  uint64_t v21 = a2;
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_6478(v11, (uint64_t)v24);
    sub_6478((uint64_t)v24, (uint64_t)v22);
    if (!swift_dynamicCast()) {
      break;
    }
    sub_110EC(a1, *(void *)(a1 + 24));
    sub_1E7F0();
    if (v3)
    {
      swift_bridgeObjectRelease();
      goto LABEL_23;
    }
    sub_1113C((uint64_t)v24);
    swift_bridgeObjectRelease();
LABEL_5:
    v11 += 32;
    if (!--v10) {
      return swift_bridgeObjectRelease();
    }
  }
  sub_6478((uint64_t)v24, (uint64_t)v22);
  if (swift_dynamicCast())
  {
    sub_110EC(a1, *(void *)(a1 + 24));
    uint64_t v12 = v3;
    sub_1E820();
    goto LABEL_4;
  }
  sub_6478((uint64_t)v24, (uint64_t)v22);
  if (swift_dynamicCast())
  {
    sub_110EC(a1, *(void *)(a1 + 24));
    uint64_t v12 = v3;
    sub_1E810();
    goto LABEL_4;
  }
  sub_6478((uint64_t)v24, (uint64_t)v22);
  if (swift_dynamicCast())
  {
    sub_110EC(a1, *(void *)(a1 + 24));
    uint64_t v12 = v3;
    sub_1E800();
LABEL_4:
    uint64_t v3 = v12;
    sub_1113C((uint64_t)v24);
    if (v12) {
      return swift_bridgeObjectRelease();
    }
    goto LABEL_5;
  }
  sub_6478((uint64_t)v24, (uint64_t)v22);
  sub_4F84(&qword_28830);
  if (swift_dynamicCast())
  {
    uint64_t v13 = v23;
    uint64_t v14 = *(void *)(a1 + 24);
    uint64_t v17 = *(void *)(a1 + 32);
    sub_110EC(a1, v14);
    sub_DFC0();
    unint64_t v15 = v20;
    sub_1E7D0();
    sub_B1F0(v15, v13);
    if (v3)
    {
      swift_bridgeObjectRelease();
      (*v18)(v15, v19);
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    (*v18)(v15, v19);
    goto LABEL_21;
  }
  sub_6478((uint64_t)v24, (uint64_t)v22);
  sub_4F84(&qword_28828);
  if (!swift_dynamicCast())
  {
    sub_110EC(a1, *(void *)(a1 + 24));
    sub_1E830();
    if (v3) {
      goto LABEL_23;
    }
    goto LABEL_21;
  }
  uint64_t v16 = v23;
  sub_110EC(a1, *(void *)(a1 + 24));
  sub_1E7E0();
  sub_B8F0(v22, v16);
  if (!v3)
  {
    swift_bridgeObjectRelease();
    sub_1113C((uint64_t)v22);
LABEL_21:
    sub_1113C((uint64_t)v24);
    goto LABEL_5;
  }
  swift_bridgeObjectRelease();
  sub_1113C((uint64_t)v22);
LABEL_23:
  sub_1113C((uint64_t)v24);
  return swift_bridgeObjectRelease();
}

unint64_t sub_BD90(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_4F84(&qword_28840);
  uint64_t v2 = sub_1E5E0();
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
    sub_111E4(v6, (uint64_t)&v15, &qword_28850);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_D1DC(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_64D4(&v17, (_OWORD *)(v3[7] + 32 * result));
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

char *sub_BEC8(void *a1)
{
  uint64_t v2 = sub_4F84(&qword_284D0);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_4F84(&qword_284D8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_85E4(a1, a1[3]);
  if ((sub_1E7B0() & 1) == 0)
  {
    uint64_t v11 = (void (**)(char *, void, uint64_t, uint64_t))(v6 + 56);
    uint64_t v25 = (void (**)(char *, char *, uint64_t))(v6 + 32);
    uint64_t v9 = (char *)&_swiftEmptyArrayStorage;
    uint64_t v24 = (void (**)(char *, uint64_t))(v6 + 8);
    while (1)
    {
      sub_110EC((uint64_t)a1, a1[3]);
      uint64_t v12 = sub_1E770();
      if (v13)
      {
        uint64_t v27 = &type metadata for String;
        *(void *)&long long v26 = v12;
        *((void *)&v26 + 1) = v13;
      }
      else
      {
        sub_110EC((uint64_t)a1, a1[3]);
        uint64_t v14 = sub_1E7A0();
        if ((v15 & 1) == 0)
        {
          uint64_t v16 = &type metadata for Int;
LABEL_14:
          uint64_t v27 = v16;
          *(void *)&long long v26 = v14;
          goto LABEL_22;
        }
        sub_110EC((uint64_t)a1, a1[3]);
        uint64_t v14 = sub_1E790();
        if ((v17 & 1) == 0)
        {
          uint64_t v16 = &type metadata for Double;
          goto LABEL_14;
        }
        sub_110EC((uint64_t)a1, a1[3]);
        char v18 = sub_1E780();
        if (v18 == 2)
        {
          sub_110EC((uint64_t)a1, a1[3]);
          sub_DFC0();
          sub_1E750();
          (*v11)(v4, 0, 1, v5);
          (*v25)(v8, v4, v5);
          uint64_t v19 = sub_A1FC(v8);
          uint64_t v27 = (void *)sub_4F84(&qword_28830);
          *(void *)&long long v26 = v19;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v9 = sub_D0CC(0, *((void *)v9 + 2) + 1, 1, v9);
          }
          unint64_t v21 = *((void *)v9 + 2);
          unint64_t v20 = *((void *)v9 + 3);
          if (v21 >= v20 >> 1) {
            uint64_t v9 = sub_D0CC((char *)(v20 > 1), v21 + 1, 1, v9);
          }
          *((void *)v9 + 2) = v21 + 1;
          sub_64D4(&v26, &v9[32 * v21 + 32]);
          (*v24)(v8, v5);
          goto LABEL_5;
        }
        uint64_t v27 = &type metadata for Bool;
        LOBYTE(v26) = v18 & 1;
      }
LABEL_22:
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v9 = sub_D0CC(0, *((void *)v9 + 2) + 1, 1, v9);
      }
      unint64_t v23 = *((void *)v9 + 2);
      unint64_t v22 = *((void *)v9 + 3);
      if (v23 >= v22 >> 1) {
        uint64_t v9 = sub_D0CC((char *)(v22 > 1), v23 + 1, 1, v9);
      }
      *((void *)v9 + 2) = v23 + 1;
      sub_64D4(&v26, &v9[32 * v23 + 32]);
LABEL_5:
      sub_85E4(a1, a1[3]);
      if (sub_1E7B0()) {
        return v9;
      }
    }
  }
  return (char *)&_swiftEmptyArrayStorage;
}

unint64_t sub_C4B4(char a1)
{
  unint64_t result = 0xD000000000000013;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0xD000000000000017;
      break;
    case 3:
      unint64_t result = 0x6C6562616CLL;
      break;
    case 4:
      unint64_t result = 0x6E6F697461727564;
      break;
    case 5:
      unint64_t result = 0x6E696E69616D6572;
      break;
    case 6:
      unint64_t result = 0x6574617473;
      break;
    case 7:
      unint64_t result = 0x74756F68636E7570;
      break;
    default:
      unint64_t result = 0x65644972656D6974;
      break;
  }
  return result;
}

BOOL sub_C5D4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_C5E8()
{
  Swift::UInt v1 = *v0;
  sub_1E8A0();
  sub_1E8B0(v1);
  return sub_1E8C0();
}

void sub_C630()
{
  sub_1E8B0(*v0);
}

Swift::Int sub_C65C()
{
  Swift::UInt v1 = *v0;
  sub_1E8A0();
  sub_1E8B0(v1);
  return sub_1E8C0();
}

unint64_t sub_C6A0()
{
  return sub_C4B4(*v0);
}

uint64_t sub_C6A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10CC8(a1, a2);
  *a3 = result;
  return result;
}

void sub_C6D0(unsigned char *a1@<X8>)
{
  *a1 = 8;
}

uint64_t sub_C6DC(uint64_t a1)
{
  unint64_t v2 = sub_DF6C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_C718(uint64_t a1)
{
  unint64_t v2 = sub_DF6C();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_C754@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return SiriTimerSnippetModel.init(from:)(a1, a2);
}

uint64_t sub_C76C(void *a1)
{
  return SiriTimerSnippetModel.encode(to:)(a1);
}

uint64_t sub_C784@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)a3 = result;
  *(void *)(a3 + 8) = a2;
  *(void *)(a3 + 16) = 0;
  *(unsigned char *)(a3 + 24) = 1;
  return result;
}

uint64_t sub_C798()
{
  return *(void *)(v0 + 16);
}

uint64_t sub_C7A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_1E740();
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v5;
  *(void *)(a2 + 16) = a1;
  *(unsigned char *)(a2 + 24) = 0;
  return result;
}

uint64_t sub_C800(uint64_t a1)
{
  unint64_t v2 = sub_DFC0();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_C83C(uint64_t a1)
{
  unint64_t v2 = sub_DFC0();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t TimerSelectorModel.timers.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t property wrapper backing initializer of TimerSelectorModel.header()
{
  return sub_1DC40();
}

uint64_t TimerSelectorModel.header.setter()
{
  return sub_1DC70();
}

void (*TimerSelectorModel.header.modify(void *a1))(void *a1)
{
  unint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for TimerSelectorModel(0);
  sub_4F84(&qword_281D0);
  v2[4] = sub_1DC50();
  return sub_C97C;
}

void sub_C97C(void *a1)
{
  Swift::UInt v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

uint64_t TimerSelectorModel.init(timers:header:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = a1;
  type metadata accessor for TimerSelectorModel(0);
  return sub_1DC40();
}

uint64_t sub_CA28(char a1)
{
  if (a1) {
    return 0x726564616568;
  }
  else {
    return 0x7372656D6974;
  }
}

BOOL sub_CA50(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_CA68()
{
  return sub_CA28(*v0);
}

uint64_t sub_CA70@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_11010(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_CA98(uint64_t a1)
{
  unint64_t v2 = sub_E184();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_CAD4(uint64_t a1)
{
  unint64_t v2 = sub_E184();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t TimerSelectorModel.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_4F84(&qword_28548);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_85E4(a1, a1[3]);
  sub_E184();
  sub_1E8E0();
  uint64_t v11 = *v3;
  v10[7] = 0;
  sub_4F84(&qword_284B0);
  sub_E1D8(&qword_284B8, &qword_284C0);
  sub_1E720();
  if (!v2)
  {
    type metadata accessor for TimerSelectorModel(0);
    v10[6] = 1;
    sub_4F84(&qword_281D0);
    sub_E26C(&qword_28558);
    sub_1E720();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t TimerSelectorModel.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v23 = a2;
  uint64_t v25 = sub_4F84(&qword_281D0);
  uint64_t v22 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_4F84(&qword_28560);
  uint64_t v24 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for TimerSelectorModel(0);
  __chkstk_darwin(v8);
  char v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_85E4(a1, a1[3]);
  sub_E184();
  sub_1E8D0();
  if (v2) {
    return sub_1113C((uint64_t)a1);
  }
  unint64_t v21 = a1;
  uint64_t v11 = v10;
  uint64_t v13 = v24;
  uint64_t v12 = v25;
  sub_4F84(&qword_284B0);
  char v28 = 0;
  sub_E1D8(&qword_28568, &qword_28570);
  uint64_t v14 = v26;
  sub_1E690();
  uint64_t v19 = v11;
  uint64_t v20 = v29;
  *(void *)uint64_t v11 = v29;
  char v27 = 1;
  sub_E26C(&qword_28578);
  sub_1E690();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v7, v14);
  uint64_t v15 = *(int *)(v8 + 20);
  uint64_t v16 = (uint64_t)v19;
  (*(void (**)(char *, char *, uint64_t))(v22 + 32))(&v19[v15], v5, v12);
  sub_E014(v16, v23, type metadata accessor for TimerSelectorModel);
  sub_1113C((uint64_t)v21);
  return sub_86D0(v16, type metadata accessor for TimerSelectorModel);
}

uint64_t sub_D09C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return TimerSelectorModel.init(from:)(a1, a2);
}

uint64_t sub_D0B4(void *a1)
{
  return TimerSelectorModel.encode(to:)(a1);
}

char *sub_D0CC(char *result, int64_t a2, char a3, char *a4)
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
      sub_4F84(&qword_28848);
      char v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 5);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      char v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[32 * v8 + 32]) {
          memmove(v13, a4 + 32, 32 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_10BD0(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_D1DC(uint64_t a1, uint64_t a2)
{
  sub_1E8A0();
  sub_1E410();
  Swift::Int v4 = sub_1E8C0();

  return sub_D254(a1, a2, v4);
}

unint64_t sub_D254(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1E840() & 1) == 0)
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
      while (!v14 && (sub_1E840() & 1) == 0);
    }
  }
  return v6;
}

_OWORD *sub_D338@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, _OWORD *a5@<X8>)
{
  unint64_t v6 = (void **)v5;
  uint64_t v12 = (void *)*v5;
  unint64_t v14 = sub_D1DC(a2, a3);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 < v17 || (a4 & 1) == 0)
  {
    if (v19 >= v17 && (a4 & 1) == 0)
    {
      sub_D81C();
      goto LABEL_7;
    }
    sub_D4B0(v17, a4 & 1);
    unint64_t v23 = sub_D1DC(a2, a3);
    if ((v18 & 1) == (v24 & 1))
    {
      unint64_t v14 = v23;
      uint64_t v20 = *v6;
      if (v18) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = (_OWORD *)sub_1E850();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v20 = *v6;
  if (v18)
  {
LABEL_8:
    sub_64D4((_OWORD *)(v20[7] + 32 * v14), a5);
    unint64_t v21 = (_OWORD *)(v20[7] + 32 * v14);
    return sub_64D4(a1, v21);
  }
LABEL_13:
  sub_D7B0(v14, a2, a3, a1, v20);
  *a5 = 0u;
  a5[1] = 0u;

  return (_OWORD *)swift_bridgeObjectRetain();
}

uint64_t sub_D4B0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_4F84(&qword_28840);
  uint64_t v6 = sub_1E5D0();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v34 = (void *)(v5 + 64);
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
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v13 << 6);
      }
      else
      {
        int64_t v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33) {
          goto LABEL_34;
        }
        unint64_t v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          int64_t v13 = v18 + 1;
          if (v18 + 1 >= v33) {
            goto LABEL_34;
          }
          unint64_t v19 = v34[v13];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v2;
              if (a2)
              {
                uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
                if (v32 >= 64) {
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v34 = -1 << v32;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v13 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v33) {
                  goto LABEL_34;
                }
                unint64_t v19 = v34[v13];
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
        unint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      unint64_t v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      char v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_64D4(v24, v35);
      }
      else
      {
        sub_6478((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_1E8A0();
      sub_1E410();
      uint64_t result = sub_1E8C0();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
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
            goto LABEL_40;
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
      uint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      *uint64_t v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_64D4(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

_OWORD *sub_D7B0(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  void *v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_64D4(a4, (_OWORD *)(a5[7] + 32 * a1));
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

void *sub_D81C()
{
  Swift::UInt v1 = v0;
  sub_4F84(&qword_28840);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1E5C0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    *Swift::UInt v1 = v4;
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
    uint64_t v20 = 32 * v15;
    sub_6478(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = v19;
    v21[1] = v18;
    sub_64D4(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    Swift::UInt v1 = v25;
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

_OWORD *sub_DA04(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_D1DC(a2, a3);
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
      sub_D81C();
      goto LABEL_7;
    }
    sub_D4B0(v15, a4 & 1);
    unint64_t v21 = sub_D1DC(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      uint64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = (_OWORD *)sub_1E850();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = (_OWORD *)(v18[7] + 32 * v12);
    sub_1113C((uint64_t)v19);
    return sub_64D4(a1, v19);
  }
LABEL_13:
  sub_D7B0(v12, a2, a3, a1, v18);

  return (_OWORD *)swift_bridgeObjectRetain();
}

uint64_t sub_DB58(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6C754D72656D6974 && a2 == 0xEA00000000006974;
  if (v3 || (sub_1E840() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6C655372656D6974 && a2 == 0xED0000726F746365)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_1E840();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_DC64()
{
  return 12383;
}

uint64_t sub_DC70(uint64_t a1, uint64_t a2)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_1E840();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

void *sub_DCE0(void *a1)
{
  uint64_t v3 = sub_4F84(&qword_28858);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  char v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v7 = sub_85E4(a1, a1[3]);
  sub_DE90();
  sub_1E8D0();
  if (v1)
  {
    sub_1113C((uint64_t)a1);
  }
  else
  {
    sub_4F84(&qword_284B0);
    sub_E1D8(&qword_28568, &qword_28570);
    sub_1E690();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    unint64_t v7 = (void *)v9[1];
    sub_1113C((uint64_t)a1);
  }
  return v7;
}

unint64_t sub_DE90()
{
  unint64_t result = qword_284A8;
  if (!qword_284A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_284A8);
  }
  return result;
}

uint64_t type metadata accessor for SiriTimerSnippetModel(uint64_t a1)
{
  return sub_5B20(a1, (uint64_t *)&unk_28690);
}

uint64_t sub_DF04(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_4F84(&qword_28348);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_DF6C()
{
  unint64_t result = qword_284E8;
  if (!qword_284E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_284E8);
  }
  return result;
}

unint64_t sub_DFC0()
{
  unint64_t result = qword_284F8;
  if (!qword_284F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_284F8);
  }
  return result;
}

uint64_t sub_E014(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_E07C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_571C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_E0E0()
{
  unint64_t result = qword_28538;
  if (!qword_28538)
  {
    sub_571C(&qword_28348);
    sub_8DF8(&qword_28540, (void (*)(uint64_t))&type metadata accessor for URL);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_28538);
  }
  return result;
}

unint64_t sub_E184()
{
  unint64_t result = qword_28550;
  if (!qword_28550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_28550);
  }
  return result;
}

uint64_t sub_E1D8(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_571C(&qword_284B0);
    sub_8DF8(a2, (void (*)(uint64_t))type metadata accessor for SiriTimerSnippetModel);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_E26C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_571C(&qword_281D0);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_E2D4()
{
  return sub_8DF8(&qword_28580, (void (*)(uint64_t))type metadata accessor for SiriTimePluginModel);
}

uint64_t sub_E31C()
{
  return sub_8DF8(&qword_28588, (void (*)(uint64_t))type metadata accessor for SiriTimePluginModel);
}

uint64_t sub_E36C()
{
  return sub_8DF8(&qword_28490, (void (*)(uint64_t))type metadata accessor for TimerSelectorModel);
}

uint64_t sub_E3B4()
{
  return sub_8DF8(&qword_28458, (void (*)(uint64_t))type metadata accessor for TimerSelectorModel);
}

uint64_t *initializeBufferWithCopyOfBuffer for SiriTimePluginModel(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    *a1 = *a2;
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v7 = *(int *)(type metadata accessor for TimerSelectorModel(0) + 20);
      uint64_t v8 = (char *)a1 + v7;
      int64_t v9 = (char *)a2 + v7;
      swift_bridgeObjectRetain();
      uint64_t v10 = sub_4F84(&qword_281D0);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for SiriTimePluginModel(uint64_t a1)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t result = swift_bridgeObjectRelease();
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v4 = a1 + *(int *)(type metadata accessor for TimerSelectorModel(0) + 20);
    uint64_t v5 = sub_4F84(&qword_281D0);
    char v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v6(v4, v5);
  }
  return result;
}

void *initializeWithCopy for SiriTimePluginModel(void *a1, void *a2)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  *a1 = *a2;
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v5 = *(int *)(type metadata accessor for TimerSelectorModel(0) + 20);
    char v6 = (char *)a1 + v5;
    uint64_t v7 = (char *)a2 + v5;
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_4F84(&qword_281D0);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *assignWithCopy for SiriTimePluginModel(void *a1, void *a2)
{
  if (a1 != a2)
  {
    sub_86D0((uint64_t)a1, type metadata accessor for SiriTimePluginModel);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    *a1 = *a2;
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v5 = *(int *)(type metadata accessor for TimerSelectorModel(0) + 20);
      char v6 = (char *)a1 + v5;
      uint64_t v7 = (char *)a2 + v5;
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_4F84(&qword_281D0);
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

void *initializeWithTake for SiriTimePluginModel(void *a1, void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    *a1 = *a2;
    uint64_t v6 = *(int *)(type metadata accessor for TimerSelectorModel(0) + 20);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = sub_4F84(&qword_281D0);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for SiriTimePluginModel(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_86D0((uint64_t)a1, type metadata accessor for SiriTimePluginModel);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *a1 = *a2;
      uint64_t v6 = *(int *)(type metadata accessor for TimerSelectorModel(0) + 20);
      uint64_t v7 = (char *)a1 + v6;
      uint64_t v8 = (char *)a2 + v6;
      uint64_t v9 = sub_4F84(&qword_281D0);
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

uint64_t getEnumTagSinglePayload for SiriTimePluginModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for SiriTimePluginModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_E9B8()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_E9C8()
{
  uint64_t result = type metadata accessor for TimerSelectorModel(319);
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for TimerSnippetModel()
{
  return &type metadata for TimerSnippetModel;
}

uint64_t *initializeBufferWithCopyOfBuffer for SiriTimerSnippetModel(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    uint64_t v9 = a3[7];
    __dst = (char *)a1 + v9;
    uint64_t v10 = (char *)a2 + v9;
    a1[4] = a2[4];
    uint64_t v11 = sub_1DB00();
    uint64_t v12 = *(void *)(v11 - 8);
    unint64_t v29 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v29(v10, 1, v11))
    {
      uint64_t v13 = sub_4F84(&qword_28348);
      memcpy(__dst, v10, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(__dst, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(__dst, 0, 1, v11);
    }
    uint64_t v15 = a3[8];
    uint64_t v16 = a3[9];
    uint64_t v17 = (uint64_t *)((char *)v4 + v15);
    uint64_t v18 = (uint64_t *)((char *)a2 + v15);
    uint64_t v19 = v18[1];
    void *v17 = *v18;
    v17[1] = v19;
    uint64_t v20 = (char *)v4 + v16;
    unint64_t v21 = (char *)a2 + v16;
    *(void *)uint64_t v20 = *(void *)v21;
    v20[8] = v21[8];
    uint64_t v22 = a3[10];
    uint64_t v23 = a3[11];
    int64_t v24 = (char *)v4 + v22;
    uint64_t v25 = (char *)a2 + v22;
    *(void *)int64_t v24 = *(void *)v25;
    v24[8] = v25[8];
    unint64_t v26 = (char *)v4 + v23;
    unint64_t v27 = (char *)a2 + v23;
    *(void *)unint64_t v26 = *(void *)v27;
    v26[8] = v27[8];
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for SiriTimerSnippetModel(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = sub_1DB00();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for SiriTimerSnippetModel(void *a1, void *a2, int *a3)
{
  uint64_t v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  uint64_t v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  a1[4] = a2[4];
  uint64_t v7 = a3[7];
  __dst = (char *)a1 + v7;
  uint64_t v8 = (char *)a2 + v7;
  uint64_t v9 = sub_1DB00();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v11(v8, 1, v9))
  {
    uint64_t v12 = sub_4F84(&qword_28348);
    memcpy(__dst, v8, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(__dst, v8, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(__dst, 0, 1, v9);
  }
  uint64_t v13 = a3[8];
  uint64_t v14 = a3[9];
  uint64_t v15 = (void *)((char *)a1 + v13);
  uint64_t v16 = (void *)((char *)a2 + v13);
  uint64_t v17 = v16[1];
  *uint64_t v15 = *v16;
  v15[1] = v17;
  uint64_t v18 = (char *)a1 + v14;
  uint64_t v19 = (char *)a2 + v14;
  *(void *)uint64_t v18 = *(void *)v19;
  v18[8] = v19[8];
  uint64_t v20 = a3[10];
  uint64_t v21 = a3[11];
  uint64_t v22 = (char *)a1 + v20;
  uint64_t v23 = (char *)a2 + v20;
  *(void *)uint64_t v22 = *(void *)v23;
  v22[8] = v23[8];
  int64_t v24 = (char *)a1 + v21;
  uint64_t v25 = (char *)a2 + v21;
  *(void *)int64_t v24 = *(void *)v25;
  v24[8] = v25[8];
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for SiriTimerSnippetModel(void *a1, void *a2, int *a3)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[7];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1DB00();
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
    uint64_t v14 = sub_4F84(&qword_28348);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  uint64_t v15 = a3[8];
  uint64_t v16 = (void *)((char *)a1 + v15);
  uint64_t v17 = (void *)((char *)a2 + v15);
  void *v16 = *v17;
  v16[1] = v17[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v18 = a3[9];
  uint64_t v19 = (char *)a1 + v18;
  uint64_t v20 = (char *)a2 + v18;
  uint64_t v21 = *(void *)v20;
  v19[8] = v20[8];
  *(void *)uint64_t v19 = v21;
  uint64_t v22 = a3[10];
  uint64_t v23 = (char *)a1 + v22;
  int64_t v24 = (char *)a2 + v22;
  LOBYTE(v21) = v24[8];
  *(void *)uint64_t v23 = *(void *)v24;
  v23[8] = v21;
  uint64_t v25 = a3[11];
  unint64_t v26 = (char *)a1 + v25;
  unint64_t v27 = (char *)a2 + v25;
  uint64_t v28 = *(void *)v27;
  v26[8] = v27[8];
  *(void *)unint64_t v26 = v28;
  return a1;
}

uint64_t initializeWithTake for SiriTimerSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v7 = a3[7];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_1DB00();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = sub_4F84(&qword_28348);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v13 = a3[9];
  *(_OWORD *)(a1 + a3[8]) = *(_OWORD *)(a2 + a3[8]);
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  *(unsigned char *)(v14 + 8) = *(unsigned char *)(v15 + 8);
  *(void *)uint64_t v14 = *(void *)v15;
  uint64_t v16 = a3[10];
  uint64_t v17 = a3[11];
  uint64_t v18 = a1 + v16;
  uint64_t v19 = a2 + v16;
  *(unsigned char *)(v18 + 8) = *(unsigned char *)(v19 + 8);
  *(void *)uint64_t v18 = *(void *)v19;
  uint64_t v20 = a1 + v17;
  uint64_t v21 = a2 + v17;
  *(void *)uint64_t v20 = *(void *)v21;
  *(unsigned char *)(v20 + 8) = *(unsigned char *)(v21 + 8);
  return a1;
}

void *assignWithTake for SiriTimerSnippetModel(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRelease();
  uint64_t v8 = a3[7];
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_1DB00();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48);
  int v14 = v13(v9, 1, v11);
  int v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 40))(v9, v10, v11);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v12 + 8))(v9, v11);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    uint64_t v16 = sub_4F84(&qword_28348);
    memcpy(v9, v10, *(void *)(*(void *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
LABEL_7:
  uint64_t v17 = a3[8];
  uint64_t v18 = (void *)((char *)a1 + v17);
  uint64_t v19 = (void *)((char *)a2 + v17);
  uint64_t v21 = *v19;
  uint64_t v20 = v19[1];
  void *v18 = v21;
  v18[1] = v20;
  swift_bridgeObjectRelease();
  uint64_t v22 = a3[9];
  uint64_t v23 = a3[10];
  int64_t v24 = (char *)a1 + v22;
  uint64_t v25 = (char *)a2 + v22;
  *(void *)int64_t v24 = *(void *)v25;
  v24[8] = v25[8];
  unint64_t v26 = (char *)a1 + v23;
  unint64_t v27 = (char *)a2 + v23;
  *(void *)unint64_t v26 = *(void *)v27;
  v26[8] = v27[8];
  uint64_t v28 = a3[11];
  unint64_t v29 = (char *)a1 + v28;
  BOOL v30 = (char *)a2 + v28;
  *(void *)unint64_t v29 = *(void *)v30;
  v29[8] = v30[8];
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriTimerSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_F54C);
}

uint64_t sub_F54C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_4F84(&qword_28348);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for SiriTimerSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_F614);
}

uint64_t sub_F614(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_4F84(&qword_28348);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_F6C0()
{
  sub_F77C();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_F77C()
{
  if (!qword_286A0)
  {
    sub_1DB00();
    unint64_t v0 = sub_1E4D0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_286A0);
    }
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for TimerSelectorModel(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (uint64_t *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_4F84(&qword_281D0);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  }
  return a1;
}

uint64_t destroy for TimerSelectorModel(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_4F84(&qword_281D0);
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

void *initializeWithCopy for TimerSelectorModel(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_4F84(&qword_281D0);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(v5, v6, v7);
  return a1;
}

void *assignWithCopy for TimerSelectorModel(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_4F84(&qword_281D0);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

void *initializeWithTake for TimerSelectorModel(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_4F84(&qword_281D0);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void *assignWithTake for TimerSelectorModel(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_4F84(&qword_281D0);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for TimerSelectorModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_FB5C);
}

uint64_t sub_FB5C(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_4F84(&qword_281D0);
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for TimerSelectorModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_FC24);
}

void *sub_FC24(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_4F84(&qword_281D0);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_FCD0()
{
  sub_FD6C();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_FD6C()
{
  if (!qword_28750)
  {
    unint64_t v0 = sub_1DC80();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_28750);
    }
  }
}

unsigned char *initializeBufferWithCopyOfBuffer for TimerSelectorModel.CodingKeys(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t sub_FDDC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_FDE4(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for TimerSelectorModel.CodingKeys()
{
  return &type metadata for TimerSelectorModel.CodingKeys;
}

uint64_t getEnumTagSinglePayload for SiriTimerSnippetModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF9) {
    goto LABEL_17;
  }
  if (a2 + 7 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 7) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 7;
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
      return (*a1 | (v4 << 8)) - 7;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 7;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v8 = v6 - 8;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SiriTimerSnippetModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF8)
  {
    unsigned int v6 = ((a2 - 249) >> 8) + 1;
    *uint64_t result = a2 + 7;
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
        JUMPOUT(0xFF5CLL);
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
          *uint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

unsigned char *sub_FF84(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SiriTimerSnippetModel.CodingKeys()
{
  return &type metadata for SiriTimerSnippetModel.CodingKeys;
}

uint64_t initializeBufferWithCopyOfBuffer for JSONCodingKeys(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for JSONCodingKeys()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for JSONCodingKeys(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for JSONCodingKeys(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = v4;
  return a1;
}

__n128 initializeWithTake for JSONCodingKeys(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for JSONCodingKeys(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for JSONCodingKeys(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 25)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for JSONCodingKeys(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 25) = 1;
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
    *(unsigned char *)(result + 25) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for JSONCodingKeys()
{
  return &type metadata for JSONCodingKeys;
}

uint64_t sub_1017C()
{
  return 0;
}

ValueMetadata *type metadata accessor for TimerSnippetModel.CodingKeys()
{
  return &type metadata for TimerSnippetModel.CodingKeys;
}

uint64_t _s13TimerUIPlugin18TimerSelectorModelV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s13TimerUIPlugin18TimerSelectorModelV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x102F0);
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

ValueMetadata *type metadata accessor for SiriTimePluginModel.CodingKeys()
{
  return &type metadata for SiriTimePluginModel.CodingKeys;
}

ValueMetadata *type metadata accessor for SiriTimePluginModel.TimerMultiCodingKeys()
{
  return &type metadata for SiriTimePluginModel.TimerMultiCodingKeys;
}

uint64_t _s13TimerUIPlugin17TimerSnippetModelV10CodingKeysOwet_0(unsigned int *a1, int a2)
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

unsigned char *_s13TimerUIPlugin17TimerSnippetModelV10CodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
        *__n128 result = a2;
        return result;
      case 2:
        *(_WORD *)__n128 result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)__n128 result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *__n128 result = 0;
      break;
    case 2:
      *(_WORD *)__n128 result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x10424);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriTimePluginModel.TimerSelectorCodingKeys()
{
  return &type metadata for SiriTimePluginModel.TimerSelectorCodingKeys;
}

unint64_t sub_10460()
{
  unint64_t result = qword_28780;
  if (!qword_28780)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_28780);
  }
  return result;
}

unint64_t sub_104B8()
{
  unint64_t result = qword_28788;
  if (!qword_28788)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_28788);
  }
  return result;
}

unint64_t sub_10510()
{
  unint64_t result = qword_28790;
  if (!qword_28790)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_28790);
  }
  return result;
}

unint64_t sub_10568()
{
  unint64_t result = qword_28798;
  if (!qword_28798)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_28798);
  }
  return result;
}

unint64_t sub_105C0()
{
  unint64_t result = qword_287A0;
  if (!qword_287A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_287A0);
  }
  return result;
}

unint64_t sub_10618()
{
  unint64_t result = qword_287A8;
  if (!qword_287A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_287A8);
  }
  return result;
}

unint64_t sub_10670()
{
  unint64_t result = qword_287B0;
  if (!qword_287B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_287B0);
  }
  return result;
}

unint64_t sub_106C8()
{
  unint64_t result = qword_287B8;
  if (!qword_287B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_287B8);
  }
  return result;
}

unint64_t sub_10720()
{
  unint64_t result = qword_287C0;
  if (!qword_287C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_287C0);
  }
  return result;
}

unint64_t sub_10778()
{
  unint64_t result = qword_287C8;
  if (!qword_287C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_287C8);
  }
  return result;
}

unint64_t sub_107D0()
{
  unint64_t result = qword_287D0;
  if (!qword_287D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_287D0);
  }
  return result;
}

unint64_t sub_10828()
{
  unint64_t result = qword_287D8;
  if (!qword_287D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_287D8);
  }
  return result;
}

unint64_t sub_10880()
{
  unint64_t result = qword_287E0;
  if (!qword_287E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_287E0);
  }
  return result;
}

unint64_t sub_108D8()
{
  unint64_t result = qword_287E8;
  if (!qword_287E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_287E8);
  }
  return result;
}

unint64_t sub_10930()
{
  unint64_t result = qword_287F0;
  if (!qword_287F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_287F0);
  }
  return result;
}

unint64_t sub_10988()
{
  unint64_t result = qword_287F8;
  if (!qword_287F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_287F8);
  }
  return result;
}

unint64_t sub_109E0()
{
  unint64_t result = qword_28800;
  if (!qword_28800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_28800);
  }
  return result;
}

unint64_t sub_10A38()
{
  unint64_t result = qword_28808;
  if (!qword_28808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_28808);
  }
  return result;
}

unint64_t sub_10A90()
{
  unint64_t result = qword_28810;
  if (!qword_28810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_28810);
  }
  return result;
}

unint64_t sub_10AE8()
{
  unint64_t result = qword_28818;
  if (!qword_28818)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_28818);
  }
  return result;
}

uint64_t sub_10B3C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x7372656D6974 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_1E840();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_10BBC()
{
  return 0x7372656D6974;
}

uint64_t sub_10BD0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_1E5F0();
  __break(1u);
  return result;
}

uint64_t sub_10CC8(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x65644972656D6974 && a2 == 0xEF7265696669746ELL;
  if (v3 || (sub_1E840() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x8000000000020140 || (sub_1E840() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x8000000000020160 || (sub_1E840() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6C6562616CLL && a2 == 0xE500000000000000 || (sub_1E840() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6E6F697461727564 && a2 == 0xE800000000000000 || (sub_1E840() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6E696E69616D6572 && a2 == 0xED0000656D695467 || (sub_1E840() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6574617473 && a2 == 0xE500000000000000 || (sub_1E840() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x74756F68636E7570 && a2 == 0xEB000000004C5255)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else
  {
    char v6 = sub_1E840();
    swift_bridgeObjectRelease();
    if (v6) {
      return 7;
    }
    else {
      return 8;
    }
  }
}

uint64_t sub_11010(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x7372656D6974 && a2 == 0xE600000000000000;
  if (v3 || (sub_1E840() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x726564616568 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_1E840();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_110EC(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_1113C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1118C()
{
  if (*(void *)(v0 + 40)) {
    sub_1113C(v0 + 16);
  }

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_111CC(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_111E4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_4F84(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void destroy for TimerProgressView(uint64_t a1)
{
  swift_release();
  swift_release();

  long long v2 = *(void **)(a1 + 32);
}

void *initializeWithCopy for TimerProgressView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v5 = (void *)a2[2];
  uint64_t v4 = a2[3];
  a1[2] = v5;
  a1[3] = v4;
  BOOL v7 = (void *)a2[4];
  uint64_t v6 = a2[5];
  a1[4] = v7;
  a1[5] = v6;
  swift_retain();
  swift_retain();
  id v8 = v5;
  id v9 = v7;
  return a1;
}

void *assignWithCopy for TimerProgressView(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  uint64_t v4 = (void *)a1[2];
  uint64_t v5 = (void *)a2[2];
  a1[2] = v5;
  id v6 = v5;

  a1[3] = a2[3];
  BOOL v7 = (void *)a2[4];
  id v8 = (void *)a1[4];
  a1[4] = v7;
  id v9 = v7;

  a1[5] = a2[5];
  return a1;
}

__n128 initializeWithTake for TimerProgressView(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for TimerProgressView(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  uint64_t v4 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);

  uint64_t v5 = *(void *)(a2 + 32);
  id v6 = *(void **)(a1 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;

  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for TimerProgressView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TimerProgressView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
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
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TimerProgressView()
{
  return &type metadata for TimerProgressView;
}

uint64_t sub_114BC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_114D8()
{
  uint64_t v0 = sub_1DD20();
  sub_4DF0(v0, qword_28860);
  sub_4D88(v0, (uint64_t)qword_28860);
  return sub_1DD10();
}

uint64_t sub_11550()
{
  uint64_t result = sub_1E180();
  qword_28878 = result;
  return result;
}

uint64_t sub_11570()
{
  id v0 = [self systemGray2Color];
  uint64_t result = sub_1E130();
  qword_28880 = result;
  return result;
}

uint64_t sub_115B0@<X0>(uint64_t *a1@<X0>, double *a2@<X8>)
{
  uint64_t v90 = a2;
  uint64_t v88 = sub_1DDF0();
  __chkstk_darwin(v88);
  long long v89 = (char *)&v76 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = sub_1DDE0();
  uint64_t v85 = *(void *)(v86 - 8);
  __chkstk_darwin(v86);
  long long v83 = (char *)&v76 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = sub_4F84(&qword_28890);
  uint64_t v81 = *(void *)(v82 - 8);
  __chkstk_darwin(v82);
  uint64_t v78 = (char *)&v76 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = sub_4F84(&qword_28898);
  uint64_t v79 = *(void *)(v80 - 8);
  __chkstk_darwin(v80);
  long long v77 = (char *)&v76 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = sub_4F84(&qword_288A0);
  __chkstk_darwin(v76);
  v87 = (char *)&v76 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_4F84(&qword_288A8);
  uint64_t v96 = *(void *)(v8 - 8);
  uint64_t v97 = v8;
  __chkstk_darwin(v8);
  uint64_t v84 = (char *)&v76 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_4F84(&qword_288B0);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  uint64_t v99 = (uint64_t)&v76 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v98 = (uint64_t)&v76 - v13;
  uint64_t v94 = sub_4F84(&qword_288B8);
  __chkstk_darwin(v94);
  int v15 = (uint64_t *)((char *)&v76 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v16 = sub_1DDC0();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v76 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_4F84(&qword_288C0);
  uint64_t v21 = __chkstk_darwin(v20);
  uint64_t v100 = (uint64_t *)((char *)&v76 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v21);
  uint64_t v101 = (uint64_t)&v76 - v23;
  if (qword_28198 != -1) {
    swift_once();
  }
  uint64_t v95 = qword_28880;
  swift_retain();
  sub_1DD80();
  double v24 = v106;
  uint64_t v25 = v107;
  uint64_t v26 = v108;
  uint64_t v93 = v109;
  uint64_t v27 = v110;
  uint64_t v92 = sub_1E290();
  uint64_t v91 = v28;
  uint64_t v29 = a1[5];
  if (qword_28190 != -1) {
    swift_once();
  }
  uint64_t v30 = qword_28878;
  swift_retain_n();
  uint64_t v31 = sub_1E180();
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, void, uint64_t))(v17 + 104))(v19, enum case for LayoutDirection.leftToRight(_:), v16);
  (*(void (**)(char *, char *, uint64_t))(v17 + 16))((char *)v15 + *(int *)(v94 + 28), v19, v16);
  *int v15 = KeyPath;
  uint64_t v33 = *(int *)(v20 + 36);
  uint64_t v34 = v100;
  sub_111E4((uint64_t)v15, (uint64_t)v100 + v33, &qword_288B8);
  *uint64_t v34 = v29;
  v34[1] = 0x4008000000000000;
  v34[2] = v30;
  v34[3] = v31;
  swift_retain();
  swift_retain();
  sub_6528((uint64_t)v15, &qword_288B8);
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  swift_release();
  uint64_t v94 = v30;
  swift_release();
  sub_7B08((uint64_t)v34, v101, &qword_288C0);
  uint64_t v35 = (void *)a1[2];
  if (sub_136B8(*a1, a1[1], (uint64_t)v35))
  {
    uint64_t v36 = 1;
    uint64_t v37 = v97;
    uint64_t v38 = v98;
  }
  else
  {
    uint64_t v39 = (void *)a1[4];
    uint64_t v40 = (_OWORD *)swift_allocObject();
    long long v41 = *((_OWORD *)a1 + 1);
    v40[1] = *(_OWORD *)a1;
    _OWORD v40[2] = v41;
    v40[3] = *((_OWORD *)a1 + 2);
    __chkstk_darwin(v40);
    *(&v76 - 2) = (uint64_t)a1;
    id v42 = v35;
    id v43 = v39;
    swift_retain();
    swift_retain();
    sub_4F84(&qword_288C8);
    uint64_t v44 = sub_571C(&qword_288D0);
    uint64_t v45 = sub_571C(&qword_288D8);
    unint64_t v46 = sub_13818();
    uint64_t v47 = sub_7BA8(&qword_28908, &qword_288D8);
    uint64_t v102 = v44;
    uint64_t v103 = v45;
    unint64_t v104 = v46;
    uint64_t v105 = v47;
    swift_getOpaqueTypeConformance2();
    char v48 = v78;
    sub_1E240();
    unint64_t v49 = v83;
    sub_1DDD0();
    sub_7BA8(&qword_28910, &qword_28890);
    sub_13A4C(&qword_28918, (void (*)(uint64_t))&type metadata accessor for PlainButtonStyle);
    char v50 = v77;
    uint64_t v51 = v82;
    uint64_t v52 = v86;
    sub_1E0F0();
    (*(void (**)(char *, uint64_t))(v85 + 8))(v49, v52);
    (*(void (**)(char *, uint64_t))(v81 + 8))(v48, v51);
    uint64_t v53 = v79;
    uint64_t v54 = (uint64_t)v87;
    uint64_t v55 = v80;
    (*(void (**)(char *, char *, uint64_t))(v79 + 16))(v87, v50, v80);
    *(unsigned char *)(v54 + *(int *)(v76 + 36)) = 0;
    (*(void (**)(char *, uint64_t))(v53 + 8))(v50, v55);
    char v56 = v89;
    char v57 = &v89[*(int *)(v88 + 20)];
    uint64_t v58 = enum case for RoundedCornerStyle.continuous(_:);
    uint64_t v59 = sub_1DEE0();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v59 - 8) + 104))(v57, v58, v59);
    __asm { FMOV            V0.2D, #25.0 }
    *char v56 = _Q0;
    uint64_t v37 = v97;
    uint64_t v65 = (uint64_t)v84;
    uint64_t v66 = (uint64_t)&v84[*(int *)(v97 + 36)];
    sub_13934((uint64_t)v56, v66);
    *(_WORD *)(v66 + *(int *)(sub_4F84(&qword_28920) + 36)) = 256;
    sub_111E4(v54, v65, &qword_288A0);
    sub_13998((uint64_t)v56);
    sub_6528(v54, &qword_288A0);
    uint64_t v67 = v65;
    uint64_t v38 = v98;
    sub_7B08(v67, v98, &qword_288A8);
    uint64_t v36 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v96 + 56))(v38, v36, 1, v37);
  uint64_t v68 = (uint64_t)v100;
  uint64_t v69 = v101;
  sub_111E4(v101, (uint64_t)v100, &qword_288C0);
  uint64_t v70 = v99;
  sub_111E4(v38, v99, &qword_288B0);
  uint64_t v71 = v90;
  *uint64_t v90 = v24 * 0.5;
  v71[1] = v24;
  *((void *)v71 + 2) = v25;
  *((void *)v71 + 3) = v26;
  *((void *)v71 + 4) = v93;
  *((void *)v71 + 5) = v27;
  *((void *)v71 + 6) = v95;
  *((_WORD *)v71 + 28) = 256;
  uint64_t v72 = v91;
  *((void *)v71 + 8) = v92;
  *((void *)v71 + 9) = v72;
  *((void *)v71 + 10) = v29;
  uint64_t v73 = v94;
  v71[11] = 3.0;
  *((void *)v71 + 12) = v73;
  *((_WORD *)v71 + 52) = 256;
  uint64_t v74 = sub_4F84(&qword_28928);
  sub_111E4(v68, (uint64_t)v71 + *(int *)(v74 + 64), &qword_288C0);
  sub_111E4(v70, (uint64_t)v71 + *(int *)(v74 + 80), &qword_288B0);
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  swift_retain_n();
  sub_6528(v38, &qword_288B0);
  sub_6528(v69, &qword_288C0);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  sub_6528(v70, &qword_288B0);
  sub_6528(v68, &qword_288C0);
  swift_release();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_12194(uint64_t a1)
{
  uint64_t v2 = sub_1DDC0();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_1DE80();
}

void sub_1225C()
{
  if (qword_28188 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_1DD20();
  sub_4D88(v1, (uint64_t)qword_28860);
  long long v44 = *v0;
  uint64_t v45 = (void (*)(uint64_t, void *))*((void *)v0 + 2);
  v47[0] = v44;
  sub_7B08((uint64_t)&v45, (uint64_t)&v46, &qword_28310);
  uint64_t v2 = (void *)*((void *)v0 + 4);
  sub_13ADC((uint64_t)v47);
  swift_retain();
  sub_13B08(&v46);
  id v3 = v2;
  sub_13ADC((uint64_t)v47);
  swift_retain();
  sub_13B08(&v46);
  id v4 = v3;
  uint64_t v5 = sub_1DD00();
  os_log_type_t v6 = sub_1E490();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    v41[0] = (id)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315138;
    long long aBlock = v44;
    uint64_t v37 = v45;
    sub_4F84(&qword_28930);
    sub_1E260();
    if (v43)
    {
      id v8 = [v43 timerIDString];

      sub_1E3E0();
      uint64_t v10 = v9;
    }
    else
    {
      uint64_t v10 = 0;
    }
    *((void *)&aBlock + 1) = v10;
    sub_4F84(&qword_28318);
    uint64_t v11 = sub_1E400();
    *(void *)&long long aBlock = sub_1C718(v11, v12, (uint64_t *)v41);
    sub_1E4E0();
    swift_bridgeObjectRelease();
    sub_13B34((uint64_t)v47);
    swift_release();
    sub_13B60(&v46);

    sub_13B34((uint64_t)v47);
    swift_release();
    sub_13B60(&v46);

    _os_log_impl(&dword_0, v5, v6, "[TimerProgressView.onButtonTap] Button tap detected for timer %s", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    sub_13B34((uint64_t)v47);
    swift_release();
    sub_13B60(&v46);

    sub_13B34((uint64_t)v47);
    swift_release();
    sub_13B60(&v46);
  }
  *(_OWORD *)long long v41 = v44;
  id v42 = v45;
  sub_4F84(&qword_28930);
  sub_1E260();
  id v13 = v43;
  if (v43
    && ([v43 mutableCopy],
        v13,
        sub_1E520(),
        swift_unknownObjectRelease(),
        sub_13B8C(),
        (swift_dynamicCast() & 1) != 0))
  {
    id v14 = v41[0];
    int v15 = (char *)[v41[0] state];
    if (v15 == (unsigned char *)&dword_0 + 2)
    {
      [v14 setState:3];
    }
    else if (v15 == (unsigned char *)&dword_0 + 3)
    {
      [v14 setState:2];
    }
    else
    {
      uint64_t v19 = sub_1DD00();
      os_log_type_t v20 = sub_1E490();
      if (os_log_type_enabled(v19, v20))
      {
        uint64_t v21 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v21 = 0;
        _os_log_impl(&dword_0, v19, v20, "[TimerProgressView.onButtonTap] Timer is in Stopped or Unknown state, so it must be firing! Taking no action.", v21, 2u);
        swift_slowDealloc();
      }
    }
    id v22 = v14;
    uint64_t v23 = sub_1DD00();
    os_log_type_t v24 = sub_1E470();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      *(void *)&long long aBlock = swift_slowAlloc();
      *(_DWORD *)uint64_t v25 = 136315138;
      v41[0] = [v22 state];
      type metadata accessor for MTTimerState(0);
      uint64_t v26 = sub_1E400();
      v41[0] = (id)sub_1C718(v26, v27, (uint64_t *)&aBlock);
      sub_1E4E0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v23, v24, "[TimerProgressView.onButtonTap] Updating timer to new state: %s", v25, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    id v28 = [v4 updateTimer:v22];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v39 = sub_12E10;
      uint64_t v40 = 0;
      *(void *)&long long aBlock = _NSConcreteStackBlock;
      *((void *)&aBlock + 1) = 1107296256;
      uint64_t v37 = sub_12EF8;
      uint64_t v38 = &unk_25A48;
      uint64_t v30 = _Block_copy(&aBlock);
      id v31 = [v29 addSuccessBlock:v30];
      _Block_release(v30);

      uint64_t v39 = sub_12F00;
      uint64_t v40 = 0;
      *(void *)&long long aBlock = _NSConcreteStackBlock;
      *((void *)&aBlock + 1) = 1107296256;
      uint64_t v37 = sub_130BC;
      uint64_t v38 = &unk_25A70;
      uint64_t v32 = _Block_copy(&aBlock);
      uint64_t v33 = [v29 addFailureBlock:v32];
      _Block_release(v32);
    }
    else
    {
      uint64_t v33 = sub_1DD00();
      os_log_type_t v34 = sub_1E470();
      if (os_log_type_enabled(v33, v34))
      {
        uint64_t v35 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v35 = 0;
        _os_log_impl(&dword_0, v33, v34, "[TimerProgressView.onButtonTap] No timerUpdateFuture created. Unclear if timer got updated!", v35, 2u);
        swift_slowDealloc();
      }
    }

    long long aBlock = v44;
    uint64_t v37 = v45;
    v41[0] = v22;
    sub_1E270();
  }
  else
  {
    uint64_t v16 = sub_1DD00();
    os_log_type_t v17 = sub_1E470();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_0, v16, v17, "[TimerProgressView.onButtonTap] Failed to get mutable timer from MT - Cannot update timer!", v18, 2u);
      swift_slowDealloc();
    }
  }
}

uint64_t sub_12A18@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v20 = a2;
  uint64_t v3 = sub_4F84(&qword_288D8);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_4F84(&qword_288C8);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v32 = *a1;
  *(void *)&long long v33 = *((void *)a1 + 2);
  sub_4F84(&qword_28930);
  sub_1E260();
  uint64_t v10 = *(void **)&v30[0];
  if (*(void *)&v30[0])
  {
    [*(id *)&v30[0] state];
  }
  uint64_t v11 = sub_1E190();
  if (qword_28190 != -1) {
    swift_once();
  }
  uint64_t v12 = qword_28878;
  uint64_t KeyPath = swift_getKeyPath();
  swift_retain();
  uint64_t v14 = sub_1E290();
  sub_1B650(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v30, 0.0, 1, INFINITY, 0, v14, v15, v11, KeyPath, v12);
  swift_release();
  swift_release();
  swift_release();
  long long v27 = v30[6];
  long long v28 = v30[7];
  uint64_t v29 = v31;
  long long v23 = v30[2];
  long long v24 = v30[3];
  long long v25 = v30[4];
  long long v26 = v30[5];
  long long v21 = v30[0];
  long long v22 = v30[1];
  uint64_t v16 = enum case for DynamicTypeSize.accessibility3(_:);
  uint64_t v17 = sub_1DDB0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v17 - 8) + 104))(v5, v16, v17);
  sub_13A4C(&qword_28938, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
  uint64_t result = sub_1E3C0();
  if (result)
  {
    sub_4F84(&qword_288D0);
    sub_13818();
    sub_7BA8(&qword_28908, &qword_288D8);
    sub_1E120();
    sub_6528((uint64_t)v5, &qword_288D8);
    long long v38 = v27;
    long long v39 = v28;
    uint64_t v40 = v29;
    long long v34 = v23;
    long long v35 = v24;
    long long v36 = v25;
    long long v37 = v26;
    long long v32 = v21;
    long long v33 = v22;
    sub_13A94((uint64_t)&v32);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v7 + 32))(v20, v9, v6);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_12E10()
{
  if (qword_28188 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1DD20();
  sub_4D88(v0, (uint64_t)qword_28860);
  oslog = sub_1DD00();
  os_log_type_t v1 = sub_1E490();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_0, oslog, v1, "[TimerProgressView.onButtonTap] timerUpdateFuture success block called.", v2, 2u);
    swift_slowDealloc();
  }
}

void sub_12EF8(uint64_t a1, void *a2)
{
}

void sub_12F00()
{
  if (qword_28188 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1DD20();
  sub_4D88(v0, (uint64_t)qword_28860);
  swift_errorRetain();
  oslog = sub_1DD00();
  os_log_type_t v1 = sub_1E470();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    uint64_t v3 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v2 = 138412290;
    uint64_t v5 = sub_1DAE0();
    sub_1E4E0();
    *uint64_t v3 = v5;
    swift_errorRelease();
    _os_log_impl(&dword_0, oslog, v1, "[TimerProgressView.onButtonTap] timerUpdateFuture failure block called with error: %@", v2, 0xCu);
    sub_4F84(&qword_28948);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
  }
}

void sub_130BC(uint64_t a1, void *a2)
{
}

void sub_130C4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_13130@<X0>(uint64_t *a1@<X8>)
{
  long long v3 = v1[1];
  v7[0] = *v1;
  v7[1] = v3;
  v7[2] = v1[2];
  *a1 = sub_1E290();
  a1[1] = v4;
  uint64_t v5 = sub_4F84(&qword_28888);
  return sub_115B0((uint64_t *)v7, (double *)((char *)a1 + *(int *)(v5 + 44)));
}

uint64_t sub_1318C()
{
  return sub_1DE70();
}

uint64_t sub_131B4@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  sub_1DDA0();
  double v10 = v9 * 0.5;
  double v11 = v8 * 0.5;
  if (v8 * 0.5 >= v10) {
    double v12 = v10;
  }
  else {
    double v12 = v8 * 0.5;
  }
  double v13 = v11 - v12;
  swift_retain();
  uint64_t result = sub_1E2B0();
  *(double *)a2 = a4;
  *(double *)(a2 + 8) = a4;
  *(double *)(a2 + 16) = v10 - a4 * 0.5;
  *(double *)(a2 + 24) = v13;
  *(void *)(a2 + 32) = a1;
  *(_WORD *)(a2 + 40) = 256;
  *(double *)(a2 + 48) = a4;
  *(double *)(a2 + 56) = a4;
  *(double *)(a2 + 64) = v10;
  *(double *)(a2 + 72) = v13;
  *(_WORD *)(a2 + 80) = 0;
  *(double *)(a2 + 88) = a3 * 3.14159265 + a3 * 3.14159265;
  *(void *)(a2 + 96) = v15;
  *(void *)(a2 + 104) = v16;
  return result;
}

uint64_t sub_1326C@<X0>(uint64_t (**a1)@<X0>(uint64_t a1@<X8>)@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = (uint64_t (*)@<X0>(uint64_t@<X8>))swift_allocObject();
  *((void *)v7 + 2) = v3;
  *((void *)v7 + 3) = v4;
  *((void *)v7 + 4) = v6;
  *((void *)v7 + 5) = v5;
  *a1 = sub_13FE0;
  a1[1] = v7;
  swift_retain();

  return swift_retain();
}

double sub_132F0@<D0>(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>)
{
  sub_1E020();
  v28.origin.x = a2;
  v28.origin.y = a3;
  v28.size.width = a4;
  v28.size.height = a5;
  CGRectGetMidX(v28);
  v29.origin.x = a2;
  v29.origin.y = a3;
  v29.size.width = a4;
  v29.size.height = a5;
  CGRectGetMidY(v29);
  v30.origin.x = a2;
  v30.origin.y = a3;
  v30.size.width = a4;
  v30.size.height = a5;
  CGRectGetWidth(v30);
  v31.origin.x = a2;
  v31.origin.y = a3;
  v31.size.width = a4;
  v31.size.height = a5;
  CGRectGetHeight(v31);
  uint64_t v21 = 0x3FF0000000000000;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = 0x3FF0000000000000;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  sub_1E010();
  v19[0] = v12;
  v19[1] = v13;
  char v20 = v14;
  sub_13FEC((uint64_t)v19, (uint64_t)v27);
  sub_1408C((uint64_t)v27, (void (*)(void, void, void, void, void))sub_14048);
  sub_1DD80();
  sub_1E000();
  sub_14060((uint64_t)v15);
  sub_1408C((uint64_t)v19, (void (*)(void, void, void, void, void))sub_140CC);
  sub_1408C((uint64_t)v19, (void (*)(void, void, void, void, void))sub_140CC);
  double result = *(double *)&v16;
  long long v11 = v17;
  *(_OWORD *)a1 = v16;
  *(_OWORD *)(a1 + 16) = v11;
  *(unsigned char *)(a1 + 32) = v18;
  return result;
}

double sub_134E4@<D0>(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>)
{
  sub_132F0((uint64_t)v8, a2, a3, a4, a5);
  double result = *(double *)v8;
  long long v7 = v8[1];
  *(_OWORD *)a1 = v8[0];
  *(_OWORD *)(a1 + 16) = v7;
  *(unsigned char *)(a1 + 32) = v9;
  return result;
}

uint64_t sub_13534()
{
  return Shape.sizeThatFits(_:)();
}

__n128 sub_1354C@<Q0>(__n128 *a1@<X8>)
{
  __n128 result = *v1;
  *a1 = *v1;
  return result;
}

__n128 sub_13558(__n128 *a1)
{
  __n128 result = *a1;
  *os_log_type_t v1 = *a1;
  return result;
}

__n128 (*sub_13564(uint64_t a1))(__n128 *a1)
{
  *(void *)(a1 + 16) = v1;
  *(_OWORD *)a1 = *v1;
  return sub_13590;
}

__n128 sub_13590(__n128 *a1)
{
  __n128 result = *a1;
  *(__n128 *)a1[1].n128_u64[0] = *a1;
  return result;
}

uint64_t sub_135A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_140E4();

  return static Shape._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_13608(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_140E4();

  return static Shape._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_1366C(uint64_t a1)
{
  unint64_t v2 = sub_140E4();

  return Shape.body.getter(a1, v2);
}

BOOL sub_136B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_4F84(&qword_28930);
  sub_1E260();
  if (v13)
  {
    objc_msgSend(v13, "remainingTime", a1, a2, a3);
    double v7 = v6;

    if (v7 == 0.0) {
      return 1;
    }
  }
  sub_1E260();
  if (!v13) {
    return 0;
  }
  char v9 = (char *)objc_msgSend(v13, "state", a1, a2, a3);

  return v9 == (unsigned char *)&dword_0 + 1;
}

uint64_t sub_1379C()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

void sub_137EC()
{
}

uint64_t sub_13810@<X0>(uint64_t a1@<X8>)
{
  return sub_12A18(*(long long **)(v1 + 16), a1);
}

unint64_t sub_13818()
{
  unint64_t result = qword_288E0;
  if (!qword_288E0)
  {
    sub_571C(&qword_288D0);
    sub_13894();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_288E0);
  }
  return result;
}

unint64_t sub_13894()
{
  unint64_t result = qword_288E8;
  if (!qword_288E8)
  {
    sub_571C(&qword_288F0);
    sub_7BA8(&qword_288F8, &qword_28900);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_288E8);
  }
  return result;
}

uint64_t sub_13934(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1DDF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_13998(uint64_t a1)
{
  uint64_t v2 = sub_1DDF0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_139F4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1DE50();
  *a1 = result;
  return result;
}

uint64_t sub_13A20()
{
  return sub_1DE60();
}

uint64_t sub_13A4C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_13A94(uint64_t a1)
{
  return a1;
}

uint64_t sub_13ADC(uint64_t a1)
{
  return a1;
}

id *sub_13B08(id *a1)
{
  id v2 = *a1;
  return a1;
}

uint64_t sub_13B34(uint64_t a1)
{
  return a1;
}

id *sub_13B60(id *a1)
{
  return a1;
}

unint64_t sub_13B8C()
{
  unint64_t result = qword_28940;
  if (!qword_28940)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_28940);
  }
  return result;
}

uint64_t sub_13BCC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_13BDC()
{
  return swift_release();
}

uint64_t destroy for EndCap()
{
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for EndCap(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for EndCap(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  a1[3] = a2[3];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for EndCap(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

_OWORD *assignWithTake for EndCap(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for EndCap(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EndCap(uint64_t result, int a2, int a3)
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EndCap()
{
  return &type metadata for EndCap;
}

__n128 initializeBufferWithCopyOfBuffer for RingArc(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for RingArc(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for RingArc(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for RingArc()
{
  return &type metadata for RingArc;
}

uint64_t sub_13E20()
{
  return sub_7BA8(&qword_28950, &qword_28958);
}

uint64_t sub_13E5C()
{
  return sub_7BA8(&qword_28960, &qword_28968);
}

uint64_t sub_13E98()
{
  return sub_7BA8(&qword_28970, &qword_28978);
}

unint64_t sub_13ED8()
{
  unint64_t result = qword_28980;
  if (!qword_28980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_28980);
  }
  return result;
}

unint64_t sub_13F30()
{
  unint64_t result = qword_28988;
  if (!qword_28988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_28988);
  }
  return result;
}

uint64_t sub_13F84()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_13FA0()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_13FE0@<X0>(uint64_t a1@<X8>)
{
  return sub_131B4(*(void *)(v1 + 40), a1, *(double *)(v1 + 16), *(double *)(v1 + 24));
}

uint64_t sub_13FEC(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_14048(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 - 2 <= 3) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_14060(uint64_t a1)
{
  return a1;
}

uint64_t sub_1408C(uint64_t a1, void (*a2)(void, void, void, void, void))
{
  return a1;
}

uint64_t sub_140CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 - 2 <= 3) {
    return swift_release();
  }
  return result;
}

unint64_t sub_140E4()
{
  unint64_t result = qword_28990;
  if (!qword_28990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_28990);
  }
  return result;
}

uint64_t sub_14138()
{
  return sub_7BA8(&qword_28998, &qword_289A0);
}

uint64_t sub_14190()
{
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for TimerUIPlugin()
{
  return self;
}

uint64_t sub_141EC()
{
  return sub_147B0(&qword_28A48, (void (*)(uint64_t))type metadata accessor for SiriTimePluginModel);
}

uint64_t sub_14234(uint64_t a1, void *a2)
{
  return sub_142CC(a1, a2);
}

uint64_t sub_14258@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0xD000000000000015;
  *(void *)(result + 24) = 0x80000000000202B0;
  *a1 = result;
  return result;
}

uint64_t sub_142A8(uint64_t a1)
{
  return sub_14440(a1);
}

uint64_t sub_142CC(uint64_t a1, void *a2)
{
  swift_bridgeObjectRetain();
  v5._rawValue = &off_253C8;
  v12._countAndFlagsBits = a1;
  v12._object = a2;
  Swift::Int v6 = sub_1E600(v5, v12);
  swift_bridgeObjectRelease();
  if (v6)
  {
    sub_14398();
    swift_allocError();
    *double v7 = 0;
    return swift_willThrow();
  }
  else
  {
    uint64_t v10 = *(void *)(v2 + 16);
    uint64_t v9 = *(void *)(v2 + 24);
    swift_bridgeObjectRetain();
    sub_1CFC0(v10, v9, (uint64_t)&v11);
    sub_143EC();
    return sub_1E250();
  }
}

unint64_t sub_14398()
{
  unint64_t result = qword_28A50;
  if (!qword_28A50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_28A50);
  }
  return result;
}

unint64_t sub_143EC()
{
  unint64_t result = qword_28A58;
  if (!qword_28A58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_28A58);
  }
  return result;
}

uint64_t sub_14440(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for TimerSelector(0);
  __chkstk_darwin(v3);
  Swift::OpaquePointer v5 = (uint64_t *)((char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = type metadata accessor for TimerSelectorModel(0);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  uint64_t v9 = (char *)v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)v20 - v10;
  uint64_t v12 = type metadata accessor for SiriTimePluginModel(0);
  __chkstk_darwin(v12);
  char v14 = (uint64_t *)((char *)v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_14748(a1, (uint64_t)v14, type metadata accessor for SiriTimePluginModel);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_146E4((uint64_t)v14, (uint64_t)v11);
    sub_14748((uint64_t)v11, (uint64_t)v9, type metadata accessor for TimerSelectorModel);
    sub_1E4C((uint64_t)v9, v5);
    sub_147B0(&qword_28A60, (void (*)(uint64_t))type metadata accessor for TimerSelector);
    uint64_t v15 = sub_1E080();
    sub_147F8((uint64_t)v5, type metadata accessor for TimerSelector);
    sub_147F8((uint64_t)v11, type metadata accessor for TimerSelectorModel);
  }
  else
  {
    uint64_t v16 = *v14;
    uint64_t v18 = *(void *)(v1 + 16);
    uint64_t v17 = *(void *)(v1 + 24);
    swift_bridgeObjectRetain();
    sub_18968(v16, v18, v17, (uint64_t *)v22);
    v20[0] = v22[0];
    v20[1] = v22[1];
    v20[2] = v22[2];
    uint64_t v21 = v23;
    sub_14858();
    uint64_t v15 = sub_1E080();
    sub_148AC((void **)v22);
  }
  return v15;
}

uint64_t sub_146E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TimerSelectorModel(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_14748(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_147B0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_147F8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_14858()
{
  unint64_t result = qword_28A68;
  if (!qword_28A68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_28A68);
  }
  return result;
}

void **sub_148AC(void **a1)
{
  uint64_t v2 = *a1;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return a1;
}

uint64_t getEnumTagSinglePayload for TimerUIPlugin.Error(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for TimerUIPlugin.Error(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0x14A6CLL);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TimerUIPlugin.Error()
{
  return &type metadata for TimerUIPlugin.Error;
}

unint64_t sub_14AA8()
{
  unint64_t result = qword_28A70;
  if (!qword_28A70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_28A70);
  }
  return result;
}

uint64_t sub_14B00()
{
  uint64_t v0 = sub_1DD20();
  sub_4DF0(v0, qword_28A78);
  sub_4D88(v0, (uint64_t)qword_28A78);
  return sub_1DD10();
}

uint64_t sub_14B78@<X0>(uint64_t a1@<X8>)
{
  uint64_t v88 = a1;
  uint64_t v83 = sub_4F84(&qword_28A90);
  __chkstk_darwin(v83);
  uint64_t v80 = (char *)&v67 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1E2F0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v81 = v3;
  uint64_t v82 = v4;
  uint64_t v5 = __chkstk_darwin(v3);
  BOOL v7 = (char *)&v67 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v67 - v8;
  uint64_t v86 = sub_4F84(&qword_28A98);
  __chkstk_darwin(v86);
  uint64_t v87 = (uint64_t)&v67 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1E360();
  uint64_t v78 = *(void *)(v11 - 8);
  uint64_t v79 = v11;
  __chkstk_darwin(v11);
  long long v77 = (char *)&v67 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1DD70();
  uint64_t v75 = *(void *)(v13 - 8);
  uint64_t v76 = v13;
  __chkstk_darwin(v13);
  uint64_t v74 = (char *)&v67 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_4F84(&qword_28278);
  __chkstk_darwin(v15 - 8);
  uint64_t v17 = (uint64_t *)((char *)&v67 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v89 = sub_4F84(&qword_28AA0);
  uint64_t v18 = *(void *)(v89 - 8);
  uint64_t v19 = __chkstk_darwin(v89);
  uint64_t v69 = (char *)&v67 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  uint64_t v22 = (char *)&v67 - v21;
  uint64_t v71 = sub_4F84(&qword_28AA8);
  uint64_t v70 = *(void *)(v71 - 8);
  __chkstk_darwin(v71);
  uint64_t v24 = (char *)&v67 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v84 = sub_4F84(&qword_28AB0);
  __chkstk_darwin(v84);
  uint64_t v26 = (char *)&v67 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v85 = sub_4F84(&qword_28AB8);
  uint64_t v73 = *(void *)(v85 - 8);
  uint64_t v27 = __chkstk_darwin(v85);
  CGRect v29 = (char *)&v67 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v27);
  uint64_t v72 = (char *)&v67 - v30;
  if (sub_1DC00())
  {
    uint64_t v31 = swift_allocObject();
    long long v32 = *(_OWORD *)(v1 + 16);
    *(_OWORD *)(v31 + 16) = *(_OWORD *)v1;
    *(_OWORD *)(v31 + 32) = v32;
    *(_OWORD *)(v31 + 48) = *(_OWORD *)(v1 + 32);
    *(void *)(v31 + 64) = *(void *)(v1 + 48);
    sub_18EB8(v1);
    sub_4F84(&qword_28AC0);
    sub_18F1C();
    sub_1E2C0();
    uint64_t *v17 = sub_1E150();
    uint64_t v33 = enum case for HostBackground.color(_:);
    uint64_t v34 = sub_1E2D0();
    uint64_t v35 = *(void *)(v34 - 8);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v35 + 104))(v17, v33, v34);
    (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v35 + 56))(v17, 0, 1, v34);
    sub_7BA8(&qword_28AE8, &qword_28AA0);
    uint64_t v36 = v89;
    sub_1E0B0();
    sub_6528((uint64_t)v17, &qword_28278);
    (*(void (**)(char *, uint64_t))(v18 + 8))(v22, v36);
    uint64_t KeyPath = swift_getKeyPath();
    long long v39 = v74;
    uint64_t v38 = v75;
    uint64_t v40 = v76;
    (*(void (**)(char *, void, uint64_t))(v75 + 104))(v74, enum case for ColorScheme.dark(_:), v76);
    uint64_t v41 = v84;
    id v42 = (uint64_t *)&v26[*(int *)(v84 + 36)];
    uint64_t v43 = sub_4F84(&qword_282B0);
    (*(void (**)(char *, char *, uint64_t))(v38 + 16))((char *)v42 + *(int *)(v43 + 28), v39, v40);
    *id v42 = KeyPath;
    uint64_t v44 = v70;
    uint64_t v45 = v71;
    (*(void (**)(char *, char *, uint64_t))(v70 + 16))(v26, v24, v71);
    (*(void (**)(char *, uint64_t))(v38 + 8))(v39, v40);
    (*(void (**)(char *, uint64_t))(v44 + 8))(v24, v45);
    uint64_t v47 = v77;
    uint64_t v46 = v78;
    uint64_t v48 = v79;
    (*(void (**)(char *, void, uint64_t))(v78 + 104))(v77, enum case for ComponentStackBottomSpacing.none(_:), v79);
    unint64_t v49 = sub_1903C();
    sub_1E0C0();
    (*(void (**)(char *, uint64_t))(v46 + 8))(v47, v48);
    sub_6528((uint64_t)v26, &qword_28AB0);
    uint64_t v51 = v72;
    uint64_t v50 = v73;
    uint64_t v52 = v85;
    (*(void (**)(char *, char *, uint64_t))(v73 + 32))(v72, v29, v85);
    (*(void (**)(uint64_t, char *, uint64_t))(v50 + 16))(v87, v51, v52);
    swift_storeEnumTagMultiPayload();
    uint64_t v90 = v41;
    unint64_t v91 = v49;
    swift_getOpaqueTypeConformance2();
    sub_7BA8(&qword_28AF0, &qword_28A90);
    sub_1DF10();
    return (*(uint64_t (**)(char *, uint64_t))(v50 + 8))(v51, v52);
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v68 = v9;
    sub_1E300();
    uint64_t v54 = swift_allocObject();
    long long v55 = *(_OWORD *)(v1 + 16);
    *(_OWORD *)(v54 + 16) = *(_OWORD *)v1;
    *(_OWORD *)(v54 + 32) = v55;
    *(_OWORD *)(v54 + 48) = *(_OWORD *)(v1 + 32);
    *(void *)(v54 + 64) = *(void *)(v1 + 48);
    sub_18EB8(v1);
    sub_4F84(&qword_28AC0);
    sub_18F1C();
    uint64_t v67 = v22;
    sub_1E2C0();
    uint64_t v56 = v81;
    char v57 = *(void (**)(char *, char *, uint64_t))(v82 + 16);
    v57(v7, v9, v81);
    uint64_t v58 = *(void (**)(char *, char *, uint64_t))(v18 + 16);
    uint64_t v59 = v69;
    BOOL v60 = v22;
    uint64_t v61 = v89;
    v58(v69, v60, v89);
    uint64_t v62 = (uint64_t)v80;
    v57(v80, v7, v56);
    uint64_t v63 = sub_4F84(&qword_28AD8);
    v58((char *)(v62 + *(int *)(v63 + 48)), v59, v61);
    unint64_t v64 = *(void (**)(char *, uint64_t))(v18 + 8);
    v64(v59, v61);
    uint64_t v65 = *(void (**)(char *, uint64_t))(v82 + 8);
    v65(v7, v56);
    sub_111E4(v62, v87, &qword_28A90);
    swift_storeEnumTagMultiPayload();
    unint64_t v66 = sub_1903C();
    uint64_t v90 = v84;
    unint64_t v91 = v66;
    swift_getOpaqueTypeConformance2();
    sub_7BA8(&qword_28AF0, &qword_28A90);
    sub_1DF10();
    sub_6528(v62, &qword_28A90);
    v64(v67, v89);
    return ((uint64_t (*)(char *, uint64_t))v65)(v68, v56);
  }
}

uint64_t sub_15644@<X0>(uint64_t a1@<X0>, void *a2@<X1>, void *a3@<X2>, void *a4@<X3>, uint64_t a5@<X4>, void *a6@<X5>, uint64_t a7@<X8>)
{
  id v75 = a4;
  id v76 = a3;
  uint64_t v12 = sub_4F84(&qword_28308);
  __chkstk_darwin(v12 - 8);
  long long v77 = (char *)&v68 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = type metadata accessor for SiriTimerSnippetModel(0);
  uint64_t v14 = __chkstk_darwin(v74);
  uint64_t v16 = (char *)&v68 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __chkstk_darwin(v14);
  uint64_t v19 = (char *)&v68 - v18;
  __chkstk_darwin(v17);
  uint64_t v21 = (uint64_t *)((char *)&v68 - v20);
  uint64_t v78 = 0;
  sub_4F84(&qword_28310);
  sub_1E200();
  *(_OWORD *)a7 = v80;
  sub_19DA8();
  uint64_t v78 = v22;
  uint64_t v79 = v23;
  sub_4F84(&qword_28318);
  sub_1E200();
  uint64_t v24 = v81;
  *(_OWORD *)(a7 + 16) = v80;
  *(void *)(a7 + 32) = v24;
  if (qword_281A0 != -1) {
    swift_once();
  }
  uint64_t v25 = sub_1DD20();
  sub_4D88(v25, (uint64_t)qword_28A78);
  sub_19698(a1, (uint64_t)v21, type metadata accessor for SiriTimerSnippetModel);
  uint64_t v26 = sub_1DD00();
  os_log_type_t v27 = sub_1E490();
  if (os_log_type_enabled(v26, v27))
  {
    uint64_t v71 = v19;
    uint64_t v28 = swift_slowAlloc();
    uint64_t v69 = a5;
    CGRect v29 = (uint8_t *)v28;
    uint64_t v30 = swift_slowAlloc();
    uint64_t v73 = a1;
    *(void *)&long long v80 = v30;
    uint64_t v72 = a2;
    *(_DWORD *)CGRect v29 = 136315138;
    uint64_t v68 = v29 + 4;
    uint64_t v31 = v16;
    uint64_t v70 = a6;
    uint64_t v33 = *v21;
    unint64_t v32 = v21[1];
    swift_bridgeObjectRetain();
    uint64_t v34 = v33;
    uint64_t v16 = v31;
    uint64_t v19 = v71;
    uint64_t v78 = sub_1C718(v34, v32, (uint64_t *)&v80);
    a2 = v72;
    sub_1E4E0();
    a6 = v70;
    swift_bridgeObjectRelease();
    sub_19238((uint64_t)v21, type metadata accessor for SiriTimerSnippetModel);
    _os_log_impl(&dword_0, v26, v27, "[TimerView.init] Initializing for timer with ID %s.", v29, 0xCu);
    swift_arrayDestroy();
    a1 = v73;
    swift_slowDealloc();
    a5 = v69;
    swift_slowDealloc();
  }
  else
  {
    sub_19238((uint64_t)v21, type metadata accessor for SiriTimerSnippetModel);
  }

  uint64_t v35 = (int *)type metadata accessor for TimerView();
  sub_19698(a1, a7 + v35[7], type metadata accessor for SiriTimerSnippetModel);
  uint64_t v36 = (void *)(a7 + v35[8]);
  *uint64_t v36 = v75;
  v36[1] = a5;
  id v37 = v76;
  *(void *)(a7 + v35[10]) = v76;
  *(void *)(a7 + v35[9]) = a6;
  uint64_t v38 = *(void **)a7;
  *(void *)a7 = a2;
  *(void *)(a7 + 8) = 0;
  id v76 = v37;
  id v39 = a6;
  id v40 = a2;

  swift_release();
  if (a2)
  {
    [v40 remainingTime];
    double v42 = v41;
    sub_19698(a1, (uint64_t)v19, type metadata accessor for SiriTimerSnippetModel);
    sub_19238((uint64_t)v19, type metadata accessor for SiriTimerSnippetModel);
    [v40 duration];
    double v44 = v43;
    sub_19698(a1, (uint64_t)v16, type metadata accessor for SiriTimerSnippetModel);
    sub_19238((uint64_t)v16, type metadata accessor for SiriTimerSnippetModel);
    *(double *)(a7 + 40) = v42 / v44;
    *(void *)(a7 + 48) = 0;
    id v45 = v40;
    if ([v45 state] != (char *)&dword_0 + 1) {
      objc_msgSend(v45, "remainingTime", 0.0);
    }
    sub_19DA8();
    uint64_t v47 = v46;
    uint64_t v49 = v48;
  }
  else
  {
    sub_19698(a1, (uint64_t)v19, type metadata accessor for SiriTimerSnippetModel);
    id v75 = v39;
    uint64_t v50 = v74;
    uint64_t v51 = &v19[*(int *)(v74 + 40)];
    double v52 = *(double *)v51;
    int v53 = v51[8];
    sub_19238((uint64_t)v19, type metadata accessor for SiriTimerSnippetModel);
    if (v53) {
      double v52 = 0.0;
    }
    sub_19698(a1, (uint64_t)v16, type metadata accessor for SiriTimerSnippetModel);
    uint64_t v54 = &v16[*(int *)(v50 + 36)];
    double v55 = *(double *)v54;
    int v56 = v54[8];
    sub_19238((uint64_t)v16, type metadata accessor for SiriTimerSnippetModel);
    uint64_t v47 = 0;
    uint64_t v49 = 0;
    double v57 = 1.0;
    if (!v56) {
      double v57 = v55;
    }
    *(double *)(a7 + 40) = v52 / v57;
    *(void *)(a7 + 48) = 0;
    uint64_t v58 = *(int *)(v50 + 40);
    id v39 = v75;
    if ((*(unsigned char *)(a1 + v58 + 8) & 1) == 0)
    {
      sub_19DA8();
      uint64_t v47 = v59;
      uint64_t v49 = v60;
    }
  }
  swift_bridgeObjectRelease();
  swift_release();
  *(void *)(a7 + 16) = v47;
  *(void *)(a7 + 24) = v49;
  *(void *)(a7 + 32) = 0;
  id v61 = [self mainRunLoop];
  sub_64EC(0, (unint64_t *)&qword_28320);
  uint64_t v62 = sub_1E4C0();
  uint64_t v63 = (uint64_t)v77;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v62 - 8) + 56))(v77, 1, 1, v62);
  uint64_t v64 = sub_1E4B0();
  sub_6528(v63, &qword_28308);
  *(void *)&long long v80 = v64;
  sub_1E4A0();
  sub_19B28((unint64_t *)&qword_28328, (void (*)(uint64_t))&type metadata accessor for NSTimer.TimerPublisher);
  uint64_t v65 = sub_1DD30();
  swift_release();
  *(void *)&long long v80 = v65;
  sub_4F84(&qword_28330);
  sub_7BA8(&qword_28338, &qword_28330);
  uint64_t v66 = sub_1DD40();

  sub_19238(a1, type metadata accessor for SiriTimerSnippetModel);
  uint64_t result = swift_release();
  *(void *)(a7 + v35[11]) = v66;
  return result;
}

uint64_t sub_15DB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = *(void *)(a1 + 16);
  uint64_t v6 = swift_bridgeObjectRetain();
  sub_5BA0(v6);
  sub_1919C((uint64_t)&v11);
  swift_getKeyPath();
  uint64_t v7 = swift_allocObject();
  long long v8 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v7 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v7 + 32) = v8;
  *(_OWORD *)(v7 + 48) = *(_OWORD *)(a1 + 32);
  *(void *)(v7 + 64) = *(void *)(a1 + 48);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a4;
  *(void *)(v9 + 24) = v7;
  sub_18EB8(a1);
  sub_4F84(&qword_282E0);
  sub_4F84(&qword_28AF8);
  sub_7BA8(&qword_282F0, &qword_282E0);
  type metadata accessor for TimerView();
  sub_19B28(&qword_28AD0, (void (*)(uint64_t))type metadata accessor for TimerView);
  swift_getOpaqueTypeConformance2();
  return sub_1E280();
}

uint64_t sub_15F60@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t (*a3)(id *)@<X3>, uint64_t a4@<X8>)
{
  uint64_t v34 = a4;
  uint64_t v7 = sub_1DC10();
  uint64_t v32 = *(void *)(v7 - 8);
  uint64_t v33 = v7;
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for SiriTimerSnippetModel(0);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = type metadata accessor for TimerView();
  __chkstk_darwin(v29);
  uint64_t v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_4F84(&qword_28AF8);
  uint64_t v30 = *(void *)(v15 - 8);
  uint64_t v31 = v15;
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19698(a1, (uint64_t)v12, type metadata accessor for SiriTimerSnippetModel);
  unint64_t v18 = *(void *)(a2 + 40);
  uint64_t v36 = a1;
  swift_bridgeObjectRetain();
  uint64_t v19 = sub_314C(a3, (uint64_t)v35, v18);
  swift_bridgeObjectRelease();
  uint64_t v20 = *(void **)(a2 + 48);
  uint64_t v21 = *(void *)(a2 + 32);
  uint64_t v22 = *(void **)a2;
  if (*(void *)a2)
  {
    uint64_t v23 = *(void **)(a2 + 24);
    id v24 = v20;
    swift_bridgeObjectRetain();
    sub_15644((uint64_t)v12, v19, v24, v23, v21, v22, (uint64_t)v14);
    uint64_t v26 = v32;
    uint64_t v25 = v33;
    (*(void (**)(char *, void, uint64_t))(v32 + 104))(v9, enum case for SeparatorStyle.edgeToEdge(_:), v33);
    sub_19B28(&qword_28AD0, (void (*)(uint64_t))type metadata accessor for TimerView);
    sub_1E090();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v9, v25);
    sub_19238((uint64_t)v14, (uint64_t (*)(void))type metadata accessor for TimerView);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v30 + 32))(v34, v17, v31);
  }
  else
  {
    sub_1E390();
    sub_19B28(&qword_281C0, (void (*)(uint64_t))&type metadata accessor for Context);
    id v28 = v20;
    swift_bridgeObjectRetain();
    uint64_t result = sub_1DE10();
    __break(1u);
  }
  return result;
}

uint64_t sub_162FC@<X0>(uint64_t a1@<X8>)
{
  return sub_14B78(a1);
}

uint64_t sub_16340@<X0>(uint64_t a1@<X8>)
{
  uint64_t v28 = a1;
  uint64_t v2 = type metadata accessor for TimerView();
  uint64_t v3 = v2 - 8;
  uint64_t v4 = *(void *)(v2 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin(v2);
  uint64_t v6 = sub_4F84(&qword_28BB8);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_4F84(&qword_28BC0);
  uint64_t v10 = v9 - 8;
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_4F84(&qword_28BC8);
  __chkstk_darwin(v27);
  uint64_t v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v8 = sub_1DED0();
  *((void *)v8 + 1) = 0;
  v8[16] = 1;
  uint64_t v15 = sub_4F84(&qword_28BD0);
  sub_16674(v1, (uint64_t)&v8[*(int *)(v15 + 44)]);
  uint64_t v16 = *(void *)(v1 + *(int *)(v3 + 52));
  uint64_t v25 = type metadata accessor for TimerView;
  uint64_t v26 = v1;
  uint64_t v24 = (uint64_t)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19698(v1, v24, (uint64_t (*)(void))type metadata accessor for TimerView);
  unint64_t v17 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v18 = swift_allocObject();
  sub_19704((uint64_t)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v18 + v17);
  sub_111E4((uint64_t)v8, (uint64_t)v12, &qword_28BB8);
  *(void *)&v12[*(int *)(v10 + 60)] = v16;
  uint64_t v19 = (uint64_t (**)())&v12[*(int *)(v10 + 64)];
  *uint64_t v19 = sub_19768;
  v19[1] = (uint64_t (*)())v18;
  swift_retain();
  sub_6528((uint64_t)v8, &qword_28BB8);
  sub_111E4((uint64_t)v12, (uint64_t)v14, &qword_28BC0);
  v14[*(int *)(v27 + 36)] = 0;
  sub_6528((uint64_t)v12, &qword_28BC0);
  uint64_t v20 = v24;
  sub_19698(v26, v24, (uint64_t (*)(void))v25);
  uint64_t v21 = swift_allocObject();
  sub_19704(v20, v21 + v17);
  sub_19A08();
  sub_1E100();
  swift_release();
  return sub_6528((uint64_t)v14, &qword_28BC8);
}

uint64_t sub_16674@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for TimerView();
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v7 = (char *)v133 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v5);
  uint64_t v135 = (uint64_t)v133 - v9;
  __chkstk_darwin(v8);
  uint64_t v138 = (uint64_t)v133 - v10;
  uint64_t v11 = sub_1E350();
  id v12 = *(id *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v141 = (uint64_t)v133 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v142 = (char *)v133 - v15;
  uint64_t v16 = sub_4F84(&qword_28C08);
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)v133 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_4F84(&qword_28C10);
  uint64_t v20 = __chkstk_darwin(v19 - 8);
  uint64_t v22 = (char *)v133 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  uint64_t v146 = (uint64_t)v133 - v23;
  char v24 = sub_1DC00();
  uint64_t v139 = a2;
  uint64_t v140 = v4;
  v147 = v22;
  v136 = v7;
  uint64_t v144 = v11;
  v145 = (_OWORD *)a1;
  uint64_t v143 = v16;
  if (v24)
  {
    uint64_t v134 = sub_1DF00();
    sub_173C4(a1, (uint64_t *)&v162);
    long long v25 = v162;
    char v26 = v163;
    uint64_t v27 = *((void *)&v163 + 1);
    uint64_t v29 = *((void *)&v164 + 1);
    uint64_t v28 = v164;
    char v30 = v165;
    uint64_t v31 = (char *)*((void *)&v165 + 1);
    char v32 = sub_1DF60();
    LOBYTE(v174) = 1;
    LOBYTE(v171) = v26;
    char v149 = v30;
    char v148 = 1;
    long long v150 = (unint64_t)v134;
    v151[0] = 1;
    *(_OWORD *)&v151[8] = v25;
    v151[24] = v26;
    *(void *)v152 = v27;
    *(_OWORD *)&v152[8] = __PAIR128__(v29, v28);
    v152[24] = v30;
    *(void *)&long long v153 = v31;
    BYTE8(v153) = v32;
    long long v154 = 0u;
    long long v155 = 0u;
    char v156 = 1;
    long long v164 = *(_OWORD *)&v151[16];
    long long v165 = *(_OWORD *)v152;
    long long v162 = (unint64_t)v134;
    long long v163 = *(_OWORD *)v151;
    v169[16] = 1;
    long long v168 = 0u;
    *(_OWORD *)v169 = 0u;
    long long v166 = *(_OWORD *)&v152[16];
    long long v167 = v153;
    LOBYTE(v177) = 1;
    *(_OWORD *)v157 = (unint64_t)v134;
    v157[16] = 1;
    *(_OWORD *)&v157[24] = v25;
    id v137 = (id)*((void *)&v25 + 1);
    uint64_t v138 = v27;
    char v33 = v26;
    v157[40] = v26;
    *(void *)v158 = v27;
    *(_OWORD *)&v158[8] = __PAIR128__(v29, v28);
    uint64_t v34 = v28;
    uint64_t v141 = v28;
    v142 = v31;
    uint64_t v35 = v29;
    v158[24] = v30;
    *(void *)&long long v159 = v31;
    BYTE8(v159) = v32;
    long long v160 = 0u;
    v161[0] = 0u;
    LOBYTE(v161[1]) = 1;
    sub_19C34((uint64_t)&v150);
    uint64_t v36 = v145;
    sub_19CA8(v25, *((uint64_t *)&v25 + 1), v33);
    swift_bridgeObjectRetain();
    sub_19CA8(v34, v35, v30);
    swift_bridgeObjectRetain();
    sub_19CB8((uint64_t)v157);
    long long v37 = *(_OWORD *)v169;
    *((_OWORD *)v18 + 6) = v168;
    *((_OWORD *)v18 + 7) = v37;
    uint64_t v38 = *(void *)&v169[16];
    long long v39 = v165;
    *((_OWORD *)v18 + 2) = v164;
    *((_OWORD *)v18 + 3) = v39;
    long long v40 = v167;
    *((_OWORD *)v18 + 4) = v166;
    *((_OWORD *)v18 + 5) = v40;
    long long v41 = v163;
    *(_OWORD *)uint64_t v18 = v162;
    *((_OWORD *)v18 + 1) = v41;
    *((void *)v18 + 16) = v38;
    *((void *)v18 + 17) = 0;
    v18[144] = 1;
    swift_storeEnumTagMultiPayload();
    sub_4F84(&qword_28C18);
    sub_7BA8(&qword_28C20, &qword_28C18);
    sub_19B28(&qword_28C28, (void (*)(uint64_t))&type metadata accessor for FactItemHeroNumberView);
    uint64_t v42 = v146;
    sub_1DF10();
    sub_7874(v25, (uint64_t)v137, v33);
    swift_bridgeObjectRelease();
    sub_7874(v141, v35, v30);
    swift_bridgeObjectRelease();
    goto LABEL_20;
  }
  uint64_t v134 = (uint64_t)v18;
  id v137 = v12;
  uint64_t v43 = *(void *)(a1 + 32);
  long long v162 = *(_OWORD *)(a1 + 16);
  *(void *)&long long v163 = v43;
  sub_4F84(&qword_28400);
  sub_1E210();
  uint64_t v44 = *(void *)&v157[8];
  if (*(void *)&v157[8]) {
    uint64_t v45 = *(void *)v157;
  }
  else {
    sub_19DA8();
  }
  *(void *)&long long v162 = v45;
  *((void *)&v162 + 1) = v44;
  v133[1] = sub_7820();
  uint64_t v46 = sub_1E070();
  uint64_t v48 = v47;
  char v50 = v49;
  if (sub_17910() == 2) {
    int v51 = sub_1DF40();
  }
  else {
    int v51 = sub_1DF20();
  }
  uint64_t v52 = v134;
  LODWORD(v162) = v51;
  char v53 = v50 & 1;
  uint64_t v54 = sub_1E050();
  uint64_t v56 = v55;
  char v58 = v57;
  uint64_t v60 = v59;
  sub_7874(v46, v48, v53);
  swift_bridgeObjectRelease();
  *((void *)&v163 + 1) = &type metadata for Text;
  *(void *)&long long v164 = &protocol witness table for Text;
  uint64_t v61 = swift_allocObject();
  *(void *)&long long v162 = v61;
  *(void *)(v61 + 16) = v54;
  *(void *)(v61 + 24) = v56;
  *(unsigned char *)(v61 + 32) = v58 & 1;
  *(void *)(v61 + 40) = v60;
  memset(v157, 0, 40);
  uint64_t v62 = (uint64_t)v145;
  long long v150 = *v145;
  sub_4F84(&qword_28410);
  sub_1E210();
  uint64_t v63 = (void *)v177;
  if ((void)v177)
  {
    id v64 = [(id)v177 displayTitle];

    uint64_t v65 = sub_1E3E0();
    unint64_t v67 = v66;

    uint64_t v68 = v138;
    sub_19698(v62, v138, (uint64_t (*)(void))type metadata accessor for TimerView);
    if (v67) {
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v68 = v138;
    sub_19698(v62, v138, (uint64_t (*)(void))type metadata accessor for TimerView);
  }
  uint64_t v69 = *(int *)(v140 + 28);
  uint64_t v70 = (uint64_t *)(v68 + v69 + *(int *)(type metadata accessor for SiriTimerSnippetModel(0) + 32));
  unint64_t v67 = v70[1];
  if (v67)
  {
    uint64_t v65 = *v70;
    swift_bridgeObjectRetain();
  }
  else
  {
    unint64_t v67 = 0xE500000000000000;
    uint64_t v65 = 0x72656D6954;
  }
LABEL_16:
  sub_19238(v68, (uint64_t (*)(void))type metadata accessor for TimerView);
  *(void *)&long long v150 = v65;
  *((void *)&v150 + 1) = v67;
  uint64_t v71 = sub_1E070();
  uint64_t v73 = v72;
  char v75 = v74;
  if (sub_17910() == 2) {
    int v76 = sub_1DF30();
  }
  else {
    int v76 = sub_1DF20();
  }
  LODWORD(v150) = v76;
  char v77 = v75 & 1;
  uint64_t v78 = sub_1E050();
  uint64_t v80 = v79;
  char v82 = v81;
  uint64_t v84 = v83;
  sub_7874(v71, v73, v77);
  swift_bridgeObjectRelease();
  *(void *)&v151[8] = &type metadata for Text;
  *(void *)&v151[16] = &protocol witness table for Text;
  uint64_t v85 = swift_allocObject();
  *(void *)&long long v150 = v85;
  *(void *)(v85 + 16) = v78;
  *(void *)(v85 + 24) = v80;
  *(unsigned char *)(v85 + 32) = v82 & 1;
  *(void *)(v85 + 40) = v84;
  uint64_t v179 = 0;
  long long v177 = 0u;
  long long v178 = 0u;
  uint64_t v176 = 0;
  long long v174 = 0u;
  long long v175 = 0u;
  uint64_t v173 = 0;
  long long v171 = 0u;
  long long v172 = 0u;
  uint64_t v86 = v141;
  sub_1E340();
  uint64_t v87 = (void (**)(void, void, void))v137;
  uint64_t v88 = v142;
  uint64_t v89 = v144;
  (*((void (**)(char *, uint64_t, uint64_t))v137 + 4))(v142, v86, v144);
  ((void (**)(uint64_t, char *, uint64_t))v87)[2](v52, v88, v89);
  swift_storeEnumTagMultiPayload();
  sub_4F84(&qword_28C18);
  sub_7BA8(&qword_28C20, &qword_28C18);
  sub_19B28(&qword_28C28, (void (*)(uint64_t))&type metadata accessor for FactItemHeroNumberView);
  uint64_t v42 = v146;
  sub_1DF10();
  ((void (*)(char *, uint64_t))v87[1])(v88, v89);
  uint64_t v36 = v145;
LABEL_20:
  uint64_t v91 = v36[1];
  *(void *)v157 = *v36;
  uint64_t v90 = *(void *)v157;
  *(void *)&v157[8] = v91;
  sub_4F84(&qword_28410);
  sub_1E230();
  long long v92 = v162;
  uint64_t v143 = v163;
  v142 = (char *)sub_17910();
  uint64_t v93 = v36[6];
  *(void *)&long long v162 = v36[5];
  *((void *)&v162 + 1) = v93;
  sub_4F84(&qword_28418);
  sub_1E210();
  uint64_t v94 = *(void *)v157;
  uint64_t v95 = v140;
  id v137 = *(id *)((char *)v36 + *(int *)(v140 + 40));
  uint64_t v141 = sub_1E2A0();
  *(void *)&long long v162 = v90;
  *((void *)&v162 + 1) = v91;
  sub_1E210();
  uint64_t v96 = *(void **)v157;
  if (*(void *)v157)
  {
    [*(id *)v157 remainingTime];
    double v98 = v97;

    uint64_t v99 = v135;
    sub_19698((uint64_t)v36, v135, (uint64_t (*)(void))type metadata accessor for TimerView);
    sub_19238(v99, (uint64_t (*)(void))type metadata accessor for TimerView);
  }
  else
  {
    uint64_t v100 = v135;
    sub_19698((uint64_t)v36, v135, (uint64_t (*)(void))type metadata accessor for TimerView);
    uint64_t v101 = *(int *)(v95 + 28);
    uint64_t v102 = v100 + v101 + *(int *)(type metadata accessor for SiriTimerSnippetModel(0) + 40);
    double v98 = *(double *)v102;
    LODWORD(v101) = *(unsigned __int8 *)(v102 + 8);
    sub_19238(v100, (uint64_t (*)(void))type metadata accessor for TimerView);
    if (v101) {
      double v98 = 0.0;
    }
  }
  uint64_t v103 = (uint64_t)v136;
  long long v162 = *(_OWORD *)v36;
  sub_1E210();
  unint64_t v104 = *(void **)v157;
  uint64_t v144 = *((void *)&v92 + 1);
  uint64_t v138 = v92;
  if (*(void *)v157)
  {
    [*(id *)v157 duration];
    double v106 = v105;

    sub_19698((uint64_t)v36, v103, (uint64_t (*)(void))type metadata accessor for TimerView);
    sub_19238(v103, (uint64_t (*)(void))type metadata accessor for TimerView);
  }
  else
  {
    sub_19698((uint64_t)v36, v103, (uint64_t (*)(void))type metadata accessor for TimerView);
    uint64_t v107 = *(int *)(v95 + 28);
    uint64_t v108 = v103 + v107 + *(int *)(type metadata accessor for SiriTimerSnippetModel(0) + 36);
    double v106 = *(double *)v108;
    LODWORD(v107) = *(unsigned __int8 *)(v108 + 8);
    sub_19238(v103, (uint64_t (*)(void))type metadata accessor for TimerView);
    if (v107) {
      double v106 = 1.0;
    }
  }
  double v109 = v98 / v106;
  sub_1E290();
  sub_1DD90();
  uint64_t v110 = v150;
  v145 = (_OWORD *)v150;
  char v111 = BYTE8(v150);
  uint64_t v112 = *(void *)v151;
  char v113 = v151[8];
  v136 = *(char **)&v151[24];
  uint64_t v114 = *(void *)&v151[16];
  int v115 = sub_1DF60();
  char v116 = v115;
  LODWORD(v140) = v115;
  LOBYTE(v177) = v111;
  LOBYTE(v174) = v113;
  LOBYTE(v171) = 1;
  uint64_t v117 = (uint64_t)v147;
  sub_111E4(v42, (uint64_t)v147, &qword_28C10);
  char v118 = v177;
  char v119 = v174;
  char v120 = v171;
  uint64_t v121 = v117;
  uint64_t v122 = v139;
  sub_111E4(v121, v139, &qword_28C10);
  v123 = (_OWORD *)(v122 + *(int *)(sub_4F84(&qword_28C30) + 48));
  id v125 = v137;
  uint64_t v124 = v138;
  *(void *)v157 = v138;
  *(void *)&v157[8] = v144;
  *(void *)&v157[16] = v143;
  *(void *)&v157[24] = v142;
  *(void *)&v157[32] = v137;
  *(void *)&v157[40] = v94;
  *(void *)v158 = v141;
  *(double *)&v158[8] = v109;
  *(void *)&v158[16] = v110;
  v158[24] = v118;
  *(void *)&long long v159 = v112;
  BYTE8(v159) = v119;
  v126 = v136;
  *(void *)&long long v160 = v114;
  *((void *)&v160 + 1) = v136;
  LOBYTE(v161[0]) = v116;
  *(_OWORD *)((char *)v161 + 8) = 0u;
  *(_OWORD *)((char *)&v161[1] + 8) = 0u;
  BYTE8(v161[2]) = v120;
  long long v127 = *(_OWORD *)&v157[16];
  _OWORD *v123 = *(_OWORD *)v157;
  v123[1] = v127;
  long long v128 = v159;
  v123[4] = *(_OWORD *)&v158[16];
  v123[5] = v128;
  long long v129 = *(_OWORD *)v158;
  v123[2] = *(_OWORD *)&v157[32];
  v123[3] = v129;
  *(_OWORD *)((char *)v123 + 137) = *(_OWORD *)((char *)&v161[1] + 9);
  long long v130 = v161[1];
  long long v131 = v160;
  v123[7] = v161[0];
  v123[8] = v130;
  v123[6] = v131;
  sub_19B70((uint64_t)v157);
  sub_6528(v146, &qword_28C10);
  *(void *)&long long v162 = v124;
  *((void *)&v162 + 1) = v144;
  *(void *)&long long v163 = v143;
  *((void *)&v163 + 1) = v142;
  *(void *)&long long v164 = v125;
  *((void *)&v164 + 1) = v94;
  *(void *)&long long v165 = v141;
  *((double *)&v165 + 1) = v109;
  *(void *)&long long v166 = v145;
  BYTE8(v166) = v118;
  *(void *)&long long v167 = v112;
  BYTE8(v167) = v119;
  *(void *)&long long v168 = v114;
  *((void *)&v168 + 1) = v126;
  v169[0] = v140;
  memset(&v169[8], 0, 32);
  char v170 = v120;
  sub_19BD0((uint64_t)&v162);
  return sub_6528((uint64_t)v147, &qword_28C10);
}

uint64_t sub_173C4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for TimerView();
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)v69 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_4F84(&qword_28C38);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)v69 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)(a1 + 32);
  long long v77 = *(_OWORD *)(a1 + 16);
  uint64_t v78 = v10;
  sub_4F84(&qword_28400);
  sub_1E210();
  uint64_t v11 = v80;
  char v75 = (long long *)a1;
  int v76 = a2;
  uint64_t v71 = v6;
  v69[0] = v4;
  if (v80) {
    id v12 = v79;
  }
  else {
    sub_19DA8();
  }
  *(void *)&long long v77 = v12;
  *((void *)&v77 + 1) = v11;
  v69[1] = sub_7820();
  uint64_t v13 = sub_1E070();
  uint64_t v15 = v14;
  char v17 = v16 & 1;
  uint64_t v18 = sub_1DFA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v9, 1, 1, v18);
  sub_1DFD0();
  sub_6528((uint64_t)v9, &qword_28C38);
  uint64_t v19 = sub_1E060();
  uint64_t v21 = v20;
  char v23 = v22;
  swift_release();
  char v24 = v23 & 1;
  sub_7874(v13, v15, v17);
  swift_bridgeObjectRelease();
  sub_1DFB0();
  uint64_t v25 = sub_1E030();
  uint64_t v27 = v26;
  char v29 = v28;
  sub_7874(v19, v21, v24);
  swift_bridgeObjectRelease();
  char v30 = v75;
  if (sub_17910() == 2) {
    sub_1E140();
  }
  else {
    sub_1E170();
  }
  uint64_t v31 = (uint64_t)v71;
  char v32 = v29 & 1;
  uint64_t v33 = sub_1E040();
  uint64_t v35 = v34;
  int v70 = v36;
  uint64_t v38 = v37;
  swift_release();
  sub_7874(v25, v27, v32);
  swift_bridgeObjectRelease();
  long long v77 = *v30;
  sub_4F84(&qword_28410);
  sub_1E210();
  id v39 = v79;
  uint64_t v73 = v33;
  uint64_t v74 = v38;
  uint64_t v72 = v35;
  if (!v79)
  {
    sub_19698((uint64_t)v30, v31, (uint64_t (*)(void))type metadata accessor for TimerView);
    goto LABEL_11;
  }
  id v40 = [v79 displayTitle];

  uint64_t v41 = sub_1E3E0();
  unint64_t v43 = v42;

  sub_19698((uint64_t)v30, v31, (uint64_t (*)(void))type metadata accessor for TimerView);
  if (!v43)
  {
LABEL_11:
    uint64_t v44 = *(int *)(v69[0] + 28);
    uint64_t v45 = (uint64_t *)(v31 + v44 + *(int *)(type metadata accessor for SiriTimerSnippetModel(0) + 32));
    unint64_t v43 = v45[1];
    if (v43)
    {
      uint64_t v41 = *v45;
      swift_bridgeObjectRetain();
    }
    else
    {
      unint64_t v43 = 0xE500000000000000;
      uint64_t v41 = 0x72656D6954;
    }
  }
  sub_19238(v31, (uint64_t (*)(void))type metadata accessor for TimerView);
  *(void *)&long long v77 = v41;
  *((void *)&v77 + 1) = v43;
  uint64_t v46 = sub_1E070();
  uint64_t v48 = v47;
  char v50 = v49 & 1;
  sub_1DFF0();
  uint64_t v51 = sub_1E060();
  uint64_t v53 = v52;
  char v55 = v54;
  swift_release();
  sub_7874(v46, v48, v50);
  swift_bridgeObjectRelease();
  if (sub_17910() == 2) {
    sub_1E140();
  }
  else {
    sub_1E170();
  }
  char v56 = v55 & 1;
  char v57 = v70 & 1;
  uint64_t v58 = sub_1E040();
  uint64_t v60 = v59;
  char v62 = v61;
  uint64_t v64 = v63;
  swift_release();
  sub_7874(v51, v53, v56);
  swift_bridgeObjectRelease();
  LOBYTE(v77) = v57;
  uint64_t v65 = v76;
  uint64_t v67 = v72;
  uint64_t v66 = v73;
  *int v76 = v73;
  v65[1] = v67;
  *((unsigned char *)v65 + 16) = v57;
  v65[3] = v74;
  v65[4] = v58;
  v65[5] = v60;
  *((unsigned char *)v65 + 48) = v62 & 1;
  v65[7] = v64;
  sub_19CA8(v66, v67, v57);
  swift_bridgeObjectRetain();
  sub_19CA8(v58, v60, v62 & 1);
  swift_bridgeObjectRetain();
  sub_7874(v58, v60, v62 & 1);
  swift_bridgeObjectRelease();
  sub_7874(v66, v67, v77);
  return swift_bridgeObjectRelease();
}

uint64_t sub_17910()
{
  long long v6 = *v0;
  sub_4F84(&qword_28410);
  sub_1E210();
  if (v7)
  {
    id v1 = objc_msgSend(v7, "state", v6);
  }
  else
  {
    uint64_t v2 = (char *)v0 + *(int *)(type metadata accessor for TimerView() + 28);
    id v1 = 0;
    if ((v2[*(int *)(type metadata accessor for SiriTimerSnippetModel(0) + 44) + 8] & 1) == 0)
    {
      uint64_t v3 = sub_1DCE0();
      if (v4)
      {
        return 0;
      }
      else if (v3 == 1)
      {
        return 3;
      }
      else
      {
        return 2 * (v3 == 2);
      }
    }
  }
  return (uint64_t)v1;
}

uint64_t sub_179D8()
{
  uint64_t v1 = (uint64_t)v0;
  uint64_t v2 = type metadata accessor for TimerView();
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v5 = (char *)v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  id v7 = (char *)v36 - v6;
  uint64_t v8 = *v0;
  uint64_t v9 = v0[1];
  *(void *)&long long v37 = *v0;
  *((void *)&v37 + 1) = v9;
  sub_4F84(&qword_28410);
  sub_1E210();
  id v10 = v36[0];

  if (!v10)
  {
    uint64_t v15 = v1 + *(int *)(v2 + 28);
    uint64_t v14 = 0;
    if (*(unsigned char *)(v15 + *(int *)(type metadata accessor for SiriTimerSnippetModel(0) + 40) + 8)) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  *(void *)&long long v37 = v8;
  *((void *)&v37 + 1) = v9;
  sub_1E210();
  if (!v36[0])
  {
    if (qword_281A0 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_1DD20();
    sub_4D88(v16, (uint64_t)qword_28A78);
    char v17 = sub_1DD00();
    os_log_type_t v18 = sub_1E470();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_0, v17, v18, "TimerView: MTTimer missing in call for durationString(for:)", v19, 2u);
      swift_slowDealloc();
    }

LABEL_13:
    sub_19DA8();
    id v10 = v20;
    uint64_t v14 = v21;
    goto LABEL_14;
  }
  id v11 = v36[0];
  if ([v11 state] != (char *)&dword_0 + 1) {
    objc_msgSend(v11, "remainingTime", 0.0);
  }
  sub_19DA8();
  id v10 = v12;
  uint64_t v14 = v13;

LABEL_14:
  uint64_t v22 = *(void *)(v1 + 32);
  long long v37 = *(_OWORD *)(v1 + 16);
  uint64_t v38 = v22;
  v36[0] = v10;
  v36[1] = v14;
  sub_4F84(&qword_28400);
  sub_1E220();
  if (sub_17910() == 1)
  {
    uint64_t v23 = *(void *)(v1 + 48);
    *(void *)&long long v37 = *(void *)(v1 + 40);
    *((void *)&v37 + 1) = v23;
    v36[0] = 0;
  }
  else
  {
    *(void *)&long long v37 = v8;
    *((void *)&v37 + 1) = v9;
    sub_1E210();
    id v24 = v36[0];
    if (v36[0])
    {
      [v36[0] remainingTime];
      double v26 = v25;

      sub_19698(v1, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for TimerView);
      sub_19238((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for TimerView);
    }
    else
    {
      sub_19698(v1, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for TimerView);
      uint64_t v27 = *(int *)(v2 + 28);
      char v28 = &v7[v27 + *(int *)(type metadata accessor for SiriTimerSnippetModel(0) + 40)];
      double v26 = *(double *)v28;
      LODWORD(v27) = v28[8];
      sub_19238((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for TimerView);
      if (v27) {
        double v26 = 0.0;
      }
    }
    long long v37 = *(_OWORD *)v1;
    sub_1E210();
    id v29 = v36[0];
    if (v36[0])
    {
      [v36[0] duration];
      double v31 = v30;

      sub_19698(v1, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for TimerView);
      sub_19238((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for TimerView);
    }
    else
    {
      sub_19698(v1, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for TimerView);
      uint64_t v32 = *(int *)(v2 + 28);
      uint64_t v33 = &v5[v32 + *(int *)(type metadata accessor for SiriTimerSnippetModel(0) + 36)];
      double v31 = *(double *)v33;
      LODWORD(v32) = v33[8];
      sub_19238((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for TimerView);
      if (v32) {
        double v31 = 1.0;
      }
    }
    uint64_t v34 = *(void *)(v1 + 48);
    *(void *)&long long v37 = *(void *)(v1 + 40);
    *((void *)&v37 + 1) = v34;
    *(double *)int v36 = v26 / v31;
  }
  sub_4F84(&qword_28418);
  return sub_1E220();
}

void sub_17E60()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1DBC0();
  uint64_t v46 = *(void *)(v2 - 8);
  uint64_t v47 = v2;
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_4F84(&qword_28348);
  __chkstk_darwin(v5 - 8);
  id v7 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1DB00();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  id v12 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v42 - v13;
  uint64_t v48 = type metadata accessor for TimerView();
  uint64_t v15 = (void *)(v0 + *(int *)(v48 + 28));
  unint64_t v16 = v15[3];
  if (v16 && (uint64_t v17 = v15[4]) != 0)
  {
    uint64_t v18 = v15[2];
    if (qword_281A0 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_1DD20();
    sub_4D88(v19, (uint64_t)qword_28A78);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v20 = sub_1DD00();
    os_log_type_t v21 = sub_1E490();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = swift_slowAlloc();
      uint64_t v47 = swift_slowAlloc();
      aBlock[0] = v47;
      *(_DWORD *)uint64_t v22 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t v49 = sub_1C718(v18, v16, aBlock);
      uint64_t v45 = v1;
      sub_1E4E0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v22 + 12) = 2080;
      uint64_t v46 = v22 + 14;
      swift_bridgeObjectRetain();
      uint64_t v23 = sub_1E3A0();
      unint64_t v25 = v24;
      swift_bridgeObjectRelease();
      uint64_t v49 = sub_1C718(v23, v25, aBlock);
      sub_1E4E0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v20, v21, "[TimerView.onSnippetTapped]: Performing direct invocation with ID = %s, payload = %s", (uint8_t *)v22, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    sub_3CDC(v17);
    sub_1E380();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v26 = type metadata accessor for SiriTimerSnippetModel(0);
    sub_111E4((uint64_t)v15 + *(int *)(v26 + 28), (uint64_t)v7, &qword_28348);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
    {
      sub_6528((uint64_t)v7, &qword_28348);
      if (qword_281A0 != -1) {
        swift_once();
      }
      uint64_t v27 = sub_1DD20();
      sub_4D88(v27, (uint64_t)qword_28A78);
      char v28 = sub_1DD00();
      os_log_type_t v29 = sub_1E490();
      if (os_log_type_enabled(v28, v29))
      {
        double v30 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)double v30 = 0;
        _os_log_impl(&dword_0, v28, v29, "[TimerView.onSnippetTapped]: Nil direct invocation parameters detected; punching out instead.",
          v30,
          2u);
        swift_slowDealloc();
      }

      id v31 = [self serviceWithDefaultShellEndpoint];
      if (v31)
      {
        id v32 = v31;
        NSString v33 = sub_1E3D0();
        aBlock[4] = (uint64_t)sub_186C4;
        aBlock[5] = 0;
        aBlock[0] = (uint64_t)_NSConcreteStackBlock;
        aBlock[1] = 1107296256;
        aBlock[2] = (uint64_t)sub_188D8;
        aBlock[3] = (uint64_t)&unk_25E28;
        uint64_t v34 = _Block_copy(aBlock);
        [v32 openApplication:v33 withOptions:0 completion:v34];

        _Block_release(v34);
      }
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v14, v7, v8);
      if (qword_281A0 != -1) {
        swift_once();
      }
      uint64_t v45 = v1;
      uint64_t v35 = sub_1DD20();
      sub_4D88(v35, (uint64_t)qword_28A78);
      (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
      int v36 = sub_1DD00();
      os_log_type_t v37 = sub_1E490();
      if (os_log_type_enabled(v36, v37))
      {
        uint64_t v38 = (uint8_t *)swift_slowAlloc();
        uint64_t v44 = swift_slowAlloc();
        aBlock[0] = v44;
        unint64_t v43 = v38;
        *(_DWORD *)uint64_t v38 = 136315138;
        sub_19B28(&qword_28BF8, (void (*)(uint64_t))&type metadata accessor for URL);
        uint64_t v39 = sub_1E740();
        uint64_t v49 = sub_1C718(v39, v40, aBlock);
        sub_1E4E0();
        swift_bridgeObjectRelease();
        uint64_t v41 = *(void (**)(char *, uint64_t))(v9 + 8);
        v41(v12, v8);
        _os_log_impl(&dword_0, v36, v37, "[TimerView.onSnippetTapped]: Performing punchout URL = %s", v43, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        uint64_t v41 = *(void (**)(char *, uint64_t))(v9 + 8);
        v41(v12, v8);
      }

      sub_1DAF0();
      sub_1DBB0();
      sub_1E370();
      (*(void (**)(char *, uint64_t))(v46 + 8))(v4, v47);
      v41(v14, v8);
    }
  }
}

void sub_186C4(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_errorRetain();
    if (qword_281A0 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_1DD20();
    sub_4D88(v2, (uint64_t)qword_28A78);
    swift_errorRetain();
    swift_errorRetain();
    oslog = sub_1DD00();
    os_log_type_t v3 = sub_1E470();
    if (os_log_type_enabled(oslog, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      uint64_t v8 = swift_slowAlloc();
      *(_DWORD *)uint64_t v4 = 136315138;
      swift_errorRetain();
      sub_4F84(&qword_28C00);
      uint64_t v5 = sub_1E400();
      sub_1C718(v5, v6, &v8);
      sub_1E4E0();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl(&dword_0, oslog, v3, "[TimerView.onSnippetTapped]: Failed to launch clock app! %s", v4, 0xCu);
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
  }
}

void sub_188D8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

void sub_18968(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  sub_1E390();
  sub_19B28(&qword_281C0, (void (*)(uint64_t))&type metadata accessor for Context);
  uint64_t v8 = sub_1DE20();
  uint64_t v10 = v9;
  id v11 = [objc_allocWithZone((Class)MTTimerManager) init];
  uint64_t v12 = qword_281A0;
  id v13 = v11;
  if (v12 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_1DD20();
  sub_4D88(v14, (uint64_t)qword_28A78);
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_1DD00();
  os_log_type_t v16 = sub_1E490();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v17 = 134217984;
    sub_1E4E0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v15, v16, "[TimerSnippet.init] Initializing for %ld timers.", v17, 0xCu);
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease();
  }
  id v18 = [v13 timersSync];

  if (v18)
  {
    sub_64EC(0, &qword_281C8);
    uint64_t v19 = sub_1E430();

    *a4 = v8;
    a4[1] = v10;
    a4[2] = a1;
    a4[3] = a2;
    a4[4] = a3;
    a4[5] = v19;
    a4[6] = (uint64_t)v13;
  }
  else
  {
    __break(1u);
  }
}

void destroy for TimerSnippet(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void **)(a1 + 48);
}

void *initializeWithCopy for TimerSnippet(void *a1, uint64_t a2)
{
  os_log_type_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  a1[2] = *(void *)(a2 + 16);
  a1[3] = v5;
  uint64_t v6 = *(void *)(a2 + 40);
  a1[4] = *(void *)(a2 + 32);
  a1[5] = v6;
  id v7 = *(void **)(a2 + 48);
  a1[6] = v7;
  id v8 = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v9 = v7;
  return a1;
}

uint64_t assignWithCopy for TimerSnippet(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  id v7 = *(void **)(a2 + 48);
  id v8 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = v7;
  id v9 = v7;

  return a1;
}

__n128 initializeWithTake for TimerSnippet(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for TimerSnippet(uint64_t a1, uint64_t a2)
{
  long long v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  uint64_t v5 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  id v6 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);

  return a1;
}

uint64_t getEnumTagSinglePayload for TimerSnippet(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TimerSnippet(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
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
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TimerSnippet()
{
  return &type metadata for TimerSnippet;
}

uint64_t sub_18E44()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_18E64()
{
  return sub_15DB0(v0 + 16, (uint64_t)&unk_25D98, (uint64_t)&unk_25DC0, (uint64_t)sub_192F4);
}

uint64_t sub_18EB8(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 48);
  id v3 = *(id *)a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v4 = v2;
  return a1;
}

unint64_t sub_18F1C()
{
  unint64_t result = qword_28AC8;
  if (!qword_28AC8)
  {
    sub_571C(&qword_28AC0);
    type metadata accessor for TimerView();
    sub_19B28(&qword_28AD0, (void (*)(uint64_t))type metadata accessor for TimerView);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_28AC8);
  }
  return result;
}

uint64_t type metadata accessor for TimerView()
{
  uint64_t result = qword_28B58;
  if (!qword_28B58) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_1903C()
{
  unint64_t result = qword_28AE0;
  if (!qword_28AE0)
  {
    sub_571C(&qword_28AB0);
    sub_571C(&qword_28AA0);
    sub_7BA8(&qword_28AE8, &qword_28AA0);
    swift_getOpaqueTypeConformance2();
    sub_7BA8(&qword_282C0, &qword_282B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_28AE0);
  }
  return result;
}

uint64_t sub_19140()
{
  return sub_15DB0(v0 + 16, (uint64_t)&unk_25D48, (uint64_t)&unk_25D70, (uint64_t)sub_191CC);
}

uint64_t sub_1919C(uint64_t a1)
{
  return a1;
}

uint64_t sub_191CC@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  return sub_15F60(a1, v2 + 16, sub_19D88, a2);
}

uint64_t sub_191FC()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_19238(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1929C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 72, 7);
}

uint64_t sub_192F4@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  return sub_15F60(a1, v2 + 16, sub_6068, a2);
}

uint64_t sub_19324(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_19338);
}

uint64_t sub_19338(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SiriTimerSnippetModel(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 28);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else
  {
    unint64_t v12 = *(void *)(a1 + *(int *)(a3 + 32) + 8);
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    return (v12 + 1);
  }
}

uint64_t sub_19400(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_19414);
}

uint64_t sub_19414(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for SiriTimerSnippetModel(0);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + *(int *)(a4 + 28);
    unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 32) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t sub_194D8()
{
  uint64_t result = type metadata accessor for SiriTimerSnippetModel(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_195A8()
{
  unint64_t result = qword_28BA8;
  if (!qword_28BA8)
  {
    sub_571C(&qword_28BB0);
    sub_571C(&qword_28AB0);
    sub_1903C();
    swift_getOpaqueTypeConformance2();
    sub_7BA8(&qword_28AF0, &qword_28A90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_28BA8);
  }
  return result;
}

uint64_t sub_1967C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_19698(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_19704(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TimerView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_19768()
{
  return sub_179D8();
}

uint64_t sub_197C8()
{
  unint64_t v1 = (int *)type metadata accessor for TimerView();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v10 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v4 = v0 + v3;

  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v5 = v0 + v3 + v1[7];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = v5 + *(int *)(type metadata accessor for SiriTimerSnippetModel(0) + 28);
  uint64_t v7 = sub_1DB00();
  uint64_t v8 = *(void *)(v7 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();

  return _swift_deallocObject(v0, v3 + v10, v2 | 7);
}

void sub_199AC()
{
}

unint64_t sub_19A08()
{
  unint64_t result = qword_28BD8;
  if (!qword_28BD8)
  {
    sub_571C(&qword_28BC8);
    sub_7BA8(&qword_28BE0, &qword_28BC0);
    sub_7BA8(&qword_28BE8, &qword_28BF0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_28BD8);
  }
  return result;
}

uint64_t sub_19ACC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_19ADC()
{
  return swift_release();
}

uint64_t sub_19AE4()
{
  sub_7874(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32));
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_19B28(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_19B70(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  uint64_t v3 = *(void **)(a1 + 32);
  swift_retain();
  swift_retain();
  swift_retain();
  id v4 = v2;
  id v5 = v3;
  return a1;
}

uint64_t sub_19BD0(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);

  swift_release();
  swift_release();

  swift_release();
  return a1;
}

uint64_t sub_19C34(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 64);
  char v4 = *(unsigned char *)(a1 + 72);
  sub_19CA8(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_bridgeObjectRetain();
  sub_19CA8(v2, v3, v4);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_19CA8(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_19CB8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 64);
  char v4 = *(unsigned char *)(a1 + 72);
  sub_7874(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_bridgeObjectRelease();
  sub_7874(v2, v3, v4);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_19D2C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_19D88(id *a1)
{
  return sub_6068(a1) & 1;
}

void sub_19DA8()
{
  uint64_t v0 = sub_1DB60();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v72 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A964(&v79);
  sub_1DB50();
  v4.super.isa = sub_1DB40().super.isa;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if (qword_281A8 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_1DD20();
  uint64_t v6 = sub_4D88(v5, (uint64_t)qword_28C40);
  uint64_t v7 = v4.super.isa;
  uint64_t v8 = sub_1DD00();
  os_log_type_t v9 = sub_1E460();
  BOOL v10 = os_log_type_enabled(v8, v9);
  uint64_t v74 = v6;
  if (v10)
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v75 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315138;
    v85[0] = v7;
    type metadata accessor for CFLocale(0);
    unint64_t v12 = v7;
    uint64_t v13 = sub_1E400();
    v85[0] = sub_1C718(v13, v14, &v75);
    sub_1E4E0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v8, v9, "TimeInterval.intervalTextString formatting time components using locale %s", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  sub_1B260((uint64_t)&v79, (uint64_t)v82);
  sub_1B260((uint64_t)v82, (uint64_t)v85);
  if (v85[1])
  {
    uint64_t v15 = (__CFString *)sub_1E3D0();
    uint64_t v73 = v7;
    DateFormatFromTemplate = (__CFString *)CFDateFormatterCreateDateFormatFromTemplate(kCFAllocatorDefault, v15, 0, v7);

    if (DateFormatFromTemplate)
    {
      uint64_t v17 = sub_1E3E0();
      unint64_t v19 = v18;

      uint64_t v75 = v17;
      unint64_t v76 = v19;
      *(void *)&long long v84 = 18504;
      *((void *)&v84 + 1) = 0xE200000000000000;
      *(void *)&long long v83 = 1076113701;
      *((void *)&v83 + 1) = 0xE400000000000000;
      sub_7820();
      uint64_t v20 = sub_1E510();
      unint64_t v22 = v21;
      swift_bridgeObjectRelease();
      uint64_t v75 = v20;
      unint64_t v76 = v22;
      *(void *)&long long v84 = 72;
      *((void *)&v84 + 1) = 0xE100000000000000;
      *(void *)&long long v83 = 1076113701;
      *((void *)&v83 + 1) = 0xE400000000000000;
      uint64_t v23 = sub_1E510();
      unint64_t v25 = v24;
      swift_bridgeObjectRelease();
      uint64_t v75 = v23;
      unint64_t v76 = v25;
      *(void *)&long long v84 = 26728;
      *((void *)&v84 + 1) = 0xE200000000000000;
      *(void *)&long long v83 = 1076113701;
      *((void *)&v83 + 1) = 0xE400000000000000;
      uint64_t v26 = sub_1E510();
      unint64_t v28 = v27;
      swift_bridgeObjectRelease();
      uint64_t v75 = v26;
      unint64_t v76 = v28;
      *(void *)&long long v84 = 104;
      *((void *)&v84 + 1) = 0xE100000000000000;
      *(void *)&long long v83 = 1076113701;
      *((void *)&v83 + 1) = 0xE400000000000000;
      uint64_t v29 = sub_1E510();
      unint64_t v31 = v30;
      swift_bridgeObjectRelease();
      uint64_t v75 = v29;
      unint64_t v76 = v31;
      *(void *)&long long v84 = 28013;
      *((void *)&v84 + 1) = 0xE200000000000000;
      *(void *)&long long v83 = 1076113957;
      *((void *)&v83 + 1) = 0xE400000000000000;
      uint64_t v32 = sub_1E510();
      unint64_t v34 = v33;
      swift_bridgeObjectRelease();
      uint64_t v75 = v32;
      unint64_t v76 = v34;
      *(void *)&long long v84 = 109;
      *((void *)&v84 + 1) = 0xE100000000000000;
      *(void *)&long long v83 = 1076113957;
      *((void *)&v83 + 1) = 0xE400000000000000;
      uint64_t v35 = sub_1E510();
      unint64_t v37 = v36;
      swift_bridgeObjectRelease();
      uint64_t v75 = v35;
      unint64_t v76 = v37;
      *(void *)&long long v84 = 29555;
      *((void *)&v84 + 1) = 0xE200000000000000;
      *(void *)&long long v83 = 1076114213;
      *((void *)&v83 + 1) = 0xE400000000000000;
      uint64_t v38 = sub_1E510();
      unint64_t v40 = v39;
      swift_bridgeObjectRelease();
      uint64_t v75 = v38;
      unint64_t v76 = v40;
      *(void *)&long long v84 = 21331;
      *((void *)&v84 + 1) = 0xE200000000000000;
      *(void *)&long long v83 = 1076114469;
      *((void *)&v83 + 1) = 0xE400000000000000;
      uint64_t v41 = sub_1E510();
      unint64_t v43 = v42;
      swift_bridgeObjectRelease();
      uint64_t v77 = v41;
      unint64_t v78 = v43;
      uint64_t v75 = v41;
      unint64_t v76 = v43;
      if (qword_281B0 != -1) {
        swift_once();
      }
      uint64_t v44 = sub_1DA90();
      sub_4D88(v44, (uint64_t)qword_28C58);
      uint64_t v45 = sub_1E500();
      unint64_t v47 = v46;
      swift_bridgeObjectRelease();
      uint64_t v77 = v45;
      unint64_t v78 = v47;
      uint64_t v7 = v73;
      goto LABEL_13;
    }
    __break(1u);
LABEL_21:
    __break(1u);
    return;
  }
  uint64_t v48 = (__CFString *)sub_1E3D0();
  uint64_t v49 = (__CFString *)CFDateFormatterCreateDateFormatFromTemplate(kCFAllocatorDefault, v48, 0, v7);

  if (!v49) {
    goto LABEL_21;
  }
  uint64_t v50 = sub_1E3E0();
  unint64_t v52 = v51;

  uint64_t v75 = v50;
  unint64_t v76 = v52;
  *(void *)&long long v84 = 28013;
  *((void *)&v84 + 1) = 0xE200000000000000;
  *(void *)&long long v83 = 1076113701;
  *((void *)&v83 + 1) = 0xE400000000000000;
  sub_7820();
  uint64_t v53 = sub_1E510();
  unint64_t v55 = v54;
  swift_bridgeObjectRelease();
  uint64_t v75 = v53;
  unint64_t v76 = v55;
  *(void *)&long long v84 = 109;
  *((void *)&v84 + 1) = 0xE100000000000000;
  *(void *)&long long v83 = 1076113701;
  *((void *)&v83 + 1) = 0xE400000000000000;
  uint64_t v56 = sub_1E510();
  unint64_t v58 = v57;
  swift_bridgeObjectRelease();
  uint64_t v75 = v56;
  unint64_t v76 = v58;
  *(void *)&long long v84 = 29555;
  *((void *)&v84 + 1) = 0xE200000000000000;
  *(void *)&long long v83 = 1076113957;
  *((void *)&v83 + 1) = 0xE400000000000000;
  uint64_t v59 = sub_1E510();
  unint64_t v61 = v60;
  swift_bridgeObjectRelease();
  uint64_t v75 = v59;
  unint64_t v76 = v61;
  *(void *)&long long v84 = 21331;
  *((void *)&v84 + 1) = 0xE200000000000000;
  *(void *)&long long v83 = 1076114213;
  *((void *)&v83 + 1) = 0xE400000000000000;
  uint64_t v45 = sub_1E510();
  unint64_t v47 = v62;
  swift_bridgeObjectRelease();
  uint64_t v77 = v45;
  unint64_t v78 = v47;
LABEL_13:
  swift_bridgeObjectRetain_n();
  uint64_t v63 = sub_1DD00();
  os_log_type_t v64 = sub_1E460();
  if (os_log_type_enabled(v63, v64))
  {
    uint64_t v65 = (uint8_t *)swift_slowAlloc();
    uint64_t v75 = swift_slowAlloc();
    *(_DWORD *)uint64_t v65 = 136315138;
    swift_bridgeObjectRetain();
    *(void *)&long long v84 = sub_1C718(v45, v47, &v75);
    sub_1E4E0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, v63, v64, "TimeInterval.intervalTextString formatString: \"%s\"", v65, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  sub_1B260((uint64_t)v82, (uint64_t)&v83);
  if (*((void *)&v83 + 1))
  {
    long long v84 = v83;
    swift_beginAccess();
    sub_4F84(&qword_28C70);
    uint64_t v66 = swift_allocObject();
    *(_OWORD *)(v66 + 16) = xmmword_1FFE0;
    *(void *)(v66 + 56) = &type metadata for String;
    unint64_t v67 = sub_1B2C8();
    *(void *)(v66 + 64) = v67;
    *(_OWORD *)(v66 + 32) = v84;
    *(void *)(v66 + 96) = &type metadata for String;
    *(void *)(v66 + 104) = v67;
    long long v68 = v81;
    *(_OWORD *)(v66 + 72) = v80;
    *(void *)(v66 + 136) = &type metadata for String;
    *(void *)(v66 + 144) = v67;
    *(_OWORD *)(v66 + 112) = v68;
  }
  else
  {
    swift_beginAccess();
    sub_4F84(&qword_28C70);
    uint64_t v69 = swift_allocObject();
    *(_OWORD *)(v69 + 16) = xmmword_1FFF0;
    *(void *)(v69 + 56) = &type metadata for String;
    unint64_t v70 = sub_1B2C8();
    *(void *)(v69 + 64) = v70;
    long long v71 = v81;
    *(_OWORD *)(v69 + 32) = v80;
    *(void *)(v69 + 96) = &type metadata for String;
    *(void *)(v69 + 104) = v70;
    *(_OWORD *)(v69 + 72) = v71;
  }
  sub_1E3F0();
  swift_bridgeObjectRelease();
}

uint64_t sub_1A8A0()
{
  uint64_t v0 = sub_1DD20();
  sub_4DF0(v0, qword_28C40);
  sub_4D88(v0, (uint64_t)qword_28C40);
  return sub_1DD10();
}

uint64_t sub_1A918()
{
  uint64_t v0 = sub_1DA90();
  sub_4DF0(v0, qword_28C58);
  sub_4D88(v0, (uint64_t)qword_28C58);
  return sub_1DA80();
}

uint64_t sub_1A964@<X0>(_OWORD *a1@<X8>)
{
  os_log_type_t v64 = a1;
  uint64_t v74 = sub_1DBA0();
  uint64_t v66 = *(void *)(v74 - 8);
  __chkstk_darwin(v74);
  uint64_t v65 = (char *)&v63 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = sub_1DAD0();
  uint64_t v69 = *(void *)(v71 - 8);
  __chkstk_darwin(v71);
  uint64_t v73 = (char *)&v63 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = sub_1DB30();
  uint64_t v70 = *(void *)(v72 - 8);
  uint64_t v3 = __chkstk_darwin(v72);
  uint64_t v5 = (char *)&v63 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v63 - v6;
  id v8 = [objc_allocWithZone((Class)NSNumberFormatter) init];
  [v8 setNumberStyle:0];
  sub_1DB20();
  sub_1DB10();
  sub_1DB80();
  sub_4F84(&qword_28C80);
  uint64_t v9 = sub_1DB90();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = 2 * v11;
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_1FFE0;
  unint64_t v15 = v14 + v12;
  os_log_type_t v16 = *(void (**)(unint64_t, void, uint64_t))(v10 + 104);
  v16(v15, enum case for Calendar.Component.hour(_:), v9);
  unint64_t v17 = v15 + v11;
  unint64_t v18 = v8;
  v16(v17, enum case for Calendar.Component.minute(_:), v9);
  v16(v15 + v13, enum case for Calendar.Component.second(_:), v9);
  sub_1B31C(v14);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  unint64_t v19 = v73;
  unint64_t v67 = v5;
  long long v68 = v7;
  uint64_t v20 = v65;
  sub_1DB70();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v66 + 8))(v20, v74);
  long long v78 = 0uLL;
  uint64_t v21 = sub_1DAA0();
  if ((v22 & 1) == 0 && v21 > 0)
  {
    NSString v23 = sub_1E3D0();
    [v8 setPositiveFormat:v23];

    Class isa = sub_1E450().super.super.isa;
    id v25 = [v8 stringFromNumber:isa];

    if (v25)
    {
      uint64_t v26 = sub_1E3E0();
      unint64_t v28 = v27;
    }
    else
    {
      uint64_t v26 = 0;
      unint64_t v28 = 0xE000000000000000;
    }
    *(void *)&long long v78 = v26;
    *((void *)&v78 + 1) = v28;
  }
  uint64_t v74 = 12336;
  unint64_t v29 = 0xE200000000000000;
  NSString v30 = sub_1E3D0();
  [v8 setPositiveFormat:v30];

  uint64_t v31 = sub_1DAB0();
  if (v32) {
    uint64_t v33 = 0;
  }
  else {
    uint64_t v33 = v31;
  }
  id v34 = [objc_allocWithZone((Class)NSNumber) initWithInteger:v33];
  id v35 = [v8 stringFromNumber:v34];

  if (v35)
  {
    uint64_t v74 = sub_1E3E0();
    unint64_t v29 = v36;
  }
  uint64_t v37 = sub_1DAC0();
  if (v38) {
    uint64_t v39 = 0;
  }
  else {
    uint64_t v39 = v37;
  }
  id v40 = [objc_allocWithZone((Class)NSNumber) initWithInteger:v39];
  id v41 = [v8 stringFromNumber:v40];

  if (v41)
  {
    uint64_t v42 = sub_1E3E0();
    unint64_t v44 = v43;
  }
  else
  {
    unint64_t v44 = 0xE200000000000000;
    uint64_t v42 = 12336;
  }
  if (qword_281A8 != -1) {
    swift_once();
  }
  uint64_t v45 = sub_1DD20();
  sub_4D88(v45, (uint64_t)qword_28C40);
  long long v46 = v78;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  unint64_t v47 = sub_1DD00();
  os_log_type_t v48 = sub_1E460();
  if (os_log_type_enabled(v47, v48))
  {
    unint64_t v49 = v29;
    uint64_t v50 = swift_slowAlloc();
    uint64_t v65 = (char *)swift_slowAlloc();
    uint64_t v75 = v65;
    uint64_t v76 = v46;
    *(_DWORD *)uint64_t v50 = 136315650;
    uint64_t v66 = v42;
    uint64_t v77 = *((void *)&v46 + 1);
    swift_bridgeObjectRetain();
    sub_4F84(&qword_28318);
    uint64_t v51 = sub_1E400();
    uint64_t v76 = sub_1C718(v51, v52, (uint64_t *)&v75);
    sub_1E4E0();
    swift_bridgeObjectRelease_n();
    uint64_t v53 = v74;
    swift_bridgeObjectRelease();
    *(_WORD *)(v50 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v76 = sub_1C718(v53, v49, (uint64_t *)&v75);
    sub_1E4E0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v50 + 22) = 2080;
    uint64_t v42 = v66;
    swift_bridgeObjectRetain();
    uint64_t v76 = sub_1C718(v42, v44, (uint64_t *)&v75);
    sub_1E4E0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, v47, v48, "TimeInterval.getTimeComponents: hours \"%s\", minutes \"%s\", seconds \"%s\"", (uint8_t *)v50, 0x20u);
    swift_arrayDestroy();
    unint64_t v19 = v73;
    swift_slowDealloc();
    unint64_t v29 = v49;
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  swift_beginAccess();
  if (!*((void *)&v78 + 1))
  {

    (*(void (**)(char *, uint64_t))(v69 + 8))(v19, v71);
    uint64_t v56 = *(void (**)(char *, uint64_t))(v70 + 8);
    uint64_t v57 = v72;
    v56(v67, v72);
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v56)(v68, v57);
LABEL_30:
    long long v61 = v78;
    goto LABEL_31;
  }
  uint64_t v54 = v42;
  if (v78 == __PAIR128__(0xE100000000000000, 48)) {
    char v55 = 1;
  }
  else {
    char v55 = sub_1E840();
  }
  swift_bridgeObjectRetain_n();

  (*(void (**)(char *, uint64_t))(v69 + 8))(v19, v71);
  uint64_t v59 = *(void (**)(char *, uint64_t))(v70 + 8);
  uint64_t v60 = v72;
  v59(v67, v72);
  v59(v68, v60);
  uint64_t result = swift_bridgeObjectRelease_n();
  uint64_t v42 = v54;
  if ((v55 & 1) == 0) {
    goto LABEL_30;
  }
  uint64_t result = swift_bridgeObjectRelease();
  long long v61 = 0uLL;
LABEL_31:
  unint64_t v62 = v64;
  *os_log_type_t v64 = v61;
  v62[2] = v74;
  v62[3] = v29;
  v62[4] = v42;
  v62[5] = v44;
  return result;
}

uint64_t sub_1B260(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_4F84(&qword_28318);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_1B2C8()
{
  unint64_t result = qword_28C78;
  if (!qword_28C78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_28C78);
  }
  return result;
}

void *sub_1B31C(uint64_t a1)
{
  uint64_t v2 = sub_1DB90();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v37 = (char *)&v30 - v7;
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    sub_4F84(&qword_28C88);
    uint64_t v9 = sub_1E540();
    uint64_t v10 = 0;
    unint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    id v35 = v12;
    uint64_t v36 = v9 + 56;
    uint64_t v13 = *(unsigned __int8 *)(v11 + 64);
    uint64_t v32 = v8;
    uint64_t v33 = a1 + ((v13 + 32) & ~v13);
    uint64_t v14 = *(void *)(v11 + 56);
    unint64_t v15 = (void (**)(char *, uint64_t))(v11 - 8);
    uint64_t v31 = (uint64_t (**)(unint64_t, char *, uint64_t))(v11 + 16);
    while (1)
    {
      uint64_t v34 = v10;
      v35(v37, v33 + v14 * v10, v2);
      sub_1B60C(&qword_28C90);
      uint64_t v16 = sub_1E3B0();
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
          sub_1B60C(&qword_28C98);
          char v23 = sub_1E3C0();
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
        id v25 = v37;
        *(void *)(v36 + 8 * v19) = v21 | v20;
        unint64_t result = (void *)(*v31)(*(void *)(v9 + 48) + v18 * v14, v25, v2);
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
        return (void *)v9;
      }
    }
  }
  return &_swiftEmptySetSingleton;
}

uint64_t sub_1B60C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1DB90();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1B650@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  uint64_t v20 = a17;
  uint64_t v19 = a18;
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_1E480();
    uint64_t v29 = (void *)sub_1DF50();
    sub_1DCF0();

    uint64_t v20 = a17;
    uint64_t v19 = a18;
  }
  sub_1DE00();
  *(_OWORD *)(a9 + 72) = v34;
  *(_OWORD *)(a9 + 88) = v35;
  *(_OWORD *)(a9 + 104) = v36;
  *(_OWORD *)(a9 + 120) = v37;
  *(_OWORD *)(a9 + 24) = v31;
  *(_OWORD *)(a9 + 40) = v32;
  *(void *)a9 = a16;
  *(void *)(a9 + 8) = v20;
  *(void *)(a9 + 16) = v19;
  *(_OWORD *)(a9 + 56) = v33;
  swift_retain();
  swift_retain();

  return swift_retain();
}

__n128 sub_1B838@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_1E480();
    char v23 = (void *)sub_1DF50();
    sub_1DCF0();
  }
  sub_1DE00();
  sub_111E4(v13, a9, &qword_28CC0);
  unint64_t v24 = (_OWORD *)(a9 + *(int *)(sub_4F84(&qword_28CC8) + 36));
  v24[4] = v30;
  v24[5] = v31;
  v24[6] = v32;
  *unint64_t v24 = v26;
  v24[1] = v27;
  __n128 result = v29;
  void v24[2] = v28;
  v24[3] = v29;
  return result;
}

uint64_t sub_1B9F8()
{
  uint64_t v0 = sub_1DD20();
  sub_4DF0(v0, qword_28CA0);
  sub_4D88(v0, (uint64_t)qword_28CA0);
  return sub_1DD10();
}

uint64_t sub_1BA70()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_4F84(&qword_28CC0);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_4F84(&qword_28CC8);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_4F84(&qword_28CD0);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v4 = sub_1DEF0();
  *((void *)v4 + 1) = 0;
  v4[16] = 1;
  uint64_t v11 = sub_4F84(&qword_28CD8);
  sub_1BD40((long long *)v1, (uint64_t)&v4[*(int *)(v11 + 44)]);
  sub_1E290();
  sub_1B838(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v7, 0.0, 1, 0.0, 1);
  sub_6528((uint64_t)v4, &qword_28CC0);
  uint64_t v22 = *(void *)(v1 + 48);
  uint64_t v12 = v22;
  uint64_t v13 = (uint64_t (*)(uint64_t))swift_allocObject();
  long long v14 = *(_OWORD *)(v1 + 16);
  *((_OWORD *)v13 + 1) = *(_OWORD *)v1;
  *((_OWORD *)v13 + 2) = v14;
  long long v15 = *(_OWORD *)(v1 + 48);
  *((_OWORD *)v13 + 3) = *(_OWORD *)(v1 + 32);
  *((_OWORD *)v13 + 4) = v15;
  sub_111E4((uint64_t)v7, (uint64_t)v10, &qword_28CC8);
  *(void *)&v10[*(int *)(v8 + 52)] = v12;
  uint64_t v16 = (uint64_t (**)(uint64_t))&v10[*(int *)(v8 + 56)];
  char *v16 = sub_1D770;
  v16[1] = v13;
  sub_13ADC((uint64_t)&v22);
  sub_1D778(v1);
  sub_6528((uint64_t)v7, &qword_28CC8);
  uint64_t v17 = (_OWORD *)swift_allocObject();
  long long v18 = *(_OWORD *)(v1 + 16);
  v17[1] = *(_OWORD *)v1;
  v17[2] = v18;
  long long v19 = *(_OWORD *)(v1 + 48);
  v17[3] = *(_OWORD *)(v1 + 32);
  v17[4] = v19;
  sub_1D778(v1);
  sub_7BA8(&qword_28CE0, &qword_28CD0);
  sub_1E100();
  swift_release();
  return sub_6528((uint64_t)v10, &qword_28CD0);
}

uint64_t sub_1BD40@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)&long long v77 = a2;
  uint64_t v3 = sub_4F84(&qword_28C38);
  __chkstk_darwin(v3 - 8);
  long long v81 = &v67[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_4F84(&qword_28CF0);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  long long v80 = &v67[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v6);
  uint64_t v9 = &v67[-v8];
  uint64_t v10 = sub_4F84(&qword_28CF8);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = &v67[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  long long v78 = v12;
  uint64_t v13 = sub_1DBD0();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = &v67[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v17 = sub_1DBF0();
  __chkstk_darwin(v17 - 8);
  uint64_t KeyPath = &v67[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v19 = sub_1E2F0();
  uint64_t v75 = *(void *)(v19 - 8);
  uint64_t v76 = v19;
  uint64_t v20 = __chkstk_darwin(v19);
  char v82 = &v67[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v20);
  char v23 = &v67[-v22];
  uint64_t v24 = *((void *)a1 + 4);
  void *v16 = *((void *)a1 + 3);
  v16[1] = v24;
  (*(void (**)(void *, void, uint64_t))(v14 + 104))(v16, enum case for SashStandard.Title.applicationBundleIdentifier(_:), v13);
  uint64_t v25 = sub_1DC20();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v12, 1, 1, v25);
  uint64_t v26 = sub_1DC30();
  long long v27 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56);
  v27(v9, 1, 1, v26);
  v27(v80, 1, 1, v26);
  unint64_t v104 = 0;
  long long v102 = 0u;
  long long v103 = 0u;
  swift_bridgeObjectRetain();
  sub_1DBE0();
  long long v28 = v23;
  sub_1E2E0();
  long long v102 = *a1;
  *(void *)&long long v103 = *((void *)a1 + 2);
  sub_4F84(&qword_28CE8);
  sub_1E210();
  uint64_t v29 = sub_1DFA0();
  uint64_t v30 = (uint64_t)v81;
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v81, 1, 1, v29);
  sub_1DFD0();
  sub_6528(v30, &qword_28C38);
  sub_1DFC0();
  sub_1DFE0();
  swift_release();
  sub_1DF90();
  swift_release();
  uint64_t v31 = sub_1E060();
  long long v80 = v32;
  long long v81 = (unsigned char *)v31;
  char v34 = v33;
  uint64_t v74 = v35;
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t KeyPath = (unsigned char *)swift_getKeyPath();
  uint64_t v73 = swift_getKeyPath();
  LOBYTE(v24) = sub_1DF70();
  char v36 = sub_1DF80();
  sub_1DF80();
  if (sub_1DF80() != v24) {
    char v36 = sub_1DF80();
  }
  sub_1DD60();
  uint64_t v38 = v37;
  uint64_t v40 = v39;
  uint64_t v42 = v41;
  uint64_t v44 = v43;
  unsigned __int8 v89 = v34 & 1;
  unsigned __int8 v88 = 0;
  unsigned __int8 v87 = 0;
  uint64_t v71 = sub_1E160();
  int v45 = sub_1DF60();
  unsigned __int8 v46 = v89;
  int v69 = v89;
  int v70 = v45;
  unsigned __int8 v47 = v88;
  int v68 = v88;
  LODWORD(v78) = v87;
  uint64_t v49 = v75;
  uint64_t v48 = v76;
  uint64_t v50 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v75 + 16);
  uint64_t v51 = v82;
  uint64_t v72 = v28;
  v50(v82, v28, v76);
  v86[0] = *(_DWORD *)v93;
  *(_DWORD *)((char *)v86 + 3) = *(_DWORD *)&v93[3];
  v85[0] = *(_DWORD *)v92;
  *(_DWORD *)((char *)v85 + 3) = *(_DWORD *)&v92[3];
  v84[0] = *(_DWORD *)v91;
  *(_DWORD *)((char *)v84 + 3) = *(_DWORD *)&v91[3];
  *(_DWORD *)((char *)v83 + 3) = *(_DWORD *)&v90[3];
  v83[0] = *(_DWORD *)v90;
  uint64_t v52 = v77;
  v50((unsigned char *)v77, v51, v48);
  uint64_t v53 = (_OWORD *)(v52 + *(int *)(sub_4F84((uint64_t *)&unk_28D00) + 48));
  *(void *)&long long v94 = v81;
  *((void *)&v94 + 1) = v80;
  LOBYTE(v95) = v46;
  *(_DWORD *)((char *)&v95 + 1) = v86[0];
  DWORD1(v95) = *(_DWORD *)((char *)v86 + 3);
  uint64_t v54 = v73;
  uint64_t v55 = v74;
  char v56 = v36;
  *((void *)&v95 + 1) = v74;
  *(void *)&long long v96 = KeyPath;
  *((void *)&v96 + 1) = 1;
  LOBYTE(v97) = v47;
  *(_DWORD *)((char *)&v97 + 1) = v85[0];
  DWORD1(v97) = *(_DWORD *)((char *)v85 + 3);
  *((void *)&v97 + 1) = v73;
  long long v77 = xmmword_20000;
  long long v98 = xmmword_20000;
  LOBYTE(v99) = v36;
  DWORD1(v99) = *(_DWORD *)((char *)v84 + 3);
  *(_DWORD *)((char *)&v99 + 1) = v84[0];
  *((void *)&v99 + 1) = v38;
  *(void *)&long long v100 = v40;
  *((void *)&v100 + 1) = v42;
  *(void *)&v101[0] = v44;
  BYTE8(v101[0]) = (_BYTE)v78;
  HIDWORD(v101[0]) = *(_DWORD *)((char *)v83 + 3);
  *(_DWORD *)((char *)v101 + 9) = v83[0];
  uint64_t v57 = v71;
  *(void *)&v101[1] = v71;
  char v58 = v70;
  BYTE8(v101[1]) = v70;
  long long v59 = v94;
  long long v60 = v95;
  long long v61 = v97;
  v53[2] = v96;
  v53[3] = v61;
  *uint64_t v53 = v59;
  v53[1] = v60;
  long long v62 = v98;
  long long v63 = v99;
  *(_OWORD *)((char *)v53 + 121) = *(_OWORD *)((char *)v101 + 9);
  long long v64 = v101[0];
  v53[6] = v100;
  v53[7] = v64;
  v53[4] = v62;
  v53[5] = v63;
  sub_1D920((uint64_t)&v94);
  uint64_t v65 = *(void (**)(unsigned char *, uint64_t))(v49 + 8);
  v65(v72, v48);
  *(void *)&long long v102 = v81;
  *((void *)&v102 + 1) = v80;
  LOBYTE(v103) = v69;
  *(_DWORD *)((char *)&v103 + 1) = v86[0];
  DWORD1(v103) = *(_DWORD *)((char *)v86 + 3);
  *((void *)&v103 + 1) = v55;
  unint64_t v104 = KeyPath;
  uint64_t v105 = 1;
  char v106 = v68;
  *(_DWORD *)uint64_t v107 = v85[0];
  *(_DWORD *)&v107[3] = *(_DWORD *)((char *)v85 + 3);
  uint64_t v108 = v54;
  long long v109 = v77;
  char v110 = v56;
  *(_DWORD *)&v111[3] = *(_DWORD *)((char *)v84 + 3);
  *(_DWORD *)char v111 = v84[0];
  uint64_t v112 = v38;
  uint64_t v113 = v40;
  uint64_t v114 = v42;
  uint64_t v115 = v44;
  char v116 = (char)v78;
  *(_DWORD *)&v117[3] = *(_DWORD *)((char *)v83 + 3);
  *(_DWORD *)uint64_t v117 = v83[0];
  uint64_t v118 = v57;
  char v119 = v58;
  sub_1D990((uint64_t)&v102);
  return ((uint64_t (*)(unsigned char *, uint64_t))v65)(v82, v48);
}

uint64_t sub_1C504(uint64_t a1, uint64_t a2)
{
  return sub_1E220();
}

void sub_1C564()
{
  id v0 = [self serviceWithDefaultShellEndpoint];
  if (v0)
  {
    id v1 = v0;
    NSString v2 = sub_1E3D0();
    oslog = [objc_allocWithZone((Class)FBSOpenApplicationOptions) init];
    objc_msgSend(v1, "openApplication:withOptions:completion:", v2);
  }
  else
  {
    if (qword_281B8 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_1DD20();
    sub_4D88(v3, (uint64_t)qword_28CA0);
    oslog = sub_1DD00();
    os_log_type_t v4 = sub_1E470();
    if (os_log_type_enabled(oslog, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_0, oslog, v4, "TimerDurationViewLegacy: Failed to launch clock app!", v5, 2u);
      swift_slowDealloc();
    }
  }
}

uint64_t sub_1C6DC()
{
  return sub_1BA70();
}

uint64_t sub_1C718(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1C7EC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_6478((uint64_t)v12, *a3);
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
      sub_6478((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1113C((uint64_t)v12);
  return v7;
}

uint64_t sub_1C7EC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1E4F0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1C9A8(a5, a6);
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
  uint64_t v8 = sub_1E590();
  if (!v8)
  {
    sub_1E5A0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1E5F0();
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

uint64_t sub_1C9A8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1CA40(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1CC20(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1CC20(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1CA40(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1CBB8(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1E550();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_1E5A0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1E420();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_1E5F0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_1E5A0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_1CBB8(uint64_t a1, uint64_t a2)
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
  sub_4F84(&qword_28CB8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1CC20(char a1, int64_t a2, char a3, char *a4)
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
    sub_4F84(&qword_28CB8);
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
  uint64_t result = sub_1E5F0();
  __break(1u);
  return result;
}

void sub_1CD70(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    if ([v1 state] != (char *)&dword_0 + 1) {
      [v1 remainingTime];
    }
    if (qword_281B8 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_1DD20();
    sub_4D88(v2, (uint64_t)qword_28CA0);
    unint64_t v3 = sub_1DD00();
    os_log_type_t v4 = sub_1E490();
    if (os_log_type_enabled(v3, v4))
    {
      size_t v5 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)size_t v5 = 134217984;
      sub_1E4E0();
      _os_log_impl(&dword_0, v3, v4, "TimerDurationViewLegacy: timeRemaining %f", v5, 0xCu);
      swift_slowDealloc();
    }

    sub_19DA8();
  }
  else
  {
    if (qword_281B8 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_1DD20();
    sub_4D88(v6, (uint64_t)qword_28CA0);
    int64_t v7 = sub_1DD00();
    os_log_type_t v8 = sub_1E470();
    if (os_log_type_enabled(v7, v8))
    {
      int64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int64_t v9 = 0;
      _os_log_impl(&dword_0, v7, v8, "TimerUIPlugin (Legacy): MTTimer missing in call for durationString(for:)", v9, 2u);
      swift_slowDealloc();
    }

    sub_19DA8();
  }
}

double sub_1CFC0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_4F84(&qword_28308);
  __chkstk_darwin(v6 - 8);
  uint64_t v38 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19DA8();
  uint64_t v39 = v8;
  uint64_t v40 = v9;
  sub_1E200();
  uint64_t v10 = v42;
  uint64_t v37 = *((void *)&v41 + 1);
  id v11 = [objc_allocWithZone((Class)MTTimerManager) init];
  id v12 = [v11 getCurrentTimerSync];
  uint64_t v13 = v12;
  if (v12) {
    [v12 remainingTime];
  }
  if (qword_281B8 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_1DD20();
  sub_4D88(v14, (uint64_t)qword_28CA0);
  uint64_t v15 = sub_1DD00();
  os_log_type_t v16 = sub_1E490();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v34 = v10;
    uint64_t v18 = (uint8_t *)v17;
    *(void *)&long long v41 = swift_slowAlloc();
    uint64_t v35 = v13;
    *(void *)&long long v36 = a3;
    *(_DWORD *)uint64_t v18 = 136315138;
    uint64_t v19 = sub_1E440();
    uint64_t v39 = sub_1C718(v19, v20, (uint64_t *)&v41);
    uint64_t v13 = v35;
    a3 = v36;
    sub_1E4E0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v15, v16, "TimerDurationViewLegacy: Timer initial remaining time: %s", v18, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  id v21 = v13;
  sub_1CD70(v13);
  uint64_t v23 = v22;
  uint64_t v25 = v24;

  uint64_t v39 = v23;
  uint64_t v40 = v25;
  sub_1E200();
  long long v36 = v41;
  uint64_t v26 = v42;
  swift_bridgeObjectRelease();
  swift_release();
  id v27 = [self mainRunLoop];
  sub_1D3E0();
  uint64_t v28 = sub_1E4C0();
  uint64_t v29 = (uint64_t)v38;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v38, 1, 1, v28);
  uint64_t v30 = sub_1E4B0();
  sub_6528(v29, &qword_28308);
  *(void *)&long long v41 = v30;
  sub_1E4A0();
  sub_1D420();
  uint64_t v31 = sub_1DD30();
  swift_release();
  *(void *)&long long v41 = v31;
  sub_4F84(&qword_28330);
  sub_7BA8(&qword_28338, &qword_28330);
  uint64_t v32 = sub_1DD40();
  swift_release();

  double result = *(double *)&v36;
  *(_OWORD *)a3 = v36;
  *(void *)(a3 + 16) = v26;
  *(void *)(a3 + 24) = a1;
  *(void *)(a3 + 32) = a2;
  *(void *)(a3 + 40) = v11;
  *(void *)(a3 + 48) = v32;
  *(void *)(a3 + 56) = v13;
  return result;
}

unint64_t sub_1D3E0()
{
  unint64_t result = qword_28320;
  if (!qword_28320)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_28320);
  }
  return result;
}

unint64_t sub_1D420()
{
  unint64_t result = qword_28328;
  if (!qword_28328)
  {
    sub_1E4A0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_28328);
  }
  return result;
}

void destroy for TimerDurationViewLegacy(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  swift_release();
  uint64_t v2 = *(void **)(a1 + 56);
}

void *initializeWithCopy for TimerDurationViewLegacy(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  size_t v5 = (void *)a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  uint64_t v6 = (void *)a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  id v7 = v5;
  swift_retain();
  id v8 = v6;
  return a1;
}

void *assignWithCopy for TimerDurationViewLegacy(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)a2[5];
  size_t v5 = (void *)a1[5];
  a1[5] = v4;
  id v6 = v4;

  a1[6] = a2[6];
  swift_retain();
  swift_release();
  id v7 = (void *)a1[7];
  id v8 = (void *)a2[7];
  a1[7] = v8;
  id v9 = v8;

  return a1;
}

__n128 initializeWithTake for TimerDurationViewLegacy(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for TimerDurationViewLegacy(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  long long v4 = *(void **)(a1 + 40);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);

  swift_release();
  size_t v5 = *(void **)(a1 + 56);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);

  return a1;
}

uint64_t getEnumTagSinglePayload for TimerDurationViewLegacy(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TimerDurationViewLegacy(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
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
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TimerDurationViewLegacy()
{
  return &type metadata for TimerDurationViewLegacy;
}

uint64_t sub_1D750()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1D770(uint64_t a1)
{
  return sub_1C504(a1, v1 + 16);
}

uint64_t sub_1D778(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 40);
  id v3 = *(id *)(a1 + 56);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  id v4 = v2;
  swift_retain();
  return a1;
}

uint64_t sub_1D7E4()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  swift_release();

  return _swift_deallocObject(v0, 80, 7);
}

void sub_1D844()
{
}

uint64_t sub_1D868@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_1DEB0();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_1D89C()
{
  return sub_1DEC0();
}

uint64_t sub_1D8CC@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_1DE90();
  *a1 = v3;
  return result;
}

uint64_t sub_1D8F8()
{
  return sub_1DEA0();
}

uint64_t sub_1D920(uint64_t a1)
{
  return a1;
}

uint64_t sub_1D990(uint64_t a1)
{
  return a1;
}

uint64_t sub_1DA00()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1DA80()
{
  return static CharacterSet.letters.getter();
}

uint64_t sub_1DA90()
{
  return type metadata accessor for CharacterSet();
}

uint64_t sub_1DAA0()
{
  return DateComponents.hour.getter();
}

uint64_t sub_1DAB0()
{
  return DateComponents.minute.getter();
}

uint64_t sub_1DAC0()
{
  return DateComponents.second.getter();
}

uint64_t sub_1DAD0()
{
  return type metadata accessor for DateComponents();
}

uint64_t sub_1DAE0()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_1DAF0()
{
  return URL.absoluteString.getter();
}

uint64_t sub_1DB00()
{
  return type metadata accessor for URL();
}

uint64_t sub_1DB10()
{
  return Date.addingTimeInterval(_:)();
}

uint64_t sub_1DB20()
{
  return Date.init()();
}

uint64_t sub_1DB30()
{
  return type metadata accessor for Date();
}

NSLocale sub_1DB40()
{
  return Locale._bridgeToObjectiveC()();
}

uint64_t sub_1DB50()
{
  return static Locale.current.getter();
}

uint64_t sub_1DB60()
{
  return type metadata accessor for Locale();
}

uint64_t sub_1DB70()
{
  return Calendar.dateComponents(_:from:to:)();
}

uint64_t sub_1DB80()
{
  return static Calendar.current.getter();
}

uint64_t sub_1DB90()
{
  return type metadata accessor for Calendar.Component();
}

uint64_t sub_1DBA0()
{
  return type metadata accessor for Calendar();
}

uint64_t sub_1DBB0()
{
  return AppPunchout.init(punchOutUri:bundleId:appDisplayName:)();
}

uint64_t sub_1DBC0()
{
  return type metadata accessor for AppPunchout();
}

uint64_t sub_1DBD0()
{
  return type metadata accessor for SashStandard.Title();
}

uint64_t sub_1DBE0()
{
  return SashStandard.init(title:thumbnail:titleColor:backgroundColor:action:componentName:showOnWatch:)();
}

uint64_t sub_1DBF0()
{
  return type metadata accessor for SashStandard();
}

uint64_t sub_1DC00()
{
  return static RFFeatureFlags.ResponseFramework.SMART.getter();
}

uint64_t sub_1DC10()
{
  return type metadata accessor for SeparatorStyle();
}

uint64_t sub_1DC20()
{
  return type metadata accessor for VisualProperty();
}

uint64_t sub_1DC30()
{
  return type metadata accessor for Color();
}

uint64_t sub_1DC40()
{
  return Loggable.init(wrappedValue:)();
}

uint64_t sub_1DC50()
{
  return Loggable.wrappedValue.modify();
}

uint64_t sub_1DC60()
{
  return Loggable.wrappedValue.getter();
}

uint64_t sub_1DC70()
{
  return Loggable.wrappedValue.setter();
}

uint64_t sub_1DC80()
{
  return type metadata accessor for Loggable();
}

uint64_t sub_1DC90()
{
  return Parse.DirectInvocation.identifier.getter();
}

uint64_t sub_1DCA0()
{
  return Parse.DirectInvocation.userData.getter();
}

uint64_t sub_1DCB0()
{
  return type metadata accessor for Parse.DirectInvocation();
}

uint64_t sub_1DCC0()
{
  return static DeviceIdiom.== infix(_:_:)();
}

uint64_t sub_1DCD0()
{
  return type metadata accessor for DeviceIdiom();
}

uint64_t sub_1DCE0()
{
  return SiriTimerState.init(rawValue:)();
}

uint64_t sub_1DCF0()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_1DD00()
{
  return Logger.logObject.getter();
}

uint64_t sub_1DD10()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_1DD20()
{
  return type metadata accessor for Logger();
}

uint64_t sub_1DD30()
{
  return ConnectablePublisher.autoconnect()();
}

uint64_t sub_1DD40()
{
  return Publisher.eraseToAnyPublisher()();
}

uint64_t sub_1DD50()
{
  return static Animatable._makeAnimatable(value:inputs:)();
}

uint64_t sub_1DD60()
{
  return EdgeInsets.init(_all:)();
}

uint64_t sub_1DD70()
{
  return type metadata accessor for ColorScheme();
}

uint64_t sub_1DD80()
{
  return StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)();
}

uint64_t sub_1DD90()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t sub_1DDA0()
{
  return GeometryProxy.size.getter();
}

uint64_t sub_1DDB0()
{
  return type metadata accessor for DynamicTypeSize();
}

uint64_t sub_1DDC0()
{
  return type metadata accessor for LayoutDirection();
}

uint64_t sub_1DDD0()
{
  return PlainButtonStyle.init()();
}

uint64_t sub_1DDE0()
{
  return type metadata accessor for PlainButtonStyle();
}

uint64_t sub_1DDF0()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t sub_1DE00()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t sub_1DE10()
{
  return EnvironmentObject.error()();
}

uint64_t sub_1DE20()
{
  return EnvironmentObject.init()();
}

uint64_t sub_1DE30()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_1DE40()
{
  return EnvironmentValues.colorScheme.setter();
}

uint64_t sub_1DE50()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t sub_1DE60()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t sub_1DE70()
{
  return EnvironmentValues.layoutDirection.getter();
}

uint64_t sub_1DE80()
{
  return EnvironmentValues.layoutDirection.setter();
}

uint64_t sub_1DE90()
{
  return EnvironmentValues.minimumScaleFactor.getter();
}

uint64_t sub_1DEA0()
{
  return EnvironmentValues.minimumScaleFactor.setter();
}

uint64_t sub_1DEB0()
{
  return EnvironmentValues.lineLimit.getter();
}

uint64_t sub_1DEC0()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t sub_1DED0()
{
  return static VerticalAlignment.center.getter();
}

uint64_t sub_1DEE0()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t sub_1DEF0()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t sub_1DF00()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t sub_1DF10()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_1DF20()
{
  return static HierarchicalShapeStyle.primary.getter();
}

uint64_t sub_1DF30()
{
  return static HierarchicalShapeStyle.tertiary.getter();
}

uint64_t sub_1DF40()
{
  return static HierarchicalShapeStyle.secondary.getter();
}

uint64_t sub_1DF50()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_1DF60()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_1DF70()
{
  return static Edge.Set.bottom.getter();
}

uint64_t sub_1DF80()
{
  return Edge.Set.init(rawValue:)();
}

uint64_t sub_1DF90()
{
  return Font.monospacedDigit()();
}

uint64_t sub_1DFA0()
{
  return type metadata accessor for Font.Design();
}

uint64_t sub_1DFB0()
{
  return static Font.Weight.light.getter();
}

uint64_t sub_1DFC0()
{
  return static Font.Weight.regular.getter();
}

uint64_t sub_1DFD0()
{
  return static Font.system(size:weight:design:)();
}

uint64_t sub_1DFE0()
{
  return Font.weight(_:)();
}

uint64_t sub_1DFF0()
{
  return static Font.footnote.getter();
}

uint64_t sub_1E000()
{
  return Path.strokedPath(_:)();
}

uint64_t sub_1E010()
{
  return Path.addArc(center:radius:startAngle:endAngle:clockwise:transform:)();
}

uint64_t sub_1E020()
{
  return Path.init()();
}

uint64_t sub_1E030()
{
  return Text.fontWeight(_:)();
}

uint64_t sub_1E040()
{
  return Text.foregroundColor(_:)();
}

uint64_t sub_1E050()
{
  return Text.foregroundStyle<A>(_:)();
}

uint64_t sub_1E060()
{
  return Text.font(_:)();
}

uint64_t sub_1E070()
{
  return Text.init<A>(_:)();
}

uint64_t sub_1E080()
{
  return View.eraseToAnyView()();
}

uint64_t sub_1E090()
{
  return View.separators(_:isOverride:)();
}

uint64_t sub_1E0A0()
{
  return View.componentTapped(isNavigation:perform:)();
}

uint64_t sub_1E0B0()
{
  return View.setHostBackground(_:)();
}

uint64_t sub_1E0C0()
{
  return View.lastComponentBottomSpacing(_:)();
}

uint64_t sub_1E0D0()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_1E0E0()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_1E0F0()
{
  return View.buttonStyle<A>(_:)();
}

uint64_t sub_1E100()
{
  return View.onTapGesture(count:perform:)();
}

uint64_t sub_1E110()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_1E120()
{
  return View.dynamicTypeSize<A>(_:)();
}

uint64_t sub_1E130()
{
  return Color.init(uiColor:)();
}

uint64_t sub_1E140()
{
  return static Color.gray.getter();
}

uint64_t sub_1E150()
{
  return static Color.black.getter();
}

uint64_t sub_1E160()
{
  return static Color.clear.getter();
}

uint64_t sub_1E170()
{
  return static Color.white.getter();
}

uint64_t sub_1E180()
{
  return static Color.orange.getter();
}

uint64_t sub_1E190()
{
  return Image.init(systemName:)();
}

uint64_t sub_1E1C0()
{
  return Shape.layoutDirectionBehavior.getter();
}

uint64_t sub_1E1E0()
{
  return static Shape.role.getter();
}

uint64_t sub_1E200()
{
  return State.init(wrappedValue:)();
}

uint64_t sub_1E210()
{
  return State.wrappedValue.getter();
}

uint64_t sub_1E220()
{
  return State.wrappedValue.setter();
}

uint64_t sub_1E230()
{
  return State.projectedValue.getter();
}

uint64_t sub_1E240()
{
  return Button.init(action:label:)();
}

uint64_t sub_1E250()
{
  return AnyView.init<A>(_:)();
}

uint64_t sub_1E260()
{
  return Binding.wrappedValue.getter();
}

uint64_t sub_1E270()
{
  return Binding.wrappedValue.setter();
}

uint64_t sub_1E280()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t sub_1E290()
{
  return static Alignment.center.getter();
}

uint64_t sub_1E2A0()
{
  return static Animation.linear(duration:)();
}

uint64_t sub_1E2B0()
{
  return static UnitPoint.center.getter();
}

uint64_t sub_1E2C0()
{
  return ComponentStack.init(content:)();
}

uint64_t sub_1E2D0()
{
  return type metadata accessor for HostBackground();
}

uint64_t sub_1E2E0()
{
  return SashStandardView.init(model:)();
}

uint64_t sub_1E2F0()
{
  return type metadata accessor for SashStandardView();
}

uint64_t sub_1E300()
{
  return SashStandardView.init(_:titleColor:showOnWatch:)();
}

uint64_t sub_1E310()
{
  return DisambiguationView.init(title:content:)();
}

uint64_t sub_1E320()
{
  return DisambiguationTitle.init(text1:thumbnail:)();
}

uint64_t sub_1E330()
{
  return type metadata accessor for DisambiguationTitle();
}

uint64_t sub_1E340()
{
  return FactItemHeroNumberView.init(number:text1:text2:text3:text4:text5:)();
}

uint64_t sub_1E350()
{
  return type metadata accessor for FactItemHeroNumberView();
}

uint64_t sub_1E360()
{
  return type metadata accessor for ComponentStackBottomSpacing();
}

uint64_t sub_1E370()
{
  return dispatch thunk of Context.perform(appPunchout:)();
}

uint64_t sub_1E380()
{
  return dispatch thunk of Context.perform(directInvocation:payload:)();
}

uint64_t sub_1E390()
{
  return type metadata accessor for Context();
}

uint64_t sub_1E3A0()
{
  return Dictionary.description.getter();
}

uint64_t sub_1E3B0()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_1E3C0()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_1E3D0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_1E3E0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1E3F0()
{
  return String.init(format:_:)();
}

uint64_t sub_1E400()
{
  return String.init<A>(describing:)();
}

uint64_t sub_1E410()
{
  return String.hash(into:)();
}

Swift::Int sub_1E420()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_1E430()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1E440()
{
  return Double.description.getter();
}

NSNumber sub_1E450()
{
  return Int._bridgeToObjectiveC()();
}

uint64_t sub_1E460()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_1E470()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_1E480()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_1E490()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_1E4A0()
{
  return type metadata accessor for NSTimer.TimerPublisher();
}

uint64_t sub_1E4B0()
{
  return static NSTimer.publish(every:tolerance:on:in:options:)();
}

uint64_t sub_1E4C0()
{
  return type metadata accessor for NSRunLoop.SchedulerOptions();
}

uint64_t sub_1E4D0()
{
  return type metadata accessor for Optional();
}

uint64_t sub_1E4E0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_1E4F0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_1E500()
{
  return StringProtocol.trimmingCharacters(in:)();
}

uint64_t sub_1E510()
{
  return StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
}

uint64_t sub_1E520()
{
  return _bridgeAnyObjectToAny(_:)();
}

Swift::Int sub_1E530(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_1E540()
{
  return static _SetStorage.allocate(capacity:)();
}

uint64_t sub_1E550()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_1E560()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_1E570()
{
  return DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
}

uint64_t sub_1E580()
{
  return type metadata accessor for DecodingError();
}

uint64_t sub_1E590()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_1E5A0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1E5B0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_1E5C0()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_1E5D0()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_1E5E0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_1E5F0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_1E600(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_1E610()
{
  return KeyedDecodingContainer.nestedUnkeyedContainer(forKey:)();
}

uint64_t sub_1E620()
{
  return KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t sub_1E630()
{
  return KeyedDecodingContainer.codingPath.getter();
}

uint64_t sub_1E640()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t sub_1E650()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t sub_1E660()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t sub_1E670()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t sub_1E680()
{
  return KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
}

uint64_t sub_1E690()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t sub_1E6A0()
{
  return KeyedDecodingContainer.allKeys.getter();
}

uint64_t sub_1E6B0()
{
  return KeyedDecodingContainer.decodeNil(forKey:)();
}

uint64_t sub_1E6C0()
{
  return KeyedEncodingContainer.nestedUnkeyedContainer(forKey:)();
}

uint64_t sub_1E6D0()
{
  return KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t sub_1E6E0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_1E6F0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_1E700()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_1E710()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_1E720()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t sub_1E730()
{
  return KeyedEncodingContainer.encodeNil(forKey:)();
}

uint64_t sub_1E740()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_1E750()
{
  return dispatch thunk of UnkeyedDecodingContainer.nestedContainer<A>(keyedBy:)();
}

uint64_t sub_1E760()
{
  return dispatch thunk of UnkeyedDecodingContainer.nestedUnkeyedContainer()();
}

uint64_t sub_1E770()
{
  return dispatch thunk of UnkeyedDecodingContainer.decodeIfPresent(_:)();
}

uint64_t sub_1E780()
{
  return dispatch thunk of UnkeyedDecodingContainer.decodeIfPresent(_:)();
}

uint64_t sub_1E790()
{
  return dispatch thunk of UnkeyedDecodingContainer.decodeIfPresent(_:)();
}

uint64_t sub_1E7A0()
{
  return dispatch thunk of UnkeyedDecodingContainer.decodeIfPresent(_:)();
}

uint64_t sub_1E7B0()
{
  return dispatch thunk of UnkeyedDecodingContainer.isAtEnd.getter();
}

uint64_t sub_1E7C0()
{
  return dispatch thunk of UnkeyedDecodingContainer.decodeNil()();
}

uint64_t sub_1E7D0()
{
  return dispatch thunk of UnkeyedEncodingContainer.nestedContainer<A>(keyedBy:)();
}

uint64_t sub_1E7E0()
{
  return dispatch thunk of UnkeyedEncodingContainer.nestedUnkeyedContainer()();
}

uint64_t sub_1E7F0()
{
  return dispatch thunk of UnkeyedEncodingContainer.encode(_:)();
}

uint64_t sub_1E800()
{
  return dispatch thunk of UnkeyedEncodingContainer.encode(_:)();
}

uint64_t sub_1E810()
{
  return dispatch thunk of UnkeyedEncodingContainer.encode(_:)();
}

uint64_t sub_1E820()
{
  return dispatch thunk of UnkeyedEncodingContainer.encode(_:)();
}

uint64_t sub_1E830()
{
  return dispatch thunk of UnkeyedEncodingContainer.encodeNil()();
}

uint64_t sub_1E840()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_1E850()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_1E860()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_1E870()
{
  return Error._code.getter();
}

uint64_t sub_1E880()
{
  return Error._domain.getter();
}

uint64_t sub_1E890()
{
  return Error._userInfo.getter();
}

uint64_t sub_1E8A0()
{
  return Hasher.init(_seed:)();
}

void sub_1E8B0(Swift::UInt a1)
{
}

Swift::Int sub_1E8C0()
{
  return Hasher._finalize()();
}

uint64_t sub_1E8D0()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_1E8E0()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

CFStringRef CFDateFormatterCreateDateFormatFromTemplate(CFAllocatorRef allocator, CFStringRef tmplate, CFOptionFlags options, CFLocaleRef locale)
{
  return _CFDateFormatterCreateDateFormatFromTemplate(allocator, tmplate, options, locale);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
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

void bzero(void *a1, size_t a2)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
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

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return _swift_initEnumMetadataMultiPayload();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_makeBoxUnique()
{
  return _swift_makeBoxUnique();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}