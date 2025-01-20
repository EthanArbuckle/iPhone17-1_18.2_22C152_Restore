uint64_t sub_1000A5648()
{
  id *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t vars8;

  swift_release();
  swift_bridgeObjectRelease();
  sub_10006E1FC((uint64_t)v0 + OBJC_IVAR____TtC7NewsTag21EngagementURLProvider_sharedDirectoryFileUrl);
  v1 = *((unsigned int *)*v0 + 12);
  v2 = *((unsigned __int16 *)*v0 + 26);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_1000A56CC()
{
  return type metadata accessor for EngagementURLProvider();
}

uint64_t type metadata accessor for EngagementURLProvider()
{
  uint64_t result = qword_100111A40;
  if (!qword_100111A40) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1000A5720()
{
  sub_100043F5C();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

unint64_t sub_1000A57DC()
{
  unint64_t result = qword_100111C60;
  if (!qword_100111C60)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100111C60);
  }
  return result;
}

unint64_t sub_1000A581C()
{
  unint64_t result = qword_100111370;
  if (!qword_100111370)
  {
    sub_1000CABE0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100111370);
  }
  return result;
}

uint64_t sub_1000A5874(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6)
{
  uint64_t v22 = a3;
  uint64_t v23 = a1;
  uint64_t v10 = type metadata accessor for ContentServiceRequest();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  __chkstk_darwin(v10);
  sub_10001D64C((uint64_t *)&unk_10010E840);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_1000D37C0;
  uint64_t v24 = 0;
  unint64_t v25 = 0xE000000000000000;
  sub_1000CC820();
  uint64_t v14 = v24;
  unint64_t v15 = v25;
  *(void *)(v13 + 56) = &type metadata for String;
  *(void *)(v13 + 64) = sub_1000225F0();
  *(void *)(v13 + 32) = v14;
  *(void *)(v13 + 40) = v15;
  sub_100036814(0, (unint64_t *)&qword_100110C20);
  v16 = (void *)sub_1000CC630();
  sub_1000CC530();
  sub_1000CB230();
  swift_bridgeObjectRelease();

  sub_100020110((void *)(a6 + 32), *(void *)(a6 + 56));
  uint64_t v17 = *a5;
  sub_1000AD2F4((uint64_t)a5, (uint64_t)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for ContentServiceRequest);
  unint64_t v18 = (*(unsigned __int8 *)(v11 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v19 = (void *)swift_allocObject();
  v19[2] = v22;
  v19[3] = a4;
  v19[4] = a6;
  sub_1000AD35C((uint64_t)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t)v19 + v18, (uint64_t (*)(void))type metadata accessor for ContentServiceRequest);
  v20 = (void *)((char *)v19 + ((v12 + v18 + 7) & 0xFFFFFFFFFFFFFFF8));
  void *v20 = v23;
  v20[1] = a2;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1000B3778(v17, (uint64_t)sub_1000AA4CC, (uint64_t)v19);
  return swift_release();
}

void sub_1000A5AEC(void *a1, uint64_t a2, void *a3, uint64_t a4, void (*a5)(uint64_t), void (*a6)(uint64_t), uint64_t a7, id *a8, void (*a9)(void *), uint64_t a10)
{
  uint64_t v81 = a7;
  v82 = a8;
  v83 = a5;
  v84 = a6;
  v79 = a9;
  uint64_t v80 = a10;
  uint64_t v14 = sub_1000CAD30();
  __chkstk_darwin(v14 - 8);
  uint64_t v15 = sub_1000CC1B0();
  __chkstk_darwin(v15 - 8);
  uint64_t v16 = type metadata accessor for TodayContent();
  uint64_t v17 = __chkstk_darwin(v16 - 8);
  v19 = (void *)((char *)v73 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v17);
  v21 = (void *)((char *)v73 - v20);
  uint64_t v22 = type metadata accessor for ContentServiceRequest();
  uint64_t v23 = *(void *)(*(void *)(v22 - 8) + 64);
  __chkstk_darwin(v22);
  if (!a1 || !a2 || !a3)
  {
    if (a4)
    {
      uint64_t v38 = a4;
    }
    else
    {
      sub_1000AB5CC();
      uint64_t v38 = swift_allocError();
      unsigned char *v39 = 0;
    }
    swift_errorRetain();
    v83(v38);
    swift_errorRelease();
    return;
  }
  uint64_t v76 = v24;
  uint64_t v77 = (uint64_t)v73 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v25 = a1;
  swift_bridgeObjectRetain();
  id v78 = a3;
  id v26 = [v25 sections];
  uint64_t v27 = (uint64_t)[v26 count];

  if (v27 < 1)
  {
    swift_bridgeObjectRelease();
    sub_1000CC1A0();
    sub_1000CAD00();
    uint64_t v41 = sub_1000CC230();
    uint64_t v43 = v42;
    sub_1000A8D10(v82, 1, v19);
    sub_100084064(v41, v43, v21);
    sub_1000AD294((uint64_t)v19, (uint64_t (*)(void))type metadata accessor for TodayContent);
    swift_bridgeObjectRelease();
    v79(v21);

    sub_1000AD294((uint64_t)v21, (uint64_t (*)(void))type metadata accessor for TodayContent);
    return;
  }
  id v28 = v78;
  sub_10001D64C((uint64_t *)&unk_10010E840);
  uint64_t v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = xmmword_1000D37C0;
  unint64_t v86 = 0;
  unint64_t v87 = 0xE000000000000000;
  sub_1000CC820();
  unint64_t v30 = v86;
  unint64_t v31 = v87;
  *(void *)(v29 + 56) = &type metadata for String;
  *(void *)(v29 + 64) = sub_1000225F0();
  *(void *)(v29 + 32) = v30;
  *(void *)(v29 + 40) = v31;
  sub_100036814(0, (unint64_t *)&qword_100110C20);
  v32 = (void *)sub_1000CC630();
  sub_1000CC530();
  sub_1000CB230();
  swift_bridgeObjectRelease();

  unint64_t v33 = (unint64_t)NTTodayResults.allItems.getter();
  unint64_t v34 = v33;
  unint64_t v86 = (unint64_t)_swiftEmptyArrayStorage;
  if (v33 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v35 = sub_1000CC890();
    uint64_t v75 = a2;
    if (v35) {
      goto LABEL_7;
    }
LABEL_27:
    swift_bridgeObjectRelease();
    v40 = _swiftEmptyArrayStorage;
    id v37 = v28;
LABEL_28:
    uint64_t v44 = swift_bridgeObjectRelease();
    __chkstk_darwin(v44);
    uint64_t v45 = v81;
    v46 = v82;
    v73[-4] = v37;
    v73[-3] = v46;
    v73[-2] = v45;
    v73[-1] = v40;
    uint64_t v47 = v45;
    sub_10001D64C(&qword_100111BD0);
    swift_allocObject();
    uint64_t v48 = sub_1000CB080();
    v73[2] = v48;
    uint64_t v49 = swift_bridgeObjectRelease();
    __chkstk_darwin(v49);
    v73[-4] = v25;
    v73[-3] = v47;
    v73[-2] = v46;
    sub_10001D64C(&qword_100111BD8);
    swift_allocObject();
    uint64_t v74 = sub_1000CB080();
    uint64_t v50 = __chkstk_darwin(v74);
    v73[-2] = v48;
    v73[-1] = v50;
    sub_10001D64C((uint64_t *)&unk_100111BE0);
    v73[1] = sub_1000CB0A0();
    sub_100036814(0, &qword_10010EF98);
    v73[0] = sub_1000CC590();
    uint64_t v51 = v77;
    sub_1000AD2F4((uint64_t)v46, v77, (uint64_t (*)(void))type metadata accessor for ContentServiceRequest);
    unint64_t v52 = (*(unsigned __int8 *)(v76 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v76 + 80);
    unint64_t v53 = (v23 + v52 + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v54 = (v53 + 15) & 0xFFFFFFFFFFFFFFF8;
    v55 = v25;
    unint64_t v56 = (v54 + 15) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v57 = (v56 + 15) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v58 = (v57 + 15) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v59 = swift_allocObject();
    sub_1000AD35C(v51, v59 + v52, (uint64_t (*)(void))type metadata accessor for ContentServiceRequest);
    *(void *)(v59 + v53) = v55;
    id v61 = v78;
    v60 = (void (*)(void))v79;
    *(void *)(v59 + v54) = v78;
    *(void *)(v59 + v56) = v75;
    uint64_t v62 = v80;
    uint64_t v63 = v81;
    *(void *)(v59 + v57) = v81;
    v64 = (void *)(v59 + v58);
    void *v64 = v60;
    v64[1] = v62;
    v65 = (void (**)(uint64_t))(v59 + ((v58 + 23) & 0xFFFFFFFFFFFFFFF8));
    v67 = v83;
    v66 = v84;
    *v65 = v83;
    v65[1] = v66;
    id v68 = v55;
    id v69 = v61;
    swift_retain();
    swift_retain();
    swift_retain();
    v70 = (void *)v73[0];
    sub_1000CB030();
    swift_release();

    swift_release();
    v71 = (void *)swift_allocObject();
    v71[2] = v63;
    v71[3] = v67;
    v71[4] = v66;
    swift_retain();
    swift_retain();
    v72 = (void *)sub_1000CB010();
    sub_1000CB040();

    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();

    return;
  }
  uint64_t v35 = *(void *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  uint64_t v75 = a2;
  if (!v35) {
    goto LABEL_27;
  }
LABEL_7:
  uint64_t v74 = (uint64_t)v25;
  if (v35 >= 1)
  {
    uint64_t v36 = 0;
    id v37 = v28;
    do
    {
      if ((v34 & 0xC000000000000001) != 0) {
        sub_1000CC780();
      }
      else {
        swift_unknownObjectRetain();
      }
      v85 = &OBJC_PROTOCOL___NTHeadlineProviding;
      if (swift_dynamicCastObjCProtocolConditional())
      {
        sub_1000CC390();
        if (*(void *)((v86 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v86 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_1000CC400();
        }
        sub_1000CC430();
        sub_1000CC3D0();
      }
      else
      {
        swift_unknownObjectRelease();
      }
      ++v36;
    }
    while (v35 != v36);
    swift_bridgeObjectRelease();
    v40 = (void *)v86;
    id v25 = (id)v74;
    goto LABEL_28;
  }
  __break(1u);
}

void sub_1000A63D4(void (*a1)(void *), uint64_t a2, uint64_t a3, uint64_t a4, void *a5, id *a6, uint64_t a7)
{
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a1;
  *(void *)(v12 + 24) = a2;
  swift_retain();
  id v13 = [a5 widgetConfig];
  if (v13)
  {
    uint64_t v14 = v13;
    if (([v13 contentPrefetchEnabled] & 1) != 0
      && (uint64_t v15 = (char *)a6 + *(int *)(type metadata accessor for ContentServiceRequest() + 20),
          (v15[*(int *)(type metadata accessor for LayoutContext() + 48)] & 1) == 0))
    {
      uint64_t v16 = *(void **)(a7 + 88);
      sub_10001D64C(&qword_100111C58);
      Class isa = sub_1000CC3A0().super.isa;
      id v18 = [*a6 qualityOfService];
      uint64_t v19 = swift_allocObject();
      *(void *)(v19 + 16) = sub_1000996D8;
      *(void *)(v19 + 24) = v12;
      v21[4] = sub_1000AD484;
      v21[5] = v19;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 1107296256;
      v21[2] = sub_1000A6600;
      v21[3] = &unk_1000FE390;
      uint64_t v20 = _Block_copy(v21);
      swift_release();
      [v16 prefetchContentForHeadlines:isa withQualityOfService:v18 completionHandler:v20];
      _Block_release(v20);
    }
    else
    {
      swift_release();
      v21[0] = sub_10008AA8C((uint64_t)_swiftEmptyArrayStorage);
      a1(v21);
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    swift_release();
    v21[0] = sub_10008AA8C((uint64_t)_swiftEmptyArrayStorage);
    a1(v21);
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_1000A6600(uint64_t a1)
{
  v1 = *(void (**)(uint64_t))(a1 + 32);
  sub_1000CABE0();
  sub_100036814(0, (unint64_t *)&qword_100111C60);
  sub_1000AD3C4((unint64_t *)&qword_100111370, (void (*)(uint64_t))&type metadata accessor for URL);
  uint64_t v2 = sub_1000CC110();
  swift_retain();
  v1(v2);
  swift_release();

  return swift_bridgeObjectRelease();
}

void sub_1000A66D8(void (*a1)(void *), uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, id *a7)
{
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a1;
  *(void *)(v12 + 24) = a2;
  swift_retain();
  id v13 = [a5 banner];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void **)(a6 + 88);
    id v16 = [*a7 qualityOfService];
    uint64_t v17 = swift_allocObject();
    *(void *)(v17 + 16) = sub_1000996D8;
    *(void *)(v17 + 24) = v12;
    v19[4] = sub_1000AD444;
    v19[5] = v17;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 1107296256;
    v19[2] = sub_1000A6858;
    v19[3] = &unk_1000FE318;
    id v18 = _Block_copy(v19);
    swift_release();
    [v15 prefetchContentForBanner:v14 withQualityOfService:v16 completionHandler:v18];
    _Block_release(v18);
  }
  else
  {
    swift_release();
    v19[0] = 0;
    a1(v19);
  }
}

void sub_1000A6858(uint64_t a1, void *a2)
{
  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

id sub_1000A68C0(uint64_t *a1, id *a2, void *a3, void *a4, uint64_t a5, void *a6, void (*a7)(void *), uint64_t a8, void (*a9)(uint64_t))
{
  uint64_t v136 = a8;
  v137 = a7;
  id v152 = a3;
  v153 = a6;
  id v147 = a4;
  uint64_t v148 = a5;
  uint64_t v11 = sub_10001D64C((uint64_t *)&unk_100111BF0);
  __chkstk_darwin(v11 - 8);
  uint64_t v131 = (uint64_t)&v128 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v130 = type metadata accessor for TodayContent();
  uint64_t v129 = *(void *)(v130 - 8);
  __chkstk_darwin(v130);
  v135 = (char *)&v128 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_10001D64C(&qword_10010F340);
  uint64_t v15 = __chkstk_darwin(v14 - 8);
  v138 = (char *)&v128 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v133 = (char *)&v128 - v17;
  uint64_t v18 = sub_10001D64C(&qword_100111C00);
  uint64_t v19 = __chkstk_darwin(v18 - 8);
  v134 = (uint64_t *)((char *)&v128 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v132 = (uint64_t)&v128 - v22;
  __chkstk_darwin(v21);
  v151 = (uint64_t *)((char *)&v128 - v23);
  uint64_t v141 = sub_1000CACC0();
  uint64_t v140 = *(void *)(v141 - 8);
  __chkstk_darwin(v141);
  v145 = (char *)&v128 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v150 = sub_1000CACF0();
  uint64_t v25 = *(void *)(v150 - 8);
  __chkstk_darwin(v150);
  uint64_t v27 = (char *)&v128 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = type metadata accessor for LayoutContext();
  uint64_t v29 = (int *)(v28 - 8);
  uint64_t v30 = __chkstk_darwin(v28);
  v32 = (char *)&v128 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v30);
  unint64_t v34 = (uint64_t *)((char *)&v128 - v33);
  uint64_t v36 = *a1;
  uint64_t v35 = (void *)a1[1];
  id v37 = (id *)((char *)a2 + *(int *)(type metadata accessor for ContentServiceRequest() + 20));
  v146 = v35;
  id v38 = v35;
  uint64_t v142 = v36;
  id v143 = v38;
  swift_bridgeObjectRetain();
  [v152 headlineScale];
  uint64_t v40 = v39;
  uint64_t v41 = *v37;
  uint64_t v42 = v37[1];
  uint64_t v43 = v29[8];
  uint64_t v44 = (char *)v37 + v43;
  uint64_t v45 = (char *)v34 + v43;
  uint64_t v46 = sub_1000CBEC0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v46 - 8) + 16))(v45, v44, v46);
  uint64_t v47 = v29[10];
  uint64_t v48 = (void *)((char *)v37 + v29[9]);
  uint64_t v49 = *v48;
  uint64_t v50 = v48[1];
  uint64_t v51 = (char *)v37 + v47;
  unint64_t v52 = (char *)v34 + v47;
  uint64_t v53 = sub_1000CB6D0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v53 - 8) + 16))(v52, v51, v53);
  uint64_t v54 = *(void *)((char *)v37 + v29[11]);
  char v55 = *((unsigned char *)v37 + v29[14]);
  *unint64_t v34 = v41;
  v34[1] = v42;
  unint64_t v56 = (void *)((char *)v34 + v29[9]);
  *unint64_t v56 = v49;
  v56[1] = v50;
  *(void *)((char *)v34 + v29[11]) = v54;
  *(void *)((char *)v34 + v29[12]) = v40;
  *((unsigned char *)v34 + v29[13]) = 0;
  *((unsigned char *)v34 + v29[14]) = v55;
  sub_1000CACE0();
  uint64_t v57 = sub_1000CACD0();
  uint64_t v59 = v58;
  (*(void (**)(char *, uint64_t))(v25 + 8))(v27, v150);
  v144 = v32;
  sub_1000AD2F4((uint64_t)v34, (uint64_t)v32, (uint64_t (*)(void))type metadata accessor for LayoutContext);
  uint64_t v150 = (uint64_t)a2;
  id result = [*a2 request];
  if (result)
  {
    id v61 = result;
    id v62 = [result tagID];

    v139 = v34;
    if (v62)
    {
      uint64_t v63 = sub_1000CC1F0();
      uint64_t v65 = v64;
    }
    else
    {
      uint64_t v63 = 0;
      uint64_t v65 = 0;
    }
    uint64_t v66 = v141;
    uint64_t v67 = v140;
    id v68 = v145;
    sub_1000CACB0();
    type metadata accessor for TrackableWidgetState();
    uint64_t v69 = swift_allocObject();
    (*(void (**)(uint64_t, char *, uint64_t))(v67 + 32))(v69 + OBJC_IVAR____TtC7NewsTag20TrackableWidgetState_contentFetchDate, v68, v66);
    v70 = (uint64_t *)(v69 + OBJC_IVAR____TtC7NewsTag20TrackableWidgetState_entryID);
    uint64_t *v70 = v57;
    v70[1] = v59;
    id v71 = v152;
    *(void *)(v69 + OBJC_IVAR____TtC7NewsTag20TrackableWidgetState_results) = v152;
    v72 = v147;
    *(void *)(v69 + OBJC_IVAR____TtC7NewsTag20TrackableWidgetState_fetchInfo) = v147;
    sub_1000AD35C((uint64_t)v144, v69 + OBJC_IVAR____TtC7NewsTag20TrackableWidgetState_layoutContext, (uint64_t (*)(void))type metadata accessor for LayoutContext);
    v73 = (uint64_t *)(v69 + OBJC_IVAR____TtC7NewsTag20TrackableWidgetState_contentID);
    uint64_t *v73 = v63;
    v73[1] = v65;
    *(void *)(v69 + OBJC_IVAR____TtC7NewsTag20TrackableWidgetState_appearanceType) = 0;
    uint64_t v74 = v69 + OBJC_IVAR____TtC7NewsTag20TrackableWidgetState_visibleRect;
    *(_OWORD *)uint64_t v74 = 0u;
    *(_OWORD *)(v74 + 16) = 0u;
    *(unsigned char *)(v74 + 32) = 1;
    *(void *)(v69 + OBJC_IVAR____TtC7NewsTag20TrackableWidgetState_stackKind) = 0;
    *(void *)(v69 + OBJC_IVAR____TtC7NewsTag20TrackableWidgetState_stackLocation) = 0;
    id v147 = v72;
    id v75 = v71;
    uint64_t v76 = sub_1000A7560(v75, v146, v148);
    uint64_t v77 = v150;
    id v78 = sub_1000ABFE8(v150, v75, v76);
    sub_1000AB1F8(v76);
    swift_bridgeObjectRelease();
    uint64_t v79 = sub_1000CABE0();
    Class isa = sub_1000CC3A0().super.isa;
    swift_release();
    NTDeleteOnDiskAssets();

    uint64_t v81 = (uint64_t)v149;
    v82 = sub_1000AB32C((uint64_t)v78);
    swift_bridgeObjectRelease();
    uint64_t v83 = (uint64_t)v153;
    id v84 = sub_1000A7A70(v77, v75, (uint64_t)v82);
    v85 = v151;
    sub_1000A835C(v77, v83, v151);
    if (v81)
    {
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();
      a9(v81);

      swift_errorRelease();
      swift_release();
    }
    else
    {
      uint64_t v86 = v79;
      uint64_t v148 = (uint64_t)v84;
      v149 = v82;
      id v152 = v75;
      unint64_t v87 = (void *)v153[9];
      v88 = (char *)v153[17];
      uint64_t v89 = v132;
      sub_1000AD22C((uint64_t)v85, v132);
      uint64_t v90 = sub_10001D64C(&qword_100111C08);
      uint64_t v91 = *(void *)(v90 - 8);
      v92 = *(void **)(v91 + 48);
      v145 = (char *)(v91 + 48);
      v146 = v92;
      int v93 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v92)(v89, 1, v90);
      v144 = v88;
      if (v93 == 1)
      {
        id v94 = v87;
        v95 = v88;
        sub_1000227A8(v89, &qword_100111C00);
        uint64_t v96 = v86;
        uint64_t v97 = *(void *)(v86 - 8);
        uint64_t v98 = v97;
        uint64_t v99 = 1;
        v100 = v133;
      }
      else
      {
        id v101 = v87;
        v102 = v88;
        swift_bridgeObjectRelease();
        uint64_t v103 = v89 + *(int *)(v90 + 48);
        uint64_t v96 = v86;
        uint64_t v97 = *(void *)(v86 - 8);
        uint64_t v98 = v97;
        v100 = v133;
        (*(void (**)(char *, uint64_t, uint64_t))(v97 + 32))(v133, v103, v96);
        uint64_t v99 = 0;
      }
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v98 + 56))(v100, v99, 1, v96);
      uint64_t v104 = type metadata accessor for EngagementURLProvider();
      v105 = (void *)swift_allocObject();
      uint64_t v106 = (uint64_t)v100;
      v107 = v105;
      uint64_t v108 = (uint64_t)v144;
      v105[2] = v87;
      v105[3] = v108;
      uint64_t v109 = v142;
      v105[4] = v69;
      v105[5] = v109;
      sub_1000A4B90(v106, (uint64_t)v105 + OBJC_IVAR____TtC7NewsTag21EngagementURLProvider_sharedDirectoryFileUrl);
      v154[3] = v104;
      v154[4] = &off_1000FE218;
      v154[0] = v107;
      uint64_t v110 = *(void *)(v69 + OBJC_IVAR____TtC7NewsTag20TrackableWidgetState_appearanceType);
      swift_retain();
      swift_retain();
      sub_1000A8574(v147, v150, v110, v138);
      v111 = v134;
      sub_1000AD22C((uint64_t)v151, (uint64_t)v134);
      if (((unsigned int (*)(uint64_t *, uint64_t, uint64_t))v146)(v111, 1, v90) == 1)
      {
        sub_1000227A8((uint64_t)v111, &qword_100111C00);
        uint64_t v112 = 0;
        uint64_t v113 = 0;
      }
      else
      {
        uint64_t v112 = *v111;
        uint64_t v114 = v96;
        uint64_t v113 = v111[1];
        (*(void (**)(char *, uint64_t))(v97 + 8))((char *)v111 + *(int *)(v90 + 48), v114);
      }
      v115 = v135;
      id v116 = (id)NewsCoreUserDefaults();
      NSString v117 = sub_1000CC1C0();
      id v118 = [v116 stringForKey:v117];

      if (v118)
      {
        uint64_t v119 = sub_1000CC1F0();
        uint64_t v121 = v120;
      }
      else
      {
        uint64_t v119 = 0;
        uint64_t v121 = 0xE000000000000000;
      }
      id v122 = v147;
      id v123 = v152;
      swift_retain();
      sub_100083848(v123, (uint64_t)v122, (uint64_t)v149, v154, v148, 0, (uint64_t)v138, v69, v115, v112, v113, v119, v121);
      v124 = v153;
      sub_100020110(v153 + 12, v153[15]);
      id v125 = sub_1000236D8();
      [v125 tickle];

      v126 = (void (*)(uint64_t, void))v124[2];
      if (v126)
      {
        uint64_t v127 = v131;
        sub_1000AD2F4((uint64_t)v115, v131, (uint64_t (*)(void))type metadata accessor for TodayContent);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v129 + 56))(v127, 0, 1, v130);
        swift_retain();
        v126(v127, 0);
        sub_1000AB9E4((uint64_t)v126);
        sub_1000227A8(v127, (uint64_t *)&unk_100111BF0);
      }
      v137(v115);
      swift_release();
      swift_release();

      sub_1000AD294((uint64_t)v115, (uint64_t (*)(void))type metadata accessor for TodayContent);
      sub_1000227A8((uint64_t)v151, &qword_100111C00);
    }
    return (id)sub_1000AD294((uint64_t)v139, (uint64_t (*)(void))type metadata accessor for LayoutContext);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1000A7560(void *a1, void *a2, uint64_t a3)
{
  id v48 = a2;
  uint64_t v5 = sub_10001D64C(&qword_10010F340);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  v8 = (char *)&v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v6);
  uint64_t v11 = (char *)&v45 - v10;
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = (char *)&v45 - v13;
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v45 - v15;
  uint64_t v17 = sub_1000CABE0();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v45 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  uint64_t v23 = (char *)&v45 - v22;
  id v24 = [a1 banner];
  if (!v24)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56))(v16, 1, 1, v17);
LABEL_7:
    uint64_t v11 = v16;
    goto LABEL_15;
  }
  uint64_t v25 = v24;
  uint64_t v46 = v21;
  id v26 = [v24 imageURL];

  uint64_t v47 = v23;
  if (v26)
  {
    sub_1000CABA0();

    uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56);
    v27(v14, 0, 1, v17);
  }
  else
  {
    uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56);
    v27(v14, 1, 1, v17);
  }
  sub_1000A4B90((uint64_t)v14, (uint64_t)v16);
  uint64_t v28 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48);
  if (v28(v16, 1, v17) == 1) {
    goto LABEL_7;
  }
  uint64_t v45 = a3;
  uint64_t v29 = *(void (**)(char *, char *, uint64_t))(v18 + 32);
  v29(v47, v16, v17);
  if (v48)
  {
    uint64_t v30 = v29;
    id v31 = [v48 fileURL];
    if (v31)
    {
      v32 = v31;
      sub_1000CABA0();

      uint64_t v33 = 0;
    }
    else
    {
      uint64_t v33 = 1;
    }
    unint64_t v34 = v46;
    v27(v8, v33, 1, v17);
    sub_1000A4B90((uint64_t)v8, (uint64_t)v11);
    if (v28(v11, 1, v17) != 1)
    {
      v30(v34, v11, v17);
      sub_10001D64C(&qword_100111C48);
      uint64_t v36 = (int *)(sub_10001D64C(&qword_100111C50) - 8);
      unint64_t v37 = (*(unsigned __int8 *)(*(void *)v36 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v36 + 80);
      uint64_t v38 = swift_allocObject();
      *(_OWORD *)(v38 + 16) = xmmword_1000D37C0;
      unint64_t v39 = v38 + v37 + v36[14];
      uint64_t v40 = *(void (**)(void))(v18 + 16);
      uint64_t v41 = v34;
      uint64_t v42 = v47;
      v40();
      ((void (*)(unint64_t, char *, uint64_t))v40)(v39, v41, v17);
      sub_10008AEEC(v38);
      sub_1000AD3C4((unint64_t *)&qword_100111370, (void (*)(uint64_t))&type metadata accessor for URL);
      uint64_t v43 = sub_1000CAF60();
      swift_bridgeObjectRelease();
      uint64_t v44 = *(void (**)(char *, uint64_t))(v18 + 8);
      v44(v41, v17);
      v44(v42, v17);
      return v43;
    }
  }
  else
  {
    v27(v11, 1, 1, v17);
  }
  (*(void (**)(char *, uint64_t))(v18 + 8))(v47, v17);
  a3 = v45;
LABEL_15:
  sub_1000227A8((uint64_t)v11, &qword_10010F340);
  swift_bridgeObjectRetain();
  return a3;
}

id sub_1000A7A70(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v72 = a3;
  uint64_t v4 = type metadata accessor for ImageStore.Key();
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v68 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10001D64C(&qword_10010F340);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v68 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000CABE0();
  uint64_t v74 = *(void *)(v10 - 8);
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v68 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v73 = (char *)&v68 - v14;
  unint64_t v15 = sub_1000CBEC0();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v68 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for ContentServiceRequest();
  type metadata accessor for LayoutContext();
  (*(void (**)(char *, void, unint64_t))(v16 + 104))(v18, enum case for InternalWidgetFamily.systemSmall(_:), v15);
  sub_1000AD3C4((unint64_t *)&qword_100110060, (void (*)(uint64_t))&type metadata accessor for InternalWidgetFamily);
  sub_1000CC360();
  sub_1000CC360();
  uint64_t v20 = v76;
  uint64_t v19 = v77;
  (*(void (**)(char *, unint64_t))(v16 + 8))(v18, v15);
  if (v19 != v20) {
    return (id)sub_10008AC80((uint64_t)_swiftEmptyArrayStorage);
  }
  id v21 = [a2 sections];
  id v22 = [v21 array];

  uint64_t v23 = sub_1000CC3B0();
  unint64_t v24 = (unint64_t)sub_10006D51C(v23);
  swift_bridgeObjectRelease();
  if (v24 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v66 = sub_1000CC890();
    swift_bridgeObjectRelease();
    if (!v66) {
      goto LABEL_47;
    }
  }
  else if (!*(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_47;
  }
  if ((v24 & 0xC000000000000001) != 0)
  {
    id v25 = (id)sub_1000CC780();
  }
  else
  {
    if (!*(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_46;
    }
    id v25 = *(id *)(v24 + 32);
  }
  id v26 = v25;
  swift_bridgeObjectRelease();
  sub_10006BDD0();
  uint64_t v18 = v27;

  if (!((unint64_t)v18 >> 62))
  {
    if (*(void *)(((unint64_t)v18 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_9;
    }
LABEL_47:
    swift_bridgeObjectRelease();
    return (id)sub_10008AC80((uint64_t)_swiftEmptyArrayStorage);
  }
LABEL_46:
  swift_bridgeObjectRetain();
  uint64_t v67 = sub_1000CC890();
  swift_bridgeObjectRelease();
  if (!v67) {
    goto LABEL_47;
  }
LABEL_9:
  if (((unint64_t)v18 & 0xC000000000000001) != 0)
  {
    sub_1000CC780();
  }
  else
  {
    if (!*(void *)(((unint64_t)v18 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_52;
    }
    swift_unknownObjectRetain();
  }
  swift_bridgeObjectRelease();
  id v75 = &OBJC_PROTOCOL___NTHeadlineProviding;
  uint64_t v28 = (void *)swift_dynamicCastObjCProtocolConditional();
  if (!v28)
  {
    swift_unknownObjectRelease();
    return (id)sub_10008AC80((uint64_t)_swiftEmptyArrayStorage);
  }
  uint64_t v29 = v28;
  id v30 = [v28 thumbnailRemoteURL];
  if (!v30)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v74 + 56))(v9, 1, 1, v10);
    goto LABEL_32;
  }
  id v31 = v30;
  sub_1000CABA0();

  v32 = *(void (**)(char *, char *, uint64_t))(v74 + 32);
  uint64_t v33 = v13;
  uint64_t v34 = v74;
  v32(v9, v33, v10);
  uint64_t v35 = *(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56);
  v35(v9, 0, 1, v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v9, 1, v10) == 1)
  {
LABEL_32:
    sub_1000227A8((uint64_t)v9, &qword_10010F340);
LABEL_34:
    unint64_t v55 = sub_10008AC80((uint64_t)_swiftEmptyArrayStorage);
    swift_unknownObjectRelease();
    return (id)v55;
  }
  id v69 = v29;
  uint64_t v36 = v73;
  v32(v73, v9, v10);
  (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v6, v36, v10);
  v35(v6, 0, 1, v10);
  uint64_t v37 = v72;
  if (!*(void *)(v72 + 16) || (unint64_t v38 = sub_10003CC4C((uint64_t)v6), (v39 & 1) == 0))
  {
    sub_1000AD294((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for ImageStore.Key);
    (*(void (**)(char *, uint64_t))(v34 + 8))(v73, v10);
    goto LABEL_34;
  }
  id v40 = *(id *)(*(void *)(v37 + 56) + 8 * v38);
  sub_1000AD294((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for ImageStore.Key);
  id v41 = [*(id *)(v71 + 80) colorsForImage:v40];
  uint64_t v72 = sub_100036814(0, (unint64_t *)&qword_100111C20);
  unint64_t v15 = sub_1000CC3B0();

  id v68 = v40;
  if (v15 >> 62) {
    goto LABEL_53;
  }
  uint64_t v42 = *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v42; uint64_t v42 = sub_1000CC890())
  {
    uint64_t v43 = self;
    unint64_t v44 = v15 & 0xC000000000000001;
    uint64_t v45 = 4;
    id v70 = v43;
    unint64_t v71 = v15 & 0xC000000000000001;
    while (1)
    {
      id v46 = v44 ? (id)sub_1000CC780() : *(id *)(v15 + 8 * v45);
      id v47 = v46;
      uint64_t v48 = v45 - 3;
      if (__OFADD__(v45 - 4, 1)) {
        break;
      }
      uint64_t v49 = (void *)sub_1000CC5E0();
      id v50 = [v70 whiteColor];
      char v51 = sub_1000CC620();

      if (v51)
      {
        id result = (id)swift_bridgeObjectRelease();
        uint64_t v52 = v74;
        unint64_t v53 = v71;
        goto LABEL_36;
      }

      ++v45;
      unint64_t v44 = v71;
      if (v48 == v42) {
        goto LABEL_26;
      }
    }
LABEL_52:
    __break(1u);
LABEL_53:
    swift_bridgeObjectRetain();
  }
LABEL_26:
  swift_bridgeObjectRelease();
  if (qword_10010DD78 != -1) {
    swift_once();
  }
  uint64_t v52 = v74;
  if (!v42)
  {
    id v47 = (id)qword_10011AC70;
    swift_bridgeObjectRelease();
    uint64_t v57 = 0;
    goto LABEL_41;
  }
  unint64_t v53 = v15 & 0xC000000000000001;
  id result = (id)qword_10011AC70;
  id v47 = result;
LABEL_36:
  if (v53)
  {
    id v56 = (id)sub_1000CC780();
    goto LABEL_39;
  }
  if (*(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v56 = *(id *)(v15 + 32);
LABEL_39:
    uint64_t v57 = v56;
    swift_bridgeObjectRelease();
LABEL_41:
    sub_10001D64C(&qword_100111C28);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1000D37C0;
    id v59 = v47;
    id v60 = [v69 identifier];
    uint64_t v61 = sub_1000CC1F0();
    uint64_t v63 = v62;

    *(void *)(inited + 32) = v61;
    *(void *)(inited + 40) = v63;
    *(void *)(inited + 48) = v57;
    *(void *)(inited + 56) = v59;
    id v64 = v57;
    id v65 = v59;
    unint64_t v55 = sub_10008AC80(inited);

    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v52 + 8))(v73, v10);
    return (id)v55;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000A835C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v7 = sub_1000CACF0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = a1 + *(int *)(type metadata accessor for ContentServiceRequest() + 20);
  if (*(unsigned char *)(v11 + *(int *)(type metadata accessor for LayoutContext() + 48)))
  {
    uint64_t v12 = sub_10001D64C(&qword_100111C08);
    return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(a3, 1, 1, v12);
  }
  else
  {
    sub_1000CACE0();
    uint64_t v14 = sub_1000CACD0();
    uint64_t v22 = v3;
    uint64_t v15 = v14;
    uint64_t v17 = v16;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    uint64_t v18 = sub_10001D64C(&qword_100111C08);
    uint64_t v19 = (uint64_t)a3 + *(int *)(v18 + 48);
    *a3 = v15;
    a3[1] = (uint64_t)v17;
    sub_100020110((void *)(a2 + 96), *(void *)(a2 + 120));
    swift_bridgeObjectRetain();
    uint64_t v20 = v22;
    sub_100023AE8(v15, v17, v19);
    if (v20)
    {
      return swift_bridgeObjectRelease_n();
    }
    else
    {
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(a3, 0, 1, v18);
      return swift_bridgeObjectRelease();
    }
  }
}

uint64_t sub_1000A8574@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
  uint64_t v8 = sub_10001D64C(&qword_10010F340);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000CABE0();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v46 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v15 = [a1 widgetConfig];
  uint64_t v16 = v15;
  if ((unint64_t)(a3 - 1) < 4)
  {

    goto LABEL_3;
  }
  if (a3)
  {

LABEL_14:
    sub_10001D64C((uint64_t *)&unk_10010E840);
    uint64_t v32 = swift_allocObject();
    *(_OWORD *)(v32 + 16) = xmmword_1000D37C0;
    uint64_t v50 = 0;
    unint64_t v51 = 0xE000000000000000;
    type metadata accessor for ContentServiceRequest();
    sub_1000CC820();
    uint64_t v33 = v50;
    unint64_t v34 = v51;
    *(void *)(v32 + 56) = &type metadata for String;
    *(void *)(v32 + 64) = sub_1000225F0();
    *(void *)(v32 + 32) = v33;
    *(void *)(v32 + 40) = v34;
    sub_100036814(0, (unint64_t *)&qword_100110C20);
    uint64_t v35 = (void *)sub_1000CC630();
    sub_1000CC530();
    sub_1000CB230();
    swift_bridgeObjectRelease();

    if (qword_10010DD80 != -1) {
      swift_once();
    }
    uint64_t v36 = sub_10003B638(v11, (uint64_t)qword_10011AC78);
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(a4, v36, v11);
    goto LABEL_22;
  }
  if (v15)
  {
    unsigned __int8 v26 = [v15 widgetBackgroundInteractionEnabled];

    if ((v26 & 1) == 0) {
      goto LABEL_14;
    }
  }
LABEL_3:
  uint64_t v17 = (void *)(a2 + *(int *)(type metadata accessor for ContentServiceRequest() + 24));
  if (*v17)
  {
    uint64_t v49 = a4;
    uint64_t v18 = v17[1];
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v20 = *(void (**)(uint64_t, uint64_t))(v18 + 32);
    uint64_t v21 = v18;
    a4 = v49;
    v20(ObjectType, v21);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) != 1)
    {
      uint64_t v22 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
      v22(v14, v10, v11);
      sub_10001D64C((uint64_t *)&unk_10010E840);
      uint64_t v23 = swift_allocObject();
      *(_OWORD *)(v23 + 16) = xmmword_1000D37D0;
      uint64_t v50 = 0;
      unint64_t v51 = 0xE000000000000000;
      id v47 = v22;
      uint64_t v48 = v12 + 32;
      unint64_t v24 = (void *)0xE700000000000000;
      v25._countAndFlagsBits = 0x736569726F7473;
      switch(a3)
      {
        case 0:
          break;
        case 1:
          unint64_t v24 = (void *)0xEA00000000007365;
          v25._countAndFlagsBits = 0x69726F7473206F6ELL;
          break;
        case 2:
          unint64_t v24 = (void *)0xE500000000000000;
          v25._countAndFlagsBits = 0x726F727265;
          break;
        case 3:
          v25._countAndFlagsBits = 0x656E696C66666FLL;
          break;
        case 4:
          unint64_t v24 = (void *)0xEB00000000726564;
          v25._countAndFlagsBits = 0x6C6F686563616C70;
          break;
        default:
          v25._countAndFlagsBits = 0x6E776F6E6B6E75;
          break;
      }
      v25._object = v24;
      sub_1000CC2B0(v25);
      swift_bridgeObjectRelease();
      uint64_t v37 = v50;
      unint64_t v38 = v51;
      *(void *)(v23 + 56) = &type metadata for String;
      unint64_t v39 = sub_1000225F0();
      *(void *)(v23 + 64) = v39;
      *(void *)(v23 + 32) = v37;
      *(void *)(v23 + 40) = v38;
      sub_1000AD3C4((unint64_t *)&qword_100111C10, (void (*)(uint64_t))&type metadata accessor for URL);
      uint64_t v40 = sub_1000CCA20();
      *(void *)(v23 + 96) = &type metadata for String;
      *(void *)(v23 + 104) = v39;
      *(void *)(v23 + 72) = v40;
      *(void *)(v23 + 80) = v41;
      uint64_t v50 = 0;
      unint64_t v51 = 0xE000000000000000;
      sub_1000CC820();
      uint64_t v42 = v50;
      unint64_t v43 = v51;
      *(void *)(v23 + 136) = &type metadata for String;
      *(void *)(v23 + 144) = v39;
      *(void *)(v23 + 112) = v42;
      *(void *)(v23 + 120) = v43;
      sub_100036814(0, (unint64_t *)&qword_100110C20);
      unint64_t v44 = (void *)sub_1000CC630();
      sub_1000CC530();
      sub_1000CB230();
      swift_bridgeObjectRelease();

      a4 = v49;
      v47(v49, v14, v11);
LABEL_22:
      uint64_t v31 = 0;
      return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(a4, v31, 1, v11);
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, 1, 1, v11);
  }
  sub_1000227A8((uint64_t)v10, &qword_10010F340);
  sub_10001D64C((uint64_t *)&unk_10010E840);
  uint64_t v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = xmmword_1000D37C0;
  uint64_t v50 = 0;
  unint64_t v51 = 0xE000000000000000;
  sub_1000CC820();
  uint64_t v28 = v50;
  unint64_t v29 = v51;
  *(void *)(v27 + 56) = &type metadata for String;
  *(void *)(v27 + 64) = sub_1000225F0();
  *(void *)(v27 + 32) = v28;
  *(void *)(v27 + 40) = v29;
  sub_100036814(0, (unint64_t *)&qword_100110C20);
  id v30 = (void *)sub_1000CC630();
  sub_1000CC530();
  sub_1000CB230();
  swift_bridgeObjectRelease();

  uint64_t v31 = 1;
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(a4, v31, 1, v11);
}

uint64_t sub_1000A8BF8(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v6 = sub_10001D64C((uint64_t *)&unk_100111BF0);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void (**)(char *, uint64_t))(a2 + 16);
  if (v9)
  {
    uint64_t v10 = type metadata accessor for TodayContent();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 1, 1, v10);
    swift_retain();
    v9(v8, a1);
    sub_1000AB9E4((uint64_t)v9);
    sub_1000227A8((uint64_t)v8, (uint64_t *)&unk_100111BF0);
  }
  return a3(a1);
}

id sub_1000A8D10@<X0>(id *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v111 = a2;
  v107 = a3;
  uint64_t v5 = sub_10001D64C(&qword_10010F340);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  v102 = (char *)&v100 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v100 = (char *)&v100 - v8;
  uint64_t v9 = sub_1000CABE0();
  uint64_t v112 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v106 = (uint64_t)&v100 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v110 = sub_1000CACC0();
  uint64_t v109 = *(void *)(v110 - 8);
  __chkstk_darwin(v110);
  uint64_t v108 = (char *)&v100 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v114 = (void *)sub_1000CACF0();
  id v118 = (void *)*(v114 - 1);
  uint64_t v12 = __chkstk_darwin(v114);
  v105 = (char *)&v100 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  id v15 = (char *)&v100 - v14;
  uint64_t v16 = (int *)type metadata accessor for LayoutContext();
  uint64_t v17 = __chkstk_darwin(v16);
  id v116 = (char *)&v100 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v20 = (char **)((char *)&v100 - v19);
  uint64_t v21 = type metadata accessor for ImageStore.Key();
  __chkstk_darwin(v21 - 8);
  uint64_t v23 = (char *)&v100 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v113 = v3;
  id v24 = objc_msgSend(*(id *)(*sub_100020110((void *)(v3 + 32), *(void *)(v3 + 56)) + 32), "placeholderResultsWithOperationInfo:", *a1);
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = &_swiftEmptyDictionarySingleton;
  uint64_t v104 = type metadata accessor for ContentServiceRequest();
  uint64_t v26 = *(int *)(v104 + 20);
  NSString v117 = a1;
  uint64_t v27 = (id *)((char *)a1 + v26);
  [v24 headlineScale];
  sub_10005F520();
  CGFloat v29 = v28;
  id v30 = [self blackColor];
  uint64_t v31 = sub_100099120(v29, v29);

  if (v31)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v112 + 56))(v23, 1, 1, v9);
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)(v25 + 16);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v119[0] = v33;
    *(void *)(v25 + 16) = 0x8000000000000000;
    sub_10009366C((uint64_t)v32, (uint64_t)v23, isUniquelyReferenced_nonNull_native);
    *(void *)(v25 + 16) = v119[0];
    swift_bridgeObjectRelease();
    sub_1000AD294((uint64_t)v23, (uint64_t (*)(void))type metadata accessor for ImageStore.Key);
  }
  uint64_t v115 = v25;
  id result = [objc_allocWithZone((Class)NTPBTodayResultOperationFetchInfo) init];
  if (!result)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    return result;
  }
  uint64_t v36 = result;
  NSString v37 = [v24 sourceIdentifier];
  if (!v37)
  {
    sub_1000CC1F0();
    NSString v37 = sub_1000CC1C0();
    swift_bridgeObjectRelease();
  }
  [v36 setTodaySourceIdentifier:v37];

  [v24 headlineScale];
  uint64_t v39 = v38;
  uint64_t v40 = *v27;
  uint64_t v41 = v27[1];
  uint64_t v42 = v16[6];
  unint64_t v43 = (char *)v27 + v42;
  unint64_t v44 = (char *)v20 + v42;
  uint64_t v45 = sub_1000CBEC0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v45 - 8) + 16))(v44, v43, v45);
  uint64_t v46 = v16[8];
  id v47 = (void *)((char *)v27 + v16[7]);
  uint64_t v48 = *v47;
  uint64_t v49 = v47[1];
  uint64_t v50 = (char *)v27 + v46;
  unint64_t v51 = (char *)v20 + v46;
  uint64_t v52 = sub_1000CB6D0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v52 - 8) + 16))(v51, v50, v52);
  uint64_t v53 = *(void *)((char *)v27 + v16[9]);
  char v54 = *((unsigned char *)v27 + v16[12]);
  void *v20 = v40;
  v20[1] = v41;
  unint64_t v55 = (void *)((char *)v20 + v16[7]);
  void *v55 = v48;
  v55[1] = v49;
  *(void *)((char *)v20 + v16[9]) = v53;
  *(void *)((char *)v20 + v16[10]) = v39;
  *((unsigned char *)v20 + v16[11]) = 1;
  *((unsigned char *)v20 + v16[12]) = v54;
  sub_1000CACE0();
  uint64_t v56 = sub_1000CACD0();
  uint64_t v58 = v57;
  id v59 = v118 + 1;
  id v60 = (void (*)(char *, void *))v118[1];
  v60(v15, v114);
  sub_1000AD2F4((uint64_t)v20, (uint64_t)v116, (uint64_t (*)(void))type metadata accessor for LayoutContext);
  id result = [*v117 request];
  if (!result) {
    goto LABEL_18;
  }
  uint64_t v61 = result;
  uint64_t v103 = v60;
  id v118 = v59;
  uint64_t v101 = v9;
  id v62 = [result tagID];

  if (v62)
  {
    uint64_t v63 = sub_1000CC1F0();
    uint64_t v65 = v64;
  }
  else
  {
    uint64_t v63 = 0;
    uint64_t v65 = 0;
  }
  uint64_t v66 = v115;
  uint64_t v67 = v108;
  sub_1000CACB0();
  type metadata accessor for TrackableWidgetState();
  uint64_t v68 = swift_allocObject();
  (*(void (**)(uint64_t, char *, uint64_t))(v109 + 32))(v68 + OBJC_IVAR____TtC7NewsTag20TrackableWidgetState_contentFetchDate, v67, v110);
  id v69 = (uint64_t *)(v68 + OBJC_IVAR____TtC7NewsTag20TrackableWidgetState_entryID);
  *id v69 = v56;
  v69[1] = v58;
  *(void *)(v68 + OBJC_IVAR____TtC7NewsTag20TrackableWidgetState_results) = v24;
  *(void *)(v68 + OBJC_IVAR____TtC7NewsTag20TrackableWidgetState_fetchInfo) = v36;
  sub_1000AD35C((uint64_t)v116, v68 + OBJC_IVAR____TtC7NewsTag20TrackableWidgetState_layoutContext, (uint64_t (*)(void))type metadata accessor for LayoutContext);
  id v70 = (uint64_t *)(v68 + OBJC_IVAR____TtC7NewsTag20TrackableWidgetState_contentID);
  uint64_t *v70 = v63;
  v70[1] = v65;
  uint64_t v71 = v111;
  *(void *)(v68 + OBJC_IVAR____TtC7NewsTag20TrackableWidgetState_appearanceType) = v111;
  uint64_t v72 = v68 + OBJC_IVAR____TtC7NewsTag20TrackableWidgetState_visibleRect;
  *(_OWORD *)uint64_t v72 = 0u;
  *(_OWORD *)(v72 + 16) = 0u;
  *(unsigned char *)(v72 + 32) = 1;
  *(void *)(v68 + OBJC_IVAR____TtC7NewsTag20TrackableWidgetState_stackKind) = 0;
  *(void *)(v68 + OBJC_IVAR____TtC7NewsTag20TrackableWidgetState_stackLocation) = 0;
  id v73 = v36;
  uint64_t v74 = (char *)v24;
  id v75 = v74;
  if (v71 == 4)
  {
    sub_1000A98C4(v113, v68, v74, v73, v66, 1, (uint64_t)v117, v107);

    swift_release();
    sub_1000AD294((uint64_t)v20, (uint64_t (*)(void))type metadata accessor for LayoutContext);
  }
  else
  {
    id v116 = v74;
    uint64_t v76 = v105;
    sub_1000CACE0();
    uint64_t v77 = sub_1000CACD0();
    uint64_t v79 = v78;
    v103(v76, v114);
    uint64_t v80 = v113;
    sub_100020110((void *)(v113 + 96), *(void *)(v113 + 120));
    uint64_t v81 = v106;
    sub_100023AE8(v77, v79, v106);
    uint64_t v111 = (uint64_t)v79;
    v82 = *(void **)(v80 + 136);
    id v118 = *(id *)(v80 + 72);
    uint64_t v114 = v82;
    swift_retain();
    unint64_t v83 = sub_10008AA8C((uint64_t)_swiftEmptyArrayStorage);
    uint64_t v84 = v112;
    uint64_t v85 = (uint64_t)v100;
    uint64_t v86 = v81;
    uint64_t v87 = v101;
    (*(void (**)(char *, uint64_t, uint64_t))(v112 + 16))(v100, v86, v101);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v84 + 56))(v85, 0, 1, v87);
    uint64_t v88 = type metadata accessor for EngagementURLProvider();
    uint64_t v89 = (void *)swift_allocObject();
    id v90 = v114;
    v89[2] = v118;
    v89[3] = v90;
    v89[4] = v68;
    v89[5] = v83;
    sub_1000A4B90(v85, (uint64_t)v89 + OBJC_IVAR____TtC7NewsTag21EngagementURLProvider_sharedDirectoryFileUrl);
    id v118 = sub_1000AB32C(*(void *)(v115 + 16));
    v119[3] = v88;
    v119[4] = &off_1000FE218;
    v119[0] = v89;
    id v91 = v73;
    swift_retain();
    uint64_t v114 = (void *)sub_10008AC80((uint64_t)_swiftEmptyArrayStorage);
    uint64_t v92 = *(void *)(v68 + OBJC_IVAR____TtC7NewsTag20TrackableWidgetState_appearanceType);
    id v93 = v91;
    sub_1000A8574(v93, (uint64_t)v117, v92, v102);

    id v94 = (id)NewsCoreUserDefaults();
    NSString v95 = sub_1000CC1C0();
    id v96 = [v94 stringForKey:v95];

    if (v96)
    {
      uint64_t v97 = sub_1000CC1F0();
      uint64_t v99 = v98;
    }
    else
    {
      uint64_t v97 = 0;
      uint64_t v99 = 0xE000000000000000;
    }
    sub_100083848(v116, (uint64_t)v93, (uint64_t)v118, v119, (uint64_t)v114, 1, (uint64_t)v102, v68, v107, v77, v111, v97, v99);

    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v112 + 8))(v106, v101);
    sub_1000AD294((uint64_t)v20, (uint64_t (*)(void))type metadata accessor for LayoutContext);
  }
  return (id)swift_release();
}

uint64_t sub_1000A98C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, void *a4@<X3>, uint64_t a5@<X4>, int a6@<W5>, uint64_t a7@<X6>, void *a8@<X8>)
{
  uint64_t v39 = a7;
  int v40 = a6;
  uint64_t v36 = a4;
  id v37 = a3;
  uint64_t v41 = a8;
  uint64_t v11 = sub_10001D64C(&qword_10010F340);
  uint64_t v12 = __chkstk_darwin(v11 - 8);
  uint64_t v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v35 - v15;
  uint64_t v38 = (void *)(a5 + 16);
  uint64_t v17 = *(void **)(a1 + 136);
  id v18 = *(id *)(a1 + 72);
  id v19 = v17;
  swift_retain();
  unint64_t v20 = sub_10008AA8C((uint64_t)_swiftEmptyArrayStorage);
  uint64_t v21 = sub_1000CABE0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v16, 1, 1, v21);
  uint64_t v22 = type metadata accessor for EngagementURLProvider();
  uint64_t v23 = (void *)swift_allocObject();
  v23[2] = v18;
  v23[3] = v19;
  v23[4] = a2;
  v23[5] = v20;
  sub_1000A4B90((uint64_t)v16, (uint64_t)v23 + OBJC_IVAR____TtC7NewsTag21EngagementURLProvider_sharedDirectoryFileUrl);
  swift_beginAccess();
  uint64_t v38 = sub_1000AB32C(*(void *)(a5 + 16));
  v42[3] = v22;
  v42[4] = &off_1000FE218;
  id v24 = v36;
  v42[0] = v23;
  id v25 = v37;
  swift_retain();
  unint64_t v26 = sub_10008AC80((uint64_t)_swiftEmptyArrayStorage);
  uint64_t v27 = (uint64_t)v14;
  sub_1000A8574(v24, v39, *(void *)(a2 + OBJC_IVAR____TtC7NewsTag20TrackableWidgetState_appearanceType), v14);
  swift_retain();
  id v28 = (id)NewsCoreUserDefaults();
  NSString v29 = sub_1000CC1C0();
  id v30 = [v28 stringForKey:v29];

  if (v30)
  {
    uint64_t v31 = sub_1000CC1F0();
    uint64_t v33 = v32;
  }
  else
  {
    uint64_t v31 = 0;
    uint64_t v33 = 0xE000000000000000;
  }
  swift_unknownObjectRetain();
  sub_100083848(v25, (uint64_t)v24, (uint64_t)v38, v42, v26, v40 & 1, v27, a2, v41, 0, 0, v31, v33);
  return swift_release();
}

uint64_t sub_1000A9B88(void *a1)
{
  uint64_t v2 = sub_1000CAD30();
  __chkstk_darwin(v2 - 8);
  uint64_t v3 = sub_1000CC1B0();
  __chkstk_darwin(v3 - 8);
  [a1 fc_isOfflineError];
  sub_1000CC1A0();
  sub_1000CAD00();
  return sub_1000CC230();
}

uint64_t sub_1000A9D04(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v6 = type metadata accessor for ImageStore.Key();
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10001D64C(&qword_10010F340);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000CABE0();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a2 + 16) || (unint64_t v16 = sub_10003CF8C(a1), (v17 & 1) == 0))
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
    return sub_1000227A8((uint64_t)v11, &qword_10010F340);
  }
  id v28 = a3;
  id v18 = *(void (**)(char *, unint64_t, uint64_t))(v13 + 16);
  v18(v11, *(void *)(a2 + 56) + *(void *)(v13 + 72) * v16, v12);
  id v19 = *(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56);
  v19(v11, 0, 1, v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1) {
    return sub_1000227A8((uint64_t)v11, &qword_10010F340);
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v11, v12);
  v18(v8, a1, v12);
  v19(v8, 0, 1, v12);
  sub_1000CABB0();
  id v20 = objc_allocWithZone((Class)UIImage);
  NSString v21 = sub_1000CC1C0();
  swift_bridgeObjectRelease();
  id v22 = [v20 initWithContentsOfFile:v21];

  uint64_t v23 = v28;
  swift_beginAccess();
  if (v22)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v29 = *v23;
    *uint64_t v23 = 0x8000000000000000;
    sub_10009366C((uint64_t)v22, (uint64_t)v8, isUniquelyReferenced_nonNull_native);
    *uint64_t v23 = v29;
    swift_bridgeObjectRelease();
    sub_1000AD294((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for ImageStore.Key);
  }
  else
  {
    unint64_t v26 = (void *)sub_1000AA800((uint64_t)v8);
    sub_1000AD294((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for ImageStore.Key);
  }
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

uint64_t FTEventTrackingWidgetAppearanceType.debugDescription.getter()
{
  return 0x6E776F6E6B6E75;
}

uint64_t sub_1000AA158()
{
  sub_1000AB9E4(*(void *)(v0 + 16));
  sub_1000201A8(v0 + 32);

  swift_unknownObjectRelease();
  sub_1000201A8(v0 + 96);

  return _swift_deallocClassInstance(v0, 144, 7);
}

uint64_t sub_1000AA1C0()
{
  uint64_t result = 0x736569726F7473;
  switch(*v0)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = 0x69726F7473206F6ELL;
      break;
    case 2:
      uint64_t result = 0x726F727265;
      break;
    case 3:
      uint64_t result = 0x656E696C66666FLL;
      break;
    case 4:
      uint64_t result = 0x6C6F686563616C70;
      break;
    default:
      uint64_t result = 0x6E776F6E6B6E75;
      break;
  }
  return result;
}

uint64_t type metadata accessor for ContentService()
{
  return self;
}

uint64_t type metadata accessor for ContentServiceRequest()
{
  uint64_t result = qword_100111CD0;
  if (!qword_100111CD0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000AA2FC()
{
  v1 = (int *)(type metadata accessor for ContentServiceRequest() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 40) & ~v2;
  unint64_t v15 = ((*(void *)(*(void *)v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  uint64_t v16 = v2 | 7;
  swift_release();
  swift_release();
  uint64_t v4 = v0 + v3;

  uint64_t v5 = v0 + v3 + v1[7];
  uint64_t v6 = type metadata accessor for LayoutContext();
  uint64_t v7 = v5 + *(int *)(v6 + 24);
  uint64_t v8 = sub_1000CBEC0();
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
  v9(v7, v8);
  uint64_t v10 = v5 + *(int *)(v6 + 32);
  uint64_t v11 = sub_1000CB6D0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  uint64_t v12 = (id *)(v4 + v1[8]);

  uint64_t v13 = type metadata accessor for NewsWidgetInfo();
  v9((uint64_t)v12 + *(int *)(v13 + 20), v8);
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, v15, v16);
}

void sub_1000AA4CC(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v9 = *(void *)(type metadata accessor for ContentServiceRequest() - 8);
  unint64_t v10 = (*(unsigned __int8 *)(v9 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = (id *)(v4 + v10);
  uint64_t v12 = v4 + ((*(void *)(v9 + 64) + v10 + 7) & 0xFFFFFFFFFFFFFFF8);
  sub_1000A5AEC(a1, a2, a3, a4, *(void (**)(uint64_t))(v4 + 16), *(void (**)(uint64_t))(v4 + 24), *(void *)(v4 + 32), v11, *(void (**)(void *))v12, *(void *)(v12 + 8));
}

uint64_t sub_1000AA59C()
{
  uint64_t v0 = sub_10001D64C(&qword_10010F340);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1000CABE0();
  sub_10006C278(v3, qword_10011AC78);
  uint64_t v4 = sub_10003B638(v3, (uint64_t)qword_10011AC78);
  sub_1000CABC0();
  uint64_t v5 = *(void *)(v3 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v2, 1, v3);
  if (result != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(v4, v2, v3);
  }
  __break(1u);
  return result;
}

double sub_1000AA6D4@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_10003CBE8(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    uint64_t v13 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_100093D84();
      uint64_t v9 = v13;
    }
    uint64_t v10 = *(void *)(v9 + 48);
    uint64_t v11 = sub_1000CC840();
    (*(void (**)(unint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10 + *(void *)(*(void *)(v11 - 8) + 72) * v6, v11);
    sub_100022804((_OWORD *)(*(void *)(v9 + 56) + 32 * v6), a2);
    sub_1000AA8F4(v6, v9);
    *uint64_t v3 = v9;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

uint64_t sub_1000AA800(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_10003CC4C(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *v2;
  uint64_t v12 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1000941D8();
    uint64_t v7 = v12;
  }
  uint64_t v8 = *(void *)(v7 + 48);
  uint64_t v9 = type metadata accessor for ImageStore.Key();
  sub_1000AD294(v8 + *(void *)(*(void *)(v9 - 8) + 72) * v4, (uint64_t (*)(void))type metadata accessor for ImageStore.Key);
  uint64_t v10 = *(void *)(*(void *)(v7 + 56) + 8 * v4);
  sub_1000AABAC(v4, v7);
  *uint64_t v2 = v7;
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t sub_1000AA8F4(int64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000CC840();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(void *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    uint64_t v11 = ~v9;
    uint64_t v38 = a2 + 64;
    unint64_t result = sub_1000CC6E0();
    uint64_t v12 = v38;
    if ((*(void *)(v38 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      unint64_t v36 = (result + 1) & v11;
      uint64_t v14 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      uint64_t v13 = v5 + 16;
      uint64_t v35 = v14;
      uint64_t v15 = *(void *)(v13 + 56);
      uint64_t v37 = v13;
      uint64_t v16 = (uint64_t (**)(char *, uint64_t))(v13 - 8);
      do
      {
        int64_t v17 = v15 * v10;
        v35(v8, *(void *)(a2 + 48) + v15 * v10, v4);
        uint64_t v18 = sub_1000CC120();
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
            unint64_t v26 = (_OWORD *)(v25 + 32 * a1);
            uint64_t v27 = (_OWORD *)(v25 + 32 * v10);
            uint64_t v12 = v38;
            if (a1 != v10 || (a1 = v10, v26 >= v27 + 2))
            {
              long long v28 = v27[1];
              *unint64_t v26 = *v27;
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
    uint64_t v29 = (uint64_t *)(v12 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v30 = *v29;
    uint64_t v31 = (-1 << a1) - 1;
  }
  else
  {
    uint64_t v29 = (uint64_t *)(a2 + 64 + 8 * ((unint64_t)a1 >> 6));
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

unint64_t sub_1000AABAC(unint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000CABE0();
  uint64_t v5 = *(void (***)(char *, uint64_t))(v4 - 8);
  __chkstk_darwin(v4);
  unint64_t v43 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = type metadata accessor for ImageStore.Key();
  uint64_t v7 = __chkstk_darwin(v40);
  uint64_t v9 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t result = __chkstk_darwin(v7);
  uint64_t v13 = (char *)&v39 - v12;
  uint64_t v14 = a2 + 64;
  uint64_t v15 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v16 = (a1 + 1) & ~v15;
  if (((1 << v16) & *(void *)(a2 + 64 + 8 * (v16 >> 6))) != 0)
  {
    uint64_t v45 = v11;
    uint64_t v41 = v5;
    uint64_t v17 = ~v15;
    unint64_t result = sub_1000CC6E0();
    uint64_t v44 = a2 + 64;
    if ((*(void *)(v14 + 8 * (v16 >> 6)) & (1 << v16)) != 0)
    {
      unint64_t v46 = (result + 1) & v17;
      uint64_t v47 = v17;
      uint64_t v18 = v44;
      unint64_t v19 = v45[9];
      id v20 = v41;
      uint64_t v45 = (unsigned int (**)(char *, uint64_t, uint64_t))(v41 + 6);
      ++v41;
      uint64_t v42 = (void (**)(char *, char *, uint64_t))(v20 + 4);
      while (1)
      {
        NSString v21 = v19;
        int64_t v22 = (void)v19 * v16;
        sub_1000AD2F4(*(void *)(a2 + 48) + (void)v19 * v16, (uint64_t)v13, (uint64_t (*)(void))type metadata accessor for ImageStore.Key);
        sub_1000CCAC0();
        sub_1000AD2F4((uint64_t)v13, (uint64_t)v9, (uint64_t (*)(void))type metadata accessor for ImageStore.Key);
        if ((*v45)(v9, 1, v4) == 1)
        {
          sub_1000CCAD0(1uLL);
        }
        else
        {
          uint64_t v23 = v4;
          id v24 = v43;
          (*v42)(v43, v9, v23);
          sub_1000CCAD0(0);
          sub_1000AD3C4((unint64_t *)&qword_100111370, (void (*)(uint64_t))&type metadata accessor for URL);
          sub_1000CC130();
          uint64_t v25 = v24;
          uint64_t v4 = v23;
          uint64_t v18 = v44;
          (*v41)(v25, v4);
        }
        Swift::Int v26 = sub_1000CCAF0();
        unint64_t result = sub_1000AD294((uint64_t)v13, (uint64_t (*)(void))type metadata accessor for ImageStore.Key);
        unint64_t v27 = v26 & v47;
        uint64_t v28 = v47;
        if ((uint64_t)a1 >= (uint64_t)v46)
        {
          unint64_t v19 = v21;
          if (v27 < v46) {
            goto LABEL_5;
          }
        }
        else
        {
          unint64_t v19 = v21;
          if (v27 >= v46) {
            goto LABEL_14;
          }
        }
        if ((uint64_t)a1 >= (uint64_t)v27)
        {
LABEL_14:
          uint64_t v29 = *(void *)(a2 + 48);
          unint64_t result = v29 + (void)v19 * a1;
          if ((uint64_t)((void)v19 * a1) < v22 || result >= (unint64_t)v19 + v29 + v22)
          {
            unint64_t result = swift_arrayInitWithTakeFrontToBack();
LABEL_19:
            unint64_t v19 = v21;
          }
          else if ((void)v19 * a1 != v22)
          {
            unint64_t result = swift_arrayInitWithTakeBackToFront();
            goto LABEL_19;
          }
          uint64_t v30 = *(void *)(a2 + 56);
          uint64_t v31 = (void *)(v30 + 8 * a1);
          uint64_t v32 = (void *)(v30 + 8 * v16);
          if (a1 != v16 || (a1 = v16, v31 >= v32 + 1))
          {
            *uint64_t v31 = *v32;
            a1 = v16;
          }
        }
LABEL_5:
        unint64_t v16 = (v16 + 1) & v28;
        if (((*(void *)(v18 + ((v16 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v16) & 1) == 0) {
          goto LABEL_25;
        }
      }
    }
    uint64_t v18 = v44;
LABEL_25:
    BOOL v33 = (uint64_t *)(v18 + 8 * (a1 >> 6));
    uint64_t v35 = *v33;
    uint64_t v34 = (-1 << a1) - 1;
  }
  else
  {
    BOOL v33 = (uint64_t *)(v14 + 8 * (a1 >> 6));
    uint64_t v34 = *v33;
    uint64_t v35 = (-1 << a1) - 1;
  }
  *BOOL v33 = v34 & v35;
  uint64_t v36 = *(void *)(a2 + 16);
  BOOL v37 = __OFSUB__(v36, 1);
  uint64_t v38 = v36 - 1;
  if (v37)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v38;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void *sub_1000AB018(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  sub_10001D64C((uint64_t *)&unk_10010E860);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = j__malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = sub_1000AB9F4((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_10002A1F8();
  if (v6 != v1)
  {
    __break(1u);
    return _swiftEmptyArrayStorage;
  }
  return v3;
}

void *sub_1000AB100(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_10;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v2) {
    return _swiftEmptyArrayStorage;
  }
  while (1)
  {
    if (v2 <= 0)
    {
      uint64_t v3 = _swiftEmptyArrayStorage;
    }
    else
    {
      sub_10001D64C(&qword_100111C70);
      uint64_t v3 = (void *)swift_allocObject();
      int64_t v4 = j__malloc_size(v3);
      uint64_t v5 = v4 - 32;
      if (v4 < 32) {
        uint64_t v5 = v4 - 25;
      }
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_10003DE38((unint64_t)(v3 + 4), v2, v1);
    unint64_t v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_1000CC890();
    swift_bridgeObjectRelease();
    if (!v2) {
      return _swiftEmptyArrayStorage;
    }
  }
  return v3;
}

void *sub_1000AB1F8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  sub_10001D64C((uint64_t *)&unk_100111C38);
  uint64_t v3 = *(void *)(sub_1000CABE0() - 8);
  uint64_t v4 = *(void *)(v3 + 72);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v6 = (void *)swift_allocObject();
  unint64_t result = (void *)j__malloc_size(v6);
  if (v4)
  {
    if ((void *)((char *)result - v5) != (void *)0x8000000000000000 || v4 != -1)
    {
      v6[2] = v1;
      v6[3] = 2 * ((uint64_t)((uint64_t)result - v5) / v4);
      swift_bridgeObjectRetain();
      uint64_t v9 = sub_1000ABBF4(&v10, (char *)v6 + v5, v1, a1);
      sub_10002A1F8();
      if (v9 == v1) {
        return v6;
      }
      __break(1u);
      return _swiftEmptyArrayStorage;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void *sub_1000AB32C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ImageStore.Key();
  uint64_t v29 = *(void *)(v2 - 8);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001D64C(&qword_100111C30);
  unint64_t result = (void *)sub_1000CC8A0();
  unint64_t v6 = result;
  int64_t v7 = 0;
  uint64_t v30 = a1;
  uint64_t v10 = *(void *)(a1 + 64);
  uint64_t v9 = a1 + 64;
  uint64_t v8 = v10;
  uint64_t v11 = 1 << *(unsigned char *)(v9 - 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & v8;
  uint64_t v27 = v9;
  int64_t v28 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v14 = (char *)(result + 8);
  if ((v12 & v8) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v15 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (unint64_t i = v15 | (v7 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v7 << 6))
  {
    uint64_t v20 = v30;
    unint64_t v21 = *(void *)(v29 + 72) * i;
    sub_1000AD2F4(*(void *)(v30 + 48) + v21, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for ImageStore.Key);
    int64_t v22 = *(void **)(*(void *)(v20 + 56) + 8 * i);
    *(void *)&v14[(i >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << i;
    unint64_t result = (void *)sub_1000AD35C((uint64_t)v4, v6[6] + v21, (uint64_t (*)(void))type metadata accessor for ImageStore.Key);
    *(void *)(v6[7] + 8 * i) = v22;
    uint64_t v23 = v6[2];
    BOOL v24 = __OFADD__(v23, 1);
    uint64_t v25 = v23 + 1;
    if (v24)
    {
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v6[2] = v25;
    unint64_t result = v22;
    if (v13) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v17 = v7 + 1;
    if (__OFADD__(v7, 1)) {
      goto LABEL_24;
    }
    if (v17 >= v28) {
      return v6;
    }
    unint64_t v18 = *(void *)(v27 + 8 * v17);
    ++v7;
    if (!v18)
    {
      int64_t v7 = v17 + 1;
      if (v17 + 1 >= v28) {
        return v6;
      }
      unint64_t v18 = *(void *)(v27 + 8 * v7);
      if (!v18)
      {
        int64_t v7 = v17 + 2;
        if (v17 + 2 >= v28) {
          return v6;
        }
        unint64_t v18 = *(void *)(v27 + 8 * v7);
        if (!v18) {
          break;
        }
      }
    }
LABEL_18:
    unint64_t v13 = (v18 - 1) & v18;
  }
  int64_t v19 = v17 + 3;
  if (v19 >= v28) {
    return v6;
  }
  unint64_t v18 = *(void *)(v27 + 8 * v19);
  if (v18)
  {
    int64_t v7 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v7 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v7 >= v28) {
      return v6;
    }
    unint64_t v18 = *(void *)(v27 + 8 * v7);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

unint64_t sub_1000AB5CC()
{
  unint64_t result = qword_100111BC8;
  if (!qword_100111BC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100111BC8);
  }
  return result;
}

void sub_1000AB620(void (*a1)(void *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1000A63D4(a1, a2, a3, a4, *(void **)(v4 + 16), *(id **)(v4 + 24), *(void *)(v4 + 32));
}

void sub_1000AB62C(void (*a1)(void *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1000A66D8(a1, a2, a3, a4, *(void **)(v4 + 16), *(void *)(v4 + 24), *(id **)(v4 + 32));
}

uint64_t sub_1000AB638()
{
  return sub_1000CB090();
}

uint64_t sub_1000AB664()
{
  uint64_t v1 = (int *)(type metadata accessor for ContentServiceRequest() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  unint64_t v4 = (*(void *)(*(void *)v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v16 = (v4 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v17 = v2 | 7;
  uint64_t v5 = v0 + v3;

  uint64_t v6 = v5 + v1[7];
  uint64_t v7 = type metadata accessor for LayoutContext();
  uint64_t v8 = (char *)(v6 + *(int *)(v7 + 24));
  uint64_t v9 = sub_1000CBEC0();
  uint64_t v10 = *(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8);
  v10(v8, v9);
  uint64_t v11 = v6 + *(int *)(v7 + 32);
  uint64_t v12 = sub_1000CB6D0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  unint64_t v13 = (id *)(v5 + v1[8]);

  uint64_t v14 = type metadata accessor for NewsWidgetInfo();
  v10((char *)v13 + *(int *)(v14 + 20), v9);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, ((((((((v16 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)+ 16, v17);
}

id sub_1000AB8A0(uint64_t *a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for ContentServiceRequest() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF8;
  return sub_1000A68C0(a1, (id *)(v1 + v4), *(void **)(v1 + v5), *(void **)(v1 + v6), *(void *)(v1 + v7), *(void **)(v1 + v8), *(void (**)(void *))(v1 + ((v8 + 15) & 0xFFFFFFFFFFFFFFF8)), *(void *)(v1 + ((v8 + 15) & 0xFFFFFFFFFFFFFFF8) + 8), *(void (**)(uint64_t))(v1 + ((((v8 + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t sub_1000AB998()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000AB9D8(uint64_t a1)
{
  return sub_1000A8BF8(a1, *(void *)(v1 + 16), *(uint64_t (**)(uint64_t))(v1 + 24));
}

uint64_t sub_1000AB9E4(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_1000AB9F4(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  unint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 56;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 56);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *unint64_t v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
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
    uint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *uint64_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    unint64_t result = swift_bridgeObjectRetain();
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

uint64_t sub_1000ABBF4(void *a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_10001D64C(&qword_10010F340);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000CABE0();
  uint64_t v41 = *(void *)(v11 - 8);
  uint64_t result = __chkstk_darwin(v11);
  uint64_t v40 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = a4;
  uint64_t v15 = a4 + 64;
  uint64_t v14 = *(void *)(a4 + 64);
  uint64_t v32 = -1 << *(unsigned char *)(a4 + 32);
  if (-v32 < 64) {
    uint64_t v16 = ~(-1 << -(char)v32);
  }
  else {
    uint64_t v16 = -1;
  }
  unint64_t v17 = v16 & v14;
  if (!a2)
  {
    int64_t v18 = 0;
    a3 = 0;
LABEL_39:
    uint64_t v28 = ~v32;
    *a1 = v42;
    a1[1] = v15;
    a1[2] = v28;
    a1[3] = v18;
    a1[4] = v17;
    return a3;
  }
  if (!a3)
  {
    int64_t v18 = 0;
    goto LABEL_39;
  }
  if (a3 < 0) {
    goto LABEL_41;
  }
  uint64_t v36 = a3;
  int64_t v18 = 0;
  a3 = 0;
  int64_t v19 = v40;
  uint64_t v38 = v41 + 16;
  uint64_t v39 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v41 + 56);
  uint64_t v37 = v41 + 48;
  uint64_t v35 = (uint64_t (**)(char *, char *, uint64_t))(v41 + 32);
  uint64_t v33 = v15;
  int64_t v34 = (unint64_t)(63 - v32) >> 6;
  int64_t v30 = v34 - 1;
  uint64_t v31 = a1;
  if (!v17) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v20 = __clz(__rbit64(v17));
  v17 &= v17 - 1;
  unint64_t v21 = v20 | (v18 << 6);
  while (1)
  {
    uint64_t v25 = v41;
    uint64_t v26 = *(void *)(v41 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v41 + 16))(v10, *(void *)(v42 + 56) + v26 * v21, v11);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v10, 0, 1, v11);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v10, 1, v11) == 1)
    {
      uint64_t v15 = v33;
      goto LABEL_38;
    }
    ++a3;
    uint64_t v27 = *v35;
    (*v35)(v19, v10, v11);
    uint64_t result = v27(a2, v19, v11);
    if (a3 == v36)
    {
      a3 = v36;
      a1 = v31;
      uint64_t v15 = v33;
      goto LABEL_39;
    }
    a2 += v26;
    if (v17) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v22 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    uint64_t v15 = v33;
    if (v22 >= v34) {
      goto LABEL_37;
    }
    unint64_t v23 = *(void *)(v33 + 8 * v22);
    if (!v23)
    {
      int64_t v24 = v18 + 2;
      ++v18;
      if (v22 + 1 >= v34) {
        goto LABEL_37;
      }
      unint64_t v23 = *(void *)(v33 + 8 * v24);
      if (v23) {
        goto LABEL_14;
      }
      int64_t v18 = v22 + 1;
      if (v22 + 2 >= v34) {
        goto LABEL_37;
      }
      unint64_t v23 = *(void *)(v33 + 8 * (v22 + 2));
      if (v23)
      {
        v22 += 2;
      }
      else
      {
        int64_t v18 = v22 + 2;
        if (v22 + 3 >= v34) {
          goto LABEL_37;
        }
        unint64_t v23 = *(void *)(v33 + 8 * (v22 + 3));
        if (!v23)
        {
          int64_t v24 = v22 + 4;
          int64_t v18 = v22 + 3;
          if (v22 + 4 < v34)
          {
            unint64_t v23 = *(void *)(v33 + 8 * v24);
            if (!v23)
            {
              while (1)
              {
                int64_t v22 = v24 + 1;
                if (__OFADD__(v24, 1)) {
                  goto LABEL_42;
                }
                if (v22 >= v34)
                {
                  int64_t v18 = v30;
                  goto LABEL_37;
                }
                unint64_t v23 = *(void *)(v33 + 8 * v22);
                ++v24;
                if (v23) {
                  goto LABEL_21;
                }
              }
            }
LABEL_14:
            int64_t v22 = v24;
            goto LABEL_21;
          }
LABEL_37:
          (*v39)(v10, 1, 1, v11);
          unint64_t v17 = 0;
LABEL_38:
          sub_1000227A8((uint64_t)v10, &qword_10010F340);
          a1 = v31;
          goto LABEL_39;
        }
        v22 += 3;
      }
    }
LABEL_21:
    unint64_t v17 = (v23 - 1) & v23;
    unint64_t v21 = __clz(__rbit64(v23)) + (v22 << 6);
    int64_t v18 = v22;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

void *sub_1000ABFE8(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v170 = a3;
  uint64_t v148 = type metadata accessor for ImageStore.Key();
  uint64_t v151 = *(void *)(v148 - 8);
  uint64_t v4 = __chkstk_darwin(v148);
  uint64_t v6 = (char *)&v147 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v158 = (uint64_t)&v147 - v7;
  uint64_t v8 = sub_10001D64C(&qword_10010F340);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  uint64_t v11 = (char *)&v147 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = (char *)&v147 - v13;
  uint64_t v15 = __chkstk_darwin(v12);
  uint64_t v17 = (uint64_t)&v147 - v16;
  uint64_t v18 = __chkstk_darwin(v15);
  v169 = (char *)&v147 - v19;
  __chkstk_darwin(v18);
  unint64_t v21 = (char *)&v147 - v20;
  uint64_t v22 = sub_1000CABE0();
  uint64_t v160 = *(void *)(v22 - 8);
  uint64_t v23 = __chkstk_darwin(v22);
  v155 = (char *)&v147 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __chkstk_darwin(v23);
  v166 = (char *)&v147 - v26;
  uint64_t v27 = __chkstk_darwin(v25);
  v156 = (char *)&v147 - v28;
  uint64_t v29 = __chkstk_darwin(v27);
  v167 = (char *)&v147 - v30;
  uint64_t v31 = __chkstk_darwin(v29);
  v174 = (char *)&v147 - v32;
  __chkstk_darwin(v31);
  int64_t v34 = (char *)&v147 - v33;
  v182 = &_swiftEmptyDictionarySingleton;
  id v35 = [a2 banner];
  v168 = v14;
  uint64_t v179 = v22;
  if (v35)
  {
    uint64_t v36 = v35;
    if ([v35 imageMethod] != (id)2)
    {

      goto LABEL_10;
    }
    id v37 = [v36 imageURL];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = v6;
      uint64_t v40 = v174;
      sub_1000CABA0();

      uint64_t v41 = v160;
      uint64_t v42 = v40;
      uint64_t v6 = v39;
      uint64_t v43 = v179;
      v178 = *(void (***)(char *, uint64_t, uint64_t, uint64_t))(v160 + 32);
      ((void (*)(char *, char *, uint64_t))v178)(v21, v42, v179);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v41 + 56))(v21, 0, 1, v43);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v41 + 48))(v21, 1, v43) != 1)
      {
        ((void (*)(char *, char *, uint64_t))v178)(v34, v21, v43);
        sub_1000A9D04((uint64_t)v34, v170, (uint64_t *)&v182);

        (*(void (**)(char *, uint64_t))(v160 + 8))(v34, v43);
LABEL_9:
        uint64_t v14 = v168;
        goto LABEL_10;
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v160 + 56))(v21, 1, 1, v22);
    }

    sub_1000227A8((uint64_t)v21, &qword_10010F340);
    goto LABEL_9;
  }
LABEL_10:
  id v44 = [a2 sections];
  id v45 = [v44 array];

  uint64_t v46 = sub_1000CC3B0();
  unint64_t v47 = (unint64_t)sub_10006D51C(v46);
  swift_bridgeObjectRelease();
  v157 = v6;
  unint64_t v152 = v47;
  if (v47 >> 62) {
    goto LABEL_99;
  }
  uint64_t v48 = *(void *)((v47 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v49 = (uint64_t)v167;
  if (!v48)
  {
LABEL_100:
    swift_bridgeObjectRelease();
    swift_beginAccess();
    return v182;
  }
LABEL_12:
  unint64_t v50 = 0;
  unint64_t v154 = v152 & 0xC000000000000001;
  uint64_t v150 = v152 & 0xFFFFFFFFFFFFFF8;
  unint64_t v149 = v152 + 32;
  v177 = (void (**)(char *, char *, uint64_t))(v160 + 32);
  v178 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v160 + 56);
  v175 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v160 + 48);
  uint64_t v162 = v160 + 16;
  v165 = (void (**)(void))(v160 + 8);
  v163 = v11;
  uint64_t v164 = v17;
  uint64_t v153 = v48;
  while (1)
  {
    if (v154)
    {
      id v51 = (id)sub_1000CC780();
    }
    else
    {
      if (v50 >= *(void *)(v150 + 16)) {
        goto LABEL_94;
      }
      id v51 = *(id *)(v149 + 8 * v50);
    }
    id v161 = v51;
    BOOL v52 = __OFADD__(v50, 1);
    unint64_t v53 = v50 + 1;
    if (v52)
    {
LABEL_93:
      __break(1u);
LABEL_94:
      __break(1u);
LABEL_95:
      __break(1u);
LABEL_96:
      __break(1u);
LABEL_97:
      __break(1u);
LABEL_98:
      __break(1u);
LABEL_99:
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_1000CC890();
      swift_bridgeObjectRelease();
      uint64_t v49 = (uint64_t)v167;
      if (!v48) {
        goto LABEL_100;
      }
      goto LABEL_12;
    }
    unint64_t v159 = v53;
    sub_10006BDD0();
    unint64_t v55 = v54;
    if (v54 >> 62) {
      break;
    }
    uint64_t v56 = *(void *)((v54 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v56) {
      goto LABEL_21;
    }
LABEL_13:

    swift_bridgeObjectRelease();
    unint64_t v50 = v159;
    if (v159 == v153) {
      goto LABEL_100;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v56 = sub_1000CC890();
  swift_bridgeObjectRelease();
  if (!v56) {
    goto LABEL_13;
  }
LABEL_21:
  unint64_t v176 = v55 & 0xC000000000000001;
  uint64_t v17 = 4;
  uint64_t v171 = v56;
  unint64_t v172 = v55;
  while (1)
  {
    uint64_t v57 = v17 - 4;
    if (v176)
    {
      sub_1000CC780();
      uint64_t v11 = (char *)(v17 - 3);
      if (__OFADD__(v57, 1)) {
        goto LABEL_92;
      }
    }
    else
    {
      swift_unknownObjectRetain();
      uint64_t v11 = (char *)(v17 - 3);
      if (__OFADD__(v57, 1))
      {
LABEL_92:
        __break(1u);
        goto LABEL_93;
      }
    }
    v181 = &OBJC_PROTOCOL___NTHeadlineProviding;
    uint64_t v58 = swift_dynamicCastObjCProtocolConditional();
    if (v58) {
      break;
    }
    swift_unknownObjectRelease();
LABEL_23:
    ++v17;
    if (v11 == (char *)v56) {
      goto LABEL_13;
    }
  }
  id v59 = (void *)v58;
  swift_unknownObjectRetain();
  id v60 = [v59 thumbnailRemoteURL];
  if (!v60)
  {
    id v69 = *v178;
    uint64_t v64 = (uint64_t)v169;
    (*v178)(v169, 1, 1, v179);
    goto LABEL_34;
  }
  uint64_t v61 = v60;
  v173 = v11;
  id v62 = v174;
  sub_1000CABA0();

  uint64_t v63 = *v177;
  uint64_t v64 = (uint64_t)v169;
  uint64_t v65 = v62;
  uint64_t v66 = v179;
  (*v177)(v169, v65, v179);
  uint64_t v67 = *v178;
  (*v178)((char *)v64, 0, 1, v66);
  uint64_t v68 = *v175;
  if ((*v175)(v64, 1, v66) == 1)
  {
    uint64_t v14 = v168;
    id v69 = v67;
    uint64_t v11 = v173;
LABEL_34:
    sub_1000227A8(v64, &qword_10010F340);
    goto LABEL_46;
  }
  v63((char *)v49, (char *)v64, v66);
  if (*(void *)(v170 + 16) && (unint64_t v70 = sub_10003CF8C(v49), (v71 & 1) != 0))
  {
    uint64_t v72 = *(void (**)(uint64_t, unint64_t, uint64_t))(v160 + 16);
    uint64_t v73 = v164;
    uint64_t v74 = v179;
    v72(v164, *(void *)(v170 + 56) + *(void *)(v160 + 72) * v70, v179);
    id v69 = v67;
    v67((char *)v73, 0, 1, v74);
    unsigned int v75 = v68(v73, 1, v74);
    uint64_t v14 = v168;
    if (v75 != 1)
    {
      uint64_t v76 = v179;
      v63(v156, (char *)v73, v179);
      uint64_t v77 = v158;
      v72(v158, (unint64_t)v167, v76);
      v67((char *)v77, 0, 1, v76);
      sub_1000CABB0();
      id v78 = objc_allocWithZone((Class)UIImage);
      NSString v79 = sub_1000CC1C0();
      swift_bridgeObjectRelease();
      uint64_t v14 = (char *)[v78 initWithContentsOfFile:v79];

      swift_beginAccess();
      uint64_t v11 = v173;
      if (v14)
      {
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v81 = v182;
        v180 = v182;
        v182 = (void *)0x8000000000000000;
        unint64_t v83 = sub_10003CC4C(v77);
        uint64_t v84 = v81[2];
        BOOL v85 = (v82 & 1) == 0;
        uint64_t v86 = v84 + v85;
        if (__OFADD__(v84, v85)) {
          goto LABEL_95;
        }
        char v87 = isUniquelyReferenced_nonNull_native;
        if (v81[3] >= v86)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            char v145 = v82;
            sub_1000941D8();
            char v82 = v145;
          }
        }
        else
        {
          char v88 = v82;
          sub_100092A44(v86, v87);
          unint64_t v89 = sub_10003CC4C(v158);
          if ((v88 & 1) != (v90 & 1)) {
            goto LABEL_101;
          }
          unint64_t v83 = v89;
          char v82 = v88;
        }
        uint64_t v135 = v158;
        uint64_t v136 = v180;
        if (v82)
        {
          v137 = v14;
          uint64_t v138 = v180[7];
          uint64_t v139 = 8 * v83;

          *(void *)(v138 + v139) = v137;
        }
        else
        {
          v180[(v83 >> 6) + 8] |= 1 << v83;
          sub_1000AD2F4(v135, v136[6] + *(void *)(v151 + 72) * v83, (uint64_t (*)(void))type metadata accessor for ImageStore.Key);
          *(void *)(v136[7] + 8 * v83) = v14;
          uint64_t v140 = v136[2];
          BOOL v52 = __OFADD__(v140, 1);
          uint64_t v141 = v140 + 1;
          if (v52) {
            goto LABEL_97;
          }
          v136[2] = v141;
        }
        v182 = v136;
        swift_bridgeObjectRelease();
        sub_1000AD294(v158, (uint64_t (*)(void))type metadata accessor for ImageStore.Key);
        uint64_t v14 = v168;
      }
      else
      {
        swift_bridgeObjectRetain();
        unint64_t v122 = sub_10003CC4C(v77);
        char v124 = v123;
        swift_bridgeObjectRelease();
        if (v124)
        {
          char v125 = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v126 = (uint64_t)v182;
          v180 = v182;
          v182 = (void *)0x8000000000000000;
          uint64_t v14 = v168;
          if ((v125 & 1) == 0)
          {
            sub_1000941D8();
            uint64_t v126 = (uint64_t)v180;
          }
          sub_1000AD294(*(void *)(v126 + 48) + *(void *)(v151 + 72) * v122, (uint64_t (*)(void))type metadata accessor for ImageStore.Key);
          uint64_t v127 = *(void **)(*(void *)(v126 + 56) + 8 * v122);
          sub_1000AABAC(v122, v126);
          v182 = (void *)v126;
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v127 = 0;
          uint64_t v14 = v168;
        }
        sub_1000AD294(v158, (uint64_t (*)(void))type metadata accessor for ImageStore.Key);
      }
      swift_endAccess();
      id v91 = *v165;
      ((void (*)(char *, uint64_t))*v165)(v156, v179);
      uint64_t v92 = v167;
      goto LABEL_45;
    }
  }
  else
  {
    uint64_t v73 = v164;
    id v69 = v67;
    v67((char *)v164, 1, 1, v179);
    uint64_t v14 = v168;
  }
  sub_1000227A8(v73, &qword_10010F340);
  id v91 = *v165;
  uint64_t v92 = v167;
  uint64_t v11 = v173;
LABEL_45:
  uint64_t v49 = (uint64_t)v92;
  v91();
LABEL_46:
  id v93 = [v59 sourceNameImageRemoteURL];
  if (!v93)
  {
    v69(v14, 1, 1, v179);
    goto LABEL_59;
  }
  id v94 = v93;
  NSString v95 = v174;
  sub_1000CABA0();

  id v96 = *v177;
  uint64_t v97 = v95;
  uint64_t v98 = v179;
  (*v177)(v14, v97, v179);
  v69(v14, 0, 1, v98);
  uint64_t v99 = *v175;
  if ((*v175)((uint64_t)v14, 1, v98) == 1)
  {
LABEL_59:
    swift_unknownObjectRelease_n();
    sub_1000227A8((uint64_t)v14, &qword_10010F340);
LABEL_62:
    uint64_t v56 = v171;
    goto LABEL_23;
  }
  uint64_t v100 = (uint64_t)v166;
  v96(v166, v14, v98);
  if (!*(void *)(v170 + 16) || (unint64_t v101 = sub_10003CF8C(v100), (v102 & 1) == 0))
  {
    uint64_t v104 = (uint64_t)v163;
    uint64_t v105 = v179;
    v69(v163, 1, 1, v179);
    goto LABEL_61;
  }
  uint64_t v103 = *(void (**)(char *, unint64_t, uint64_t))(v160 + 16);
  uint64_t v104 = (uint64_t)v163;
  uint64_t v105 = v179;
  v103(v163, *(void *)(v170 + 56) + *(void *)(v160 + 72) * v101, v179);
  v69((char *)v104, 0, 1, v105);
  if (v99(v104, 1, v105) == 1)
  {
LABEL_61:
    sub_1000227A8(v104, &qword_10010F340);
    swift_unknownObjectRelease_n();
    uint64_t v49 = (uint64_t)v167;
    uint64_t v14 = v168;
    ((void (*)(char *, uint64_t))*v165)(v166, v105);
    goto LABEL_62;
  }
  v96(v155, (char *)v104, v105);
  uint64_t v14 = v157;
  v103(v157, (unint64_t)v166, v105);
  v69(v14, 0, 1, v105);
  sub_1000CABB0();
  id v106 = objc_allocWithZone((Class)UIImage);
  NSString v107 = sub_1000CC1C0();
  swift_bridgeObjectRelease();
  uint64_t v108 = (char *)[v106 initWithContentsOfFile:v107];

  swift_beginAccess();
  uint64_t v49 = (uint64_t)v167;
  if (!v108)
  {
    swift_bridgeObjectRetain();
    unint64_t v128 = sub_10003CC4C((uint64_t)v14);
    char v130 = v129;
    swift_bridgeObjectRelease();
    if (v130)
    {
      char v131 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v132 = (uint64_t)v182;
      v180 = v182;
      v182 = (void *)0x8000000000000000;
      uint64_t v14 = v168;
      v133 = v166;
      if ((v131 & 1) == 0)
      {
        sub_1000941D8();
        uint64_t v132 = (uint64_t)v180;
      }
      sub_1000AD294(*(void *)(v132 + 48) + *(void *)(v151 + 72) * v128, (uint64_t (*)(void))type metadata accessor for ImageStore.Key);
      v134 = *(void **)(*(void *)(v132 + 56) + 8 * v128);
      sub_1000AABAC(v128, v132);
      v182 = (void *)v132;
      swift_bridgeObjectRelease();
    }
    else
    {
      v134 = 0;
      uint64_t v14 = v168;
      v133 = v166;
    }
    sub_1000AD294((uint64_t)v157, (uint64_t (*)(void))type metadata accessor for ImageStore.Key);

    goto LABEL_87;
  }
  v173 = v108;
  char v109 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v110 = v182;
  v180 = v182;
  v182 = (void *)0x8000000000000000;
  unint64_t v112 = sub_10003CC4C((uint64_t)v14);
  uint64_t v113 = v110[2];
  BOOL v114 = (v111 & 1) == 0;
  uint64_t v115 = v113 + v114;
  if (__OFADD__(v113, v114)) {
    goto LABEL_96;
  }
  char v116 = v111;
  if (v110[3] >= v115)
  {
    uint64_t v14 = v168;
    if (v109)
    {
      uint64_t v119 = v180;
      if ((v111 & 1) == 0) {
        goto LABEL_56;
      }
    }
    else
    {
      sub_1000941D8();
      uint64_t v119 = v180;
      if ((v116 & 1) == 0) {
        goto LABEL_56;
      }
    }
    goto LABEL_80;
  }
  sub_100092A44(v115, v109);
  unint64_t v117 = sub_10003CC4C((uint64_t)v157);
  uint64_t v14 = v168;
  if ((v116 & 1) == (v118 & 1))
  {
    unint64_t v112 = v117;
    uint64_t v119 = v180;
    if ((v116 & 1) == 0)
    {
LABEL_56:
      v119[(v112 >> 6) + 8] |= 1 << v112;
      sub_1000AD2F4((uint64_t)v157, v119[6] + *(void *)(v151 + 72) * v112, (uint64_t (*)(void))type metadata accessor for ImageStore.Key);
      *(void *)(v119[7] + 8 * v112) = v173;
      uint64_t v120 = v119[2];
      BOOL v52 = __OFADD__(v120, 1);
      uint64_t v121 = v120 + 1;
      if (v52) {
        goto LABEL_98;
      }
      v119[2] = v121;
      goto LABEL_81;
    }
LABEL_80:
    uint64_t v142 = v119[7];
    uint64_t v143 = 8 * v112;

    *(void *)(v142 + v143) = v173;
LABEL_81:
    v182 = v119;
    swift_bridgeObjectRelease();
    sub_1000AD294((uint64_t)v157, (uint64_t (*)(void))type metadata accessor for ImageStore.Key);
    v133 = v166;
LABEL_87:
    swift_endAccess();
    v144 = *v165;
    ((void (*)(char *, uint64_t))*v165)(v155, v105);
    swift_unknownObjectRelease_n();
    ((void (*)(char *, uint64_t))v144)(v133, v105);
    goto LABEL_62;
  }
LABEL_101:
  uint64_t result = (void *)sub_1000CCA60();
  __break(1u);
  return result;
}

uint64_t sub_1000AD22C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10001D64C(&qword_100111C00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000AD294(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000AD2F4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000AD35C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000AD3C4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000AD40C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000AD444()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1000AD46C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000AD47C()
{
  return swift_release();
}

uint64_t sub_1000AD484()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1000AD4AC()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

unsigned char *storeEnumTagSinglePayload for ContentService.Errors(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000AD5B0);
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

ValueMetadata *type metadata accessor for ContentService.Errors()
{
  return &type metadata for ContentService.Errors;
}

uint64_t sub_1000AD5E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000AD5FC);
}

uint64_t sub_1000AD5FC(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = type metadata accessor for LayoutContext();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
      uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = type metadata accessor for NewsWidgetInfo();
      uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = (char *)a1 + *(int *)(a3 + 24);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t sub_1000AD728(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000AD73C);
}

void *sub_1000AD73C(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for LayoutContext();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = (char *)v5 + *(int *)(a4 + 20);
      uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return (void *)v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = type metadata accessor for NewsWidgetInfo();
      uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = (char *)v5 + *(int *)(a4 + 24);
      return (void *)v14(v16, a2, a2, v15);
    }
  }
  return result;
}

unint64_t sub_1000AD86C()
{
  unint64_t result = qword_100111D10[0];
  if (!qword_100111D10[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100111D10);
  }
  return result;
}

uint64_t sub_1000AD8D4()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1000AD934(uint64_t a1, uint64_t a2, uint64_t a3, long long *a4)
{
  uint64_t v8 = swift_allocObject();
  sub_1000AD99C(a1, a2, a3, a4);
  return v8;
}

uint64_t sub_1000AD99C(uint64_t a1, uint64_t a2, uint64_t a3, long long *a4)
{
  uint64_t v16 = a3;
  uint64_t v17 = a1;
  uint64_t v18 = a2;
  uint64_t v15 = sub_1000CC580();
  uint64_t v6 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000CC570();
  __chkstk_darwin(v9);
  uint64_t v10 = sub_1000CBD90();
  __chkstk_darwin(v10 - 8);
  uint64_t v14 = sub_100036814(0, &qword_10010EF98);
  sub_1000CBD70();
  *(void *)&long long v19 = _swiftEmptyArrayStorage;
  sub_1000B36D8((unint64_t *)&qword_10010EFA0, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_10001D64C(&qword_10010EFA8);
  sub_1000B3720((unint64_t *)&qword_10010EFB0, &qword_10010EFA8);
  uint64_t v11 = v16;
  sub_1000CC6D0();
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v15);
  v4[19] = sub_1000CC5C0();
  uint64_t v12 = v18;
  v4[2] = v17;
  v4[3] = v12;
  sub_10003AA3C(v11, (uint64_t)(v4 + 4));
  sub_100020110(a4, *((void *)a4 + 3));
  sub_10001D64C(&qword_100111E38);
  uint64_t result = sub_1000CAEC0();
  if (v20)
  {
    sub_1000201A8(v11);
    sub_100078088(&v19, (uint64_t)(v4 + 9));
    sub_100078088(a4, (uint64_t)(v4 + 14));
    return (uint64_t)v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1000ADC78@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  uint64_t v5 = type metadata accessor for ContentServiceRequest();
  uint64_t v6 = v5 - 8;
  __chkstk_darwin(v5);
  uint64_t v8 = (id *)((char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = type metadata accessor for TodayContent();
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (uint64_t *)((char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = type metadata accessor for EntryRequest();
  uint64_t v13 = v12 - 8;
  __chkstk_darwin(v12);
  uint64_t v15 = (uint64_t *)((char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v16 = (void *)(*(uint64_t (**)(void))(*(void *)(v4 + 88) + 24))();
  sub_1000ADF10(v16, v17, v15);

  uint64_t v18 = sub_100020110(v2 + 4, v2[7]);
  sub_100020110((void *)(*v18 + 16), *(void *)(*v18 + 40));
  uint64_t v19 = sub_100059574();
  sub_1000B34EC((uint64_t)v15 + *(int *)(v13 + 28), (uint64_t)v8 + *(int *)(v6 + 28), (uint64_t (*)(void))type metadata accessor for LayoutContext);
  sub_1000B34EC((uint64_t)v15 + *(int *)(v13 + 32), (uint64_t)v8 + *(int *)(v6 + 32), (uint64_t (*)(void))type metadata accessor for NewsWidgetInfo);
  id *v8 = (id)v19;
  sub_1000A8D10(v8, 4, v11);
  sub_1000B35D0((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for ContentServiceRequest);
  uint64_t v20 = type metadata accessor for NewsTimelineEntry();
  sub_1000B34EC((uint64_t)v11, a1 + *(int *)(v20 + 20), (uint64_t (*)(void))type metadata accessor for TodayContent);
  sub_1000CACB0();
  sub_1000B35D0((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for TodayContent);
  return sub_1000B35D0((uint64_t)v15, (uint64_t (*)(void))type metadata accessor for EntryRequest);
}

id sub_1000ADF10@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v65 = a2;
  unint64_t v70 = a3;
  char v71 = a1;
  uint64_t v3 = sub_1000CBEC0();
  uint64_t v68 = *(void *)(v3 - 8);
  uint64_t v69 = v3;
  __chkstk_darwin(v3);
  uint64_t v67 = (char *)&v60 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = (int *)type metadata accessor for LayoutContext();
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v66 = (uint64_t)&v60 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v60 - v8;
  uint64_t v10 = sub_10001D64C(&qword_1001101B8);
  __chkstk_darwin(v10 - 8);
  id v60 = (char *)&v60 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000CB6D0();
  uint64_t v62 = *(void *)(v12 - 8);
  uint64_t v63 = v12;
  __chkstk_darwin(v12);
  uint64_t v61 = (char *)&v60 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1000CC090();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v60 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v60 - v19;
  sub_1000CC0B0();
  swift_getKeyPath();
  uint64_t v21 = sub_1000CC0A0();
  swift_release();
  uint64_t v22 = *(void (**)(char *, uint64_t))(v15 + 8);
  v22(v20, v14);
  if (v21)
  {
    uint64_t v23 = *(void *)(v21 + 16);
    if (v23)
    {
      uint64_t v24 = (double *)(v21 + 32);
      double v25 = 2.0;
      do
      {
        double v26 = *v24++;
        double v27 = v26;
        if (v25 <= v26) {
          double v25 = v27;
        }
        --v23;
      }
      while (v23);
    }
    else
    {
      double v25 = 2.0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    double v25 = 3.0;
  }
  uint64_t v28 = v61;
  sub_1000CC0B0();
  swift_getKeyPath();
  uint64_t v29 = sub_1000CC0A0();
  swift_release();
  v22(v18, v14);
  if (!v29)
  {
    uint64_t v31 = v62;
    uint64_t v30 = v63;
    uint64_t v32 = (uint64_t)v60;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v62 + 56))(v60, 1, 1, v63);
    uint64_t v34 = v64;
    uint64_t v35 = v65;
LABEL_17:
    (*(void (**)(char *, void, uint64_t))(v31 + 104))(v28, enum case for ContentSizeCategory.large(_:), v30);
    sub_1000227A8(v32, &qword_1001101B8);
    goto LABEL_19;
  }
  if (*(void *)(v29 + 16))
  {
    uint64_t v31 = v62;
    uint64_t v30 = v63;
    uint64_t v32 = (uint64_t)v60;
    (*(void (**)(char *, unint64_t, uint64_t))(v62 + 16))(v60, v29 + ((*(unsigned __int8 *)(v62 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v62 + 80)), v63);
    uint64_t v33 = 0;
    uint64_t v34 = v64;
    uint64_t v35 = v65;
  }
  else
  {
    uint64_t v33 = 1;
    uint64_t v34 = v64;
    uint64_t v35 = v65;
    uint64_t v31 = v62;
    uint64_t v30 = v63;
    uint64_t v32 = (uint64_t)v60;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v31 + 56))(v32, v33, 1, v30);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v31 + 48))(v32, 1, v30) == 1) {
    goto LABEL_17;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v31 + 32))(v28, v32, v30);
LABEL_19:
  sub_1000CC080();
  sub_1000CC070();
  uint64_t v37 = v36;
  uint64_t v39 = v38;
  (*(void (**)(char *, char *, uint64_t))(v31 + 16))(&v9[v5[8]], v28, v30);
  char v40 = sub_1000CC0C0();
  __asm { FMOV            V0.2D, #16.0 }
  *(_OWORD *)uint64_t v9 = _Q0;
  uint64_t v46 = &v9[v5[7]];
  *(void *)uint64_t v46 = v37;
  *((void *)v46 + 1) = v39;
  *(double *)&v9[v5[9]] = v25;
  *(void *)&v9[v5[10]] = 0x3FF0000000000000;
  v9[v5[11]] = 0;
  v9[v5[12]] = v40 & 1;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v48 = (*(uint64_t (**)(uint64_t, uint64_t))(v35 + 8))(ObjectType, v35);
  uint64_t v49 = v66;
  sub_1000B34EC((uint64_t)v9, v66, (uint64_t (*)(void))type metadata accessor for LayoutContext);
  unint64_t v50 = v67;
  sub_1000CC080();
  sub_1000B35D0((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for LayoutContext);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v28, v30);
  uint64_t v52 = *(void *)(v34 + 16);
  uint64_t v51 = *(void *)(v34 + 24);
  uint64_t v53 = type metadata accessor for EntryRequest();
  unint64_t v54 = v70;
  unint64_t v55 = (char *)v70 + *(int *)(v53 + 24);
  *(void *)unint64_t v55 = v71;
  *((void *)v55 + 1) = v35;
  uint64_t v56 = type metadata accessor for NewsWidgetInfo();
  (*(void (**)(char *, char *, uint64_t))(v68 + 32))(&v55[*(int *)(v56 + 20)], v50, v69);
  uint64_t v57 = &v55[*(int *)(v56 + 24)];
  *(void *)uint64_t v57 = v52;
  *((void *)v57 + 1) = v51;
  *unint64_t v54 = v48;
  sub_1000B3630(v49, (uint64_t)v54 + *(int *)(v53 + 20), (uint64_t (*)(void))type metadata accessor for LayoutContext);
  swift_bridgeObjectRetain();
  uint64_t v58 = v71;

  return v58;
}

uint64_t sub_1000AE578(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  v23[0] = a4;
  uint64_t v9 = *v4;
  uint64_t v10 = sub_10001D64C(&qword_10010ED98);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for NewsWidgetInfo();
  uint64_t v14 = v13 - 8;
  __chkstk_darwin(v13);
  uint64_t v16 = (uint64_t *)((char *)v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v17 = *(void *)(v9 + 88);
  sub_1000CC080();
  uint64_t v18 = v5[2];
  uint64_t v19 = v5[3];
  void *v16 = a1;
  v16[1] = v17;
  uint64_t v20 = (void *)((char *)v16 + *(int *)(v14 + 32));
  void *v20 = v18;
  v20[1] = v19;
  sub_100020110(v5 + 9, v5[12]);
  swift_bridgeObjectRetain();
  id v21 = a1;
  sub_1000214C0((uint64_t)v12);
  sub_1000AE760(v21, a2, (uint64_t)v12, a3, v23[0]);
  sub_1000227A8((uint64_t)v12, &qword_10010ED98);
  return sub_1000B35D0((uint64_t)v16, (uint64_t (*)(void))type metadata accessor for NewsWidgetInfo);
}

uint64_t sub_1000AE760(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v68 = a4;
  uint64_t v69 = a5;
  uint64_t v67 = a2;
  uint64_t v8 = *v5;
  uint64_t v9 = sub_1000CC0D0();
  uint64_t v65 = *(void *)(v9 - 8);
  uint64_t v66 = v9;
  __chkstk_darwin(v9);
  uint64_t v63 = v10;
  uint64_t v64 = (char *)&v55 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10001D64C(&qword_10010ED98);
  uint64_t v58 = *(unsigned __int8 **)(v11 - 8);
  __chkstk_darwin(v11 - 8);
  uint64_t v59 = v12;
  uint64_t v13 = (char *)&v55 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for EntryRequest();
  uint64_t v60 = *(void *)(v14 - 8);
  uint64_t v15 = __chkstk_darwin(v14 - 8);
  uint64_t v61 = v16;
  uint64_t v62 = (uint64_t)&v55 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  char v71 = (uint64_t *)((char *)&v55 - v17);
  sub_100036814(0, (unint64_t *)&qword_100110C20);
  id v18 = a1;
  uint64_t v19 = sub_1000CC630();
  os_log_type_t v20 = sub_1000CC530();
  if (os_log_type_enabled(v19, v20))
  {
    id v21 = (uint8_t *)swift_slowAlloc();
    uint64_t v56 = (void *)swift_slowAlloc();
    *(_DWORD *)id v21 = 138412290;
    id v72 = v18;
    id v22 = v18;
    uint64_t v57 = a3;
    id v23 = v22;
    sub_1000CC660();
    *uint64_t v56 = v18;

    a3 = v57;
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "fetching news entry for configuration %@", v21, 0xCu);
    sub_10001D64C((uint64_t *)&unk_100111E00);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v24 = *(void *)(v8 + 88);
  uint64_t v25 = v70;
  double v26 = v71;
  id v27 = sub_1000ADF10(v18, v24, v71);
  __chkstk_darwin(v27);
  *(&v55 - 2) = v25;
  *(&v55 - 1) = (uint64_t)v26;
  type metadata accessor for NewsTimelineEntry();
  sub_1000CB0A0();
  sub_100036850(a3, (uint64_t)v13, &qword_10010ED98);
  unint64_t v28 = (v58[80] + 32) & ~(unint64_t)v58[80];
  unint64_t v29 = (v59 + v28 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v30 = swift_allocObject();
  uint64_t v31 = *(void **)(v8 + 80);
  *(void *)(v30 + 16) = v31;
  *(void *)(v30 + 24) = v24;
  uint64_t v56 = v31;
  uint64_t v57 = v24;
  sub_1000365A0((uint64_t)v13, v30 + v28, &qword_10010ED98);
  *(void *)(v30 + v29) = v18;
  id v32 = v18;
  uint64_t v33 = (void *)sub_1000CB010();
  sub_1000CB070();
  swift_release();
  swift_release();

  uint64_t v34 = (void *)swift_allocObject();
  v34[2] = v31;
  v34[3] = v24;
  uint64_t v35 = v68;
  uint64_t v36 = v69;
  v34[4] = v32;
  v34[5] = v35;
  v34[6] = v36;
  uint64_t v58 = (unsigned __int8 *)v32;
  swift_retain();
  uint64_t v37 = (void *)sub_1000CB010();
  uint64_t v59 = sub_1000CB030();
  swift_release();
  swift_release();

  uint64_t v38 = v64;
  uint64_t v39 = v65;
  uint64_t v40 = v66;
  (*(void (**)(char *, uint64_t, uint64_t))(v65 + 16))(v64, v67, v66);
  uint64_t v41 = v62;
  sub_1000B34EC((uint64_t)v71, v62, (uint64_t (*)(void))type metadata accessor for EntryRequest);
  unint64_t v42 = (*(unsigned __int8 *)(v39 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80);
  unint64_t v43 = (v63 + v42 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v44 = (v43 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v45 = (v44 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v46 = (*(unsigned __int8 *)(v60 + 80) + v45 + 8) & ~(unint64_t)*(unsigned __int8 *)(v60 + 80);
  uint64_t v47 = swift_allocObject();
  uint64_t v48 = v57;
  *(void *)(v47 + 16) = v56;
  *(void *)(v47 + 24) = v48;
  (*(void (**)(unint64_t, char *, uint64_t))(v39 + 32))(v47 + v42, v38, v40);
  uint64_t v49 = v58;
  *(void *)(v47 + v43) = v58;
  unint64_t v50 = (void *)(v47 + v44);
  uint64_t v51 = v69;
  *unint64_t v50 = v68;
  v50[1] = v51;
  *(void *)(v47 + v45) = v70;
  sub_1000B3630(v41, v47 + v46, (uint64_t (*)(void))type metadata accessor for EntryRequest);
  id v52 = v49;
  swift_retain();
  swift_retain();
  uint64_t v53 = (void *)sub_1000CB010();
  sub_1000CB040();
  swift_release();
  swift_release();
  swift_release();

  return sub_1000B35D0((uint64_t)v71, (uint64_t (*)(void))type metadata accessor for EntryRequest);
}

uint64_t sub_1000AEDD4(id a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  uint64_t v61 = a4;
  uint64_t v60 = a3;
  id v57 = a1;
  uint64_t v6 = *v4;
  uint64_t v7 = sub_1000CC0D0();
  uint64_t v73 = *(void *)(v7 - 8);
  uint64_t v74 = v7;
  __chkstk_darwin(v7);
  uint64_t v67 = v8;
  id v72 = (char *)&v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = (char *)type metadata accessor for TaskContext();
  uint64_t v9 = __chkstk_darwin(v58);
  uint64_t v59 = (uint64_t)&v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v52 - v11;
  uint64_t v13 = sub_10001D64C(&qword_10010ED98);
  uint64_t v64 = *(void *)(v13 - 8);
  uint64_t v14 = __chkstk_darwin(v13 - 8);
  uint64_t v65 = v15;
  uint64_t v66 = (uint64_t)&v52 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v52 - v16;
  uint64_t v18 = type metadata accessor for NewsWidgetInfo();
  uint64_t v62 = *(void *)(v18 - 8);
  uint64_t v19 = __chkstk_darwin(v18);
  uint64_t v71 = (uint64_t)&v52 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = v20;
  __chkstk_darwin(v19);
  id v22 = (uint64_t *)((char *)&v52 - v21);
  uint64_t v23 = v4[17];
  uint64_t v53 = v4 + 14;
  sub_100020110(v4 + 14, v23);
  type metadata accessor for TelemetryManager();
  uint64_t result = sub_1000CAEB0();
  if (result)
  {
    uint64_t v56 = result;
    uint64_t v55 = v6;
    uint64_t v25 = *(void *)(v6 + 88);
    uint64_t v70 = (void *)a2;
    sub_1000CC080();
    uint64_t v26 = v4[2];
    uint64_t v27 = v4[3];
    id v28 = v57;
    *id v22 = v57;
    v22[1] = v25;
    uint64_t v68 = v25;
    uint64_t v69 = (uint64_t)v4;
    unint64_t v29 = (void *)((char *)v22 + *(int *)(v18 + 24));
    *unint64_t v29 = v26;
    v29[1] = v27;
    sub_100020110(v4 + 9, v4[12]);
    swift_bridgeObjectRetain();
    id v30 = v28;
    sub_1000214C0((uint64_t)v17);
    uint64_t v31 = (uint64_t)v17;
    id v32 = *(void (**)(char *, void *, uint64_t))(v73 + 16);
    v32(v12, v70, v74);
    sub_100036850(v31, (uint64_t)&v12[*((int *)v58 + 5)], &qword_10010ED98);
    sub_10001D690((uint64_t *)&unk_100111DC0);
    uint64_t v55 = *(void *)(v55 + 80);
    type metadata accessor for TaskManager();
    sub_1000CBF70();
    double v34 = v33;
    uint64_t v58 = v12;
    uint64_t v35 = v59;
    sub_1000B34EC((uint64_t)v12, v59, (uint64_t (*)(void))type metadata accessor for TaskContext);
    id v57 = v30;
    uint64_t v36 = sub_10009A00C((uint64_t)v57, v35, v34);
    sub_10009A2A0(v60, v61);
    uint64_t v37 = v31;
    uint64_t v38 = v69;
    if (sub_1000AF57C(v31))
    {
      sub_100020110(v53, *(void *)(v38 + 136));
      uint64_t v39 = type metadata accessor for EventProcessingSidecarTask();
      uint64_t v38 = v69;
      uint64_t v40 = sub_1000CAEB0();
      if (v40)
      {
        v75[3] = v39;
        v75[4] = &off_1000FC698;
        v75[0] = v40;
        swift_retain();
        sub_10009B7D4(v75);
        swift_release();
        swift_release();
        sub_1000201A8((uint64_t)v75);
      }
    }
    uint64_t v59 = v36;
    uint64_t v69 = sub_1000AF734(v38);
    uint64_t v61 = sub_1000CB0A0();
    v32(v72, v70, v74);
    uint64_t v54 = v37;
    uint64_t v41 = v66;
    sub_100036850(v37, v66, &qword_10010ED98);
    sub_1000B34EC((uint64_t)v22, v71, (uint64_t (*)(void))type metadata accessor for NewsWidgetInfo);
    uint64_t v70 = v22;
    uint64_t v42 = v73;
    unint64_t v43 = (*(unsigned __int8 *)(v73 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v73 + 80);
    unint64_t v44 = (v67 + *(unsigned __int8 *)(v64 + 80) + v43) & ~(unint64_t)*(unsigned __int8 *)(v64 + 80);
    unint64_t v45 = (v65 + *(unsigned __int8 *)(v62 + 80) + v44) & ~(unint64_t)*(unsigned __int8 *)(v62 + 80);
    unint64_t v46 = (v63 + v45 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v47 = (char *)swift_allocObject();
    uint64_t v48 = v68;
    *((void *)v47 + 2) = v55;
    *((void *)v47 + 3) = v48;
    id v49 = v57;
    *((void *)v47 + 4) = v38;
    *((void *)v47 + 5) = v49;
    (*(void (**)(char *, char *, uint64_t))(v42 + 32))(&v47[v43], v72, v74);
    sub_1000365A0(v41, (uint64_t)&v47[v44], &qword_10010ED98);
    sub_1000B3630(v71, (uint64_t)&v47[v45], (uint64_t (*)(void))type metadata accessor for NewsWidgetInfo);
    *(void *)&v47[v46] = v59;
    *(void *)&v47[(v46 + 15) & 0xFFFFFFFFFFFFFFF8] = v56;
    id v50 = v49;
    swift_retain();
    swift_retain();
    swift_retain();
    uint64_t v51 = (void *)sub_1000CB010();
    sub_1000CB060();
    swift_release();

    swift_release();
    swift_release();
    sub_1000B0274();
    swift_release();
    swift_release();
    swift_release();
    sub_1000B35D0((uint64_t)v58, (uint64_t (*)(void))type metadata accessor for TaskContext);
    sub_1000227A8(v54, &qword_10010ED98);
    return sub_1000B35D0((uint64_t)v70, (uint64_t (*)(void))type metadata accessor for NewsWidgetInfo);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void *sub_1000AF57C(uint64_t a1)
{
  sub_100020110((void *)(v1 + 112), *(void *)(v1 + 136));
  sub_10001D64C(&qword_10010EF40);
  uint64_t result = (void *)sub_1000CAEB0();
  if (result)
  {
    id v4 = [result possiblyUnfetchedAppConfiguration];
    if (([v4 respondsToSelector:"widgetAnalyticsEnabled"] & 1) != 0
      && [v4 widgetAnalyticsEnabled])
    {
      id v5 = sub_1000B1778(a1);
      if (v6)
      {
        uint64_t v9 = 0;
        goto LABEL_10;
      }
      char v7 = sub_1000B1ACC((uint64_t)v5, (uint64_t)&off_1000FBD98);
      sub_100036814(0, (unint64_t *)&qword_100110C20);
      uint64_t v8 = (void *)sub_1000CC630();
      sub_1000CC530();
      if ((v7 & 1) == 0)
      {
        sub_1000CB230();
        uint64_t v9 = 1;
        goto LABEL_9;
      }
    }
    else
    {
      sub_100036814(0, (unint64_t *)&qword_100110C20);
      uint64_t v8 = (void *)sub_1000CC630();
      sub_1000CC530();
    }
    sub_1000CB230();
    uint64_t v9 = 0;
LABEL_9:

LABEL_10:
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    return (void *)v9;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000AF734(uint64_t a1)
{
  uint64_t v2 = (void *)(a1 + 112);
  sub_100020110((void *)(a1 + 112), *(void *)(a1 + 136));
  sub_10001D64C((uint64_t *)&unk_10010F180);
  uint64_t result = sub_1000CAE90();
  if (result)
  {
    uint64_t v4 = result;
    sub_100020110(v2, *(void *)(a1 + 136));
    uint64_t v5 = type metadata accessor for EventProcessingSidecarTask();
    *(void *)(swift_allocObject() + 16) = v4;
    swift_unknownObjectRetain();
    uint64_t v6 = sub_1000CAEA0();
    swift_release();
    if (v6)
    {
      v8[3] = v5;
      v8[4] = &off_1000FC698;
      v8[0] = v6;
      swift_retain();
      uint64_t v7 = sub_10009B7D4(v8);
      swift_release();
      swift_unknownObjectRelease();
      sub_1000201A8((uint64_t)v8);
    }
    else
    {
      sub_10001D64C((uint64_t *)&unk_10010F330);
      swift_allocObject();
      uint64_t v7 = sub_1000CB050();
      swift_unknownObjectRelease();
    }
    return v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1000AF8C8(void *a1)
{
  return sub_1000CAE60();
}

uint64_t sub_1000AF924(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v28 = a6;
  uint64_t v29 = a7;
  id v30 = a2;
  uint64_t v31 = a4;
  uint64_t v10 = *a1;
  uint64_t v26 = a3;
  uint64_t v27 = v10;
  uint64_t v11 = sub_1000CC0D0();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for NewsWidgetInfo();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(void *)(v16 + 64);
  __chkstk_darwin(v15 - 8);
  uint64_t v18 = (char *)&v26 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000B34EC(a5, (uint64_t)v18, (uint64_t (*)(void))type metadata accessor for NewsWidgetInfo);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a3, v11);
  unint64_t v19 = (*(unsigned __int8 *)(v16 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v20 = (v17 + *(unsigned __int8 *)(v12 + 80) + v19) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  unint64_t v21 = (v13 + v20 + 7) & 0xFFFFFFFFFFFFFFF8;
  id v22 = (char *)swift_allocObject();
  uint64_t v23 = v27;
  *((void *)v22 + 2) = *(void *)(v27 + 80);
  *((void *)v22 + 3) = *(void *)(v23 + 88);
  *((void *)v22 + 4) = a1;
  sub_1000B3630((uint64_t)v18, (uint64_t)&v22[v19], (uint64_t (*)(void))type metadata accessor for NewsWidgetInfo);
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(&v22[v20], v14, v11);
  uint64_t v24 = v29;
  *(void *)&v22[v21] = v28;
  *(void *)&v22[(v21 + 15) & 0xFFFFFFFFFFFFFFF8] = v24;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1000AE760(v30, v26, v31, (uint64_t)sub_1000B24AC, (uint64_t)v22);
  return swift_release();
}

uint64_t sub_1000AFBB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v44 = a6;
  uint64_t v42 = a5;
  v34[1] = a4;
  v34[2] = a3;
  uint64_t v43 = sub_10001D64C((uint64_t *)&unk_100111DC0);
  uint64_t v41 = *(void *)(v43 - 8);
  __chkstk_darwin(v43);
  uint64_t v39 = (char *)v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_1000CC010();
  uint64_t v35 = *(void *)(v40 - 8);
  uint64_t v9 = __chkstk_darwin(v40);
  uint64_t v36 = (char *)v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)v34 - v11;
  uint64_t v13 = sub_1000CBEC0();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_1000CACC0();
  uint64_t v37 = *(void *)(v17 - 8);
  uint64_t v38 = v17;
  uint64_t v18 = __chkstk_darwin(v17);
  unint64_t v20 = (char *)v34 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  id v22 = (char *)v34 - v21;
  sub_1000CACB0();
  sub_100020110((void *)(a2 + 72), *(void *)(a2 + 96));
  uint64_t v23 = a1;
  sub_100020CC4(a1);
  uint64_t v24 = type metadata accessor for NewsTimelineEntry();
  id v25 = [*(id *)(a1 + *(int *)(v24 + 20) + *(int *)(type metadata accessor for TodayContent() + 28)) widgetConfig];
  if (!v25)
  {
    sub_1000CC080();
    id v25 = sub_1000B00C0();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  }
  [v25 widgetSystemReloadInterval];
  [v25 widgetSystemReloadJitterMax];
  sub_1000CAC70();
  sub_1000CC000();
  sub_10001D64C((uint64_t *)&unk_100111E20);
  unint64_t v26 = (*(unsigned __int8 *)(*(void *)(v24 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v24 - 8) + 80);
  uint64_t v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = xmmword_1000D37C0;
  sub_1000B34EC(v23, v27 + v26, (uint64_t (*)(void))type metadata accessor for NewsTimelineEntry);
  uint64_t v28 = v35;
  uint64_t v29 = v40;
  (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v36, v12, v40);
  sub_1000B36D8(qword_100111DA0, (void (*)(uint64_t))type metadata accessor for NewsTimelineEntry);
  id v30 = v39;
  sub_1000CC0E0();
  sub_10009B3C8();
  TelemetryManager.flush()();

  (*(void (**)(char *, uint64_t))(v41 + 8))(v30, v43);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v12, v29);
  uint64_t v31 = v38;
  id v32 = *(void (**)(char *, uint64_t))(v37 + 8);
  v32(v20, v38);
  return ((uint64_t (*)(char *, uint64_t))v32)(v22, v31);
}

id sub_1000B00C0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1000CBEC0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, v2);
  int v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  int v7 = enum case for InternalWidgetFamily.systemSmall(_:);
  int v8 = enum case for InternalWidgetFamily.accessoryRectangular(_:);
  id result = [objc_allocWithZone((Class)NTPBTodayWidgetConfig) init];
  uint64_t v10 = result;
  if (v6 == v7 || v6 == v8)
  {
    if (result)
    {
      [result setWidgetSystemReloadInterval:7200];
      [v10 setWidgetSystemReloadJitterMax:600];
      return v10;
    }
    __break(1u);
  }
  else if (result)
  {
    [result setWidgetSystemReloadInterval:300];
    [v10 setWidgetSystemReloadJitterMax:600];
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000B0274()
{
  uint64_t v1 = sub_1000CBD60();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000CBD90();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  int v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11[0] = *(void *)(v0 + 152);
  aBlock[4] = sub_1000B11EC;
  aBlock[5] = 0;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10003C7A8;
  aBlock[3] = &unk_1000FE550;
  uint64_t v9 = _Block_copy(aBlock);
  sub_1000CBD70();
  v11[1] = _swiftEmptyArrayStorage;
  sub_1000B36D8((unint64_t *)&qword_100111770, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10001D64C((uint64_t *)&unk_100111DD0);
  sub_1000B3720((unint64_t *)&qword_100111778, (uint64_t *)&unk_100111DD0);
  sub_1000CC6D0();
  sub_1000CC5B0();
  _Block_release(v9);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_1000B04F4@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_1000CB420();
  *a1 = v3;
  return result;
}

uint64_t sub_1000B0520()
{
  return sub_1000CB430();
}

uint64_t sub_1000B0548(uint64_t a1)
{
  uint64_t v2 = sub_1000CB6D0();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_1000CB450();
}

void sub_1000B0610(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v33 = a1;
  uint64_t v8 = type metadata accessor for NewsTimelineEntry();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10001D64C(&qword_10010ED98);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100036850(a2, (uint64_t)v14, &qword_10010ED98);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v14, 1, v8) == 1)
  {
    sub_1000227A8((uint64_t)v14, &qword_10010ED98);
    sub_100036814(0, (unint64_t *)&qword_100110C20);
    id v15 = a3;
    uint64_t v16 = sub_1000CC630();
    os_log_type_t v17 = sub_1000CC530();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v18 = 138412290;
      uint64_t v35 = (uint64_t)v15;
      id v20 = v15;
      sub_1000CC660();
      void *v19 = v15;

      _os_log_impl((void *)&_mh_execute_header, v16, v17, "no previous entry for configuration %@", v18, 0xCu);
      sub_10001D64C((uint64_t *)&unk_100111E00);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    swift_willThrow();
    swift_errorRetain();
  }
  else
  {
    uint64_t v33 = v4;
    sub_1000B3630((uint64_t)v14, a4, (uint64_t (*)(void))type metadata accessor for NewsTimelineEntry);
    sub_1000B34EC(a4, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for NewsTimelineEntry);
    sub_100036814(0, (unint64_t *)&qword_100110C20);
    id v21 = a3;
    id v22 = sub_1000CC630();
    os_log_type_t v23 = sub_1000CC530();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = swift_slowAlloc();
      id v25 = (void *)swift_slowAlloc();
      uint64_t v32 = swift_slowAlloc();
      uint64_t v35 = v32;
      *(_DWORD *)uint64_t v24 = 138412546;
      uint64_t v34 = (uint64_t)v21;
      id v26 = v21;
      os_log_t v31 = v22;
      id v27 = v26;
      sub_1000CC660();
      *id v25 = v21;

      *(_WORD *)(v24 + 12) = 2080;
      sub_1000CACC0();
      sub_1000B36D8(&qword_10010EDA8, (void (*)(uint64_t))&type metadata accessor for Date);
      uint64_t v28 = sub_1000CCA20();
      uint64_t v34 = sub_1000B2E18(v28, v29, &v35);
      sub_1000CC660();
      swift_bridgeObjectRelease();
      sub_1000B35D0((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for NewsTimelineEntry);
      os_log_t v30 = v31;
      _os_log_impl((void *)&_mh_execute_header, v31, v23, "falling back to previous entry for configuration %@ from %s", (uint8_t *)v24, 0x16u);
      sub_10001D64C((uint64_t *)&unk_100111E00);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      sub_1000B35D0((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for NewsTimelineEntry);
    }
  }
}

uint64_t sub_1000B0B2C(uint64_t a1, void *a2, uint64_t (*a3)(uint64_t))
{
  sub_100036814(0, (unint64_t *)&qword_100110C20);
  id v6 = a2;
  uint64_t v7 = sub_1000CC630();
  os_log_type_t v8 = sub_1000CC530();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 138412290;
    uint64_t v13 = a1;
    id v10 = v6;
    sub_1000CC660();
    *uint64_t v12 = v6;

    a1 = v13;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "returning content entry for configuration %@", v9, 0xCu);
    sub_10001D64C((uint64_t *)&unk_100111E00);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  return a3(a1);
}

uint64_t sub_1000B0CDC(uint64_t a1, uint64_t a2, void *a3, void (*a4)(void), void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v39 = a1;
  uint64_t v41 = type metadata accessor for ContentServiceRequest();
  __chkstk_darwin(v41);
  uint64_t v13 = (id *)((char *)v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v14 = type metadata accessor for TodayContent();
  __chkstk_darwin(v14 - 8);
  uint64_t v42 = (void *)((char *)v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v40 = type metadata accessor for NewsTimelineEntry();
  __chkstk_darwin(v40);
  os_log_type_t v17 = (char *)v35 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v18 = sub_1000CC0C0();
  sub_100036814(0, (unint64_t *)&qword_100110C20);
  id v19 = a3;
  id v20 = sub_1000CC630();
  os_log_type_t v21 = sub_1000CC530();
  BOOL v22 = os_log_type_enabled(v20, v21);
  if (v18)
  {
    if (v22)
    {
      uint64_t v38 = a4;
      os_log_type_t v23 = (uint8_t *)swift_slowAlloc();
      uint64_t v36 = (void *)swift_slowAlloc();
      uint64_t v37 = v23;
      *(_DWORD *)os_log_type_t v23 = 138412290;
      uint64_t v39 = a7;
      v35[1] = v23 + 4;
      id v43 = v19;
      id v24 = v19;
      a7 = v39;
      sub_1000CC660();
      *uint64_t v36 = v19;

      a4 = v38;
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "returning placeholder for configuration %@", v37, 0xCu);
      sub_10001D64C((uint64_t *)&unk_100111E00);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    unint64_t v29 = sub_100020110((void *)(a6 + 32), *(void *)(a6 + 56));
    sub_100020110((void *)(*v29 + 16), *(void *)(*v29 + 40));
    uint64_t v30 = sub_100059574();
    uint64_t v31 = type metadata accessor for EntryRequest();
    uint64_t v32 = v41;
    sub_1000B34EC(a7 + *(int *)(v31 + 20), (uint64_t)v13 + *(int *)(v41 + 20), (uint64_t (*)(void))type metadata accessor for LayoutContext);
    sub_1000B34EC(a7 + *(int *)(v31 + 24), (uint64_t)v13 + *(int *)(v32 + 24), (uint64_t (*)(void))type metadata accessor for NewsWidgetInfo);
    *uint64_t v13 = (id)v30;
    uint64_t v33 = v42;
    sub_1000A8D10(v13, 4, v42);
    sub_1000B35D0((uint64_t)v13, (uint64_t (*)(void))type metadata accessor for ContentServiceRequest);
    sub_1000B34EC((uint64_t)v33, (uint64_t)&v17[*(int *)(v40 + 20)], (uint64_t (*)(void))type metadata accessor for TodayContent);
    sub_1000CACB0();
    sub_1000B35D0((uint64_t)v33, (uint64_t (*)(void))type metadata accessor for TodayContent);
  }
  else
  {
    if (v22)
    {
      uint64_t v25 = swift_slowAlloc();
      uint64_t v42 = a5;
      id v26 = (uint8_t *)v25;
      uint64_t v40 = swift_slowAlloc();
      uint64_t v38 = a4;
      *(_DWORD *)id v26 = 138412290;
      id v43 = v19;
      id v27 = v19;
      uint64_t v41 = a6;
      id v28 = v27;
      a4 = v38;
      sub_1000CC660();
      *(void *)uint64_t v40 = v19;

      a6 = v41;
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "returning error within preview for configuration %@", v26, 0xCu);
      sub_10001D64C((uint64_t *)&unk_100111E00);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    sub_100020110((void *)(a6 + 32), *(void *)(a6 + 56));
    sub_1000591E4(a7, (uint64_t)v17);
  }
  a4(v17);
  return sub_1000B35D0((uint64_t)v17, (uint64_t (*)(void))type metadata accessor for NewsTimelineEntry);
}

void sub_1000B11EC()
{
  uint64_t v0 = sub_1000CACC0();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __chkstk_darwin(v2);
  uint64_t v7 = (char *)&v33 - v6;
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v33 - v8;
  uint64_t v10 = sub_10001D64C((uint64_t *)&unk_100111DE0);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  uint64_t v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v33 - v14;
  id v16 = (id)NewsCoreUserDefaults();
  unsigned int v17 = [v16 BOOLForKey:NDDownloadServiceHasUnfinishedWorkKey];

  if (v17)
  {
    uint64_t v34 = v4;
    char v18 = self;
    id v19 = [v18 standardUserDefaults];
    uint64_t v33 = "sidecarTaskQueue";
    NSString v20 = sub_1000CC1C0();
    id v21 = [v19 objectForKey:v20];

    if (v21)
    {
      sub_1000CC6B0();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v39, 0, sizeof(v39));
    }
    sub_1000365A0((uint64_t)v39, (uint64_t)aBlock, &qword_10010EF90);
    if (v36)
    {
      int v22 = swift_dynamicCast();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v1 + 56))(v15, v22 ^ 1u, 1, v0);
    }
    else
    {
      sub_1000227A8((uint64_t)aBlock, &qword_10010EF90);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56))(v15, 1, 1, v0);
    }
    sub_1000CACB0();
    sub_100036850((uint64_t)v15, (uint64_t)v13, (uint64_t *)&unk_100111DE0);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v1 + 48))(v13, 1, v0) == 1)
    {
      _s7NewsTag16TelemetryManagerC13lastFlushDate33_4E4017AC2BCC1D1AC48C0D84A0E547E910Foundation0G0Vvpfi_0();
      sub_1000227A8((uint64_t)v13, (uint64_t *)&unk_100111DE0);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v7, v13, v0);
    }
    sub_1000CAC40();
    double v24 = v23;
    uint64_t v25 = *(void (**)(char *, uint64_t))(v1 + 8);
    v25(v7, v0);
    v25(v9, v0);
    if (v24 > 3600.0)
    {
      id v26 = (id)NDDownloadServiceXPCConnection();
      [v26 resume];
      uint64_t v37 = TodayIntentResponseCode.rawValue.getter;
      uint64_t v38 = 0;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1000B1710;
      uint64_t v36 = &unk_1000FE578;
      id v27 = _Block_copy(aBlock);
      id v28 = [v26 remoteObjectProxyWithErrorHandler:v27];
      _Block_release(v27);
      sub_1000CC6B0();
      swift_unknownObjectRelease();
      sub_10001D64C((uint64_t *)&unk_100111DF0);
      if (swift_dynamicCast())
      {
        [*(id *)&v39[0] ping];
        id v29 = [v18 standardUserDefaults];
        uint64_t v30 = v34;
        sub_1000CACB0();
        Class isa = sub_1000CAC50().super.isa;
        v25(v30, v0);
        NSString v32 = sub_1000CC1C0();
        [v29 setObject:isa forKey:v32];
        swift_unknownObjectRelease();
      }
    }
    sub_1000227A8((uint64_t)v15, (uint64_t *)&unk_100111DE0);
  }
}

void sub_1000B1710(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

id sub_1000B1778(uint64_t a1)
{
  uint64_t v2 = sub_10001D64C(&qword_10010ED98);
  __chkstk_darwin(v2 - 8);
  id v4 = (char *)v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = (id)NewsCoreUserDefaults();
  id v6 = [v5 objectForKey:FCWidgetOnboardingVersionSharedPreferenceKey];

  if (v6)
  {
    sub_1000CC6B0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v16, 0, sizeof(v16));
  }
  sub_1000365A0((uint64_t)v16, (uint64_t)v17, &qword_10010EF90);
  if (v18)
  {
    sub_100036814(0, &qword_100111E30);
    if (swift_dynamicCast())
    {
      uint64_t v7 = (void *)v15[1];
      sub_100036814(0, (unint64_t *)&qword_100110C20);
      uint64_t v8 = (void *)sub_1000CC630();
      sub_1000CC530();
      sub_1000CB230();

      id v9 = [v7 integerValue];
      goto LABEL_11;
    }
  }
  else
  {
    sub_1000227A8((uint64_t)v17, &qword_10010EF90);
  }
  sub_100036850(a1, (uint64_t)v4, &qword_10010ED98);
  uint64_t v10 = type metadata accessor for NewsTimelineEntry();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48))(v4, 1, v10) == 1)
  {
    sub_1000227A8((uint64_t)v4, &qword_10010ED98);
    sub_100036814(0, (unint64_t *)&qword_100110C20);
    uint64_t v7 = (void *)sub_1000CC630();
    sub_1000CC530();
    sub_1000CB230();
    id v9 = 0;
  }
  else
  {
    uint64_t v11 = &v4[*(int *)(v10 + 20)];
    uint64_t v12 = *(void *)&v11[*(int *)(type metadata accessor for TodayContent() + 40)];
    swift_retain();
    sub_1000B35D0((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for NewsTimelineEntry);
    id v13 = *(id *)(v12 + OBJC_IVAR____TtC7NewsTag20TrackableWidgetState_fetchInfo);
    swift_release();
    id v9 = [v13 onboardingVersion];

    sub_100036814(0, (unint64_t *)&qword_100110C20);
    uint64_t v7 = (void *)sub_1000CC630();
    sub_1000CC530();
    sub_1000CB230();
  }
LABEL_11:

  return v9;
}

uint64_t sub_1000B1ACC(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  if (*(void *)(a2 + 32) == result) {
    return 1;
  }
  if (v2 == 1) {
    return 0;
  }
  for (uint64_t i = 5; ; ++i)
  {
    uint64_t v4 = i - 3;
    if (__OFADD__(i - 4, 1)) {
      break;
    }
    BOOL v6 = *(void *)(a2 + 8 * i) == result;
    BOOL v5 = v6;
    BOOL v6 = v6 || v4 == v2;
    if (v6) {
      return v5;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1000B1B30()
{
  swift_bridgeObjectRelease();
  sub_1000201A8(v0 + 32);
  sub_1000201A8(v0 + 72);
  sub_1000201A8(v0 + 112);

  return v0;
}

uint64_t sub_1000B1B70()
{
  sub_1000B1B30();

  return _swift_deallocClassInstance(v0, 160, 7);
}

uint64_t type metadata accessor for NewsTimelineProvider()
{
  return sub_1000506F4();
}

uint64_t sub_1000B1BBC()
{
  return sub_1000B36D8(qword_100111DA0, (void (*)(uint64_t))type metadata accessor for NewsTimelineEntry);
}

uint64_t sub_1000B1C08@<X0>(uint64_t a1@<X8>)
{
  return sub_1000ADC78(a1);
}

uint64_t sub_1000B1C2C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1000AE578(a1, a2, a3, a4);
}

uint64_t sub_1000B1C50(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  return sub_1000AEDD4(a1, a2, a3, a4);
}

uint64_t sub_1000B1C74()
{
  return swift_retain();
}

uint64_t sub_1000B1C90()
{
  uint64_t v1 = v0;
  uint64_t v42 = sub_1000CC0D0();
  uint64_t v2 = *(void *)(v42 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = *(void *)(sub_10001D64C(&qword_10010ED98) - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = (v5 + v7) & ~v7;
  uint64_t v9 = *(void *)(v6 + 64);
  uint64_t v10 = type metadata accessor for NewsWidgetInfo();
  uint64_t v11 = *(unsigned __int8 *)(*(void *)(v10 - 8) + 80);
  uint64_t v12 = *(void *)(*(void *)(v10 - 8) + 64);
  swift_release();

  uint64_t v13 = v1 + v4;
  uint64_t v14 = v1;
  uint64_t v15 = v9;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v13, v42);
  uint64_t v16 = type metadata accessor for NewsTimelineEntry();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 48))(v14 + v8, 1, v16))
  {
    uint64_t v37 = v14;
    uint64_t v38 = v11;
    uint64_t v39 = v7;
    uint64_t v40 = v12;
    uint64_t v43 = v8;
    uint64_t v17 = sub_1000CACC0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8))(v14 + v8, v17);
    uint64_t v18 = (id *)(v14 + v8 + *(int *)(v16 + 20));

    uint64_t v19 = type metadata accessor for TodayContent();
    NSString v20 = (char *)v18 + *(int *)(v19 + 20);
    id v21 = (int *)type metadata accessor for Banner();
    if (!(*(unsigned int (**)(char *, uint64_t, int *))(*((void *)v21 - 1) + 48))(v20, 1, v21))
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      int v22 = &v20[v21[7]];
      uint64_t v23 = sub_1000CABE0();
      uint64_t v24 = *(void *)(v23 - 8);
      if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23)) {
        (*(void (**)(char *, uint64_t))(v24 + 8))(v22, v23);
      }
      swift_bridgeObjectRelease();
      uint64_t v25 = *(void **)&v20[v21[9]];
      if (v25 != (void *)1) {

      }
      sub_10001DE30(*(void **)&v20[v21[10]], *(void **)&v20[v21[10] + 8]);
    }
    uint64_t v41 = v15;
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    id v26 = (char *)v18 + *(int *)(v19 + 36);
    uint64_t v27 = sub_1000CABE0();
    uint64_t v28 = *(void *)(v27 - 8);
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v26, 1, v27)) {
      (*(void (**)(char *, uint64_t))(v28 + 8))(v26, v27);
    }
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v15 = v41;
    uint64_t v8 = v43;
    uint64_t v12 = v40;
    uint64_t v11 = v38;
    uint64_t v7 = v39;
    uint64_t v14 = v37;
  }
  uint64_t v29 = (v8 + v15 + v11) & ~v11;
  unint64_t v30 = (((v12 + v29 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v31 = v3 | v7 | v11 | 7;
  uint64_t v32 = v14 + v29;

  uint64_t v33 = v14;
  uint64_t v34 = v32 + *(int *)(v10 + 20);
  uint64_t v35 = sub_1000CBEC0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v35 - 8) + 8))(v34, v35);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return _swift_deallocObject(v33, v30 + 8, v31);
}

uint64_t sub_1000B2164()
{
  uint64_t v1 = *(void *)(sub_1000CC0D0() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v3 = v2 + *(void *)(v1 + 64);
  uint64_t v4 = *(void *)(sub_10001D64C(&qword_10010ED98) - 8);
  unint64_t v5 = (v3 + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v4 + 64);
  uint64_t v7 = *(void *)(type metadata accessor for NewsWidgetInfo() - 8);
  unint64_t v8 = (v5 + v6 + *(unsigned __int8 *)(v7 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  unint64_t v9 = (*(void *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v10 = *(uint64_t **)(v0 + 32);
  uint64_t v11 = *(void **)(v0 + 40);
  uint64_t v12 = *(void *)(v0 + v9);
  uint64_t v13 = *(void *)(v0 + ((v9 + 15) & 0xFFFFFFFFFFFFFFF8));

  return sub_1000AF924(v10, v11, v0 + v2, v0 + v5, v0 + v8, v12, v13);
}

uint64_t sub_1000B22CC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000B22DC()
{
  return swift_release();
}

uint64_t sub_1000B22E4()
{
  uint64_t v1 = (int *)(type metadata accessor for NewsWidgetInfo() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 40) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  uint64_t v5 = sub_1000CC0D0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = (v3 + v4 + v7) & ~v7;
  uint64_t v13 = v2 | v7 | 7;
  unint64_t v9 = (((*(void *)(v6 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  swift_release();

  uint64_t v10 = v0 + v3 + v1[7];
  uint64_t v11 = sub_1000CBEC0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v8, v5);
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, v9 + 8, v13);
}

uint64_t sub_1000B24AC(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for NewsWidgetInfo() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(void *)(v3 + 64);
  uint64_t v6 = *(void *)(sub_1000CC0D0() - 8);
  unint64_t v7 = (v4 + v5 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  unint64_t v8 = (*(void *)(v6 + 64) + v7 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v9 = *(void *)(v1 + 32);
  uint64_t v10 = *(void *)(v1 + v8);
  uint64_t v11 = *(void *)(v1 + ((v8 + 15) & 0xFFFFFFFFFFFFFFF8));

  return sub_1000AFBB8(a1, v9, v1 + v4, v1 + v7, v10, v11);
}

uint64_t sub_1000B25BC()
{
  sub_100020110((void *)(*(void *)(v0 + 16) + 32), *(void *)(*(void *)(v0 + 16) + 56));
  type metadata accessor for EntryService();
  return sub_100059444();
}

uint64_t sub_1000B2638()
{
  uint64_t v1 = *(void *)(sub_10001D64C(&qword_10010ED98) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  uint64_t v5 = type metadata accessor for NewsTimelineEntry();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v0 + v3, 1, v5))
  {
    uint64_t v6 = sub_1000CACC0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);
    unint64_t v7 = (id *)(v0 + v3 + *(int *)(v5 + 20));

    uint64_t v8 = type metadata accessor for TodayContent();
    uint64_t v9 = (char *)v7 + *(int *)(v8 + 20);
    uint64_t v10 = (int *)type metadata accessor for Banner();
    if (!(*(unsigned int (**)(char *, uint64_t, int *))(*((void *)v10 - 1) + 48))(v9, 1, v10))
    {
      uint64_t v21 = v4;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v11 = &v9[v10[7]];
      uint64_t v12 = sub_1000CABE0();
      uint64_t v13 = *(void *)(v12 - 8);
      if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12)) {
        (*(void (**)(char *, uint64_t))(v13 + 8))(v11, v12);
      }
      swift_bridgeObjectRelease();
      uint64_t v14 = *(void **)&v9[v10[9]];
      if (v14 != (void *)1) {

      }
      sub_10001DE30(*(void **)&v9[v10[10]], *(void **)&v9[v10[10] + 8]);
      uint64_t v4 = v21;
    }
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    uint64_t v15 = (char *)v7 + *(int *)(v8 + 36);
    uint64_t v16 = sub_1000CABE0();
    uint64_t v17 = *(void *)(v16 - 8);
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16)) {
      (*(void (**)(char *, uint64_t))(v17 + 8))(v15, v16);
    }
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  unint64_t v18 = (v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v19 = v18 + 8;

  return _swift_deallocObject(v0, v19, v2 | 7);
}

void sub_1000B298C(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(sub_10001D64C(&qword_10010ED98) - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  sub_1000B0610(a1, v2 + v6, *(void **)(v2 + ((*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8)), a2);
}

uint64_t sub_1000B2A4C()
{
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_1000B2A8C(uint64_t a1)
{
  return sub_1000B0B2C(a1, *(void **)(v1 + 32), *(uint64_t (**)(uint64_t))(v1 + 40));
}

uint64_t sub_1000B2AB0()
{
  uint64_t v1 = sub_1000CC0D0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  unint64_t v5 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v6 = (int *)(type metadata accessor for EntryRequest() - 8);
  uint64_t v7 = *(unsigned __int8 *)(*(void *)v6 + 80);
  unint64_t v8 = (v7 + ((((v5 + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8) & ~v7;
  unint64_t v21 = v8 + *(void *)(*(void *)v6 + 64);
  uint64_t v9 = v3 | v7 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  swift_release();
  swift_release();
  uint64_t v10 = (id *)(v0 + v8);

  uint64_t v11 = (char *)v10 + v6[7];
  uint64_t v12 = type metadata accessor for LayoutContext();
  uint64_t v13 = &v11[*(int *)(v12 + 24)];
  uint64_t v14 = sub_1000CBEC0();
  uint64_t v15 = *(void (**)(char *, uint64_t))(*(void *)(v14 - 8) + 8);
  v15(v13, v14);
  uint64_t v16 = &v11[*(int *)(v12 + 32)];
  uint64_t v17 = sub_1000CB6D0();
  (*(void (**)(char *, uint64_t))(*(void *)(v17 - 8) + 8))(v16, v17);
  unint64_t v18 = (id *)((char *)v10 + v6[8]);

  uint64_t v19 = type metadata accessor for NewsWidgetInfo();
  v15((char *)v18 + *(int *)(v19 + 20), v14);
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, v21, v9);
}

uint64_t sub_1000B2D10(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_1000CC0D0() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v7 = (v6 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v8 = *(void *)(type metadata accessor for EntryRequest() - 8);
  uint64_t v9 = *(void **)(v1 + v5);
  uint64_t v10 = *(void (**)(void))(v1 + v6);
  uint64_t v11 = *(void **)(v1 + v6 + 8);
  uint64_t v12 = *(void *)(v1 + v7);
  uint64_t v13 = v1 + ((*(unsigned __int8 *)(v8 + 80) + v7 + 8) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));

  return sub_1000B0CDC(a1, v1 + v4, v9, v10, v11, v12, v13);
}

uint64_t sub_1000B2E18(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000B2EEC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100023250((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_100023250((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1000201A8((uint64_t)v12);
  return v7;
}

uint64_t sub_1000B2EEC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1000CC670();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1000B30A8(a5, a6);
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
  uint64_t v8 = sub_1000CC7C0();
  if (!v8)
  {
    sub_1000CC860();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1000CC8D0();
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

uint64_t sub_1000B30A8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1000B3140(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000B339C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000B339C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1000B3140(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1000B32B8(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1000CC760();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_1000CC860();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1000CC2C0();
      if (!v2) {
        return _swiftEmptyArrayStorage;
      }
    }
    sub_1000CC8D0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_1000CC860();
    __break(1u);
  }
  else
  {
    return _swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_1000B32B8(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return _swiftEmptyArrayStorage;
  }
  sub_10001D64C((uint64_t *)&unk_100111E10);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1000B3320(unsigned __int16 a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_1000CC310();
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
    uint64_t v5 = sub_1000CC2E0();
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_1000B339C(char a1, int64_t a2, char a3, char *a4)
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
    sub_10001D64C((uint64_t *)&unk_100111E10);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
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
  uint64_t result = sub_1000CC8D0();
  __break(1u);
  return result;
}

uint64_t sub_1000B34EC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000B3554@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_1000CB420();
  *a1 = v3;
  return result;
}

uint64_t sub_1000B3580()
{
  return sub_1000CB430();
}

uint64_t sub_1000B35A8()
{
  return sub_1000CB440();
}

uint64_t sub_1000B35D0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000B3630(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000B3698()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000B36D0(void *a1)
{
  return sub_1000AF8C8(a1);
}

uint64_t sub_1000B36D8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000B3720(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10001D690(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000B3778(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v20 = a2;
  uint64_t v22 = a1;
  uint64_t v6 = sub_1000CACC0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v9 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  unint64_t v12 = (char *)&v19 - v11;
  sub_1000CACB0();
  id v21 = *(id *)(v3 + 32);
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
  unint64_t v13 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  unint64_t v14 = (v8 + v13 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v15 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v15 + v13, v10, v6);
  *(void *)(v15 + v14) = v4;
  uint64_t v16 = (void *)(v15 + ((v14 + 15) & 0xFFFFFFFFFFFFFFF8));
  void *v16 = v20;
  v16[1] = a3;
  aBlock[4] = sub_1000B3D48;
  aBlock[5] = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000B3B48;
  void aBlock[3] = &unk_1000FE6B0;
  uint64_t v17 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  [v21 fetchLatestResultsWithOperationInfo:v22 completion:v17];
  _Block_release(v17);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v12, v6);
}

void sub_1000B39B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(uint64_t, uint64_t, void *, uint64_t))
{
  uint64_t v20 = a7;
  uint64_t v11 = sub_1000CACC0();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  unint64_t v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000CACB0();
  sub_1000CAC40();
  double v16 = v15;
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  self;
  uint64_t v17 = (void *)swift_dynamicCastObjCClass();
  if (v17) {
    swift_unknownObjectRetain();
  }
  unint64_t v18 = *(void (**)(uint64_t, void *, uint64_t, double))(a6 + 16);
  if (v18)
  {
    swift_retain();
    v18(a1, v17, a4, v16);
    sub_1000AB9E4((uint64_t)v18);
  }
  v20(a1, a2, v17, a4);
}

uint64_t sub_1000B3B48(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v7 = a3;
  uint64_t v9 = *(void (**)(void *, uint64_t, uint64_t, void *))(a1 + 32);
  if (a3)
  {
    sub_1000CABE0();
    sub_1000A581C();
    uint64_t v7 = sub_1000CC110();
  }
  swift_retain();
  id v10 = a2;
  swift_unknownObjectRetain();
  id v11 = a5;
  v9(a2, v7, a4, a5);
  swift_release();

  swift_unknownObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000B3C24()
{
  sub_1000AB9E4(*(void *)(v0 + 16));

  return _swift_deallocClassInstance(v0, 40, 7);
}

uint64_t type metadata accessor for NTTodayContextResultsService()
{
  return self;
}

uint64_t sub_1000B3C88()
{
  uint64_t v1 = sub_1000CACC0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, v6 + 16, v5);
}

void sub_1000B3D48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *(void *)(sub_1000CACC0() - 8);
  unint64_t v10 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  unint64_t v11 = (*(void *)(v9 + 64) + v10 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v12 = *(void *)(v4 + v11);
  uint64_t v13 = *(void (**)(uint64_t, uint64_t, void *, uint64_t))(v4 + ((v11 + 15) & 0xFFFFFFFFFFFFFFF8));

  sub_1000B39B0(a1, a2, a3, a4, v4 + v10, v12, v13);
}

uint64_t sub_1000B3E1C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000B3E2C()
{
  return swift_release();
}

uint64_t type metadata accessor for BiomeEventStore()
{
  return self;
}

void sub_1000B3E58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v29 = a7;
  uint64_t v30 = a8;
  id v31 = a5;
  uint64_t v13 = type metadata accessor for TaskContext();
  uint64_t v28 = *(void *)(v13 - 8);
  uint64_t v14 = *(void *)(v28 + 64);
  __chkstk_darwin(v13 - 8);
  uint64_t v15 = sub_10001D64C(&qword_10010ED90);
  uint64_t v27 = *(void *)(v15 - 8);
  uint64_t v16 = *(void *)(v27 + 64);
  __chkstk_darwin(v15 - 8);
  uint64_t v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = a1;
  *(void *)(v18 + 24) = a2;
  uint64_t v19 = (void *)swift_allocObject();
  v19[2] = a6;
  v19[3] = sub_1000996D8;
  v19[4] = v18;
  v19[5] = a3;
  void v19[6] = a4;
  uint64_t v36 = sub_1000B5744;
  uint64_t v37 = v19;
  aBlock = _NSConcreteStackBlock;
  uint64_t v33 = 1107296256;
  uint64_t v34 = sub_1000B446C;
  uint64_t v35 = &unk_1000FE760;
  uint64_t v20 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_release();
  sub_1000B5618(v29, (uint64_t)v17);
  sub_1000B576C(v30, (uint64_t)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v21 = (*(unsigned __int8 *)(v27 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80);
  unint64_t v22 = (v16 + *(unsigned __int8 *)(v28 + 80) + v21) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80);
  uint64_t v23 = swift_allocObject();
  sub_1000365A0((uint64_t)v17, v23 + v21, &qword_10010ED90);
  sub_10009F21C((uint64_t)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v23 + v22);
  *(void *)(v23 + ((v14 + v22 + 7) & 0xFFFFFFFFFFFFFFF8)) = a6;
  uint64_t v36 = sub_1000B5C0C;
  uint64_t v37 = (void *)v23;
  aBlock = _NSConcreteStackBlock;
  uint64_t v33 = 1107296256;
  uint64_t v34 = sub_1000B446C;
  uint64_t v35 = &unk_1000FE7B0;
  uint64_t v24 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  id v25 = [v31 sinkWithCompletion:v20 receiveInput:v24];
  _Block_release(v24);
  _Block_release(v20);
}

uint64_t sub_1000B41A4(void *a1, uint64_t a2, void (*a3)(uint64_t), uint64_t a4, void (*a5)(id))
{
  id v9 = [a1 state];
  if (v9 == (id)1)
  {
    id v10 = [a1 error];
    if (!v10)
    {
      sub_1000B5D58();
      id v10 = (id)swift_allocError();
    }
    sub_1000CC510();
    sub_10001D64C((uint64_t *)&unk_10010E840);
    uint64_t v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_1000D37C0;
    sub_10001D64C((uint64_t *)&unk_10010E898);
    sub_1000CC820();
    *(void *)(v11 + 56) = &type metadata for String;
    *(void *)(v11 + 64) = sub_1000225F0();
    *(void *)(v11 + 32) = 0;
    *(void *)(v11 + 40) = 0xE000000000000000;
    sub_100022644();
    uint64_t v12 = (void *)sub_1000CC630();
    sub_1000CB230();
    swift_bridgeObjectRelease();

    a5(v10);
    return swift_errorRelease();
  }
  else if (v9)
  {
    uint64_t result = sub_1000CC870();
    __break(1u);
  }
  else
  {
    sub_10001D64C((uint64_t *)&unk_10010E840);
    uint64_t v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_1000D37C0;
    swift_beginAccess();
    uint64_t v15 = *(void *)(*(void *)(a2 + 16) + 16);
    *(void *)(v14 + 56) = &type metadata for Int;
    *(void *)(v14 + 64) = &protocol witness table for Int;
    *(void *)(v14 + 32) = v15;
    sub_100022644();
    uint64_t v16 = (void *)sub_1000CC630();
    sub_1000CC530();
    sub_1000CB230();
    swift_bridgeObjectRelease();

    swift_beginAccess();
    uint64_t v17 = swift_bridgeObjectRetain();
    a3(v17);
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_1000B4470(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v60 = a4;
  uint64_t v62 = a3;
  uint64_t v6 = sub_10001D64C(&qword_1001101C0);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000CBEC0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v64 = v9;
  uint64_t v65 = v10;
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v61 = (char *)&v58 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v63 = (char *)&v58 - v13;
  uint64_t v14 = sub_10001D64C(&qword_10010ED90);
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v58 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_1000CACC0();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = __chkstk_darwin(v17);
  unint64_t v21 = (char *)&v58 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  uint64_t v23 = (char *)&v58 - v22;
  id v24 = [a1 eventBody];
  if (!v24) {
    return;
  }
  id v25 = v24;
  id v26 = [v24 homeScreenEvent];

  if (!v26) {
    return;
  }
  id v59 = v26;
  id v27 = [v26 date];
  sub_1000CACA0();

  sub_1000B5D10(&qword_10010EDA0, (void (*)(uint64_t))&type metadata accessor for Date);
  char v28 = sub_1000CC170();
  (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v21, v23, v17);
  sub_1000B5618(a2, (uint64_t)v16);
  if ((v28 & 1) == 0)
  {
    sub_1000227A8((uint64_t)v16, &qword_10010ED90);
    unint64_t v45 = *(void (**)(char *, uint64_t))(v18 + 8);
    v45(v21, v17);
    v45(v23, v17);
    goto LABEL_10;
  }
  char v29 = sub_1000CC180();
  sub_1000227A8((uint64_t)v16, &qword_10010ED90);
  uint64_t v30 = *(void (**)(char *, uint64_t))(v18 + 8);
  v30(v21, v17);
  v30(v23, v17);
  if ((v29 & 1) == 0)
  {
LABEL_10:

    return;
  }
  id v31 = v59;
  id v32 = [v59 widgetSize];
  if ((unint64_t)v32 >= 4)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v65 + 56))(v8, 1, 1, v64);

    sub_1000227A8((uint64_t)v8, &qword_1001101C0);
    return;
  }
  uint64_t v34 = v64;
  uint64_t v33 = v65;
  (*(void (**)(char *, void, uint64_t))(v65 + 104))(v8, *(unsigned int *)*(&off_1000FE868 + (void)v32), v64);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v33 + 56))(v8, 0, 1, v34);
  uint64_t v35 = v63;
  (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v63, v8, v34);
  uint64_t v36 = v61;
  sub_1000CC080();
  sub_1000B5D10((unint64_t *)&qword_100110060, (void (*)(uint64_t))&type metadata accessor for InternalWidgetFamily);
  sub_1000CC360();
  sub_1000CC360();
  uint64_t v37 = v68[0];
  uint64_t v38 = v66;
  uint64_t v39 = *(void (**)(char *, uint64_t))(v33 + 8);
  v39(v36, v34);
  if (v37 != v38) {
    goto LABEL_24;
  }
  id v40 = [v59 widgetBundleId];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = sub_1000CC1F0();
    uint64_t v44 = v43;
  }
  else
  {
    uint64_t v42 = 0;
    uint64_t v44 = 0;
  }
  id v46 = [self mainBundle];
  id v47 = [v46 bundleIdentifier];

  if (!v47)
  {
    if (!v44) {
      goto LABEL_26;
    }
    goto LABEL_23;
  }
  uint64_t v48 = sub_1000CC1F0();
  uint64_t v50 = v49;

  if (!v44)
  {
    if (!v50) {
      goto LABEL_26;
    }
    goto LABEL_23;
  }
  if (!v50)
  {
LABEL_23:
    swift_bridgeObjectRelease();
LABEL_24:
    v39(v35, v34);
    goto LABEL_10;
  }
  if (v42 == v48 && v44 == v50)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_26;
  }
  char v51 = sub_1000CCA30();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v51 & 1) == 0) {
    goto LABEL_24;
  }
LABEL_26:
  id v52 = v59;
  sub_1000B4BC4((uint64_t)&v66);
  if (v67)
  {
    uint64_t v53 = (void **)(v60 + 16);
    sub_100078088(&v66, (uint64_t)v68);
    sub_10003AA3C((uint64_t)v68, (uint64_t)&v66);
    swift_beginAccess();
    uint64_t v54 = *v53;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *uint64_t v53 = v54;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v54 = sub_100088038(0, v54[2] + 1, 1, v54);
      *uint64_t v53 = v54;
    }
    unint64_t v57 = v54[2];
    unint64_t v56 = v54[3];
    if (v57 >= v56 >> 1)
    {
      uint64_t v54 = sub_100088038((void *)(v56 > 1), v57 + 1, 1, v54);
      *uint64_t v53 = v54;
    }
    v54[2] = v57 + 1;
    sub_100078088(&v66, (uint64_t)&v54[5 * v57 + 4]);
    swift_endAccess();

    sub_1000201A8((uint64_t)v68);
    v39(v35, v34);
  }
  else
  {
    v39(v35, v34);

    sub_1000227A8((uint64_t)&v66, &qword_100110960);
  }
}

void sub_1000B4BC4(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_10001D64C(&qword_10010F340);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)&v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v50 - v7;
  uint64_t v9 = sub_1000CACC0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v50 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  NSString v13 = [v1 eventTypeString];
  if (!v13)
  {
    sub_1000CC1F0();
    NSString v13 = sub_1000CC1C0();
    swift_bridgeObjectRelease();
  }
  id v14 = v13;
  if (([v14 isEqualToString:@"Unknown"] & 1) != 0
    || ([v14 isEqualToString:@"HomeScreenPageShown"] & 1) != 0
    || ([v14 isEqualToString:@"HomeScreenDisappeared"] & 1) != 0
    || ([v14 isEqualToString:@"StackChanged"] & 1) != 0)
  {
    goto LABEL_20;
  }
  if (([v14 isEqualToString:@"WidgetTapped"] & 1) == 0)
  {
    if (([v14 isEqualToString:@"WidgetLongLook"] & 1) == 0
      && ([v14 isEqualToString:@"WidgetUserFeedback"] & 1) == 0
      && ([v14 isEqualToString:@"UserStackConfigChanged"] & 1) == 0
      && ([v14 isEqualToString:@"DeviceLocked"] & 1) == 0
      && ([v14 isEqualToString:@"DeviceUnlocked"] & 1) == 0
      && ([v14 isEqualToString:@"PinnedWidgetAdded"] & 1) == 0
      && ([v14 isEqualToString:@"PinnedWidgetDeleted"] & 1) == 0
      && ([v14 isEqualToString:@"SpecialPageAppeared"] & 1) == 0
      && ([v14 isEqualToString:@"SpecialPageDisappeared"] & 1) == 0)
    {
      if ([v14 isEqualToString:@"StackShown"])
      {

        id v24 = [v1 date];
        sub_1000CACA0();

        id v25 = [v1 stackKind];
        if ((unint64_t)v25 >= 4) {
          char v26 = 0;
        }
        else {
          char v26 = (char)v25;
        }
        id v27 = [v1 stackLocation];
        if ((unint64_t)v27 >= 6) {
          char v28 = 0;
        }
        else {
          char v28 = (char)v27;
        }
        char v29 = (int *)type metadata accessor for AppearanceEvent(0);
        *(void *)(a1 + 24) = v29;
        *(void *)(a1 + 32) = &off_1000FC9E0;
        uint64_t v30 = sub_100022744((uint64_t *)a1);
        (*(void (**)(uint64_t *, char *, uint64_t))(v10 + 32))(v30, v12, v9);
        *((unsigned char *)v30 + v29[5]) = v26;
        *((unsigned char *)v30 + v29[6]) = v28;
        *((unsigned char *)v30 + v29[7]) = 0;
        return;
      }
      if ([v14 isEqualToString:@"StackDisappeared"])
      {

        id v31 = [v1 date];
        uint64_t v32 = type metadata accessor for DisappearanceEvent(0);
        *(void *)(a1 + 24) = v32;
        *(void *)(a1 + 32) = &off_1000FC9F8;
        uint64_t v33 = sub_100022744((uint64_t *)a1);
        sub_1000CACA0();

        *((unsigned char *)v33 + *(int *)(v32 + 20)) = 2;
        return;
      }
      if (([v14 isEqualToString:@"StackCreated"] & 1) == 0
        && ([v14 isEqualToString:@"StackDeleted"] & 1) == 0
        && ([v14 isEqualToString:@"WidgetAddedToStack"] & 1) == 0
        && ([v14 isEqualToString:@"WidgetRemovedFromStack"] & 1) == 0)
      {
        if ([v14 isEqualToString:@"StackVisibilityChanged"])
        {

          id v34 = [v1 metadata];
          if (v34)
          {
            uint64_t v35 = v34;
            id v36 = [v34 visibleRect];

            if (v36)
            {
              [v36 rect];
              uint64_t v38 = v37;
              uint64_t v40 = v39;
              uint64_t v42 = v41;
              uint64_t v44 = v43;

              id v45 = [v1 date];
              uint64_t v46 = type metadata accessor for VisibleRectChangedEvent(0);
              *(void *)(a1 + 24) = v46;
              *(void *)(a1 + 32) = &off_1000FCA28;
              id v47 = sub_100022744((uint64_t *)a1);
              sub_1000CACA0();

              uint64_t v48 = (uint64_t *)((char *)v47 + *(int *)(v46 + 20));
              *uint64_t v48 = v38;
              v48[1] = v40;
              v48[2] = v42;
              v48[3] = v44;
              return;
            }
          }
          sub_1000CC510();
          sub_100022644();
          uint64_t v49 = (void *)sub_1000CC630();
          sub_1000CB230();

LABEL_21:
          *(void *)(a1 + 32) = 0;
          *(_OWORD *)a1 = 0u;
          *(_OWORD *)(a1 + 16) = 0u;
          return;
        }
        if (([v14 isEqualToString:@"AppAdded"] & 1) == 0) {
          [v14 isEqualToString:@"AppRemoved"];
        }
      }
    }
LABEL_20:

    goto LABEL_21;
  }

  id v15 = [v1 metadata];
  if (v15)
  {
    uint64_t v16 = v15;
    id v17 = [v15 engagedUrl];

    if (v17)
    {
      sub_1000CABA0();

      uint64_t v18 = sub_1000CABE0();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v6, 0, 1, v18);
    }
    else
    {
      uint64_t v20 = sub_1000CABE0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v6, 1, 1, v20);
    }
    sub_1000365A0((uint64_t)v6, (uint64_t)v8, &qword_10010F340);
  }
  else
  {
    uint64_t v19 = sub_1000CABE0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v8, 1, 1, v19);
  }
  id v21 = [v1 date];
  uint64_t v22 = type metadata accessor for EngagementEvent(0);
  *(void *)(a1 + 24) = v22;
  *(void *)(a1 + 32) = &off_1000FCA10;
  uint64_t v23 = sub_100022744((uint64_t *)a1);
  sub_1000CACA0();

  sub_1000365A0((uint64_t)v8, (uint64_t)v23 + *(int *)(v22 + 20), &qword_10010F340);
}

uint64_t sub_1000B52E0(uint64_t a1, uint8_t *a2)
{
  uint64_t v4 = sub_10001D64C(&qword_10010ED90);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000B5618(a1, (uint64_t)v6);
  sub_100022644();
  uint64_t v7 = sub_1000CC630();
  os_log_type_t v8 = sub_1000CC530();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v19 = a2;
    uint64_t v20 = 0;
    uint64_t v18 = a1;
    *(_DWORD *)uint64_t v9 = 136315138;
    id v17 = v9 + 4;
    unint64_t v21 = 0xE000000000000000;
    uint64_t v22 = v10;
    sub_1000CACC0();
    sub_1000CC820();
    v23._countAndFlagsBits = 3026478;
    v23._object = (void *)0xE300000000000000;
    sub_1000CC2B0(v23);
    sub_1000CC820();
    uint64_t v20 = sub_1000B2E18(v20, v21, &v22);
    a1 = v18;
    sub_1000CC660();
    swift_bridgeObjectRelease();
    sub_1000227A8((uint64_t)v6, &qword_10010ED90);
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "event store querying for events in range %s", v9, 0xCu);
    swift_arrayDestroy();
    a2 = v19;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    sub_1000227A8((uint64_t)v6, &qword_10010ED90);
  }
  id v11 = [objc_allocWithZone((Class)ATXBiomeUIStream) init];
  CFDateRef isa = sub_1000CAC50().super.isa;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = _swiftEmptyArrayStorage;
  id v14 = [v11 publisherFromStartTime:CFDateGetAbsoluteTime(isa)];
  *(&v17 - 4) = (uint8_t *)__chkstk_darwin(v14);
  *(&v17 - 3) = (uint8_t *)v13;
  *(&v17 - 2) = (uint8_t *)a1;
  *(&v17 - 1) = a2;
  sub_10001D64C(&qword_100111F80);
  swift_allocObject();
  uint64_t v15 = sub_1000CB080();

  swift_release();
  return v15;
}

uint64_t sub_1000B5618(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10001D64C(&qword_10010ED90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000B5680()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000B56B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1000B3E58(a1, a2, a3, a4, *(void **)(v4 + 16), *(void *)(v4 + 24), *(void *)(v4 + 32), *(void *)(v4 + 40));
}

uint64_t sub_1000B56C4()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000B56FC()
{
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_1000B5744(void *a1)
{
  return sub_1000B41A4(a1, *(void *)(v1 + 16), *(void (**)(uint64_t))(v1 + 24), *(void *)(v1 + 32), *(void (**)(id))(v1 + 40));
}

uint64_t sub_1000B5754(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000B5764()
{
  return swift_release();
}

uint64_t sub_1000B576C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TaskContext();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000B57D0()
{
  uint64_t v1 = v0;
  uint64_t v2 = (int *)(sub_10001D64C(&qword_10010ED90) - 8);
  uint64_t v3 = *(unsigned __int8 *)(*(void *)v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = *(void *)(*(void *)v2 + 64);
  uint64_t v6 = (int *)(type metadata accessor for TaskContext() - 8);
  uint64_t v7 = *(unsigned __int8 *)(*(void *)v6 + 80);
  uint64_t v8 = (v4 + v5 + v7) & ~v7;
  uint64_t v33 = *(void *)(*(void *)v6 + 64);
  uint64_t v9 = v1 + v4;
  uint64_t v10 = sub_1000CACC0();
  id v11 = *(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8);
  v11(v9, v10);
  uint64_t v12 = v9 + v2[11];
  uint64_t v13 = v8;
  v11(v12, v10);
  uint64_t v14 = sub_1000CC0D0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(v1 + v8, v14);
  uint64_t v15 = v1 + v8 + v6[7];
  uint64_t v16 = type metadata accessor for NewsTimelineEntry();
  int v17 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 48))(v15, 1, v16);
  uint64_t v18 = v33;
  if (!v17)
  {
    uint64_t v32 = v7;
    v11(v15, v10);
    uint64_t v19 = (id *)(v15 + *(int *)(v16 + 20));

    uint64_t v20 = type metadata accessor for TodayContent();
    unint64_t v21 = (char *)v19 + *(int *)(v20 + 20);
    uint64_t v22 = (int *)type metadata accessor for Banner();
    if (!(*(unsigned int (**)(char *, uint64_t, int *))(*((void *)v22 - 1) + 48))(v21, 1, v22))
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      Swift::String v23 = &v21[v22[7]];
      uint64_t v24 = sub_1000CABE0();
      uint64_t v25 = *(void *)(v24 - 8);
      if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24)) {
        (*(void (**)(char *, uint64_t))(v25 + 8))(v23, v24);
      }
      swift_bridgeObjectRelease();
      char v26 = *(void **)&v21[v22[9]];
      if (v26 != (void *)1) {

      }
      sub_10001DE30(*(void **)&v21[v22[10]], *(void **)&v21[v22[10] + 8]);
    }
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    id v27 = (char *)v19 + *(int *)(v20 + 36);
    uint64_t v28 = sub_1000CABE0();
    uint64_t v29 = *(void *)(v28 - 8);
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v27, 1, v28)) {
      (*(void (**)(char *, uint64_t))(v29 + 8))(v27, v28);
    }
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v13 = v8;
    uint64_t v18 = v33;
    uint64_t v7 = v32;
  }
  unint64_t v30 = ((v18 + v13 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_release();

  return _swift_deallocObject(v1, v30, v3 | v7 | 7);
}

void sub_1000B5C0C(void *a1)
{
  uint64_t v3 = *(void *)(sub_10001D64C(&qword_10010ED90) - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(void *)(v3 + 64);
  uint64_t v6 = *(void *)(type metadata accessor for TaskContext() - 8);
  unint64_t v7 = (v4 + v5 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = *(void *)(v1 + ((*(void *)(v6 + 64) + v7 + 7) & 0xFFFFFFFFFFFFFFF8));

  sub_1000B4470(a1, v1 + v4, v1 + v7, v8);
}

uint64_t sub_1000B5D10(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1000B5D58()
{
  unint64_t result = qword_100111F88;
  if (!qword_100111F88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100111F88);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for BiomeEventStore.Errors(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1000B5E48);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for BiomeEventStore.Errors()
{
  return &type metadata for BiomeEventStore.Errors;
}

unint64_t sub_1000B5E84()
{
  unint64_t result = qword_100111F90;
  if (!qword_100111F90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100111F90);
  }
  return result;
}

Swift::Void __swiftcall TelemetryManager.flush()()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1000CACC0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v46 - v7;
  sub_100020110((void *)(v0 + 16), *(void *)(v0 + 40));
  char v9 = sub_100062DBC();
  id v51 = FCAnalyticsLog;
  sub_1000CC530();
  if (v9)
  {
    sub_1000CB230();

    sub_1000CACB0();
    id v10 = [objc_allocWithZone((Class)NTPBTelemetry) init];
    if (!v10) {
      goto LABEL_27;
    }
    id v11 = v10;
    uint64_t v12 = *(void **)(v1 + 56);
    uint64_t v13 = v1 + OBJC_IVAR____TtC7NewsTag16TelemetryManager_lastFlushDate;
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v13, v2);
    Class isa = sub_1000CAC50().super.isa;
    uint64_t v50 = *(void (**)(char *, uint64_t))(v3 + 8);
    id v51 = (id)(v3 + 8);
    v50(v6, v2);
    Class v15 = sub_1000CAC50().super.isa;
    [v12 populateTelemetry:v11 withNetworkEventsFromDate:isa toDate:v15];

    id v16 = [v11 networkEventGroups];
    if (v16)
    {
      int v17 = v16;
      uint64_t v18 = &selRef_components_fromDate_;
      if ([v16 count])
      {
        [*(id *)(v1 + 64) annotateTelemetry:v11 withOptions:4095];
        id v19 = [self nss_envelopeWithIdentifier];
        if (!v19)
        {
LABEL_28:
          __break(1u);
          goto LABEL_29;
        }
        uint64_t v20 = v19;
        [v19 setContentType:2];
        id v21 = [v11 data];
        if (!v21)
        {
LABEL_29:
          __break(1u);
          goto LABEL_30;
        }
        uint64_t v22 = v21;
        uint64_t v49 = v13;
        id v23 = [v21 fc_zlibDeflate];

        if (v23)
        {
          uint64_t v24 = sub_1000CAC10();
          unint64_t v26 = v25;

          v27.super.Class isa = sub_1000CAC00().super.isa;
          uint64_t v28 = v24;
          uint64_t v18 = &selRef_components_fromDate_;
          sub_100022684(v28, v26);
        }
        else
        {
          v27.super.Class isa = 0;
        }
        [v20 setContent:v27.super.isa];

        id v31 = (void *)FCAnalyticsLog;
        sub_10001D64C((uint64_t *)&unk_10010E840);
        uint64_t v32 = swift_allocObject();
        *(_OWORD *)(v32 + 16) = xmmword_1000D34A0;
        id v48 = v31;
        id v33 = [v17 v18[7]];
        *(void *)(v32 + 56) = &type metadata for Int;
        *(void *)(v32 + 64) = &protocol witness table for Int;
        *(void *)(v32 + 32) = v33;
        id v34 = [v20 content];
        if (!v34)
        {
LABEL_30:
          __break(1u);
          JUMPOUT(0x1000B65E4);
        }
        uint64_t v35 = v34;
        uint64_t v36 = sub_1000CAC10();
        unint64_t v38 = v37;

        switch(v38 >> 62)
        {
          case 1uLL:
            goto LABEL_21;
          case 2uLL:
            uint64_t v40 = *(void *)(v36 + 16);
            uint64_t v47 = *(void *)(v36 + 24);
            sub_100022684(v36, v38);
            uint64_t v39 = v47 - v40;
            if (!__OFSUB__(v47, v40)) {
              goto LABEL_24;
            }
            __break(1u);
LABEL_21:
            sub_100022684(v36, v38);
            LODWORD(v39) = HIDWORD(v36) - v36;
            if (!__OFSUB__(HIDWORD(v36), v36))
            {
              uint64_t v39 = (int)v39;
LABEL_24:
              uint64_t v41 = v48;
              uint64_t v13 = v49;
              *(void *)(v32 + 96) = &type metadata for Int;
              *(void *)(v32 + 104) = &protocol witness table for Int;
              *(void *)(v32 + 72) = v39;
              sub_1000CC530();
              sub_1000CB230();

              swift_bridgeObjectRelease();
              id v42 = [objc_allocWithZone((Class)NSSNewsAnalyticsSubmitEnvelopesOperation) init];
              sub_10001D64C(&qword_100111C70);
              uint64_t v43 = swift_allocObject();
              *(_OWORD *)(v43 + 16) = xmmword_1000D7010;
              *(void *)(v43 + 32) = v20;
              uint64_t v52 = v43;
              sub_1000CC3D0();
              sub_1000B6728();
              id v44 = v20;
              Class v45 = sub_1000CC3A0().super.isa;
              swift_bridgeObjectRelease();
              [v42 setEnvelopes:v45];

              [v42 start];
              goto LABEL_25;
            }
            __break(1u);
            break;
          case 3uLL:
            sub_100022684(v36, v38);
            uint64_t v39 = 0;
            goto LABEL_24;
          default:
            sub_100022684(v36, v38);
            uint64_t v39 = BYTE6(v38);
            goto LABEL_24;
        }
LABEL_27:
        __break(1u);
        goto LABEL_28;
      }
    }
    id v30 = FCAnalyticsLog;
    sub_1000CC530();
    sub_1000CB230();

LABEL_25:
    swift_beginAccess();
    (*(void (**)(uint64_t, char *, uint64_t))(v3 + 24))(v13, v8, v2);
    swift_endAccess();
    v50(v8, v2);
    return;
  }
  sub_1000CB230();
  id v29 = v51;
}

uint64_t TelemetryManager.deinit()
{
  sub_1000201A8(v0 + 16);

  uint64_t v1 = v0 + OBJC_IVAR____TtC7NewsTag16TelemetryManager_lastFlushDate;
  uint64_t v2 = sub_1000CACC0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t TelemetryManager.__deallocating_deinit()
{
  sub_1000201A8((uint64_t)(v0 + 2));

  uint64_t v1 = (char *)v0 + OBJC_IVAR____TtC7NewsTag16TelemetryManager_lastFlushDate;
  uint64_t v2 = sub_1000CACC0();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *((unsigned int *)*v0 + 12);
  uint64_t v4 = *((unsigned __int16 *)*v0 + 26);

  return _swift_deallocClassInstance(v0, v3, v4);
}

unint64_t sub_1000B6728()
{
  unint64_t result = qword_100111FA0;
  if (!qword_100111FA0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100111FA0);
  }
  return result;
}

uint64_t sub_1000B6768()
{
  return type metadata accessor for TelemetryManager();
}

uint64_t type metadata accessor for TelemetryManager()
{
  uint64_t result = qword_100111FD0;
  if (!qword_100111FD0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000B67BC()
{
  uint64_t result = sub_1000CACC0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t NTPBTodaySectionConfigWebEmbed.conforms(to:)(__objc2_prot *a1)
{
  v3.super_class = (Class)NTPBTodaySectionConfigWebEmbed;
  LODWORD(result) = [(__objc2_prot *)&v3 conformsToProtocol:a1];
  if (&OBJC_PROTOCOL___NTTodayItem == a1) {
    return 1;
  }
  else {
    return result;
  }
}

void *sub_1000B6950()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Item.Headline(0);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Item(0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000B99B8(v1, (uint64_t)v7, type metadata accessor for Item);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_1000BB2CC((uint64_t)v7, type metadata accessor for Item);
    return 0;
  }
  else
  {
    sub_1000B9764((uint64_t)v7, (uint64_t)v4, type metadata accessor for Item.Headline);
    char v9 = &v4[*(int *)(v2 + 28)];
    id v10 = *(id *)v9;
    uint64_t v8 = (void *)*((void *)v9 + 1);
    sub_1000B9B08(*(id *)v9, v8);
    sub_1000BB2CC((uint64_t)v4, type metadata accessor for Item.Headline);
    if (v8)
    {
      id v11 = v8;
      sub_1000B963C(v10, v8);
    }
  }
  return v8;
}

id sub_1000B6AD4()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Item.Headline(0);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Item(0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000B99B8(v1, (uint64_t)v7, type metadata accessor for Item);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_1000BB2CC((uint64_t)v7, type metadata accessor for Item);
    return 0;
  }
  sub_1000B9764((uint64_t)v7, (uint64_t)v4, type metadata accessor for Item.Headline);
  uint64_t v8 = &v4[*(int *)(v2 + 28)];
  id v9 = *(id *)v8;
  id v10 = (void *)*((void *)v8 + 1);
  sub_1000B9B08(*(id *)v8, v10);
  sub_1000BB2CC((uint64_t)v4, type metadata accessor for Item.Headline);
  if (!v10) {
    return 0;
  }
  id v11 = v9;
  sub_1000B963C(v9, v10);
  return v9;
}

id sub_1000B6C5C()
{
  uint64_t v1 = sub_10001D64C(&qword_10010F340);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000CABE0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Item.Headline(0);
  sub_1000226DC(v0 + *(int *)(v8 + 24), (uint64_t)v3);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_1000227A8((uint64_t)v3, &qword_10010F340);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v3, v4);
    sub_1000CAB60(v10);
    uint64_t v12 = v11;
    id v9 = [v11 nss_isAudioURL];

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  return v9;
}

id sub_1000B6E00()
{
  uint64_t v1 = sub_10001D64C(&qword_1001122B0);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for ImageStore.Key();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000B7A58(v3);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_1000227A8((uint64_t)v3, &qword_1001122B0);
    return 0;
  }
  else
  {
    sub_1000B9764((uint64_t)v3, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for ImageStore.Key);
    uint64_t v9 = *(void *)(v0 + 8);
    if (*(void *)(v9 + 16) && (unint64_t v10 = sub_10003CC4C((uint64_t)v7), (v11 & 1) != 0)) {
      id v8 = [*(id *)(*(void *)(v9 + 56) + 8 * v10) imageWithRenderingMode:2];
    }
    else {
      id v8 = 0;
    }
    sub_1000BB2CC((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for ImageStore.Key);
  }
  return v8;
}

uint64_t sub_1000B6FB8@<X0>(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, void *a4@<X3>, void *a5@<X4>, void *a6@<X8>)
{
  if ([a1 itemType] || (uint64_t v13 = swift_dynamicCastObjCProtocolConditional()) == 0)
  {
    sub_1000B963C(a4, a5);
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v14 = (void *)v13;
    swift_unknownObjectRetain();
    id v15 = [v14 title];
    if (v15)
    {

      id v16 = [objc_allocWithZone((Class)FTHeadlineRowOpenURLEngagementDescriptor) initWithHeadline:v14];
      sub_100020110(a3, a3[3]);
      uint64_t v17 = type metadata accessor for Item.Headline(0);
      sub_1000A542C(v16, (uint64_t)a6 + *(int *)(v17 + 24));

      swift_unknownObjectRelease();
      *a6 = v14;
      a6[1] = a2;
      uint64_t v18 = (void *)((char *)a6 + *(int *)(v17 + 28));
      *uint64_t v18 = a4;
      v18[1] = a5;
      uint64_t v19 = type metadata accessor for Item(0);
      swift_storeEnumTagMultiPayload();
      (*(void (**)(void *, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(a6, 0, 1, v19);
      return sub_1000201A8((uint64_t)a3);
    }
    swift_bridgeObjectRelease();
    sub_1000CC520();
    sub_10001D64C((uint64_t *)&unk_10010E840);
    uint64_t v20 = swift_allocObject();
    *(_OWORD *)(v20 + 16) = xmmword_1000D37C0;
    id v21 = [v14 identifier];
    uint64_t v22 = sub_1000CC1F0();
    uint64_t v24 = v23;

    *(void *)(v20 + 56) = &type metadata for String;
    *(void *)(v20 + 64) = sub_1000225F0();
    *(void *)(v20 + 32) = v22;
    *(void *)(v20 + 40) = v24;
    sub_100036814(0, (unint64_t *)&qword_100110C20);
    unint64_t v25 = (void *)sub_1000CC630();
    sub_1000CB230();
    sub_1000B963C(a4, a5);
    swift_bridgeObjectRelease();

    swift_unknownObjectRelease_n();
  }
  sub_1000201A8((uint64_t)a3);
  uint64_t v11 = type metadata accessor for Item(0);
  return (*(uint64_t (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(a6, 1, 1, v11);
}

uint64_t sub_1000B728C()
{
  id v1 = *v0;
  id v2 = [*v0 storyTypeColorLight];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = sub_1000CC1F0();
    uint64_t v6 = v5;

    id v7 = [v1 storyTypeColorDark];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = sub_1000CC1F0();
      uint64_t v11 = v10;

      sub_100036814(0, (unint64_t *)&qword_100111C20);
      v12._countAndFlagsBits = v4;
      v12._object = v6;
      Class isa = UIColor.init(hex:)(v12).super.isa;
      v14._countAndFlagsBits = v9;
      v14._object = v11;
      Class v15 = UIColor.init(hex:)(v14).super.isa;
      uint64_t v16 = swift_allocObject();
      *(void *)(v16 + 16) = isa;
      *(void *)(v16 + 24) = v15;
      id v17 = objc_allocWithZone((Class)UIColor);
      v23[4] = sub_100042180;
      v23[5] = v16;
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 1107296256;
      uint64_t v23[2] = sub_10006CB14;
      v23[3] = &unk_1000FEAF0;
      uint64_t v18 = _Block_copy(v23);
      uint64_t v19 = isa;
      uint64_t v20 = v15;
      [v17 initWithDynamicProvider:v18];
      _Block_release(v18);
      swift_release();
      uint64_t v21 = sub_1000CBBB0();

      return v21;
    }
    swift_bridgeObjectRelease();
  }

  return sub_1000CBB90();
}

void *sub_1000B7470()
{
  uint64_t v1 = sub_10001D64C(&qword_1001122B0);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for ImageStore.Key();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000B7D00(v3);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_1000227A8((uint64_t)v3, &qword_1001122B0);
    return 0;
  }
  else
  {
    sub_1000B9764((uint64_t)v3, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for ImageStore.Key);
    uint64_t v9 = *(void *)(v0 + 8);
    if (*(void *)(v9 + 16) && (unint64_t v10 = sub_10003CC4C((uint64_t)v7), (v11 & 1) != 0))
    {
      id v8 = *(void **)(*(void *)(v9 + 56) + 8 * v10);
      id v12 = v8;
    }
    else
    {
      id v8 = 0;
    }
    sub_1000BB2CC((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for ImageStore.Key);
  }
  return v8;
}

id sub_1000B7610()
{
  uint64_t v1 = sub_10001D64C(&qword_1001122B8);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = [*v0 compactSourceName];
  if (v4)
  {
    uint64_t v5 = v4;
    sub_1000CC1F0();
  }
  sub_1000CAA80();
  uint64_t v6 = sub_1000CAA90();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v3, 0, 1, v6);
  char v7 = sub_1000CAED0();
  swift_bridgeObjectRelease();
  sub_1000227A8((uint64_t)v3, &qword_1001122B8);
  id v8 = *v0;
  if (v7)
  {
    id v8 = [v8 sourceName];
    uint64_t v9 = v8;
    if (v8)
    {
LABEL_7:
      uint64_t v11 = sub_1000CC1F0();

      return (id)v11;
    }
    __break(1u);
  }
  id result = [v8 compactSourceName];
  uint64_t v9 = result;
  if (result) {
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

id sub_1000B7798()
{
  uint64_t v1 = type metadata accessor for Item.Headline(0);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (id *)((char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  id v4 = [*v0 titleCompact];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = sub_1000CC1F0();
    uint64_t v8 = v7;

    sub_1000B99B8((uint64_t)v0, (uint64_t)v3, type metadata accessor for Item.Headline);
    if (v8)
    {
LABEL_7:
      sub_1000BB2CC((uint64_t)v3, type metadata accessor for Item.Headline);
      return (id)v6;
    }
  }
  else
  {
    sub_1000B99B8((uint64_t)v0, (uint64_t)v3, type metadata accessor for Item.Headline);
  }
  id result = [*v3 title];
  if (result)
  {
    unint64_t v10 = result;
    uint64_t v6 = sub_1000CC1F0();

    goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000B78DC()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Item.Headline(0);
  __chkstk_darwin(v2 - 8);
  id v4 = (id *)((char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = type metadata accessor for Item(0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000B99B8(v1, (uint64_t)v7, type metadata accessor for Item);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    swift_bridgeObjectRelease();
    return 0x6567617373656DLL;
  }
  else
  {
    sub_1000B9764((uint64_t)v7, (uint64_t)v4, type metadata accessor for Item.Headline);
    id v9 = [*v4 identifier];
    uint64_t v8 = sub_1000CC1F0();

    sub_1000BB2CC((uint64_t)v4, type metadata accessor for Item.Headline);
  }
  return v8;
}

uint64_t sub_1000B7A58@<X0>(char *a1@<X8>)
{
  uint64_t v3 = sub_10001D64C(&qword_10010F340);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000CABE0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  unint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v20 - v11;
  id v13 = [*v1 sourceNameImageRemoteURL];
  if (v13)
  {
    uint64_t v14 = v13;
    sub_1000CABA0();

    Class v15 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
    v15(v5, v10, v6);
    uint64_t v16 = *(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56);
    v16(v5, 0, 1, v6);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) != 1)
    {
      v15(v12, v5, v6);
      v15(a1, v12, v6);
      v16(a1, 0, 1, v6);
      uint64_t v17 = type metadata accessor for ImageStore.Key();
      return (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(a1, 0, 1, v17);
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
  }
  sub_1000227A8((uint64_t)v5, &qword_10010F340);
  uint64_t v19 = type metadata accessor for ImageStore.Key();
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(a1, 1, 1, v19);
}

uint64_t sub_1000B7D00@<X0>(char *a1@<X8>)
{
  uint64_t v3 = sub_10001D64C(&qword_10010F340);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000CABE0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  unint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v23 - v11;
  id v13 = *v1;
  if ([*v1 needsPlaceholderThumbnail])
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(a1, 1, 1, v6);
    uint64_t v14 = type metadata accessor for ImageStore.Key();
    Class v15 = *(uint64_t (**)(char *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
    return v15(a1, 0, 1, v14);
  }
  else
  {
    id v17 = [v13 thumbnailRemoteURL];
    if (v17)
    {
      uint64_t v18 = v17;
      sub_1000CABA0();

      uint64_t v19 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
      v19(v5, v10, v6);
      uint64_t v20 = *(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56);
      v20(v5, 0, 1, v6);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) != 1)
      {
        v19(v12, v5, v6);
        v19(a1, v12, v6);
        v20(a1, 0, 1, v6);
        uint64_t v21 = type metadata accessor for ImageStore.Key();
        return (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(a1, 0, 1, v21);
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
    }
    sub_1000227A8((uint64_t)v5, &qword_10010F340);
    uint64_t v22 = type metadata accessor for ImageStore.Key();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(a1, 1, 1, v22);
  }
}

uint64_t sub_1000B804C()
{
  id v1 = [*v0 identifier];
  uint64_t v2 = sub_1000CC1F0();

  return v2;
}

uint64_t sub_1000B80A8()
{
  uint64_t v1 = 0x656E696C64616568;
  if (*v0 != 1) {
    uint64_t v1 = 0x6567617373656DLL;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 1701869940;
  }
}

uint64_t sub_1000B80FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1000BBA04(a1, a2);
  *a3 = result;
  return result;
}

void sub_1000B8124(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_1000B8130(uint64_t a1)
{
  unint64_t v2 = sub_1000B96BC();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000B816C(uint64_t a1)
{
  unint64_t v2 = sub_1000B96BC();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000B81A8(char *a1, char *a2)
{
  return sub_10005BF60(*a1, *a2);
}

Swift::Int sub_1000B81B4()
{
  return sub_1000CCAF0();
}

uint64_t sub_1000B8238()
{
  sub_1000CC270();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000B82A8()
{
  return sub_1000CCAF0();
}

uint64_t sub_1000B8328@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  v8._countAndFlagsBits = *a1;
  uint64_t v3 = (void *)a1[1];
  v4._rawValue = &off_1000FBF90;
  v8._object = v3;
  Swift::Int v5 = sub_1000CC8F0(v4, v8);
  uint64_t result = swift_bridgeObjectRelease();
  if (v5 == 1) {
    char v7 = 1;
  }
  else {
    char v7 = 2;
  }
  if (!v5) {
    char v7 = 0;
  }
  *a2 = v7;
  return result;
}

void sub_1000B8388(uint64_t *a1@<X8>)
{
  uint64_t v2 = 0x656E696C64616568;
  if (*v1) {
    uint64_t v2 = 0x6567617373656DLL;
  }
  unint64_t v3 = 0xE800000000000000;
  if (*v1) {
    unint64_t v3 = 0xE700000000000000;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_1000B83C8()
{
  return sub_1000CC380();
}

uint64_t sub_1000B8428()
{
  return sub_1000CC370();
}

uint64_t sub_1000B8478@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v24 = a2;
  uint64_t v22 = type metadata accessor for Item.Headline(0);
  __chkstk_darwin(v22);
  Swift::OpaquePointer v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10001D64C(&qword_100112078);
  uint64_t v23 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  char v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Item(0);
  __chkstk_darwin(v8);
  unint64_t v10 = (uint64_t *)((char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_100020110(a1, a1[3]);
  sub_1000B96BC();
  uint64_t v11 = v25;
  sub_1000CCB10();
  if (!v11)
  {
    uint64_t v21 = v4;
    uint64_t v25 = v8;
    uint64_t v12 = v23;
    uint64_t v13 = v24;
    char v28 = 0;
    sub_1000B9710();
    sub_1000CC980();
    uint64_t v15 = v12;
    if (v29)
    {
      char v27 = 2;
      uint64_t v17 = sub_1000CC940();
      uint64_t v19 = v18;
      (*(void (**)(char *, uint64_t))(v15 + 8))(v7, v5);
      *unint64_t v10 = v17;
      v10[1] = v19;
    }
    else
    {
      char v26 = 1;
      sub_1000B9820(&qword_100112090, (void (*)(uint64_t))type metadata accessor for Item.Headline);
      uint64_t v16 = (uint64_t)v21;
      sub_1000CC980();
      (*(void (**)(char *, uint64_t))(v15 + 8))(v7, v5);
      sub_1000B9764(v16, (uint64_t)v10, type metadata accessor for Item.Headline);
    }
    swift_storeEnumTagMultiPayload();
    sub_1000B9764((uint64_t)v10, v13, type metadata accessor for Item);
  }
  return sub_1000201A8((uint64_t)a1);
}

uint64_t sub_1000B87E0(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v16 = type metadata accessor for Item.Headline(0);
  __chkstk_darwin(v16);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for Item(0);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10001D64C(&qword_100112098);
  uint64_t v17 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100020110(a1, a1[3]);
  sub_1000B96BC();
  sub_1000CCB30();
  sub_1000B99B8(v2, (uint64_t)v8, type metadata accessor for Item);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    char v23 = 1;
    char v22 = 0;
    sub_1000B97CC();
    uint64_t v12 = v18;
    sub_1000CC9F0();
    if (!v12)
    {
      char v21 = 2;
      sub_1000CC9B0();
    }
    (*(void (**)(char *, uint64_t))(v17 + 8))(v11, v9);
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_1000B9764((uint64_t)v8, (uint64_t)v5, type metadata accessor for Item.Headline);
    __int16 v20 = 0;
    sub_1000B97CC();
    uint64_t v14 = v18;
    sub_1000CC9F0();
    if (!v14)
    {
      char v19 = 1;
      sub_1000B9820((unint64_t *)&unk_1001120A8, (void (*)(uint64_t))type metadata accessor for Item.Headline);
      sub_1000CC9F0();
    }
    sub_1000BB2CC((uint64_t)v5, type metadata accessor for Item.Headline);
    return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v11, v9);
  }
}

uint64_t sub_1000B8B30@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000B8478(a1, a2);
}

uint64_t sub_1000B8B48(void *a1)
{
  return sub_1000B87E0(a1);
}

uint64_t sub_1000B8B60()
{
  uint64_t result = 0x696C64616548746ELL;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x6F74536567616D69;
      break;
    case 2:
      uint64_t result = 0x72556E6F69746361;
      break;
    case 3:
      uint64_t result = 0x64657A796C616E61;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1000B8C10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1000BBBA0(a1, a2);
  *a3 = result;
  return result;
}

void sub_1000B8C38(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_1000B8C44(uint64_t a1)
{
  unint64_t v2 = sub_1000B9868();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000B8C80(uint64_t a1)
{
  unint64_t v2 = sub_1000B9868();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000B8CBC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v27 = a2;
  uint64_t v3 = sub_10001D64C(&qword_10010F340);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10001D64C(&qword_1001120B8);
  uint64_t v28 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Item.Headline(0);
  __chkstk_darwin(v9);
  uint64_t v11 = (uint64_t *)((char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = a1[3];
  char v29 = a1;
  sub_100020110(a1, v12);
  sub_1000B9868();
  uint64_t v13 = v30;
  sub_1000CCB10();
  if (v13) {
    return sub_1000201A8((uint64_t)v29);
  }
  uint64_t v26 = v3;
  id v30 = v5;
  uint64_t v14 = v28;
  char v32 = 0;
  sub_100041420();
  sub_1000CC980();
  long long v15 = v31;
  sub_100036814(0, (unint64_t *)&unk_1001112C0);
  sub_100036814(0, &qword_1001120C8);
  uint64_t v16 = sub_1000CC540();
  uint64_t v18 = (void *)v16;
  if (!v16)
  {
    sub_1000B98BC();
    swift_allocError();
    swift_willThrow();
    sub_100022684(v15, *((unint64_t *)&v15 + 1));
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v6);
    return sub_1000201A8((uint64_t)v29);
  }
  uint64_t v24 = v15;
  uint64_t v25 = v11;
  *uint64_t v11 = v16;
  char v32 = 1;
  sub_1000B9910();
  id v19 = v18;
  sub_1000CC980();
  v25[1] = v31;
  LOBYTE(v31) = 2;
  sub_1000B9A74((unint64_t *)&qword_100110E80, &qword_10010F5C0);
  uint64_t v20 = (uint64_t)v30;
  uint64_t v26 = 0;
  sub_1000CC980();
  sub_1000A4B90(v20, (uint64_t)v25 + *(int *)(v9 + 24));
  sub_10001D64C(&qword_1001120E0);
  char v32 = 3;
  sub_1000B9B48(&qword_1001120E8, (void (*)(void))sub_1000B9964);
  sub_1000CC980();
  uint64_t v21 = v24;
  (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v6);
  sub_100022684(v21, *((unint64_t *)&v15 + 1));

  uint64_t v22 = (uint64_t)v25;
  *(_OWORD *)((char *)v25 + *(int *)(v9 + 28)) = v31;
  sub_1000B99B8(v22, v27, type metadata accessor for Item.Headline);
  sub_1000201A8((uint64_t)v29);
  return sub_1000BB2CC(v22, type metadata accessor for Item.Headline);
}

uint64_t sub_1000B924C(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_10001D64C((uint64_t *)&unk_1001120F8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100020110(a1, a1[3]);
  sub_1000B9868();
  sub_1000CCB30();
  uint64_t v9 = self;
  uint64_t v10 = *v3;
  id v24 = 0;
  id v11 = [v9 archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v24];
  id v12 = v24;
  if (v11)
  {
    uint64_t v13 = (void *)sub_1000CAC10();
    unint64_t v15 = v14;

    id v24 = v13;
    unint64_t v25 = v15;
    char v23 = 0;
    sub_10004172C();
    sub_1000CC9F0();
    if (v2)
    {
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      return sub_100022684((uint64_t)v13, v15);
    }
    id v24 = (id)v3[1];
    char v23 = 1;
    sub_1000B9A20();
    swift_bridgeObjectRetain();
    sub_1000CC9F0();
    swift_bridgeObjectRelease();
    uint64_t v22 = type metadata accessor for Item.Headline(0);
    LOBYTE(v24) = 2;
    sub_10001D64C(&qword_10010F340);
    sub_1000B9A74((unint64_t *)&qword_10010F5F0, &qword_100110EE0);
    sub_1000CC9F0();
    uint64_t v18 = (char *)v3 + *(int *)(v22 + 28);
    uint64_t v20 = (void *)*((void *)v18 + 1);
    id v24 = *(id *)v18;
    id v19 = v24;
    unint64_t v25 = (unint64_t)v20;
    char v23 = 3;
    sub_1000B9B08(v24, v20);
    sub_10001D64C(&qword_1001120E0);
    sub_1000B9B48(&qword_100112110, (void (*)(void))sub_1000B9BB8);
    sub_1000CC9F0();
    sub_100022684((uint64_t)v13, v15);
    sub_1000B963C(v19, v20);
  }
  else
  {
    uint64_t v17 = v12;
    sub_1000CAB00();

    swift_willThrow();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_1000B960C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000B8CBC(a1, a2);
}

uint64_t sub_1000B9624(void *a1)
{
  return sub_1000B924C(a1);
}

void sub_1000B963C(void *a1, void *a2)
{
  if (a2)
  {
  }
}

uint64_t type metadata accessor for Item(uint64_t a1)
{
  return sub_100032D40(a1, qword_100112230);
}

uint64_t type metadata accessor for Item.Headline(uint64_t a1)
{
  return sub_100032D40(a1, qword_100112178);
}

unint64_t sub_1000B96BC()
{
  unint64_t result = qword_100112080;
  if (!qword_100112080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100112080);
  }
  return result;
}

unint64_t sub_1000B9710()
{
  unint64_t result = qword_100112088;
  if (!qword_100112088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100112088);
  }
  return result;
}

uint64_t sub_1000B9764(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_1000B97CC()
{
  unint64_t result = qword_1001120A0;
  if (!qword_1001120A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001120A0);
  }
  return result;
}

uint64_t sub_1000B9820(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1000B9868()
{
  unint64_t result = qword_1001120C0;
  if (!qword_1001120C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001120C0);
  }
  return result;
}

unint64_t sub_1000B98BC()
{
  unint64_t result = qword_1001120D0;
  if (!qword_1001120D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001120D0);
  }
  return result;
}

unint64_t sub_1000B9910()
{
  unint64_t result = qword_1001120D8;
  if (!qword_1001120D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001120D8);
  }
  return result;
}

unint64_t sub_1000B9964()
{
  unint64_t result = qword_1001120F0;
  if (!qword_1001120F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001120F0);
  }
  return result;
}

uint64_t sub_1000B99B8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_1000B9A20()
{
  unint64_t result = qword_100112108;
  if (!qword_100112108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100112108);
  }
  return result;
}

uint64_t sub_1000B9A74(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10001D690(&qword_10010F340);
    sub_1000B9820(a2, (void (*)(uint64_t))&type metadata accessor for URL);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

id sub_1000B9B08(id result, void *a2)
{
  if (a2)
  {
    id v2 = result;
    return a2;
  }
  return result;
}

uint64_t sub_1000B9B48(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10001D690(&qword_1001120E0);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000B9BB8()
{
  unint64_t result = qword_100112118;
  if (!qword_100112118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100112118);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for Item.Headline.Errors(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1000B9CA8);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for Item.Headline.Errors()
{
  return &type metadata for Item.Headline.Errors;
}

unsigned char *storeEnumTagSinglePayload for Item.Headline.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000B9DACLL);
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

ValueMetadata *type metadata accessor for Item.Headline.CodingKeys()
{
  return &type metadata for Item.Headline.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for Item.CodingType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000B9EB0);
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

ValueMetadata *type metadata accessor for Item.CodingType()
{
  return &type metadata for Item.CodingType;
}

unsigned char *storeEnumTagSinglePayload for Item.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000B9FB4);
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

ValueMetadata *type metadata accessor for Item.CodingKeys()
{
  return &type metadata for Item.CodingKeys;
}

uint64_t *sub_1000B9FEC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a1;
    a1[1] = a2[1];
    uint64_t v8 = *(int *)(a3 + 24);
    __dst = (char *)a1 + v8;
    uint64_t v9 = (char *)a2 + v8;
    uint64_t v10 = sub_1000CABE0();
    uint64_t v11 = *(void *)(v10 - 8);
    id v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    if (v12(v9, 1, v10))
    {
      uint64_t v13 = sub_10001D64C(&qword_10010F340);
      memcpy(__dst, v9, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(__dst, v9, v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(__dst, 0, 1, v10);
    }
    uint64_t v14 = *(int *)(a3 + 28);
    unint64_t v15 = (uint64_t *)((char *)v7 + v14);
    uint64_t v16 = (char *)a2 + v14;
    uint64_t v17 = (void *)*((void *)v16 + 1);
    if (v17)
    {
      uint64_t v18 = *(void **)v16;
      *unint64_t v15 = v18;
      v15[1] = v17;
      id v19 = v18;
      id v20 = v17;
    }
    else
    {
      *(_OWORD *)unint64_t v15 = *(_OWORD *)v16;
    }
  }
  return v7;
}

void sub_1000BA1BC(uint64_t a1, uint64_t a2)
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_1000CABE0();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  uint64_t v7 = a1 + *(int *)(a2 + 28);
  if (*(void *)(v7 + 8))
  {

    uint64_t v8 = *(void **)(v7 + 8);
  }
}

void *sub_1000BA2BC(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 24);
  __dst = (char *)a1 + v7;
  uint64_t v8 = (char *)a2 + v7;
  uint64_t v9 = sub_1000CABE0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  if (v11(v8, 1, v9))
  {
    uint64_t v12 = sub_10001D64C(&qword_10010F340);
    memcpy(__dst, v8, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(__dst, v8, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(__dst, 0, 1, v9);
  }
  uint64_t v13 = *(int *)(a3 + 28);
  uint64_t v14 = (void *)((char *)a1 + v13);
  unint64_t v15 = (char *)a2 + v13;
  uint64_t v16 = (void *)*((void *)v15 + 1);
  if (v16)
  {
    uint64_t v17 = *(void **)v15;
    *uint64_t v14 = v17;
    v14[1] = v16;
    id v18 = v17;
    id v19 = v16;
  }
  else
  {
    *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
  }
  return a1;
}

void *sub_1000BA438(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1000CABE0();
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
    uint64_t v14 = sub_10001D64C(&qword_10010F340);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  uint64_t v15 = *(int *)(a3 + 28);
  uint64_t v16 = (void *)((char *)a1 + v15);
  uint64_t v17 = (char *)a2 + v15;
  uint64_t v18 = *(void *)((char *)a1 + v15 + 8);
  uint64_t v19 = *((void *)v17 + 1);
  if (!v18)
  {
    if (v19)
    {
      uint64_t v26 = *(void **)v17;
      void *v16 = *(void *)v17;
      uint64_t v27 = (void *)*((void *)v17 + 1);
      v16[1] = v27;
      id v28 = v26;
      id v29 = v27;
      return a1;
    }
LABEL_13:
    *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
    return a1;
  }
  if (!v19)
  {
    sub_100034B4C((uint64_t)v16);
    goto LABEL_13;
  }
  id v20 = (void *)*v16;
  uint64_t v21 = *(void **)v17;
  void *v16 = *(void *)v17;
  id v22 = v21;

  char v23 = (void *)*((void *)v17 + 1);
  id v24 = (void *)v16[1];
  v16[1] = v23;
  id v25 = v23;

  return a1;
}

void *sub_1000BA660(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_1000CABE0();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = sub_10001D64C(&qword_10010F340);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 28)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 28));
  return a1;
}

void *sub_1000BA790(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_unknownObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1000CABE0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    uint64_t v14 = sub_10001D64C(&qword_10010F340);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 40))(v7, v8, v9);
LABEL_7:
  uint64_t v15 = *(int *)(a3 + 28);
  uint64_t v16 = (uint64_t)a1 + v15;
  uint64_t v17 = (char *)a2 + v15;
  if (!*(void *)((char *)a1 + v15 + 8))
  {
LABEL_11:
    *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
    return a1;
  }
  if (!*((void *)v17 + 1))
  {
    sub_100034B4C(v16);
    goto LABEL_11;
  }
  uint64_t v18 = *(void **)v16;
  *(void *)uint64_t v16 = *(void *)v17;

  uint64_t v19 = *(void **)(v16 + 8);
  *(void *)(v16 + 8) = *((void *)v17 + 1);

  return a1;
}

uint64_t sub_1000BA980(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000BA994);
}

uint64_t sub_1000BA994(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_10001D64C(&qword_10010F340);
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_1000BAA48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000BAA5C);
}

void *sub_1000BAA5C(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *unint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_10001D64C(&qword_10010F340);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 24);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_1000BAB08()
{
  sub_100043F5C();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t *sub_1000BABB4(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = a2[1];
      *a1 = *a2;
      a1[1] = v6;
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v8 = a2[1];
      *a1 = *a2;
      a1[1] = v8;
      uint64_t v9 = type metadata accessor for Item.Headline(0);
      uint64_t v10 = *(int *)(v9 + 24);
      uint64_t v24 = v9;
      __dst = (char *)a1 + v10;
      uint64_t v11 = (char *)a2 + v10;
      uint64_t v12 = sub_1000CABE0();
      uint64_t v13 = *(void *)(v12 - 8);
      uint64_t v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
      swift_unknownObjectRetain();
      swift_bridgeObjectRetain();
      if (v14(v11, 1, v12))
      {
        uint64_t v15 = sub_10001D64C(&qword_10010F340);
        memcpy(__dst, v11, *(void *)(*(void *)(v15 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v13 + 16))(__dst, v11, v12);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(__dst, 0, 1, v12);
      }
      uint64_t v16 = *(int *)(v24 + 28);
      uint64_t v17 = (uint64_t *)((char *)a1 + v16);
      uint64_t v18 = (char *)a2 + v16;
      uint64_t v19 = (void *)*((void *)v18 + 1);
      if (v19)
      {
        id v20 = *(void **)v18;
        *uint64_t v17 = v20;
        v17[1] = v19;
        id v21 = v20;
        id v22 = v19;
      }
      else
      {
        *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
      }
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void sub_1000BADCC(uint64_t a1)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v2 = type metadata accessor for Item.Headline(0);
    uint64_t v3 = a1 + *(int *)(v2 + 24);
    uint64_t v4 = sub_1000CABE0();
    uint64_t v5 = *(void *)(v4 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4)) {
      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
    }
    uint64_t v6 = a1 + *(int *)(v2 + 28);
    if (*(void *)(v6 + 8))
    {

      uint64_t v7 = *(void **)(v6 + 8);
    }
  }
}

void *sub_1000BAF08(void *a1, void *a2)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = a2[1];
    *a1 = *a2;
    a1[1] = v4;
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = type metadata accessor for Item.Headline(0);
    uint64_t v7 = *(int *)(v6 + 24);
    __dst = (char *)a1 + v7;
    uint64_t v22 = v6;
    uint64_t v8 = (char *)a2 + v7;
    uint64_t v9 = sub_1000CABE0();
    uint64_t v10 = *(void *)(v9 - 8);
    uint64_t v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    if (v11(v8, 1, v9))
    {
      uint64_t v12 = sub_10001D64C(&qword_10010F340);
      memcpy(__dst, v8, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(__dst, v8, v9);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(__dst, 0, 1, v9);
    }
    uint64_t v13 = *(int *)(v22 + 28);
    uint64_t v14 = (void *)((char *)a1 + v13);
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = (void *)*((void *)v15 + 1);
    if (v16)
    {
      uint64_t v17 = *(void **)v15;
      *uint64_t v14 = v17;
      v14[1] = v16;
      id v18 = v17;
      id v19 = v16;
    }
    else
    {
      *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
    }
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *sub_1000BB0CC(void *a1, void *a2)
{
  if (a1 != a2)
  {
    sub_1000BB2CC((uint64_t)a1, type metadata accessor for Item);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
    }
    else
    {
      *a1 = *a2;
      a1[1] = a2[1];
      uint64_t v4 = type metadata accessor for Item.Headline(0);
      uint64_t v5 = *(int *)(v4 + 24);
      __dst = (char *)a1 + v5;
      uint64_t v20 = v4;
      uint64_t v6 = (char *)a2 + v5;
      uint64_t v7 = sub_1000CABE0();
      uint64_t v8 = *(void *)(v7 - 8);
      uint64_t v9 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48);
      swift_unknownObjectRetain();
      swift_bridgeObjectRetain();
      if (v9(v6, 1, v7))
      {
        uint64_t v10 = sub_10001D64C(&qword_10010F340);
        memcpy(__dst, v6, *(void *)(*(void *)(v10 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v8 + 16))(__dst, v6, v7);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(__dst, 0, 1, v7);
      }
      uint64_t v11 = *(int *)(v20 + 28);
      uint64_t v12 = (void *)((char *)a1 + v11);
      uint64_t v13 = (char *)a2 + v11;
      if (*((void *)v13 + 1))
      {
        uint64_t v14 = *(void **)v13;
        *uint64_t v12 = *(void *)v13;
        uint64_t v15 = (void *)*((void *)v13 + 1);
        v12[1] = v15;
        id v16 = v14;
        id v17 = v15;
      }
      else
      {
        *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
      }
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_1000BB2CC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void *sub_1000BB32C(void *a1, void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v6 = a2[1];
    *a1 = *a2;
    a1[1] = v6;
    uint64_t v7 = type metadata accessor for Item.Headline(0);
    uint64_t v8 = *(int *)(v7 + 24);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_1000CABE0();
    uint64_t v12 = *(void *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
    {
      uint64_t v13 = sub_10001D64C(&qword_10010F340);
      memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    *(_OWORD *)((char *)a1 + *(int *)(v7 + 28)) = *(_OWORD *)((char *)a2 + *(int *)(v7 + 28));
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_1000BB4AC(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1000BB2CC((uint64_t)a1, type metadata accessor for Item);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v6 = a2[1];
      *a1 = *a2;
      a1[1] = v6;
      uint64_t v7 = type metadata accessor for Item.Headline(0);
      uint64_t v8 = *(int *)(v7 + 24);
      uint64_t v9 = (char *)a1 + v8;
      uint64_t v10 = (char *)a2 + v8;
      uint64_t v11 = sub_1000CABE0();
      uint64_t v12 = *(void *)(v11 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
      {
        uint64_t v13 = sub_10001D64C(&qword_10010F340);
        memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
      }
      *(_OWORD *)((char *)a1 + *(int *)(v7 + 28)) = *(_OWORD *)((char *)a2 + *(int *)(v7 + 28));
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_1000BB650(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_1000BB678(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_1000BB6A4()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_1000BB6B4()
{
  uint64_t result = type metadata accessor for Item.Headline(319);
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

unint64_t sub_1000BB748()
{
  unint64_t result = qword_100112268;
  if (!qword_100112268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100112268);
  }
  return result;
}

unint64_t sub_1000BB7A0()
{
  unint64_t result = qword_100112270;
  if (!qword_100112270)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100112270);
  }
  return result;
}

unint64_t sub_1000BB7F8()
{
  unint64_t result = qword_100112278;
  if (!qword_100112278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100112278);
  }
  return result;
}

unint64_t sub_1000BB850()
{
  unint64_t result = qword_100112280;
  if (!qword_100112280)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100112280);
  }
  return result;
}

unint64_t sub_1000BB8A8()
{
  unint64_t result = qword_100112288;
  if (!qword_100112288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100112288);
  }
  return result;
}

unint64_t sub_1000BB900()
{
  unint64_t result = qword_100112290;
  if (!qword_100112290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100112290);
  }
  return result;
}

unint64_t sub_1000BB958()
{
  unint64_t result = qword_100112298;
  if (!qword_100112298)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100112298);
  }
  return result;
}

unint64_t sub_1000BB9B0()
{
  unint64_t result = qword_1001122A0;
  if (!qword_1001122A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001122A0);
  }
  return result;
}

uint64_t sub_1000BBA04(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701869940 && a2 == 0xE400000000000000;
  if (v2 || (sub_1000CCA30() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656E696C64616568 && a2 == 0xE800000000000000 || (sub_1000CCA30() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6567617373656DLL && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_1000CCA30();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

unint64_t sub_1000BBB4C()
{
  unint64_t result = qword_1001122A8;
  if (!qword_1001122A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001122A8);
  }
  return result;
}

uint64_t sub_1000BBBA0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x696C64616548746ELL && a2 == 0xEE0061746144656ELL;
  if (v2 || (sub_1000CCA30() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6F74536567616D69 && a2 == 0xEA00000000006572 || (sub_1000CCA30() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x72556E6F69746361 && a2 == 0xE90000000000006CLL || (sub_1000CCA30() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x64657A796C616E61 && a2 == 0xEE0073726F6C6F43)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_1000CCA30();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_1000BBDBC()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000BBDFC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000BBE0C()
{
  return swift_release();
}

ValueMetadata *type metadata accessor for BannerState()
{
  return &type metadata for BannerState;
}

uint64_t getEnumTagSinglePayload for Banner.Image(uint64_t *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for Banner.Image(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)unint64_t result = 0;
    *(_DWORD *)unint64_t result = a2 - 0x7FFFFFFF;
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
      *(void *)unint64_t result = a2;
    }
  }
  return result;
}

uint64_t sub_1000BBEC8(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_1000BBEE0(void *result, int a2)
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
  *unint64_t result = v2;
  return result;
}

ValueMetadata *type metadata accessor for Banner.Image()
{
  return &type metadata for Banner.Image;
}

uint64_t *sub_1000BBF10(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
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
    uint64_t v9 = a2[5];
    uint64_t v10 = a3[7];
    __dst = (char *)a1 + v10;
    uint64_t v11 = (char *)a2 + v10;
    a1[4] = a2[4];
    a1[5] = v9;
    uint64_t v12 = sub_1000CABE0();
    uint64_t v13 = *(void *)(v12 - 8);
    id v30 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v30(v11, 1, v12))
    {
      uint64_t v14 = sub_10001D64C(&qword_10010F340);
      memcpy(__dst, v11, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(__dst, v11, v12);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(__dst, 0, 1, v12);
    }
    uint64_t v16 = a3[8];
    uint64_t v17 = a3[9];
    id v18 = (uint64_t *)((char *)v4 + v16);
    id v19 = (uint64_t *)((char *)a2 + v16);
    uint64_t v20 = v19[1];
    *id v18 = *v19;
    v18[1] = v20;
    id v21 = *(void **)((char *)a2 + v17);
    swift_bridgeObjectRetain();
    if (v21 != (void *)1) {
      id v22 = v21;
    }
    *(uint64_t *)((char *)v4 + v17) = (uint64_t)v21;
    uint64_t v23 = a3[10];
    uint64_t v24 = (char *)v4 + v23;
    id v25 = (char *)a2 + v23;
    uint64_t v26 = *(void **)v25;
    uint64_t v27 = (void *)*((void *)v25 + 1);
    char v28 = v25[16];
    sub_10001DB84(*(void **)v25, v27);
    *(void *)uint64_t v24 = v26;
    *((void *)v24 + 1) = v27;
    v24[16] = v28;
  }
  return v4;
}

void sub_1000BC128(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[7];
  uint64_t v5 = sub_1000CABE0();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void **)(a1 + a2[9]);
  if (v7 != (void *)1) {

  }
  uint64_t v8 = a1 + a2[10];
  uint64_t v9 = *(void **)v8;
  uint64_t v10 = *(void **)(v8 + 8);

  sub_10001DE30(v9, v10);
}

void *sub_1000BC234(void *a1, void *a2, int *a3)
{
  uint64_t v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  uint64_t v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  uint64_t v7 = a2[5];
  uint64_t v8 = a3[7];
  __dst = (char *)a1 + v8;
  uint64_t v9 = (char *)a2 + v8;
  a1[4] = a2[4];
  a1[5] = v7;
  uint64_t v10 = sub_1000CABE0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v12(v9, 1, v10))
  {
    uint64_t v13 = sub_10001D64C(&qword_10010F340);
    memcpy(__dst, v9, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(__dst, v9, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(__dst, 0, 1, v10);
  }
  uint64_t v14 = a3[8];
  uint64_t v15 = a3[9];
  uint64_t v16 = (void *)((char *)a1 + v14);
  uint64_t v17 = (void *)((char *)a2 + v14);
  uint64_t v18 = v17[1];
  void *v16 = *v17;
  v16[1] = v18;
  id v19 = *(void **)((char *)a2 + v15);
  swift_bridgeObjectRetain();
  if (v19 != (void *)1) {
    id v20 = v19;
  }
  *(void *)((char *)a1 + v15) = v19;
  uint64_t v21 = a3[10];
  id v22 = (char *)a1 + v21;
  uint64_t v23 = (char *)a2 + v21;
  uint64_t v24 = *(void **)v23;
  id v25 = (void *)*((void *)v23 + 1);
  char v26 = v23[16];
  sub_10001DB84(*(void **)v23, v25);
  *(void *)id v22 = v24;
  *((void *)v22 + 1) = v25;
  v22[16] = v26;
  return a1;
}

void *sub_1000BC3F0(void *a1, void *a2, int *a3)
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
  uint64_t v6 = a3[7];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1000CABE0();
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
    uint64_t v14 = sub_10001D64C(&qword_10010F340);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  uint64_t v15 = a3[8];
  uint64_t v16 = (void *)((char *)a1 + v15);
  uint64_t v17 = (void *)((char *)a2 + v15);
  void *v16 = *v17;
  v16[1] = v17[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v18 = a3[9];
  id v19 = (void *)((char *)a1 + v18);
  id v20 = *(void **)((char *)a1 + v18);
  uint64_t v21 = *(void **)((char *)a2 + v18);
  if (v20 != (void *)1)
  {
    if (v21 != (void *)1)
    {
      void *v19 = v21;
      id v23 = v21;

      goto LABEL_14;
    }
    sub_10001EA8C((uint64_t)a1 + v18);
    uint64_t v21 = *(void **)((char *)a2 + v18);
    goto LABEL_12;
  }
  if (v21 == (void *)1)
  {
LABEL_12:
    void *v19 = v21;
    goto LABEL_14;
  }
  void *v19 = v21;
  id v22 = v21;
LABEL_14:
  uint64_t v24 = a3[10];
  id v25 = (char *)a1 + v24;
  char v26 = (char *)a2 + v24;
  uint64_t v27 = *(void **)v26;
  char v28 = (void *)*((void *)v26 + 1);
  char v29 = v26[16];
  sub_10001DB84(*(void **)v26, v28);
  id v30 = *(void **)v25;
  long long v31 = (void *)*((void *)v25 + 1);
  *(void *)id v25 = v27;
  *((void *)v25 + 1) = v28;
  v25[16] = v29;
  sub_10001DE30(v30, v31);
  return a1;
}

_OWORD *sub_1000BC688(_OWORD *a1, _OWORD *a2, int *a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  a1[2] = a2[2];
  uint64_t v7 = a3[7];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_1000CABE0();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = sub_10001D64C(&qword_10010F340);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v13 = a3[9];
  *(_OWORD *)((char *)a1 + a3[8]) = *(_OWORD *)((char *)a2 + a3[8]);
  *(void *)((char *)a1 + v13) = *(void *)((char *)a2 + v13);
  uint64_t v14 = a3[10];
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
  v15[16] = v16[16];
  return a1;
}

void *sub_1000BC7E4(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = a3[7];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_1000CABE0();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  int v15 = v14(v10, 1, v12);
  int v16 = v14(v11, 1, v12);
  if (v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v10, v11, v12);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v16)
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v10, v12);
LABEL_6:
    uint64_t v17 = sub_10001D64C(&qword_10010F340);
    memcpy(v10, v11, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 40))(v10, v11, v12);
LABEL_7:
  uint64_t v18 = a3[8];
  id v19 = (void *)((char *)a1 + v18);
  id v20 = (void *)((char *)a2 + v18);
  uint64_t v22 = *v20;
  uint64_t v21 = v20[1];
  void *v19 = v22;
  v19[1] = v21;
  swift_bridgeObjectRelease();
  uint64_t v23 = a3[9];
  uint64_t v24 = (void *)((char *)a1 + v23);
  id v25 = *(void **)((char *)a1 + v23);
  uint64_t v26 = *(void *)((char *)a2 + v23);
  if (v25 != (void *)1)
  {
    if (v26 != 1)
    {
      *uint64_t v24 = v26;

      goto LABEL_12;
    }
    sub_10001EA8C((uint64_t)a1 + v23);
    uint64_t v26 = *(void *)((char *)a2 + v23);
  }
  *uint64_t v24 = v26;
LABEL_12:
  uint64_t v27 = a3[10];
  char v28 = (char *)a1 + v27;
  char v29 = (char *)a2 + v27;
  char v30 = v29[16];
  long long v31 = *(void **)v28;
  char v32 = (void *)*((void *)v28 + 1);
  *(_OWORD *)char v28 = *(_OWORD *)v29;
  v28[16] = v30;
  sub_10001DE30(v31, v32);
  return a1;
}

uint64_t sub_1000BCA1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000BCA30);
}

uint64_t sub_1000BCA30(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_10001D64C(&qword_10010F340);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_1000BCAE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000BCAF8);
}

uint64_t sub_1000BCAF8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_10001D64C(&qword_10010F340);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for Banner()
{
  uint64_t result = qword_100112318;
  if (!qword_100112318) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1000BCBF0()
{
  sub_100043F5C();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_1000BCCA8(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v8 = sub_10001D64C(&qword_10010F340);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  uint64_t v11 = (char *)&v80 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = (char *)&v80 - v13;
  __chkstk_darwin(v12);
  int v16 = (char *)&v80 - v15;
  id v17 = [a1 identifier];
  uint64_t v18 = sub_1000CC1F0();
  uint64_t v20 = v19;

  *a4 = v18;
  a4[1] = v20;
  id v21 = [a1 title];
  uint64_t v22 = sub_1000CC1F0();
  uint64_t v24 = v23;

  a4[2] = v22;
  a4[3] = v24;
  id v25 = [a1 body];
  uint64_t v26 = sub_1000CC1F0();
  uint64_t v28 = v27;

  a4[4] = v26;
  a4[5] = v28;
  sub_1000226DC(a2, (uint64_t)v14);
  uint64_t v29 = sub_1000CABE0();
  uint64_t v30 = *(void *)(v29 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v14, 1, v29) == 1)
  {
    id v31 = [a1 actionURL];
    if (v31)
    {
      char v32 = v31;
      sub_1000CABA0();

      uint64_t v33 = 0;
    }
    else
    {
      uint64_t v33 = 1;
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v30 + 56))(v11, v33, 1, v29);
    sub_1000A4B90((uint64_t)v11, (uint64_t)v16);
    sub_10006E1FC((uint64_t)v14);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v30 + 32))(v16, v14, v29);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v30 + 56))(v16, 0, 1, v29);
  }
  id v34 = (int *)type metadata accessor for Banner();
  sub_1000A4B90((uint64_t)v16, (uint64_t)a4 + v34[7]);
  id v35 = [a1 actionButtonText];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = sub_1000CC1F0();
    uint64_t v39 = v38;
  }
  else
  {
    uint64_t v37 = 0;
    uint64_t v39 = 0;
  }
  uint64_t v40 = (uint64_t *)((char *)a4 + v34[8]);
  uint64_t *v40 = v37;
  v40[1] = v39;
  id v41 = [a1 imageMethod];
  if (v41 == (id)1)
  {
    *(uint64_t *)((char *)a4 + v34[9]) = 0;
    goto LABEL_16;
  }
  if (v41 == (id)2)
  {
    if (a3)
    {
      *(uint64_t *)((char *)a4 + v34[9]) = (uint64_t)a3;
      id v42 = a3;
      goto LABEL_16;
    }
    if (qword_10010DD68 == -1) {
      goto LABEL_37;
    }
    goto LABEL_59;
  }
  while (1)
  {
    *(uint64_t *)((char *)a4 + v34[9]) = 1;
LABEL_16:
    uint64_t v43 = (uint64_t)[a1 solidBackgroundColorPair];
    if (v43)
    {
      sub_100036814(0, &qword_100111A00);
      unint64_t v44 = sub_1000CC3B0();

      if (v44 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v43 = sub_1000CC890();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v43 = *(void *)((v44 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
    }
    id v45 = [a1 backgroundMethod];
    if (v45 == (id)2)
    {
      id v64 = [a1 gradientBackgroundPair];
      sub_100036814(0, &qword_1001123B8);
      unint64_t v65 = sub_1000CC3B0();

      if (v65 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v66 = sub_1000CC890();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v66 = *(void *)((v65 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      if (v66 > 1) {
        goto LABEL_43;
      }
LABEL_35:
      uint64_t v67 = self;
      id v68 = [v67 whiteColor];
      id v61 = [v67 blackColor];

      sub_10006E1FC(a2);
      char v62 = 0;
      uint64_t v63 = (char *)a4 + v34[10];
      *(void *)uint64_t v63 = v68;
      goto LABEL_50;
    }
    if (v45 != (id)1 || v43 < 2) {
      goto LABEL_35;
    }
    id v46 = [a1 solidBackgroundColorPair];
    if (!v46)
    {
      sub_100036814(0, (unint64_t *)&qword_100110C20);
      uint64_t v73 = (void *)sub_1000CC630();
      sub_1000CC510();
      goto LABEL_42;
    }
    uint64_t v47 = v46;
    sub_100036814(0, &qword_100111A00);
    uint64_t v48 = sub_1000CC3B0();

    if ((v48 & 0xC000000000000001) != 0) {
      goto LABEL_57;
    }
    if (*(void *)((v48 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      break;
    }
    __break(1u);
LABEL_59:
    swift_once();
LABEL_37:
    uint64_t v69 = sub_1000CB270();
    sub_10003B638(v69, (uint64_t)static Logger.todayWidgetBanner);
    uint64_t v70 = sub_1000CB250();
    os_log_type_t v71 = sub_1000CC510();
    if (os_log_type_enabled(v70, v71))
    {
      id v72 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v72 = 0;
      _os_log_impl((void *)&_mh_execute_header, v70, v71, "Image URL method indicated but no resolved image provided", v72, 2u);
      swift_slowDealloc();
    }
  }
  for (id i = *(id *)(v48 + 32); ; id i = (id)sub_1000CC780())
  {
    uint64_t v50 = i;
    swift_bridgeObjectRelease();
    id v51 = [v50 hex];

    sub_1000CC1F0();
    id v52 = [a1 solidBackgroundColorPair];
    if (v52)
    {
      uint64_t v53 = v52;
      uint64_t v54 = sub_1000CC3B0();

      if ((v54 & 0xC000000000000001) != 0)
      {
        id v55 = (id)sub_1000CC780();
      }
      else
      {
        if (*(void *)((v54 & 0xFFFFFFFFFFFFFF8) + 0x10) < 2uLL)
        {
          __break(1u);
          return;
        }
        id v55 = *(id *)(v54 + 40);
      }
      unint64_t v56 = v55;
      swift_bridgeObjectRelease();
      id v57 = [v56 hex];

      sub_1000CC1F0();
      NSString v58 = sub_1000CC1C0();
      swift_bridgeObjectRelease();
      id v59 = self;
      id v81 = [v59 colorWithHexString:v58];

      NSString v60 = sub_1000CC1C0();
      swift_bridgeObjectRelease();
      id v61 = [v59 colorWithHexString:v60];

      sub_10006E1FC(a2);
      char v62 = 0;
      uint64_t v63 = (char *)a4 + v34[10];
      *(void *)uint64_t v63 = v81;
      goto LABEL_50;
    }
    swift_bridgeObjectRelease();
    sub_100036814(0, (unint64_t *)&qword_100110C20);
    uint64_t v73 = (void *)sub_1000CC630();
    sub_1000CC510();
LABEL_42:
    sub_1000CB230();

LABEL_43:
    id v74 = [a1 gradientBackgroundPair];
    sub_100036814(0, &qword_1001123B8);
    uint64_t v75 = sub_1000CC3B0();

    if ((v75 & 0xC000000000000001) == 0) {
      break;
    }
    id v76 = (id)sub_1000CC780();
LABEL_46:
    id v74 = v76;
    swift_bridgeObjectRelease();
    id v77 = [a1 gradientBackgroundPair];
    uint64_t v78 = sub_1000CC3B0();

    if ((v78 & 0xC000000000000001) != 0) {
      goto LABEL_55;
    }
    if (*(void *)((v78 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 2uLL)
    {
      id v79 = *(id *)(v78 + 40);
      goto LABEL_49;
    }
    __break(1u);
LABEL_57:
    ;
  }
  if (*(void *)((v75 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v76 = *(id *)(v75 + 32);
    goto LABEL_46;
  }
  __break(1u);
LABEL_55:
  id v79 = (id)sub_1000CC780();
LABEL_49:
  id v61 = v79;
  swift_bridgeObjectRelease();

  sub_10006E1FC(a2);
  uint64_t v63 = (char *)a4 + v34[10];
  *(void *)uint64_t v63 = v74;
  char v62 = 1;
LABEL_50:
  *((void *)v63 + 1) = v61;
  v63[16] = v62;
}

uint64_t sub_1000BD610(void *a1)
{
  uint64_t v3 = sub_10001D64C(&qword_100112428);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100020110(a1, a1[3]);
  sub_1000C06F0();
  sub_1000CCB30();
  char v10 = 0;
  sub_1000CC9E0();
  if (!v1)
  {
    char v9 = 1;
    sub_1000CC9E0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_1000BD778(char a1)
{
  unint64_t result = 0x696669746E656469;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x656C746974;
      break;
    case 2:
      unint64_t result = 2036625250;
      break;
    case 3:
      unint64_t result = 0x52556E6F69746361;
      break;
    case 4:
      unint64_t result = 0xD000000000000010;
      break;
    case 5:
      unint64_t result = 0x6567616D69;
      break;
    case 6:
      unint64_t result = 0x756F72676B636162;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1000BD864()
{
  if (*v0) {
    return 0x664F7265626D756ELL;
  }
  else {
    return 0xD000000000000013;
  }
}

uint64_t sub_1000BD8AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1000BF618(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1000BD8D4(uint64_t a1)
{
  unint64_t v2 = sub_1000C06F0();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000BD910(uint64_t a1)
{
  unint64_t v2 = sub_1000C06F0();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000BD94C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_1000BF720(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

uint64_t sub_1000BD978(void *a1)
{
  return sub_1000BD610(a1);
}

unint64_t sub_1000BD994()
{
  return sub_1000BD778(*v0);
}

uint64_t sub_1000BD99C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1000BF8C4(a1, a2);
  *a3 = result;
  return result;
}

void sub_1000BD9C4(unsigned char *a1@<X8>)
{
  *a1 = 7;
}

uint64_t sub_1000BD9D0(uint64_t a1)
{
  unint64_t v2 = sub_1000BF2C4();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000BDA0C(uint64_t a1)
{
  unint64_t v2 = sub_1000BF2C4();

  return CodingKey.debugDescription.getter(a1, v2);
}

void sub_1000BDA48(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v27 = a2;
  uint64_t v3 = sub_10001D64C(&qword_10010F340);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10001D64C(&qword_100112368);
  uint64_t v28 = *(void *)(v6 - 8);
  uint64_t v29 = v6;
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v9 = (int *)type metadata accessor for Banner();
  __chkstk_darwin(v9);
  uint64_t v11 = (uint64_t *)((char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = a1[3];
  uint64_t v30 = a1;
  sub_100020110(a1, v12);
  sub_1000BF2C4();
  uint64_t v13 = v8;
  uint64_t v14 = v31;
  sub_1000CCB10();
  if (v14)
  {
    sub_1000201A8((uint64_t)v30);
  }
  else
  {
    uint64_t v15 = (uint64_t)v5;
    id v31 = v11;
    LOBYTE(v32) = 0;
    uint64_t v16 = v29;
    id v17 = v13;
    uint64_t v18 = sub_1000CC940();
    uint64_t v19 = v31;
    *id v31 = v18;
    v19[1] = v20;
    LOBYTE(v32) = 1;
    v19[2] = sub_1000CC940();
    v19[3] = v21;
    LOBYTE(v32) = 2;
    v19[4] = sub_1000CC940();
    v19[5] = v22;
    LOBYTE(v32) = 3;
    sub_1000BF4F0((unint64_t *)&qword_100110E80, &qword_10010F5C0);
    sub_1000CC980();
    sub_1000A4B90(v15, (uint64_t)v19 + v9[7]);
    sub_10001D64C(&qword_100111300);
    char v34 = 4;
    sub_100085B60(&qword_100110EA0);
    sub_1000CC980();
    *(_OWORD *)((char *)v19 + v9[8]) = v32;
    sub_10001D64C(&qword_100112378);
    char v34 = 5;
    sub_1000BF318(&qword_100112380, (void (*)(void))sub_1000BF388);
    sub_1000CC980();
    uint64_t v23 = v28;
    *(uint64_t *)((char *)v19 + v9[9]) = v32;
    char v34 = 6;
    sub_1000BF3DC();
    sub_1000CC980();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v17, v16);
    char v24 = v33;
    id v25 = (char *)v19 + v9[10];
    *(_OWORD *)id v25 = v32;
    v25[16] = v24;
    sub_1000BF430((uint64_t)v19, v27);
    sub_1000201A8((uint64_t)v30);
    sub_1000BF494((uint64_t)v19);
  }
}

uint64_t sub_1000BE004(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_10001D64C(&qword_100112398);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100020110(a1, a1[3]);
  sub_1000BF2C4();
  sub_1000CCB30();
  LOBYTE(v13) = 0;
  sub_1000CC9B0();
  if (!v2)
  {
    LOBYTE(v13) = 1;
    sub_1000CC9B0();
    LOBYTE(v13) = 2;
    sub_1000CC9B0();
    char v9 = (int *)type metadata accessor for Banner();
    LOBYTE(v13) = 3;
    sub_10001D64C(&qword_10010F340);
    sub_1000BF4F0((unint64_t *)&qword_10010F5F0, &qword_100110EE0);
    sub_1000CC9F0();
    long long v13 = *(_OWORD *)(v3 + v9[8]);
    char v15 = 4;
    sub_10001D64C(&qword_100111300);
    sub_100085B60((unint64_t *)&qword_100110EF0);
    sub_1000CC9F0();
    *(void *)&long long v13 = *(void *)(v3 + v9[9]);
    char v15 = 5;
    sub_10001D64C(&qword_100112378);
    sub_1000BF318(&qword_1001123A0, (void (*)(void))sub_1000BF570);
    sub_1000CC9F0();
    uint64_t v10 = (long long *)(v3 + v9[10]);
    char v11 = *((unsigned char *)v10 + 16);
    long long v13 = *v10;
    char v14 = v11;
    char v15 = 6;
    sub_1000BF5C4();
    sub_1000CC9F0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

void sub_1000BE360(void *a1@<X0>, uint64_t a2@<X8>)
{
}

uint64_t sub_1000BE378(void *a1)
{
  return sub_1000BE004(a1);
}

uint64_t sub_1000BE390(uint64_t a1)
{
  unint64_t v2 = sub_1000BFD9C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000BE3CC(uint64_t a1)
{
  unint64_t v2 = sub_1000BFD9C();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000BE408(char *a1, char *a2)
{
  return sub_10005BE10(*a1, *a2);
}

Swift::Int sub_1000BE414()
{
  return sub_1000CCAF0();
}

uint64_t sub_1000BE49C()
{
  sub_1000CC270();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000BE510()
{
  return sub_1000CCAF0();
}

uint64_t sub_1000BE594@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  return sub_1000BEC40(a1, (Swift::OpaquePointer)&off_1000FBFE0, a2);
}

void sub_1000BE5A0(uint64_t *a1@<X8>)
{
  uint64_t v2 = 0x536D75696D657270;
  if (*v1) {
    uint64_t v2 = 0x6567616D69;
  }
  unint64_t v3 = 0xEB000000006C6165;
  if (*v1) {
    unint64_t v3 = 0xE500000000000000;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_1000BE5E4()
{
  return sub_1000CC380();
}

uint64_t sub_1000BE644()
{
  return sub_1000CC370();
}

void sub_1000BE694(void *a1, void *a2)
{
  uint64_t v5 = sub_1000CACF0();
  uint64_t v20 = *(void *)(v5 - 8);
  uint64_t v21 = v5;
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10001D64C(&qword_1001123D8);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  char v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100020110(a1, a1[3]);
  sub_1000BFD9C();
  sub_1000CCB30();
  if (a2)
  {
    LOBYTE(v22) = 1;
    char v25 = 0;
    sub_1000BFE44();
    id v12 = a2;
    sub_1000CC9F0();
    if (v2)
    {
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);

      return;
    }
    unint64_t v22 = 0;
    unint64_t v23 = 0xE000000000000000;
    id v13 = v12;
    sub_1000CACE0();
    uint64_t v14 = sub_1000CACD0();
    unint64_t v16 = v15;
    (*(void (**)(char *, uint64_t))(v20 + 8))(v7, v21);
    swift_bridgeObjectRelease();
    unint64_t v22 = v14;
    unint64_t v23 = v16;
    v26._countAndFlagsBits = 1735290926;
    v26._object = (void *)0xE400000000000000;
    sub_1000CC2B0(v26);

    unint64_t v17 = v22;
    unint64_t v18 = v23;
    unint64_t v22 = (unint64_t)v13;
    unint64_t v23 = v17;
    unint64_t v24 = v18;
    char v25 = 1;
    sub_1000A186C();
    sub_1000CC9F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    LOBYTE(v22) = 0;
    char v25 = 0;
    sub_1000BFE44();
    sub_1000CC9F0();
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

void *sub_1000BE980@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_1000BFBA4(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

void sub_1000BE9AC(void *a1)
{
  sub_1000BE694(a1, *v1);
}

uint64_t sub_1000BE9C8()
{
  uint64_t v1 = 0x746144746867696CLL;
  if (*v0 != 1) {
    uint64_t v1 = 0x617461446B726164;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 1701869940;
  }
}

uint64_t sub_1000BEA20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1000BFE98(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1000BEA48(uint64_t a1)
{
  unint64_t v2 = sub_1000C05A0();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000BEA84(uint64_t a1)
{
  unint64_t v2 = sub_1000C05A0();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000BEAC0(char *a1, char *a2)
{
  return sub_10005BEBC(*a1, *a2);
}

Swift::Int sub_1000BEACC()
{
  return sub_1000CCAF0();
}

uint64_t sub_1000BEB4C()
{
  sub_1000CC270();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000BEBB8()
{
  return sub_1000CCAF0();
}

uint64_t sub_1000BEC34@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  return sub_1000BEC40(a1, (Swift::OpaquePointer)&off_1000FC030, a2);
}

uint64_t sub_1000BEC40@<X0>(uint64_t *a1@<X0>, Swift::OpaquePointer a2@<X3>, char *a3@<X8>)
{
  v9._countAndFlagsBits = *a1;
  uint64_t v4 = (void *)a1[1];
  v9._object = v4;
  Swift::Int v6 = sub_1000CC8F0(a2, v9);
  uint64_t result = swift_bridgeObjectRelease();
  if (v6 == 1) {
    char v8 = 1;
  }
  else {
    char v8 = 2;
  }
  if (!v6) {
    char v8 = 0;
  }
  *a3 = v8;
  return result;
}

void sub_1000BEC9C(uint64_t *a1@<X8>)
{
  uint64_t v2 = 0x64696C6F73;
  if (*v1) {
    uint64_t v2 = 0x746E656964617267;
  }
  unint64_t v3 = 0xE500000000000000;
  if (*v1) {
    unint64_t v3 = 0xE800000000000000;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_1000BECD8()
{
  return sub_1000CC380();
}

uint64_t sub_1000BED38()
{
  return sub_1000CC370();
}

void sub_1000BED88(void *a1, void *a2, void *a3, char a4)
{
  uint64_t v9 = sub_10001D64C(&qword_100112408);
  uint64_t v37 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  char v11 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100020110(a1, a1[3]);
  sub_1000C05A0();
  sub_1000CCB30();
  if ((a4 & 1) == 0)
  {
    *(_WORD *)uint64_t v38 = 0;
    sub_1000C069C();
    id v12 = a2;
    id v13 = a3;
    sub_1000CC9F0();
    if (!v4)
    {
      uint64_t v14 = self;
      *(void *)&v38[1] = 0;
      id v15 = [v14 archivedDataWithRootObject:v12 requiringSecureCoding:1 error:&v38[1]];
      id v16 = *(id *)&v38[1];
      if (v15)
      {
        id v36 = v14;
        uint64_t v17 = sub_1000CAC10();
        unint64_t v19 = v18;

        *(void *)&v38[1] = v17;
        unint64_t v39 = v19;
        v38[0] = 1;
        unint64_t v20 = sub_10004172C();
        sub_1000CC9F0();
        uint64_t v35 = v17;
        *(void *)&v38[1] = 0;
        id v27 = [v36 archivedDataWithRootObject:v13 requiringSecureCoding:1 error:&v38[1]];
        goto LABEL_11;
      }
LABEL_9:
      Swift::String v26 = v16;
      sub_1000CAB00();

      swift_willThrow();
LABEL_10:

      (*(void (**)(char *, uint64_t))(v37 + 8))(v11, v9);
      return;
    }
LABEL_6:
    (*(void (**)(char *, uint64_t))(v37 + 8))(v11, v9);

    return;
  }
  *(_WORD *)uint64_t v38 = 256;
  sub_1000C069C();
  id v12 = a2;
  id v13 = a3;
  sub_1000CC9F0();
  if (v4) {
    goto LABEL_6;
  }
  uint64_t v21 = self;
  *(void *)&v38[1] = 0;
  id v22 = [v21 archivedDataWithRootObject:v12 requiringSecureCoding:1 error:&v38[1]];
  id v16 = *(id *)&v38[1];
  if (!v22) {
    goto LABEL_9;
  }
  id v36 = v13;
  uint64_t v23 = sub_1000CAC10();
  unint64_t v19 = v24;

  *(void *)&v38[1] = v23;
  unint64_t v39 = v19;
  v38[0] = 1;
  unint64_t v25 = sub_10004172C();
  sub_1000CC9F0();
  unint64_t v34 = v25;
  uint64_t v35 = v23;
  *(void *)&v38[1] = 0;
  id v13 = v36;
  id v27 = [v21 archivedDataWithRootObject:v36 requiringSecureCoding:1 error:&v38[1] v34];
LABEL_11:
  id v28 = v27;
  id v29 = *(id *)&v38[1];
  if (!v28)
  {
    char v33 = v29;
    sub_1000CAB00();

    swift_willThrow();
    sub_100022684(v35, v19);
    goto LABEL_10;
  }
  uint64_t v30 = sub_1000CAC10();
  unint64_t v32 = v31;

  *(void *)&v38[1] = v30;
  unint64_t v39 = v32;
  v38[0] = 2;
  sub_1000CC9F0();
  (*(void (**)(char *, uint64_t))(v37 + 8))(v11, v9);

  sub_100022684(v35, v19);
  sub_100022684(v30, v32);
}

void *sub_1000BF270@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_1000BFFEC(a1);
  if (!v2)
  {
    *(void *)a2 = result;
    *(void *)(a2 + 8) = v5;
    *(unsigned char *)(a2 + 16) = v6 & 1;
  }
  return result;
}

void sub_1000BF2A4(void *a1)
{
  sub_1000BED88(a1, *(void **)v1, *(void **)(v1 + 8), *(unsigned char *)(v1 + 16));
}

unint64_t sub_1000BF2C4()
{
  unint64_t result = qword_100112370;
  if (!qword_100112370)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100112370);
  }
  return result;
}

uint64_t sub_1000BF318(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10001D690(&qword_100112378);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000BF388()
{
  unint64_t result = qword_100112388;
  if (!qword_100112388)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100112388);
  }
  return result;
}

unint64_t sub_1000BF3DC()
{
  unint64_t result = qword_100112390;
  if (!qword_100112390)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100112390);
  }
  return result;
}

uint64_t sub_1000BF430(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Banner();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000BF494(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Banner();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000BF4F0(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10001D690(&qword_10010F340);
    sub_10003E394(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000BF570()
{
  unint64_t result = qword_1001123A8;
  if (!qword_1001123A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001123A8);
  }
  return result;
}

unint64_t sub_1000BF5C4()
{
  unint64_t result = qword_1001123B0;
  if (!qword_1001123B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001123B0);
  }
  return result;
}

uint64_t sub_1000BF618(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000013 && a2 == 0x80000001000DD730 || (sub_1000CCA30() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x664F7265626D756ELL && a2 == 0xEC00000073706154)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = sub_1000CCA30();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1000BF720(void *a1)
{
  uint64_t v3 = sub_10001D64C(&qword_100112418);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  char v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = a1[3];
  sub_100020110(a1, v7);
  sub_1000C06F0();
  sub_1000CCB10();
  if (!v1)
  {
    v9[15] = 0;
    uint64_t v7 = sub_1000CC970();
    v9[14] = 1;
    sub_1000CC970();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
  }
  sub_1000201A8((uint64_t)a1);
  return v7;
}

uint64_t sub_1000BF8C4(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x696669746E656469 && a2 == 0xEA00000000007265 || (sub_1000CCA30() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656C746974 && a2 == 0xE500000000000000 || (sub_1000CCA30() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 2036625250 && a2 == 0xE400000000000000 || (sub_1000CCA30() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x52556E6F69746361 && a2 == 0xE90000000000004CLL || (sub_1000CCA30() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x80000001000DD710 || (sub_1000CCA30() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6567616D69 && a2 == 0xE500000000000000 || (sub_1000CCA30() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x756F72676B636162 && a2 == 0xEA0000000000646ELL)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else
  {
    char v5 = sub_1000CCA30();
    swift_bridgeObjectRelease();
    if (v5) {
      return 6;
    }
    else {
      return 7;
    }
  }
}

void *sub_1000BFBA4(void *a1)
{
  uint64_t v3 = sub_10001D64C(&qword_1001123C0);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  char v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100020110(a1, a1[3]);
  sub_1000BFD9C();
  sub_1000CCB10();
  if (!v1)
  {
    char v10 = 0;
    sub_1000BFDF0();
    sub_1000CC980();
    if (v9)
    {
      char v10 = 1;
      sub_1000A17C4();
      sub_1000CC980();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      uint64_t v7 = v9;
      swift_bridgeObjectRelease();
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      uint64_t v7 = 0;
    }
  }
  sub_1000201A8((uint64_t)a1);
  return v7;
}

unint64_t sub_1000BFD9C()
{
  unint64_t result = qword_1001123C8;
  if (!qword_1001123C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001123C8);
  }
  return result;
}

unint64_t sub_1000BFDF0()
{
  unint64_t result = qword_1001123D0;
  if (!qword_1001123D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001123D0);
  }
  return result;
}

unint64_t sub_1000BFE44()
{
  unint64_t result = qword_1001123E0;
  if (!qword_1001123E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001123E0);
  }
  return result;
}

uint64_t sub_1000BFE98(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701869940 && a2 == 0xE400000000000000;
  if (v2 || (sub_1000CCA30() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x746144746867696CLL && a2 == 0xE900000000000061 || (sub_1000CCA30() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x617461446B726164 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_1000CCA30();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

void *sub_1000BFFEC(void *a1)
{
  uint64_t v3 = sub_10001D64C(&qword_1001123E8);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  char v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (void *)a1[3];
  sub_100020110(a1, (uint64_t)v7);
  sub_1000C05A0();
  sub_1000CCB10();
  if (v1) {
    goto LABEL_4;
  }
  char v33 = 0;
  sub_1000C05F4();
  sub_1000CC980();
  if (v31)
  {
    char v33 = 1;
    unint64_t v9 = sub_100041420();
    sub_1000CC980();
    unint64_t v28 = v9;
    unint64_t v10 = v32;
    uint64_t v30 = v31;
    uint64_t v11 = sub_100036814(0, (unint64_t *)&unk_1001112C0);
    sub_100036814(0, &qword_1001123B8);
    unint64_t v29 = v10;
    uint64_t v27 = v11;
    uint64_t v7 = (void *)sub_1000CC540();
    if (v7)
    {
      char v33 = 2;
      sub_1000CC980();
      unint64_t v12 = v32;
      unint64_t v28 = v31;
      uint64_t v13 = sub_1000CC540();
      uint64_t v27 = v12;
      if (v13)
      {
        (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
        sub_100022684(v30, v29);
        unint64_t v22 = v27;
        uint64_t v21 = v28;
LABEL_18:
        sub_100022684(v21, v22);
        sub_1000201A8((uint64_t)a1);
        return v7;
      }
      sub_1000C0648();
      swift_allocError();
      *uint64_t v23 = 1;
      swift_willThrow();
      sub_100022684(v30, v29);
      unint64_t v25 = v27;
      uint64_t v24 = v28;
LABEL_21:
      sub_100022684(v24, v25);

      goto LABEL_3;
    }
    sub_1000C0648();
    swift_allocError();
    *uint64_t v17 = 1;
  }
  else
  {
    char v33 = 1;
    unint64_t v14 = sub_100041420();
    sub_1000CC980();
    unint64_t v28 = v14;
    unint64_t v15 = v32;
    uint64_t v30 = v31;
    uint64_t v16 = sub_100036814(0, (unint64_t *)&unk_1001112C0);
    sub_100036814(0, &qword_100111A00);
    unint64_t v29 = v15;
    uint64_t v27 = v16;
    uint64_t v7 = (void *)sub_1000CC540();
    if (v7)
    {
      char v33 = 2;
      sub_1000CC980();
      uint64_t v19 = v31;
      unint64_t v28 = v32;
      uint64_t v20 = sub_1000CC540();
      uint64_t v27 = v19;
      if (v20)
      {
        (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
        sub_100022684(v30, v29);
        uint64_t v21 = v27;
        unint64_t v22 = v28;
        goto LABEL_18;
      }
      sub_1000C0648();
      swift_allocError();
      *Swift::String v26 = 0;
      swift_willThrow();
      sub_100022684(v30, v29);
      uint64_t v24 = v27;
      unint64_t v25 = v28;
      goto LABEL_21;
    }
    sub_1000C0648();
    swift_allocError();
    *unint64_t v18 = 0;
  }
  swift_willThrow();
  sub_100022684(v30, v29);
LABEL_3:
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
LABEL_4:
  sub_1000201A8((uint64_t)a1);
  return v7;
}

unint64_t sub_1000C05A0()
{
  unint64_t result = qword_1001123F0;
  if (!qword_1001123F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001123F0);
  }
  return result;
}

unint64_t sub_1000C05F4()
{
  unint64_t result = qword_1001123F8;
  if (!qword_1001123F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001123F8);
  }
  return result;
}

unint64_t sub_1000C0648()
{
  unint64_t result = qword_100112400;
  if (!qword_100112400)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100112400);
  }
  return result;
}

unint64_t sub_1000C069C()
{
  unint64_t result = qword_100112410;
  if (!qword_100112410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100112410);
  }
  return result;
}

unint64_t sub_1000C06F0()
{
  unint64_t result = qword_100112420;
  if (!qword_100112420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100112420);
  }
  return result;
}

ValueMetadata *type metadata accessor for BannerState.CodingKeys()
{
  return &type metadata for BannerState.CodingKeys;
}

ValueMetadata *type metadata accessor for Banner.Background.Errors()
{
  return &type metadata for Banner.Background.Errors;
}

ValueMetadata *type metadata accessor for Banner.Background.CodingType()
{
  return &type metadata for Banner.Background.CodingType;
}

unsigned char *storeEnumTagSinglePayload for Banner.Background.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000C0844);
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

ValueMetadata *type metadata accessor for Banner.Background.CodingKeys()
{
  return &type metadata for Banner.Background.CodingKeys;
}

ValueMetadata *type metadata accessor for Banner.Image.CodingType()
{
  return &type metadata for Banner.Image.CodingType;
}

unsigned char *_s7NewsTag11BannerStateV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000C0958);
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

ValueMetadata *type metadata accessor for Banner.Image.CodingKeys()
{
  return &type metadata for Banner.Image.CodingKeys;
}

uint64_t getEnumTagSinglePayload for Banner.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
  if (a2 + 6 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 6) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 6;
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
      return (*a1 | (v4 << 8)) - 6;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for Banner.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *unint64_t result = a2 + 6;
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
        JUMPOUT(0x1000C0AECLL);
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
          *unint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Banner.CodingKeys()
{
  return &type metadata for Banner.CodingKeys;
}

void destroy for Banner.Background(void **a1)
{
}

uint64_t _s7NewsTag6BannerV10BackgroundOwCP_0(uint64_t a1, uint64_t a2)
{
  int v3 = *(void **)a2;
  unsigned int v4 = *(void **)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_10001DB84(*(void **)a2, v4);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for Banner.Background(uint64_t a1, uint64_t a2)
{
  int v3 = *(void **)a2;
  unsigned int v4 = *(void **)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_10001DB84(*(void **)a2, v4);
  unsigned int v6 = *(void **)a1;
  BOOL v7 = *(void **)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_10001DE30(v6, v7);
  return a1;
}

uint64_t assignWithTake for Banner.Background(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  unsigned int v4 = *(void **)a1;
  char v5 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_10001DE30(v4, v5);
  return a1;
}

ValueMetadata *type metadata accessor for Banner.Background()
{
  return &type metadata for Banner.Background;
}

unint64_t sub_1000C0C38()
{
  unint64_t result = qword_100112430;
  if (!qword_100112430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100112430);
  }
  return result;
}

unint64_t sub_1000C0C90()
{
  unint64_t result = qword_100112438;
  if (!qword_100112438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100112438);
  }
  return result;
}

unint64_t sub_1000C0CE8()
{
  unint64_t result = qword_100112440;
  if (!qword_100112440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100112440);
  }
  return result;
}

unint64_t sub_1000C0D40()
{
  unint64_t result = qword_100112448;
  if (!qword_100112448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100112448);
  }
  return result;
}

unint64_t sub_1000C0D98()
{
  unint64_t result = qword_100112450;
  if (!qword_100112450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100112450);
  }
  return result;
}

unint64_t sub_1000C0DF0()
{
  unint64_t result = qword_100112458;
  if (!qword_100112458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100112458);
  }
  return result;
}

unint64_t sub_1000C0E48()
{
  unint64_t result = qword_100112460;
  if (!qword_100112460)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100112460);
  }
  return result;
}

unint64_t sub_1000C0EA0()
{
  unint64_t result = qword_100112468;
  if (!qword_100112468)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100112468);
  }
  return result;
}

unint64_t sub_1000C0EF8()
{
  unint64_t result = qword_100112470;
  if (!qword_100112470)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100112470);
  }
  return result;
}

unint64_t sub_1000C0F50()
{
  unint64_t result = qword_100112478;
  if (!qword_100112478)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100112478);
  }
  return result;
}

unint64_t sub_1000C0FA8()
{
  unint64_t result = qword_100112480;
  if (!qword_100112480)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100112480);
  }
  return result;
}

unint64_t sub_1000C1000()
{
  unint64_t result = qword_100112488;
  if (!qword_100112488)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100112488);
  }
  return result;
}

unint64_t sub_1000C1058()
{
  unint64_t result = qword_100112490;
  if (!qword_100112490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100112490);
  }
  return result;
}

unint64_t sub_1000C10B0()
{
  unint64_t result = qword_100112498;
  if (!qword_100112498)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100112498);
  }
  return result;
}

unint64_t sub_1000C1108()
{
  unint64_t result = qword_1001124A0;
  if (!qword_1001124A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001124A0);
  }
  return result;
}

unint64_t sub_1000C115C()
{
  unint64_t result = qword_1001124A8;
  if (!qword_1001124A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001124A8);
  }
  return result;
}

unint64_t sub_1000C11B0()
{
  unint64_t result = qword_1001124B0;
  if (!qword_1001124B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001124B0);
  }
  return result;
}

void *sub_1000C1204@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  sub_100020110(a1, a1[3]);
  sub_10001D64C(&qword_100112610);
  unint64_t result = (void *)sub_1000CAEC0();
  if (!v22)
  {
    __break(1u);
    goto LABEL_9;
  }
  sub_100020110(a1, a1[3]);
  sub_100036814(0, &qword_100112600);
  unint64_t result = (void *)sub_1000CAEB0();
  if (!result)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v5 = (uint64_t)result;
  sub_100020110(a1, a1[3]);
  sub_10001D64C(&qword_1001125E8);
  unint64_t result = (void *)sub_1000CAEB0();
  if (!result)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v6 = (uint64_t)result;
  sub_100020110(a1, a1[3]);
  sub_100036814(0, (unint64_t *)&unk_100112630);
  unint64_t result = (void *)sub_1000CAEB0();
  if (!result)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v7 = (uint64_t)result;
  sub_100020110(a1, a1[3]);
  sub_10001D64C(&qword_100112620);
  unint64_t result = (void *)sub_1000CAEC0();
  if (!v20)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  sub_100020110(a1, a1[3]);
  sub_100036814(0, &qword_1001125F0);
  unint64_t result = (void *)sub_1000CAE90();
  if (result)
  {
    int v8 = result;
    id v9 = [result nonVideoContentEventTracker];

    uint64_t v10 = sub_10003A9EC((uint64_t)v21, v22);
    __chkstk_darwin(v10);
    unint64_t v12 = (uint64_t *)&v19[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
    (*(void (**)(uint64_t *))(v13 + 16))(v12);
    uint64_t v14 = sub_10003A9EC((uint64_t)v19, v20);
    __chkstk_darwin(v14);
    uint64_t v16 = (uint64_t *)&v19[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
    (*(void (**)(uint64_t *))(v17 + 16))(v16);
    unint64_t v18 = sub_1000C2D90(*v12, v5, v6, v7, *v16, (uint64_t)v9);
    sub_1000201A8((uint64_t)v19);
    sub_1000201A8((uint64_t)v21);
    unint64_t result = (void *)type metadata accessor for ContentService();
    a2[3] = result;
    a2[4] = &off_1000FE228;
    *a2 = v18;
    return result;
  }
LABEL_13:
  __break(1u);
  return result;
}

uint64_t sub_1000C159C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  sub_100020110(a1, a1[3]);
  sub_10001D64C(&qword_100112558);
  uint64_t result = sub_1000CAEC0();
  if (v19)
  {
    uint64_t v4 = sub_10003A9EC((uint64_t)v18, v19);
    __chkstk_darwin(v4);
    uint64_t v6 = (void *)((char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v7 + 16))(v6);
    uint64_t v8 = *v6;
    uint64_t v9 = type metadata accessor for ContentService();
    v17[3] = v9;
    v17[4] = &off_1000FE228;
    v17[0] = v8;
    uint64_t v10 = type metadata accessor for EntryService();
    uint64_t v11 = (void *)swift_allocObject();
    uint64_t v12 = sub_10003A9EC((uint64_t)v17, v9);
    __chkstk_darwin(v12);
    uint64_t v14 = (void *)((char *)v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v15 + 16))(v14);
    uint64_t v16 = *v14;
    v11[5] = v9;
    v11[6] = &off_1000FE228;
    void v11[2] = v16;
    sub_1000201A8((uint64_t)v17);
    uint64_t result = sub_1000201A8((uint64_t)v18);
    a2[3] = v10;
    a2[4] = &off_1000FD3F8;
    *a2 = v11;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1000C17B8(void *a1)
{
  sub_100020110(a1, a1[3]);
  type metadata accessor for FeedPersonalizerFactory();
  uint64_t result = sub_1000CAEB0();
  if (!result) {
    __break(1u);
  }
  return result;
}

id sub_1000C180C()
{
  id v0 = [self widgetEventTrackerWithMaxRowCount:10];

  return v0;
}

id sub_1000C1858()
{
  id v0 = objc_allocWithZone((Class)FTNewsAnalyticsUserIDWidgetEventTracker);

  return [v0 init];
}

uint64_t sub_1000C1890(void *a1)
{
  sub_10001D64C(&qword_100111C70);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1000D7010;
  sub_100020110(a1, a1[3]);
  sub_100036814(0, &qword_1001125F8);
  uint64_t result = sub_1000CAEB0();
  if (result)
  {
    *(void *)(v2 + 32) = result;
    sub_1000CC3D0();
    id v4 = objc_allocWithZone((Class)FTAggregateWidgetEventTracker);
    sub_10001D64C((uint64_t *)&unk_10010EF80);
    Class isa = sub_1000CC3A0().super.isa;
    swift_bridgeObjectRelease();
    id v6 = [v4 initWithEventTrackers:isa];

    return (uint64_t)v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1000C1994(void *a1)
{
  return sub_1000C19A8(a1, (unint64_t *)&unk_10010EF70);
}

uint64_t sub_1000C19A8(void *a1, unint64_t *a2)
{
  sub_100020110(a1, a1[3]);
  sub_100036814(0, a2);
  uint64_t result = sub_1000CAEB0();
  if (!result) {
    __break(1u);
  }
  return result;
}

uint64_t sub_1000C1A18@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  sub_100020110(a1, a1[3]);
  sub_10001D64C(&qword_100112620);
  uint64_t result = sub_1000CAEC0();
  if (v19)
  {
    uint64_t v4 = sub_10003A9EC((uint64_t)v18, v19);
    __chkstk_darwin(v4);
    id v6 = (void *)((char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v7 + 16))(v6);
    uint64_t v8 = *v6;
    uint64_t v9 = type metadata accessor for WidgetAssetStore();
    v17[3] = v9;
    v17[4] = &off_1000FC5F8;
    v17[0] = v8;
    uint64_t v10 = type metadata accessor for EntryStore();
    uint64_t v11 = (void *)swift_allocObject();
    uint64_t v12 = sub_10003A9EC((uint64_t)v17, v9);
    __chkstk_darwin(v12);
    uint64_t v14 = (void *)((char *)v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v15 + 16))(v14);
    uint64_t v16 = *v14;
    v11[5] = v9;
    v11[6] = &off_1000FC5F8;
    void v11[2] = v16;
    v11[7] = 0x7972746E65;
    v11[8] = 0xE500000000000000;
    sub_1000201A8((uint64_t)v17);
    uint64_t result = sub_1000201A8((uint64_t)v18);
    a2[3] = v10;
    a2[4] = &off_1000FC3B0;
    *a2 = v11;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_1000C1C48(void *a1)
{
  sub_100020110(a1, a1[3]);
  sub_10001D64C(&qword_1001125D0);
  id result = (id)sub_1000CAEC0();
  if (v9 == 1)
  {
    __break(1u);
  }
  else
  {
    sub_100020110(a1, a1[3]);
    type metadata accessor for FCFeedPersonalizationConfigurationSet(0);
    id result = (id)sub_1000CAEC0();
    if ((v8 & 1) == 0)
    {
      uint64_t v3 = v7;
      uint64_t v4 = (objc_class *)type metadata accessor for FeedPersonalizerFactory();
      uint64_t v5 = (char *)objc_allocWithZone(v4);
      *(void *)&v5[OBJC_IVAR____TtC7NewsTag23FeedPersonalizerFactory_translationProvider] = v9;
      *(void *)&v5[OBJC_IVAR____TtC7NewsTag23FeedPersonalizerFactory_configurationSet] = v3;
      v6.receiver = v5;
      v6.super_class = v4;
      return [super init];
    }
  }
  __break(1u);
  return result;
}

void *sub_1000C1D3C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  sub_100020110(a1, a1[3]);
  sub_10001D64C(&qword_1001125D8);
  id result = (void *)sub_1000CAEB0();
  if (result)
  {
    id v4 = [result possiblyUnfetchedTranslationProvider];
    id result = (void *)swift_unknownObjectRelease();
    *a2 = v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1000C1DC0(void *a1)
{
  return sub_1000C19A8(a1, &qword_1001125E0);
}

uint64_t sub_1000C1DD4(void *a1)
{
  return sub_1000C1E40(a1, (uint64_t *)&unk_10010EEC0, (Class *)FCTranslationManager_ptr, (SEL *)&selRef_initWithContentContext_);
}

uint64_t sub_1000C1DF0()
{
  type metadata accessor for ImageJoeColorAnalyzer();

  return swift_allocObject();
}

uint64_t sub_1000C1E24(void *a1)
{
  return sub_1000C1E40(a1, (uint64_t *)&unk_10010F110, (Class *)off_1000FA078, (SEL *)&selRef_initWithUserIDProvider_);
}

uint64_t sub_1000C1E40(void *a1, uint64_t *a2, Class *a3, SEL *a4)
{
  sub_100020110(a1, a1[3]);
  sub_10001D64C(a2);
  uint64_t result = sub_1000CAEB0();
  if (result)
  {
    id v8 = [objc_allocWithZone(*a3) *a4 result];
    swift_unknownObjectRelease();
    return (uint64_t)v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1000C1ED4(void *a1)
{
  uint64_t v2 = sub_1000CABE0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10001D64C(&qword_10010F340);
  __chkstk_darwin(v6 - 8);
  id v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100020110(a1, a1[3]);
  sub_10001D64C(&qword_100112608);
  uint64_t v9 = sub_1000CAEB0();
  if (!v9)
  {
    __break(1u);
    goto LABEL_6;
  }
  uint64_t v10 = v9;
  id v11 = (id)FCURLForContainerizedUserAccountDocumentDirectory();
  if (!v11)
  {
LABEL_6:
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v8, 1, 1, v2);
    goto LABEL_7;
  }
  uint64_t v12 = v11;
  sub_1000CABA0();

  (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v8, v5, v2);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v3 + 56))(v8, 0, 1, v2);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2);
  if (result != 1)
  {
    id v14 = objc_allocWithZone((Class)FTSeenHeadlineWidgetEventTracker);
    sub_1000CAB60(v15);
    uint64_t v17 = v16;
    id v18 = [v14 initWithTodayEventTracker:v10 documentsDirectory:v16];
    swift_unknownObjectRelease();

    (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
    return (uint64_t)v18;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_1000C2120(void *a1)
{
  sub_100020110(a1, a1[3]);
  sub_100036814(0, &qword_100112618);
  uint64_t result = sub_1000CAEB0();
  if (result)
  {
    uint64_t v2 = (void *)result;
    id v3 = [objc_allocWithZone((Class)FTEngagementURLProvider) initWithAvailabilityMonitor:result];

    return (uint64_t)v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1000C21B0(void *a1)
{
  return sub_1000C19A8(a1, &qword_100112640);
}

uint64_t sub_1000C21C4(void *a1, void *a2)
{
  sub_100020110(a2, a2[3]);
  sub_10001D64C((uint64_t *)&unk_10010EED0);
  uint64_t result = sub_1000CAEB0();
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = sub_100020110(a1, a1[3]);
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    uint64_t v7 = *v5;
    uint64_t v8 = *(void *)(*v5 + 16);
    *(void *)(v7 + 16) = sub_1000C3E24;
    *(void *)(v7 + 24) = v6;
    return sub_1000AB9E4(v8);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_1000C2280(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, double a5)
{
  if (a3) {
    uint64_t v9 = sub_1000CAAF0();
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = (id)v9;
  [a4 widgetPerformedUpdateWithTodayResults:a1 fetchInfo:a2 error:a5 updateFetchDuration:];
}

void sub_1000C2310(void *a1)
{
  v3[4] = TodayIntentResponseCode.rawValue.getter;
  v3[5] = 0;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 1107296256;
  v3[2] = sub_1000C23B8;
  v3[3] = &unk_1000FF0A8;
  uint64_t v2 = _Block_copy(v3);
  [a1 fetchTranslationProvider:v2];
  _Block_release(v2);
}

uint64_t sub_1000C23B8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  swift_unknownObjectRetain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();

  return swift_unknownObjectRelease();
}

id sub_1000C2438()
{
  id v0 = objc_allocWithZone((Class)FCNewsAvailabilityMonitor);

  return [v0 initWithProcessVariant:0];
}

uint64_t sub_1000C2474@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = sub_1000CABE0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10001D64C(&qword_10010F340);
  __chkstk_darwin(v8 - 8);
  id v10 = (char *)v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100020110(a1, a1[3]);
  sub_10001D64C(&qword_100112628);
  sub_1000CAEC0();
  if (!v31)
  {
    __break(1u);
    goto LABEL_6;
  }
  id v11 = [self mainBundle];
  id v12 = [v11 bundleIdentifier];

  id v13 = (id)FCURLForWidgetReferralItems();
  if (!v13)
  {
LABEL_6:
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v10, 1, 1, v4);
    goto LABEL_7;
  }
  sub_1000CABA0();

  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v10, v7, v4);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v10, 0, 1, v4);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4);
  if (result != 1)
  {
    uint64_t v15 = sub_10003A9EC((uint64_t)v30, v31);
    __chkstk_darwin(v15);
    uint64_t v17 = (void *)((char *)v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v18 + 16))(v17);
    uint64_t v19 = *v17;
    uint64_t v28 = sub_1000CBFB0();
    unint64_t v29 = &off_1000FDAC8;
    v27[0] = v19;
    uint64_t v20 = (objc_class *)type metadata accessor for WidgetAssetStore();
    uint64_t v21 = (char *)objc_allocWithZone(v20);
    uint64_t v22 = sub_10003A9EC((uint64_t)v27, v28);
    __chkstk_darwin(v22);
    uint64_t v24 = (void *)((char *)v27 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v25 + 16))(v24);
    id v26 = sub_1000C28F4(*v24, (uint64_t)v10, v21);
    sub_1000201A8((uint64_t)v27);
    uint64_t result = sub_1000201A8((uint64_t)v30);
    a2[3] = v20;
    a2[4] = &off_1000FC5F8;
    *a2 = v26;
    return result;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_1000C2854@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_1000CBFB0();
  uint64_t result = sub_1000CBFA0();
  a1[3] = v2;
  a1[4] = (uint64_t)&off_1000FDAC8;
  *a1 = result;
  return result;
}

id sub_1000C2894()
{
  id v0 = objc_allocWithZone((Class)FTContentPrefetchManager);

  return [v0 init];
}

uint64_t type metadata accessor for WidgetServiceAssembly()
{
  return self;
}

id sub_1000C28F4(uint64_t a1, uint64_t a2, char *a3)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = sub_1000CAE30();
  __chkstk_darwin(v6 - 8);
  v44[3] = sub_1000CBFB0();
  v44[4] = &off_1000FDAC8;
  v44[0] = a1;
  *(void *)&a3[OBJC_IVAR____TtC7NewsTag16WidgetAssetStore____lazy_storage___pruneThrottler] = 0;
  uint64_t v7 = OBJC_IVAR____TtC7NewsTag16WidgetAssetStore_lock;
  uint64_t v8 = a3;
  sub_1000CAE20();
  sub_1000CAE50();
  swift_allocObject();
  *(void *)&a3[v7] = sub_1000CAE40();
  sub_10003AA3C((uint64_t)v44, (uint64_t)&v8[OBJC_IVAR____TtC7NewsTag16WidgetAssetStore_infoService]);
  uint64_t v9 = &v8[OBJC_IVAR____TtC7NewsTag16WidgetAssetStore_directoryUrl];
  uint64_t v10 = sub_1000CABE0();
  uint64_t v40 = *(void *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v40 + 16))(v9, a2, v10);
  id v11 = [self defaultManager];
  sub_1000CAB60(v12);
  id v14 = v13;
  v43[0] = 0;
  unsigned int v15 = [v11 createDirectoryAtURL:v13 withIntermediateDirectories:1 attributes:0 error:v43];

  if (v15)
  {
    id v16 = v43[0];
  }
  else
  {
    id v17 = v43[0];
    sub_1000CAB00();

    swift_willThrow();
    uint64_t v18 = (void *)sub_1000CAAF0();
    id v19 = [v18 code];

    if (v19 == (id)516)
    {
      swift_errorRelease();
    }
    else
    {
      id v20 = PrefetchLog();
      sub_1000CC510();
      sub_10001D64C((uint64_t *)&unk_10010E840);
      uint64_t v21 = swift_allocObject();
      *(_OWORD *)(v21 + 16) = xmmword_1000D37C0;
      sub_1000C3D7C();
      uint64_t v22 = sub_1000CCA20();
      uint64_t v24 = v23;
      *(void *)(v21 + 56) = &type metadata for String;
      *(void *)(v21 + 64) = sub_1000225F0();
      *(void *)(v21 + 32) = v22;
      *(void *)(v21 + 40) = v24;
      sub_1000CB230();
      swift_errorRelease();

      swift_bridgeObjectRelease();
    }
  }
  uint64_t v25 = sub_100023750();
  uint64_t v26 = sub_100028B70((uint64_t)v25);
  swift_bridgeObjectRelease();
  uint64_t v27 = a2;
  *(void *)&v8[OBJC_IVAR____TtC7NewsTag16WidgetAssetStore_keysOfInterest] = v26;
  id v28 = PrefetchLog();
  sub_1000CC500();
  sub_10001D64C((uint64_t *)&unk_10010E840);
  uint64_t v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = xmmword_1000D34A0;
  sub_1000C3D7C();
  uint64_t v30 = sub_1000CCA20();
  uint64_t v31 = v10;
  uint64_t v33 = v32;
  *(void *)(v29 + 56) = &type metadata for String;
  unint64_t v34 = sub_1000225F0();
  *(void *)(v29 + 64) = v34;
  *(void *)(v29 + 32) = v30;
  *(void *)(v29 + 40) = v33;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  uint64_t v35 = sub_1000CC4C0();
  uint64_t v37 = v36;
  swift_bridgeObjectRelease();

  *(void *)(v29 + 96) = &type metadata for String;
  *(void *)(v29 + 104) = v34;
  *(void *)(v29 + 72) = v35;
  *(void *)(v29 + 80) = v37;
  sub_1000CB230();

  swift_bridgeObjectRelease();
  v42.receiver = v8;
  v42.super_class = ObjectType;
  id v38 = [super init];
  (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v27, v31);
  sub_1000201A8((uint64_t)v44);
  return v38;
}

void *sub_1000C2D90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = type metadata accessor for NTTodayContextResultsService();
  v29[3] = v12;
  v29[4] = &off_1000FE668;
  v29[0] = a1;
  uint64_t v13 = type metadata accessor for WidgetAssetStore();
  uint64_t v27 = v13;
  id v28 = &off_1000FC5F8;
  v26[0] = a5;
  type metadata accessor for ContentService();
  id v14 = (void *)swift_allocObject();
  uint64_t v15 = sub_10003A9EC((uint64_t)v29, v12);
  __chkstk_darwin(v15);
  id v17 = (void *)((char *)v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v18 + 16))(v17);
  uint64_t v19 = sub_10003A9EC((uint64_t)v26, v27);
  __chkstk_darwin(v19);
  uint64_t v21 = (void *)((char *)v26 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v22 + 16))(v21);
  uint64_t v23 = *v17;
  uint64_t v24 = *v21;
  v14[7] = v12;
  v14[8] = &off_1000FE668;
  v14[4] = v23;
  v14[15] = v13;
  v14[16] = &off_1000FC5F8;
  v14[17] = a6;
  v14[2] = 0;
  v14[3] = 0;
  v14[9] = a2;
  v14[10] = a3;
  v14[11] = a4;
  v14[12] = v24;
  sub_1000201A8((uint64_t)v26);
  sub_1000201A8((uint64_t)v29);
  return v14;
}

uint64_t sub_1000C2FB4(uint64_t a1)
{
  uint64_t v39 = sub_1000CAEE0();
  uint64_t v41 = *(void *)(v39 - 8);
  __chkstk_darwin(v39);
  id v38 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1000CB000();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000CAF10();
  sub_10001D64C(&qword_100112558);
  sub_1000CAF90();
  swift_release();
  swift_release();
  sub_1000CAF10();
  sub_10001D64C((uint64_t *)&unk_100112560);
  sub_1000CAF90();
  swift_release();
  uint64_t v7 = enum case for Scope.singleton(_:);
  uint64_t v8 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 104);
  unsigned int v40 = enum case for Scope.singleton(_:);
  v8(v6, enum case for Scope.singleton(_:), v3);
  sub_1000CAE10();
  swift_release();
  swift_release();
  uint64_t v9 = *(void (**)(char *, uint64_t))(v4 + 8);
  v9(v6, v3);
  objc_super v42 = v9;
  sub_1000CAF10();
  sub_10001D64C(&qword_10010EFB8);
  sub_1000CAF80();
  swift_release();
  v8(v6, v7, v3);
  sub_1000CAE10();
  swift_release();
  swift_release();
  uint64_t v10 = v3;
  v9(v6, v3);
  sub_1000CAF10();
  sub_10001D64C((uint64_t *)&unk_10010F180);
  sub_1000CAF80();
  swift_release();
  swift_release();
  sub_1000CAF10();
  sub_100036814(0, (unint64_t *)&unk_10010EF70);
  sub_1000CAF80();
  swift_release();
  uint64_t v11 = v40;
  v8(v6, v40, v10);
  sub_1000CAE10();
  swift_release();
  swift_release();
  uint64_t v12 = v42;
  v42(v6, v10);
  sub_1000CAF10();
  sub_1000CAF80();
  swift_release();
  swift_release();
  sub_1000CAF10();
  sub_10001D64C((uint64_t *)&unk_10010F110);
  sub_1000CAF80();
  swift_release();
  v8(v6, v11, v10);
  sub_1000CAE10();
  swift_release();
  swift_release();
  v12(v6, v10);
  sub_1000CAF10();
  sub_10001D64C(&qword_100111E38);
  sub_1000CAF90();
  swift_release();
  v8(v6, v11, v10);
  sub_1000CAE10();
  swift_release();
  swift_release();
  v12(v6, v10);
  uint64_t v13 = a1;
  sub_1000CAF20();
  type metadata accessor for FeedPersonalizerFactory();
  sub_1000CAF80();
  swift_release();
  swift_release();
  sub_1000CAF20();
  sub_10001D64C(&qword_1001125D0);
  sub_1000CAF90();
  swift_release();
  uint64_t v14 = v11;
  v8(v6, v11, v10);
  sub_1000CAE10();
  swift_release();
  swift_release();
  uint64_t v15 = v42;
  v42(v6, v10);
  sub_1000CAF20();
  uint64_t v37 = sub_10001D64C(&qword_1001125D8);
  sub_1000CAF80();
  swift_release();
  v8(v6, v14, v10);
  sub_1000CAE10();
  swift_release();
  swift_release();
  v15(v6, v10);
  uint64_t v16 = v15;
  sub_1000CAF20();
  sub_100036814(0, &qword_1001125E0);
  sub_1000CAF80();
  swift_release();
  uint64_t v17 = v40;
  v8(v6, v40, v10);
  sub_1000CAE10();
  swift_release();
  swift_release();
  v16(v6, v10);
  sub_1000CAF20();
  sub_10001D64C(&qword_1001125E8);
  sub_1000CAF80();
  swift_release();
  v8(v6, v17, v10);
  sub_1000CAE10();
  swift_release();
  swift_release();
  uint64_t v18 = v42;
  v42(v6, v10);
  sub_1000CAF20();
  sub_100036814(0, &qword_1001125F0);
  sub_1000CAF80();
  swift_release();
  v8(v6, v17, v10);
  unint64_t v34 = v8;
  uint64_t v35 = v4 + 104;
  sub_1000CAE10();
  swift_release();
  swift_release();
  v18(v6, v10);
  uint64_t v36 = v4 + 8;
  sub_1000CAF20();
  sub_100036814(0, &qword_1001125F8);
  sub_1000CAF80();
  swift_release();
  swift_release();
  sub_1000CAF20();
  sub_100036814(0, &qword_100112600);
  sub_1000CAF80();
  swift_release();
  uint64_t v33 = v10;
  v8(v6, v17, v10);
  sub_1000CAE10();
  swift_release();
  swift_release();
  v18(v6, v10);
  uint64_t v32 = v13;
  sub_1000CAF20();
  sub_10001D64C(&qword_100112608);
  sub_1000CAF80();
  swift_release();
  swift_release();
  sub_1000CAF30();
  sub_100020110(v43, v44);
  sub_10001D64C(&qword_100112610);
  uint64_t v19 = enum case for CallbackScope.any(_:);
  uint64_t v20 = v41;
  uint64_t v31 = *(void (**)(char *, uint64_t, uint64_t))(v41 + 104);
  uint64_t v21 = v38;
  uint64_t v22 = v39;
  v31(v38, enum case for CallbackScope.any(_:), v39);
  sub_1000CAFB0();
  uint64_t v23 = v20 + 8;
  uint64_t v24 = *(void (**)(char *, uint64_t))(v20 + 8);
  uint64_t v41 = v23;
  v24(v21, v22);
  sub_1000201A8((uint64_t)v43);
  sub_1000CAF30();
  sub_100020110(v43, v44);
  v31(v21, v19, v22);
  sub_1000CAFA0();
  v24(v21, v22);
  sub_1000201A8((uint64_t)v43);
  sub_1000CAF20();
  sub_100036814(0, &qword_100112618);
  sub_1000CAF80();
  swift_release();
  uint64_t v25 = v40;
  uint64_t v26 = v33;
  uint64_t v27 = v34;
  v34(v6, v40, v33);
  sub_1000CAE10();
  swift_release();
  swift_release();
  id v28 = v42;
  v42(v6, v26);
  sub_1000CAF20();
  sub_10001D64C(&qword_100112620);
  sub_1000CAF90();
  swift_release();
  v27(v6, v25, v26);
  sub_1000CAE10();
  swift_release();
  swift_release();
  v28(v6, v26);
  sub_1000CAF20();
  sub_10001D64C(&qword_100112628);
  sub_1000CAF90();
  swift_release();
  v27(v6, v25, v26);
  sub_1000CAE10();
  swift_release();
  swift_release();
  v28(v6, v26);
  sub_1000CAF20();
  sub_100036814(0, (unint64_t *)&unk_100112630);
  sub_1000CAF80();
  swift_release();
  v27(v6, v25, v26);
  sub_1000CAE10();
  swift_release();
  swift_release();
  return ((uint64_t (*)(char *, uint64_t))v28)(v6, v26);
}

unint64_t sub_1000C3D7C()
{
  unint64_t result = qword_100111C10;
  if (!qword_100111C10)
  {
    sub_1000CABE0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100111C10);
  }
  return result;
}

uint64_t sub_1000C3DD4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000C3DE4()
{
  return swift_release();
}

uint64_t sub_1000C3DEC()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000C3E24(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  sub_1000C2280(a1, a2, a3, *(void **)(v4 + 16), a4);
}

id TagIntent.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TagIntent();
  return [super init];
}

uint64_t type metadata accessor for TagIntent()
{
  return self;
}

id TagIntent.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for TagIntent();
  [super initWithCoder:a1];

  return v3;
}

id TodayIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    NSString v6 = sub_1000CC1C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  id v7 = [objc_allocWithZone(v4) initWithIdentifier:v6 backingStore:a3];

  return v7;
}

id TagIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    NSString v5 = sub_1000CC1C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for TagIntent();
  id v6 = [super initWithIdentifier:v5 backingStore:a3];

  return v6;
}

id TodayIntent.__allocating_init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  NSString v7 = sub_1000CC1C0();
  swift_bridgeObjectRelease();
  NSString v8 = sub_1000CC1C0();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v9.super.Class isa = sub_1000CC100().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.Class isa = 0;
  }
  id v10 = [objc_allocWithZone(v5) initWithDomain:v7 verb:v8 parametersByName:v9.super.isa];

  return v10;
}

id TagIntent.init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  NSString v7 = sub_1000CC1C0();
  swift_bridgeObjectRelease();
  NSString v8 = sub_1000CC1C0();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v9.super.Class isa = sub_1000CC100().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.Class isa = 0;
  }
  v12.receiver = v5;
  v12.super_class = (Class)type metadata accessor for TagIntent();
  id v10 = [super initWithDomain:v7 verb:v8 parametersByName:v9.super.isa];

  return v10;
}

id TagIntent.__deallocating_deinit()
{
  return sub_1000C4B74(type metadata accessor for TagIntent);
}

unint64_t TodayIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_1000C4BAC(a1);
}

Swift::Int sub_1000C440C()
{
  Swift::UInt v1 = *v0;
  sub_1000CCAC0();
  sub_1000CCAD0(v1);
  return sub_1000CCAF0();
}

void sub_1000C4454()
{
  sub_1000CCAD0(*v0);
}

Swift::Int sub_1000C4480()
{
  Swift::UInt v1 = *v0;
  sub_1000CCAC0();
  sub_1000CCAD0(v1);
  return sub_1000CCAF0();
}

unint64_t sub_1000C44C4@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_1000C4BAC(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t TagIntentResponse.code.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___TagIntentResponse_code;
  swift_beginAccess();
  return *(void *)v1;
}

char *TagIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  NSString v5 = (char *)[objc_allocWithZone(v2) init];
  id v6 = &v5[OBJC_IVAR___TagIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  NSString v7 = v5;
  [v7 setUserActivity:a2];

  return v7;
}

char *TagIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  NSString v5 = (char *)[v2 init];
  id v6 = &v5[OBJC_IVAR___TagIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  NSString v7 = v5;
  [v7 setUserActivity:a2];

  return v7;
}

id TagIntentResponse.init()()
{
  *(void *)&v0[OBJC_IVAR___TagIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TagIntentResponse();
  return [super init];
}

id TodayIntent.__allocating_init(coder:)(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithCoder:a1];

  return v3;
}

id TagIntentResponse.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___TagIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for TagIntentResponse();
  [super initWithCoder:a1];

  return v3;
}

id TodayIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithBackingStore:a1];

  return v3;
}

id TagIntentResponse.init(backingStore:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___TagIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for TagIntentResponse();
  id v3 = [super initWithBackingStore:a1];

  return v3;
}

id sub_1000C497C(char *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  *(void *)&a1[OBJC_IVAR___TagIntentResponse_code] = 0;
  v7.receiver = a1;
  v7.super_class = (Class)type metadata accessor for TagIntentResponse();
  return [super a3];
}

id TodayIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  if (a1)
  {
    v2.super.Class isa = sub_1000CC100().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.Class isa = 0;
  }
  id v3 = [objc_allocWithZone(v1) initWithPropertiesByName:v2.super.isa];

  return v3;
}

id TagIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR___TagIntentResponse_code] = 0;
  if (a1)
  {
    v2.super.Class isa = sub_1000CC100().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.Class isa = 0;
  }
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for TagIntentResponse();
  [v5 initWithPropertiesByName:v2.super.isa];

  if (v3) {
  return v3;
  }
}

id TagIntentResponse.__deallocating_deinit()
{
  return sub_1000C4B74(type metadata accessor for TagIntentResponse);
}

id sub_1000C4B74(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return [super dealloc];
}

unint64_t sub_1000C4BAC(unint64_t result)
{
  if (result > 6) {
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for TagIntentResponse()
{
  return self;
}

unint64_t sub_1000C4BE4()
{
  unint64_t result = qword_100112650;
  if (!qword_100112650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100112650);
  }
  return result;
}

uint64_t sub_1000C4C38@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  objc_super v3 = (void *)(*a1 + OBJC_IVAR___TagIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_1000C4C8C(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  objc_super v3 = (void *)(*a2 + OBJC_IVAR___TagIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *objc_super v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for TagIntentResponseCode()
{
  return &type metadata for TagIntentResponseCode;
}

id TodayIntent.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TodayIntent();
  return [super init];
}

uint64_t type metadata accessor for TodayIntent()
{
  return self;
}

id TodayIntent.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for TodayIntent();
  [super initWithCoder:a1];

  return v3;
}

id TodayIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    NSString v5 = sub_1000CC1C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for TodayIntent();
  [super initWithIdentifier:v5 backingStore:a3];

  return v6;
}

id TodayIntent.init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  NSString v7 = sub_1000CC1C0();
  swift_bridgeObjectRelease();
  NSString v8 = sub_1000CC1C0();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v9.super.Class isa = sub_1000CC100().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.Class isa = 0;
  }
  v12.receiver = v5;
  v12.super_class = (Class)type metadata accessor for TodayIntent();
  id v10 = [super initWithDomain:v7 verb:v8 parametersByName:v9.super.isa];

  return v10;
}

id TodayIntent.__deallocating_deinit()
{
  return sub_1000C56DC(type metadata accessor for TodayIntent);
}

uint64_t TodayIntentResponse.code.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___TodayIntentResponse_code;
  swift_beginAccess();
  return *(void *)v1;
}

char *TodayIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  NSString v5 = (char *)[objc_allocWithZone(v2) init];
  id v6 = &v5[OBJC_IVAR___TodayIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  NSString v7 = v5;
  [v7 setUserActivity:a2];

  return v7;
}

char *TodayIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  NSString v5 = (char *)[v2 init];
  id v6 = &v5[OBJC_IVAR___TodayIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  NSString v7 = v5;
  [v7 setUserActivity:a2];

  return v7;
}

id TodayIntentResponse.init()()
{
  *(void *)&v0[OBJC_IVAR___TodayIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TodayIntentResponse();
  return [super init];
}

id TodayIntentResponse.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___TodayIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for TodayIntentResponse();
  id v3 = [super initWithCoder:a1];

  return v3;
}

id TodayIntentResponse.init(backingStore:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___TodayIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for TodayIntentResponse();
  [super initWithBackingStore:a1];

  return v3;
}

id sub_1000C5568(char *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  *(void *)&a1[OBJC_IVAR___TodayIntentResponse_code] = 0;
  v7.receiver = a1;
  v7.super_class = (Class)type metadata accessor for TodayIntentResponse();
  return [super a3];
}

id TodayIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR___TodayIntentResponse_code] = 0;
  if (a1)
  {
    v2.super.Class isa = sub_1000CC100().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.Class isa = 0;
  }
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for TodayIntentResponse();
  [super initWithPropertiesByName:v2.super.isa];

  if (v3) {
  return v3;
  }
}

id TodayIntentResponse.__deallocating_deinit()
{
  return sub_1000C56DC(type metadata accessor for TodayIntentResponse);
}

id sub_1000C56DC(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return [super dealloc];
}

uint64_t type metadata accessor for TodayIntentResponse()
{
  return self;
}

unint64_t sub_1000C573C()
{
  unint64_t result = qword_1001126B0;
  if (!qword_1001126B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001126B0);
  }
  return result;
}

uint64_t sub_1000C5790@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  objc_super v3 = (void *)(*a1 + OBJC_IVAR___TodayIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_1000C57E4(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  objc_super v3 = (void *)(*a2 + OBJC_IVAR___TodayIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *objc_super v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for TodayIntentResponseCode()
{
  return &type metadata for TodayIntentResponseCode;
}

id Tag.__allocating_init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    NSString v8 = sub_1000CC1C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v8 = 0;
  }
  NSString v9 = sub_1000CC1C0();
  swift_bridgeObjectRelease();
  if (a6)
  {
    NSString v10 = sub_1000CC1C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v10 = 0;
  }
  id v11 = [objc_allocWithZone(v6) initWithIdentifier:v8 displayString:v9 pronunciationHint:v10];

  return v11;
}

id Tag.init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    NSString v8 = sub_1000CC1C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v8 = 0;
  }
  NSString v9 = sub_1000CC1C0();
  swift_bridgeObjectRelease();
  if (a6)
  {
    NSString v10 = sub_1000CC1C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v10 = 0;
  }
  v13.receiver = v6;
  v13.super_class = (Class)type metadata accessor for Tag();
  id v11 = [super initWithIdentifier:v8 displayString:v9 pronunciationHint:v10];

  return v11;
}

uint64_t type metadata accessor for Tag()
{
  return self;
}

id Tag.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for Tag();
  [super initWithCoder:a1];

  return v3;
}

id Tag.__deallocating_deinit()
{
  return sub_1000C6294(type metadata accessor for Tag);
}

id static TagResolutionResult.success(with:)(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___TagResolutionResult;
  [super successWithResolvedObject:a1];

  return v2;
}

id static TagResolutionResult.disambiguation(with:)(unint64_t a1)
{
  if (a1 >> 62)
  {
    sub_1000C5D1C();
    swift_bridgeObjectRetain();
    sub_1000CC880();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_1000CCA40();
    sub_1000C5D1C();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  sub_1000C5D1C();
  Class isa = sub_1000CC3A0().super.isa;
  swift_bridgeObjectRelease();
  v5.receiver = ObjCClassFromMetadata;
  v5.super_class = (Class)&OBJC_METACLASS___TagResolutionResult;
  [super disambiguationWithObjectsToDisambiguate:isa];

  return v3;
}

unint64_t sub_1000C5D1C()
{
  unint64_t result = qword_100112730;
  if (!qword_100112730)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100112730);
  }
  return result;
}

id static TagResolutionResult.confirmationRequired(with:)(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___TagResolutionResult;
  [super confirmationRequiredWithObjectToConfirm:a1];

  return v2;
}

void static TagResolutionResult.success(with:)()
{
}

void static TagResolutionResult.disambiguation(with:)()
{
}

void static TagResolutionResult.confirmationRequired(with:)()
{
}

id TagResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  Class isa = sub_1000CC100().super.isa;
  swift_bridgeObjectRelease();
  id v6 = [v4 initWithJSONDictionary:isa forIntent:a2];

  return v6;
}

id TagResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  Class isa = sub_1000CC100().super.isa;
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for TagResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, "initWithJSONDictionary:forIntent:", isa, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for TagResolutionResult()
{
  return self;
}

id TagResolutionResult.__deallocating_deinit()
{
  return sub_1000C6294(type metadata accessor for TagResolutionResult);
}

id sub_1000C6294(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return [super dealloc];
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_1000C62F0()
{
  return sub_1000C649C(1);
}

uint64_t sub_1000C62F8(uint64_t a1, int a2, int a3, int a4)
{
  if (qword_10011ABB8 == -1)
  {
    if (qword_10011ABC0) {
      return _availability_version_check();
    }
  }
  else
  {
    dispatch_once_f(&qword_10011ABB8, 0, (dispatch_function_t)sub_1000C6494);
    if (qword_10011ABC0) {
      return _availability_version_check();
    }
  }
  if (qword_10011ABB0 == -1)
  {
    BOOL v8 = dword_10011ABA0 < a2;
    if (dword_10011ABA0 > a2) {
      return 1;
    }
  }
  else
  {
    dispatch_once_f(&qword_10011ABB0, 0, (dispatch_function_t)sub_1000C62F0);
    BOOL v8 = dword_10011ABA0 < a2;
    if (dword_10011ABA0 > a2) {
      return 1;
    }
  }
  if (v8) {
    return 0;
  }
  if (dword_10011ABA4 > a3) {
    return 1;
  }
  return dword_10011ABA4 >= a3 && dword_10011ABA8 >= a4;
}

uint64_t sub_1000C6494()
{
  return sub_1000C649C(0);
}

uint64_t sub_1000C649C(uint64_t result)
{
  uint64_t v1 = (uint64_t (**)(void))qword_10011ABC0;
  if (qword_10011ABC0) {
    BOOL v2 = result == 0;
  }
  else {
    BOOL v2 = 0;
  }
  if (!v2)
  {
    if (&__availability_version_check)
    {
      uint64_t v1 = &__availability_version_check;
      qword_10011ABC0 = (uint64_t)&__availability_version_check;
    }
    if (!v1 || result != 0)
    {
      unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "kCFAllocatorNull");
      if (result)
      {
        id v4 = *(unsigned __int8 **)result;
        unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDataCreateWithBytesNoCopy");
        if (result)
        {
          id v5 = (uint64_t (*)(void))result;
          unint64_t v6 = (unint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateWithData");
          unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateFromXMLData");
          if (v6 | result)
          {
            objc_super v7 = (uint64_t (*)(void, uint64_t, void, void))result;
            unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringCreateWithCStringNoCopy");
            if (result)
            {
              BOOL v8 = (uint64_t (*)(void, const char *, uint64_t, unsigned __int8 *))result;
              unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDictionaryGetValue");
              if (result)
              {
                NSString v9 = (uint64_t (*)(uint64_t, uint64_t))result;
                unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFGetTypeID");
                if (result)
                {
                  NSString v10 = (uint64_t (*)(uint64_t))result;
                  unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetTypeID");
                  if (result)
                  {
                    id v11 = (uint64_t (*)(void))result;
                    unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetCString");
                    id v28 = (unsigned int (*)(uint64_t, char *, uint64_t, uint64_t))result;
                    if (result)
                    {
                      unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFRelease");
                      if (result)
                      {
                        objc_super v12 = (FILE *)result;
                        unint64_t result = (uint64_t)fopen("/System/Library/CoreServices/SystemVersion.plist", "r");
                        if (result)
                        {
                          objc_super v13 = (FILE *)result;
                          uint64_t v27 = v12;
                          fseek((FILE *)result, 0, 2);
                          uint64_t v14 = ftell(v13);
                          if (v14 < 0)
                          {
                            uint64_t v16 = 0;
                          }
                          else
                          {
                            size_t v15 = v14;
                            rewind(v13);
                            uint64_t v16 = malloc(v15);
                            if (v16)
                            {
                              uint64_t v26 = v16;
                              if (fread(v16, 1uLL, v15, v13) == v15)
                              {
                                uint64_t v17 = v5(0);
                                if (v17)
                                {
                                  uint64_t v18 = v17;
                                  uint64_t v19 = v13;
                                  if (v6) {
                                    uint64_t v20 = ((uint64_t (*)(void, uint64_t, void, void, void))v6)(0, v17, 0, 0, 0);
                                  }
                                  else {
                                    uint64_t v20 = v7(0, v17, 0, 0);
                                  }
                                  uint64_t v21 = v20;
                                  if (v20)
                                  {
                                    uint64_t v22 = v8(0, "ProductVersion", 1536, v4);
                                    if (v22)
                                    {
                                      uint64_t v23 = v22;
                                      uint64_t v24 = v9(v21, v22);
                                      ((void (*)(uint64_t))v27)(v23);
                                      if (v24)
                                      {
                                        uint64_t v25 = v10(v24);
                                        if (v25 == v11())
                                        {
                                          if (v28(v24, v29, 32, 134217984)) {
                                            sscanf(v29, "%d.%d.%d", &dword_10011ABA0, &dword_10011ABA4, &dword_10011ABA8);
                                          }
                                        }
                                      }
                                    }
                                    ((void (*)(uint64_t))v27)(v21);
                                    uint64_t v19 = v13;
                                  }
                                  ((void (*)(uint64_t))v27)(v18);
                                }
                                else
                                {
                                  uint64_t v19 = v13;
                                }
                                uint64_t v16 = v26;
                              }
                              else
                              {
                                uint64_t v16 = v26;
                                uint64_t v19 = v13;
                              }
                              goto LABEL_41;
                            }
                          }
                          uint64_t v19 = v13;
LABEL_41:
                          free(v16);
                          return fclose(v19);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_1000C67D4()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"headline", v6, 2u);
}

void sub_1000C6898()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"trackableWidgetState", v6, 2u);
}

void sub_1000C695C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"widgetEventTracker", v6, 2u);
}

void sub_1000C6A20()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"assetHandlesByRemoteURL", v6, 2u);
}

void sub_1000C6AE4()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"trackableWidgetState", v6, 2u);
}

void sub_1000C6BA8()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"flintDocumentURLAssetHandlesByRemoteURL", v6, 2u);
}

void sub_1000C6C6C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"JSONArray", v6, 2u);
}

void sub_1000C6D30()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"assetManager", v6, 2u);
}

void sub_1000C6DF4()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"assetHandlesByRemoteURL", v6, 2u);
}

void sub_1000C6EB8()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"encodableElement", v6, 2u);
}

void sub_1000C6F7C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"JSONArray", v6, 2u);
}

void sub_1000C7040()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"todaySourceIdentifier", v6, 2u);
}

void sub_1000C7104()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"b", v6, 2u);
}

void sub_1000C71C8()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"a", v6, 2u);
}

void sub_1000C728C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"expected nil value for '%s'"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"self.startDate", v6, 2u);
}

void sub_1000C7350()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"expected nil value for '%s'"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"self.startState", v6, 2u);
}

void sub_1000C7414()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"start and end events must be balanced!"];
  int v1 = 136315906;
  int v2 = "-[FTWidgetLingerEventTracker trackWidgetLingerEventExtremity:atDate:withTodaySource:appConfigTreatmentID:widgetDi"
       "splayMode:appearanceType:]";
  __int16 v3 = 2080;
  int v4 = "FTWidgetLingerEventTracker.m";
  __int16 v5 = 1024;
  sub_10000D5A4();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);
}

void sub_1000C74E8()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"startDate", v6, 2u);
}

void sub_1000C75AC()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"startState", v6, 2u);
}

void sub_1000C7670()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"start and end events must be balanced!"];
  int v1 = 136315906;
  int v2 = "-[FTWidgetLingerEventTracker trackWidgetLingerEventExtremity:atDate:withTodaySource:appConfigTreatmentID:widgetDi"
       "splayMode:appearanceType:]";
  __int16 v3 = 2080;
  int v4 = "FTWidgetLingerEventTracker.m";
  __int16 v5 = 1024;
  sub_10000D5A4();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);
}

void sub_1000C7744()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"todaySourceIdentifier", v6, 2u);
}

void sub_1000C7808()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"date", v6, 2u);
}

void sub_1000C78CC()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"endTodaySourceIdentifier", v6, 2u);
}

void sub_1000C7990()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"userIDProvider", v6, 2u);
}

void sub_1000C7A54()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sessionManager", v6, 2u);
}

void sub_1000C7B18()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"trackableWidgetState", v6, 2u);
}

void sub_1000C7BDC()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"changeDate", v6, 2u);
}

void sub_1000C7CA0()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"lastVisibleItemsChangeDate", v6, 2u);
}

void sub_1000C7D64()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"trackableWidgetState", v6, 2u);
}

void sub_1000C7E28()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"engagement", v6, 2u);
}

void sub_1000C7EEC()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"date", v6, 2u);
}

void sub_1000C7FB0()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"trackableWidgetState", v6, 2u);
}

void sub_1000C8074()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"event", v6, 2u);
}

void sub_1000C8138()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s" @"section"];
  *(_DWORD *)buf = 136315906;
  int v2 = "-[NTHeadlineEngagementEventTracker trackEngagementWithTodaySource:appConfigTreatmentID:section:otherVisibleSectio"
       "ns:headlineOrder:widgetDisplayMode:]";
  __int16 v3 = 2080;
  int v4 = "FTHeadlineEngagementEventTracker.m";
  __int16 v5 = 1024;
  sub_10000BEC0();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_1000C8218()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s" @"todaySource"];
  *(_DWORD *)buf = 136315906;
  int v2 = "-[NTHeadlineEngagementEventTracker trackEngagementWithTodaySource:appConfigTreatmentID:section:otherVisibleSectio"
       "ns:headlineOrder:widgetDisplayMode:]";
  __int16 v3 = 2080;
  int v4 = "FTHeadlineEngagementEventTracker.m";
  __int16 v5 = 1024;
  sub_10000BEC0();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_1000C82F8()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"reporter", v6, 2u);
}

void sub_1000C83BC()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"URL", v6, 2u);
}

void sub_1000C8480()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"trackableWidgetState", v6, 2u);
}

void sub_1000C8544()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"widgetEventTracker", v6, 2u);
}

void sub_1000C8608()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"trackableWidgetState", v6, 2u);
}

void sub_1000C86CC()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Case not implemented"];
  int v1 = 136315906;
  int v2 = "NSString *FTCampaignIdentifierForSourceIdentifier(NSString *__strong)";
  __int16 v3 = 2080;
  int v4 = "FTConstants.m";
  __int16 v5 = 1024;
  int v6 = 30;
  __int16 v7 = 2114;
  id v8 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);
}

void sub_1000C87AC()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s" @"todaySource"];
  *(_DWORD *)buf = 136315906;
  int v2 = "-[FTWidgetAppearanceEventTracker trackAppearanceAtDate:withHeadlineSource:appConfigTreatmentID:appearanceType:allItemsCount:]";
  __int16 v3 = 2080;
  int v4 = "FTWidgetAppearanceEventTracker.m";
  __int16 v5 = 1024;
  sub_10000BEC0();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_1000C888C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s" @"appearanceDate"];
  *(_DWORD *)buf = 136315906;
  int v2 = "-[FTWidgetAppearanceEventTracker trackAppearanceAtDate:withHeadlineSource:appConfigTreatmentID:appearanceType:allItemsCount:]";
  __int16 v3 = 2080;
  int v4 = "FTWidgetAppearanceEventTracker.m";
  __int16 v5 = 1024;
  sub_10000BEC0();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_1000C896C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"assetHandlesByRemoteURL", v6, 2u);
}

void sub_1000C8A30()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sectionsByHeadline", v6, 2u);
}

void sub_1000C8AF4()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"headlines", v6, 2u);
}

void sub_1000C8BB8()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"NewsArticleID", v6, 2u);
}

void sub_1000C8C7C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s" unvalidatedValue];
  *(_DWORD *)buf = 136315906;
  int v2 = "NSString *FTValidatedFreeValuedPropertyValue(NSString *__strong)";
  __int16 v3 = 2080;
  int v4 = "FTEventTrackingConstants.m";
  __int16 v5 = 1024;
  sub_10000BEC0();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_1000C8D5C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s" name];
  *(_DWORD *)buf = 136315906;
  int v2 = "+[PETEventProperty(FTAdditions) ft_BOOLeanPropertyWithName:]";
  __int16 v3 = 2080;
  int v4 = "FTEventTrackingConstants.m";
  __int16 v5 = 1024;
  sub_10000BEC0();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_1000C8E3C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s", "userIDProvider"];
  *(_DWORD *)buf = 136315906;
  int v2 = "-[FTNewsAnalyticsWidgetEventTracker initWithUserIDProvider:]";
  __int16 v3 = 2080;
  int v4 = "FTNewsAnalyticsWidgetEventTracker.m";
  __int16 v5 = 1024;
  int v6 = 41;
  __int16 v7 = 2114;
  id v8 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_1000C8F28()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s", "eventTrackers"];
  *(_DWORD *)buf = 136315906;
  int v2 = "-[FTAggregateWidgetEventTracker initWithEventTrackers:]";
  __int16 v3 = 2080;
  int v4 = "FTAggregateWidgetEventTracker.m";
  __int16 v5 = 1024;
  sub_10000BEC0();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_1000C9008()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s", "trackableWidgetState"];
  *(_DWORD *)buf = 136315906;
  int v2 = "-[FTAggregateWidgetEventTracker widgetDidAppearAtDate:withTrackableWidgetState:]";
  __int16 v3 = 2080;
  int v4 = "FTAggregateWidgetEventTracker.m";
  __int16 v5 = 1024;
  sub_10000BEC0();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_1000C90E8()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sharedDirectoryFileURL", v6, 2u);
}

void sub_1000C91AC()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"referralItem", v6, 2u);
}

void sub_1000C9270()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sourceFilePath", v6, 2u);
}

void sub_1000C9334()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"assetManager", v6, 2u);
}

void sub_1000C93F8()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"queryValue", v6, 2u);
}

void sub_1000C94BC()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"itemClass", v6, 2u);
}

void sub_1000C9580()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s" @"availabilityMonitor"];
  *(_DWORD *)buf = 136315906;
  int v2 = "-[FTEngagementURLProvider initWithAvailabilityMonitor:]";
  __int16 v3 = 2080;
  int v4 = "FTEngagementURLProvider.m";
  __int16 v5 = 1024;
  sub_10000BEC0();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_1000C9660()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s" @"engagementDescriptor"];
  *(_DWORD *)buf = 136315906;
  int v2 = "-[FTEngagementURLProvider URLForEngagement:event:trackableWidgetState:prefetchAssetsByRemoteURL:sharedDirectoryFileURL:]";
  __int16 v3 = 2080;
  int v4 = "FTEngagementURLProvider.m";
  __int16 v5 = 1024;
  sub_10000BEC0();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_1000C9740(uint64_t a1, id *a2)
{
  __int16 v3 = [*(id *)(a1 + 40) identifier];
  int v4 = [*a2 downloadError];
  sub_1000182F0();
  sub_100018308((void *)&_mh_execute_header, v5, v6, "failed to download JSON for banner %{public}@ with error %{public}@", v7, v8, v9, v10, v11);
}

void sub_1000C97E8(uint64_t a1, id *a2)
{
  __int16 v3 = [*(id *)(a1 + 40) identifier];
  int v4 = [*a2 downloadError];
  sub_1000182F0();
  sub_100018308((void *)&_mh_execute_header, v5, v6, "failed to download JSON for headline %{public}@ with error %{public}@", v7, v8, v9, v10, v11);
}

void sub_1000C9890()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s", "updateFetchDuration >= 0"];
  *(_DWORD *)buf = 136315906;
  int v2 = "-[FTWidgetUpdateEventTracker trackUpdateWithTodaySource:appConfigTreatmentID:error:updateFetchDuration:wifiReacha"
       "ble:cellularRadioAccessTechnology:]";
  __int16 v3 = 2080;
  int v4 = "FTWidgetUpdateEventTracker.m";
  __int16 v5 = 1024;
  sub_10000BEC0();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_1000C9970()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s" @"todaySourceIdentifier"];
  *(_DWORD *)buf = 136315906;
  int v2 = "-[FTWidgetUpdateEventTracker trackUpdateWithTodaySource:appConfigTreatmentID:error:updateFetchDuration:wifiReacha"
       "ble:cellularRadioAccessTechnology:]";
  __int16 v3 = 2080;
  int v4 = "FTWidgetUpdateEventTracker.m";
  __int16 v5 = 1024;
  sub_10000BEC0();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_1000C9A50()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"predicate", v6, 2u);
}

void sub_1000C9B14()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"widgetEventTracker", v6, 2u);
}

void sub_1000C9BD8()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"trackableWidgetState", v6, 2u);
}

void sub_1000C9C9C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"date", v6, 2u);
}

void sub_1000C9D60()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"trackableWidgetState", v6, 2u);
}

void sub_1000C9E24()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"fetchInfo", v6, 2u);
}

void sub_1000C9EE8()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s" @"otherQueryItems"];
  *(_DWORD *)buf = 136315906;
  int v2 = "-[NSURL(FTReferralAdditions) ft_referralURLWithSourceIdentifier:appConfigTreatmentID:widgetEngagement:otherQueryI"
       "tems:sharedDirectoryFileURL:]";
  __int16 v3 = 2080;
  int v4 = "NSURL+FTReferralAdditions.m";
  __int16 v5 = 1024;
  sub_10000BEC0();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_1000C9FC8()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s" @"sourceIdentifier"];
  *(_DWORD *)buf = 136315906;
  int v2 = "-[NSURL(FTReferralAdditions) ft_referralURLWithSourceIdentifier:appConfigTreatmentID:widgetEngagement:otherQueryI"
       "tems:sharedDirectoryFileURL:]";
  __int16 v3 = 2080;
  int v4 = "NSURL+FTReferralAdditions.m";
  __int16 v5 = 1024;
  sub_10000BEC0();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_1000CA0A8()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"trackableWidgetState", v6, 2u);
}

void sub_1000CA16C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"section", v6, 2u);
}

void sub_1000CA230()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"headline", v6, 2u);
}

void sub_1000CA2F4()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"date", v6, 2u);
}

void sub_1000CA3B8()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s" @"trackableWidgetState"];
  *(_DWORD *)buf = 136315906;
  int v2 = "-[FTProactiveWidgetEventTracker widgetDidAppearAtDate:withTrackableWidgetState:]";
  __int16 v3 = 2080;
  int v4 = "FTProactiveWidgetEventTracker.m";
  __int16 v5 = 1024;
  int v6 = 59;
  __int16 v7 = 2114;
  id v8 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_1000CA4A4()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"documentsDirectoryFileURL", v6, 2u);
}

void sub_1000CA568()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"todayEventTracker", v6, 2u);
}

void sub_1000CA62C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"visibleHeadlinesAppearanceDate", v6, 2u);
}

void sub_1000CA6F0()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"visibleHeadlines", v6, 2u);
}

void sub_1000CA7B4()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"date", v6, 2u);
}

void sub_1000CA878()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"visibleHeadlines", v6, 2u);
}

void sub_1000CA93C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_10000BF00();
  sub_10000BEF0();
  sub_10000BEC0();
  sub_10000BED4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"contentContext", v6, 2u);
}

uint64_t sub_1000CAA00()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t sub_1000CAA10()
{
  return dispatch thunk of JSONDecoder.userInfo.modify();
}

uint64_t sub_1000CAA20()
{
  return JSONDecoder.init()();
}

uint64_t sub_1000CAA30()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t sub_1000CAA40()
{
  return dispatch thunk of JSONEncoder.encode<A>(_:)();
}

uint64_t sub_1000CAA50()
{
  return dispatch thunk of JSONEncoder.userInfo.modify();
}

uint64_t sub_1000CAA60()
{
  return JSONEncoder.init()();
}

uint64_t sub_1000CAA70()
{
  return type metadata accessor for JSONEncoder();
}

uint64_t sub_1000CAA80()
{
  return static CharacterSet.whitespacesAndNewlines.getter();
}

uint64_t sub_1000CAA90()
{
  return type metadata accessor for CharacterSet();
}

uint64_t sub_1000CAAA0()
{
  return __DataStorage._bytes.getter();
}

uint64_t sub_1000CAAB0()
{
  return __DataStorage._length.getter();
}

uint64_t sub_1000CAAC0()
{
  return __DataStorage._offset.getter();
}

uint64_t sub_1000CAAD0()
{
  return URLResourceValues.creationDate.getter();
}

uint64_t sub_1000CAAE0()
{
  return type metadata accessor for URLResourceValues();
}

uint64_t sub_1000CAAF0()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_1000CAB00()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_1000CAB10()
{
  return type metadata accessor for NSFastEnumerationIterator();
}

uint64_t sub_1000CAB20()
{
  return type metadata accessor for URL.DirectoryHint();
}

uint64_t sub_1000CAB30()
{
  return URL.absoluteString.getter();
}

uint64_t sub_1000CAB40()
{
  return URL.resourceValues(forKeys:)();
}

uint64_t sub_1000CAB50()
{
  return URL.lastPathComponent.getter();
}

void sub_1000CAB60(NSURL *retstr@<X8>)
{
}

uint64_t sub_1000CAB70()
{
  return URL.appendingPathComponent(_:isDirectory:)();
}

uint64_t sub_1000CAB80()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t sub_1000CAB90()
{
  return static URL.== infix(_:_:)();
}

uint64_t sub_1000CABA0()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000CABB0()
{
  return URL.path.getter();
}

uint64_t sub_1000CABC0()
{
  return URL.init(string:)();
}

uint64_t sub_1000CABD0()
{
  return URL.appending<A>(component:directoryHint:)();
}

uint64_t sub_1000CABE0()
{
  return type metadata accessor for URL();
}

uint64_t sub_1000CABF0()
{
  return Data.init(contentsOf:options:)();
}

NSData sub_1000CAC00()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_1000CAC10()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000CAC20()
{
  return Data.write(to:options:)();
}

uint64_t _s7NewsTag16TelemetryManagerC13lastFlushDate33_4E4017AC2BCC1D1AC48C0D84A0E547E9LL10Foundation0G0Vvpfi_0()
{
  return static Date.distantPast.getter();
}

uint64_t sub_1000CAC40()
{
  return Date.timeIntervalSince(_:)();
}

NSDate sub_1000CAC50()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_1000CAC60()
{
  return static Date.< infix(_:_:)();
}

uint64_t sub_1000CAC70()
{
  return static Date.+ infix(_:_:)();
}

uint64_t sub_1000CAC80()
{
  return static Date.- infix(_:_:)();
}

uint64_t sub_1000CAC90()
{
  return Date.init(timeIntervalSince1970:)();
}

uint64_t sub_1000CACA0()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000CACB0()
{
  return Date.init()();
}

uint64_t sub_1000CACC0()
{
  return type metadata accessor for Date();
}

uint64_t sub_1000CACD0()
{
  return UUID.uuidString.getter();
}

uint64_t sub_1000CACE0()
{
  return UUID.init()();
}

uint64_t sub_1000CACF0()
{
  return type metadata accessor for UUID();
}

uint64_t sub_1000CAD00()
{
  return static Locale.current.getter();
}

uint64_t sub_1000CAD10()
{
  return Locale.Language.init(identifier:)();
}

uint64_t sub_1000CAD20()
{
  return type metadata accessor for Locale.Language();
}

uint64_t sub_1000CAD30()
{
  return type metadata accessor for Locale();
}

uint64_t sub_1000CADB0()
{
  return CGFloat.init(truncating:)();
}

uint64_t sub_1000CADD0()
{
  return static CGFloat._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_1000CADE0()
{
  return static CGFloat._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_1000CADF0()
{
  return static CGFloat._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000CAE00()
{
  return isFeatureEnabled(_:)();
}

uint64_t sub_1000CAE10()
{
  return Definition.inScope(_:)();
}

uint64_t sub_1000CAE20()
{
  return static UnfairLock.Options.dataSynchronization.getter();
}

uint64_t sub_1000CAE30()
{
  return type metadata accessor for UnfairLock.Options();
}

uint64_t sub_1000CAE40()
{
  return UnfairLock.init(options:)();
}

uint64_t sub_1000CAE50()
{
  return type metadata accessor for UnfairLock();
}

uint64_t sub_1000CAE60()
{
  return dispatch thunk of ContextType.use<A>(_:for:)();
}

uint64_t sub_1000CAE70()
{
  return static LazyOptions.keepOnMain.getter();
}

uint64_t sub_1000CAE80()
{
  return type metadata accessor for LazyOptions();
}

uint64_t sub_1000CAE90()
{
  return dispatch thunk of ResolverType.resolve<A>(_:name:)();
}

uint64_t sub_1000CAEA0()
{
  return dispatch thunk of ResolverType.resolve<A>(_:with:)();
}

uint64_t sub_1000CAEB0()
{
  return dispatch thunk of ResolverType.resolve<A>(_:)();
}

uint64_t sub_1000CAEC0()
{
  return dispatch thunk of ResolverType.resolve<A>(_:)();
}

uint64_t sub_1000CAED0()
{
  return isNilOrEmpty(_:trim:)();
}

uint64_t sub_1000CAEE0()
{
  return type metadata accessor for CallbackScope();
}

uint64_t sub_1000CAEF0()
{
  return SingletonPool.init()();
}

uint64_t sub_1000CAF00()
{
  return type metadata accessor for SingletonPool();
}

uint64_t sub_1000CAF10()
{
  return ProxyContainer.public.getter();
}

uint64_t sub_1000CAF20()
{
  return ProxyContainer.private.getter();
}

uint64_t sub_1000CAF30()
{
  return ProxyContainer.callback.getter();
}

uint64_t sub_1000CAF40()
{
  return SingleValueStore.storedValue.getter();
}

uint64_t sub_1000CAF50()
{
  return SingleValueStore.add(value:)();
}

uint64_t sub_1000CAF60()
{
  return + infix<A, B>(_:_:)();
}

uint64_t sub_1000CAF70()
{
  return RegistrationContainer.lazy(block:)();
}

uint64_t sub_1000CAF80()
{
  return RegistrationContainer.register<A>(_:name:factory:)();
}

uint64_t sub_1000CAF90()
{
  return RegistrationContainer.register<A>(_:name:factory:)();
}

uint64_t sub_1000CAFA0()
{
  return dispatch thunk of CallbackRegistrationType.whenResolving<A>(_:scope:callback:)();
}

uint64_t sub_1000CAFB0()
{
  return dispatch thunk of CallbackRegistrationType.whenResolving<A>(_:scope:callback:)();
}

uint64_t sub_1000CAFC0()
{
  return dispatch thunk of Lazy.value.getter();
}

uint64_t sub_1000CAFD0()
{
  return Lazy.__allocating_init(options:loadBlock:)();
}

uint64_t sub_1000CAFE0()
{
  return type metadata accessor for Lazy();
}

uint64_t sub_1000CAFF0()
{
  return Lock.sync<A>(_:)();
}

uint64_t sub_1000CB000()
{
  return type metadata accessor for Scope();
}

uint64_t sub_1000CB010()
{
  return zalgo.getter();
}

uint64_t sub_1000CB020()
{
  return Promise.then<A>(on:closure:)();
}

uint64_t sub_1000CB030()
{
  return Promise.then<A>(on:closure:)();
}

uint64_t sub_1000CB040()
{
  return Promise.error(on:closure:)();
}

uint64_t sub_1000CB050()
{
  return Promise.init(value:)();
}

uint64_t sub_1000CB060()
{
  return Promise.always(on:closure:)();
}

uint64_t sub_1000CB070()
{
  return Promise.recover(on:closure:)();
}

uint64_t sub_1000CB080()
{
  return Promise.init(resolver:)();
}

uint64_t sub_1000CB090()
{
  return combine<A, B>(_:_:)();
}

uint64_t sub_1000CB0A0()
{
  return firstly<A>(closure:)();
}

uint64_t sub_1000CB0B0()
{
  return type metadata accessor for Container.Environment();
}

uint64_t sub_1000CB0C0()
{
  return Container.init(bundleAssemblies:assemblies:singletonPool:environment:)();
}

uint64_t sub_1000CB0D0()
{
  return Container.resolver.getter();
}

uint64_t sub_1000CB0E0()
{
  return type metadata accessor for Container();
}

uint64_t sub_1000CB0F0()
{
  return NewsAppConfigurationManager.init(appConfigurationManager:transform:)();
}

uint64_t sub_1000CB100()
{
  return type metadata accessor for NewsAppConfigurationManager();
}

uint64_t sub_1000CB110()
{
  return static FeatureState.recoveringState<A>(isEnabled:feature:configuration:)();
}

uint64_t sub_1000CB120()
{
  return Configuration.init(articleEmbeddingsScoringState:clientSideEngagementBoostEnabled:fallbackToReverseChronSorting:newsTabiPersonalizationState:personalizationTreatment:statelessPersonalizationState:extensionStatelessPersonalizationState:publisherDampeningConfig:shadowPublisherDampeningConfig:statelessPersonalizationPublisherFavorability:personalizationAnalyticsEnabled:tabiTagScoringEnabled:tabiCohortMembershipsEnabled:aggregatesInXavierEnabled:aggregatesInExtensionsXavierEnabled:tabiScoringInExtensionsEnabled:)();
}

uint64_t sub_1000CB130()
{
  return ScoringServiceType.score(items:configurationSet:)();
}

uint64_t sub_1000CB140()
{
  return XavierScoringService.limitItems(byFlowRate:timeInterval:publisherCount:)();
}

uint64_t sub_1000CB150()
{
  return XavierScoringService.limitItems(byMinimumItemQuality:)();
}

uint64_t sub_1000CB160()
{
  return XavierScoringService.prepareForUse(completionHandler:)();
}

uint64_t sub_1000CB170()
{
  return XavierScoringService.__allocating_init(aggregateStore:configurationManager:translationProvider:todayPrivateData:)();
}

unint64_t sub_1000CB180(Swift::OpaquePointer_optional a1)
{
  return (unint64_t)XavierScoringService.rankTagIDsDescending(_:)(a1);
}

double sub_1000CB190()
{
  return XavierScoringService.decayedPublisherDiversificationPenalty()();
}

unint64_t sub_1000CB1A0(Swift::OpaquePointer_optional forTagIDs)
{
  return (unint64_t)XavierScoringService.scores(forTagIDs:)(forTagIDs);
}

uint64_t sub_1000CB1B0()
{
  return type metadata accessor for XavierScoringService();
}

uint64_t sub_1000CB1C0()
{
  return dispatch thunk of ConfigurationManagerType.onChangeOfConfiguration(perform:)();
}

uint64_t sub_1000CB1D0()
{
  return dispatch thunk of ConfigurationManagerType.fetchConfigurationIfNeeded(cachedOnly:)();
}

uint64_t sub_1000CB1E0()
{
  return dispatch thunk of ConfigurationManagerType.configuration.getter();
}

uint64_t sub_1000CB1F0()
{
  return ConfigurationManagerType.fetchConfigurationIfNeeded()();
}

uint64_t sub_1000CB200()
{
  return NewsLiveActivityWidgetBundle.body.getter();
}

uint64_t sub_1000CB210()
{
  return NewsLiveActivityWidgetBundle.init()();
}

uint64_t sub_1000CB220()
{
  return type metadata accessor for NewsLiveActivityWidgetBundle();
}

uint64_t sub_1000CB230()
{
  return os_log(_:dso:log:type:_:)();
}

uint64_t sub_1000CB240()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_1000CB250()
{
  return Logger.logObject.getter();
}

uint64_t sub_1000CB260()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_1000CB270()
{
  return type metadata accessor for Logger();
}

uint64_t sub_1000CB280()
{
  return EdgeInsets.init(_all:)();
}

uint64_t sub_1000CB290()
{
  return static ColorScheme.== infix(_:_:)();
}

uint64_t sub_1000CB2A0()
{
  return type metadata accessor for ColorScheme();
}

uint64_t sub_1000CB2B0()
{
  return type metadata accessor for Environment.Content();
}

uint64_t sub_1000CB2C0()
{
  return TupleWidget.init(_:)();
}

uint64_t sub_1000CB2D0()
{
  return ScaledMetric.init(wrappedValue:relativeTo:)();
}

uint64_t sub_1000CB2E0()
{
  return ScaledMetric.wrappedValue.getter();
}

uint64_t sub_1000CB2F0()
{
  return type metadata accessor for ScaledMetric();
}

uint64_t sub_1000CB300()
{
  return static WidgetBundle.main()();
}

uint64_t sub_1000CB310()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t sub_1000CB320()
{
  return GeometryProxy.size.getter();
}

uint64_t sub_1000CB330()
{
  return static PreferenceKey._isReadableByHost.getter();
}

uint64_t sub_1000CB340()
{
  return static PreferenceKey._includesRemovedValues.getter();
}

uint64_t sub_1000CB350()
{
  return GeometryReader.init(content:)();
}

uint64_t sub_1000CB360()
{
  return type metadata accessor for GeometryReader();
}

uint64_t sub_1000CB370()
{
  return LinearGradient.init(gradient:startPoint:endPoint:)();
}

uint64_t sub_1000CB380()
{
  return ModifiedContent<>.accessibility(removeTraits:)();
}

uint64_t sub_1000CB390()
{
  return ModifiedContent<>.accessibilityAddTraits(_:)();
}

uint64_t sub_1000CB3A0()
{
  return type metadata accessor for ModifiedContent();
}

uint64_t sub_1000CB3B0()
{
  return static RedactionReasons.placeholder.getter();
}

uint64_t sub_1000CB3C0()
{
  return type metadata accessor for RedactionReasons();
}

uint64_t sub_1000CB3D0()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t sub_1000CB3E0()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t sub_1000CB3F0()
{
  return EnvironmentValues.imageScale.getter();
}

uint64_t sub_1000CB400()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_1000CB410()
{
  return EnvironmentValues.pixelLength.getter();
}

uint64_t sub_1000CB420()
{
  return EnvironmentValues.displayScale.getter();
}

uint64_t sub_1000CB430()
{
  return EnvironmentValues.displayScale.setter();
}

uint64_t sub_1000CB440()
{
  return EnvironmentValues.sizeCategory.getter();
}

uint64_t sub_1000CB450()
{
  return EnvironmentValues.sizeCategory.setter();
}

uint64_t sub_1000CB460()
{
  return EnvironmentValues.truncationMode.getter();
}

uint64_t sub_1000CB470()
{
  return EnvironmentValues.truncationMode.setter();
}

uint64_t sub_1000CB480()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t sub_1000CB490()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t sub_1000CB4A0()
{
  return EnvironmentValues.redactionReasons.getter();
}

uint64_t sub_1000CB4B0()
{
  return EnvironmentValues.minimumScaleFactor.getter();
}

uint64_t sub_1000CB4C0()
{
  return EnvironmentValues.minimumScaleFactor.setter();
}

uint64_t sub_1000CB4D0()
{
  return EnvironmentValues._lineHeightMultiple.getter();
}

uint64_t sub_1000CB4E0()
{
  return EnvironmentValues._lineHeightMultiple.setter();
}

uint64_t sub_1000CB4F0()
{
  return EnvironmentValues.multilineTextAlignment.getter();
}

uint64_t sub_1000CB500()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t sub_1000CB510()
{
  return EnvironmentValues.font.getter();
}

uint64_t sub_1000CB520()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_1000CB530()
{
  return EnvironmentValues.textCase.getter();
}

uint64_t sub_1000CB540()
{
  return EnvironmentValues.textCase.setter();
}

uint64_t sub_1000CB550()
{
  return type metadata accessor for EnvironmentValues.ShowsWidgetBackgroundKey();
}

uint64_t sub_1000CB560()
{
  return EnvironmentValues.widgetFamily.getter();
}

uint64_t sub_1000CB570()
{
  return EnvironmentValues.widgetRenderingMode.getter();
}

uint64_t sub_1000CB580()
{
  return EnvironmentValues.widgetContentMargins.getter();
}

uint64_t sub_1000CB590()
{
  return EnvironmentValues.lineLimit.getter();
}

uint64_t sub_1000CB5A0()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t sub_1000CB5B0()
{
  return EnvironmentValues.init()();
}

uint64_t sub_1000CB5C0()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t sub_1000CB5D0()
{
  return EnvironmentValues.subscript.getter();
}

uint64_t sub_1000CB5E0()
{
  return static VerticalAlignment.lastTextBaseline.getter();
}

uint64_t sub_1000CB5F0()
{
  return static VerticalAlignment.top.getter();
}

uint64_t sub_1000CB600()
{
  return static VerticalAlignment.center.getter();
}

uint64_t sub_1000CB610()
{
  return LocalizedStringKey.StringInterpolation.appendInterpolation(_:style:)();
}

void sub_1000CB620(Swift::String a1)
{
}

void sub_1000CB630(Swift::String a1)
{
}

uint64_t sub_1000CB640()
{
  return LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_1000CB650()
{
  return type metadata accessor for LocalizedStringKey.StringInterpolation();
}

uint64_t sub_1000CB660()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_1000CB670()
{
  return LocalizedStringKey.init(stringInterpolation:)();
}

uint64_t sub_1000CB680()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t sub_1000CB690()
{
  return static AccessibilityTraits.isImage.getter();
}

uint64_t sub_1000CB6A0()
{
  return static AccessibilityTraits.isButton.getter();
}

uint64_t sub_1000CB6B0()
{
  return static AccessibilityTraits.isHeader.getter();
}

uint64_t sub_1000CB6C0()
{
  return type metadata accessor for AccessibilityTraits();
}

uint64_t sub_1000CB6D0()
{
  return type metadata accessor for ContentSizeCategory();
}

uint64_t sub_1000CB6E0()
{
  return ContentSizeCategory.init(_:)();
}

uint64_t sub_1000CB6F0()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t sub_1000CB700()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t sub_1000CB710()
{
  return WidgetConfiguration.description(_:)();
}

uint64_t sub_1000CB720()
{
  return WidgetConfiguration.supportedFamilies(_:)();
}

uint64_t sub_1000CB730()
{
  return WidgetConfiguration.configurationDisplayName(_:)();
}

uint64_t sub_1000CB740()
{
  return WidgetConfiguration._containerBackgroundRemovable(_:)();
}

uint64_t sub_1000CB750()
{
  return WidgetConfiguration.enableContentMarginsForFirstParty(_:)();
}

uint64_t sub_1000CB760()
{
  return static WidgetConfiguration._makeWidgetConfiguration(widget:inputs:)();
}

uint64_t sub_1000CB770()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_1000CB780()
{
  return static AccessibilityChildBehavior.ignore.getter();
}

uint64_t sub_1000CB790()
{
  return static AccessibilityChildBehavior.combine.getter();
}

uint64_t sub_1000CB7A0()
{
  return type metadata accessor for AccessibilityChildBehavior();
}

uint64_t sub_1000CB7B0()
{
  return static ContainerBackgroundPlacement.widget.getter();
}

uint64_t sub_1000CB7C0()
{
  return type metadata accessor for ContainerBackgroundPlacement();
}

uint64_t sub_1000CB7D0()
{
  return type metadata accessor for AccessibilityAttachmentModifier();
}

uint64_t sub_1000CB7E0()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_1000CB7F0()
{
  return static Edge.Set.horizontal.getter();
}

uint64_t sub_1000CB800()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_1000CB810()
{
  return static Edge.Set.top.getter();
}

uint64_t sub_1000CB820()
{
  return static Font.Weight.bold.getter();
}

uint64_t sub_1000CB830()
{
  return static Font.Weight.heavy.getter();
}

uint64_t sub_1000CB840()
{
  return static Font.Weight.semibold.getter();
}

uint64_t sub_1000CB850()
{
  return type metadata accessor for Font.Leading();
}

uint64_t sub_1000CB860()
{
  return static Font.callout.getter();
}

uint64_t sub_1000CB870()
{
  return static Font.caption.getter();
}

uint64_t sub_1000CB880()
{
  return Font.leading(_:)();
}

uint64_t sub_1000CB890()
{
  return static Font.footnote.getter();
}

uint64_t sub_1000CB8A0()
{
  return type metadata accessor for Font.TextStyle();
}

uint64_t sub_1000CB8B0()
{
  return Font.init(_:)();
}

uint64_t sub_1000CB8C0()
{
  return Link.init(destination:label:)();
}

uint64_t sub_1000CB8D0()
{
  return Link.init(sensitiveUrl:label:)();
}

uint64_t sub_1000CB8E0()
{
  return Text.fontWeight(_:)();
}

uint64_t sub_1000CB8F0()
{
  return type metadata accessor for Text.TruncationMode();
}

uint64_t sub_1000CB900()
{
  return Text.foregroundColor(_:)();
}

uint64_t sub_1000CB910()
{
  return Text.foregroundStyle<A>(_:)();
}

uint64_t sub_1000CB920()
{
  return Text.typesettingLanguage(_:isEnabled:)();
}

uint64_t sub_1000CB930()
{
  return type metadata accessor for Text.Case();
}

uint64_t sub_1000CB940()
{
  return Text.font(_:)();
}

uint64_t sub_1000CB950()
{
  return Text.shadow(color:radius:x:y:)();
}

uint64_t sub_1000CB960()
{
  return Text.tracking(_:)();
}

uint64_t sub_1000CB970()
{
  return type metadata accessor for Text.DateStyle.UnitsConfiguration.Style();
}

uint64_t sub_1000CB980()
{
  return Text.DateStyle.UnitsConfiguration.init(units:style:)();
}

uint64_t sub_1000CB990()
{
  return type metadata accessor for Text.DateStyle.UnitsConfiguration();
}

uint64_t sub_1000CB9A0()
{
  return static Text.DateStyle.relative(unitConfiguration:)();
}

uint64_t sub_1000CB9B0()
{
  return type metadata accessor for Text.DateStyle();
}

uint64_t sub_1000CB9C0()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_1000CB9D0()
{
  return Text.init<A>(_:)();
}

uint64_t sub_1000CB9E0()
{
  return View.widgetAccentable(_:)();
}

uint64_t sub_1000CB9F0()
{
  return View.widgetURL(_:)();
}

uint64_t sub_1000CBA00()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_1000CBA10()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_1000CBA20()
{
  return View.unredacted()();
}

uint64_t sub_1000CBA30()
{
  return View.accessibility(label:)();
}

uint64_t sub_1000CBA40()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_1000CBA50()
{
  return View.accessibilityLabel(_:)();
}

uint64_t sub_1000CBA60()
{
  return View.accessibilityLabel<A>(_:)();
}

uint64_t sub_1000CBA70()
{
  return View.accessibilityHidden(_:)();
}

uint64_t sub_1000CBA80()
{
  return View.containerBackground<A>(for:alignment:content:)();
}

uint64_t sub_1000CBA90()
{
  return View.typesettingLanguage(_:isEnabled:)();
}

uint64_t sub_1000CBAA0()
{
  return View.accessibilityElement(children:)();
}

uint64_t sub_1000CBAB0()
{
  return View.accessibilityAddTraits(_:)();
}

uint64_t sub_1000CBAC0()
{
  return View.frame(width:height:alignment:)();
}

uint64_t sub_1000CBAD0()
{
  return View.position(x:y:)();
}

uint64_t sub_1000CBAE0()
{
  return View.redacted(reason:)();
}

uint64_t sub_1000CBAF0()
{
  return View.clipShape<A>(_:style:)();
}

uint64_t sub_1000CBB00()
{
  return type metadata accessor for Color.RGBColorSpace();
}

uint64_t sub_1000CBB10()
{
  return static Color.gray.getter();
}

uint64_t sub_1000CBB20()
{
  return static Color.pink.getter();
}

uint64_t sub_1000CBB30()
{
  return static Color.black.getter();
}

uint64_t sub_1000CBB40()
{
  return static Color.clear.getter();
}

uint64_t sub_1000CBB50()
{
  return static Color.green.getter();
}

uint64_t sub_1000CBB60()
{
  return static Color.white.getter();
}

uint64_t sub_1000CBB70()
{
  return Color.opacity(_:)();
}

uint64_t sub_1000CBB80()
{
  return static Color.primary.getter();
}

uint64_t sub_1000CBB90()
{
  return static Color.secondary.getter();
}

uint64_t sub_1000CBBA0()
{
  return Color.init(_:red:green:blue:opacity:)();
}

uint64_t sub_1000CBBB0()
{
  return Color.init(_:)();
}

uint64_t sub_1000CBBC0()
{
  return Image.init(uiImage:)();
}

uint64_t sub_1000CBBD0()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t sub_1000CBBE0()
{
  return Image.renderingMode(_:)();
}

uint64_t sub_1000CBBF0()
{
  return Image.init(_internalSystemName:)();
}

uint64_t sub_1000CBC00()
{
  return type metadata accessor for Image.TemplateRenderingMode();
}

uint64_t sub_1000CBC10()
{
  return type metadata accessor for Image.Scale();
}

uint64_t sub_1000CBC20()
{
  return Image.widgetAccentedRenderingMode(_:)();
}

uint64_t sub_1000CBC30()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t sub_1000CBC40()
{
  return State.init(wrappedValue:)();
}

uint64_t sub_1000CBC50()
{
  return State.wrappedValue.getter();
}

uint64_t sub_1000CBC60()
{
  return State.wrappedValue.setter();
}

uint64_t sub_1000CBC70()
{
  return AnyView.init<A>(_:)();
}

uint64_t sub_1000CBC80()
{
  return type metadata accessor for Capsule();
}

uint64_t sub_1000CBC90()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t sub_1000CBCA0()
{
  return ForEach<>.init(_:content:)();
}

uint64_t sub_1000CBCB0()
{
  return Gradient.Stop.init(color:location:)();
}

uint64_t sub_1000CBCC0()
{
  return Gradient.init(stops:)();
}

uint64_t sub_1000CBCD0()
{
  return Gradient.init(colors:)();
}

uint64_t sub_1000CBCE0()
{
  return static Alignment.topLeading.getter();
}

uint64_t sub_1000CBCF0()
{
  return static Alignment.topTrailing.getter();
}

uint64_t sub_1000CBD00()
{
  return static Alignment.top.getter();
}

uint64_t sub_1000CBD10()
{
  return static Alignment.bottom.getter();
}

uint64_t sub_1000CBD20()
{
  return static Alignment.center.getter();
}

uint64_t sub_1000CBD30()
{
  return static UnitPoint.top.getter();
}

uint64_t sub_1000CBD40()
{
  return static UnitPoint.bottom.getter();
}

uint64_t sub_1000CBD50()
{
  return type metadata accessor for DispatchTimeInterval();
}

uint64_t sub_1000CBD60()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_1000CBD70()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_1000CBD80()
{
  return static DispatchQoS.userInitiated.getter();
}

uint64_t sub_1000CBD90()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_1000CBDA0()
{
  return static DispatchTime.now()();
}

uint64_t sub_1000CBDB0()
{
  return DispatchTime.rawValue.getter();
}

uint64_t sub_1000CBDC0()
{
  return type metadata accessor for DispatchTime();
}

uint64_t sub_1000CBDD0()
{
  return DispatchWorkItem.init(flags:block:)();
}

uint64_t sub_1000CBDE0()
{
  return type metadata accessor for DispatchWorkItem();
}

uint64_t sub_1000CBDF0()
{
  return + infix(_:_:)();
}

uint64_t sub_1000CBE00()
{
  return FeedScoredItem.identifier.getter();
}

uint64_t sub_1000CBE10()
{
  return FeedScoredItem.scoreProfile.getter();
}

uint64_t sub_1000CBE20()
{
  return FeedScoredItem.item.getter();
}

uint64_t sub_1000CBE30()
{
  return type metadata accessor for FeedScoredItem();
}

uint64_t sub_1000CBE40()
{
  return dispatch thunk of HashFunction.update(bufferPointer:)();
}

uint64_t sub_1000CBE50()
{
  return dispatch thunk of HashFunction.finalize()();
}

uint64_t sub_1000CBE60()
{
  return dispatch thunk of HashFunction.init()();
}

uint64_t sub_1000CBE70()
{
  return static SHA256Digest.byteCount.getter();
}

uint64_t sub_1000CBE80()
{
  return type metadata accessor for SHA256Digest();
}

uint64_t sub_1000CBE90()
{
  return type metadata accessor for SHA256();
}

uint64_t sub_1000CBEA0()
{
  return InternalWidgetFamily.init(rawValue:)();
}

uint64_t sub_1000CBEB0()
{
  return InternalWidgetFamily.rawValue.getter();
}

uint64_t sub_1000CBEC0()
{
  return type metadata accessor for InternalWidgetFamily();
}

uint64_t sub_1000CBED0()
{
  return static WidgetRenderingMode.== infix(_:_:)();
}

uint64_t sub_1000CBEE0()
{
  return static WidgetRenderingMode.accented.getter();
}

uint64_t sub_1000CBEF0()
{
  return type metadata accessor for WidgetRenderingMode();
}

uint64_t sub_1000CBF00()
{
  return static WidgetAccentedRenderingMode.desaturated.getter();
}

uint64_t sub_1000CBF10()
{
  return static WidgetAccentedRenderingMode.fullColor.getter();
}

uint64_t sub_1000CBF20()
{
  return type metadata accessor for WidgetAccentedRenderingMode();
}

uint64_t sub_1000CBF30()
{
  return WidgetInfo.configuration.getter();
}

uint64_t sub_1000CBF40()
{
  return WidgetInfo.internalFamily.getter();
}

uint64_t sub_1000CBF50()
{
  return WidgetInfo.kind.getter();
}

uint64_t sub_1000CBF60()
{
  return type metadata accessor for WidgetInfo();
}

uint64_t sub_1000CBF70()
{
  return static WidgetCenter.Private_Timeouts.timeline.getter();
}

uint64_t sub_1000CBF80()
{
  return dispatch thunk of WidgetCenter.reloadAllTimelines()();
}

uint64_t sub_1000CBF90()
{
  return dispatch thunk of WidgetCenter.getCurrentConfigurations(_:)();
}

uint64_t sub_1000CBFA0()
{
  return static WidgetCenter.shared.getter();
}

uint64_t sub_1000CBFB0()
{
  return type metadata accessor for WidgetCenter();
}

uint64_t sub_1000CBFC0()
{
  return type metadata accessor for WidgetFamily();
}

uint64_t sub_1000CBFD0()
{
  return TimelineEntry.relevance.getter();
}

uint64_t sub_1000CBFE0()
{
  return IntentConfiguration.init<A>(kind:intent:provider:content:)();
}

uint64_t sub_1000CBFF0()
{
  return type metadata accessor for IntentConfiguration();
}

uint64_t sub_1000CC000()
{
  return static TimelineReloadPolicy.after(_:jitteredUpTo:)();
}

uint64_t sub_1000CC010()
{
  return type metadata accessor for TimelineReloadPolicy();
}

uint64_t sub_1000CC020()
{
  return dispatch thunk of IntentTimelineProvider.placeholder(in:)();
}

uint64_t sub_1000CC030()
{
  return dispatch thunk of IntentTimelineProvider.recommendations()();
}

uint64_t sub_1000CC050()
{
  return IntentTimelineProvider.recommendations()();
}

uint64_t sub_1000CC070()
{
  return TimelineProviderContext.displaySize.getter();
}

uint64_t sub_1000CC080()
{
  return TimelineProviderContext.internalFamily.getter();
}

uint64_t sub_1000CC090()
{
  return type metadata accessor for TimelineProviderContext.EnvironmentVariants();
}

uint64_t sub_1000CC0A0()
{
  return TimelineProviderContext.EnvironmentVariants.subscript.getter();
}

uint64_t sub_1000CC0B0()
{
  return TimelineProviderContext.environmentVariants.getter();
}

uint64_t sub_1000CC0C0()
{
  return TimelineProviderContext.isPreview.getter();
}

uint64_t sub_1000CC0D0()
{
  return type metadata accessor for TimelineProviderContext();
}

uint64_t sub_1000CC0E0()
{
  return Timeline.init(entries:policy:)();
}

uint64_t sub_1000CC0F0()
{
  return Array.init()();
}

NSDictionary sub_1000CC100()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_1000CC110()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000CC120()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_1000CC130()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t sub_1000CC140()
{
  return Character.write<A>(to:)();
}

uint64_t sub_1000CC150()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t sub_1000CC160()
{
  return dispatch thunk of static Comparable.< infix(_:_:)();
}

uint64_t sub_1000CC170()
{
  return dispatch thunk of static Comparable.>= infix(_:_:)();
}

uint64_t sub_1000CC180()
{
  return dispatch thunk of static Comparable.<= infix(_:_:)();
}

uint64_t sub_1000CC190()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t sub_1000CC1A0()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_1000CC1B0()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString sub_1000CC1C0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_1000CC1D0()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_1000CC1E0()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_1000CC1F0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000CC200()
{
  return String.data(using:allowLossyConversion:)();
}

uint64_t sub_1000CC210()
{
  return static String.Encoding.utf8.getter();
}

uint64_t sub_1000CC220()
{
  return type metadata accessor for String.Encoding();
}

uint64_t sub_1000CC230()
{
  return String.init(localized:table:bundle:locale:comment:)();
}

uint64_t sub_1000CC240()
{
  return String.init<A>(describing:)();
}

uint64_t sub_1000CC250()
{
  return static String._fromSubstring(_:)();
}

uint64_t sub_1000CC260()
{
  return static String._uncheckedFromUTF8(_:)();
}

uint64_t sub_1000CC270()
{
  return String.hash(into:)();
}

uint64_t sub_1000CC280()
{
  return String.count.getter();
}

uint64_t sub_1000CC290()
{
  return String.index(_:offsetBy:limitedBy:)();
}

uint64_t sub_1000CC2A0()
{
  return String.index(_:offsetBy:)();
}

void sub_1000CC2B0(Swift::String a1)
{
}

Swift::Int sub_1000CC2C0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_1000CC2D0()
{
  return String.UTF8View._foreignIndex(after:)();
}

uint64_t sub_1000CC2E0()
{
  return String.UTF8View._foreignIndex(_:offsetBy:)();
}

uint64_t sub_1000CC300()
{
  return String.UTF8View._foreignSubscript(position:)();
}

uint64_t sub_1000CC310()
{
  return String.UTF16View.index(_:offsetBy:)();
}

BOOL sub_1000CC320(Swift::String a1)
{
  return String.hasPrefix(_:)(a1);
}

uint64_t sub_1000CC330()
{
  return String.subscript.getter();
}

uint64_t sub_1000CC340()
{
  return String.init<A>(_:)();
}

uint64_t sub_1000CC350()
{
  return String.subscript.getter();
}

uint64_t sub_1000CC360()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t sub_1000CC370()
{
  return RawRepresentable<>.encode(to:)();
}

uint64_t sub_1000CC380()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t sub_1000CC390()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_1000CC3A0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_1000CC3B0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000CC3C0()
{
  return Array.description.getter();
}

uint64_t sub_1000CC3D0()
{
  return specialized Array._endMutation()();
}

uint64_t sub_1000CC3E0()
{
  return Array.mapToDictionary<A>(_:)();
}

uint64_t sub_1000CC3F0()
{
  return Array._checkSubscript(_:wasNativeTypeChecked:)();
}

uint64_t sub_1000CC400()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_1000CC410()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

BOOL sub_1000CC420()
{
  return Array._hoistableIsNativeTypeChecked()();
}

uint64_t sub_1000CC430()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_1000CC440()
{
  return Array.append(_:)();
}

uint64_t sub_1000CC450()
{
  return Array.endIndex.getter();
}

void sub_1000CC460(Swift::Bool keepingCapacity)
{
}

uint64_t sub_1000CC470()
{
  return type metadata accessor for Array();
}

uint64_t sub_1000CC480()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_1000CC490()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_1000CC4A0()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_1000CC4C0()
{
  return Set.description.getter();
}

uint64_t sub_1000CC4D0()
{
  return Set.init(minimumCapacity:)();
}

uint64_t sub_1000CC4E0()
{
  return Collection.isEmpty.getter();
}

uint64_t sub_1000CC4F0()
{
  return NSOrderedSet.makeIterator()();
}

uint64_t sub_1000CC500()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_1000CC510()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_1000CC520()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_1000CC530()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_1000CC540()
{
  return static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)();
}

uint64_t sub_1000CC550()
{
  return OS_dispatch_group.notify(qos:flags:queue:execute:)();
}

uint64_t sub_1000CC560()
{
  return OS_dispatch_group.notify(queue:work:)();
}

uint64_t sub_1000CC570()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t sub_1000CC580()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_1000CC590()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_1000CC5A0()
{
  return OS_dispatch_queue.sync<A>(execute:)();
}

uint64_t sub_1000CC5B0()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_1000CC5C0()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t sub_1000CC5D0()
{
  return static UIFont.preferredFont(for:weight:)();
}

uint64_t sub_1000CC5E0()
{
  return UIColor.legibleForeground.getter();
}

uint64_t sub_1000CC5F0()
{
  return static UIColor.darkLightLuminanceThreshold.getter();
}

uint64_t sub_1000CC600()
{
  return UIImage.croppedImage(of:with:scale:byRoundingCorners:cornerRadius:)();
}

Swift::Int sub_1000CC610(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_1000CC620()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_1000CC630()
{
  return static OS_os_log.default.getter();
}

uint64_t sub_1000CC640()
{
  return type metadata accessor for Optional();
}

uint64_t sub_1000CC650()
{
  return dispatch thunk of IteratorProtocol.next()();
}

uint64_t sub_1000CC660()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_1000CC670()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_1000CC680()
{
  return StringProtocol.localizedUppercase.getter();
}

uint64_t sub_1000CC690()
{
  return StringProtocol.localizedCapitalized.getter();
}

uint64_t sub_1000CC6A0()
{
  return StringProtocol.contains<A>(_:)();
}

uint64_t sub_1000CC6B0()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_1000CC6C0()
{
  return dispatch thunk of SetAlgebra.isSuperset(of:)();
}

uint64_t sub_1000CC6D0()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_1000CC6E0()
{
  return _HashTable.previousHole(before:)();
}

uint64_t sub_1000CC6F0()
{
  return _HashTable.nextHole(atOrAfter:)();
}

Swift::Int sub_1000CC700(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_1000CC710()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_1000CC720()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_1000CC730()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_1000CC740()
{
  return static _SetStorage.allocate(capacity:)();
}

void sub_1000CC750(Swift::Int a1)
{
}

uint64_t sub_1000CC760()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_1000CC770()
{
  return _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_1000CC780()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_1000CC790()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_1000CC7A0()
{
  return DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
}

uint64_t sub_1000CC7B0()
{
  return type metadata accessor for DecodingError();
}

uint64_t sub_1000CC7C0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_1000CC7D0()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_1000CC7E0()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_1000CC7F0()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_1000CC800()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_1000CC810()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_1000CC820()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_1000CC830()
{
  return CodingUserInfoKey.init(rawValue:)();
}

uint64_t sub_1000CC840()
{
  return type metadata accessor for CodingUserInfoKey();
}

uint64_t sub_1000CC850()
{
  return __CocoaDictionary.lookup(_:)();
}

uint64_t sub_1000CC860()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1000CC870()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1000CC880()
{
  return _bridgeCocoaArray<A>(_:)();
}

uint64_t sub_1000CC890()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_1000CC8A0()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_1000CC8B0()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_1000CC8C0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_1000CC8D0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_1000CC8E0()
{
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()();
}

Swift::Int sub_1000CC8F0(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_1000CC900()
{
  return KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t sub_1000CC910()
{
  return KeyedDecodingContainer.codingPath.getter();
}

uint64_t sub_1000CC920()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t sub_1000CC930()
{
  return KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
}

uint64_t sub_1000CC940()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_1000CC950()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_1000CC960()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_1000CC970()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_1000CC980()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t sub_1000CC990()
{
  return KeyedDecodingContainer.allKeys.getter();
}

uint64_t sub_1000CC9A0()
{
  return KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t sub_1000CC9B0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_1000CC9C0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_1000CC9D0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_1000CC9E0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_1000CC9F0()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

Swift::Int sub_1000CCA10(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t sub_1000CCA20()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_1000CCA30()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_1000CCA40()
{
  return dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
}

uint64_t sub_1000CCA50()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_1000CCA60()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_1000CCA70()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_1000CCA80()
{
  return Error._code.getter();
}

uint64_t sub_1000CCA90()
{
  return Error._domain.getter();
}

uint64_t sub_1000CCAA0()
{
  return Error._userInfo.getter();
}

uint64_t sub_1000CCAC0()
{
  return Hasher.init(_seed:)();
}

void sub_1000CCAD0(Swift::UInt a1)
{
}

void sub_1000CCAE0(Swift::UInt64 a1)
{
}

Swift::Int sub_1000CCAF0()
{
  return Hasher._finalize()();
}

uint64_t sub_1000CCB00()
{
  return dispatch thunk of Decoder.userInfo.getter();
}

uint64_t sub_1000CCB10()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_1000CCB20()
{
  return dispatch thunk of Encoder.userInfo.getter();
}

uint64_t sub_1000CCB30()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t CCBigNumCompare()
{
  return _CCBigNumCompare();
}

uint64_t CCBigNumDiv()
{
  return _CCBigNumDiv();
}

uint64_t CCBigNumFree()
{
  return _CCBigNumFree();
}

uint64_t CCBigNumFromData()
{
  return _CCBigNumFromData();
}

uint64_t CCBigNumFromDecimalString()
{
  return _CCBigNumFromDecimalString();
}

uint64_t CCBigNumFromHexString()
{
  return _CCBigNumFromHexString();
}

uint64_t CCBigNumMulI()
{
  return _CCBigNumMulI();
}

uint64_t CCCreateBigNum()
{
  return _CCCreateBigNum();
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  return _CFDateGetAbsoluteTime(theDate);
}

CGContextRef CGBitmapContextCreateWithData(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo, CGBitmapContextReleaseDataCallback releaseCallback, void *releaseInfo)
{
  return _CGBitmapContextCreateWithData(data, width, height, bitsPerComponent, bytesPerRow, space, bitmapInfo, releaseCallback, releaseInfo);
}

CGBitmapInfo CGBitmapContextGetBitmapInfo(CGContextRef context)
{
  return _CGBitmapContextGetBitmapInfo(context);
}

size_t CGBitmapContextGetBytesPerRow(CGContextRef context)
{
  return _CGBitmapContextGetBytesPerRow(context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return _CGBitmapContextGetData(context);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return _CGBitmapContextGetHeight(context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return _CGBitmapContextGetWidth(context);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return _CGColorCreate(space, components);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return _CGColorGetColorSpace(color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return _CGColorGetComponents(color);
}

void CGColorRelease(CGColorRef color)
{
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return _CGColorSpaceCreateDeviceRGB();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return _CGColorSpaceCreateWithName(name);
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return _CGColorSpaceGetModel(space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGImageRef CGImageCreateCopyWithColorSpace(CGImageRef image, CGColorSpaceRef space)
{
  return _CGImageCreateCopyWithColorSpace(image, space);
}

void CGImageRelease(CGImageRef image)
{
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return _CGRectContainsRect(rect1, rect2);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CGRect CTFontGetBoundingRectsForGlyphs(CTFontRef font, CTFontOrientation orientation, const CGGlyph *glyphs, CGRect *boundingRects, CFIndex count)
{
  return _CTFontGetBoundingRectsForGlyphs(font, orientation, glyphs, boundingRects, count);
}

BOOL CTFontGetGlyphsForCharacters(CTFontRef font, const UniChar *characters, CGGlyph *glyphs, CFIndex count)
{
  return _CTFontGetGlyphsForCharacters(font, characters, glyphs, count);
}

uint64_t FCBundle()
{
  return _FCBundle();
}

uint64_t FCCheckedProtocolCast()
{
  return _FCCheckedProtocolCast();
}

uint64_t FCClamp()
{
  return _FCClamp();
}

uint64_t FCDispatchQueueForQualityOfService()
{
  return _FCDispatchQueueForQualityOfService();
}

uint64_t FCDynamicCast()
{
  return _FCDynamicCast();
}

uint64_t FCHandleOperationTimeout()
{
  return _FCHandleOperationTimeout();
}

uint64_t FCMix()
{
  return _FCMix();
}

uint64_t FCPerformBlockOnMainThread()
{
  return _FCPerformBlockOnMainThread();
}

uint64_t FCProtocolCast()
{
  return _FCProtocolCast();
}

uint64_t FCSecondsToMilliseconds()
{
  return _FCSecondsToMilliseconds();
}

uint64_t FCURLForContainerizedUserAccountCachesDirectory()
{
  return _FCURLForContainerizedUserAccountCachesDirectory();
}

uint64_t FCURLForContainerizedUserAccountDocumentDirectory()
{
  return _FCURLForContainerizedUserAccountDocumentDirectory();
}

uint64_t FCURLForLegacyWidgetReferralItems()
{
  return _FCURLForLegacyWidgetReferralItems();
}

uint64_t FCURLForTodayPersonalizationUpdateStore()
{
  return _FCURLForTodayPersonalizationUpdateStore();
}

uint64_t FCURLForWidgetReferralItems()
{
  return _FCURLForWidgetReferralItems();
}

uint64_t FCUUIDStringToUUIDBytes()
{
  return _FCUUIDStringToUUIDBytes();
}

uint64_t NDDownloadServiceXPCConnection()
{
  return _NDDownloadServiceXPCConnection();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t NSSNewsTagWidgetPlaceholderName()
{
  return _NSSNewsTagWidgetPlaceholderName();
}

uint64_t NTDeleteOnDiskAssets()
{
  return _NTDeleteOnDiskAssets();
}

uint64_t NewsCoreUserDefaults()
{
  return _NewsCoreUserDefaults();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return _UIAccessibilityIsReduceTransparencyEnabled();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return _UIGraphicsGetImageFromCurrentImageContext();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return _UIImagePNGRepresentation(image);
}

void UIRectFill(CGRect rect)
{
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
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

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return ___cxa_allocate_exception(thrown_size);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

uint64_t _availability_version_check()
{
  return __availability_version_check();
}

{
}

{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
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

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

float fmodf(float a1, float a2)
{
  return _fmodf(a1, a2);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fread(__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return _fseek(a1, a2, a3);
}

uint64_t ftell(FILE *a1)
{
  return _ftell(a1);
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

long double pow(long double __x, long double __y)
{
  return _pow(__x, __y);
}

void rewind(FILE *a1)
{
}

int sscanf(const char *a1, const char *a2, ...)
{
  return _sscanf(a1, a2);
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

uint64_t swift_checkMetadataState()
{
  return _swift_checkMetadataState();
}

uint64_t swift_conformsToProtocol2()
{
  return _swift_conformsToProtocol2();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return _swift_dynamicCastObjCProtocolConditional();
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

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
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

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
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

uint64_t swift_getOpaqueTypeMetadata2()
{
  return _swift_getOpaqueTypeMetadata2();
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

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
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

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRelease_n()
{
  return _swift_unknownObjectRelease_n();
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

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return _[a1 CGColor];
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return _[a1 CGImage];
}

id objc_msgSend_CTRByPersonalizationFeatureID(void *a1, const char *a2, ...)
{
  return _[a1 CTRByPersonalizationFeatureID];
}

id objc_msgSend_JSONArray(void *a1, const char *a2, ...)
{
  return _[a1 JSONArray];
}

id objc_msgSend_NewsURL(void *a1, const char *a2, ...)
{
  return _[a1 NewsURL];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return [a1 URLByAppendingPathComponent:];
}

id objc_msgSend_URLByAppendingPathComponent_isDirectory_(void *a1, const char *a2, ...)
{
  return [a1 URLByAppendingPathComponent:isDirectory:];
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return [a1 URLWithString:];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend__annotateEvent_withTrackableWidgetState_(void *a1, const char *a2, ...)
{
  return [a1 _annotateEvent:withTrackableWidgetState:];
}

id objc_msgSend__eventTrackersRespondingToSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_eventTrackersRespondingToSelector:");
}

id objc_msgSend__getHSBA_(void *a1, const char *a2, ...)
{
  return [a1 _getHSBA];
}

id objc_msgSend__getRGBA_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getRGBA:");
}

id objc_msgSend__isSimilarToColor_withinPercentage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isSimilarToColor:withinPercentage:");
}

id objc_msgSend__luminance(void *a1, const char *a2, ...)
{
  return _[a1 _luminance];
}

id objc_msgSend__newWidgetEngagementWithTrackableWidgetState_(void *a1, const char *a2, ...)
{
  return [a1 _newWidgetEngagementWithTrackableWidgetState:];
}

id objc_msgSend__pbDisplayModeWithDisplayMode_(void *a1, const char *a2, ...)
{
  return [a1 _pbDisplayModeWithDisplayMode:];
}

id objc_msgSend__pbStackLocationWithStackLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pbStackLocationWithStackLocation:");
}

id objc_msgSend__pbWidgetTypeWithStackKind_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pbWidgetTypeWithStackKind:");
}

id objc_msgSend__registerOnceVisibleHeadlines_withLastSeenDate_minimumNumberOfTimesPreseenToBeSeen_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_registerOnceVisibleHeadlines:withLastSeenDate:minimumNumberOfTimesPreseenToBeSeen:");
}

id objc_msgSend__shouldReportEventWithTodayResults_fetchInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldReportEventWithTodayResults:fetchInfo:");
}

id objc_msgSend__shouldReportEventWithTrackableWidgetState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldReportEventWithTrackableWidgetState:");
}

id objc_msgSend__trackWidgetLingerEventWithEndTodaySource_endAppConfigTreatmentID_endWidgetDisplayMode_endAppearanceType_endPropertiesChanged_lingerInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_trackWidgetLingerEventWithEndTodaySource:endAppConfigTreatmentID:endWidgetDisplayMode:endAppearanceType:endPropertiesChanged:lingerInterval:");
}

id objc_msgSend__widgetEngagementForHeadline_inSection_withTrackableWidgetState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_widgetEngagementForHeadline:inSection:withTrackableWidgetState:");
}

id objc_msgSend_abbreviation(void *a1, const char *a2, ...)
{
  return _[a1 abbreviation];
}

id objc_msgSend_absoluteItemCountForCurrentDisplayMode(void *a1, const char *a2, ...)
{
  return _[a1 absoluteItemCountForCurrentDisplayMode];
}

id objc_msgSend_absoluteOrderOfItem_(void *a1, const char *a2, ...)
{
  return [a1 absoluteOrderOfItem:];
}

id objc_msgSend_absoluteOrderOfItemInSection_(void *a1, const char *a2, ...)
{
  return [a1 absoluteOrderOfItemInSection:];
}

id objc_msgSend_absoluteOrderOfSection_(void *a1, const char *a2, ...)
{
  return [a1 absoluteOrderOfSection:];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _[a1 absoluteString];
}

id objc_msgSend_accumulator(void *a1, const char *a2, ...)
{
  return _[a1 accumulator];
}

id objc_msgSend_activeDisplayMode(void *a1, const char *a2, ...)
{
  return _[a1 activeDisplayMode];
}

id objc_msgSend_addCountOfArticlesExposedEachSection_(void *a1, const char *a2, ...)
{
  return [a1 addCountOfArticlesExposedEachSection:];
}

id objc_msgSend_addEvents_(void *a1, const char *a2, ...)
{
  return [a1 addEvents:];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return [a1 addObjectsFromArray:];
}

id objc_msgSend_addWidgetPersonalizationFeatureCTRPair_(void *a1, const char *a2, ...)
{
  return [a1 addWidgetPersonalizationFeatureCTRPair];
}

id objc_msgSend_allItemsCount(void *a1, const char *a2, ...)
{
  return _[a1 allItemsCount];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_analyticsElement(void *a1, const char *a2, ...)
{
  return _[a1 analyticsElement];
}

id objc_msgSend_analyzeImage_(void *a1, const char *a2, ...)
{
  return [a1 analyzeImage:];
}

id objc_msgSend_annotateEvent_withOptions_(void *a1, const char *a2, ...)
{
  return [a1 annotateEvent:withOptions:];
}

id objc_msgSend_annotateSession_withOptions_(void *a1, const char *a2, ...)
{
  return [a1 annotateSession:withOptions:];
}

id objc_msgSend_appConfigTreatmentID(void *a1, const char *a2, ...)
{
  return _[a1 appConfigTreatmentID];
}

id objc_msgSend_appearanceType(void *a1, const char *a2, ...)
{
  return _[a1 appearanceType];
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return [a1 appendFormat:];
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return [a1 appendString:];
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return [a1 archivedDataWithRootObject:requiringSecureCoding:error:];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithArray:];
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:count:];
}

id objc_msgSend_articleID(void *a1, const char *a2, ...)
{
  return _[a1 articleID];
}

id objc_msgSend_articleRecordData(void *a1, const char *a2, ...)
{
  return _[a1 articleRecordData];
}

id objc_msgSend_asChannel(void *a1, const char *a2, ...)
{
  return _[a1 asChannel];
}

id objc_msgSend_assetHandleForCKAssetURL_lifetimeHint_(void *a1, const char *a2, ...)
{
  return [a1 assetHandleForCKAssetURL:lifetimeHint:];
}

id objc_msgSend_assetHandles(void *a1, const char *a2, ...)
{
  return _[a1 assetHandles];
}

id objc_msgSend_assetManager(void *a1, const char *a2, ...)
{
  return _[a1 assetManager];
}

id objc_msgSend_availabilityMonitor(void *a1, const char *a2, ...)
{
  return _[a1 availabilityMonitor];
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 backgroundColor];
}

id objc_msgSend_backingElement(void *a1, const char *a2, ...)
{
  return _[a1 backingElement];
}

id objc_msgSend_banner(void *a1, const char *a2, ...)
{
  return _[a1 banner];
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 base64EncodedStringWithOptions:];
}

id objc_msgSend_baseNewsURL(void *a1, const char *a2, ...)
{
  return _[a1 baseNewsURL];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return _[a1 blackColor];
}

id objc_msgSend_blue(void *a1, const char *a2, ...)
{
  return _[a1 blue];
}

id objc_msgSend_cellularRadioAccessTechnology(void *a1, const char *a2, ...)
{
  return _[a1 cellularRadioAccessTechnology];
}

id objc_msgSend_channelID(void *a1, const char *a2, ...)
{
  return _[a1 channelID];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_color_isCloseToOtherColor_(void *a1, const char *a2, ...)
{
  return [a1 color:isCloseToOtherColor:];
}

id objc_msgSend_colorWithAlphaComponent_(void *a1, const char *a2, ...)
{
  return [a1 colorWithAlphaComponent:];
}

id objc_msgSend_colorWithCGColor_(void *a1, const char *a2, ...)
{
  return [a1 colorWithCGColor:];
}

id objc_msgSend_colorWithDynamicProvider_(void *a1, const char *a2, ...)
{
  return [a1 colorWithDynamicProvider:];
}

id objc_msgSend_colorWithRed_green_blue_alpha_(void *a1, const char *a2, ...)
{
  return [a1 colorWithRed:green:blue:alpha:];
}

id objc_msgSend_colorWithWhite_alpha_(void *a1, const char *a2, ...)
{
  return [a1 colorWithWhite:alpha:];
}

id objc_msgSend_components_fromDate_(void *a1, const char *a2, ...)
{
  return [a1 components:fromDate:];
}

id objc_msgSend_componentsInTimeZone_fromDate_(void *a1, const char *a2, ...)
{
  return [a1 componentsInTimeZone:fromDate:];
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return [a1 componentsSeparatedByString:];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return [a1 containsObject:];
}

id objc_msgSend_contentID(void *a1, const char *a2, ...)
{
  return _[a1 contentID];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return [a1 copyItemAtURL:toURL:error:];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return [a1 countByEnumeratingWithState:objects:count:];
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return [a1 createDirectoryAtURL:withIntermediateDirectories:attributes:error:];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return _[a1 currentCalendar];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _[a1 currentDevice];
}

id objc_msgSend_currentSession(void *a1, const char *a2, ...)
{
  return _[a1 currentSession];
}

id objc_msgSend_currentTraitCollection(void *a1, const char *a2, ...)
{
  return _[a1 currentTraitCollection];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _[a1 data];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateFromComponents_(void *a1, const char *a2, ...)
{
  return [a1 dateFromComponents:];
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeObjectOfClasses:forKey:];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithDictionary:];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_dominantColors(void *a1, const char *a2, ...)
{
  return _[a1 dominantColors];
}

id objc_msgSend_downloadError(void *a1, const char *a2, ...)
{
  return _[a1 downloadError];
}

id objc_msgSend_downloadIfNeededWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 downloadIfNeededWithCompletion:];
}

id objc_msgSend_enableFlushingWithFlushingThreshold_(void *a1, const char *a2, ...)
{
  return [a1 enableFlushingWithFlushingThreshold:];
}

id objc_msgSend_encodableElement(void *a1, const char *a2, ...)
{
  return _[a1 encodableElement];
}

id objc_msgSend_encodableElementClass(void *a1, const char *a2, ...)
{
  return _[a1 encodableElementClass];
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 encodeObject:forKey:];
}

id objc_msgSend_encodeQueryValueWithError_(void *a1, const char *a2, ...)
{
  return [a1 encodeQueryValueWithError:];
}

id objc_msgSend_engagementWithBackgroundAtDate_withTargetURL_trackableWidgetState_(void *a1, const char *a2, ...)
{
  return [a1 engagementWithBackgroundAtDate:withTargetURL:trackableWidgetState:];
}

id objc_msgSend_engagementWithBannerAtDate_withTargetURL_trackableWidgetState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "engagementWithBannerAtDate:withTargetURL:trackableWidgetState:");
}

id objc_msgSend_engagementWithHeaderAtDate_withTargetURL_trackableWidgetState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "engagementWithHeaderAtDate:withTargetURL:trackableWidgetState:");
}

id objc_msgSend_engagementWithPlaceholderAtDate_withTargetURL_trackableWidgetState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "engagementWithPlaceholderAtDate:withTargetURL:trackableWidgetState:");
}

id objc_msgSend_engagementWithRowAtDate_forHeadline_withTrackableWidgetState_(void *a1, const char *a2, ...)
{
  return [a1 engagementWithRowAtDate:forHeadline:withTrackableWidgetState:];
}

id objc_msgSend_entryID(void *a1, const char *a2, ...)
{
  return _[a1 entryID];
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateKeysAndObjectsUsingBlock:];
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_eventAccumulators(void *a1, const char *a2, ...)
{
  return _[a1 eventAccumulators];
}

id objc_msgSend_eventAnnotator(void *a1, const char *a2, ...)
{
  return _[a1 eventAnnotator];
}

id objc_msgSend_eventTrackers(void *a1, const char *a2, ...)
{
  return _[a1 eventTrackers];
}

id objc_msgSend_eventTrackersProxy(void *a1, const char *a2, ...)
{
  return _[a1 eventTrackersProxy];
}

id objc_msgSend_events(void *a1, const char *a2, ...)
{
  return _[a1 events];
}

id objc_msgSend_exceptionWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 exceptionWithName:reason:userInfo:];
}

id objc_msgSend_extentsOfSections_(void *a1, const char *a2, ...)
{
  return [a1 extentsOfSections:];
}

id objc_msgSend_fc_NewsArticleID(void *a1, const char *a2, ...)
{
  return [a1 fc_NewsArticleID];
}

id objc_msgSend_fc_array_(void *a1, const char *a2, ...)
{
  return [a1 fc_array:];
}

id objc_msgSend_fc_arrayByTransformingWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fc_arrayByTransformingWithBlock:");
}

id objc_msgSend_fc_arrayOfObjectsPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fc_arrayOfObjectsPassingTest:");
}

id objc_msgSend_fc_dictionaryByTransformingValuesWithKeyAndValueBlock_(void *a1, const char *a2, ...)
{
  return [a1 fc_dictionaryByTransformingValuesWithKeyAndValueBlock:];
}

id objc_msgSend_fc_isHardPaywallNewsArticleURL_(void *a1, const char *a2, ...)
{
  return [a1 fc_isHardPaywallNewsArticleURL:];
}

id objc_msgSend_fc_isNewsArticleURL(void *a1, const char *a2, ...)
{
  return [a1 fc_isNewsArticleURL];
}

id objc_msgSend_fc_rotateElementsFromTheIndexOfSelectedItem_(void *a1, const char *a2, ...)
{
  return [a1 fc_rotateElementsFromTheIndexOfSelectedItem:];
}

id objc_msgSend_fc_safelySetObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 fc_safelySetObject:forKey:];
}

id objc_msgSend_fc_safelySetObjectAllowingNil_forKey_(void *a1, const char *a2, ...)
{
  return [a1 fc_safelySetObjectAllowingNil:forKey:];
}

id objc_msgSend_fc_stringWithISO8601Format(void *a1, const char *a2, ...)
{
  return [a1 fc_stringWithISO8601Format];
}

id objc_msgSend_fetchDate(void *a1, const char *a2, ...)
{
  return _[a1 fetchDate];
}

id objc_msgSend_fetchInfoForVisibleResults(void *a1, const char *a2, ...)
{
  return _[a1 fetchInfoForVisibleResults];
}

id objc_msgSend_fileCoordinatedFIFOHost(void *a1, const char *a2, ...)
{
  return _[a1 fileCoordinatedFIFOHost];
}

id objc_msgSend_fileCoordinatedStore(void *a1, const char *a2, ...)
{
  return _[a1 fileCoordinatedStore];
}

id objc_msgSend_filePath(void *a1, const char *a2, ...)
{
  return _[a1 filePath];
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return [a1 fileURLWithPath:isDirectory:];
}

id objc_msgSend_flintDocumentURL(void *a1, const char *a2, ...)
{
  return _[a1 flintDocumentURL];
}

id objc_msgSend_flintDocumentURLAssetHandlesByRemoteURL(void *a1, const char *a2, ...)
{
  return _[a1 flintDocumentURLAssetHandlesByRemoteURL];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_fontDescriptorByAddingAttributes_(void *a1, const char *a2, ...)
{
  return [a1 fontDescriptorByAddingAttributes:];
}

id objc_msgSend_fontDescriptorWithSymbolicTraits_(void *a1, const char *a2, ...)
{
  return [a1 fontDescriptorWithSymbolicTraits:];
}

id objc_msgSend_fontWithDescriptor_size_(void *a1, const char *a2, ...)
{
  return [a1 fontWithDescriptor:size:];
}

id objc_msgSend_fr_accessoryColorForTextColor_backgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fr_accessoryColorForTextColor:backgroundColor:");
}

id objc_msgSend_fr_colorBin(void *a1, const char *a2, ...)
{
  return [a1 fr_colorBin];
}

id objc_msgSend_fr_colorWithHue_saturation_lightness_alpha_(void *a1, const char *a2, ...)
{
  return [a1 fr_colorWithHue:saturation:lightness:alpha:];
}

id objc_msgSend_fr_dynamicColor_withDarkStyleVariant_(void *a1, const char *a2, ...)
{
  return [a1 fr_dynamicColor:withDarkStyleVariant:];
}

id objc_msgSend_fr_plusDEffectWithForegroundColor_backgroundColor_(void *a1, const char *a2, ...)
{
  return [a1 fr_plusDEffectWithForegroundColor:backgroundColor:];
}

id objc_msgSend_fr_plusLEffectWithForegroundColor_backgroundColor_(void *a1, const char *a2, ...)
{
  return [a1 fr_plusLEffectWithForegroundColor:backgroundColor:];
}

id objc_msgSend_fr_topicCardBorderColorForDarkBackground(void *a1, const char *a2, ...)
{
  return [a1 fr_topicCardBorderColorForDarkBackground];
}

id objc_msgSend_fr_topicCardBorderColorForLightBackground(void *a1, const char *a2, ...)
{
  return [a1 fr_topicCardBorderColorForLightBackground];
}

id objc_msgSend_fr_topicCardDividerColorForDarkBackground(void *a1, const char *a2, ...)
{
  return [a1 fr_topicCardDividerColorForDarkBackground];
}

id objc_msgSend_fr_topicCardDividerColorForLightBackground(void *a1, const char *a2, ...)
{
  return [a1 fr_topicCardDividerColorForLightBackground];
}

id objc_msgSend_fr_topicCardTextColorForDarkBackground(void *a1, const char *a2, ...)
{
  return [a1 fr_topicCardTextColorForDarkBackground];
}

id objc_msgSend_fr_topicCardTextColorForLightBackground(void *a1, const char *a2, ...)
{
  return [a1 fr_topicCardTextColorForLightBackground];
}

id objc_msgSend_ft_appearanceTypeProperty(void *a1, const char *a2, ...)
{
  return [a1 ft_appearanceTypeProperty];
}

id objc_msgSend_ft_BOOLeanPropertyWithName_(void *a1, const char *a2, ...)
{
  return [a1 ft_BOOLeanPropertyWithName:];
}

id objc_msgSend_ft_eventWithDate_action_headline_section_headlineIndexInSection_precedingHeadlinesCount_precedingSectionsCount_(void *a1, const char *a2, ...)
{
  return [a1 ft_eventWithDate:action:headline:section:headlineIndexInSection:precedingHeadlinesCount:precedingSectionsCount:];
}

id objc_msgSend_ft_headlineSourceProperty(void *a1, const char *a2, ...)
{
  return [a1 ft_headlineSourceProperty];
}

id objc_msgSend_ft_itemWithHeadlines_sectionsByHeadline_assetHandlesByRemoteURL_(void *a1, const char *a2, ...)
{
  return [a1 ft_itemWithHeadlines:sectionsByHeadline:assetHandlesByRemoteURL:];
}

id objc_msgSend_ft_localTimeHourProperty(void *a1, const char *a2, ...)
{
  return [a1 ft_localTimeHourProperty];
}

id objc_msgSend_ft_referralURLWithSourceIdentifier_appConfigTreatmentID_widgetEngagement_otherQueryItems_sharedDirectoryFileURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ft_referralURLWithSourceIdentifier:appConfigTreatmentID:widgetEngagement:otherQueryItems:sharedDirectoryFileURL:");
}

id objc_msgSend_ft_sectionProperty(void *a1, const char *a2, ...)
{
  return [a1 ft_sectionProperty];
}

id objc_msgSend_ft_setTemporalBoundsBySanitizingStartDate_endDate_(void *a1, const char *a2, ...)
{
  return [a1 ft_setTemporalBoundsBySanitizingStartDate:endDate:];
}

id objc_msgSend_ft_timeZoneProperty(void *a1, const char *a2, ...)
{
  return [a1 ft_timeZoneProperty];
}

id objc_msgSend_ft_userGroupProperty(void *a1, const char *a2, ...)
{
  return [a1 ft_userGroupProperty];
}

id objc_msgSend_ft_widgetDisplayModeProperty(void *a1, const char *a2, ...)
{
  return [a1 ft_widgetDisplayModeProperty];
}

id objc_msgSend_getCharacters_range_(void *a1, const char *a2, ...)
{
  return [a1 getCharacters:range:];
}

id objc_msgSend_getHue_saturation_brightness_alpha_(void *a1, const char *a2, ...)
{
  return [a1 getHue:saturation:brightness:alpha:];
}

id objc_msgSend_getHue_saturation_lightness_alpha_(void *a1, const char *a2, ...)
{
  return [a1 getHue:saturation:lightness:alpha:];
}

id objc_msgSend_getRed_green_blue_alpha_(void *a1, const char *a2, ...)
{
  return [a1 getRed:green:blue:alpha:];
}

id objc_msgSend_green(void *a1, const char *a2, ...)
{
  return _[a1 green];
}

id objc_msgSend_hashTableWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 hashTableWithOptions:];
}

id objc_msgSend_headline(void *a1, const char *a2, ...)
{
  return _[a1 headline];
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return _[a1 hour];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_imageMethod(void *a1, const char *a2, ...)
{
  return _[a1 imageMethod];
}

id objc_msgSend_imageURL(void *a1, const char *a2, ...)
{
  return _[a1 imageURL];
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return [a1 indexOfObject:];
}

id objc_msgSend_indexSetWithIndexesInRange_(void *a1, const char *a2, ...)
{
  return [a1 indexSetWithIndexesInRange:];
}

id objc_msgSend_initWithArticleID_sourceChannelID_sectionData_flintDocumentAssetHandle_articleRecordData_sourceChannelRecordData_parentIssueRecordData_(void *a1, const char *a2, ...)
{
  return [a1 initWithArticleID:sourceChannelID:sectionData:flintDocumentAssetHandle:articleRecordData:sourceChannelRecordData:parentIssueRecordData:];
}

id objc_msgSend_initWithArticleRecordData_sourceChannel_parentIssue_assetManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithArticleRecordData:sourceChannel:parentIssue:assetManager:");
}

id objc_msgSend_initWithBase64EncodedString_options_(void *a1, const char *a2, ...)
{
  return [a1 initWithBase64EncodedString:options:];
}

id objc_msgSend_initWithCalendarIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithCalendarIdentifier:];
}

id objc_msgSend_initWithContentType_contentTypeVersion_contentTypeMinorVersion_contentTypePatchVersion_(void *a1, const char *a2, ...)
{
  return [a1 initWithContentType:];
}

id objc_msgSend_initWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return [a1 initWithContentsOfURL:];
}

id objc_msgSend_initWithData_context_(void *a1, const char *a2, ...)
{
  return [a1 initWithData:context:];
}

id objc_msgSend_initWithData_sourceChannel_assetManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithData:sourceChannel:assetManager:];
}

id objc_msgSend_initWithEncodableElement_assetHandlesByRemoteURL_(void *a1, const char *a2, ...)
{
  return [a1 initWithEncodableElement:assetHandlesByRemoteURL:];
}

id objc_msgSend_initWithEnvelopeDescriptor_sessionManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithEnvelopeDescriptor:sessionManager:];
}

id objc_msgSend_initWithEventTrackers_(void *a1, const char *a2, ...)
{
  return [a1 initWithEventTrackers:];
}

id objc_msgSend_initWithFeatureId_event_registerProperties_(void *a1, const char *a2, ...)
{
  return [a1 initWithFeatureId:event:registerProperties:];
}

id objc_msgSend_initWithFileURL_(void *a1, const char *a2, ...)
{
  return [a1 initWithFileURL:];
}

id objc_msgSend_initWithFileURL_allowedClasses_(void *a1, const char *a2, ...)
{
  return [a1 initWithFileURL:allowedClasses:];
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 initWithFormat:];
}

id objc_msgSend_initWithJSONArray_(void *a1, const char *a2, ...)
{
  return [a1 initWithJSONArray:];
}

id objc_msgSend_initWithJSONArray_flintDocumentURLAssetHandlesByRemoteURL_(void *a1, const char *a2, ...)
{
  return [a1 initWithJSONArray:nil flintDocumentURLAssetHandlesByRemoteURL:nil];
}

id objc_msgSend_initWithMaxRowCount_(void *a1, const char *a2, ...)
{
  return [a1 initWithMaxRowCount:];
}

id objc_msgSend_initWithMaxRowCount_trackedEvents_(void *a1, const char *a2, ...)
{
  return [a1 initWithMaxRowCount:trackedEvents:];
}

id objc_msgSend_initWithName_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:];
}

id objc_msgSend_initWithName_directory_keyManager_avAssetFactory_resourceURLGenerator_networkBehaviorMonitor_networkReachability_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:directory:keyManager:avAssetFactory:resourceURLGenerator:networkBehaviorMonitor:networkReachability:];
}

id objc_msgSend_initWithName_value_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:value:];
}

id objc_msgSend_initWithReferralItem_sharedDirectoryFileURL_(void *a1, const char *a2, ...)
{
  return [a1 initWithReferralItem:sharedDirectoryFileURL:];
}

id objc_msgSend_initWithSessionManager_userIDProvider_(void *a1, const char *a2, ...)
{
  return [a1 initWithSessionManager:userIDProvider:];
}

id objc_msgSend_initWithTodaySource_appConfigTreatmentID_widgetDisplayMode_appearanceType_(void *a1, const char *a2, ...)
{
  return [a1 initWithTodaySource:appConfigTreatmentID:widgetDisplayMode:appearanceType:];
}

id objc_msgSend_initWithURL_engagementReporter_(void *a1, const char *a2, ...)
{
  return [a1 initWithURL:engagementReporter:];
}

id objc_msgSend_initWithURL_resolvingAgainstBaseURL_(void *a1, const char *a2, ...)
{
  return [a1 initWithURL:resolvingAgainstBaseURL:];
}

id objc_msgSend_initWithWidgetEventTracker_predicate_(void *a1, const char *a2, ...)
{
  return [a1 initWithWidgetEventTracker:predicate:];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_interfaceOrientation(void *a1, const char *a2, ...)
{
  return _[a1 interfaceOrientation];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return [a1 isEqual:];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_isLingerInProgress(void *a1, const char *a2, ...)
{
  return _[a1 isLingerInProgress];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return _[a1 isMainThread];
}

id objc_msgSend_isNewsAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isNewsAvailable];
}

id objc_msgSend_itemExposuresSinceLastWidgetAppearance(void *a1, const char *a2, ...)
{
  return _[a1 itemExposuresSinceLastWidgetAppearance];
}

id objc_msgSend_itemType(void *a1, const char *a2, ...)
{
  return _[a1 itemType];
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return _[a1 items];
}

id objc_msgSend_keyWindow(void *a1, const char *a2, ...)
{
  return _[a1 keyWindow];
}

id objc_msgSend_lastVisibleItemsChangeArticleCount(void *a1, const char *a2, ...)
{
  return _[a1 lastVisibleItemsChangeArticleCount];
}

id objc_msgSend_lastVisibleItemsChangeDate(void *a1, const char *a2, ...)
{
  return _[a1 lastVisibleItemsChangeDate];
}

id objc_msgSend_lastVisibleItemsChangePairs(void *a1, const char *a2, ...)
{
  return _[a1 lastVisibleItemsChangePairs];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_localTimeZone(void *a1, const char *a2, ...)
{
  return _[a1 localTimeZone];
}

id objc_msgSend_makeObjectsPerformSelector_(void *a1, const char *a2, ...)
{
  return [a1 makeObjectsPerformSelector:];
}

id objc_msgSend_makeObjectsPerformSelector_withObject_(void *a1, const char *a2, ...)
{
  return [a1 makeObjectsPerformSelector:withObject:];
}

id objc_msgSend_minimumArticleExposureDurationToBePreseen(void *a1, const char *a2, ...)
{
  return _[a1 minimumArticleExposureDurationToBePreseen];
}

id objc_msgSend_minimumNumberOfTimesPreseenToBeSeen(void *a1, const char *a2, ...)
{
  return _[a1 minimumNumberOfTimesPreseenToBeSeen];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_myEncodableElement(void *a1, const char *a2, ...)
{
  return _[a1 myEncodableElement];
}

id objc_msgSend_needsSeenStateTracking(void *a1, const char *a2, ...)
{
  return _[a1 needsSeenStateTracking];
}

id objc_msgSend_nf_object_isEqualToObject_(void *a1, const char *a2, ...)
{
  return [a1 nf_object:isEqualToObject:];
}

id objc_msgSend_nss_URLWithCampaignID_(void *a1, const char *a2, ...)
{
  return [a1 nss_URLWithCampaignID];
}

id objc_msgSend_nss_eventWithIdentifier(void *a1, const char *a2, ...)
{
  return [a1 nss_eventWithIdentifier];
}

id objc_msgSend_nss_setStartDate_(void *a1, const char *a2, ...)
{
  return [a1 nss_setStartDate:];
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return [a1 numberWithDouble:];
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInteger:];
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInteger:];
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndexedSubscript:];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return [a1 objectForKey:];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}

id objc_msgSend_objectsAtIndexes_(void *a1, const char *a2, ...)
{
  return [a1 objectsAtIndexes:];
}

id objc_msgSend_observeEvent_(void *a1, const char *a2, ...)
{
  return [a1 observeEvent:];
}

id objc_msgSend_observeEvents_(void *a1, const char *a2, ...)
{
  return [a1 observeEvents:];
}

id objc_msgSend_observers(void *a1, const char *a2, ...)
{
  return _[a1 observers];
}

id objc_msgSend_openInNewsReferralItemQueryItemName(void *a1, const char *a2, ...)
{
  return _[a1 openInNewsReferralItemQueryItemName];
}

id objc_msgSend_openInNewsReferralItemWithTrackableWidgetState_assetHandlesByRemoteURL_(void *a1, const char *a2, ...)
{
  return [a1 openInNewsReferralItemWithTrackableWidgetState:assetHandlesByRemoteURL:];
}

id objc_msgSend_orderHeadlineEngagementEventTracker(void *a1, const char *a2, ...)
{
  return _[a1 orderHeadlineEngagementEventTracker];
}

id objc_msgSend_orderedSetWithOrderedSet_(void *a1, const char *a2, ...)
{
  return [a1 orderedSetWithOrderedSet:];
}

id objc_msgSend_outstandingItemExposureEvents(void *a1, const char *a2, ...)
{
  return _[a1 outstandingItemExposureEvents];
}

id objc_msgSend_parentIssueRecordData(void *a1, const char *a2, ...)
{
  return _[a1 parentIssueRecordData];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_personalizationEventAtDate_withAction_headline_section_trackableWidgetState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "personalizationEventAtDate:withAction:headline:section:trackableWidgetState:");
}

id objc_msgSend_personalizationMetadata(void *a1, const char *a2, ...)
{
  return _[a1 personalizationMetadata];
}

id objc_msgSend_predicate(void *a1, const char *a2, ...)
{
  return _[a1 predicate];
}

id objc_msgSend_preferredFontDescriptorWithTextStyle_compatibleWithTraitCollection_(void *a1, const char *a2, ...)
{
  return [a1 preferredFontDescriptorWithTextStyle:];
}

id objc_msgSend_preseenCountTrackingIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 preseenCountTrackingIdentifier];
}

id objc_msgSend_propertyWithName_enumMapping_(void *a1, const char *a2, ...)
{
  return [a1 propertyWithName:enumMapping:];
}

id objc_msgSend_propertyWithName_enumMapping_autoSanitizeValues_(void *a1, const char *a2, ...)
{
  return [a1 propertyWithName:enumMapping:autoSanitizeValues:];
}

id objc_msgSend_propertyWithName_possibleValues_(void *a1, const char *a2, ...)
{
  return [a1 propertyWithName:possibleValues:];
}

id objc_msgSend_propertyWithName_range_(void *a1, const char *a2, ...)
{
  return [a1 propertyWithName:range:];
}

id objc_msgSend_propertyWithName_range_clampValues_(void *a1, const char *a2, ...)
{
  return [a1 propertyWithName:range:clampValues:];
}

id objc_msgSend_queryItemWithName_value_(void *a1, const char *a2, ...)
{
  return [a1 queryItemWithName:value:];
}

id objc_msgSend_queryItems(void *a1, const char *a2, ...)
{
  return _[a1 queryItems];
}

id objc_msgSend_red(void *a1, const char *a2, ...)
{
  return _[a1 red];
}

id objc_msgSend_referralBarName(void *a1, const char *a2, ...)
{
  return _[a1 referralBarName];
}

id objc_msgSend_referralItem(void *a1, const char *a2, ...)
{
  return _[a1 referralItem];
}

id objc_msgSend_remoteURL(void *a1, const char *a2, ...)
{
  return _[a1 remoteURL];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return [a1 removeItemAtURL:error:];
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return [a1 removeObject:];
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectForKey:];
}

id objc_msgSend_removeObjectsForKeys_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectsForKeys:];
}

id objc_msgSend_removeObjectsInRange_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectsInRange:];
}

id objc_msgSend_reporter(void *a1, const char *a2, ...)
{
  return _[a1 reporter];
}

id objc_msgSend_resolvedColorWithTraitCollection_(void *a1, const char *a2, ...)
{
  return [a1 resolvedColorWithTraitCollection:];
}

id objc_msgSend_saveWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 saveWithCompletionHandler:];
}

id objc_msgSend_sectionForItem_(void *a1, const char *a2, ...)
{
  return [a1 sectionForItem:];
}

id objc_msgSend_sections(void *a1, const char *a2, ...)
{
  return _[a1 sections];
}

id objc_msgSend_sessionAnnotator(void *a1, const char *a2, ...)
{
  return _[a1 sessionAnnotator];
}

id objc_msgSend_sessionHasEngagement(void *a1, const char *a2, ...)
{
  return _[a1 sessionHasEngagement];
}

id objc_msgSend_setAppConfigTreatmentId_(void *a1, const char *a2, ...)
{
  return [a1 setAppConfigTreatmentId:];
}

id objc_msgSend_setArticleId_(void *a1, const char *a2, ...)
{
  return [a1 setArticleId:];
}

id objc_msgSend_setBannerIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setBannerIdentifier];
}

id objc_msgSend_setContentFetchDate_(void *a1, const char *a2, ...)
{
  return [a1 setContentFetchDate:];
}

id objc_msgSend_setContentId_(void *a1, const char *a2, ...)
{
  return [a1 setContentId:];
}

id objc_msgSend_setCtr_(void *a1, const char *a2, ...)
{
  return [a1 setCtr:];
}

id objc_msgSend_setCurrentSession_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentSession:];
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return [a1 setDuration:];
}

id objc_msgSend_setEngagementTargetUrl_(void *a1, const char *a2, ...)
{
  return [a1 setEngagementTargetUrl:];
}

id objc_msgSend_setEntryId_(void *a1, const char *a2, ...)
{
  return [a1 setEntryId:];
}

id objc_msgSend_setEnvelopes_(void *a1, const char *a2, ...)
{
  return [a1 setEnvelopes:];
}

id objc_msgSend_setEventObject_(void *a1, const char *a2, ...)
{
  return [a1 setEventObject:];
}

id objc_msgSend_setEvents_(void *a1, const char *a2, ...)
{
  return [a1 setEvents:];
}

id objc_msgSend_setGestureType_(void *a1, const char *a2, ...)
{
  return [a1 setGestureType:];
}

id objc_msgSend_setItemExposuresSinceLastWidgetAppearance_(void *a1, const char *a2, ...)
{
  return [a1 setItemExposuresSinceLastWidgetAppearance:];
}

id objc_msgSend_setLastVisibleItemsChangeArticleCount_(void *a1, const char *a2, ...)
{
  return [a1 setLastVisibleItemsChangeArticleCount:];
}

id objc_msgSend_setLastVisibleItemsChangeDate_(void *a1, const char *a2, ...)
{
  return [a1 setLastVisibleItemsChangeDate:];
}

id objc_msgSend_setLastVisibleItemsChangePairs_(void *a1, const char *a2, ...)
{
  return [a1 setLastVisibleItemsChangePairs:];
}

id objc_msgSend_setLingerInProgress_(void *a1, const char *a2, ...)
{
  return [a1 setLingerInProgress:];
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKey:];
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKeyedSubscript:];
}

id objc_msgSend_setOtherVisibleSections_(void *a1, const char *a2, ...)
{
  return [a1 setOtherVisibleSections:];
}

id objc_msgSend_setOutstandingItemExposureEvents_(void *a1, const char *a2, ...)
{
  return [a1 setOutstandingItemExposureEvents:];
}

id objc_msgSend_setPersonalizationFeatureId_(void *a1, const char *a2, ...)
{
  return [a1 setPersonalizationFeatureId:];
}

id objc_msgSend_setQueryItems_(void *a1, const char *a2, ...)
{
  return [a1 setQueryItems:];
}

id objc_msgSend_setRunningObsolete_(void *a1, const char *a2, ...)
{
  return [a1 setRunningObsolete:];
}

id objc_msgSend_setSessionHasEngagement_(void *a1, const char *a2, ...)
{
  return [a1 setSessionHasEngagement:];
}

id objc_msgSend_setSourceChannelId_(void *a1, const char *a2, ...)
{
  return [a1 setSourceChannelId:];
}

id objc_msgSend_setStartDate_(void *a1, const char *a2, ...)
{
  return [a1 setStartDate:];
}

id objc_msgSend_setStartState_(void *a1, const char *a2, ...)
{
  return [a1 setStartState:];
}

id objc_msgSend_setStoryType_(void *a1, const char *a2, ...)
{
  return [a1 setStoryType:];
}

id objc_msgSend_setSubmissionCompletion_(void *a1, const char *a2, ...)
{
  return [a1 setSubmissionCompletion:];
}

id objc_msgSend_setTodayWidgetExposure_(void *a1, const char *a2, ...)
{
  return [a1 setTodayWidgetExposure:];
}

id objc_msgSend_setTodayWidgetHeadlineExposure_(void *a1, const char *a2, ...)
{
  return [a1 setTodayWidgetHeadlineExposure];
}

id objc_msgSend_setUserID_(void *a1, const char *a2, ...)
{
  return [a1 setUserID:];
}

id objc_msgSend_setUserId_(void *a1, const char *a2, ...)
{
  return [a1 setUserId:];
}

id objc_msgSend_setUserSegmentationSegmentSetIds_count_(void *a1, const char *a2, ...)
{
  return [a1 setUserSegmentationSegmentSetIds:count:];
}

id objc_msgSend_setUserSegmentationTreatmentIds_count_(void *a1, const char *a2, ...)
{
  return [a1 setUserSegmentationTreatmentIds:count:];
}

id objc_msgSend_setVisibleHeadlines_(void *a1, const char *a2, ...)
{
  return [a1 setVisibleHeadlines:];
}

id objc_msgSend_setVisibleHeadlinesAppearanceDate_(void *a1, const char *a2, ...)
{
  return [a1 setVisibleHeadlinesAppearanceDate:];
}

id objc_msgSend_setWebEmbedId_(void *a1, const char *a2, ...)
{
  return [a1 setWebEmbedId:];
}

id objc_msgSend_setWidgetAppearanceDate_(void *a1, const char *a2, ...)
{
  return [a1 setWidgetAppearanceDate:];
}

id objc_msgSend_setWidgetAppearanceType_(void *a1, const char *a2, ...)
{
  return [a1 setWidgetAppearanceType:];
}

id objc_msgSend_setWidgetArticleCount_(void *a1, const char *a2, ...)
{
  return [a1 setWidgetArticleCount:];
}

id objc_msgSend_setWidgetArticleCountInSection_(void *a1, const char *a2, ...)
{
  return [a1 setWidgetArticleCountInSection:];
}

id objc_msgSend_setWidgetArticleRank_(void *a1, const char *a2, ...)
{
  return [a1 setWidgetArticleRank];
}

id objc_msgSend_setWidgetArticleRankInSection_(void *a1, const char *a2, ...)
{
  return [a1 setWidgetArticleRankInSection:];
}

id objc_msgSend_setWidgetContentType_(void *a1, const char *a2, ...)
{
  return [a1 setWidgetContentType:];
}

id objc_msgSend_setWidgetDisplayMode_(void *a1, const char *a2, ...)
{
  return [a1 setWidgetDisplayMode:];
}

id objc_msgSend_setWidgetDisplayModeSessionEnd_(void *a1, const char *a2, ...)
{
  return [a1 setWidgetDisplayModeSessionEnd:];
}

id objc_msgSend_setWidgetEngagement_(void *a1, const char *a2, ...)
{
  return [a1 setWidgetEngagement];
}

id objc_msgSend_setWidgetEngagementType_(void *a1, const char *a2, ...)
{
  return [a1 setWidgetEngagementType:];
}

id objc_msgSend_setWidgetExposureStackLocation_(void *a1, const char *a2, ...)
{
  return [a1 setWidgetExposureStackLocation:];
}

id objc_msgSend_setWidgetHeadlineExposureCount_(void *a1, const char *a2, ...)
{
  return [a1 setWidgetHeadlineExposureCount:];
}

id objc_msgSend_setWidgetSectionDisplayRank_(void *a1, const char *a2, ...)
{
  return [a1 setWidgetSectionDisplayRank];
}

id objc_msgSend_setWidgetSectionId_(void *a1, const char *a2, ...)
{
  return [a1 setWidgetSectionId:];
}

id objc_msgSend_setWidgetSectionIdsExposed_(void *a1, const char *a2, ...)
{
  return [a1 setWidgetSectionIdsExposed:];
}

id objc_msgSend_setWidgetSectionSubid_(void *a1, const char *a2, ...)
{
  return [a1 setWidgetSectionSubid:];
}

id objc_msgSend_setWidgetSectionSubidsExposed_(void *a1, const char *a2, ...)
{
  return [a1 setWidgetSectionSubidsExposed];
}

id objc_msgSend_setWidgetSectionsArticleCountPairs_(void *a1, const char *a2, ...)
{
  return [a1 setWidgetSectionsArticleCountPairs:];
}

id objc_msgSend_setWidgetSessionId_(void *a1, const char *a2, ...)
{
  return [a1 setWidgetSessionId:];
}

id objc_msgSend_setWidgetType_(void *a1, const char *a2, ...)
{
  return [a1 setWidgetType:];
}

id objc_msgSend_setWidgetUserId_(void *a1, const char *a2, ...)
{
  return [a1 setWidgetUserId:];
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return [a1 setWithObjects:];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _[a1 sharedApplication];
}

id objc_msgSend_sharedDirectoryFileURL(void *a1, const char *a2, ...)
{
  return _[a1 sharedDirectoryFileURL];
}

id objc_msgSend_sharedNetworkReachability(void *a1, const char *a2, ...)
{
  return _[a1 sharedNetworkReachability];
}

id objc_msgSend_slowCachedTagForID_(void *a1, const char *a2, ...)
{
  return [a1 slowCachedTagForID];
}

id objc_msgSend_sourceChannelID(void *a1, const char *a2, ...)
{
  return _[a1 sourceChannelID];
}

id objc_msgSend_sourceChannelRecordData(void *a1, const char *a2, ...)
{
  return _[a1 sourceChannelRecordData];
}

id objc_msgSend_sourceTagID(void *a1, const char *a2, ...)
{
  return _[a1 sourceTagID];
}

id objc_msgSend_stackKind(void *a1, const char *a2, ...)
{
  return _[a1 stackKind];
}

id objc_msgSend_stackLocation(void *a1, const char *a2, ...)
{
  return _[a1 stackLocation];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return _[a1 startDate];
}

id objc_msgSend_startState(void *a1, const char *a2, ...)
{
  return _[a1 startState];
}

id objc_msgSend_storyType(void *a1, const char *a2, ...)
{
  return _[a1 storyType];
}

id objc_msgSend_stringIsValid_(void *a1, const char *a2, ...)
{
  return [a1 stringIsValid:];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_subidentifier(void *a1, const char *a2, ...)
{
  return _[a1 subidentifier];
}

id objc_msgSend_submissionGroup(void *a1, const char *a2, ...)
{
  return _[a1 submissionGroup];
}

id objc_msgSend_submitEventsIfNeededWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 submitEventsIfNeededWithCompletion:];
}

id objc_msgSend_submitUpdate_withCompletion_(void *a1, const char *a2, ...)
{
  return [a1 submitUpdate:withCompletion:];
}

id objc_msgSend_systemGrayColor(void *a1, const char *a2, ...)
{
  return _[a1 systemGrayColor];
}

id objc_msgSend_systemPinkColor(void *a1, const char *a2, ...)
{
  return _[a1 systemPinkColor];
}

id objc_msgSend_tagController(void *a1, const char *a2, ...)
{
  return _[a1 tagController];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceDate:];
}

id objc_msgSend_timeOfDayHeadlineEngagementEventTracker(void *a1, const char *a2, ...)
{
  return _[a1 timeOfDayHeadlineEngagementEventTracker];
}

id objc_msgSend_timeOfDayWidgetAppearanceEventTracker(void *a1, const char *a2, ...)
{
  return _[a1 timeOfDayWidgetAppearanceEventTracker];
}

id objc_msgSend_tintColor(void *a1, const char *a2, ...)
{
  return _[a1 tintColor];
}

id objc_msgSend_todayEventTracker(void *a1, const char *a2, ...)
{
  return _[a1 todayEventTracker];
}

id objc_msgSend_todayResults(void *a1, const char *a2, ...)
{
  return _[a1 todayResults];
}

id objc_msgSend_todaySourceIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 todaySourceIdentifier];
}

id objc_msgSend_trackAppearanceAtDate_withHeadlineSource_appConfigTreatmentID_appearanceType_allItemsCount_(void *a1, const char *a2, ...)
{
  return [a1 trackAppearanceAtDate:withHeadlineSource:appConfigTreatmentID:appearanceType:allItemsCount:];
}

id objc_msgSend_trackDisappearance(void *a1, const char *a2, ...)
{
  return _[a1 trackDisappearance];
}

id objc_msgSend_trackEventWithPropertyValues_(void *a1, const char *a2, ...)
{
  return [a1 trackEventWithPropertyValues:];
}

id objc_msgSend_trackEventWithPropertyValues_value_(void *a1, const char *a2, ...)
{
  return [a1 trackEventWithPropertyValues:value:];
}

id objc_msgSend_trackUpdateWithTodaySource_appConfigTreatmentID_error_updateFetchDuration_wifiReachable_cellularRadioAccessTechnology_(void *a1, const char *a2, ...)
{
  return [a1 trackUpdateWithTodaySource:appConfigTreatmentID:error:updateFetchDuration:wifiReachable:cellularRadioAccessTechnology:];
}

id objc_msgSend_trackWidgetLingerEventExtremity_atDate_withTodaySource_appConfigTreatmentID_widgetDisplayMode_appearanceType_(void *a1, const char *a2, ...)
{
  return [a1 trackWidgetLingerEventExtremity:atDate:withTodaySource:appConfigTreatmentID:widgetDisplayMode:appearanceType:];
}

id objc_msgSend_trackedEvents(void *a1, const char *a2, ...)
{
  return _[a1 trackedEvents];
}

id objc_msgSend_traitCollectionWithPreferredContentSizeCategory_(void *a1, const char *a2, ...)
{
  return [a1 traitCollectionWithPreferredContentSizeCategory:];
}

id objc_msgSend_unarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return [a1 unarchivedObjectOfClasses:fromData:error:];
}

id objc_msgSend_uniqueKey(void *a1, const char *a2, ...)
{
  return _[a1 uniqueKey];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_userEngagedWithWidgetAtDate_actionURL_trackableWidgetState_(void *a1, const char *a2, ...)
{
  return [a1 userEngagedWithWidgetAtDate:actionURL:trackableWidgetState:];
}

id objc_msgSend_userID(void *a1, const char *a2, ...)
{
  return _[a1 userID];
}

id objc_msgSend_userIDProvider(void *a1, const char *a2, ...)
{
  return _[a1 userIDProvider];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceIdiom];
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceStyle];
}

id objc_msgSend_userSegmentationSegmentSetIds(void *a1, const char *a2, ...)
{
  return _[a1 userSegmentationSegmentSetIds];
}

id objc_msgSend_userSegmentationSegmentSetIdsCount(void *a1, const char *a2, ...)
{
  return _[a1 userSegmentationSegmentSetIdsCount];
}

id objc_msgSend_userSegmentationTreatmentIds(void *a1, const char *a2, ...)
{
  return _[a1 userSegmentationTreatmentIds];
}

id objc_msgSend_userSegmentationTreatmentIdsCount(void *a1, const char *a2, ...)
{
  return _[a1 userSegmentationTreatmentIdsCount];
}

id objc_msgSend_visibleHeadlines(void *a1, const char *a2, ...)
{
  return _[a1 visibleHeadlines];
}

id objc_msgSend_visibleHeadlinesAppearanceDate(void *a1, const char *a2, ...)
{
  return _[a1 visibleHeadlinesAppearanceDate];
}

id objc_msgSend_visibleItems(void *a1, const char *a2, ...)
{
  return _[a1 visibleItems];
}

id objc_msgSend_visibleItemsDidChangeAtDate_withTriggerEvent_trackableWidgetState_(void *a1, const char *a2, ...)
{
  return [a1 visibleItemsDidChangeAtDate:withTriggerEvent:trackableWidgetState:];
}

id objc_msgSend_visibleSections(void *a1, const char *a2, ...)
{
  return _[a1 visibleSections];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return _[a1 whiteColor];
}

id objc_msgSend_widgetAppearanceDate(void *a1, const char *a2, ...)
{
  return _[a1 widgetAppearanceDate];
}

id objc_msgSend_widgetAppearanceEventTracker(void *a1, const char *a2, ...)
{
  return _[a1 widgetAppearanceEventTracker];
}

id objc_msgSend_widgetConfig(void *a1, const char *a2, ...)
{
  return _[a1 widgetConfig];
}

id objc_msgSend_widgetDidAppearAtDate_withTrackableWidgetState_(void *a1, const char *a2, ...)
{
  return [a1 widgetDidAppearAtDate:withTrackableWidgetState:];
}

id objc_msgSend_widgetDidDisappearAtDate_withTrackableWidgetState_(void *a1, const char *a2, ...)
{
  return [a1 widgetDidDisappearAtDate:withTrackableWidgetState:];
}

id objc_msgSend_widgetDisappearanceEventTracker(void *a1, const char *a2, ...)
{
  return _[a1 widgetDisappearanceEventTracker];
}

id objc_msgSend_widgetDisplayMode(void *a1, const char *a2, ...)
{
  return _[a1 widgetDisplayMode];
}

id objc_msgSend_widgetEventTracker(void *a1, const char *a2, ...)
{
  return _[a1 widgetEventTracker];
}

id objc_msgSend_widgetLingerEventTracker(void *a1, const char *a2, ...)
{
  return _[a1 widgetLingerEventTracker];
}

id objc_msgSend_widgetPerformedUpdateWithTodayResults_fetchInfo_error_updateFetchDuration_(void *a1, const char *a2, ...)
{
  return [a1 widgetPerformedUpdateWithTodayResults:fetchInfo:error:updateFetchDuration:];
}

id objc_msgSend_widgetUpdateEventTracker(void *a1, const char *a2, ...)
{
  return _[a1 widgetUpdateEventTracker];
}

id objc_msgSend_widgetUpdateFailureEventTracker(void *a1, const char *a2, ...)
{
  return _[a1 widgetUpdateFailureEventTracker];
}

id objc_msgSend_wifiReachable(void *a1, const char *a2, ...)
{
  return _[a1 wifiReachable];
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return _[a1 windowScene];
}

id objc_msgSend_writeToURL_atomically_(void *a1, const char *a2, ...)
{
  return [a1 writeToURL:atomically:];
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return [a1 writeToURL:options:error:];
}

id objc_msgSend_writeUserDidSeeHeadlinesWithAnalyticsElements_atDate_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeUserDidSeeHeadlinesWithAnalyticsElements:atDate:withCompletion:");
}

id objc_msgSend_writeWithAccessor_completion_(void *a1, const char *a2, ...)
{
  return [a1 writeWithAccessor:completion:];
}