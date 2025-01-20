void sub_100003234()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  objc_super v8;

  v8.receiver = v0;
  v8.super_class = (Class)type metadata accessor for NotificationViewController();
  objc_msgSendSuper2(&v8, "viewDidLoad");
  v1 = [v0 view];
  if (v1)
  {
    v2 = v1;
    v3 = [v1 heightAnchor];

    v4 = [v3 constraintEqualToConstant:0.0];
    [v4 setActive:1];

    v5 = [v0 view];
    if (v5)
    {
      v6 = v5;
      v7 = [self clearColor];
      [v6 setBackgroundColor:v7];

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_10000339C(void *a1)
{
  v2 = v1;
  swift_getObjectType();
  uint64_t v4 = sub_100006B80();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006B60();
  v8 = sub_100006B70();
  os_log_type_t v9 = sub_100006C30();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    v27 = v2;
    v11 = (uint8_t *)v10;
    uint64_t v12 = swift_slowAlloc();
    v26 = a1;
    uint64_t v29 = v12;
    *(_DWORD *)v11 = 136446210;
    uint64_t v13 = sub_100006CE0();
    uint64_t v28 = sub_100005B44(v13, v14, &v29);
    sub_100006C50();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "[%{public}s] Did receive notification", v11, 0xCu);
    swift_arrayDestroy();
    a1 = v26;
    swift_slowDealloc();
    v2 = v27;
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  id v15 = [a1 request];
  id v16 = [v15 content];

  id v17 = [v16 categoryIdentifier];
  uint64_t v18 = sub_100006BA0();
  uint64_t v20 = v19;

  if (v18 == sub_100006BA0() && v20 == v21)
  {
    swift_bridgeObjectRelease_n();
    sub_100006590();
  }
  else
  {
    char v22 = sub_100006CD0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v22) {
      sub_100006590();
    }
    else {
      sub_100003760(a1);
    }
  }
  id v23 = [v2 extensionContext];
  if (v23)
  {
    v24 = v23;
    sub_100006554(0, &qword_10000C7E8);
    Class isa = sub_100006BE0().super.isa;
    swift_bridgeObjectRelease();
    [v24 setNotificationActions:isa];
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

void *sub_100003760(void *a1)
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v3 = sub_100006B80();
  uint64_t v51 = *(void *)(v3 - 8);
  uint64_t v52 = v3;
  __chkstk_darwin(v3);
  v57 = (char *)&ObjectType - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100006AC0();
  uint64_t v55 = *(void *)(v5 - 8);
  v56 = (void *)v5;
  __chkstk_darwin(v5);
  v7 = (char *)&ObjectType - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100006AE0();
  uint64_t v53 = *(void *)(v8 - 8);
  uint64_t v54 = v8;
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&ObjectType - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100006B20();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  id v15 = (char *)&ObjectType - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  id v17 = (char *)&ObjectType - v16;
  unint64_t v61 = 0;
  uint64_t v18 = *(void **)(v1 + OBJC_IVAR___NotificationViewController_sleepStore);
  id v19 = objc_msgSend(a1, "date", ObjectType);
  sub_100006B00();

  Class isa = sub_100006AF0().super.isa;
  char v22 = *(void (**)(char *, uint64_t))(v12 + 8);
  uint64_t v21 = v12 + 8;
  v58 = v22;
  uint64_t v59 = v11;
  v22(v17, v11);
  id v23 = [v18 upcomingResolvedScheduleOccurrenceAfterDate:isa alarmStatus:&v61 error:0];

  if (v23)
  {
    unint64_t v62 = (unint64_t)&_swiftEmptyArrayStorage;
    id v24 = [v23 wakeUpEvent];
    id v25 = [v24 dueDate];

    sub_100006B00();
    sub_100006AD0();
    sub_100006AB0();
    uint64_t v26 = sub_100006B10();
    uint64_t v28 = v27;
    (*(void (**)(char *, void *))(v55 + 8))(v7, v56);
    (*(void (**)(char *, uint64_t))(v53 + 8))(v10, v54);
    if (v61 - 2 >= 2)
    {
      if (v61 > 1)
      {
        result = (void *)sub_100006CA0();
        __break(1u);
        return result;
      }
      if (qword_10000C710 != -1) {
        swift_once();
      }
      v42.super.Class isa = (Class)qword_10000C8F8;
      v64._countAndFlagsBits = 0xD000000000000019;
      v49._countAndFlagsBits = 0xE000000000000000;
      v64._object = (void *)0x80000001000078B0;
      v66.value._countAndFlagsBits = 0;
      v66.value._object = 0;
      v68._countAndFlagsBits = 0;
      v68._object = (void *)0xE000000000000000;
      sub_100006A80(v64, v66, v42, v68, v49);
      sub_100006444(0, &qword_10000C7D0, (uint64_t (*)(uint64_t))sub_1000064A8, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
      uint64_t v43 = swift_allocObject();
      *(_OWORD *)(v43 + 16) = xmmword_1000070D0;
      *(void *)(v43 + 56) = &type metadata for String;
      *(void *)(v43 + 64) = sub_100006500();
      *(void *)(v43 + 32) = v26;
      *(void *)(v43 + 40) = v28;
      sub_100006BB0();
    }
    else
    {
      if (qword_10000C710 != -1) {
        swift_once();
      }
      v29.super.Class isa = (Class)qword_10000C8F8;
      v49._countAndFlagsBits = 0xE000000000000000;
      v63._object = (void *)0x8000000100007890;
      v63._countAndFlagsBits = 0xD000000000000018;
      v65.value._countAndFlagsBits = 0;
      v65.value._object = 0;
      v67._countAndFlagsBits = 0;
      v67._object = (void *)0xE000000000000000;
      sub_100006A80(v63, v65, v29, v67, v49);
      sub_100006444(0, &qword_10000C7D0, (uint64_t (*)(uint64_t))sub_1000064A8, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
      uint64_t v30 = swift_allocObject();
      *(_OWORD *)(v30 + 16) = xmmword_1000070D0;
      *(void *)(v30 + 56) = &type metadata for String;
      *(void *)(v30 + 64) = sub_100006500();
      *(void *)(v30 + 32) = v26;
      *(void *)(v30 + 40) = v28;
      sub_100006BB0();
    }
    swift_bridgeObjectRelease();
    sub_100006BA0();
    NSString v44 = sub_100006B90();
    swift_bridgeObjectRelease();
    NSString v45 = sub_100006B90();
    swift_bridgeObjectRelease();
    id v46 = [self actionWithIdentifier:v44 title:v45 options:4];

    id v47 = v46;
    sub_100006BD0();
    if (*(void *)((v62 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v62 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_100006C00();
    }
    sub_100006C10();
    sub_100006BF0();

    v58(v15, v59);
    return (void *)v62;
  }
  else
  {
    sub_100006B60();
    id v31 = a1;
    v32 = sub_100006B70();
    os_log_type_t v33 = sub_100006C20();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = swift_slowAlloc();
      v56 = (void *)swift_slowAlloc();
      unint64_t v62 = (unint64_t)v56;
      *(_DWORD *)uint64_t v34 = 136446466;
      uint64_t v35 = sub_100006CE0();
      uint64_t v60 = sub_100005B44(v35, v36, (uint64_t *)&v62);
      uint64_t v55 = v21;
      sub_100006C50();
      swift_bridgeObjectRelease();
      *(_WORD *)(v34 + 12) = 2082;
      id v37 = [v31 date];
      sub_100006B00();

      sub_1000063EC();
      uint64_t v38 = v59;
      uint64_t v39 = sub_100006CC0();
      unint64_t v41 = v40;
      v58(v17, v38);
      uint64_t v60 = sub_100005B44(v39, v41, (uint64_t *)&v62);
      sub_100006C50();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v32, v33, "[%{public}s] Did not find an upcoming occurrence after %{public}s", (uint8_t *)v34, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    (*(void (**)(char *, uint64_t))(v51 + 8))(v57, v52);
    return &_swiftEmptyArrayStorage;
  }
}

void sub_100004060(void *a1, void (*a2)(uint64_t), id a3)
{
  v124 = a2;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v6 = sub_100006B50();
  uint64_t v112 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v111 = (char *)&v107 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006444(0, &qword_10000C7A8, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v8 - 8);
  v117 = (char *)&v107 - v9;
  uint64_t v10 = sub_100006AA0();
  uint64_t v119 = *(void *)(v10 - 8);
  uint64_t v120 = v10;
  uint64_t v11 = __chkstk_darwin(v10);
  v116 = (char *)&v107 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v110 = (char *)&v107 - v13;
  uint64_t v126 = sub_100006B80();
  uint64_t v14 = *(void *)(v126 - 8);
  uint64_t v15 = __chkstk_darwin(v126);
  v115 = (char *)&v107 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __chkstk_darwin(v15);
  id v19 = (char *)&v107 - v18;
  uint64_t v20 = __chkstk_darwin(v17);
  v121 = (char *)&v107 - v21;
  uint64_t v22 = __chkstk_darwin(v20);
  v125 = (char *)&v107 - v23;
  __chkstk_darwin(v22);
  id v25 = (char *)&v107 - v24;
  sub_100006B60();
  id v26 = a1;
  uint64_t v27 = sub_100006B70();
  os_log_type_t v28 = sub_100006C30();
  BOOL v29 = os_log_type_enabled(v27, v28);
  uint64_t v122 = ObjectType;
  uint64_t v113 = v6;
  v118 = v19;
  if (v29)
  {
    uint64_t v30 = swift_slowAlloc();
    uint64_t v108 = swift_slowAlloc();
    uint64_t aBlock = v108;
    *(_DWORD *)uint64_t v30 = 136446466;
    uint64_t v31 = sub_100006CE0();
    uint64_t v109 = v14;
    uint64_t v133 = sub_100005B44(v31, v32, &aBlock);
    id v114 = a3;
    sub_100006C50();
    swift_bridgeObjectRelease();
    *(_WORD *)(v30 + 12) = 2082;
    uint64_t v107 = v30 + 14;
    os_log_type_t v33 = v26;
    id v34 = v26;
    id v35 = [v34 description];
    uint64_t v36 = sub_100006BA0();
    unint64_t v38 = v37;

    uint64_t v39 = v126;
    uint64_t v133 = sub_100005B44(v36, v38, &aBlock);
    a3 = v114;
    sub_100006C50();

    uint64_t v40 = v109;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v27, v28, "[%{public}s] Did receive notification response: %{public}s", (uint8_t *)v30, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    unint64_t v41 = *(void (**)(char *, uint64_t))(v40 + 8);
    v41(v25, v39);
  }
  else
  {

    os_log_type_t v33 = v26;
    unint64_t v41 = *(void (**)(char *, uint64_t))(v14 + 8);
    v41(v25, v126);
  }
  id v42 = [v33 actionIdentifier];
  uint64_t v43 = sub_100006BA0();
  uint64_t v45 = v44;

  if (sub_100006BA0() == v43 && v46 == v45)
  {
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  id v114 = v33;
  char v47 = sub_100006CD0();
  swift_bridgeObjectRelease();
  if (v47)
  {
LABEL_8:
    swift_bridgeObjectRelease();
    v48 = v125;
    sub_100006B60();
    Swift::String v49 = sub_100006B70();
    os_log_type_t v50 = sub_100006C30();
    if (os_log_type_enabled(v49, v50))
    {
      uint64_t v51 = (uint8_t *)swift_slowAlloc();
      uint64_t aBlock = swift_slowAlloc();
      *(_DWORD *)uint64_t v51 = 136446210;
      uint64_t v52 = sub_100006CE0();
      uint64_t v133 = sub_100005B44(v52, v53, &aBlock);
      sub_100006C50();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v49, v50, "[%{public}s] Forwarding action to change next alarm", v51, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v41(v125, v126);
LABEL_11:
      id v54 = [objc_allocWithZone((Class)HKSPAnalyticsSleepNotificationEvent) initWithType:0 action:1];
      id v55 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v123
                                                                  + OBJC_IVAR___NotificationViewController_sleepStore), "analyticsManager"));
      [v55 trackEvent:v54];

      uint64_t v56 = 2;
LABEL_12:
      v124(v56);

      return;
    }
LABEL_10:

    v41(v48, v126);
    goto LABEL_11;
  }
  if (sub_100006BA0() == v43 && v57 == v45)
  {
    swift_bridgeObjectRelease();
    goto LABEL_17;
  }
  char v58 = sub_100006CD0();
  swift_bridgeObjectRelease();
  if (v58)
  {
LABEL_17:
    swift_bridgeObjectRelease();
    v48 = v121;
    sub_100006B60();
    Swift::String v49 = sub_100006B70();
    os_log_type_t v59 = sub_100006C30();
    if (os_log_type_enabled(v49, v59))
    {
      uint64_t v60 = (uint8_t *)swift_slowAlloc();
      uint64_t aBlock = swift_slowAlloc();
      *(_DWORD *)uint64_t v60 = 136446210;
      uint64_t v61 = sub_100006CE0();
      uint64_t v133 = sub_100005B44(v61, v62, &aBlock);
      sub_100006C50();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v49, v59, "[%{public}s] Forwarding action to turn on next alarm", v60, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v41(v121, v126);
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if (sub_100006BA0() == v43 && v63 == v45)
  {
    swift_bridgeObjectRelease();
LABEL_24:
    swift_bridgeObjectRelease();
    Swift::String_optional v65 = *(void **)(v123 + OBJC_IVAR___NotificationViewController_sleepStore);
    uint64_t v66 = swift_allocObject();
    *(void *)(v66 + 16) = v122;
    v131 = sub_1000069E8;
    uint64_t v132 = v66;
    uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
    uint64_t v128 = 1107296256;
    v129 = sub_1000051F0;
    v130 = &unk_1000085B0;
    Swift::String v67 = _Block_copy(&aBlock);
    swift_release();
    [v65 configureSleepFocusWithState:3 completion:v67];
    _Block_release(v67);
    id v68 = [objc_allocWithZone((Class)HKSPAnalyticsSleepNotificationEvent) initWithType:1 action:2];
    id v69 = [v65 analyticsManager];
LABEL_25:
    id v70 = v69;
    [v70 trackEvent:v68];

    v124(1);
    return;
  }
  char v64 = sub_100006CD0();
  swift_bridgeObjectRelease();
  if (v64) {
    goto LABEL_24;
  }
  if (sub_100006BA0() == v43 && v71 == v45)
  {
    swift_bridgeObjectRelease();
LABEL_30:
    swift_bridgeObjectRelease();
    v73 = *(void **)(v123 + OBJC_IVAR___NotificationViewController_sleepStore);
    uint64_t v74 = swift_allocObject();
    *(void *)(v74 + 16) = v122;
    v131 = sub_100006290;
    uint64_t v132 = v74;
    uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
    uint64_t v128 = 1107296256;
    v129 = sub_1000051F0;
    v130 = &unk_100008560;
    v75 = _Block_copy(&aBlock);
    swift_release();
    [v73 configureSleepFocusWithState:2 completion:v75];
    _Block_release(v75);
    id v68 = [objc_allocWithZone((Class)HKSPAnalyticsSleepNotificationEvent) initWithType:1 action:3];
    id v69 = [v73 analyticsManager];
    goto LABEL_25;
  }
  char v72 = sub_100006CD0();
  swift_bridgeObjectRelease();
  if (v72) {
    goto LABEL_30;
  }
  if (sub_100006BA0() == v43 && v76 == v45)
  {
    swift_bridgeObjectRelease_n();
    uint64_t v78 = v119;
    uint64_t v77 = v120;
    goto LABEL_35;
  }
  char v79 = sub_100006CD0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v78 = v119;
  uint64_t v77 = v120;
  if (v79)
  {
LABEL_35:
    v125 = (char *)v41;
    id v80 = (id)HKSPSleepFocusConfigurationURL();
    if (v80)
    {
      v81 = v80;
      v82 = v116;
      sub_100006A90();

      v83 = *(void (**)(char *, char *, uint64_t))(v78 + 32);
      uint64_t v84 = (uint64_t)v117;
      v83(v117, v82, v77);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v78 + 56))(v84, 0, 1, v77);
      int v85 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v78 + 48))(v84, 1, v77);
      uint64_t v86 = v122;
      v87 = v118;
      if (v85 != 1)
      {
        v88 = v110;
        v83(v110, (char *)v84, v77);
        v89 = v111;
        sub_100006B40();
        *(void *)(swift_allocObject() + 16) = v86;
        sub_100006B30();
        swift_release();
        (*(void (**)(char *, uint64_t))(v112 + 8))(v89, v113);
        (*(void (**)(char *, uint64_t))(v78 + 8))(v88, v77);
LABEL_44:
        id v54 = [objc_allocWithZone((Class)HKSPAnalyticsSleepNotificationEvent) initWithType:1 action:4];
        id v106 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v123
                                                                     + OBJC_IVAR___NotificationViewController_sleepStore), "analyticsManager"));
        [v106 trackEvent:v54];

        uint64_t v56 = 1;
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v84 = (uint64_t)v117;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v78 + 56))(v117, 1, 1, v77);
      v87 = v118;
    }
    sub_1000061DC(v84);
    sub_100006B60();
    v90 = sub_100006B70();
    os_log_type_t v91 = sub_100006C20();
    if (os_log_type_enabled(v90, v91))
    {
      v92 = (uint8_t *)swift_slowAlloc();
      uint64_t aBlock = swift_slowAlloc();
      *(_DWORD *)v92 = 136446210;
      uint64_t v93 = sub_100006CE0();
      uint64_t v133 = sub_100005B44(v93, v94, &aBlock);
      sub_100006C50();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v90, v91, "[%{public}s] failed to create sleep focus configuration url", v92, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    ((void (*)(char *, uint64_t))v125)(v87, v126);
    goto LABEL_44;
  }
  v95 = v115;
  sub_100006B60();
  id v96 = v114;
  v97 = sub_100006B70();
  os_log_type_t v98 = sub_100006C30();
  if (os_log_type_enabled(v97, v98))
  {
    uint64_t v99 = swift_slowAlloc();
    uint64_t v123 = swift_slowAlloc();
    uint64_t aBlock = v123;
    *(_DWORD *)uint64_t v99 = 136446466;
    id v114 = a3;
    uint64_t v100 = sub_100006CE0();
    v125 = (char *)v41;
    uint64_t v133 = sub_100005B44(v100, v101, &aBlock);
    sub_100006C50();
    swift_bridgeObjectRelease();
    *(_WORD *)(v99 + 12) = 2082;
    id v102 = [v96 actionIdentifier];
    uint64_t v103 = sub_100006BA0();
    unint64_t v105 = v104;

    uint64_t v133 = sub_100005B44(v103, v105, &aBlock);
    sub_100006C50();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v97, v98, "[%{public}s] Forwarding unrecognized action %{public}s", (uint8_t *)v99, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    ((void (*)(char *, uint64_t))v125)(v115, v126);
  }
  else
  {

    v41(v95, v126);
  }
  v124(2);
}

