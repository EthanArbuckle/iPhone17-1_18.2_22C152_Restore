void *sub_100002614(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  void (*v31)(unint64_t, void, uint64_t);
  void (*v32)(uint64_t, uint64_t);
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  BOOL v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  BOOL v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  int64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  void *result;
  uint64_t v68;
  void (**v69)(char *, uint64_t, uint64_t, uint64_t);
  long long v70;
  uint64_t v71;
  long long v72;
  void (**v73)(char *, uint64_t);
  void (**v74)(char *, uint64_t);
  void (**v75)(uint64_t, uint64_t);
  unsigned int v76;
  unsigned int v77;
  unsigned int v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  char *v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;

  v2 = sub_10000C984(&qword_10002E600);
  __chkstk_darwin(v2 - 8);
  v94 = (uint64_t)&v68 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for TTRIIntentsSnippetSection();
  v88 = *(void *)(v4 - 8);
  v89 = v4;
  __chkstk_darwin(v4);
  v6 = (uint64_t *)((char *)&v68 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v83 = sub_100021658();
  v7 = *(void *)(v83 - 8);
  __chkstk_darwin(v83);
  v82 = (char *)&v68 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v81 = sub_100021538();
  v9 = *(void *)(v81 - 8);
  __chkstk_darwin(v81);
  v80 = (char *)&v68 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v86 = sub_1000215B8();
  v11 = *(char **)(v86 - 8);
  __chkstk_darwin(v86);
  v90 = (char *)&v68 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_10000C984(&qword_10002E070);
  v71 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  v15 = (char *)&v68 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v96 = &_swiftEmptyDictionarySingleton;
  if (a1 >> 62)
  {
LABEL_27:
    swift_bridgeObjectRetain();
    v16 = sub_100021E28();
    v87 = v6;
    if (v16) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    v87 = v6;
    if (v16)
    {
LABEL_3:
      v68 = v13;
      v85 = a1 & 0xC000000000000001;
      v78 = enum case for Calendar.Component.year(_:);
      v77 = enum case for Calendar.Component.month(_:);
      v76 = enum case for Calendar.Component.day(_:);
      v75 = (void (**)(uint64_t, uint64_t))(v7 + 8);
      v74 = (void (**)(char *, uint64_t))(v9 + 8);
      v73 = (void (**)(char *, uint64_t))(v11 + 8);
      v69 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
      v17 = &_swiftEmptyDictionarySingleton;
      v7 = 4;
      v70 = xmmword_100022910;
      v72 = xmmword_100022900;
      v84 = (char *)a1;
      v79 = v16;
      v13 = (uint64_t)v82;
      do
      {
        v19 = v7 - 4;
        if (v85)
        {
          v20 = (id)sub_100021D48();
          v21 = v7 - 3;
          if (__OFADD__(v19, 1)) {
            goto LABEL_24;
          }
        }
        else
        {
          v20 = *(id *)(a1 + 8 * v7);
          v21 = v7 - 3;
          if (__OFADD__(v19, 1))
          {
LABEL_24:
            __break(1u);
LABEL_25:
            __break(1u);
LABEL_26:
            __break(1u);
            goto LABEL_27;
          }
        }
        v91 = v21;
        v92 = v7;
        v93 = (uint64_t)v20;
        v22 = [v20 displayDate:v68];
        if (v22)
        {
          v23 = v22;
          v24 = [v22 date];

          sub_100021598();
          sub_100021638();
          sub_10000C984(&qword_10002E080);
          v25 = sub_100021648();
          v26 = *(void *)(v25 - 8);
          v27 = *(void *)(v26 + 72);
          v28 = (*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
          v29 = swift_allocObject();
          *(_OWORD *)(v29 + 16) = v72;
          v30 = v29 + v28;
          v31 = *(void (**)(unint64_t, void, uint64_t))(v26 + 104);
          v31(v30, v78, v25);
          v31(v30 + v27, v77, v25);
          v31(v30 + 2 * v27, v76, v25);
          sub_10000EA14(v29);
          swift_setDeallocating();
          swift_arrayDestroy();
          swift_deallocClassInstance();
          v11 = v80;
          a1 = (unint64_t)v90;
          sub_100021608();
          v16 = v79;
          swift_bridgeObjectRelease();
          v6 = (uint64_t *)v75;
          v32 = *v75;
          v9 = v83;
          (*v75)(v13, v83);
          sub_100021638();
          sub_100021628();
          v32(v13, v9);
          (*v74)(v11, v81);
          (*v73)((char *)a1, v86);
        }
        else
        {
          (*v69)(v15, 1, 1, v86);
        }
        v7 = (uint64_t)v17;
        v34 = sub_100004F48((uint64_t)v15);
        v35 = v17[2];
        v36 = (v33 & 1) == 0;
        v37 = v35 + v36;
        if (__OFADD__(v35, v36)) {
          goto LABEL_25;
        }
        v9 = v33;
        a1 = (unint64_t)v84;
        if (v17[3] < v37)
        {
          sub_100005680(v37, 1);
          v17 = v96;
          v38 = sub_100004F48((uint64_t)v15);
          if ((v9 & 1) != (v39 & 1))
          {
            sub_100021ED8();
            __break(1u);
            result = (void *)swift_release();
            __break(1u);
            return result;
          }
          v34 = v38;
        }
        if (v9)
        {
          sub_100011B2C((uint64_t)v15, &qword_10002E070);
          v17 = v96;
          v18 = (void *)(v96[7] + 8 * v34);
          sub_1000219F8();
          if (*(void *)((*v18 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v18 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_100021A38();
          }
          sub_100021A58();
          sub_100021A28();
        }
        else
        {
          sub_10000C984(&qword_10002E058);
          v40 = swift_allocObject();
          *(_OWORD *)(v40 + 16) = v70;
          *(void *)(v40 + 32) = v93;
          v95 = v40;
          sub_100021A28();
          v7 = v95;
          v17[(v34 >> 6) + 8] |= 1 << v34;
          sub_100011A64((uint64_t)v15, v17[6] + *(void *)(v71 + 72) * v34, &qword_10002E070);
          *(void *)(v17[7] + 8 * v34) = v7;
          v41 = v17[2];
          v42 = __OFADD__(v41, 1);
          v43 = v41 + 1;
          if (v42) {
            goto LABEL_26;
          }
          v17[2] = v43;
        }
        v7 = v92 + 1;
      }
      while (v91 != v16);
    }
  }
  swift_bridgeObjectRelease();
  v44 = swift_bridgeObjectRetain();
  v45 = sub_10000642C(v44);
  swift_release();
  v96 = v45;
  sub_10000621C(&v96);
  swift_release();
  v46 = v96;
  v47 = v96[2];
  if (v47)
  {
    v96 = _swiftEmptyArrayStorage;
    sub_10000ADC8(0, v47, 0);
    v48 = v96;
    v93 = sub_10000C984(&qword_10002E078);
    v49 = *(void *)(v93 - 8);
    v50 = *(unsigned __int8 *)(v49 + 80);
    v86 = (uint64_t)v46;
    v51 = (uint64_t)v46 + ((v50 + 32) & ~v50);
    v92 = *(void *)(v49 + 72);
    LODWORD(v91) = enum case for REMNavigationSpecifier.SmartListPathSpecifier.showContents(_:);
    LODWORD(v90) = enum case for REMNavigationSpecifier.scheduled(_:);
    do
    {
      v52 = *(void *)(v51 + *(int *)(v93 + 48));
      v53 = sub_10000F114(v51);
      v55 = v54;
      v56 = sub_100021848();
      v57 = v94;
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v56 - 8) + 104))(v94, v91, v56);
      v58 = sub_100021888();
      v59 = *(void *)(v58 - 8);
      (*(void (**)(uint64_t, void, uint64_t))(v59 + 104))(v57, v90, v58);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v59 + 56))(v57, 0, 1, v58);
      if (v52 < 0 || (v52 & 0x4000000000000000) != 0)
      {
        v66 = swift_bridgeObjectRetain();
        v60 = (uint64_t)sub_100006334(v66);
        swift_bridgeObjectRelease();
      }
      else
      {
        v60 = v52 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain();
      }
      v95 = v60;
      sub_1000061A0(&v95);
      v61 = v95;
      v62 = (uint64_t)v87;
      *v87 = v53;
      *(void *)(v62 + 8) = v55;
      v63 = v89;
      sub_100011A64(v94, v62 + *(int *)(v89 + 20), &qword_10002E600);
      *(void *)(v62 + *(int *)(v63 + 24)) = v61;
      v96 = v48;
      v65 = v48[2];
      v64 = v48[3];
      if (v65 >= v64 >> 1)
      {
        sub_10000ADC8(v64 > 1, v65 + 1, 1);
        v48 = v96;
      }
      v48[2] = v65 + 1;
      sub_10000C9C8(v62, (uint64_t)v48+ ((*(unsigned __int8 *)(v88 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v88 + 80))+ *(void *)(v88 + 72) * v65);
      v51 += v92;
      --v47;
    }
    while (v47);
    swift_release();
  }
  else
  {
    swift_release();
    return _swiftEmptyArrayStorage;
  }
  return v48;
}

uint64_t sub_100003120(unint64_t a1)
{
  v2 = (int *)type metadata accessor for TTRIIntentsSnippetSection();
  v3 = (char *)*((void *)v2 - 1);
  uint64_t v4 = __chkstk_darwin(v2);
  v6 = (char *)&v114 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v4);
  uint64_t v122 = (uint64_t)&v114 - v8;
  __chkstk_darwin(v7);
  unint64_t v10 = (unint64_t)&v114 - v9;
  uint64_t v11 = sub_10000C984(&qword_10002E600);
  uint64_t v12 = __chkstk_darwin(v11 - 8);
  uint64_t v118 = (uint64_t)&v114 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (uint64_t)&v114 - v15;
  __chkstk_darwin(v14);
  v117 = (char *)&v114 - v17;
  uint64_t v131 = sub_100021658();
  v18 = *(char **)(v131 - 8);
  __chkstk_darwin(v131);
  v130 = (char *)&v114 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v140 = sub_1000215B8();
  v20 = *(uint64_t **)(v140 - 8);
  uint64_t v21 = __chkstk_darwin(v140);
  v23 = (char *)&v114 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __chkstk_darwin(v21);
  v135 = (char *)&v114 - v25;
  __chkstk_darwin(v24);
  v139 = (char *)&v114 - v26;
  uint64_t v121 = sub_10000C984(&qword_10002E050);
  uint64_t v120 = *(void *)(v121 - 8);
  uint64_t v27 = __chkstk_darwin(v121);
  uint64_t v123 = (uint64_t)&v114 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = __chkstk_darwin(v27);
  uint64_t v124 = (uint64_t)&v114 - v30;
  uint64_t v31 = __chkstk_darwin(v29);
  v125 = (char *)&v114 - v32;
  __chkstk_darwin(v31);
  uint64_t v128 = (uint64_t)&v114 - v33;
  v142 = (uint64_t *)&_swiftEmptyDictionarySingleton;
  unint64_t v138 = a1;
  if (a1 >> 62)
  {
LABEL_54:
    swift_bridgeObjectRetain();
    a1 = v138;
    uint64_t v34 = sub_100021E28();
  }
  else
  {
    uint64_t v34 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  v126 = v6;
  v127 = v2;
  v136 = (char *)v34;
  v119 = v3;
  if (v34)
  {
    v134 = v23;
    uint64_t v115 = v16;
    unint64_t v116 = v10;
    unint64_t v137 = a1 & 0xC000000000000001;
    v2 = (int *)(v20 + 1);
    v133 = (void (**)(char *, char *, uint64_t))(v20 + 2);
    v129 = (void (**)(char *, uint64_t))(v18 + 8);
    v35 = (uint64_t *)&_swiftEmptyDictionarySingleton;
    uint64_t v16 = 4;
    long long v132 = xmmword_100022910;
    v23 = v136;
    while (1)
    {
      v20 = (uint64_t *)(v16 - 4);
      if (v137) {
        v37 = (char *)sub_100021D48();
      }
      else {
        v37 = (char *)*(id *)(a1 + 8 * v16);
      }
      v18 = v37;
      v6 = (char *)(v16 - 3);
      if (__OFADD__(v20, 1))
      {
        __break(1u);
LABEL_52:
        __break(1u);
LABEL_53:
        __break(1u);
        goto LABEL_54;
      }
      id v38 = [v37 displayDate];
      if (v38)
      {
        v39 = v38;
        id v40 = [v38 date];

        v3 = v139;
        sub_100021598();

        v41 = v135;
        sub_1000215A8();
        LOBYTE(v39) = sub_100021588();
        v42 = *(void (**)(char *, uint64_t))v2;
        v43 = v41;
        uint64_t v44 = v140;
        (*(void (**)(char *, uint64_t))v2)(v43, v140);
        v45 = v134;
        (*v133)(v134, v3, v44);
        if (v39)
        {
          char v46 = 1;
        }
        else
        {
          id v47 = [self currentCalendar];
          v3 = v130;
          sub_100021618();

          char v46 = sub_1000215F8();
          (*v129)(v3, v131);
        }
        uint64_t v48 = v140;
        v42(v45, v140);
        v42(v139, v48);
        v23 = v136;
      }
      else
      {
        char v46 = 0;
      }
      v20 = v35;
      unint64_t v10 = sub_10000514C(v46 & 1);
      uint64_t v50 = v35[2];
      BOOL v51 = (v49 & 1) == 0;
      uint64_t v52 = v50 + v51;
      if (__OFADD__(v50, v51)) {
        goto LABEL_52;
      }
      v3 = v49;
      if (v35[3] < v52)
      {
        sub_100005920(v52, 1);
        v35 = v142;
        unint64_t v53 = sub_10000514C(v46 & 1);
        if ((v3 & 1) != (v54 & 1))
        {
          uint64_t result = sub_100021ED8();
          __break(1u);
          return result;
        }
        unint64_t v10 = v53;
      }
      if (v3)
      {
        v36 = (void *)(v35[7] + 8 * v10);
        sub_1000219F8();
        if (*(void *)((*v36 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v36 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_100021A38();
        }
        sub_100021A58();
        sub_100021A28();
      }
      else
      {
        sub_10000C984(&qword_10002E058);
        uint64_t v55 = swift_allocObject();
        *(_OWORD *)(v55 + 16) = v132;
        *(void *)(v55 + 32) = v18;
        uint64_t v141 = v55;
        v20 = &v141;
        sub_100021A28();
        uint64_t v56 = v141;
        v35[(v10 >> 6) + 8] |= 1 << v10;
        *(unsigned char *)(v35[6] + v10) = v46 & 1;
        *(void *)(v35[7] + 8 * v10) = v56;
        uint64_t v57 = v35[2];
        BOOL v58 = __OFADD__(v57, 1);
        uint64_t v59 = v57 + 1;
        if (v58) {
          goto LABEL_53;
        }
        v35[2] = v59;
      }
      ++v16;
      a1 = v138;
      if (v6 == v23)
      {
        swift_bridgeObjectRelease();
        v3 = v119;
        unint64_t v10 = v116;
        uint64_t v16 = v115;
        goto LABEL_28;
      }
    }
  }
  swift_bridgeObjectRelease();
  v35 = (uint64_t *)&_swiftEmptyDictionarySingleton;
LABEL_28:
  uint64_t v60 = (uint64_t)v125;
  if (v35[2] && (unint64_t v61 = sub_10000514C(1), (v62 & 1) != 0))
  {
    unint64_t v63 = *(void *)(v35[7] + 8 * v61);
    uint64_t v64 = enum case for REMNavigationSpecifier.SmartListPathSpecifier.showContents(_:);
    uint64_t v65 = sub_100021848();
    uint64_t v66 = (uint64_t)v117;
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v65 - 8) + 104))(v117, v64, v65);
    uint64_t v67 = enum case for REMNavigationSpecifier.today(_:);
    uint64_t v68 = sub_100021888();
    uint64_t v69 = *(void *)(v68 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v69 + 104))(v66, v67, v68);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v69 + 56))(v66, 0, 1, v68);
    swift_bridgeObjectRetain();
    v144._object = (void *)0x8000000100024F30;
    v143._countAndFlagsBits = 0x7961646F54;
    v143._object = (void *)0xE500000000000000;
    v144._countAndFlagsBits = 0xD000000000000010;
    uint64_t v70 = sub_100021728(v143, v144);
    uint64_t v72 = v71;
    sub_100011AC8(v66, v16, &qword_10002E600);
    *(void *)unint64_t v10 = v70;
    *(void *)(v10 + 8) = v72;
    v73 = v127;
    sub_100011AC8(v16, v10 + v127[5], &qword_10002E600);
    uint64_t v74 = sub_10000DE1C(v63, (uint64_t *)sub_10000E71C, 0);
    sub_100011B2C(v16, &qword_10002E600);
    *(void *)(v10 + v73[6]) = v74;
    uint64_t v75 = v128;
    sub_10000C9C8(v10, v128);
    sub_100011B2C(v66, &qword_10002E600);
    v76 = (void (*)(uint64_t, uint64_t, uint64_t, int *))*((void *)v3 + 7);
    v76(v75, 0, 1, v73);
    swift_bridgeObjectRelease();
    if (!v35[2]) {
      goto LABEL_35;
    }
  }
  else
  {
    v76 = (void (*)(uint64_t, uint64_t, uint64_t, int *))*((void *)v3 + 7);
    v76(v128, 1, 1, v127);
    if (!v35[2])
    {
LABEL_35:
      swift_release();
      v90 = v127;
      v76(v60, 1, 1, v127);
      goto LABEL_36;
    }
  }
  unint64_t v77 = sub_10000514C(0);
  if ((v78 & 1) == 0) {
    goto LABEL_35;
  }
  unint64_t v79 = *(void *)(v35[7] + 8 * v77);
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t v80 = enum case for REMNavigationSpecifier.SmartListPathSpecifier.showContents(_:);
  uint64_t v81 = sub_100021848();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v81 - 8) + 104))(v16, v80, v81);
  uint64_t v82 = enum case for REMNavigationSpecifier.today(_:);
  uint64_t v83 = sub_100021888();
  uint64_t v84 = *(void *)(v83 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v84 + 104))(v16, v82, v83);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v84 + 56))(v16, 0, 1, v83);
  swift_bridgeObjectRetain();
  uint64_t v85 = sub_100021738();
  uint64_t v87 = v86;
  uint64_t v88 = v60;
  uint64_t v89 = v118;
  sub_100011AC8(v16, v118, &qword_10002E600);
  *(void *)unint64_t v10 = v85;
  *(void *)(v10 + 8) = v87;
  v90 = v127;
  sub_100011AC8(v89, v10 + v127[5], &qword_10002E600);
  uint64_t v91 = sub_10000DE1C(v79, 0, 0);
  swift_bridgeObjectRelease();
  uint64_t v92 = v89;
  uint64_t v60 = v88;
  v3 = v119;
  sub_100011B2C(v92, &qword_10002E600);
  *(void *)(v10 + v90[6]) = v91;
  sub_10000C9C8(v10, v60);
  sub_100011B2C(v16, &qword_10002E600);
  v76(v60, 0, 1, v90);
  swift_bridgeObjectRelease();
LABEL_36:
  sub_10000C984(&qword_10002E060);
  uint64_t v93 = *(void *)(v120 + 72);
  unint64_t v94 = (*(unsigned __int8 *)(v120 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v120 + 80);
  uint64_t v95 = swift_allocObject();
  *(_OWORD *)(v95 + 16) = xmmword_100022920;
  uint64_t v96 = v95 + v94;
  sub_100011AC8(v128, v96, &qword_10002E050);
  uint64_t v97 = v96 + v93;
  sub_100011AC8(v60, v97, &qword_10002E050);
  uint64_t v98 = v124;
  sub_100011AC8(v96, v124, &qword_10002E050);
  uint64_t v99 = v98;
  uint64_t v100 = v123;
  sub_100011A64(v99, v123, &qword_10002E050);
  v101 = (unsigned int (*)(uint64_t, uint64_t, int *))*((void *)v3 + 6);
  if (v101(v100, 1, v90) == 1)
  {
    sub_100011B2C(v100, &qword_10002E050);
    v102 = _swiftEmptyArrayStorage;
  }
  else
  {
    uint64_t v103 = v122;
    sub_10000C9C8(v100, v122);
    sub_10000C9C8(v103, (uint64_t)v126);
    v102 = _swiftEmptyArrayStorage;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      v102 = (void *)sub_10001E89C(0, _swiftEmptyArrayStorage[2] + 1, 1, (unint64_t)_swiftEmptyArrayStorage);
    }
    unint64_t v105 = v102[2];
    unint64_t v104 = v102[3];
    if (v105 >= v104 >> 1) {
      v102 = (void *)sub_10001E89C(v104 > 1, v105 + 1, 1, (unint64_t)v102);
    }
    v102[2] = v105 + 1;
    sub_10000C9C8((uint64_t)v126, (uint64_t)v102+ ((v3[80] + 32) & ~(unint64_t)v3[80])+ *((void *)v3 + 9) * v105);
    v90 = v127;
    uint64_t v100 = v123;
  }
  uint64_t v106 = v97;
  uint64_t v107 = v124;
  sub_100011AC8(v106, v124, &qword_10002E050);
  sub_100011A64(v107, v100, &qword_10002E050);
  if (v101(v100, 1, v90) == 1)
  {
    sub_100011B2C(v100, &qword_10002E050);
    uint64_t v108 = (uint64_t)v125;
  }
  else
  {
    uint64_t v109 = v122;
    sub_10000C9C8(v100, v122);
    sub_10000C9C8(v109, (uint64_t)v126);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v108 = (uint64_t)v125;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      v102 = (void *)sub_10001E89C(0, v102[2] + 1, 1, (unint64_t)v102);
    }
    unint64_t v112 = v102[2];
    unint64_t v111 = v102[3];
    if (v112 >= v111 >> 1) {
      v102 = (void *)sub_10001E89C(v111 > 1, v112 + 1, 1, (unint64_t)v102);
    }
    v102[2] = v112 + 1;
    sub_10000C9C8((uint64_t)v126, (uint64_t)v102+ ((v3[80] + 32) & ~(unint64_t)v3[80])+ *((void *)v3 + 9) * v112);
  }
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  sub_100011B2C(v108, &qword_10002E050);
  sub_100011B2C(v128, &qword_10002E050);
  return (uint64_t)v102;
}

void *sub_100003FAC(unint64_t a1)
{
  uint64_t v2 = sub_10000C984(&qword_10002E600);
  __chkstk_darwin(v2 - 8);
  BOOL v58 = (char *)v55 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for TTRIIntentsSnippetSection();
  uint64_t v60 = *(void *)(v4 - 8);
  uint64_t v61 = v4;
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v59 = (void *)((char *)v55 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v5);
  uint64_t v62 = (uint64_t)v55 - v7;
  uint64_t v64 = &_swiftEmptyDictionarySingleton;
  if (a1 >> 62)
  {
LABEL_22:
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_100021E28();
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
      unint64_t v57 = a1 & 0xC000000000000001;
      uint64_t v9 = &_swiftEmptyDictionarySingleton;
      uint64_t v10 = 4;
      long long v56 = xmmword_100022910;
      do
      {
        if (v57) {
          id v12 = (id)sub_100021D48();
        }
        else {
          id v12 = *(id *)(a1 + 8 * v10);
        }
        id v13 = v12;
        uint64_t v14 = v10 - 3;
        if (__OFADD__(v10 - 4, 1))
        {
          __break(1u);
LABEL_20:
          __break(1u);
LABEL_21:
          __break(1u);
          goto LABEL_22;
        }
        uint64_t v15 = v8;
        id v16 = [v12 list];
        unint64_t v18 = sub_1000051B8((uint64_t)v16);
        uint64_t v19 = v9[2];
        BOOL v20 = (v17 & 1) == 0;
        uint64_t v21 = v19 + v20;
        if (__OFADD__(v19, v20)) {
          goto LABEL_20;
        }
        char v22 = v17;
        if (v9[3] < v21)
        {
          sub_100005BF4(v21, 1);
          uint64_t v9 = v64;
          unint64_t v23 = sub_1000051B8((uint64_t)v16);
          if ((v22 & 1) != (v24 & 1))
          {
            sub_100011CC0(0, &qword_10002E0E8);
            sub_100021ED8();
            __break(1u);
            uint64_t result = (void *)swift_release();
            __break(1u);
            return result;
          }
          unint64_t v18 = v23;
        }
        if (v22)
        {

          uint64_t v11 = (void *)(v9[7] + 8 * v18);
          sub_1000219F8();
          if (*(void *)((*v11 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v11 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_100021A38();
          }
          sub_100021A58();
          sub_100021A28();
        }
        else
        {
          sub_10000C984(&qword_10002E058);
          uint64_t v25 = swift_allocObject();
          *(_OWORD *)(v25 + 16) = v56;
          *(void *)(v25 + 32) = v13;
          uint64_t v63 = v25;
          sub_100021A28();
          uint64_t v26 = v63;
          v9[(v18 >> 6) + 8] |= 1 << v18;
          uint64_t v27 = 8 * v18;
          *(void *)(v9[6] + v27) = v16;
          *(void *)(v9[7] + v27) = v26;
          uint64_t v28 = v9[2];
          BOOL v29 = __OFADD__(v28, 1);
          uint64_t v30 = v28 + 1;
          if (v29) {
            goto LABEL_21;
          }
          v9[2] = v30;
        }
        uint64_t v8 = v15;
        ++v10;
      }
      while (v14 != v15);
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v31 = swift_bridgeObjectRetain();
  uint64_t v32 = sub_1000065C0(v31);
  swift_release();
  uint64_t v64 = v32;
  sub_1000062C8(&v64);
  swift_release();
  uint64_t v33 = v64;
  int64_t v34 = v64[2];
  if (v34)
  {
    uint64_t v64 = _swiftEmptyArrayStorage;
    sub_10000ADC8(0, v34, 0);
    v35 = v64;
    LODWORD(v56) = enum case for REMNavigationSpecifier.ListPathSpecifier.showContents(_:);
    LODWORD(v57) = enum case for REMNavigationSpecifier.list(_:);
    v55[1] = v33;
    v36 = v33 + 5;
    v37 = v58;
    do
    {
      id v38 = (id)*(v36 - 1);
      swift_bridgeObjectRetain();
      id v39 = [v38 displayName];
      uint64_t v40 = sub_100021998();
      uint64_t v42 = v41;

      v43 = (char *)v37 + *(int *)(sub_10000C984(&qword_10002E0E0) + 48);
      void *v37 = [v38 objectID];
      uint64_t v44 = sub_100021858();
      (*(void (**)(char *, void, uint64_t))(*(void *)(v44 - 8) + 104))(v43, v56, v44);
      uint64_t v45 = sub_100021888();
      uint64_t v46 = *(void *)(v45 - 8);
      (*(void (**)(void *, void, uint64_t))(v46 + 104))(v37, v57, v45);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v46 + 56))(v37, 0, 1, v45);
      uint64_t v47 = (uint64_t)v59;
      *uint64_t v59 = v40;
      *(void *)(v47 + 8) = v42;
      uint64_t v48 = v61;
      sub_100011AC8((uint64_t)v37, v47 + *(int *)(v61 + 20), &qword_10002E600);
      unint64_t v49 = swift_bridgeObjectRetain();
      uint64_t v50 = sub_10000DE1C(v49, (uint64_t *)sub_10000D32C, 0);
      swift_bridgeObjectRelease();
      sub_100011B2C((uint64_t)v37, &qword_10002E600);
      uint64_t v51 = v62;
      *(void *)(v47 + *(int *)(v48 + 24)) = v50;
      sub_10000C9C8(v47, v51);
      swift_bridgeObjectRelease();

      uint64_t v64 = v35;
      unint64_t v53 = v35[2];
      unint64_t v52 = v35[3];
      if (v53 >= v52 >> 1)
      {
        sub_10000ADC8(v52 > 1, v53 + 1, 1);
        v35 = v64;
      }
      v35[2] = v53 + 1;
      sub_10000C9C8(v62, (uint64_t)v35+ ((*(unsigned __int8 *)(v60 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v60 + 80))+ *(void *)(v60 + 72) * v53);
      v36 += 2;
      --v34;
    }
    while (v34);
    swift_release();
  }
  else
  {
    swift_release();
    return _swiftEmptyArrayStorage;
  }
  return v35;
}

uint64_t sub_1000045E0(void *a1, uint64_t a2)
{
  if ((a2 & 0xC000000000000001) != 0)
  {
    id v3 = a1;
    char v4 = sub_100021CE8();

    return v4 & 1;
  }
  if (!*(void *)(a2 + 16)
    || (Swift::Int v6 = sub_100021C08(*(void *)(a2 + 40)),
        uint64_t v7 = -1 << *(unsigned char *)(a2 + 32),
        unint64_t v8 = v6 & ~v7,
        uint64_t v9 = a2 + 56,
        ((*(void *)(a2 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0))
  {
LABEL_11:
    char v12 = 0;
    return v12 & 1;
  }
  sub_100011CC0(0, (unint64_t *)&unk_10002E6F0);
  id v10 = *(id *)(*(void *)(a2 + 48) + 8 * v8);
  char v11 = sub_100021C18();

  if ((v11 & 1) == 0)
  {
    uint64_t v13 = ~v7;
    unint64_t v14 = (v8 + 1) & v13;
    if ((*(void *)(v9 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14))
    {
      do
      {
        id v15 = *(id *)(*(void *)(a2 + 48) + 8 * v14);
        char v12 = sub_100021C18();

        if (v12) {
          break;
        }
        unint64_t v14 = (v14 + 1) & v13;
      }
      while (((*(void *)(v9 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14) & 1) != 0);
      return v12 & 1;
    }
    goto LABEL_11;
  }
  char v12 = 1;
  return v12 & 1;
}

void *sub_100004740(unint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  *(void *)(swift_allocObject() + 16) = a2;
  if (a1 >> 62) {
    goto LABEL_21;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v4)
  {
    while (1)
    {
      unint64_t v5 = 0;
      unint64_t v6 = a1 & 0xC000000000000001;
      uint64_t v7 = a1 & 0xFFFFFFFFFFFFFF8;
      uint64_t v19 = a1 & 0xFFFFFFFFFFFFFF8;
      while (v6)
      {
        id v8 = (id)sub_100021D48();
LABEL_9:
        uint64_t v9 = v8;
        unint64_t v10 = v5 + 1;
        if (__OFADD__(v5, 1)) {
          goto LABEL_20;
        }
        uint64_t v11 = sub_100021AB8();
        if (v11)
        {
          char v12 = (void *)v11;
          if ([v9 isSubtask])
          {
            unint64_t v13 = v6;
            uint64_t v14 = v4;
            unint64_t v15 = a1;
            uint64_t v16 = v2;
            char v17 = sub_1000045E0(v12, v2);

            if (v17)
            {
              sub_100021D78();
              sub_100021DA8();
              sub_100021DB8();
              sub_100021D88();
            }
            else
            {
            }
            uint64_t v2 = v16;
            a1 = v15;
            uint64_t v4 = v14;
            unint64_t v6 = v13;
            uint64_t v7 = v19;
          }
          else
          {
          }
        }
        else
        {
        }
        ++v5;
        if (v10 == v4) {
          goto LABEL_22;
        }
      }
      if (v5 < *(void *)(v7 + 16)) {
        break;
      }
      __break(1u);
LABEL_20:
      __break(1u);
LABEL_21:
      swift_bridgeObjectRetain();
      uint64_t v4 = sub_100021E28();
      if (!v4) {
        goto LABEL_22;
      }
    }
    id v8 = *(id *)(a1 + 8 * v5 + 32);
    goto LABEL_9;
  }
LABEL_22:
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return _swiftEmptyArrayStorage;
}

void sub_100004940()
{
  uint64_t v0 = sub_1000215E8();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  id v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = [objc_allocWithZone((Class)NSDateFormatter) init];
  sub_1000215D8();
  Class isa = sub_1000215C8().super.isa;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  [v4 setLocale:isa];

  NSString v6 = sub_100021968();
  [v4 setLocalizedDateFormatFromTemplate:v6];

  qword_10002E018 = (uint64_t)v4;
}

uint64_t sub_100004A84(uint64_t a1, uint64_t a2)
{
  return sub_100004BF0(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100004A9C(uint64_t a1, id *a2)
{
  uint64_t result = sub_100021978();
  *a2 = 0;
  return result;
}

uint64_t sub_100004B14(uint64_t a1, id *a2)
{
  char v3 = sub_100021988();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_100004B94@<X0>(void *a1@<X8>)
{
  sub_100021998();
  NSString v2 = sub_100021968();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100004BD8(uint64_t a1, uint64_t a2)
{
  return sub_100004BF0(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100004BF0(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_100021998();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_100004C34()
{
  sub_100021998();
  sub_1000219C8();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100004C88()
{
  sub_100021998();
  sub_100021EF8();
  sub_1000219C8();
  Swift::Int v0 = sub_100021F18();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100004CFC()
{
  uint64_t v0 = sub_100021998();
  uint64_t v2 = v1;
  if (v0 == sub_100021998() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_100021EB8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_100004D88@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_100021968();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100004DD0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100021998();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100004DFC(uint64_t a1)
{
  uint64_t v2 = sub_10000F5B0((unint64_t *)&qword_10002E218, type metadata accessor for Key);
  uint64_t v3 = sub_10000F5B0(&qword_10002E220, type metadata accessor for Key);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

unint64_t sub_100004EB8(void *a1)
{
  sub_100021EF8();
  if (a1)
  {
    sub_100021F08(1u);
    id v2 = a1;
    sub_100021C28();
  }
  else
  {
    sub_100021F08(0);
  }
  Swift::Int v3 = sub_100021F18();

  return sub_10000A1E8(a1, v3);
}

unint64_t sub_100004F48(uint64_t a1)
{
  uint64_t v2 = sub_1000215B8();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  char v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000C984(&qword_10002E070);
  __chkstk_darwin(v6 - 8);
  id v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100021EF8();
  sub_100011AC8(a1, (uint64_t)v8, &qword_10002E070);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2) == 1)
  {
    sub_100021F08(0);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v8, v2);
    sub_100021F08(1u);
    sub_10000F5B0(&qword_10002E0A8, (void (*)(uint64_t))&type metadata accessor for Date);
    sub_100021938();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  Swift::Int v9 = sub_100021F18();
  return sub_10000A2EC(a1, v9);
}

unint64_t sub_10000514C(int a1)
{
  sub_100021EF8();
  sub_100021F08(a1 & 1);
  Swift::Int v2 = sub_100021F18();

  return sub_10000A714(a1, v2);
}

unint64_t sub_1000051B8(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_100021C08(*(void *)(v2 + 40));
  return sub_10000AA1C(a1, v4, &qword_10002E0E8);
}

unint64_t sub_100005208(uint64_t a1, uint64_t a2)
{
  sub_100021EF8();
  sub_1000219C8();
  Swift::Int v4 = sub_100021F18();

  return sub_10000A7C0(a1, a2, v4);
}

unint64_t sub_100005280(uint64_t a1)
{
  sub_100021998();
  sub_100021EF8();
  sub_1000219C8();
  Swift::Int v2 = sub_100021F18();
  swift_bridgeObjectRelease();

  return sub_10000A8A4(a1, v2);
}

unint64_t sub_100005314(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_100021C08(*(void *)(v2 + 40));
  return sub_10000AA1C(a1, v4, (unint64_t *)&unk_10002E6F0);
}

uint64_t sub_100005364(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_10000C984(&qword_10002E120);
  uint64_t v6 = sub_100021E48();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_43;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
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
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }
    if (v18 >= v36) {
      break;
    }
    uint64_t v19 = (void *)(v5 + 64);
    unint64_t v20 = *(void *)(v37 + 8 * v18);
    ++v13;
    if (!v20)
    {
      int64_t v13 = v18 + 1;
      if (v18 + 1 >= v36) {
        goto LABEL_36;
      }
      unint64_t v20 = *(void *)(v37 + 8 * v13);
      if (!v20)
      {
        int64_t v21 = v18 + 2;
        if (v21 >= v36)
        {
LABEL_36:
          swift_release();
          uint64_t v3 = v35;
          if ((a2 & 1) == 0) {
            goto LABEL_43;
          }
          goto LABEL_39;
        }
        unint64_t v20 = *(void *)(v37 + 8 * v21);
        if (!v20)
        {
          while (1)
          {
            int64_t v13 = v21 + 1;
            if (__OFADD__(v21, 1)) {
              goto LABEL_45;
            }
            if (v13 >= v36) {
              goto LABEL_36;
            }
            unint64_t v20 = *(void *)(v37 + 8 * v13);
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
    uint64_t v22 = 8 * v17;
    unint64_t v23 = *(void **)(*(void *)(v5 + 48) + v22);
    uint64_t v24 = *(void *)(*(void *)(v5 + 56) + v22);
    if ((a2 & 1) == 0)
    {
      id v25 = v23;
      swift_bridgeObjectRetain();
    }
    sub_100021EF8();
    if (v23)
    {
      sub_100021F08(1u);
      id v26 = v23;
      sub_100021C28();
    }
    else
    {
      sub_100021F08(0);
    }
    uint64_t result = sub_100021F18();
    uint64_t v27 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v28 = result & ~v27;
    unint64_t v29 = v28 >> 6;
    if (((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6))) != 0)
    {
      unint64_t v14 = __clz(__rbit64((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_44;
        }
        BOOL v32 = v29 == v31;
        if (v29 == v31) {
          unint64_t v29 = 0;
        }
        v30 |= v32;
        uint64_t v33 = *(void *)(v11 + 8 * v29);
      }
      while (v33 == -1);
      unint64_t v14 = __clz(__rbit64(~v33)) + (v29 << 6);
    }
    *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    uint64_t v15 = 8 * v14;
    *(void *)(*(void *)(v7 + 48) + v15) = v23;
    *(void *)(*(void *)(v7 + 56) + v15) = v24;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  uint64_t v19 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_43;
  }
LABEL_39:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v19, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v19 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_43:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_100005680(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_10000C984(&qword_10002E070);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  sub_10000C984(&qword_10002E0A0);
  unint64_t v10 = (void *)sub_100021E48();
  if (*(void *)(v9 + 16))
  {
    uint64_t v27 = v3;
    uint64_t v11 = 1 << *(unsigned char *)(v9 + 32);
    char v12 = (void *)(v9 + 64);
    uint64_t v13 = -1;
    if (v11 < 64) {
      uint64_t v13 = ~(-1 << v11);
    }
    unint64_t v14 = v13 & *(void *)(v9 + 64);
    int64_t v15 = (unint64_t)(v11 + 63) >> 6;
    uint64_t result = swift_retain();
    int64_t v17 = 0;
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
          __break(1u);
LABEL_32:
          __break(1u);
          return result;
        }
        if (v21 >= v15) {
          goto LABEL_23;
        }
        unint64_t v22 = v12[v21];
        ++v17;
        if (!v22)
        {
          int64_t v17 = v21 + 1;
          if (v21 + 1 >= v15) {
            goto LABEL_23;
          }
          unint64_t v22 = v12[v17];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v15)
            {
LABEL_23:
              swift_release();
              if ((a2 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v27;
                goto LABEL_30;
              }
              uint64_t v25 = 1 << *(unsigned char *)(v9 + 32);
              if (v25 >= 64) {
                bzero((void *)(v9 + 64), ((unint64_t)(v25 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *char v12 = -1 << v25;
              }
              uint64_t v3 = v27;
              *(void *)(v9 + 16) = 0;
              break;
            }
            unint64_t v22 = v12[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v17 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_32;
                }
                if (v17 >= v15) {
                  goto LABEL_23;
                }
                unint64_t v22 = v12[v17];
                ++v23;
                if (v22) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v17 = v23;
          }
        }
LABEL_20:
        unint64_t v14 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v17 << 6);
      }
      uint64_t v24 = *(void *)(v9 + 48) + *(void *)(v6 + 72) * v20;
      if (a2)
      {
        sub_100011A64(v24, (uint64_t)v8, &qword_10002E070);
        uint64_t v18 = *(void *)(*(void *)(v9 + 56) + 8 * v20);
      }
      else
      {
        sub_100011AC8(v24, (uint64_t)v8, &qword_10002E070);
        uint64_t v18 = *(void *)(*(void *)(v9 + 56) + 8 * v20);
        swift_bridgeObjectRetain();
      }
      uint64_t result = sub_10000AB30((uint64_t)v8, v18, v10);
    }
  }
  uint64_t result = swift_release();
LABEL_30:
  void *v3 = v10;
  return result;
}

uint64_t sub_100005920(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_10000C984(&qword_10002E068);
  uint64_t result = sub_100021E48();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    char v30 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v29 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v17 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v18 = v17 | (v8 << 6);
      }
      else
      {
        int64_t v19 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v19 >= v29) {
          goto LABEL_33;
        }
        unint64_t v20 = v30[v19];
        ++v8;
        if (!v20)
        {
          int64_t v8 = v19 + 1;
          if (v19 + 1 >= v29) {
            goto LABEL_33;
          }
          unint64_t v20 = v30[v8];
          if (!v20)
          {
            int64_t v21 = v19 + 2;
            if (v21 >= v29)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v2;
                goto LABEL_40;
              }
              uint64_t v28 = 1 << *(unsigned char *)(v5 + 32);
              if (v28 >= 64) {
                bzero(v30, ((unint64_t)(v28 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *char v30 = -1 << v28;
              }
              uint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v20 = v30[v21];
            if (!v20)
            {
              while (1)
              {
                int64_t v8 = v21 + 1;
                if (__OFADD__(v21, 1)) {
                  goto LABEL_42;
                }
                if (v8 >= v29) {
                  goto LABEL_33;
                }
                unint64_t v20 = v30[v8];
                ++v21;
                if (v20) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v21;
          }
        }
LABEL_30:
        unint64_t v11 = (v20 - 1) & v20;
        unint64_t v18 = __clz(__rbit64(v20)) + (v8 << 6);
      }
      Swift::UInt8 v26 = *(unsigned char *)(*(void *)(v5 + 48) + v18);
      uint64_t v27 = *(void *)(*(void *)(v5 + 56) + 8 * v18);
      if ((a2 & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      sub_100021EF8();
      sub_100021F08(v26);
      uint64_t result = sub_100021F18();
      uint64_t v13 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v14 = result & ~v13;
      unint64_t v15 = v14 >> 6;
      if (((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v22 = 0;
        unint64_t v23 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v24 = v15 == v23;
          if (v15 == v23) {
            unint64_t v15 = 0;
          }
          v22 |= v24;
          uint64_t v25 = *(void *)(v12 + 8 * v15);
        }
        while (v25 == -1);
        unint64_t v16 = __clz(__rbit64(~v25)) + (v15 << 6);
      }
      *(void *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      *(unsigned char *)(*(void *)(v7 + 48) + v16) = v26;
      *(void *)(*(void *)(v7 + 56) + 8 * v16) = v27;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_100005BF4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_10000C984(&qword_10002E0F0);
  uint64_t v6 = sub_100021E48();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  v35 = v2;
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
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11) {
      break;
    }
    unint64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v36 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((a2 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v11) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v36 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = 8 * v21;
    unint64_t v31 = *(void **)(*(void *)(v5 + 48) + v30);
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + v30);
    if ((a2 & 1) == 0)
    {
      id v33 = v31;
      swift_bridgeObjectRetain();
    }
    uint64_t result = sub_100021C08(*(void *)(v7 + 40));
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = 8 * v18;
    *(void *)(*(void *)(v7 + 48) + v19) = v31;
    *(void *)(*(void *)(v7 + 56) + v19) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  unint64_t v23 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v23 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_100005ECC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_10000C984((uint64_t *)&unk_10002E720);
  uint64_t v6 = sub_100021E48();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v2;
  uint64_t v37 = v5 + 64;
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
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11) {
      break;
    }
    unint64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v37 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v37 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v36;
          if ((a2 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v37 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v11) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v37 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = 8 * v21;
    unint64_t v31 = *(void **)(*(void *)(v5 + 48) + v30);
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + v30);
    if ((a2 & 1) == 0)
    {
      id v33 = v31;
      id v34 = v32;
    }
    uint64_t result = sub_100021C08(*(void *)(v7 + 40));
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = 8 * v18;
    *(void *)(*(void *)(v7 + 48) + v19) = v31;
    *(void *)(*(void *)(v7 + 56) + v19) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v36;
  unint64_t v23 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
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
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_1000061A0(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v2 = sub_10000CAAC(v2);
    *a1 = v2;
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_10001069C(v6);
  return sub_100021D88();
}

Swift::Int sub_10000621C(void **a1)
{
  uint64_t v2 = *(void *)(sub_10000C984(&qword_10002E078) - 8);
  uint64_t v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v3 = (void *)sub_10000CAC0(v3);
  }
  uint64_t v4 = v3[2];
  v6[0] = (uint64_t)v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  Swift::Int result = sub_1000067A4(v6);
  *a1 = v3;
  return result;
}

Swift::Int sub_1000062C8(void **a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (void *)sub_10000CAD4(v2);
  }
  uint64_t v3 = v2[2];
  v5[0] = (uint64_t)(v2 + 4);
  v5[1] = v3;
  Swift::Int result = sub_100007A30(v5);
  *a1 = v2;
  return result;
}

void *sub_100006334(unint64_t a1)
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
      sub_10000C984(&qword_10002E058);
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
    sub_10000C354((unint64_t)(v3 + 4), v2, v1);
    unint64_t v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_100021E28();
    swift_bridgeObjectRelease();
    if (!v2) {
      return _swiftEmptyArrayStorage;
    }
  }
  return v3;
}

void *sub_10000642C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  sub_10000C984(&qword_10002E0C8);
  uint64_t v3 = *(void *)(sub_10000C984(&qword_10002E078) - 8);
  uint64_t v4 = *(void *)(v3 + 72);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v6 = (void *)swift_allocObject();
  Swift::Int result = (void *)j__malloc_size(v6);
  if (v4)
  {
    if ((void *)((char *)result - v5) != (void *)0x8000000000000000 || v4 != -1)
    {
      uint64_t v6[2] = v1;
      v6[3] = 2 * ((uint64_t)((uint64_t)result - v5) / v4);
      uint64_t v9 = *(void *)(sub_10000C984(&qword_10002E078) - 8);
      uint64_t v10 = sub_10000CAE8(&v11, (uint64_t)v6 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80)), v1, a1);
      swift_bridgeObjectRetain();
      sub_100011A5C();
      if (v10 == v1) {
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

void *sub_1000065C0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  sub_10000C984(&qword_10002E0F8);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = j__malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = sub_10000CE40((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_100011A5C();
  if (v6 != v1)
  {
    __break(1u);
    return _swiftEmptyArrayStorage;
  }
  return v3;
}

uint64_t *sub_1000066A8(unint64_t a1)
{
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v2 = sub_100021DE8();
    if (v2) {
      goto LABEL_3;
    }
    return (uint64_t *)&_swiftEmptyArrayStorage;
  }
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    return (uint64_t *)&_swiftEmptyArrayStorage;
  }
LABEL_3:
  if (v2 <= 0)
  {
    uint64_t v3 = (uint64_t *)&_swiftEmptyArrayStorage;
  }
  else
  {
    sub_10000C984(&qword_10002E058);
    uint64_t v3 = (uint64_t *)swift_allocObject();
    int64_t v4 = j__malloc_size(v3);
    uint64_t v5 = v4 - 32;
    if (v4 < 32) {
      uint64_t v5 = v4 - 25;
    }
    v3[2] = v2;
    v3[3] = (2 * (v5 >> 3)) | 1;
  }
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_10000D058((uint64_t)&v8, v3 + 4, v2, a1);
  Swift::Int result = (uint64_t *)sub_100011A5C();
  if (v6 == v2) {
    return v3;
  }
  __break(1u);
  return result;
}

Swift::Int sub_1000067A4(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_10000C984(&qword_10002E070);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = (char *)&v180 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v5);
  uint64_t v10 = (char *)&v180 - v9;
  uint64_t v11 = __chkstk_darwin(v8);
  uint64_t v13 = (char *)&v180 - v12;
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v201 = (uint64_t)&v180 - v15;
  uint64_t v16 = __chkstk_darwin(v14);
  v185 = (char *)&v180 - v17;
  __chkstk_darwin(v16);
  uint64_t v184 = (uint64_t)&v180 - v18;
  uint64_t v211 = sub_1000215B8();
  uint64_t v19 = *(void *)(v211 - 8);
  uint64_t v20 = __chkstk_darwin(v211);
  v202 = (char *)&v180 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __chkstk_darwin(v20);
  v216 = (char *)&v180 - v23;
  uint64_t v24 = __chkstk_darwin(v22);
  v188 = (char *)&v180 - v25;
  uint64_t v26 = __chkstk_darwin(v24);
  v191 = (char *)&v180 - v27;
  uint64_t v28 = __chkstk_darwin(v26);
  v183 = (char *)&v180 - v29;
  __chkstk_darwin(v28);
  unint64_t v31 = (char *)&v180 - v30;
  uint64_t v203 = sub_10000C984(&qword_10002E078);
  uint64_t v199 = *(void *)(v203 - 8);
  uint64_t v32 = __chkstk_darwin(v203);
  uint64_t v193 = (uint64_t)&v180 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = __chkstk_darwin(v32);
  uint64_t v215 = (uint64_t)&v180 - v35;
  uint64_t v36 = __chkstk_darwin(v34);
  v189 = (char *)&v180 - v37;
  uint64_t v38 = __chkstk_darwin(v36);
  uint64_t v220 = (uint64_t)&v180 - v39;
  uint64_t v40 = __chkstk_darwin(v38);
  uint64_t v42 = (char *)&v180 - v41;
  uint64_t v43 = __chkstk_darwin(v40);
  uint64_t v197 = (uint64_t)&v180 - v44;
  uint64_t v45 = __chkstk_darwin(v43);
  uint64_t v187 = (uint64_t)&v180 - v46;
  __chkstk_darwin(v45);
  uint64_t v186 = (uint64_t)&v180 - v47;
  v221 = a1;
  Swift::Int v48 = a1[1];
  Swift::Int result = sub_100021EA8(v48);
  if (result < v48)
  {
    if (v48 >= 0) {
      uint64_t v50 = v48;
    }
    else {
      uint64_t v50 = v48 + 1;
    }
    if (v48 < -1)
    {
LABEL_168:
      Swift::Int result = sub_100021E18();
      __break(1u);
      return result;
    }
    v204 = v7;
    v196 = v42;
    Swift::Int v182 = result;
    if (v48 < 2)
    {
      unint64_t v198 = (unint64_t)_swiftEmptyArrayStorage
           + ((*(unsigned __int8 *)(v199 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v199 + 80));
      if (v48 != 1)
      {
        unint64_t v58 = _swiftEmptyArrayStorage[2];
        long long v56 = (char *)_swiftEmptyArrayStorage;
        v173 = _swiftEmptyArrayStorage;
        if (v58 < 2) {
          goto LABEL_123;
        }
        goto LABEL_126;
      }
      uint64_t v51 = 1;
      v180 = _swiftEmptyArrayStorage;
    }
    else
    {
      uint64_t v51 = v48;
      uint64_t v52 = v50 >> 1;
      uint64_t v53 = sub_100021A48();
      *(void *)(v53 + 16) = v52;
      uint64_t v54 = *(unsigned __int8 *)(v199 + 80);
      v180 = (void *)v53;
      unint64_t v198 = v53 + ((v54 + 32) & ~v54);
    }
    uint64_t v55 = 0;
    v210 = (void (**)(char *, uint64_t, uint64_t))(v19 + 48);
    v205 = (void (**)(char *, uint64_t))(v19 + 8);
    v206 = (void (**)(char *, uint64_t, uint64_t))(v19 + 32);
    long long v56 = (char *)_swiftEmptyArrayStorage;
    v212 = v10;
    v190 = v13;
    v181 = v31;
    uint64_t v57 = v51;
    while (1)
    {
      uint64_t v59 = v55 + 1;
      v194 = v56;
      uint64_t v195 = v55;
      if (v55 + 1 >= v57)
      {
        uint64_t v72 = (uint64_t)v189;
        v73 = &qword_10002E070;
      }
      else
      {
        uint64_t v218 = v57;
        uint64_t v60 = v55;
        uint64_t v61 = *v221;
        uint64_t v62 = *(void *)(v199 + 72);
        uint64_t v213 = v55 + 1;
        uint64_t v63 = v61 + v62 * v59;
        uint64_t v64 = v186;
        sub_100011AC8(v63, v186, &qword_10002E078);
        uint64_t v207 = v61;
        uint64_t v219 = v62;
        uint64_t v65 = v61 + v62 * v60;
        uint64_t v66 = v187;
        sub_100011AC8(v65, v187, &qword_10002E078);
        uint64_t v67 = v184;
        sub_100011AC8(v64, v184, &qword_10002E070);
        uint64_t v68 = v211;
        uint64_t v69 = *v210;
        unsigned int v70 = ((unint64_t (*)(uint64_t, uint64_t, uint64_t))*v210)(v67, 1, v211);
        uint64_t v71 = (uint64_t)v185;
        if (v70 == 1)
        {
          sub_100011B2C(v67, &qword_10002E070);
          LODWORD(v217) = 0;
        }
        else
        {
          v217 = *v206;
          v217(v181, v67, v68);
          sub_100011AC8(v66, v71, &qword_10002E070);
          if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v69)(v71, 1, v68) == 1)
          {
            (*v205)(v181, v68);
            sub_100011B2C(v71, &qword_10002E070);
            LODWORD(v217) = 1;
          }
          else
          {
            uint64_t v74 = v183;
            v217(v183, v71, v68);
            uint64_t v75 = v181;
            LODWORD(v217) = sub_100021588();
            v76 = *v205;
            (*v205)(v74, v68);
            v76(v75, v68);
          }
        }
        uint64_t v57 = v218;
        sub_100011B2C(v187, &qword_10002E078);
        sub_100011B2C(v186, &qword_10002E078);
        uint64_t v55 = v195;
        uint64_t v59 = v195 + 2;
        long long v56 = v194;
        if (v195 + 2 >= v57)
        {
          uint64_t v72 = (uint64_t)v189;
        }
        else
        {
          v214 = v69;
          uint64_t v77 = v207;
          uint64_t v208 = v219 * v59;
          uint64_t v209 = v219 * v213;
          char v78 = v191;
          while (1)
          {
            uint64_t v200 = v2;
            uint64_t v213 = v59;
            uint64_t v79 = v197;
            sub_100011AC8(v77 + v208, v197, &qword_10002E078);
            uint64_t v80 = (uint64_t)v196;
            sub_100011AC8(v77 + v209, (uint64_t)v196, &qword_10002E078);
            uint64_t v81 = v79;
            uint64_t v82 = v201;
            sub_100011AC8(v81, v201, &qword_10002E070);
            uint64_t v83 = v211;
            uint64_t v84 = v214;
            if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v214)(v82, 1, v211) == 1)
            {
              sub_100011B2C(v82, &qword_10002E070);
              char v85 = 0;
            }
            else
            {
              uint64_t v86 = v82;
              uint64_t v87 = *v206;
              (*v206)(v78, v86, v83);
              uint64_t v88 = v80;
              uint64_t v89 = (uint64_t)v190;
              sub_100011AC8(v88, (uint64_t)v190, &qword_10002E070);
              if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v84)(v89, 1, v83) == 1)
              {
                (*v205)(v78, v83);
                sub_100011B2C(v89, &qword_10002E070);
                char v85 = 1;
              }
              else
              {
                v90 = v188;
                v87(v188, v89, v83);
                char v85 = sub_100021588();
                uint64_t v91 = *v205;
                char v78 = v191;
                (*v205)(v90, v83);
                v91(v78, v83);
              }
            }
            sub_100011B2C((uint64_t)v196, &qword_10002E078);
            sub_100011B2C(v197, &qword_10002E078);
            char v92 = v217 ^ v85;
            long long v56 = v194;
            uint64_t v2 = v200;
            uint64_t v57 = v218;
            if (v92) {
              break;
            }
            uint64_t v59 = v213 + 1;
            v77 += v219;
            if (v218 == v213 + 1)
            {
              uint64_t v59 = v218;
              uint64_t v10 = v212;
              goto LABEL_35;
            }
          }
          uint64_t v10 = v212;
          uint64_t v59 = v213;
LABEL_35:
          uint64_t v72 = (uint64_t)v189;
          uint64_t v55 = v195;
        }
        v73 = &qword_10002E070;
        if (v217)
        {
          if (v59 < v55) {
            goto LABEL_161;
          }
          if (v55 < v59)
          {
            uint64_t v93 = 0;
            uint64_t v94 = v219 * (v59 - 1);
            uint64_t v95 = v59 * v219;
            uint64_t v96 = v55;
            uint64_t v97 = v55 * v219;
            uint64_t v98 = v207;
            do
            {
              if (v96 != v59 + v93 - 1)
              {
                uint64_t v200 = v2;
                if (!v98) {
                  goto LABEL_166;
                }
                unint64_t v100 = v98 + v97;
                v217 = (void (*)(char *, uint64_t, uint64_t))(v98 + v94);
                uint64_t v101 = v98;
                sub_100011A64(v98 + v97, v193, &qword_10002E078);
                if (v97 < v94 || v100 >= v101 + v95)
                {
                  uint64_t v99 = (uint64_t)v217;
                  swift_arrayInitWithTakeFrontToBack();
                }
                else
                {
                  uint64_t v99 = (uint64_t)v217;
                  if (v97 != v94) {
                    swift_arrayInitWithTakeBackToFront();
                  }
                }
                sub_100011A64(v193, v99, &qword_10002E078);
                uint64_t v2 = v200;
                uint64_t v98 = v207;
              }
              ++v96;
              --v93;
              v94 -= v219;
              v95 -= v219;
              v97 += v219;
            }
            while (v96 < v59 + v93);
            uint64_t v10 = v212;
            uint64_t v72 = (uint64_t)v189;
            v73 = &qword_10002E070;
            uint64_t v55 = v195;
            uint64_t v57 = v218;
          }
        }
      }
      if (v59 >= v57) {
        goto LABEL_75;
      }
      if (__OFSUB__(v59, v55)) {
        goto LABEL_159;
      }
      if (v59 - v55 >= v182)
      {
LABEL_74:
        uint64_t v55 = v195;
        goto LABEL_75;
      }
      if (__OFADD__(v195, v182)) {
        goto LABEL_162;
      }
      if (v195 + v182 >= v57) {
        uint64_t v102 = v57;
      }
      else {
        uint64_t v102 = v195 + v182;
      }
      if (v102 < v195)
      {
LABEL_163:
        __break(1u);
LABEL_164:
        __break(1u);
LABEL_165:
        __break(1u);
LABEL_166:
        __break(1u);
LABEL_167:
        __break(1u);
        goto LABEL_168;
      }
      if (v59 != v102) {
        break;
      }
      uint64_t v55 = v195;
LABEL_75:
      if (v59 < v55) {
        goto LABEL_154;
      }
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v213 = v59;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
        long long v56 = sub_100009E1C(0, *((void *)v56 + 2) + 1, 1, v56);
      }
      unint64_t v124 = *((void *)v56 + 2);
      unint64_t v123 = *((void *)v56 + 3);
      unint64_t v58 = v124 + 1;
      if (v124 >= v123 >> 1) {
        long long v56 = sub_100009E1C((char *)(v123 > 1), v124 + 1, 1, v56);
      }
      *((void *)v56 + 2) = v58;
      v125 = v56 + 32;
      v126 = &v56[16 * v124 + 32];
      uint64_t v127 = v213;
      *(void *)v126 = v195;
      *((void *)v126 + 1) = v127;
      if (v124)
      {
        while (1)
        {
          unint64_t v128 = v58 - 1;
          if (v58 >= 4)
          {
            v133 = &v125[16 * v58];
            uint64_t v134 = *((void *)v133 - 8);
            uint64_t v135 = *((void *)v133 - 7);
            BOOL v139 = __OFSUB__(v135, v134);
            uint64_t v136 = v135 - v134;
            if (v139) {
              goto LABEL_143;
            }
            uint64_t v138 = *((void *)v133 - 6);
            uint64_t v137 = *((void *)v133 - 5);
            BOOL v139 = __OFSUB__(v137, v138);
            uint64_t v131 = v137 - v138;
            char v132 = v139;
            if (v139) {
              goto LABEL_144;
            }
            unint64_t v140 = v58 - 2;
            uint64_t v141 = &v125[16 * v58 - 32];
            uint64_t v143 = *(void *)v141;
            uint64_t v142 = *((void *)v141 + 1);
            BOOL v139 = __OFSUB__(v142, v143);
            uint64_t v144 = v142 - v143;
            if (v139) {
              goto LABEL_146;
            }
            BOOL v139 = __OFADD__(v131, v144);
            uint64_t v145 = v131 + v144;
            if (v139) {
              goto LABEL_149;
            }
            if (v145 >= v136)
            {
              v163 = &v125[16 * v128];
              uint64_t v165 = *(void *)v163;
              uint64_t v164 = *((void *)v163 + 1);
              BOOL v139 = __OFSUB__(v164, v165);
              uint64_t v166 = v164 - v165;
              if (v139) {
                goto LABEL_153;
              }
              BOOL v156 = v131 < v166;
              goto LABEL_112;
            }
          }
          else
          {
            if (v58 != 3)
            {
              uint64_t v157 = *((void *)v56 + 4);
              uint64_t v158 = *((void *)v56 + 5);
              BOOL v139 = __OFSUB__(v158, v157);
              uint64_t v150 = v158 - v157;
              char v151 = v139;
              goto LABEL_106;
            }
            uint64_t v130 = *((void *)v56 + 4);
            uint64_t v129 = *((void *)v56 + 5);
            BOOL v139 = __OFSUB__(v129, v130);
            uint64_t v131 = v129 - v130;
            char v132 = v139;
          }
          if (v132) {
            goto LABEL_145;
          }
          unint64_t v140 = v58 - 2;
          v146 = &v125[16 * v58 - 32];
          uint64_t v148 = *(void *)v146;
          uint64_t v147 = *((void *)v146 + 1);
          BOOL v149 = __OFSUB__(v147, v148);
          uint64_t v150 = v147 - v148;
          char v151 = v149;
          if (v149) {
            goto LABEL_148;
          }
          v152 = &v125[16 * v128];
          uint64_t v154 = *(void *)v152;
          uint64_t v153 = *((void *)v152 + 1);
          BOOL v139 = __OFSUB__(v153, v154);
          uint64_t v155 = v153 - v154;
          if (v139) {
            goto LABEL_151;
          }
          if (__OFADD__(v150, v155)) {
            goto LABEL_152;
          }
          if (v150 + v155 >= v131)
          {
            BOOL v156 = v131 < v155;
LABEL_112:
            if (v156) {
              unint64_t v128 = v140;
            }
            goto LABEL_114;
          }
LABEL_106:
          if (v151) {
            goto LABEL_147;
          }
          v159 = &v125[16 * v128];
          uint64_t v161 = *(void *)v159;
          uint64_t v160 = *((void *)v159 + 1);
          BOOL v139 = __OFSUB__(v160, v161);
          uint64_t v162 = v160 - v161;
          if (v139) {
            goto LABEL_150;
          }
          if (v162 < v150) {
            goto LABEL_15;
          }
LABEL_114:
          unint64_t v167 = v128 - 1;
          if (v128 - 1 >= v58)
          {
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
LABEL_161:
            __break(1u);
LABEL_162:
            __break(1u);
            goto LABEL_163;
          }
          if (!*v221) {
            goto LABEL_165;
          }
          v168 = &v125[16 * v167];
          uint64_t v169 = *(void *)v168;
          v170 = &v125[16 * v128];
          uint64_t v171 = *((void *)v170 + 1);
          sub_100008F54(*v221 + *(void *)(v199 + 72) * *(void *)v168, *v221 + *(void *)(v199 + 72) * *(void *)v170, *v221 + *(void *)(v199 + 72) * v171, v198);
          if (v2)
          {
            v173 = v180;
            goto LABEL_123;
          }
          if (v171 < v169) {
            goto LABEL_140;
          }
          if (v128 > *((void *)v56 + 2)) {
            goto LABEL_141;
          }
          *(void *)v168 = v169;
          *(void *)&v125[16 * v167 + 8] = v171;
          unint64_t v172 = *((void *)v56 + 2);
          if (v128 >= v172) {
            goto LABEL_142;
          }
          unint64_t v58 = v172 - 1;
          memmove(&v125[16 * v128], v170 + 16, 16 * (v172 - 1 - v128));
          *((void *)v56 + 2) = v172 - 1;
          BOOL v156 = v172 > 2;
          uint64_t v10 = v212;
          if (!v156) {
            goto LABEL_15;
          }
        }
      }
      unint64_t v58 = 1;
LABEL_15:
      uint64_t v57 = v221[1];
      uint64_t v55 = v213;
      if (v213 >= v57)
      {
        v173 = v180;
        if (v58 < 2)
        {
LABEL_123:
          swift_bridgeObjectRelease();
          v173[2] = 0;
          return swift_bridgeObjectRelease();
        }
LABEL_126:
        uint64_t v174 = *v221;
        while (1)
        {
          unint64_t v175 = v58 - 2;
          if (v58 < 2) {
            goto LABEL_155;
          }
          if (!v174) {
            goto LABEL_167;
          }
          uint64_t v176 = *(void *)&v56[16 * v175 + 32];
          uint64_t v177 = *(void *)&v56[16 * v58 + 24];
          sub_100008F54(v174 + *(void *)(v199 + 72) * v176, v174 + *(void *)(v199 + 72) * *(void *)&v56[16 * v58 + 16], v174 + *(void *)(v199 + 72) * v177, v198);
          if (v2) {
            goto LABEL_123;
          }
          if (v177 < v176) {
            goto LABEL_156;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            long long v56 = sub_10000A1D4((uint64_t)v56);
          }
          if (v175 >= *((void *)v56 + 2)) {
            goto LABEL_157;
          }
          v178 = &v56[16 * v175 + 32];
          *(void *)v178 = v176;
          *((void *)v178 + 1) = v177;
          unint64_t v179 = *((void *)v56 + 2);
          if (v58 > v179) {
            goto LABEL_158;
          }
          memmove(&v56[16 * v58 + 16], &v56[16 * v58 + 32], 16 * (v179 - v58));
          *((void *)v56 + 2) = v179 - 1;
          unint64_t v58 = v179 - 1;
          if (v179 <= 2) {
            goto LABEL_123;
          }
        }
      }
    }
    uint64_t v200 = v2;
    uint64_t v103 = *(void *)(v199 + 72);
    uint64_t v104 = v103 * (v59 - 1);
    uint64_t v207 = v103;
    uint64_t v105 = v59 * v103;
    uint64_t v192 = v102;
LABEL_64:
    uint64_t v107 = 0;
    uint64_t v108 = v195;
    uint64_t v213 = v59;
    uint64_t v208 = v104;
    uint64_t v209 = v105;
    while (1)
    {
      uint64_t v219 = v108;
      uint64_t v109 = *v221;
      uint64_t v218 = v105 + v107;
      uint64_t v110 = v220;
      sub_100011AC8(v105 + v107 + v109, v220, &qword_10002E078);
      v217 = (void (*)(char *, uint64_t, uint64_t))(v104 + v107);
      sub_100011AC8(v104 + v107 + v109, v72, &qword_10002E078);
      sub_100011AC8(v110, (uint64_t)v10, v73);
      unint64_t v111 = v73;
      unint64_t v112 = *v210;
      uint64_t v113 = v72;
      uint64_t v114 = v211;
      if (((unsigned int (*)(char *, uint64_t, uint64_t))*v210)(v10, 1, v211) == 1)
      {
        sub_100011B2C((uint64_t)v10, v73);
        sub_100011B2C(v113, &qword_10002E078);
        sub_100011B2C(v220, &qword_10002E078);
        uint64_t v72 = v113;
        uint64_t v106 = v213;
        goto LABEL_62;
      }
      uint64_t v115 = v216;
      v214 = *v206;
      v214(v216, (uint64_t)v10, v114);
      uint64_t v116 = (uint64_t)v204;
      sub_100011AC8(v113, (uint64_t)v204, v73);
      if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v112)(v116, 1, v114) == 1)
      {
        (*v205)(v115, v114);
        sub_100011B2C(v116, v73);
        sub_100011B2C(v113, &qword_10002E078);
        sub_100011B2C(v220, &qword_10002E078);
        uint64_t v72 = v113;
      }
      else
      {
        v117 = v202;
        v214(v202, v116, v114);
        char v118 = sub_100021588();
        v119 = *v205;
        (*v205)(v117, v114);
        v119(v216, v114);
        sub_100011B2C(v113, &qword_10002E078);
        sub_100011B2C(v220, &qword_10002E078);
        uint64_t v72 = v113;
        v73 = v111;
        if ((v118 & 1) == 0)
        {
          uint64_t v10 = v212;
          uint64_t v106 = v213;
          uint64_t v104 = v208;
LABEL_62:
          uint64_t v105 = v209;
LABEL_63:
          uint64_t v59 = v106 + 1;
          v104 += v207;
          v105 += v207;
          if (v59 == v192)
          {
            uint64_t v59 = v192;
            uint64_t v2 = v200;
            long long v56 = v194;
            goto LABEL_74;
          }
          goto LABEL_64;
        }
      }
      uint64_t v120 = *v221;
      uint64_t v10 = v212;
      uint64_t v104 = v208;
      uint64_t v105 = v209;
      if (!*v221) {
        goto LABEL_164;
      }
      uint64_t v121 = v120 + v208 + v107;
      sub_100011A64(v120 + v209 + v107, v215, &qword_10002E078);
      swift_arrayInitWithTakeFrontToBack();
      sub_100011A64(v215, v121, &qword_10002E078);
      v107 -= v207;
      uint64_t v108 = v219 + 1;
      uint64_t v106 = v213;
      if (v213 == v219 + 1) {
        goto LABEL_63;
      }
    }
  }
  if (v48 < 0) {
    goto LABEL_160;
  }
  if (v48) {
    return sub_1000084F8(0, v48, 1, v221);
  }
  return result;
}

Swift::Int sub_100007A30(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  Swift::Int result = sub_100021EA8(v3);
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_151;
    }
    if (v3) {
      return sub_100008A30(0, v3, 1, a1);
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
    goto LABEL_159;
  }
  Swift::Int v126 = v3;
  Swift::Int v121 = result;
  uint64_t v130 = v1;
  char v118 = a1;
  if (v3 < 2)
  {
    uint64_t v7 = (char *)_swiftEmptyArrayStorage;
    uint64_t v129 = (void **)&_swiftEmptyArrayStorage[4];
    if (v3 != 1)
    {
      unint64_t v11 = _swiftEmptyArrayStorage[2];
      uint64_t v10 = (char *)_swiftEmptyArrayStorage;
LABEL_116:
      unint64_t v124 = v7;
      if (v11 >= 2)
      {
        uint64_t v112 = *v118;
        do
        {
          unint64_t v113 = v11 - 2;
          if (v11 < 2) {
            goto LABEL_146;
          }
          if (!v112) {
            goto LABEL_158;
          }
          uint64_t v114 = *(void *)&v10[16 * v113 + 32];
          uint64_t v115 = *(void *)&v10[16 * v11 + 24];
          sub_10000997C((void **)(v112 + 16 * v114), (id *)(v112 + 16 * *(void *)&v10[16 * v11 + 16]), v112 + 16 * v115, v129);
          if (v130) {
            goto LABEL_128;
          }
          if (v115 < v114) {
            goto LABEL_147;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v10 = sub_10000A1D4((uint64_t)v10);
          }
          if (v113 >= *((void *)v10 + 2)) {
            goto LABEL_148;
          }
          uint64_t v116 = &v10[16 * v113 + 32];
          *(void *)uint64_t v116 = v114;
          *((void *)v116 + 1) = v115;
          unint64_t v117 = *((void *)v10 + 2);
          if (v11 > v117) {
            goto LABEL_149;
          }
          memmove(&v10[16 * v11 + 16], &v10[16 * v11 + 32], 16 * (v117 - v11));
          *((void *)v10 + 2) = v117 - 1;
          unint64_t v11 = v117 - 1;
        }
        while (v117 > 2);
      }
      swift_bridgeObjectRelease();
      *((void *)v124 + 2) = 0;
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    sub_10000C984(&qword_10002E100);
    uint64_t v7 = (char *)sub_100021A48();
    *((void *)v7 + 2) = v6;
    Swift::Int v3 = v126;
    uint64_t v129 = (void **)(v7 + 32);
  }
  unint64_t v124 = v7;
  Swift::Int v8 = 0;
  uint64_t v9 = *a1;
  uint64_t v119 = *a1 - 16;
  uint64_t v120 = *a1 + 40;
  uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  uint64_t v131 = *a1;
  while (1)
  {
    Swift::Int v12 = v8;
    Swift::Int v13 = v8 + 1;
    Swift::Int v127 = v8;
    if (v8 + 1 < v3)
    {
      uint64_t v122 = v10;
      uint64_t v14 = *(void **)(v9 + 16 * v8);
      id v15 = *(id *)(v9 + 16 * v13);
      swift_bridgeObjectRetain();
      id v16 = v14;
      swift_bridgeObjectRetain();
      id v17 = [v15 displayName];
      uint64_t v18 = sub_100021998();
      uint64_t v20 = v19;

      id v21 = [v16 displayName];
      uint64_t v22 = sub_100021998();
      uint64_t v24 = v23;

      if (v18 == v22 && v20 == v24) {
        int v135 = 0;
      }
      else {
        int v135 = sub_100021EB8();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      Swift::Int v3 = v126;
      Swift::Int v12 = v127;
      Swift::Int v13 = v127 + 2;
      if (v127 + 2 >= v126)
      {
        uint64_t v10 = v122;
      }
      else
      {
        uint64_t v26 = v120 + 16 * v127;
        while (1)
        {
          Swift::Int v132 = v13;
          uint64_t v27 = *(void **)(v26 - 24);
          id v28 = *(id *)(v26 - 8);
          swift_bridgeObjectRetain();
          id v29 = v27;
          swift_bridgeObjectRetain();
          id v30 = [v28 displayName];
          uint64_t v31 = sub_100021998();
          uint64_t v33 = v32;

          id v34 = [v29 displayName];
          uint64_t v35 = sub_100021998();
          uint64_t v37 = v36;

          BOOL v38 = v31 == v35 && v33 == v37;
          int v39 = v38 ? 0 : sub_100021EB8();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();

          swift_bridgeObjectRelease();
          Swift::Int v3 = v126;
          if ((v135 ^ v39)) {
            break;
          }
          Swift::Int v13 = v132 + 1;
          v26 += 16;
          if (v126 == v132 + 1)
          {
            Swift::Int v13 = v126;
            uint64_t v10 = v122;
            goto LABEL_35;
          }
        }
        uint64_t v10 = v122;
        Swift::Int v13 = v132;
LABEL_35:
        Swift::Int v12 = v127;
      }
      uint64_t v9 = v131;
      if (v135)
      {
        if (v13 < v12) {
          goto LABEL_152;
        }
        if (v12 < v13)
        {
          uint64_t v40 = (long long *)(v119 + 16 * v13);
          Swift::Int v41 = v13;
          Swift::Int v42 = v12;
          uint64_t v43 = (long long *)(v131 + 16 * v12);
          do
          {
            if (v42 != --v41)
            {
              if (!v131) {
                goto LABEL_157;
              }
              long long v44 = *v43;
              long long *v43 = *v40;
              *uint64_t v40 = v44;
            }
            ++v42;
            --v40;
            ++v43;
          }
          while (v42 < v41);
        }
      }
    }
    if (v13 < v3)
    {
      if (__OFSUB__(v13, v12)) {
        goto LABEL_150;
      }
      if (v13 - v12 < v121) {
        break;
      }
    }
LABEL_68:
    if (v13 < v12) {
      goto LABEL_145;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v10 = sub_100009E1C(0, *((void *)v10 + 2) + 1, 1, v10);
    }
    unint64_t v63 = *((void *)v10 + 2);
    unint64_t v62 = *((void *)v10 + 3);
    unint64_t v11 = v63 + 1;
    uint64_t v9 = v131;
    if (v63 >= v62 >> 1)
    {
      unint64_t v111 = sub_100009E1C((char *)(v62 > 1), v63 + 1, 1, v10);
      uint64_t v9 = v131;
      uint64_t v10 = v111;
    }
    *((void *)v10 + 2) = v11;
    uint64_t v64 = v10 + 32;
    uint64_t v65 = &v10[16 * v63 + 32];
    *(void *)uint64_t v65 = v127;
    *((void *)v65 + 1) = v13;
    Swift::Int v134 = v13;
    if (v63)
    {
      while (1)
      {
        unint64_t v66 = v11 - 1;
        if (v11 >= 4)
        {
          uint64_t v71 = &v64[16 * v11];
          uint64_t v72 = *((void *)v71 - 8);
          uint64_t v73 = *((void *)v71 - 7);
          BOOL v77 = __OFSUB__(v73, v72);
          uint64_t v74 = v73 - v72;
          if (v77) {
            goto LABEL_134;
          }
          uint64_t v76 = *((void *)v71 - 6);
          uint64_t v75 = *((void *)v71 - 5);
          BOOL v77 = __OFSUB__(v75, v76);
          uint64_t v69 = v75 - v76;
          char v70 = v77;
          if (v77) {
            goto LABEL_135;
          }
          unint64_t v78 = v11 - 2;
          uint64_t v79 = &v64[16 * v11 - 32];
          uint64_t v81 = *(void *)v79;
          uint64_t v80 = *((void *)v79 + 1);
          BOOL v77 = __OFSUB__(v80, v81);
          uint64_t v82 = v80 - v81;
          if (v77) {
            goto LABEL_137;
          }
          BOOL v77 = __OFADD__(v69, v82);
          uint64_t v83 = v69 + v82;
          if (v77) {
            goto LABEL_140;
          }
          if (v83 >= v74)
          {
            uint64_t v101 = &v64[16 * v66];
            uint64_t v103 = *(void *)v101;
            uint64_t v102 = *((void *)v101 + 1);
            BOOL v77 = __OFSUB__(v102, v103);
            uint64_t v104 = v102 - v103;
            if (v77) {
              goto LABEL_144;
            }
            BOOL v94 = v69 < v104;
            goto LABEL_105;
          }
        }
        else
        {
          if (v11 != 3)
          {
            uint64_t v95 = *((void *)v10 + 4);
            uint64_t v96 = *((void *)v10 + 5);
            BOOL v77 = __OFSUB__(v96, v95);
            uint64_t v88 = v96 - v95;
            char v89 = v77;
            goto LABEL_99;
          }
          uint64_t v68 = *((void *)v10 + 4);
          uint64_t v67 = *((void *)v10 + 5);
          BOOL v77 = __OFSUB__(v67, v68);
          uint64_t v69 = v67 - v68;
          char v70 = v77;
        }
        if (v70) {
          goto LABEL_136;
        }
        unint64_t v78 = v11 - 2;
        uint64_t v84 = &v64[16 * v11 - 32];
        uint64_t v86 = *(void *)v84;
        uint64_t v85 = *((void *)v84 + 1);
        BOOL v87 = __OFSUB__(v85, v86);
        uint64_t v88 = v85 - v86;
        char v89 = v87;
        if (v87) {
          goto LABEL_139;
        }
        v90 = &v64[16 * v66];
        uint64_t v92 = *(void *)v90;
        uint64_t v91 = *((void *)v90 + 1);
        BOOL v77 = __OFSUB__(v91, v92);
        uint64_t v93 = v91 - v92;
        if (v77) {
          goto LABEL_142;
        }
        if (__OFADD__(v88, v93)) {
          goto LABEL_143;
        }
        if (v88 + v93 >= v69)
        {
          BOOL v94 = v69 < v93;
LABEL_105:
          if (v94) {
            unint64_t v66 = v78;
          }
          goto LABEL_107;
        }
LABEL_99:
        if (v89) {
          goto LABEL_138;
        }
        uint64_t v97 = &v64[16 * v66];
        uint64_t v99 = *(void *)v97;
        uint64_t v98 = *((void *)v97 + 1);
        BOOL v77 = __OFSUB__(v98, v99);
        uint64_t v100 = v98 - v99;
        if (v77) {
          goto LABEL_141;
        }
        if (v100 < v88) {
          goto LABEL_14;
        }
LABEL_107:
        unint64_t v105 = v66 - 1;
        if (v66 - 1 >= v11)
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
          goto LABEL_156;
        }
        uint64_t v106 = &v64[16 * v105];
        uint64_t v107 = *(void *)v106;
        uint64_t v108 = &v64[16 * v66];
        uint64_t v109 = *((void *)v108 + 1);
        sub_10000997C((void **)(v9 + 16 * *(void *)v106), (id *)(v9 + 16 * *(void *)v108), v9 + 16 * v109, v129);
        if (v130)
        {
LABEL_128:
          swift_bridgeObjectRelease();
          *((void *)v124 + 2) = 0;
          return swift_bridgeObjectRelease();
        }
        if (v109 < v107) {
          goto LABEL_131;
        }
        if (v66 > *((void *)v10 + 2)) {
          goto LABEL_132;
        }
        *(void *)uint64_t v106 = v107;
        *(void *)&v64[16 * v105 + 8] = v109;
        unint64_t v110 = *((void *)v10 + 2);
        if (v66 >= v110) {
          goto LABEL_133;
        }
        uint64_t v130 = 0;
        unint64_t v11 = v110 - 1;
        memmove(&v64[16 * v66], v108 + 16, 16 * (v110 - 1 - v66));
        *((void *)v10 + 2) = v110 - 1;
        uint64_t v9 = v131;
        if (v110 <= 2) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v11 = 1;
LABEL_14:
    Swift::Int v3 = v126;
    Swift::Int v8 = v134;
    uint64_t v7 = v124;
    if (v134 >= v126) {
      goto LABEL_116;
    }
  }
  if (__OFADD__(v12, v121)) {
    goto LABEL_153;
  }
  if (v12 + v121 >= v3) {
    Swift::Int v45 = v3;
  }
  else {
    Swift::Int v45 = v12 + v121;
  }
  if (v45 >= v12)
  {
    if (v13 != v45)
    {
      unint64_t v123 = v10;
      uint64_t v46 = v119 + 16 * v13;
      Swift::Int v125 = v45;
      do
      {
        long long v48 = *(_OWORD *)(v9 + 16 * v13);
        uint64_t v128 = v46;
        Swift::Int v133 = v13;
        while (1)
        {
          Swift::Int v136 = v12;
          unint64_t v49 = *(void **)v46;
          id v50 = (id)v48;
          swift_bridgeObjectRetain();
          id v51 = v49;
          swift_bridgeObjectRetain();
          id v52 = [v50 displayName];
          uint64_t v53 = sub_100021998();
          uint64_t v55 = v54;

          id v56 = [v51 displayName];
          uint64_t v57 = sub_100021998();
          uint64_t v59 = v58;

          if (v53 == v57 && v55 == v59) {
            break;
          }
          char v61 = sub_100021EB8();
          swift_bridgeObjectRelease();

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v61 & 1) == 0) {
            goto LABEL_56;
          }
          uint64_t v9 = v131;
          Swift::Int v47 = v133;
          if (!v131) {
            goto LABEL_155;
          }
          long long v48 = *(_OWORD *)(v46 + 16);
          *(_OWORD *)(v46 + 16) = *(_OWORD *)v46;
          *(_OWORD *)uint64_t v46 = v48;
          v46 -= 16;
          Swift::Int v12 = v136 + 1;
          if (v133 == v136 + 1) {
            goto LABEL_57;
          }
        }
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
LABEL_56:
        uint64_t v9 = v131;
        Swift::Int v47 = v133;
LABEL_57:
        Swift::Int v13 = v47 + 1;
        Swift::Int v12 = v127;
        uint64_t v46 = v128 + 16;
      }
      while (v13 != v125);
      Swift::Int v13 = v125;
      uint64_t v10 = v123;
    }
    goto LABEL_68;
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
  Swift::Int result = sub_100021E18();
  __break(1u);
  return result;
}

uint64_t sub_10000839C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, void (*a5)(char *__return_ptr, void **, void **), uint64_t a6)
{
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a5;
  *(void *)(v11 + 24) = a6;
  uint64_t v22 = a2;
  if (a3 == a2)
  {
    swift_retain();
    swift_release();
  }
  else
  {
    uint64_t v12 = *a4;
    swift_retain();
    uint64_t v13 = v12 + 8 * a3 - 8;
    while (2)
    {
      uint64_t v14 = *(void **)(v12 + 8 * a3);
      uint64_t v15 = a1;
      uint64_t v16 = v13;
      do
      {
        id v17 = *(void **)v16;
        uint64_t v26 = v14;
        uint64_t v25 = v17;
        id v18 = v14;
        id v19 = v17;
        a5(&v24, &v26, &v25);

        if (v24 != 1) {
          break;
        }
        if (!v12)
        {
          uint64_t result = swift_release();
          __break(1u);
          return result;
        }
        uint64_t v20 = *(void **)v16;
        uint64_t v14 = *(void **)(v16 + 8);
        *(void *)uint64_t v16 = v14;
        *(void *)(v16 + 8) = v20;
        v16 -= 8;
        ++v15;
      }
      while (a3 != v15);
      ++a3;
      v13 += 8;
      if (a3 != v22) {
        continue;
      }
      break;
    }
    swift_release();
  }
  return swift_release();
}

uint64_t sub_1000084F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  unint64_t v63 = a4;
  uint64_t v45 = a1;
  uint64_t v6 = sub_10000C984(&qword_10002E070);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  uint64_t v9 = (char *)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v54 = (uint64_t)&v43 - v10;
  uint64_t v52 = sub_1000215B8();
  uint64_t v11 = *(void *)(v52 - 8);
  uint64_t v12 = __chkstk_darwin(v52);
  Swift::Int v47 = (char *)&v43 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v60 = (char *)&v43 - v14;
  uint64_t v46 = sub_10000C984(&qword_10002E078);
  uint64_t v15 = __chkstk_darwin(v46);
  uint64_t v59 = (uint64_t)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v53 = (uint64_t)&v43 - v18;
  uint64_t result = __chkstk_darwin(v17);
  uint64_t v22 = (char *)&v43 - v21;
  uint64_t v58 = a3;
  uint64_t v44 = a2;
  if (a3 != a2)
  {
    uint64_t v23 = *(void *)(v20 + 72);
    id v50 = (char *)&v43 - v21;
    id v51 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48);
    long long v48 = (void (**)(char *, uint64_t))(v11 + 8);
    unint64_t v49 = (void (**)(char *, uint64_t, uint64_t))(v11 + 32);
    uint64_t v24 = v23 * (v58 - 1);
    uint64_t v55 = v23;
    uint64_t v25 = v23 * v58;
LABEL_6:
    uint64_t v26 = 0;
    uint64_t v27 = v45;
    uint64_t v56 = v24;
    uint64_t v57 = v25;
    while (1)
    {
      uint64_t v64 = v27;
      uint64_t v28 = *v63;
      uint64_t v62 = v25 + v26;
      sub_100011AC8(v25 + v26 + v28, (uint64_t)v22, &qword_10002E078);
      uint64_t v61 = v24 + v26;
      uint64_t v29 = v53;
      sub_100011AC8(v24 + v26 + v28, v53, &qword_10002E078);
      uint64_t v30 = v54;
      sub_100011AC8((uint64_t)v22, v54, &qword_10002E070);
      uint64_t v31 = v52;
      uint64_t v32 = *v51;
      if ((*v51)(v30, 1, v52) == 1)
      {
        sub_100011B2C(v30, &qword_10002E070);
        sub_100011B2C(v29, &qword_10002E078);
        uint64_t v22 = v50;
        uint64_t result = sub_100011B2C((uint64_t)v50, &qword_10002E078);
        uint64_t v25 = v57;
LABEL_5:
        v24 += v55;
        v25 += v55;
        if (++v58 == v44) {
          return result;
        }
        goto LABEL_6;
      }
      uint64_t v33 = v30;
      uint64_t v34 = (uint64_t)v9;
      uint64_t v35 = *v49;
      uint64_t v36 = v60;
      (*v49)(v60, v33, v31);
      sub_100011AC8(v29, v34, &qword_10002E070);
      if (v32(v34, 1, v31) == 1)
      {
        (*v48)(v36, v31);
        sub_100011B2C(v34, &qword_10002E070);
        sub_100011B2C(v29, &qword_10002E078);
        uint64_t v22 = v50;
        uint64_t result = sub_100011B2C((uint64_t)v50, &qword_10002E078);
        uint64_t v9 = (char *)v34;
        uint64_t v24 = v56;
        uint64_t v25 = v57;
        uint64_t v37 = v64;
      }
      else
      {
        BOOL v38 = v47;
        v35(v47, v34, v31);
        char v39 = sub_100021588();
        uint64_t v40 = *v48;
        (*v48)(v38, v31);
        v40(v60, v31);
        sub_100011B2C(v29, &qword_10002E078);
        uint64_t v22 = v50;
        uint64_t result = sub_100011B2C((uint64_t)v50, &qword_10002E078);
        uint64_t v9 = (char *)v34;
        uint64_t v24 = v56;
        uint64_t v25 = v57;
        uint64_t v37 = v64;
        if ((v39 & 1) == 0) {
          goto LABEL_5;
        }
      }
      uint64_t v41 = *v63;
      if (!*v63) {
        break;
      }
      uint64_t v42 = v41 + v24 + v26;
      sub_100011A64(v41 + v25 + v26, v59, &qword_10002E078);
      swift_arrayInitWithTakeFrontToBack();
      uint64_t result = sub_100011A64(v59, v42, &qword_10002E078);
      v26 -= v55;
      uint64_t v27 = v37 + 1;
      if (v58 == v27) {
        goto LABEL_5;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_100008A30(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v21 = result;
  if (a3 != a2)
  {
    uint64_t v23 = *a4;
    uint64_t v4 = *a4 + 16 * a3 - 16;
LABEL_6:
    long long v6 = *(_OWORD *)(v23 + 16 * a3);
    uint64_t v25 = v21;
    uint64_t v22 = v4;
    uint64_t v24 = a3;
    while (1)
    {
      uint64_t v7 = *(void **)v4;
      id v8 = (id)v6;
      swift_bridgeObjectRetain();
      id v9 = v7;
      swift_bridgeObjectRetain();
      id v10 = [v8 displayName];
      uint64_t v11 = sub_100021998();
      uint64_t v13 = v12;

      id v14 = [v9 displayName];
      uint64_t v15 = sub_100021998();
      uint64_t v17 = v16;

      if (v11 == v15 && v13 == v17)
      {
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease_n();
        uint64_t v5 = v24;
LABEL_5:
        a3 = v5 + 1;
        uint64_t v4 = v22 + 16;
        if (a3 == a2) {
          return result;
        }
        goto LABEL_6;
      }
      char v19 = sub_100021EB8();
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v5 = v24;
      if ((v19 & 1) == 0) {
        goto LABEL_5;
      }
      if (!v23) {
        break;
      }
      long long v6 = *(_OWORD *)(v4 + 16);
      *(_OWORD *)(v4 + 16) = *(_OWORD *)v4;
      *(_OWORD *)uint64_t v4 = v6;
      v4 -= 16;
      if (v24 == ++v25) {
        goto LABEL_5;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_100008C0C(void **a1, void **a2, unint64_t a3, void **a4, void (*a5)(char *__return_ptr, void **, void **), uint64_t a6)
{
  void (*v37)(char *__return_ptr, void **, void **);
  char v38;
  void *v39;
  void *v40;
  char *v41;
  void **v42;
  void **v43;

  uint64_t v12 = swift_allocObject();
  uint64_t v37 = a5;
  *(void *)(v12 + 16) = a5;
  *(void *)(v12 + 24) = a6;
  uint64_t v13 = (char *)a2 - (char *)a1;
  uint64_t v14 = (char *)a2 - (char *)a1 + 7;
  if ((char *)a2 - (char *)a1 >= 0) {
    uint64_t v14 = (char *)a2 - (char *)a1;
  }
  uint64_t v15 = v14 >> 3;
  uint64_t v16 = a3 - (void)a2;
  uint64_t v17 = a3 - (void)a2 + 7;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v17 = a3 - (void)a2;
  }
  uint64_t v18 = v17 >> 3;
  uint64_t v36 = a1;
  uint64_t v43 = a1;
  uint64_t v42 = a4;
  if (v15 >= v17 >> 3)
  {
    if (v16 >= -7)
    {
      if (a4 != a2 || &a2[v18] <= a4) {
        memmove(a4, a2, 8 * v18);
      }
      swift_retain();
      uint64_t v27 = &a4[v18];
      uint64_t v41 = (char *)v27;
      uint64_t v43 = a2;
      if (v16 >= 8 && a1 < a2)
      {
        uint64_t v28 = (void **)(a3 - 8);
        uint64_t v29 = a2;
        do
        {
          uint64_t v30 = *(v27 - 1);
          uint64_t v31 = *--v29;
          uint64_t v32 = v28 + 1;
          char v39 = v31;
          uint64_t v40 = v30;
          id v33 = v30;
          id v34 = v31;
          v37(&v38, &v40, &v39);

          if (v38 == 1)
          {
            if (v32 != a2 || v28 >= a2) {
              *uint64_t v28 = *v29;
            }
            uint64_t v43 = v29;
          }
          else
          {
            uint64_t v41 = (char *)(v27 - 1);
            if (v32 < v27 || v28 >= v27 || v32 != v27) {
              *uint64_t v28 = *(v27 - 1);
            }
            uint64_t v29 = a2;
            --v27;
          }
          if (v27 <= a4) {
            break;
          }
          --v28;
          a2 = v29;
        }
        while (v29 > v36);
      }
      goto LABEL_43;
    }
  }
  else if (v13 >= -7)
  {
    char v19 = a1;
    if (a4 != a1 || &a1[v15] <= a4) {
      memmove(a4, a1, 8 * v15);
    }
    swift_retain();
    uint64_t v20 = &a4[v15];
    uint64_t v41 = (char *)v20;
    if (v13 >= 8 && (unint64_t)a2 < a3)
    {
      uint64_t v21 = a4;
      do
      {
        uint64_t v22 = *a2;
        char v39 = *v21;
        uint64_t v23 = v39;
        uint64_t v40 = v22;
        id v24 = v22;
        id v25 = v23;
        v37(&v38, &v40, &v39);

        if (v38 == 1)
        {
          uint64_t v26 = a2 + 1;
          if (v19 < a2 || v19 >= v26 || v19 != a2) {
            *char v19 = *a2;
          }
        }
        else
        {
          if (v19 != v21) {
            *char v19 = *v21;
          }
          uint64_t v42 = ++v21;
          uint64_t v26 = a2;
        }
        ++v19;
        if (v21 >= v20) {
          break;
        }
        a2 = v26;
      }
      while ((unint64_t)v26 < a3);
      uint64_t v43 = v19;
    }
LABEL_43:
    sub_100009F18((void **)&v43, (const void **)&v42, &v41);
    swift_release();
    swift_release();
    return 1;
  }
  swift_release();
  uint64_t result = sub_100021E78();
  __break(1u);
  return result;
}

uint64_t sub_100008F54(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v96 = a4;
  uint64_t v7 = sub_10000C984(&qword_10002E070);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  id v10 = (char *)&v79 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v8);
  char v89 = (unsigned int (**)(char *, uint64_t, uint64_t))((char *)&v79 - v12);
  uint64_t v13 = __chkstk_darwin(v11);
  unint64_t v86 = (unint64_t)&v79 - v14;
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v79 - v15;
  uint64_t v17 = sub_1000215B8();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v80 = (char *)&v79 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v84 = (char *)&v79 - v22;
  uint64_t v23 = __chkstk_darwin(v21);
  uint64_t v82 = (char *)&v79 - v24;
  __chkstk_darwin(v23);
  uint64_t v91 = (uint64_t)&v79 - v25;
  uint64_t v90 = sub_10000C984(&qword_10002E078);
  uint64_t v26 = __chkstk_darwin(v90);
  uint64_t v27 = __chkstk_darwin(v26);
  unint64_t v93 = (unint64_t)&v79 - v28;
  uint64_t v29 = __chkstk_darwin(v27);
  uint64_t v83 = (char *)&v79 - v30;
  __chkstk_darwin(v29);
  uint64_t v87 = (uint64_t)&v79 - v32;
  uint64_t v94 = *(void *)(v33 + 72);
  if (!v94)
  {
    __break(1u);
LABEL_72:
    __break(1u);
LABEL_73:
    __break(1u);
    goto LABEL_74;
  }
  if (a2 - a1 == 0x8000000000000000 && v94 == -1) {
    goto LABEL_72;
  }
  int64_t v34 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v94 == -1) {
    goto LABEL_73;
  }
  uint64_t v35 = (uint64_t)(a2 - a1) / v94;
  unint64_t v99 = a1;
  unint64_t v98 = v96;
  uint64_t v36 = v34 / v94;
  uint64_t v92 = v17;
  if (v35 >= v34 / v94)
  {
    if ((v36 & 0x8000000000000000) == 0)
    {
      uint64_t v39 = v18;
      uint64_t v40 = v36 * v94;
      uint64_t v83 = v10;
      uint64_t v41 = (uint64_t)v89;
      uint64_t v91 = v31;
      if (v96 < a2 || a2 + v40 <= v96)
      {
        swift_arrayInitWithTakeFrontToBack();
        uint64_t v42 = v84;
      }
      else
      {
        uint64_t v42 = v84;
        if (v96 != a2) {
          swift_arrayInitWithTakeBackToFront();
        }
      }
      unint64_t v60 = v96 + v40;
      unint64_t v97 = v96 + v40;
      unint64_t v99 = a2;
      if (v40 >= 1 && a1 < a2)
      {
        uint64_t v62 = -v94;
        uint64_t v94 = v39 + 48;
        uint64_t v81 = (void (**)(char *, uint64_t))(v39 + 8);
        uint64_t v82 = (char *)(v39 + 32);
        uint64_t v87 = v62;
        uint64_t v88 = (void (**)(void, void, void))a1;
        do
        {
          unint64_t v95 = a3;
          unint64_t v63 = v42;
          uint64_t v64 = v93;
          sub_100011AC8(v60 + v62, v93, &qword_10002E078);
          unint64_t v65 = a2 + v62;
          uint64_t v66 = v91;
          sub_100011AC8(a2 + v62, v91, &qword_10002E078);
          sub_100011AC8(v64, v41, &qword_10002E070);
          uint64_t v67 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))v94;
          uint64_t v68 = v92;
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))v94)(v41, 1, v92) == 1)
          {
            sub_100011B2C(v41, &qword_10002E070);
            char v69 = 0;
            uint64_t v42 = v63;
            uint64_t v62 = v87;
          }
          else
          {
            unint64_t v86 = a2;
            uint64_t v85 = *(char **)v82;
            ((void (*)(char *, uint64_t, uint64_t))v85)(v63, v41, v68);
            uint64_t v70 = (uint64_t)v83;
            sub_100011AC8(v66, (uint64_t)v83, &qword_10002E070);
            if (v67(v70, 1, v68) == 1)
            {
              (*v81)(v63, v68);
              sub_100011B2C(v70, &qword_10002E070);
              char v69 = 1;
              uint64_t v42 = v63;
            }
            else
            {
              uint64_t v71 = v80;
              ((void (*)(char *, uint64_t, uint64_t))v85)(v80, v70, v68);
              char v69 = sub_100021588();
              uint64_t v72 = *v81;
              uint64_t v73 = v71;
              uint64_t v42 = v84;
              (*v81)(v73, v68);
              v72(v42, v68);
            }
            a2 = v86;
            uint64_t v62 = v87;
          }
          unint64_t v74 = v95;
          unint64_t v75 = v95 + v62;
          sub_100011B2C(v91, &qword_10002E078);
          sub_100011B2C(v93, &qword_10002E078);
          uint64_t v76 = v88;
          if (v69)
          {
            if (v74 < a2 || v75 >= a2)
            {
              swift_arrayInitWithTakeFrontToBack();
              uint64_t v41 = (uint64_t)v89;
            }
            else
            {
              uint64_t v41 = (uint64_t)v89;
              if (v74 != a2) {
                swift_arrayInitWithTakeBackToFront();
              }
            }
            v99 += v62;
          }
          else
          {
            unint64_t v77 = v97;
            v97 += v62;
            if (v74 < v77 || v75 >= v77)
            {
              swift_arrayInitWithTakeFrontToBack();
              unint64_t v65 = a2;
              uint64_t v41 = (uint64_t)v89;
            }
            else
            {
              uint64_t v41 = (uint64_t)v89;
              if (v74 != v77) {
                swift_arrayInitWithTakeBackToFront();
              }
              unint64_t v65 = a2;
            }
          }
          unint64_t v60 = v97;
          if (v97 <= v96) {
            break;
          }
          a2 = v65;
          a3 = v74 + v62;
        }
        while (v65 > (unint64_t)v76);
      }
LABEL_70:
      sub_100009FD4(&v99, &v98, (uint64_t *)&v97);
      return 1;
    }
  }
  else if ((v35 & 0x8000000000000000) == 0)
  {
    uint64_t v37 = v35 * v94;
    uint64_t v38 = v87;
    if (v96 < a1 || a1 + v37 <= v96)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v96 != a1)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    unint64_t v93 = v96 + v37;
    unint64_t v97 = v96 + v37;
    BOOL v43 = v37 < 1 || a2 >= a3;
    uint64_t v44 = (uint64_t)v83;
    if (!v43)
    {
      uint64_t v45 = (unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48);
      uint64_t v88 = (void (**)(void, void, void))(v18 + 32);
      char v89 = (unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48);
      uint64_t v84 = (char *)(v18 + 8);
      uint64_t v85 = v16;
      unint64_t v95 = a3;
      while (1)
      {
        sub_100011AC8(a2, v38, &qword_10002E078);
        sub_100011AC8(v96, v44, &qword_10002E078);
        sub_100011AC8(v38, (uint64_t)v16, &qword_10002E070);
        uint64_t v46 = *v45;
        uint64_t v47 = v92;
        if ((*v45)(v16, 1, v92) == 1) {
          break;
        }
        id v51 = (void (*)(char *, uint64_t, uint64_t))*v88;
        (*v88)(v91, v16, v47);
        uint64_t v52 = v86;
        sub_100011AC8(v44, v86, &qword_10002E070);
        if (v46((char *)v52, 1, v47) == 1)
        {
          (*(void (**)(uint64_t, uint64_t))v84)(v91, v47);
          sub_100011B2C(v52, &qword_10002E070);
          sub_100011B2C(v44, &qword_10002E078);
          uint64_t v38 = v87;
          sub_100011B2C(v87, &qword_10002E078);
          uint64_t v16 = v85;
        }
        else
        {
          uint64_t v54 = v91;
          uint64_t v55 = v82;
          v51(v82, v52, v47);
          char v56 = sub_100021588();
          uint64_t v57 = *(void (**)(uint64_t, uint64_t))v84;
          uint64_t v58 = v55;
          uint64_t v59 = v54;
          uint64_t v44 = (uint64_t)v83;
          (*(void (**)(char *, uint64_t))v84)(v58, v47);
          v57(v59, v47);
          sub_100011B2C(v44, &qword_10002E078);
          uint64_t v38 = v87;
          sub_100011B2C(v87, &qword_10002E078);
          uint64_t v16 = v85;
          if ((v56 & 1) == 0) {
            goto LABEL_25;
          }
        }
        unint64_t v48 = v99;
        unint64_t v49 = v95;
        unint64_t v53 = a2 + v94;
        uint64_t v45 = v89;
        if (v99 < a2 || v99 >= v53)
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else if (v99 == a2)
        {
          unint64_t v48 = a2;
        }
        else
        {
          swift_arrayInitWithTakeBackToFront();
        }
LABEL_40:
        unint64_t v99 = v48 + v94;
        unint64_t v96 = v98;
        if (v98 < v93)
        {
          a2 = v53;
          if (v53 < v49) {
            continue;
          }
        }
        goto LABEL_70;
      }
      sub_100011B2C((uint64_t)v16, &qword_10002E070);
      sub_100011B2C(v44, &qword_10002E078);
      sub_100011B2C(v38, &qword_10002E078);
LABEL_25:
      unint64_t v48 = v99;
      unint64_t v49 = v95;
      unint64_t v50 = v98 + v94;
      uint64_t v45 = v89;
      if (v99 < v98 || v99 >= v50)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (v99 != v98)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      unint64_t v98 = v50;
      unint64_t v53 = a2;
      goto LABEL_40;
    }
    goto LABEL_70;
  }
LABEL_74:
  uint64_t result = sub_100021E78();
  __break(1u);
  return result;
}

uint64_t sub_10000997C(void **__src, id *a2, unint64_t a3, void **__dst)
{
  uint64_t v4 = __dst;
  uint64_t v5 = a2;
  long long v6 = __src;
  int64_t v7 = (char *)a2 - (char *)__src;
  int64_t v8 = (char *)a2 - (char *)__src + 15;
  if ((char *)a2 - (char *)__src >= 0) {
    int64_t v8 = (char *)a2 - (char *)__src;
  }
  uint64_t v9 = v8 >> 4;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = a3 - (void)a2 + 15;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v11 = a3 - (void)a2;
  }
  uint64_t v12 = v11 >> 4;
  uint64_t v59 = __src;
  uint64_t v58 = __dst;
  if (v9 >= v11 >> 4)
  {
    if (v10 < -15) {
      goto LABEL_56;
    }
    if (__dst != a2 || &a2[2 * v12] <= __dst) {
      memmove(__dst, a2, 16 * v12);
    }
    uint64_t v28 = &v4[2 * v12];
    uint64_t v57 = v28;
    uint64_t v59 = v5;
    if (v6 >= v5 || v10 < 16)
    {
LABEL_55:
      sub_10000A118((void **)&v59, (const void **)&v58, &v57);
      return 1;
    }
    uint64_t v29 = (id *)(a3 - 16);
    uint64_t v30 = v5;
    unint64_t v53 = v6;
    uint64_t v55 = v4;
    while (1)
    {
      char v56 = v5;
      unint64_t v51 = (unint64_t)v28;
      uint64_t v31 = v28 - 2;
      uint64_t v32 = *(v30 - 2);
      v30 -= 2;
      id v33 = *(v28 - 2);
      swift_bridgeObjectRetain();
      id v34 = v32;
      swift_bridgeObjectRetain();
      unint64_t v48 = v33;
      id v35 = [v33 displayName];
      uint64_t v36 = sub_100021998();
      uint64_t v38 = v37;

      id v39 = [v34 displayName];
      uint64_t v40 = sub_100021998();
      uint64_t v42 = v41;

      BOOL v43 = v36 == v40 && v38 == v42;
      char v44 = v43 ? 0 : sub_100021EB8();
      uint64_t v45 = v29 + 2;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      if (v44) {
        break;
      }
      uint64_t v57 = v31;
      if ((unint64_t)v45 < v51 || (unint64_t)v29 >= v51)
      {
        *(_OWORD *)uint64_t v29 = *(_OWORD *)v31;
        uint64_t v30 = v56;
        uint64_t v28 = v31;
        goto LABEL_53;
      }
      uint64_t v30 = v56;
      if (v45 != (id *)v51) {
        *(_OWORD *)uint64_t v29 = *(_OWORD *)v31;
      }
      uint64_t v28 = v31;
      uint64_t v46 = v55;
      if (v56 <= v53) {
        goto LABEL_55;
      }
LABEL_54:
      v29 -= 2;
      uint64_t v5 = v30;
      if (v28 <= v46) {
        goto LABEL_55;
      }
    }
    uint64_t v28 = (void **)v51;
    if (v45 != v56 || v29 >= v56) {
      *(_OWORD *)uint64_t v29 = *(_OWORD *)v30;
    }
    uint64_t v59 = v30;
LABEL_53:
    uint64_t v46 = v55;
    if (v30 <= v53) {
      goto LABEL_55;
    }
    goto LABEL_54;
  }
  if (v7 >= -15)
  {
    if (__dst != __src || &__src[2 * v9] <= __dst) {
      memmove(__dst, __src, 16 * v9);
    }
    unint64_t v49 = &v4[2 * v9];
    uint64_t v57 = v49;
    if ((unint64_t)v5 < a3 && v7 >= 16)
    {
      while (1)
      {
        uint64_t v52 = v6;
        uint64_t v54 = v4;
        uint64_t v13 = *v4;
        id v14 = *v5;
        swift_bridgeObjectRetain();
        id v15 = v13;
        swift_bridgeObjectRetain();
        id v16 = [v14 displayName];
        uint64_t v17 = sub_100021998();
        uint64_t v19 = v18;

        id v20 = [v15 displayName];
        uint64_t v21 = sub_100021998();
        uint64_t v23 = v22;

        if (v17 == v21 && v19 == v23) {
          break;
        }
        char v25 = sub_100021EB8();
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v25 & 1) == 0) {
          goto LABEL_22;
        }
        uint64_t v4 = v54;
        uint64_t v26 = v5 + 2;
        uint64_t v27 = v52;
        if (v52 < v5 || v52 >= v26 || v52 != v5) {
          *(_OWORD *)uint64_t v52 = *(_OWORD *)v5;
        }
LABEL_25:
        long long v6 = v27 + 2;
        if (v4 < v49)
        {
          uint64_t v5 = v26;
          if ((unint64_t)v26 < a3) {
            continue;
          }
        }
        uint64_t v59 = v6;
        goto LABEL_55;
      }
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
LABEL_22:
      uint64_t v27 = v52;
      uint64_t v26 = v5;
      if (v52 != v54) {
        *(_OWORD *)uint64_t v52 = *(_OWORD *)v54;
      }
      uint64_t v4 = v54 + 2;
      uint64_t v58 = v54 + 2;
      goto LABEL_25;
    }
    goto LABEL_55;
  }
LABEL_56:
  uint64_t result = sub_100021E78();
  __break(1u);
  return result;
}

char *sub_100009E1C(char *result, int64_t a2, char a3, char *a4)
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
    sub_10000C984(&qword_10002E0C0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  id v14 = a4 + 32;
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

char *sub_100009F18(void **a1, const void **a2, void *a3)
{
  Swift::Int v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 7;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -8)
  {
    uint64_t result = (char *)sub_100021E78();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
    {
      return (char *)memmove(result, v3, 8 * v7);
    }
  }
  return result;
}

uint64_t sub_100009FD4(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  uint64_t v5 = *a3;
  uint64_t result = sub_10000C984(&qword_10002E078);
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
    uint64_t result = sub_100021E78();
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

char *sub_10000A118(void **a1, const void **a2, void *a3)
{
  unint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 15;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -16)
  {
    uint64_t result = (char *)sub_100021E78();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 4;
    if (result != v3 || result >= &v3[16 * v7])
    {
      return (char *)memmove(result, v3, 16 * v7);
    }
  }
  return result;
}

char *sub_10000A1D4(uint64_t a1)
{
  return sub_100009E1C(0, *(void *)(a1 + 16), 0, (char *)a1);
}

unint64_t sub_10000A1E8(void *a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = v2;
    uint64_t v8 = ~v4;
    do
    {
      uint64_t v9 = *(void **)(*(void *)(v6 + 48) + 8 * v5);
      if (v9)
      {
        if (a1)
        {
          sub_100011CC0(0, (unint64_t *)&unk_10002E6F0);
          id v10 = v9;
          id v11 = a1;
          char v12 = sub_100021C18();

          if (v12) {
            return v5;
          }
        }
      }
      else if (!a1)
      {
        return v5;
      }
      unint64_t v5 = (v5 + 1) & v8;
    }
    while (((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5) & 1) != 0);
  }
  return v5;
}

unint64_t sub_10000A2EC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v38 = a1;
  uint64_t v5 = sub_1000215B8();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v31 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10000C984(&qword_10002E0D0);
  __chkstk_darwin(v8);
  id v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10000C984(&qword_10002E070) - 8;
  uint64_t v12 = __chkstk_darwin(v11);
  __chkstk_darwin(v12);
  id v16 = (char *)&v28 - v15;
  uint64_t v17 = v3 + 64;
  uint64_t v39 = v3;
  uint64_t v18 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v19 = a2 & ~v18;
  if ((*(void *)(v3 + 64 + ((v19 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v19))
  {
    uint64_t v35 = v14;
    uint64_t v36 = ~v18;
    id v20 = (unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48);
    uint64_t v37 = *(void *)(v13 + 72);
    uint64_t v29 = (void (**)(char *, uint64_t, uint64_t))(v6 + 32);
    uint64_t v30 = v8;
    id v33 = (void (**)(uint64_t, uint64_t))(v6 + 8);
    uint64_t v34 = v3 + 64;
    while (1)
    {
      sub_100011AC8(*(void *)(v39 + 48) + v37 * v19, (uint64_t)v16, &qword_10002E070);
      uint64_t v21 = (uint64_t)&v10[*(int *)(v8 + 48)];
      sub_100011AC8((uint64_t)v16, (uint64_t)v10, &qword_10002E070);
      sub_100011AC8(v38, v21, &qword_10002E070);
      uint64_t v22 = *v20;
      if ((*v20)(v10, 1, v5) == 1) {
        break;
      }
      uint64_t v23 = v35;
      sub_100011AC8((uint64_t)v10, v35, &qword_10002E070);
      if (v22((char *)v21, 1, v5) == 1)
      {
        (*v33)(v23, v5);
        uint64_t v17 = v34;
LABEL_4:
        sub_100011B2C((uint64_t)v10, &qword_10002E0D0);
        sub_100011B2C((uint64_t)v16, &qword_10002E070);
        goto LABEL_5;
      }
      uint64_t v24 = v31;
      (*v29)(v31, v21, v5);
      sub_10000F5B0(&qword_10002E0D8, (void (*)(uint64_t))&type metadata accessor for Date);
      int v32 = sub_100021958();
      char v25 = *v33;
      uint64_t v26 = v24;
      uint64_t v8 = v30;
      (*v33)((uint64_t)v26, v5);
      v25(v23, v5);
      sub_100011B2C((uint64_t)v10, &qword_10002E070);
      sub_100011B2C((uint64_t)v16, &qword_10002E070);
      uint64_t v17 = v34;
      if (v32) {
        return v19;
      }
LABEL_5:
      unint64_t v19 = (v19 + 1) & v36;
      if (((*(void *)(v17 + ((v19 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v19) & 1) == 0) {
        return v19;
      }
    }
    if (v22((char *)v21, 1, v5) == 1)
    {
      sub_100011B2C((uint64_t)v10, &qword_10002E070);
      sub_100011B2C((uint64_t)v16, &qword_10002E070);
      return v19;
    }
    goto LABEL_4;
  }
  return v19;
}

unint64_t sub_10000A714(int a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(unsigned char *)(v7 + result) != (a1 & 1))
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (((*(unsigned __int8 *)(v7 + result) ^ a1) & 1) == 0) {
          break;
        }
      }
    }
  }
  return result;
}

unint64_t sub_10000A7C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    id v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100021EB8() & 1) == 0)
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
      while (!v14 && (sub_100021EB8() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_10000A8A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_100021998();
    uint64_t v8 = v7;
    if (v6 == sub_100021998() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_100021EB8();
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
          uint64_t v13 = sub_100021998();
          uint64_t v15 = v14;
          if (v13 == sub_100021998() && v15 == v16) {
            break;
          }
          char v18 = sub_100021EB8();
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

unint64_t sub_10000AA1C(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t i = a2 & ~v5;
  if ((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    sub_100011CC0(0, a3);
    id v7 = *(id *)(*(void *)(v3 + 48) + 8 * i);
    char v8 = sub_100021C18();

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = ~v5;
      for (unint64_t i = (i + 1) & v9; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v9)
      {
        id v10 = *(id *)(*(void *)(v3 + 48) + 8 * i);
        char v11 = sub_100021C18();

        if (v11) {
          break;
        }
      }
    }
  }
  return i;
}

uint64_t sub_10000AB30(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = sub_1000215B8();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10000C984(&qword_10002E070);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10 - 8);
  uint64_t v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100021EF8();
  sub_100011AC8(a1, (uint64_t)v13, &qword_10002E070);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v13, 1, v6) == 1)
  {
    sub_100021F08(0);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v13, v6);
    sub_100021F08(1u);
    sub_10000F5B0(&qword_10002E0A8, (void (*)(uint64_t))&type metadata accessor for Date);
    sub_100021938();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  sub_100021F18();
  unint64_t v14 = sub_100021C98();
  *(void *)((char *)a3 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v14;
  uint64_t result = sub_100011A64(a1, a3[6] + *(void *)(v11 + 72) * v14, &qword_10002E070);
  *(void *)(a3[7] + 8 * v14) = a2;
  ++a3[2];
  return result;
}

uint64_t sub_10000ADC8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10000B3A0(a1, a2, a3, (void *)*v3, (uint64_t *)&unk_10002E6D0, (uint64_t (*)(void))type metadata accessor for TTRIIntentsSnippetSection);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_10000AE04(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10000B234(a1, a2, a3, *v3);
  uint64_t *v3 = (char *)result;
  return result;
}

uint64_t sub_10000AE24(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10000B3A0(a1, a2, a3, (void *)*v3, &qword_10002E108, (uint64_t (*)(void))type metadata accessor for TTRIIntentsSnippetViewController.ViewModel);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_10000AE60(char a1, int64_t a2, char a3, void *a4)
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
    uint64_t v13 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_10000C984(&qword_10002E0C8);
  uint64_t v10 = *(void *)(sub_10000C984(&qword_10002E078) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
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
  uint64_t v16 = *(void *)(sub_10000C984(&qword_10002E078) - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  char v18 = (char *)v13 + v17;
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
  uint64_t result = sub_100021E78();
  __break(1u);
  return result;
}

uint64_t sub_10000B0A8(char a1, int64_t a2, char a3, void *a4)
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
    sub_10000C984(&qword_10002E0F8);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = _swiftEmptyArrayStorage;
  }
  unint64_t v13 = (unint64_t)(v10 + 4);
  unint64_t v14 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v13 >= v14 + 16 * v8) {
      memmove(v10 + 4, a4 + 4, 16 * v8);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 16 * v8 || v13 >= v14 + 16 * v8)
  {
    sub_10000C984(&qword_10002E100);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_100021E78();
  __break(1u);
  return result;
}

uint64_t sub_10000B234(char a1, int64_t a2, char a3, char *a4)
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
    sub_10000C984(&qword_10002E110);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  unint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_100021E78();
  __break(1u);
  return result;
}

uint64_t sub_10000B3A0(char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t (*a6)(void))
{
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (!v12)
  {
    uint64_t v16 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_10000C984(a5);
  uint64_t v13 = *(void *)(a6(0) - 8);
  uint64_t v14 = *(void *)(v13 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v16 = (void *)swift_allocObject();
  size_t v17 = j__malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v17 - v15 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_34;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  uint64_t v19 = *(void *)(a6(0) - 8);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  uint64_t v21 = (char *)v16 + v20;
  unint64_t v22 = (char *)a4 + v20;
  if (a1)
  {
    if (v16 < a4 || v21 >= &v22[*(void *)(v19 + 72) * v11])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v23 = *(void *)(v19 + 72) * v11;
  uint64_t v24 = &v21[v23];
  unint64_t v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v16;
  }
LABEL_36:
  uint64_t result = sub_100021E78();
  __break(1u);
  return result;
}

uint64_t sub_10000B5E8(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    id v8 = a2;
    uint64_t v9 = sub_100021CC8();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_100011CC0(0, (unint64_t *)&unk_10002E6F0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v27;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_100021CB8();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    Swift::Int v22 = sub_10000B888(v7, result + 1);
    uint64_t v28 = (void *)v22;
    if (*(void *)(v22 + 24) <= *(void *)(v22 + 16))
    {
      id v26 = v8;
      sub_10000BA80();
      uint64_t v23 = v28;
    }
    else
    {
      uint64_t v23 = (void *)v22;
      id v24 = v8;
    }
    sub_10000BD20((uint64_t)v8, v23);
    uint64_t *v3 = (uint64_t)v23;
  }
  else
  {
    Swift::Int v11 = *(void *)(v6 + 40);
    swift_bridgeObjectRetain();
    Swift::Int v12 = sub_100021C08(v11);
    uint64_t v13 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v14 = v12 & ~v13;
    if ((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14))
    {
      sub_100011CC0(0, (unint64_t *)&unk_10002E6F0);
      id v15 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
      char v16 = sub_100021C18();

      if (v16)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        unint64_t v20 = *(void **)(*(void *)(*v3 + 48) + 8 * v14);
        *a1 = v20;
        id v21 = v20;
        return 0;
      }
      uint64_t v17 = ~v13;
      while (1)
      {
        unint64_t v14 = (v14 + 1) & v17;
        if (((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14) & 1) == 0) {
          break;
        }
        id v18 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
        char v19 = sub_100021C18();

        if (v19) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v29 = *v3;
    uint64_t *v3 = 0x8000000000000000;
    id v8 = a2;
    sub_10000BDA4((uint64_t)v8, v14, isUniquelyReferenced_nonNull_native);
    uint64_t *v3 = v29;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

Swift::Int sub_10000B888(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_10000C984(&qword_10002E130);
    uint64_t v2 = sub_100021D18();
    uint64_t v14 = v2;
    sub_100021CA8();
    if (sub_100021CD8())
    {
      sub_100011CC0(0, (unint64_t *)&unk_10002E6F0);
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_10000BA80();
          uint64_t v2 = v14;
        }
        Swift::Int result = sub_100021C08(*(void *)(v2 + 40));
        uint64_t v4 = v2 + 56;
        uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v6 = result & ~v5;
        unint64_t v7 = v6 >> 6;
        if (((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          unint64_t v8 = __clz(__rbit64((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v9 = 0;
          unint64_t v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v11 = v7 == v10;
            if (v7 == v10) {
              unint64_t v7 = 0;
            }
            v9 |= v11;
            uint64_t v12 = *(void *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          unint64_t v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(void *)(*(void *)(v2 + 48) + 8 * v8) = v13;
        ++*(void *)(v2 + 16);
      }
      while (sub_100021CD8());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return (Swift::Int)&_swiftEmptySetSingleton;
  }
  return v2;
}

uint64_t sub_10000BA80()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_10000C984(&qword_10002E130);
  uint64_t v3 = sub_100021D08();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v28 = v0;
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    unint64_t v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v12 = 0;
    while (1)
    {
      if (v8)
      {
        unint64_t v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v15 = v14 | (v12 << 6);
      }
      else
      {
        int64_t v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          int64_t v12 = v16 + 1;
          if (v16 + 1 >= v9) {
            goto LABEL_33;
          }
          unint64_t v17 = v6[v12];
          if (!v17)
          {
            int64_t v12 = v16 + 2;
            if (v16 + 2 >= v9) {
              goto LABEL_33;
            }
            unint64_t v17 = v6[v12];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v28;
                uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
                if (v27 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v6 = -1 << v27;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v12 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v12 >= v9) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v6[v12];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v12 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      uint64_t v19 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
      uint64_t result = sub_100021C08(*(void *)(v4 + 40));
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
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
          uint64_t v26 = *(void *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

unint64_t sub_10000BD20(uint64_t a1, void *a2)
{
  sub_100021C08(a2[5]);
  unint64_t result = sub_100021C98();
  *(void *)((char *)a2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 56) |= 1 << result;
  *(void *)(a2[6] + 8 * result) = a1;
  ++a2[2];
  return result;
}

void sub_10000BDA4(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_10000BA80();
  }
  else
  {
    if (v7 > v6)
    {
      sub_10000BF2C();
      goto LABEL_14;
    }
    sub_10000C0D8();
  }
  uint64_t v8 = *v3;
  Swift::Int v9 = sub_100021C08(*(void *)(*v3 + 40));
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_100011CC0(0, (unint64_t *)&unk_10002E6F0);
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = sub_100021C18();

    if (v12)
    {
LABEL_13:
      sub_100021EC8();
      __break(1u);
    }
    else
    {
      uint64_t v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v14 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
        char v15 = sub_100021C18();

        if (v15) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v16 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v16 + 48) + 8 * a2) = a1;
  uint64_t v17 = *(void *)(v16 + 16);
  BOOL v18 = __OFADD__(v17, 1);
  uint64_t v19 = v17 + 1;
  if (v18) {
    __break(1u);
  }
  else {
    *(void *)(v16 + 16) = v19;
  }
}

id sub_10000BF2C()
{
  uint64_t v1 = v0;
  sub_10000C984(&qword_10002E130);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100021CF8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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
      goto LABEL_30;
    }
    if (v18 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19)
      {
        int64_t v9 = v18 + 2;
        if (v18 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v19 = *(void *)(v6 + 8 * v9);
        if (!v19) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    id result = v17;
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v13) {
    goto LABEL_28;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_10000C0D8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_10000C984(&qword_10002E130);
  uint64_t v3 = sub_100021D08();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v28 = v0;
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v12 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      int64_t v12 = v16 + 1;
      if (v16 + 1 >= v9) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v12);
      if (!v17)
      {
        int64_t v12 = v16 + 2;
        if (v16 + 2 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v12);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    Swift::Int v19 = *(void *)(v4 + 40);
    id v20 = *(id *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t result = sub_100021C08(v19);
    uint64_t v21 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v13 = __clz(__rbit64((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v26 = v23 == v25;
        if (v23 == v25) {
          unint64_t v23 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v10 + 8 * v23);
      }
      while (v27 == -1);
      unint64_t v13 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(void *)(*(void *)(v4 + 48) + 8 * v13) = v20;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v28;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v12);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_10000C354(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_100021E28();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_100021E28();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_100011CFC(&qword_10002E0B8, &qword_10002E0B0);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_10000C984(&qword_10002E0B0);
          int64_t v12 = sub_10000C794(v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_100011CC0(0, &qword_10002E6E0);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_100021E78();
  __break(1u);
  return result;
}

uint64_t sub_10000C574(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_100021E28();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_100021E28();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_100011CFC(&qword_10002E148, &qword_10002E140);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_10000C984(&qword_10002E140);
          int64_t v12 = sub_10000C800(v16, i, a3);
          id v14 = *v13;
          ((void (*)(uint64_t (**)(), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_100011CC0(0, &qword_10002E138);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_100021E78();
  __break(1u);
  return result;
}

void (*sub_10000C794(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_10000C8B0(v6, a2, a3);
  return sub_10000C7FC;
}

void (*sub_10000C800(uint64_t (**a1)(), unint64_t a2, uint64_t a3))(void *)
{
  unint64_t v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_10000CA2C(v6, a2, a3);
  return sub_10000C7FC;
}

void sub_10000C868(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*sub_10000C8B0(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)sub_100021D48();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_10000C930;
  }
  __break(1u);
  return result;
}

void sub_10000C930(id *a1)
{
}

uint64_t type metadata accessor for TTRIIntentsSnippetSection()
{
  uint64_t result = qword_10002E1B0;
  if (!qword_10002E1B0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000C984(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000C9C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TTRIIntentsSnippetSection();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t (*sub_10000CA2C(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)sub_100021D48();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_1000129E8;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000CAAC(uint64_t a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t sub_10000CAC0(void *a1)
{
  return sub_10000AE60(0, a1[2], 0, a1);
}

uint64_t sub_10000CAD4(void *a1)
{
  return sub_10000B0A8(0, a1[2], 0, a1);
}

uint64_t sub_10000CAE8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_10000C984(&qword_10002E078);
  uint64_t v35 = *(void *)(v8 - 8);
  uint64_t v36 = v8;
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = __chkstk_darwin(v9);
  id v14 = (char *)&v29 - v13;
  uint64_t v15 = *(void *)(a4 + 64);
  uint64_t v33 = a4 + 64;
  uint64_t v16 = -1 << *(unsigned char *)(a4 + 32);
  if (-v16 < 64) {
    uint64_t v17 = ~(-1 << -(char)v16);
  }
  else {
    uint64_t v17 = -1;
  }
  unint64_t v18 = v17 & v15;
  if (!a2)
  {
    int64_t v19 = 0;
    a3 = 0;
LABEL_39:
    uint64_t v28 = v33;
    *a1 = a4;
    a1[1] = v28;
    a1[2] = ~v16;
    a1[3] = v19;
    a1[4] = v18;
    return a3;
  }
  if (!a3)
  {
    int64_t v19 = 0;
    goto LABEL_39;
  }
  if (a3 < 0) {
    goto LABEL_41;
  }
  uint64_t v30 = -1 << *(unsigned char *)(a4 + 32);
  uint64_t v31 = a1;
  int64_t v19 = 0;
  uint64_t v20 = 0;
  int64_t v32 = (unint64_t)(63 - v16) >> 6;
  int64_t v29 = v32 - 1;
  uint64_t v34 = a3;
  if (!v18) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v21 = __clz(__rbit64(v18));
  v18 &= v18 - 1;
  unint64_t v22 = v21 | (v19 << 6);
  while (1)
  {
    ++v20;
    uint64_t v26 = *(void *)(a4 + 48);
    uint64_t v27 = sub_10000C984(&qword_10002E070);
    sub_100011AC8(v26 + *(void *)(*(void *)(v27 - 8) + 72) * v22, (uint64_t)v11, &qword_10002E070);
    *(void *)&v11[*(int *)(v36 + 48)] = *(void *)(*(void *)(a4 + 56) + 8 * v22);
    sub_100011A64((uint64_t)v11, (uint64_t)v14, &qword_10002E078);
    sub_100011A64((uint64_t)v14, a2, &qword_10002E078);
    a3 = v34;
    if (v20 == v34)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    a2 += *(void *)(v35 + 72);
    uint64_t result = swift_bridgeObjectRetain();
    if (v18) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v23 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v23 >= v32) {
      goto LABEL_33;
    }
    unint64_t v24 = *(void *)(v33 + 8 * v23);
    if (!v24)
    {
      v19 += 2;
      if (v23 + 1 >= v32)
      {
        unint64_t v18 = 0;
        int64_t v19 = v23;
      }
      else
      {
        unint64_t v24 = *(void *)(v33 + 8 * v19);
        if (v24) {
          goto LABEL_14;
        }
        int64_t v25 = v23 + 2;
        if (v23 + 2 >= v32) {
          goto LABEL_33;
        }
        unint64_t v24 = *(void *)(v33 + 8 * v25);
        if (v24)
        {
LABEL_17:
          int64_t v23 = v25;
          goto LABEL_18;
        }
        int64_t v19 = v23 + 3;
        if (v23 + 3 < v32)
        {
          unint64_t v24 = *(void *)(v33 + 8 * v19);
          if (v24)
          {
LABEL_14:
            int64_t v23 = v19;
            goto LABEL_18;
          }
          int64_t v25 = v23 + 4;
          if (v23 + 4 >= v32)
          {
LABEL_33:
            unint64_t v18 = 0;
            goto LABEL_37;
          }
          unint64_t v24 = *(void *)(v33 + 8 * v25);
          if (!v24)
          {
            while (1)
            {
              int64_t v23 = v25 + 1;
              if (__OFADD__(v25, 1)) {
                goto LABEL_42;
              }
              if (v23 >= v32)
              {
                unint64_t v18 = 0;
                int64_t v19 = v29;
                goto LABEL_37;
              }
              unint64_t v24 = *(void *)(v33 + 8 * v23);
              ++v25;
              if (v24) {
                goto LABEL_18;
              }
            }
          }
          goto LABEL_17;
        }
        unint64_t v18 = 0;
        int64_t v19 = v23 + 2;
      }
LABEL_37:
      a3 = v20;
LABEL_38:
      uint64_t v16 = v30;
      a1 = v31;
      goto LABEL_39;
    }
LABEL_18:
    unint64_t v18 = (v24 - 1) & v24;
    unint64_t v22 = __clz(__rbit64(v24)) + (v23 << 6);
    int64_t v19 = v23;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_10000CE40(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
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
LABEL_39:
    *uint64_t v5 = a4;
    v5[1] = v6;
    uint64_t v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
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
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  uint64_t v25 = -1 << *(unsigned char *)(a4 + 32);
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    uint64_t v20 = 8 * v16;
    unint64_t v21 = *(void **)(*(void *)(a4 + 48) + v20);
    ++v13;
    uint64_t v22 = *(void *)(*(void *)(a4 + 56) + v20);
    *uint64_t v11 = v21;
    v11[1] = v22;
    if (v13 == v10)
    {
      id v24 = v21;
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    id v23 = v21;
    uint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      break;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18)
    {
      v12 += 2;
      if (v17 + 1 >= v14)
      {
        unint64_t v9 = 0;
        int64_t v12 = v17;
      }
      else
      {
        unint64_t v18 = *(void *)(v6 + 8 * v12);
        if (v18) {
          goto LABEL_14;
        }
        int64_t v19 = v17 + 2;
        if (v17 + 2 >= v14) {
          goto LABEL_33;
        }
        unint64_t v18 = *(void *)(v6 + 8 * v19);
        if (v18)
        {
LABEL_17:
          int64_t v17 = v19;
          goto LABEL_18;
        }
        int64_t v12 = v17 + 3;
        if (v17 + 3 < v14)
        {
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
            goto LABEL_37;
          }
          unint64_t v18 = *(void *)(v6 + 8 * v19);
          if (!v18)
          {
            while (1)
            {
              int64_t v17 = v19 + 1;
              if (__OFADD__(v19, 1)) {
                goto LABEL_42;
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
          }
          goto LABEL_17;
        }
        unint64_t v9 = 0;
        int64_t v12 = v17 + 2;
      }
LABEL_37:
      uint64_t v10 = v13;
LABEL_38:
      uint64_t v7 = v25;
      goto LABEL_39;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_10000D058(uint64_t result, uint64_t *a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4;
  uint64_t v6 = a2;
  uint64_t v7 = (void *)result;
  if ((a4 & 0xC000000000000001) != 0)
  {
    uint64_t result = sub_100021DD8();
    unint64_t v8 = 0;
    uint64_t v9 = 0;
    unint64_t v10 = 0;
    unint64_t v4 = result | 0x8000000000000000;
    if (v6) {
      goto LABEL_3;
    }
LABEL_36:
    int64_t v11 = 0;
    a3 = 0;
LABEL_45:
    *uint64_t v7 = v4;
    v7[1] = v8;
    v7[2] = v9;
    v7[3] = v11;
    v7[4] = v10;
    return a3;
  }
  uint64_t v19 = -1 << *(unsigned char *)(a4 + 32);
  unint64_t v8 = a4 + 64;
  uint64_t v20 = ~v19;
  uint64_t v21 = -v19;
  if (v21 < 64) {
    uint64_t v22 = ~(-1 << v21);
  }
  else {
    uint64_t v22 = -1;
  }
  unint64_t v10 = v22 & *(void *)(a4 + 64);
  uint64_t v9 = v20;
  if (!a2) {
    goto LABEL_36;
  }
LABEL_3:
  if (!a3)
  {
    int64_t v11 = 0;
    goto LABEL_45;
  }
  if (a3 < 0)
  {
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  uint64_t v23 = v9;
  int64_t v11 = 0;
  uint64_t v12 = 0;
  int64_t v24 = (unint64_t)(v9 + 64) >> 6;
  while ((v4 & 0x8000000000000000) != 0)
  {
    if (!sub_100021E08())
    {
      a3 = v12;
LABEL_44:
      uint64_t v9 = v23;
      goto LABEL_45;
    }
    swift_unknownObjectRelease();
    sub_100011CC0(0, &qword_10002E6E0);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    uint64_t v15 = v25;
    uint64_t result = swift_unknownObjectRelease();
    if (!v25) {
      goto LABEL_43;
    }
LABEL_8:
    ++v12;
    *v6++ = v15;
    if (v12 == a3) {
      goto LABEL_44;
    }
  }
  if (v10)
  {
    unint64_t v13 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    unint64_t v14 = v13 | (v11 << 6);
    goto LABEL_7;
  }
  int64_t v16 = v11 + 1;
  if (__OFADD__(v11, 1))
  {
    __break(1u);
    goto LABEL_47;
  }
  if (v16 >= v24) {
    goto LABEL_39;
  }
  unint64_t v17 = *(void *)(v8 + 8 * v16);
  if (v17) {
    goto LABEL_23;
  }
  v11 += 2;
  if (v16 + 1 >= v24)
  {
    unint64_t v10 = 0;
    int64_t v11 = v16;
    goto LABEL_43;
  }
  unint64_t v17 = *(void *)(v8 + 8 * v11);
  if (v17)
  {
LABEL_16:
    int64_t v16 = v11;
LABEL_23:
    unint64_t v10 = (v17 - 1) & v17;
    unint64_t v14 = __clz(__rbit64(v17)) + (v16 << 6);
    int64_t v11 = v16;
LABEL_7:
    uint64_t result = (uint64_t)*(id *)(*(void *)(v4 + 56) + 8 * v14);
    uint64_t v15 = result;
    if (!result) {
      goto LABEL_43;
    }
    goto LABEL_8;
  }
  int64_t v18 = v16 + 2;
  if (v16 + 2 >= v24) {
    goto LABEL_39;
  }
  unint64_t v17 = *(void *)(v8 + 8 * v18);
  if (v17)
  {
LABEL_22:
    int64_t v16 = v18;
    goto LABEL_23;
  }
  int64_t v11 = v16 + 3;
  if (v16 + 3 >= v24)
  {
    unint64_t v10 = 0;
    int64_t v11 = v16 + 2;
    goto LABEL_43;
  }
  unint64_t v17 = *(void *)(v8 + 8 * v11);
  if (v17) {
    goto LABEL_16;
  }
  int64_t v18 = v16 + 4;
  if (v16 + 4 >= v24)
  {
LABEL_39:
    unint64_t v10 = 0;
LABEL_43:
    a3 = v12;
    goto LABEL_44;
  }
  unint64_t v17 = *(void *)(v8 + 8 * v18);
  if (v17) {
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v16 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v16 >= v24)
    {
      unint64_t v10 = 0;
      int64_t v11 = v24 - 1;
      goto LABEL_43;
    }
    unint64_t v17 = *(void *)(v8 + 8 * v16);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_48:
  __break(1u);
  return result;
}

BOOL sub_10000D32C(void *a1, void *a2)
{
  id v3 = [a1 icsDisplayOrder];
  return v3 < [a2 icsDisplayOrder];
}

uint64_t sub_10000D378(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_100021E28();
    swift_bridgeObjectRelease();
  }
  sub_100011CC0(0, (unint64_t *)&unk_10002E6F0);
  sub_100011C58();
  uint64_t result = sub_100021A98();
  uint64_t v10 = result;
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_100021E28();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v4) {
      return v10;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v4) {
      return v10;
    }
  }
  if (v4 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        uint64_t v6 = (void *)sub_100021D48();
        sub_10000B5E8(&v9, v6);
      }
    }
    else
    {
      uint64_t v7 = (void **)(a1 + 32);
      do
      {
        unint64_t v8 = *v7++;
        sub_10000B5E8(&v9, v8);

        --v4;
      }
      while (v4);
    }
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000D4CC(uint64_t *a1, void (*a2)(char *__return_ptr, void **, void **), uint64_t a3)
{
  void (*v122)(char *__return_ptr, void **, void **);
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  unsigned __int8 v127;
  void *v128;
  void v129[2];
  uint64_t v130;

  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  Swift::Int v8 = a1[1];
  swift_retain_n();
  Swift::Int v9 = sub_100021EA8(v8);
  if (v9 >= v8)
  {
    if (v8 < 0) {
      goto LABEL_135;
    }
    if (v8)
    {
      swift_retain();
      sub_10000839C(0, v8, 1, a1, a2, a3);
    }
    swift_release_n();
    return swift_release();
  }
  if (v8 >= 0) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = v8 + 1;
  }
  if (v8 < -1) {
    goto LABEL_143;
  }
  uint64_t v112 = a1;
  Swift::Int v113 = v9;
  uint64_t v122 = a2;
  unint64_t v123 = a3;
  unint64_t v124 = v3;
  if (v8 < 2)
  {
    unint64_t v14 = (char *)_swiftEmptyArrayStorage;
    uint64_t v130 = (uint64_t)_swiftEmptyArrayStorage;
    char v118 = (void **)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 32);
    if (v8 != 1)
    {
      unint64_t v17 = _swiftEmptyArrayStorage[2];
LABEL_101:
      if (v17 >= 2)
      {
        uint64_t v100 = *v112;
        Swift::Int v126 = *v112;
        do
        {
          unint64_t v101 = v17 - 2;
          if (v17 < 2) {
            goto LABEL_130;
          }
          if (!v100) {
            goto LABEL_142;
          }
          uint64_t v102 = (uint64_t)v14;
          uint64_t v103 = *(void *)&v14[16 * v101 + 32];
          uint64_t v104 = *(void *)&v14[16 * v17 + 24];
          unint64_t v105 = (void **)(v100 + 8 * v103);
          uint64_t v106 = (void **)(v100 + 8 * *(void *)&v14[16 * v17 + 16]);
          unint64_t v107 = v100 + 8 * v104;
          swift_retain();
          sub_100008C0C(v105, v106, v107, v118, v122, a3);
          if (v124) {
            break;
          }
          if (v104 < v103) {
            goto LABEL_131;
          }
          unint64_t v14 = (char *)v102;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            unint64_t v14 = sub_10000A1D4(v102);
          }
          if (v101 >= *((void *)v14 + 2)) {
            goto LABEL_132;
          }
          uint64_t v108 = &v14[16 * v101 + 32];
          *(void *)uint64_t v108 = v103;
          *((void *)v108 + 1) = v104;
          unint64_t v109 = *((void *)v14 + 2);
          if (v17 > v109) {
            goto LABEL_133;
          }
          memmove(&v14[16 * v17 + 16], &v14[16 * v17 + 32], 16 * (v109 - v17));
          *((void *)v14 + 2) = v109 - 1;
          unint64_t v17 = v109 - 1;
          BOOL v78 = v109 > 2;
          a3 = v123;
          uint64_t v100 = v126;
        }
        while (v78);
      }
LABEL_112:
      swift_bridgeObjectRelease();
      *(void *)((v130 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
      sub_100021A28();
      swift_release_n();
      swift_release();
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v11 = v10 >> 1;
    sub_100011CC0(0, &qword_10002E6E0);
    uint64_t v12 = sub_100021A48();
    *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10) = v11;
    char v118 = (void **)((v12 & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v130 = v12;
  }
  Swift::Int v15 = 0;
  uint64_t v16 = *a1;
  uint64_t v110 = *a1 - 8;
  uint64_t v111 = *a1 + 16;
  unint64_t v14 = (char *)_swiftEmptyArrayStorage;
  Swift::Int v117 = v8;
  Swift::Int v125 = *a1;
  while (1)
  {
    Swift::Int v18 = v15;
    Swift::Int v19 = v15 + 1;
    Swift::Int v120 = v15;
    if (v15 + 1 < v8)
    {
      uint64_t v114 = v14;
      uint64_t v20 = *(void **)(v16 + 8 * v19);
      uint64_t v128 = *(void **)(v16 + 8 * v15);
      uint64_t v21 = v128;
      v129[0] = v20;
      id v22 = v20;
      id v23 = v21;
      a2((char *)&v127, (void **)v129, &v128);

      int v24 = v127;
      Swift::Int v19 = v18 + 2;
      if (v18 + 2 < v8)
      {
        uint64_t v25 = (void **)(v111 + 8 * v18);
        while (1)
        {
          Swift::Int v26 = v19;
          uint64_t v27 = *v25;
          uint64_t v128 = *(v25 - 1);
          uint64_t v28 = v128;
          v129[0] = v27;
          id v29 = v27;
          id v30 = v28;
          a2((char *)&v127, (void **)v129, &v128);

          if (v24 != v127) {
            break;
          }
          Swift::Int v19 = v26 + 1;
          ++v25;
          if (v8 == v26 + 1)
          {
            Swift::Int v19 = v8;
            goto LABEL_23;
          }
        }
        Swift::Int v19 = v26;
LABEL_23:
        Swift::Int v18 = v120;
      }
      unint64_t v14 = v114;
      uint64_t v16 = v125;
      if (v24)
      {
        if (v19 < v18) {
          goto LABEL_136;
        }
        if (v18 < v19)
        {
          uint64_t v31 = (uint64_t *)(v110 + 8 * v19);
          Swift::Int v32 = v19;
          Swift::Int v33 = v18;
          uint64_t v34 = (uint64_t *)(v125 + 8 * v18);
          do
          {
            if (v33 != --v32)
            {
              if (!v125) {
                goto LABEL_141;
              }
              uint64_t v35 = *v34;
              *uint64_t v34 = *v31;
              *uint64_t v31 = v35;
            }
            ++v33;
            --v31;
            ++v34;
          }
          while (v33 < v32);
        }
      }
    }
    if (v19 < v8)
    {
      if (__OFSUB__(v19, v18)) {
        goto LABEL_134;
      }
      if (v19 - v18 < v113) {
        break;
      }
    }
LABEL_51:
    if (v19 < v18) {
      goto LABEL_129;
    }
    Swift::Int v116 = v19;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v14 = sub_100009E1C(0, *((void *)v14 + 2) + 1, 1, v14);
    }
    unint64_t v47 = *((void *)v14 + 2);
    unint64_t v46 = *((void *)v14 + 3);
    unint64_t v17 = v47 + 1;
    uint64_t v16 = v125;
    if (v47 >= v46 >> 1)
    {
      unint64_t v99 = sub_100009E1C((char *)(v46 > 1), v47 + 1, 1, v14);
      uint64_t v16 = v125;
      unint64_t v14 = v99;
    }
    *((void *)v14 + 2) = v17;
    unint64_t v48 = &v14[16 * v47 + 32];
    *(void *)unint64_t v48 = v18;
    *((void *)v48 + 1) = v116;
    if (v47)
    {
      unint64_t v49 = v14 + 32;
      while (1)
      {
        unint64_t v50 = v17 - 1;
        if (v17 >= 4)
        {
          uint64_t v55 = &v49[16 * v17];
          uint64_t v56 = *((void *)v55 - 8);
          uint64_t v57 = *((void *)v55 - 7);
          BOOL v61 = __OFSUB__(v57, v56);
          uint64_t v58 = v57 - v56;
          if (v61) {
            goto LABEL_118;
          }
          uint64_t v60 = *((void *)v55 - 6);
          uint64_t v59 = *((void *)v55 - 5);
          BOOL v61 = __OFSUB__(v59, v60);
          uint64_t v53 = v59 - v60;
          char v54 = v61;
          if (v61) {
            goto LABEL_119;
          }
          unint64_t v62 = v17 - 2;
          unint64_t v63 = &v49[16 * v17 - 32];
          uint64_t v65 = *(void *)v63;
          uint64_t v64 = *((void *)v63 + 1);
          BOOL v61 = __OFSUB__(v64, v65);
          uint64_t v66 = v64 - v65;
          if (v61) {
            goto LABEL_121;
          }
          BOOL v61 = __OFADD__(v53, v66);
          uint64_t v67 = v53 + v66;
          if (v61) {
            goto LABEL_124;
          }
          if (v67 >= v58)
          {
            uint64_t v85 = &v49[16 * v50];
            uint64_t v87 = *(void *)v85;
            uint64_t v86 = *((void *)v85 + 1);
            BOOL v61 = __OFSUB__(v86, v87);
            uint64_t v88 = v86 - v87;
            if (v61) {
              goto LABEL_128;
            }
            BOOL v78 = v53 < v88;
            goto LABEL_89;
          }
        }
        else
        {
          if (v17 != 3)
          {
            uint64_t v79 = *((void *)v14 + 4);
            uint64_t v80 = *((void *)v14 + 5);
            BOOL v61 = __OFSUB__(v80, v79);
            uint64_t v72 = v80 - v79;
            char v73 = v61;
            goto LABEL_83;
          }
          uint64_t v52 = *((void *)v14 + 4);
          uint64_t v51 = *((void *)v14 + 5);
          BOOL v61 = __OFSUB__(v51, v52);
          uint64_t v53 = v51 - v52;
          char v54 = v61;
        }
        if (v54) {
          goto LABEL_120;
        }
        unint64_t v62 = v17 - 2;
        uint64_t v68 = &v49[16 * v17 - 32];
        uint64_t v70 = *(void *)v68;
        uint64_t v69 = *((void *)v68 + 1);
        BOOL v71 = __OFSUB__(v69, v70);
        uint64_t v72 = v69 - v70;
        char v73 = v71;
        if (v71) {
          goto LABEL_123;
        }
        unint64_t v74 = &v49[16 * v50];
        uint64_t v76 = *(void *)v74;
        uint64_t v75 = *((void *)v74 + 1);
        BOOL v61 = __OFSUB__(v75, v76);
        uint64_t v77 = v75 - v76;
        if (v61) {
          goto LABEL_126;
        }
        if (__OFADD__(v72, v77)) {
          goto LABEL_127;
        }
        if (v72 + v77 >= v53)
        {
          BOOL v78 = v53 < v77;
LABEL_89:
          if (v78) {
            unint64_t v50 = v62;
          }
          goto LABEL_91;
        }
LABEL_83:
        if (v73) {
          goto LABEL_122;
        }
        uint64_t v81 = &v49[16 * v50];
        uint64_t v83 = *(void *)v81;
        uint64_t v82 = *((void *)v81 + 1);
        BOOL v61 = __OFSUB__(v82, v83);
        uint64_t v84 = v82 - v83;
        if (v61) {
          goto LABEL_125;
        }
        if (v84 < v72) {
          goto LABEL_15;
        }
LABEL_91:
        unint64_t v89 = v50 - 1;
        if (v50 - 1 >= v17)
        {
          __break(1u);
LABEL_115:
          __break(1u);
LABEL_116:
          __break(1u);
LABEL_117:
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
          goto LABEL_138;
        }
        if (!v16) {
          goto LABEL_140;
        }
        uint64_t v90 = &v49[16 * v89];
        uint64_t v91 = *(void *)v90;
        unint64_t v92 = v50;
        unint64_t v93 = &v49[16 * v50];
        uint64_t v94 = *((void *)v93 + 1);
        unint64_t v95 = (void **)(v16 + 8 * *(void *)v90);
        Swift::Int v121 = (void **)(v16 + 8 * *(void *)v93);
        unint64_t v96 = v16 + 8 * v94;
        swift_retain();
        sub_100008C0C(v95, v121, v96, v118, v122, v123);
        if (v124) {
          goto LABEL_112;
        }
        Swift::Int v8 = v117;
        if (v94 < v91) {
          goto LABEL_115;
        }
        if (v92 > *((void *)v14 + 2)) {
          goto LABEL_116;
        }
        unint64_t v97 = v92;
        *(void *)uint64_t v90 = v91;
        unint64_t v49 = v14 + 32;
        *(void *)&v14[16 * v89 + 40] = v94;
        unint64_t v98 = *((void *)v14 + 2);
        if (v92 >= v98) {
          goto LABEL_117;
        }
        unint64_t v17 = v98 - 1;
        memmove(v93, v93 + 16, 16 * (v98 - 1 - v97));
        *((void *)v14 + 2) = v98 - 1;
        a2 = v122;
        a3 = v123;
        uint64_t v16 = v125;
        if (v98 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v17 = 1;
LABEL_15:
    Swift::Int v15 = v116;
    if (v116 >= v8) {
      goto LABEL_101;
    }
  }
  if (__OFADD__(v18, v113)) {
    goto LABEL_137;
  }
  if (v18 + v113 >= v8) {
    Swift::Int v36 = v8;
  }
  else {
    Swift::Int v36 = v18 + v113;
  }
  if (v36 >= v18)
  {
    if (v19 != v36)
    {
      uint64_t v115 = v14;
      uint64_t v37 = (void **)(v110 + 8 * v19);
      Swift::Int v119 = v36;
      do
      {
        uint64_t v38 = *(void **)(v16 + 8 * v19);
        Swift::Int v39 = v18;
        uint64_t v40 = v37;
        while (1)
        {
          Swift::Int v41 = v19;
          uint64_t v128 = *v40;
          uint64_t v42 = v128;
          v129[0] = v38;
          id v43 = v38;
          id v44 = v42;
          a2((char *)&v127, (void **)v129, &v128);

          if (v127 != 1) {
            break;
          }
          uint64_t v16 = v125;
          if (!v125) {
            goto LABEL_139;
          }
          Swift::Int v19 = v41;
          uint64_t v45 = *v40;
          uint64_t v38 = v40[1];
          *uint64_t v40 = v38;
          v40[1] = v45;
          --v40;
          if (v41 == ++v39) {
            goto LABEL_44;
          }
        }
        uint64_t v16 = v125;
        Swift::Int v19 = v41;
LABEL_44:
        ++v19;
        ++v37;
        Swift::Int v18 = v120;
      }
      while (v19 != v119);
      Swift::Int v19 = v119;
      unint64_t v14 = v115;
      Swift::Int v8 = v117;
    }
    goto LABEL_51;
  }
LABEL_138:
  __break(1u);
LABEL_139:
  swift_release_n();
  __break(1u);
LABEL_140:
  swift_release_n();
  __break(1u);
LABEL_141:
  swift_release_n();
  __break(1u);
LABEL_142:
  swift_release_n();
  __break(1u);
LABEL_143:
  swift_release_n();
  swift_release();
  uint64_t result = sub_100021E18();
  __break(1u);
  return result;
}

uint64_t sub_10000DD40(uint64_t *a1, void (*a2)(char *__return_ptr, void **, void **), uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a2;
  *(void *)(v6 + 24) = a3;
  uint64_t v7 = *a1;
  swift_retain_n();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v7;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v7 = sub_10000CAAC(v7);
    *a1 = v7;
  }
  uint64_t v9 = *(void *)(v7 + 16);
  v11[0] = v7 + 32;
  v11[1] = v9;
  swift_retain();
  sub_10000D4CC(v11, a2, a3);
  swift_release();
  sub_100021D88();
  swift_release();
  return swift_release();
}

uint64_t sub_10000DE1C(unint64_t a1, uint64_t *a2, uint64_t *a3)
{
  unint64_t v5 = a1;
  uint64_t v6 = a1 >> 62;
  if (a1 >> 62) {
    goto LABEL_33;
  }
  uint64_t v7 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t v70 = (uint64_t)a2;
    uint64_t v66 = v6;
    if (v7)
    {
      unint64_t v75 = (unint64_t)_swiftEmptyArrayStorage;
      sub_100021D98();
      if (v7 < 0)
      {
        __break(1u);
LABEL_83:
        swift_bridgeObjectRelease();
        sub_10000C984(&qword_10002E118);
        sub_100021ED8();
        __break(1u);
        swift_release_n();
        swift_bridgeObjectRelease();
        swift_release();
        __break(1u);
        swift_bridgeObjectRelease();
        uint64_t result = swift_release();
        __break(1u);
        return result;
      }
      uint64_t v8 = 0;
      do
      {
        if ((v5 & 0xC000000000000001) != 0) {
          id v9 = (id)sub_100021D48();
        }
        else {
          id v9 = *(id *)(v5 + 8 * v8 + 32);
        }
        uint64_t v10 = v9;
        ++v8;
        id v11 = [v9 objectID];

        sub_100021D78();
        sub_100021DA8();
        sub_100021DB8();
        sub_100021D88();
      }
      while (v7 != v8);
      uint64_t v12 = (void *)v75;
    }
    else
    {
      uint64_t v12 = _swiftEmptyArrayStorage;
    }
    uint64_t v68 = a3;
    uint64_t v13 = sub_10000D378((unint64_t)v12);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v72 = v5;
    unint64_t v14 = (unint64_t)sub_100004740(v5, v13);
    unint64_t v5 = v14;
    unint64_t v75 = (unint64_t)&_swiftEmptyDictionarySingleton;
    if (v14 >> 62) {
      break;
    }
    uint64_t v15 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v69 = v13;
    if (!v15) {
      goto LABEL_35;
    }
LABEL_14:
    a3 = (uint64_t *)&_swiftEmptyDictionarySingleton;
    uint64_t v16 = 4;
    while (1)
    {
      a2 = (uint64_t *)(v16 - 4);
      id v18 = (v5 & 0xC000000000000001) != 0 ? (id)sub_100021D48() : *(id *)(v5 + 8 * v16);
      id v19 = v18;
      uint64_t v6 = v16 - 3;
      if (__OFADD__(a2, 1)) {
        break;
      }
      uint64_t v20 = (void *)sub_100021AB8();
      a2 = a3;
      unint64_t v22 = sub_100004EB8(v20);
      uint64_t v23 = a3[2];
      BOOL v24 = (v21 & 1) == 0;
      uint64_t v25 = v23 + v24;
      if (__OFADD__(v23, v24)) {
        goto LABEL_31;
      }
      char v26 = v21;
      if (a3[3] < v25)
      {
        sub_100005364(v25, 1);
        a3 = (uint64_t *)v75;
        unint64_t v27 = sub_100004EB8(v20);
        if ((v26 & 1) != (v28 & 1)) {
          goto LABEL_83;
        }
        unint64_t v22 = v27;
      }
      if (v26)
      {

        unint64_t v17 = (void *)(a3[7] + 8 * v22);
        sub_1000219F8();
        if (*(void *)((*v17 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v17 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_100021A38();
        }
        sub_100021A58();
        sub_100021A28();
      }
      else
      {
        sub_10000C984(&qword_10002E058);
        uint64_t v29 = swift_allocObject();
        *(_OWORD *)(v29 + 16) = xmmword_100022910;
        *(void *)(v29 + 32) = v19;
        v74[0] = v29;
        a2 = v74;
        sub_100021A28();
        uint64_t v30 = v74[0];
        a3[(v22 >> 6) + 8] |= 1 << v22;
        uint64_t v31 = 8 * v22;
        *(void *)(a3[6] + v31) = v20;
        *(void *)(a3[7] + v31) = v30;
        uint64_t v32 = a3[2];
        BOOL v33 = __OFADD__(v32, 1);
        uint64_t v34 = v32 + 1;
        if (v33) {
          goto LABEL_32;
        }
        a3[2] = v34;
      }
      ++v16;
      if (v6 == v15) {
        goto LABEL_36;
      }
    }
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_100021E28();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_100021E28();
  swift_bridgeObjectRelease();
  uint64_t v69 = v13;
  if (v15) {
    goto LABEL_14;
  }
LABEL_35:
  a3 = (uint64_t *)&_swiftEmptyDictionarySingleton;
LABEL_36:
  swift_bridgeObjectRelease();
  uint64_t v35 = v70;
  if (v70)
  {
    uint64_t v36 = swift_allocObject();
    *(void *)(v36 + 16) = v70;
    *(void *)(v36 + 24) = v68;
    if (v66)
    {
      swift_retain_n();
      swift_bridgeObjectRetain();
      sub_100011B88(v70);
      uint64_t v37 = (uint64_t)sub_100006334(v72);
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v37 = v72 & 0xFFFFFFFFFFFFFF8;
      swift_retain_n();
      swift_bridgeObjectRetain();
      sub_100011B88(v70);
    }
    unint64_t v75 = v37;
    sub_10000DD40((uint64_t *)&v75, (void (*)(char *__return_ptr, void **, void **))sub_100011BE0, v36);
    swift_release_n();
    swift_release_n();
    unint64_t v38 = v75;
  }
  else
  {
    unint64_t v38 = v72;
    swift_bridgeObjectRetain();
  }
  unint64_t v75 = (unint64_t)_swiftEmptyArrayStorage;
  if (v38 >> 62)
  {
LABEL_79:
    sub_100011B88(v35);
    swift_retain();
    swift_bridgeObjectRetain();
    uint64_t v39 = sub_100021E28();
    if (!v39) {
      goto LABEL_80;
    }
LABEL_44:
    uint64_t v40 = 0;
    unint64_t v41 = v38 & 0xC000000000000001;
    uint64_t v73 = v39;
    unint64_t v71 = v38 + 32;
    uint64_t v67 = v69 + 56;
    while (1)
    {
      if (v41) {
        id v43 = (id)sub_100021D48();
      }
      else {
        id v43 = *(id *)(v71 + 8 * v40);
      }
      id v42 = v43;
      BOOL v33 = __OFADD__(v40++, 1);
      if (v33)
      {
        __break(1u);
        goto LABEL_79;
      }
      uint64_t v44 = sub_100021AB8();
      if (!v44) {
        goto LABEL_66;
      }
      uint64_t v45 = (void *)v44;
      if (![v42 isSubtask]) {
        goto LABEL_65;
      }
      if ((v69 & 0xC000000000000001) != 0)
      {
        id v46 = v45;
        unint64_t v38 = sub_100021CE8();

        if ((v38 & 1) == 0) {
          goto LABEL_66;
        }
      }
      else
      {
        if (!*(void *)(v69 + 16)) {
          goto LABEL_65;
        }
        Swift::Int v47 = sub_100021C08(*(void *)(v69 + 40));
        uint64_t v48 = -1 << *(unsigned char *)(v69 + 32);
        unint64_t v49 = v47 & ~v48;
        if (((*(void *)(v67 + ((v49 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v49) & 1) == 0) {
          goto LABEL_65;
        }
        unint64_t v50 = v41;
        unint64_t v38 = sub_100011CC0(0, (unint64_t *)&unk_10002E6F0);
        id v51 = *(id *)(*(void *)(v69 + 48) + 8 * v49);
        char v52 = sub_100021C18();

        if ((v52 & 1) == 0)
        {
          uint64_t v53 = ~v48;
          unint64_t v54 = (v49 + 1) & v53;
          if (((*(void *)(v67 + ((v54 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v54) & 1) == 0)
          {
            unint64_t v41 = v50;
LABEL_65:

            uint64_t v35 = v70;
            uint64_t v39 = v73;
LABEL_66:
            id v42 = v42;
            unint64_t v38 = (unint64_t)&v75;
            sub_1000219F8();
            if (*(void *)((v75 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v75 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              sub_100021A38();
            }
            sub_100021A58();
            sub_100021A28();
            id v57 = [v42 objectID];
            uint64_t v58 = v57;
            if (a3[2] && (unint64_t v38 = (unint64_t)a3, v59 = sub_100004EB8(v57), (v60 & 1) != 0))
            {
              unint64_t v61 = *(void *)(a3[7] + 8 * v59);
              swift_bridgeObjectRetain();

              if (v35)
              {
                uint64_t v62 = swift_allocObject();
                *(void *)(v62 + 16) = v35;
                *(void *)(v62 + 24) = v68;
                if ((v61 & 0x8000000000000000) != 0 || (v61 & 0x4000000000000000) != 0)
                {
                  swift_retain_n();
                  sub_100011B88(v35);
                  swift_bridgeObjectRetain();
                  swift_retain();
                  uint64_t v63 = (uint64_t)sub_100006334(v61);
                  swift_bridgeObjectRelease();
                }
                else
                {
                  uint64_t v63 = v61 & 0xFFFFFFFFFFFFFF8;
                  swift_retain_n();
                  sub_100011B88(v35);
                  swift_bridgeObjectRetain();
                  swift_retain();
                }
                v74[0] = v63;
                sub_10000DD40(v74, (void (*)(char *__return_ptr, void **, void **))sub_100011BE0, v62);
                swift_bridgeObjectRelease();
                swift_release_n();
                unint64_t v61 = v74[0];
              }
              unint64_t v38 = (unint64_t)&v75;
              sub_100019C10(v61);
            }
            else
            {

              id v42 = v58;
            }
            goto LABEL_46;
          }
          while (1)
          {
            id v55 = *(id *)(*(void *)(v69 + 48) + 8 * v54);
            char v56 = sub_100021C18();

            if (v56) {
              break;
            }
            unint64_t v54 = (v54 + 1) & v53;
            unint64_t v41 = v50;
            if (((*(void *)(v67 + ((v54 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v54) & 1) == 0) {
              goto LABEL_65;
            }
          }
        }

        id v42 = v45;
        uint64_t v35 = v70;
        unint64_t v41 = v50;
        uint64_t v39 = v73;
      }
LABEL_46:

      if (v40 == v39)
      {
        swift_bridgeObjectRelease();
        uint64_t v64 = (void *)v75;
        goto LABEL_81;
      }
    }
  }
  uint64_t v39 = *(void *)((v38 & 0xFFFFFFFFFFFFFF8) + 0x10);
  sub_100011B88(v70);
  swift_retain();
  swift_bridgeObjectRetain();
  if (v39) {
    goto LABEL_44;
  }
LABEL_80:
  swift_bridgeObjectRelease();
  uint64_t v64 = _swiftEmptyArrayStorage;
LABEL_81:
  sub_100011B98(v35);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release_n();
  return (uint64_t)v64;
}

uint64_t sub_10000E720(unint64_t a1)
{
  uint64_t v2 = type metadata accessor for TTRIIntentsSnippetSection();
  uint64_t v3 = v2 - 8;
  uint64_t v4 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v6 = (uint64_t *)((char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = sub_10000C984(&qword_10002E600);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  uint64_t v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v26 - v11;
  sub_10000C984((uint64_t *)&unk_10002E6D0);
  unint64_t v13 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_100022930;
  uint64_t v15 = enum case for REMNavigationSpecifier.SmartListPathSpecifier.showContents(_:);
  uint64_t v16 = sub_100021848();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 104))(v12, v15, v16);
  uint64_t v17 = enum case for REMNavigationSpecifier.flagged(_:);
  uint64_t v18 = sub_100021888();
  uint64_t v19 = *(void *)(v18 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 104))(v12, v17, v18);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v12, 0, 1, v18);
  uint64_t v20 = v14 + v13;
  swift_bridgeObjectRetain();
  v28._object = (void *)0x8000000100025080;
  v27._countAndFlagsBits = 0x64656767616C46;
  v27._object = (void *)0xE700000000000000;
  v28._countAndFlagsBits = 0xD000000000000012;
  uint64_t v21 = sub_100021728(v27, v28);
  uint64_t v23 = v22;
  sub_100011AC8((uint64_t)v12, (uint64_t)v10, &qword_10002E600);
  uint64_t *v6 = v21;
  v6[1] = v23;
  sub_100011AC8((uint64_t)v10, (uint64_t)v6 + *(int *)(v3 + 28), &qword_10002E600);
  uint64_t v24 = sub_10000DE1C(a1, 0, 0);
  swift_bridgeObjectRelease();
  sub_100011B2C((uint64_t)v10, &qword_10002E600);
  *(uint64_t *)((char *)v6 + *(int *)(v3 + 32)) = v24;
  sub_10000C9C8((uint64_t)v6, v20);
  sub_100011B2C((uint64_t)v12, &qword_10002E600);
  return v14;
}

void *sub_10000EA14(uint64_t a1)
{
  uint64_t v2 = sub_100021648();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v37 = (char *)&v30 - v7;
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    sub_10000C984(&qword_10002E088);
    uint64_t v9 = sub_100021D28();
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
      sub_10000F5B0(&qword_10002E090, (void (*)(uint64_t))&type metadata accessor for Calendar.Component);
      uint64_t v16 = sub_100021928();
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
          sub_10000F5B0(&qword_10002E098, (void (*)(uint64_t))&type metadata accessor for Calendar.Component);
          char v23 = sub_100021958();
          uint64_t v24 = *v15;
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
        uint64_t v25 = v37;
        *(void *)(v36 + 8 * v19) = v21 | v20;
        uint64_t result = (void *)(*v31)(*(void *)(v9 + 48) + v18 * v14, v25, v2);
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

uint64_t sub_10000ED2C(uint64_t a1, uint64_t a2)
{
  sub_10000C984(&qword_10002E070);
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v22 - v7;
  uint64_t v9 = sub_1000215B8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v22 - v14;
  sub_100011AC8(a1, (uint64_t)v8, &qword_10002E070);
  uint64_t v16 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  if (v16(v8, 1, v9) == 1)
  {
    sub_100011B2C((uint64_t)v8, &qword_10002E070);
    char v17 = 0;
  }
  else
  {
    unint64_t v18 = v8;
    unint64_t v19 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
    v19(v15, v18, v9);
    sub_100011AC8(a2, (uint64_t)v6, &qword_10002E070);
    if (v16(v6, 1, v9) == 1)
    {
      (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
      sub_100011B2C((uint64_t)v6, &qword_10002E070);
      char v17 = 1;
    }
    else
    {
      v19(v13, v6, v9);
      char v17 = sub_100021588();
      uint64_t v20 = *(void (**)(char *, uint64_t))(v10 + 8);
      v20(v13, v9);
      v20(v15, v9);
    }
  }
  return v17 & 1;
}

uint64_t sub_10000EFA8()
{
  id v0 = [objc_allocWithZone((Class)NSDateFormatter) init];
  [v0 setDateStyle:4];
  [v0 setDoesRelativeDateFormatting:1];
  Class isa = sub_100021578().super.isa;
  id v2 = [v0 stringFromDate:isa];

  uint64_t v3 = sub_100021998();
  uint64_t v5 = v4;

  [v0 setDoesRelativeDateFormatting:0];
  Class v6 = sub_100021578().super.isa;
  id v7 = [v0 stringFromDate:v6];

  uint64_t v8 = sub_100021998();
  uint64_t v10 = v9;

  if (v3 == v8 && v5 == v10)
  {

    swift_bridgeObjectRelease_n();
    return 0;
  }
  char v11 = sub_100021EB8();

  swift_bridgeObjectRelease();
  if (v11)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  return v3;
}

uint64_t sub_10000F114(uint64_t a1)
{
  uint64_t v2 = sub_1000215B8();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000C984(&qword_10002E070);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100011AC8(a1, (uint64_t)v8, &qword_10002E070);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2) == 1)
  {
    v18._object = (void *)0x8000000100025040;
    v17._countAndFlagsBits = 0x7564656863736E55;
    v17._object = (void *)0xEB0000000064656CLL;
    v18._countAndFlagsBits = 0xD000000000000032;
    return sub_100021728(v17, v18);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v8, v2);
    uint64_t v10 = sub_10000EFA8();
    if (v11)
    {
      uint64_t v9 = v10;
    }
    else
    {
      if (qword_10002E010 != -1) {
        swift_once();
      }
      id v12 = (id)qword_10002E018;
      Class isa = sub_100021578().super.isa;
      id v14 = [v12 stringFromDate:isa];

      uint64_t v9 = sub_100021998();
    }
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return v9;
}

uint64_t sub_10000F364(void *a1, void *a2)
{
  uint64_t v4 = sub_10000C984(&qword_10002E070);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v22 - v8;
  id v10 = [a1 displayDate];
  if (v10)
  {
    uint64_t v11 = v10;
    id v12 = [v10 date];

    sub_100021598();
    uint64_t v13 = sub_1000215B8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v9, 0, 1, v13);
  }
  else
  {
    uint64_t v14 = sub_1000215B8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v9, 1, 1, v14);
  }
  id v15 = [a2 displayDate];
  if (v15)
  {
    uint64_t v16 = v15;
    id v17 = [v15 date];

    sub_100021598();
    uint64_t v18 = sub_1000215B8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v7, 0, 1, v18);
  }
  else
  {
    uint64_t v19 = sub_1000215B8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v7, 1, 1, v19);
  }
  char v20 = sub_10000ED2C((uint64_t)v9, (uint64_t)v7);
  sub_100011B2C((uint64_t)v7, &qword_10002E070);
  sub_100011B2C((uint64_t)v9, &qword_10002E070);
  return v20 & 1;
}

uint64_t sub_10000F5B0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000F5FC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000F644(void **a1, void **a2, void **a3, void **a4)
{
  uint64_t v126 = sub_1000215B8();
  unint64_t v123 = *(void ***)(v126 - 8);
  uint64_t v8 = __chkstk_darwin(v126);
  uint64_t v108 = (char *)&v107 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v112 = (void (**)(char *, uint64_t))((char *)&v107 - v11);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v111 = (uint64_t)&v107 - v13;
  __chkstk_darwin(v12);
  char v118 = (char *)&v107 - v14;
  uint64_t v15 = sub_10000C984(&qword_10002E070);
  uint64_t v16 = __chkstk_darwin(v15 - 8);
  uint64_t v17 = __chkstk_darwin(v16);
  uint64_t v115 = (uint64_t *)((char *)&v107 - v18);
  uint64_t v19 = __chkstk_darwin(v17);
  Swift::Int v121 = (char *)&v107 - v20;
  uint64_t v21 = __chkstk_darwin(v19);
  unint64_t v124 = (uint64_t *)((char *)&v107 - v22);
  uint64_t v23 = __chkstk_darwin(v21);
  uint64_t v25 = (char *)&v107 - v24;
  uint64_t v26 = __chkstk_darwin(v23);
  BOOL v28 = (char *)&v107 - v27;
  uint64_t v29 = __chkstk_darwin(v26);
  uint64_t v31 = (char *)&v107 - v30;
  __chkstk_darwin(v29);
  uint64_t v33 = a4;
  Swift::Int v119 = a3;
  Swift::Int v120 = (uint64_t *)((char *)&v107 - v34);
  uint64_t v35 = (char *)a2 - (char *)a1;
  uint64_t v36 = (char *)a2 - (char *)a1 + 7;
  if ((char *)a2 - (char *)a1 >= 0) {
    uint64_t v36 = (char *)a2 - (char *)a1;
  }
  uint64_t v37 = v36 >> 3;
  uint64_t v38 = (char *)a3 - (char *)a2;
  uint64_t v39 = v38 / 8;
  Swift::Int v127 = a1;
  uint64_t v130 = a1;
  uint64_t v129 = v33;
  Swift::Int v125 = v33;
  if (v36 >> 3 >= v38 / 8)
  {
    if (v38 >= -7)
    {
      uint64_t v111 = v32;
      uint64_t v69 = v112;
      if (v33 != a2 || &a2[v39] <= v33)
      {
        memmove(v33, a2, 8 * v39);
        uint64_t v33 = v125;
      }
      uint64_t v70 = &v33[v39];
      uint64_t v128 = v70;
      uint64_t v130 = a2;
      if (v38 >= 8 && v127 < a2)
      {
        Swift::Int v120 = v123 + 7;
        unint64_t v109 = (void (**)(char *, uint64_t))(v123 + 1);
        uint64_t v110 = (void (**)(char *, uint64_t, uint64_t))(v123 + 4);
        unint64_t v71 = v119 - 1;
        p_types = &stru_10002CFF8.types;
        uint64_t v73 = a2;
        uint64_t v114 = v123 + 6;
        do
        {
          unint64_t v74 = *(v70 - 1);
          unint64_t v75 = *(v73 - 1);
          Swift::Int v116 = v70 - 1;
          Swift::Int v117 = v73 - 1;
          uint64_t v76 = v74;
          id v122 = v75;
          uint64_t v77 = p_types[169];
          char v118 = v76;
          id v78 = [v76 v77];
          unint64_t v123 = a2;
          if (v78)
          {
            uint64_t v79 = v78;
            id v80 = [v78 date];

            uint64_t v81 = v124;
            sub_100021598();

            uint64_t v82 = (void (*)(void *, uint64_t, uint64_t, uint64_t))*v120;
            ((void (*)(void *, void, uint64_t, uint64_t))*v120)(v81, 0, 1, v126);
          }
          else
          {
            uint64_t v82 = (void (*)(void *, uint64_t, uint64_t, uint64_t))*v120;
            ((void (*)(void *, uint64_t, uint64_t, uint64_t))*v120)(v124, 1, 1, v126);
          }
          uint64_t v83 = (char *)v69;
          id v84 = [v122 p_types[169]];
          Swift::Int v119 = v71;
          if (v84)
          {
            uint64_t v85 = v84;
            id v86 = [v84 date];

            uint64_t v87 = (uint64_t)v121;
            sub_100021598();

            uint64_t v88 = 0;
          }
          else
          {
            uint64_t v88 = 1;
            uint64_t v87 = (uint64_t)v121;
          }
          uint64_t v89 = v126;
          v82((void *)v87, v88, 1, v126);
          uint64_t v90 = v89;
          uint64_t v91 = v115;
          sub_100011AC8((uint64_t)v124, (uint64_t)v115, &qword_10002E070);
          unint64_t v92 = (unsigned int (*)(void *, uint64_t, uint64_t))*v114;
          if (((unsigned int (*)(void *, uint64_t, uint64_t))*v114)(v91, 1, v90) == 1)
          {
            sub_100011B2C((uint64_t)v91, &qword_10002E070);
            char v93 = 0;
            uint64_t v69 = (void (**)(char *, uint64_t))v83;
            uint64_t v94 = v123;
          }
          else
          {
            Swift::Int v113 = v70;
            unint64_t v95 = v91;
            unint64_t v96 = *v110;
            (*v110)(v83, (uint64_t)v95, v90);
            uint64_t v97 = v111;
            sub_100011AC8(v87, v111, &qword_10002E070);
            if (v92((void *)v97, 1, v90) == 1)
            {
              (*v109)(v83, v90);
              sub_100011B2C(v97, &qword_10002E070);
              char v93 = 1;
              uint64_t v69 = (void (**)(char *, uint64_t))v83;
            }
            else
            {
              unint64_t v98 = v108;
              v96(v108, v97, v90);
              char v93 = sub_100021588();
              unint64_t v99 = *v109;
              uint64_t v100 = v98;
              uint64_t v69 = v112;
              (*v109)(v100, v90);
              v99((char *)v69, v90);
            }
            uint64_t v94 = v123;
            uint64_t v70 = v113;
            p_types = (char **)(&stru_10002CFF8 + 8);
          }
          unint64_t v101 = v119;
          uint64_t v102 = v119 + 1;
          sub_100011B2C((uint64_t)v121, &qword_10002E070);
          sub_100011B2C((uint64_t)v124, &qword_10002E070);

          if (v93)
          {
            uint64_t v103 = v125;
            uint64_t v73 = v117;
            if (v102 != v94 || v101 >= v94) {
              *unint64_t v101 = *v117;
            }
            uint64_t v130 = v73;
            if (v70 <= v103) {
              break;
            }
          }
          else
          {
            uint64_t v104 = v116;
            uint64_t v128 = v116;
            unint64_t v105 = v125;
            if (v102 < v70 || v101 >= v70 || v102 != v70) {
              *unint64_t v101 = *v116;
            }
            uint64_t v73 = v94;
            uint64_t v70 = v104;
            if (v104 <= v105) {
              break;
            }
          }
          unint64_t v71 = v101 - 1;
          a2 = v73;
        }
        while (v73 > v127);
      }
LABEL_64:
      sub_100009F18((void **)&v130, (const void **)&v129, &v128);
      return 1;
    }
  }
  else if (v35 >= -7)
  {
    if (v33 != v127 || &v127[v37] <= v33)
    {
      memmove(v33, v127, 8 * v37);
      uint64_t v33 = v125;
    }
    Swift::Int v117 = &v33[v37];
    uint64_t v128 = v117;
    uint64_t v40 = v120;
    if (v35 >= 8 && a2 < v119)
    {
      unint64_t v124 = v123 + 7;
      uint64_t v114 = v25;
      uint64_t v115 = v123 + 4;
      uint64_t v112 = (void (**)(char *, uint64_t))(v123 + 1);
      Swift::Int v113 = (void **)v28;
      unint64_t v41 = &stru_10002CFF8.types;
      Swift::Int v116 = v123 + 6;
      while (1)
      {
        id v42 = *a2;
        Swift::Int v125 = v33;
        id v43 = *v33;
        uint64_t v44 = v42;
        id v45 = v43;
        id v46 = v41[169];
        Swift::Int v121 = v44;
        id v47 = [v44 v46];
        if (v47)
        {
          uint64_t v48 = v47;
          id v49 = [v47 date];

          sub_100021598();
          unint64_t v50 = v40;
          id v51 = (void (*)(char *, uint64_t, uint64_t, uint64_t))*v124;
          ((void (*)(void *, void, uint64_t, uint64_t))*v124)(v50, 0, 1, v126);
        }
        else
        {
          char v52 = v40;
          id v51 = (void (*)(char *, uint64_t, uint64_t, uint64_t))*v124;
          ((void (*)(void *, uint64_t, uint64_t, uint64_t))*v124)(v52, 1, 1, v126);
        }
        id v53 = [v45 v41[169]];
        id v122 = v45;
        if (v53)
        {
          unint64_t v54 = v53;
          id v55 = [v53 date];

          sub_100021598();
          uint64_t v56 = 0;
        }
        else
        {
          uint64_t v56 = 1;
        }
        id v57 = v31;
        uint64_t v58 = (uint64_t)v31;
        uint64_t v59 = v126;
        v51(v57, v56, 1, v126);
        uint64_t v40 = v120;
        sub_100011AC8((uint64_t)v120, (uint64_t)v28, &qword_10002E070);
        char v60 = (unsigned int (*)(void *, uint64_t, uint64_t))*v116;
        if (((unsigned int (*)(char *, uint64_t, uint64_t))*v116)(v28, 1, v59) == 1)
        {
          sub_100011B2C((uint64_t)v28, &qword_10002E070);
          sub_100011B2C(v58, &qword_10002E070);
          sub_100011B2C((uint64_t)v40, &qword_10002E070);

          uint64_t v31 = (char *)v58;
        }
        else
        {
          unint64_t v123 = a2;
          uint64_t v63 = (void (*)(uint64_t, void *, uint64_t))*v115;
          uint64_t v64 = v118;
          ((void (*)(char *, char *, uint64_t))*v115)(v118, v28, v59);
          uint64_t v65 = v114;
          sub_100011AC8(v58, (uint64_t)v114, &qword_10002E070);
          if (v60(v65, 1, v59) == 1)
          {
            (*v112)(v64, v59);
            sub_100011B2C((uint64_t)v65, &qword_10002E070);
            sub_100011B2C(v58, &qword_10002E070);
            uint64_t v40 = v120;
            sub_100011B2C((uint64_t)v120, &qword_10002E070);

            BOOL v28 = (char *)v113;
            uint64_t v31 = (char *)v58;
            unint64_t v41 = (char **)(&stru_10002CFF8 + 8);
            a2 = v123;
LABEL_25:
            unint64_t v62 = (unint64_t)(a2 + 1);
            if (v127 < a2 || (unint64_t)v127 >= v62 || v127 != a2) {
              int *v127 = *a2;
            }
            uint64_t v33 = v125;
            goto LABEL_30;
          }
          uint64_t v66 = v111;
          v63(v111, v65, v59);
          char v67 = sub_100021588();
          uint64_t v68 = *v112;
          (*v112)((char *)v66, v59);
          v68(v118, v59);
          sub_100011B2C(v58, &qword_10002E070);
          uint64_t v40 = v120;
          sub_100011B2C((uint64_t)v120, &qword_10002E070);

          BOOL v28 = (char *)v113;
          uint64_t v31 = (char *)v58;
          unint64_t v41 = (char **)(&stru_10002CFF8 + 8);
          a2 = v123;
          if (v67) {
            goto LABEL_25;
          }
        }
        unint64_t v61 = v125;
        if (v127 != v125) {
          int *v127 = *v125;
        }
        uint64_t v33 = v61 + 1;
        uint64_t v129 = v33;
        unint64_t v62 = (unint64_t)a2;
LABEL_30:
        uint64_t v130 = ++v127;
        if (v33 < v117)
        {
          a2 = (void **)v62;
          if (v62 < (unint64_t)v119) {
            continue;
          }
        }
        goto LABEL_64;
      }
    }
    goto LABEL_64;
  }
  uint64_t result = sub_100021E78();
  __break(1u);
  return result;
}

void sub_100010154(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v56 = a1;
  uint64_t v7 = sub_1000215B8();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v58 = (char *)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v54 - v11;
  uint64_t v13 = sub_10000C984(&qword_10002E070);
  uint64_t v14 = __chkstk_darwin(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v14);
  uint64_t v62 = (uint64_t)&v54 - v16;
  uint64_t v17 = __chkstk_darwin(v15);
  __chkstk_darwin(v17);
  uint64_t v71 = (uint64_t)&v54 - v20;
  uint64_t v55 = a2;
  if (a3 != a2)
  {
    uint64_t v21 = *a4;
    uint64_t v69 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56);
    uint64_t v59 = (void (**)(char *, uint64_t))(v8 + 8);
    char v60 = (void (**)(char *, uint64_t, uint64_t))(v8 + 32);
    uint64_t v63 = v21;
    uint64_t v22 = (void **)(v21 + 8 * a3 - 8);
    p_types = (char **)(&stru_10002CFF8 + 8);
    unint64_t v61 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
    char v67 = v12;
LABEL_6:
    uint64_t v25 = *(void **)(v63 + 8 * a3);
    uint64_t v26 = v56;
    id v57 = v22;
    uint64_t v64 = a3;
    while (1)
    {
      uint64_t v65 = v22;
      uint64_t v66 = v26;
      uint64_t v27 = v19;
      uint64_t v28 = v18;
      uint64_t v29 = *v22;
      id v30 = v25;
      id v70 = v29;
      uint64_t v31 = p_types[169];
      id v68 = v30;
      id v32 = [v30 v31];
      if (v32)
      {
        uint64_t v33 = v32;
        id v34 = [v32 date];

        uint64_t v35 = v71;
        sub_100021598();

        uint64_t v36 = *v69;
        (*v69)(v35, 0, 1, v7);
      }
      else
      {
        uint64_t v36 = *v69;
        (*v69)(v71, 1, 1, v7);
      }
      id v37 = [v70 p_types[169]];
      if (v37)
      {
        uint64_t v38 = v37;
        id v39 = [v37 date];

        sub_100021598();
        uint64_t v40 = 0;
      }
      else
      {
        uint64_t v40 = 1;
      }
      unint64_t v41 = v67;
      v36(v27, v40, 1, v7);
      uint64_t v42 = v62;
      sub_100011AC8(v71, v62, &qword_10002E070);
      id v43 = *v61;
      if ((*v61)(v42, 1, v7) == 1)
      {
        sub_100011B2C(v42, &qword_10002E070);
        sub_100011B2C(v27, &qword_10002E070);
        sub_100011B2C(v71, &qword_10002E070);

        uint64_t v24 = v64;
        uint64_t v18 = v28;
        uint64_t v19 = v27;
LABEL_5:
        a3 = v24 + 1;
        uint64_t v22 = v57 + 1;
        if (a3 == v55) {
          return;
        }
        goto LABEL_6;
      }
      uint64_t v44 = v42;
      id v45 = *v60;
      (*v60)(v41, v44, v7);
      sub_100011AC8(v27, v28, &qword_10002E070);
      if (v43(v28, 1, v7) == 1)
      {
        (*v59)(v41, v7);
        sub_100011B2C(v28, &qword_10002E070);
        sub_100011B2C(v27, &qword_10002E070);
        sub_100011B2C(v71, &qword_10002E070);

        uint64_t v18 = v28;
        uint64_t v19 = v27;
        p_types = (char **)(&stru_10002CFF8 + 8);
        uint64_t v46 = v66;
        uint64_t v24 = v64;
        id v47 = v65;
      }
      else
      {
        uint64_t v48 = v58;
        v45(v58, v28, v7);
        char v49 = sub_100021588();
        unint64_t v50 = *v59;
        id v51 = v48;
        char v52 = v67;
        (*v59)(v51, v7);
        v50(v52, v7);
        sub_100011B2C(v27, &qword_10002E070);
        sub_100011B2C(v71, &qword_10002E070);

        uint64_t v18 = v28;
        uint64_t v19 = v27;
        p_types = &stru_10002CFF8.types;
        uint64_t v46 = v66;
        uint64_t v24 = v64;
        id v47 = v65;
        if ((v49 & 1) == 0) {
          goto LABEL_5;
        }
      }
      if (!v63) {
        break;
      }
      id v53 = *v47;
      uint64_t v25 = v47[1];
      *id v47 = v25;
      v47[1] = v53;
      uint64_t v22 = v47 - 1;
      uint64_t v26 = v46 + 1;
      if (v24 == v26) {
        goto LABEL_5;
      }
    }
    __break(1u);
  }
}

void sub_10001069C(uint64_t *a1)
{
  uint64_t v3 = sub_1000215B8();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  v223 = (char *)&v200 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v5);
  v234 = (char *)&v200 - v8;
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v207 = (char *)&v200 - v10;
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v200 - v12;
  uint64_t v14 = __chkstk_darwin(v11);
  v205 = (char *)&v200 - v15;
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v200 - v16;
  uint64_t v18 = sub_10000C984(&qword_10002E070);
  uint64_t v19 = __chkstk_darwin(v18 - 8);
  uint64_t v21 = (char *)&v200 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __chkstk_darwin(v19);
  v228 = (char *)&v200 - v23;
  uint64_t v24 = __chkstk_darwin(v22);
  uint64_t v237 = (uint64_t)&v200 - v25;
  uint64_t v26 = __chkstk_darwin(v24);
  uint64_t v240 = (uint64_t)&v200 - v27;
  uint64_t v28 = __chkstk_darwin(v26);
  id v30 = (char *)&v200 - v29;
  uint64_t v31 = __chkstk_darwin(v28);
  uint64_t v214 = (uint64_t)&v200 - v32;
  uint64_t v33 = __chkstk_darwin(v31);
  uint64_t v220 = (uint64_t)&v200 - v34;
  uint64_t v35 = __chkstk_darwin(v33);
  uint64_t v221 = (uint64_t)&v200 - v36;
  uint64_t v37 = __chkstk_darwin(v35);
  v230 = (char *)&v200 - v38;
  uint64_t v39 = __chkstk_darwin(v37);
  uint64_t v206 = (uint64_t)&v200 - v40;
  uint64_t v41 = __chkstk_darwin(v39);
  uint64_t v208 = (uint64_t)&v200 - v42;
  __chkstk_darwin(v41);
  uint64_t v209 = (uint64_t)&v200 - v43;
  Swift::Int v44 = a1[1];
  Swift::Int v45 = sub_100021EA8(v44);
  if (v45 >= v44)
  {
    if (v44 < 0) {
      goto LABEL_168;
    }
    if (v44) {
      sub_100010154(0, v44, 1, a1);
    }
    return;
  }
  Swift::Int v204 = v45;
  if (v44 >= 0) {
    uint64_t v46 = v44;
  }
  else {
    uint64_t v46 = v44 + 1;
  }
  if (v44 < -1) {
    goto LABEL_176;
  }
  uint64_t v211 = v30;
  Swift::Int v215 = v44;
  uint64_t v222 = v1;
  uint64_t v201 = a1;
  if (v44 < 2)
  {
    char v49 = (char *)_swiftEmptyArrayStorage;
    uint64_t v241 = (uint64_t)_swiftEmptyArrayStorage;
    uint64_t v219 = (void **)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 32);
    if (v44 != 1)
    {
      unint64_t v55 = _swiftEmptyArrayStorage[2];
LABEL_134:
      if (v55 >= 2)
      {
        uint64_t v193 = *v201;
        do
        {
          unint64_t v194 = v55 - 2;
          if (v55 < 2) {
            goto LABEL_163;
          }
          if (!v193) {
            goto LABEL_175;
          }
          uint64_t v195 = *(void *)&v49[16 * v194 + 32];
          uint64_t v196 = *(void *)&v49[16 * v55 + 24];
          uint64_t v197 = v222;
          sub_10000F644((void **)(v193 + 8 * v195), (void **)(v193 + 8 * *(void *)&v49[16 * v55 + 16]), (void **)(v193 + 8 * v196), v219);
          uint64_t v222 = v197;
          if (v197) {
            break;
          }
          if (v196 < v195) {
            goto LABEL_164;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            char v49 = sub_10000A1D4((uint64_t)v49);
          }
          if (v194 >= *((void *)v49 + 2)) {
            goto LABEL_165;
          }
          unint64_t v198 = &v49[16 * v194 + 32];
          *(void *)unint64_t v198 = v195;
          *((void *)v198 + 1) = v196;
          unint64_t v199 = *((void *)v49 + 2);
          if (v55 > v199) {
            goto LABEL_166;
          }
          memmove(&v49[16 * v55 + 16], &v49[16 * v55 + 32], 16 * (v199 - v55));
          *((void *)v49 + 2) = v199 - 1;
          unint64_t v55 = v199 - 1;
        }
        while (v199 > 2);
      }
LABEL_145:
      swift_bridgeObjectRelease();
      *(void *)((v241 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
      sub_100021A28();
      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    uint64_t v47 = v46 >> 1;
    sub_100011CC0(0, &qword_10002E6E0);
    uint64_t v48 = sub_100021A48();
    *(void *)((v48 & 0xFFFFFFFFFFFFFF8) + 0x10) = v47;
    uint64_t v219 = (void **)((v48 & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v241 = v48;
  }
  v210 = v13;
  uint64_t v50 = 0;
  uint64_t v51 = *a1;
  v232 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56);
  v226 = (void (**)(char *, uint64_t, uint64_t))(v4 + 32);
  v227 = (void ***)(v4 + 48);
  v225 = (void (**)(char *, uint64_t))(v4 + 8);
  uint64_t v203 = v51 + 16;
  uint64_t v202 = v51 - 8;
  char v49 = (char *)_swiftEmptyArrayStorage;
  uint64_t v218 = v17;
  v224 = v21;
  uint64_t v52 = (uint64_t)v228;
  uint64_t v53 = (uint64_t)v230;
  Swift::Int v54 = v215;
  uint64_t v229 = v51;
LABEL_15:
  Swift::Int v56 = v50 + 1;
  v212 = v49;
  uint64_t v216 = v50;
  if (v50 + 1 < v54)
  {
    id v57 = *(void **)(v51 + 8 * v50);
    id v58 = *(id *)(v51 + 8 * v56);
    id v59 = v57;
    id v238 = v58;
    id v239 = v59;
    p_types = &stru_10002CFF8.types;
    id v60 = [v58 displayDate];
    if (v60)
    {
      unint64_t v61 = v60;
      id v62 = [v60 date];

      uint64_t v63 = v209;
      sub_100021598();

      uint64_t v64 = *v232;
      (*v232)(v63, 0, 1, v3);
    }
    else
    {
      uint64_t v64 = *v232;
      (*v232)(v209, 1, 1, v3);
    }
    id v66 = [v239 displayDate];
    if (v66)
    {
      char v67 = v66;
      id v68 = [v66 date];

      uint64_t v69 = v208;
      sub_100021598();

      uint64_t v70 = 0;
    }
    else
    {
      uint64_t v70 = 1;
      uint64_t v69 = v208;
    }
    uint64_t v213 = v64;
    v64(v69, v70, 1, v3);
    uint64_t v71 = v206;
    sub_100011AC8(v209, v206, &qword_10002E070);
    unint64_t v72 = *v227;
    unsigned int v73 = ((unint64_t (*)(uint64_t, uint64_t, uint64_t))*v227)(v71, 1, v3);
    v233 = v72;
    if (v73 == 1)
    {
      sub_100011B2C(v71, &qword_10002E070);
      LODWORD(v217) = 0;
    }
    else
    {
      uint64_t v74 = v71;
      unint64_t v75 = *v226;
      (*v226)(v17, v74, v3);
      sub_100011AC8(v208, v53, &qword_10002E070);
      if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v72)(v53, 1, v3) == 1)
      {
        (*v225)(v17, v3);
        sub_100011B2C(v53, &qword_10002E070);
        LODWORD(v217) = 1;
        p_types = (char **)(&stru_10002CFF8 + 8);
      }
      else
      {
        uint64_t v76 = v205;
        v75(v205, v53, v3);
        LODWORD(v217) = sub_100021588();
        uint64_t v77 = *v225;
        (*v225)(v76, v3);
        v77(v17, v3);
        p_types = &stru_10002CFF8.types;
      }
    }
    sub_100011B2C(v208, &qword_10002E070);
    sub_100011B2C(v209, &qword_10002E070);

    uint64_t v50 = v216;
    Swift::Int v56 = v216 + 2;
    if (v216 + 2 < v215)
    {
      id v78 = (void **)(v203 + 8 * v216);
      uint64_t v79 = v233;
      while (1)
      {
        Swift::Int v231 = v56;
        uint64_t v81 = *(v78 - 1);
        id v80 = *v78;
        v235 = v78;
        id v82 = v80;
        id v239 = v81;
        id v83 = [v82 p_types[169]];
        id v238 = v82;
        if (v83)
        {
          id v84 = v83;
          id v85 = [v83 date];

          uint64_t v86 = v221;
          sub_100021598();

          uint64_t v87 = 0;
        }
        else
        {
          uint64_t v87 = 1;
          uint64_t v86 = v221;
        }
        uint64_t v88 = v213;
        v213(v86, v87, 1, v3);
        id v89 = [v239 p_types[169]];
        if (v89)
        {
          uint64_t v90 = v89;
          uint64_t v91 = v49;
          unint64_t v92 = v88;
          id v93 = [v89 date];

          uint64_t v94 = v220;
          sub_100021598();

          v92(v94, 0, 1, v3);
          char v49 = v91;
          uint64_t v79 = v233;
        }
        else
        {
          v88(v220, 1, 1, v3);
        }
        unint64_t v95 = v226;
        uint64_t v96 = v214;
        sub_100011AC8(v221, v214, &qword_10002E070);
        if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v79)(v96, 1, v3) == 1)
        {
          sub_100011B2C(v96, &qword_10002E070);
          int v97 = 0;
        }
        else
        {
          uint64_t v98 = v96;
          unint64_t v99 = *v95;
          uint64_t v100 = v210;
          (*v95)(v210, v98, v3);
          uint64_t v101 = (uint64_t)v211;
          sub_100011AC8(v220, (uint64_t)v211, &qword_10002E070);
          if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v79)(v101, 1, v3) == 1)
          {
            (*v225)(v100, v3);
            sub_100011B2C(v101, &qword_10002E070);
            int v97 = 1;
          }
          else
          {
            uint64_t v102 = v207;
            v99(v207, v101, v3);
            int v97 = sub_100021588();
            uint64_t v103 = *v225;
            uint64_t v104 = v102;
            uint64_t v53 = (uint64_t)v230;
            (*v225)(v104, v3);
            v103(v100, v3);
          }
          char v49 = v212;
          p_types = (char **)(&stru_10002CFF8 + 8);
        }
        sub_100011B2C(v220, &qword_10002E070);
        sub_100011B2C(v221, &qword_10002E070);

        Swift::Int v56 = v231;
        if ((v217 ^ v97)) {
          break;
        }
        Swift::Int v56 = v231 + 1;
        id v78 = v235 + 1;
        uint64_t v79 = v233;
        if (v215 == v231 + 1)
        {
          Swift::Int v56 = v215;
          break;
        }
      }
      uint64_t v17 = v218;
      uint64_t v50 = v216;
    }
    uint64_t v51 = v229;
    if (v217)
    {
      if (v56 < v50) {
        goto LABEL_169;
      }
      if (v50 < v56)
      {
        unint64_t v105 = (uint64_t *)(v202 + 8 * v56);
        uint64_t v106 = v50;
        Swift::Int v107 = v56;
        Swift::Int v108 = v106;
        unint64_t v109 = (uint64_t *)(v229 + 8 * v106);
        do
        {
          if (v108 != --v107)
          {
            if (!v51) {
              goto LABEL_174;
            }
            uint64_t v110 = *v109;
            *unint64_t v109 = *v105;
            *unint64_t v105 = v110;
          }
          ++v108;
          --v105;
          ++v109;
        }
        while (v108 < v107);
        uint64_t v50 = v216;
      }
    }
  }
  else
  {
    p_types = (char **)(&stru_10002CFF8 + 8);
  }
  if (v56 >= v215) {
    goto LABEL_83;
  }
  if (__OFSUB__(v56, v50)) {
    goto LABEL_167;
  }
  if (v56 - v50 >= v204)
  {
    uint64_t v50 = v216;
LABEL_83:
    if (v56 < v50) {
      goto LABEL_162;
    }
    goto LABEL_84;
  }
  if (__OFADD__(v216, v204)) {
    goto LABEL_170;
  }
  if (v216 + v204 >= v215) {
    uint64_t v111 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v215;
  }
  else {
    uint64_t v111 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))(v216 + v204);
  }
  uint64_t v50 = v216;
  if ((uint64_t)v111 >= v216)
  {
    if ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v56 == v111) {
      goto LABEL_83;
    }
    uint64_t v112 = (void **)(v202 + 8 * v56);
    uint64_t v236 = v3;
    uint64_t v213 = v111;
LABEL_67:
    uint64_t v114 = *(void **)(v51 + 8 * v56);
    v217 = v112;
    Swift::Int v231 = v56;
    while (1)
    {
      v235 = (void **)v50;
      uint64_t v115 = *v112;
      id v116 = v114;
      id v117 = v115;
      id v238 = v116;
      id v239 = v117;
      id v118 = [v116 p_types[169]];
      if (v118)
      {
        Swift::Int v119 = v118;
        id v120 = [v118 date];

        uint64_t v121 = v240;
        sub_100021598();

        id v122 = *v232;
        (*v232)(v121, 0, 1, v3);
      }
      else
      {
        id v122 = *v232;
        (*v232)(v240, 1, 1, v3);
      }
      id v123 = [v239 p_types[169]];
      if (v123)
      {
        unint64_t v124 = v123;
        id v125 = [v123 date];

        uint64_t v126 = v237;
        sub_100021598();

        uint64_t v127 = 0;
      }
      else
      {
        uint64_t v127 = 1;
        uint64_t v126 = v237;
      }
      uint64_t v3 = v236;
      v122(v126, v127, 1, v236);
      sub_100011AC8(v240, v52, &qword_10002E070);
      uint64_t v128 = *v227;
      if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))*v227)(v52, 1, v3) == 1)
      {
        sub_100011B2C(v52, &qword_10002E070);
        sub_100011B2C(v126, &qword_10002E070);
        sub_100011B2C(v240, &qword_10002E070);

        uint64_t v51 = v229;
        uint64_t v53 = (uint64_t)v230;
        p_types = &stru_10002CFF8.types;
        Swift::Int v113 = (void **)v231;
        goto LABEL_66;
      }
      v233 = v112;
      uint64_t v129 = *v226;
      uint64_t v130 = v234;
      (*v226)(v234, v52, v3);
      uint64_t v131 = (uint64_t)v224;
      sub_100011AC8(v126, (uint64_t)v224, &qword_10002E070);
      if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v128)(v131, 1, v3) == 1)
      {
        (*v225)(v130, v3);
        sub_100011B2C(v131, &qword_10002E070);
        sub_100011B2C(v237, &qword_10002E070);
        sub_100011B2C(v240, &qword_10002E070);

        Swift::Int v113 = (void **)v231;
      }
      else
      {
        Swift::Int v132 = v223;
        v129(v223, v131, v3);
        char v133 = sub_100021588();
        Swift::Int v134 = *v225;
        (*v225)(v132, v3);
        v134(v234, v3);
        sub_100011B2C(v237, &qword_10002E070);
        sub_100011B2C(v240, &qword_10002E070);

        Swift::Int v113 = (void **)v231;
        if ((v133 & 1) == 0)
        {
          uint64_t v52 = (uint64_t)v228;
          uint64_t v51 = v229;
          uint64_t v3 = v236;
          uint64_t v53 = (uint64_t)v230;
          p_types = (char **)(&stru_10002CFF8 + 8);
LABEL_66:
          Swift::Int v56 = (Swift::Int)v113 + 1;
          uint64_t v112 = v217 + 1;
          uint64_t v50 = v216;
          if ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v56 != v213) {
            goto LABEL_67;
          }
          Swift::Int v56 = (Swift::Int)v213;
          uint64_t v17 = v218;
          char v49 = v212;
          if ((uint64_t)v213 < v216) {
            goto LABEL_162;
          }
LABEL_84:
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            char v49 = sub_100009E1C(0, *((void *)v49 + 2) + 1, 1, v49);
          }
          unint64_t v138 = *((void *)v49 + 2);
          unint64_t v137 = *((void *)v49 + 3);
          unint64_t v55 = v138 + 1;
          uint64_t v51 = v229;
          uint64_t v139 = v216;
          if (v138 >= v137 >> 1)
          {
            uint64_t v192 = sub_100009E1C((char *)(v137 > 1), v138 + 1, 1, v49);
            uint64_t v139 = v216;
            uint64_t v51 = v229;
            char v49 = v192;
          }
          *((void *)v49 + 2) = v55;
          unint64_t v140 = v49 + 32;
          uint64_t v141 = &v49[16 * v138 + 32];
          *(void *)uint64_t v141 = v139;
          *((void *)v141 + 1) = v56;
          Swift::Int v231 = v56;
          if (v138)
          {
LABEL_89:
            unint64_t v142 = v55 - 1;
            if (v55 >= 4)
            {
              uint64_t v147 = &v140[16 * v55];
              uint64_t v148 = *((void *)v147 - 8);
              uint64_t v149 = *((void *)v147 - 7);
              BOOL v153 = __OFSUB__(v149, v148);
              uint64_t v150 = v149 - v148;
              if (v153) {
                goto LABEL_151;
              }
              uint64_t v152 = *((void *)v147 - 6);
              uint64_t v151 = *((void *)v147 - 5);
              BOOL v153 = __OFSUB__(v151, v152);
              uint64_t v145 = v151 - v152;
              char v146 = v153;
              if (v153) {
                goto LABEL_152;
              }
              unint64_t v154 = v55 - 2;
              uint64_t v155 = &v140[16 * v55 - 32];
              uint64_t v157 = *(void *)v155;
              uint64_t v156 = *((void *)v155 + 1);
              BOOL v153 = __OFSUB__(v156, v157);
              uint64_t v158 = v156 - v157;
              if (v153) {
                goto LABEL_154;
              }
              BOOL v153 = __OFADD__(v145, v158);
              uint64_t v159 = v145 + v158;
              if (v153) {
                goto LABEL_157;
              }
              if (v159 >= v150)
              {
                uint64_t v177 = &v140[16 * v142];
                uint64_t v179 = *(void *)v177;
                uint64_t v178 = *((void *)v177 + 1);
                BOOL v153 = __OFSUB__(v178, v179);
                uint64_t v180 = v178 - v179;
                if (v153) {
                  goto LABEL_161;
                }
                BOOL v170 = v145 < v180;
              }
              else
              {
LABEL_102:
                if (v146) {
                  goto LABEL_153;
                }
                unint64_t v154 = v55 - 2;
                uint64_t v160 = &v140[16 * v55 - 32];
                uint64_t v162 = *(void *)v160;
                uint64_t v161 = *((void *)v160 + 1);
                BOOL v163 = __OFSUB__(v161, v162);
                uint64_t v164 = v161 - v162;
                char v165 = v163;
                if (v163) {
                  goto LABEL_156;
                }
                uint64_t v166 = &v140[16 * v142];
                uint64_t v168 = *(void *)v166;
                uint64_t v167 = *((void *)v166 + 1);
                BOOL v153 = __OFSUB__(v167, v168);
                uint64_t v169 = v167 - v168;
                if (v153) {
                  goto LABEL_159;
                }
                if (__OFADD__(v164, v169)) {
                  goto LABEL_160;
                }
                if (v164 + v169 < v145) {
                  goto LABEL_114;
                }
                BOOL v170 = v145 < v169;
              }
              if (v170) {
                unint64_t v142 = v154;
              }
            }
            else
            {
              if (v55 == 3)
              {
                uint64_t v144 = *((void *)v49 + 4);
                uint64_t v143 = *((void *)v49 + 5);
                BOOL v153 = __OFSUB__(v143, v144);
                uint64_t v145 = v143 - v144;
                char v146 = v153;
                goto LABEL_102;
              }
              uint64_t v171 = *((void *)v49 + 4);
              uint64_t v172 = *((void *)v49 + 5);
              BOOL v153 = __OFSUB__(v172, v171);
              uint64_t v164 = v172 - v171;
              char v165 = v153;
LABEL_114:
              if (v165) {
                goto LABEL_155;
              }
              v173 = &v140[16 * v142];
              uint64_t v175 = *(void *)v173;
              uint64_t v174 = *((void *)v173 + 1);
              BOOL v153 = __OFSUB__(v174, v175);
              uint64_t v176 = v174 - v175;
              if (v153) {
                goto LABEL_158;
              }
              if (v176 < v164) {
                goto LABEL_14;
              }
            }
            unint64_t v181 = v142 - 1;
            if (v142 - 1 >= v55)
            {
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
LABEL_166:
              __break(1u);
LABEL_167:
              __break(1u);
LABEL_168:
              __break(1u);
LABEL_169:
              __break(1u);
LABEL_170:
              __break(1u);
              break;
            }
            if (!v51) {
              goto LABEL_173;
            }
            uint64_t v182 = v3;
            v183 = v49;
            uint64_t v184 = &v140[16 * v181];
            uint64_t v185 = *(void *)v184;
            uint64_t v186 = v140;
            unint64_t v187 = v142;
            v188 = &v140[16 * v142];
            uint64_t v189 = *((void *)v188 + 1);
            uint64_t v190 = v222;
            sub_10000F644((void **)(v51 + 8 * *(void *)v184), (void **)(v51 + 8 * *(void *)v188), (void **)(v51 + 8 * v189), v219);
            uint64_t v222 = v190;
            if (v190) {
              goto LABEL_145;
            }
            if (v189 < v185) {
              goto LABEL_148;
            }
            if (v187 > *((void *)v183 + 2)) {
              goto LABEL_149;
            }
            *(void *)uint64_t v184 = v185;
            *(void *)&v186[16 * v181 + 8] = v189;
            unint64_t v191 = *((void *)v183 + 2);
            if (v187 >= v191) {
              goto LABEL_150;
            }
            char v49 = v183;
            unint64_t v55 = v191 - 1;
            memmove(v188, v188 + 16, 16 * (v191 - 1 - v187));
            unint64_t v140 = v186;
            *((void *)v183 + 2) = v191 - 1;
            BOOL v170 = v191 > 2;
            uint64_t v17 = v218;
            uint64_t v51 = v229;
            uint64_t v53 = (uint64_t)v230;
            uint64_t v3 = v182;
            uint64_t v52 = (uint64_t)v228;
            if (!v170) {
              goto LABEL_14;
            }
            goto LABEL_89;
          }
          unint64_t v55 = 1;
LABEL_14:
          Swift::Int v54 = v215;
          uint64_t v50 = v231;
          if (v231 >= v215) {
            goto LABEL_134;
          }
          goto LABEL_15;
        }
      }
      uint64_t v52 = (uint64_t)v228;
      uint64_t v51 = v229;
      uint64_t v53 = (uint64_t)v230;
      p_types = (char **)(&stru_10002CFF8 + 8);
      if (!v229) {
        goto LABEL_172;
      }
      int v135 = v233;
      Swift::Int v136 = *v233;
      uint64_t v114 = v233[1];
      *v233 = v114;
      v135[1] = v136;
      uint64_t v112 = v135 - 1;
      uint64_t v3 = v236;
      uint64_t v50 = (uint64_t)v235 + 1;
      if (v113 == (void **)((char *)v235 + 1)) {
        goto LABEL_66;
      }
    }
  }
  __break(1u);
LABEL_172:
  __break(1u);
LABEL_173:
  __break(1u);
LABEL_174:
  __break(1u);
LABEL_175:
  __break(1u);
LABEL_176:
  sub_100021E18();
  __break(1u);
}

uint64_t sub_100011A5C()
{
  return swift_release();
}

uint64_t sub_100011A64(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10000C984(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100011AC8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10000C984(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100011B2C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10000C984(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100011B88(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_100011B98(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_100011BA8()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100011BE4@<X0>(void *a1@<X0>, void *a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void, void))(v3 + 16))(*a1, *a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_100011C20()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

unint64_t sub_100011C58()
{
  unint64_t result = qword_10002E128;
  if (!qword_10002E128)
  {
    sub_100011CC0(255, (unint64_t *)&unk_10002E6F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002E128);
  }
  return result;
}

uint64_t sub_100011CC0(uint64_t a1, unint64_t *a2)
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

uint64_t sub_100011CFC(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000F5FC(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void type metadata accessor for Key(uint64_t a1)
{
}

uint64_t *sub_100011D60(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
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
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_100021888();
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      uint64_t v14 = sub_10000C984(&qword_10002E600);
      memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    *(uint64_t *)((char *)v4 + *(int *)(a3 + 24)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 24));
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_100011EF4(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_100021888();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }

  return swift_bridgeObjectRelease();
}

void *sub_100011FC4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_100021888();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  if (v12(v9, 1, v10))
  {
    uint64_t v13 = sub_10000C984(&qword_10002E600);
    memcpy(v8, v9, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  *(void *)((char *)a1 + *(int *)(a3 + 24)) = *(void *)((char *)a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_100012108(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_100021888();
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
    uint64_t v14 = sub_10000C984(&qword_10002E600);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  *(void *)((char *)a1 + *(int *)(a3 + 24)) = *(void *)((char *)a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *sub_1000122C4(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_100021888();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = sub_10000C984(&qword_10002E600);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  *(void *)((char *)a1 + *(int *)(a3 + 24)) = *(void *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void *sub_1000123F4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_100021888();
  uint64_t v11 = *(void *)(v10 - 8);
  int v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 40))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = sub_10000C984(&qword_10002E600);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  *(void *)((char *)a1 + *(int *)(a3 + 24)) = *(void *)((char *)a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100012598(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000125AC);
}

uint64_t sub_1000125AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10000C984(&qword_10002E600);
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

uint64_t sub_100012674(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100012688);
}

uint64_t sub_100012688(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_10000C984(&qword_10002E600);
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

void sub_10001274C()
{
  sub_1000127F0();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_1000127F0()
{
  if (!qword_10002E1C0)
  {
    sub_100021888();
    unint64_t v0 = sub_100021C48();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10002E1C0);
    }
  }
}

__n128 initializeWithTake for TTRIIntentsSnippetReminderViewCell.CompletedButtonHolder(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100012858(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100012878(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGSize(uint64_t a1)
{
}

void sub_1000128B4(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_1000128FC()
{
  return sub_10000F5B0(&qword_10002E200, type metadata accessor for Key);
}

uint64_t sub_100012944()
{
  return sub_10000F5B0(&qword_10002E208, type metadata accessor for Key);
}

uint64_t sub_10001298C()
{
  return sub_10000F5B0(&qword_10002E210, type metadata accessor for Key);
}

void *sub_1000129EC(uint64_t a1, uint64_t a2)
{
  return sub_100012D00(a1, a2, (SEL *)&selRef_addedTasks);
}

void *sub_1000129F8()
{
  id v1 = [v0 modifiedTask];
  uint64_t v2 = v1;
  if (v1)
  {
    id v3 = v1;
    sub_1000219F8();
    if (*(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_100021A38();
    }
    sub_100021A58();
    sub_100021A28();
  }

  return &_swiftEmptyArrayStorage;
}

void *sub_100012AB4()
{
  return sub_1000129F8();
}

void *sub_100012AD8()
{
  id v1 = [v0 tasks];
  if (v1)
  {
    uint64_t v2 = v1;
    sub_100011CC0(0, &qword_10002E138);
    id v3 = (void *)sub_100021A18();

    return v3;
  }
  id v5 = [v0 taskLists];
  id v3 = &_swiftEmptyArrayStorage;
  if (!v5) {
    return v3;
  }
  uint64_t v6 = v5;
  sub_100011CC0(0, &qword_10002E228);
  unint64_t v7 = sub_100021A18();

  if (!(v7 >> 62))
  {
    uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    __n128 result = (void *)swift_bridgeObjectRetain();
    if (v8) {
      goto LABEL_7;
    }
LABEL_15:
    swift_bridgeObjectRelease_n();
    return &_swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRetain();
  __n128 result = (void *)sub_100021E28();
  uint64_t v8 = (uint64_t)result;
  if (!result) {
    goto LABEL_15;
  }
LABEL_7:
  if (v8 >= 1)
  {
    uint64_t v9 = 0;
    do
    {
      if ((v7 & 0xC000000000000001) != 0) {
        id v10 = (id)sub_100021D48();
      }
      else {
        id v10 = *(id *)(v7 + 8 * v9 + 32);
      }
      uint64_t v11 = v10;
      ++v9;
      id v12 = [v10 tasks];
      sub_100011CC0(0, &qword_10002E138);
      unint64_t v13 = sub_100021A18();

      sub_100019C28(v13);
    }
    while (v8 != v9);
    goto LABEL_15;
  }
  __break(1u);
  return result;
}

void *sub_100012CD0()
{
  return sub_100012AD8();
}

void *sub_100012CF4(uint64_t a1, uint64_t a2)
{
  return sub_100012D00(a1, a2, (SEL *)&selRef_tasks);
}

void *sub_100012D00(uint64_t a1, uint64_t a2, SEL *a3)
{
  id v4 = [*v3 *a3];
  if (!v4) {
    return &_swiftEmptyArrayStorage;
  }
  id v5 = v4;
  sub_100011CC0(0, &qword_10002E138);
  uint64_t v6 = sub_100021A18();

  return (void *)v6;
}

void *sub_100012D74(uint64_t a1, uint64_t a2)
{
  return sub_100012D00(a1, a2, (SEL *)&selRef_snoozedTasks);
}

void *sub_100012D80()
{
  id v1 = [*v0 createdTaskList];
  if (!v1) {
    return &_swiftEmptyArrayStorage;
  }
  uint64_t v2 = v1;
  id v3 = [v1 tasks];

  sub_100011CC0(0, &qword_10002E138);
  uint64_t v4 = sub_100021A18();

  return (void *)v4;
}

id sub_100012E14()
{
  id v1 = [self effectWithStyle:4];
  id v2 = [self effectForBlurEffect:v1 style:6];

  id v3 = [v0 initWithEffect:v2];
  id v4 = v3;
  [v4 setAutoresizingMask:18];
  id v5 = [objc_allocWithZone((Class)UIView) init];
  id v6 = [self whiteColor];
  id v7 = [v6 colorWithAlphaComponent:0.5];

  [v5 setBackgroundColor:v7];
  [v5 setAutoresizingMask:18];
  id v8 = [v4 contentView];

  [v8 addSubview:v5];
  return v4;
}

id sub_100013020()
{
  return sub_100013D40(0, type metadata accessor for TTRIVibrantTableCell.VibrantSelectedBackgroundView);
}

void sub_10001303C()
{
  v9.receiver = v0;
  v9.super_class = (Class)type metadata accessor for TTRIVibrantTableCell();
  [super layoutSubviews];
  id v1 = [v0 selectedBackgroundView];
  if (!v1
    || (id v2 = v1,
        type metadata accessor for TTRIVibrantTableCell.VibrantSelectedBackgroundView(),
        uint64_t v3 = swift_dynamicCastClass(),
        v2,
        !v3))
  {
    id v4 = [objc_allocWithZone((Class)type metadata accessor for TTRIVibrantTableCell.VibrantSelectedBackgroundView()) init];
    [v0 setSelectedBackgroundView:v4];

    id v5 = [self ttr_systemGrayColor];
    id v6 = [v5 colorWithAlphaComponent:0.00390625];

    [v0 setBackgroundColor:v6];
  }
  id v7 = [v0 selectedBackgroundView];
  if (v7)
  {
    id v8 = v7;
    [v0 bounds];
    [v8 setFrame:];
  }
}

id sub_10001327C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  v7.receiver = a1;
  v7.super_class = (Class)a5(a4);
  return [super initWithCoder:a3];
}

id sub_1000132CC(uint64_t a1)
{
  return sub_100013D40(a1, type metadata accessor for TTRIVibrantTableCell);
}

uint64_t type metadata accessor for TTRIVibrantTableCell()
{
  return self;
}

uint64_t type metadata accessor for TTRIVibrantTableCell.VibrantSelectedBackgroundView()
{
  return self;
}

char *sub_10001332C(void *a1)
{
  id v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v2[OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIVibrantTemplateImageView_image] = 0;
  uint64_t v5 = OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIVibrantTemplateImageView_imageView;
  id v6 = objc_allocWithZone((Class)UIImageView);
  objc_super v7 = v2;
  *(void *)&v2[v5] = [v6 init];

  id v8 = [self effectWithStyle:4];
  id v9 = [self effectForBlurEffect:v8 style:1];

  v22.receiver = v7;
  v22.super_class = ObjectType;
  id v10 = [super initWithEffect:v9];

  uint64_t v11 = *(void **)&v10[OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIVibrantTemplateImageView_imageView];
  id v12 = v10;
  [v11 setAutoresizingMask:18];
  [v11 setUserInteractionEnabled:0];
  id v13 = [v12 contentView];
  [v13 addSubview:v11];

  uint64_t v14 = OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIVibrantTemplateImageView_image;
  uint64_t v15 = *(void **)&v12[OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIVibrantTemplateImageView_image];
  *(void *)&v12[OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIVibrantTemplateImageView_image] = a1;
  id v16 = a1;

  uint64_t v17 = *(void **)&v12[v14];
  if (v17) {
    id v18 = [v17 imageWithRenderingMode:2];
  }
  else {
    id v18 = 0;
  }
  [v11 setImage:v18];

  [v12 invalidateIntrinsicContentSize];
  uint64_t v19 = *(void **)&v12[v14];
  if (v19) {
    id v20 = [v19 imageWithRenderingMode:2];
  }
  else {
    id v20 = 0;
  }
  [v11 setImage:v20];

  [v12 invalidateIntrinsicContentSize];
  return v12;
}

char *sub_100013580(void *a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v1[OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIVibrantTemplateImageView_image] = 0;
  uint64_t v4 = OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIVibrantTemplateImageView_imageView;
  id v5 = objc_allocWithZone((Class)UIImageView);
  id v6 = v1;
  *(void *)&v1[v4] = [v5 init];

  v19.receiver = v6;
  v19.super_class = ObjectType;
  objc_super v7 = (char *)objc_msgSendSuper2(&v19, "initWithCoder:", a1);
  id v8 = v7;
  if (v7)
  {
    id v9 = *(void **)&v7[OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIVibrantTemplateImageView_imageView];
    id v10 = v7;
    [v9 setAutoresizingMask:18];
    [v9 setUserInteractionEnabled:0];
    id v11 = [v10 contentView];
    [v11 addSubview:v9];

    uint64_t v12 = OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIVibrantTemplateImageView_image;
    id v13 = *(void **)&v10[OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIVibrantTemplateImageView_image];
    *(void *)&v10[OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIVibrantTemplateImageView_image] = 0;

    uint64_t v14 = *(void **)&v10[v12];
    if (v14) {
      id v15 = [v14 imageWithRenderingMode:2];
    }
    else {
      id v15 = 0;
    }
    [v9 setImage:v15];

    [v10 invalidateIntrinsicContentSize];
    id v16 = *(void **)&v10[v12];
    if (v16) {
      id v17 = [v16 imageWithRenderingMode:2];
    }
    else {
      id v17 = 0;
    }
    [v9 setImage:v17];

    [v10 invalidateIntrinsicContentSize];
  }

  return v8;
}

id sub_1000137B4()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return [super dealloc];
}

uint64_t type metadata accessor for TTRIVibrantTemplateImageView()
{
  return self;
}

void sub_10001385C()
{
  id v1 = [v0 traitCollection];
  unsigned int v2 = [v1 isAmbientPresented];

  if (v2)
  {
    uint64_t v3 = *(void *)&v0[OBJC_IVAR____TtC27RemindersIntentsUIExtension26TTRIVibrantCompletedButton_image];
    uint64_t v4 = (objc_class *)type metadata accessor for TTRIVibrantCompletedButton();
    v15.receiver = v0;
    v15.super_class = v4;
    [super setImage:v3 forState:0];
    id v5 = [self secondaryLabelColor];
    v14.receiver = v0;
    v14.super_class = v4;
    [super setTintColor:v5];
  }
  else
  {
    id v6 = *(char **)&v0[OBJC_IVAR____TtC27RemindersIntentsUIExtension26TTRIVibrantCompletedButton_vibrantImage];
    objc_super v7 = *(void **)&v0[OBJC_IVAR____TtC27RemindersIntentsUIExtension26TTRIVibrantCompletedButton_image];
    uint64_t v8 = OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIVibrantTemplateImageView_image;
    id v9 = *(void **)&v6[OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIVibrantTemplateImageView_image];
    *(void *)&v6[OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIVibrantTemplateImageView_image] = v7;
    id v13 = v7;

    id v10 = *(void **)&v6[OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIVibrantTemplateImageView_imageView];
    id v11 = *(void **)&v6[v8];
    if (v11) {
      id v12 = [v11 imageWithRenderingMode:2];
    }
    else {
      id v12 = 0;
    }
    [v10 setImage:v12];

    [v6 invalidateIntrinsicContentSize];
  }
}

char *sub_1000139EC()
{
  uint64_t v1 = OBJC_IVAR____TtC27RemindersIntentsUIExtension26TTRIVibrantCompletedButton_vibrantImage;
  id v2 = objc_allocWithZone((Class)type metadata accessor for TTRIVibrantTemplateImageView());
  uint64_t v3 = v0;
  *(void *)&v0[v1] = sub_10001332C(0);
  *(void *)&v3[OBJC_IVAR____TtC27RemindersIntentsUIExtension26TTRIVibrantCompletedButton_image] = 0;

  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for TTRIVibrantCompletedButton();
  uint64_t v4 = (char *)[super initWithFrame:0.0, 0.0, 0.0, 0.0];
  id v5 = *(void **)&v4[OBJC_IVAR____TtC27RemindersIntentsUIExtension26TTRIVibrantCompletedButton_vibrantImage];
  id v6 = v4;
  [v5 setUserInteractionEnabled:0];
  [v5 setAutoresizingMask:2];
  [v6 addSubview:v5];

  return v6;
}

char *sub_100013AFC(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC27RemindersIntentsUIExtension26TTRIVibrantCompletedButton_vibrantImage;
  id v4 = objc_allocWithZone((Class)type metadata accessor for TTRIVibrantTemplateImageView());
  id v5 = v1;
  *(void *)&v1[v3] = sub_10001332C(0);
  *(void *)&v5[OBJC_IVAR____TtC27RemindersIntentsUIExtension26TTRIVibrantCompletedButton_image] = 0;

  v11.receiver = v5;
  v11.super_class = (Class)type metadata accessor for TTRIVibrantCompletedButton();
  id v6 = (char *)[super initWithCoder:a1];
  objc_super v7 = v6;
  if (v6)
  {
    objc_super v8 = *(void **)&v6[OBJC_IVAR____TtC27RemindersIntentsUIExtension26TTRIVibrantCompletedButton_vibrantImage];
    id v9 = v6;
    [v8 setUserInteractionEnabled:0];
    [v8 setAutoresizingMask:2];
    [v9 addSubview:v8];
  }
  return v7;
}

void sub_100013CE8()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC27RemindersIntentsUIExtension26TTRIVibrantCompletedButton_image);
}

id sub_100013D28(uint64_t a1)
{
  return sub_100013D40(a1, type metadata accessor for TTRIVibrantCompletedButton);
}

id sub_100013D40(uint64_t a1, uint64_t (*a2)(void))
{
  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return [super dealloc];
}

uint64_t type metadata accessor for TTRIVibrantCompletedButton()
{
  return self;
}

void sub_100013DE8(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  uint64_t v23 = a5;
  uint64_t v9 = sub_100021568();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  id v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000C984(&qword_10002E2F0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100022900;
  sub_1000218C8();
  *(void *)(inited + 32) = 0x696669746E656449;
  *(void *)(inited + 40) = 0xEA00000000007265;
  sub_100014344();
  *(void *)(inited + 48) = sub_100021C38();
  *(void *)(inited + 56) = 0xD00000000000001ALL;
  *(void *)(inited + 64) = 0x8000000100025380;
  uint64_t v21 = a1;
  *(void *)(inited + 72) = sub_100021968();
  *(void *)(inited + 80) = 0xD00000000000001ALL;
  *(void *)(inited + 88) = 0x80000001000253A0;
  uint64_t v22 = a3;
  *(void *)(inited + 96) = sub_100021968();
  sub_100014B28(inited);
  sub_1000218B8();
  swift_bridgeObjectRelease();
  if (qword_10002E020 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_1000218E8();
  sub_10001430C(v14, (uint64_t)qword_10002EB60);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v23, v9);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  objc_super v15 = sub_1000218D8();
  uint64_t v16 = v9;
  os_log_type_t v17 = sub_100021AF8();
  if (os_log_type_enabled(v15, v17))
  {
    uint64_t v18 = swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    *(_DWORD *)uint64_t v18 = 136315650;
    uint64_t v23 = v16;
    swift_bridgeObjectRetain();
    uint64_t v24 = sub_10001EB40(v21, a2, &v25);
    sub_100021C58();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v18 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v24 = sub_10001EB40(v22, a4, &v25);
    sub_100021C58();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v18 + 22) = 2080;
    uint64_t v19 = sub_100021558();
    uint64_t v24 = sub_10001EB40(v19, v20, &v25);
    sub_100021C58();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v23);
    _os_log_impl((void *)&_mh_execute_header, v15, v17, "Navigating (%s) -> (%s) {url:%s}", (uint8_t *)v18, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v16);
  }
}

uint64_t sub_10001420C(uint64_t a1)
{
  return sub_100014234(a1, qword_10002EB60, (SEL *)&selRef_userAction);
}

uint64_t sub_100014220(uint64_t a1)
{
  return sub_100014234(a1, qword_10002EB78, (SEL *)&selRef_siriKit);
}

uint64_t sub_100014234(uint64_t a1, uint64_t *a2, SEL *a3)
{
  uint64_t v5 = sub_1000218E8();
  sub_1000142A8(v5, a2);
  sub_10001430C(v5, (uint64_t)a2);
  id v6 = [self *a3];
  return sub_1000218F8();
}

uint64_t *sub_1000142A8(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_10001430C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_100014344()
{
  unint64_t result = qword_10002E2F8;
  if (!qword_10002E2F8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10002E2F8);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for TTRIIntentsSnippetReminderCellViewModel(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

id sub_1000143B8(id result, uint64_t a2, char a3)
{
  if (a3 == 1) {
    return (id)swift_bridgeObjectRetain();
  }
  if (!a3) {
    return result;
  }
  return result;
}

uint64_t destroy for TTRIIntentsSnippetReminderCellViewModel(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  int v2 = *(unsigned __int8 *)(a1 + 88);
  if (v2 != 255) {
    sub_100014450(*(void **)(a1 + 72), *(void *)(a1 + 80), v2);
  }

  return swift_bridgeObjectRelease();
}

void sub_100014450(void *a1, uint64_t a2, char a3)
{
  if (a3 == 1)
  {
    swift_bridgeObjectRelease();
  }
  else if (!a3)
  {
  }
}

uint64_t initializeWithCopy for TTRIIntentsSnippetReminderCellViewModel(uint64_t a1, uint64_t a2)
{
  objc_super v4 = *(void **)a2;
  uint64_t v5 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v5;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v6;
  uint64_t v7 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v7;
  uint64_t v8 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v8;
  int v9 = *(unsigned __int8 *)(a2 + 88);
  id v10 = v4;
  id v11 = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v9 == 255)
  {
    *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
    *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  }
  else
  {
    id v12 = *(void **)(a2 + 72);
    uint64_t v13 = *(void *)(a2 + 80);
    sub_1000143B8(v12, v13, v9);
    *(void *)(a1 + 72) = v12;
    *(void *)(a1 + 80) = v13;
    *(unsigned char *)(a1 + 88) = v9;
  }
  uint64_t v14 = *(void **)(a2 + 96);
  *(void *)(a1 + 96) = v14;
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  uint64_t v15 = *(void *)(a2 + 112);
  uint64_t v16 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = v15;
  *(void *)(a1 + 120) = v16;
  id v17 = v14;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TTRIIntentsSnippetReminderCellViewModel(uint64_t a1, uint64_t a2)
{
  objc_super v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  uint64_t v7 = *(void **)(a1 + 8);
  uint64_t v8 = *(void **)(a2 + 8);
  *(void *)(a1 + 8) = v8;
  id v9 = v8;

  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  *(unsigned char *)(a1 + 18) = *(unsigned char *)(a2 + 18);
  *(unsigned char *)(a1 + 19) = *(unsigned char *)(a2 + 19);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  id v10 = (long long *)(a1 + 72);
  id v11 = (long long *)(a2 + 72);
  int v12 = *(unsigned __int8 *)(a2 + 88);
  if (*(unsigned __int8 *)(a1 + 88) == 255)
  {
    if (v12 == 255)
    {
      long long v21 = *v11;
      *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
      *id v10 = v21;
    }
    else
    {
      uint64_t v18 = *(void **)(a2 + 72);
      uint64_t v19 = *(void *)(a2 + 80);
      sub_1000143B8(v18, v19, *(unsigned char *)(a2 + 88));
      *(void *)(a1 + 72) = v18;
      *(void *)(a1 + 80) = v19;
      *(unsigned char *)(a1 + 88) = v12;
    }
  }
  else if (v12 == 255)
  {
    sub_10001471C(a1 + 72);
    char v20 = *(unsigned char *)(a2 + 88);
    *id v10 = *v11;
    *(unsigned char *)(a1 + 88) = v20;
  }
  else
  {
    uint64_t v13 = *(void **)(a2 + 72);
    uint64_t v14 = *(void *)(a2 + 80);
    sub_1000143B8(v13, v14, *(unsigned char *)(a2 + 88));
    uint64_t v15 = *(void **)(a1 + 72);
    uint64_t v16 = *(void *)(a1 + 80);
    *(void *)(a1 + 72) = v13;
    *(void *)(a1 + 80) = v14;
    char v17 = *(unsigned char *)(a1 + 88);
    *(unsigned char *)(a1 + 88) = v12;
    sub_100014450(v15, v16, v17);
  }
  uint64_t v22 = *(void **)(a1 + 96);
  uint64_t v23 = *(void **)(a2 + 96);
  *(void *)(a1 + 96) = v23;
  id v24 = v23;

  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10001471C(uint64_t a1)
{
  return a1;
}

__n128 initializeWithTake for TTRIIntentsSnippetReminderCellViewModel(uint64_t a1, long long *a2)
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
  long long v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 64) = result;
  *(_OWORD *)(a1 + 80) = v6;
  return result;
}

uint64_t assignWithTake for TTRIIntentsSnippetReminderCellViewModel(uint64_t a1, uint64_t a2)
{
  long long v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  uint64_t v5 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);

  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  *(unsigned char *)(a1 + 18) = *(unsigned char *)(a2 + 18);
  *(unsigned char *)(a1 + 19) = *(unsigned char *)(a2 + 19);
  uint64_t v6 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v8;
  swift_bridgeObjectRelease();
  id v9 = (_OWORD *)(a2 + 72);
  int v10 = *(unsigned __int8 *)(a1 + 88);
  if (v10 == 255) {
    goto LABEL_5;
  }
  int v11 = *(unsigned __int8 *)(a2 + 88);
  if (v11 == 255)
  {
    sub_10001471C(a1 + 72);
LABEL_5:
    *(_OWORD *)(a1 + 72) = *v9;
    *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
    goto LABEL_6;
  }
  int v12 = *(void **)(a1 + 72);
  uint64_t v13 = *(void *)(a1 + 80);
  *(_OWORD *)(a1 + 72) = *v9;
  *(unsigned char *)(a1 + 88) = v11;
  sub_100014450(v12, v13, v10);
LABEL_6:
  uint64_t v14 = *(void **)(a1 + 96);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);

  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  uint64_t v15 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v15;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TTRIIntentsSnippetReminderCellViewModel(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 128)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TTRIIntentsSnippetReminderCellViewModel(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 128) = 1;
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
    *(unsigned char *)(result + 128) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TTRIIntentsSnippetReminderCellViewModel()
{
  return &type metadata for TTRIIntentsSnippetReminderCellViewModel;
}

void destroy for TTRIIntentsSnippetReminderCellViewModel.ContactTriggerState(uint64_t a1)
{
}

uint64_t _s27RemindersIntentsUIExtension39TTRIIntentsSnippetReminderCellViewModelV19ContactTriggerStateOwCP_0(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_1000143B8(*(id *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for TTRIIntentsSnippetReminderCellViewModel.ContactTriggerState(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_1000143B8(*(id *)a2, v4, v5);
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_100014450(v6, v7, v8);
  return a1;
}

__n128 initializeWithTake for TTRIIntentsSnippetReminderCellViewModel.ContactTriggerState(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for TTRIIntentsSnippetReminderCellViewModel.ContactTriggerState(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_100014450(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for TTRIIntentsSnippetReminderCellViewModel.ContactTriggerState(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for TTRIIntentsSnippetReminderCellViewModel.ContactTriggerState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 254;
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

uint64_t sub_100014AE4(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_100014B00(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)__n128 result = a2 - 2;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for TTRIIntentsSnippetReminderCellViewModel.ContactTriggerState()
{
  return &type metadata for TTRIIntentsSnippetReminderCellViewModel.ContactTriggerState;
}

unint64_t sub_100014B28(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000C984(&qword_10002E358);
  uint64_t v2 = (void *)sub_100021E68();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  int v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_100005208(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    int v11 = (uint64_t *)(v2[6] + 16 * result);
    *int v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
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

unint64_t sub_100014C44(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000C984(&qword_10002E340);
  uint64_t v2 = (void *)sub_100021E68();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  int v4 = (void **)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    id v6 = *(v4 - 1);
    id v7 = v5;
    unint64_t result = sub_100005280((uint64_t)v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = 8 * result;
    *(void *)(v2[6] + v10) = v6;
    *(void *)(v2[7] + v10) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
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

unint64_t sub_100014D50(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000C984(&qword_10002E348);
  uint64_t v2 = sub_100021E68();
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
    sub_100011AC8(v6, (uint64_t)&v13, &qword_10002E350);
    uint64_t v7 = v13;
    unint64_t result = sub_100005280(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_100016390(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
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

unint64_t sub_100014E80(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000C984((uint64_t *)&unk_10002E720);
  uint64_t v2 = (void *)sub_100021E68();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    id v6 = *(v4 - 1);
    id v7 = v5;
    unint64_t result = sub_100005314((uint64_t)v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = 8 * result;
    *(void *)(v2[6] + v10) = v6;
    *(void *)(v2[7] + v10) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
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

uint64_t sub_100014F8C()
{
  uint64_t v48 = sub_100011CC0(0, &qword_10002E6E0);
  char v49 = &protocol witness table for REMReminder;
  *(void *)&long long v46 = v0;
  id v1 = v0;
  sub_1000217E8();
  uint64_t v43 = v50;
  if (v50)
  {
    uint64_t v2 = v50;
    uint64_t v3 = v50;
  }
  else
  {
    id v4 = [v1 title];
    if (!v4)
    {
      id v23 = 0;
      goto LABEL_9;
    }
    uint64_t v3 = v4;
    uint64_t v2 = 0;
  }
  sub_10000C984(&qword_10002E328);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100022930;
  *(void *)(inited + 32) = NSFontAttributeName;
  id v6 = v2;
  id v7 = NSFontAttributeName;
  BOOL IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  sub_100011CC0(0, &qword_10002E330);
  if (IsBoldTextEnabled) {
    uint64_t v9 = sub_100021BB8();
  }
  else {
    uint64_t v9 = sub_100021BC8();
  }
  *(void *)(inited + 40) = v9;
  sub_100014C44(inited);
  uint64_t v10 = swift_initStackObject();
  *(_OWORD *)(v10 + 16) = xmmword_100022930;
  *(void *)(v10 + 32) = v7;
  uint64_t v11 = v7;
  *(void *)(v10 + 40) = sub_100021BD8();
  sub_100014C44(v10);
  uint64_t v12 = swift_initStackObject();
  *(_OWORD *)(v12 + 16) = xmmword_100022930;
  *(void *)(v12 + 32) = NSForegroundColorAttributeName;
  sub_100011CC0(0, &qword_10002E338);
  swift_bridgeObjectRetain();
  uint64_t v13 = NSForegroundColorAttributeName;
  *(void *)(v12 + 40) = sub_100021BF8();
  sub_1000157B4(v12);
  uint64_t v14 = swift_initStackObject();
  *(_OWORD *)(v14 + 16) = xmmword_100022930;
  *(void *)(v14 + 32) = v13;
  uint64_t v15 = v13;
  *(void *)(v14 + 40) = sub_100021BF8();
  sub_1000157B4(v14);
  uint64_t v16 = swift_initStackObject();
  *(_OWORD *)(v16 + 16) = xmmword_100022930;
  *(void *)(v16 + 32) = v15;
  char v17 = v15;
  *(void *)(v16 + 40) = sub_100021BE8();
  sub_1000157B4(v16);
  uint64_t v18 = swift_initStackObject();
  *(_OWORD *)(v18 + 16) = xmmword_100022930;
  *(void *)(v18 + 32) = v17;
  uint64_t v19 = self;
  char v20 = v17;
  *(void *)(v18 + 40) = [v19 magentaColor];
  sub_1000157B4(v18);
  id v21 = objc_allocWithZone((Class)sub_100021768());
  uint64_t v22 = (void *)sub_100021758();
  [v22 insertAttributedString:v3 atIndex:0];
  id v23 = [objc_allocWithZone((Class)NSAttributedString) initWithAttributedString:v22];

LABEL_9:
  long long v46 = *(_OWORD *)&v51[8];
  unint64_t v24 = v52;
  unint64_t v47 = v52;
  v54[0] = v52;
  if (!(v52 >> 62))
  {
    uint64_t v25 = *(void *)((v52 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v25) {
      goto LABEL_11;
    }
LABEL_22:
    sub_100016218((uint64_t)v54);
LABEL_23:
    sub_10000C984(&qword_10002E310);
    sub_100016244();
    sub_100021948();

    sub_1000162A0((uint64_t)v51, (uint64_t)&v53);
    sub_100016308((id *)&v53);
    sub_100016334((uint64_t)&v46 + 8, (uint64_t)v45);
    sub_100016218((uint64_t)v45);
    sub_100016218((uint64_t)v54);
    swift_bridgeObjectRelease();
    return (uint64_t)v23;
  }
  swift_bridgeObjectRetain();
  uint64_t v25 = sub_100021E28();
  if (!v25) {
    goto LABEL_22;
  }
LABEL_11:
  uint64_t v53 = _swiftEmptyArrayStorage;
  uint64_t result = sub_10000AE04(0, v25 & ~(v25 >> 63), 0);
  if ((v25 & 0x8000000000000000) == 0)
  {
    id v42 = v23;
    uint64_t v27 = 0;
    uint64_t v28 = v53;
    unint64_t v44 = v52 & 0xC000000000000001;
    unint64_t v29 = v52;
    do
    {
      if (v44) {
        id v30 = (id)sub_100021D48();
      }
      else {
        id v30 = *(id *)(v24 + 8 * v27 + 32);
      }
      uint64_t v31 = v30;
      uint64_t v32 = sub_1000219B8();
      uint64_t v34 = v33;
      id v35 = [v31 name];
      uint64_t v36 = sub_100021998();
      uint64_t v38 = v37;

      v45[0] = v32;
      v45[1] = v34;
      swift_bridgeObjectRetain();
      v55._countAndFlagsBits = v36;
      v55._object = v38;
      sub_1000219D8(v55);

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v53 = v28;
      unint64_t v40 = v28[2];
      unint64_t v39 = v28[3];
      if (v40 >= v39 >> 1)
      {
        sub_10000AE04(v39 > 1, v40 + 1, 1);
        uint64_t v28 = v53;
      }
      ++v27;
      v28[2] = v40 + 1;
      uint64_t v41 = &v28[2 * v40];
      v41[4] = v32;
      v41[5] = v34;
      unint64_t v24 = v29;
    }
    while (v25 != v27);
    sub_100016218((uint64_t)v54);
    id v23 = v42;
    goto LABEL_23;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000154E8@<X0>(id a1@<X0>, void *a2@<X1>, char a3@<W2>, char a4@<W3>, char a5@<W4>, char a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, char a16, void *a17, char a18, uint64_t a19, uint64_t a20)
{
  uint64_t v21 = v20;
  id v62 = a1;
  if (!a1) {
    a1 = *(id *)v21;
  }
  id v61 = a1;
  id v66 = a2;
  if (!a2)
  {
    id v66 = *(void **)(v21 + 8);
    id v28 = v66;
  }
  if (a3 == 2) {
    char v29 = *(unsigned char *)(v21 + 16);
  }
  else {
    char v29 = a3 & 1;
  }
  char v53 = v29;
  if (a5 == 2) {
    char v30 = *(unsigned char *)(v21 + 18);
  }
  else {
    char v30 = a5 & 1;
  }
  char v52 = v30;
  char v56 = *(unsigned char *)(v21 + 19);
  char v57 = *(unsigned char *)(v21 + 17);
  uint64_t v31 = a8;
  if (!a8)
  {
    a7 = *(void *)(v21 + 24);
    uint64_t v31 = *(void *)(v21 + 32);
    swift_bridgeObjectRetain();
  }
  uint64_t v32 = a11;
  if (!a11)
  {
    a10 = *(void *)(v21 + 40);
    uint64_t v32 = swift_bridgeObjectRetain();
  }
  uint64_t v58 = v32;
  uint64_t v63 = a10;
  uint64_t v65 = a7;
  uint64_t v33 = a13;
  if (!a13)
  {
    a12 = *(void *)(v21 + 56);
    uint64_t v33 = *(void *)(v21 + 64);
    swift_bridgeObjectRetain();
  }
  uint64_t v64 = a12;
  id v35 = a14;
  uint64_t v34 = a15;
  char v36 = a16;
  if (a16 == -1)
  {
    id v35 = *(void **)(v21 + 72);
    uint64_t v34 = *(void *)(v21 + 80);
    char v36 = *(unsigned char *)(v21 + 88);
    sub_1000163A0(v35, v34, v36);
  }
  Swift::Int v54 = v35;
  uint64_t v37 = a17;
  if (!a17)
  {
    uint64_t v37 = *(void **)(v21 + 96);
    id v38 = v37;
  }
  uint64_t v55 = v33;
  uint64_t v39 = v31;
  if (a18 == 2) {
    char v41 = *(unsigned char *)(v21 + 104);
  }
  else {
    char v41 = a18 & 1;
  }
  char v51 = v41;
  uint64_t v42 = a20;
  if (!a20)
  {
    a19 = *(void *)(v21 + 112);
    uint64_t v42 = *(void *)(v21 + 120);
    swift_bridgeObjectRetain();
  }
  char v43 = v56;
  if (a6 != 2) {
    char v43 = a6;
  }
  char v44 = v57;
  if (a4 != 2) {
    char v44 = a4;
  }
  char v45 = v44 & 1;
  char v46 = v43 & 1;
  swift_bridgeObjectRetain();
  id v47 = v62;
  id v48 = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1000163A0(a14, a15, a16);
  *(void *)a9 = v61;
  *(void *)(a9 + 8) = v66;
  *(unsigned char *)(a9 + 16) = v53;
  *(unsigned char *)(a9 + 17) = v45;
  *(unsigned char *)(a9 + 18) = v52;
  *(unsigned char *)(a9 + 19) = v46;
  *(void *)(a9 + 24) = v65;
  *(void *)(a9 + 32) = v39;
  *(void *)(a9 + 40) = v63;
  *(void *)(a9 + 48) = v58;
  *(void *)(a9 + 56) = v64;
  *(void *)(a9 + 64) = v55;
  *(void *)(a9 + 72) = v54;
  *(void *)(a9 + 80) = v34;
  *(unsigned char *)(a9 + 88) = v36;
  *(void *)(a9 + 96) = v37;
  *(unsigned char *)(a9 + 104) = v51;
  *(void *)(a9 + 112) = a19;
  *(void *)(a9 + 120) = v42;
  id v49 = a17;

  return swift_bridgeObjectRetain();
}

unint64_t sub_1000157B4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000C984(&qword_10002E340);
  uint64_t v2 = (void *)sub_100021E68();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  id v4 = (void **)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    id v6 = *(v4 - 1);
    id v7 = v5;
    unint64_t result = sub_1000158C0((uint64_t)v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = 8 * result;
    *(void *)(v2[6] + v10) = v6;
    *(void *)(v2[7] + v10) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
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

unint64_t sub_1000158C0(uint64_t a1)
{
  sub_100021998();
  sub_100021EF8();
  sub_1000219C8();
  Swift::Int v2 = sub_100021F18();
  swift_bridgeObjectRelease();

  return sub_100015954(a1, v2);
}

unint64_t sub_100015954(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_100021998();
    uint64_t v8 = v7;
    if (v6 == sub_100021998() && v8 == v9) {
      goto LABEL_22;
    }
    char v11 = sub_100021EB8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v11) {
      return v5;
    }
    uint64_t v12 = ~v4;
    unint64_t v5 = (v5 + 1) & v12;
    if (((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5) & 1) == 0) {
      return v5;
    }
    uint64_t v13 = sub_100021998();
    uint64_t v15 = v14;
    if (v13 == sub_100021998() && v15 == v16)
    {
LABEL_22:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v18 = sub_100021EB8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v18 & 1) == 0)
    {
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v19 = sub_100021998();
          uint64_t v21 = v20;
          if (v19 == sub_100021998() && v21 == v22) {
            break;
          }
          char v24 = sub_100021EB8();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v24 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_22;
      }
    }
  }
  return v5;
}

uint64_t sub_100015B44@<X0>(void *a1@<X0>, int a2@<W1>, int a3@<W2>, uint64_t a4@<X8>)
{
  int v70 = a2;
  int v71 = a3;
  uint64_t v6 = sub_10000C984(&qword_10002E300);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  uint64_t v9 = (uint64_t *)((char *)&v56 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v7);
  char v11 = (char *)&v56 - v10;
  uint64_t v12 = sub_10000C984(&qword_10002E308);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)&v56 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = (int *)sub_1000217C8();
  __chkstk_darwin(v15);
  char v17 = (char *)&v56 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_1000217A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v14, 1, 1, v18);
  *((void *)&v80 + 1) = sub_100011CC0(0, &qword_10002E6E0);
  uint64_t v81 = &protocol witness table for REMReminder;
  *(void *)&long long v79 = a1;
  sub_1000217D8();
  long long v79 = 0u;
  long long v80 = 0u;
  uint64_t v81 = 0;
  id v19 = a1;
  sub_1000217B8();
  int v67 = v17[v15[25]];
  id v63 = v19;
  uint64_t v66 = sub_100014F8C();
  uint64_t v68 = v21;
  uint64_t v69 = v20;
  uint64_t v22 = *(void **)&v17[v15[5]];
  int v65 = v17[v15[8]];
  uint64_t v23 = (uint64_t)&v17[v15[11]];
  sub_100011AC8(v23, (uint64_t)v11, &qword_10002E300);
  uint64_t v24 = sub_100021788();
  uint64_t v25 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v24 - 8) + 48);
  int v26 = v25(v11, 1, v24);
  uint64_t v64 = v22;
  if (v26 == 1)
  {
    id v27 = v22;
    sub_100016054((uint64_t)v11);
    int v59 = 0;
  }
  else
  {
    int v59 = v11[*(int *)(v24 + 28)];
    id v28 = v22;
    sub_1000161B8((uint64_t)v11, (uint64_t (*)(void))&type metadata accessor for TTRRemindersListViewModel.DisplayDate);
  }
  sub_100011AC8(v23, (uint64_t)v9, &qword_10002E300);
  if (v25((char *)v9, 1, v24) == 1)
  {
    sub_100016054((uint64_t)v9);
    uint64_t v29 = 0;
    uint64_t v30 = 0;
  }
  else
  {
    uint64_t v29 = *v9;
    uint64_t v30 = v9[1];
    swift_bridgeObjectRetain();
    sub_1000161B8((uint64_t)v9, (uint64_t (*)(void))&type metadata accessor for TTRRemindersListViewModel.DisplayDate);
  }
  uint64_t v31 = &v17[v15[29]];
  uint64_t v32 = *((void *)v31 + 1);
  uint64_t v62 = *(void *)v31;
  uint64_t v33 = &v17[v15[12]];
  uint64_t v34 = *((void *)v33 + 3);
  uint64_t v61 = v32;
  if (v34)
  {
    uint64_t v56 = v30;
    uint64_t v35 = *((void *)v33 + 4);
    uint64_t v36 = *((void *)v33 + 5);
    uint64_t v58 = v15;
    uint64_t v57 = v29;
    uint64_t v37 = (void *)*((void *)v33 + 1);
    uint64_t v38 = *((void *)v33 + 2);
    char v40 = v33[48];
    unint64_t v72 = *(void **)v33;
    uint64_t v39 = v72;
    unsigned int v73 = v37;
    uint64_t v74 = v38;
    uint64_t v75 = v34;
    uint64_t v76 = v35;
    uint64_t v77 = v36;
    char v78 = v40 & 1;
    swift_bridgeObjectRetain();
    sub_1000160F8(v39, v37, v38, v34);
    uint64_t v60 = sub_100021798();
    uint64_t v42 = v41;
    char v43 = v37;
    uint64_t v29 = v57;
    uint64_t v44 = v38;
    uint64_t v15 = v58;
    uint64_t v30 = v56;
    sub_100016158(v39, v43, v44, v34);
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v60 = 0;
    uint64_t v42 = 0;
  }
  id v46 = v63;
  char v45 = v64;
  id v47 = [v63 contactHandles];

  id v48 = *(void **)&v17[v15[37]];
  sub_1000160B4(v48);
  uint64_t result = sub_1000161B8((uint64_t)v17, (uint64_t (*)(void))&type metadata accessor for TTRRemindersListViewModel.Reminder);
  if (v48) {
    uint64_t result = swift_bridgeObjectRelease();
  }
  if (v47) {
    char v50 = 0;
  }
  else {
    char v50 = -1;
  }
  char v51 = v67 & 1;
  uint64_t v52 = v66;
  *(void *)a4 = v45;
  *(void *)(a4 + 8) = v52;
  LOBYTE(v52) = v71 & 1;
  char v53 = v70 & 1;
  *(unsigned char *)(a4 + 16) = v65;
  *(unsigned char *)(a4 + 17) = v51;
  *(unsigned char *)(a4 + 18) = v52;
  *(unsigned char *)(a4 + 19) = v59;
  *(void *)(a4 + 24) = v29;
  *(void *)(a4 + 32) = v30;
  uint64_t v54 = v61;
  *(void *)(a4 + 40) = v62;
  *(void *)(a4 + 48) = v54;
  *(void *)(a4 + 56) = v60;
  *(void *)(a4 + 64) = v42;
  *(void *)(a4 + 72) = v47;
  *(void *)(a4 + 80) = 0;
  *(unsigned char *)(a4 + 88) = v50;
  *(void *)(a4 + 96) = v48;
  *(unsigned char *)(a4 + 104) = v53;
  uint64_t v55 = v68;
  *(void *)(a4 + 112) = v69;
  *(void *)(a4 + 120) = v55;
  return result;
}

uint64_t sub_100016054(uint64_t a1)
{
  uint64_t v2 = sub_10000C984(&qword_10002E300);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_1000160B4(id result)
{
  if (result)
  {
    id v1 = result;
    swift_bridgeObjectRetain();
    return v1;
  }
  return result;
}

id sub_1000160F8(id result, void *a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    id v5 = result;
    id v4 = a2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return v5;
  }
  return result;
}

void sub_100016158(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_1000161B8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100016218(uint64_t a1)
{
  return a1;
}

unint64_t sub_100016244()
{
  unint64_t result = qword_10002E318;
  if (!qword_10002E318)
  {
    sub_10000F5FC(&qword_10002E310);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002E318);
  }
  return result;
}

uint64_t sub_1000162A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000C984(&qword_10002E320);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

id *sub_100016308(id *a1)
{
  return a1;
}

uint64_t sub_100016334(uint64_t a1, uint64_t a2)
{
  return a2;
}

_OWORD *sub_100016390(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

id sub_1000163A0(id result, uint64_t a2, char a3)
{
  if (a3 != -1) {
    return sub_1000143B8(result, a2, a3);
  }
  return result;
}

void sub_1000163B4()
{
  id v1 = *(void **)&v0[OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIIntentsSnippetHeaderCell_headingLabel];
  if (!v1)
  {
    __break(1u);
    goto LABEL_9;
  }
  id v2 = v1;
  swift_bridgeObjectRetain();
  NSString v3 = sub_100021968();
  swift_bridgeObjectRelease();
  [v2 setText:v3];

  uint64_t v4 = *(void **)&v0[OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIIntentsSnippetHeaderCell_topConstraint];
  if (!v4)
  {
LABEL_9:
    __break(1u);
    return;
  }
  double v5 = 16.0;
  if (v0[OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIIntentsSnippetHeaderCell_isFirst]) {
    double v5 = 6.0;
  }
  [v4 setConstant:v5];

  [v0 layoutIfNeeded];
}

id sub_1000165D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v7 = &v3[OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIIntentsSnippetHeaderCell_viewModel];
  *uint64_t v7 = 0;
  v7[1] = 0;
  v3[OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIIntentsSnippetHeaderCell_isFirst] = 0;
  *(void *)&v3[OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIIntentsSnippetHeaderCell_topConstraint] = 0;
  *(void *)&v3[OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIIntentsSnippetHeaderCell_headingLabel] = 0;
  if (a3)
  {
    NSString v8 = sub_100021968();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v8 = 0;
  }
  v11.receiver = v3;
  v11.super_class = ObjectType;
  id v9 = [super initWithStyle:a1 reuseIdentifier:v8];

  return v9;
}

id sub_1000166F0(void *a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = &v1[OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIIntentsSnippetHeaderCell_viewModel];
  *uint64_t v4 = 0;
  v4[1] = 0;
  v1[OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIIntentsSnippetHeaderCell_isFirst] = 0;
  *(void *)&v1[OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIIntentsSnippetHeaderCell_topConstraint] = 0;
  *(void *)&v1[OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIIntentsSnippetHeaderCell_headingLabel] = 0;
  v7.receiver = v1;
  v7.super_class = ObjectType;
  id v5 = [super initWithCoder:a1];

  return v5;
}

void sub_1000167A0()
{
  swift_bridgeObjectRelease();

  id v1 = *(void **)(v0 + OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIIntentsSnippetHeaderCell_headingLabel);
}

uint64_t type metadata accessor for TTRIIntentsSnippetHeaderCell()
{
  return self;
}

id sub_100016878()
{
  uint64_t v0 = *(void **)sub_1000216C8();
  qword_10002EB90 = (uint64_t)v0;

  return v0;
}

id sub_1000168AC()
{
  uint64_t v0 = *(void **)sub_1000216D8();
  qword_10002EB98 = (uint64_t)v0;

  return v0;
}

id sub_1000168E0()
{
  uint64_t v0 = *(void **)sub_1000216E8();
  qword_10002EBA0 = (uint64_t)v0;

  return v0;
}

void sub_100016914()
{
  id v1 = v0;
  sub_10001729C();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (!Strong)
  {
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
    return;
  }
  NSString v3 = (void *)Strong;
  uint64_t v4 = (uint64_t)v1 + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_viewModel;
  swift_beginAccess();
  sub_100018F48(v4, (uint64_t)v30);
  sub_100018F48((uint64_t)v30, (uint64_t)v31);
  id v5 = 0;
  if (sub_100018FB0(v31) != 1) {
    id v5 = *(id *)(v4 + 8);
  }
  [v3 setAttributedText:v5];

  sub_1000174F4();
  uint64_t v6 = swift_unknownObjectWeakLoadStrong();
  if (!v6) {
    goto LABEL_22;
  }
  objc_super v7 = (void *)v6;
  sub_100018F48(v4, (uint64_t)v28);
  sub_100018F48((uint64_t)v28, (uint64_t)v29);
  if (sub_100018FB0(v29) == 1 || !*(void *)(v4 + 64))
  {
    NSString v8 = 0;
  }
  else
  {
    swift_bridgeObjectRetain();
    NSString v8 = sub_100021968();
    swift_bridgeObjectRelease();
  }
  [v7 setText:v8];

  v33._object = (void *)0x80000001000256C0;
  v32._countAndFlagsBits = 0x6E6967617373654DLL;
  v32._object = (void *)0xED00004025203A67;
  v33._countAndFlagsBits = 0xD00000000000002FLL;
  sub_100021728(v32, v33);
  uint64_t v9 = swift_unknownObjectWeakLoadStrong();
  if (!v9) {
    goto LABEL_23;
  }
  uint64_t v10 = (void *)v9;
  sub_100018470((uint64_t)v1);
  uint64_t v12 = v11;
  swift_bridgeObjectRelease();
  if (v12)
  {
    NSString v13 = sub_100021968();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v13 = 0;
  }
  [v10 setText:v13];

  sub_100017D20();
  [v1 layoutIfNeeded];
  sub_100018F48(v4, (uint64_t)v26);
  sub_100018F48((uint64_t)v26, (uint64_t)v27);
  if (sub_100018FB0(v27) != 1 && !*(unsigned char *)(v4 + 88))
  {
    uint64_t v15 = *(void **)(v4 + 72);
    uint64_t v14 = *(void *)(v4 + 80);
    sub_1000143B8(v15, v14, 0);
    uint64_t v16 = sub_100016CD4((uint64_t)v23);
    uint64_t v18 = v17;
    sub_100018F48(v17, (uint64_t)v24);
    sub_100018F48((uint64_t)v24, (uint64_t)v25);
    if (sub_100018FB0(v25) != 1)
    {
      id v19 = *(void **)(v18 + 72);
      uint64_t v20 = *(void *)(v18 + 80);
      *(void *)(v18 + 72) = 0;
      *(void *)(v18 + 80) = 0;
      char v21 = *(unsigned char *)(v18 + 88);
      *(unsigned char *)(v18 + 88) = 2;
      sub_100018FC8(v19, v20, v21);
    }
    v16((uint64_t)v23, 0);
    if (swift_unknownObjectWeakLoadStrong())
    {
      sub_100021828();
      swift_unknownObjectRelease();
      swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v22 = (void *)sub_100021898();
      sub_1000218A8();
      swift_release();
      sub_100018FC8(v15, v14, 0);

      swift_release();
      swift_release();
    }
    else
    {
      sub_100018FC8(v15, v14, 0);
    }
  }
}

uint64_t (*sub_100016CD4(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_100016D34;
}

uint64_t sub_100016D34(uint64_t a1, char a2)
{
  if (a2)
  {
    return swift_endAccess();
  }
  else
  {
    uint64_t v4 = swift_endAccess();
    return sub_100016914(v4);
  }
}

void *sub_100016D70()
{
  v9.receiver = v0;
  v9.super_class = (Class)swift_getObjectType();
  [super prepareForReuse];
  unint64_t result = (void *)swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v2 = result;
    id v3 = [result arrangedSubviews];
    sub_100011CC0(0, &qword_10002E458);
    unint64_t v4 = sub_100021A18();

    id v5 = v2;
    sub_1000192A4((uint64_t)&_swiftEmptyArrayStorage, v4, v5);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    sub_10001922C(v7);
    uint64_t v6 = (uint64_t)&v0[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_viewModel];
    swift_beginAccess();
    sub_100018F48(v6, (uint64_t)v8);
    sub_100018F48((uint64_t)v7, v6);
    sub_1000194D0(v8, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_10001915C);
    sub_100016914();
    *(void *)&v0[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_delegate + 8] = 0;
    return (void *)swift_unknownObjectWeakAssign();
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_100017074()
{
  v10.receiver = v0;
  v10.super_class = (Class)swift_getObjectType();
  [super layoutSubviews];
  uint64_t v1 = (uint64_t)v0 + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_viewModel;
  swift_beginAccess();
  sub_100018F48(v1, (uint64_t)v11);
  sub_100018F48((uint64_t)v11, (uint64_t)v12);
  BOOL v2 = sub_100018FB0(v12) == 1 || (*(unsigned char *)(v1 + 104) & 1) == 0;
  [v0 setSeparatorStyle:v2];
  sub_100018F48(v1, (uint64_t)v8);
  sub_100018F48((uint64_t)v8, (uint64_t)v9);
  double v3 = 16.0;
  if (sub_100018FB0(v9) != 1)
  {
    if (*(unsigned char *)(v1 + 18)) {
      double v3 = 52.0;
    }
    else {
      double v3 = 16.0;
    }
  }
  id v4 = sub_10001720C();
  uint64_t v6 = v5;

  [v6 setConstant:v3];
  [v0 separatorInset];
  return [v0 setSeparatorInset:];
}

id sub_10001720C()
{
  uint64_t v1 = v0;
  BOOL v2 = &v0[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell____lazy_storage___completedButton];
  double v3 = *(void **)&v0[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell____lazy_storage___completedButton];
  id v4 = *(void **)&v0[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell____lazy_storage___completedButton
                   + 8];
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v6 = (void *)sub_1000181C8(v1);
    NSString v8 = v7;
    objc_super v9 = *(void **)v2;
    objc_super v10 = (void *)*((void *)v2 + 1);
    *(void *)BOOL v2 = v6;
    *((void *)v2 + 1) = v7;
    id v5 = v6;
    v8;
    sub_1000190DC(v9, v10);
  }
  sub_10001911C(v3, v4);
  return v5;
}

void sub_10001729C()
{
  uint64_t v1 = v0;
  BOOL v2 = (char *)sub_10001720C();

  uint64_t v4 = v1 + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_viewModel;
  swift_beginAccess();
  sub_100018F48(v4, (uint64_t)v17);
  sub_100018F48((uint64_t)v17, (uint64_t)v18);
  if (sub_100018FB0(v18) == 1 || (*(unsigned char *)(v4 + 16) & 1) == 0)
  {
    if (qword_10002E038 != -1) {
      swift_once();
    }
    id v5 = &qword_10002EB98;
  }
  else
  {
    if (qword_10002E030 != -1) {
      swift_once();
    }
    id v5 = &qword_10002EB90;
  }
  uint64_t v6 = (void *)*v5;
  objc_super v7 = *(void **)&v2[OBJC_IVAR____TtC27RemindersIntentsUIExtension26TTRIVibrantCompletedButton_image];
  *(void *)&v2[OBJC_IVAR____TtC27RemindersIntentsUIExtension26TTRIVibrantCompletedButton_image] = v6;
  id v8 = v6;

  sub_10001385C();
  id v9 = sub_10001720C();

  sub_100018F48(v4, (uint64_t)v15);
  sub_100018F48((uint64_t)v15, (uint64_t)v16);
  sub_100018FB0(v16);
  NSString v11 = sub_100021968();
  swift_bridgeObjectRelease();
  [v9 setAccessibilityIdentifier:v11];

  id v12 = sub_10001720C();
  id v14 = [self configurationWithTextStyle:UIFontTextStyleBody scale:3];
  [v12 setPreferredSymbolConfiguration:v14 forImageInState:0];
}

void sub_1000174F4()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_viewModel;
  swift_beginAccess();
  sub_100018F48(v1, (uint64_t)v75);
  sub_100018F48((uint64_t)v75, (uint64_t)v76);
  if (sub_100018FB0(v76) == 1 || (uint64_t v2 = *(void *)(v1 + 32)) == 0)
  {
    uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      id v5 = Strong;
      [Strong setText:0];
      goto LABEL_15;
    }
    __break(1u);
    goto LABEL_35;
  }
  v74[19] = *(void *)(v1 + 24);
  v74[20] = v2;
  sub_100018F48(v1, (uint64_t)v73);
  sub_100018F48((uint64_t)v73, (uint64_t)v74);
  if (sub_100018FB0(v74) == 1 || (*(unsigned char *)(v1 + 19) & 1) == 0) {
    id v3 = &selRef_secondaryLabelColor;
  }
  else {
    id v3 = &selRef_redColor;
  }
  uint64_t v6 = self;
  swift_bridgeObjectRetain();
  id v7 = [v6 *v3];
  sub_100018F48(v1, (uint64_t)v71);
  sub_100018F48((uint64_t)v71, (uint64_t)v72);
  if (sub_100018FB0(v72) != 1)
  {
    v8._object = *(void **)(v1 + 48);
    if (v8._object)
    {
      v8._countAndFlagsBits = *(void *)(v1 + 40);
      sub_1000219D8(v8);
      v77._countAndFlagsBits = 8236;
      v77._object = (void *)0xE200000000000000;
      sub_1000219D8(v77);
      swift_bridgeObjectRelease();
    }
  }
  uint64_t v9 = swift_unknownObjectWeakLoadStrong();
  if (!v9)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  id v10 = (void *)v9;
  swift_bridgeObjectRetain();
  NSString v11 = sub_100021968();
  swift_bridgeObjectRelease();
  [v10 setText:v11];

  uint64_t v12 = swift_unknownObjectWeakLoadStrong();
  if (!v12)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  id v5 = (void *)v12;
  swift_bridgeObjectRelease();
  [v5 setTextColor:v7];

LABEL_15:
  sub_100018F48(v1, (uint64_t)v73);
  sub_100018F48((uint64_t)v73, (uint64_t)v74);
  if (sub_100018FB0(v74) != 1)
  {
    unint64_t v13 = *(void *)(v1 + 120);
    if (v13)
    {
      uint64_t v14 = *(void *)(v1 + 112);
      uint64_t v15 = HIBYTE(v13) & 0xF;
      if ((v13 & 0x2000000000000000) == 0) {
        uint64_t v15 = v14 & 0xFFFFFFFFFFFFLL;
      }
      if (v15)
      {
        uint64_t v16 = sub_100011CC0(0, &qword_10002E330);
        swift_bridgeObjectRetain();
        int v70 = (void *)sub_100021BA8();
        Class isa = sub_100021B98().super.isa;
        id v61 = self;
        id v18 = [v61 secondaryLabelColor];
        sub_10000C984(&qword_10002E438);
        uint64_t v19 = swift_allocObject();
        *(_OWORD *)(v19 + 16) = xmmword_100022920;
        *(void *)(v19 + 32) = NSFontAttributeName;
        *(void *)(v19 + 40) = isa;
        uint64_t v68 = v16;
        *(void *)(v19 + 64) = v16;
        *(void *)(v19 + 72) = NSForegroundColorAttributeName;
        uint64_t v20 = sub_100011CC0(0, &qword_10002E338);
        *(void *)(v19 + 104) = v20;
        *(void *)(v19 + 80) = v18;
        int v65 = NSFontAttributeName;
        char v21 = isa;
        id v63 = NSForegroundColorAttributeName;
        id v22 = v18;
        sub_100014D50(v19);
        id v23 = objc_allocWithZone((Class)NSAttributedString);
        NSString v24 = sub_100021968();
        swift_bridgeObjectRelease();
        type metadata accessor for Key(0);
        sub_100019084();
        Class v25 = sub_100021908().super.isa;
        swift_bridgeObjectRelease();
        id v69 = [v23 initWithString:v24 attributes:v25];

        int v26 = (void *)swift_unknownObjectWeakLoadStrong();
        if (v26)
        {
          id v27 = v26;
          id v28 = [v26 text];

          if (v28)
          {
            uint64_t v29 = sub_100021998();
            unint64_t v31 = v30;

            uint64_t v32 = HIBYTE(v31) & 0xF;
            if ((v31 & 0x2000000000000000) == 0) {
              uint64_t v32 = v29 & 0xFFFFFFFFFFFFLL;
            }
            if (v32)
            {
              v79._object = (void *)0x80000001000256F0;
              v78._countAndFlagsBits = 0x4025204025204025;
              v78._object = (void *)0xE800000000000000;
              v79._countAndFlagsBits = 0xD00000000000004FLL;
              sub_100021728(v78, v79);
              Swift::String v33 = (void *)swift_unknownObjectWeakLoadStrong();
              if (!v33)
              {
LABEL_39:
                __break(1u);
                return;
              }
              uint64_t v34 = v33;
              int v59 = v22;
              uint64_t v60 = v21;
              id v35 = [v33 textColor];

              if (!v35) {
                id v35 = [v61 secondaryLabelColor];
              }
              uint64_t v36 = swift_allocObject();
              *(_OWORD *)(v36 + 16) = xmmword_100022920;
              *(void *)(v36 + 32) = v65;
              *(void *)(v36 + 40) = v70;
              *(void *)(v36 + 64) = v68;
              *(void *)(v36 + 72) = v63;
              *(void *)(v36 + 104) = v20;
              *(void *)(v36 + 80) = v35;
              uint64_t v66 = v65;
              id v62 = v70;
              uint64_t v37 = v63;
              id v67 = v35;
              sub_100014D50(v36);
              id v38 = objc_allocWithZone((Class)NSAttributedString);
              NSString v39 = sub_100021968();
              swift_bridgeObjectRelease();
              Class v40 = sub_100021908().super.isa;
              swift_bridgeObjectRelease();
              id v64 = [v38 initWithString:v39 attributes:v40];

              uint64_t v41 = swift_allocObject();
              *(_OWORD *)(v41 + 16) = xmmword_100022930;
              *(void *)(v41 + 64) = v20;
              *(void *)(v41 + 32) = v37;
              *(void *)(v41 + 40) = v59;
              id v42 = v59;
              char v43 = v37;
              sub_100014D50(v41);
              id v44 = objc_allocWithZone((Class)NSAttributedString);
              NSString v45 = sub_100021968();
              Class v46 = sub_100021908().super.isa;
              swift_bridgeObjectRelease();
              id v47 = [v44 initWithString:v45 attributes:v46];

              sub_100011CC0(0, &qword_10002E440);
              uint64_t v48 = swift_allocObject();
              *(_OWORD *)(v48 + 16) = xmmword_100022930;
              *(void *)(v48 + 64) = v68;
              *(void *)(v48 + 32) = v66;
              *(void *)(v48 + 40) = v62;
              id v49 = v62;
              char v50 = v66;
              sub_100014D50(v48);
              sub_10000C984(&qword_10002E058);
              uint64_t v51 = swift_allocObject();
              *(_OWORD *)(v51 + 16) = xmmword_100022DA0;
              *(void *)(v51 + 32) = v64;
              *(void *)(v51 + 40) = v47;
              uint64_t v52 = v69;
              *(void *)(v51 + 48) = v69;
              v72[0] = v51;
              sub_100021A28();
              id v53 = v64;
              id v54 = v47;
              id v55 = v69;
              id v56 = (id)sub_100021B28();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();

              id v22 = v59;
              char v21 = v60;
              goto LABEL_31;
            }
            swift_bridgeObjectRelease();
          }
          uint64_t v52 = v69;
          id v56 = v69;
LABEL_31:
          uint64_t v57 = (void *)swift_unknownObjectWeakLoadStrong();
          if (v57)
          {
            uint64_t v58 = v57;
            [v57 setAttributedText:v56];

            return;
          }
          goto LABEL_38;
        }
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
        goto LABEL_39;
      }
    }
  }
}

void sub_100017D20()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_viewModel;
  swift_beginAccess();
  sub_100018F48(v1, (uint64_t)v14);
  sub_100018F48((uint64_t)v14, (uint64_t)v15);
  if (sub_100018FB0(v15) != 1 && *(unsigned char *)(v1 + 17) == 1)
  {
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    if (!Strong) {
      goto LABEL_11;
    }
    id v3 = (void *)Strong;
    uint64_t v4 = sub_1000185E4();
    [v3 addArrangedSubview:v4];
  }
  sub_100018F48(v1, (uint64_t)v12);
  sub_100018F48((uint64_t)v12, (uint64_t)v13);
  if (sub_100018FB0(v13) != 1)
  {
    id v5 = *(void **)(v1 + 96);
    if (v5)
    {
      id v6 = v5;
      id v7 = sub_10001869C();
      [v7 setImage:v6 forState:0];

      id v8 = sub_10001869C();
      [v6 size];
      [v8 frame];
      [v8 setFrame:];

      uint64_t v9 = swift_unknownObjectWeakLoadStrong();
      if (v9)
      {
        id v10 = (void *)v9;
        id v11 = sub_10001869C();
        [v10 addArrangedSubview:v11];

        return;
      }
      __break(1u);
LABEL_11:
      __break(1u);
    }
  }
}

void sub_100017ED8(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = a1[1];
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v4 = (void *)Strong;
    id v5 = sub_100016CD4((uint64_t)v18);
    uint64_t v7 = v6;
    sub_100018F48(v6, (uint64_t)v19);
    sub_100018F48((uint64_t)v19, (uint64_t)v20);
    if (sub_100018FB0(v20) != 1)
    {
      id v8 = *(void **)(v7 + 72);
      uint64_t v9 = *(void *)(v7 + 80);
      *(void *)(v7 + 72) = v2;
      *(void *)(v7 + 80) = v1;
      char v10 = *(unsigned char *)(v7 + 88);
      *(unsigned char *)(v7 + 88) = 1;
      swift_bridgeObjectRetain();
      sub_100018FC8(v8, v9, v10);
    }
    v5((uint64_t)v18, 0);
  }
  swift_beginAccess();
  uint64_t v11 = swift_unknownObjectWeakLoadStrong();
  if (v11)
  {
    uint64_t v12 = (void *)v11;
    v22._object = (void *)0x80000001000256C0;
    v21._countAndFlagsBits = 0x6E6967617373654DLL;
    v21._object = (void *)0xED00004025203A67;
    v22._countAndFlagsBits = 0xD00000000000002FLL;
    sub_100021728(v21, v22);
    uint64_t v13 = swift_unknownObjectWeakLoadStrong();
    if (v13)
    {
      uint64_t v14 = (void *)v13;
      sub_100018470((uint64_t)v12);
      uint64_t v16 = v15;
      swift_bridgeObjectRelease();
      if (v16)
      {
        NSString v17 = sub_100021968();
        swift_bridgeObjectRelease();
      }
      else
      {
        NSString v17 = 0;
      }
      [v14 setText:v17];
    }
    else
    {
      __break(1u);
    }
  }
}

void *sub_1000180B8()
{
  uint64_t v1 = (uint64_t)v0 + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_viewModel;
  swift_beginAccess();
  sub_100018F48(v1, (uint64_t)v5);
  sub_100018F48((uint64_t)v5, (uint64_t)v6);
  unint64_t result = (void *)sub_100018FB0((uint64_t *)v6);
  if (result != 1)
  {
    v4[4] = v6[4];
    v4[5] = v6[5];
    v4[6] = v6[6];
    v4[7] = v6[7];
    v4[0] = v6[0];
    v4[1] = v6[1];
    v4[2] = v6[2];
    v4[3] = v6[3];
    unint64_t result = (void *)swift_unknownObjectWeakLoadStrong();
    if (result)
    {
      sub_100018F48((uint64_t)v5, (uint64_t)v3);
      sub_1000195E4((uint64_t)v3);
      sub_10001DFA4(v0, (uint64_t)v4);
      swift_unknownObjectRelease();
      return sub_1000194D0(v5, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_10001915C);
    }
  }
  return result;
}

uint64_t sub_1000181C8(void *a1)
{
  id v2 = [objc_allocWithZone((Class)type metadata accessor for TTRIVibrantCompletedButton()) init];
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v3 = [v2 leadingAnchor];
  id v4 = [a1 leadingAnchor];
  id v5 = [v3 constraintEqualToAnchor:v4 constant:16.0];

  id v6 = [a1 contentView];
  [v6 addSubview:v2];

  sub_10000C984(&qword_10002E058);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_100022DA0;
  *(void *)(v7 + 32) = v5;
  v5;
  id v8 = [v2 centerYAnchor];
  id v9 = [a1 centerYAnchor];
  id v10 = [v8 constraintEqualToAnchor:v9];

  *(void *)(v7 + 40) = v10;
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v12 = (void *)result;
    uint64_t v13 = self;
    id v14 = [v12 leadingAnchor];

    id v15 = [v2 trailingAnchor];
    id v16 = [v14 constraintEqualToAnchor:v15 constant:12.0];

    *(void *)(v7 + 48) = v16;
    sub_100021A28();
    sub_100011CC0(0, &qword_10002E448);
    Class isa = sub_100021A08().super.isa;
    swift_bridgeObjectRelease();
    [v13 activateConstraints:isa];

    [v2 addTarget:a1 action:"didTapCompleteButton:" forControlEvents:0x2000];
    return (uint64_t)v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100018470(uint64_t a1)
{
  uint64_t v1 = a1 + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_viewModel;
  swift_beginAccess();
  sub_100018F48(v1, (uint64_t)v9);
  sub_100018F48((uint64_t)v9, (uint64_t)v10);
  int v2 = sub_100018FB0(v10);
  uint64_t result = 0;
  if (v2 != 1)
  {
    if (*(unsigned __int8 *)(v1 + 88) <= 1u)
    {
      if (*(unsigned char *)(v1 + 88))
      {
        uint64_t v6 = v1 + 72;
        id v4 = *(void **)(v1 + 72);
        uint64_t v5 = *(void *)(v6 + 8);
        sub_10000C984(&qword_10002E428);
        uint64_t v7 = swift_allocObject();
        *(_OWORD *)(v7 + 16) = xmmword_100022930;
        *(void *)(v7 + 56) = &type metadata for String;
        *(void *)(v7 + 64) = sub_100019030();
        *(void *)(v7 + 32) = v4;
        *(void *)(v7 + 40) = v5;
        sub_1000143B8(v4, v5, 1);
        return sub_1000219A8();
      }
LABEL_6:
      sub_10000C984(&qword_10002E428);
      uint64_t v8 = swift_allocObject();
      *(_OWORD *)(v8 + 16) = xmmword_100022930;
      *(void *)(v8 + 56) = &type metadata for String;
      *(void *)(v8 + 64) = sub_100019030();
      *(void *)(v8 + 32) = 3026478;
      *(void *)(v8 + 40) = 0xE300000000000000;
      return sub_1000219A8();
    }
    if (*(unsigned char *)(v1 + 88) == 2) {
      goto LABEL_6;
    }
    return 0;
  }
  return result;
}

char *sub_1000185E4()
{
  uint64_t v1 = OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell____lazy_storage___flaggedView;
  int v2 = *(void **)(v0
                + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell____lazy_storage___flaggedView);
  if (v2)
  {
    id v3 = *(char **)(v0
                  + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell____lazy_storage___flaggedView);
  }
  else
  {
    uint64_t v4 = v0;
    if (qword_10002E040 != -1) {
      swift_once();
    }
    uint64_t v5 = (void *)qword_10002EBA0;
    objc_allocWithZone((Class)type metadata accessor for TTRIVibrantTemplateImageView());
    id v6 = v5;
    uint64_t v7 = sub_10001332C(v5);
    uint64_t v8 = *(void **)(v4 + v1);
    *(void *)(v4 + v1) = v7;
    id v3 = v7;

    int v2 = 0;
  }
  id v9 = v2;
  return v3;
}

id sub_10001869C()
{
  uint64_t v1 = OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell____lazy_storage___appLinkIconView;
  int v2 = *(void **)(v0
                + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell____lazy_storage___appLinkIconView);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell____lazy_storage___appLinkIconView);
  }
  else
  {
    sub_100021778();
    id v4 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
    [v4 addTarget:v0 action:"didTapAppLinkButton:" forControlEvents:0x2000];
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    int v2 = 0;
  }
  id v6 = v2;
  return v3;
}

void *sub_100018734()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_viewModel;
  swift_beginAccess();
  sub_100018F48(v1, (uint64_t)v4);
  sub_100018F48((uint64_t)v4, (uint64_t)v5);
  uint64_t result = (void *)sub_100018FB0((uint64_t *)v5);
  if (result != 1)
  {
    v3[4] = v5[4];
    v3[5] = v5[5];
    v3[6] = v5[6];
    v3[7] = v5[7];
    v3[0] = v5[0];
    v3[1] = v5[1];
    v3[2] = v5[2];
    v3[3] = v5[3];
    uint64_t result = (void *)swift_unknownObjectWeakLoadStrong();
    if (result)
    {
      sub_1000194D0(v4, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_100019534);
      sub_10001F898((void **)v3);
      swift_unknownObjectRelease();
      return sub_1000194D0(v4, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_10001915C);
    }
  }
  return result;
}

uint64_t sub_100018848(void *a1, uint64_t a2, uint64_t a3, void (*a4)(_OWORD *))
{
  if (a3)
  {
    id v6 = a1;
    swift_unknownObjectRetain();
    sub_100021C78();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    id v7 = a1;
  }
  a4(v9);

  return sub_100019244((uint64_t)v9);
}

id sub_1000188C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v7 = (uint64_t)&v3[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_viewModel];
  sub_10001922C(v13);
  sub_100018F48((uint64_t)v13, v7);
  *(void *)&v3[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  uint64_t v8 = &v3[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell____lazy_storage___completedButton];
  *(void *)uint64_t v8 = 0;
  *((void *)v8 + 1) = 0;
  *(void *)&v3[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell____lazy_storage___flaggedView] = 0;
  *(void *)&v3[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell____lazy_storage___appLinkIconView] = 0;
  if (a3)
  {
    NSString v9 = sub_100021968();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v9 = 0;
  }
  v12.receiver = v3;
  v12.super_class = ObjectType;
  [super initWithStyle:a1 reuseIdentifier:v9];

  return v10;
}

id sub_100018A70(void *a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = (uint64_t)&v1[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_viewModel];
  sub_10001922C(v9);
  sub_100018F48((uint64_t)v9, v4);
  *(void *)&v1[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  uint64_t v5 = &v1[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell____lazy_storage___completedButton];
  *(void *)uint64_t v5 = 0;
  *((void *)v5 + 1) = 0;
  *(void *)&v1[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell____lazy_storage___flaggedView] = 0;
  *(void *)&v1[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell____lazy_storage___appLinkIconView] = 0;
  v8.receiver = v1;
  v8.super_class = ObjectType;
  [super initWithCoder:a1];

  return v6;
}

void sub_100018BBC()
{
  sub_100018F48(v0 + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_viewModel, (uint64_t)v1);
  sub_1000194D0(v1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_10001915C);
  sub_100019204(v0 + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_delegate);
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  sub_1000190DC(*(void **)(v0+ OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell____lazy_storage___completedButton), *(void **)(v0+ OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell____lazy_storage___completedButton+ 8));
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell____lazy_storage___flaggedView));
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell____lazy_storage___appLinkIconView));
}

uint64_t type metadata accessor for TTRIIntentsSnippetReminderViewCell()
{
  return self;
}

void *initializeBufferWithCopyOfBuffer for TTRIIntentsSnippetReminderViewCell.CompletedButtonHolder(void *a1, uint64_t a2)
{
  id v3 = *(void **)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  id v6 = v4;
  return a1;
}

void destroy for TTRIIntentsSnippetReminderViewCell.CompletedButtonHolder(uint64_t a1)
{
  int v2 = *(void **)(a1 + 8);
}

uint64_t assignWithCopy for TTRIIntentsSnippetReminderViewCell.CompletedButtonHolder(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  uint64_t v7 = *(void **)(a2 + 8);
  objc_super v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  return a1;
}

uint64_t assignWithTake for TTRIIntentsSnippetReminderViewCell.CompletedButtonHolder(uint64_t a1, _OWORD *a2)
{
  uint64_t v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for TTRIIntentsSnippetReminderViewCell.CompletedButtonHolder(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TTRIIntentsSnippetReminderViewCell.CompletedButtonHolder(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TTRIIntentsSnippetReminderViewCell.CompletedButtonHolder()
{
  return &type metadata for TTRIIntentsSnippetReminderViewCell.CompletedButtonHolder;
}

uint64_t sub_100018F48(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000C984(&qword_10002E420);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100018FB0(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void sub_100018FC8(void *a1, uint64_t a2, char a3)
{
  if (a3 != -1) {
    sub_100014450(a1, a2, a3);
  }
}

uint64_t sub_100018FDC()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100019014(uint64_t *a1)
{
}

unint64_t sub_100019030()
{
  unint64_t result = qword_10002E430;
  if (!qword_10002E430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002E430);
  }
  return result;
}

unint64_t sub_100019084()
{
  unint64_t result = qword_10002E218;
  if (!qword_10002E218)
  {
    type metadata accessor for Key(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002E218);
  }
  return result;
}

void sub_1000190DC(void *a1, void *a2)
{
  if (a1)
  {
  }
}

id sub_10001911C(id result, void *a2)
{
  if (result)
  {
    id v2 = result;
    return a2;
  }
  return result;
}

void *sub_10001915C(void *result, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, char a12, void *a13)
{
  if (result)
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_100018FC8(a10, a11, a12);

    return (void *)swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100019204(uint64_t a1)
{
  return a1;
}

double sub_10001922C(_OWORD *a1)
{
  double result = 0.0;
  a1[6] = 0u;
  a1[7] = 0u;
  a1[4] = 0u;
  a1[5] = 0u;
  a1[2] = 0u;
  a1[3] = 0u;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

uint64_t sub_100019244(uint64_t a1)
{
  uint64_t v2 = sub_10000C984(&qword_10002E450);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000192A4(uint64_t a1, unint64_t a2, void *a3)
{
  if (a2 >> 62) {
    goto LABEL_15;
  }
  uint64_t v5 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  for (; v5; uint64_t v5 = sub_100021E28())
  {
    id v6 = self;
    uint64_t v7 = 4;
    while (1)
    {
      id v8 = (a2 & 0xC000000000000001) != 0 ? (id)sub_100021D48() : *(id *)(a2 + 8 * v7);
      id v9 = v8;
      uint64_t v10 = v7 - 3;
      if (__OFADD__(v7 - 4, 1)) {
        break;
      }
      [a3 removeArrangedSubview:v8];
      Class isa = (Class)[v9 constraints];
      if (!isa)
      {
        sub_100011CC0(0, &qword_10002E448);
        sub_100021A18();
        Class isa = sub_100021A08().super.isa;
        swift_bridgeObjectRelease();
      }
      [v6 deactivateConstraints:isa];

      [v9 removeFromSuperview];
      id v12 = v9;
      swift_bridgeObjectRetain();
      sub_1000219F8();
      if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_100021A38();
      }
      sub_100021A58();
      sub_100021A28();
      uint64_t v13 = a1;
      swift_bridgeObjectRelease();

      ++v7;
      if (v10 == v5) {
        goto LABEL_17;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  uint64_t v13 = a1;
LABEL_17:
  swift_bridgeObjectRelease();
  return v13;
}

void *sub_1000194D0(void *a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))
{
  return a1;
}

id sub_100019534(id result, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, char a12, void *a13)
{
  if (result)
  {
    id v14 = result;
    swift_bridgeObjectRetain();
    id v15 = v14;
    id v16 = a2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1000163A0(a10, a11, a12);
    swift_bridgeObjectRetain();
    return a13;
  }
  return result;
}

uint64_t sub_1000195E4(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  id v3 = *(void **)(a1 + 8);
  uint64_t v4 = *(void **)(a1 + 72);
  uint64_t v5 = *(void *)(a1 + 80);
  id v6 = *(void **)(a1 + 96);
  char v7 = *(unsigned char *)(a1 + 88);
  swift_bridgeObjectRetain();
  id v8 = v2;
  id v9 = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1000163A0(v4, v5, v7);
  swift_bridgeObjectRetain();
  id v10 = v6;
  return a1;
}

void *sub_100019684(void *a1, uint64_t a2)
{
  if ((a2 & 0xC000000000000001) == 0)
  {
    if (*(void *)(a2 + 16))
    {
      unint64_t v6 = sub_100005314((uint64_t)a1);
      if (v7)
      {
        uint64_t v5 = *(void **)(*(void *)(a2 + 56) + 8 * v6);
        id v8 = v5;
        return v5;
      }
    }
    return 0;
  }
  id v3 = a1;
  uint64_t v4 = sub_100021DF8();

  if (!v4) {
    return 0;
  }
  sub_100011CC0(0, &qword_10002E6E0);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  uint64_t v5 = v10;
  swift_unknownObjectRelease();
  return v5;
}

uint64_t sub_10001975C()
{
  uint64_t v0 = sub_1000218E8();
  sub_1000142A8(v0, qword_10002E460);
  uint64_t v1 = sub_10001430C(v0, (uint64_t)qword_10002E460);
  if (qword_10002E028 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10001430C(v0, (uint64_t)qword_10002EB78);
  id v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

id sub_100019824()
{
  id v0 = objc_allocWithZone((Class)CNContactStore);

  return [v0 init];
}

void sub_10001985C(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_viewModel) = a1;
  swift_bridgeObjectRelease();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  [Strong reloadData];

  id v3 = (void *)swift_unknownObjectWeakLoadStrong();
  if (v3)
  {
    uint64_t v4 = v3;
    [v3 invalidateIntrinsicContentSize];
  }
  uint64_t v5 = (void *)swift_unknownObjectWeakLoadStrong();
  if (v5)
  {
    id v6 = v5;
    [v5 layoutIfNeeded];
  }
}

uint64_t sub_100019920@<X0>(unint64_t a1@<X0>, unsigned char *a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  unint64_t v5 = v4;
  id v27 = a4;
  unint64_t v9 = type metadata accessor for TTRIIntentsSnippetViewController.ViewModel();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  id v12 = (uint64_t *)((char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  id v28 = _swiftEmptyArrayStorage;
  int64_t v13 = *(void *)(a1 + 8);
  if (!v13) {
    goto LABEL_4;
  }
  uint64_t v25 = a3;
  unint64_t v26 = v4;
  uint64_t v14 = *(void *)a1;
  uint64_t v15 = sub_10000C984(&qword_10002E5F8);
  uint64_t v16 = (uint64_t)v12 + *(int *)(v15 + 48);
  uint64_t v17 = *(int *)(v15 + 64);
  *id v12 = v14;
  v12[1] = v13;
  uint64_t v18 = type metadata accessor for TTRIIntentsSnippetSection();
  sub_100021134(a1 + *(int *)(v18 + 20), v16);
  *((unsigned char *)v12 + v17) = *a2;
  swift_storeEnumTagMultiPayload();
  swift_bridgeObjectRetain();
  unint64_t v9 = sub_10001E8C0(0, 1, 1, (unint64_t)_swiftEmptyArrayStorage, &qword_10002E108, (uint64_t (*)(void))type metadata accessor for TTRIIntentsSnippetViewController.ViewModel, (uint64_t (*)(void))type metadata accessor for TTRIIntentsSnippetViewController.ViewModel);
  unint64_t v5 = *(void *)(v9 + 16);
  unint64_t v19 = *(void *)(v9 + 24);
  int64_t v13 = v5 + 1;
  if (v5 >= v19 >> 1) {
    goto LABEL_10;
  }
  while (1)
  {
    *(void *)(v9 + 16) = v13;
    sub_1000211F4((uint64_t)v12, v9+ ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80))+ *(void *)(v10 + 72) * v5, (uint64_t (*)(void))type metadata accessor for TTRIIntentsSnippetViewController.ViewModel);
    id v28 = (void *)v9;
    a3 = v25;
    unint64_t v5 = v26;
LABEL_4:
    *a2 = 0;
    uint64_t v20 = type metadata accessor for TTRIIntentsSnippetSection();
    a1 = *(void *)(a1 + *(int *)(v20 + 24));
    if (a1 >> 62) {
      break;
    }
    a2 = *(unsigned char **)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    unint64_t v19 = (unint64_t)(a2 - 1);
    if (!__OFSUB__(a2, 1)) {
      goto LABEL_6;
    }
LABEL_9:
    __break(1u);
LABEL_10:
    unint64_t v9 = sub_10001E8C0(v19 > 1, v13, 1, v9, &qword_10002E108, (uint64_t (*)(void))type metadata accessor for TTRIIntentsSnippetViewController.ViewModel, (uint64_t (*)(void))type metadata accessor for TTRIIntentsSnippetViewController.ViewModel);
  }
  swift_bridgeObjectRetain();
  a2 = (unsigned char *)sub_100021E28();
  uint64_t v20 = swift_bridgeObjectRelease();
  unint64_t v19 = (unint64_t)(a2 - 1);
  if (__OFSUB__(a2, 1)) {
    goto LABEL_9;
  }
LABEL_6:
  __chkstk_darwin(v20);
  *(&v25 - 2) = a3;
  *(&v25 - 1) = v21;
  unint64_t v22 = swift_bridgeObjectRetain();
  id v23 = sub_10001FC00(v22, (void (*)(unint64_t, id))sub_1000211EC, (uint64_t)(&v25 - 4));
  swift_bridgeObjectRelease();
  uint64_t result = sub_100019E14((uint64_t)v23);
  *id v27 = v28;
  return result;
}

uint64_t sub_100019C10(unint64_t a1)
{
  return sub_100019C40(a1, (uint64_t (*)(uint64_t, void, unint64_t))sub_10000C354);
}

uint64_t sub_100019C28(unint64_t a1)
{
  return sub_100019C40(a1, (uint64_t (*)(uint64_t, void, unint64_t))sub_10000C574);
}

uint64_t sub_100019C40(unint64_t a1, uint64_t (*a2)(uint64_t, void, unint64_t))
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_100021E28();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (!((unint64_t)*v2 >> 62))
  {
    uint64_t v6 = *(void *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v7 = v6 + v5;
    if (!__OFADD__(v6, v5)) {
      goto LABEL_5;
    }
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  uint64_t v17 = sub_100021E28();
  swift_bridgeObjectRelease();
  uint64_t v7 = v17 + v5;
  if (__OFADD__(v17, v5)) {
    goto LABEL_21;
  }
LABEL_5:
  unint64_t v8 = *v2;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  uint64_t *v2 = v8;
  if (isUniquelyReferenced_nonNull_bridgeObject)
  {
    if ((v8 & 0x8000000000000000) == 0 && (v8 & 0x4000000000000000) == 0)
    {
      uint64_t v10 = v8 & 0xFFFFFFFFFFFFFF8;
      if (v7 <= *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        goto LABEL_11;
      }
    }
  }
  if (v8 >> 62) {
    goto LABEL_23;
  }
  while (1)
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_100021D58();
    swift_bridgeObjectRelease();
    uint64_t *v2 = v11;
    uint64_t v10 = v11 & 0xFFFFFFFFFFFFFF8;
LABEL_11:
    uint64_t result = a2(v10 + 8 * *(void *)(v10 + 16) + 32, (*(void *)(v10 + 24) >> 1) - *(void *)(v10 + 16), a1);
    if (v13 >= v5) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    sub_100021E28();
    swift_bridgeObjectRelease();
  }
  if (v13 >= 1)
  {
    uint64_t v14 = *(void *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v15 = __OFADD__(v14, v13);
    uint64_t v16 = v14 + v13;
    if (v15)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10) = v16;
  }
  swift_bridgeObjectRelease();

  return sub_100021A28();
}

uint64_t sub_100019E14(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *(void *)(v3 + 24) >> 1)
  {
    unint64_t v8 = *(void *)(a1 + 16);
    if (v8) {
      goto LABEL_5;
    }
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  if (v4 <= v5) {
    int64_t v23 = v4 + v2;
  }
  else {
    int64_t v23 = v4;
  }
  unint64_t v3 = sub_10001E8C0(isUniquelyReferenced_nonNull_native, v23, 1, v3, &qword_10002E108, (uint64_t (*)(void))type metadata accessor for TTRIIntentsSnippetViewController.ViewModel, (uint64_t (*)(void))type metadata accessor for TTRIIntentsSnippetViewController.ViewModel);
  unint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = *(void *)(v3 + 16);
  uint64_t v10 = (*(void *)(v3 + 24) >> 1) - v9;
  uint64_t v11 = *(void *)(type metadata accessor for TTRIIntentsSnippetViewController.ViewModel() - 8);
  uint64_t v12 = *(void *)(v11 + 72);
  if (v10 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v13 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v14 = v3 + v13 + v12 * v9;
  unint64_t v15 = a1 + v13;
  uint64_t v16 = v12 * v8;
  unint64_t v17 = v14 + v16;
  unint64_t v18 = v15 + v16;
  if (v15 < v17 && v14 < v18) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v20 = *(void *)(v3 + 16);
  BOOL v21 = __OFADD__(v20, v8);
  uint64_t v22 = v20 + v8;
  if (!v21)
  {
    *(void *)(v3 + 16) = v22;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_100021E78();
  __break(1u);
  return result;
}

id sub_100019FE4@<X0>(id a1@<X1>, uint64_t a2@<X0>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  id v10 = [a1 parentReminder];
  if (v10)
  {
    id v11 = v10;
    id v12 = [v11 objectID];
    unint64_t v13 = (uint64_t *)(a3
                    + OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_cachedReminders);
    swift_beginAccess();
    uint64_t v14 = *v13;
    id v15 = v12;
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_100019684(v15, v14);

    swift_bridgeObjectRelease();
    BOOL v17 = v16 != 0;
  }
  else
  {
    BOOL v17 = 0;
  }
  id v23 = a1;
  sub_100015B44(v23, a2 == a4, v17, (uint64_t)v24);
  long long v18 = v24[5];
  *(_OWORD *)(a5 + 72) = v24[4];
  *(_OWORD *)(a5 + 88) = v18;
  long long v19 = v24[7];
  *(_OWORD *)(a5 + 104) = v24[6];
  *(_OWORD *)(a5 + 120) = v19;
  long long v20 = v24[1];
  *(_OWORD *)(a5 + 8) = v24[0];
  *(_OWORD *)(a5 + 24) = v20;
  long long v21 = v24[3];
  *(_OWORD *)(a5 + 40) = v24[2];
  *(void *)a5 = v23;
  *(_OWORD *)(a5 + 56) = v21;
  type metadata accessor for TTRIIntentsSnippetViewController.ViewModel();
  swift_storeEnumTagMultiPayload();

  return v23;
}

uint64_t sub_10001A2D0(uint64_t a1, long long *a2)
{
  long long v3 = a2[5];
  long long v29 = a2[4];
  long long v30 = v3;
  long long v4 = a2[7];
  long long v31 = a2[6];
  long long v32 = v4;
  long long v5 = a2[1];
  long long v25 = *a2;
  long long v26 = v5;
  long long v6 = a2[3];
  long long v27 = a2[2];
  long long v28 = v6;
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    unint64_t v8 = (void *)result;
    NSString v9 = sub_100021968();
    Class isa = sub_100021668().super.isa;
    id v11 = [v8 dequeueReusableCellWithIdentifier:v9 forIndexPath:isa];

    type metadata accessor for TTRIIntentsSnippetReminderViewCell();
    uint64_t v12 = swift_dynamicCastClass();
    if (v12)
    {
      id v13 = (id)v12;
      *(void *)(v12 + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_delegate + 8) = &off_100029198;
      swift_unknownObjectWeakAssign();
      v23[4] = v29;
      v23[5] = v30;
      v23[6] = v31;
      v23[7] = v32;
      v23[0] = v25;
      v23[1] = v26;
      v23[2] = v27;
      v23[3] = v28;
      nullsub_2(v23);
      uint64_t v14 = (uint64_t)v13 + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_viewModel;
      swift_beginAccess();
      sub_100018F48(v14, (uint64_t)v24);
      sub_100018F48((uint64_t)v23, v14);
      sub_1000195E4((uint64_t)a2);
      sub_1000195E4((uint64_t)a2);
      id v15 = v11;
      sub_100021308((uint64_t)v24);
      sub_100016914();
      sub_100021364((uint64_t)a2);
    }
    else
    {
      if (qword_10002E048 != -1) {
        swift_once();
      }
      uint64_t v16 = sub_1000218E8();
      sub_10001430C(v16, (uint64_t)qword_10002E460);
      id v17 = v11;
      long long v18 = sub_1000218D8();
      os_log_type_t v19 = sub_100021AE8();
      if (os_log_type_enabled(v18, v19))
      {
        long long v20 = (uint8_t *)swift_slowAlloc();
        long long v21 = (void *)swift_slowAlloc();
        *(_DWORD *)long long v20 = 138412290;
        v24[0] = v17;
        id v22 = v17;
        sub_100021C58();
        *long long v21 = v17;

        _os_log_impl((void *)&_mh_execute_header, v18, v19, "Expected to dequeue reminder cell, but got %@", v20, 0xCu);
        sub_10000C984(&qword_10002E6E8);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
      }
      id v13 = [objc_allocWithZone((Class)UITableViewCell) init];
    }
    return (uint64_t)v13;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10001A610(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    unint64_t v8 = (void *)result;
    NSString v9 = sub_100021968();
    Class isa = sub_100021668().super.isa;
    id v11 = [v8 dequeueReusableCellWithIdentifier:v9 forIndexPath:isa];

    type metadata accessor for TTRIIntentsSnippetHeaderCell();
    uint64_t v12 = swift_dynamicCastClass();
    if (v12)
    {
      id v13 = (unsigned char *)v12;
      uint64_t v14 = (void *)(v12 + OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIIntentsSnippetHeaderCell_viewModel);
      *uint64_t v14 = a2;
      v14[1] = a3;
      id v15 = v11;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      sub_1000163B4();
      v13[OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIIntentsSnippetHeaderCell_isFirst] = a4 & 1;
      sub_1000163B4();
    }
    else
    {
      if (qword_10002E048 != -1) {
        swift_once();
      }
      uint64_t v16 = sub_1000218E8();
      sub_10001430C(v16, (uint64_t)qword_10002E460);
      id v17 = v11;
      long long v18 = sub_1000218D8();
      os_log_type_t v19 = sub_100021AE8();
      if (os_log_type_enabled(v18, v19))
      {
        long long v20 = (uint8_t *)swift_slowAlloc();
        long long v21 = (void *)swift_slowAlloc();
        *(_DWORD *)long long v20 = 138412290;
        id v22 = v17;
        sub_100021C58();
        *long long v21 = v17;

        _os_log_impl((void *)&_mh_execute_header, v18, v19, "Expected to dequeue header cell, but got %@", v20, 0xCu);
        sub_10000C984(&qword_10002E6E8);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
      }
      id v13 = [objc_allocWithZone((Class)UITableViewCell) init];
    }
    return (uint64_t)v13;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_10001A8C4()
{
  v20.receiver = v0;
  v20.super_class = (Class)type metadata accessor for TTRIIntentsSnippetViewController();
  [super viewDidLoad];
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (!Strong)
  {
    __break(1u);
    goto LABEL_12;
  }
  unint64_t v2 = Strong;
  [Strong setEstimatedRowHeight:UITableViewAutomaticDimension];

  uint64_t v3 = swift_unknownObjectWeakLoadStrong();
  if (!v3)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  long long v4 = (void *)v3;
  id v5 = [self effectWithStyle:4];
  id v6 = [self effectForBlurEffect:v5 style:5];

  [v4 setSeparatorEffect:v6];
  uint64_t v7 = swift_unknownObjectWeakLoadStrong();
  if (!v7)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  unint64_t v8 = (void *)v7;
  id v9 = [objc_allocWithZone((Class)UIView) initWithFrame:0.0, 0.0, 0.0, 0.0];
  [v8 setTableFooterView:v9];

  uint64_t v10 = swift_unknownObjectWeakLoadStrong();
  if (!v10)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  id v11 = (void *)v10;
  id v12 = [objc_allocWithZone((Class)UIView) initWithFrame:0.0, 0.0, 0.0, 0.0];
  [v11 setTableHeaderView:v12];

  id v13 = (void *)swift_unknownObjectWeakLoadStrong();
  [v13 reloadData];

  uint64_t v14 = (void *)swift_unknownObjectWeakLoadStrong();
  if (v14)
  {
    id v15 = v14;
    [v14 invalidateIntrinsicContentSize];
  }
  uint64_t v16 = (void *)swift_unknownObjectWeakLoadStrong();
  if (v16)
  {
    id v17 = v16;
    [v16 layoutIfNeeded];
  }
  long long v18 = (void *)swift_unknownObjectWeakLoadStrong();
  if (v18)
  {
    os_log_type_t v19 = v18;
    [v18 setInsetsLayoutMarginsFromSafeArea:1];

    return;
  }
LABEL_15:
  __break(1u);
}

uint64_t sub_10001AC48(unint64_t a1)
{
  uint64_t v2 = sub_100014E80((uint64_t)&_swiftEmptyArrayStorage);
  if (a1 >> 62)
  {
LABEL_28:
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_100021E28();
    if (v3) {
      goto LABEL_3;
    }
LABEL_29:
    swift_bridgeObjectRelease();
    long long v25 = (uint64_t *)(v27
                    + OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_cachedReminders);
    swift_beginAccess();
    *long long v25 = v2;
    return swift_bridgeObjectRelease();
  }
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v3) {
    goto LABEL_29;
  }
LABEL_3:
  uint64_t v4 = 4;
  while (1)
  {
    if ((a1 & 0xC000000000000001) != 0) {
      id v7 = (id)sub_100021D48();
    }
    else {
      id v7 = *(id *)(a1 + 8 * v4);
    }
    id v8 = v7;
    uint64_t v9 = v4 - 3;
    if (__OFADD__(v4 - 4, 1))
    {
      __break(1u);
LABEL_25:
      __break(1u);
LABEL_26:
      __break(1u);
LABEL_27:
      __break(1u);
      goto LABEL_28;
    }
    id v10 = [v7 remObjectID];
    if ((v2 & 0xC000000000000001) != 0)
    {
      if (v2 >= 0) {
        v2 &= 0xFFFFFFFFFFFFFF8uLL;
      }
      uint64_t v11 = sub_100021DE8();
      if (__OFADD__(v11, 1)) {
        goto LABEL_26;
      }
      uint64_t v2 = sub_10001F2E8(v2, v11 + 1);
    }
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v14 = sub_100005314((uint64_t)v10);
    uint64_t v15 = *(void *)(v2 + 16);
    BOOL v16 = (v13 & 1) == 0;
    uint64_t v17 = v15 + v16;
    if (__OFADD__(v15, v16)) {
      goto LABEL_25;
    }
    char v18 = v13;
    if (*(void *)(v2 + 24) < v17) {
      break;
    }
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      sub_10001F6F0();
    }
LABEL_21:
    if (v18)
    {
      uint64_t v5 = *(void *)(v2 + 56);
      id v6 = *(void **)(v5 + 8 * v14);
      *(void *)(v5 + 8 * v14) = v8;
    }
    else
    {
      *(void *)(v2 + 8 * (v14 >> 6) + 64) |= 1 << v14;
      *(void *)(*(void *)(v2 + 48) + 8 * v14) = v10;
      *(void *)(*(void *)(v2 + 56) + 8 * v14) = v8;
      uint64_t v21 = *(void *)(v2 + 16);
      BOOL v22 = __OFADD__(v21, 1);
      uint64_t v23 = v21 + 1;
      if (v22) {
        goto LABEL_27;
      }
      *(void *)(v2 + 16) = v23;
      id v24 = v10;
    }

    swift_bridgeObjectRelease();
    ++v4;
    if (v9 == v3) {
      goto LABEL_29;
    }
  }
  sub_100005ECC(v17, isUniquelyReferenced_nonNull_native);
  unint64_t v19 = sub_100005314((uint64_t)v10);
  if ((v18 & 1) == (v20 & 1))
  {
    unint64_t v14 = v19;
    goto LABEL_21;
  }
  sub_100011CC0(0, (unint64_t *)&unk_10002E6F0);
  uint64_t result = sub_100021ED8();
  __break(1u);
  return result;
}

void sub_10001AED0(void *a1)
{
  uint64_t v2 = sub_1000218E8();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
    uint64_t v29 = 0;
    long long v27 = 0u;
    long long v28 = 0u;
    sub_100011B2C((uint64_t)&v27, &qword_10002E700);
    goto LABEL_19;
  }
  id v6 = [a1 intentResponse];
  if (!v6
    || (id v26 = v6, sub_100011CC0(0, &qword_10002E718), sub_10000C984(&qword_10002E710), (swift_dynamicCast() & 1) == 0))
  {
    uint64_t v29 = 0;
    long long v27 = 0u;
    long long v28 = 0u;
    goto LABEL_11;
  }
  if (!*((void *)&v28 + 1))
  {
LABEL_11:
    sub_100011B2C((uint64_t)&v27, &qword_10002E700);
    id v15 = [a1 intent];
    if (v15)
    {
      id v26 = v15;
      sub_100011CC0(0, &qword_10002E708);
      sub_10000C984(&qword_10002E710);
      if (swift_dynamicCast())
      {
        if (*((void *)&v28 + 1))
        {
          sub_1000212AC(&v27, (uint64_t)v30);
          if (qword_10002E048 != -1) {
            swift_once();
          }
          sub_10001430C(v2, (uint64_t)qword_10002E460);
          BOOL v16 = a1;
          uint64_t v17 = sub_1000218D8();
          os_log_type_t v18 = sub_100021AC8();
          if (os_log_type_enabled(v17, v18))
          {
            unint64_t v19 = (uint8_t *)swift_slowAlloc();
            char v20 = (void *)swift_slowAlloc();
            *(_DWORD *)unint64_t v19 = 138412290;
            id v21 = [v16 intent];
            *(void *)&long long v27 = v21;
            sub_100021C58();
            void *v20 = v21;

            _os_log_impl((void *)&_mh_execute_header, v17, v18, "getting tasks from {intent: %@}", v19, 0xCu);
            sub_10000C984(&qword_10002E6E8);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();
          }
          else
          {

            uint64_t v17 = v16;
          }

          goto LABEL_25;
        }
LABEL_20:
        sub_100011B2C((uint64_t)&v27, &qword_10002E700);
        return;
      }
    }
LABEL_19:
    uint64_t v29 = 0;
    long long v27 = 0u;
    long long v28 = 0u;
    goto LABEL_20;
  }
  sub_1000212AC(&v27, (uint64_t)v30);
  if (qword_10002E048 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_10001430C(v2, (uint64_t)qword_10002E460);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v7, v2);
  id v8 = a1;
  uint64_t v9 = sub_1000218D8();
  os_log_type_t v10 = sub_100021AC8();
  if (!os_log_type_enabled(v9, v10))
  {

    uint64_t v9 = v8;
    goto LABEL_22;
  }
  uint64_t v11 = (uint8_t *)swift_slowAlloc();
  id v12 = (void *)swift_slowAlloc();
  *(_DWORD *)uint64_t v11 = 138412290;
  id v13 = [v8 intentResponse];
  if (v13)
  {
    id v14 = v13;
    *(void *)&long long v27 = v13;
    sub_100021C58();
    *id v12 = v14;

    _os_log_impl((void *)&_mh_execute_header, v9, v10, "getting tasks from {response: %@}", v11, 0xCu);
    sub_10000C984(&qword_10002E6E8);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
LABEL_22:

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
LABEL_25:
    uint64_t v22 = v31;
    uint64_t v23 = v32;
    sub_1000212C4(v30, v31);
    unint64_t v24 = (*(uint64_t (**)(uint64_t, uint64_t))(v23 + 8))(v22, v23);
    sub_10001B414(v24);
    swift_bridgeObjectRelease();
    sub_10002119C((uint64_t)v30);
    return;
  }

  __break(1u);
}

uint64_t *sub_10001B414(unint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v25 = (uint64_t)&_swiftEmptyArrayStorage;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_100021E28();
    if (!v4) {
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v4) {
      goto LABEL_18;
    }
  }
  if (v4 < 1)
  {
    __break(1u);
LABEL_27:
    swift_once();
    goto LABEL_21;
  }
  if ((a1 & 0xC000000000000001) != 0)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      sub_100021D48();
      uint64_t v6 = sub_100021B88();
      swift_unknownObjectRelease();
      if (v6)
      {
        sub_1000219F8();
        if (*(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_100021A38();
        }
        sub_100021A58();
        sub_100021A28();
      }
    }
  }
  else
  {
    for (uint64_t j = 0; j != v4; ++j)
    {
      id v8 = *(id *)(a1 + 8 * j + 32);
      uint64_t v9 = sub_100021B88();

      if (v9)
      {
        sub_1000219F8();
        if (*(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_100021A38();
        }
        sub_100021A58();
        sub_100021A28();
      }
    }
  }
LABEL_18:
  swift_bridgeObjectRelease();
  os_log_type_t v10 = *(void **)(v2 + OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_store);
  sub_100011CC0(0, (unint64_t *)&unk_10002E6F0);
  Class isa = sub_100021A08().super.isa;
  swift_bridgeObjectRelease();
  uint64_t v25 = 0;
  id v12 = [v10 fetchRemindersWithObjectIDs:isa error:&v25];

  id v13 = (id)v25;
  if (v12)
  {
    sub_100011CC0(0, &qword_10002E6E0);
    sub_10002125C((unint64_t *)&qword_10002E128, (unint64_t *)&unk_10002E6F0);
    unint64_t v14 = sub_100021918();
    id v15 = v13;

    BOOL v16 = sub_1000066A8(v14);
    swift_bridgeObjectRelease();
    return v16;
  }
  id v17 = (id)v25;
  sub_100021548();

  swift_willThrow();
  if (qword_10002E048 != -1) {
    goto LABEL_27;
  }
LABEL_21:
  uint64_t v18 = sub_1000218E8();
  sub_10001430C(v18, (uint64_t)qword_10002E460);
  swift_errorRetain();
  swift_errorRetain();
  unint64_t v19 = sub_1000218D8();
  os_log_type_t v20 = sub_100021AD8();
  if (os_log_type_enabled(v19, v20))
  {
    id v21 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    *(_DWORD *)id v21 = 136315138;
    swift_getErrorValue();
    uint64_t v22 = sub_100021EE8();
    sub_10001EB40(v22, v23, &v25);
    sub_100021C58();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "Failed to fetch reminders from INTasks {error: %s}", v21, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  swift_errorRelease();
  return (uint64_t *)&_swiftEmptyArrayStorage;
}

id sub_10001B898(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = (uint64_t *)(v2 + OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_cachedReminders);
  swift_beginAccess();
  uint64_t v5 = *v4;
  id v6 = a1;
  swift_bridgeObjectRetain();
  id v7 = sub_100019684(v6, v5);

  swift_bridgeObjectRelease();
  if (!v7)
  {
    if (qword_10002E048 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_1000218E8();
    sub_10001430C(v8, (uint64_t)qword_10002E460);
    uint64_t v9 = v6;
    os_log_type_t v10 = sub_1000218D8();
    os_log_type_t v11 = sub_100021AC8();
    if (os_log_type_enabled(v10, v11))
    {
      id v12 = (uint8_t *)swift_slowAlloc();
      id v13 = (void *)swift_slowAlloc();
      *(_DWORD *)id v12 = 138412290;
      id v24 = v9;
      unint64_t v14 = v9;
      sub_100021C58();
      *id v13 = v9;

      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Dont have id in cache, fetching %@", v12, 0xCu);
      sub_10000C984(&qword_10002E6E8);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      os_log_type_t v10 = v9;
    }

    id v15 = *(void **)(v2 + OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_store);
    id v24 = 0;
    id v7 = [v15 fetchReminderWithObjectID:v9 error:&v24];
    id v16 = v24;
    if (!v7)
    {
      id v17 = v16;
      sub_100021548();

      swift_willThrow();
      swift_errorRetain();
      swift_errorRetain();
      uint64_t v18 = sub_1000218D8();
      os_log_type_t v19 = sub_100021AD8();
      if (os_log_type_enabled(v18, v19))
      {
        os_log_type_t v20 = (uint8_t *)swift_slowAlloc();
        id v24 = (id)swift_slowAlloc();
        *(_DWORD *)os_log_type_t v20 = 136315138;
        swift_getErrorValue();
        uint64_t v21 = sub_100021EE8();
        sub_10001EB40(v21, v22, (uint64_t *)&v24);
        sub_100021C58();
        swift_bridgeObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, v18, v19, "Failed to fetch reminder by id {error: %s}", v20, 0xCu);
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
      return 0;
    }
  }
  return v7;
}

id sub_10001BC6C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_store;
  id v7 = objc_allocWithZone((Class)REMStore);
  uint64_t v8 = v3;
  *(void *)&v3[v6] = [v7 initUserInteractive:1];
  uint64_t v9 = OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_contactsProvider;
  sub_100011CC0(0, &qword_10002E730);
  sub_100021B18();
  sub_100021808();
  sub_1000217F8();
  sub_100021838();
  swift_allocObject();
  *(void *)&v8[v9] = sub_100021818();
  uint64_t v10 = OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_timeProvider;
  sub_100021748();
  *(void *)&v8[v10] = swift_allocObject();
  *(void *)&v8[OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_viewModel] = &_swiftEmptyArrayStorage;
  *(void *)&v8[OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_maxContentHeight] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v11 = OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_cachedReminders;
  *(void *)&v8[v11] = sub_100014E80((uint64_t)&_swiftEmptyArrayStorage);

  if (a2)
  {
    NSString v12 = sub_100021968();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v12 = 0;
  }
  v15.receiver = v8;
  v15.super_class = (Class)type metadata accessor for TTRIIntentsSnippetViewController();
  id v13 = [super initWithNibName:v12 bundle:a3];

  return v13;
}

id sub_10001BE90(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_store;
  id v4 = objc_allocWithZone((Class)REMStore);
  uint64_t v5 = v1;
  *(void *)&v1[v3] = [v4 initUserInteractive:1];
  uint64_t v6 = OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_contactsProvider;
  sub_100011CC0(0, &qword_10002E730);
  sub_100021B18();
  sub_100021808();
  sub_1000217F8();
  sub_100021838();
  swift_allocObject();
  *(void *)&v5[v6] = sub_100021818();
  uint64_t v7 = OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_timeProvider;
  sub_100021748();
  *(void *)&v5[v7] = swift_allocObject();
  *(void *)&v5[OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_viewModel] = &_swiftEmptyArrayStorage;
  *(void *)&v5[OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_maxContentHeight] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v8 = OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_cachedReminders;
  *(void *)&v5[v8] = sub_100014E80((uint64_t)&_swiftEmptyArrayStorage);

  v11.receiver = v5;
  v11.super_class = (Class)type metadata accessor for TTRIIntentsSnippetViewController();
  [super initWithCoder:a1];

  return v9;
}

id sub_10001C040()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TTRIIntentsSnippetViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for TTRIIntentsSnippetViewController()
{
  return self;
}

void sub_10001C124(unint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for TTRIIntentsSnippetSection();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (void *)((char *)v95 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = sub_10000C984(&qword_10002E600);
  __chkstk_darwin(v10 - 8);
  NSString v12 = (char *)v95 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v96 = [a2 intent];
  self;
  if (!swift_dynamicCastObjCClass())
  {

    id v38 = sub_1000208EC(a2);
    if (!v38 || (v39 = v38, char v40 = sub_100021AA8(), v39, (v40 & 1) != 0))
    {
      sub_10000C984((uint64_t *)&unk_10002E6D0);
      uint64_t v41 = *(void *)(v7 + 72);
      unint64_t v42 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
      uint64_t v43 = swift_allocObject();
      *(_OWORD *)(v43 + 16) = xmmword_100022930;
      unint64_t v44 = v43 + v42;
      NSString v45 = (void *)v43;
      uint64_t v46 = sub_100021888();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v46 - 8) + 56))(v12, 1, 1, v46);
      *id v9 = 0;
      v9[1] = 0;
      sub_100021134((uint64_t)v12, (uint64_t)v9 + *(int *)(v6 + 20));
      unint64_t v47 = swift_bridgeObjectRetain();
      uint64_t v48 = sub_10000DE1C(v47, 0, 0);
      swift_bridgeObjectRelease();
      sub_100011B2C((uint64_t)v12, &qword_10002E600);
      *(void *)((char *)v9 + *(int *)(v6 + 24)) = v48;
      sub_1000211F4((uint64_t)v9, v44, (uint64_t (*)(void))type metadata accessor for TTRIIntentsSnippetSection);
      char v98 = 1;
      uint64_t v49 = v45[2];
      if (!v49)
      {
        swift_bridgeObjectRelease();
        char v50 = _swiftEmptyArrayStorage;
        goto LABEL_77;
      }
      id v96 = v45;
      swift_bridgeObjectRetain();
      char v50 = _swiftEmptyArrayStorage;
      while (1)
      {
        sub_100019920(v44, &v98, v3, &v97);
        uint64_t v51 = v97;
        uint64_t v52 = *(void *)(v97 + 16);
        int64_t v53 = v50[2];
        int64_t v54 = v53 + v52;
        if (__OFADD__(v53, v52)) {
          goto LABEL_86;
        }
        int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        if (isUniquelyReferenced_nonNull_native && v54 <= v50[3] >> 1)
        {
          if (*(void *)(v51 + 16)) {
            goto LABEL_39;
          }
        }
        else
        {
          if (v53 <= v54) {
            int64_t v56 = v53 + v52;
          }
          else {
            int64_t v56 = v53;
          }
          char v50 = (void *)sub_10001E8C0(isUniquelyReferenced_nonNull_native, v56, 1, (unint64_t)v50, &qword_10002E108, (uint64_t (*)(void))type metadata accessor for TTRIIntentsSnippetViewController.ViewModel, (uint64_t (*)(void))type metadata accessor for TTRIIntentsSnippetViewController.ViewModel);
          if (*(void *)(v51 + 16))
          {
LABEL_39:
            uint64_t v57 = v50[2];
            uint64_t v58 = (v50[3] >> 1) - v57;
            uint64_t v59 = *(void *)(type metadata accessor for TTRIIntentsSnippetViewController.ViewModel() - 8);
            uint64_t v60 = *(void *)(v59 + 72);
            if (v58 < v52) {
              goto LABEL_89;
            }
            unint64_t v61 = (*(unsigned __int8 *)(v59 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v59 + 80);
            id v62 = (char *)v50 + v61 + v60 * v57;
            unint64_t v63 = v51 + v61;
            uint64_t v64 = v60 * v52;
            int v65 = &v62[v64];
            unint64_t v66 = v63 + v64;
            if (v63 < (unint64_t)v65 && (unint64_t)v62 < v66) {
              goto LABEL_95;
            }
            swift_arrayInitWithCopy();
            if (v52)
            {
              uint64_t v68 = v50[2];
              BOOL v36 = __OFADD__(v68, v52);
              uint64_t v69 = v68 + v52;
              if (v36) {
                goto LABEL_92;
              }
              v50[2] = v69;
            }
            goto LABEL_29;
          }
        }
        if (v52) {
          goto LABEL_87;
        }
LABEL_29:
        swift_bridgeObjectRelease();
        v44 += v41;
        if (!--v49)
        {
          swift_bridgeObjectRelease_n();
LABEL_77:
          sub_10001985C((uint64_t)v50);
          return;
        }
      }
    }
    int v71 = sub_100003FAC(a1);
    char v98 = 1;
    uint64_t v72 = v71[2];
    if (!v72)
    {
      swift_bridgeObjectRelease();
      uint64_t v75 = _swiftEmptyArrayStorage;
      goto LABEL_80;
    }
    unint64_t v73 = (unint64_t)v71
        + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
    uint64_t v74 = *(void *)(v7 + 72);
    id v96 = v71;
    swift_bridgeObjectRetain();
    uint64_t v75 = _swiftEmptyArrayStorage;
    while (1)
    {
      sub_100019920(v73, &v98, v3, &v97);
      uint64_t v76 = v97;
      uint64_t v77 = *(void *)(v97 + 16);
      int64_t v78 = v75[2];
      int64_t v79 = v78 + v77;
      if (__OFADD__(v78, v77)) {
        goto LABEL_90;
      }
      int v80 = swift_isUniquelyReferenced_nonNull_native();
      if (v80 && v79 <= v75[3] >> 1)
      {
        if (*(void *)(v76 + 16)) {
          goto LABEL_67;
        }
      }
      else
      {
        if (v78 <= v79) {
          int64_t v81 = v78 + v77;
        }
        else {
          int64_t v81 = v78;
        }
        uint64_t v75 = (void *)sub_10001E8C0(v80, v81, 1, (unint64_t)v75, &qword_10002E108, (uint64_t (*)(void))type metadata accessor for TTRIIntentsSnippetViewController.ViewModel, (uint64_t (*)(void))type metadata accessor for TTRIIntentsSnippetViewController.ViewModel);
        if (*(void *)(v76 + 16))
        {
LABEL_67:
          uint64_t v82 = v75[2];
          uint64_t v83 = (v75[3] >> 1) - v82;
          uint64_t v84 = *(void *)(type metadata accessor for TTRIIntentsSnippetViewController.ViewModel() - 8);
          uint64_t v85 = *(void *)(v84 + 72);
          if (v83 < v77) {
            goto LABEL_93;
          }
          unint64_t v86 = (*(unsigned __int8 *)(v84 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v84 + 80);
          uint64_t v87 = (char *)v75 + v86 + v85 * v82;
          unint64_t v88 = v76 + v86;
          uint64_t v89 = v85 * v77;
          uint64_t v90 = &v87[v89];
          unint64_t v91 = v88 + v89;
          if (v88 < (unint64_t)v90 && (unint64_t)v87 < v91) {
            goto LABEL_95;
          }
          swift_arrayInitWithCopy();
          if (v77)
          {
            uint64_t v93 = v75[2];
            BOOL v36 = __OFADD__(v93, v77);
            uint64_t v94 = v93 + v77;
            if (v36) {
              goto LABEL_94;
            }
            v75[2] = v94;
          }
          goto LABEL_57;
        }
      }
      if (v77) {
        goto LABEL_91;
      }
LABEL_57:
      swift_bridgeObjectRelease();
      v73 += v74;
      if (!--v72)
      {
        swift_bridgeObjectRelease_n();
LABEL_80:
        sub_10001985C((uint64_t)v75);
        return;
      }
    }
  }
  id v13 = sub_10001DD14(a1);
  char v98 = 1;
  uint64_t v14 = v13[2];
  if (!v14)
  {
    swift_bridgeObjectRelease();
    id v17 = _swiftEmptyArrayStorage;
LABEL_50:
    sub_10001985C((uint64_t)v17);
    id v70 = v96;

    return;
  }
  unint64_t v15 = (unint64_t)v13
      + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  uint64_t v16 = *(void *)(v7 + 72);
  v95[1] = v13;
  swift_bridgeObjectRetain();
  id v17 = _swiftEmptyArrayStorage;
  while (1)
  {
    sub_100019920(v15, &v98, v3, &v97);
    uint64_t v18 = v97;
    uint64_t v19 = *(void *)(v97 + 16);
    int64_t v20 = v17[2];
    int64_t v21 = v20 + v19;
    if (__OFADD__(v20, v19)) {
      break;
    }
    int v22 = swift_isUniquelyReferenced_nonNull_native();
    if (v22 && v21 <= v17[3] >> 1)
    {
      if (*(void *)(v18 + 16)) {
        goto LABEL_15;
      }
    }
    else
    {
      if (v20 <= v21) {
        int64_t v23 = v20 + v19;
      }
      else {
        int64_t v23 = v20;
      }
      id v17 = (void *)sub_10001E8C0(v22, v23, 1, (unint64_t)v17, &qword_10002E108, (uint64_t (*)(void))type metadata accessor for TTRIIntentsSnippetViewController.ViewModel, (uint64_t (*)(void))type metadata accessor for TTRIIntentsSnippetViewController.ViewModel);
      if (*(void *)(v18 + 16))
      {
LABEL_15:
        uint64_t v24 = v17[2];
        uint64_t v25 = (v17[3] >> 1) - v24;
        uint64_t v26 = *(void *)(type metadata accessor for TTRIIntentsSnippetViewController.ViewModel() - 8);
        uint64_t v27 = *(void *)(v26 + 72);
        if (v25 < v19) {
          goto LABEL_85;
        }
        unint64_t v28 = (*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
        uint64_t v29 = (char *)v17 + v28 + v27 * v24;
        unint64_t v30 = v18 + v28;
        uint64_t v31 = v27 * v19;
        uint64_t v32 = &v29[v31];
        unint64_t v33 = v30 + v31;
        if (v30 < (unint64_t)v32 && (unint64_t)v29 < v33) {
          goto LABEL_95;
        }
        swift_arrayInitWithCopy();
        if (v19)
        {
          uint64_t v35 = v17[2];
          BOOL v36 = __OFADD__(v35, v19);
          uint64_t v37 = v35 + v19;
          if (v36) {
            goto LABEL_88;
          }
          v17[2] = v37;
        }
        goto LABEL_5;
      }
    }
    if (v19) {
      goto LABEL_84;
    }
LABEL_5:
    swift_bridgeObjectRelease();
    v15 += v16;
    if (!--v14)
    {
      swift_bridgeObjectRelease_n();
      goto LABEL_50;
    }
  }
  __break(1u);
LABEL_84:
  __break(1u);
LABEL_85:
  __break(1u);
LABEL_86:
  __break(1u);
LABEL_87:
  __break(1u);
LABEL_88:
  __break(1u);
LABEL_89:
  __break(1u);
LABEL_90:
  __break(1u);
LABEL_91:
  __break(1u);
LABEL_92:
  __break(1u);
LABEL_93:
  __break(1u);
LABEL_94:
  __break(1u);
LABEL_95:
  sub_100021E78();
  __break(1u);
}

double sub_10001C984(char a1, double a2, double a3, double a4, CGFloat a5)
{
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (!Strong) {
    return 0.0;
  }
  uint64_t v11 = Strong;
  [Strong contentSize];
  [v11 setFrame:0.0, 0.0, a4, a5];
  sub_1000209D4(v11, a1 & 1, a5);
  if (*(double *)(v5 + OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_maxContentHeight) > v12) {
    double v13 = *(double *)(v5
  }
                    + OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_maxContentHeight);
  else {
    double v13 = v12;
  }
  *(double *)(v5 + OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_maxContentHeight) = v13;
  if (qword_10002E048 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_1000218E8();
  sub_10001430C(v14, (uint64_t)qword_10002E460);
  unint64_t v15 = sub_1000218D8();
  os_log_type_t v16 = sub_100021AC8();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    *(_DWORD *)uint64_t v17 = 136446722;
    uint64_t v22 = v18;
    type metadata accessor for CGSize(0);
    sub_100021DC8();
    sub_10001EB40(0, 0xE000000000000000, &v22);
    sub_100021C58();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 2082;
    uint64_t v19 = sub_100021A68();
    sub_10001EB40(v19, v20, &v22);
    sub_100021C58();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 22) = 2082;
    sub_100021DC8();
    sub_10001EB40(0, 0xE000000000000000, &v22);
    sub_100021C58();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "preferred content size {originalContentSize: %{public}s, tableContentHeight: %{public}s, preferredContentSize: %{public}s}", (uint8_t *)v17, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  return a2;
}

char *sub_10001CEC0(char *a1, char **a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    *(void *)a1 = *a2;
    a1 = &v18[(v5 + 16) & ~(unint64_t)v5];
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = *a2;
      uint64_t v7 = a2[1];
      *(void *)a1 = *a2;
      *((void *)a1 + 1) = v7;
      uint64_t v8 = a2[2];
      *((void *)a1 + 2) = v8;
      *((_DWORD *)a1 + 6) = *((_DWORD *)a2 + 6);
      id v9 = a2[5];
      *((void *)a1 + 4) = a2[4];
      *((void *)a1 + 5) = v9;
      uint64_t v10 = a2[7];
      *((void *)a1 + 6) = a2[6];
      *((void *)a1 + 7) = v10;
      uint64_t v11 = a2[9];
      *((void *)a1 + 8) = a2[8];
      *((void *)a1 + 9) = v11;
      int v12 = *((unsigned __int8 *)a2 + 96);
      double v13 = v6;
      uint64_t v14 = v7;
      unint64_t v15 = v8;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v12 == 255)
      {
        *((_OWORD *)a1 + 5) = *((_OWORD *)a2 + 5);
        a1[96] = *((unsigned char *)a2 + 96);
      }
      else
      {
        os_log_type_t v16 = a2[10];
        uint64_t v17 = (uint64_t)a2[11];
        sub_1000143B8(v16, v17, v12);
        *((void *)a1 + 10) = v16;
        *((void *)a1 + 11) = v17;
        a1[96] = v12;
      }
      uint64_t v27 = a2[13];
      *((void *)a1 + 13) = v27;
      a1[112] = *((unsigned char *)a2 + 112);
      unint64_t v28 = a2[15];
      uint64_t v29 = a2[16];
      *((void *)a1 + 15) = v28;
      *((void *)a1 + 16) = v29;
      unint64_t v30 = v27;
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v19 = a2[1];
      *(void *)a1 = *a2;
      *((void *)a1 + 1) = v19;
      swift_bridgeObjectRetain();
      uint64_t v20 = sub_10000C984(&qword_10002E5F8);
      uint64_t v21 = *(int *)(v20 + 48);
      uint64_t v22 = &a1[v21];
      int64_t v23 = (char *)a2 + v21;
      uint64_t v24 = sub_100021888();
      uint64_t v25 = *(void *)(v24 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24))
      {
        uint64_t v26 = sub_10000C984(&qword_10002E600);
        memcpy(v22, v23, *(void *)(*(void *)(v26 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v22, v23, v24);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
      }
      a1[*(int *)(v20 + 64)] = *((unsigned char *)a2 + *(int *)(v20 + 64));
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_10001D14C(uint64_t a1)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    int v2 = *(unsigned __int8 *)(a1 + 96);
    if (v2 != 255) {
      sub_100014450(*(void **)(a1 + 80), *(void *)(a1 + 88), v2);
    }

    return swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v4 = a1 + *(int *)(sub_10000C984(&qword_10002E5F8) + 48);
    uint64_t v5 = sub_100021888();
    uint64_t v7 = *(void *)(v5 - 8);
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v4, 1, v5);
    if (!result)
    {
      uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8);
      return v6(v4, v5);
    }
  }
  return result;
}

uint64_t sub_10001D2A0(uint64_t a1, uint64_t a2)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = *(void **)a2;
    uint64_t v5 = *(void **)(a2 + 8);
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v5;
    uint64_t v6 = *(void **)(a2 + 16);
    *(void *)(a1 + 16) = v6;
    *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
    uint64_t v7 = *(void *)(a2 + 40);
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    *(void *)(a1 + 40) = v7;
    uint64_t v8 = *(void *)(a2 + 56);
    *(void *)(a1 + 48) = *(void *)(a2 + 48);
    *(void *)(a1 + 56) = v8;
    uint64_t v9 = *(void *)(a2 + 72);
    *(void *)(a1 + 64) = *(void *)(a2 + 64);
    *(void *)(a1 + 72) = v9;
    int v10 = *(unsigned __int8 *)(a2 + 96);
    id v11 = v4;
    id v12 = v5;
    id v13 = v6;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v10 == 255)
    {
      *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
      *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
    }
    else
    {
      uint64_t v14 = *(void **)(a2 + 80);
      uint64_t v15 = *(void *)(a2 + 88);
      sub_1000143B8(v14, v15, v10);
      *(void *)(a1 + 80) = v14;
      *(void *)(a1 + 88) = v15;
      *(unsigned char *)(a1 + 96) = v10;
    }
    uint64_t v24 = *(void **)(a2 + 104);
    *(void *)(a1 + 104) = v24;
    *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
    uint64_t v25 = *(void *)(a2 + 120);
    uint64_t v26 = *(void *)(a2 + 128);
    *(void *)(a1 + 120) = v25;
    *(void *)(a1 + 128) = v26;
    id v27 = v24;
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v16 = *(void *)(a2 + 8);
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v16;
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_10000C984(&qword_10002E5F8);
    uint64_t v18 = *(int *)(v17 + 48);
    uint64_t v19 = (void *)(a1 + v18);
    uint64_t v20 = (const void *)(a2 + v18);
    uint64_t v21 = sub_100021888();
    uint64_t v22 = *(void *)(v21 - 8);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
    {
      uint64_t v23 = sub_10000C984(&qword_10002E600);
      memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v22 + 16))(v19, v20, v21);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
    }
    *(unsigned char *)(a1 + *(int *)(v17 + 64)) = *(unsigned char *)(a2 + *(int *)(v17 + 64));
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_10001D4D4(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_10001D760(a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v4 = *(void **)a2;
      *(void *)a1 = *(void *)a2;
      uint64_t v5 = *(void **)(a2 + 8);
      *(void *)(a1 + 8) = v5;
      uint64_t v6 = *(void **)(a2 + 16);
      *(void *)(a1 + 16) = v6;
      *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
      *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
      *(unsigned char *)(a1 + 26) = *(unsigned char *)(a2 + 26);
      *(unsigned char *)(a1 + 27) = *(unsigned char *)(a2 + 27);
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      *(void *)(a1 + 40) = *(void *)(a2 + 40);
      *(void *)(a1 + 48) = *(void *)(a2 + 48);
      *(void *)(a1 + 56) = *(void *)(a2 + 56);
      *(void *)(a1 + 64) = *(void *)(a2 + 64);
      *(void *)(a1 + 72) = *(void *)(a2 + 72);
      int v7 = *(unsigned __int8 *)(a2 + 96);
      id v8 = v4;
      id v9 = v5;
      id v10 = v6;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v7 == 255)
      {
        long long v20 = *(_OWORD *)(a2 + 80);
        *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
        *(_OWORD *)(a1 + 80) = v20;
      }
      else
      {
        id v11 = *(void **)(a2 + 80);
        uint64_t v12 = *(void *)(a2 + 88);
        sub_1000143B8(v11, v12, v7);
        *(void *)(a1 + 80) = v11;
        *(void *)(a1 + 88) = v12;
        *(unsigned char *)(a1 + 96) = v7;
      }
      uint64_t v21 = *(void **)(a2 + 104);
      *(void *)(a1 + 104) = v21;
      *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
      *(void *)(a1 + 120) = *(void *)(a2 + 120);
      *(void *)(a1 + 128) = *(void *)(a2 + 128);
      id v22 = v21;
      swift_bridgeObjectRetain();
    }
    else
    {
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = *(void *)(a2 + 8);
      swift_bridgeObjectRetain();
      uint64_t v13 = sub_10000C984(&qword_10002E5F8);
      uint64_t v14 = *(int *)(v13 + 48);
      uint64_t v15 = (void *)(a1 + v14);
      uint64_t v16 = (const void *)(a2 + v14);
      uint64_t v17 = sub_100021888();
      uint64_t v18 = *(void *)(v17 - 8);
      if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
      {
        uint64_t v19 = sub_10000C984(&qword_10002E600);
        memcpy(v15, v16, *(void *)(*(void *)(v19 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, const void *, uint64_t))(v18 + 16))(v15, v16, v17);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
      }
      *(unsigned char *)(a1 + *(int *)(v13 + 64)) = *(unsigned char *)(a2 + *(int *)(v13 + 64));
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_10001D760(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TTRIIntentsSnippetViewController.ViewModel();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for TTRIIntentsSnippetViewController.ViewModel()
{
  uint64_t result = qword_10002E678;
  if (!qword_10002E678) {
    return swift_getSingletonMetadata();
  }
  return result;
}

_OWORD *sub_10001D808(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    *a1 = *a2;
    uint64_t v6 = sub_10000C984(&qword_10002E5F8);
    uint64_t v7 = *(int *)(v6 + 48);
    id v8 = (char *)a1 + v7;
    id v9 = (char *)a2 + v7;
    uint64_t v10 = sub_100021888();
    uint64_t v11 = *(void *)(v10 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
    {
      uint64_t v12 = sub_10000C984(&qword_10002E600);
      memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
    }
    *((unsigned char *)a1 + *(int *)(v6 + 64)) = *((unsigned char *)a2 + *(int *)(v6 + 64));
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *sub_10001D98C(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_10001D760((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      *a1 = *a2;
      uint64_t v6 = sub_10000C984(&qword_10002E5F8);
      uint64_t v7 = *(int *)(v6 + 48);
      id v8 = (char *)a1 + v7;
      id v9 = (char *)a2 + v7;
      uint64_t v10 = sub_100021888();
      uint64_t v11 = *(void *)(v10 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
      {
        uint64_t v12 = sub_10000C984(&qword_10002E600);
        memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      }
      *((unsigned char *)a1 + *(int *)(v6 + 64)) = *((unsigned char *)a2 + *(int *)(v6 + 64));
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_10001DB20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_10001DB48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_10001DB74()
{
  return swift_storeEnumTagMultiPayload();
}

void sub_10001DB84()
{
  sub_1000127F0();
  if (v0 <= 0x3F)
  {
    swift_getTupleTypeLayout3();
    v1[4] = v1;
    v1[5] = &unk_100022ED0;
    swift_initEnumMetadataMultiPayload();
  }
}

void sub_10001DC30(char a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  if (a2)
  {
    sub_100011CC0(0, &qword_10002E6B8);
    sub_10002125C(&qword_10002E6C0, &qword_10002E6B8);
    v9.super.Class isa = sub_100021A78().super.isa;
  }
  else
  {
    v9.super.Class isa = 0;
  }
  Class isa = v9.super.isa;
  (*(void (**)(uint64_t, void, double, double))(a3 + 16))(a3, a1 & 1, a4, a5);
}

uint64_t sub_10001DD0C()
{
  return 0;
}

void *sub_10001DD14(unint64_t a1)
{
  uint64_t v3 = type metadata accessor for TTRIIntentsSnippetSection();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (void *)((char *)&v18[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = sub_10000C984(&qword_10002E600);
  __chkstk_darwin(v7 - 8);
  NSSet v9 = (char *)&v18[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)(v1 + OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_timeProvider);
  v18[3] = sub_100021748();
  v18[4] = &protocol witness table for TTRCurrentTimeProvider;
  v18[0] = v10;
  swift_retain();
  LOBYTE(v10) = sub_100021B48();
  sub_10002119C((uint64_t)v18);
  if (v10) {
    return (void *)sub_100003120(a1);
  }
  if (sub_100021B78()) {
    return sub_100002614(a1);
  }
  if (sub_100021B58()) {
    return (void *)sub_10000E720(a1);
  }
  if (sub_100021B68()) {
    return sub_100003FAC(a1);
  }
  sub_10000C984((uint64_t *)&unk_10002E6D0);
  unint64_t v12 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_100022930;
  uint64_t v13 = sub_100021888();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v9, 1, 1, v13);
  void *v6 = 0;
  v6[1] = 0;
  sub_100021134((uint64_t)v9, (uint64_t)v6 + *(int *)(v3 + 20));
  unint64_t v14 = swift_bridgeObjectRetain();
  uint64_t v15 = sub_10000DE1C(v14, 0, 0);
  swift_bridgeObjectRelease();
  sub_100011B2C((uint64_t)v9, &qword_10002E600);
  *(void *)((char *)v6 + *(int *)(v3 + 24)) = v15;
  sub_1000211F4((uint64_t)v6, v11 + v12, (uint64_t (*)(void))type metadata accessor for TTRIIntentsSnippetSection);
  return (void *)v11;
}

void sub_10001DFA4(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = sub_10001B898(*(void **)a2);
  if (v5)
  {
    uint64_t v6 = v5;
    swift_beginAccess();
    uint64_t v7 = (void *)sub_10001F198((unint64_t)v4);
    swift_endAccess();

    sub_1000154E8(0, 0, (*(unsigned char *)(a2 + 16) & 1) == 0, 2, 2, 2, 0, 0, (uint64_t)v22, 0, 0, 0, 0, 0, 0, 255, 0, 2, 0,
      0);
    v20[4] = v22[4];
    v20[5] = v22[5];
    v20[6] = v22[6];
    v20[7] = v22[7];
    v20[0] = v22[0];
    v20[1] = v22[1];
    v20[2] = v22[2];
    v20[3] = v22[3];
    nullsub_2(v20);
    uint64_t v8 = (uint64_t)a1 + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_viewModel;
    swift_beginAccess();
    sub_100018F48(v8, (uint64_t)v21);
    sub_100018F48((uint64_t)v20, v8);
    sub_1000195E4((uint64_t)v22);
    sub_100021308((uint64_t)v21);
    sub_100016914();
    sub_100021364((uint64_t)v22);
    uint64_t v9 = sub_100021718();
    __chkstk_darwin(v9);
    uint64_t v10 = swift_allocObject();
    long long v11 = *(_OWORD *)(a2 + 80);
    *(_OWORD *)(v10 + 88) = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(v10 + 104) = v11;
    long long v12 = *(_OWORD *)(a2 + 112);
    *(_OWORD *)(v10 + 120) = *(_OWORD *)(a2 + 96);
    *(_OWORD *)(v10 + 136) = v12;
    long long v13 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(v10 + 24) = *(_OWORD *)a2;
    *(_OWORD *)(v10 + 40) = v13;
    long long v14 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(v10 + 56) = *(_OWORD *)(a2 + 32);
    *(void *)(v10 + 16) = a1;
    *(_OWORD *)(v10 + 72) = v14;
    id v15 = a1;
    sub_1000195E4(a2);
    sub_1000216F8();

    swift_release();
  }
  else
  {
    if (qword_10002E048 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_1000218E8();
    sub_10001430C(v16, (uint64_t)qword_10002E460);
    uint64_t v19 = sub_1000218D8();
    os_log_type_t v17 = sub_100021AD8();
    if (os_log_type_enabled(v19, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, v17, "didn't get reminder object on toggle request", v18, 2u);
      swift_slowDealloc();
    }
  }
}

uint64_t sub_10001E2F0(uint64_t a1, uint64_t a2, long long *a3)
{
  long long v6 = a3[5];
  long long v45 = a3[4];
  long long v46 = v6;
  long long v7 = a3[7];
  long long v47 = a3[6];
  long long v48 = v7;
  long long v8 = a3[1];
  long long v41 = *a3;
  long long v42 = v8;
  long long v9 = a3[3];
  long long v43 = a3[2];
  long long v44 = v9;
  uint64_t v10 = sub_1000218E8();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  long long v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    swift_errorRetain();
    if (qword_10002E048 != -1) {
      swift_once();
    }
    sub_10001430C(v10, (uint64_t)qword_10002E460);
    swift_errorRetain();
    swift_errorRetain();
    long long v14 = sub_1000218D8();
    os_log_type_t v15 = sub_100021AD8();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = swift_slowAlloc();
      uint64_t v38 = a2;
      os_log_type_t v17 = (uint8_t *)v16;
      v40[0] = swift_slowAlloc();
      *(_DWORD *)os_log_type_t v17 = 136315138;
      uint64_t v37 = v17 + 4;
      swift_getErrorValue();
      uint64_t v18 = sub_100021EE8();
      *(void *)&v39[0] = sub_10001EB40(v18, v19, v40);
      sub_100021C58();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Failed toggling reminder complete: %s", v17, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      a2 = v38;
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    v39[5] = v46;
    v39[6] = v47;
    v39[7] = v48;
    v39[0] = v41;
    v39[1] = v42;
    v39[2] = v43;
    v39[3] = v44;
    v39[4] = v45;
    nullsub_2(v39);
    uint64_t v33 = a2 + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_viewModel;
    swift_beginAccess();
    sub_100018F48(v33, (uint64_t)v40);
    sub_100018F48((uint64_t)v39, v33);
    sub_1000195E4((uint64_t)a3);
    sub_1000195E4((uint64_t)a3);
    sub_100021308((uint64_t)v40);
    sub_100016914();
    sub_100021364((uint64_t)a3);
    return swift_errorRelease();
  }
  else
  {
    if (qword_10002E048 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_10001430C(v10, (uint64_t)qword_10002E460);
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v20, v10);
    sub_1000195E4((uint64_t)a3);
    sub_1000195E4((uint64_t)a3);
    sub_1000195E4((uint64_t)a3);
    sub_1000195E4((uint64_t)a3);
    uint64_t v21 = sub_1000218D8();
    os_log_type_t v22 = sub_100021AC8();
    int v23 = v22;
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v24 = swift_slowAlloc();
      LODWORD(v37) = v23;
      uint64_t v25 = v24;
      uint64_t v26 = (void *)swift_slowAlloc();
      uint64_t v38 = swift_slowAlloc();
      v40[0] = v38;
      *(_DWORD *)uint64_t v25 = 138412546;
      uint64_t v35 = v11;
      os_log_t v36 = v21;
      *(void *)&v39[0] = *(void *)a3;
      uint64_t v27 = *(void *)&v39[0];
      id v28 = *(id *)&v39[0];
      sub_100021C58();
      *uint64_t v26 = v27;
      sub_100021364((uint64_t)a3);
      sub_100021364((uint64_t)a3);
      *(_WORD *)(v25 + 12) = 2080;
      if (a3[1]) {
        uint64_t v29 = 20302;
      }
      else {
        uint64_t v29 = 5457241;
      }
      if (a3[1]) {
        unint64_t v30 = 0xE200000000000000;
      }
      else {
        unint64_t v30 = 0xE300000000000000;
      }
      *(void *)&v39[0] = sub_10001EB40(v29, v30, v40);
      sub_100021C58();
      swift_bridgeObjectRelease();
      sub_100021364((uint64_t)a3);
      sub_100021364((uint64_t)a3);
      os_log_t v31 = v36;
      _os_log_impl((void *)&_mh_execute_header, v36, (os_log_type_t)v37, "toggle complete for reminder {reminderID: %@}, {expected completed: %s}", (uint8_t *)v25, 0x16u);
      sub_10000C984(&qword_10002E6E8);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v13, v10);
    }
    else
    {
      sub_100021364((uint64_t)a3);
      sub_100021364((uint64_t)a3);
      sub_100021364((uint64_t)a3);
      sub_100021364((uint64_t)a3);

      return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    }
  }
}

uint64_t sub_10001E89C(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_10001E8C0(a1, a2, a3, a4, (uint64_t *)&unk_10002E6D0, (uint64_t (*)(void))type metadata accessor for TTRIIntentsSnippetSection, (uint64_t (*)(void))type metadata accessor for TTRIIntentsSnippetSection);
}

uint64_t sub_10001E8C0(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void))
{
  if (a3)
  {
    unint64_t v11 = *(void *)(a4 + 24);
    uint64_t v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v12 = a2;
      }
    }
  }
  else
  {
    uint64_t v12 = a2;
  }
  uint64_t v13 = *(void *)(a4 + 16);
  if (v12 <= v13) {
    uint64_t v14 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v14 = v12;
  }
  if (!v14)
  {
    uint64_t v18 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_10000C984(a5);
  uint64_t v15 = *(void *)(a6(0) - 8);
  uint64_t v16 = *(void *)(v15 + 72);
  unint64_t v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v18 = (void *)swift_allocObject();
  size_t v19 = j__malloc_size(v18);
  if (!v16 || (v19 - v17 == 0x8000000000000000 ? (BOOL v20 = v16 == -1) : (BOOL v20 = 0), v20))
  {
LABEL_29:
    uint64_t result = sub_100021E18();
    __break(1u);
    return result;
  }
  v18[2] = v13;
  v18[3] = 2 * ((uint64_t)(v19 - v17) / v16);
LABEL_19:
  uint64_t v21 = *(void *)(a6(0) - 8);
  unint64_t v22 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  unint64_t v23 = (unint64_t)v18 + v22;
  if (a1)
  {
    if ((unint64_t)v18 < a4 || v23 >= a4 + v22 + *(void *)(v21 + 72) * v13)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v18 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_10001FAA4(0, v13, v23, a4, a7);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v18;
}

uint64_t sub_10001EB40(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10001EC14(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1000210D8((uint64_t)v12, *a3);
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
      sub_1000210D8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10002119C((uint64_t)v12);
  return v7;
}

uint64_t sub_10001EC14(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100021C68();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10001EDD0(a5, a6);
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
  uint64_t v8 = sub_100021D68();
  if (!v8)
  {
    sub_100021E18();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100021E78();
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

uint64_t sub_10001EDD0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10001EE68(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10001F048(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10001F048(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10001EE68(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10001EFE0(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100021D38();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100021E18();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1000219E8();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100021E78();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100021E18();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10001EFE0(uint64_t a1, uint64_t a2)
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
  sub_10000C984(&qword_10002E6C8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10001F048(char a1, int64_t a2, char a3, char *a4)
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
    sub_10000C984(&qword_10002E6C8);
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
  uint64_t result = sub_100021E78();
  __break(1u);
  return result;
}

uint64_t sub_10001F198(unint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  if ((v4 & 0xC000000000000001) == 0)
  {
LABEL_8:
    swift_bridgeObjectRetain();
    a1 = sub_100005314(a1);
    char v13 = v12;
    swift_bridgeObjectRelease();
    if (v13)
    {
      int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      Swift::Int v9 = *v2;
      Swift::Int v17 = *v2;
      Swift::Int *v2 = 0x8000000000000000;
      if (!isUniquelyReferenced_nonNull_native)
      {
        sub_10001F6F0();
        Swift::Int v9 = v17;
      }
      goto LABEL_11;
    }
    return 0;
  }
  if (v4 < 0) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = v4 & 0xFFFFFFFFFFFFFF8;
  }
  swift_bridgeObjectRetain();
  id v6 = (id)a1;
  uint64_t v7 = sub_100021DF8();

  if (!v7)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_unknownObjectRelease();
  uint64_t v8 = sub_100021DE8();
  Swift::Int v9 = sub_10001F2E8(v5, v8);
  swift_retain();
  a1 = sub_100005314((uint64_t)v6);
  char v11 = v10;
  swift_release();
  if ((v11 & 1) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
LABEL_11:

  uint64_t v15 = *(void *)(*(void *)(v9 + 56) + 8 * a1);
  sub_10001F53C(a1, v9);
  Swift::Int *v2 = v9;
  swift_bridgeObjectRelease();
  return v15;
}

Swift::Int sub_10001F2E8(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_10000C984((uint64_t *)&unk_10002E720);
    uint64_t v2 = sub_100021E58();
    uint64_t v18 = v2;
    sub_100021DD8();
    uint64_t v3 = sub_100021E08();
    if (v3)
    {
      uint64_t v4 = v3;
      sub_100011CC0(0, (unint64_t *)&unk_10002E6F0);
      do
      {
        swift_dynamicCast();
        sub_100011CC0(0, &qword_10002E6E0);
        swift_dynamicCast();
        uint64_t v2 = v18;
        unint64_t v12 = *(void *)(v18 + 16);
        if (*(void *)(v18 + 24) <= v12)
        {
          sub_100005ECC(v12 + 1, 1);
          uint64_t v2 = v18;
        }
        Swift::Int result = sub_100021C08(*(void *)(v2 + 40));
        uint64_t v6 = v2 + 64;
        uint64_t v7 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v8 = result & ~v7;
        unint64_t v9 = v8 >> 6;
        if (((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6))) != 0)
        {
          unint64_t v10 = __clz(__rbit64((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6)))) | v8 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v13 = 0;
          unint64_t v14 = (unint64_t)(63 - v7) >> 6;
          do
          {
            if (++v9 == v14 && (v13 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v15 = v9 == v14;
            if (v9 == v14) {
              unint64_t v9 = 0;
            }
            v13 |= v15;
            uint64_t v16 = *(void *)(v6 + 8 * v9);
          }
          while (v16 == -1);
          unint64_t v10 = __clz(__rbit64(~v16)) + (v9 << 6);
        }
        *(void *)(v6 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
        uint64_t v11 = 8 * v10;
        *(void *)(*(void *)(v2 + 48) + v11) = v17;
        *(void *)(*(void *)(v2 + 56) + v11) = v4;
        ++*(void *)(v2 + 16);
        uint64_t v4 = sub_100021E08();
      }
      while (v4);
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return (Swift::Int)&_swiftEmptyDictionarySingleton;
  }
  return v2;
}

void sub_10001F53C(unint64_t a1, uint64_t a2)
{
  int64_t v3 = a1;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (a1 + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t v8 = sub_100021C88();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        Swift::Int v10 = *(void *)(a2 + 40);
        id v11 = *(id *)(*(void *)(a2 + 48) + 8 * v6);
        Swift::Int v12 = sub_100021C08(v10);

        Swift::Int v13 = v12 & v7;
        if (v3 >= (uint64_t)v9)
        {
          if (v13 >= v9 && v3 >= v13)
          {
LABEL_16:
            uint64_t v16 = *(void *)(a2 + 48);
            uint64_t v17 = (void *)(v16 + 8 * v3);
            uint64_t v18 = (void *)(v16 + 8 * v6);
            if (v3 != v6 || v17 >= v18 + 1) {
              *uint64_t v17 = *v18;
            }
            uint64_t v19 = *(void *)(a2 + 56);
            BOOL v20 = (void *)(v19 + 8 * v3);
            uint64_t v21 = (void *)(v19 + 8 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v20 >= v21 + 1))
            {
              void *v20 = *v21;
              int64_t v3 = v6;
            }
          }
        }
        else if (v13 >= v9 || v3 >= v13)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v22 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v23 = *v22;
    uint64_t v24 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v22 = (uint64_t *)(v4 + 8 * (a1 >> 6));
    uint64_t v24 = *v22;
    uint64_t v23 = (-1 << a1) - 1;
  }
  *unint64_t v22 = v24 & v23;
  uint64_t v25 = *(void *)(a2 + 16);
  BOOL v26 = __OFSUB__(v25, 1);
  uint64_t v27 = v25 - 1;
  if (v26)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v27;
    ++*(_DWORD *)(a2 + 36);
  }
}

id sub_10001F6F0()
{
  uint64_t v1 = v0;
  sub_10000C984((uint64_t *)&unk_10002E720);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100021E38();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
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
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = *(void **)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(void *)(*(void *)(v4 + 56) + v16) = v18;
    id v19 = v17;
    id result = v18;
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

void sub_10001F898(void **a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = sub_10001B898(*a1);
  if (v3)
  {
    oslog = v3;
    id v4 = [v3 userActivity];
    if (v4)
    {
      uint64_t v5 = v4;
      sub_100021B08();
    }
  }
  else
  {
    if (qword_10002E048 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_1000218E8();
    sub_10001430C(v6, (uint64_t)qword_10002E460);
    sub_1000195E4((uint64_t)a1);
    sub_1000195E4((uint64_t)a1);
    oslog = sub_1000218D8();
    os_log_type_t v7 = sub_100021AD8();
    if (os_log_type_enabled(oslog, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      int64_t v9 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v8 = 138412290;
      id v10 = v2;
      sub_100021C58();
      *int64_t v9 = v2;
      sub_100021364((uint64_t)a1);
      sub_100021364((uint64_t)a1);
      _os_log_impl((void *)&_mh_execute_header, oslog, v7, "Didn't get reminder object on app link launch request {id: %@}", v8, 0xCu);
      sub_10000C984(&qword_10002E6E8);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return;
    }
    sub_100021364((uint64_t)a1);
    sub_100021364((uint64_t)a1);
  }
}

uint64_t sub_10001FAA4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = *(void *)(a5(0) - 8);
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
  uint64_t result = sub_100021E78();
  __break(1u);
  return result;
}

void *sub_10001FC00(unint64_t a1, void (*a2)(unint64_t, id), uint64_t a3)
{
  int64_t v20 = a2;
  uint64_t v21 = a3;
  uint64_t v4 = type metadata accessor for TTRIIntentsSnippetViewController.ViewModel();
  uint64_t v19 = *(void *)(v4 - 8);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v22 = _swiftEmptyArrayStorage;
  sub_10000AE24(0, 0, 0);
  os_log_type_t v7 = v22;
  if (a1 >> 62) {
    goto LABEL_15;
  }
  uint64_t v8 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v8)
  {
    while (1)
    {
      unint64_t v9 = 0;
      uint64_t v17 = a1 & 0xFFFFFFFFFFFFFF8;
      unint64_t v18 = a1 & 0xC000000000000001;
      while (v18)
      {
        id v10 = (id)sub_100021D48();
LABEL_7:
        uint64_t v11 = v10;
        unint64_t v12 = v9 + 1;
        if (__OFADD__(v9, 1)) {
          goto LABEL_14;
        }
        v20(v9, v10);

        int64_t v22 = v7;
        unint64_t v14 = v7[2];
        unint64_t v13 = v7[3];
        if (v14 >= v13 >> 1)
        {
          sub_10000AE24(v13 > 1, v14 + 1, 1);
          os_log_type_t v7 = v22;
        }
        v7[2] = v14 + 1;
        sub_1000211F4((uint64_t)v6, (uint64_t)v7+ ((*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80))+ *(void *)(v19 + 72) * v14, (uint64_t (*)(void))type metadata accessor for TTRIIntentsSnippetViewController.ViewModel);
        ++v9;
        if (v12 == v8) {
          goto LABEL_16;
        }
      }
      if (v9 < *(void *)(v17 + 16)) {
        break;
      }
      __break(1u);
LABEL_14:
      __break(1u);
LABEL_15:
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_100021E28();
      if (!v8) {
        goto LABEL_16;
      }
    }
    id v10 = *(id *)(a1 + 8 * v9 + 32);
    goto LABEL_7;
  }
LABEL_16:
  swift_bridgeObjectRelease();
  return v7;
}

id sub_10001FE28(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1000216B8();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  id v10 = (char *)v39 - v9;
  uint64_t v11 = type metadata accessor for TTRIIntentsSnippetViewController.ViewModel();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  unint64_t v14 = (char *)v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100021698();
  uint64_t v16 = OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_viewModel;
  if (v15 < *(void *)(*(void *)(v2
                                   + OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_viewModel)
                       + 16))
  {
    unint64_t v17 = sub_100021698();
    if ((v17 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else
    {
      uint64_t v18 = *(void *)(v2 + v16);
      if (v17 < *(void *)(v18 + 16))
      {
        sub_100021404(v18+ ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80))+ *(void *)(v12 + 72) * v17, (uint64_t)v14);
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          uint64_t v19 = *(void **)v14;
          long long v20 = *(_OWORD *)(v14 + 88);
          v39[4] = *(_OWORD *)(v14 + 72);
          v39[5] = v20;
          long long v21 = *(_OWORD *)(v14 + 120);
          v39[6] = *(_OWORD *)(v14 + 104);
          v39[7] = v21;
          long long v22 = *(_OWORD *)(v14 + 24);
          v39[0] = *(_OWORD *)(v14 + 8);
          v39[1] = v22;
          long long v23 = *(_OWORD *)(v14 + 56);
          v39[2] = *(_OWORD *)(v14 + 40);
          v39[3] = v23;

          uint64_t v24 = sub_10001A2D0(a1, v39);
          sub_100021364((uint64_t)v39);
        }
        else
        {
          uint64_t v34 = *(void *)v14;
          uint64_t v35 = *((void *)v14 + 1);
          uint64_t v36 = sub_10000C984(&qword_10002E5F8);
          uint64_t v37 = (uint64_t)&v14[*(int *)(v36 + 48)];
          uint64_t v24 = sub_10001A610(a1, v34, v35, v14[*(int *)(v36 + 64)]);
          swift_bridgeObjectRelease();
          sub_100011B2C(v37, &qword_10002E600);
        }
        return (id)v24;
      }
    }
    __break(1u);
    goto LABEL_15;
  }
  if (qword_10002E048 != -1) {
LABEL_15:
  }
    swift_once();
  uint64_t v25 = sub_1000218E8();
  sub_10001430C(v25, (uint64_t)qword_10002E460);
  BOOL v26 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v26(v10, a1, v4);
  v26(v8, a1, v4);
  uint64_t v27 = sub_1000218D8();
  os_log_type_t v28 = sub_100021AD8();
  if (os_log_type_enabled(v27, v28))
  {
    uint64_t v29 = swift_slowAlloc();
    *(_DWORD *)uint64_t v29 = 134218240;
    uint64_t v30 = sub_1000216A8();
    os_log_t v31 = *(void (**)(char *, uint64_t))(v5 + 8);
    v31(v10, v4);
    *(void *)&v39[0] = v30;
    sub_100021C58();
    *(_WORD *)(v29 + 12) = 2048;
    uint64_t v32 = sub_100021698();
    v31(v8, v4);
    *(void *)&v39[0] = v32;
    sub_100021C58();
    _os_log_impl((void *)&_mh_execute_header, v27, v28, "Got asked for path {section: %ld, row: %ld} with no coresponding item", (uint8_t *)v29, 0x16u);
    swift_slowDealloc();
  }
  else
  {
    uint64_t v33 = *(void (**)(char *, uint64_t))(v5 + 8);
    v33(v8, v4);
    v33(v10, v4);
  }

  return [objc_allocWithZone((Class)UITableViewCell) init];
}

id sub_100020274()
{
  uint64_t v44 = sub_100021568();
  uint64_t v43 = *(void *)(v44 - 8);
  __chkstk_darwin(v44);
  uint64_t v2 = (char *)&v42 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100021888();
  uint64_t v4 = *(void *)(v3 - 8);
  long long v45 = (char *)v3;
  uint64_t v46 = v4;
  uint64_t v5 = __chkstk_darwin(v3);
  long long v42 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v8 = (char **)((char *)&v42 - v7);
  uint64_t v9 = type metadata accessor for TTRIIntentsSnippetViewController.ViewModel();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v16 = (char *)&v42 - v15;
  uint64_t v17 = __chkstk_darwin(v14);
  uint64_t v19 = (char *)&v42 - v18;
  __chkstk_darwin(v17);
  uint64_t v47 = (uint64_t)&v42 - v20;
  id result = (id)sub_100021698();
  long long v22 = (char *)OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_viewModel;
  if ((uint64_t)result < *(void *)(*(void *)(v0
                                               + OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_viewModel)
                                   + 16))
  {
    unint64_t v23 = sub_100021698();
    if ((v23 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else
    {
      uint64_t v24 = *(void *)&v22[v0];
      if (v23 < *(void *)(v24 + 16))
      {
        uint64_t v25 = v47;
        sub_100021404(v24+ ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80))+ *(void *)(v10 + 72) * v23, v47);
        sub_100021404(v25, (uint64_t)v19);
        if (swift_getEnumCaseMultiPayload() != 1)
        {
          sub_100021404((uint64_t)v19, (uint64_t)v13);
          swift_bridgeObjectRelease();
          uint64_t v34 = (uint64_t)&v13[*(int *)(sub_10000C984(&qword_10002E5F8) + 48)];
          uint64_t v35 = v45;
          uint64_t v36 = v46;
          if ((*(unsigned int (**)(uint64_t, uint64_t, char *))(v46 + 48))(v34, 1, v45) == 1)
          {
            sub_10001D760(v47);
            sub_100011B2C(v34, &qword_10002E600);
            return (id)sub_10001D760((uint64_t)v19);
          }
          uint64_t v37 = v42;
          (*(void (**)(char *, uint64_t, char *))(v36 + 32))(v42, v34, v35);
          if (qword_10002E048 != -1) {
            swift_once();
          }
          uint64_t v38 = sub_1000218E8();
          sub_10001430C(v38, (uint64_t)qword_10002E460);
          sub_100021878();
          sub_100013DE8(0x696E532069726953, 0xEC00000074657070, 0x7265646E696D6552, 0xED00007473694C20, (uint64_t)v2);
          NSString v39 = *(void (**)(char *, uint64_t))(v43 + 8);
          uint64_t v40 = v44;
          v39(v2, v44);
          id result = [self defaultWorkspace];
          if (result)
          {
            long long v41 = result;
            sub_100021878();
            sub_100021B38();

            v39(v2, v40);
            (*(void (**)(char *, char *))(v36 + 8))(v37, v35);
            goto LABEL_14;
          }
LABEL_21:
          __break(1u);
          return result;
        }
        sub_100021404((uint64_t)v19, (uint64_t)v16);
        long long v22 = *(char **)v16;
        long long v26 = *(_OWORD *)(v16 + 88);
        v48[4] = *(_OWORD *)(v16 + 72);
        v48[5] = v26;
        long long v27 = *(_OWORD *)(v16 + 120);
        v48[6] = *(_OWORD *)(v16 + 104);
        v48[7] = v27;
        long long v28 = *(_OWORD *)(v16 + 24);
        v48[0] = *(_OWORD *)(v16 + 8);
        v48[1] = v28;
        long long v29 = *(_OWORD *)(v16 + 56);
        v48[2] = *(_OWORD *)(v16 + 40);
        v48[3] = v29;
        sub_100021364((uint64_t)v48);
        sub_10000C984(&qword_10002E738);
        *uint64_t v8 = [v22 remObjectID];
        sub_100021868();
        uint64_t v13 = v45;
        (*(void (**)(void *, void, char *))(v46 + 104))(v8, enum case for REMNavigationSpecifier.reminder(_:), v45);
        if (qword_10002E048 == -1)
        {
LABEL_6:
          uint64_t v30 = sub_1000218E8();
          sub_10001430C(v30, (uint64_t)qword_10002E460);
          sub_100021878();
          sub_100013DE8(0x696E532069726953, 0xEC00000074657070, 0x7265646E696D6552, 0xE800000000000000, (uint64_t)v2);
          os_log_t v31 = *(void (**)(char *, uint64_t))(v43 + 8);
          uint64_t v32 = v44;
          v31(v2, v44);
          id result = [self defaultWorkspace];
          if (result)
          {
            uint64_t v33 = result;
            sub_100021878();
            sub_100021B38();

            v31(v2, v32);
            (*(void (**)(void *, char *))(v46 + 8))(v8, v13);
LABEL_14:
            sub_10001D760(v47);
            return (id)sub_10001D760((uint64_t)v19);
          }
          __break(1u);
          goto LABEL_21;
        }
LABEL_19:
        swift_once();
        goto LABEL_6;
      }
    }
    __break(1u);
    goto LABEL_19;
  }
  return result;
}

id sub_1000208EC(void *a1)
{
  id v2 = [a1 intentResponse];
  if (!v2)
  {
LABEL_5:
    id v6 = [a1 intentResponse];
    if (v6)
    {
      uint64_t v7 = v6;
      self;
      uint64_t v8 = (void *)swift_dynamicCastObjCClass();
      if (v8)
      {
        id v5 = [v8 createdTaskList];

        return v5;
      }
    }
    return 0;
  }
  uint64_t v3 = v2;
  self;
  uint64_t v4 = (void *)swift_dynamicCastObjCClass();
  if (!v4)
  {

    goto LABEL_5;
  }
  id v5 = [v4 modifiedTaskList];

  return v5;
}

void sub_1000209D4(void *a1, char a2, CGFloat a3)
{
  uint64_t v6 = sub_1000216B8();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  CGFloat MaxY = 0.0;
  unint64_t v10 = (unint64_t)[a1 numberOfSections];
  if ((v10 & 0x8000000000000000) == 0)
  {
    unint64_t v11 = v10;
    if (!v10)
    {
LABEL_18:
      swift_beginAccess();
      return;
    }
    swift_beginAccess();
    uint64_t v12 = 0;
    uint64_t v13 = (void (**)(char *, uint64_t))(v7 + 8);
    uint64_t v37 = (char *)&v40 + 4;
    uint64_t v38 = &v41;
    *(void *)&long long v14 = 134219520;
    long long v33 = v14;
    unint64_t v39 = v11;
    while (v12 != v11)
    {
      unint64_t v15 = (unint64_t)[a1 numberOfRowsInSection:v12];
      if ((v15 & 0x8000000000000000) != 0) {
        goto LABEL_21;
      }
      unint64_t v16 = v15;
      if (v15)
      {
        double v17 = 0.0;
        while (1)
        {
          if (v16 == *(void *)&v17)
          {
            __break(1u);
            goto LABEL_20;
          }
          sub_100021688();
          Class isa = sub_100021668().super.isa;
          (*v13)(v9, v6);
          [a1 rectForRowAtIndexPath:isa];
          CGFloat v20 = v19;
          CGFloat v22 = v21;
          CGFloat v24 = v23;
          CGFloat v26 = v25;

          if (a2)
          {
            v44.origin.x = v20;
            v44.origin.y = v22;
            v44.size.width = v24;
            v44.size.height = v26;
            if (CGRectGetMaxY(v44) > a3) {
              break;
            }
          }
          ++*(void *)&v17;
          v43.origin.x = v20;
          v43.origin.y = v22;
          v43.size.width = v24;
          v43.size.height = v26;
          CGFloat MaxY = CGRectGetMaxY(v43);
          if (v16 == *(void *)&v17) {
            goto LABEL_5;
          }
        }
        if (qword_10002E048 != -1) {
          swift_once();
        }
        uint64_t v27 = sub_1000218E8();
        sub_10001430C(v27, (uint64_t)qword_10002E460);
        sub_10001DD0C();
        sub_10001DD0C();
        sub_10001DD0C();
        sub_10001DD0C();
        sub_10001DD0C();
        sub_10001DD0C();
        long long v28 = sub_1000218D8();
        os_log_type_t v29 = sub_100021AC8();
        int v30 = v29;
        if (os_log_type_enabled(v28, v29))
        {
          os_log_t v31 = (_DWORD *)swift_slowAlloc();
          int v35 = v30;
          uint64_t v32 = v31;
          *os_log_t v31 = v33;
          CGFloat v40 = v17;
          sub_100021C58();
          *((_WORD *)v32 + 6) = 1040;
          LODWORD(v40) = 1;
          uint64_t v36 = v28;
          sub_100021C58();
          *((_WORD *)v32 + 9) = 2048;
          uint64_t v34 = v32 + 5;
          v45.origin.x = v20;
          v45.origin.y = v22;
          v45.size.width = v24;
          v45.size.height = v26;
          CGFloat v40 = CGRectGetMaxY(v45);
          sub_100021C58();
          *((_WORD *)v32 + 14) = 1040;
          LODWORD(v40) = 1;
          sub_100021C58();
          *((_WORD *)v32 + 17) = 2048;
          CGFloat v40 = MaxY;
          sub_100021C58();
          *((_WORD *)v32 + 22) = 1040;
          LODWORD(v40) = 1;
          long long v28 = v36;
          sub_100021C58();
          *((_WORD *)v32 + 25) = 2048;
          CGFloat v40 = a3;
          sub_100021C58();
          _os_log_impl((void *)&_mh_execute_header, v28, (os_log_type_t)v35, "Adding row %ld would be too large to fit, stopping at previous height. { currentRowMaxY:  %.*f, previousMaxY: %.*f, maxHeight: %.*f}", (uint8_t *)v32, 0x3Cu);
          swift_slowDealloc();
        }
      }
LABEL_5:
      ++v12;
      unint64_t v11 = v39;
      if (v12 == v39) {
        goto LABEL_18;
      }
    }
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
  }
  __break(1u);
}

void sub_100020E10(uint64_t a1, void *a2, void (*a3)(uint64_t, uint64_t, __n128, __n128), __n128 a4, __n128 a5)
{
  if (!a1)
  {
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  uint64_t v6 = v5;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (sub_100021CB8()) {
      goto LABEL_4;
    }
  }
  else if (*(void *)(a1 + 16))
  {
LABEL_4:
    if (a3)
    {
LABEL_5:
      a4.n128_u64[0] = 0;
      a5.n128_u64[0] = 0;
LABEL_6:
      uint64_t v10 = a1;
LABEL_7:
      a3(1, v10, a4, a5);
      return;
    }
    goto LABEL_27;
  }
  sub_10001AED0(a2);
  if (!v11)
  {
    if (a3) {
      goto LABEL_5;
    }
    __break(1u);
    goto LABEL_24;
  }
  unint64_t v12 = v11;
  sub_10001AC48(v11);
  if (!a2)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  sub_10001C124(v12, a2);
  swift_bridgeObjectRelease();
  id v13 = [v5 extensionContext];
  if (v13)
  {
    long long v14 = v13;
    [v13 hostedViewMinimumAllowedSize];
    double v16 = v15;
    double v18 = v17;

    id v19 = [v6 extensionContext];
    if (v19)
    {
      CGFloat v20 = v19;
      [v19 hostedViewMaximumAllowedSize];
      double v22 = v21;
      CGFloat v24 = v23;

      a4.n128_f64[0] = sub_10001C984(1, v16, v18, v22, v24);
      if (a3) {
        goto LABEL_6;
      }
      __break(1u);
    }
  }
  if (qword_10002E048 != -1) {
    swift_once();
  }
  uint64_t v25 = sub_1000218E8();
  sub_10001430C(v25, (uint64_t)qword_10002E460);
  CGFloat v26 = sub_1000218D8();
  os_log_type_t v27 = sub_100021AE8();
  if (os_log_type_enabled(v26, v27))
  {
    long long v28 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)long long v28 = 0;
    _os_log_impl((void *)&_mh_execute_header, v26, v27, "Unable to determine hostedViewMinimumAllowedSize", v28, 2u);
    swift_slowDealloc();
  }

  if (a3)
  {
    uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      int v30 = Strong;
      [Strong contentSize];
      unint64_t v32 = v31;
      unint64_t v34 = v33;

LABEL_25:
      uint64_t v10 = a1;
      a4.n128_u64[0] = v32;
      a5.n128_u64[0] = v34;
      goto LABEL_7;
    }
LABEL_24:
    unint64_t v34 = 0;
    unint64_t v32 = 0;
    goto LABEL_25;
  }
LABEL_29:
  __break(1u);
}

uint64_t sub_100021098()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000210D0(char a1, uint64_t a2, double a3, double a4)
{
  sub_10001DC30(a1, a2, *(void *)(v4 + 16), a3, a4);
}

uint64_t sub_1000210D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100021134(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000C984(&qword_10002E600);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002119C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

id sub_1000211EC@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  return sub_100019FE4(a2, a1, *(void *)(v3 + 16), *(void *)(v3 + 24), a3);
}

uint64_t sub_1000211F4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10002125C(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100011CC0(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000212AC(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

void *sub_1000212C4(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100021308(uint64_t a1)
{
  return a1;
}

uint64_t sub_100021364(uint64_t a1)
{
  long long v2 = *(void **)(a1 + 8);
  long long v3 = *(void **)(a1 + 72);
  uint64_t v4 = *(void *)(a1 + 80);
  uint64_t v5 = *(void **)(a1 + 96);
  char v6 = *(unsigned char *)(a1 + 88);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100018FC8(v3, v4, v6);

  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100021404(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TTRIIntentsSnippetViewController.ViewModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100021468()
{
  [*(id *)(v0 + 16) isCompleted];
  return sub_100021708();
}

uint64_t sub_1000214A8()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  int v1 = *(unsigned __int8 *)(v0 + 112);
  if (v1 != 255) {
    sub_100014450(*(void **)(v0 + 96), *(void *)(v0 + 104), v1);
  }

  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 152, 7);
}

uint64_t sub_10002152C(uint64_t a1)
{
  return sub_10001E2F0(a1, *(void *)(v1 + 16), (long long *)(v1 + 24));
}

uint64_t sub_100021538()
{
  return type metadata accessor for DateComponents();
}

uint64_t sub_100021548()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_100021558()
{
  return URL.absoluteString.getter();
}

uint64_t sub_100021568()
{
  return type metadata accessor for URL();
}

NSDate sub_100021578()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_100021588()
{
  return static Date.< infix(_:_:)();
}

uint64_t sub_100021598()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000215A8()
{
  return Date.init()();
}

uint64_t sub_1000215B8()
{
  return type metadata accessor for Date();
}

NSLocale sub_1000215C8()
{
  return Locale._bridgeToObjectiveC()();
}

uint64_t sub_1000215D8()
{
  return static Locale.current.getter();
}

uint64_t sub_1000215E8()
{
  return type metadata accessor for Locale();
}

uint64_t sub_1000215F8()
{
  return Calendar.isDateInToday(_:)();
}

uint64_t sub_100021608()
{
  return Calendar.dateComponents(_:from:)();
}

uint64_t sub_100021618()
{
  return static Calendar._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100021628()
{
  return Calendar.date(from:)();
}

uint64_t sub_100021638()
{
  return static Calendar.current.getter();
}

uint64_t sub_100021648()
{
  return type metadata accessor for Calendar.Component();
}

uint64_t sub_100021658()
{
  return type metadata accessor for Calendar();
}

NSIndexPath sub_100021668()
{
  return IndexPath._bridgeToObjectiveC()();
}

uint64_t sub_100021678()
{
  return static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100021688()
{
  return IndexPath.init(row:section:)();
}

uint64_t sub_100021698()
{
  return IndexPath.row.getter();
}

uint64_t sub_1000216A8()
{
  return IndexPath.section.getter();
}

uint64_t sub_1000216B8()
{
  return type metadata accessor for IndexPath();
}

uint64_t sub_1000216C8()
{
  return TTRCommonAsset.Image.reminderCompleted.unsafeMutableAddressor();
}

uint64_t sub_1000216D8()
{
  return TTRCommonAsset.Image.reminderIncomplete.unsafeMutableAddressor();
}

uint64_t sub_1000216E8()
{
  return TTRCommonAsset.Image.reminderDetailButtonFlagged.unsafeMutableAddressor();
}

uint64_t sub_1000216F8()
{
  return static TTROneshotEditing.oneshotEdit(_:undoManager:editBlock:completionBlock:)();
}

uint64_t sub_100021708()
{
  return TTRReminderEditor.edit(completed:trackEditedUsing:)();
}

uint64_t sub_100021718()
{
  return type metadata accessor for TTRReminderEditor();
}

uint64_t sub_100021728(Swift::String _, Swift::String comment)
{
  return TTRLocalizedString(_:comment:)(_, comment)._countAndFlagsBits;
}

uint64_t sub_100021738()
{
  return static TTRLocalizableStrings.TodayList.nearbySectionName.getter();
}

uint64_t sub_100021748()
{
  return type metadata accessor for TTRCurrentTimeProvider();
}

uint64_t sub_100021758()
{
  return TTRReminderTextStorage.init(baseTextStyles:uncommittedHashtagTextStyles:committedHashtagTextStyles:foreignHashtagTextStyles:harvestedResultTextStyles:hashtagVisibility:debug_nonEditableTextStyles:debug_highlightNonEditableTexts:)();
}

uint64_t sub_100021768()
{
  return type metadata accessor for TTRReminderTextStorage();
}

uint64_t sub_100021778()
{
  return type metadata accessor for TTRIExpandedHitTestButton();
}

uint64_t sub_100021788()
{
  return type metadata accessor for TTRRemindersListViewModel.DisplayDate();
}

uint64_t sub_100021798()
{
  return TTRRemindersListViewModel.LocationData.title.getter();
}

uint64_t sub_1000217A8()
{
  return type metadata accessor for TTRRemindersListViewModel.Item();
}

uint64_t sub_1000217B8()
{
  return TTRRemindersListViewModel.Reminder.init(item:reminderAndList:precomputedProperties:overrides:)();
}

uint64_t sub_1000217C8()
{
  return type metadata accessor for TTRRemindersListViewModel.Reminder();
}

uint64_t sub_1000217D8()
{
  return TTRReminderProtocolWithPendingMove.init(reminder:pendingMoveTargetList:)();
}

uint64_t sub_1000217E8()
{
  return TTRReminderViewModelComputedProperties.init(reminder:postProcessingOperations:)();
}

uint64_t sub_1000217F8()
{
  return static RDIDispatchQueue.storeQueue.getter();
}

uint64_t sub_100021808()
{
  return type metadata accessor for RDIDispatchQueue();
}

uint64_t sub_100021818()
{
  return REMContactsProvider.init(contactStoreCreator:queue:backgroundQueue:)();
}

uint64_t sub_100021828()
{
  return REMContactsProvider.name(for:)();
}

uint64_t sub_100021838()
{
  return type metadata accessor for REMContactsProvider();
}

uint64_t sub_100021848()
{
  return type metadata accessor for REMNavigationSpecifier.SmartListPathSpecifier();
}

uint64_t sub_100021858()
{
  return type metadata accessor for REMNavigationSpecifier.ListPathSpecifier();
}

uint64_t sub_100021868()
{
  return static REMNavigationSpecifier.ReminderPathSpecifier.showInList.getter();
}

uint64_t sub_100021878()
{
  return REMNavigationSpecifier.url.getter();
}

uint64_t sub_100021888()
{
  return type metadata accessor for REMNavigationSpecifier();
}

uint64_t sub_100021898()
{
  return zalgo.getter();
}

uint64_t sub_1000218A8()
{
  return dispatch thunk of Promise.then<A>(on:closure:)();
}

uint64_t sub_1000218B8()
{
  return static Analytics.postEvent(_:payload:duration:)();
}

uint64_t sub_1000218C8()
{
  return type metadata accessor for Analytics();
}

uint64_t sub_1000218D8()
{
  return Logger.logObject.getter();
}

uint64_t sub_1000218E8()
{
  return type metadata accessor for Logger();
}

uint64_t sub_1000218F8()
{
  return Logger.init(_:)();
}

NSDictionary sub_100021908()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_100021918()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100021928()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_100021938()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t sub_100021948()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t sub_100021958()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_100021968()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100021978()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100021988()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100021998()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000219A8()
{
  return String.init(format:_:)();
}

uint64_t sub_1000219B8()
{
  return static String.hashtagTokenDefaultPrefix.getter();
}

uint64_t sub_1000219C8()
{
  return String.hash(into:)();
}

void sub_1000219D8(Swift::String a1)
{
}

Swift::Int sub_1000219E8()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_1000219F8()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_100021A08()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100021A18()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100021A28()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100021A38()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100021A48()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_100021A58()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100021A68()
{
  return Double.description.getter();
}

NSSet sub_100021A78()
{
  return Set._bridgeToObjectiveC()();
}

uint64_t sub_100021A88()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100021A98()
{
  return Set.init(minimumCapacity:)();
}

uint64_t sub_100021AA8()
{
  return INTaskList.isTitleDefaultListTitle.getter();
}

uint64_t sub_100021AB8()
{
  return REMReminder.parentReminderID.getter();
}

uint64_t sub_100021AC8()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100021AD8()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100021AE8()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_100021AF8()
{
  return static os_log_type_t.default.getter();
}

void sub_100021B08()
{
}

uint64_t sub_100021B18()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_100021B28()
{
  return static NSAttributedString.formattedString(format:formatAttributes:attributedStringsToInsert:)();
}

uint64_t sub_100021B38()
{
  return LSApplicationWorkspace.open(universalLink:)();
}

uint64_t sub_100021B48()
{
  return INSearchForNotebookItemsIntent.isTodayQuery(timeProvider:)();
}

uint64_t sub_100021B58()
{
  return INSearchForNotebookItemsIntent.isFlaggedQuery.getter();
}

uint64_t sub_100021B68()
{
  return INSearchForNotebookItemsIntent.isListOrAllQuery.getter();
}

uint64_t sub_100021B78()
{
  return INSearchForNotebookItemsIntent.isScheduledQuery.getter();
}

uint64_t sub_100021B88()
{
  return INTask.reminderID.getter();
}

UIFont sub_100021B98()
{
  return UIFont.withBoldTrait()();
}

uint64_t sub_100021BA8()
{
  return static UIFont.roundedCustomFont(textStyle:contentSizeCategory:maximumContentSizeCategory:weight:)();
}

uint64_t sub_100021BB8()
{
  return static UIFont.roundedHeadlineFont.getter();
}

uint64_t sub_100021BC8()
{
  return static UIFont.roundedSubheadlineFont.getter();
}

uint64_t sub_100021BD8()
{
  return static UIFont.roundedSubheadlineSemiboldFont.getter();
}

uint64_t sub_100021BE8()
{
  return static UIColor.ttrLinkColor.getter();
}

uint64_t sub_100021BF8()
{
  return static UIColor.ttrSecondaryLabelColor.getter();
}

Swift::Int sub_100021C08(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_100021C18()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_100021C28()
{
  return NSObject.hash(into:)();
}

uint64_t sub_100021C38()
{
  return NSString.init(stringLiteral:)();
}

uint64_t sub_100021C48()
{
  return type metadata accessor for Optional();
}

uint64_t sub_100021C58()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100021C68()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100021C78()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_100021C88()
{
  return _HashTable.previousHole(before:)();
}

uint64_t sub_100021C98()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t sub_100021CA8()
{
  return __CocoaSet.makeIterator()();
}

uint64_t sub_100021CB8()
{
  return __CocoaSet.count.getter();
}

uint64_t sub_100021CC8()
{
  return __CocoaSet.member(for:)();
}

uint64_t sub_100021CD8()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t sub_100021CE8()
{
  return __CocoaSet.contains(_:)();
}

uint64_t sub_100021CF8()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_100021D08()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_100021D18()
{
  return static _SetStorage.convert(_:capacity:)();
}

uint64_t sub_100021D28()
{
  return static _SetStorage.allocate(capacity:)();
}

uint64_t sub_100021D38()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100021D48()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100021D58()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100021D68()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100021D78()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_100021D88()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_100021D98()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_100021DA8()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_100021DB8()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100021DC8()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_100021DD8()
{
  return __CocoaDictionary.makeIterator()();
}

uint64_t sub_100021DE8()
{
  return __CocoaDictionary.count.getter();
}

uint64_t sub_100021DF8()
{
  return __CocoaDictionary.lookup(_:)();
}

uint64_t sub_100021E08()
{
  return __CocoaDictionary.Iterator.next()();
}

uint64_t sub_100021E18()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100021E28()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100021E38()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_100021E48()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_100021E58()
{
  return static _DictionaryStorage.convert(_:capacity:)();
}

uint64_t sub_100021E68()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100021E78()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_100021EA8(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t sub_100021EB8()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100021EC8()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100021ED8()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100021EE8()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_100021EF8()
{
  return Hasher.init(_seed:)();
}

void sub_100021F08(Swift::UInt8 a1)
{
}

Swift::Int sub_100021F18()
{
  return Hasher._finalize()();
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

BOOL UIAccessibilityIsBoldTextEnabled(void)
{
  return _UIAccessibilityIsBoldTextEnabled();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
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

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
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

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTupleTypeLayout3()
{
  return _swift_getTupleTypeLayout3();
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

uint64_t swift_unknownObjectWeakAssign()
{
  return _swift_unknownObjectWeakAssign();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}