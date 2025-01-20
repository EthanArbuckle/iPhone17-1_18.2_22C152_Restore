dispatch_workloop_t rd_dispatch_workloop_create(const char *a1)
{
  dispatch_workloop_t v1;
  uint64_t vars8;

  v1 = dispatch_workloop_create(a1);

  return v1;
}

uint64_t sub_100003438()
{
  uint64_t v0 = sub_100006620();
  sub_1000034A8(v0, qword_10000CCB0);
  sub_10000350C(v0, (uint64_t)qword_10000CCB0);
  id v1 = [self ui];
  return sub_100006630();
}

uint64_t *sub_1000034A8(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_10000350C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100003544()
{
  uint64_t v0 = sub_100006620();
  sub_1000034A8(v0, qword_10000CA60);
  uint64_t v1 = sub_10000350C(v0, (uint64_t)qword_10000CA60);
  if (qword_10000CA30 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10000350C(v0, (uint64_t)qword_10000CCB0);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

void sub_100003878(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v168 = sub_100006580();
  uint64_t v167 = *(void *)(v168 - 8);
  __chkstk_darwin(v168);
  v165 = (char *)&v151 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v166 = sub_1000065C0();
  uint64_t v164 = *(void *)(v166 - 8);
  __chkstk_darwin(v166);
  v161 = (char *)&v151 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v163 = sub_100006560();
  uint64_t v162 = *(void *)(v163 - 8);
  __chkstk_darwin(v163);
  v160 = (char *)&v151 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v176 = sub_1000065E0();
  unint64_t v169 = *(void *)(v176 - 8);
  uint64_t v7 = __chkstk_darwin(v176);
  v159 = (char *)&v151 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v175 = (char *)&v151 - v9;
  uint64_t v10 = sub_1000065F0();
  unint64_t v171 = *(void *)(v10 - 8);
  uint64_t v172 = v10;
  __chkstk_darwin(v10);
  v170 = (char *)&v151 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100005478(&qword_10000CB30);
  __chkstk_darwin(v12 - 8);
  v14 = (char *)&v151 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100006600();
  uint64_t v178 = *(void *)(v15 - 8);
  uint64_t v16 = __chkstk_darwin(v15);
  uint64_t v17 = __chkstk_darwin(v16);
  v174 = (id *)((char *)&v151 - v18);
  __chkstk_darwin(v17);
  v20 = (char *)&v151 - v19;
  if (qword_10000CA38 != -1) {
    swift_once();
  }
  uint64_t v21 = sub_100006620();
  uint64_t v177 = sub_10000350C(v21, (uint64_t)qword_10000CA60);
  v22 = sub_100006610();
  os_log_type_t v23 = sub_1000066F0();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v24 = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, v23, "ContentExtension didReceiveNotification", v24, 2u);
    swift_slowDealloc();
  }

  id v25 = [a1 request];
  id v26 = [v25 content];

  v180 = v2;
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    v28 = (void *)Strong;
    NSString v29 = sub_100006680();
    [v28 setText:v29];
  }
  uint64_t v30 = swift_unknownObjectWeakLoadStrong();
  if (v30)
  {
    v31 = (void *)v30;
    NSString v32 = [v26 title];
    if (!v32)
    {
      sub_100006690();
      NSString v32 = sub_100006680();
      swift_bridgeObjectRelease();
    }
    [v31 setText:v32];
  }
  uint64_t v33 = swift_unknownObjectWeakLoadStrong();
  if (v33)
  {
    v34 = (void *)v33;
    NSString v35 = sub_100006680();
    [v34 setText:v35];
  }
  uint64_t v36 = swift_unknownObjectWeakLoadStrong();
  if (v36)
  {
    v37 = (void *)v36;
    NSString v38 = [v26 body];
    if (!v38)
    {
      sub_100006690();
      NSString v38 = sub_100006680();
      swift_bridgeObjectRelease();
    }
    [v37 setText:v38];
  }
  id v179 = v26;
  v39 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v39) {
    goto LABEL_87;
  }
  v40 = v39;
  [v39 setConstant:0.0];

  v41 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v41)
  {
LABEL_88:
    __break(1u);
    goto LABEL_89;
  }
  v42 = v41;
  [v41 setConstant:0.0];

  v43 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v43)
  {
LABEL_89:
    __break(1u);
    goto LABEL_90;
  }
  v44 = v43;
  [v43 setHidden:1];

  id v45 = v179;
  sub_100006760();
  uint64_t v46 = v178;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v178 + 48))(v14, 1, v15) == 1)
  {
    sub_1000054BC((uint64_t)v14);
    id v47 = v45;
    v48 = sub_100006610();
    os_log_type_t v49 = sub_100006700();
    if (os_log_type_enabled(v48, v49))
    {
      v50 = (uint8_t *)swift_slowAlloc();
      unint64_t v182 = swift_slowAlloc();
      *(_DWORD *)v50 = 136315138;
      id v51 = [v47 categoryIdentifier];
      uint64_t v52 = sub_100006690();
      unint64_t v54 = v53;

      uint64_t v181 = sub_10000551C(v52, v54, (uint64_t *)&v182);
      sub_1000067B0();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v48, v49, "Expect a non-nil notificationIdentifier in notification. {categoryIdentifier: %s}", v50, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    return;
  }
  (*(void (**)(char *, char *, uint64_t))(v46 + 32))(v20, v14, v15);
  id v55 = [objc_allocWithZone((Class)REMStore) init];
  v173 = v20;
  id v158 = v55;
  v56 = (void *)sub_100006790();
  uint64_t v155 = v15;
  id v57 = [v56 userActivity];
  id v58 = v180;
  if (v57)
  {
    v59 = *(void **)&v180[OBJC_IVAR____TtC37RemindersNotificationContentExtension28RDNotificationViewController_notificationUserActivity];
    *(void *)&v180[OBJC_IVAR____TtC37RemindersNotificationContentExtension28RDNotificationViewController_notificationUserActivity] = v57;
    v60 = (id *)v57;

    id v61 = [v58 traitCollection];
    [v61 displayScale];
    double v63 = v62;

    v64 = v170;
    unint64_t v65 = v171;
    uint64_t v66 = v172;
    (*(void (**)(char *, void, uint64_t))(v171 + 104))(v170, enum case for REMApplicationIconFormat.notificationLongLook(_:), v172);
    v174 = v60;
    v67 = (void *)sub_100006710();
    (*(void (**)(char *, uint64_t))(v65 + 8))(v64, v66);
    if (v67)
    {
      swift_bridgeObjectRelease();
      id v68 = [objc_allocWithZone((Class)UIImage) initWithCGImage:v67 scale:0 orientation:v63];
      v69 = (void *)swift_unknownObjectWeakLoadStrong();
      if (!v69)
      {
LABEL_90:
        __break(1u);
        goto LABEL_91;
      }
      v70 = v69;
      [v69 setImage:v68 forState:0];

      v71 = (void *)swift_unknownObjectWeakLoadStrong();
      if (!v71)
      {
LABEL_91:
        __break(1u);
        goto LABEL_92;
      }
      v72 = v71;
      [v71 setConstant:8.0];

      v73 = (void *)swift_unknownObjectWeakLoadStrong();
      if (!v73)
      {
LABEL_92:
        __break(1u);
        goto LABEL_93;
      }
      v74 = v73;
      [v73 setConstant:34.0];

      v75 = (void *)swift_unknownObjectWeakLoadStrong();
      if (!v75)
      {
LABEL_93:
        __break(1u);
        goto LABEL_94;
      }
      v76 = v75;
      [v75 setHidden:0];
    }
    else
    {
      v77 = (void *)swift_unknownObjectWeakLoadStrong();
      if (!v77)
      {
LABEL_94:
        __break(1u);
        goto LABEL_95;
      }
      v78 = v77;
      [v77 setConstant:0.0];

      v79 = (void *)swift_unknownObjectWeakLoadStrong();
      if (!v79)
      {
LABEL_95:
        __break(1u);
        goto LABEL_96;
      }
      v80 = v79;
      [v79 setConstant:0.0];

      v81 = (void *)swift_unknownObjectWeakLoadStrong();
      if (!v81)
      {
LABEL_96:
        __break(1u);
        return;
      }
      v76 = v81;
      [v81 setHidden:1];
    }

    id v58 = v180;
  }
  id v154 = v56;
  id v82 = [v58 extensionContext];
  v83 = (void (*)(char *, uint64_t))v179;
  if (v82)
  {
    v84 = v82;
    id v85 = [v82 notificationActions];

    unint64_t v86 = sub_100005B74();
    unint64_t v87 = sub_1000066D0();

    unint64_t v182 = v87;
    if (v87 >> 62) {
      goto LABEL_75;
    }
    uint64_t v88 = *(void *)((v87 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v88)
    {
LABEL_40:
      unint64_t v153 = v86;
      LODWORD(v172) = enum case for RDUserNotificationAction.snoozeToNextThirds(_:);
      v170 = (char *)(v87 & 0xC000000000000001);
      unint64_t v171 = v169 + 104;
      v174 = (id *)(v169 + 8);
      unint64_t v86 = 4;
      unint64_t v169 = v87;
      uint64_t v157 = v88;
      v89 = v175;
      uint64_t v90 = v176;
      while (1)
      {
        unint64_t v91 = v86 - 4;
        id v92 = v170 ? (id)sub_100006810() : *(id *)(v87 + 8 * v86);
        v93 = v92;
        id v94 = [v92 identifier];
        uint64_t v95 = sub_100006690();
        uint64_t v97 = v96;

        v156 = *(void (**)(char *, void, uint64_t))v171;
        v156(v89, v172, v90);
        uint64_t v98 = sub_1000065D0();
        uint64_t v100 = v99;
        v83 = (void (*)(char *, uint64_t))*v174;
        ((void (*)(char *, uint64_t))*v174)(v89, v90);
        if (v95 == v98 && v97 == v100) {
          break;
        }
        unint64_t v87 = sub_100006870();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v87) {
          goto LABEL_53;
        }
        if (__OFADD__(v91, 1))
        {
          __break(1u);
LABEL_75:
          swift_bridgeObjectRetain();
          uint64_t v88 = sub_100006850();
          if (!v88) {
            goto LABEL_76;
          }
          goto LABEL_40;
        }
        ++v86;
        v83 = (void (*)(char *, uint64_t))v179;
        unint64_t v87 = v169;
        if (v91 + 1 == v157) {
          goto LABEL_76;
        }
      }

      swift_bridgeObjectRelease_n();
LABEL_53:
      swift_bridgeObjectRelease();
      unint64_t v152 = v86 - 4;
      if ((v182 & 0xC000000000000001) != 0)
      {
        id v102 = (id)sub_100006810();
      }
      else
      {
        if (v91 >= *(void *)((v182 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
LABEL_86:
          __break(1u);
LABEL_87:
          __break(1u);
          goto LABEL_88;
        }
        id v102 = *(id *)(v182 + 8 * v86);
      }
      v103 = v102;
      v104 = v161;
      sub_1000065A0();
      sub_100005478(&qword_10000CB48);
      uint64_t v105 = sub_1000065B0();
      uint64_t v106 = *(void *)(v105 - 8);
      unint64_t v107 = (*(unsigned __int8 *)(v106 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v106 + 80);
      uint64_t v108 = swift_allocObject();
      *(_OWORD *)(v108 + 16) = xmmword_100006DC0;
      (*(void (**)(unint64_t, void, uint64_t))(v106 + 104))(v108 + v107, enum case for Calendar.Component.hour(_:), v105);
      sub_100005C30(v108);
      swift_setDeallocating();
      swift_arrayDestroy();
      swift_deallocClassInstance();
      v109 = v165;
      sub_100006570();
      v110 = v160;
      sub_100006590();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v167 + 8))(v109, v168);
      (*(void (**)(char *, uint64_t))(v164 + 8))(v104, v166);
      uint64_t v111 = sub_100006550();
      LOBYTE(v109) = v112;
      (*(void (**)(char *, uint64_t))(v162 + 8))(v110, v163);
      if (v109) {
        uint64_t v111 = 0;
      }
      [self nextThirdsHourFromHour:v111];
      uint64_t v113 = sub_100006770();
      uint64_t v115 = v114;
      sub_100006780();
      id v116 = [v103 title];
      uint64_t v117 = sub_100006690();
      uint64_t v119 = v118;

      if (v117 == v113 && v119 == v115)
      {

        swift_bridgeObjectRelease();
LABEL_63:
        uint64_t v121 = v155;

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v122 = v178;
        v123 = v173;
        goto LABEL_64;
      }
      char v120 = sub_100006870();
      swift_bridgeObjectRelease();
      if (v120)
      {

        goto LABEL_63;
      }
      uint64_t v177 = (uint64_t)v103;
      v124 = v159;
      uint64_t v125 = v176;
      v156(v159, v172, v176);
      sub_1000065D0();
      v83(v124, v125);
      NSString v126 = sub_100006680();
      swift_bridgeObjectRelease();
      id v127 = [self iconWithSystemImageName:v126];

      NSString v128 = sub_100006680();
      swift_bridgeObjectRelease();
      NSString v129 = sub_100006680();
      swift_bridgeObjectRelease();
      id v130 = [self actionWithIdentifier:v128 title:v129 options:0 icon:v127];

      unint64_t v131 = v182;
      id v132 = v130;
      if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
        || (v131 & 0x8000000000000000) != 0
        || (v131 & 0x4000000000000000) != 0)
      {
        unint64_t v131 = sub_100005BB4(v131);
        unint64_t v182 = v131;
      }
      uint64_t v133 = v131 & 0xFFFFFFFFFFFFFF8;
      v123 = v173;
      id v134 = v179;
      if (v152 < *(void *)((v131 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        v135 = *(void **)(v133 + 8 * v86);
        *(void *)(v133 + 8 * v86) = v132;

        sub_1000066E0();
        id v136 = [v180 extensionContext];
        v137 = (void *)v177;
        if (v136)
        {
          v138 = v136;
          swift_bridgeObjectRetain();
          Class isa = sub_1000066C0().super.isa;
          swift_bridgeObjectRelease();
          [v138 setNotificationActions:isa];

          (*(void (**)(char *, uint64_t))(v178 + 8))(v123, v155);
          goto LABEL_65;
        }

        uint64_t v122 = v178;
        uint64_t v121 = v155;
LABEL_64:
        (*(void (**)(char *, uint64_t))(v122 + 8))(v123, v121);
LABEL_65:
        swift_bridgeObjectRelease();
        return;
      }
      goto LABEL_86;
    }
LABEL_76:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  v140 = v180;
  v141 = sub_100006610();
  os_log_type_t v142 = sub_100006700();
  if (os_log_type_enabled(v141, v142))
  {
    v143 = (uint8_t *)swift_slowAlloc();
    unint64_t v182 = swift_slowAlloc();
    *(_DWORD *)v143 = 136315138;
    id v144 = [v140 extensionContext];
    if (v144)
    {
      v145 = v144;
      id v146 = [v144 notificationActions];

      sub_100005B74();
      uint64_t v147 = sub_1000066D0();
    }
    else
    {
      uint64_t v147 = 0;
    }
    uint64_t v181 = v147;
    sub_100005478(&qword_10000CB38);
    uint64_t v148 = sub_1000067A0();
    unint64_t v150 = v149;
    swift_bridgeObjectRelease();
    uint64_t v181 = sub_10000551C(v148, v150, (uint64_t *)&v182);
    sub_1000067B0();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v141, v142, "Cannot find notification action(s) to patch {actions: %s}", v143, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v178 + 8))(v173, v155);
}

void sub_100004FC4()
{
  uint64_t v1 = v0;
  if (qword_10000CA38 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100006620();
  sub_10000350C(v2, (uint64_t)qword_10000CA60);
  uint64_t v3 = sub_100006610();
  os_log_type_t v4 = sub_1000066F0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "ContentExtension didTapAppLinkButton", v5, 2u);
    swift_slowDealloc();
  }

  uint64_t v6 = *(void **)(v1
                + OBJC_IVAR____TtC37RemindersNotificationContentExtension28RDNotificationViewController_notificationUserActivity);
  if (v6)
  {
    id v7 = v6;
    sub_100006720();
  }
}

id sub_100005150(uint64_t a1, uint64_t a2, void *a3)
{
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  *(void *)&v3[OBJC_IVAR____TtC37RemindersNotificationContentExtension28RDNotificationViewController_notificationUserActivity] = 0;
  if (a2)
  {
    NSString v6 = sub_100006680();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  v9.receiver = v3;
  v9.super_class = (Class)type metadata accessor for RDNotificationViewController();
  id v7 = objc_msgSendSuper2(&v9, "initWithNibName:bundle:", v6, a3);

  return v7;
}

id sub_1000052AC(void *a1)
{
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  *(void *)&v1[OBJC_IVAR____TtC37RemindersNotificationContentExtension28RDNotificationViewController_notificationUserActivity] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for RDNotificationViewController();
  id v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id sub_100005394()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RDNotificationViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for RDNotificationViewController()
{
  return self;
}

uint64_t sub_100005478(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000054BC(uint64_t a1)
{
  uint64_t v2 = sub_100005478(&qword_10000CB30);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000551C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000055F0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100005FB4((uint64_t)v12, *a3);
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
      sub_100005FB4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100005F64(v12);
  return v7;
}

uint64_t sub_1000055F0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1000067C0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1000057AC(a5, a6);
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
  uint64_t v8 = sub_100006830();
  if (!v8)
  {
    sub_100006840();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100006860();
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

uint64_t sub_1000057AC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100005844(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100005A24(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100005A24(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100005844(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1000059BC(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100006800();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100006840();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1000066B0();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100006860();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100006840();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_1000059BC(uint64_t a1, uint64_t a2)
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
  sub_100005478(&qword_10000CB68);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100005A24(char a1, int64_t a2, char a3, char *a4)
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
    sub_100005478(&qword_10000CB68);
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
  uint64_t result = sub_100006860();
  __break(1u);
  return result;
}

unint64_t sub_100005B74()
{
  unint64_t result = qword_10000CB40;
  if (!qword_10000CB40)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10000CB40);
  }
  return result;
}

uint64_t sub_100005BB4(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_100006850();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }

  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2, 0, a1);
}

void *sub_100005C30(uint64_t a1)
{
  uint64_t v2 = sub_1000065B0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  unint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v37 = (char *)&v30 - v7;
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    sub_100005478(&qword_10000CB50);
    uint64_t v9 = sub_1000067F0();
    uint64_t v10 = 0;
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    NSString v35 = v12;
    uint64_t v36 = v9 + 56;
    uint64_t v13 = *(unsigned __int8 *)(v11 + 64);
    uint64_t v32 = v8;
    uint64_t v33 = a1 + ((v13 + 32) & ~v13);
    uint64_t v14 = *(void *)(v11 + 56);
    uint64_t v15 = (void (**)(char *, uint64_t))(v11 - 8);
    v31 = (uint64_t (**)(unint64_t, char *, uint64_t))(v11 + 16);
    while (1)
    {
      uint64_t v34 = v10;
      v35(v37, v33 + v14 * v10, v2);
      sub_100005F20(&qword_10000CB58);
      uint64_t v16 = sub_100006660();
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
          sub_100005F20(&qword_10000CB60);
          char v23 = sub_100006670();
          v24 = *v15;
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

uint64_t sub_100005F20(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000065B0();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100005F64(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return _swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100005FB4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100006014()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for RDObjectDescription()
{
  return self;
}

id sub_100006090(uint64_t a1, uint64_t a2, void *a3, void **a4)
{
  if (*a3 != -1) {
    swift_once();
  }
  uint64_t v5 = *a4;

  return v5;
}

id sub_100006120()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RDDispatchQueue_ObjC();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for RDDispatchQueue_ObjC()
{
  return self;
}

NSObject *sub_100006178()
{
  uint64_t result = rd_dispatch_workloop_create("com.apple.remindd.xpc.default");
  qword_10000CCC8 = (uint64_t)result;
  return result;
}

uint64_t sub_1000061A8()
{
  uint64_t v0 = sub_100006740();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100006730();
  __chkstk_darwin(v4);
  uint64_t v5 = sub_100006650();
  __chkstk_darwin(v5 - 8);
  sub_1000063E4();
  sub_100006640();
  v8[1] = &_swiftEmptyArrayStorage;
  sub_100006424();
  sub_100005478(&qword_10000CCA0);
  sub_10000647C();
  sub_1000067E0();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:), v0);
  if (qword_10000CA50 != -1) {
    swift_once();
  }
  id v6 = (id)qword_10000CCD8;
  uint64_t result = sub_100006750();
  qword_10000CCD0 = result;
  return result;
}

unint64_t sub_1000063E4()
{
  unint64_t result = qword_10000CC90;
  if (!qword_10000CC90)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10000CC90);
  }
  return result;
}

unint64_t sub_100006424()
{
  unint64_t result = qword_10000CC98;
  if (!qword_10000CC98)
  {
    sub_100006730();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000CC98);
  }
  return result;
}

unint64_t sub_10000647C()
{
  unint64_t result = qword_10000CCA8;
  if (!qword_10000CCA8)
  {
    sub_1000064D8(&qword_10000CCA0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000CCA8);
  }
  return result;
}

uint64_t sub_1000064D8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

NSObject *sub_100006520()
{
  uint64_t result = rd_dispatch_workloop_create("com.apple.remindd.discretionary");
  qword_10000CCD8 = (uint64_t)result;
  return result;
}

uint64_t sub_100006550()
{
  return DateComponents.hour.getter();
}

uint64_t sub_100006560()
{
  return type metadata accessor for DateComponents();
}

uint64_t sub_100006570()
{
  return Date.init()();
}

uint64_t sub_100006580()
{
  return type metadata accessor for Date();
}

uint64_t sub_100006590()
{
  return Calendar.dateComponents(_:from:)();
}

uint64_t sub_1000065A0()
{
  return static Calendar.current.getter();
}

uint64_t sub_1000065B0()
{
  return type metadata accessor for Calendar.Component();
}

uint64_t sub_1000065C0()
{
  return type metadata accessor for Calendar();
}

uint64_t sub_1000065D0()
{
  return RDUserNotificationAction.rawValue.getter();
}

uint64_t sub_1000065E0()
{
  return type metadata accessor for RDUserNotificationAction();
}

uint64_t sub_1000065F0()
{
  return type metadata accessor for REMApplicationIconFormat();
}

uint64_t sub_100006600()
{
  return type metadata accessor for REMNotificationIdentifier();
}

uint64_t sub_100006610()
{
  return Logger.logObject.getter();
}

uint64_t sub_100006620()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100006630()
{
  return Logger.init(_:)();
}

uint64_t sub_100006640()
{
  return static DispatchQoS.utility.getter();
}

uint64_t sub_100006650()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_100006660()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_100006670()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_100006680()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100006690()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000066A0()
{
  return String.init<A>(describing:)();
}

Swift::Int sub_1000066B0()
{
  return String.UTF8View._foreignCount()();
}

NSArray sub_1000066C0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_1000066D0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000066E0()
{
  return specialized Array._endMutation()();
}

uint64_t sub_1000066F0()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100006700()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100006710()
{
  return REMUserActivity.appIconAndName(format:scale:)();
}

void sub_100006720()
{
}

uint64_t sub_100006730()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t sub_100006740()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_100006750()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t sub_100006760()
{
  return UNNotificationContent.notificationIdentifier.getter();
}

uint64_t sub_100006770()
{
  return REMReminderNextThirdsHour.stringForSnoozingUntil()()._countAndFlagsBits;
}

uint64_t sub_100006780()
{
  return REMReminderNextThirdsHour.systemImageStringForSnoozingUntil()()._countAndFlagsBits;
}

uint64_t sub_100006790()
{
  return REMStore.fetchReminder(notificationIdentifier:includingDueDateDeltaAlerts:)();
}

uint64_t sub_1000067A0()
{
  return Optional.descriptionOrNil.getter();
}

uint64_t sub_1000067B0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_1000067C0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_1000067D0()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_1000067E0()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_1000067F0()
{
  return static _SetStorage.allocate(capacity:)();
}

uint64_t sub_100006800()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100006810()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100006830()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100006840()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100006850()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100006860()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100006870()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100006880()
{
  return Error.localizedDescription.getter();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return _dispatch_workloop_create(label);
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

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
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

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
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

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
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