void sub_1000051F0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_100005268(char a1, uint64_t a2)
{
  uint64_t v4 = sub_100006B80();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t result = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 1) == 0)
  {
    sub_100006B60();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v9 = sub_100006B70();
    os_log_type_t v10 = sub_100006C20();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = swift_slowAlloc();
      uint64_t v16 = (void *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      uint64_t v19 = v17;
      *(_DWORD *)uint64_t v11 = 136446466;
      uint64_t v12 = sub_100006CE0();
      uint64_t v18 = sub_100005B44(v12, v13, &v19);
      sub_100006C50();
      swift_bridgeObjectRelease();
      *(_WORD *)(v11 + 12) = 2114;
      if (a2)
      {
        swift_errorRetain();
        uint64_t v14 = _swift_stdlib_bridgeErrorToNSError();
        uint64_t v18 = v14;
        sub_100006C50();
      }
      else
      {
        uint64_t v18 = 0;
        sub_100006C50();
        uint64_t v14 = 0;
      }
      *uint64_t v16 = v14;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "[%{public}s] failed to configure sleep focus with error: %{public}@", (uint8_t *)v11, 0x16u);
      sub_1000062D4();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  return result;
}

uint64_t sub_100005548(uint64_t a1)
{
  uint64_t v2 = sub_100006B80();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t result = __chkstk_darwin(v2);
  id v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    swift_errorRetain();
    sub_100006B60();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v7 = sub_100006B70();
    os_log_type_t v8 = sub_100006C20();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = swift_slowAlloc();
      unint64_t v13 = (void *)swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      uint64_t v16 = v14;
      *(_DWORD *)uint64_t v9 = 136446466;
      uint64_t v10 = sub_100006CE0();
      uint64_t v15 = sub_100005B44(v10, v11, &v16);
      sub_100006C50();
      swift_bridgeObjectRelease();
      *(_WORD *)(v9 + 12) = 2114;
      swift_errorRetain();
      uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v15 = v12;
      sub_100006C50();
      *unint64_t v13 = v12;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "[%{public}s] failed to launch configuration with error: %{public}@", (uint8_t *)v9, 0x16u);
      sub_1000062D4();
      swift_arrayDestroy();
      swift_slowDealloc();
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
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  return result;
}

