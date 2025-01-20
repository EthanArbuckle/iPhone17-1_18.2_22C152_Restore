int main(int argc, const char **argv, const char **envp)
{
  id v3;

  qword_100010B20 = (uint64_t)[objc_allocWithZone((Class)type metadata accessor for ServiceDelegate()) init];
  v3 = [self serviceListener];
  qword_100010B28 = (uint64_t)v3;
  [v3 setDelegate:qword_100010B20];
  [v3 resume];
  return 0;
}

uint64_t type metadata accessor for ServiceDelegate()
{
  return self;
}

id sub_10000259C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ServiceDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_1000026DC()
{
  sub_100004E30(0, &qword_1000107A8, (uint64_t (*)(uint64_t))&type metadata accessor for FormatContentSlotItemAuxiliary, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  ((void (*)(void))__chkstk_darwin)();
  v1 = (char *)&v88 - v0;
  uint64_t v118 = sub_10000A2A0();
  v140 = *(char **)(v118 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v127 = (char *)&v88 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10000A270();
  uint64_t v117 = *(void *)(v3 - 8);
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  v136 = (char *)&v88 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v123 = (char *)&v88 - v6;
  uint64_t v122 = sub_10000A230();
  uint64_t v104 = *(void *)(v122 - 8);
  __chkstk_darwin(v122);
  v133 = (char *)&v88 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v112 = sub_10000A1F0();
  uint64_t v99 = *(void *)(v112 - 8);
  __chkstk_darwin(v112);
  v114 = (char *)&v88 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v102 = sub_10000A260();
  uint64_t v100 = *(void *)(v102 - 8);
  __chkstk_darwin(v102);
  v101 = (char *)&v88 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v142 = type metadata accessor for CuratedTodayFeedGroupConfigDataLite();
  __chkstk_darwin(v142);
  v11 = (char *)&v88 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004E30(0, &qword_100010768, (uint64_t (*)(uint64_t))sub_100004B00, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v12 - 8);
  v14 = (char *)&v88 - v13;
  uint64_t v15 = sub_10000A1C0();
  uint64_t v97 = *(void *)(v15 - 8);
  uint64_t v16 = __chkstk_darwin(v15);
  v18 = (char *)&v88 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  v20 = (char *)&v88 - v19;
  sub_100004EEC(v14);
  sub_100004B00();
  uint64_t v22 = v21;
  uint64_t v23 = *(void *)(v21 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v14, 1, v21) == 1)
  {
    sub_100004C14((uint64_t)v14, &qword_100010768, (uint64_t (*)(uint64_t))sub_100004B00);
    return (uint64_t)&_swiftEmptyArrayStorage;
  }
  else
  {
    sub_10000A130();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v14, v22);
    uint64_t v25 = v97;
    (*(void (**)(char *, char *, uint64_t))(v97 + 16))(v18, &v11[*(int *)(v142 + 20)], v15);
    sub_100004AA0((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for CuratedTodayFeedGroupConfigDataLite);
    (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v20, v18, v15);
    uint64_t v26 = sub_10000A1B0();
    uint64_t v93 = *(void *)(v26 + 16);
    if (v93)
    {
      v89 = v20;
      uint64_t v90 = v15;
      v96 = *(void (**)(char *, unint64_t, uint64_t))(v100 + 16);
      unint64_t v95 = v26 + ((*(unsigned __int8 *)(v100 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v100 + 80));
      uint64_t v106 = v99 + 16;
      uint64_t v126 = v104 + 16;
      uint64_t v142 = v117 + 88;
      int v141 = enum case for FormatContentSlotItemObject.article(_:);
      v138 = (void (**)(char *, uint64_t))(v117 + 8);
      v137 = (void (**)(char *, uint64_t))(v117 + 96);
      v125 = (unsigned int (**)(char *, uint64_t, uint64_t))(v140 + 48);
      v120 = (void (**)(char *, char *, uint64_t))(v140 + 32);
      uint64_t v139 = v117 + 16;
      v119 = (void (**)(char *, uint64_t))(v140 + 8);
      v124 = (void (**)(char *, uint64_t))(v104 + 8);
      v105 = (void (**)(char *, uint64_t))(v99 + 8);
      v92 = (void (**)(char *, uint64_t))(v100 + 8);
      v100 += 16;
      uint64_t v94 = *(void *)(v100 + 56);
      uint64_t v88 = v26;
      swift_bridgeObjectRetain();
      uint64_t v27 = 0;
      v103 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v28 = v118;
      uint64_t v135 = v3;
      v29 = v136;
      uint64_t v31 = v122;
      v30 = v123;
      v116 = v1;
      while (1)
      {
        uint64_t v98 = v27;
        v96(v101, v95 + v94 * v27, v102);
        uint64_t v32 = sub_10000A250();
        uint64_t v110 = *(void *)(v32 + 16);
        if (v110)
        {
          unint64_t v109 = v32 + ((*(unsigned __int8 *)(v99 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v99 + 80));
          uint64_t v108 = *(void *)(v99 + 72);
          v107 = *(void (**)(char *, unint64_t, uint64_t))(v99 + 16);
          uint64_t v91 = v32;
          swift_bridgeObjectRetain();
          uint64_t v33 = 0;
          v115 = (char *)&_swiftEmptyArrayStorage;
          while (1)
          {
            uint64_t v113 = v33;
            unint64_t v34 = v109 + v108 * v33;
            uint64_t v35 = v112;
            v107(v114, v34, v112);
            uint64_t v36 = sub_10000A1E0();
            uint64_t v131 = *(void *)(v36 + 16);
            if (v131) {
              break;
            }
            swift_bridgeObjectRelease();
            v70 = (char *)&_swiftEmptyArrayStorage;
LABEL_50:
            (*v105)(v114, v35);
            uint64_t v71 = *((void *)v70 + 2);
            uint64_t result = (uint64_t)v115;
            int64_t v72 = *((void *)v115 + 2);
            int64_t v73 = v72 + v71;
            if (__OFADD__(v72, v71)) {
              goto LABEL_84;
            }
            uint64_t result = swift_isUniquelyReferenced_nonNull_native();
            v74 = v115;
            if ((result & 1) == 0 || v73 > *((void *)v115 + 3) >> 1)
            {
              if (v72 <= v73) {
                int64_t v75 = v72 + v71;
              }
              else {
                int64_t v75 = v72;
              }
              uint64_t result = (uint64_t)sub_100004344((char *)result, v75, 1, v115);
              v74 = (char *)result;
            }
            uint64_t v76 = *((void *)v70 + 2);
            v115 = v74;
            if (v76)
            {
              if ((*((void *)v74 + 3) >> 1) - *((void *)v74 + 2) < v71) {
                goto LABEL_85;
              }
              uint64_t result = swift_arrayInitWithCopy();
              if (v71)
              {
                uint64_t v77 = *((void *)v115 + 2);
                BOOL v68 = __OFADD__(v77, v71);
                uint64_t v78 = v77 + v71;
                if (v68) {
                  goto LABEL_86;
                }
                *((void *)v115 + 2) = v78;
              }
            }
            else if (v71)
            {
              __break(1u);
LABEL_84:
              __break(1u);
LABEL_85:
              __break(1u);
LABEL_86:
              __break(1u);
              goto LABEL_87;
            }
            uint64_t v33 = v113 + 1;
            swift_bridgeObjectRelease();
            if (v33 == v110)
            {
              swift_bridgeObjectRelease_n();
              v79 = v115;
              goto LABEL_64;
            }
          }
          unint64_t v130 = v36 + ((*(unsigned __int8 *)(v104 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v104 + 80));
          uint64_t v37 = *(void *)(v104 + 72);
          v128 = *(void (**)(char *, unint64_t, uint64_t))(v104 + 16);
          uint64_t v129 = v37;
          uint64_t v111 = v36;
          swift_bridgeObjectRetain();
          uint64_t v38 = 0;
          v134 = (char *)&_swiftEmptyArrayStorage;
          while (1)
          {
            uint64_t v132 = v38;
            v128(v133, v130 + v129 * v38, v31);
            sub_10000A210();
            v140 = *(char **)v142;
            int v39 = ((uint64_t (*)(char *, uint64_t))v140)(v30, v3);
            if (v39 == v141)
            {
              (*v137)(v30, v3);
              uint64_t v40 = sub_10000A190();
              uint64_t v42 = v41;
              v43 = sub_100004344(0, 1, 1, (char *)&_swiftEmptyArrayStorage);
              unint64_t v45 = *((void *)v43 + 2);
              unint64_t v44 = *((void *)v43 + 3);
              if (v45 >= v44 >> 1) {
                v43 = sub_100004344((char *)(v44 > 1), v45 + 1, 1, v43);
              }
              *((void *)v43 + 2) = v45 + 1;
              v46 = &v43[16 * v45];
              *((void *)v46 + 4) = v40;
              *((void *)v46 + 5) = v42;
              swift_release();
              uint64_t v31 = v122;
              v30 = v123;
            }
            else
            {
              (*v138)(v30, v3);
              v43 = (char *)&_swiftEmptyArrayStorage;
            }
            sub_10000A220();
            if ((*v125)(v1, 1, v28) == 1)
            {
              sub_100004C14((uint64_t)v1, &qword_1000107A8, (uint64_t (*)(uint64_t))&type metadata accessor for FormatContentSlotItemAuxiliary);
            }
            else
            {
              (*v120)(v127, v1, v28);
              uint64_t v47 = sub_10000A290();
              uint64_t v48 = *(void *)(v47 + 16);
              if (v48)
              {
                unint64_t v49 = (*(unsigned __int8 *)(v117 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v117 + 80);
                uint64_t v121 = v47;
                unint64_t v50 = v47 + v49;
                uint64_t v51 = *(void *)(v117 + 72);
                v52 = *(void (**)(char *, unint64_t, uint64_t))(v117 + 16);
                v52(v29, v47 + v49, v3);
                while (1)
                {
                  int v53 = ((uint64_t (*)(char *, uint64_t))v140)(v29, v3);
                  if (v53 == v141)
                  {
                    (*v137)(v29, v3);
                    uint64_t v54 = sub_10000A190();
                    uint64_t v56 = v55;
                    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                      v43 = sub_100004344(0, *((void *)v43 + 2) + 1, 1, v43);
                    }
                    unint64_t v58 = *((void *)v43 + 2);
                    unint64_t v57 = *((void *)v43 + 3);
                    if (v58 >= v57 >> 1) {
                      v43 = sub_100004344((char *)(v57 > 1), v58 + 1, 1, v43);
                    }
                    *((void *)v43 + 2) = v58 + 1;
                    v59 = &v43[16 * v58];
                    *((void *)v59 + 4) = v54;
                    *((void *)v59 + 5) = v56;
                    swift_release();
                    uint64_t v3 = v135;
                    v29 = v136;
                  }
                  else
                  {
                    (*v138)(v29, v3);
                  }
                  v50 += v51;
                  if (!--v48) {
                    break;
                  }
                  v52(v29, v50, v3);
                }
                swift_bridgeObjectRelease();
                v1 = v116;
                uint64_t v28 = v118;
                uint64_t v31 = v122;
                v30 = v123;
              }
              else
              {
                swift_bridgeObjectRelease();
              }
              (*v119)(v127, v28);
            }
            (*v124)(v133, v31);
            uint64_t v60 = *((void *)v43 + 2);
            int64_t v61 = *((void *)v134 + 2);
            int64_t v62 = v61 + v60;
            if (__OFADD__(v61, v60)) {
              break;
            }
            isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
            v64 = v134;
            if (!isUniquelyReferenced_nonNull_native || v62 > *((void *)v134 + 3) >> 1)
            {
              if (v61 <= v62) {
                int64_t v65 = v61 + v60;
              }
              else {
                int64_t v65 = v61;
              }
              v64 = sub_100004344(isUniquelyReferenced_nonNull_native, v65, 1, v134);
            }
            uint64_t v66 = *((void *)v43 + 2);
            v134 = v64;
            if (v66)
            {
              if ((*((void *)v64 + 3) >> 1) - *((void *)v64 + 2) < v60) {
                goto LABEL_80;
              }
              swift_arrayInitWithCopy();
              if (v60)
              {
                uint64_t v67 = *((void *)v134 + 2);
                BOOL v68 = __OFADD__(v67, v60);
                uint64_t v69 = v67 + v60;
                if (v68) {
                  goto LABEL_81;
                }
                *((void *)v134 + 2) = v69;
              }
            }
            else if (v60)
            {
              goto LABEL_79;
            }
            uint64_t v38 = v132 + 1;
            swift_bridgeObjectRelease();
            if (v38 == v131)
            {
              swift_bridgeObjectRelease_n();
              uint64_t v35 = v112;
              v70 = v134;
              goto LABEL_50;
            }
          }
          __break(1u);
LABEL_79:
          __break(1u);
LABEL_80:
          __break(1u);
LABEL_81:
          __break(1u);
LABEL_82:
          swift_bridgeObjectRelease_n();
          uint64_t v15 = v90;
          uint64_t v25 = v97;
          v20 = v89;
          goto LABEL_77;
        }
        swift_bridgeObjectRelease();
        v79 = (char *)&_swiftEmptyArrayStorage;
LABEL_64:
        (*v92)(v101, v102);
        uint64_t v80 = *((void *)v79 + 2);
        uint64_t result = (uint64_t)v103;
        int64_t v81 = *((void *)v103 + 2);
        int64_t v82 = v81 + v80;
        if (__OFADD__(v81, v80)) {
          break;
        }
        v115 = v79;
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        v83 = v103;
        if (!result || v82 > *((void *)v103 + 3) >> 1)
        {
          if (v81 <= v82) {
            int64_t v84 = v81 + v80;
          }
          else {
            int64_t v84 = v81;
          }
          uint64_t result = (uint64_t)sub_100004344((char *)result, v84, 1, v103);
          v83 = (char *)result;
        }
        uint64_t v85 = *((void *)v115 + 2);
        v103 = v83;
        if (v85)
        {
          if ((*((void *)v83 + 3) >> 1) - *((void *)v83 + 2) < v80) {
            goto LABEL_89;
          }
          uint64_t result = swift_arrayInitWithCopy();
          if (v80)
          {
            uint64_t v86 = *((void *)v103 + 2);
            BOOL v68 = __OFADD__(v86, v80);
            uint64_t v87 = v86 + v80;
            if (v68) {
              goto LABEL_90;
            }
            *((void *)v103 + 2) = v87;
          }
        }
        else if (v80)
        {
          goto LABEL_88;
        }
        uint64_t v27 = v98 + 1;
        swift_bridgeObjectRelease();
        if (v27 == v93) {
          goto LABEL_82;
        }
      }
LABEL_87:
      __break(1u);
LABEL_88:
      __break(1u);
LABEL_89:
      __break(1u);
LABEL_90:
      __break(1u);
    }
    else
    {
      swift_bridgeObjectRelease();
      v103 = (char *)&_swiftEmptyArrayStorage;
LABEL_77:
      (*(void (**)(char *, uint64_t))(v25 + 8))(v20, v15);
      return (uint64_t)v103;
    }
  }
  return result;
}

void *sub_10000365C()
{
  sub_100004D94(0, &qword_100010758, (uint64_t (*)(uint64_t, uint64_t, uint64_t))&type metadata accessor for FormatFileReferenceCollection);
  uint64_t v26 = *(void *)(v0 - 8);
  uint64_t v27 = v0;
  __chkstk_darwin(v0);
  uint64_t v2 = (char *)&v24 - v1;
  uint64_t v25 = type metadata accessor for CuratedTodayFeedGroupConfigDataLite();
  __chkstk_darwin(v25);
  uint64_t v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004E30(0, &qword_100010768, (uint64_t (*)(uint64_t))sub_100004B00, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v24 - v6;
  uint64_t v8 = sub_10000A1C0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v14 = (char *)&v24 - v13;
  sub_100004EEC(v7);
  sub_100004B00();
  uint64_t v16 = v15;
  uint64_t v17 = *(void *)(v15 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v7, 1, v15) == 1)
  {
    sub_100004C14((uint64_t)v7, &qword_100010768, (uint64_t (*)(uint64_t))sub_100004B00);
    return &_swiftEmptyArrayStorage;
  }
  else
  {
    sub_10000A130();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v7, v16);
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, &v4[*(int *)(v25 + 20)], v8);
    sub_100004AA0((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for CuratedTodayFeedGroupConfigDataLite);
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v14, v12, v8);
    uint64_t v28 = &_swiftEmptyArrayStorage;
    sub_10000A1A0();
    uint64_t v19 = v27;
    uint64_t v20 = sub_10000A280();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v2, v19);
    uint64_t v21 = sub_100003AA8(v20);
    swift_bridgeObjectRelease();
    sub_100004180((size_t)v21);
    uint64_t v22 = sub_10000A1B0();
    uint64_t v23 = sub_100003E1C(v22);
    swift_bridgeObjectRelease();
    sub_100004180((size_t)v23);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
    return v28;
  }
}

uint64_t sub_100003A58()
{
  return sub_10000A200();
}

void *sub_100003AA8(uint64_t a1)
{
  sub_100004E30(0, &qword_100010788, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)v25 - v4;
  uint64_t v29 = sub_10000A0A0();
  uint64_t v6 = *(void *)(v29 - 8);
  uint64_t v7 = __chkstk_darwin(v29);
  v30 = (char *)v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v28 = (char *)v25 - v9;
  uint64_t v10 = *(void *)(a1 + 16);
  if (!v10) {
    return &_swiftEmptyArrayStorage;
  }
  v25[1] = v1;
  sub_100004D94(0, &qword_100010798, (uint64_t (*)(uint64_t, uint64_t, uint64_t))&type metadata accessor for FormatFileReference);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = a1 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
  v14 = (unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48);
  uint64_t v27 = v6;
  uint64_t v15 = (void (**)(char *, char *, uint64_t))(v6 + 32);
  uint64_t v16 = *(void *)(v12 + 72);
  v25[0] = a1;
  swift_bridgeObjectRetain();
  uint64_t v17 = &_swiftEmptyArrayStorage;
  uint64_t v18 = v29;
  uint64_t v26 = v16;
  do
  {
    swift_getKeyPath();
    swift_getAtKeyPath();
    swift_release();
    if ((*v14)(v5, 1, v18) == 1)
    {
      sub_100004C14((uint64_t)v5, &qword_100010788, (uint64_t (*)(uint64_t))&type metadata accessor for URL);
    }
    else
    {
      uint64_t v19 = *v15;
      uint64_t v20 = v28;
      (*v15)(v28, v5, v18);
      v19(v30, v20, v18);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v17 = (void *)sub_100004444(0, v17[2] + 1, 1, v17);
      }
      unint64_t v22 = v17[2];
      unint64_t v21 = v17[3];
      if (v22 >= v21 >> 1) {
        uint64_t v17 = (void *)sub_100004444(v21 > 1, v22 + 1, 1, v17);
      }
      v17[2] = v22 + 1;
      unint64_t v23 = (unint64_t)v17
          + ((*(unsigned __int8 *)(v27 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80))
          + *(void *)(v27 + 72) * v22;
      uint64_t v18 = v29;
      v19((char *)v23, v30, v29);
      uint64_t v16 = v26;
    }
    v13 += v16;
    --v10;
  }
  while (v10);
  swift_bridgeObjectRelease();
  return v17;
}

char *sub_100003E1C(uint64_t a1)
{
  sub_100004E30(0, &qword_100010788, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)v22 - v4;
  uint64_t v6 = sub_10000A0A0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v27 = (char *)v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v25 = (char *)v22 - v10;
  uint64_t v11 = *(void *)(a1 + 16);
  if (!v11) {
    return (char *)&_swiftEmptyArrayStorage;
  }
  v22[1] = v1;
  uint64_t v12 = *(void *)(sub_10000A260() - 8);
  uint64_t v13 = a1 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
  v14 = (unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
  uint64_t v24 = v7;
  uint64_t v15 = (void (**)(char *, char *, uint64_t))(v7 + 32);
  uint64_t v26 = *(void *)(v12 + 72);
  v22[0] = a1;
  swift_bridgeObjectRetain();
  uint64_t v16 = (char *)&_swiftEmptyArrayStorage;
  unint64_t v23 = v14;
  do
  {
    swift_getKeyPath();
    swift_getAtKeyPath();
    swift_release();
    if ((*v14)(v5, 1, v6) == 1)
    {
      sub_100004C14((uint64_t)v5, &qword_100010788, (uint64_t (*)(uint64_t))&type metadata accessor for URL);
    }
    else
    {
      uint64_t v17 = *v15;
      uint64_t v18 = v25;
      (*v15)(v25, v5, v6);
      v17(v27, v18, v6);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v16 = (char *)sub_100004444(0, *((void *)v16 + 2) + 1, 1, v16);
      }
      unint64_t v20 = *((void *)v16 + 2);
      unint64_t v19 = *((void *)v16 + 3);
      if (v20 >= v19 >> 1) {
        uint64_t v16 = (char *)sub_100004444(v19 > 1, v20 + 1, 1, v16);
      }
      *((void *)v16 + 2) = v20 + 1;
      v17(&v16[((*(unsigned __int8 *)(v24 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80))+ *(void *)(v24 + 72) * v20], v27, v6);
      v14 = v23;
    }
    v13 += v26;
    --v11;
  }
  while (v11);
  swift_bridgeObjectRelease();
  return v16;
}

size_t sub_100004180(size_t result)
{
  uint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  size_t v6 = result;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (result && v5 <= v3[3] >> 1)
  {
    if (*(void *)(v6 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
  if (v4 <= v5) {
    int64_t v11 = v4 + v2;
  }
  else {
    int64_t v11 = v4;
  }
  uint64_t result = sub_100004444(result, v11, 1, v3);
  uint64_t v3 = (void *)result;
  if (!*(void *)(v6 + 16))
  {
LABEL_13:
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
LABEL_5:
  uint64_t v7 = (v3[3] >> 1) - v3[2];
  uint64_t result = sub_10000A0A0();
  if (v7 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t result = swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v8 = v3[2];
  BOOL v9 = __OFADD__(v8, v2);
  uint64_t v10 = v8 + v2;
  if (!v9)
  {
    v3[2] = v10;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

id sub_1000042E8()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for TodayFeedConfigDecodingService()
{
  return self;
}

char *sub_100004344(char *result, int64_t a2, char a3, char *a4)
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
    sub_100004E94();
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
  v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
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

size_t sub_100004444(size_t result, int64_t a2, char a3, void *a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100004E30(0, &qword_100010790, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  uint64_t v10 = *(void *)(sub_10000A0A0() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  uint64_t result = j__malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_29;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(sub_10000A0A0() - 8);
  if (v5)
  {
    if (v13 < a4
      || (unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(void *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v13;
}

id sub_100004644()
{
  sub_100004E30(0, &qword_100010748, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v16 - v2;
  uint64_t v4 = sub_10000A0E0();
  uint64_t v18 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  unint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for TodayConfigLite();
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000A180();
  swift_allocObject();
  id v10 = (id)sub_10000A170();
  sub_100004BCC(&qword_100010750, (void (*)(uint64_t))type metadata accessor for TodayConfigLite);
  sub_10000A0F0();
  swift_release();
  if (!v0)
  {
    sub_100004A0C((uint64_t)v9, (uint64_t)v3);
    uint64_t v11 = v18;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v3, 1, v4) == 1)
    {
      sub_10000A0D0();
      sub_100004C14((uint64_t)v3, &qword_100010748, (uint64_t (*)(uint64_t))&type metadata accessor for Date);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v6, v3, v4);
    }
    sub_1000026DC();
    sub_10000365C();
    id v16 = objc_allocWithZone((Class)NDTodayFeedConfig);
    uint64_t v17 = v4;
    Class isa = sub_10000A0C0().super.isa;
    Class v13 = sub_10000A2F0().super.isa;
    swift_bridgeObjectRelease();
    sub_10000A0A0();
    Class v14 = sub_10000A2F0().super.isa;
    swift_bridgeObjectRelease();
    id v10 = [v16 initWithPublishDate:isa topStoriesArticleIDs:v13 topStoriesPackageURLs:v14];

    (*(void (**)(char *, uint64_t))(v11 + 8))(v6, v17);
    sub_100004AA0((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for TodayConfigLite);
  }
  return v10;
}

uint64_t sub_1000049B4(uint64_t a1, unint64_t a2)
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

uint64_t sub_100004A0C(uint64_t a1, uint64_t a2)
{
  sub_100004E30(0, &qword_100010748, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100004AA0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_100004B00()
{
  if (!qword_100010770)
  {
    type metadata accessor for CuratedTodayFeedGroupConfigDataLite();
    sub_100004BCC(&qword_100010778, (void (*)(uint64_t))type metadata accessor for CuratedTodayFeedGroupConfigDataLite);
    sub_100004BCC(&qword_100010780, (void (*)(uint64_t))type metadata accessor for CuratedTodayFeedGroupConfigDataLite);
    unint64_t v0 = sub_10000A160();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100010770);
    }
  }
}

uint64_t sub_100004BCC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100004C14(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  sub_100004E30(0, a2, a3, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_100004C84()
{
  return sub_10000A240();
}

uint64_t sub_100004CA8()
{
  return sub_100004BCC(&qword_100010760, (void (*)(uint64_t))&type metadata accessor for FormatPackage);
}

uint64_t sub_100004CF0()
{
  return sub_10000A2B0();
}

uint64_t sub_100004D40()
{
  return sub_10000A200();
}

void sub_100004D94(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v6 = sub_10000A1D0();
    uint64_t v7 = sub_100004BCC(&qword_100010760, (void (*)(uint64_t))&type metadata accessor for FormatPackage);
    unint64_t v8 = a3(a1, v6, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

void sub_100004E30(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

void sub_100004E94()
{
  if (!qword_1000107B0)
  {
    unint64_t v0 = sub_10000A370();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000107B0);
    }
  }
}

uint64_t sub_100004EEC@<X0>(char *a1@<X8>)
{
  uint64_t v2 = v1;
  type metadata accessor for CuratedTodayFeedGroupConfigDataLite();
  __chkstk_darwin();
  uint64_t v5 = (uint64_t *)((char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = *(void *)(type metadata accessor for TodayFeedGroupConfigLite() - 8);
  __chkstk_darwin();
  unint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004B00();
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)(v9 - 8);
  __chkstk_darwin();
  Class v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void *)(v2 + *(int *)(type metadata accessor for TodayFeedConfigLite() + 20));
  uint64_t v15 = *(void *)(v14 + 16);
  if (v15)
  {
    uint64_t v25 = v11;
    uint64_t v26 = a1;
    uint64_t v16 = v14 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
    uint64_t v17 = (void (**)(char *, char *, uint64_t))(v11 + 32);
    uint64_t v18 = (void (**)(char *, uint64_t))(v11 + 8);
    uint64_t v27 = *(void *)(v6 + 72);
    uint64_t v24 = v14;
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_100006828(v16, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for TodayFeedGroupConfigLite);
      unint64_t v19 = *v17;
      (*v17)(v13, v8, v10);
      sub_10000A130();
      if (*v5 == 0x69726F7453706F74 && v5[1] == 0xEA00000000007365) {
        break;
      }
      char v21 = sub_10000A380();
      sub_1000067C8((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for CuratedTodayFeedGroupConfigDataLite);
      if (v21) {
        goto LABEL_12;
      }
      (*v18)(v13, v10);
      v16 += v27;
      if (!--v15)
      {
        swift_bridgeObjectRelease();
        uint64_t v22 = 1;
        a1 = v26;
        goto LABEL_13;
      }
    }
    sub_1000067C8((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for CuratedTodayFeedGroupConfigDataLite);
LABEL_12:
    swift_bridgeObjectRelease();
    a1 = v26;
    v19(v26, v13, v10);
    uint64_t v22 = 0;
LABEL_13:
    uint64_t v11 = v25;
  }
  else
  {
    uint64_t v22 = 1;
  }
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(a1, v22, 1, v10);
}

uint64_t sub_100005208(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t type metadata accessor for TodayFeedConfigLite()
{
  uint64_t result = qword_100010810;
  if (!qword_100010810) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t *sub_10000529C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_10000A0E0();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      sub_100005414(0);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    swift_bridgeObjectRetain();
  }
  return a1;
}

void sub_100005414(uint64_t a1)
{
}

uint64_t sub_100005448(uint64_t a1)
{
  uint64_t v2 = sub_10000A0E0();
  uint64_t v3 = *(void *)(v2 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(a1, 1, v2)) {
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  }
  return swift_bridgeObjectRelease();
}

char *sub_100005514(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_10000A0E0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    sub_100005414(0);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  swift_bridgeObjectRetain();
  return a1;
}

char *sub_10000563C(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_10000A0E0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 24))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    sub_100005414(0);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

char *sub_1000057D4(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_10000A0E0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    sub_100005414(0);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  return a1;
}

char *sub_1000058F8(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_10000A0E0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 40))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    sub_100005414(0);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100005A88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100005A9C);
}

uint64_t sub_100005A9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_100005414(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_100005B5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100005B70);
}

void sub_100005B70(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_100005414(0);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v10(a1, a2, a2, v8);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
}

void sub_100005C2C()
{
  sub_100005414(319);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_100005CC4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v31 = a2;
  uint64_t v32 = type metadata accessor for TodayFeedConfigLite();
  __chkstk_darwin(v32);
  uint64_t v33 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000657C(0);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005414(0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000068F4(0, &qword_100010868, (uint64_t (*)(uint64_t, ValueMetadata *, unint64_t))&type metadata accessor for SafeishKeyedDecodingContainer);
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v29 - v13;
  sub_100006734(a1, a1[3]);
  sub_1000066E0();
  uint64_t v15 = (uint64_t)v34;
  sub_10000A3C0();
  if (!v15)
  {
    uint64_t v16 = v12;
    uint64_t v17 = (uint64_t)v33;
    sub_10000A0E0();
    char v36 = 0;
    sub_100005208(&qword_100010878, (void (*)(uint64_t))&type metadata accessor for Date);
    sub_10000A120();
    unint64_t v34 = v9;
    sub_100006614();
    uint64_t v19 = v18;
    char v35 = 1;
    sub_100005208(&qword_100010880, (void (*)(uint64_t))sub_100006614);
    sub_10000A120();
    v30 = v14;
    uint64_t v21 = *(void *)(v19 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v6, 1, v19) == 1)
    {
      sub_1000067C8((uint64_t)v6, (uint64_t (*)(void))sub_10000657C);
      uint64_t v22 = (uint64_t)v34;
      uint64_t v23 = v17;
      sub_100006828((uint64_t)v34, v17, (uint64_t (*)(void))sub_100005414);
      uint64_t v24 = v22;
      uint64_t v26 = v31;
      uint64_t v25 = v32;
    }
    else
    {
      uint64_t v27 = (void *)sub_10000A100();
      (*(void (**)(char *, uint64_t))(v21 + 8))(v6, v19);
      uint64_t v28 = (uint64_t)v34;
      uint64_t v23 = v17;
      sub_100006828((uint64_t)v34, v17, (uint64_t (*)(void))sub_100005414);
      uint64_t v24 = v28;
      uint64_t v26 = v31;
      uint64_t v25 = v32;
      if (v27)
      {
LABEL_8:
        sub_1000067C8(v24, (uint64_t (*)(void))sub_100005414);
        *(void *)(v23 + *(int *)(v25 + 20)) = v27;
        sub_100006890(v23, v26);
        (*(void (**)(char *, uint64_t))(v16 + 8))(v30, v11);
        return sub_100006778((uint64_t)a1);
      }
    }
    uint64_t v27 = &_swiftEmptyArrayStorage;
    goto LABEL_8;
  }
  return sub_100006778((uint64_t)a1);
}

BOOL sub_10000616C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_100006184()
{
  Swift::UInt v1 = *v0;
  sub_10000A390();
  sub_10000A3A0(v1);
  return sub_10000A3B0();
}

void sub_1000061CC()
{
  sub_10000A3A0(*v0);
}

Swift::Int sub_1000061F8()
{
  Swift::UInt v1 = *v0;
  sub_10000A390();
  sub_10000A3A0(v1);
  return sub_10000A3B0();
}

uint64_t sub_10000623C()
{
  if (*v0) {
    return 0x7370756F7267;
  }
  else {
    return 0x446873696C627570;
  }
}

uint64_t sub_10000627C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100006CEC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1000062A4()
{
  return 0;
}

void sub_1000062B0(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_1000062BC(uint64_t a1)
{
  unint64_t v2 = sub_1000066E0();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000062F8(uint64_t a1)
{
  unint64_t v2 = sub_1000066E0();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100006334(void *a1)
{
  uint64_t v3 = v1;
  sub_1000068F4(0, &qword_100010888, (uint64_t (*)(uint64_t, ValueMetadata *, unint64_t))&type metadata accessor for KeyedEncodingContainer);
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v9 = &v11[-v8];
  sub_100006734(a1, a1[3]);
  sub_1000066E0();
  sub_10000A3E0();
  char v13 = 0;
  sub_10000A0E0();
  sub_100005208(&qword_100010890, (void (*)(uint64_t))&type metadata accessor for Date);
  sub_10000A340();
  if (!v2)
  {
    uint64_t v12 = *(void *)(v3 + *(int *)(type metadata accessor for TodayFeedConfigLite() + 20));
    v11[15] = 1;
    sub_1000065B0(0, &qword_100010898, (uint64_t (*)(uint64_t))type metadata accessor for TodayFeedGroupConfigLite, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
    sub_100006958();
    sub_10000A360();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_10000654C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100005CC4(a1, a2);
}

uint64_t sub_100006564(void *a1)
{
  return sub_100006334(a1);
}

void sub_10000657C(uint64_t a1)
{
}

void sub_1000065B0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

void sub_100006614()
{
  if (!qword_100010850)
  {
    type metadata accessor for TodayFeedGroupConfigLite();
    sub_100005208(&qword_100010858, (void (*)(uint64_t))type metadata accessor for TodayFeedGroupConfigLite);
    sub_100005208(&qword_100010860, (void (*)(uint64_t))type metadata accessor for TodayFeedGroupConfigLite);
    unint64_t v0 = sub_10000A110();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100010850);
    }
  }
}

unint64_t sub_1000066E0()
{
  unint64_t result = qword_100010870;
  if (!qword_100010870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010870);
  }
  return result;
}

void *sub_100006734(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100006778(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000067C8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100006828(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100006890(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TodayFeedConfigLite();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_1000068F4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = sub_1000066E0();
    unint64_t v7 = a3(a1, &type metadata for TodayFeedConfigLite.CodingKeys, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

unint64_t sub_100006958()
{
  unint64_t result = qword_1000108A0;
  if (!qword_1000108A0)
  {
    sub_1000065B0(255, &qword_100010898, (uint64_t (*)(uint64_t))type metadata accessor for TodayFeedGroupConfigLite, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
    sub_100005208(&qword_100010860, (void (*)(uint64_t))type metadata accessor for TodayFeedGroupConfigLite);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000108A0);
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for TodayFeedConfigLite.CodingKeys(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for TodayFeedConfigLite.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for TodayFeedConfigLite.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100006B94);
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

uint64_t sub_100006BBC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100006BC8(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for TodayFeedConfigLite.CodingKeys()
{
  return &type metadata for TodayFeedConfigLite.CodingKeys;
}

unint64_t sub_100006BE8()
{
  unint64_t result = qword_1000108A8;
  if (!qword_1000108A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000108A8);
  }
  return result;
}

unint64_t sub_100006C40()
{
  unint64_t result = qword_1000108B0;
  if (!qword_1000108B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000108B0);
  }
  return result;
}

unint64_t sub_100006C98()
{
  unint64_t result = qword_1000108B8;
  if (!qword_1000108B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000108B8);
  }
  return result;
}

uint64_t sub_100006CEC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x446873696C627570 && a2 == 0xEB00000000657461;
  if (v2 || (sub_10000A380() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7370756F7267 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_10000A380();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t *sub_100006DF0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = type metadata accessor for TodayFeedConfigLite();
  int v5 = *(_DWORD *)(*(void *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = v4;
    uint64_t v7 = sub_10000A0E0();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      sub_100005414(0);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    *(uint64_t *)((char *)a1 + *(int *)(v6 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(v6 + 20));
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_100006F70(uint64_t a1)
{
  uint64_t v2 = sub_10000A0E0();
  uint64_t v3 = *(void *)(v2 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(a1, 1, v2)) {
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  }
  type metadata accessor for TodayFeedConfigLite();
  return swift_bridgeObjectRelease();
}

char *sub_100007040(char *a1, char *a2)
{
  uint64_t v4 = sub_10000A0E0();
  uint64_t v5 = *(void *)(v4 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
  {
    sub_100005414(0);
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(a1, a2, v4);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  uint64_t v7 = type metadata accessor for TodayFeedConfigLite();
  *(void *)&a1[*(int *)(v7 + 20)] = *(void *)&a2[*(int *)(v7 + 20)];
  swift_bridgeObjectRetain();
  return a1;
}

char *sub_100007164(char *a1, char *a2)
{
  uint64_t v4 = sub_10000A0E0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48);
  int v7 = v6(a1, 1, v4);
  int v8 = v6(a2, 1, v4);
  if (!v7)
  {
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(v5 + 24))(a1, a2, v4);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(a1, v4);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    sub_100005414(0);
    memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(a1, a2, v4);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
LABEL_7:
  uint64_t v10 = type metadata accessor for TodayFeedConfigLite();
  *(void *)&a1[*(int *)(v10 + 20)] = *(void *)&a2[*(int *)(v10 + 20)];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

char *sub_100007300(char *a1, char *a2)
{
  uint64_t v4 = sub_10000A0E0();
  uint64_t v5 = *(void *)(v4 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
  {
    sub_100005414(0);
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(a1, a2, v4);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  uint64_t v7 = type metadata accessor for TodayFeedConfigLite();
  *(void *)&a1[*(int *)(v7 + 20)] = *(void *)&a2[*(int *)(v7 + 20)];
  return a1;
}

char *sub_100007420(char *a1, char *a2)
{
  uint64_t v4 = sub_10000A0E0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48);
  int v7 = v6(a1, 1, v4);
  int v8 = v6(a2, 1, v4);
  if (!v7)
  {
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(v5 + 40))(a1, a2, v4);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(a1, v4);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    sub_100005414(0);
    memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(a1, a2, v4);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
LABEL_7:
  uint64_t v10 = type metadata accessor for TodayFeedConfigLite();
  *(void *)&a1[*(int *)(v10 + 20)] = *(void *)&a2[*(int *)(v10 + 20)];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1000075B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000075C8);
}

uint64_t sub_1000075C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TodayFeedConfigLite();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t sub_100007634(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100007648);
}

uint64_t sub_100007648(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TodayFeedConfigLite();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for TodayConfigLite()
{
  uint64_t result = qword_100010918;
  if (!qword_100010918) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100007704()
{
  uint64_t result = type metadata accessor for TodayFeedConfigLite();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_100007790@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v16 = a2;
  uint64_t v4 = type metadata accessor for TodayFeedConfigLite();
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100007DE0(0, &qword_100010950, (uint64_t (*)(uint64_t, ValueMetadata *, unint64_t))&type metadata accessor for KeyedDecodingContainer);
  uint64_t v8 = v7;
  uint64_t v15 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v14 - v9;
  sub_100006734(a1, a1[3]);
  sub_100007D8C();
  sub_10000A3D0();
  if (!v2)
  {
    uint64_t v11 = v15;
    uint64_t v12 = v16;
    sub_100007E44(&qword_100010960);
    sub_10000A320();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v10, v8);
    sub_100006890((uint64_t)v6, v12);
  }
  return sub_100006778((uint64_t)a1);
}

uint64_t sub_10000799C()
{
  return 1;
}

Swift::Int sub_1000079A4()
{
  return sub_10000A3B0();
}

uint64_t sub_100007A04()
{
  return sub_10000A2C0();
}

Swift::Int sub_100007A28()
{
  return sub_10000A3B0();
}

uint64_t sub_100007A84@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  v7._countAndFlagsBits = *a1;
  uint64_t v3 = (void *)a1[1];
  v4._rawValue = &off_10000C6C0;
  v7._object = v3;
  Swift::Int v5 = sub_10000A300(v4, v7);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v5 != 0;
  return result;
}

void sub_100007AD8(void *a1@<X8>)
{
  *a1 = 0x6565467961646F74;
  a1[1] = 0xEF6769666E6F4364;
}

uint64_t sub_100007B00()
{
  return 0x6565467961646F74;
}

uint64_t sub_100007B24@<X0>(uint64_t a1@<X0>, void *a2@<X1>, BOOL *a3@<X8>)
{
  v8._countAndFlagsBits = a1;
  v5._rawValue = &off_10000C6F8;
  v8._object = a2;
  Swift::Int v6 = sub_10000A300(v5, v8);
  uint64_t result = swift_bridgeObjectRelease();
  *a3 = v6 != 0;
  return result;
}

void sub_100007B7C(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_100007B88(uint64_t a1)
{
  unint64_t v2 = sub_100007D8C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100007BC4(uint64_t a1)
{
  unint64_t v2 = sub_100007D8C();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100007C00@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100007790(a1, a2);
}

uint64_t sub_100007C18(void *a1)
{
  sub_100007DE0(0, &qword_100010968, (uint64_t (*)(uint64_t, ValueMetadata *, unint64_t))&type metadata accessor for KeyedEncodingContainer);
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  Swift::Int v6 = (char *)&v8 - v5;
  sub_100006734(a1, a1[3]);
  sub_100007D8C();
  sub_10000A3E0();
  type metadata accessor for TodayFeedConfigLite();
  sub_100007E44(&qword_100010970);
  sub_10000A360();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_100007D8C()
{
  unint64_t result = qword_100010958;
  if (!qword_100010958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010958);
  }
  return result;
}

void sub_100007DE0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = sub_100007D8C();
    unint64_t v7 = a3(a1, &type metadata for TodayConfigLite.CodingKeys, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t sub_100007E44(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for TodayFeedConfigLite();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for TodayConfigLite.CodingKeys(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for TodayConfigLite.CodingKeys(unsigned char *result, int a2, int a3)
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
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x100007F78);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100007FA0()
{
  return 0;
}

ValueMetadata *type metadata accessor for TodayConfigLite.CodingKeys()
{
  return &type metadata for TodayConfigLite.CodingKeys;
}

unint64_t sub_100007FBC()
{
  unint64_t result = qword_100010978;
  if (!qword_100010978)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010978);
  }
  return result;
}

unint64_t sub_100008014()
{
  unint64_t result = qword_100010980;
  if (!qword_100010980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010980);
  }
  return result;
}

unint64_t sub_10000806C()
{
  unint64_t result = qword_100010988;
  if (!qword_100010988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010988);
  }
  return result;
}

uint64_t *sub_1000080C0(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    sub_100004B00();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  return a1;
}

uint64_t sub_100008170(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for CuratedTodayFeedGroupConfigDataLite();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000081B4(uint64_t a1)
{
  sub_100004B00();
  int v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t sub_100008218(uint64_t a1, uint64_t a2)
{
  sub_100004B00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_10000827C(uint64_t a1, uint64_t a2)
{
  sub_100004B00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_1000082E0(uint64_t a1, uint64_t a2)
{
  sub_100004B00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_100008344(uint64_t a1, uint64_t a2)
{
  sub_100004B00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_1000083A8(uint64_t a1, uint64_t a2)
{
  sub_100004B00();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t sub_100008414(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_100004B00();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  return v7(a1, a2, a3, v6);
}

uint64_t type metadata accessor for TodayFeedGroupConfigLite()
{
  uint64_t result = qword_100010A00;
  if (!qword_100010A00) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1000084DC(uint64_t a1)
{
  sub_100004B00();
  if (v3 <= 0x3F)
  {
    uint64_t v4 = *(void *)(v2 - 8);
    swift_initEnumMetadataSingleCase();
    *(_DWORD *)(*(void *)(a1 - 8) + 84) = *(_DWORD *)(v4 + 84);
  }
}

uint64_t sub_100008580@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v16 = a2;
  sub_100004B00();
  uint64_t v5 = v4;
  uint64_t v15 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008CC0();
  uint64_t v9 = v8;
  uint64_t v18 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006734(a1, a1[3]);
  sub_100008D1C();
  sub_10000A3D0();
  if (!v2)
  {
    uint64_t v12 = v18;
    uint64_t v14 = v5;
    sub_100008D70();
    sub_10000A320();
    sub_100008DC4((uint64_t)a1, (uint64_t)v17);
    type metadata accessor for CuratedTodayFeedGroupConfigDataLite();
    sub_100008170(&qword_100010778);
    sub_100008170(&qword_100010780);
    sub_10000A140();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v11, v9);
    (*(void (**)(uint64_t, char *, uint64_t))(v15 + 32))(v16, v7, v14);
  }
  return sub_100006778((uint64_t)a1);
}

Swift::Int sub_100008814()
{
  return sub_10000895C();
}

uint64_t sub_100008824()
{
  return sub_10000A2C0();
}

Swift::Int sub_100008834()
{
  return sub_1000089DC();
}

uint64_t sub_100008844@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  return sub_100008A34(a1, (Swift::OpaquePointer)&off_10000C730, a2);
}

void sub_100008850(void *a1@<X8>)
{
  *a1 = 1701869940;
  a1[1] = 0xE400000000000000;
}

uint64_t sub_100008864()
{
  return 1701869940;
}

uint64_t sub_100008874@<X0>(uint64_t a1@<X0>, void *a2@<X1>, BOOL *a3@<X8>)
{
  v8._countAndFlagsBits = a1;
  v5._rawValue = &off_10000C768;
  v8._object = a2;
  Swift::Int v6 = sub_10000A300(v5, v8);
  uint64_t result = swift_bridgeObjectRelease();
  *a3 = v6 != 0;
  return result;
}

uint64_t sub_1000088CC(uint64_t a1)
{
  unint64_t v2 = sub_100008D1C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100008908(uint64_t a1)
{
  unint64_t v2 = sub_100008D1C();
  return CodingKey.debugDescription.getter(a1, v2);
}

Swift::Int sub_100008944()
{
  return sub_10000895C();
}

Swift::Int sub_10000895C()
{
  return sub_10000A3B0();
}

uint64_t sub_1000089AC()
{
  return sub_10000A2C0();
}

Swift::Int sub_1000089C4()
{
  return sub_1000089DC();
}

Swift::Int sub_1000089DC()
{
  return sub_10000A3B0();
}

uint64_t sub_100008A28@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  return sub_100008A34(a1, (Swift::OpaquePointer)&off_10000C7A0, a2);
}

uint64_t sub_100008A34@<X0>(uint64_t *a1@<X0>, Swift::OpaquePointer a2@<X3>, BOOL *a3@<X8>)
{
  v8._countAndFlagsBits = *a1;
  uint64_t v4 = (void *)a1[1];
  v8._object = v4;
  Swift::Int v6 = sub_10000A300(a2, v8);
  uint64_t result = swift_bridgeObjectRelease();
  *a3 = v6 != 0;
  return result;
}

void sub_100008A84(void *a1@<X8>)
{
  *a1 = 0x64657461727563;
  a1[1] = 0xE700000000000000;
}

uint64_t sub_100008AA0()
{
  return sub_10000A2E0();
}

uint64_t sub_100008B00()
{
  return sub_10000A2D0();
}

uint64_t sub_100008B50@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100008580(a1, a2);
}

uint64_t sub_100008B68()
{
  uint64_t v1 = v0;
  sub_100004B00();
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  uint64_t v5 = __chkstk_darwin(v2);
  uint64_t v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008E28(v1, (uint64_t)v9);
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v7, v9, v3);
  sub_10000A150();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
}

void sub_100008CC0()
{
  if (!qword_100010A10)
  {
    sub_100008D1C();
    unint64_t v0 = sub_10000A330();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100010A10);
    }
  }
}

unint64_t sub_100008D1C()
{
  unint64_t result = qword_100010A18;
  if (!qword_100010A18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010A18);
  }
  return result;
}

unint64_t sub_100008D70()
{
  unint64_t result = qword_100010A20;
  if (!qword_100010A20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010A20);
  }
  return result;
}

uint64_t sub_100008DC4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100008E28(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TodayFeedGroupConfigLite();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

ValueMetadata *type metadata accessor for TodayFeedGroupConfigLite.CodingType()
{
  return &type metadata for TodayFeedGroupConfigLite.CodingType;
}

unsigned char *_s22TodayFeedConfigDecoder24TodayFeedGroupConfigLiteO10CodingTypeOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x100008F40);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for TodayFeedGroupConfigLite.CodingKeys()
{
  return &type metadata for TodayFeedGroupConfigLite.CodingKeys;
}

unint64_t sub_100008F7C()
{
  unint64_t result = qword_100010A28;
  if (!qword_100010A28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010A28);
  }
  return result;
}

unint64_t sub_100008FD4()
{
  unint64_t result = qword_100010A30;
  if (!qword_100010A30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010A30);
  }
  return result;
}

unint64_t sub_10000902C()
{
  unint64_t result = qword_100010A38;
  if (!qword_100010A38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010A38);
  }
  return result;
}

unint64_t sub_100009084()
{
  unint64_t result = qword_100010A40;
  if (!qword_100010A40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010A40);
  }
  return result;
}

unint64_t sub_1000090D8()
{
  unint64_t result = qword_100010A48;
  if (!qword_100010A48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010A48);
  }
  return result;
}

uint64_t *sub_10000912C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *int v3 = *a2;
    int v3 = (uint64_t *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = sub_10000A1C0();
    uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v3;
}

uint64_t sub_100009214(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_10000A1C0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *sub_10000928C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_10000A1C0();
  uint64_t v9 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16);
  swift_bridgeObjectRetain();
  v9(v6, v7, v8);
  return a1;
}

void *sub_100009324(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_10000A1C0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *sub_1000093C0(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_10000A1C0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void *sub_10000943C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_10000A1C0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_1000094C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000094DC);
}

uint64_t sub_1000094DC(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_10000A1C0();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_10000958C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000095A0);
}

uint64_t sub_1000095A0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_10000A1C0();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for CuratedTodayFeedGroupConfigDataLite()
{
  uint64_t result = qword_100010AA8;
  if (!qword_100010AA8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100009694()
{
  uint64_t result = sub_10000A1C0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_10000972C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v22 = a2;
  uint64_t v4 = sub_10000A1C0();
  uint64_t v23 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100009CE8(0, &qword_100010AE0, (uint64_t (*)(uint64_t, ValueMetadata *, unint64_t))&type metadata accessor for KeyedDecodingContainer);
  uint64_t v24 = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v21 - v9;
  sub_100006734(a1, a1[3]);
  sub_100009C94();
  sub_10000A3D0();
  if (!v2)
  {
    uint64_t v11 = v8;
    uint64_t v12 = v23;
    char v26 = 1;
    sub_100009D4C(&qword_100010AF0);
    uint64_t v13 = v24;
    sub_10000A320();
    char v25 = 0;
    uint64_t v15 = sub_10000A310();
    uint64_t v16 = v10;
    uint64_t v18 = v17;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v13);
    uint64_t v19 = type metadata accessor for CuratedTodayFeedGroupConfigDataLite();
    unint64_t v20 = v22;
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))((char *)v22 + *(int *)(v19 + 20), v6, v4);
    uint64_t *v20 = v15;
    v20[1] = v18;
  }
  return sub_100006778((uint64_t)a1);
}

uint64_t sub_1000099D8(void *a1)
{
  sub_100009CE8(0, &qword_100010AF8, (uint64_t (*)(uint64_t, ValueMetadata *, unint64_t))&type metadata accessor for KeyedEncodingContainer);
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v7 = &v9[-v6];
  sub_100006734(a1, a1[3]);
  sub_100009C94();
  sub_10000A3E0();
  v9[15] = 0;
  sub_10000A350();
  if (!v1)
  {
    type metadata accessor for CuratedTodayFeedGroupConfigDataLite();
    v9[14] = 1;
    sub_10000A1C0();
    sub_100009D4C(&qword_100010B00);
    sub_10000A360();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_100009B90()
{
  if (*v0) {
    return 0x746E65746E6F63;
  }
  else {
    return 0x65707974627573;
  }
}

uint64_t sub_100009BC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100009F9C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100009BEC(uint64_t a1)
{
  unint64_t v2 = sub_100009C94();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100009C28(uint64_t a1)
{
  unint64_t v2 = sub_100009C94();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100009C64@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_10000972C(a1, a2);
}

uint64_t sub_100009C7C(void *a1)
{
  return sub_1000099D8(a1);
}

unint64_t sub_100009C94()
{
  unint64_t result = qword_100010AE8;
  if (!qword_100010AE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010AE8);
  }
  return result;
}

void sub_100009CE8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = sub_100009C94();
    unint64_t v7 = a3(a1, &type metadata for CuratedTodayFeedGroupConfigDataLite.CodingKeys, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t sub_100009D4C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000A1C0();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for CuratedTodayFeedGroupConfigDataLite.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100009E5CLL);
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

ValueMetadata *type metadata accessor for CuratedTodayFeedGroupConfigDataLite.CodingKeys()
{
  return &type metadata for CuratedTodayFeedGroupConfigDataLite.CodingKeys;
}

unint64_t sub_100009E98()
{
  unint64_t result = qword_100010B08;
  if (!qword_100010B08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010B08);
  }
  return result;
}

unint64_t sub_100009EF0()
{
  unint64_t result = qword_100010B10;
  if (!qword_100010B10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010B10);
  }
  return result;
}

unint64_t sub_100009F48()
{
  unint64_t result = qword_100010B18;
  if (!qword_100010B18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010B18);
  }
  return result;
}

uint64_t sub_100009F9C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x65707974627573 && a2 == 0xE700000000000000;
  if (v2 || (sub_10000A380() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x746E65746E6F63 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_10000A380();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_10000A090()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_10000A0A0()
{
  return type metadata accessor for URL();
}

uint64_t sub_10000A0B0()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

NSDate sub_10000A0C0()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_10000A0D0()
{
  return Date.init()();
}

uint64_t sub_10000A0E0()
{
  return type metadata accessor for Date();
}

uint64_t sub_10000A0F0()
{
  return dispatch thunk of _TeaJSONDecoder.decode<A>(_:from:)();
}

uint64_t sub_10000A100()
{
  return SafeishArray.items.getter();
}

uint64_t sub_10000A110()
{
  return type metadata accessor for SafeishArray();
}

uint64_t sub_10000A120()
{
  return SafeishKeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
}

uint64_t sub_10000A130()
{
  return FeedGroupConfig.data.getter();
}

uint64_t sub_10000A140()
{
  return FeedGroupConfig.init(from:)();
}

uint64_t sub_10000A150()
{
  return FeedGroupConfig.encode(to:)();
}

uint64_t sub_10000A160()
{
  return type metadata accessor for FeedGroupConfig();
}

uint64_t sub_10000A170()
{
  return FeedConfigDecoder.init()();
}

uint64_t sub_10000A180()
{
  return type metadata accessor for FeedConfigDecoder();
}

uint64_t sub_10000A190()
{
  return FormatArticle.identifier.getter();
}

uint64_t sub_10000A1A0()
{
  return FormatContent.themes.getter();
}

uint64_t sub_10000A1B0()
{
  return FormatContent.subgroups.getter();
}

uint64_t sub_10000A1C0()
{
  return type metadata accessor for FormatContent();
}

uint64_t sub_10000A1D0()
{
  return type metadata accessor for FormatPackage();
}

uint64_t sub_10000A1E0()
{
  return FormatContentSlot.items.getter();
}

uint64_t sub_10000A1F0()
{
  return type metadata accessor for FormatContentSlot();
}

uint64_t sub_10000A200()
{
  return FormatFileReference.url.getter();
}

uint64_t sub_10000A210()
{
  return FormatContentSlotItem.object.getter();
}

uint64_t sub_10000A220()
{
  return FormatContentSlotItem.auxiliary.getter();
}

uint64_t sub_10000A230()
{
  return type metadata accessor for FormatContentSlotItem();
}

uint64_t sub_10000A240()
{
  return FormatContentSubgroup.layouts.getter();
}

uint64_t sub_10000A250()
{
  return FormatContentSubgroup.contents.getter();
}

uint64_t sub_10000A260()
{
  return type metadata accessor for FormatContentSubgroup();
}

uint64_t sub_10000A270()
{
  return type metadata accessor for FormatContentSlotItemObject();
}

uint64_t sub_10000A280()
{
  return FormatFileReferenceCollection.references.getter();
}

uint64_t sub_10000A290()
{
  return FormatContentSlotItemAuxiliary.items.getter();
}

uint64_t sub_10000A2A0()
{
  return type metadata accessor for FormatContentSlotItemAuxiliary();
}

uint64_t sub_10000A2B0()
{
  return FormatLatestCompatibleFileReference.latestCompatible.getter();
}

uint64_t sub_10000A2C0()
{
  return String.hash(into:)();
}

uint64_t sub_10000A2D0()
{
  return RawRepresentable<>.encode(to:)();
}

uint64_t sub_10000A2E0()
{
  return RawRepresentable<>.init(from:)();
}

NSArray sub_10000A2F0()
{
  return Array._bridgeToObjectiveC()();
}

Swift::Int sub_10000A300(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_10000A310()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_10000A320()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t sub_10000A330()
{
  return type metadata accessor for KeyedDecodingContainer();
}

uint64_t sub_10000A340()
{
  return KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
}

uint64_t sub_10000A350()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_10000A360()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t sub_10000A370()
{
  return type metadata accessor for _ContiguousArrayStorage();
}

uint64_t sub_10000A380()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10000A390()
{
  return Hasher.init(_seed:)();
}

void sub_10000A3A0(Swift::UInt a1)
{
}

Swift::Int sub_10000A3B0()
{
  return Hasher._finalize()();
}

uint64_t sub_10000A3C0()
{
  return Decoder.safeishContainer<A>(keyedBy:)();
}

uint64_t sub_10000A3D0()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_10000A3E0()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t NDTodayFeedConfigDecodingServiceXPCInterface()
{
  return _NDTodayFeedConfigDecodingServiceXPCInterface();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
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

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initEnumMetadataSingleCase()
{
  return _swift_initEnumMetadataSingleCase();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}