id sub_100005890(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = OBJC_IVAR___NotificationViewController_sleepStore;
  id v7 = objc_allocWithZone((Class)HKSPSleepStore);
  os_log_type_t v8 = v3;
  NSString v9 = sub_100006B90();
  id v10 = [v7 initWithIdentifier:v9];

  *(void *)&v3[v6] = v10;
  if (a2)
  {
    NSString v11 = sub_100006B90();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v11 = 0;
  }
  v14.receiver = v8;
  v14.super_class = (Class)type metadata accessor for NotificationViewController();
  id v12 = objc_msgSendSuper2(&v14, "initWithNibName:bundle:", v11, a3);

  return v12;
}

id sub_1000059F0(void *a1)
{
  uint64_t v3 = OBJC_IVAR___NotificationViewController_sleepStore;
  id v4 = objc_allocWithZone((Class)HKSPSleepStore);
  uint64_t v5 = v1;
  NSString v6 = sub_100006B90();
  id v7 = [v4 initWithIdentifier:v6];

  *(void *)&v1[v3] = v7;
  v10.receiver = v5;
  v10.super_class = (Class)type metadata accessor for NotificationViewController();
  id v8 = objc_msgSendSuper2(&v10, "initWithCoder:", a1);

  return v8;
}

id sub_100005ADC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NotificationViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for NotificationViewController()
{
  return self;
}

uint64_t sub_100005B44(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100005C18(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000638C((uint64_t)v12, *a3);
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
      sub_10000638C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000633C((uint64_t)v12);
  return v7;
}

uint64_t sub_100005C18(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100006C60();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100005DD4(a5, a6);
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
  uint64_t v8 = sub_100006C80();
  if (!v8)
  {
    sub_100006C90();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100006CB0();
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

uint64_t sub_100005DD4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100005E6C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000606C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000606C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100005E6C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100005FE4(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100006C70();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100006C90();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100006BC0();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100006CB0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100006C90();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100005FE4(uint64_t a1, uint64_t a2)
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
  sub_10000699C(0, &qword_10000C7C0, (uint64_t)&type metadata for UInt8, (uint64_t (*)(void, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10000606C(char a1, int64_t a2, char a3, char *a4)
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
    sub_10000699C(0, &qword_10000C7C0, (uint64_t)&type metadata for UInt8, (uint64_t (*)(void, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
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
  uint64_t result = sub_100006CB0();
  __break(1u);
  return result;
}

uint64_t sub_1000061DC(uint64_t a1)
{
  sub_100006444(0, &qword_10000C7A8, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100006268()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100006278(uint64_t a1)
{
  return sub_100005548(a1);
}

uint64_t sub_100006280()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100006290(char a1, uint64_t a2)
{
  return sub_100005268(a1, a2);
}

uint64_t sub_1000062AC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000062BC()
{
  return swift_release();
}

uint64_t sub_1000062C4()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000062D4()
{
  if (!qword_10000C7B0)
  {
    sub_100006554(255, &qword_10000C7B8);
    unint64_t v0 = sub_100006C40();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10000C7B0);
    }
  }
}

uint64_t sub_10000633C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000638C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_1000063EC()
{
  unint64_t result = qword_10000C7C8;
  if (!qword_10000C7C8)
  {
    sub_100006B20();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C7C8);
  }
  return result;
}

void sub_100006444(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

unint64_t sub_1000064A8()
{
  unint64_t result = qword_10000C7D8;
  if (!qword_10000C7D8)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_10000C7D8);
  }
  return result;
}

unint64_t sub_100006500()
{
  unint64_t result = qword_10000C7E0;
  if (!qword_10000C7E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C7E0);
  }
  return result;
}

uint64_t sub_100006554(uint64_t a1, unint64_t *a2)
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

uint64_t sub_100006590()
{
  v17._object = &_swiftEmptyArrayStorage;
  if (qword_10000C710 != -1) {
    swift_once();
  }
  v0.super.Class isa = (Class)qword_10000C8F8;
  v17._countAndFlagsBits = 0xE000000000000000;
  v21._countAndFlagsBits = 0x45434E454C4953;
  v21._object = (void *)0xE700000000000000;
  v24.value._countAndFlagsBits = 0;
  v24.value._object = 0;
  v27._countAndFlagsBits = 0;
  v27._object = (void *)0xE000000000000000;
  sub_100006A80(v21, v24, v0, v27, v17);
  sub_100006BA0();
  NSString v1 = sub_100006B90();
  swift_bridgeObjectRelease();
  NSString v2 = sub_100006B90();
  swift_bridgeObjectRelease();
  uint64_t v3 = self;
  id v4 = [v3 actionWithIdentifier:v1 title:v2 options:0];

  id v5 = v4;
  sub_100006BD0();
  if (*(void *)(((uint64_t)v18._object & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((uint64_t)v18._object & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_100006C00();
  sub_100006C10();
  sub_100006BF0();
  v6.super.Class isa = (Class)qword_10000C8F8;
  v18._countAndFlagsBits = 0xE000000000000000;
  v22._countAndFlagsBits = 0x574F4C4C41;
  v22._object = (void *)0xE500000000000000;
  v25.value._countAndFlagsBits = 0;
  v25.value._object = 0;
  v28._countAndFlagsBits = 0;
  v28._object = (void *)0xE000000000000000;
  sub_100006A80(v22, v25, v6, v28, v18);
  sub_100006BA0();
  NSString v7 = sub_100006B90();
  swift_bridgeObjectRelease();
  NSString v8 = sub_100006B90();
  swift_bridgeObjectRelease();
  id v9 = [v3 actionWithIdentifier:v7 title:v8 options:0];

  id v10 = v9;
  sub_100006BD0();
  if (*(void *)(((uint64_t)v19._object & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((uint64_t)v19._object & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_100006C00();
  sub_100006C10();
  sub_100006BF0();
  v11.super.Class isa = (Class)qword_10000C8F8;
  v19._countAndFlagsBits = 0xE000000000000000;
  v23._countAndFlagsBits = 0x52554749464E4F43;
  v23._object = (void *)0xE900000000000045;
  v26.value._countAndFlagsBits = 0;
  v26.value._object = 0;
  v29._countAndFlagsBits = 0;
  v29._object = (void *)0xE000000000000000;
  sub_100006A80(v23, v26, v11, v29, v19);
  sub_100006BA0();
  NSString v12 = sub_100006B90();
  swift_bridgeObjectRelease();
  NSString v13 = sub_100006B90();
  swift_bridgeObjectRelease();
  id v14 = [v3 actionWithIdentifier:v12 title:v13 options:0];

  id v15 = v14;
  sub_100006BD0();
  if (*(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_100006C00();
  }
  sub_100006C10();
  sub_100006BF0();

  return v20;
}

uint64_t sub_100006928()
{
  _Block_release(*(const void **)(v0 + 16));
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100006960()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

void type metadata accessor for UNNotificationContentExtensionResponseOption(uint64_t a1)
{
}

void sub_10000699C(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_1000069F4()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t _s8SentinelCMa()
{
  return self;
}

id sub_100006A28()
{
  _s8SentinelCMa();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = [self bundleForClass:ObjCClassFromMetadata];
  qword_10000C8F8 = (uint64_t)result;
  return result;
}

uint64_t sub_100006A80(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

uint64_t sub_100006A90()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100006AA0()
{
  return type metadata accessor for URL();
}

uint64_t sub_100006AB0()
{
  return static Date.FormatStyle.TimeStyle.shortened.getter();
}

uint64_t sub_100006AC0()
{
  return type metadata accessor for Date.FormatStyle.TimeStyle();
}

uint64_t sub_100006AD0()
{
  return static Date.FormatStyle.DateStyle.omitted.getter();
}

uint64_t sub_100006AE0()
{
  return type metadata accessor for Date.FormatStyle.DateStyle();
}

NSDate sub_100006AF0()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_100006B00()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100006B10()
{
  return Date.formatted(date:time:)();
}

uint64_t sub_100006B20()
{
  return type metadata accessor for Date();
}

uint64_t sub_100006B30()
{
  return DeepLinkOpener.open(url:completion:)();
}

uint64_t sub_100006B40()
{
  return DeepLinkOpener.init()();
}

uint64_t sub_100006B50()
{
  return type metadata accessor for DeepLinkOpener();
}

uint64_t sub_100006B60()
{
  return static Logger.notification.getter();
}

uint64_t sub_100006B70()
{
  return Logger.logObject.getter();
}

uint64_t sub_100006B80()
{
  return type metadata accessor for Logger();
}

NSString sub_100006B90()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100006BA0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100006BB0()
{
  return String.init(format:_:)();
}

Swift::Int sub_100006BC0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100006BD0()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_100006BE0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100006BF0()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100006C00()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100006C10()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100006C20()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100006C30()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100006C40()
{
  return type metadata accessor for Optional();
}

uint64_t sub_100006C50()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100006C60()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100006C70()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100006C80()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100006C90()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100006CA0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100006CB0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100006CC0()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_100006CD0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100006CE0()
{
  return _typeName(_:qualified:)();
}

uint64_t HKSPSleepFocusConfigurationURL()
{
  return _HKSPSleepFocusConfigurationURL();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
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

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return _swift_getExistentialTypeMetadata();
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

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
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

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}