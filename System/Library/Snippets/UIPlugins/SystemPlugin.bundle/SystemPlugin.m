uint64_t sub_27C0()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_33238();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2834()
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v1 = v0;
  return sub_33248();
}

uint64_t sub_28A0()
{
  uint64_t v0 = sub_331C8();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = sub_32F18();
  if (!result)
  {
    if (qword_411C0 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_7150(v0, (uint64_t)qword_44260);
    (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v5, v0);
    sub_1AFAC((uint64_t)"SystemPlugin/IntentsUIStandardViewModel.swift", 45, 2, 32, (uint64_t)v3);
  }
  return result;
}

id sub_29CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4 = v3;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v9 = sub_63C4(&qword_41358);
  sub_9370();
  uint64_t v11 = v10;
  __chkstk_darwin(v12);
  v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = &v4[OBJC_IVAR____TtC12SystemPlugin26IntentsUIStandardViewModel__resolvedViews];
  v26 = &_swiftEmptyArrayStorage;
  v16 = v4;
  sub_63C4(&qword_41258);
  sub_33218();
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v15, v14, v9);
  if (((unint64_t)&_swiftEmptyArrayStorage & 0xC000000000000000) != 0 && sub_33F18()) {
    sub_6EFC((unint64_t)&_swiftEmptyArrayStorage);
  }
  else {
    v17 = &_swiftEmptySetSingleton;
  }
  *(void *)&v16[OBJC_IVAR____TtC12SystemPlugin26IntentsUIStandardViewModel_handledParameters] = v17;
  v18 = &v16[OBJC_IVAR____TtC12SystemPlugin26IntentsUIStandardViewModel_dataModel];
  uint64_t v19 = sub_32F78();
  uint64_t v20 = *(void *)(v19 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v18, a1, v19);
  v21 = (uint64_t *)&v16[OBJC_IVAR____TtC12SystemPlugin26IntentsUIStandardViewModel_remoteViewControllerProvider];
  if (a2)
  {
    uint64_t *v21 = a2;
    v21[1] = a3;
    swift_retain();
  }
  else
  {
    uint64_t *v21 = (uint64_t)sub_2BF8;
    v21[1] = 0;
  }

  v25.receiver = v16;
  v25.super_class = ObjectType;
  id v22 = objc_msgSendSuper2(&v25, "init");
  sub_927C(a2);
  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(a1, v19);
  return v22;
}

void sub_2BF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = self;
  v8[4] = a2;
  v8[5] = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 1107296256;
  v8[2] = sub_2CD0;
  v8[3] = &unk_3DE50;
  v7 = _Block_copy(v8);
  swift_retain();
  swift_release();
  [v6 requestRemoteViewControllerWithRequestInfo:a1 reply:v7];
  _Block_release(v7);
}

void sub_2CD0(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_2D5C()
{
  sub_2834();
  if (((unint64_t)_swiftEmptyArrayStorage & 0xC000000000000000) != 0 && sub_33F18())
  {
    sub_6EFC((unint64_t)_swiftEmptyArrayStorage);
    uint64_t v1 = v4;
  }
  else
  {
    uint64_t v1 = &_swiftEmptySetSingleton;
  }
  uint64_t v2 = (void *)(v0 + OBJC_IVAR____TtC12SystemPlugin26IntentsUIStandardViewModel_handledParameters);
  swift_beginAccess();
  *uint64_t v2 = v1;
  swift_bridgeObjectRelease();
  return sub_2E00(0);
}

uint64_t sub_2E00(unint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_32F48();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = __chkstk_darwin(v4);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v46 - v8;
  uint64_t v10 = v1 + OBJC_IVAR____TtC12SystemPlugin26IntentsUIStandardViewModel_dataModel;
  uint64_t v11 = *(void *)(sub_32F58() + 16);
  uint64_t result = swift_bridgeObjectRelease();
  if (v11 <= (uint64_t)a1) {
    return result;
  }
  uint64_t v53 = v2;
  if (qword_411C0 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_331C8();
  v47 = (void *)sub_7150(v13, (uint64_t)qword_44260);
  v14 = sub_331B8();
  os_log_type_t v15 = sub_33C88();
  unint64_t v16 = v15;
  BOOL v17 = os_log_type_enabled(v14, v15);
  v49 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v17)
  {
    uint64_t v18 = v5;
    unint64_t v19 = a1;
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v20 = 134217984;
    unint64_t v55 = v19;
    sub_33D48();
    _os_log_impl(&dword_0, v14, (os_log_type_t)v16, "Resolving slot #%ld", v20, 0xCu);
    a1 = v19;
    uint64_t v5 = v18;
    swift_slowDealloc();
  }

  uint64_t v21 = sub_32F58();
  uint64_t v22 = v53;
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  if (*(void *)(v21 + 16) <= a1)
  {
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    uint64_t v40 = sub_33F18();
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  v23 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
  uint64_t v10 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v24 = *(void *)(v5 + 72);
  unint64_t v50 = a1;
  v54 = v9;
  v48 = v23;
  v23(v9, (char *)(v21 + ((v10 + 32) & ~v10) + v24 * a1), v4);
  swift_bridgeObjectRelease();
  objc_super v25 = (void *)sub_28A0();
  id v26 = [v25 intent];

  self;
  uint64_t v27 = swift_dynamicCastObjCClass();

  uint64_t v51 = v5;
  uint64_t v52 = v4;
  if (v27
    || (v28 = (void *)sub_28A0(),
        id v29 = [v28 intent],
        v28,
        self,
        uint64_t v30 = swift_dynamicCastObjCClass(),
        v29,
        v30))
  {
    v47 = _swiftEmptyArrayStorage;
LABEL_11:
    v31 = (void *)sub_28A0();
    id v32 = [objc_allocWithZone((Class)INUIExtensionRequestInfo) initWithInteraction:v31];

    v46 = *(void (**)(id, uint64_t (*)(void *, uint64_t), void *))(v22
                                                                                       + OBJC_IVAR____TtC12SystemPlugin26IntentsUIStandardViewModel_remoteViewControllerProvider);
    uint64_t v33 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v34 = v49;
    v35 = v54;
    uint64_t v36 = v52;
    v48(v49, v54, v52);
    v37 = (void *)swift_allocObject();
    unint64_t v38 = v50;
    v37[2] = v33;
    v37[3] = v38;
    v37[4] = v47;
    uint64_t v39 = v51;
    (*(void (**)(uint64_t, char *, uint64_t))(v51 + 32))((uint64_t)v37 + ((v10 + 40) & ~v10), v34, v36);
    swift_retain();
    v46(v32, sub_725C, v37);

    swift_release();
    (*(void (**)(char *, uint64_t))(v39 + 8))(v35, v36);
    return swift_release();
  }
  unint64_t v16 = (unint64_t)sub_3384();
  if (sub_34B8())
  {
LABEL_17:
    v47 = (void *)v16;
    goto LABEL_11;
  }
  if (v16 >> 62) {
    goto LABEL_23;
  }
  uint64_t v40 = *(void *)((char *)&dword_10 + (v16 & 0xFFFFFFFFFFFFFF8));
LABEL_16:
  if (v40) {
    goto LABEL_17;
  }
  swift_bridgeObjectRelease();
  v41 = sub_331B8();
  os_log_type_t v42 = sub_33C88();
  BOOL v43 = os_log_type_enabled(v41, v42);
  unint64_t v44 = v50;
  if (v43)
  {
    v45 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v45 = 134217984;
    unint64_t v55 = v44;
    sub_33D48();
    _os_log_impl(&dword_0, v41, v42, "Skipping slot #%ld; no unhandled params", v45, 0xCu);
    swift_slowDealloc();
  }

  sub_2E00(v44 + 1);
  return (*(uint64_t (**)(char *, uint64_t))(v51 + 8))(v54, v52);
}

void *sub_3384()
{
  uint64_t v1 = v0;
  uint64_t v2 = (void *)sub_28A0();
  id v3 = [v2 intent];

  id v4 = [v3 _intentInstanceDescription];
  uint64_t v5 = sub_921C(v4, (SEL *)&selRef_name);
  unint64_t v7 = v6;
  uint64_t v8 = sub_921C(v4, (SEL *)&selRef_responseName);
  uint64_t v10 = v9;
  uint64_t v11 = sub_32F28();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v12 = v1;
  uint64_t v13 = sub_5B18(v11, v5, v7, v12, v8, v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v14 = sub_5C94((unint64_t)v13, (uint64_t)v12);

  return v14;
}

void *sub_34B8()
{
  uint64_t v1 = sub_32F48();
  sub_9370();
  uint64_t v3 = v2;
  __chkstk_darwin(v4);
  unint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(sub_32F28() + 16);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v0, v1);
  if (!v7)
  {
    BOOL v12 = 1;
LABEL_7:
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v1);
    return (void *)v12;
  }
  uint64_t result = (void *)sub_32F28();
  if (result[2])
  {
    uint64_t v9 = result[4];
    unint64_t v10 = result[5];
    swift_bridgeObjectRelease();
    uint64_t v11 = HIBYTE(v10) & 0xF;
    if ((v10 & 0x2000000000000000) == 0) {
      uint64_t v11 = v9 & 0xFFFFFFFFFFFFLL;
    }
    BOOL v12 = v11 == 0;
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_35C0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v47 = a5;
  uint64_t v48 = a3;
  uint64_t v49 = a2;
  uint64_t v9 = sub_33818();
  uint64_t v42 = *(void *)(v9 - 8);
  uint64_t v43 = v9;
  __chkstk_darwin(v9);
  uint64_t v40 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = sub_33838();
  uint64_t v39 = *(void *)(v41 - 8);
  __chkstk_darwin(v41);
  unint64_t v38 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_32F48();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  uint64_t v15 = __chkstk_darwin(v12);
  __chkstk_darwin(v15);
  BOOL v17 = (char *)&v37 - v16;
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
  v18((char *)&v37 - v16, a6, v12);
  v46 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18(v46, (uint64_t)v17, v12);
  unint64_t v19 = (*(unsigned __int8 *)(v13 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  unint64_t v20 = (v14 + v19 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v21 = (char *)swift_allocObject();
  uint64_t v22 = v48;
  *((void *)v21 + 2) = a1;
  *((void *)v21 + 3) = v22;
  uint64_t v37 = a4;
  v23 = a1;
  uint64_t v24 = v47;
  *((void *)v21 + 4) = a4;
  *((void *)v21 + 5) = v24;
  uint64_t v25 = v49;
  uint64_t v44 = v13;
  uint64_t v45 = v12;
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(&v21[v19], v17, v12);
  *(void *)&v21[v20] = v25;
  id v26 = self;
  swift_bridgeObjectRetain();
  id v27 = v23;
  swift_retain();
  swift_errorRetain();
  id v28 = v27;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_errorRetain();
  if ([v26 isMainThread])
  {
    uint64_t v29 = (uint64_t)v46;
    sub_3AD4(v23, v22, v37, v24, (uint64_t)v46, v49);
  }
  else
  {
    sub_752C(0, (unint64_t *)&qword_41370);
    uint64_t v30 = (void *)sub_33CB8();
    uint64_t v31 = swift_allocObject();
    *(void *)(v31 + 16) = sub_739C;
    *(void *)(v31 + 24) = v21;
    aBlock[4] = sub_7438;
    aBlock[5] = v31;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_630C;
    aBlock[3] = &unk_3DD60;
    id v32 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    uint64_t v33 = v38;
    sub_33828();
    aBlock[0] = _swiftEmptyArrayStorage;
    sub_7478((unint64_t *)&unk_41EB0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_63C4((uint64_t *)&unk_41380);
    sub_74C0();
    v34 = v40;
    uint64_t v35 = v43;
    sub_33D78();
    sub_33CC8();
    _Block_release(v32);

    (*(void (**)(char *, uint64_t))(v42 + 8))(v34, v35);
    (*(void (**)(char *, uint64_t))(v39 + 8))(v33, v41);
    uint64_t v29 = (uint64_t)v46;
  }
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v29, v45);
  return swift_errorRelease();
}

void sub_3AD4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t KeyPath, uint64_t a6)
{
  uint64_t v10 = sub_32F48();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  __chkstk_darwin(v10);
  if (a1)
  {
    swift_beginAccess();
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    if (!Strong) {
      return;
    }
    uint64_t v14 = (void *)Strong;
    uint64_t v46 = KeyPath;
    uint64_t v47 = a3;
    uint64_t v15 = qword_411C0;
    id v16 = a1;
    if (v15 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_331C8();
    sub_7150(v17, (uint64_t)qword_44260);
    uint64_t v18 = sub_331B8();
    os_log_type_t v19 = sub_33C88();
    if (os_log_type_enabled(v18, v19))
    {
      unint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)unint64_t v20 = 134217984;
      *(void *)&long long aBlock = v47;
      sub_33D48();
      _os_log_impl(&dword_0, v18, v19, "Remote VC vended for slot #%ld", v20, 0xCu);
      swift_slowDealloc();
    }

    sub_752C(0, &qword_41390);
    unint64_t v21 = swift_bridgeObjectRetain();
    uint64_t v22 = sub_41F4(v21);
    id v23 = sub_4414(v22, 0, 0);
    [v16 setDelegate:v14 completion:0];
    uint64_t v24 = swift_allocObject();
    swift_unknownObjectWeakInit();
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)&v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v46, v10);
    unint64_t v25 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
    uint64_t v26 = swift_allocObject();
    uint64_t v27 = v47;
    *(void *)(v26 + 16) = v24;
    *(void *)(v26 + 24) = v27;
    (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v26 + v25, (char *)&v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v10);
    *(void *)(v26 + ((v12 + v25 + 7) & 0xFFFFFFFFFFFFFFF8)) = v16;
    uint64_t v51 = sub_75F8;
    uint64_t v52 = v26;
    *(void *)&long long aBlock = _NSConcreteStackBlock;
    *((void *)&aBlock + 1) = 1107296256;
    uint64_t v49 = sub_5320;
    unint64_t v50 = &unk_3DDB0;
    id v28 = _Block_copy(&aBlock);
    id v29 = v16;
    swift_release();
    [v29 setIdealConfiguration:v23 animated:0 completion:v28];
    _Block_release(v28);
  }
  else
  {
    swift_beginAccess();
    uint64_t v30 = swift_unknownObjectWeakLoadStrong();
    if (!v30) {
      return;
    }
    id v23 = (id)v30;
    if (!a6)
    {
      if (qword_411C0 != -1) {
        swift_once();
      }
      uint64_t v37 = sub_331C8();
      sub_7150(v37, (uint64_t)qword_44260);
      unint64_t v38 = sub_331B8();
      os_log_type_t v39 = sub_33C98();
      if (os_log_type_enabled(v38, v39))
      {
        uint64_t v40 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v40 = 134217984;
        *(void *)&long long aBlock = a3;
        sub_33D48();
        _os_log_impl(&dword_0, v38, v39, "Request for remote VC failed for slot #%ld.", v40, 0xCu);
        swift_slowDealloc();
      }

      goto LABEL_19;
    }
    swift_errorRetain();
    if (qword_411C0 != -1) {
      goto LABEL_24;
    }
    while (1)
    {
      uint64_t v31 = sub_331C8();
      sub_7150(v31, (uint64_t)qword_44260);
      swift_errorRetain();
      swift_errorRetain();
      id v32 = sub_331B8();
      os_log_type_t v33 = sub_33C98();
      if (os_log_type_enabled(v32, v33))
      {
        uint64_t v34 = swift_slowAlloc();
        *(void *)&long long aBlock = swift_slowAlloc();
        *(_DWORD *)uint64_t v34 = 134218242;
        v53[0] = a3;
        uint64_t v46 = KeyPath;
        sub_33D48();
        *(_WORD *)(v34 + 12) = 2082;
        swift_getErrorValue();
        uint64_t v35 = sub_33FA8();
        v53[0] = sub_10310(v35, v36, (uint64_t *)&aBlock);
        sub_33D48();
        swift_bridgeObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl(&dword_0, v32, v33, "Request for remote VC failed for slot #%ld: %{public}s", (uint8_t *)v34, 0x16u);
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
LABEL_19:
      sub_32F38();
      LOBYTE(v52) = 1;
      KeyPath = swift_getKeyPath();
      swift_getKeyPath();
      uint64_t v41 = (void (*)(uint64_t *, void))sub_33228();
      uint64_t v43 = v42;
      sub_6C78();
      uint64_t v44 = *(char **)(*v43 + 16);
      sub_6CC4(v44);
      uint64_t v45 = *v43;
      *(void *)(v45 + 16) = v44 + 1;
      sub_7514(&aBlock, (_OWORD *)(v45 + 48 * (void)v44 + 32));
      v41(v53, 0);
      swift_release();
      swift_release();
      if (!__OFADD__(a3, 1)) {
        break;
      }
      __break(1u);
LABEL_24:
      swift_once();
    }
    sub_2E00(a3 + 1);
  }
}

uint64_t sub_41F4(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_33F18();
    swift_bridgeObjectRelease();
  }
  sub_752C(0, &qword_41368);
  sub_6BD0(&qword_41398, &qword_41368);
  uint64_t result = sub_33C68();
  uint64_t v4 = result;
  uint64_t v9 = result;
  if (!v2)
  {
    uint64_t v5 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
    if (v5) {
      goto LABEL_5;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    return v4;
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_33F18();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v5) {
    goto LABEL_13;
  }
LABEL_5:
  if (v5 >= 1)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v7 = (id)sub_33E68();
      }
      else {
        id v7 = *(id *)(a1 + 8 * i + 32);
      }
      sub_7A24(&v8, v7);
    }
    swift_bridgeObjectRelease();
    return v9;
  }
  __break(1u);
  return result;
}

uint64_t sub_4360(uint64_t a1)
{
  uint64_t v2 = sub_33C68();
  uint64_t v10 = v2;
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = (Swift::Int *)(a1 + 40);
    do
    {
      Swift::Int v5 = *(v4 - 1);
      Swift::Int v6 = *v4;
      swift_bridgeObjectRetain();
      sub_7CC0(&v9, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
    return v10;
  }
  else
  {
    uint64_t v7 = v2;
    swift_bridgeObjectRelease();
  }
  return v7;
}

id sub_4414(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  sub_752C(0, &qword_41368);
  sub_6BD0(&qword_41398, &qword_41368);
  Class isa = sub_33C38().super.isa;
  swift_bridgeObjectRelease();
  id v7 = [v5 initWithParameters:isa interactiveBehavior:a2 hostedViewContext:a3];

  return v7;
}

void sub_44E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v45 = a5;
  uint64_t v43 = a3;
  uint64_t v8 = sub_33818();
  uint64_t v41 = *(void *)(v8 - 8);
  uint64_t v42 = v8;
  __chkstk_darwin(v8);
  os_log_type_t v39 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_33838();
  uint64_t v38 = *(void *)(v40 - 8);
  __chkstk_darwin(v40);
  uint64_t v37 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_32F48();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  uint64_t v14 = __chkstk_darwin(v11);
  __chkstk_darwin(v14);
  id v16 = (char *)&v37 - v15;
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  v17((char *)&v37 - v15, a4, v11);
  uint64_t v46 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17(v46, (uint64_t)v16, v11);
  uint64_t v18 = v43;
  unint64_t v19 = (*(unsigned __int8 *)(v12 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  unint64_t v20 = (v13 + v19 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v21 = (char *)swift_allocObject();
  uint64_t v22 = a2;
  *((void *)v21 + 2) = a2;
  *((void *)v21 + 3) = a1;
  *((void *)v21 + 4) = v18;
  uint64_t v23 = a1;
  uint64_t v24 = v22;
  unint64_t v25 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
  uint64_t v44 = v11;
  v25(&v21[v19], v16, v11);
  uint64_t v26 = v45;
  *(void *)&v21[v20] = v45;
  uint64_t v27 = self;
  swift_retain();
  swift_errorRetain();
  id v28 = v26;
  swift_retain();
  swift_errorRetain();
  id v29 = v28;
  if ([v27 isMainThread])
  {
    uint64_t v30 = (uint64_t)v46;
    sub_49E0(v24, v23, v18, (uint64_t)v46, v29);
  }
  else
  {
    sub_752C(0, (unint64_t *)&qword_41370);
    uint64_t v45 = (void *)v24;
    uint64_t v43 = v23;
    uint64_t v31 = (void *)sub_33CB8();
    uint64_t v32 = swift_allocObject();
    *(void *)(v32 + 16) = sub_770C;
    *(void *)(v32 + 24) = v21;
    aBlock[4] = sub_9348;
    aBlock[5] = v32;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_630C;
    aBlock[3] = &unk_3DE28;
    os_log_type_t v33 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    uint64_t v34 = v37;
    sub_33828();
    aBlock[0] = _swiftEmptyArrayStorage;
    sub_7478((unint64_t *)&unk_41EB0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_63C4((uint64_t *)&unk_41380);
    sub_74C0();
    uint64_t v35 = v39;
    uint64_t v36 = v42;
    sub_33D78();
    sub_33CC8();
    _Block_release(v33);

    (*(void (**)(char *, uint64_t))(v41 + 8))(v35, v36);
    (*(void (**)(char *, uint64_t))(v38 + 8))(v34, v40);
    uint64_t v30 = (uint64_t)v46;
  }
  swift_release();
  swift_release();
  swift_errorRelease();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v30, v44);
}

void sub_49E0(uint64_t a1, uint64_t a2, uint64_t KeyPath, uint64_t a4, void *a5)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v9 = (void *)Strong;
    uint64_t v39 = KeyPath;
    if (!a2)
    {
      id v16 = [a5 configuration];
      if (v16)
      {
        uint64_t v17 = v16;
        id v18 = [v16 parameters];

        sub_752C(0, &qword_41368);
        sub_6BD0(&qword_41398, &qword_41368);
        unint64_t v19 = (void *)sub_33C48();
      }
      else if (((unint64_t)_swiftEmptyArrayStorage & 0xC000000000000000) != 0 && sub_33F18())
      {
        sub_6EFC((unint64_t)_swiftEmptyArrayStorage);
        unint64_t v19 = v38;
      }
      else
      {
        unint64_t v19 = &_swiftEmptySetSingleton;
      }
      if (qword_411C0 != -1) {
        swift_once();
      }
      uint64_t v25 = sub_331C8();
      sub_7150(v25, (uint64_t)qword_44260);
      swift_bridgeObjectRetain_n();
      uint64_t v26 = sub_331B8();
      os_log_type_t v27 = sub_33C88();
      if (os_log_type_enabled(v26, v27))
      {
        uint64_t v28 = swift_slowAlloc();
        *(void *)&v41[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v28 = 134218242;
        sub_33D48();
        *(_WORD *)(v28 + 12) = 2080;
        sub_752C(0, &qword_41368);
        sub_6BD0(&qword_41398, &qword_41368);
        swift_bridgeObjectRetain();
        uint64_t v29 = sub_33C58();
        unint64_t v31 = v30;
        swift_bridgeObjectRelease();
        v40[0] = sub_10310(v29, v31, (uint64_t *)v41);
        sub_33D48();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_0, v26, v27, "Successfully set remoteVC configuration for slot #%ld; handled parameters: %s",
          (uint8_t *)v28,
          0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      swift_beginAccess();
      sub_5068((unint64_t)v19);
      swift_endAccess();
      *(void *)&v41[0] = a5;
      char v42 = 0;
      KeyPath = swift_getKeyPath();
      swift_getKeyPath();
      id v32 = a5;
      os_log_type_t v33 = (void (*)(void *, void))sub_33228();
      uint64_t v35 = v34;
      sub_6C78();
      uint64_t v36 = *(char **)(*v35 + 16);
      sub_6CC4(v36);
      uint64_t v37 = *v35;
      *(void *)(v37 + 16) = v36 + 1;
      sub_7514(v41, (_OWORD *)(v37 + 48 * (void)v36 + 32));
      v33(v40, 0);
      swift_release();
      swift_release();
      goto LABEL_18;
    }
    swift_errorRetain();
    if (qword_411C0 != -1) {
      goto LABEL_22;
    }
    while (1)
    {
      uint64_t v10 = sub_331C8();
      sub_7150(v10, (uint64_t)qword_44260);
      swift_errorRetain();
      swift_errorRetain();
      uint64_t v11 = sub_331B8();
      os_log_type_t v12 = sub_33C98();
      if (os_log_type_enabled(v11, v12))
      {
        uint64_t v13 = swift_slowAlloc();
        *(void *)&v41[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v13 = 134218242;
        v40[0] = KeyPath;
        sub_33D48();
        *(_WORD *)(v13 + 12) = 2082;
        swift_getErrorValue();
        uint64_t v14 = sub_33FA8();
        v40[0] = sub_10310(v14, v15, (uint64_t *)v41);
        sub_33D48();
        swift_bridgeObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl(&dword_0, v11, v12, "Unable to setIdealConfiguration for slot #%ld: %{public}s", (uint8_t *)v13, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_errorRelease();
        swift_errorRelease();
      }

      sub_32F38();
      char v42 = 1;
      KeyPath = swift_getKeyPath();
      swift_getKeyPath();
      unint64_t v20 = (void (*)(void *, void))sub_33228();
      uint64_t v22 = v21;
      sub_6C78();
      uint64_t v23 = *(char **)(*v22 + 16);
      sub_6CC4(v23);
      uint64_t v24 = *v22;
      *(void *)(v24 + 16) = v23 + 1;
      sub_7514(v41, (_OWORD *)(v24 + 48 * (void)v23 + 32));
      v20(v40, 0);
      swift_release();
      swift_release();
      swift_errorRelease();
LABEL_18:
      if (!__OFADD__(v39, 1)) {
        break;
      }
      __break(1u);
LABEL_22:
      swift_once();
    }
    sub_2E00(v39 + 1);
  }
}

void sub_5068(unint64_t a1)
{
  unint64_t v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    sub_33D98();
    sub_752C(0, &qword_41368);
    sub_6BD0(&qword_41398, &qword_41368);
    sub_33C78();
    unint64_t v1 = (unint64_t)v17[1];
    id v16 = v17[2];
    uint64_t v2 = (uint64_t)v17[3];
    id v3 = v17[4];
    unint64_t v4 = (unint64_t)v17[5];
  }
  else
  {
    id v3 = 0;
    uint64_t v5 = -1 << *(unsigned char *)(a1 + 32);
    id v16 = (void *)(a1 + 56);
    uint64_t v2 = ~v5;
    uint64_t v6 = -v5;
    if (v6 < 64) {
      uint64_t v7 = ~(-1 << v6);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v4 = v7 & *(void *)(a1 + 56);
  }
  int64_t v8 = (unint64_t)(v2 + 64) >> 6;
  if ((v1 & 0x8000000000000000) != 0) {
    goto LABEL_10;
  }
  while (1)
  {
    if (v4)
    {
      uint64_t v9 = (v4 - 1) & v4;
      unint64_t v10 = __clz(__rbit64(v4)) | ((void)v3 << 6);
      uint64_t v11 = (char *)v3;
      goto LABEL_29;
    }
    uint64_t v13 = (uint64_t)v3 + 1;
    if (__OFADD__(v3, 1)) {
      break;
    }
    if (v13 >= v8) {
      goto LABEL_32;
    }
    unint64_t v14 = v16[v13];
    uint64_t v11 = (char *)v3 + 1;
    if (!v14)
    {
      uint64_t v11 = (char *)v3 + 2;
      if ((uint64_t)v3 + 2 >= v8) {
        goto LABEL_32;
      }
      unint64_t v14 = v16[(void)v11];
      if (!v14)
      {
        uint64_t v11 = (char *)v3 + 3;
        if ((uint64_t)v3 + 3 >= v8) {
          goto LABEL_32;
        }
        unint64_t v14 = v16[(void)v11];
        if (!v14)
        {
          uint64_t v11 = (char *)v3 + 4;
          if ((uint64_t)v3 + 4 >= v8) {
            goto LABEL_32;
          }
          unint64_t v14 = v16[(void)v11];
          if (!v14)
          {
            uint64_t v11 = (char *)v3 + 5;
            if ((uint64_t)v3 + 5 >= v8) {
              goto LABEL_32;
            }
            unint64_t v14 = v16[(void)v11];
            if (!v14)
            {
              uint64_t v15 = (uint64_t)v3 + 6;
              while (v15 < v8)
              {
                unint64_t v14 = v16[v15++];
                if (v14)
                {
                  uint64_t v11 = (char *)(v15 - 1);
                  goto LABEL_28;
                }
              }
LABEL_32:
              sub_7770();
              return;
            }
          }
        }
      }
    }
LABEL_28:
    uint64_t v9 = (v14 - 1) & v14;
    unint64_t v10 = __clz(__rbit64(v14)) + ((void)v11 << 6);
LABEL_29:
    id v12 = *(id *)(*(void *)(v1 + 48) + 8 * v10);
    if (!v12) {
      goto LABEL_32;
    }
    while (1)
    {
      sub_7A24(v17, v12);

      id v3 = v11;
      unint64_t v4 = v9;
      if ((v1 & 0x8000000000000000) == 0) {
        break;
      }
LABEL_10:
      if (sub_33DC8())
      {
        sub_752C(0, &qword_41368);
        swift_unknownObjectRetain();
        swift_dynamicCast();
        id v12 = v17[0];
        swift_unknownObjectRelease();
        uint64_t v11 = (char *)v3;
        uint64_t v9 = v4;
        if (v12) {
          continue;
        }
      }
      goto LABEL_32;
    }
  }
  __break(1u);
}

void sub_5320(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

void sub_538C(uint64_t *a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t *a6@<X8>)
{
  uint64_t v46 = a5;
  uint64_t v49 = a2;
  uint64_t v11 = sub_331C8();
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v16 = *a1;
  unint64_t v15 = a1[1];
  if ((v15 & 0x2000000000000000) != 0) {
    uint64_t v17 = HIBYTE(v15) & 0xF;
  }
  else {
    uint64_t v17 = *a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v17)
  {
    uint64_t v41 = a4;
    uint64_t v42 = v14;
    uint64_t v43 = (char *)&v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v44 = v12;
    sub_5910(46, 0xE100000000000000, v16, v15);
    uint64_t v47 = a6;
    uint64_t v48 = v6;
    if (v18) {
      unint64_t v19 = 15;
    }
    else {
      unint64_t v19 = sub_33AC8();
    }
    swift_bridgeObjectRetain();
    sub_33B08();
    swift_bridgeObjectRelease();
    uint64_t v20 = sub_33AA8();
    uint64_t v22 = v21;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_59F8(v19, v16, v15);
    uint64_t v45 = sub_33AA8();
    swift_bridgeObjectRelease();
    if (a3)
    {
      BOOL v23 = v20 == v49 && v22 == a3;
      if (v23 || (sub_33F78() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        sub_752C(0, &qword_41368);
        uint64_t v24 = (void *)sub_28A0();
        id v25 = [v24 intent];

        swift_getObjectType();
        uint64_t v17 = (uint64_t)sub_5A9C();
LABEL_39:
        a6 = v47;
        goto LABEL_40;
      }
    }
    uint64_t v26 = (void *)sub_28A0();
    id v27 = [v26 intentResponse];

    if (v27)
    {
      if (v46)
      {
        if (v20 == v41 && v22 == v46)
        {
          swift_bridgeObjectRelease();
        }
        else
        {
          char v29 = sub_33F78();
          swift_bridgeObjectRelease();
          if ((v29 & 1) == 0)
          {

LABEL_25:
            swift_bridgeObjectRelease();
            uint64_t v30 = v44;
            if (qword_411C0 != -1) {
              swift_once();
            }
            uint64_t v31 = sub_7150(v30, (uint64_t)qword_44260);
            uint64_t v32 = v42;
            os_log_type_t v33 = v43;
            (*(void (**)(char *, uint64_t, uint64_t))(v42 + 16))(v43, v31, v30);
            swift_bridgeObjectRetain_n();
            swift_bridgeObjectRetain_n();
            uint64_t v34 = sub_331B8();
            os_log_type_t v35 = sub_33C98();
            int v36 = v35;
            if (os_log_type_enabled(v34, v35))
            {
              uint64_t v37 = swift_slowAlloc();
              LODWORD(v46) = v36;
              uint64_t v38 = v37;
              uint64_t v51 = swift_slowAlloc();
              *(_DWORD *)uint64_t v38 = 136446466;
              swift_bridgeObjectRetain();
              uint64_t v50 = sub_10310(v16, v15, &v51);
              sub_33D48();
              swift_bridgeObjectRelease_n();
              *(_WORD *)(v38 + 12) = 2082;
              if (a3) {
                uint64_t v39 = v49;
              }
              else {
                uint64_t v39 = 0x6E776F6E6B6E753CLL;
              }
              if (a3) {
                unint64_t v40 = a3;
              }
              else {
                unint64_t v40 = 0xE90000000000003ELL;
              }
              swift_bridgeObjectRetain();
              uint64_t v50 = sub_10310(v39, v40, &v51);
              sub_33D48();
              swift_bridgeObjectRelease_n();
              swift_bridgeObjectRelease();
              _os_log_impl(&dword_0, v34, (os_log_type_t)v46, "Invalid parameter keyPath '%{public}s' for Intent '%{public}s'.", (uint8_t *)v38, 0x16u);
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_slowDealloc();

              (*(void (**)(char *, uint64_t))(v32 + 8))(v43, v44);
            }
            else
            {

              swift_bridgeObjectRelease_n();
              swift_bridgeObjectRelease_n();
              (*(void (**)(char *, uint64_t))(v32 + 8))(v33, v30);
            }
            uint64_t v17 = 0;
            goto LABEL_39;
          }
        }
        sub_752C(0, &qword_41368);
        swift_getObjectType();
        uint64_t v17 = (uint64_t)sub_5A9C();

        goto LABEL_39;
      }
    }
    swift_bridgeObjectRelease();
    goto LABEL_25;
  }
LABEL_40:
  *a6 = v17;
}

unint64_t sub_5910(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0) {
    uint64_t v4 = a3 & 0xFFFFFFFFFFFFLL;
  }
  if (!v4) {
    return 0;
  }
  uint64_t v7 = 4 * v4;
  unint64_t v8 = 15;
  while (sub_33AF8() != a1 || v9 != a2)
  {
    char v11 = sub_33F78();
    swift_bridgeObjectRelease();
    if (v11) {
      return v8;
    }
    unint64_t v8 = sub_33AC8();
    if (v7 == v8 >> 14) {
      return 0;
    }
  }
  swift_bridgeObjectRelease();
  return v8;
}

unint64_t sub_59F8(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    uint64_t v3 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (4 * v3 < result >> 14)
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = sub_33B08();
    swift_bridgeObjectRelease();
    return v4;
  }
  return result;
}

id sub_5A9C()
{
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  NSString v1 = sub_33A28();
  swift_bridgeObjectRelease();
  id v2 = [(id)swift_getObjCClassFromMetadata() parameterForClass:ObjCClassFromMetadata keyPath:v1];

  return v2;
}

void *sub_5B18(uint64_t a1, uint64_t a2, unint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  unint64_t v8 = &_swiftEmptyArrayStorage;
  unint64_t v19 = (unint64_t)&_swiftEmptyArrayStorage;
  uint64_t v9 = *(void *)(a1 + 16);
  if (v9)
  {
    uint64_t v12 = (uint64_t *)(swift_bridgeObjectRetain() + 40);
    while (1)
    {
      uint64_t v13 = *v12;
      v18[0] = *(v12 - 1);
      v18[1] = v13;
      swift_bridgeObjectRetain();
      sub_538C(v18, a2, a3, a5, a6, &v17);
      if (v6) {
        break;
      }
      swift_bridgeObjectRelease();
      if (v17)
      {
        sub_33B78();
        if (*(void *)((char *)&dword_10 + (v19 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                       + (v19 & 0xFFFFFFFFFFFFFF8)) >> 1)
          sub_33BC8();
        sub_33BD8();
        sub_33BB8();
      }
      v12 += 2;
      if (!--v9)
      {
        swift_bridgeObjectRelease();
        unint64_t v8 = (void *)v19;
        goto LABEL_11;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v8 = (void *)v19;

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
LABEL_11:
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
  }
  return v8;
}

void *sub_5C94(unint64_t a1, uint64_t a2)
{
  unint64_t v3 = a1;
  if (a1 >> 62) {
    goto LABEL_27;
  }
  uint64_t v4 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
LABEL_3:
  uint64_t v5 = (void *)(a2 + OBJC_IVAR____TtC12SystemPlugin26IntentsUIStandardViewModel_handledParameters);
  swift_beginAccess();
  if (v4)
  {
    uint64_t v21 = a2;
    unint64_t v6 = 0;
    unint64_t v22 = v3 & 0xC000000000000001;
    unint64_t v25 = v3 + 32;
    uint64_t v26 = v3 & 0xFFFFFFFFFFFFFF8;
    v3 &= 0xC000000000000001;
    BOOL v23 = v5;
    uint64_t v24 = v4;
    while (1)
    {
      if (v3)
      {
        id v7 = (id)sub_33E68();
      }
      else
      {
        if (v6 >= *(void *)(v26 + 16))
        {
          __break(1u);
LABEL_26:
          __break(1u);
LABEL_27:
          uint64_t v4 = sub_33F18();
          goto LABEL_3;
        }
        id v7 = *(id *)(v25 + 8 * v6);
      }
      unint64_t v8 = v7;
      if (__OFADD__(v6++, 1)) {
        goto LABEL_26;
      }
      uint64_t v10 = *v5;
      if ((*v5 & 0xC000000000000001) != 0)
      {
        swift_bridgeObjectRetain();
        id v11 = v8;
        char v12 = sub_33DD8();
        swift_bridgeObjectRelease();

        if ((v12 & 1) == 0) {
          goto LABEL_20;
        }
      }
      else
      {
        if (!*(void *)(v10 + 16)) {
          goto LABEL_20;
        }
        Swift::Int v13 = *(void *)(v10 + 40);
        swift_bridgeObjectRetain();
        Swift::Int v14 = sub_33CF8(v13);
        uint64_t v15 = -1 << *(unsigned char *)(v10 + 32);
        unint64_t v16 = v14 & ~v15;
        if (((*(void *)(v10 + 56 + ((v16 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v16) & 1) == 0) {
          goto LABEL_19;
        }
        sub_752C(0, &qword_41368);
        id v17 = *(id *)(*(void *)(v10 + 48) + 8 * v16);
        a2 = sub_33D08();

        if ((a2 & 1) == 0)
        {
          uint64_t v18 = ~v15;
          while (1)
          {
            unint64_t v16 = (v16 + 1) & v18;
            if (((*(void *)(v10 + 56 + ((v16 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v16) & 1) == 0) {
              break;
            }
            a2 = (uint64_t)*(id *)(*(void *)(v10 + 48) + 8 * v16);
            char v19 = sub_33D08();

            if (v19) {
              goto LABEL_18;
            }
          }
LABEL_19:
          swift_bridgeObjectRelease();
          uint64_t v5 = v23;
          uint64_t v4 = v24;
          unint64_t v3 = v22;
LABEL_20:
          sub_33E88();
          a2 = *((void *)&_swiftEmptyArrayStorage + 2);
          sub_33EA8();
          sub_33EB8();
          sub_33E98();
          goto LABEL_21;
        }
LABEL_18:

        swift_bridgeObjectRelease();
        uint64_t v5 = v23;
        uint64_t v4 = v24;
        unint64_t v3 = v22;
      }
LABEL_21:
      if (v6 == v4)
      {
        a2 = v21;
        break;
      }
    }
  }

  swift_bridgeObjectRelease();
  return &_swiftEmptyArrayStorage;
}

void sub_5F44()
{
}

id sub_5F84()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_6080@<X0>(uint64_t *a1@<X8>)
{
  swift_getObjectType();
  uint64_t result = sub_33208();
  *a1 = result;
  return result;
}

uint64_t sub_60C0()
{
  id v0 = [self mainScreen];
  [v0 bounds];
  CGFloat v2 = v1;
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;

  v12.origin.x = v2;
  v12.origin.y = v4;
  v12.size.width = v6;
  v12.size.height = v8;
  double Height = CGRectGetHeight(v12);
  sub_63C4(&qword_41350);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_34830;
  *(void *)(inited + 32) = [objc_allocWithZone((Class)NSNumber) initWithUnsignedInt:720896];
  *(void *)(inited + 40) = objc_msgSend(self, "valueWithCGSize:", 0.0, Height);
  sub_752C(0, &qword_41338);
  sub_752C(0, &qword_41340);
  sub_6BD0(&qword_41348, &qword_41338);
  return sub_339D8();
}

uint64_t sub_630C(uint64_t a1)
{
  double v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t variable initialization expression of SashStandardView._appIcon()
{
  type metadata accessor for SashStandardView.AppIcon(0);

  return swift_storeEnumTagMultiPayload();
}

uint64_t variable initialization expression of SashStandardView._appTitle()
{
  return 0;
}

uint64_t variable initialization expression of ContactImageView._imageStyle@<X0>(uint64_t *a1@<X8>)
{
  return sub_6458(&qword_411F0, a1);
}

uint64_t sub_63C4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t variable initialization expression of AppIconView._displayScale()
{
  return swift_getKeyPath();
}

uint64_t variable initialization expression of MapIdentifiablePlace.tint()
{
  return 0;
}

uint64_t variable initialization expression of ContactPickerButtonView._showSystemPicker()
{
  return 0;
}

uint64_t variable initialization expression of IntentsUIStandardView._responseModel@<X0>(uint64_t *a1@<X8>)
{
  return sub_6458(&qword_411F8, a1);
}

uint64_t sub_6458@<X0>(uint64_t *a1@<X1>, uint64_t *a2@<X8>)
{
  *a2 = swift_getKeyPath();
  sub_63C4(a1);

  return swift_storeEnumTagMultiPayload();
}

uint64_t _s12SystemPlugin23ContactPickerButtonViewV8_context33_68AB3A28E3DEAE8A118F0F4E2E8FEBBFLL7SwiftUI17EnvironmentObjectVy07SnippetS07ContextCGvpfi_0()
{
  sub_339B8();
  sub_7478((unint64_t *)&qword_421F0, (void (*)(uint64_t))&type metadata accessor for Context);

  return sub_33338();
}

uint64_t variable initialization expression of MapIdentifiablePlace.canvas@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_32C58();

  return _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(a1, 1, 1, v2);
}

uint64_t _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_6594()
{
  return type metadata accessor for IntentsUIStandardViewModel();
}

uint64_t type metadata accessor for IntentsUIStandardViewModel()
{
  uint64_t result = qword_41240;
  if (!qword_41240) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_65E4()
{
  sub_32F78();
  if (v0 <= 0x3F)
  {
    sub_66CC();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_66CC()
{
  if (!qword_41250)
  {
    sub_6728(&qword_41258);
    unint64_t v0 = sub_33258();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_41250);
    }
  }
}

uint64_t sub_6728(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

__n128 initializeWithTake for PlaceholderView(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for CLLocationCoordinate2D(uint64_t a1)
{
}

void type metadata accessor for VRXIdiom(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for IntentsUIStandardViewModel.ResolvedView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for IntentsUIStandardViewModel.ResolvedView(uint64_t a1)
{
  unsigned int v1 = *(unsigned __int8 *)(a1 + 40);
  if (v1 >= 2) {
    unsigned int v1 = *(_DWORD *)a1 + 2;
  }
  if (v1 == 1) {
    sub_6804(a1);
  }
  else {
}
  }

uint64_t sub_6804(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t initializeWithCopy for IntentsUIStandardViewModel.ResolvedView(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = *(unsigned __int8 *)(a2 + 40);
  if (v3 >= 2) {
    unsigned int v3 = *(_DWORD *)a2 + 2;
  }
  if (v3 == 1)
  {
    long long v4 = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 24) = v4;
    (**(void (***)(uint64_t))(v4 - 8))(a1);
    char v5 = 1;
  }
  else
  {
    CGFloat v6 = *(void **)a2;
    *(void *)a1 = *(void *)a2;
    id v7 = v6;
    char v5 = 0;
  }
  *(unsigned char *)(a1 + 40) = v5;
  return a1;
}

uint64_t assignWithCopy for IntentsUIStandardViewModel.ResolvedView(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 40);
    if (v4 >= 2) {
      unsigned int v4 = *(_DWORD *)a1 + 2;
    }
    if (v4 == 1) {
      sub_6804(a1);
    }
    else {

    }
    unsigned int v5 = *(unsigned __int8 *)(a2 + 40);
    if (v5 >= 2) {
      unsigned int v5 = *(_DWORD *)a2 + 2;
    }
    if (v5 == 1)
    {
      uint64_t v6 = *(void *)(a2 + 24);
      *(void *)(a1 + 24) = v6;
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1, a2);
      *(unsigned char *)(a1 + 40) = 1;
    }
    else
    {
      id v7 = *(void **)a2;
      *(void *)a1 = *(void *)a2;
      *(unsigned char *)(a1 + 40) = 0;
      id v8 = v7;
    }
  }
  return a1;
}

__n128 initializeWithTake for IntentsUIStandardViewModel.ResolvedView(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for IntentsUIStandardViewModel.ResolvedView(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 40);
    if (v4 >= 2) {
      unsigned int v4 = *(_DWORD *)a1 + 2;
    }
    if (v4 == 1) {
      sub_6804(a1);
    }
    else {

    }
    unsigned int v5 = *(unsigned __int8 *)(a2 + 40);
    if (v5 >= 2) {
      unsigned int v5 = *(_DWORD *)a2 + 2;
    }
    if (v5 == 1)
    {
      long long v6 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v6;
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      char v7 = 1;
    }
    else
    {
      char v7 = 0;
      *(void *)a1 = *(void *)a2;
    }
    *(unsigned char *)(a1 + 40) = v7;
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for IntentsUIStandardViewModel.ResolvedView(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 41)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 >= 2) {
    return (v3 ^ 0xFF) + 1;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for IntentsUIStandardViewModel.ResolvedView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 25) = 0u;
    *(_OWORD *)__n128 result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 41) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 41) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 40) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_6B00(uint64_t a1)
{
  uint64_t result = *(unsigned __int8 *)(a1 + 40);
  if (result >= 2) {
    return (*(_DWORD *)a1 + 2);
  }
  return result;
}

uint64_t sub_6B20(uint64_t result, unsigned int a2)
{
  if (a2 > 1)
  {
    *(void *)(result + 32) = 0;
    *(_OWORD *)uint64_t result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)uint64_t result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 40) = a2;
  return result;
}

ValueMetadata *type metadata accessor for IntentsUIStandardViewModel.ResolvedView()
{
  return &type metadata for IntentsUIStandardViewModel.ResolvedView;
}

__n128 sub_6B58(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_6B64(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_6B84(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
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
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for MKCoordinateRegion(uint64_t a1)
{
}

void *sub_6BC4()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_6BD0(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_752C(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_6C20@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_27C0();
  *a1 = result;
  return result;
}

uint64_t sub_6C4C()
{
  return sub_2834();
}

char *sub_6C78()
{
  uint64_t v1 = *v0;
  uint64_t result = (char *)swift_isUniquelyReferenced_nonNull_native();
  uint64_t *v0 = v1;
  if (!result)
  {
    uint64_t result = sub_6D04(result, *(void *)(v1 + 16) + 1, 1, v1);
    uint64_t *v0 = (uint64_t)result;
  }
  return result;
}

char *sub_6CC4(char *result)
{
  unint64_t v2 = *(void *)(*v1 + 24);
  if ((uint64_t)(result + 1) > (uint64_t)(v2 >> 1))
  {
    uint64_t result = sub_6D04((char *)(v2 > 1), (int64_t)(result + 1), 1, *v1);
    *uint64_t v1 = (uint64_t)result;
  }
  return result;
}

char *sub_6D04(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_63C4(&qword_413A0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  CGRect v12 = v10 + 32;
  if (v5)
  {
    sub_303BC((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_6DFC(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

uint64_t sub_6DFC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 48 * a1 + 32;
    unint64_t v6 = a3 + 48 * v4;
    if (v5 >= v6 || v5 + 48 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_33F38();
  __break(1u);
  return result;
}

void sub_6EFC(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_33F18();
    swift_bridgeObjectRelease();
    if (v4) {
      goto LABEL_3;
    }
LABEL_5:
    char v3 = &_swiftEmptySetSingleton;
    goto LABEL_6;
  }
  if (!*(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8))) {
    goto LABEL_5;
  }
LABEL_3:
  sub_63C4(&qword_41360);
  char v3 = (void *)sub_33E28();
LABEL_6:
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_33F18();
    swift_bridgeObjectRelease();
    if (!v5)
    {
LABEL_26:
      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    uint64_t v5 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
    if (!v5) {
      goto LABEL_26;
    }
  }
  unint64_t v6 = 0;
  uint64_t v7 = (char *)(v3 + 7);
  unint64_t v27 = a1 & 0xC000000000000001;
  unint64_t v24 = a1 + 32;
  uint64_t v25 = a1 & 0xFFFFFFFFFFFFFF8;
  uint64_t v26 = v5;
  while (1)
  {
    if (v27)
    {
      id v8 = (id)sub_33E68();
    }
    else
    {
      if (v6 >= *(void *)(v25 + 16)) {
        goto LABEL_29;
      }
      id v8 = *(id *)(v24 + 8 * v6);
    }
    uint64_t v9 = v8;
    BOOL v10 = __OFADD__(v6++, 1);
    if (v10) {
      break;
    }
    Swift::Int v11 = sub_33CF8(v3[5]);
    uint64_t v12 = -1 << *((unsigned char *)v3 + 32);
    unint64_t v13 = v11 & ~v12;
    unint64_t v14 = v13 >> 6;
    uint64_t v15 = *(void *)&v7[8 * (v13 >> 6)];
    uint64_t v16 = 1 << v13;
    if (((1 << v13) & v15) != 0)
    {
      sub_752C(0, &qword_41368);
      id v17 = *(id *)(v3[6] + 8 * v13);
      char v18 = sub_33D08();

      if (v18)
      {
LABEL_21:

        uint64_t v5 = v26;
        goto LABEL_25;
      }
      uint64_t v19 = ~v12;
      while (1)
      {
        unint64_t v13 = (v13 + 1) & v19;
        unint64_t v14 = v13 >> 6;
        uint64_t v15 = *(void *)&v7[8 * (v13 >> 6)];
        uint64_t v16 = 1 << v13;
        if ((v15 & (1 << v13)) == 0) {
          break;
        }
        id v20 = *(id *)(v3[6] + 8 * v13);
        char v21 = sub_33D08();

        if (v21) {
          goto LABEL_21;
        }
      }
      uint64_t v5 = v26;
    }
    *(void *)&v7[8 * v14] = v16 | v15;
    *(void *)(v3[6] + 8 * v13) = v9;
    uint64_t v22 = v3[2];
    BOOL v10 = __OFADD__(v22, 1);
    uint64_t v23 = v22 + 1;
    if (v10) {
      goto LABEL_28;
    }
    v3[2] = v23;
LABEL_25:
    if (v6 == v5) {
      goto LABEL_26;
    }
  }
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
}

uint64_t sub_7150(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_7188()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_71C0()
{
  sub_32F48();
  sub_9370();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = ((v5 + 40) & ~v5) + *(void *)(v4 + 64);
  uint64_t v7 = v5 | 7;
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v8 = sub_93A4();
  v9(v8);

  return _swift_deallocObject(v0, v6, v7);
}

uint64_t sub_725C(void *a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(sub_32F48() - 8);
  uint64_t v6 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v8 = v2[4];
  uint64_t v9 = (uint64_t)v2 + ((*(unsigned __int8 *)(v5 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_35C0(a1, a2, v6, v7, v8, v9);
}

uint64_t sub_72E4()
{
  sub_32F48();
  sub_9370();

  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v1 = sub_93A4();
  v2(v1);
  swift_errorRelease();
  uint64_t v3 = sub_93E4();

  return _swift_deallocObject(v3, v4, v5);
}

void sub_739C()
{
  uint64_t v1 = sub_32F48();
  sub_938C(v1);
  uint64_t v2 = (void *)sub_93F4();
  uint64_t v5 = *(void *)(v0 + 32);
  uint64_t v6 = *(void *)(v0 + 40);
  uint64_t v8 = *(void *)(v0 + v7);

  sub_3AD4(v2, v3, v5, v6, v0 + v4, v8);
}

uint64_t sub_7400()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_7438()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_7460(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_7470()
{
  return swift_release();
}

uint64_t sub_7478(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_74C0()
{
  unint64_t result = qword_41EC0;
  if (!qword_41EC0)
  {
    sub_6728((uint64_t *)&unk_41380);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_41EC0);
  }
  return result;
}

_OWORD *sub_7514(long long *a1, _OWORD *a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(_OWORD *)((char *)a2 + 25) = *(long long *)((char *)a1 + 25);
  *a2 = v2;
  a2[1] = v3;
  return a2;
}

uint64_t sub_752C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_7568()
{
  sub_32F48();
  sub_9370();
  sub_93BC();
  uint64_t v2 = sub_93A4();
  v3(v2);

  uint64_t v4 = sub_93E4();

  return _swift_deallocObject(v4, v5, v6);
}

void sub_75F8(uint64_t a1)
{
  uint64_t v3 = sub_32F48();
  sub_938C(v3);
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v9 = *(void *)(v1 + 16);
  uint64_t v10 = *(void *)(v1 + 24);
  Swift::Int v11 = *(void **)(v1 + ((*(void *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8));

  sub_44E0(a1, v9, v10, v1 + v8, v11);
}

uint64_t sub_7674()
{
  sub_32F48();
  sub_9370();
  sub_93BC();
  swift_errorRelease();
  uint64_t v2 = sub_93A4();
  v3(v2);

  uint64_t v4 = sub_93E4();

  return _swift_deallocObject(v4, v5, v6);
}

void sub_770C()
{
  uint64_t v1 = sub_32F48();
  sub_938C(v1);
  uint64_t v2 = sub_93F4();
  uint64_t v5 = *(void *)(v0 + 32);
  uint64_t v7 = *(void **)(v0 + v6);

  sub_49E0(v2, v3, v5, v0 + v4, v7);
}

uint64_t sub_7770()
{
  return swift_release();
}

unint64_t sub_7778(unint64_t result)
{
  unint64_t v1 = result;
  unint64_t v2 = result >> 62;
  if (result >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_33F18();
    uint64_t result = swift_bridgeObjectRelease();
    if (v4) {
      goto LABEL_3;
    }
  }
  else if (*(void *)((char *)&dword_10 + (result & 0xFFFFFFFFFFFFFF8)))
  {
LABEL_3:
    sub_63C4(&qword_413C0);
    uint64_t result = sub_33E28();
    uint64_t v3 = (unsigned char *)result;
    goto LABEL_6;
  }
  uint64_t v3 = &_swiftEmptySetSingleton;
LABEL_6:
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_33F18();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v5)
    {
LABEL_24:
      swift_bridgeObjectRelease();
      return (unint64_t)v3;
    }
  }
  else
  {
    uint64_t v5 = *(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFFF8));
    if (!v5) {
      goto LABEL_24;
    }
  }
  unint64_t v6 = 0;
  uint64_t v7 = v3 + 56;
  unint64_t v20 = v1 & 0xC000000000000001;
  unint64_t v18 = v1 + 32;
  uint64_t v19 = v1 & 0xFFFFFFFFFFFFFF8;
  while (1)
  {
    if (v20)
    {
      uint64_t result = sub_33E68();
      unint64_t v8 = result;
    }
    else
    {
      if (v6 >= *(void *)(v19 + 16)) {
        goto LABEL_27;
      }
      unint64_t v8 = *(void *)(v18 + 8 * v6);
      uint64_t result = swift_retain();
    }
    BOOL v9 = __OFADD__(v6++, 1);
    if (v9) {
      break;
    }
    sub_331F8();
    sub_7478(&qword_413C8, (void (*)(uint64_t))&type metadata accessor for AnyCancellable);
    uint64_t result = sub_33A08();
    uint64_t v10 = -1 << v3[32];
    unint64_t v11 = result & ~v10;
    unint64_t v12 = v11 >> 6;
    uint64_t v13 = *(void *)&v7[8 * (v11 >> 6)];
    uint64_t v14 = 1 << v11;
    if (((1 << v11) & v13) != 0)
    {
      uint64_t v15 = ~v10;
      sub_7478((unint64_t *)&unk_413D0, (void (*)(uint64_t))&type metadata accessor for AnyCancellable);
      while (1)
      {
        uint64_t result = sub_33A18();
        if (result) {
          break;
        }
        unint64_t v11 = (v11 + 1) & v15;
        unint64_t v12 = v11 >> 6;
        uint64_t v13 = *(void *)&v7[8 * (v11 >> 6)];
        uint64_t v14 = 1 << v11;
        if ((v13 & (1 << v11)) == 0) {
          goto LABEL_20;
        }
      }
      uint64_t result = swift_release();
    }
    else
    {
LABEL_20:
      *(void *)&v7[8 * v12] = v14 | v13;
      *(void *)(*((void *)v3 + 6) + 8 * v11) = v8;
      uint64_t v16 = *((void *)v3 + 2);
      BOOL v9 = __OFADD__(v16, 1);
      uint64_t v17 = v16 + 1;
      if (v9) {
        goto LABEL_26;
      }
      *((void *)v3 + 2) = v17;
    }
    if (v6 == v5) {
      goto LABEL_24;
    }
  }
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_7A24(void *a1, void *a2)
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
    uint64_t v9 = sub_33DB8();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_752C(0, &qword_41368);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v27;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_33DA8();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    Swift::Int v22 = sub_7E70(v7, result + 1);
    uint64_t v28 = (void *)v22;
    if (*(void *)(v22 + 24) <= *(void *)(v22 + 16))
    {
      id v26 = v8;
      sub_8058();
      uint64_t v23 = v28;
    }
    else
    {
      uint64_t v23 = (void *)v22;
      id v24 = v8;
    }
    sub_85D0((uint64_t)v8, v23);
    uint64_t *v3 = (uint64_t)v23;
  }
  else
  {
    Swift::Int v10 = *(void *)(v6 + 40);
    swift_bridgeObjectRetain();
    Swift::Int v11 = sub_33CF8(v10);
    uint64_t v12 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v13 = v11 & ~v12;
    if ((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
    {
      sub_752C(0, &qword_41368);
      id v14 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
      char v15 = sub_33D08();

      if (v15)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        uint64_t v19 = *(void **)(*(void *)(*v3 + 48) + 8 * v13);
        *a1 = v19;
        id v20 = v19;
        return 0;
      }
      uint64_t v16 = ~v12;
      while (1)
      {
        unint64_t v13 = (v13 + 1) & v16;
        if (((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0) {
          break;
        }
        id v17 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
        char v18 = sub_33D08();

        if (v18) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v29 = *v3;
    uint64_t *v3 = 0x8000000000000000;
    id v8 = a2;
    sub_8654((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    uint64_t *v3 = v29;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_7CC0(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  sub_33FF8();
  swift_bridgeObjectRetain();
  sub_33AB8();
  Swift::Int v8 = sub_34018();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_33F78() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      id v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
      Swift::Int v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      char v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_33F78() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_87DC(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  uint64_t *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

Swift::Int sub_7E70(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    swift_unknownObjectRelease();
    return (Swift::Int)&_swiftEmptySetSingleton;
  }
  sub_63C4(&qword_41360);
  uint64_t v2 = sub_33E18();
  uint64_t v14 = v2;
  sub_33D98();
  if (!sub_33DC8())
  {
LABEL_16:
    swift_release();
    return v2;
  }
  sub_752C(0, &qword_41368);
  while (1)
  {
    swift_dynamicCast();
    uint64_t v2 = v14;
    if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
    {
      sub_8058();
      uint64_t v2 = v14;
    }
    Swift::Int result = sub_33CF8(*(void *)(v2 + 40));
    uint64_t v4 = v2 + 56;
    uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v6 = result & ~v5;
    unint64_t v7 = v6 >> 6;
    if (((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6))) == 0) {
      break;
    }
    unint64_t v8 = __clz(__rbit64((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
LABEL_15:
    *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
    *(void *)(*(void *)(v2 + 48) + 8 * v8) = v13;
    ++*(void *)(v2 + 16);
    if (!sub_33DC8()) {
      goto LABEL_16;
    }
  }
  char v9 = 0;
  unint64_t v10 = (unint64_t)(63 - v5) >> 6;
  while (++v7 != v10 || (v9 & 1) == 0)
  {
    BOOL v11 = v7 == v10;
    if (v7 == v10) {
      unint64_t v7 = 0;
    }
    v9 |= v11;
    uint64_t v12 = *(void *)(v4 + 8 * v7);
    if (v12 != -1)
    {
      unint64_t v8 = __clz(__rbit64(~v12)) + (v7 << 6);
      goto LABEL_15;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_8058()
{
  unint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_63C4(&qword_41360);
  uint64_t v3 = sub_33E08();
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
    if (!v8) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v13 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    for (unint64_t i = v13 | (v12 << 6); ; unint64_t i = __clz(__rbit64(v16)) + (v12 << 6))
    {
      uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * i);
      uint64_t result = sub_33CF8(*(void *)(v4 + 40));
      uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v20 = result & ~v19;
      unint64_t v21 = v20 >> 6;
      if (((-1 << v20) & ~*(void *)(v10 + 8 * (v20 >> 6))) == 0)
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v19) >> 6;
        while (++v21 != v24 || (v23 & 1) == 0)
        {
          BOOL v25 = v21 == v24;
          if (v21 == v24) {
            unint64_t v21 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v10 + 8 * v21);
          if (v26 != -1)
          {
            unint64_t v22 = __clz(__rbit64(~v26)) + (v21 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return result;
      }
      unint64_t v22 = __clz(__rbit64((-1 << v20) & ~*(void *)(v10 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v10 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
      *(void *)(*(void *)(v4 + 48) + 8 * v22) = v18;
      ++*(void *)(v4 + 16);
      if (v8) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v15 = v12 + 1;
      if (__OFADD__(v12, 1)) {
        goto LABEL_38;
      }
      if (v15 >= v9) {
        goto LABEL_32;
      }
      unint64_t v16 = v6[v15];
      ++v12;
      if (!v16)
      {
        int64_t v12 = v15 + 1;
        if (v15 + 1 >= v9) {
          goto LABEL_32;
        }
        unint64_t v16 = v6[v12];
        if (!v16)
        {
          int64_t v12 = v15 + 2;
          if (v15 + 2 >= v9) {
            goto LABEL_32;
          }
          unint64_t v16 = v6[v12];
          if (!v16)
          {
            int64_t v17 = v15 + 3;
            if (v17 >= v9)
            {
LABEL_32:
              swift_release();
              unint64_t v1 = v28;
              uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
              if (v27 > 63) {
                sub_8978(0, (unint64_t)(v27 + 63) >> 6, (void *)(v2 + 56));
              }
              else {
                *unint64_t v6 = -1 << v27;
              }
              *(void *)(v2 + 16) = 0;
              break;
            }
            unint64_t v16 = v6[v17];
            if (!v16)
            {
              while (1)
              {
                int64_t v12 = v17 + 1;
                if (__OFADD__(v17, 1)) {
                  goto LABEL_39;
                }
                if (v12 >= v9) {
                  goto LABEL_32;
                }
                unint64_t v16 = v6[v12];
                ++v17;
                if (v16) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v12 = v17;
          }
        }
      }
LABEL_20:
      unint64_t v8 = (v16 - 1) & v16;
    }
  }
  uint64_t result = swift_release();
  *unint64_t v1 = v4;
  return result;
}

uint64_t sub_82F4()
{
  unint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_63C4(&qword_413B8);
  uint64_t v3 = sub_33E08();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    if (!v7) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v12 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    for (unint64_t i = v12 | (v11 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v11 << 6))
    {
      int64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
      uint64_t v18 = *v17;
      uint64_t v19 = v17[1];
      sub_33FF8();
      sub_33AB8();
      uint64_t result = sub_34018();
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6))) == 0)
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v20) >> 6;
        while (++v22 != v25 || (v24 & 1) == 0)
        {
          BOOL v26 = v22 == v25;
          if (v22 == v25) {
            unint64_t v22 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v9 + 8 * v22);
          if (v27 != -1)
          {
            unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return result;
      }
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
      uint64_t v28 = (void *)(*(void *)(v4 + 48) + 16 * v23);
      void *v28 = v18;
      v28[1] = v19;
      ++*(void *)(v4 + 16);
      if (v7) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v14 = v11 + 1;
      if (__OFADD__(v11, 1)) {
        goto LABEL_38;
      }
      if (v14 >= v8) {
        goto LABEL_32;
      }
      unint64_t v15 = v30[v14];
      ++v11;
      if (!v15)
      {
        int64_t v11 = v14 + 1;
        if (v14 + 1 >= v8) {
          goto LABEL_32;
        }
        unint64_t v15 = v30[v11];
        if (!v15)
        {
          int64_t v11 = v14 + 2;
          if (v14 + 2 >= v8) {
            goto LABEL_32;
          }
          unint64_t v15 = v30[v11];
          if (!v15)
          {
            int64_t v16 = v14 + 3;
            if (v16 >= v8)
            {
LABEL_32:
              swift_release();
              unint64_t v1 = v0;
              uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
              if (v29 > 63) {
                sub_8978(0, (unint64_t)(v29 + 63) >> 6, v30);
              }
              else {
                *uint64_t v30 = -1 << v29;
              }
              *(void *)(v2 + 16) = 0;
              break;
            }
            unint64_t v15 = v30[v16];
            if (!v15)
            {
              while (1)
              {
                int64_t v11 = v16 + 1;
                if (__OFADD__(v16, 1)) {
                  goto LABEL_39;
                }
                if (v11 >= v8) {
                  goto LABEL_32;
                }
                unint64_t v15 = v30[v11];
                ++v16;
                if (v15) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v11 = v16;
          }
        }
      }
LABEL_20:
      unint64_t v7 = (v15 - 1) & v15;
    }
  }
  uint64_t result = swift_release();
  *unint64_t v1 = v4;
  return result;
}

unint64_t sub_85D0(uint64_t a1, void *a2)
{
  sub_33CF8(a2[5]);
  unint64_t result = sub_33D88();
  *(void *)((char *)a2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 56) |= 1 << result;
  *(void *)(a2[6] + 8 * result) = a1;
  ++a2[2];
  return result;
}

void sub_8654(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_8058();
  }
  else
  {
    if (v7 > v6)
    {
      sub_8994();
      goto LABEL_14;
    }
    sub_8CF4();
  }
  uint64_t v8 = *v3;
  Swift::Int v9 = sub_33CF8(*(void *)(*v3 + 40));
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_752C(0, &qword_41368);
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = sub_33D08();

    if (v12)
    {
LABEL_13:
      sub_33F88();
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
        char v15 = sub_33D08();

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

Swift::Int sub_87DC(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  Swift::Int v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_82F4();
  }
  else
  {
    if (v10 > v9)
    {
      unint64_t result = (Swift::Int)sub_8B40();
      goto LABEL_22;
    }
    sub_8F70();
  }
  uint64_t v11 = *v4;
  sub_33FF8();
  sub_33AB8();
  unint64_t result = sub_34018();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    char v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (unint64_t result = sub_33F78(), (result & 1) != 0))
    {
LABEL_21:
      unint64_t result = sub_33F88();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        BOOL v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          unint64_t result = sub_33F78();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  unint64_t v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
  Swift::Int *v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

uint64_t sub_8978(uint64_t result, uint64_t a2, void *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }
  return result;
}

id sub_8994()
{
  unint64_t v1 = v0;
  sub_63C4(&qword_41360);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_33DF8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    *unint64_t v1 = v4;
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
  uint64_t v11 = *(void *)(v2 + 56);
  uint64_t v12 = -1;
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  unint64_t v13 = v12 & v11;
  int64_t v14 = (unint64_t)(v10 + 63) >> 6;
  if ((v12 & v11) == 0) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v15 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (unint64_t i = v15 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v9 << 6))
  {
    uint64_t v20 = *(void **)(*(void *)(v2 + 48) + 8 * i);
    *(void *)(*(void *)(v4 + 48) + 8 * i) = v20;
    id result = v20;
    if (v13) {
      goto LABEL_11;
    }
LABEL_12:
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v17 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v14) {
        goto LABEL_28;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18)
      {
        int64_t v9 = v17 + 2;
        if (v17 + 2 >= v14) {
          goto LABEL_28;
        }
        unint64_t v18 = *(void *)(v6 + 8 * v9);
        if (!v18) {
          break;
        }
      }
    }
LABEL_25:
    unint64_t v13 = (v18 - 1) & v18;
  }
  int64_t v19 = v17 + 3;
  if (v19 >= v14) {
    goto LABEL_28;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_8B40()
{
  unint64_t v1 = v0;
  sub_63C4(&qword_413B8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_33DF8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (void *)swift_release();
    *unint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = *(void *)(v2 + 56);
  uint64_t v12 = -1;
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  unint64_t v13 = v12 & v11;
  int64_t v14 = (unint64_t)(v10 + 63) >> 6;
  if ((v12 & v11) == 0) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v15 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (unint64_t i = v15 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v9 << 6))
  {
    uint64_t v20 = (void *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v21 = v20[1];
    uint64_t v22 = (void *)(*(void *)(v4 + 48) + 16 * i);
    *uint64_t v22 = *v20;
    v22[1] = v21;
    id result = (void *)swift_bridgeObjectRetain();
    if (v13) {
      goto LABEL_11;
    }
LABEL_12:
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v17 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v14) {
        goto LABEL_28;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18)
      {
        int64_t v9 = v17 + 2;
        if (v17 + 2 >= v14) {
          goto LABEL_28;
        }
        unint64_t v18 = *(void *)(v6 + 8 * v9);
        if (!v18) {
          break;
        }
      }
    }
LABEL_25:
    unint64_t v13 = (v18 - 1) & v18;
  }
  int64_t v19 = v17 + 3;
  if (v19 >= v14) {
    goto LABEL_28;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_8CF4()
{
  unint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_63C4(&qword_41360);
  uint64_t v3 = sub_33E08();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_34:
    *unint64_t v1 = v4;
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
  if (!v8) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v13 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v13 | (v12 << 6); ; unint64_t i = __clz(__rbit64(v16)) + (v12 << 6))
  {
    Swift::Int v18 = *(void *)(v4 + 40);
    id v19 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    uint64_t result = sub_33CF8(v18);
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) == 0)
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      while (++v22 != v25 || (v24 & 1) == 0)
      {
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v10 + 8 * v22);
        if (v27 != -1)
        {
          unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v10 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    *(void *)(*(void *)(v4 + 48) + 8 * v23) = v19;
    ++*(void *)(v4 + 16);
    if (v8) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v15 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      goto LABEL_36;
    }
    if (v15 >= v9) {
      goto LABEL_32;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++v12;
    if (!v16)
    {
      int64_t v12 = v15 + 1;
      if (v15 + 1 >= v9) {
        goto LABEL_32;
      }
      unint64_t v16 = *(void *)(v6 + 8 * v12);
      if (!v16)
      {
        int64_t v12 = v15 + 2;
        if (v15 + 2 >= v9) {
          goto LABEL_32;
        }
        unint64_t v16 = *(void *)(v6 + 8 * v12);
        if (!v16) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v8 = (v16 - 1) & v16;
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v9)
  {
LABEL_32:
    uint64_t result = swift_release_n();
    unint64_t v1 = v28;
    goto LABEL_34;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v17);
  if (v16)
  {
    int64_t v12 = v17;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v12 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_32;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v12);
    ++v17;
    if (v16) {
      goto LABEL_20;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_8F70()
{
  unint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_63C4(&qword_413B8);
  uint64_t v3 = sub_33E08();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_34:
    *unint64_t v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  if (!v8) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v12 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v12 | (v11 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v11 << 6))
  {
    int64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    sub_33FF8();
    swift_bridgeObjectRetain();
    sub_33AB8();
    uint64_t result = sub_34018();
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6))) == 0)
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      while (++v22 != v25 || (v24 & 1) == 0)
      {
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v9 + 8 * v22);
        if (v27 != -1)
        {
          unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    uint64_t v28 = (void *)(*(void *)(v4 + 48) + 16 * v23);
    void *v28 = v18;
    v28[1] = v19;
    ++*(void *)(v4 + 16);
    if (v8) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v14 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_36;
    }
    if (v14 >= v29) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v14);
    ++v11;
    if (!v15)
    {
      int64_t v11 = v14 + 1;
      if (v14 + 1 >= v29) {
        goto LABEL_32;
      }
      unint64_t v15 = *(void *)(v6 + 8 * v11);
      if (!v15)
      {
        int64_t v11 = v14 + 2;
        if (v14 + 2 >= v29) {
          goto LABEL_32;
        }
        unint64_t v15 = *(void *)(v6 + 8 * v11);
        if (!v15) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v8 = (v15 - 1) & v15;
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v29)
  {
LABEL_32:
    uint64_t result = swift_release_n();
    unint64_t v1 = v0;
    goto LABEL_34;
  }
  unint64_t v15 = *(void *)(v6 + 8 * v16);
  if (v15)
  {
    int64_t v11 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v11 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v11);
    ++v16;
    if (v15) {
      goto LABEL_20;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_921C(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  uint64_t v4 = sub_33A38();

  return v4;
}

uint64_t sub_927C(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

uint64_t sub_92A0(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_92C0(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)uint64_t result = (a2 - 1);
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

void type metadata accessor for MKCoordinateSpan(uint64_t a1)
{
}

void sub_92FC(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_938C(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_93A4()
{
  return v0 + v1;
}

uint64_t sub_93BC()
{
  return swift_release();
}

uint64_t sub_93E4()
{
  return v0;
}

uint64_t sub_93F4()
{
  return *(void *)(v0 + 16);
}

uint64_t property wrapper backing initializer of SashStandardView.appIcon(uint64_t a1)
{
  type metadata accessor for SashStandardView.AppIcon(0);
  sub_EC24();
  __chkstk_darwin();
  sub_B8A8(a1, (uint64_t)&v4 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for SashStandardView.AppIcon);
  sub_33778();
  return sub_EBBC(a1, (void (*)(void))type metadata accessor for SashStandardView.AppIcon);
}

uint64_t type metadata accessor for SashStandardView.AppIcon(uint64_t a1)
{
  return sub_983C(a1, qword_41700);
}

uint64_t property wrapper backing initializer of SashStandardView.appTitle()
{
  sub_33778();
  return v1;
}

uint64_t SashStandardView.init(modelData:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v25[1] = a1;
  v25[2] = a2;
  uint64_t v4 = sub_32E08();
  sub_9370();
  v25[0] = v5;
  __chkstk_darwin(v6);
  unint64_t v8 = (char *)v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for SashStandardView.AppIcon(0);
  sub_EC24();
  uint64_t v10 = __chkstk_darwin(v9);
  unint64_t v12 = (char *)v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  int64_t v14 = (char *)v25 - v13;
  unint64_t v15 = (int *)type metadata accessor for SashStandardView(0);
  uint64_t v16 = a3 + v15[5];
  sub_339B8();
  sub_EB74((unint64_t *)&qword_421F0, (void (*)(uint64_t))&type metadata accessor for Context);
  *(void *)uint64_t v16 = sub_33338();
  *(void *)(v16 + 8) = v17;
  uint64_t v18 = a3 + v15[6];
  swift_storeEnumTagMultiPayload();
  sub_B8A8((uint64_t)v14, (uint64_t)v12, (void (*)(void))type metadata accessor for SashStandardView.AppIcon);
  sub_33778();
  sub_EBBC((uint64_t)v14, (void (*)(void))type metadata accessor for SashStandardView.AppIcon);
  uint64_t v19 = a3 + v15[7];
  v25[3] = 0;
  v25[4] = 0xE000000000000000;
  sub_33778();
  uint64_t v20 = v27;
  *(_OWORD *)uint64_t v19 = v26;
  *(void *)(v19 + 16) = v20;
  uint64_t v21 = a3 + v15[8];
  _s12SystemPlugin21IntentsUIStandardViewV14_actionHandler33_B186D5490C027C03FE29A950973ABEA69SnippetUI06ActionG0Vvpfi_0();
  sub_EB74(&qword_41560, (void (*)(uint64_t))&type metadata accessor for SashStandard);
  uint64_t v22 = v28;
  sub_32F08();
  if (!v22) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v25[0] + 32))(a3, v8, v4);
  }

  sub_EB18(v18, &qword_41568);
  swift_bridgeObjectRelease();
  swift_release();
  sub_338B8();
  sub_EC24();
  return (*(uint64_t (**)(uint64_t))(v23 + 8))(v21);
}

uint64_t type metadata accessor for SashStandardView(uint64_t a1)
{
  return sub_983C(a1, (uint64_t *)&unk_41638);
}

uint64_t sub_983C(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t SashStandardView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v65 = a1;
  sub_33C28();
  sub_9370();
  uint64_t v63 = v3;
  uint64_t v64 = v2;
  __chkstk_darwin(v2);
  sub_EC48();
  uint64_t v62 = v4;
  uint64_t v5 = type metadata accessor for SashStandardView(0);
  uint64_t v56 = *(void *)(v5 - 8);
  uint64_t v6 = *(void *)(v56 + 64);
  __chkstk_darwin(v5 - 8);
  sub_63C4(&qword_41570);
  sub_9370();
  uint64_t v60 = v8;
  uint64_t v61 = v7;
  __chkstk_darwin(v7);
  sub_EC48();
  uint64_t v58 = v9;
  uint64_t v57 = sub_63C4(&qword_41578);
  sub_EC24();
  __chkstk_darwin(v10);
  sub_EC48();
  uint64_t v59 = v11;
  uint64_t v12 = sub_334A8();
  uint64_t v66 = v1;
  sub_9D78((uint64_t)v68);
  long long v55 = *(_OWORD *)v68;
  int v54 = v68[16];
  uint64_t v52 = *(void *)&v68[32];
  uint64_t v53 = *(void *)&v68[24];
  uint64_t v50 = *(void *)&v68[48];
  uint64_t v51 = *(void *)&v68[40];
  char v13 = v68[56];
  uint64_t v49 = *(void *)&v68[64];
  char v14 = v68[72];
  unsigned __int8 v15 = sub_335D8();
  unsigned __int8 v16 = sub_335C8();
  unsigned __int8 v17 = sub_335F8();
  char v18 = sub_335E8();
  sub_335E8();
  if (sub_335E8() != v15) {
    char v18 = sub_335E8();
  }
  sub_335E8();
  if (sub_335E8() != v16) {
    char v18 = sub_335E8();
  }
  sub_335E8();
  if (sub_335E8() != v17) {
    char v18 = sub_335E8();
  }
  sub_33278();
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  char v72 = 0;
  char v71 = v13;
  char v70 = v14;
  char v69 = 0;
  uint64_t v27 = sub_ABA8();
  if (!v27) {
    uint64_t v27 = sub_336D8();
  }
  *(void *)v68 = v27;
  uint64_t v28 = sub_332B8();
  char v29 = v72;
  char v30 = v71;
  char v31 = v70;
  char v32 = v69;
  char v33 = sub_335B8();
  v67[0] = v12;
  v67[1] = 0;
  LOBYTE(v67[2]) = v29;
  *(_OWORD *)&v67[3] = v55;
  LOBYTE(v67[5]) = v54;
  v67[6] = v53;
  v67[7] = v52;
  v67[8] = v51;
  v67[9] = v50;
  LOBYTE(v67[10]) = v30;
  v67[11] = v49;
  LOBYTE(v67[12]) = v31;
  LOBYTE(v67[13]) = v18;
  v67[14] = v20;
  v67[15] = v22;
  v67[16] = v24;
  v67[17] = v26;
  LOBYTE(v67[18]) = v32;
  v67[19] = v28;
  LOBYTE(v67[20]) = v33;
  *(void *)&long long v55 = type metadata accessor for SashStandardView;
  uint64_t v34 = v66;
  os_log_type_t v35 = (char *)&v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_B8A8(v66, (uint64_t)v35, (void (*)(void))type metadata accessor for SashStandardView);
  unint64_t v36 = (*(unsigned __int8 *)(v56 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80);
  uint64_t v37 = swift_allocObject();
  sub_B900((uint64_t)v35, v37 + v36);
  sub_63C4(&qword_41580);
  sub_B9A4();
  uint64_t v38 = v58;
  sub_33668();
  swift_release();
  memcpy(v68, v67, sizeof(v68));
  sub_BB58((uint64_t)v68);
  sub_B8A8(v34, (uint64_t)v35, (void (*)(void))v55);
  uint64_t v39 = swift_allocObject();
  sub_B900((uint64_t)v35, v39 + v36);
  uint64_t v40 = v62;
  sub_33C18();
  uint64_t v41 = v59;
  uint64_t v42 = (char *)(v59 + *(int *)(v57 + 36));
  uint64_t v43 = sub_332C8();
  uint64_t v45 = v63;
  uint64_t v44 = v64;
  (*(void (**)(char *, uint64_t, uint64_t))(v63 + 16))(&v42[*(int *)(v43 + 20)], v40, v64);
  *(void *)uint64_t v42 = &unk_415D8;
  *((void *)v42 + 1) = v39;
  uint64_t v47 = v60;
  uint64_t v46 = v61;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v60 + 16))(v41, v38, v61);
  (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v40, v44);
  (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v38, v46);
  return sub_BFFC(v41, v65);
}

uint64_t sub_9D78@<X0>(uint64_t a1@<X8>)
{
  sub_9DF0(&v10);
  uint64_t v2 = v10;
  sub_A6D4(&v10);
  uint64_t v3 = v10;
  char v4 = sub_335D8();
  uint64_t result = sub_33278();
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(unsigned char *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  *(unsigned char *)(a1 + 72) = 0;
  return result;
}

uint64_t sub_9DF0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v65 = a1;
  uint64_t v60 = sub_63C4(&qword_417E0);
  uint64_t v58 = *(void *)(v60 - 8);
  ((void (*)(void))__chkstk_darwin)();
  int v54 = (char *)&v51 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = sub_63C4(&qword_417E8);
  uint64_t v59 = *(void *)(v61 - 8);
  uint64_t v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  long long v55 = (char *)&v51 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v57 = (char *)&v51 - v4;
  uint64_t v56 = sub_32E88();
  uint64_t v64 = *(void *)(v56 - 8);
  uint64_t v5 = __chkstk_darwin(v56);
  uint64_t v7 = (char *)&v51 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v63 = (char *)&v51 - v8;
  uint64_t v62 = sub_32CA8();
  uint64_t v9 = *(void *)(v62 - 8);
  __chkstk_darwin(v62);
  uint64_t v11 = (char *)&v51 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_32CE8();
  uint64_t v52 = *(void *)(v12 - 8);
  uint64_t v53 = v12;
  __chkstk_darwin(v12);
  char v14 = (char *)&v51 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsigned __int8 v15 = (int *)type metadata accessor for AppIconView(0);
  uint64_t v16 = __chkstk_darwin(v15);
  char v18 = (char *)&v51 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v51 - v19;
  uint64_t v21 = type metadata accessor for SashStandardView.AppIcon(0);
  __chkstk_darwin(v21);
  uint64_t v23 = (char *)&v51 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for SashStandardView(0);
  sub_63C4(&qword_41568);
  sub_33788();
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v26 = v63;
      uint64_t v25 = v64;
      uint64_t v52 = *(void *)(v64 + 32);
      uint64_t v53 = v9;
      uint64_t v27 = v56;
      ((void (*)(char *, char *, uint64_t))v52)(v63, v23, v56);
      uint64_t v28 = v26;
      uint64_t v29 = v27;
      (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v7, v28, v27);
      char v30 = (uint64_t *)&v20[v15[5]];
      sub_339B8();
      sub_EB74((unint64_t *)&qword_421F0, (void (*)(uint64_t))&type metadata accessor for Context);
      *char v30 = sub_33338();
      v30[1] = v31;
      char v32 = (uint64_t *)&v20[v15[6]];
      *char v32 = swift_getKeyPath();
      sub_63C4(&qword_411F0);
      swift_storeEnumTagMultiPayload();
      char v33 = &v20[v15[7]];
      *(void *)char v33 = swift_getKeyPath();
      v33[8] = 0;
      uint64_t v34 = v15[8];
      uint64_t v66 = 0;
      sub_63C4((uint64_t *)&unk_41980);
      sub_33778();
      *(_OWORD *)&v20[v34] = v67;
      ((void (*)(char *, char *, uint64_t))v52)(v20, v7, v29);
      type metadata accessor for AppIconView.Model(0);
      swift_storeEnumTagMultiPayload();
      uint64_t v35 = v53;
      uint64_t v36 = v62;
      (*(void (**)(char *, void, uint64_t))(v53 + 104))(v11, enum case for ImageElement.ImageStyle.appIcon2(_:), v62);
      uint64_t v37 = sub_EB74(&qword_417F0, (void (*)(uint64_t))type metadata accessor for AppIconView);
      uint64_t v38 = v54;
      sub_33638();
      (*(void (**)(char *, uint64_t))(v35 + 8))(v11, v36);
      sub_EBBC((uint64_t)v20, (void (*)(void))type metadata accessor for AppIconView);
      *(void *)&long long v67 = v15;
      *((void *)&v67 + 1) = v37;
      uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
      uint64_t v40 = v57;
      uint64_t v41 = v60;
      sub_33648();
      (*(void (**)(char *, uint64_t))(v58 + 8))(v38, v41);
      uint64_t v42 = v59;
      uint64_t v43 = v61;
      (*(void (**)(char *, char *, uint64_t))(v59 + 16))(v55, v40, v61);
      *(void *)&long long v67 = v41;
      *((void *)&v67 + 1) = OpaqueTypeConformance2;
      swift_getOpaqueTypeConformance2();
      uint64_t v44 = sub_337C8();
      (*(void (**)(char *, uint64_t))(v42 + 8))(v40, v43);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v64 + 8))(v63, v29);
    }
    else
    {
      uint64_t result = sub_337C8();
      uint64_t v44 = result;
    }
  }
  else
  {
    (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, enum case for ImageElement.ImageStyle.appIcon2(_:), v62);
    sub_32CF8();
    uint64_t v46 = (uint64_t *)&v20[v15[5]];
    sub_339B8();
    sub_EB74((unint64_t *)&qword_421F0, (void (*)(uint64_t))&type metadata accessor for Context);
    uint64_t *v46 = sub_33338();
    v46[1] = v47;
    uint64_t v48 = (uint64_t *)&v20[v15[6]];
    *uint64_t v48 = swift_getKeyPath();
    sub_63C4(&qword_411F0);
    swift_storeEnumTagMultiPayload();
    uint64_t v49 = &v20[v15[7]];
    *(void *)uint64_t v49 = swift_getKeyPath();
    v49[8] = 0;
    uint64_t v50 = v15[8];
    uint64_t v66 = 0;
    sub_63C4((uint64_t *)&unk_41980);
    sub_33778();
    *(_OWORD *)&v20[v50] = v67;
    (*(void (**)(char *, char *, uint64_t))(v52 + 32))(v20, v14, v53);
    type metadata accessor for AppIconView.Model(0);
    swift_storeEnumTagMultiPayload();
    sub_B8A8((uint64_t)v20, (uint64_t)v18, (void (*)(void))type metadata accessor for AppIconView);
    sub_EB74(&qword_417F0, (void (*)(uint64_t))type metadata accessor for AppIconView);
    uint64_t v44 = sub_337C8();
    uint64_t result = sub_EBBC((uint64_t)v20, (void (*)(void))type metadata accessor for AppIconView);
  }
  *uint64_t v65 = v44;
  return result;
}

uint64_t sub_A6D4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v45 = a1;
  uint64_t v2 = sub_63C4(&qword_41788);
  __chkstk_darwin(v2 - 8);
  uint64_t v43 = (uint64_t)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_63C4(&qword_41790);
  __chkstk_darwin(v4 - 8);
  uint64_t v37 = (uint64_t)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = sub_32BE8();
  uint64_t v39 = *(void *)(v41 - 8);
  __chkstk_darwin(v41);
  uint64_t v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_63C4(&qword_41798);
  uint64_t v38 = *(void *)(v40 - 8);
  __chkstk_darwin(v40);
  uint64_t v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_63C4(&qword_417A0);
  __chkstk_darwin(v35);
  uint64_t v11 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = sub_63C4(&qword_417A8);
  uint64_t v12 = __chkstk_darwin(v42);
  uint64_t v36 = (uint64_t)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  unsigned __int8 v15 = (char *)&v34 - v14;
  uint64_t v16 = *(int *)(type metadata accessor for SashStandardView(0) + 28);
  uint64_t v44 = v1;
  uint64_t v17 = (uint64_t *)(v1 + v16);
  uint64_t v18 = *v17;
  uint64_t v19 = v17[1];
  uint64_t v20 = v17[2];
  *(void *)&long long v46 = *v17;
  *((void *)&v46 + 1) = v19;
  *(void *)&long long v47 = v20;
  sub_63C4(&qword_41740);
  sub_33788();
  uint64_t v22 = v49;
  unint64_t v21 = v50;
  swift_bridgeObjectRelease();
  uint64_t v23 = HIBYTE(v21) & 0xF;
  if ((v21 & 0x2000000000000000) == 0) {
    uint64_t v23 = v22 & 0xFFFFFFFFFFFFLL;
  }
  if (v23)
  {
    *(void *)&long long v46 = v18;
    *((void *)&v46 + 1) = v19;
    *(void *)&long long v47 = v20;
    sub_33788();
    uint64_t v24 = sub_32BD8();
    _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v37, 1, 1, v24);
    uint64_t v25 = sub_32FC8();
    _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v43, 1, 1, v25);
    uint64_t v48 = 0;
    long long v46 = 0u;
    long long v47 = 0u;
    sub_32BF8();
    sub_32BC8();
    (*(void (**)(char *, uint64_t))(v39 + 8))(v7, v41);
    int v26 = sub_33508();
    uint64_t v27 = v38;
    uint64_t v28 = v40;
    (*(void (**)(char *, char *, uint64_t))(v38 + 16))(v11, v9, v40);
    *(_DWORD *)&v11[*(int *)(v35 + 36)] = v26;
    (*(void (**)(char *, uint64_t))(v27 + 8))(v9, v28);
    uint64_t v29 = sub_CB54();
    uint64_t KeyPath = swift_getKeyPath();
    sub_E92C((uint64_t)v11, (uint64_t)v15, &qword_417A0);
    uint64_t v31 = (uint64_t *)&v15[*(int *)(v42 + 36)];
    uint64_t *v31 = KeyPath;
    v31[1] = v29;
    sub_EB18((uint64_t)v11, &qword_417A0);
    sub_E92C((uint64_t)v15, v36, &qword_417A8);
    sub_E97C();
    uint64_t v32 = sub_337C8();
    uint64_t result = sub_EB18((uint64_t)v15, &qword_417A8);
  }
  else
  {
    uint64_t result = sub_337C8();
    uint64_t v32 = result;
  }
  uint64_t *v45 = v32;
  return result;
}

uint64_t sub_ABA8()
{
  uint64_t v1 = sub_33058();
  uint64_t v36 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v34 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_32C28();
  uint64_t v33 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  uint64_t v32 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_32C08();
  uint64_t v38 = *(void *)(v4 - 8);
  uint64_t v39 = v4;
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_63C4(&qword_41758);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_63C4(&qword_41780);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_32E38();
  uint64_t v37 = *(void *)(v13 - 8);
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v30 - v17;
  sub_32DA8();
  uint64_t v19 = sub_32E88();
  if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v9, 1, v19) == 1)
  {
    sub_EB18((uint64_t)v9, &qword_41758);
    _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v12, 1, 1, v13);
    goto LABEL_5;
  }
  uint64_t v31 = v1;
  sub_32E68();
  (*(void (**)(char *, uint64_t))(*(void *)(v19 - 8) + 8))(v9, v19);
  uint64_t v20 = *(void **)(v0 + *(int *)(type metadata accessor for SashStandardView(0) + 20));
  if (v20)
  {
    id v21 = v20;
    sub_33948();

    sub_33D18();
    sub_33BA8();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v38 + 8))(v6, v39);
    if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v12, 1, v13) != 1)
    {
      uint64_t v24 = v37;
      (*(void (**)(char *, char *, uint64_t))(v37 + 32))(v18, v12, v13);
      (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v16, v18, v13);
      if ((*(unsigned int (**)(char *, uint64_t))(v24 + 88))(v16, v13) == enum case for VisualElement.color(_:))
      {
        (*(void (**)(char *, uint64_t))(v24 + 96))(v16, v13);
        int v26 = v32;
        uint64_t v25 = v33;
        uint64_t v27 = v35;
        (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v32, v16, v35);
        uint64_t v28 = v34;
        sub_32C18();
        uint64_t v22 = sub_33048();
        (*(void (**)(char *, uint64_t))(v36 + 8))(v28, v31);
        (*(void (**)(char *, uint64_t))(v25 + 8))(v26, v27);
        (*(void (**)(char *, uint64_t))(v24 + 8))(v18, v13);
        return v22;
      }
      uint64_t v29 = *(void (**)(char *, uint64_t))(v24 + 8);
      v29(v18, v13);
      v29(v16, v13);
      return 0;
    }
LABEL_5:
    sub_EB18((uint64_t)v12, &qword_41780);
    return 0;
  }
  sub_339B8();
  sub_EB74((unint64_t *)&qword_421F0, (void (*)(uint64_t))&type metadata accessor for Context);
  uint64_t result = sub_33328();
  __break(1u);
  return result;
}

uint64_t sub_B16C()
{
  uint64_t v0 = sub_33098();
  uint64_t v58 = *(void *)(v0 - 8);
  uint64_t v59 = v0;
  __chkstk_darwin(v0);
  uint64_t v57 = (char **)((char *)&v51 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v2 = sub_32BA8();
  uint64_t v54 = *(void *)(v2 - 8);
  uint64_t v55 = v2;
  __chkstk_darwin(v2);
  uint64_t v53 = (char *)&v51 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for SashStandardView.AppIcon(0);
  __chkstk_darwin(v4);
  uint64_t v6 = (uint64_t *)((char *)&v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = sub_63C4(&qword_41760);
  __chkstk_darwin(v7 - 8);
  uint64_t v52 = (char *)&v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_63C4(&qword_41768);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v51 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_63C4(&qword_41770);
  uint64_t v13 = __chkstk_darwin(v12 - 8);
  uint64_t v56 = (char *)&v51 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v51 - v16;
  __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v51 - v18;
  type metadata accessor for SashStandardView(0);
  sub_33898();
  uint64_t v20 = sub_33938();
  int v21 = _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v19, 1, v20);
  uint64_t v60 = v20;
  uint64_t v51 = v11;
  if (v21 == 1)
  {
    sub_EB18((uint64_t)v19, &qword_41770);
LABEL_6:
    sub_63C4(&qword_41568);
    sub_33788();
    if (swift_getEnumCaseMultiPayload()) {
      return sub_EBBC((uint64_t)v6, (void (*)(void))type metadata accessor for SashStandardView.AppIcon);
    }
    uint64_t v27 = *v6;
    uint64_t v28 = v6[1];
    id v29 = [objc_allocWithZone((Class)SAUIAppPunchOut) init];
    uint64_t v30 = v53;
    sub_32B98();
    uint64_t v31 = sub_32B88();
    uint64_t v33 = v32;
    (*(void (**)(char *, uint64_t))(v54 + 8))(v30, v55);
    sub_E7BC(v31, v33, v29, (SEL *)&selRef_setAceId_);
    [v29 setAppAvailableInStorefront:1];
    sub_E7BC(v27, v28, v29, (SEL *)&selRef_setBundleId_);
    uint64_t v35 = v57;
    uint64_t v34 = v58;
    *uint64_t v57 = v29;
    *((unsigned char *)v35 + 8) = 0;
    uint64_t v36 = v59;
    (*(void (**)(void *, void, uint64_t))(v34 + 104))(v35, enum case for Command.aceCommand(_:), v59);
    id v37 = v29;
    uint64_t v38 = (uint64_t)v56;
    sub_33898();
    uint64_t v39 = v60;
    if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0(v38, 1, v60) == 1)
    {
      (*(void (**)(void *, uint64_t))(v34 + 8))(v35, v36);

      uint64_t v25 = v38;
      return sub_EB18(v25, &qword_41770);
    }
    sub_63C4(&qword_41778);
    uint64_t v40 = swift_allocObject();
    *(_OWORD *)(v40 + 16) = xmmword_34830;
    *(void *)(v40 + 56) = v36;
    *(void *)(v40 + 64) = &protocol witness table for Command;
    uint64_t v41 = sub_E898((uint64_t *)(v40 + 32));
    (*(void (**)(uint64_t *, void *, uint64_t))(v34 + 16))(v41, v35, v36);
    uint64_t v42 = (uint64_t)v51;
    sub_32E58();
    uint64_t v43 = sub_32E48();
    _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v42, 0, 1, v43);
    uint64_t v44 = enum case for InteractionType.componentTapped(_:);
    uint64_t v45 = sub_338C8();
    uint64_t v46 = (uint64_t)v52;
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v45 - 8) + 104))(v52, v44, v45);
    _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v46, 0, 1, v45);
    sub_33928();

    sub_EB18(v46, &qword_41760);
    sub_EB18(v42, &qword_41768);
    (*(void (**)(void *, uint64_t))(v34 + 8))(v35, v36);
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v39 - 8) + 8))(v38, v39);
  }
  sub_32DE8();
  char v22 = sub_33918();
  sub_EB18((uint64_t)v11, &qword_41768);
  uint64_t v23 = *(void (**)(char *, uint64_t))(*(void *)(v20 - 8) + 8);
  v23(v19, v20);
  if ((v22 & 1) == 0) {
    goto LABEL_6;
  }
  sub_33898();
  uint64_t v24 = v60;
  if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v17, 1, v60) == 1)
  {
    uint64_t v25 = (uint64_t)v17;
    return sub_EB18(v25, &qword_41770);
  }
  uint64_t v47 = (uint64_t)v51;
  sub_32DE8();
  uint64_t v48 = enum case for InteractionType.componentTapped(_:);
  uint64_t v49 = sub_338C8();
  uint64_t v50 = (uint64_t)v52;
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v49 - 8) + 104))(v52, v48, v49);
  _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v50, 0, 1, v49);
  sub_33928();
  sub_EB18(v50, &qword_41760);
  sub_EB18(v47, &qword_41768);
  return ((uint64_t (*)(char *, uint64_t))v23)(v17, v24);
}

uint64_t sub_B8A8(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_EC24();
  uint64_t v4 = sub_EC6C();
  v5(v4);
  return a2;
}

uint64_t sub_B900(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SashStandardView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_B964()
{
  uint64_t v0 = type metadata accessor for SashStandardView(0);
  sub_EC34(v0);

  return sub_B16C();
}

unint64_t sub_B9A4()
{
  unint64_t result = qword_41588;
  if (!qword_41588)
  {
    sub_6728(&qword_41580);
    sub_BA44();
    sub_EAD4(&qword_415C0, &qword_415C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_41588);
  }
  return result;
}

unint64_t sub_BA44()
{
  unint64_t result = qword_41590;
  if (!qword_41590)
  {
    sub_6728(&qword_41598);
    sub_BAB8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_41590);
  }
  return result;
}

unint64_t sub_BAB8()
{
  unint64_t result = qword_415A0;
  if (!qword_415A0)
  {
    sub_6728(&qword_415A8);
    sub_EAD4(&qword_415B0, &qword_415B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_415A0);
  }
  return result;
}

uint64_t sub_BB58(uint64_t a1)
{
  return a1;
}

uint64_t sub_BBA0(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  sub_33C08();
  *(void *)(v1 + 24) = sub_33BF8();
  uint64_t v3 = sub_33BE8();
  return _swift_task_switch(sub_BC38, v3, v2);
}

uint64_t sub_BC38()
{
  swift_release();
  sub_C080();
  sub_C438();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_BCA4()
{
  uint64_t v1 = type metadata accessor for SashStandardView(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  sub_32E08();
  sub_EC24();
  (*(void (**)(uint64_t))(v5 + 8))(v0 + v3);

  uint64_t v6 = v0 + v3 + *(int *)(v1 + 24);
  type metadata accessor for SashStandardView.AppIcon(0);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    sub_32E88();
    sub_EC24();
    (*(void (**)(uint64_t))(v8 + 8))(v6);
  }
  else if (!EnumCaseMultiPayload)
  {
    swift_bridgeObjectRelease();
  }
  sub_63C4(&qword_41568);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  sub_338B8();
  sub_EC24();
  uint64_t v9 = sub_EC5C();
  v10(v9);

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_BE5C()
{
  uint64_t v2 = type metadata accessor for SashStandardView(0);
  sub_EC34(v2);
  uint64_t v4 = v0 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_BF08;
  return sub_BBA0(v4);
}

uint64_t sub_BF08()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_BFFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_63C4(&qword_41578);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_C064()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_C080()
{
  uint64_t v0 = sub_63C4(&qword_41738);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for SashStandardView.AppIcon(0);
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (uint64_t *)((char *)&v21 - v7);
  uint64_t v9 = sub_63C4(&qword_41758);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_32E88();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_32DF8();
  if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v11, 1, v12) == 1)
  {
    sub_EB18((uint64_t)v11, &qword_41758);
    sub_32DD8();
    uint64_t v16 = sub_32DC8();
    if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v2, 1, v16) == 1)
    {
      return sub_EB18((uint64_t)v2, &qword_41738);
    }
    else
    {
      uint64_t v18 = sub_32DB8();
      uint64_t v20 = v19;
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(*(void *)(v16 - 8) + 8))(v2, v16);
      if (v20)
      {
        *uint64_t v8 = v18;
        v8[1] = v20;
        swift_storeEnumTagMultiPayload();
        type metadata accessor for SashStandardView(0);
        sub_B8A8((uint64_t)v8, (uint64_t)v6, (void (*)(void))type metadata accessor for SashStandardView.AppIcon);
        sub_63C4(&qword_41568);
        sub_33798();
        return sub_EBBC((uint64_t)v8, (void (*)(void))type metadata accessor for SashStandardView.AppIcon);
      }
    }
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v11, v12);
    (*(void (**)(uint64_t *, char *, uint64_t))(v13 + 16))(v8, v15, v12);
    swift_storeEnumTagMultiPayload();
    type metadata accessor for SashStandardView(0);
    sub_B8A8((uint64_t)v8, (uint64_t)v6, (void (*)(void))type metadata accessor for SashStandardView.AppIcon);
    sub_63C4(&qword_41568);
    sub_33798();
    sub_EBBC((uint64_t)v8, (void (*)(void))type metadata accessor for SashStandardView.AppIcon);
    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
  return result;
}

uint64_t sub_C438()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_63C4(&qword_41738);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (uint64_t *)((char *)&v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v48 - v6;
  sub_32DD8();
  uint64_t v8 = sub_32DC8();
  if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v7, 1, v8) == 1)
  {
    if (qword_411C0 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_331C8();
    sub_7150(v9, (uint64_t)qword_44260);
    uint64_t v10 = sub_331B8();
    os_log_type_t v11 = sub_33C98();
    if (!os_log_type_enabled(v10, v11)) {
      goto LABEL_15;
    }
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v12 = 0;
    uint64_t v13 = "App title missing for sash.";
LABEL_14:
    _os_log_impl(&dword_0, v10, v11, v13, v12, 2u);
    swift_slowDealloc();
LABEL_15:

    return sub_EB18((uint64_t)v7, &qword_41738);
  }
  sub_E92C((uint64_t)v7, (uint64_t)v5, &qword_41738);
  uint64_t v14 = *(void *)(v8 - 8);
  int v15 = (*(uint64_t (**)(uint64_t *, uint64_t))(v14 + 88))(v5, v8);
  if (v15 == enum case for SashStandard.Title.applicationBundleIdentifier(_:))
  {
    (*(void (**)(uint64_t *, uint64_t))(v14 + 96))(v5, v8);
    uint64_t v17 = *v5;
    uint64_t v16 = v5[1];
    id v18 = objc_allocWithZone((Class)LSApplicationRecord);
    swift_bridgeObjectRetain();
    id v26 = sub_E6B4(v17, v16, 1);
    swift_bridgeObjectRelease();
    id v27 = [self sharedPreferences];
    uint64_t v28 = sub_E828(v27);
    if (v29)
    {
      uint64_t v30 = v28;
      uint64_t v31 = v29;
      sub_63C4(&qword_41750);
      uint64_t v32 = swift_allocObject();
      *(_OWORD *)(v32 + 16) = xmmword_34830;
      *(void *)(v32 + 32) = v30;
      *(void *)(v32 + 40) = v31;
      Class isa = sub_33B88().super.isa;
      swift_bridgeObjectRelease();
      id v34 = [v26 localizedNameWithPreferredLocalizations:isa];

      uint64_t v35 = sub_33A38();
      uint64_t v37 = v36;

      uint64_t v38 = (void *)(v1 + *(int *)(type metadata accessor for SashStandardView(0) + 28));
      uint64_t v39 = v38[1];
      uint64_t v40 = v38[2];
      *(void *)&long long v51 = *v38;
      *((void *)&v51 + 1) = v39;
      uint64_t v52 = v40;
      uint64_t v49 = v35;
      uint64_t v50 = v37;
      swift_retain();
      swift_bridgeObjectRetain();
      sub_63C4(&qword_41740);
      sub_33798();
      swift_release();
    }
    else
    {
      id v41 = [v26 localizedName];
      uint64_t v42 = sub_33A38();
      uint64_t v44 = v43;

      uint64_t v45 = (void *)(v1 + *(int *)(type metadata accessor for SashStandardView(0) + 28));
      uint64_t v46 = v45[1];
      uint64_t v47 = v45[2];
      *(void *)&long long v51 = *v45;
      *((void *)&v51 + 1) = v46;
      uint64_t v52 = v47;
      uint64_t v49 = v42;
      uint64_t v50 = v44;
      swift_retain();
      swift_bridgeObjectRetain();
      sub_63C4(&qword_41740);
      sub_33798();
      swift_release();
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    if (v15 != enum case for SashStandard.Title.text(_:))
    {
      (*(void (**)(uint64_t *, uint64_t))(v14 + 8))(v5, v8);
      if (qword_411C0 != -1) {
        swift_once();
      }
      uint64_t v24 = sub_331C8();
      sub_7150(v24, (uint64_t)qword_44260);
      uint64_t v10 = sub_331B8();
      os_log_type_t v11 = sub_33C98();
      if (!os_log_type_enabled(v10, v11)) {
        goto LABEL_15;
      }
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      uint64_t v13 = "Unknown app title type.";
      goto LABEL_14;
    }
    (*(void (**)(uint64_t *, uint64_t))(v14 + 96))(v5, v8);
    uint64_t v19 = *v5;
    uint64_t v20 = v5[1];
    uint64_t v21 = (long long *)(v1 + *(int *)(type metadata accessor for SashStandardView(0) + 28));
    long long v22 = *v21;
    uint64_t v23 = *((void *)v21 + 2);
    long long v51 = v22;
    uint64_t v52 = v23;
    uint64_t v49 = v19;
    uint64_t v50 = v20;
    sub_63C4(&qword_41740);
    sub_33798();
  }
  return sub_EB18((uint64_t)v7, &qword_41738);
}

uint64_t sub_CB54()
{
  uint64_t v1 = sub_33058();
  uint64_t v36 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  id v34 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_32C28();
  uint64_t v33 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  uint64_t v32 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_32C08();
  uint64_t v38 = *(void *)(v4 - 8);
  uint64_t v39 = v4;
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_63C4(&qword_41758);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_63C4(&qword_41780);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_32E38();
  uint64_t v37 = *(void *)(v13 - 8);
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  id v18 = (char *)&v30 - v17;
  sub_32D98();
  uint64_t v19 = sub_32E88();
  if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v9, 1, v19) == 1)
  {
    sub_EB18((uint64_t)v9, &qword_41758);
    _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v12, 1, 1, v13);
    goto LABEL_5;
  }
  uint64_t v31 = v1;
  sub_32E68();
  (*(void (**)(char *, uint64_t))(*(void *)(v19 - 8) + 8))(v9, v19);
  uint64_t v20 = *(void **)(v0 + *(int *)(type metadata accessor for SashStandardView(0) + 20));
  if (v20)
  {
    id v21 = v20;
    sub_33948();

    sub_33D18();
    sub_33BA8();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v38 + 8))(v6, v39);
    if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v12, 1, v13) != 1)
    {
      uint64_t v24 = v37;
      (*(void (**)(char *, char *, uint64_t))(v37 + 32))(v18, v12, v13);
      (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v16, v18, v13);
      if ((*(unsigned int (**)(char *, uint64_t))(v24 + 88))(v16, v13) == enum case for VisualElement.color(_:))
      {
        (*(void (**)(char *, uint64_t))(v24 + 96))(v16, v13);
        id v26 = v32;
        uint64_t v25 = v33;
        uint64_t v27 = v35;
        (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v32, v16, v35);
        uint64_t v28 = v34;
        sub_32C18();
        uint64_t v22 = sub_33048();
        (*(void (**)(char *, uint64_t))(v36 + 8))(v28, v31);
        (*(void (**)(char *, uint64_t))(v25 + 8))(v26, v27);
        (*(void (**)(char *, uint64_t))(v24 + 8))(v18, v13);
        return v22;
      }
      uint64_t v29 = *(void (**)(char *, uint64_t))(v24 + 8);
      v29(v18, v13);
      v29(v16, v13);
      return sub_33718();
    }
LABEL_5:
    sub_EB18((uint64_t)v12, &qword_41780);
    return sub_33718();
  }
  sub_339B8();
  sub_EB74((unint64_t *)&qword_421F0, (void (*)(uint64_t))&type metadata accessor for Context);
  uint64_t result = sub_33328();
  __break(1u);
  return result;
}

uint64_t sub_D124()
{
  return sub_336B8();
}

uint64_t *initializeBufferWithCopyOfBuffer for SashStandardView(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) == 0)
  {
    uint64_t v7 = sub_32E08();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    uint64_t v10 = (uint64_t *)((char *)a1 + v8);
    uint64_t v11 = (char *)a2 + v8;
    uint64_t v13 = *(void **)v11;
    uint64_t v12 = *((void *)v11 + 1);
    *uint64_t v10 = v13;
    v10[1] = v12;
    uint64_t v14 = (uint64_t *)((char *)a1 + v9);
    uint64_t v15 = (uint64_t *)((char *)a2 + v9);
    uint64_t v16 = type metadata accessor for SashStandardView.AppIcon(0);
    id v17 = v13;
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v21 = sub_32E88();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v21 - 8) + 16))(v14, v15, v21);
    }
    else
    {
      if (EnumCaseMultiPayload)
      {
        memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
        goto LABEL_9;
      }
      uint64_t v19 = v15[1];
      void *v14 = *v15;
      v14[1] = v19;
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
LABEL_9:
    uint64_t v22 = sub_63C4(&qword_41568);
    *(void *)((char *)v14 + *(int *)(v22 + 28)) = *(void *)((char *)v15 + *(int *)(v22 + 28));
    uint64_t v23 = a3[7];
    uint64_t v24 = a3[8];
    uint64_t v25 = (uint64_t *)((char *)a1 + v23);
    id v26 = (uint64_t *)((char *)a2 + v23);
    uint64_t v27 = v26[1];
    *uint64_t v25 = *v26;
    v25[1] = v27;
    v25[2] = v26[2];
    uint64_t v28 = (char *)a1 + v24;
    uint64_t v29 = (char *)a2 + v24;
    uint64_t v30 = sub_338B8();
    uint64_t v31 = *(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 16);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    v31(v28, v29, v30);
    return a1;
  }
  uint64_t v20 = *a2;
  *a1 = *a2;
  a1 = (uint64_t *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
  swift_retain();
  return a1;
}

uint64_t destroy for SashStandardView(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_32E08();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);

  uint64_t v5 = a1 + a2[6];
  type metadata accessor for SashStandardView.AppIcon(0);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v7 = sub_32E88();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v5, v7);
  }
  else if (!EnumCaseMultiPayload)
  {
    swift_bridgeObjectRelease();
  }
  sub_63C4(&qword_41568);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v8 = a1 + a2[8];
  uint64_t v9 = sub_338B8();
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8);

  return v10(v8, v9);
}

uint64_t initializeWithCopy for SashStandardView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_32E08();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)(a1 + v7);
  uint64_t v10 = a2 + v7;
  uint64_t v12 = *(void **)v10;
  uint64_t v11 = *(void *)(v10 + 8);
  *uint64_t v9 = v12;
  v9[1] = v11;
  uint64_t v13 = (void *)(a1 + v8);
  uint64_t v14 = (void *)(a2 + v8);
  uint64_t v15 = type metadata accessor for SashStandardView.AppIcon(0);
  id v16 = v12;
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v19 = sub_32E88();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v19 - 8) + 16))(v13, v14, v19);
  }
  else
  {
    if (EnumCaseMultiPayload)
    {
      memcpy(v13, v14, *(void *)(*(void *)(v15 - 8) + 64));
      goto LABEL_7;
    }
    uint64_t v18 = v14[1];
    *uint64_t v13 = *v14;
    v13[1] = v18;
    swift_bridgeObjectRetain();
  }
  swift_storeEnumTagMultiPayload();
LABEL_7:
  uint64_t v20 = sub_63C4(&qword_41568);
  *(void *)((char *)v13 + *(int *)(v20 + 28)) = *(void *)((char *)v14 + *(int *)(v20 + 28));
  uint64_t v21 = a3[7];
  uint64_t v22 = a3[8];
  uint64_t v23 = (void *)(a1 + v21);
  uint64_t v24 = (void *)(a2 + v21);
  uint64_t v25 = v24[1];
  void *v23 = *v24;
  v23[1] = v25;
  v23[2] = v24[2];
  uint64_t v26 = a1 + v22;
  uint64_t v27 = a2 + v22;
  uint64_t v28 = sub_338B8();
  uint64_t v29 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 16);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  v29(v26, v27, v28);
  return a1;
}

uint64_t assignWithCopy for SashStandardView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_32E08();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void **)(a1 + v7);
  uint64_t v11 = *(void **)(a2 + v7);
  *uint64_t v8 = v11;
  id v12 = v11;

  v8[1] = *(void *)(v9 + 8);
  uint64_t v13 = a3[6];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (void *)(a2 + v13);
  if (a1 != a2)
  {
    sub_EBBC(a1 + v13, (void (*)(void))type metadata accessor for SashStandardView.AppIcon);
    uint64_t v16 = type metadata accessor for SashStandardView.AppIcon(0);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v18 = sub_32E88();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v18 - 8) + 16))(v14, v15, v18);
    }
    else
    {
      if (EnumCaseMultiPayload)
      {
        memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
        goto LABEL_8;
      }
      void *v14 = *v15;
      v14[1] = v15[1];
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
LABEL_8:
  uint64_t v19 = sub_63C4(&qword_41568);
  *(void *)((char *)v14 + *(int *)(v19 + 28)) = *(void *)((char *)v15 + *(int *)(v19 + 28));
  swift_retain();
  swift_release();
  uint64_t v20 = a3[7];
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = a2 + v20;
  void *v21 = *(void *)(a2 + v20);
  v21[1] = *(void *)(a2 + v20 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v21[2] = *(void *)(v22 + 16);
  swift_retain();
  swift_release();
  uint64_t v23 = a3[8];
  uint64_t v24 = a1 + v23;
  uint64_t v25 = a2 + v23;
  uint64_t v26 = sub_338B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 24))(v24, v25, v26);
  return a1;
}

uint64_t initializeWithTake for SashStandardView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_32E08();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  uint64_t v8 = (char *)(a1 + v7);
  uint64_t v9 = (char *)(a2 + v7);
  uint64_t v10 = type metadata accessor for SashStandardView.AppIcon(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_32E88();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v8, v9, v11);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
  }
  uint64_t v12 = sub_63C4(&qword_41568);
  *(void *)&v8[*(int *)(v12 + 28)] = *(void *)&v9[*(int *)(v12 + 28)];
  uint64_t v13 = a3[7];
  uint64_t v14 = a3[8];
  uint64_t v15 = a1 + v13;
  uint64_t v16 = a2 + v13;
  *(void *)(v15 + 16) = *(void *)(v16 + 16);
  *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
  uint64_t v17 = a1 + v14;
  uint64_t v18 = a2 + v14;
  uint64_t v19 = sub_338B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 32))(v17, v18, v19);
  return a1;
}

uint64_t assignWithTake for SashStandardView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_32E08();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = *(void **)(a1 + v7);
  *uint64_t v8 = *v9;

  v8[1] = v9[1];
  uint64_t v11 = a3[6];
  uint64_t v12 = (char *)(a1 + v11);
  uint64_t v13 = (char *)(a2 + v11);
  if (a1 != a2)
  {
    sub_EBBC(a1 + v11, (void (*)(void))type metadata accessor for SashStandardView.AppIcon);
    uint64_t v14 = type metadata accessor for SashStandardView.AppIcon(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v15 = sub_32E88();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v12, v13, v15);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v12, v13, *(void *)(*(void *)(v14 - 8) + 64));
    }
  }
  uint64_t v16 = sub_63C4(&qword_41568);
  *(void *)&v12[*(int *)(v16 + 28)] = *(void *)&v13[*(int *)(v16 + 28)];
  swift_release();
  uint64_t v17 = a3[7];
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = a2 + v17;
  uint64_t v20 = *(void *)(a2 + v17 + 8);
  void *v18 = *(void *)(a2 + v17);
  v18[1] = v20;
  swift_bridgeObjectRelease();
  uint64_t v18[2] = *(void *)(v19 + 16);
  swift_release();
  uint64_t v21 = a3[8];
  uint64_t v22 = a1 + v21;
  uint64_t v23 = a2 + v21;
  uint64_t v24 = sub_338B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 40))(v22, v23, v24);
  return a1;
}

uint64_t getEnumTagSinglePayload for SashStandardView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_DC98);
}

uint64_t sub_DC98(uint64_t a1, uint64_t a2, int *a3)
{
  sub_32E08();
  sub_EC0C();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
LABEL_11:
    return _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0(v9, a2, v8);
  }
  sub_63C4(&qword_41568);
  sub_EC0C();
  if (*(_DWORD *)(v11 + 84) == a2)
  {
    uint64_t v8 = v10;
    uint64_t v12 = a3[6];
LABEL_10:
    uint64_t v9 = a1 + v12;
    goto LABEL_11;
  }
  if (a2 != 0x7FFFFFFF)
  {
    uint64_t v8 = sub_338B8();
    uint64_t v12 = a3[8];
    goto LABEL_10;
  }
  unint64_t v13 = *(void *)(a1 + a3[7] + 8);
  if (v13 >= 0xFFFFFFFF) {
    LODWORD(v13) = -1;
  }
  return (v13 + 1);
}

uint64_t _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for SashStandardView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_DDB0);
}

void sub_DDB0(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  sub_32E08();
  sub_EC0C();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    sub_63C4(&qword_41568);
    sub_EC0C();
    if (*(_DWORD *)(v13 + 84) == a3)
    {
      uint64_t v10 = v12;
      uint64_t v14 = a4[6];
    }
    else
    {
      if (a3 == 0x7FFFFFFF)
      {
        *(void *)(a1 + a4[7] + 8) = (a2 - 1);
        return;
      }
      uint64_t v10 = sub_338B8();
      uint64_t v14 = a4[8];
    }
    uint64_t v11 = a1 + v14;
  }

  _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v11, a2, a2, v10);
}

void sub_DE88()
{
  sub_32E08();
  if (v0 <= 0x3F)
  {
    sub_DF9C();
    if (v1 <= 0x3F)
    {
      sub_338B8();
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_DF9C()
{
  if (!qword_41648)
  {
    type metadata accessor for SashStandardView.AppIcon(255);
    unint64_t v0 = sub_337B8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_41648);
    }
  }
}

unint64_t sub_DFF8()
{
  unint64_t result = qword_41688;
  if (!qword_41688)
  {
    sub_6728(&qword_41578);
    sub_6728(&qword_41580);
    sub_B9A4();
    swift_getOpaqueTypeConformance2();
    sub_EB74((unint64_t *)&unk_423B0, (void (*)(uint64_t))&type metadata accessor for _TaskModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_41688);
  }
  return result;
}

uint64_t *sub_E0D8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v10 = sub_32E88();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
    }
    else
    {
      if (EnumCaseMultiPayload)
      {
        memcpy(a1, a2, *(void *)(v6 + 64));
        return a1;
      }
      uint64_t v8 = a2[1];
      *a1 = *a2;
      a1[1] = v8;
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_E1F4(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 1)
  {
    uint64_t v3 = sub_32E88();
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    return v4(a1, v3);
  }
  else if (!result)
  {
    return swift_bridgeObjectRelease();
  }
  return result;
}

void *sub_E294(void *a1, void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v8 = sub_32E88();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
  }
  else
  {
    if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
      return a1;
    }
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    swift_bridgeObjectRetain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *sub_E36C(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_EBBC((uint64_t)a1, (void (*)(void))type metadata accessor for SashStandardView.AppIcon);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v7 = sub_32E88();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      if (EnumCaseMultiPayload)
      {
        memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
        return a1;
      }
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_E470(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_32E88();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *sub_E528(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_EBBC((uint64_t)a1, (void (*)(void))type metadata accessor for SashStandardView.AppIcon);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_32E88();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_E610()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_E620()
{
  uint64_t result = sub_32E88();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

id sub_E6B4(uint64_t a1, uint64_t a2, char a3)
{
  NSString v5 = sub_33A28();
  swift_bridgeObjectRelease();
  id v10 = 0;
  id v6 = [v3 initWithBundleIdentifier:v5 allowPlaceholder:a3 & 1 error:&v10];

  if (v6)
  {
    id v7 = v10;
  }
  else
  {
    id v8 = v10;
    sub_32B28();

    swift_willThrow();
  }
  return v6;
}

uint64_t sub_E790()
{
  return sub_33418();
}

void sub_E7BC(uint64_t a1, uint64_t a2, void *a3, SEL *a4)
{
  NSString v6 = sub_33A28();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, *a4, v6);
}

uint64_t sub_E828(void *a1)
{
  id v2 = [a1 languageCode];

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_33A38();

  return v3;
}

uint64_t *sub_E898(uint64_t *a1)
{
  unint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_E8FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_33408();
  *a1 = result;
  return result;
}

uint64_t sub_E92C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_63C4(a3);
  sub_EC24();
  uint64_t v4 = sub_EC6C();
  v5(v4);
  return a2;
}

unint64_t sub_E97C()
{
  unint64_t result = qword_417B0;
  if (!qword_417B0)
  {
    sub_6728(&qword_417A8);
    sub_EA1C();
    sub_EAD4(&qword_417D0, &qword_417D8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_417B0);
  }
  return result;
}

unint64_t sub_EA1C()
{
  unint64_t result = qword_417B8;
  if (!qword_417B8)
  {
    sub_6728(&qword_417A0);
    swift_getOpaqueTypeConformance2();
    sub_EAD4(&qword_417C0, &qword_417C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_417B8);
  }
  return result;
}

uint64_t sub_EAD4(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_6728(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_EB18(uint64_t a1, uint64_t *a2)
{
  sub_63C4(a2);
  sub_EC24();
  uint64_t v3 = sub_EC5C();
  v4(v3);
  return a1;
}

uint64_t sub_EB74(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_EBBC(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_EC24();
  uint64_t v3 = sub_EC5C();
  v4(v3);
  return a1;
}

uint64_t sub_EC34(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_EC5C()
{
  return v0;
}

uint64_t sub_EC6C()
{
  return v0;
}

void sub_EC80()
{
}

Swift::Int sub_ECA8()
{
  return sub_34018();
}

uint64_t sub_ECEC()
{
  return 1;
}

Swift::Int sub_ECFC()
{
  return sub_34018();
}

uint64_t sub_ED4C(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v185 = a3;
  unint64_t v186 = a4;
  uint64_t v7 = sub_33A68();
  __chkstk_darwin(v7 - 8);
  sub_EC48();
  sub_10F80(v8);
  uint64_t v9 = sub_33188();
  __chkstk_darwin(v9 - 8);
  sub_EC48();
  sub_10F80(v10);
  uint64_t v160 = sub_32FD8();
  sub_EC24();
  __chkstk_darwin(v11);
  sub_EC48();
  sub_10F80(v12);
  uint64_t v159 = sub_32D88();
  sub_9370();
  uint64_t v158 = v13;
  __chkstk_darwin(v14);
  sub_EC48();
  uint64_t v16 = sub_10F80(v15);
  uint64_t v157 = type metadata accessor for ContactImageSourceView(v16);
  sub_EC24();
  __chkstk_darwin(v17);
  sub_EC48();
  uint64_t v19 = sub_10F80(v18);
  uint64_t v161 = type metadata accessor for AppIconView(v19);
  sub_EC24();
  __chkstk_darwin(v20);
  sub_EC48();
  uint64_t v22 = sub_10F80(v21);
  uint64_t v162 = type metadata accessor for SashStandardView(v22);
  sub_EC24();
  __chkstk_darwin(v23);
  sub_EC48();
  sub_10F80(v24);
  uint64_t v165 = sub_32EE8();
  sub_9370();
  uint64_t v164 = v25;
  __chkstk_darwin(v26);
  sub_EC48();
  uint64_t v28 = sub_10F80(v27);
  uint64_t v166 = type metadata accessor for MapsOverlayView(v28);
  sub_EC24();
  __chkstk_darwin(v29);
  sub_EC48();
  sub_10F80(v30);
  uint64_t v170 = sub_32F78();
  sub_9370();
  uint64_t v168 = v31;
  uint64_t v33 = __chkstk_darwin(v32);
  v169 = (char *)&v155 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v33);
  sub_10F80((uint64_t)&v155 - v35);
  uint64_t v172 = type metadata accessor for IntentsUIStandardView();
  sub_EC24();
  __chkstk_darwin(v36);
  sub_EC48();
  sub_10F80(v37);
  uint64_t v173 = type metadata accessor for CoreChartPluginView();
  sub_EC24();
  __chkstk_darwin(v38);
  sub_EC48();
  sub_10F80(v39);
  sub_32FA8();
  sub_9370();
  uint64_t v175 = v41;
  uint64_t v176 = v40;
  __chkstk_darwin(v40);
  sub_EC48();
  uint64_t v177 = v42;
  uint64_t v174 = type metadata accessor for MapsPlaceCardView();
  sub_EC24();
  __chkstk_darwin(v43);
  sub_EC48();
  sub_10F80(v44);
  sub_33028();
  sub_9370();
  uint64_t v180 = v46;
  uint64_t v181 = v45;
  __chkstk_darwin(v45);
  sub_EC48();
  uint64_t v182 = v47;
  uint64_t v179 = type metadata accessor for ContactPickerButtonView();
  sub_EC24();
  __chkstk_darwin(v48);
  sub_EC48();
  uint64_t v178 = v49;
  uint64_t v50 = type metadata accessor for ContactImageView(0);
  sub_EC24();
  __chkstk_darwin(v51);
  uint64_t v53 = (char *)&v155 - ((v52 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = sub_32C38();
  sub_9370();
  uint64_t v183 = v55;
  uint64_t v57 = *(void *)(v56 + 64);
  uint64_t v59 = __chkstk_darwin(v58);
  uint64_t v60 = __chkstk_darwin(v59);
  uint64_t v62 = (char *)&v155 - v61;
  __chkstk_darwin(v60);
  uint64_t v64 = (uint64_t *)((char *)&v155 - v63);
  uint64_t v155 = a1;
  unint64_t v156 = a2;
  uint64_t v65 = sub_33A98();
  uint64_t v67 = v66;
  BOOL v68 = v65 == 0x6D69656C63726963 && v66 == 0xEB00000000656761;
  if (v68 || (uint64_t v69 = v65, (sub_10F90() & 1) != 0))
  {
    swift_bridgeObjectRelease();
    sub_10FAC();
    sub_10FC8();
    uint64_t result = sub_32C48();
    if (!v4)
    {
      *(void *)&long long v187 = CircleImageView.init(model:)(v64);
      *((void *)&v187 + 1) = v71;
      *(void *)&long long v188 = v72;
      sub_1067C();
      return sub_337C8();
    }
    return result;
  }
  BOOL v73 = v69 == 0x69746361746E6F63 && v67 == 0xEC0000006567616DLL;
  if (v73
    || (sub_10F90() & 1) != 0
    || (v69 == 0x6D6172676F6E6F6DLL ? (BOOL v74 = v67 == 0xED00006567616D69) : (BOOL v74 = 0), v74 || (sub_10F90() & 1) != 0))
  {
    swift_bridgeObjectRelease();
    sub_103E4(v185, v186);
    uint64_t v75 = v184;
    uint64_t result = sub_32C48();
    if (!v75)
    {
      sub_339B8();
      sub_10634((unint64_t *)&qword_421F0, (void (*)(uint64_t))&type metadata accessor for Context);
      *(void *)uint64_t v53 = sub_33338();
      *((void *)v53 + 1) = v76;
      v77 = (uint64_t *)&v53[*(int *)(v50 + 24)];
      uint64_t *v77 = swift_getKeyPath();
      sub_63C4(&qword_411F0);
      swift_storeEnumTagMultiPayload();
      uint64_t v78 = v183;
      (*(void (**)(char *, char *, uint64_t))(v183 + 16))((char *)&v155 - ((v57 + 15) & 0xFFFFFFFFFFFFFFF0), v62, v54);
      uint64_t v79 = swift_allocObject();
      sub_10FFC();
      v80();
      (*(void (**)(char *, uint64_t))(v78 + 8))(v62, v54);
      *((void *)v53 + 2) = sub_105D4;
      *((void *)v53 + 3) = v79;
      v53[32] = 0;
      sub_10634(&qword_418F8, (void (*)(uint64_t))type metadata accessor for ContactImageView);
      return sub_337C8();
    }
    return result;
  }
  if (v69 == 0xD000000000000013 && v67 == 0x8000000000037710)
  {
    swift_bridgeObjectRelease();
    uint64_t v81 = v182;
    goto LABEL_26;
  }
  char v82 = sub_10F90();
  uint64_t v84 = v185;
  unint64_t v83 = v186;
  uint64_t v81 = v182;
  if (v82)
  {
    swift_bridgeObjectRelease();
LABEL_26:
    sub_10FE4();
    uint64_t v85 = v184;
    uint64_t result = sub_33038();
    if (!v85)
    {
      uint64_t v87 = v178;
      uint64_t v86 = v179;
      v88 = (uint64_t *)(v178 + *(int *)(v179 + 20));
      sub_339B8();
      sub_10634((unint64_t *)&qword_421F0, (void (*)(uint64_t))&type metadata accessor for Context);
      uint64_t *v88 = sub_33338();
      v88[1] = v89;
      uint64_t v90 = v87 + *(int *)(v86 + 24);
      LOBYTE(v190) = 0;
      sub_33778();
      uint64_t v91 = *((void *)&v187 + 1);
      *(unsigned char *)uint64_t v90 = v187;
      *(void *)(v90 + 8) = v91;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v180 + 32))(v87, v81, v181);
      sub_10634(&qword_418F0, (void (*)(uint64_t))type metadata accessor for ContactPickerButtonView);
      return sub_337C8();
    }
    return result;
  }
  BOOL v92 = v69 == 0x63616C707370616DLL && v67 == 0xED00006472616365;
  if (v92 || (sub_10F90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    sub_10FE4();
    uint64_t v93 = v184;
    uint64_t result = sub_32FB8();
    if (!v93)
    {
      uint64_t v94 = sub_10FD8();
      v95(v94);
      sub_10634(&qword_418E8, (void (*)(uint64_t))type metadata accessor for MapsPlaceCardView);
      return sub_337C8();
    }
  }
  else
  {
    BOOL v96 = v69 == 0x7261686365726F63 && v67 == 0xE900000000000074;
    if (v96 || (sub_10F90() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      sub_10FE4();
      sub_33108();
      sub_10634(&qword_418E0, (void (*)(uint64_t))type metadata accessor for CoreChartPluginView);
      return sub_337C8();
    }
    if (v69 == 0xD000000000000011 && v67 == 0x8000000000037730 || (sub_10F90() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      v97 = (int *)v172;
      uint64_t v98 = v171;
      uint64_t v99 = v170;
      uint64_t v100 = v171 + *(int *)(v172 + 20);
      sub_10FE4();
      sub_339B8();
      sub_10634((unint64_t *)&qword_421F0, (void (*)(uint64_t))&type metadata accessor for Context);
      *(void *)uint64_t v100 = sub_33338();
      *(void *)(v100 + 8) = v101;
      v102 = (uint64_t *)(v98 + v97[6]);
      uint64_t *v102 = swift_getKeyPath();
      sub_63C4(&qword_411F8);
      swift_storeEnumTagMultiPayload();
      uint64_t v103 = v98 + v97[7];
      _s12SystemPlugin21IntentsUIStandardViewV14_actionHandler33_B186D5490C027C03FE29A950973ABEA69SnippetUI06ActionG0Vvpfi_0();
      sub_10FE4();
      sub_10634(&qword_418C0, (void (*)(uint64_t))&type metadata accessor for IntentsUIStandard);
      uint64_t v104 = v184;
      sub_32F08();
      if (!v104)
      {
        uint64_t v106 = v168;
        sub_10FFC();
        v107();
        uint64_t v108 = (uint64_t)v169;
        (*(void (**)(char *, uint64_t, uint64_t))(v106 + 16))(v169, v98, v99);
        id v109 = objc_allocWithZone((Class)type metadata accessor for IntentsUIStandardViewModel());
        sub_29CC(v108, 0, 0);
        v110 = (uint64_t *)(v98 + v97[8]);
        sub_10634(&qword_418D0, (void (*)(uint64_t))type metadata accessor for IntentsUIStandardViewModel);
        sub_10FD8();
        uint64_t v111 = sub_332D8();
        uint64_t v113 = v112;
        sub_1043C(v84, v83);
        uint64_t *v110 = v111;
        v110[1] = v113;
        sub_10634(&qword_418D8, (void (*)(uint64_t))type metadata accessor for IntentsUIStandardView);
        return sub_337C8();
      }
      sub_1043C(v84, v83);

      sub_104E8((uint64_t)v102);
      sub_338B8();
      sub_EC24();
      return (*(uint64_t (**)(uint64_t))(v105 + 8))(v103);
    }
    else
    {
      BOOL v114 = v69 == 0x6C7265766F70616DLL && v67 == 0xEA00000000007961;
      if (v114 || (sub_10F90() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        sub_10FAC();
        sub_10FC8();
        uint64_t result = sub_32EF8();
        if (!v4)
        {
          uint64_t v115 = v166;
          uint64_t v116 = v163;
          v117 = (uint64_t *)(v163 + *(int *)(v166 + 24));
          sub_339B8();
          sub_10634((unint64_t *)&qword_421F0, (void (*)(uint64_t))&type metadata accessor for Context);
          uint64_t *v117 = sub_33338();
          v117[1] = v118;
          uint64_t v119 = v164;
          uint64_t v120 = v167;
          uint64_t v121 = v165;
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v164 + 16))(v116, v167, v165);
          sub_32EC8();
          uint64_t v123 = v122;
          sub_32ED8();
          uint64_t v125 = v124;
          double v126 = COERCE_DOUBLE(sub_32E98());
          if (v127) {
            double v128 = 0.01;
          }
          else {
            double v128 = v126;
          }
          uint64_t v129 = sub_32EA8();
          char v131 = v130;
          (*(void (**)(uint64_t, uint64_t))(v119 + 8))(v120, v121);
          double v132 = *(double *)&v129;
          if (v131) {
            double v132 = 0.01;
          }
          uint64_t v133 = v116 + *(int *)(v115 + 20);
          *(void *)uint64_t v133 = v123;
          *(void *)(v133 + 8) = v125;
          *(double *)(v133 + 16) = v128;
          *(double *)(v133 + 24) = v132;
          *(void *)(v133 + 32) = 0;
          sub_10634(&qword_418B8, (void (*)(uint64_t))type metadata accessor for MapsOverlayView);
          return sub_337C8();
        }
      }
      else if (v69 == 0xD000000000000010 && v67 == 0x8000000000037750 || (sub_10F90() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        sub_10FAC();
        uint64_t v134 = sub_10FC8();
        uint64_t result = SashStandardView.init(modelData:)(v134, v135, v136);
        if (!v4)
        {
          sub_10634(&qword_418B0, (void (*)(uint64_t))type metadata accessor for SashStandardView);
          return sub_337C8();
        }
      }
      else
      {
        BOOL v137 = v69 == 0x766E6F6369707061 && v67 == 0xEB00000000776569;
        if (v137 || (sub_10F90() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          sub_10FAC();
          uint64_t v138 = sub_10FC8();
          uint64_t result = AppIconView.init(modelData:)(v138, v139, v140);
          if (!v4)
          {
            sub_10634(&qword_417F0, (void (*)(uint64_t))type metadata accessor for AppIconView);
            return sub_337C8();
          }
        }
        else
        {
          if ((v69 != 0xD000000000000016 || v67 != 0x8000000000037770) && (sub_10F90() & 1) == 0)
          {
            if (v69 == 0x6C6F686563616C70 && v67 == 0xEB00000000726564)
            {
              swift_bridgeObjectRelease();
            }
            else
            {
              char v145 = sub_10F90();
              swift_bridgeObjectRelease();
              if ((v145 & 1) == 0)
              {
                if (qword_411C0 != -1) {
                  swift_once();
                }
                uint64_t v146 = sub_331C8();
                sub_7150(v146, (uint64_t)qword_44260);
                swift_bridgeObjectRetain_n();
                v147 = sub_331B8();
                os_log_type_t v148 = sub_33C98();
                if (os_log_type_enabled(v147, v148))
                {
                  v149 = (uint8_t *)swift_slowAlloc();
                  *(void *)&long long v187 = swift_slowAlloc();
                  *(_DWORD *)v149 = 136446210;
                  unint64_t v150 = v156;
                  swift_bridgeObjectRetain();
                  uint64_t v190 = sub_10310(v155, v150, (uint64_t *)&v187);
                  sub_33D48();
                  swift_bridgeObjectRelease_n();
                  _os_log_impl(&dword_0, v147, v148, "Unhandled view ID: %{public}s", v149, 0xCu);
                  swift_arrayDestroy();
                  swift_slowDealloc();
                  swift_slowDealloc();
                }
                else
                {

                  swift_bridgeObjectRelease_n();
                }
                sub_102C4();
                swift_allocError();
                return swift_willThrow();
              }
            }
            sub_10FAC();
            sub_33A58();
            sub_10FD8();
            uint64_t v151 = sub_33A48();
            if (v152)
            {
              uint64_t v153 = v151;
              unint64_t v154 = v152;
              sub_1043C(v185, v186);
            }
            else
            {
              sub_1043C(v185, v186);
              uint64_t v153 = 0;
              unint64_t v154 = 0xE000000000000000;
            }
            *(void *)&long long v187 = v153;
            *((void *)&v187 + 1) = v154;
            sub_10494();
            return sub_337C8();
          }
          swift_bridgeObjectRelease();
          uint64_t v189 = 0;
          long long v187 = 0u;
          long long v188 = 0u;
          sub_10FAC();
          sub_33178();
          sub_10634(&qword_418A0, (void (*)(uint64_t))&type metadata accessor for _ProtoImageElement.Contact);
          sub_10FD8();
          uint64_t v141 = v184;
          uint64_t result = sub_33198();
          if (!v141)
          {
            sub_32D18();
            uint64_t v142 = sub_10FD8();
            v143(v142);
            sub_10634(&qword_418A8, (void (*)(uint64_t))type metadata accessor for ContactImageSourceView);
            return sub_337C8();
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_10240()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for SystemPlugin()
{
  return self;
}

uint64_t sub_10274()
{
  return swift_allocObject();
}

uint64_t sub_10284@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10274();
  *a1 = result;
  return result;
}

uint64_t sub_102AC(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  return sub_ED4C(a1, a2, a3, a4);
}

unint64_t sub_102C4()
{
  unint64_t result = qword_41890;
  if (!qword_41890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_41890);
  }
  return result;
}

uint64_t sub_10310(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_106C8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10820((uint64_t)v12, *a3);
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
      sub_10820((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_6804((uint64_t)v12);
  return v7;
}

uint64_t sub_103E4(uint64_t a1, unint64_t a2)
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

uint64_t sub_1043C(uint64_t a1, unint64_t a2)
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

unint64_t sub_10494()
{
  unint64_t result = qword_41898;
  if (!qword_41898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_41898);
  }
  return result;
}

uint64_t sub_104E8(uint64_t a1)
{
  uint64_t v2 = sub_63C4(&qword_418C8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10550()
{
  sub_32C38();
  sub_EC24();
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + ((v2 + 16) & ~v2));
  uint64_t v4 = sub_10FD8();

  return _swift_deallocObject(v4, v5, v3);
}

uint64_t sub_105D4()
{
  uint64_t v1 = *(void *)(sub_32C38() - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  return sub_1C3F8(v2);
}

uint64_t sub_10634(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1067C()
{
  unint64_t result = qword_41900;
  if (!qword_41900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_41900);
  }
  return result;
}

uint64_t sub_106C8(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_1087C((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_33D58();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = (uint64_t)sub_10954(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_33E78();
    if (!v8)
    {
      uint64_t result = sub_33EF8();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_10820(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_1087C(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_33F38();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

void *sub_10954(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_109EC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10BC8(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10BC8((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_109EC(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = sub_33AE8();
    if (v2) {
      goto LABEL_6;
    }
    return &_swiftEmptyArrayStorage;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    Swift::Int v2 = HIBYTE(a2) & 0xF;
  }
  else {
    Swift::Int v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
LABEL_6:
  unint64_t v3 = sub_10B60(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_33E48();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return v4;
  }
  sub_33F38();
  __break(1u);
LABEL_14:
  uint64_t result = (void *)sub_33EF8();
  __break(1u);
  return result;
}

void *sub_10B60(uint64_t a1, uint64_t a2)
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
  sub_63C4(&qword_41908);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_10BC8(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
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
  int64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    int64_t v9 = *(void *)(a4 + 16);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_63C4(&qword_41908);
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
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_10D78(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_10CA0(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_10CA0(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_33F38();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_10D78(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_33F38();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t getEnumTagSinglePayload for SystemPlugin.Error(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for SystemPlugin.Error(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x10EF8);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for SystemPlugin.Error()
{
  return &type metadata for SystemPlugin.Error;
}

unint64_t sub_10F34()
{
  unint64_t result = qword_41910;
  if (!qword_41910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_41910);
  }
  return result;
}

uint64_t sub_10F80@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  return 0;
}

uint64_t sub_10F90()
{
  return sub_33F78();
}

uint64_t sub_10FAC()
{
  uint64_t v2 = *(void *)(v0 - 176);
  unint64_t v3 = *(void *)(v0 - 168);
  return sub_103E4(v2, v3);
}

uint64_t sub_10FC8()
{
  return v0;
}

uint64_t sub_10FD8()
{
  return v0;
}

uint64_t sub_10FE4()
{
  return sub_103E4(v1, v0);
}

uint64_t sub_11010()
{
  type metadata accessor for ContactAvatarView.AvatarLoader(0);
  uint64_t v0 = swift_allocObject();
  sub_12E68();
  return v0;
}

uint64_t sub_1104C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v55 = a1;
  uint64_t v54 = sub_33308() - 8;
  __chkstk_darwin(v54);
  sub_EC48();
  uint64_t v53 = v3;
  uint64_t v4 = sub_332C8();
  uint64_t v5 = v4 - 8;
  __chkstk_darwin(v4);
  sub_15C10();
  int64_t v8 = (char *)(v7 - v6);
  sub_33C28();
  sub_9370();
  uint64_t v49 = v10;
  uint64_t v50 = v9;
  __chkstk_darwin(v9);
  sub_EC48();
  uint64_t v48 = v11;
  uint64_t v12 = type metadata accessor for ContactAvatarView(0);
  uint64_t v13 = v12 - 8;
  uint64_t v47 = *(void *)(v12 - 8);
  uint64_t v14 = *(void *)(v47 + 64);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_63C4(&qword_41BE8);
  uint64_t v17 = v16 - 8;
  __chkstk_darwin(v16);
  sub_15C10();
  uint64_t v20 = v19 - v18;
  uint64_t v52 = sub_63C4(&qword_41BF0) - 8;
  __chkstk_darwin(v52);
  sub_EC48();
  uint64_t v51 = v21;
  uint64_t v22 = sub_13014(*(void *)(v1 + *(int *)(v13 + 36)));
  uint64_t v46 = sub_334C8();
  sub_11584(v22, v1, (uint64_t)v56);
  uint64_t v23 = *(void *)v56;
  long long v45 = *(_OWORD *)&v56[8];
  long long v44 = *(_OWORD *)&v56[24];
  uint64_t v43 = *(void *)&v56[40];
  uint64_t v42 = v57;
  sub_15840(v2, (uint64_t)v15, (void (*)(void))type metadata accessor for ContactAvatarView);
  unint64_t v24 = (*(unsigned __int8 *)(v47 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v47 + 80);
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = v22;
  sub_15620((uint64_t)v15, v25 + v24);
  swift_retain();
  uint64_t v26 = v48;
  sub_33C18();
  (*(void (**)(char *, uint64_t, uint64_t))(v49 + 16))(&v8[*(int *)(v5 + 28)], v26, v50);
  *(void *)int64_t v8 = &unk_41C00;
  *((void *)v8 + 1) = v25;
  sub_15840((uint64_t)v8, v20 + *(int *)(v17 + 44), (void (*)(void))&type metadata accessor for _TaskModifier);
  *(void *)uint64_t v20 = v46;
  *(void *)(v20 + 8) = 0;
  *(unsigned char *)(v20 + 16) = 1;
  *(void *)(v20 + 24) = v23;
  long long v27 = v44;
  *(_OWORD *)(v20 + 32) = v45;
  *(_OWORD *)(v20 + 48) = v27;
  uint64_t v28 = v42;
  *(void *)(v20 + 64) = v43;
  *(void *)(v20 + 72) = v28;
  swift_retain();
  sub_15894((uint64_t)v8, (void (*)(void))&type metadata accessor for _TaskModifier);
  sub_15C04();
  v29();
  swift_release();
  double v30 = sub_128D4();
  uint64_t v31 = v53;
  uint64_t v32 = (char *)v53 + *(int *)(v54 + 28);
  uint64_t v33 = enum case for RoundedCornerStyle.continuous(_:);
  sub_334B8();
  sub_EC24();
  (*(void (**)(char *, uint64_t))(v34 + 104))(v32, v33);
  uint64_t v35 = (uint64_t)v31;
  double *v31 = v30;
  v31[1] = v30;
  uint64_t v36 = v51;
  uint64_t v37 = v51 + *(int *)(v52 + 44);
  sub_15840(v35, v37, (void (*)(void))&type metadata accessor for RoundedRectangle);
  *(_WORD *)(v37 + *(int *)(sub_63C4(&qword_41E70) + 36)) = 256;
  sub_E92C(v20, v36, &qword_41BE8);
  sub_15894(v35, (void (*)(void))&type metadata accessor for RoundedRectangle);
  sub_158E8(v20, &qword_41BE8);
  sub_118D8();
  sub_118D8();
  sub_33808();
  sub_332A8();
  uint64_t v38 = v55;
  sub_E92C(v36, v55, &qword_41BF0);
  swift_release();
  uint64_t v39 = (_OWORD *)(v38 + *(int *)(sub_63C4(&qword_41C10) + 36));
  long long v40 = *(_OWORD *)&v56[16];
  *uint64_t v39 = *(_OWORD *)v56;
  v39[1] = v40;
  v39[2] = *(_OWORD *)&v56[32];
  return sub_158E8(v36, &qword_41BF0);
}

uint64_t sub_11584@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_33748();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for ContactAvatarView(0);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_15840(a2, (uint64_t)v12, (void (*)(void))type metadata accessor for ContactAvatarView);
  if (a1)
  {
    swift_retain();
    sub_15894((uint64_t)v12, (void (*)(void))type metadata accessor for ContactAvatarView);
  }
  else
  {
    type metadata accessor for ContactAvatarView.AvatarLoader(0);
    sub_15938(&qword_41C18, (void (*)(uint64_t))type metadata accessor for ContactAvatarView.AvatarLoader);
    sub_33298();
    uint64_t v13 = sub_11864();
    swift_release();
    uint64_t result = sub_15894((uint64_t)v12, (void (*)(void))type metadata accessor for ContactAvatarView);
    if (!v13)
    {
      uint64_t v15 = 0;
      uint64_t v16 = 0;
      uint64_t v17 = 0;
      uint64_t v18 = 0;
      uint64_t v19 = 0;
      long long v20 = 0uLL;
      goto LABEL_5;
    }
  }
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for Image.ResizingMode.stretch(_:), v6);
  uint64_t v15 = sub_33768();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_118D8();
  sub_118D8();
  sub_33808();
  uint64_t result = sub_332A8();
  uint64_t v16 = v21;
  uint64_t v17 = v22;
  uint64_t v18 = v23;
  uint64_t v19 = v24;
  long long v20 = v25;
LABEL_5:
  *(void *)a3 = v15;
  *(void *)(a3 + 8) = v16;
  *(void *)(a3 + 16) = v17;
  *(void *)(a3 + 24) = v18;
  *(void *)(a3 + 32) = v19;
  *(_OWORD *)(a3 + 40) = v20;
  return result;
}

uint64_t sub_11864()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_33238();
  swift_release();
  swift_release();
  return v1;
}

double sub_118D8()
{
  uint64_t v1 = type metadata accessor for ContactImageSizeResolver(0);
  uint64_t v2 = (int *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = (int *)type metadata accessor for ContactAvatarView(0);
  uint64_t v30 = v0 + v5[5];
  uint64_t v6 = v0 + v5[11];
  uint64_t v7 = *(void *)v6;
  char v8 = *(unsigned char *)(v6 + 8);
  sub_137D0(*(void *)v6, v8);
  sub_2BB38();
  uint64_t v29 = v9;
  sub_139F8(v7, v8);
  uint64_t v10 = v0 + v5[12];
  uint64_t v11 = *(void *)v10;
  uint64_t v12 = *(unsigned __int8 *)(v10 + 8);
  char v13 = *(unsigned char *)(v10 + 9);
  sub_137DC(*(void *)v10, v12, v13);
  sub_2BCA0();
  uint64_t v28 = v14;
  char v16 = v15;
  sub_13A04(v11, v12, v13);
  uint64_t v17 = v0 + v5[13];
  uint64_t v18 = *(void *)v17;
  uint64_t v19 = *(unsigned __int8 *)(v17 + 8);
  LOBYTE(v12) = *(unsigned char *)(v17 + 9);
  sub_137DC(*(void *)v17, v19, v12);
  sub_2BCA0();
  uint64_t v21 = v20;
  LOBYTE(v7) = v22;
  sub_13A04(v18, v19, v12);
  sub_2BE50();
  uint64_t v23 = sub_32CA8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v23 - 8) + 16))(v4, v30, v23);
  *(void *)&v4[v2[7]] = v29;
  unsigned __int8 v24 = &v4[v2[8]];
  *(void *)unsigned __int8 v24 = v28;
  v24[8] = v16 & 1;
  long long v25 = &v4[v2[9]];
  *(void *)long long v25 = v21;
  v25[8] = v7 & 1;
  double v26 = ContactImageSizeResolver.imageSize.getter();
  sub_15894((uint64_t)v4, (void (*)(void))type metadata accessor for ContactImageSizeResolver);
  return v26;
}

uint64_t sub_11B08(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  uint64_t v3 = sub_332F8();
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  v2[7] = swift_task_alloc();
  uint64_t v4 = sub_32D38();
  v2[8] = v4;
  v2[9] = *(void *)(v4 - 8);
  v2[10] = swift_task_alloc();
  sub_33C08();
  v2[11] = sub_33BF8();
  uint64_t v6 = sub_33BE8();
  v2[12] = v6;
  v2[13] = v5;
  return _swift_task_switch(sub_11C68, v6, v5);
}

uint64_t sub_11C68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  sub_15C2C();
  if (v18[2])
  {
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_15C20();
    sub_15BE0();
    return v20(v19, v20, v21, v22, v23, v24, v25, v26, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18);
  }
  else
  {
    uint64_t v28 = v18[9];
    uint64_t v39 = v18[8];
    uint64_t v29 = v18[6];
    uint64_t v40 = v18[7];
    uint64_t v41 = v18[10];
    uint64_t v30 = v18[5];
    uint64_t v42 = v18[4];
    uint64_t v31 = v18[3];
    uint64_t v32 = type metadata accessor for ContactAvatarView(0);
    type metadata accessor for ContactAvatarView.AvatarLoader(0);
    sub_15938(&qword_41C18, (void (*)(uint64_t))type metadata accessor for ContactAvatarView.AvatarLoader);
    v18[14] = sub_33298();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 16))(v41, v31, v39);
    sub_118D8();
    uint64_t v33 = v31 + *(int *)(v32 + 40);
    uint64_t v34 = *(void *)v33;
    char v35 = *(unsigned char *)(v33 + 8);
    sub_137D0(*(void *)v33, v35);
    sub_2BE7C();
    sub_139F8(v34, v35);
    sub_2BFE8();
    (*(void (**)(uint64_t, void, uint64_t))(v30 + 104))(v29, enum case for LayoutDirection.rightToLeft(_:), v42);
    sub_332E8();
    uint64_t v36 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
    v36(v29, v42);
    v36(v40, v42);
    uint64_t v37 = (void *)swift_task_alloc();
    v18[15] = v37;
    void *v37 = v18;
    v37[1] = sub_11F0C;
    sub_15BE0();
    return sub_12120();
  }
}

uint64_t sub_11F0C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 80);
  uint64_t v3 = *(void *)(*v0 + 72);
  uint64_t v4 = *(void *)(*v0 + 64);
  swift_task_dealloc();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  uint64_t v5 = *(void *)(v1 + 104);
  uint64_t v6 = *(void *)(v1 + 96);
  return _swift_task_switch(sub_120AC, v6, v5);
}

uint64_t sub_120AC()
{
  sub_15C50();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_15C20();
  return v0();
}

uint64_t sub_12120()
{
  sub_15C50();
  *(void *)(v1 + 72) = v2;
  *(void *)(v1 + 80) = v0;
  *(unsigned char *)(v1 + 128) = v3;
  *(void *)(v1 + 56) = v4;
  *(void *)(v1 + 64) = v5;
  *(void *)(v1 + 48) = v6;
  *(void *)(v1 + 32) = v7;
  *(void *)(v1 + 40) = v8;
  return _swift_task_switch(sub_121BC, 0, 0);
}

uint64_t sub_121BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  sub_15C2C();
  uint64_t v19 = *(void *)(sub_32D28() + 16);
  swift_bridgeObjectRelease();
  if (v19)
  {
    uint64_t v20 = (void **)(v18 + 24);
    id v21 = objc_msgSend(self, "scopeWithPointSize:scale:rightToLeft:style:", *(unsigned __int8 *)(v18 + 128), 0, *(double *)(v18 + 48), *(double *)(v18 + 56), *(double *)(v18 + 64));
    *(void *)(v18 + 88) = v21;
    uint64_t v22 = self;
    sub_32D28();
    Class isa = sub_33B88().super.isa;
    swift_bridgeObjectRelease();
    id v24 = [v22 predicateForContactsWithIdentifiers:isa];
    *(void *)(v18 + 96) = v24;

    sub_63C4((uint64_t *)&unk_423C0);
    uint64_t v25 = swift_allocObject();
    *(_OWORD *)(v25 + 16) = xmmword_34CB0;
    *(void *)(v25 + 32) = [self descriptorForRequiredKeys];
    sub_33BB8();
    if (qword_411A0 != -1) {
      goto LABEL_30;
    }
    while (1)
    {
      uint64_t v26 = (unint64_t *)(v18 + 16);
      id v27 = (id)qword_41920;
      sub_63C4((uint64_t *)&unk_41C90);
      Class v28 = sub_33B88().super.isa;
      swift_bridgeObjectRelease();
      *uint64_t v20 = 0;
      id v29 = [v27 unifiedContactsMatchingPredicate:v24 keysToFetch:v28 error:v20];

      uint64_t v30 = *v20;
      if (v29)
      {
        sub_15980();
        unint64_t v31 = sub_33B98();
        id v32 = v30;
      }
      else
      {
        id v44 = v30;
        sub_32B28();

        swift_willThrow();
        swift_errorRelease();
        unint64_t v31 = (unint64_t)&_swiftEmptyArrayStorage;
      }
      unint64_t *v26 = v31;
      if (v31 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v45 = sub_33F18();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v45 = *(void *)((char *)&dword_10 + (v31 & 0xFFFFFFFFFFFFFF8));
      }
      uint64_t v46 = *(void *)(sub_32D28() + 16);
      swift_bridgeObjectRelease();
      if (v45 >= v46) {
        break;
      }
      uint64_t v47 = *(void *)(sub_32D28() + 16);
      swift_bridgeObjectRelease();
      if (v31 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v48 = sub_33F18();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v48 = *(void *)((char *)&dword_10 + (v31 & 0xFFFFFFFFFFFFFF8));
      }
      uint64_t v49 = v47 - v48;
      if (__OFSUB__(v47, v48))
      {
        __break(1u);
LABEL_34:
        __break(1u);
      }
      if (v49 < 1) {
        goto LABEL_34;
      }
      uint64_t v50 = 1;
      do
      {
        uint64_t v20 = (void **)[objc_allocWithZone((Class)CNContact) init];
        sub_33B78();
        id v24 = *(id *)((char *)&dword_10 + (*v26 & 0xFFFFFFFFFFFFFF8));
        if ((unint64_t)v24 >= *(void *)((char *)&dword_18 + (*v26 & 0xFFFFFFFFFFFFFF8)) >> 1) {
          sub_33BC8();
        }
        sub_33BD8();
        sub_33BB8();
        if (v49 == v50) {
          goto LABEL_25;
        }
      }
      while (!__OFADD__(v50++, 1));
      __break(1u);
LABEL_30:
      swift_once();
    }
LABEL_25:
    if (qword_411A8 != -1) {
      swift_once();
    }
    uint64_t v52 = (void *)qword_41928;
    sub_15980();
    id v53 = v52;
    swift_bridgeObjectRetain();
    Class v54 = sub_33B88().super.isa;
    swift_bridgeObjectRelease();
    id v55 = [v53 avatarImageForContacts:v54 scope:v21];
    *(void *)(v18 + 104) = v55;

    id v56 = v55;
    *(void *)(v18 + 112) = sub_33728();
    sub_33C08();
    *(void *)(v18 + 120) = sub_33BF8();
    sub_33BE8();
    sub_15BE0();
    return _swift_task_switch(v57, v58, v59);
  }
  else
  {
    if (qword_411A8 != -1) {
      swift_once();
    }
    id v33 = objc_msgSend(objc_msgSend((id)qword_41928, "placeholderImageProvider"), "imageForSize:scale:style:", 0, *(double *)(v18 + 48), *(double *)(v18 + 56), *(double *)(v18 + 64));
    swift_unknownObjectRelease();
    id v34 = v33;
    sub_33728();
    sub_12C04();

    sub_15C20();
    sub_15BE0();
    return v36(v35, v36, v37, v38, v39, v40, v41, v42, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18);
  }
}

uint64_t sub_1275C()
{
  uint64_t v1 = *(void *)(v0 + 112);
  uint64_t v2 = *(void *)(v0 + 40);
  swift_release();
  swift_retain();
  sub_12C04();
  sub_1315C(v1, v2);
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_1282C, 0, 0);
}

uint64_t sub_1282C()
{
  uint64_t v1 = *(void **)(v0 + 96);

  swift_release();
  swift_unknownObjectRelease();
  sub_15C20();
  return v2();
}

double sub_128D4()
{
  uint64_t v1 = sub_32CA8();
  uint64_t v46 = *(void *)(v1 - 8);
  uint64_t v47 = v1;
  __chkstk_darwin(v1);
  uint64_t v41 = (uint64_t)&v41 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for ContactImageSizeResolver(0);
  uint64_t v4 = (int *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (int *)type metadata accessor for ContactAvatarView(0);
  uint64_t v45 = v0 + v7[5];
  uint64_t v8 = v0 + v7[11];
  uint64_t v9 = *(void *)v8;
  char v10 = *(unsigned char *)(v8 + 8);
  sub_137D0(*(void *)v8, v10);
  sub_2BB38();
  uint64_t v44 = v11;
  sub_139F8(v9, v10);
  uint64_t v12 = v0 + v7[12];
  uint64_t v13 = *(void *)v12;
  uint64_t v14 = *(unsigned __int8 *)(v12 + 8);
  char v15 = *(unsigned char *)(v12 + 9);
  sub_137DC(*(void *)v12, v14, v15);
  sub_2BCA0();
  double v42 = v16;
  char v18 = v17;
  int v43 = v17 & 1;
  sub_13A04(v13, v14, v15);
  uint64_t v19 = v0 + v7[13];
  uint64_t v20 = *(void *)v19;
  uint64_t v21 = *(unsigned __int8 *)(v19 + 8);
  char v22 = *(unsigned char *)(v19 + 9);
  sub_137DC(*(void *)v19, v21, v22);
  sub_2BCA0();
  double v24 = v23;
  char v26 = v25;
  uint64_t v27 = v20;
  uint64_t v28 = v21;
  uint64_t v30 = v46;
  uint64_t v29 = v47;
  sub_13A04(v27, v28, v22);
  uint64_t v31 = v44;
  sub_2BE50();
  (*(void (**)(char *, uint64_t, uint64_t))(v30 + 16))(v6, v45, v29);
  double v32 = v42;
  *(void *)&v6[v4[7]] = v31;
  id v33 = &v6[v4[8]];
  *(double *)id v33 = v32;
  v33[8] = v43;
  id v34 = &v6[v4[9]];
  *(double *)id v34 = v24;
  v34[8] = v26 & 1;
  if (v18 & 1) != 0 || (v26)
  {
    uint64_t v35 = v41;
    sub_19B80(v41);
    id v36 = objc_allocWithZone((Class)sub_339B8());
    uint64_t v37 = (void *)sub_33998();
    sub_32C78();
    double v39 = v38;

    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v35, v29);
  }
  else
  {
    double v39 = v24;
    if (v32 > v24) {
      double v39 = v32;
    }
  }
  sub_15894((uint64_t)v6, (void (*)(void))type metadata accessor for ContactImageSizeResolver);
  return v39;
}

uint64_t sub_12BD8()
{
  return sub_12C04();
}

uint64_t sub_12C04()
{
  return sub_33248();
}

id sub_12C74()
{
  id result = [objc_allocWithZone((Class)CNContactStore) init];
  qword_41920 = (uint64_t)result;
  return result;
}

id sub_12CA8()
{
  id result = [objc_allocWithZone((Class)CNAvatarImageRenderer) init];
  qword_41928 = (uint64_t)result;
  return result;
}

uint64_t sub_12CDC()
{
  sub_63C4((uint64_t *)&unk_41AC0);
  sub_EC24();
  sub_15C04();
  v1();
  swift_unknownObjectRelease();
  uint64_t v2 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v3 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v2, v3);
}

uint64_t sub_12D84()
{
  return type metadata accessor for ContactAvatarView.AvatarLoader(0);
}

uint64_t type metadata accessor for ContactAvatarView.AvatarLoader(uint64_t a1)
{
  return sub_983C(a1, qword_41968);
}

void sub_12DAC()
{
  sub_14B74(319, qword_41D30, (uint64_t *)&unk_41980, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Published);
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t sub_12E68()
{
  uint64_t v1 = sub_63C4((uint64_t *)&unk_41AC0);
  sub_9370();
  uint64_t v3 = v2;
  __chkstk_darwin(v4);
  sub_15C10();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = v0 + OBJC_IVAR____TtCV12SystemPlugin17ContactAvatarView12AvatarLoader__image;
  sub_63C4((uint64_t *)&unk_41980);
  sub_33218();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v8, v7, v1);
  *(void *)(v0 + OBJC_IVAR____TtCV12SystemPlugin17ContactAvatarView12AvatarLoader_cnCancellable) = 0;
  return v0;
}

uint64_t sub_12F40@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_33208();
  *a1 = result;
  return result;
}

uint64_t sub_12F90()
{
  type metadata accessor for ContactImageCache();
  uint64_t v0 = swift_allocObject();
  sub_63C4(&qword_41BB8);
  swift_allocObject();
  uint64_t result = sub_14CC0(6, 0, (uint64_t)sub_1B528, 0, 300.0);
  *(void *)(v0 + 16) = result;
  qword_44258 = v0;
  return result;
}

uint64_t sub_13014(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_32B78();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1505C(a1);
  if (!v8) {
    return 0;
  }
  uint64_t v9 = v8;
  (*(void (**)(void))(v2 + 24))();
  char v10 = sub_32B58();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if ((v10 & 1) == 0)
  {
    swift_release();
    return 0;
  }
  sub_15234(v9);
  uint64_t v11 = *(void *)(v9 + 24);
  swift_retain();
  swift_release();
  return v11;
}

uint64_t sub_1315C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_32B78();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v19 - v10;
  sub_1505C(a2);
  uint64_t v12 = swift_release();
  (*(void (**)(uint64_t))(v2 + 24))(v12);
  sub_32B48();
  uint64_t v13 = *(void (**)(char *, uint64_t))(v6 + 8);
  v13(v9, v5);
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v11, v5);
  sub_63C4(&qword_428D0);
  swift_allocObject();
  uint64_t v14 = sub_15324(a2, a1, (uint64_t)v9);
  uint64_t v15 = *(void *)(v2 + 64);
  if (v15 && (uint64_t v16 = sub_14C48(), (*(unsigned char *)(v2 + 80) & 1) == 0) && v16 == *(void *)(v2 + 72))
  {
    uint64_t v17 = *(void *)(v15 + 16);
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    sub_1505C(v17);
    swift_release();
    swift_release();
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_retain();
  }
  sub_15234((uint64_t)v14);
  swift_release();
  return ((uint64_t (*)(char *, uint64_t))v13)(v11, v5);
}

uint64_t sub_13370()
{
  swift_beginAccess();
  sub_63C4(&qword_41BE0);
  sub_339F8(0);
  swift_endAccess();
  *(void *)(v0 + 56) = 0;
  swift_release();
  *(void *)(v0 + 64) = 0;
  return swift_release();
}

uint64_t sub_133E8()
{
  swift_release();

  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for ContactImageCache()
{
  return self;
}

uint64_t *sub_13444(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v23 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v23 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_32D38();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_32CA8();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    v12(v9, v10, v11);
    uint64_t v13 = a3[6];
    uint64_t v14 = (char *)a1 + v13;
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = *(void *)v15;
    uint64_t v17 = *((void *)v15 + 1);
    char v18 = v15[16];
    sub_137C8();
    *(void *)uint64_t v14 = v16;
    *((void *)v14 + 1) = v17;
    v14[16] = v18;
    uint64_t v19 = a3[8];
    *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    uint64_t v20 = (uint64_t *)((char *)a1 + v19);
    uint64_t v21 = (uint64_t *)((char *)a2 + v19);
    swift_bridgeObjectRetain();
    sub_63C4(&qword_411F0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v21, 1, v11))
      {
        uint64_t v22 = sub_63C4(&qword_41AD0);
        memcpy(v20, v21, *(void *)(*(void *)(v22 - 8) + 64));
      }
      else
      {
        v12((char *)v20, (char *)v21, v11);
        _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v20, 0, 1, v11);
      }
    }
    else
    {
      *uint64_t v20 = *v21;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v24 = a3[9];
    char v25 = (uint64_t *)((char *)a1 + v24);
    char v26 = (uint64_t *)((char *)a2 + v24);
    sub_63C4(&qword_41AD8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v27 = sub_332F8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v27 - 8) + 16))(v25, v26, v27);
    }
    else
    {
      *char v25 = *v26;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v28 = a3[10];
    uint64_t v29 = (char *)a1 + v28;
    uint64_t v30 = (char *)a2 + v28;
    uint64_t v31 = *(void *)v30;
    char v32 = v30[8];
    sub_137D0(*(void *)v30, v32);
    *(void *)uint64_t v29 = v31;
    v29[8] = v32;
    uint64_t v33 = a3[11];
    id v34 = (char *)a1 + v33;
    uint64_t v35 = (char *)a2 + v33;
    uint64_t v36 = *(void *)v35;
    char v37 = v35[8];
    sub_137D0(*(void *)v35, v37);
    *(void *)id v34 = v36;
    v34[8] = v37;
    uint64_t v38 = a3[12];
    double v39 = (char *)a1 + v38;
    uint64_t v40 = (char *)a2 + v38;
    uint64_t v41 = *(void *)v40;
    char v42 = v40[9];
    LOBYTE(v34) = v40[8];
    sub_137DC(*(void *)v40, v34, v42);
    *(void *)double v39 = v41;
    v39[8] = (char)v34;
    v39[9] = v42;
    uint64_t v43 = a3[13];
    uint64_t v44 = (char *)a1 + v43;
    uint64_t v45 = (char *)a2 + v43;
    uint64_t v46 = *(void *)v45;
    char v47 = v45[9];
    LOBYTE(v34) = v45[8];
    sub_137DC(*(void *)v45, v34, v47);
    *(void *)uint64_t v44 = v46;
    v44[8] = (char)v34;
    v44[9] = v47;
    *(uint64_t *)((char *)a1 + a3[14]) = *(uint64_t *)((char *)a2 + a3[14]);
  }
  swift_retain();
  return a1;
}

uint64_t sub_137C8()
{
  return swift_retain();
}

uint64_t sub_137D0(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_137DC(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_137E8(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_32D38();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + a2[5];
  uint64_t v6 = sub_32CA8();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
  sub_139F0();
  swift_bridgeObjectRelease();
  uint64_t v8 = a1 + a2[8];
  sub_63C4(&qword_411F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    if (!_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0(v8, 1, v6)) {
      v7(v8, v6);
    }
  }
  else
  {
    swift_release();
  }
  uint64_t v9 = a1 + a2[9];
  sub_63C4(&qword_41AD8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_332F8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  }
  else
  {
    swift_release();
  }
  sub_139F8(*(void *)(a1 + a2[10]), *(unsigned char *)(a1 + a2[10] + 8));
  sub_139F8(*(void *)(a1 + a2[11]), *(unsigned char *)(a1 + a2[11] + 8));
  sub_13A04(*(void *)(a1 + a2[12]), *(unsigned __int8 *)(a1 + a2[12] + 8), *(unsigned char *)(a1 + a2[12] + 9));
  sub_13A04(*(void *)(a1 + a2[13]), *(unsigned __int8 *)(a1 + a2[13] + 8), *(unsigned char *)(a1 + a2[13] + 9));

  return swift_release();
}

uint64_t sub_139F0()
{
  return swift_release();
}

uint64_t sub_139F8(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_release();
  }
  return result;
}

uint64_t sub_13A04(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0) {
    return swift_release();
  }
  return result;
}

uint64_t sub_13A10(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_32D38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = sub_32CA8();
  uint64_t v11 = *(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16);
  v11(v8, v9, v10);
  uint64_t v12 = a3[6];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = (uint64_t *)(a2 + v12);
  uint64_t v15 = *v14;
  uint64_t v16 = v14[1];
  char v17 = *((unsigned char *)v14 + 16);
  sub_137C8();
  *(void *)uint64_t v13 = v15;
  *(void *)(v13 + 8) = v16;
  *(unsigned char *)(v13 + 16) = v17;
  uint64_t v18 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (void *)(a2 + v18);
  swift_bridgeObjectRetain();
  sub_63C4(&qword_411F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v20, 1, v10))
    {
      uint64_t v21 = sub_63C4(&qword_41AD0);
      memcpy(v19, v20, *(void *)(*(void *)(v21 - 8) + 64));
    }
    else
    {
      v11(v19, v20, v10);
      _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v19, 0, 1, v10);
    }
  }
  else
  {
    *uint64_t v19 = *v20;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v22 = a3[9];
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = (void *)(a2 + v22);
  sub_63C4(&qword_41AD8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v25 = sub_332F8();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v25 - 8) + 16))(v23, v24, v25);
  }
  else
  {
    void *v23 = *v24;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v26 = a3[10];
  uint64_t v27 = a1 + v26;
  uint64_t v28 = a2 + v26;
  uint64_t v29 = *(void *)v28;
  char v30 = *(unsigned char *)(v28 + 8);
  sub_137D0(*(void *)v28, v30);
  *(void *)uint64_t v27 = v29;
  *(unsigned char *)(v27 + 8) = v30;
  uint64_t v31 = a3[11];
  uint64_t v32 = a1 + v31;
  uint64_t v33 = a2 + v31;
  uint64_t v34 = *(void *)v33;
  char v35 = *(unsigned char *)(v33 + 8);
  sub_137D0(*(void *)v33, v35);
  *(void *)uint64_t v32 = v34;
  *(unsigned char *)(v32 + 8) = v35;
  uint64_t v36 = a3[12];
  uint64_t v37 = a1 + v36;
  uint64_t v38 = a2 + v36;
  uint64_t v39 = *(void *)v38;
  char v40 = *(unsigned char *)(v38 + 9);
  LOBYTE(v32) = *(unsigned char *)(v38 + 8);
  sub_137DC(*(void *)v38, v32, v40);
  *(void *)uint64_t v37 = v39;
  *(unsigned char *)(v37 + 8) = v32;
  *(unsigned char *)(v37 + 9) = v40;
  uint64_t v41 = a3[13];
  uint64_t v42 = a1 + v41;
  uint64_t v43 = a2 + v41;
  uint64_t v44 = *(void *)v43;
  char v45 = *(unsigned char *)(v43 + 9);
  LOBYTE(v32) = *(unsigned char *)(v43 + 8);
  sub_137DC(*(void *)v43, v32, v45);
  *(void *)uint64_t v42 = v44;
  *(unsigned char *)(v42 + 8) = v32;
  *(unsigned char *)(v42 + 9) = v45;
  *(void *)(a1 + a3[14]) = *(void *)(a2 + a3[14]);
  swift_retain();
  return a1;
}

uint64_t sub_13D48(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_32D38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_32CA8();
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 24))(v8, v9, v10);
  uint64_t v12 = a3[6];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = (uint64_t *)(a2 + v12);
  uint64_t v15 = *v14;
  uint64_t v16 = v14[1];
  char v17 = *((unsigned char *)v14 + 16);
  sub_137C8();
  *(void *)uint64_t v13 = v15;
  *(void *)(v13 + 8) = v16;
  *(unsigned char *)(v13 + 16) = v17;
  sub_139F0();
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    uint64_t v18 = a3[8];
    uint64_t v19 = (void *)(a1 + v18);
    uint64_t v20 = (void *)(a2 + v18);
    sub_158E8(a1 + v18, &qword_411F0);
    sub_63C4(&qword_411F0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v20, 1, v10))
      {
        uint64_t v21 = sub_63C4(&qword_41AD0);
        memcpy(v19, v20, *(void *)(*(void *)(v21 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v19, v20, v10);
        _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v19, 0, 1, v10);
      }
    }
    else
    {
      *uint64_t v19 = *v20;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v22 = a3[9];
    uint64_t v23 = (void *)(a1 + v22);
    uint64_t v24 = (void *)(a2 + v22);
    sub_158E8(a1 + v22, &qword_41AD8);
    sub_63C4(&qword_41AD8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v25 = sub_332F8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v25 - 8) + 16))(v23, v24, v25);
    }
    else
    {
      void *v23 = *v24;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v26 = a3[10];
  uint64_t v27 = a1 + v26;
  uint64_t v28 = a2 + v26;
  uint64_t v29 = *(void *)v28;
  char v30 = *(unsigned char *)(v28 + 8);
  sub_137D0(*(void *)v28, v30);
  uint64_t v31 = *(void *)v27;
  char v32 = *(unsigned char *)(v27 + 8);
  *(void *)uint64_t v27 = v29;
  *(unsigned char *)(v27 + 8) = v30;
  sub_139F8(v31, v32);
  uint64_t v33 = a3[11];
  uint64_t v34 = a1 + v33;
  uint64_t v35 = a2 + v33;
  uint64_t v36 = *(void *)v35;
  char v37 = *(unsigned char *)(v35 + 8);
  sub_137D0(*(void *)v35, v37);
  uint64_t v38 = *(void *)v34;
  char v39 = *(unsigned char *)(v34 + 8);
  *(void *)uint64_t v34 = v36;
  *(unsigned char *)(v34 + 8) = v37;
  sub_139F8(v38, v39);
  uint64_t v40 = a3[12];
  uint64_t v41 = a1 + v40;
  uint64_t v42 = a2 + v40;
  uint64_t v43 = *(void *)v42;
  char v44 = *(unsigned char *)(v42 + 9);
  LOBYTE(v34) = *(unsigned char *)(v42 + 8);
  sub_137DC(*(void *)v42, v34, v44);
  uint64_t v45 = *(void *)v41;
  char v46 = *(unsigned char *)(v41 + 9);
  *(void *)uint64_t v41 = v43;
  uint64_t v47 = *(unsigned __int8 *)(v41 + 8);
  *(unsigned char *)(v41 + 8) = v34;
  *(unsigned char *)(v41 + 9) = v44;
  sub_13A04(v45, v47, v46);
  uint64_t v48 = a3[13];
  uint64_t v49 = a1 + v48;
  uint64_t v50 = a2 + v48;
  uint64_t v51 = *(void *)v50;
  char v52 = *(unsigned char *)(v50 + 9);
  LOBYTE(v34) = *(unsigned char *)(v50 + 8);
  sub_137DC(*(void *)v50, v34, v52);
  uint64_t v53 = *(void *)v49;
  char v54 = *(unsigned char *)(v49 + 9);
  *(void *)uint64_t v49 = v51;
  uint64_t v55 = *(unsigned __int8 *)(v49 + 8);
  *(unsigned char *)(v49 + 8) = v34;
  *(unsigned char *)(v49 + 9) = v52;
  sub_13A04(v53, v55, v54);
  *(void *)(a1 + a3[14]) = *(void *)(a2 + a3[14]);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_14124(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_32D38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_32CA8();
  uint64_t v11 = *(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32);
  v11(v8, v9, v10);
  uint64_t v12 = a3[6];
  uint64_t v13 = a3[7];
  uint64_t v14 = a1 + v12;
  uint64_t v15 = a2 + v12;
  *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
  uint64_t v16 = *(void *)(a2 + v13);
  *(unsigned char *)(v14 + 16) = *(unsigned char *)(v15 + 16);
  *(void *)(a1 + v13) = v16;
  uint64_t v17 = a3[8];
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (const void *)(a2 + v17);
  uint64_t v20 = sub_63C4(&qword_411F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v19, 1, v10))
    {
      uint64_t v21 = sub_63C4(&qword_41AD0);
      memcpy(v18, v19, *(void *)(*(void *)(v21 - 8) + 64));
    }
    else
    {
      v11(v18, v19, v10);
      _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v18, 0, 1, v10);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v18, v19, *(void *)(*(void *)(v20 - 8) + 64));
  }
  uint64_t v22 = a3[9];
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = (const void *)(a2 + v22);
  uint64_t v25 = sub_63C4(&qword_41AD8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v26 = sub_332F8();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v26 - 8) + 32))(v23, v24, v26);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v23, v24, *(void *)(*(void *)(v25 - 8) + 64));
  }
  uint64_t v27 = a3[10];
  uint64_t v28 = a3[11];
  uint64_t v29 = a1 + v27;
  uint64_t v30 = a2 + v27;
  *(void *)uint64_t v29 = *(void *)v30;
  *(unsigned char *)(v29 + 8) = *(unsigned char *)(v30 + 8);
  uint64_t v31 = a1 + v28;
  uint64_t v32 = a2 + v28;
  *(void *)uint64_t v31 = *(void *)v32;
  *(unsigned char *)(v31 + 8) = *(unsigned char *)(v32 + 8);
  uint64_t v33 = a3[12];
  uint64_t v34 = a3[13];
  uint64_t v35 = a1 + v33;
  uint64_t v36 = a2 + v33;
  *(void *)uint64_t v35 = *(void *)v36;
  *(_WORD *)(v35 + 8) = *(_WORD *)(v36 + 8);
  uint64_t v37 = a1 + v34;
  uint64_t v38 = a2 + v34;
  *(void *)uint64_t v37 = *(void *)v38;
  *(_WORD *)(v37 + 8) = *(_WORD *)(v38 + 8);
  *(void *)(a1 + a3[14]) = *(void *)(a2 + a3[14]);
  return a1;
}

uint64_t sub_14404(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_32D38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_32CA8();
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 40))(v8, v9, v10);
  uint64_t v12 = a3[6];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  char v15 = *(unsigned char *)(v14 + 16);
  *(_OWORD *)uint64_t v13 = *(_OWORD *)v14;
  *(unsigned char *)(v13 + 16) = v15;
  sub_139F0();
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    uint64_t v16 = a3[8];
    uint64_t v17 = (void *)(a1 + v16);
    uint64_t v18 = (const void *)(a2 + v16);
    sub_158E8(a1 + v16, &qword_411F0);
    uint64_t v19 = sub_63C4(&qword_411F0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v18, 1, v10))
      {
        uint64_t v20 = sub_63C4(&qword_41AD0);
        memcpy(v17, v18, *(void *)(*(void *)(v20 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v17, v18, v10);
        _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v17, 0, 1, v10);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v17, v18, *(void *)(*(void *)(v19 - 8) + 64));
    }
    uint64_t v21 = a3[9];
    uint64_t v22 = (void *)(a1 + v21);
    uint64_t v23 = (const void *)(a2 + v21);
    sub_158E8(a1 + v21, &qword_41AD8);
    uint64_t v24 = sub_63C4(&qword_41AD8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v25 = sub_332F8();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v25 - 8) + 32))(v22, v23, v25);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v22, v23, *(void *)(*(void *)(v24 - 8) + 64));
    }
  }
  uint64_t v26 = a3[10];
  uint64_t v27 = a1 + v26;
  uint64_t v28 = (uint64_t *)(a2 + v26);
  uint64_t v29 = *v28;
  LOBYTE(v28) = *((unsigned char *)v28 + 8);
  uint64_t v30 = *(void *)v27;
  char v31 = *(unsigned char *)(v27 + 8);
  *(void *)uint64_t v27 = v29;
  *(unsigned char *)(v27 + 8) = (_BYTE)v28;
  sub_139F8(v30, v31);
  uint64_t v32 = a3[11];
  uint64_t v33 = a1 + v32;
  uint64_t v34 = (uint64_t *)(a2 + v32);
  uint64_t v35 = *v34;
  LOBYTE(v34) = *((unsigned char *)v34 + 8);
  uint64_t v36 = *(void *)v33;
  char v37 = *(unsigned char *)(v33 + 8);
  *(void *)uint64_t v33 = v35;
  *(unsigned char *)(v33 + 8) = (_BYTE)v34;
  sub_139F8(v36, v37);
  uint64_t v38 = a3[12];
  uint64_t v39 = a1 + v38;
  uint64_t v40 = (uint64_t *)(a2 + v38);
  uint64_t v41 = *v40;
  char v42 = *((unsigned char *)v40 + 8);
  LOBYTE(v40) = *((unsigned char *)v40 + 9);
  uint64_t v43 = *(void *)v39;
  char v44 = *(unsigned char *)(v39 + 9);
  *(void *)uint64_t v39 = v41;
  uint64_t v45 = *(unsigned __int8 *)(v39 + 8);
  *(unsigned char *)(v39 + 8) = v42;
  *(unsigned char *)(v39 + 9) = (_BYTE)v40;
  sub_13A04(v43, v45, v44);
  uint64_t v46 = a3[13];
  uint64_t v47 = a1 + v46;
  uint64_t v48 = (uint64_t *)(a2 + v46);
  uint64_t v49 = *v48;
  char v50 = *((unsigned char *)v48 + 8);
  LOBYTE(v48) = *((unsigned char *)v48 + 9);
  uint64_t v51 = *(void *)v47;
  char v52 = *(unsigned char *)(v47 + 9);
  *(void *)uint64_t v47 = v49;
  uint64_t v53 = *(unsigned __int8 *)(v47 + 8);
  *(unsigned char *)(v47 + 8) = v50;
  *(unsigned char *)(v47 + 9) = (_BYTE)v48;
  sub_13A04(v51, v53, v52);
  *(void *)(a1 + a3[14]) = *(void *)(a2 + a3[14]);
  swift_release();
  return a1;
}

uint64_t sub_14790(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_147A4);
}

uint64_t sub_147A4(uint64_t a1, uint64_t a2, int *a3)
{
  sub_32D38();
  sub_EC0C();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
LABEL_13:
    return _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0(v9, a2, v8);
  }
  sub_32CA8();
  sub_EC0C();
  if (*(_DWORD *)(v11 + 84) == a2)
  {
    uint64_t v8 = v10;
    uint64_t v12 = a3[5];
LABEL_12:
    uint64_t v9 = a1 + v12;
    goto LABEL_13;
  }
  if (a2 != 0x7FFFFFFF)
  {
    sub_63C4(&qword_41AE0);
    sub_EC0C();
    if (*(_DWORD *)(v16 + 84) == a2)
    {
      uint64_t v8 = v15;
      uint64_t v12 = a3[8];
    }
    else
    {
      uint64_t v8 = sub_63C4(&qword_41AE8);
      uint64_t v12 = a3[9];
    }
    goto LABEL_12;
  }
  unint64_t v13 = *(void *)(a1 + a3[7]);
  if (v13 >= 0xFFFFFFFF) {
    LODWORD(v13) = -1;
  }
  return (v13 + 1);
}

uint64_t sub_148A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_148B8);
}

void sub_148B8(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  sub_32D38();
  sub_EC0C();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    sub_32CA8();
    sub_EC0C();
    if (*(_DWORD *)(v13 + 84) == a3)
    {
      uint64_t v10 = v12;
      uint64_t v14 = a4[5];
    }
    else
    {
      if (a3 == 0x7FFFFFFF)
      {
        *(void *)(a1 + a4[7]) = (a2 - 1);
        return;
      }
      sub_63C4(&qword_41AE0);
      sub_EC0C();
      if (*(_DWORD *)(v16 + 84) == a3)
      {
        uint64_t v10 = v15;
        uint64_t v14 = a4[8];
      }
      else
      {
        uint64_t v10 = sub_63C4(&qword_41AE8);
        uint64_t v14 = a4[9];
      }
    }
    uint64_t v11 = a1 + v14;
  }

  _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v11, a2, a2, v10);
}

uint64_t type metadata accessor for ContactAvatarView(uint64_t a1)
{
  return sub_983C(a1, (uint64_t *)&unk_41B48);
}

void sub_149D4()
{
  sub_32D38();
  if (v0 <= 0x3F)
  {
    sub_32CA8();
    if (v1 <= 0x3F)
    {
      sub_14B74(319, (unint64_t *)&qword_41B58, &qword_41AD0, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Environment.Content);
      if (v2 <= 0x3F)
      {
        sub_14BD4();
        if (v3 <= 0x3F) {
          swift_initStructMetadata();
        }
      }
    }
  }
}

void sub_14B74(uint64_t a1, unint64_t *a2, uint64_t *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = sub_6728(a3);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

void sub_14BD4()
{
  if (!qword_41B60)
  {
    sub_332F8();
    unint64_t v0 = sub_33288();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_41B60);
    }
  }
}

uint64_t sub_14C2C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_14C48()
{
  swift_beginAccess();
  return *(void *)(*(void *)(v0 + 48) + 16);
}

BOOL sub_14C80()
{
  swift_beginAccess();
  return *(void *)(*(void *)(v0 + 48) + 16) == 0;
}

uint64_t sub_14CC0(uint64_t a1, char a2, uint64_t a3, uint64_t a4, double a5)
{
  uint64_t v6 = v5;
  uint64_t v12 = sub_33CD8();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (((unint64_t)&_swiftEmptyArrayStorage & 0xC000000000000000) != 0 && sub_33F18()) {
    uint64_t v16 = (void *)sub_7778((unint64_t)&_swiftEmptyArrayStorage);
  }
  else {
    uint64_t v16 = &_swiftEmptySetSingleton;
  }
  *(void *)(v6 + 16) = v16;
  *(void *)(v6 + 56) = 0;
  *(void *)(v6 + 64) = 0;
  *(void *)(v6 + 24) = a3;
  *(void *)(v6 + 32) = a4;
  *(double *)(v6 + 40) = a5;
  *(void *)(v6 + 72) = a1;
  *(unsigned char *)(v6 + 80) = a2 & 1;
  swift_retain();
  sub_63C4((uint64_t *)&unk_41BC0);
  sub_63C4(&qword_428D0);
  sub_EAD4(&qword_41BD0, (uint64_t *)&unk_41BC0);
  *(void *)(v6 + 48) = sub_339D8();
  id v17 = [self defaultCenter];
  sub_33CE8();

  sub_15938(&qword_41BD8, (void (*)(uint64_t))&type metadata accessor for NSNotificationCenter.Publisher);
  swift_retain();
  sub_33268();
  swift_release();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  swift_beginAccess();
  sub_331E8();
  swift_endAccess();
  swift_release();
  swift_release();
  return v6;
}

uint64_t sub_14F64()
{
  uint64_t result = sub_14C80();
  if ((result & 1) == 0)
  {
    if (qword_411C0 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_331C8();
    sub_7150(v1, (uint64_t)qword_44260);
    unint64_t v2 = sub_331B8();
    os_log_type_t v3 = sub_33C98();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_0, v2, v3, "Received a memory limit warning. Emptying the LRU Cache.", v4, 2u);
      swift_slowDealloc();
    }

    return sub_13370();
  }
  return result;
}

uint64_t sub_15054()
{
  return sub_14F64();
}

uint64_t sub_1505C(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v3 = sub_2748C(a1);
  swift_endAccess();
  if (v3)
  {
    uint64_t v4 = *(void *)(v1 + 64);
    if (v4 && v4 == v3)
    {
      *(void *)(v1 + 64) = swift_weakLoadStrong();
      swift_release();
    }
    uint64_t v5 = *(void *)(v1 + 56);
    if (v5 && v5 == v3)
    {
      *(void *)(v1 + 56) = swift_weakLoadStrong();
      swift_release();
    }
    if (swift_weakLoadStrong())
    {
      swift_weakLoadStrong();
      swift_weakAssign();
      swift_release();
      swift_release();
    }
    if (swift_weakLoadStrong())
    {
      swift_weakLoadStrong();
      swift_weakAssign();
      swift_release();
      swift_release();
    }
    swift_weakAssign();
    swift_weakAssign();
  }
  return v3;
}

uint64_t sub_15234(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 16);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  uint64_t v4 = swift_retain();
  sub_27704(v4, v3);
  swift_endAccess();
  swift_bridgeObjectRelease();
  if (!*(void *)(v1 + 64))
  {
    *(void *)(v1 + 64) = a1;
    swift_retain();
  }
  if (*(void *)(v1 + 56))
  {
    swift_weakAssign();
    swift_weakAssign();
  }
  *(void *)(v1 + 56) = a1;
  swift_release();
  return swift_retain();
}

void *sub_15324(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[2] = a1;
  v3[3] = a2;
  swift_weakInit();
  swift_weakInit();
  uint64_t v5 = (char *)v3 + *(void *)(*v3 + 120);
  uint64_t v6 = sub_32B78();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(v5, a3, v6);
  return v3;
}

uint64_t sub_153E8()
{
  uint64_t v1 = (int *)type metadata accessor for ContactAvatarView(0);
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  swift_release();
  uint64_t v5 = v0 + v3;
  sub_32D38();
  sub_EC24();
  sub_15C04();
  v6();
  uint64_t v7 = sub_32CA8();
  sub_EC24();
  uint64_t v9 = *(void (**)(uint64_t))(v8 + 8);
  uint64_t v10 = sub_15C7C();
  v9(v10);
  sub_139F0();
  swift_bridgeObjectRelease();
  uint64_t v11 = v0 + v3 + v1[8];
  sub_63C4(&qword_411F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    if (!_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0(v11, 1, v7))
    {
      uint64_t v12 = sub_15C7C();
      v9(v12);
    }
  }
  else
  {
    swift_release();
  }
  sub_63C4(&qword_41AD8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_332F8();
    sub_EC24();
    sub_15C04();
    v13();
  }
  else
  {
    swift_release();
  }
  sub_139F8(*(void *)(v5 + v1[10]), *(unsigned char *)(v5 + v1[10] + 8));
  sub_139F8(*(void *)(v5 + v1[11]), *(unsigned char *)(v5 + v1[11] + 8));
  sub_15C5C(v1[12]);
  sub_15C5C(v1[13]);
  swift_release();

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_15620(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ContactAvatarView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_15684()
{
  sub_15C50();
  uint64_t v2 = *(void *)(type metadata accessor for ContactAvatarView(0) - 8);
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v4 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_15754;
  return sub_11B08(v3, v4);
}

uint64_t sub_15754()
{
  sub_15C50();
  swift_task_dealloc();
  sub_15C20();
  return v0();
}

uint64_t sub_15840(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_EC24();
  uint64_t v4 = sub_EC6C();
  v5(v4);
  return a2;
}

uint64_t sub_15894(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_EC24();
  sub_15C04();
  v3();
  return a1;
}

uint64_t sub_158E8(uint64_t a1, uint64_t *a2)
{
  sub_63C4(a2);
  sub_EC24();
  sub_15C04();
  v3();
  return a1;
}

uint64_t sub_15938(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_15980()
{
  unint64_t result = qword_423D0;
  if (!qword_423D0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_423D0);
  }
  return result;
}

uint64_t sub_159C0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_11864();
  *a1 = result;
  return result;
}

unint64_t sub_159F4()
{
  unint64_t result = qword_41CA0;
  if (!qword_41CA0)
  {
    sub_6728(&qword_41C10);
    sub_15A70();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_41CA0);
  }
  return result;
}

unint64_t sub_15A70()
{
  unint64_t result = qword_41CA8;
  if (!qword_41CA8)
  {
    sub_6728(&qword_41BF0);
    sub_15B10();
    sub_EAD4((unint64_t *)&unk_41CD0, &qword_41E70);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_41CA8);
  }
  return result;
}

unint64_t sub_15B10()
{
  unint64_t result = qword_41CB0;
  if (!qword_41CB0)
  {
    sub_6728(&qword_41BE8);
    sub_EAD4((unint64_t *)&unk_423A0, (uint64_t *)&unk_41CC0);
    sub_15938((unint64_t *)&unk_423B0, (void (*)(uint64_t))&type metadata accessor for _TaskModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_41CB0);
  }
  return result;
}

uint64_t sub_15C20()
{
  return v0 + 8;
}

uint64_t sub_15C5C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + a1;
  uint64_t v4 = *(void *)v3;
  char v5 = *(unsigned char *)(v3 + 9);
  uint64_t v6 = *(unsigned __int8 *)(v3 + 8);
  return sub_13A04(v4, v6, v5);
}

uint64_t sub_15C7C()
{
  return v0;
}

uint64_t sub_15C90()
{
  type metadata accessor for ContactMonogramView.MonogramLoader(0);
  uint64_t v0 = swift_allocObject();
  sub_17360();
  return v0;
}

uint64_t sub_15CCC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v62 = a1;
  uint64_t v63 = sub_33C28();
  sub_9370();
  uint64_t v61 = v2;
  __chkstk_darwin(v3);
  sub_EC48();
  uint64_t v60 = v4;
  uint64_t v5 = type metadata accessor for ContactMonogramView(0);
  uint64_t v56 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v57 = v6;
  uint64_t v58 = (uint64_t)&v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = sub_63C4(&qword_41E70);
  sub_EC24();
  __chkstk_darwin(v7);
  sub_15C10();
  uint64_t v10 = v9 - v8;
  uint64_t v52 = sub_33308();
  sub_EC24();
  __chkstk_darwin(v11);
  sub_15C10();
  uint64_t v14 = (double *)(v13 - v12);
  uint64_t v15 = sub_33748();
  sub_9370();
  uint64_t v17 = v16;
  __chkstk_darwin(v18);
  sub_15C10();
  uint64_t v21 = v20 - v19;
  uint64_t v51 = sub_63C4(&qword_41E78);
  sub_EC24();
  __chkstk_darwin(v22);
  sub_15C10();
  uint64_t v25 = v24 - v23;
  uint64_t v53 = sub_63C4(&qword_41E80);
  sub_EC24();
  __chkstk_darwin(v26);
  sub_EC48();
  uint64_t v55 = v27;
  uint64_t v50 = sub_334C8();
  uint64_t v59 = v1;
  type metadata accessor for ContactMonogramView.MonogramLoader(0);
  sub_18EE4(&qword_41E88, (void (*)(uint64_t))type metadata accessor for ContactMonogramView.MonogramLoader);
  sub_33298();
  uint64_t v28 = sub_1629C();
  swift_release();
  if (v28)
  {
    (*(void (**)(uint64_t, void, uint64_t))(v17 + 104))(v21, enum case for Image.ResizingMode.stretch(_:), v15);
    uint64_t v29 = sub_33768();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v21, v15);
  }
  else
  {
    uint64_t v29 = 0;
  }
  uint64_t v30 = v59;
  double v31 = sub_16310();
  uint64_t v32 = (char *)v14 + *(int *)(v52 + 20);
  uint64_t v33 = enum case for RoundedCornerStyle.continuous(_:);
  sub_334B8();
  sub_EC24();
  (*(void (**)(char *, uint64_t))(v34 + 104))(v32, v33);
  double *v14 = v31;
  v14[1] = v31;
  sub_18A60((uint64_t)v14, v10, (void (*)(void))&type metadata accessor for RoundedRectangle);
  *(_WORD *)(v10 + *(int *)(v54 + 36)) = 256;
  sub_E92C(v10, v25 + *(int *)(v51 + 36), &qword_41E70);
  *(void *)uint64_t v25 = v50;
  *(void *)(v25 + 8) = 0;
  *(unsigned char *)(v25 + 16) = 0;
  *(void *)(v25 + 24) = v29;
  swift_retain();
  sub_EB18(v10, &qword_41E70);
  sub_18F5C((uint64_t)v14, (void (*)(void))&type metadata accessor for RoundedRectangle);
  swift_release();
  sub_16610();
  sub_16610();
  sub_33808();
  sub_332A8();
  uint64_t v35 = v55;
  sub_E92C(v25, v55, &qword_41E78);
  uint64_t v36 = (_OWORD *)(v35 + *(int *)(v53 + 36));
  long long v37 = v65;
  *uint64_t v36 = v64;
  v36[1] = v37;
  v36[2] = v66;
  sub_EB18(v25, &qword_41E78);
  uint64_t v38 = v58;
  sub_18A60(v30, v58, (void (*)(void))type metadata accessor for ContactMonogramView);
  unint64_t v39 = (*(unsigned __int8 *)(v56 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80);
  uint64_t v40 = swift_allocObject();
  sub_18CD4(v38, v40 + v39);
  uint64_t v41 = v60;
  sub_33C18();
  uint64_t v42 = sub_63C4((uint64_t *)&unk_41EA0);
  uint64_t v43 = v62;
  char v44 = (char *)(v62 + *(int *)(v42 + 36));
  uint64_t v45 = sub_332C8();
  uint64_t v46 = v61;
  uint64_t v47 = v63;
  (*(void (**)(char *, uint64_t, uint64_t))(v61 + 16))(&v44[*(int *)(v45 + 20)], v41, v63);
  *(void *)char v44 = &unk_41E98;
  *((void *)v44 + 1) = v40;
  sub_E92C(v35, v43, &qword_41E80);
  (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v41, v47);
  return sub_EB18(v35, &qword_41E80);
}

uint64_t sub_1629C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_33238();
  swift_release();
  swift_release();
  return v1;
}

double sub_16310()
{
  uint64_t v1 = sub_32CA8();
  uint64_t v46 = *(void *)(v1 - 8);
  uint64_t v47 = v1;
  __chkstk_darwin(v1);
  uint64_t v41 = (uint64_t)&v41 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for ContactImageSizeResolver(0);
  uint64_t v4 = (int *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (int *)type metadata accessor for ContactMonogramView(0);
  uint64_t v45 = v0 + v7[5];
  uint64_t v8 = v0 + v7[10];
  uint64_t v9 = *(void *)v8;
  char v10 = *(unsigned char *)(v8 + 8);
  sub_137D0(*(void *)v8, v10);
  sub_2BB38();
  uint64_t v44 = v11;
  sub_139F8(v9, v10);
  uint64_t v12 = v0 + v7[11];
  uint64_t v13 = *(void *)v12;
  uint64_t v14 = *(unsigned __int8 *)(v12 + 8);
  char v15 = *(unsigned char *)(v12 + 9);
  sub_137DC(*(void *)v12, v14, v15);
  sub_2BCA0();
  double v42 = v16;
  char v18 = v17;
  int v43 = v17 & 1;
  sub_13A04(v13, v14, v15);
  uint64_t v19 = v0 + v7[12];
  uint64_t v20 = *(void *)v19;
  uint64_t v21 = *(unsigned __int8 *)(v19 + 8);
  char v22 = *(unsigned char *)(v19 + 9);
  sub_137DC(*(void *)v19, v21, v22);
  sub_2BCA0();
  double v24 = v23;
  char v26 = v25;
  uint64_t v27 = v20;
  uint64_t v28 = v21;
  uint64_t v30 = v46;
  uint64_t v29 = v47;
  sub_13A04(v27, v28, v22);
  uint64_t v31 = v44;
  sub_2BE50();
  (*(void (**)(char *, uint64_t, uint64_t))(v30 + 16))(v6, v45, v29);
  double v32 = v42;
  *(void *)&v6[v4[7]] = v31;
  uint64_t v33 = &v6[v4[8]];
  *(double *)uint64_t v33 = v32;
  v33[8] = v43;
  uint64_t v34 = &v6[v4[9]];
  *(double *)uint64_t v34 = v24;
  v34[8] = v26 & 1;
  if (v18 & 1) != 0 || (v26)
  {
    uint64_t v35 = v41;
    sub_19B80(v41);
    id v36 = objc_allocWithZone((Class)sub_339B8());
    long long v37 = (void *)sub_33998();
    sub_32C78();
    double v39 = v38;

    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v35, v29);
  }
  else
  {
    double v39 = v24;
    if (v32 > v24) {
      double v39 = v32;
    }
  }
  sub_18F5C((uint64_t)v6, (void (*)(void))type metadata accessor for ContactImageSizeResolver);
  return v39;
}

double sub_16610()
{
  uint64_t v1 = type metadata accessor for ContactImageSizeResolver(0);
  uint64_t v2 = (int *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = (int *)type metadata accessor for ContactMonogramView(0);
  uint64_t v30 = v0 + v5[5];
  uint64_t v6 = v0 + v5[10];
  uint64_t v7 = *(void *)v6;
  char v8 = *(unsigned char *)(v6 + 8);
  sub_137D0(*(void *)v6, v8);
  sub_2BB38();
  uint64_t v29 = v9;
  sub_139F8(v7, v8);
  uint64_t v10 = v0 + v5[11];
  uint64_t v11 = *(void *)v10;
  uint64_t v12 = *(unsigned __int8 *)(v10 + 8);
  char v13 = *(unsigned char *)(v10 + 9);
  sub_137DC(*(void *)v10, v12, v13);
  sub_2BCA0();
  uint64_t v28 = v14;
  char v16 = v15;
  sub_13A04(v11, v12, v13);
  uint64_t v17 = v0 + v5[12];
  uint64_t v18 = *(void *)v17;
  uint64_t v19 = *(unsigned __int8 *)(v17 + 8);
  LOBYTE(v12) = *(unsigned char *)(v17 + 9);
  sub_137DC(*(void *)v17, v19, v12);
  sub_2BCA0();
  uint64_t v21 = v20;
  LOBYTE(v7) = v22;
  sub_13A04(v18, v19, v12);
  sub_2BE50();
  uint64_t v23 = sub_32CA8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v23 - 8) + 16))(v4, v30, v23);
  *(void *)&v4[v2[7]] = v29;
  double v24 = &v4[v2[8]];
  *(void *)double v24 = v28;
  v24[8] = v16 & 1;
  char v25 = &v4[v2[9]];
  *(void *)char v25 = v21;
  v25[8] = v7 & 1;
  double v26 = ContactImageSizeResolver.imageSize.getter();
  sub_18F5C((uint64_t)v4, (void (*)(void))type metadata accessor for ContactImageSizeResolver);
  return v26;
}

uint64_t sub_16840(uint64_t a1)
{
  v1[2] = a1;
  uint64_t v2 = sub_332F8();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  v1[6] = swift_task_alloc();
  uint64_t v3 = sub_32D78();
  v1[7] = v3;
  v1[8] = *(void *)(v3 - 8);
  v1[9] = swift_task_alloc();
  sub_33C08();
  v1[10] = sub_33BF8();
  uint64_t v5 = sub_33BE8();
  return _swift_task_switch(sub_169A0, v5, v4);
}

uint64_t sub_169A0()
{
  uint64_t v1 = v0[9];
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[4];
  uint64_t v19 = v0[5];
  uint64_t v20 = v0[7];
  uint64_t v4 = v0[2];
  uint64_t v17 = v0[6];
  uint64_t v18 = v0[3];
  swift_release();
  uint64_t v5 = type metadata accessor for ContactMonogramView(0);
  type metadata accessor for ContactMonogramView.MonogramLoader(0);
  sub_18EE4(&qword_41E88, (void (*)(uint64_t))type metadata accessor for ContactMonogramView.MonogramLoader);
  sub_33298();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v20);
  double v6 = sub_16610();
  double v8 = v7;
  uint64_t v9 = v4 + *(int *)(v5 + 36);
  uint64_t v10 = *(void *)v9;
  char v11 = *(unsigned char *)(v9 + 8);
  sub_137D0(*(void *)v9, v11);
  sub_2BE7C();
  double v13 = v12;
  sub_139F8(v10, v11);
  sub_2BFE8();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v19, enum case for LayoutDirection.rightToLeft(_:), v18);
  LOBYTE(v4) = sub_332E8();
  uint64_t v14 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v14(v19, v18);
  v14(v17, v18);
  sub_16BF4(v6, v8, v13, v1, v4 & 1);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v20);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  char v15 = (uint64_t (*)(void))v0[1];
  return v15();
}

uint64_t sub_16BF4(double a1, double a2, double a3, uint64_t a4, char a5)
{
  uint64_t v6 = v5;
  id v7 = objc_msgSend(self, "scopeWithPointSize:scale:rightToLeft:style:", a5 & 1, 0, a1, a2, a3);
  if (qword_411B8 != -1) {
    swift_once();
  }
  id v8 = (id)qword_41CE0;
  sub_32D68();
  NSString v9 = sub_33A28();
  swift_bridgeObjectRelease();
  uint64_t v10 = swift_allocObject();
  swift_weakInit();
  v14[4] = sub_18E3C;
  v14[5] = v10;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 1107296256;
  v14[2] = sub_1C380;
  v14[3] = &unk_3E0F8;
  char v11 = _Block_copy(v14);
  swift_release();
  id v12 = [v8 renderMonogramForString:v9 scope:v7 imageHandler:v11];
  swift_unknownObjectRelease();
  _Block_release(v11);

  *(void *)(v6 + OBJC_IVAR____TtCV12SystemPlugin19ContactMonogramView14MonogramLoader_cnCancellable) = v12;
  return swift_unknownObjectRelease();
}

uint64_t sub_16DC8()
{
  return sub_16DF4();
}

uint64_t sub_16DF4()
{
  return sub_33248();
}

id sub_16E64()
{
  id result = [objc_allocWithZone((Class)CNAvatarImageRenderer) init];
  qword_41CE0 = (uint64_t)result;
  return result;
}

uint64_t sub_16E98(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_33818();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_33838();
  uint64_t v8 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18E5C();
  char v11 = (void *)sub_33CB8();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a2;
  *(void *)(v12 + 24) = a1;
  aBlock[4] = sub_18EDC;
  aBlock[5] = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_630C;
  aBlock[3] = &unk_3E148;
  double v13 = _Block_copy(aBlock);
  swift_retain();
  id v14 = a1;
  swift_release();
  sub_33828();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_18EE4((unint64_t *)&unk_41EB0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_63C4((uint64_t *)&unk_41380);
  sub_EAD4((unint64_t *)&qword_41EC0, (uint64_t *)&unk_41380);
  sub_33D78();
  sub_33CC8();
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v17);
}

uint64_t sub_17174(uint64_t a1, void *a2)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    id v4 = a2;
    sub_33728();
    sub_16DF4();
    return swift_release();
  }
  return result;
}

uint64_t sub_171D8()
{
  sub_63C4((uint64_t *)&unk_41AC0);
  sub_EC24();
  uint64_t v1 = sub_EC5C();
  v2(v1);
  swift_unknownObjectRelease();
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_1727C()
{
  return type metadata accessor for ContactMonogramView.MonogramLoader(0);
}

uint64_t type metadata accessor for ContactMonogramView.MonogramLoader(uint64_t a1)
{
  return sub_983C(a1, (uint64_t *)&unk_41D20);
}

void sub_172A4()
{
  sub_14B74(319, qword_41D30, (uint64_t *)&unk_41980, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Published);
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t sub_17360()
{
  uint64_t v1 = sub_63C4((uint64_t *)&unk_41AC0);
  sub_9370();
  uint64_t v3 = v2;
  __chkstk_darwin(v4);
  sub_15C10();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = v0 + OBJC_IVAR____TtCV12SystemPlugin19ContactMonogramView14MonogramLoader__image;
  sub_63C4((uint64_t *)&unk_41980);
  sub_33218();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v8, v7, v1);
  *(void *)(v0 + OBJC_IVAR____TtCV12SystemPlugin19ContactMonogramView14MonogramLoader_cnCancellable) = 0;
  return v0;
}

uint64_t *sub_17438(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v23 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v23 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_32D78();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_32CA8();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    v12(v9, v10, v11);
    uint64_t v13 = a3[6];
    id v14 = (char *)a1 + v13;
    char v15 = (char *)a2 + v13;
    uint64_t v16 = *(void *)v15;
    uint64_t v17 = *((void *)v15 + 1);
    char v18 = v15[16];
    sub_137C8();
    *(void *)id v14 = v16;
    *((void *)v14 + 1) = v17;
    v14[16] = v18;
    uint64_t v19 = a3[7];
    uint64_t v20 = (uint64_t *)((char *)a1 + v19);
    uint64_t v21 = (uint64_t *)((char *)a2 + v19);
    sub_63C4(&qword_411F0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v21, 1, v11))
      {
        uint64_t v22 = sub_63C4(&qword_41AD0);
        memcpy(v20, v21, *(void *)(*(void *)(v22 - 8) + 64));
      }
      else
      {
        v12((char *)v20, (char *)v21, v11);
        _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v20, 0, 1, v11);
      }
    }
    else
    {
      *uint64_t v20 = *v21;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v24 = a3[8];
    char v25 = (uint64_t *)((char *)a1 + v24);
    double v26 = (uint64_t *)((char *)a2 + v24);
    sub_63C4(&qword_41AD8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v27 = sub_332F8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v27 - 8) + 16))(v25, v26, v27);
    }
    else
    {
      *char v25 = *v26;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v28 = a3[9];
    uint64_t v29 = (char *)a1 + v28;
    uint64_t v30 = (char *)a2 + v28;
    uint64_t v31 = *(void *)v30;
    char v32 = v30[8];
    sub_137D0(*(void *)v30, v32);
    *(void *)uint64_t v29 = v31;
    v29[8] = v32;
    uint64_t v33 = a3[10];
    uint64_t v34 = (char *)a1 + v33;
    uint64_t v35 = (char *)a2 + v33;
    uint64_t v36 = *(void *)v35;
    char v37 = v35[8];
    sub_137D0(*(void *)v35, v37);
    *(void *)uint64_t v34 = v36;
    v34[8] = v37;
    uint64_t v38 = a3[11];
    double v39 = (char *)a1 + v38;
    uint64_t v40 = (char *)a2 + v38;
    uint64_t v41 = *(void *)v40;
    char v42 = v40[9];
    LOBYTE(v34) = v40[8];
    sub_137DC(*(void *)v40, v34, v42);
    *(void *)double v39 = v41;
    v39[8] = (char)v34;
    v39[9] = v42;
    uint64_t v43 = a3[12];
    uint64_t v44 = (char *)a1 + v43;
    uint64_t v45 = (char *)a2 + v43;
    uint64_t v46 = *(void *)v45;
    char v47 = v45[9];
    LOBYTE(v41) = v45[8];
    sub_137DC(*(void *)v45, v41, v47);
    *(void *)uint64_t v44 = v46;
    v44[8] = v41;
    v44[9] = v47;
  }
  return a1;
}

uint64_t sub_177A4(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_32D78();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + a2[5];
  uint64_t v6 = sub_32CA8();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
  sub_139F0();
  uint64_t v8 = a1 + a2[7];
  sub_63C4(&qword_411F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    if (!_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0(v8, 1, v6)) {
      v7(v8, v6);
    }
  }
  else
  {
    swift_release();
  }
  uint64_t v9 = a1 + a2[8];
  sub_63C4(&qword_41AD8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_332F8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  }
  else
  {
    swift_release();
  }
  sub_139F8(*(void *)(a1 + a2[9]), *(unsigned char *)(a1 + a2[9] + 8));
  sub_139F8(*(void *)(a1 + a2[10]), *(unsigned char *)(a1 + a2[10] + 8));
  sub_13A04(*(void *)(a1 + a2[11]), *(unsigned __int8 *)(a1 + a2[11] + 8), *(unsigned char *)(a1 + a2[11] + 9));
  uint64_t v11 = a1 + a2[12];
  uint64_t v12 = *(void *)v11;
  char v13 = *(unsigned char *)(v11 + 9);
  uint64_t v14 = *(unsigned __int8 *)(v11 + 8);

  return sub_13A04(v12, v14, v13);
}

uint64_t sub_17994(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_32D78();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = sub_32CA8();
  uint64_t v11 = *(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16);
  v11(v8, v9, v10);
  uint64_t v12 = a3[6];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = (uint64_t *)(a2 + v12);
  uint64_t v15 = *v14;
  uint64_t v16 = v14[1];
  char v17 = *((unsigned char *)v14 + 16);
  sub_137C8();
  *(void *)uint64_t v13 = v15;
  *(void *)(v13 + 8) = v16;
  *(unsigned char *)(v13 + 16) = v17;
  uint64_t v18 = a3[7];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (void *)(a2 + v18);
  sub_63C4(&qword_411F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v20, 1, v10))
    {
      uint64_t v21 = sub_63C4(&qword_41AD0);
      memcpy(v19, v20, *(void *)(*(void *)(v21 - 8) + 64));
    }
    else
    {
      v11(v19, v20, v10);
      _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v19, 0, 1, v10);
    }
  }
  else
  {
    *uint64_t v19 = *v20;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v22 = a3[8];
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = (void *)(a2 + v22);
  sub_63C4(&qword_41AD8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v25 = sub_332F8();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v25 - 8) + 16))(v23, v24, v25);
  }
  else
  {
    void *v23 = *v24;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v26 = a3[9];
  uint64_t v27 = a1 + v26;
  uint64_t v28 = a2 + v26;
  uint64_t v29 = *(void *)v28;
  char v30 = *(unsigned char *)(v28 + 8);
  sub_137D0(*(void *)v28, v30);
  *(void *)uint64_t v27 = v29;
  *(unsigned char *)(v27 + 8) = v30;
  uint64_t v31 = a3[10];
  uint64_t v32 = a1 + v31;
  uint64_t v33 = a2 + v31;
  uint64_t v34 = *(void *)v33;
  char v35 = *(unsigned char *)(v33 + 8);
  sub_137D0(*(void *)v33, v35);
  *(void *)uint64_t v32 = v34;
  *(unsigned char *)(v32 + 8) = v35;
  uint64_t v36 = a3[11];
  uint64_t v37 = a1 + v36;
  uint64_t v38 = a2 + v36;
  uint64_t v39 = *(void *)v38;
  char v40 = *(unsigned char *)(v38 + 9);
  LOBYTE(v32) = *(unsigned char *)(v38 + 8);
  sub_137DC(*(void *)v38, v32, v40);
  *(void *)uint64_t v37 = v39;
  *(unsigned char *)(v37 + 8) = v32;
  *(unsigned char *)(v37 + 9) = v40;
  uint64_t v41 = a3[12];
  uint64_t v42 = a1 + v41;
  uint64_t v43 = a2 + v41;
  uint64_t v44 = *(void *)v43;
  char v45 = *(unsigned char *)(v43 + 9);
  LOBYTE(v39) = *(unsigned char *)(v43 + 8);
  sub_137DC(*(void *)v43, v39, v45);
  *(void *)uint64_t v42 = v44;
  *(unsigned char *)(v42 + 8) = v39;
  *(unsigned char *)(v42 + 9) = v45;
  return a1;
}

uint64_t sub_17CB0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_32D78();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_32CA8();
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 24))(v8, v9, v10);
  uint64_t v12 = a3[6];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = (uint64_t *)(a2 + v12);
  uint64_t v15 = *v14;
  uint64_t v16 = v14[1];
  char v17 = *((unsigned char *)v14 + 16);
  sub_137C8();
  *(void *)uint64_t v13 = v15;
  *(void *)(v13 + 8) = v16;
  *(unsigned char *)(v13 + 16) = v17;
  sub_139F0();
  if (a1 != a2)
  {
    uint64_t v18 = a3[7];
    uint64_t v19 = (void *)(a1 + v18);
    uint64_t v20 = (void *)(a2 + v18);
    sub_EB18(a1 + v18, &qword_411F0);
    sub_63C4(&qword_411F0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v20, 1, v10))
      {
        uint64_t v21 = sub_63C4(&qword_41AD0);
        memcpy(v19, v20, *(void *)(*(void *)(v21 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v19, v20, v10);
        _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v19, 0, 1, v10);
      }
    }
    else
    {
      *uint64_t v19 = *v20;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v22 = a3[8];
    uint64_t v23 = (void *)(a1 + v22);
    uint64_t v24 = (void *)(a2 + v22);
    sub_EB18(a1 + v22, &qword_41AD8);
    sub_63C4(&qword_41AD8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v25 = sub_332F8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v25 - 8) + 16))(v23, v24, v25);
    }
    else
    {
      void *v23 = *v24;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v26 = a3[9];
  uint64_t v27 = a1 + v26;
  uint64_t v28 = a2 + v26;
  uint64_t v29 = *(void *)v28;
  char v30 = *(unsigned char *)(v28 + 8);
  sub_137D0(*(void *)v28, v30);
  uint64_t v31 = *(void *)v27;
  char v32 = *(unsigned char *)(v27 + 8);
  *(void *)uint64_t v27 = v29;
  *(unsigned char *)(v27 + 8) = v30;
  sub_139F8(v31, v32);
  uint64_t v33 = a3[10];
  uint64_t v34 = a1 + v33;
  uint64_t v35 = a2 + v33;
  uint64_t v36 = *(void *)v35;
  char v37 = *(unsigned char *)(v35 + 8);
  sub_137D0(*(void *)v35, v37);
  uint64_t v38 = *(void *)v34;
  char v39 = *(unsigned char *)(v34 + 8);
  *(void *)uint64_t v34 = v36;
  *(unsigned char *)(v34 + 8) = v37;
  sub_139F8(v38, v39);
  uint64_t v40 = a3[11];
  uint64_t v41 = a1 + v40;
  uint64_t v42 = a2 + v40;
  uint64_t v43 = *(void *)v42;
  char v44 = *(unsigned char *)(v42 + 9);
  LOBYTE(v34) = *(unsigned char *)(v42 + 8);
  sub_137DC(*(void *)v42, v34, v44);
  uint64_t v45 = *(void *)v41;
  char v46 = *(unsigned char *)(v41 + 9);
  *(void *)uint64_t v41 = v43;
  uint64_t v47 = *(unsigned __int8 *)(v41 + 8);
  *(unsigned char *)(v41 + 8) = v34;
  *(unsigned char *)(v41 + 9) = v44;
  sub_13A04(v45, v47, v46);
  uint64_t v48 = a3[12];
  uint64_t v49 = a1 + v48;
  uint64_t v50 = a2 + v48;
  uint64_t v51 = *(void *)v50;
  char v52 = *(unsigned char *)(v50 + 9);
  LOBYTE(v43) = *(unsigned char *)(v50 + 8);
  sub_137DC(*(void *)v50, v43, v52);
  uint64_t v53 = *(void *)v49;
  char v54 = *(unsigned char *)(v49 + 9);
  *(void *)uint64_t v49 = v51;
  uint64_t v55 = *(unsigned __int8 *)(v49 + 8);
  *(unsigned char *)(v49 + 8) = v43;
  *(unsigned char *)(v49 + 9) = v52;
  sub_13A04(v53, v55, v54);
  return a1;
}

uint64_t sub_18054(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_32D78();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_32CA8();
  uint64_t v11 = *(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32);
  v11(v8, v9, v10);
  uint64_t v12 = a3[6];
  uint64_t v13 = a3[7];
  uint64_t v14 = a1 + v12;
  uint64_t v15 = a2 + v12;
  *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
  *(unsigned char *)(v14 + 16) = *(unsigned char *)(v15 + 16);
  uint64_t v16 = (void *)(a1 + v13);
  char v17 = (const void *)(a2 + v13);
  uint64_t v18 = sub_63C4(&qword_411F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v17, 1, v10))
    {
      uint64_t v19 = sub_63C4(&qword_41AD0);
      memcpy(v16, v17, *(void *)(*(void *)(v19 - 8) + 64));
    }
    else
    {
      v11(v16, v17, v10);
      _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v16, 0, 1, v10);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v16, v17, *(void *)(*(void *)(v18 - 8) + 64));
  }
  uint64_t v20 = a3[8];
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = (const void *)(a2 + v20);
  uint64_t v23 = sub_63C4(&qword_41AD8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v24 = sub_332F8();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v24 - 8) + 32))(v21, v22, v24);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v21, v22, *(void *)(*(void *)(v23 - 8) + 64));
  }
  uint64_t v25 = a3[9];
  uint64_t v26 = a3[10];
  uint64_t v27 = a1 + v25;
  uint64_t v28 = a2 + v25;
  *(void *)uint64_t v27 = *(void *)v28;
  *(unsigned char *)(v27 + 8) = *(unsigned char *)(v28 + 8);
  uint64_t v29 = a1 + v26;
  uint64_t v30 = a2 + v26;
  *(void *)uint64_t v29 = *(void *)v30;
  *(unsigned char *)(v29 + 8) = *(unsigned char *)(v30 + 8);
  uint64_t v31 = a3[11];
  uint64_t v32 = a3[12];
  uint64_t v33 = a1 + v31;
  uint64_t v34 = a2 + v31;
  *(void *)uint64_t v33 = *(void *)v34;
  *(_WORD *)(v33 + 8) = *(_WORD *)(v34 + 8);
  uint64_t v35 = a1 + v32;
  uint64_t v36 = a2 + v32;
  *(void *)uint64_t v35 = *(void *)v36;
  *(_WORD *)(v35 + 8) = *(_WORD *)(v36 + 8);
  return a1;
}

uint64_t sub_1831C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_32D78();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_32CA8();
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 40))(v8, v9, v10);
  uint64_t v12 = a3[6];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  char v15 = *(unsigned char *)(v14 + 16);
  *(_OWORD *)uint64_t v13 = *(_OWORD *)v14;
  *(unsigned char *)(v13 + 16) = v15;
  sub_139F0();
  if (a1 != a2)
  {
    uint64_t v16 = a3[7];
    char v17 = (void *)(a1 + v16);
    uint64_t v18 = (const void *)(a2 + v16);
    sub_EB18(a1 + v16, &qword_411F0);
    uint64_t v19 = sub_63C4(&qword_411F0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v18, 1, v10))
      {
        uint64_t v20 = sub_63C4(&qword_41AD0);
        memcpy(v17, v18, *(void *)(*(void *)(v20 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v17, v18, v10);
        _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v17, 0, 1, v10);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v17, v18, *(void *)(*(void *)(v19 - 8) + 64));
    }
    uint64_t v21 = a3[8];
    uint64_t v22 = (void *)(a1 + v21);
    uint64_t v23 = (const void *)(a2 + v21);
    sub_EB18(a1 + v21, &qword_41AD8);
    uint64_t v24 = sub_63C4(&qword_41AD8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v25 = sub_332F8();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v25 - 8) + 32))(v22, v23, v25);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v22, v23, *(void *)(*(void *)(v24 - 8) + 64));
    }
  }
  uint64_t v26 = a3[9];
  uint64_t v27 = a1 + v26;
  uint64_t v28 = (uint64_t *)(a2 + v26);
  uint64_t v29 = *v28;
  LOBYTE(v28) = *((unsigned char *)v28 + 8);
  uint64_t v30 = *(void *)v27;
  char v31 = *(unsigned char *)(v27 + 8);
  *(void *)uint64_t v27 = v29;
  *(unsigned char *)(v27 + 8) = (_BYTE)v28;
  sub_139F8(v30, v31);
  uint64_t v32 = a3[10];
  uint64_t v33 = a1 + v32;
  uint64_t v34 = (uint64_t *)(a2 + v32);
  uint64_t v35 = *v34;
  LOBYTE(v34) = *((unsigned char *)v34 + 8);
  uint64_t v36 = *(void *)v33;
  char v37 = *(unsigned char *)(v33 + 8);
  *(void *)uint64_t v33 = v35;
  *(unsigned char *)(v33 + 8) = (_BYTE)v34;
  sub_139F8(v36, v37);
  uint64_t v38 = a3[11];
  uint64_t v39 = a1 + v38;
  uint64_t v40 = (uint64_t *)(a2 + v38);
  uint64_t v41 = *v40;
  char v42 = *((unsigned char *)v40 + 8);
  LOBYTE(v40) = *((unsigned char *)v40 + 9);
  uint64_t v43 = *(void *)v39;
  char v44 = *(unsigned char *)(v39 + 9);
  *(void *)uint64_t v39 = v41;
  uint64_t v45 = *(unsigned __int8 *)(v39 + 8);
  *(unsigned char *)(v39 + 8) = v42;
  *(unsigned char *)(v39 + 9) = (_BYTE)v40;
  sub_13A04(v43, v45, v44);
  uint64_t v46 = a3[12];
  uint64_t v47 = a1 + v46;
  uint64_t v48 = (uint64_t *)(a2 + v46);
  uint64_t v49 = *v48;
  char v50 = *((unsigned char *)v48 + 8);
  LOBYTE(v48) = *((unsigned char *)v48 + 9);
  uint64_t v51 = *(void *)v47;
  char v52 = *(unsigned char *)(v47 + 9);
  *(void *)uint64_t v47 = v49;
  uint64_t v53 = *(unsigned __int8 *)(v47 + 8);
  *(unsigned char *)(v47 + 8) = v50;
  *(unsigned char *)(v47 + 9) = (_BYTE)v48;
  sub_13A04(v51, v53, v52);
  return a1;
}

uint64_t sub_18680(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_18694);
}

uint64_t sub_18694(uint64_t a1, uint64_t a2, int *a3)
{
  sub_32D78();
  sub_EC0C();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    sub_32CA8();
    sub_EC0C();
    if (*(_DWORD *)(v11 + 84) == a2)
    {
      uint64_t v8 = v10;
      uint64_t v12 = a3[5];
    }
    else
    {
      if (a2 == 254)
      {
        unsigned int v13 = *(unsigned __int8 *)(a1 + a3[6] + 16);
        if (v13 > 1) {
          return (v13 ^ 0xFF) + 1;
        }
        else {
          return 0;
        }
      }
      sub_63C4(&qword_41AE0);
      sub_EC0C();
      if (*(_DWORD *)(v16 + 84) == a2)
      {
        uint64_t v8 = v15;
        uint64_t v12 = a3[7];
      }
      else
      {
        uint64_t v8 = sub_63C4(&qword_41AE8);
        uint64_t v12 = a3[8];
      }
    }
    uint64_t v9 = a1 + v12;
  }

  return _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0(v9, a2, v8);
}

uint64_t sub_18790(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_187A4);
}

void sub_187A4(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  sub_32D78();
  sub_EC0C();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    sub_32CA8();
    sub_EC0C();
    if (*(_DWORD *)(v13 + 84) == a3)
    {
      uint64_t v10 = v12;
      uint64_t v14 = a4[5];
    }
    else
    {
      if (a3 == 254)
      {
        *(unsigned char *)(a1 + a4[6] + 16) = -(char)a2;
        return;
      }
      sub_63C4(&qword_41AE0);
      sub_EC0C();
      if (*(_DWORD *)(v16 + 84) == a3)
      {
        uint64_t v10 = v15;
        uint64_t v14 = a4[7];
      }
      else
      {
        uint64_t v10 = sub_63C4(&qword_41AE8);
        uint64_t v14 = a4[8];
      }
    }
    uint64_t v11 = a1 + v14;
  }

  _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v11, a2, a2, v10);
}

uint64_t type metadata accessor for ContactMonogramView(uint64_t a1)
{
  return sub_983C(a1, qword_41E18);
}

void sub_188C0()
{
  sub_32D78();
  if (v0 <= 0x3F)
  {
    sub_32CA8();
    if (v1 <= 0x3F)
    {
      sub_14B74(319, (unint64_t *)&qword_41B58, &qword_41AD0, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Environment.Content);
      if (v2 <= 0x3F)
      {
        sub_14BD4();
        if (v3 <= 0x3F) {
          swift_initStructMetadata();
        }
      }
    }
  }
}

uint64_t sub_18A44()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_18A60(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_EC24();
  uint64_t v4 = sub_EC6C();
  v5(v4);
  return a2;
}

uint64_t sub_18AB4()
{
  unint64_t v1 = (int *)type metadata accessor for ContactMonogramView(0);
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v5 = v0 + v3;
  sub_32D78();
  sub_EC24();
  (*(void (**)(uint64_t))(v6 + 8))(v0 + v3);
  uint64_t v7 = sub_32CA8();
  sub_EC24();
  uint64_t v9 = *(void (**)(uint64_t))(v8 + 8);
  uint64_t v10 = sub_15C7C();
  v9(v10);
  sub_139F0();
  uint64_t v11 = v0 + v3 + v1[7];
  sub_63C4(&qword_411F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    if (!_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0(v11, 1, v7))
    {
      uint64_t v12 = sub_15C7C();
      v9(v12);
    }
  }
  else
  {
    swift_release();
  }
  uint64_t v13 = v5 + v1[8];
  sub_63C4(&qword_41AD8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_332F8();
    sub_EC24();
    (*(void (**)(uint64_t))(v14 + 8))(v13);
  }
  else
  {
    swift_release();
  }
  sub_139F8(*(void *)(v5 + v1[9]), *(unsigned char *)(v5 + v1[9] + 8));
  sub_139F8(*(void *)(v5 + v1[10]), *(unsigned char *)(v5 + v1[10] + 8));
  sub_15C5C(v1[11]);
  sub_15C5C(v1[12]);

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_18CD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ContactMonogramView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_18D38()
{
  uint64_t v2 = *(void *)(type metadata accessor for ContactMonogramView(0) - 8);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_BF08;
  return sub_16840(v3);
}

uint64_t sub_18E04()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_18E3C(void *a1)
{
  return sub_16E98(a1, v1);
}

uint64_t sub_18E44(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_18E54()
{
  return swift_release();
}

unint64_t sub_18E5C()
{
  unint64_t result = qword_41370;
  if (!qword_41370)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_41370);
  }
  return result;
}

uint64_t sub_18E9C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_18EDC()
{
  return sub_17174(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_18EE4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_18F2C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1629C();
  *a1 = result;
  return result;
}

uint64_t sub_18F5C(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_EC24();
  uint64_t v3 = sub_EC5C();
  v4(v3);
  return a1;
}

unint64_t sub_18FB0()
{
  unint64_t result = qword_41EC8;
  if (!qword_41EC8)
  {
    sub_6728((uint64_t *)&unk_41EA0);
    sub_1905C();
    sub_18EE4((unint64_t *)&unk_423B0, (void (*)(uint64_t))&type metadata accessor for _TaskModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_41EC8);
  }
  return result;
}

unint64_t sub_1905C()
{
  unint64_t result = qword_41ED0;
  if (!qword_41ED0)
  {
    sub_6728(&qword_41E80);
    sub_190D8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_41ED0);
  }
  return result;
}

unint64_t sub_190D8()
{
  unint64_t result = qword_41ED8;
  if (!qword_41ED8)
  {
    sub_6728(&qword_41E78);
    sub_EAD4(&qword_41EE0, &qword_41EE8);
    sub_EAD4((unint64_t *)&unk_41CD0, &qword_41E70);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_41ED8);
  }
  return result;
}

double ContactImageSizeResolver.imageSize.getter()
{
  uint64_t v3 = sub_32CA8();
  sub_9370();
  uint64_t v5 = v4;
  __chkstk_darwin(v6);
  uint64_t v7 = sub_1AEF4();
  sub_EC24();
  __chkstk_darwin(v8);
  sub_1AF1C();
  uint64_t v10 = v0 + *(int *)(v9 + 24);
  double v11 = 0.0;
  if (*(unsigned char *)(v10 + 8) & 1) != 0 || (*(unsigned char *)(v0 + *(int *)(v7 + 28) + 8))
  {
    int v12 = 1;
  }
  else
  {
    int v12 = 0;
    double v11 = *(double *)v10;
  }
  sub_19324(v0, v2);
  if (v12)
  {
    sub_19B80(v1);
    id v13 = objc_allocWithZone((Class)sub_339B8());
    uint64_t v14 = (void *)sub_1AF8C();
    sub_32C88();
    double v11 = v15;

    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v1, v3);
  }
  sub_19D40(v2);
  return v11;
}

uint64_t type metadata accessor for ContactImageSizeResolver(uint64_t a1)
{
  return sub_983C(a1, (uint64_t *)&unk_41F48);
}

uint64_t sub_19324(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ContactImageSizeResolver(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

double ContactImageSizeResolver.cornerRadius.getter()
{
  uint64_t v2 = sub_32CA8();
  sub_9370();
  uint64_t v4 = v3;
  __chkstk_darwin(v5);
  uint64_t v6 = sub_1AEF4();
  uint64_t v7 = (unsigned char *)(v0 + *(int *)(v6 + 24));
  if (v7[8] & 1) != 0 || (uint64_t v8 = (unsigned char *)(v0 + *(int *)(v6 + 28)), (v8[8]))
  {
    sub_19B80(v1);
    id v9 = objc_allocWithZone((Class)sub_339B8());
    uint64_t v10 = (void *)sub_1AF8C();
    sub_32C78();
    double v12 = v11;

    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v2);
  }
  else if (*(double *)v7 <= *(double *)v8)
  {
    return *(double *)v8;
  }
  else
  {
    return *(double *)v7;
  }
  return v12;
}

uint64_t sub_1948C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v79 = a1;
  uint64_t v2 = (int *)type metadata accessor for ContactMonogramView(0);
  sub_EC24();
  __chkstk_darwin(v3);
  sub_15C10();
  uint64_t v6 = (char *)(v5 - v4);
  uint64_t v74 = sub_32D78();
  sub_9370();
  uint64_t v76 = v7;
  __chkstk_darwin(v8);
  sub_1AF4C();
  uint64_t v73 = v9;
  __chkstk_darwin(v10);
  uint64_t v75 = (char *)&v70 - v11;
  sub_32CA8();
  sub_9370();
  uint64_t v77 = v13;
  uint64_t v78 = v12;
  __chkstk_darwin(v12);
  sub_15C10();
  uint64_t v16 = v15 - v14;
  char v17 = (int *)type metadata accessor for ContactAvatarView(0);
  sub_EC24();
  __chkstk_darwin(v18);
  sub_15C10();
  uint64_t v21 = v20 - v19;
  sub_32D38();
  sub_9370();
  uint64_t v71 = v23;
  uint64_t v72 = v22;
  __chkstk_darwin(v22);
  sub_1AF4C();
  uint64_t v70 = v24;
  __chkstk_darwin(v25);
  uint64_t v27 = (char *)&v70 - v26;
  uint64_t v28 = sub_32D48();
  sub_9370();
  uint64_t v30 = v29;
  __chkstk_darwin(v31);
  sub_1AF1C();
  sub_32D58();
  int v32 = (*(uint64_t (**)(uint64_t, uint64_t))(v30 + 88))(v1, v28);
  if (v32 == enum case for ImageElement.Contact.Content.monogram(_:))
  {
    uint64_t v33 = sub_1AF34();
    v34(v33);
    uint64_t v36 = v75;
    uint64_t v35 = (void (**)(uint64_t, char *, uint64_t))v76;
    uint64_t v72 = (void (*)(char *, uint64_t, uint64_t))*((void *)v76 + 4);
    uint64_t v37 = v74;
    v72(v75, v1, v74);
    uint64_t v38 = v73;
    v35[2](v73, v36, v37);
    sub_32D08();
    uint64_t v39 = &v6[v2[6]];
    *(void *)uint64_t v39 = sub_15C90;
    *((void *)v39 + 1) = 0;
    v39[16] = 0;
    uint64_t v40 = (uint64_t *)&v6[v2[7]];
    *uint64_t v40 = swift_getKeyPath();
    sub_63C4(&qword_411F0);
    sub_1AED8();
    uint64_t v41 = (uint64_t *)&v6[v2[8]];
    uint64_t *v41 = swift_getKeyPath();
    sub_63C4(&qword_41AD8);
    sub_1AED8();
    uint64_t KeyPath = swift_getKeyPath();
    sub_1AF60(KeyPath);
    uint64_t v43 = swift_getKeyPath();
    sub_1AF60(v43);
    char v44 = &v6[v2[11]];
    *(void *)char v44 = swift_getKeyPath();
    *((_WORD *)v44 + 4) = 0;
    uint64_t v45 = &v6[v2[12]];
    *(void *)uint64_t v45 = swift_getKeyPath();
    *((_WORD *)v45 + 4) = 0;
    v72(v6, v38, v37);
    (*(void (**)(char *, uint64_t, uint64_t))(v77 + 32))(&v6[v2[5]], v16, v78);
    sub_1AE84(&qword_42028, (void (*)(uint64_t))type metadata accessor for ContactMonogramView);
    uint64_t v46 = sub_337C8();
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v35[1])(v36, v37);
    *uint64_t v79 = v46;
  }
  else
  {
    uint64_t v48 = v79;
    if (v32 == enum case for ImageElement.Contact.Content.avatar(_:))
    {
      uint64_t v49 = sub_1AF34();
      v50(v49);
      uint64_t v51 = v71;
      char v52 = v27;
      uint64_t v53 = v27;
      char v54 = v72;
      (*(void (**)(char *, uint64_t, void))(v71 + 32))(v53, v1, v72);
      uint64_t v55 = v70;
      uint64_t v75 = *(char **)(v51 + 16);
      uint64_t v76 = v52;
      ((void (*)(uint64_t, char *, void))v75)(v70, v52, v54);
      sub_32D08();
      if (qword_411B0 != -1) {
        swift_once();
      }
      uint64_t v56 = qword_44258;
      uint64_t v57 = v21 + v17[6];
      *(void *)uint64_t v57 = sub_11010;
      *(void *)(v57 + 8) = 0;
      *(unsigned char *)(v57 + 16) = 0;
      uint64_t v58 = (uint64_t *)(v21 + v17[8]);
      *uint64_t v58 = swift_getKeyPath();
      sub_63C4(&qword_411F0);
      sub_1AED8();
      uint64_t v59 = (uint64_t *)(v21 + v17[9]);
      *uint64_t v59 = swift_getKeyPath();
      sub_63C4(&qword_41AD8);
      sub_1AED8();
      uint64_t v60 = swift_getKeyPath();
      sub_1AF60(v60);
      uint64_t v61 = swift_getKeyPath();
      sub_1AF60(v61);
      uint64_t v62 = v21 + v17[12];
      *(void *)uint64_t v62 = swift_getKeyPath();
      *(_WORD *)(v62 + 8) = 0;
      uint64_t v63 = v21 + v17[13];
      *(void *)uint64_t v63 = swift_getKeyPath();
      *(_WORD *)(v63 + 8) = 0;
      ((void (*)(uint64_t, uint64_t, void))v75)(v21, v55, v54);
      uint64_t v65 = v77;
      uint64_t v64 = v78;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v77 + 16))(v21 + v17[5], v16, v78);
      swift_retain();
      uint64_t v66 = sub_32D28();
      uint64_t v67 = sub_4360(v66);
      (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v16, v64);
      BOOL v68 = *(void (**)(void, void))(v51 + 8);
      v68(v55, v54);
      *(void *)(v21 + v17[7]) = v67;
      *(void *)(v21 + v17[14]) = v56;
      sub_1AE84(&qword_42030, (void (*)(uint64_t))type metadata accessor for ContactAvatarView);
      uint64_t v69 = sub_337C8();
      uint64_t result = ((uint64_t (*)(char *, void (*)(char *, uint64_t, uint64_t)))v68)(v76, v54);
      *uint64_t v79 = v69;
    }
    else
    {
      *uint64_t v48 = sub_337C8();
      return (*(uint64_t (**)(uint64_t, uint64_t))(v30 + 8))(v1, v28);
    }
  }
  return result;
}

uint64_t sub_19B80@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_63C4(&qword_41AD0);
  __chkstk_darwin(v4 - 8);
  sub_15C10();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = sub_32CA8();
  sub_9370();
  uint64_t v10 = v9;
  __chkstk_darwin(v11);
  sub_15C10();
  uint64_t v14 = v13 - v12;
  uint64_t v15 = *(void (**)(uint64_t, void, uint64_t))(v10 + 104);
  v15(v13 - v12, enum case for ImageElement.ImageStyle.default(_:), v8);
  char v16 = sub_32C98();
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v14, v8);
  if ((v16 & 1) == 0) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(a1, v2, v8);
  }
  uint64_t v17 = type metadata accessor for ContactImageSizeResolver(0);
  sub_1A838(v2 + *(int *)(v17 + 32), v7);
  if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0(v7, 1, v8) != 1) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 32))(a1, v7, v8);
  }
  v15(a1, enum case for ImageElement.ImageStyle.contactImage5(_:), v8);
  return sub_1A8A0(v7);
}

uint64_t sub_19D40(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ContactImageSizeResolver(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

char *initializeBufferWithCopyOfBuffer for ContactImageSizeResolver(char *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    *(void *)a1 = *a2;
    a1 = (char *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_32CA8();
    uint64_t v8 = *(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, (char *)a2, v7);
    uint64_t v9 = a3[6];
    *(void *)&a1[a3[5]] = *(uint64_t *)((char *)a2 + a3[5]);
    uint64_t v10 = &a1[v9];
    uint64_t v11 = (char *)a2 + v9;
    *(void *)uint64_t v10 = *(void *)v11;
    v10[8] = v11[8];
    uint64_t v12 = a3[7];
    uint64_t v13 = a3[8];
    uint64_t v14 = &a1[v12];
    uint64_t v15 = (char *)a2 + v12;
    *(void *)uint64_t v14 = *(void *)v15;
    v14[8] = v15[8];
    char v16 = &a1[v13];
    uint64_t v17 = (char *)a2 + v13;
    if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v17, 1, v7))
    {
      uint64_t v18 = sub_63C4(&qword_41AD0);
      memcpy(v16, v17, *(void *)(*(void *)(v18 - 8) + 64));
    }
    else
    {
      v8(v16, v17, v7);
      _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v16, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t destroy for ContactImageSizeResolver(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_32CA8();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v7(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 32);
  uint64_t result = _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0(v5, 1, v4);
  if (!result)
  {
    return v7(v5, v4);
  }
  return result;
}

char *initializeWithCopy for ContactImageSizeResolver(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_32CA8();
  uint64_t v7 = *(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  uint64_t v8 = a3[6];
  *(void *)&a1[a3[5]] = *(void *)&a2[a3[5]];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  *(void *)uint64_t v9 = *(void *)v10;
  v9[8] = v10[8];
  uint64_t v11 = a3[7];
  uint64_t v12 = a3[8];
  uint64_t v13 = &a1[v11];
  uint64_t v14 = &a2[v11];
  *(void *)uint64_t v13 = *(void *)v14;
  v13[8] = v14[8];
  uint64_t v15 = &a1[v12];
  char v16 = &a2[v12];
  if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v16, 1, v6))
  {
    uint64_t v17 = sub_63C4(&qword_41AD0);
    memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    v7(v15, v16, v6);
    _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v15, 0, 1, v6);
  }
  return a1;
}

char *assignWithCopy for ContactImageSizeResolver(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_32CA8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 24);
  v8(a1, a2, v6);
  *(void *)&a1[a3[5]] = *(void *)&a2[a3[5]];
  uint64_t v9 = a3[6];
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  char v12 = v11[8];
  *(void *)uint64_t v10 = *(void *)v11;
  v10[8] = v12;
  uint64_t v13 = a3[7];
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  char v16 = v15[8];
  *(void *)uint64_t v14 = *(void *)v15;
  v14[8] = v16;
  uint64_t v17 = a3[8];
  uint64_t v18 = &a1[v17];
  uint64_t v19 = &a2[v17];
  int v20 = _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)&a1[v17], 1, v6);
  int v21 = _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v19, 1, v6);
  if (!v20)
  {
    if (!v21)
    {
      v8(v18, v19, v6);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v18, v6);
    goto LABEL_6;
  }
  if (v21)
  {
LABEL_6:
    uint64_t v22 = sub_63C4(&qword_41AD0);
    memcpy(v18, v19, *(void *)(*(void *)(v22 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v18, v19, v6);
  _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v18, 0, 1, v6);
  return a1;
}

char *initializeWithTake for ContactImageSizeResolver(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_32CA8();
  uint64_t v7 = *(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  uint64_t v8 = a3[6];
  *(void *)&a1[a3[5]] = *(void *)&a2[a3[5]];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  *(void *)uint64_t v9 = *(void *)v10;
  v9[8] = v10[8];
  uint64_t v11 = a3[7];
  uint64_t v12 = a3[8];
  uint64_t v13 = &a1[v11];
  uint64_t v14 = &a2[v11];
  *(void *)uint64_t v13 = *(void *)v14;
  v13[8] = v14[8];
  uint64_t v15 = &a1[v12];
  char v16 = &a2[v12];
  if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v16, 1, v6))
  {
    uint64_t v17 = sub_63C4(&qword_41AD0);
    memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    v7(v15, v16, v6);
    _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v15, 0, 1, v6);
  }
  return a1;
}

char *assignWithTake for ContactImageSizeResolver(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_32CA8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 40);
  v8(a1, a2, v6);
  uint64_t v9 = a3[6];
  *(void *)&a1[a3[5]] = *(void *)&a2[a3[5]];
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  *(void *)uint64_t v10 = *(void *)v11;
  v10[8] = v11[8];
  uint64_t v12 = a3[7];
  uint64_t v13 = a3[8];
  uint64_t v14 = &a1[v12];
  uint64_t v15 = &a2[v12];
  *(void *)uint64_t v14 = *(void *)v15;
  v14[8] = v15[8];
  char v16 = &a1[v13];
  uint64_t v17 = &a2[v13];
  int v18 = _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)&a1[v13], 1, v6);
  int v19 = _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v17, 1, v6);
  if (!v18)
  {
    if (!v19)
    {
      v8(v16, v17, v6);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v16, v6);
    goto LABEL_6;
  }
  if (v19)
  {
LABEL_6:
    uint64_t v20 = sub_63C4(&qword_41AD0);
    memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v16, v17, v6);
  _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v16, 0, 1, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ContactImageSizeResolver(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1A5E4);
}

uint64_t sub_1A5E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_32CA8();
  sub_EC0C();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    uint64_t v8 = sub_63C4(&qword_41AD0);
    uint64_t v9 = a1 + *(int *)(a3 + 32);
  }

  return _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0(v9, a2, v8);
}

uint64_t storeEnumTagSinglePayload for ContactImageSizeResolver(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1A678);
}

uint64_t sub_1A678(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_32CA8();
  sub_EC0C();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    uint64_t v10 = sub_63C4(&qword_41AD0);
    uint64_t v11 = a1 + *(int *)(a4 + 32);
  }

  return _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v11, a2, a2, v10);
}

void sub_1A700()
{
  sub_32CA8();
  if (v0 <= 0x3F)
  {
    sub_1A7E0();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_1A7E0()
{
  if (!qword_41F58)
  {
    sub_32CA8();
    unint64_t v0 = sub_33D38();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_41F58);
    }
  }
}

uint64_t sub_1A838(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_63C4(&qword_41AD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1A8A0(uint64_t a1)
{
  uint64_t v2 = sub_63C4(&qword_41AD0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1A900(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_32D88();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t sub_1A96C(uint64_t a1)
{
  uint64_t v2 = sub_32D88();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t sub_1A9D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_32D88();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_1AA34(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_32D88();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_1AA98(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_32D88();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_1AAFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_32D88();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_1AB60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1AB74);
}

uint64_t sub_1AB74()
{
  uint64_t v2 = sub_1AF6C();
  return _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0(v1, v0, v2);
}

uint64_t sub_1ABAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1ABC0);
}

uint64_t sub_1ABC0()
{
  uint64_t v2 = sub_1AF6C();
  return _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v1, v0, v0, v2);
}

uint64_t type metadata accessor for ContactImageSourceView(uint64_t a1)
{
  return sub_983C(a1, qword_41FF0);
}

uint64_t sub_1AC1C()
{
  uint64_t result = sub_32D88();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1ACA8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1ACCC()
{
  return sub_33428();
}

uint64_t sub_1ACF0(uint64_t a1)
{
  uint64_t v2 = sub_332F8();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_33438();
}

uint64_t sub_1ADC4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_33348();
  *a1 = result;
  return result;
}

uint64_t sub_1ADF0()
{
  return sub_33358();
}

uint64_t sub_1AE18@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_33388();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_1AE50()
{
  return sub_33398();
}

uint64_t sub_1AE84(unint64_t *a1, void (*a2)(uint64_t))
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

void *sub_1AECC()
{
  return &protocol witness table for AnyView;
}

uint64_t sub_1AED8()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_1AEF4()
{
  return type metadata accessor for ContactImageSizeResolver(0);
}

uint64_t sub_1AF34()
{
  return v0;
}

uint64_t sub_1AF60(uint64_t result)
{
  *(void *)uint64_t v1 = result;
  *(unsigned char *)(v1 + 8) = 0;
  return result;
}

uint64_t sub_1AF6C()
{
  return sub_32D88();
}

uint64_t sub_1AF8C()
{
  return sub_33998();
}

void sub_1AFAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

void sub_1AFC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

void sub_1AFDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

void sub_1AFF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

void sub_1B00C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7)
{
  uint64_t v9 = sub_331B8();
  os_log_type_t v10 = sub_33CA8();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136446210;
    sub_10310(a6, a7, &v12);
    sub_33D48();
    _os_log_impl(&dword_0, v9, v10, "%{public}s", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  sub_33F08();
  __break(1u);
}

uint64_t sub_1B188()
{
  uint64_t v0 = sub_331C8();
  sub_1B33C(v0, qword_44260);
  uint64_t v1 = sub_7150(v0, (uint64_t)qword_44260);
  if (qword_411D0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_7150(v0, (uint64_t)qword_44278);
  char v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t sub_1B250()
{
  sub_1B3A0();
  uint64_t result = sub_33D28();
  qword_42038 = result;
  return result;
}

uint64_t sub_1B2B0()
{
  uint64_t v0 = sub_331C8();
  sub_1B33C(v0, qword_44278);
  sub_7150(v0, (uint64_t)qword_44278);
  if (qword_411C8 != -1) {
    swift_once();
  }
  id v1 = (id)qword_42038;
  return sub_331D8();
}

uint64_t *sub_1B33C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_1B3A0()
{
  unint64_t result = qword_42040[0];
  if (!qword_42040[0])
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, qword_42040);
  }
  return result;
}

void sub_1B3E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7)
{
}

uint64_t sub_1B3EC()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1B468()
{
  swift_beginAccess();
  type metadata accessor for LRUCache.Entry();
  swift_bridgeObjectRetain();
  uint64_t v0 = sub_339E8();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1B52C()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_1B56C()
{
  sub_1B52C();

  return _swift_deallocClassInstance(v0, 81, 7);
}

uint64_t type metadata accessor for LRUCache()
{
  return sub_1C004();
}

uint64_t sub_1B5B8()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      uint64_t result = sub_32B78();
      if (v3 <= 0x3F) {
        return swift_initClassMetadata2();
      }
    }
  }
  return result;
}

uint64_t sub_1B6D0()
{
  unint64_t v1 = *(void **)v0;
  if (*(void *)(v0 + 56))
  {
    uint64_t v2 = v1[10];
    uint64_t v3 = v1[11];
    uint64_t v4 = v1[12];
    type metadata accessor for LRUCache.Entry();
    swift_getWitnessTable();
    sub_33B58();
    uint64_t v5 = (void *)swift_allocObject();
    v5[2] = v2;
    v5[3] = v3;
    v5[4] = v4;
    sub_33E58();
    swift_getWitnessTable();
    sub_33F48();
    swift_release();
    swift_release();
    sub_33EC8();
    swift_getWitnessTable();
    sub_1BF6C();
    uint64_t v6 = sub_33B68();
    unint64_t v8 = v7;
    swift_release();
    swift_release();
  }
  else
  {
    uint64_t v6 = 0;
    unint64_t v8 = 0xE000000000000000;
  }
  uint64_t v9 = HIBYTE(v8) & 0xF;
  if ((v8 & 0x2000000000000000) == 0) {
    uint64_t v9 = v6 & 0xFFFFFFFFFFFFLL;
  }
  if (v9)
  {
    v17._countAndFlagsBits = v6;
    v17._object = (void *)v8;
    sub_33AD8(v17);
    swift_bridgeObjectRelease();
    v18._countAndFlagsBits = 23818;
    v18._object = (void *)0xE200000000000000;
    sub_33AD8(v18);
    os_log_type_t v10 = (void *)0xE400000000000000;
    uint64_t v11 = 538970715;
  }
  else
  {
    swift_bridgeObjectRelease();
    os_log_type_t v10 = (void *)0xE200000000000000;
    uint64_t v11 = 23899;
  }
  sub_33E38(40);
  uint64_t v12 = sub_34028();
  swift_bridgeObjectRelease();
  uint64_t v16 = v12;
  v19._object = (void *)0xEB00000000203A79;
  v19._countAndFlagsBits = 0x7469636170616328;
  sub_33AD8(v19);
  if (*(unsigned char *)(v0 + 80))
  {
    object = (void *)0xE300000000000000;
    v14._countAndFlagsBits = 7104878;
  }
  else
  {
    sub_1BFB8();
    v14._countAndFlagsBits = sub_33D68();
    object = v14._object;
  }
  v14._object = object;
  sub_33AD8(v14);
  swift_bridgeObjectRelease();
  v20._countAndFlagsBits = 0x3A746E756F63202CLL;
  v20._object = (void *)0xE900000000000020;
  sub_33AD8(v20);
  sub_1B468();
  v21._countAndFlagsBits = sub_33F58();
  sub_33AD8(v21);
  swift_bridgeObjectRelease();
  v22._countAndFlagsBits = 0x656972746E65202CLL;
  v22._object = (void *)0xEB00000000203A73;
  sub_33AD8(v22);
  v23._countAndFlagsBits = v11;
  v23._object = v10;
  sub_33AD8(v23);
  swift_bridgeObjectRelease();
  v24._countAndFlagsBits = 41;
  v24._object = (void *)0xE100000000000000;
  sub_33AD8(v24);
  return v16;
}

uint64_t sub_1BA94@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for LRUCache.Entry();
  swift_retain();
  swift_getWitnessTable();
  uint64_t result = sub_33A88();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1BB10()
{
  return sub_1B6D0();
}

uint64_t sub_1BB34()
{
  sub_33F68();
  v1._countAndFlagsBits = 8250;
  v1._object = (void *)0xE200000000000000;
  sub_33AD8(v1);
  sub_33F68();
  return 0;
}

uint64_t sub_1BBEC()
{
  return swift_retain();
}

uint64_t sub_1BBF4()
{
  uint64_t v1 = *v0;
  swift_retain();
  sub_1BC4C(v0);
  return v1;
}

uint64_t sub_1BC4C(uint64_t *a1)
{
  if (*a1) {
    uint64_t Strong = swift_weakLoadStrong();
  }
  else {
    uint64_t Strong = 0;
  }
  *a1 = Strong;

  return swift_release();
}

uint64_t sub_1BCB0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1BBF4();
  *a1 = result;
  return result;
}

uint64_t *sub_1BCD8()
{
  uint64_t v1 = *v0;
  (*(void (**)(uint64_t))(*(void *)(*(void *)(*v0 + 80) - 8) + 8))((uint64_t)v0 + *(void *)(*v0 + 104));
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v1 + 88) - 8) + 8))((uint64_t)v0 + *(void *)(*v0 + 112));
  uint64_t v2 = (uint64_t)v0 + *(void *)(*v0 + 120);
  uint64_t v3 = sub_32B78();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_weakDestroy();
  swift_weakDestroy();
  return v0;
}

uint64_t sub_1BE2C()
{
  uint64_t v0 = sub_1BCD8();
  uint64_t v1 = *(unsigned int *)(*v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t type metadata accessor for LRUCache.Entry()
{
  return sub_1C004();
}

uint64_t sub_1BE98()
{
  return swift_getWitnessTable();
}

uint64_t sub_1BEB4()
{
  return sub_1BB34();
}

uint64_t sub_1BED8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_1BBEC();
  uint64_t result = swift_release();
  *a1 = v2;
  return result;
}

uint64_t sub_1BF1C()
{
  return 2;
}

uint64_t sub_1BF2C()
{
  return sub_33B48();
}

uint64_t sub_1BF50()
{
  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1BF60@<X0>(uint64_t *a1@<X8>)
{
  return sub_1BA94(a1);
}

unint64_t sub_1BF6C()
{
  unint64_t result = qword_42148;
  if (!qword_42148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_42148);
  }
  return result;
}

unint64_t sub_1BFB8()
{
  unint64_t result = qword_42150[0];
  if (!qword_42150[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_42150);
  }
  return result;
}

uint64_t sub_1C004()
{
  return swift_getGenericMetadata();
}

uint64_t sub_1C034(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 32);
}

void *sub_1C03C(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  return a1;
}

uint64_t sub_1C06C()
{
  return swift_release();
}

void *sub_1C074(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  return a1;
}

void *sub_1C0B0(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

void *sub_1C0BC(void *a1, void *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t sub_1C0F0(uint64_t *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 8))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      uint64_t v3 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
        LODWORD(v3) = -1;
      }
      int v2 = v3 - 1;
      if (v2 < 0) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t sub_1C144(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)unint64_t result = a2 - 0x7FFFFFFF;
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

uint64_t type metadata accessor for LRUCache.Entry.Iterator()
{
  return sub_1C004();
}

uint64_t ContactImageView.init(model:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_32C38();
  sub_9370();
  uint64_t v6 = v5;
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v9);
  os_log_type_t v10 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_339B8();
  sub_1C9A0((unint64_t *)&qword_421F0, (void (*)(uint64_t))&type metadata accessor for Context);
  *(void *)a2 = sub_33338();
  *(void *)(a2 + 8) = v11;
  uint64_t v12 = (uint64_t *)(a2 + *(int *)(type metadata accessor for ContactImageView(0) + 24));
  *uint64_t v12 = swift_getKeyPath();
  sub_63C4(&qword_411F0);
  swift_storeEnumTagMultiPayload();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v10, a1, v4);
  unint64_t v13 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v14 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v14 + v13, v10, v4);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, v4);
  *(void *)(a2 + 16) = sub_1C528;
  *(void *)(a2 + 24) = v14;
  *(unsigned char *)(a2 + 32) = 0;
  return result;
}

uint64_t type metadata accessor for ContactImageView(uint64_t a1)
{
  return sub_983C(a1, qword_42278);
}

void sub_1C380(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_1C3F8(uint64_t a1)
{
  sub_32C38();
  sub_9370();
  __chkstk_darwin(v2);
  sub_15C10();
  uint64_t v5 = v4 - v3;
  (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v4 - v3, a1);
  type metadata accessor for ContactImageView.ContactImageLoader(0);
  uint64_t v7 = swift_allocObject();
  sub_1E3B4(v5);
  return v7;
}

uint64_t sub_1C4A4()
{
  sub_32C38();
  sub_EC24();
  v1 += 8;
  uint64_t v2 = *(unsigned __int8 *)(v1 + 72);
  uint64_t v3 = ((v2 + 16) & ~v2) + *(void *)(v1 + 56);
  uint64_t v4 = v2 | 7;
  sub_15C04();
  v5();

  return _swift_deallocObject(v0, v3, v4);
}

uint64_t sub_1C528()
{
  uint64_t v1 = sub_32C38();
  sub_EC34(v1);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));

  return sub_1C3F8(v3);
}

uint64_t ContactImageView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1;
  uint64_t v42 = sub_332C8();
  sub_EC24();
  __chkstk_darwin(v5);
  sub_15C10();
  uint64_t v8 = (char *)(v7 - v6);
  sub_33C28();
  sub_9370();
  uint64_t v44 = v10;
  uint64_t v45 = v9;
  __chkstk_darwin(v9);
  sub_15C10();
  uint64_t v43 = v12 - v11;
  uint64_t v13 = type metadata accessor for ContactImageView(0);
  uint64_t v38 = *(void *)(v13 - 8);
  __chkstk_darwin(v13 - 8);
  uint64_t v39 = v14;
  uint64_t v40 = (uint64_t)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_33748();
  sub_9370();
  uint64_t v17 = v16;
  __chkstk_darwin(v18);
  sub_1AF1C();
  uint64_t v41 = sub_334C8();
  type metadata accessor for ContactImageView.ContactImageLoader(0);
  sub_1C9A0(&qword_42200, (void (*)(uint64_t))type metadata accessor for ContactImageView.ContactImageLoader);
  sub_33298();
  uint64_t v19 = sub_1C9E8();
  swift_release();
  if (v19)
  {
    (*(void (**)(uint64_t, void, uint64_t))(v17 + 104))(v2, enum case for Image.ResizingMode.stretch(_:), v15);
    uint64_t v20 = sub_33768();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v2, v15);
    sub_1CA5C();
    sub_1CA5C();
    sub_33808();
    sub_332A8();
    uint64_t v36 = v47;
    uint64_t v37 = v46;
    uint64_t v35 = v48;
    uint64_t v21 = v49;
    uint64_t v22 = v50;
    uint64_t v23 = v51;
  }
  else
  {
    uint64_t v20 = 0;
    uint64_t v36 = 0;
    uint64_t v37 = 0;
    uint64_t v35 = 0;
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    uint64_t v23 = 0;
  }
  uint64_t v24 = v40;
  sub_1D050(v3, v40, (void (*)(void))type metadata accessor for ContactImageView);
  unint64_t v25 = (*(unsigned __int8 *)(v38 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80);
  uint64_t v26 = swift_allocObject();
  sub_1CF40(v24, v26 + v25);
  uint64_t v27 = v43;
  sub_33C18();
  uint64_t v29 = v44;
  uint64_t v28 = v45;
  (*(void (**)(char *, uint64_t, uint64_t))(v44 + 16))(&v8[*(int *)(v42 + 20)], v27, v45);
  *(void *)uint64_t v8 = &unk_42210;
  *((void *)v8 + 1) = v26;
  uint64_t v30 = sub_63C4(&qword_41BE8);
  sub_1D050((uint64_t)v8, a1 + *(int *)(v30 + 36), (void (*)(void))&type metadata accessor for _TaskModifier);
  *(void *)a1 = v41;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  uint64_t v31 = v37;
  *(void *)(a1 + 24) = v20;
  *(void *)(a1 + 32) = v31;
  uint64_t v32 = v35;
  *(void *)(a1 + 40) = v36;
  *(void *)(a1 + 48) = v32;
  *(void *)(a1 + 56) = v21;
  *(void *)(a1 + 64) = v22;
  *(void *)(a1 + 72) = v23;
  swift_retain();
  sub_1D0B0((uint64_t)v8);
  (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v27, v28);
  return swift_release();
}

uint64_t type metadata accessor for ContactImageView.ContactImageLoader(uint64_t a1)
{
  return sub_983C(a1, qword_42300);
}

uint64_t sub_1C9A0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1C9E8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_33238();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1CA5C()
{
  uint64_t v1 = sub_63C4(&qword_41AD0);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_32CA8();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for ContactImageView(0);
  sub_2BE50();
  if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v3, 1, v4) == 1)
  {
    (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for ImageElement.ImageStyle.default(_:), v4);
    sub_158E8((uint64_t)v3, &qword_41AD0);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v3, v4);
  }
  if (*v0)
  {
    id v8 = *v0;
    sub_32C88();

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  else
  {
    sub_339B8();
    sub_1C9A0((unint64_t *)&qword_421F0, (void (*)(uint64_t))&type metadata accessor for Context);
    uint64_t result = sub_33328();
    __break(1u);
  }
  return result;
}

uint64_t sub_1CC88(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  sub_33C08();
  *(void *)(v1 + 24) = sub_33BF8();
  uint64_t v3 = sub_33BE8();
  return _swift_task_switch(sub_1CD20, v3, v2);
}

uint64_t sub_1CD20()
{
  swift_release();
  type metadata accessor for ContactImageView.ContactImageLoader(0);
  sub_1C9A0(&qword_42200, (void (*)(uint64_t))type metadata accessor for ContactImageView.ContactImageLoader);
  sub_33298();
  sub_1CA5C();
  sub_1D128(v1, v2);
  swift_release();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_1CE08()
{
  double v1 = (int *)(type metadata accessor for ContactImageView(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);

  sub_139F0();
  uint64_t v5 = v0 + v3 + v1[8];
  sub_63C4(&qword_411F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_32CA8();
    if (!_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0(v5, 1, v6))
    {
      sub_15C04();
      v7();
    }
  }
  else
  {
    swift_release();
  }

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_1CF40(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ContactImageView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1CFA4()
{
  uint64_t v2 = type metadata accessor for ContactImageView(0);
  sub_EC34(v2);
  uint64_t v4 = v0 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_BF08;
  return sub_1CC88(v4);
}

uint64_t sub_1D050(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_EC24();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_1D0B0(uint64_t a1)
{
  uint64_t v2 = sub_332C8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1D10C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1D128(double a1, double a2)
{
  uint64_t v4 = v2;
  sub_1ED4C();
  uint64_t v7 = sub_331C8();
  sub_9370();
  uint64_t v9 = v8;
  __chkstk_darwin(v10);
  sub_15C10();
  uint64_t v13 = v12 - v11;
  uint64_t v14 = sub_32C38();
  sub_9370();
  uint64_t v16 = v15;
  __chkstk_darwin(v17);
  sub_1ED60();
  uint64_t v18 = self;
  double v19 = sub_1E530();
  id v20 = objc_msgSend(v18, "scopeWithPointSize:scale:rightToLeft:style:", sub_1E590(), 0, a1, a2, v19);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v3, v2 + OBJC_IVAR____TtCV12SystemPlugin16ContactImageView18ContactImageLoader_model, v14);
  int v21 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 88))(v3, v14);
  if (v21 == enum case for ContactImage.letters(_:))
  {
    uint64_t v22 = sub_1ED78();
    v23(v22);
    if (qword_411E0 != -1) {
      swift_once();
    }
    id v24 = (id)qword_421E8;
    NSString v25 = sub_33A28();
    swift_bridgeObjectRelease();
    uint64_t v26 = swift_allocObject();
    swift_weakInit();
    uint64_t v57 = sub_1EC5C;
    uint64_t v58 = v26;
    long long aBlock = _NSConcreteStackBlock;
    uint64_t v54 = 1107296256;
    uint64_t v55 = sub_1C380;
    uint64_t v56 = &unk_3E400;
    uint64_t v27 = _Block_copy(&aBlock);
    swift_release();
    id v28 = [v24 renderMonogramForString:v25 scope:v20 imageHandler:v27];
    swift_unknownObjectRelease();
    _Block_release(v27);

LABEL_5:
    *(void *)(v4 + OBJC_IVAR____TtCV12SystemPlugin16ContactImageView18ContactImageLoader_cnCancellable) = v28;
    return swift_unknownObjectRelease();
  }
  if (v21 == enum case for ContactImage.contacts(_:))
  {
    uint64_t v29 = sub_1ED78();
    v30(v29);
    uint64_t v31 = self;
    Class isa = sub_33B88().super.isa;
    swift_bridgeObjectRelease();
    id v33 = [v31 predicateForContactsWithIdentifiers:isa];

    sub_63C4((uint64_t *)&unk_423C0);
    uint64_t v34 = swift_allocObject();
    *(_OWORD *)(v34 + 16) = xmmword_34CB0;
    *(void *)(v34 + 32) = [self descriptorForRequiredKeys];
    long long aBlock = (void **)v34;
    sub_33BB8();
    if (qword_411D8 != -1) {
      swift_once();
    }
    id v35 = (id)qword_421E0;
    sub_63C4((uint64_t *)&unk_41C90);
    Class v36 = sub_33B88().super.isa;
    swift_bridgeObjectRelease();
    long long aBlock = 0;
    id v37 = [v35 unifiedContactsMatchingPredicate:v33 keysToFetch:v36 error:&aBlock];

    uint64_t v38 = aBlock;
    if (v37)
    {
      sub_752C(0, (unint64_t *)&qword_423D0);
      unint64_t v39 = sub_33B98();
      if (v39 >> 62)
      {
        uint64_t v51 = v38;
        uint64_t v40 = sub_33F18();
      }
      else
      {
        uint64_t v40 = *(void *)((char *)&dword_10 + (v39 & 0xFFFFFFFFFFFFFF8));
        uint64_t v41 = v38;
      }
      swift_bridgeObjectRelease();
      if (v40)
      {
        if (qword_411E0 != -1) {
          swift_once();
        }
        uint64_t v42 = (void *)qword_421E8;
        uint64_t v43 = swift_allocObject();
        swift_weakInit();
        uint64_t v57 = sub_1EC04;
        uint64_t v58 = v43;
        long long aBlock = _NSConcreteStackBlock;
        uint64_t v54 = 1107296256;
        uint64_t v55 = sub_1C380;
        uint64_t v56 = &unk_3E3D8;
        uint64_t v44 = _Block_copy(&aBlock);
        id v45 = v42;
        swift_release();
        id v28 = [v45 renderAvatarsForContacts:v37 scope:v20 imageHandler:v44];
        swift_unknownObjectRelease();

        _Block_release(v44);
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v50 = aBlock;
      sub_32B28();

      swift_willThrow();
      swift_errorRelease();
    }
    sub_1E5EC(a1, a2);
    sub_1E344();

    return swift_unknownObjectRelease();
  }
  if (v21 == enum case for ContactImage.visual(_:))
  {
    if (qword_411C0 != -1) {
      swift_once();
    }
    uint64_t v52 = sub_7150(v7, (uint64_t)qword_44260);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v13, v52, v7);
    sub_1AFC4((uint64_t)"SystemPlugin/ContactImageView.swift", 35, 2, 128, v13);
  }
  if (qword_411C0 != -1) {
    swift_once();
  }
  sub_7150(v7, (uint64_t)qword_44260);
  uint64_t v46 = sub_331B8();
  os_log_type_t v47 = sub_33C98();
  if (os_log_type_enabled(v46, v47))
  {
    uint64_t v48 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v48 = 0;
    _os_log_impl(&dword_0, v46, v47, "Unknown ContactImage model type", v48, 2u);
    swift_slowDealloc();
  }

  swift_unknownObjectRelease();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 8))(v3, v14);
}

char *initializeBufferWithCopyOfBuffer for ContactImageView(char *a1, char **a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  *(void *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = &v5[(v4 + 16) & ~(unint64_t)v4];
    swift_retain();
  }
  else
  {
    uint64_t v8 = a2[2];
    *((void *)a1 + 1) = a2[1];
    uint64_t v9 = a2[3];
    char v10 = *((unsigned char *)a2 + 32);
    uint64_t v11 = v5;
    sub_137C8();
    *((void *)a1 + 2) = v8;
    *((void *)a1 + 3) = v9;
    a1[32] = v10;
    uint64_t v12 = *(int *)(a3 + 24);
    uint64_t v13 = &a1[v12];
    uint64_t v14 = (char **)((char *)a2 + v12);
    sub_63C4(&qword_411F0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v15 = sub_32CA8();
      if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v14, 1, v15))
      {
        uint64_t v16 = sub_63C4(&qword_41AD0);
        memcpy(v13, v14, *(void *)(*(void *)(v16 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, void *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
        _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v13, 0, 1, v15);
      }
    }
    else
    {
      *(void *)uint64_t v13 = *v14;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for ContactImageView(id *a1, uint64_t a2)
{
  sub_139F0();
  uint64_t v4 = (uint64_t)a1 + *(int *)(a2 + 24);
  sub_63C4(&qword_411F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_32CA8();
    uint64_t result = _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0(v4, 1, v5);
    if (!result)
    {
      uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
      return v7(v4, v5);
    }
  }
  else
  {
    return swift_release();
  }
  return result;
}

uint64_t initializeWithCopy for ContactImageView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a2;
  uint64_t v7 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v7;
  uint64_t v8 = *(void *)(a2 + 16);
  uint64_t v9 = *(void *)(a2 + 24);
  char v10 = *(unsigned char *)(a2 + 32);
  id v11 = v6;
  sub_137C8();
  *(void *)(a1 + 16) = v8;
  *(void *)(a1 + 24) = v9;
  *(unsigned char *)(a1 + 32) = v10;
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (void *)(a2 + v12);
  sub_63C4(&qword_411F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = sub_32CA8();
    if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v14, 1, v15))
    {
      uint64_t v16 = sub_63C4(&qword_41AD0);
      memcpy(v13, v14, *(void *)(*(void *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
      _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v13, 0, 1, v15);
    }
  }
  else
  {
    *uint64_t v13 = *v14;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for ContactImageView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v8 = v7;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v9 = *(void *)(a2 + 16);
  uint64_t v10 = *(void *)(a2 + 24);
  char v11 = *(unsigned char *)(a2 + 32);
  sub_137C8();
  *(void *)(a1 + 16) = v9;
  *(void *)(a1 + 24) = v10;
  *(unsigned char *)(a1 + 32) = v11;
  sub_139F0();
  if (a1 != a2)
  {
    uint64_t v12 = *(int *)(a3 + 24);
    uint64_t v13 = (void *)(a1 + v12);
    uint64_t v14 = (void *)(a2 + v12);
    sub_158E8(a1 + v12, &qword_411F0);
    sub_63C4(&qword_411F0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v15 = sub_32CA8();
      if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v14, 1, v15))
      {
        uint64_t v16 = sub_63C4(&qword_41AD0);
        memcpy(v13, v14, *(void *)(*(void *)(v16 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
        _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v13, 0, 1, v15);
      }
    }
    else
    {
      *uint64_t v13 = *v14;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t initializeWithTake for ContactImageView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v5 = *(int *)(a3 + 24);
  uint64_t v6 = (void *)(a1 + v5);
  uint64_t v7 = (const void *)(a2 + v5);
  uint64_t v8 = sub_63C4(&qword_411F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = sub_32CA8();
    if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v7, 1, v9))
    {
      uint64_t v10 = sub_63C4(&qword_41AD0);
      memcpy(v6, v7, *(void *)(*(void *)(v10 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 32))(v6, v7, v9);
      _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v6, 0, 1, v9);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v6, v7, *(void *)(*(void *)(v8 - 8) + 64));
  }
  return a1;
}

uint64_t assignWithTake for ContactImageView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  uint64_t v7 = *(void *)(a2 + 24);
  char v8 = *(unsigned char *)(a2 + 32);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = v7;
  *(unsigned char *)(a1 + 32) = v8;
  sub_139F0();
  if (a1 != a2)
  {
    uint64_t v9 = *(int *)(a3 + 24);
    uint64_t v10 = (void *)(a1 + v9);
    char v11 = (const void *)(a2 + v9);
    sub_158E8(a1 + v9, &qword_411F0);
    uint64_t v12 = sub_63C4(&qword_411F0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v13 = sub_32CA8();
      if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v11, 1, v13))
      {
        uint64_t v14 = sub_63C4(&qword_41AD0);
        memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, const void *, uint64_t))(*(void *)(v13 - 8) + 32))(v10, v11, v13);
        _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v10, 0, 1, v13);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for ContactImageView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1E124);
}

uint64_t sub_1E124(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = sub_63C4(&qword_41AE0);
    uint64_t v10 = (uint64_t)a1 + *(int *)(a3 + 24);
    return _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0(v10, a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for ContactImageView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1E1D0);
}

void *sub_1E1D0(void *result, uint64_t a2, int a3, uint64_t a4)
{
  int v5 = result;
  if (a3 == 2147483646)
  {
    *uint64_t result = a2;
  }
  else
  {
    uint64_t v7 = sub_63C4(&qword_41AE0);
    uint64_t v8 = (uint64_t)v5 + *(int *)(a4 + 24);
    return (void *)_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v8, a2, a2, v7);
  }
  return result;
}

void sub_1E254()
{
  sub_1EB68(319, (unint64_t *)&qword_41B58, &qword_41AD0, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Environment.Content);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_1E318()
{
  return sub_1E344();
}

uint64_t sub_1E344()
{
  return sub_33248();
}

uint64_t sub_1E3B4(uint64_t a1)
{
  uint64_t v4 = sub_63C4((uint64_t *)&unk_41AC0);
  sub_9370();
  uint64_t v6 = v5;
  __chkstk_darwin(v7);
  sub_1AF1C();
  uint64_t v8 = v1 + OBJC_IVAR____TtCV12SystemPlugin16ContactImageView18ContactImageLoader__image;
  sub_63C4((uint64_t *)&unk_41980);
  sub_33218();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v8, v2, v4);
  *(void *)(v1 + OBJC_IVAR____TtCV12SystemPlugin16ContactImageView18ContactImageLoader_cnCancellable) = 0;
  uint64_t v9 = v1 + OBJC_IVAR____TtCV12SystemPlugin16ContactImageView18ContactImageLoader_model;
  sub_32C38();
  sub_EC24();
  (*(void (**)(uint64_t, uint64_t))(v10 + 32))(v9, a1);
  return v1;
}

id sub_1E4C8()
{
  id result = [objc_allocWithZone((Class)CNContactStore) init];
  qword_421E0 = (uint64_t)result;
  return result;
}

id sub_1E4FC()
{
  id result = [objc_allocWithZone((Class)CNAvatarImageRenderer) init];
  qword_421E8 = (uint64_t)result;
  return result;
}

double sub_1E530()
{
  id v0 = [self currentTraitCollection];
  [v0 displayScale];
  double v2 = v1;

  return v2;
}

BOOL sub_1E590()
{
  id v0 = [self currentTraitCollection];
  double v1 = (char *)[v0 layoutDirection];

  return v1 == (unsigned char *)&dword_0 + 1;
}

uint64_t sub_1E5EC(double a1, double a2)
{
  sub_1ED4C();
  if (qword_411E0 != -1) {
    swift_once();
  }
  id v4 = objc_msgSend(objc_msgSend((id)qword_421E8, "placeholderImageProvider"), "imageForSize:scale:style:", 0, a1, a2, sub_1E530());
  swift_unknownObjectRelease();

  return sub_33728();
}

uint64_t sub_1E6BC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_33818();
  sub_9370();
  __chkstk_darwin(v9);
  sub_1AF1C();
  uint64_t v20 = sub_33838();
  sub_9370();
  uint64_t v11 = v10;
  __chkstk_darwin(v12);
  sub_1ED60();
  sub_752C(0, (unint64_t *)&qword_41370);
  uint64_t v13 = (void *)sub_33CB8();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a2;
  *(void *)(v14 + 24) = a1;
  aBlock[4] = a4;
  aBlock[5] = v14;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_630C;
  aBlock[3] = a5;
  uint64_t v15 = _Block_copy(aBlock);
  swift_retain();
  id v16 = a1;
  swift_release();
  sub_33828();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_1C9A0((unint64_t *)&unk_41EB0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_63C4((uint64_t *)&unk_41380);
  sub_EAD4((unint64_t *)&qword_41EC0, (uint64_t *)&unk_41380);
  sub_33D78();
  sub_33CC8();
  _Block_release(v15);

  sub_15C04();
  v17();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8))(v5, v20);
}

uint64_t sub_1E92C(uint64_t a1, void *a2)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    id v4 = a2;
    sub_33728();
    sub_1E344();
    return swift_release();
  }
  return result;
}

uint64_t sub_1E990()
{
  sub_63C4((uint64_t *)&unk_41AC0);
  sub_EC24();
  sub_15C04();
  v1();
  sub_32C38();
  sub_EC24();
  sub_15C04();
  v2();
  swift_unknownObjectRelease();
  return v0;
}

uint64_t sub_1EA34()
{
  sub_1E990();
  sub_1ED4C();
  uint64_t v2 = *(unsigned int *)(v1 + 48);
  uint64_t v3 = *(unsigned __int16 *)(v1 + 52);

  return _swift_deallocClassInstance(v0, v2, v3);
}

uint64_t sub_1EA6C()
{
  return type metadata accessor for ContactImageView.ContactImageLoader(0);
}

void sub_1EA74()
{
  sub_1EB68(319, qword_41D30, (uint64_t *)&unk_41980, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Published);
  if (v0 <= 0x3F)
  {
    sub_32C38();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_1EB68(uint64_t a1, unint64_t *a2, uint64_t *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = sub_6728(a3);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_1EBCC()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1EC04(void *a1)
{
  return sub_1E6BC(a1, v1, (uint64_t)&unk_3E488, (uint64_t)sub_1ECE4, (uint64_t)&unk_3E4A0);
}

uint64_t sub_1EC44(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1EC54()
{
  return swift_release();
}

uint64_t sub_1EC5C(void *a1)
{
  return sub_1E6BC(a1, v1, (uint64_t)&unk_3E438, (uint64_t)sub_1ED30, (uint64_t)&unk_3E450);
}

uint64_t sub_1ECA4()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1ECE4()
{
  return sub_1E92C(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_1ED00@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1C9E8();
  *a1 = result;
  return result;
}

uint64_t sub_1ED78()
{
  return v0;
}

uint64_t MapsPlaceCardView.init(model:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_32FA8();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32);

  return v5(a2, a1, v4);
}

uint64_t MapsPlaceCardView.body.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_32F98();
  uint64_t v4 = v3;
  uint64_t result = sub_32F88();
  *a1 = v2;
  a1[1] = v4;
  a1[2] = result;
  return result;
}

uint64_t sub_1EE3C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t initializeBufferWithCopyOfBuffer for MapsPlaceCardView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_32FA8();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t destroy for MapsPlaceCardView(uint64_t a1)
{
  uint64_t v2 = sub_32FA8();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t initializeWithCopy for MapsPlaceCardView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_32FA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for MapsPlaceCardView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_32FA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for MapsPlaceCardView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_32FA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for MapsPlaceCardView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_32FA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for MapsPlaceCardView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1F0D0);
}

uint64_t sub_1F0D0()
{
  uint64_t v2 = sub_1F9A4();
  return _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0(v1, v0, v2);
}

uint64_t storeEnumTagSinglePayload for MapsPlaceCardView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1F11C);
}

uint64_t sub_1F11C()
{
  uint64_t v2 = sub_1F9A4();
  return _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v1, v0, v0, v2);
}

uint64_t type metadata accessor for MapsPlaceCardView()
{
  uint64_t result = qword_42430;
  if (!qword_42430) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1F1A0()
{
  uint64_t result = sub_32FA8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

id sub_1F22C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  id v7 = [objc_allocWithZone((Class)MUPlaceViewControllerConfiguration) init];
  [v7 setOptions:a4];
  unint64_t v8 = (objc_class *)type metadata accessor for MapView();
  v16.receiver = objc_allocWithZone(v8);
  v16.super_class = v8;
  id v9 = objc_msgSendSuper2(&v16, "initWithConfiguration:", v7);
  id result = [v9 view];
  if (result)
  {
    uint64_t v11 = result;
    id v12 = [self clearColor];
    [v11 setBackgroundColor:v12];

    sub_1F94C();
    sub_103E4(a2, a3);
    id v13 = sub_1F388(a2, a3);
    if (v13)
    {
      id v14 = v13;
      id v15 = v9;
      [v15 setMapItem:v14];
    }
    return v9;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_1F388(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 == 15)
  {
    Class isa = 0;
  }
  else
  {
    Class isa = sub_32B38().super.isa;
    sub_1F98C(a1, a2);
  }
  id v5 = [(id)swift_getObjCClassFromMetadata() mapItemWithSerializedPlaceData:isa];

  return v5;
}

id sub_1F408(uint64_t a1)
{
  return sub_1F22C(a1, *(void *)v1, *(void *)(v1 + 8), *(void *)(v1 + 16));
}

uint64_t sub_1F414(uint64_t a1, uint64_t a2)
{
  return CoreChartPluginView.body.getter(a1, a2, *v2, v2[1], v2[2]);
}

uint64_t sub_1F42C()
{
  return sub_33538();
}

uint64_t sub_1F468(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1F900();

  return static UIViewControllerRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_1F4CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1F900();

  return static UIViewControllerRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_1F530()
{
}

id sub_1F59C()
{
  v4.receiver = v0;
  v4.super_class = (Class)swift_getObjectType();
  LODWORD(v1) = 1148846080;
  LODWORD(v2) = 1112014848;
  return objc_msgSendSuper2(&v4, "_systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", 0.0, 0.0, v1, v2);
}

void sub_1F610()
{
}

void sub_1F670()
{
}

uint64_t type metadata accessor for MapView()
{
  return self;
}

unint64_t sub_1F6F0()
{
  unint64_t result = qword_42490;
  if (!qword_42490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_42490);
  }
  return result;
}

uint64_t destroy for MapUIView(uint64_t a1)
{
  return sub_1043C(*(void *)a1, *(void *)(a1 + 8));
}

uint64_t *_s12SystemPlugin9MapUIViewVwCP_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  sub_103E4(*a2, v5);
  *a1 = v4;
  a1[1] = v5;
  a1[2] = a2[2];
  return a1;
}

uint64_t *assignWithCopy for MapUIView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  sub_103E4(*a2, v5);
  uint64_t v6 = *a1;
  unint64_t v7 = a1[1];
  *a1 = v4;
  a1[1] = v5;
  sub_1043C(v6, v7);
  a1[2] = a2[2];
  return a1;
}

__n128 initializeWithTake for MapUIView(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t *assignWithTake for MapUIView(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  unint64_t v5 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_1043C(v4, v5);
  a1[2] = *(void *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for MapUIView(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xD && *(unsigned char *)(a1 + 24))
    {
      unsigned int v2 = *(_DWORD *)a1 + 12;
    }
    else
    {
      unsigned int v2 = (((*(void *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(void *)(a1 + 8) >> 60) & 3))) ^ 0xF;
      if (v2 >= 0xC) {
        unsigned int v2 = -1;
      }
    }
  }
  else
  {
    unsigned int v2 = -1;
  }
  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for MapUIView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 13;
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2)
    {
      *(void *)__n128 result = 0;
      *(void *)(result + 8) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MapUIView()
{
  return &type metadata for MapUIView;
}

void *sub_1F8F4()
{
  return &protocol witness table for Never;
}

unint64_t sub_1F900()
{
  unint64_t result = qword_42498;
  if (!qword_42498)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_42498);
  }
  return result;
}

unint64_t sub_1F94C()
{
  unint64_t result = qword_424A0;
  if (!qword_424A0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_424A0);
  }
  return result;
}

uint64_t sub_1F98C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1043C(a1, a2);
  }
  return a1;
}

uint64_t sub_1F9A4()
{
  return sub_32FA8();
}

ValueMetadata *type metadata accessor for IntentsUIRemoteView()
{
  return &type metadata for IntentsUIRemoteView;
}

id sub_1F9D8()
{
  return *v0;
}

uint64_t sub_1F9E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1FB20();

  return static UIViewControllerRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_1FA44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1FB20();

  return static UIViewControllerRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_1FAA8()
{
}

unint64_t sub_1FAD4()
{
  unint64_t result = qword_424A8;
  if (!qword_424A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_424A8);
  }
  return result;
}

unint64_t sub_1FB20()
{
  unint64_t result = qword_424B0;
  if (!qword_424B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_424B0);
  }
  return result;
}

uint64_t AppIconView.init(appIcon:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1FBC4(a1, (void (*)(void))&type metadata accessor for ImageElement.AppIcon, a2);
}

uint64_t type metadata accessor for AppIconView(uint64_t a1)
{
  return sub_983C(a1, qword_42518);
}

uint64_t AppIconView.init(visualProperty:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1FBC4(a1, (void (*)(void))&type metadata accessor for VisualProperty, a2);
}

uint64_t sub_1FBC4@<X0>(uint64_t a1@<X0>, void (*a2)(void)@<X1>, uint64_t a3@<X8>)
{
  unint64_t v6 = (int *)type metadata accessor for AppIconView(0);
  unint64_t v7 = (uint64_t *)(a3 + v6[5]);
  sub_339B8();
  sub_24460((unint64_t *)&qword_421F0, (void (*)(uint64_t))&type metadata accessor for Context);
  uint64_t *v7 = sub_33338();
  v7[1] = v8;
  id v9 = (uint64_t *)(a3 + v6[6]);
  *id v9 = swift_getKeyPath();
  sub_63C4(&qword_411F0);
  swift_storeEnumTagMultiPayload();
  uint64_t v10 = a3 + v6[7];
  *(void *)uint64_t v10 = swift_getKeyPath();
  *(unsigned char *)(v10 + 8) = 0;
  uint64_t v11 = v6[8];
  sub_63C4((uint64_t *)&unk_41980);
  sub_24620();
  *(_OWORD *)(a3 + v11) = v14;
  a2(0);
  sub_EC24();
  (*(void (**)(uint64_t, uint64_t))(v12 + 32))(a3, a1);
  type metadata accessor for AppIconView.Model(0);
  return swift_storeEnumTagMultiPayload();
}

uint64_t AppIconView.init(modelData:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v31 = type metadata accessor for AppIconView.Model(0);
  sub_EC24();
  __chkstk_darwin(v6);
  sub_EC48();
  uint64_t v26 = v7;
  uint64_t v8 = sub_63C4(&qword_424B8);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_32CE8();
  uint64_t v28 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  sub_EC48();
  uint64_t v27 = v12;
  id v13 = (int *)type metadata accessor for AppIconView(0);
  long long v14 = (uint64_t *)(a3 + v13[5]);
  sub_339B8();
  sub_24460((unint64_t *)&qword_421F0, (void (*)(uint64_t))&type metadata accessor for Context);
  uint64_t *v14 = sub_33338();
  v14[1] = v15;
  uint64_t v30 = v14;
  objc_super v16 = (uint64_t *)(a3 + v13[6]);
  uint64_t *v16 = swift_getKeyPath();
  sub_63C4(&qword_411F0);
  swift_storeEnumTagMultiPayload();
  uint64_t v17 = a3 + v13[7];
  *(void *)uint64_t v17 = swift_getKeyPath();
  *(unsigned char *)(v17 + 8) = 0;
  uint64_t v18 = (_OWORD *)(a3 + v13[8]);
  uint64_t v34 = 0;
  sub_63C4((uint64_t *)&unk_41980);
  sub_33778();
  uint64_t v29 = v18;
  _OWORD *v18 = v33;
  sub_103E4(a1, a2);
  uint64_t v19 = v32;
  sub_32CC8();
  if (v19)
  {
    swift_errorRelease();
    _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v10, 1, 1, v11);
    sub_244E8((uint64_t)v10, &qword_424B8);
    sub_32B18();
    swift_allocObject();
    sub_32B08();
    sub_32AF8();
    sub_1043C(a1, a2);
    swift_release();
    uint64_t v22 = *((void *)&v33 + 1);
    uint64_t v23 = v26;
    void *v26 = v33;
    v23[1] = v22;
    swift_storeEnumTagMultiPayload();
    return sub_23D40();
  }
  else
  {
    _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v10, 0, 1, v11);
    sub_1043C(a1, a2);
    uint64_t v20 = v27;
    int v21 = *(void (**)(uint64_t, char *, uint64_t))(v28 + 32);
    v21((uint64_t)v27, v10, v11);
    v21(a3, v20, v11);
    return swift_storeEnumTagMultiPayload();
  }
}

uint64_t sub_20114@<X0>(char a1@<W0>, uint64_t a2@<X1>, void *a3@<X8>, double a4@<D0>)
{
  uint64_t v8 = sub_63C4(&qword_41E70);
  uint64_t v9 = v8 - 8;
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_33308();
  uint64_t v13 = __chkstk_darwin(v12 - 8);
  uint64_t v15 = (double *)((char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  objc_super v16 = (char *)v15 + *(int *)(v13 + 28);
  uint64_t v17 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v18 = sub_334B8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v18 - 8) + 104))(v16, v17, v18);
  double *v15 = a4;
  v15[1] = a4;
  sub_23B0C();
  uint64_t v19 = &v11[*(int *)(v9 + 44)];
  *uint64_t v19 = 0;
  v19[1] = a1;
  uint64_t v20 = sub_63C4(&qword_42698);
  sub_24594((uint64_t)v11, (uint64_t)a3 + *(int *)(v20 + 36), &qword_41E70);
  *a3 = a2;
  swift_retain();
  sub_244E8((uint64_t)v11, &qword_41E70);
  return sub_2453C((uint64_t)v15, (void (*)(void))&type metadata accessor for RoundedRectangle);
}

uint64_t sub_202D8(uint64_t a1, double a2)
{
  *(double *)(v2 + 32) = a2;
  *(void *)(v2 + 24) = a1;
  uint64_t v4 = swift_task_alloc();
  *(void *)(v2 + 40) = v4;
  *(double *)(v4 + 16) = a2;
  return _swift_task_switch(sub_20354, 0, 0);
}

uint64_t sub_20354()
{
  sub_15C50();
  sub_33C08();
  *(void *)(v0 + 48) = sub_33BF8();
  uint64_t v2 = sub_33BE8();
  return _swift_task_switch(sub_203E4, v2, v1);
}

uint64_t sub_203E4()
{
  double v1 = *((double *)v0 + 4);
  uint64_t v2 = (void *)v0[3];
  swift_release();
  sub_242CC(v2, v0 + 2, v1);

  uint64_t v3 = v0[2];
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(uint64_t))v0[1];
  return v4(v3);
}

uint64_t sub_204D0()
{
  return sub_333A8();
}

uint64_t sub_204F4()
{
  return sub_333A8();
}

uint64_t sub_20518(uint64_t a1)
{
  uint64_t v2 = sub_63C4(&qword_41AD0);
  __chkstk_darwin(v2 - 8);
  sub_24594(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_41AD0);
  return sub_333B8();
}

uint64_t sub_205B0@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_333E8();
  *a1 = v3;
  return result;
}

uint64_t sub_205DC@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_333E8();
  *a1 = v3;
  return result;
}

uint64_t sub_20608()
{
  return sub_333F8();
}

uint64_t sub_20630()
{
  return sub_333F8();
}

uint64_t type metadata accessor for AppIconView.Model(uint64_t a1)
{
  return sub_983C(a1, qword_425D0);
}

uint64_t property wrapper backing initializer of AppIconView.appIconImage()
{
  sub_63C4((uint64_t *)&unk_41980);
  sub_24620();
  return v1;
}

uint64_t AppIconView.init(applicationBundleIdentifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v6 = (int *)type metadata accessor for AppIconView(0);
  unint64_t v7 = (void *)((char *)a3 + v6[5]);
  sub_339B8();
  sub_24460((unint64_t *)&qword_421F0, (void (*)(uint64_t))&type metadata accessor for Context);
  uint64_t *v7 = sub_33338();
  v7[1] = v8;
  uint64_t v9 = (void *)((char *)a3 + v6[6]);
  *uint64_t v9 = swift_getKeyPath();
  sub_63C4(&qword_411F0);
  swift_storeEnumTagMultiPayload();
  uint64_t v10 = (char *)a3 + v6[7];
  *(void *)uint64_t v10 = swift_getKeyPath();
  v10[8] = 0;
  uint64_t v11 = v6[8];
  sub_63C4((uint64_t *)&unk_41980);
  sub_24620();
  *(_OWORD *)((char *)a3 + v11) = v13;
  *a3 = a1;
  a3[1] = a2;
  type metadata accessor for AppIconView.Model(0);
  return swift_storeEnumTagMultiPayload();
}

uint64_t AppIconView.body.getter@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_20814(&v3);
  *a1 = v3;
  return result;
}

uint64_t sub_20814@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v26 = a1;
  uint64_t v25 = sub_63C4(&qword_42608);
  __chkstk_darwin(v25);
  uint64_t v1 = sub_32E88();
  uint64_t v23 = *(void *)(v1 - 8);
  uint64_t v24 = v1;
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_32CE8();
  uint64_t v22 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_63C4(&qword_42610);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for AppIconView.Model(0);
  __chkstk_darwin(v10);
  uint64_t v12 = (uint64_t *)((char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_23B0C();
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v14 = v22;
      (*(void (**)(char *, uint64_t *, uint64_t))(v22 + 32))(v6, v12, v4);
      uint64_t v15 = sub_32CD8();
      sub_20BBC(v15, v16, (uint64_t)v9);
      swift_bridgeObjectRelease();
      sub_2391C();
      uint64_t v17 = sub_337C8();
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v6, v4);
    }
    else
    {
      uint64_t v20 = v23;
      uint64_t v19 = v24;
      (*(void (**)(char *, uint64_t *, uint64_t))(v23 + 32))(v3, v12, v24);
      sub_32E78();
      swift_getOpaqueTypeConformance2();
      uint64_t v17 = sub_337C8();
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v3, v19);
    }
  }
  else
  {
    sub_20BBC(*v12, v12[1], (uint64_t)v9);
    swift_bridgeObjectRelease();
    sub_2391C();
    uint64_t result = sub_337C8();
    uint64_t v17 = result;
  }
  uint64_t *v26 = v17;
  return result;
}

uint64_t sub_20BA0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20BBC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v38 = a1;
  uint64_t v39 = a2;
  uint64_t v5 = sub_33C28();
  uint64_t v41 = *(void *)(v5 - 8);
  uint64_t v42 = v5;
  __chkstk_darwin(v5);
  uint64_t v40 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for AppIconView(0);
  uint64_t v36 = *(void *)(v7 - 8);
  uint64_t v8 = *(void *)(v36 + 64);
  __chkstk_darwin(v7 - 8);
  id v37 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_63C4(&qword_42648);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_63C4(&qword_42638);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_63C4(&qword_42628);
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v35 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_20FFC();
  if (v20)
  {
    return _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(a3, 1, 1, v15);
  }
  else
  {
    uint64_t v21 = v18;
    uint64_t v22 = v19;
    *(void *)uint64_t v11 = sub_334C8();
    *((void *)v11 + 1) = 0;
    v11[16] = 1;
    uint64_t v23 = sub_63C4(&qword_42650);
    sub_21210(v3, (uint64_t)&v11[*(int *)(v23 + 44)]);
    sub_33808();
    sub_332A8();
    uint64_t v35 = a3;
    sub_24594((uint64_t)v11, (uint64_t)v14, &qword_42648);
    uint64_t v24 = &v14[*(int *)(v12 + 36)];
    long long v25 = v44;
    *(_OWORD *)uint64_t v24 = v43;
    *((_OWORD *)v24 + 1) = v25;
    *((_OWORD *)v24 + 2) = v45;
    sub_244E8((uint64_t)v11, &qword_42648);
    sub_23B0C();
    uint64_t v26 = (void *)swift_allocObject();
    uint64_t v27 = v39;
    v26[2] = v38;
    v26[3] = v27;
    v26[4] = v21;
    v26[5] = v22;
    sub_23D40();
    swift_bridgeObjectRetain();
    uint64_t v28 = v40;
    sub_33C18();
    uint64_t v29 = &v17[*(int *)(v15 + 36)];
    uint64_t v30 = sub_332C8();
    uint64_t v32 = v41;
    uint64_t v31 = v42;
    (*(void (**)(char *, char *, uint64_t))(v41 + 16))(&v29[*(int *)(v30 + 20)], v28, v42);
    *(void *)uint64_t v29 = &unk_42660;
    *((void *)v29 + 1) = v26;
    sub_24594((uint64_t)v14, (uint64_t)v17, &qword_42638);
    (*(void (**)(char *, uint64_t))(v32 + 8))(v28, v31);
    sub_244E8((uint64_t)v14, &qword_42638);
    uint64_t v33 = v35;
    sub_244A8((uint64_t)v17, v35, &qword_42628);
    return _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v33, 0, 1, v15);
  }
}

uint64_t sub_20FFC()
{
  uint64_t v1 = sub_63C4(&qword_41AD0);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_32CA8();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C04((uint64_t)v3);
  if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v3, 1, v4) == 1)
  {
    sub_244E8((uint64_t)v3, &qword_41AD0);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v3, v4);
    uint64_t v9 = *(void **)(v0 + *(int *)(type metadata accessor for AppIconView(0) + 20));
    if (v9)
    {
      id v10 = v9;
      sub_32C88();
      uint64_t v12 = v11;

      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      return v12;
    }
    else
    {
      sub_339B8();
      sub_24460((unint64_t *)&qword_421F0, (void (*)(uint64_t))&type metadata accessor for Context);
      uint64_t result = sub_33328();
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_21210@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_33748();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_63C4(&qword_42690);
  __chkstk_darwin(v8 - 8);
  id v10 = (void *)((char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  long long v16 = *(_OWORD *)(a1 + *(int *)(type metadata accessor for AppIconView(0) + 32));
  sub_63C4(&qword_42678);
  sub_33788();
  if (v17)
  {
    (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for Image.ResizingMode.stretch(_:), v4);
    uint64_t v11 = sub_33768();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    sub_21410();
    sub_20114(1, v11, v10, v12);
    swift_release();
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v13 = 1;
  }
  uint64_t v14 = sub_63C4(&qword_42698);
  _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v10, v13, 1, v14);
  return sub_244A8((uint64_t)v10, a2, &qword_42690);
}

uint64_t sub_21410()
{
  uint64_t v1 = sub_63C4(&qword_41AD0);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_32CA8();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C04((uint64_t)v3);
  if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v3, 1, v4) == 1) {
    return sub_244E8((uint64_t)v3, &qword_41AD0);
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v3, v4);
  uint64_t v9 = *(void **)(v0 + *(int *)(type metadata accessor for AppIconView(0) + 20));
  if (v9)
  {
    id v10 = v9;
    sub_32C78();

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  else
  {
    sub_339B8();
    sub_24460((unint64_t *)&qword_421F0, (void (*)(uint64_t))&type metadata accessor for Context);
    uint64_t result = sub_33328();
    __break(1u);
  }
  return result;
}

uint64_t sub_2160C(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  *(void *)(v5 + 72) = a3;
  *(double *)(v5 + 56) = a4;
  *(double *)(v5 + 64) = a5;
  *(void *)(v5 + 40) = a1;
  *(void *)(v5 + 48) = a2;
  sub_33C08();
  *(void *)(v5 + 80) = sub_33BF8();
  uint64_t v7 = sub_33BE8();
  *(void *)(v5 + 88) = v7;
  *(void *)(v5 + 96) = v6;
  return _swift_task_switch(sub_216AC, v7, v6);
}

uint64_t sub_216AC()
{
  sub_15C50();
  uint64_t v1 = *(void *)(v0 + 72);
  *(unsigned char *)(v0 + 144) = sub_21A10() & 1;
  uint64_t v2 = type metadata accessor for AppIconView(0);
  *(void *)(v0 + 104) = v2;
  uint64_t v3 = v1 + *(int *)(v2 + 28);
  uint64_t v4 = *(void *)v3;
  char v5 = *(unsigned char *)(v3 + 8);
  sub_137D0(*(void *)v3, v5);
  sub_2BE7C();
  *(void *)(v0 + 112) = v6;
  sub_139F8(v4, v5);
  return _swift_task_switch(sub_2175C, 0, 0);
}

uint64_t sub_2175C()
{
  sub_24420();
  swift_bridgeObjectRetain();
  id v1 = sub_23F48();
  *(void *)(v0 + 120) = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 128) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_21838;
  double v3 = *(double *)(v0 + 112);
  char v4 = *(unsigned char *)(v0 + 144);
  double v5 = *(double *)(v0 + 56);
  double v6 = *(double *)(v0 + 64);
  return sub_23FBC(v4, (uint64_t)v1, v5, v6, v3, v3);
}

uint64_t sub_21838()
{
  sub_15C50();
  sub_245D4();
  *(void *)(v1 + 136) = v0;
  swift_task_dealloc();
  return _swift_task_switch(sub_21910, 0, 0);
}

uint64_t sub_21910()
{
  sub_15C50();

  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v2 = *(void *)(v0 + 96);
  return _swift_task_switch(sub_21970, v1, v2);
}

uint64_t sub_21970()
{
  uint64_t v1 = *(void *)(v0 + 136);
  uint64_t v2 = *(void *)(v0 + 104);
  uint64_t v3 = *(void *)(v0 + 72);
  swift_release();
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v3 + *(int *)(v2 + 32));
  *(void *)(v0 + 32) = v1;
  sub_63C4(&qword_42678);
  sub_33798();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_21A10()
{
  uint64_t v1 = sub_63C4(&qword_41AD0);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_32CA8();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C04((uint64_t)v3);
  if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v3, 1, v4) == 1)
  {
    sub_244E8((uint64_t)v3, &qword_41AD0);
    char v8 = 0;
    return v8 & 1;
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v3, v4);
  uint64_t v9 = *(void **)(v0 + *(int *)(type metadata accessor for AppIconView(0) + 20));
  if (v9)
  {
    id v10 = v9;
    char v8 = sub_32C68();

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v8 & 1;
  }
  sub_339B8();
  sub_24460((unint64_t *)&qword_421F0, (void (*)(uint64_t))&type metadata accessor for Context);
  uint64_t result = sub_33328();
  __break(1u);
  return result;
}

uint64_t sub_21C04@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v33 = a1;
  uint64_t v3 = sub_63C4(&qword_41AD0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_32CA8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  id v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v30 - v11;
  uint64_t v31 = sub_32CE8();
  uint64_t v13 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for AppIconView.Model(0);
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)&v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = v2;
  sub_23B0C();
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload != 1)
    {
      _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v33, 1, 1, v6);
      return sub_2453C((uint64_t)v18, (void (*)(void))type metadata accessor for AppIconView.Model);
    }
    uint64_t v20 = v13;
    uint64_t v21 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
    uint64_t v22 = v31;
    v21(v15, v18, v31);
    sub_32CB8();
    (*(void (**)(char *, void, uint64_t))(v7 + 104))(v10, enum case for ImageElement.ImageStyle.default(_:), v6);
    sub_24460(&qword_42688, (void (*)(uint64_t))&type metadata accessor for ImageElement.ImageStyle);
    char v23 = sub_33A18();
    uint64_t v24 = *(void (**)(char *, uint64_t))(v7 + 8);
    v24(v10, v6);
    v24(v12, v6);
    if (v23)
    {
      type metadata accessor for AppIconView(0);
      sub_2BE50();
      return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v15, v22);
    }
    uint64_t v28 = v33;
    sub_32CB8();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v15, v22);
    uint64_t v29 = v28;
  }
  else
  {
    sub_2453C((uint64_t)v18, (void (*)(void))type metadata accessor for AppIconView.Model);
    type metadata accessor for AppIconView(0);
    sub_2BE50();
    int v26 = _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v5, 1, v6);
    uint64_t v27 = v33;
    if (v26 == 1)
    {
      (*(void (**)(uint64_t, void, uint64_t))(v7 + 104))(v33, enum case for ImageElement.ImageStyle.appIcon2(_:), v6);
      sub_244E8((uint64_t)v5, &qword_41AD0);
    }
    else
    {
      (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v33, v5, v6);
    }
    uint64_t v29 = v27;
  }
  return _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v29, 0, 1, v6);
}

uint64_t *initializeBufferWithCopyOfBuffer for AppIconView(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    uint64_t v4 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    type metadata accessor for AppIconView.Model(0);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v10 = sub_32E88();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v10 - 8) + 16))(v4, a2, v10);
    }
    else if (EnumCaseMultiPayload == 1)
    {
      uint64_t v8 = sub_32CE8();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v8 - 8) + 16))(v4, a2, v8);
    }
    else
    {
      uint64_t v11 = a2[1];
      uint64_t *v4 = *a2;
      v4[1] = v11;
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v12 = a3[5];
    uint64_t v13 = a3[6];
    uint64_t v14 = (uint64_t *)((char *)v4 + v12);
    uint64_t v15 = (char *)a2 + v12;
    uint64_t v17 = *(void **)v15;
    uint64_t v16 = *((void *)v15 + 1);
    void *v14 = v17;
    v14[1] = v16;
    uint64_t v18 = (uint64_t *)((char *)v4 + v13);
    uint64_t v19 = (uint64_t *)((char *)a2 + v13);
    id v20 = v17;
    sub_63C4(&qword_411F0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v21 = sub_32CA8();
      if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v19, 1, v21))
      {
        uint64_t v22 = sub_63C4(&qword_41AD0);
        memcpy(v18, v19, *(void *)(*(void *)(v22 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v21 - 8) + 16))(v18, v19, v21);
        _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v18, 0, 1, v21);
      }
    }
    else
    {
      void *v18 = *v19;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v23 = a3[7];
    uint64_t v24 = (char *)v4 + v23;
    long long v25 = (char *)a2 + v23;
    uint64_t v26 = *(void *)v25;
    char v27 = v25[8];
    sub_137D0(*(void *)v25, v27);
    *(void *)uint64_t v24 = v26;
    v24[8] = v27;
    uint64_t v28 = a3[8];
    uint64_t v29 = (uint64_t *)((char *)v4 + v28);
    uint64_t v30 = (uint64_t *)((char *)a2 + v28);
    uint64_t v31 = v30[1];
    *uint64_t v29 = *v30;
    v29[1] = v31;
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t destroy for AppIconView(uint64_t a1, int *a2)
{
  type metadata accessor for AppIconView.Model(0);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 2:
      uint64_t v5 = sub_32E88();
LABEL_7:
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
      break;
    case 1:
      uint64_t v5 = sub_32CE8();
      goto LABEL_7;
    case 0:
      swift_bridgeObjectRelease();
      break;
  }

  uint64_t v6 = a1 + a2[6];
  sub_63C4(&qword_411F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_32CA8();
    if (!_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0(v6, 1, v7)) {
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
    }
  }
  else
  {
    swift_release();
  }
  sub_139F8(*(void *)(a1 + a2[7]), *(unsigned char *)(a1 + a2[7] + 8));
  swift_release();

  return swift_release();
}

void *initializeWithCopy for AppIconView(void *a1, void *a2, int *a3)
{
  type metadata accessor for AppIconView.Model(0);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    uint64_t v8 = sub_32E88();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
  }
  else if (EnumCaseMultiPayload == 1)
  {
    uint64_t v7 = sub_32CE8();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
  }
  else
  {
    uint64_t v9 = a2[1];
    *a1 = *a2;
    a1[1] = v9;
    swift_bridgeObjectRetain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v10 = a3[5];
  uint64_t v11 = a3[6];
  uint64_t v12 = (void *)((char *)a1 + v10);
  uint64_t v13 = (char *)a2 + v10;
  uint64_t v15 = *(void **)v13;
  uint64_t v14 = *((void *)v13 + 1);
  *uint64_t v12 = v15;
  v12[1] = v14;
  uint64_t v16 = (void *)((char *)a1 + v11);
  uint64_t v17 = (void *)((char *)a2 + v11);
  id v18 = v15;
  sub_63C4(&qword_411F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v19 = sub_32CA8();
    if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v17, 1, v19))
    {
      uint64_t v20 = sub_63C4(&qword_41AD0);
      memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v19 - 8) + 16))(v16, v17, v19);
      _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v16, 0, 1, v19);
    }
  }
  else
  {
    void *v16 = *v17;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v21 = a3[7];
  uint64_t v22 = (char *)a1 + v21;
  uint64_t v23 = (char *)a2 + v21;
  uint64_t v24 = *(void *)v23;
  char v25 = v23[8];
  sub_137D0(*(void *)v23, v25);
  *(void *)uint64_t v22 = v24;
  v22[8] = v25;
  uint64_t v26 = a3[8];
  char v27 = (void *)((char *)a1 + v26);
  uint64_t v28 = (void *)((char *)a2 + v26);
  uint64_t v29 = v28[1];
  *char v27 = *v28;
  v27[1] = v29;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for AppIconView(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_2453C((uint64_t)a1, (void (*)(void))type metadata accessor for AppIconView.Model);
    type metadata accessor for AppIconView.Model(0);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v8 = sub_32E88();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
    }
    else if (EnumCaseMultiPayload == 1)
    {
      uint64_t v7 = sub_32CE8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v9 = a3[5];
  uint64_t v10 = (void *)((char *)a1 + v9);
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = *(void **)((char *)a1 + v9);
  uint64_t v13 = *(void **)((char *)a2 + v9);
  *uint64_t v10 = v13;
  id v14 = v13;

  v10[1] = *((void *)v11 + 1);
  if (a1 != a2)
  {
    uint64_t v15 = a3[6];
    uint64_t v16 = (void *)((char *)a1 + v15);
    uint64_t v17 = (void *)((char *)a2 + v15);
    sub_244E8((uint64_t)a1 + v15, &qword_411F0);
    sub_63C4(&qword_411F0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v18 = sub_32CA8();
      if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v17, 1, v18))
      {
        uint64_t v19 = sub_63C4(&qword_41AD0);
        memcpy(v16, v17, *(void *)(*(void *)(v19 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
        _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v16, 0, 1, v18);
      }
    }
    else
    {
      void *v16 = *v17;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v20 = a3[7];
  uint64_t v21 = (char *)a1 + v20;
  uint64_t v22 = (char *)a2 + v20;
  uint64_t v23 = *(void *)v22;
  char v24 = v22[8];
  sub_137D0(*(void *)v22, v24);
  uint64_t v25 = *(void *)v21;
  char v26 = v21[8];
  *(void *)uint64_t v21 = v23;
  v21[8] = v24;
  sub_139F8(v25, v26);
  uint64_t v27 = a3[8];
  uint64_t v28 = (char *)a1 + v27;
  uint64_t v29 = (char *)a2 + v27;
  *(void *)((char *)a1 + v27) = *(void *)((char *)a2 + v27);
  swift_retain();
  swift_release();
  *((void *)v28 + 1) = *((void *)v29 + 1);
  swift_retain();
  swift_release();
  return a1;
}

char *initializeWithTake for AppIconView(char *a1, char *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for AppIconView.Model(0);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    uint64_t v9 = sub_32E88();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(a1, a2, v9);
    goto LABEL_5;
  }
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v8 = sub_32CE8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
LABEL_5:
    swift_storeEnumTagMultiPayload();
    goto LABEL_7;
  }
  memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
LABEL_7:
  uint64_t v10 = a3[6];
  *(_OWORD *)&a1[a3[5]] = *(_OWORD *)&a2[a3[5]];
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  uint64_t v13 = sub_63C4(&qword_411F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v14 = sub_32CA8();
    if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v12, 1, v14))
    {
      uint64_t v15 = sub_63C4(&qword_41AD0);
      memcpy(v11, v12, *(void *)(*(void *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v11, v12, v14);
      _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v11, 0, 1, v14);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
  }
  uint64_t v16 = a3[7];
  uint64_t v17 = a3[8];
  uint64_t v18 = &a1[v16];
  uint64_t v19 = &a2[v16];
  *(void *)uint64_t v18 = *(void *)v19;
  v18[8] = v19[8];
  *(_OWORD *)&a1[v17] = *(_OWORD *)&a2[v17];
  return a1;
}

char *assignWithTake for AppIconView(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_2453C((uint64_t)a1, (void (*)(void))type metadata accessor for AppIconView.Model);
    uint64_t v6 = type metadata accessor for AppIconView.Model(0);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v9 = sub_32E88();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(a1, a2, v9);
      goto LABEL_6;
    }
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v8 = sub_32CE8();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
LABEL_6:
      swift_storeEnumTagMultiPayload();
      goto LABEL_8;
    }
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
LABEL_8:
  uint64_t v10 = a3[5];
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  uint64_t v13 = *(void **)&a1[v10];
  *(void *)uint64_t v11 = *(void *)v12;

  *((void *)v11 + 1) = *((void *)v12 + 1);
  if (a1 != a2)
  {
    uint64_t v14 = a3[6];
    uint64_t v15 = &a1[v14];
    uint64_t v16 = &a2[v14];
    sub_244E8((uint64_t)&a1[v14], &qword_411F0);
    uint64_t v17 = sub_63C4(&qword_411F0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v18 = sub_32CA8();
      if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v16, 1, v18))
      {
        uint64_t v19 = sub_63C4(&qword_41AD0);
        memcpy(v15, v16, *(void *)(*(void *)(v19 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v15, v16, v18);
        _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v15, 0, 1, v18);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64));
    }
  }
  uint64_t v20 = a3[7];
  uint64_t v21 = &a1[v20];
  uint64_t v22 = &a2[v20];
  uint64_t v23 = *(void *)v22;
  LOBYTE(v22) = v22[8];
  uint64_t v24 = *(void *)v21;
  char v25 = v21[8];
  *(void *)uint64_t v21 = v23;
  v21[8] = (char)v22;
  sub_139F8(v24, v25);
  uint64_t v26 = a3[8];
  uint64_t v27 = &a1[v26];
  uint64_t v28 = &a2[v26];
  *(void *)&a1[v26] = *(void *)v28;
  swift_release();
  *((void *)v27 + 1) = *((void *)v28 + 1);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AppIconView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_22F2C);
}

uint64_t sub_22F2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_245EC();
  if (*(_DWORD *)(v7 + 84) == v3)
  {
    uint64_t v8 = v6;
    uint64_t v9 = v4;
LABEL_10:
    return _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0(v9, v3, v8);
  }
  if (v3 != 2147483646)
  {
    uint64_t v8 = sub_63C4(&qword_41AE0);
    uint64_t v9 = v4 + *(int *)(a3 + 24);
    goto LABEL_10;
  }
  unint64_t v10 = *(void *)(v4 + *(int *)(a3 + 20));
  if (v10 >= 0xFFFFFFFF) {
    LODWORD(v10) = -1;
  }
  int v11 = v10 - 1;
  if (v11 < 0) {
    int v11 = -1;
  }
  return (v11 + 1);
}

uint64_t storeEnumTagSinglePayload for AppIconView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_22FF0);
}

uint64_t sub_22FF0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_245EC();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = v5;
  }
  else
  {
    if (a3 == 2147483646)
    {
      *(void *)(v5 + *(int *)(a4 + 20)) = v4;
      return result;
    }
    uint64_t v10 = sub_63C4(&qword_41AE0);
    uint64_t v11 = v5 + *(int *)(a4 + 24);
  }

  return _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v11, v4, v4, v10);
}

void sub_23090()
{
  type metadata accessor for AppIconView.Model(319);
  if (v0 <= 0x3F)
  {
    sub_2316C();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_2316C()
{
  if (!qword_41B58)
  {
    sub_6728(&qword_41AD0);
    unint64_t v0 = sub_33288();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_41B58);
    }
  }
}

void *sub_231C8()
{
  return &protocol witness table for AnyView;
}

uint64_t *sub_231D4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v9 = sub_32E88();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
    }
    else if (EnumCaseMultiPayload == 1)
    {
      uint64_t v7 = sub_32CE8();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      uint64_t v10 = a2[1];
      *a1 = *a2;
      a1[1] = v10;
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_23328(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch(result)
  {
    case 2:
      uint64_t v3 = sub_32E88();
      break;
    case 1:
      uint64_t v3 = sub_32CE8();
      break;
    case 0:
      return swift_bridgeObjectRelease();
    default:
      return result;
  }
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);

  return v4(a1, v3);
}

void *sub_233DC(void *a1, void *a2)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    uint64_t v6 = sub_32E88();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else if (EnumCaseMultiPayload == 1)
  {
    uint64_t v5 = sub_32CE8();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v5 - 8) + 16))(a1, a2, v5);
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    swift_bridgeObjectRetain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *sub_234E0(void *a1, void *a2)
{
  if (a1 != a2)
  {
    sub_2453C((uint64_t)a1, (void (*)(void))type metadata accessor for AppIconView.Model);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v6 = sub_32E88();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else if (EnumCaseMultiPayload == 1)
    {
      uint64_t v5 = sub_32CE8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v5 - 8) + 16))(a1, a2, v5);
    }
    else
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_23610(void *a1, const void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    uint64_t v8 = sub_32E88();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
  }
  else
  {
    if (EnumCaseMultiPayload != 1)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
      return a1;
    }
    uint64_t v7 = sub_32CE8();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *sub_2371C(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_2453C((uint64_t)a1, (void (*)(void))type metadata accessor for AppIconView.Model);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v8 = sub_32E88();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
    }
    else
    {
      if (EnumCaseMultiPayload != 1)
      {
        memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
        return a1;
      }
      uint64_t v7 = sub_32CE8();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_2384C()
{
  uint64_t result = sub_32CE8();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_32E88();
    if (v2 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

unint64_t sub_2391C()
{
  unint64_t result = qword_42618;
  if (!qword_42618)
  {
    sub_6728(&qword_42610);
    sub_23990();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_42618);
  }
  return result;
}

unint64_t sub_23990()
{
  unint64_t result = qword_42620;
  if (!qword_42620)
  {
    sub_6728(&qword_42628);
    sub_23A3C();
    sub_24460((unint64_t *)&unk_423B0, (void (*)(uint64_t))&type metadata accessor for _TaskModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_42620);
  }
  return result;
}

unint64_t sub_23A3C()
{
  unint64_t result = qword_42630;
  if (!qword_42630)
  {
    sub_6728(&qword_42638);
    sub_23AB8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_42630);
  }
  return result;
}

unint64_t sub_23AB8()
{
  unint64_t result = qword_42640;
  if (!qword_42640)
  {
    sub_6728(&qword_42648);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_42640);
  }
  return result;
}

uint64_t sub_23B0C()
{
  uint64_t v1 = sub_2463C();
  v2(v1);
  sub_EC24();
  uint64_t v3 = sub_EC6C();
  v4(v3);
  return v0;
}

uint64_t sub_23B54()
{
  uint64_t v1 = (int *)type metadata accessor for AppIconView(0);
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 48) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  swift_bridgeObjectRelease();
  uint64_t v5 = v0 + v3;
  type metadata accessor for AppIconView.Model(0);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 2:
      sub_32E88();
LABEL_7:
      sub_EC24();
      (*(void (**)(uint64_t))(v7 + 8))(v0 + v3);
      break;
    case 1:
      sub_32CE8();
      goto LABEL_7;
    case 0:
      swift_bridgeObjectRelease();
      break;
  }

  uint64_t v8 = v5 + v1[6];
  sub_63C4(&qword_411F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = sub_32CA8();
    if (!_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0(v8, 1, v9)) {
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
    }
  }
  else
  {
    swift_release();
  }
  sub_139F8(*(void *)(v5 + v1[7]), *(unsigned char *)(v5 + v1[7] + 8));
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_23D40()
{
  uint64_t v1 = sub_2463C();
  v2(v1);
  sub_EC24();
  uint64_t v3 = sub_24670();
  v4(v3);
  return v0;
}

uint64_t sub_23D88()
{
  uint64_t v2 = *(void *)(type metadata accessor for AppIconView(0) - 8);
  uint64_t v3 = *((void *)v0 + 2);
  uint64_t v4 = *((void *)v0 + 3);
  double v5 = v0[4];
  double v6 = v0[5];
  uint64_t v7 = (uint64_t)v0 + ((*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v8;
  *uint64_t v8 = v1;
  v8[1] = sub_23E7C;
  return sub_2160C(v3, v4, v7, v5, v6);
}

uint64_t sub_23E7C()
{
  sub_15C50();
  sub_245D4();
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

id sub_23F48()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  NSString v1 = sub_33A28();
  swift_bridgeObjectRelease();
  id v2 = [v0 initWithBundleIdentifier:v1];

  return v2;
}

uint64_t sub_23FBC(char a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  *(double *)(v6 + 48) = a6;
  *(void *)(v6 + 40) = a2;
  *(double *)(v6 + 24) = a4;
  *(double *)(v6 + 32) = a5;
  *(unsigned char *)(v6 + 96) = a1;
  *(double *)(v6 + 16) = a3;
  uint64_t v8 = swift_task_alloc();
  *(void *)(v6 + 56) = v8;
  *(double *)(v8 + 16) = a6;
  return _swift_task_switch(sub_24044, 0, 0);
}

uint64_t sub_24044()
{
  NSString v1 = *(void **)(v0 + 40);
  int v2 = *(unsigned __int8 *)(v0 + 96);
  id v3 = objc_msgSend(objc_allocWithZone((Class)ISImageDescriptor), "initWithSize:scale:", *(double *)(v0 + 16), *(double *)(v0 + 24), *(double *)(v0 + 32));
  id v4 = v3;
  *(void *)(v0 + 64) = v3;
  if (v2) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 0;
  }
  [v3 setShape:v5];
  id v6 = [v1 prepareImageForDescriptor:v4];
  *(void *)(v0 + 72) = v6;
  uint64_t v11 = (uint64_t (*)(uint64_t, double))((char *)&dword_42680 + dword_42680);
  id v7 = v6;
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_24184;
  double v9 = *(double *)(v0 + 48);
  return v11((uint64_t)v6, v9);
}

uint64_t sub_24184()
{
  sub_15C50();
  sub_245D4();
  *(void *)(v1 + 88) = v0;
  swift_task_dealloc();
  return _swift_task_switch(sub_2425C, 0, 0);
}

uint64_t sub_2425C()
{
  sub_15C50();
  uint64_t v1 = *(void **)(v0 + 72);

  swift_task_dealloc();
  int v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v3 = *(void *)(v0 + 88);
  return v2(v3);
}

void sub_242CC(void *a1@<X0>, uint64_t *a2@<X8>, double a3@<D0>)
{
  if (a1 && (id v5 = [a1 CGImage]) != 0)
  {
    id v6 = v5;
    [objc_allocWithZone((Class)UIImage) initWithCGImage:v5 scale:0 orientation:a3];
    uint64_t v7 = sub_33728();
  }
  else
  {
    if (qword_411C0 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_331C8();
    sub_7150(v8, (uint64_t)qword_44260);
    double v9 = sub_331B8();
    os_log_type_t v10 = sub_33C98();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_0, v9, v10, "Unable to convert ISIcon to a cgImage", v11, 2u);
      swift_slowDealloc();
    }

    uint64_t v7 = 0;
  }
  *a2 = v7;
}

unint64_t sub_24420()
{
  unint64_t result = qword_42668;
  if (!qword_42668)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_42668);
  }
  return result;
}

uint64_t sub_24460(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_244A8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_24650(a1, a2, a3);
  sub_EC24();
  uint64_t v4 = sub_24670();
  v5(v4);
  return v3;
}

uint64_t sub_244E8(uint64_t a1, uint64_t *a2)
{
  sub_63C4(a2);
  sub_EC24();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_2453C(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_EC24();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_24594(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_24650(a1, a2, a3);
  sub_EC24();
  uint64_t v4 = sub_EC6C();
  v5(v4);
  return v3;
}

uint64_t sub_245EC()
{
  return type metadata accessor for AppIconView.Model(0);
}

uint64_t sub_24620()
{
  return sub_33778();
}

uint64_t sub_2463C()
{
  return 0;
}

uint64_t sub_24650(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_63C4(a3);
}

uint64_t sub_24670()
{
  return v0;
}

uint64_t CoreChartPluginView.init(model:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_33118();
  id v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32);

  return v5(a2, a1, v4);
}

uint64_t sub_246F0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t initializeBufferWithCopyOfBuffer for CoreChartPluginView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_33118();
  id v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t destroy for CoreChartPluginView(uint64_t a1)
{
  uint64_t v2 = sub_33118();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t initializeWithCopy for CoreChartPluginView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_33118();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for CoreChartPluginView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_33118();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for CoreChartPluginView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_33118();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for CoreChartPluginView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_33118();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for CoreChartPluginView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_24980);
}

uint64_t sub_24980()
{
  uint64_t v2 = sub_24AE8();
  return _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0(v1, v0, v2);
}

uint64_t storeEnumTagSinglePayload for CoreChartPluginView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_249CC);
}

uint64_t sub_249CC()
{
  uint64_t v2 = sub_24AE8();
  return _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v1, v0, v0, v2);
}

uint64_t type metadata accessor for CoreChartPluginView()
{
  uint64_t result = qword_426F8;
  if (!qword_426F8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24A50()
{
  uint64_t result = sub_33118();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *sub_24ADC()
{
  return &protocol witness table for EmptyView;
}

uint64_t sub_24AE8()
{
  return sub_33118();
}

uint64_t ContactPickerButtonView.init(model:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for ContactPickerButtonView();
  id v5 = (uint64_t *)(a2 + *(int *)(v4 + 20));
  sub_339B8();
  sub_24C24();
  *id v5 = sub_33338();
  v5[1] = v6;
  uint64_t v7 = a2 + *(int *)(v4 + 24);
  sub_33778();
  *(unsigned char *)uint64_t v7 = v10;
  *(void *)(v7 + 8) = v11;
  sub_33028();
  sub_EC24();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 32))(a2, a1);
}

uint64_t type metadata accessor for ContactPickerButtonView()
{
  uint64_t result = qword_42798;
  if (!qword_42798) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_24C24()
{
  unint64_t result = qword_421F0;
  if (!qword_421F0)
  {
    sub_339B8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_421F0);
  }
  return result;
}

uint64_t sub_24C74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    sub_271B0((_OWORD *)a1, v6);
    sub_27784(v6, a2, a3);
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_244E8(a1, &qword_428B0);
    sub_275CC(a2, a3, v6);
    swift_bridgeObjectRelease();
    return sub_244E8((uint64_t)v6, &qword_428B0);
  }
}

uint64_t property wrapper backing initializer of ContactPickerButtonView.showSystemPicker()
{
  sub_33778();
  return v1;
}

void ContactPickerButtonView.body.getter(uint64_t *a1@<X8>)
{
  *a1 = sub_33808();
  a1[1] = v3;
  uint64_t v4 = sub_63C4(&qword_42738);
  sub_24D88(v1, (uint64_t *)((char *)a1 + *(int *)(v4 + 44)));
}

void sub_24D88(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v72 = sub_32BB8();
  uint64_t v70 = *(void *)(v72 - 8);
  __chkstk_darwin(v72);
  uint64_t v71 = (char *)&v58 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = sub_33068();
  uint64_t v65 = *(void *)(v67 - 8);
  __chkstk_darwin(v67);
  BOOL v68 = (char *)&v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_32E28();
  uint64_t v64 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_33088();
  __chkstk_darwin(v9 - 8);
  uint64_t v66 = (char *)&v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = sub_33858();
  uint64_t v74 = *(void *)(v75 - 8);
  __chkstk_darwin(v75);
  uint64_t v73 = (char *)&v58 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_63C4(&qword_42890);
  uint64_t v13 = __chkstk_darwin(v12 - 8);
  uint64_t v82 = (uint64_t)&v58 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v69 = (uint64_t)&v58 - v16;
  __chkstk_darwin(v15);
  uint64_t v81 = (uint64_t)&v58 - v17;
  uint64_t v18 = type metadata accessor for ContactPickerButtonView();
  uint64_t v76 = *(void *)(v18 - 8);
  uint64_t v19 = *(void *)(v76 + 64);
  uint64_t v62 = __chkstk_darwin(v18);
  uint64_t v20 = *(int *)(v62 + 24);
  uint64_t v77 = a1;
  uint64_t v21 = (char *)(a1 + v20);
  char v22 = *v21;
  uint64_t v23 = *((void *)v21 + 1);
  LOBYTE(v93) = *v21;
  uint64_t v94 = v23;
  sub_63C4(&qword_42898);
  sub_33788();
  uint64_t v87 = 0;
  uint64_t v86 = 0;
  uint64_t v85 = 0;
  uint64_t v24 = 0;
  uint64_t v84 = 0;
  char v25 = 0;
  uint64_t v83 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  uint64_t v31 = 0;
  if (LOBYTE(v92[0]) == 1)
  {
    LOBYTE(v92[0]) = v22;
    v92[1] = v23;
    sub_337A8();
    uint64_t v87 = v93;
    uint64_t v86 = v94;
    uint64_t v85 = v95;
    sub_26DD0(v77, (uint64_t)&v58 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
    unint64_t v32 = (*(unsigned __int8 *)(v76 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v76 + 80);
    uint64_t v84 = swift_allocObject();
    sub_26E38((uint64_t)&v58 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0), v84 + v32);
    sub_339B8();
    sub_24C24();
    char v25 = (void *)sub_33338();
    uint64_t v83 = v33;
    sub_33808();
    sub_332A8();
    uint64_t v26 = v93;
    uint64_t v27 = v94;
    uint64_t v28 = v95;
    uint64_t v29 = v96;
    uint64_t v30 = v97;
    uint64_t v31 = v98;
    uint64_t v24 = sub_2716C;
  }
  uint64_t v59 = v31;
  uint64_t v60 = v30;
  uint64_t v61 = v29;
  uint64_t v78 = v24;
  uint64_t v63 = v28;
  uint64_t v79 = v27;
  v80 = v25;
  uint64_t v34 = sub_33098();
  v92[3] = v34;
  v92[4] = (uint64_t)&protocol witness table for Command;
  uint64_t v35 = sub_E898(v92);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v34 - 8) + 104))(v35, enum case for Command.noOp(_:), v34);
  v91[3] = sub_32E18();
  v91[4] = (uint64_t)&protocol witness table for TextProperty;
  sub_E898(v91);
  uint64_t v36 = v77;
  sub_33018();
  uint64_t v90 = 0;
  long long v89 = 0u;
  long long v88 = 0u;
  (*(void (**)(char *, void, uint64_t))(v64 + 104))(v8, enum case for _ProtoButton.FormAction.none(_:), v6);
  (*(void (**)(char *, void, uint64_t))(v65 + 104))(v68, enum case for Button.LabelStyle.automatic(_:), v67);
  (*(void (**)(char *, void, uint64_t))(v70 + 104))(v71, enum case for ButtonRole.standard(_:), v72);
  sub_33078();
  sub_26DD0(v36, (uint64_t)&v58 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v37 = (*(unsigned __int8 *)(v76 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v76 + 80);
  uint64_t v38 = swift_allocObject();
  sub_26E38((uint64_t)&v58 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0), v38 + v37);
  uint64_t v39 = v73;
  sub_33848();
  uint64_t v40 = *(void **)(v36 + *(int *)(v62 + 20));
  if (v40)
  {
    id v41 = v40;
    sub_33958();

    sub_33808();
    uint64_t v42 = v69;
    sub_282B0(0, v69);
    (*(void (**)(char *, uint64_t))(v74 + 8))(v39, v75);
    uint64_t v43 = v81;
    sub_26EDC(v42, v81);
    uint64_t v44 = v82;
    sub_26F44(v43, v82);
    uint64_t v45 = v87;
    uint64_t v46 = v86;
    *a2 = v87;
    a2[1] = v46;
    uint64_t v47 = (uint64_t)v78;
    a2[2] = v85;
    a2[3] = v47;
    uint64_t v48 = v80;
    a2[4] = v84;
    a2[5] = v48;
    a2[6] = v83;
    a2[7] = v26;
    uint64_t v49 = v63;
    a2[8] = v79;
    a2[9] = v49;
    uint64_t v50 = v60;
    a2[10] = v61;
    a2[11] = v50;
    a2[12] = v59;
    uint64_t v51 = sub_63C4(&qword_428A0);
    sub_26F44(v44, (uint64_t)a2 + *(int *)(v51 + 48));
    uint64_t v52 = v45;
    uint64_t v53 = v86;
    uint64_t v54 = v85;
    uint64_t v55 = v47;
    uint64_t v56 = v84;
    uint64_t v57 = v80;
    sub_26FAC(v52, v86, v85, v55, v84, v80);
    sub_244E8(v81, &qword_42890);
    sub_244E8(v82, &qword_42890);
    sub_2700C(v87, v53, v54, (uint64_t)v78, v56, v57);
  }
  else
  {
    sub_339B8();
    sub_24C24();
    sub_33328();
    __break(1u);
  }
}

uint64_t sub_2576C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25788(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v15 = sub_32FF8();
  uint64_t v4 = sub_32FE8();
  uint64_t v6 = v5;
  id v7 = [a1 identifier];
  uint64_t v8 = sub_33A38();
  uint64_t v10 = v9;

  v14[3] = &type metadata for String;
  v14[0] = v8;
  v14[1] = v10;
  sub_24C74((uint64_t)v14, v4, v6);
  uint64_t v11 = *(void **)(v2 + *(int *)(type metadata accessor for ContactPickerButtonView() + 20));
  if (v11)
  {
    id v12 = v11;
    sub_33008();
    sub_2592C(v15);
    swift_bridgeObjectRelease();
    sub_339A8();

    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_339B8();
    sub_24C24();
    uint64_t result = sub_27F48();
    __break(1u);
  }
  return result;
}

uint64_t sub_258C0()
{
  return sub_33798();
}

uint64_t sub_2592C(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_63C4(&qword_428A8);
    uint64_t v2 = (void *)sub_33F28();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
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
  if (!v5) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v9 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  unint64_t v10 = v9 | (v8 << 6);
  while (1)
  {
    uint64_t v15 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v10);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    sub_10820(*(void *)(a1 + 56) + 32 * v10, (uint64_t)v40);
    *(void *)&long long v39 = v17;
    *((void *)&v39 + 1) = v16;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v17;
    *((void *)&v37[0] + 1) = v16;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_271B0(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_271B0(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_271B0(v36, v37);
    sub_271B0(v37, &v33);
    uint64_t result = sub_33DE8(v2[5]);
    uint64_t v18 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v19 = result & ~v18;
    unint64_t v20 = v19 >> 6;
    if (((-1 << v19) & ~*(void *)&v6[8 * (v19 >> 6)]) == 0)
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v18) >> 6;
      while (++v20 != v23 || (v22 & 1) == 0)
      {
        BOOL v24 = v20 == v23;
        if (v20 == v23) {
          unint64_t v20 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)&v6[8 * v20];
        if (v25 != -1)
        {
          unint64_t v21 = __clz(__rbit64(~v25)) + (v20 << 6);
          goto LABEL_34;
        }
      }
      __break(1u);
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    unint64_t v21 = __clz(__rbit64((-1 << v19) & ~*(void *)&v6[8 * (v19 >> 6)])) | v19 & 0x7FFFFFFFFFFFFFC0;
LABEL_34:
    *(void *)&v6[(v21 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v21;
    uint64_t v26 = v2[6] + 40 * v21;
    *(_OWORD *)uint64_t v26 = v29;
    *(_OWORD *)(v26 + 16) = v30;
    *(void *)(v26 + 32) = v31;
    uint64_t result = (uint64_t)sub_271B0(&v33, (_OWORD *)(v2[7] + 32 * v21));
    ++v2[2];
    if (v5) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v11 = v8 + 1;
    if (__OFADD__(v8, 1)) {
      goto LABEL_38;
    }
    if (v11 >= v27) {
      goto LABEL_36;
    }
    unint64_t v12 = *(void *)(v28 + 8 * v11);
    int64_t v13 = v8 + 1;
    if (!v12)
    {
      int64_t v13 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_36;
      }
      unint64_t v12 = *(void *)(v28 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_36;
        }
        unint64_t v12 = *(void *)(v28 + 8 * v13);
        if (!v12)
        {
          int64_t v13 = v8 + 4;
          if (v8 + 4 >= v27) {
            goto LABEL_36;
          }
          unint64_t v12 = *(void *)(v28 + 8 * v13);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_24:
    unint64_t v5 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
    int64_t v8 = v13;
  }
  int64_t v14 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_36:
    swift_release();
    sub_7770();
    return (uint64_t)v2;
  }
  unint64_t v12 = *(void *)(v28 + 8 * v14);
  if (v12)
  {
    int64_t v13 = v8 + 5;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v13 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v13 >= v27) {
      goto LABEL_36;
    }
    unint64_t v12 = *(void *)(v28 + 8 * v13);
    ++v14;
    if (v12) {
      goto LABEL_24;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for ContactPickerButtonView(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *a1 = *a2;
    uint64_t v4 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_33028();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(v4, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = *(int *)(a3 + 24);
    unint64_t v10 = (uint64_t *)((char *)v4 + v8);
    int64_t v11 = (char *)a2 + v8;
    int64_t v13 = *(void **)v11;
    uint64_t v12 = *((void *)v11 + 1);
    *unint64_t v10 = v13;
    v10[1] = v12;
    int64_t v14 = (char *)v4 + v9;
    uint64_t v15 = (char *)a2 + v9;
    char *v14 = *v15;
    *((void *)v14 + 1) = *((void *)v15 + 1);
    id v16 = v13;
  }
  swift_retain();
  return v4;
}

uint64_t destroy for ContactPickerButtonView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_33028();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);

  return swift_release();
}

uint64_t initializeWithCopy for ContactPickerButtonView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_33028();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (void *)(a1 + v7);
  uint64_t v10 = a2 + v7;
  uint64_t v12 = *(void **)v10;
  uint64_t v11 = *(void *)(v10 + 8);
  *uint64_t v9 = v12;
  v9[1] = v11;
  uint64_t v13 = a1 + v8;
  uint64_t v14 = a2 + v8;
  *(unsigned char *)uint64_t v13 = *(unsigned char *)v14;
  *(void *)(v13 + 8) = *(void *)(v14 + 8);
  id v15 = v12;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for ContactPickerButtonView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_33028();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void **)(a1 + v7);
  uint64_t v11 = *(void **)(a2 + v7);
  *uint64_t v8 = v11;
  id v12 = v11;

  v8[1] = *(void *)(v9 + 8);
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  *(unsigned char *)uint64_t v14 = *(unsigned char *)v15;
  *(void *)(v14 + 8) = *(void *)(v15 + 8);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for ContactPickerButtonView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_33028();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  return a1;
}

uint64_t assignWithTake for ContactPickerButtonView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_33028();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = *(void **)(a1 + v7);
  *uint64_t v8 = *v9;

  v8[1] = v9[1];
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  *(unsigned char *)uint64_t v12 = *(unsigned char *)v13;
  *(void *)(v12 + 8) = *(void *)(v13 + 8);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ContactPickerButtonView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_26138);
}

uint64_t sub_26138(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_33028();
  sub_EC0C();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0(a1, a2, v6);
  }
  else
  {
    unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v9 >= 0xFFFFFFFF) {
      LODWORD(v9) = -1;
    }
    int v10 = v9 - 1;
    if (v10 < 0) {
      int v10 = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for ContactPickerButtonView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_261E4);
}

void sub_261E4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_33028();
  sub_EC0C();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(a1, a2, a2, v8);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = a2;
  }
}

uint64_t sub_2626C()
{
  uint64_t result = sub_33028();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

id sub_26304()
{
  uint64_t v3 = *(void *)v0;
  *(_OWORD *)uint64_t v2 = *(_OWORD *)(v0 + 40);
  objc_allocWithZone((Class)type metadata accessor for SystemContactPicker.SystemContactPickerViewController());
  sub_26D2C((uint64_t)&v3);
  swift_retain();
  swift_retain();
  sub_26D58(v2);
  return sub_2637C(v0);
}

id sub_2637C(uint64_t a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = &v1[OBJC_IVAR____TtCV12SystemPlugin19SystemContactPicker33SystemContactPickerViewController_container];
  long long v5 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)uint64_t v4 = *(_OWORD *)a1;
  *((_OWORD *)v4 + 1) = v5;
  *((_OWORD *)v4 + 2) = *(_OWORD *)(a1 + 32);
  *((void *)v4 + 6) = *(void *)(a1 + 48);
  v7.receiver = v1;
  v7.super_class = ObjectType;
  return objc_msgSendSuper2(&v7, "initWithNibName:bundle:", 0, 0);
}

void sub_263EC()
{
  uint64_t v0 = sub_331C8();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_411C0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_7150(v0, (uint64_t)qword_44260);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  sub_1AFDC((uint64_t)"SystemPlugin/ContactPickerButtonView.swift", 42, 2, 82, (uint64_t)v3);
}

void sub_26504()
{
  uint64_t v1 = v0;
  v5.receiver = v0;
  v5.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v5, "viewDidLoad");
  id v2 = [objc_allocWithZone((Class)CNContactPickerViewController) init];
  [v2 setDelegate:v0];
  uint64_t v3 = *(void **)&v0[OBJC_IVAR____TtCV12SystemPlugin19SystemContactPicker33SystemContactPickerViewController_container
                   + 40];
  if (v3)
  {
    id v4 = v3;
    sub_33978();

    [v1 presentViewController:v2 animated:1 completion:0];
  }
  else
  {
    sub_339B8();
    sub_24C24();
    sub_27F48();
    __break(1u);
  }
}

void sub_26624()
{
  uint64_t v1 = *(void **)(v0
                + OBJC_IVAR____TtCV12SystemPlugin19SystemContactPicker33SystemContactPickerViewController_container
                + 40);
  sub_63C4(&qword_42888);
  sub_337D8();
  if (v1)
  {
    id v2 = v1;
    sub_33968();
  }
  else
  {
    sub_339B8();
    sub_24C24();
    sub_27F48();
    __break(1u);
  }
}

uint64_t sub_2671C(uint64_t a1, uint64_t a2)
{
  id v4 = *(uint64_t (**)(uint64_t))(v2
                                         + OBJC_IVAR____TtCV12SystemPlugin19SystemContactPicker33SystemContactPickerViewController_container
                                         + 24);
  objc_super v5 = *(void **)(v2
                + OBJC_IVAR____TtCV12SystemPlugin19SystemContactPicker33SystemContactPickerViewController_container
                + 40);
  sub_63C4(&qword_42888);
  sub_337D8();
  if (v5)
  {
    id v6 = v5;
    sub_33968();

    return v4(a2);
  }
  else
  {
    sub_339B8();
    sub_24C24();
    uint64_t result = sub_33328();
    __break(1u);
  }
  return result;
}

void sub_26858()
{
}

uint64_t type metadata accessor for SystemContactPicker.SystemContactPickerViewController()
{
  return self;
}

uint64_t sub_26938()
{
  return sub_EAD4(&qword_42868, &qword_42870);
}

void destroy for SystemContactPicker(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_release();
  uint64_t v2 = *(void **)(a1 + 40);
}

uint64_t initializeWithCopy for SystemContactPicker(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  id v6 = *(void **)(a2 + 40);
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = v6;
  *(void *)(a1 + 48) = v5;
  swift_retain();
  swift_retain();
  swift_retain();
  id v7 = v6;
  return a1;
}

uint64_t assignWithCopy for SystemContactPicker(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_retain();
  swift_release();
  uint64_t v5 = *(void **)(a1 + 40);
  id v6 = *(void **)(a2 + 40);
  *(void *)(a1 + 40) = v6;
  id v7 = v6;

  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  return a1;
}

__n128 initializeWithTake for SystemContactPicker(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for SystemContactPicker(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  long long v4 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);

  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for SystemContactPicker(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 56))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SystemContactPicker(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SystemContactPicker()
{
  return &type metadata for SystemContactPicker;
}

uint64_t sub_26BEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_26D84();

  return static UIViewControllerRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_26C50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_26D84();

  return static UIViewControllerRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_26CB4()
{
}

unint64_t sub_26CE0()
{
  unint64_t result = qword_42878;
  if (!qword_42878)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_42878);
  }
  return result;
}

uint64_t sub_26D2C(uint64_t a1)
{
  return a1;
}

id *sub_26D58(id *a1)
{
  id v2 = *a1;
  return a1;
}

unint64_t sub_26D84()
{
  unint64_t result = qword_42880;
  if (!qword_42880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_42880);
  }
  return result;
}

uint64_t sub_26DD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ContactPickerButtonView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_26E38(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ContactPickerButtonView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_26E9C()
{
  uint64_t v0 = type metadata accessor for ContactPickerButtonView();
  sub_EC34(v0);

  return sub_258C0();
}

uint64_t sub_26EDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_63C4(&qword_42890);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_26F44(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_63C4(&qword_42890);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_26FAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  if (a2)
  {
    id v6 = a6;
    swift_retain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

void sub_2700C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  if (a2)
  {
    swift_release();
    swift_release();
    swift_release();
  }
}

uint64_t sub_27074()
{
  uint64_t v1 = (int *)(type metadata accessor for ContactPickerButtonView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  sub_33028();
  sub_EC24();
  (*(void (**)(uint64_t))(v7 + 8))(v6);

  swift_release();

  return _swift_deallocObject(v0, v4, v5);
}

uint64_t sub_2716C(void *a1)
{
  uint64_t v2 = type metadata accessor for ContactPickerButtonView();
  sub_EC34(v2);
  return sub_25788(a1);
}

_OWORD *sub_271B0(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_271C0(uint64_t a1)
{
  sub_33FF8();
  sub_27B20((uint64_t)v4, a1);
  Swift::Int v2 = sub_34018();

  return sub_272A4(a1, v2);
}

unint64_t sub_2722C(uint64_t a1, uint64_t a2)
{
  sub_33FF8();
  sub_33AB8();
  Swift::Int v4 = sub_34018();

  return sub_273A8(a1, a2, v4);
}

unint64_t sub_272A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    uint64_t v7 = swift_bridgeObjectRetain();
    char v8 = sub_27CBC(v7, a1);
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0)
    {
      uint64_t v9 = ~v4;
      for (unint64_t i = (i + 1) & v9; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v9)
      {
        uint64_t v10 = swift_bridgeObjectRetain();
        char v11 = sub_27CBC(v10, a1);
        swift_bridgeObjectRelease();
        if (v11) {
          break;
        }
      }
    }
  }
  return i;
}

unint64_t sub_273A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_33F78() & 1) == 0)
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
      while (!v14 && (sub_33F78() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_2748C(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_271C0(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0) {
    return 0;
  }
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v11 = *v2;
  uint64_t v7 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  Swift::Int v8 = *(void *)(v7 + 24);
  sub_63C4((uint64_t *)&unk_428C0);
  sub_33ED8(isUniquelyReferenced_nonNull_native, v8);
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(*(void *)(v11 + 56) + 8 * v4);
  sub_63C4((uint64_t *)&unk_41BC0);
  sub_63C4(&qword_428D0);
  sub_EAD4(&qword_41BD0, (uint64_t *)&unk_41BC0);
  sub_33EE8();
  *uint64_t v2 = v11;
  swift_bridgeObjectRelease();
  return v9;
}

double sub_275CC@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  unint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_2722C(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v14 = *v4;
    uint64_t v11 = *v4;
    uint64_t *v4 = 0x8000000000000000;
    Swift::Int v12 = *(void *)(v11 + 24);
    sub_63C4(&qword_428B8);
    sub_33ED8(isUniquelyReferenced_nonNull_native, v12);
    swift_bridgeObjectRelease();
    sub_271B0((_OWORD *)(*(void *)(v14 + 56) + 32 * v8), a3);
    sub_33EE8();
    uint64_t *v4 = v14;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_27704(uint64_t a1, uint64_t a2)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  sub_27814(a1, a2, isUniquelyReferenced_nonNull_native);
  *uint64_t v2 = v7;

  return swift_bridgeObjectRelease();
}

uint64_t sub_27784(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  sub_27930(a1, a2, a3, isUniquelyReferenced_nonNull_native);
  uint64_t *v3 = v9;

  return swift_bridgeObjectRelease();
}

uint64_t sub_27814(uint64_t a1, uint64_t a2, char a3)
{
  unint64_t v4 = (void **)v3;
  unint64_t v8 = (void *)*v3;
  unint64_t v9 = sub_271C0(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v10 & 1) == 0;
  Swift::Int v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v14 = v9;
  char v15 = v10;
  sub_63C4((uint64_t *)&unk_428C0);
  if (!sub_33ED8(a3 & 1, v13)) {
    goto LABEL_5;
  }
  unint64_t v16 = sub_271C0(a2);
  if ((v15 & 1) != (v17 & 1))
  {
LABEL_11:
    sub_63C4((uint64_t *)&unk_41BC0);
    uint64_t result = sub_33F98();
    __break(1u);
    return result;
  }
  unint64_t v14 = v16;
LABEL_5:
  uint64_t v18 = *v4;
  if (v15)
  {
    uint64_t v19 = v18[7];
    uint64_t result = swift_release();
    *(void *)(v19 + 8 * v14) = a1;
  }
  else
  {
    sub_27A70(v14, a2, a1, v18);
    return swift_bridgeObjectRetain();
  }
  return result;
}

_OWORD *sub_27930(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  char v5 = (void **)v4;
  char v10 = (void *)*v4;
  unint64_t v11 = sub_2722C(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v12 & 1) == 0;
  Swift::Int v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_13;
  }
  unint64_t v16 = v11;
  char v17 = v12;
  sub_63C4(&qword_428B8);
  if (!sub_33ED8(a4 & 1, v15)) {
    goto LABEL_5;
  }
  unint64_t v18 = sub_2722C(a2, a3);
  if ((v17 & 1) != (v19 & 1))
  {
LABEL_13:
    uint64_t result = (_OWORD *)sub_33F98();
    __break(1u);
    return result;
  }
  unint64_t v16 = v18;
LABEL_5:
  unint64_t v20 = *v5;
  if (v17)
  {
    unint64_t v21 = (_OWORD *)(v20[7] + 32 * v16);
    sub_6804((uint64_t)v21);
    return sub_271B0(a1, v21);
  }
  else
  {
    sub_27AB4(v16, a2, a3, a1, v20);
    return (_OWORD *)swift_bridgeObjectRetain();
  }
}

unint64_t sub_27A70(unint64_t result, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(result >> 6) + 8] |= 1 << result;
  *(void *)(a4[6] + 8 * result) = a2;
  *(void *)(a4[7] + 8 * result) = a3;
  uint64_t v4 = a4[2];
  BOOL v5 = __OFADD__(v4, 1);
  uint64_t v6 = v4 + 1;
  if (v5) {
    __break(1u);
  }
  else {
    a4[2] = v6;
  }
  return result;
}

_OWORD *sub_27AB4(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  *uint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_271B0(a4, (_OWORD *)(a5[7] + 32 * a1));
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

void sub_27B20(uint64_t a1, uint64_t a2)
{
  sub_34018();
  uint64_t v3 = a2 + 56;
  uint64_t v4 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  uint64_t v6 = v5 & *(void *)(a2 + 56);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  swift_bridgeObjectRetain();
  Swift::UInt v8 = 0;
  int64_t v9 = 0;
  if (!v6) {
    goto LABEL_5;
  }
LABEL_4:
  for (v6 &= v6 - 1; ; uint64_t v6 = (v11 - 1) & v11)
  {
    sub_33FF8();
    swift_bridgeObjectRetain();
    sub_33AB8();
    Swift::Int v13 = sub_34018();
    swift_bridgeObjectRelease();
    v8 ^= v13;
    if (v6) {
      goto LABEL_4;
    }
LABEL_5:
    if (__OFADD__(v9++, 1)) {
      goto LABEL_19;
    }
    if (v9 >= v7)
    {
LABEL_17:
      swift_release();
      sub_34008(v8);
      return;
    }
    uint64_t v11 = *(void *)(v3 + 8 * v9);
    if (!v11) {
      break;
    }
LABEL_14:
    ;
  }
  int64_t v12 = v9 + 1;
  if (v9 + 1 >= v7) {
    goto LABEL_17;
  }
  uint64_t v11 = *(void *)(v3 + 8 * v12);
  if (v11)
  {
    ++v9;
    goto LABEL_14;
  }
  while (1)
  {
    int64_t v9 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      break;
    }
    if (v9 >= v7) {
      goto LABEL_17;
    }
    uint64_t v11 = *(void *)(v3 + 8 * v9);
    ++v12;
    if (v11) {
      goto LABEL_14;
    }
  }
  __break(1u);
LABEL_19:
  __break(1u);
}

uint64_t sub_27CBC(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v3 = 0;
  uint64_t v4 = *(void *)(result + 56);
  uint64_t v30 = result + 56;
  uint64_t v5 = 1 << *(unsigned char *)(result + 32);
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  else {
    uint64_t v6 = -1;
  }
  unint64_t v7 = v6 & v4;
  int64_t v31 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v8 = a2 + 56;
  if ((v6 & v4) == 0) {
    goto LABEL_8;
  }
LABEL_7:
  unint64_t v9 = __clz(__rbit64(v7));
  v7 &= v7 - 1;
  int64_t v32 = v3;
  for (unint64_t i = v9 | (v3 << 6); ; unint64_t i = __clz(__rbit64(v12)) + (v13 << 6))
  {
    uint64_t v15 = result;
    unint64_t v16 = (uint64_t *)(*(void *)(result + 48) + 16 * i);
    uint64_t v18 = *v16;
    uint64_t v17 = v16[1];
    sub_33FF8();
    swift_bridgeObjectRetain();
    sub_33AB8();
    Swift::Int v19 = sub_34018();
    uint64_t v20 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v21 = v19 & ~v20;
    if (((*(void *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v21) & 1) == 0) {
      goto LABEL_39;
    }
    uint64_t v22 = *(void *)(a2 + 48);
    unint64_t v23 = (void *)(v22 + 16 * v21);
    BOOL v24 = *v23 == v18 && v23[1] == v17;
    if (!v24 && (sub_33F78() & 1) == 0)
    {
      uint64_t v25 = ~v20;
      for (unint64_t j = v21 + 1; ; unint64_t j = v27 + 1)
      {
        uint64_t v27 = j & v25;
        if (((*(void *)(v8 + (((j & v25) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (j & v25)) & 1) == 0) {
          break;
        }
        uint64_t v28 = (void *)(v22 + 16 * v27);
        BOOL v29 = *v28 == v18 && v28[1] == v17;
        if (v29 || (sub_33F78() & 1) != 0) {
          goto LABEL_28;
        }
      }
LABEL_39:
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_28:
    swift_bridgeObjectRelease();
    uint64_t result = v15;
    int64_t v3 = v32;
    if (v7) {
      goto LABEL_7;
    }
LABEL_8:
    int64_t v11 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_42;
    }
    if (v11 >= v31) {
      return 1;
    }
    unint64_t v12 = *(void *)(v30 + 8 * v11);
    int64_t v13 = v3 + 1;
    if (!v12)
    {
      int64_t v13 = v3 + 2;
      if (v3 + 2 >= v31) {
        return 1;
      }
      unint64_t v12 = *(void *)(v30 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = v3 + 3;
        if (v3 + 3 >= v31) {
          return 1;
        }
        unint64_t v12 = *(void *)(v30 + 8 * v13);
        if (!v12) {
          break;
        }
      }
    }
LABEL_21:
    unint64_t v7 = (v12 - 1) & v12;
    int64_t v32 = v13;
  }
  uint64_t v14 = v3 + 4;
  if (v3 + 4 >= v31) {
    return 1;
  }
  unint64_t v12 = *(void *)(v30 + 8 * v14);
  if (v12)
  {
    int64_t v13 = v3 + 4;
    goto LABEL_21;
  }
  while (1)
  {
    int64_t v13 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v13 >= v31) {
      return 1;
    }
    unint64_t v12 = *(void *)(v30 + 8 * v13);
    ++v14;
    if (v12) {
      goto LABEL_21;
    }
  }
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_27F48()
{
  return sub_33328();
}

uint64_t IntentsUIStandardView.init(modelData:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_32F78();
  sub_9370();
  uint64_t v28 = v7;
  uint64_t v9 = __chkstk_darwin(v8);
  BOOL v29 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  unint64_t v12 = (char *)&v27 - v11;
  int64_t v13 = (int *)type metadata accessor for IntentsUIStandardView();
  uint64_t v14 = a3 + v13[5];
  sub_339B8();
  sub_28A58((uint64_t)&qword_421F0);
  *(void *)uint64_t v14 = sub_33338();
  *(void *)(v14 + 8) = v15;
  unint64_t v16 = (uint64_t *)(a3 + v13[6]);
  uint64_t *v16 = swift_getKeyPath();
  sub_63C4(&qword_411F8);
  swift_storeEnumTagMultiPayload();
  _s12SystemPlugin21IntentsUIStandardViewV14_actionHandler33_B186D5490C027C03FE29A950973ABEA69SnippetUI06ActionG0Vvpfi_0();
  sub_103E4(a1, a2);
  sub_28A58((uint64_t)&qword_418C0);
  unint64_t v31 = a2;
  uint64_t v17 = v30;
  sub_32F08();
  if (v17)
  {
    sub_1043C(a1, v31);

    sub_158E8((uint64_t)v16, &qword_418C8);
    sub_338B8();
    sub_EC24();
    sub_15C04();
    return v18();
  }
  else
  {
    uint64_t v20 = v28;
    (*(void (**)(uint64_t, char *, uint64_t))(v28 + 32))(a3, v12, v6);
    uint64_t v21 = (uint64_t)v29;
    (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v29, a3, v6);
    id v22 = objc_allocWithZone((Class)type metadata accessor for IntentsUIStandardViewModel());
    sub_29CC(v21, 0, 0);
    unint64_t v23 = (uint64_t *)(a3 + v13[8]);
    sub_28A58((uint64_t)&qword_418D0);
    uint64_t v24 = sub_332D8();
    uint64_t v26 = v25;
    uint64_t result = sub_1043C(a1, v31);
    uint64_t *v23 = v24;
    v23[1] = v26;
  }
  return result;
}

uint64_t type metadata accessor for IntentsUIStandardView()
{
  uint64_t result = qword_42958;
  if (!qword_42958) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void *sub_282B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  double v14 = sub_2C5EC(a1);
  if (!v15) {
    double v14 = -INFINITY;
  }
  double v16 = v4;
  if (v5) {
    double v16 = v14;
  }
  double v17 = v6;
  if (v7) {
    double v17 = v16;
  }
  if (v14 > v16 || v16 > v17) {
    goto LABEL_22;
  }
  double v19 = v8;
  if (v9) {
    double v19 = -INFINITY;
  }
  double v20 = v13;
  if (v11) {
    double v20 = v19;
  }
  double v21 = v12;
  if (v10) {
    double v21 = v20;
  }
  if (v19 > v20 || v20 > v21)
  {
LABEL_22:
    sub_33CA8();
    unint64_t v23 = (void *)sub_335A8();
    sub_331A8();
  }
  sub_33318();
  sub_33858();
  sub_EC24();
  (*(void (**)(uint64_t, uint64_t))(v24 + 16))(a2, v2);
  uint64_t v25 = sub_63C4(&qword_42890);
  return memcpy((void *)(a2 + *(int *)(v25 + 36)), __src, 0x70uLL);
}

void *sub_2845C@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
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
    sub_33CA8();
    unint64_t v23 = (void *)sub_335A8();
    sub_331A8();
  }
  sub_33318();
  sub_2C520(v13, a9, &qword_428D8);
  uint64_t v24 = sub_63C4(&qword_428E0);
  return memcpy((void *)(a9 + *(int *)(v24 + 36)), __src, 0x70uLL);
}

uint64_t sub_285FC@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, void *a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16)
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
    sub_33CA8();
    uint64_t v25 = (void *)sub_335A8();
    sub_331A8();
  }
  sub_33318();
  *a9 = a16;
  memcpy(a9 + 1, __src, 0x70uLL);

  return swift_retain();
}

uint64_t *sub_28794@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  double v14 = sub_2C5EC(a1);
  if (!v15) {
    double v14 = -INFINITY;
  }
  double v16 = v4;
  if (v5) {
    double v16 = v14;
  }
  double v17 = v6;
  if (v7) {
    double v17 = v16;
  }
  if (v14 > v16 || v16 > v17) {
    goto LABEL_22;
  }
  double v19 = v8;
  if (v9) {
    double v19 = -INFINITY;
  }
  double v20 = v13;
  if (v11) {
    double v20 = v19;
  }
  double v21 = v12;
  if (v10) {
    double v21 = v20;
  }
  if (v19 > v20 || v20 > v21)
  {
LABEL_22:
    sub_33CA8();
    unint64_t v23 = (void *)sub_335A8();
    sub_331A8();
  }
  sub_33318();
  memcpy((void *)a2, v2, 0x60uLL);
  memcpy((void *)(a2 + 96), __src, 0x70uLL);

  return sub_2C458((uint64_t *)v2);
}

uint64_t IntentsUIStandardView.model.getter@<X0>(uint64_t a1@<X8>)
{
  sub_32F78();
  sub_EC24();
  char v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);

  return v5(a1, v1, v3);
}

uint64_t sub_28988()
{
  return sub_333C8();
}

uint64_t sub_289AC()
{
  return sub_333C8();
}

uint64_t sub_289D0(uint64_t a1)
{
  uint64_t v3 = sub_63C4(&qword_428F8);
  __chkstk_darwin(v3 - 8);
  sub_1AF1C();
  sub_2C520(a1, v1, &qword_428F8);
  return sub_333D8();
}

unint64_t sub_28A58(uint64_t a1)
{
  unint64_t result = sub_2C6B8(a1);
  if (!result)
  {
    v3(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

uint64_t property wrapper backing initializer of IntentsUIStandardView.viewModel()
{
  swift_getObjectType();
  sub_28A58((uint64_t)&qword_418D0);

  return sub_332D8();
}

void IntentsUIStandardView.body.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  sub_2C5D4();
  a19 = v21;
  a20 = v22;
  uint64_t v23 = v20;
  uint64_t v25 = v24;
  uint64_t v26 = type metadata accessor for IntentsUIStandardView();
  uint64_t v27 = sub_938C(v26);
  uint64_t v29 = v28;
  uint64_t v31 = *(void *)(v30 + 64);
  __chkstk_darwin(v27);
  uint64_t v32 = sub_63C4(&qword_428D8);
  __chkstk_darwin(v32 - 8);
  sub_15C10();
  uint64_t v35 = v34 - v33;
  uint64_t v36 = sub_63C4(&qword_428E0);
  __chkstk_darwin(v36 - 8);
  sub_15C10();
  uint64_t v39 = v38 - v37;
  *(void *)uint64_t v35 = sub_334C8();
  *(void *)(v35 + 8) = 0;
  *(unsigned char *)(v35 + 16) = 0;
  sub_63C4(&qword_428E8);
  sub_28D24(v23);
  sub_33808();
  sub_2845C(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v39, 0.0, 1, 0.0, 1);
  sub_158E8(v35, &qword_428D8);
  sub_2A0B4(v23, (uint64_t)&a9 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v40 = (*(unsigned __int8 *)(v29 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80);
  uint64_t v41 = swift_allocObject();
  sub_2A11C((uint64_t)&a9 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0), v41 + v40);
  sub_2C520(v39, v25, &qword_428E0);
  uint64_t v42 = (uint64_t (**)())(v25 + *(int *)(sub_63C4(&qword_428F0) + 36));
  *uint64_t v42 = sub_2A180;
  v42[1] = (uint64_t (*)())v41;
  v42[2] = 0;
  v42[3] = 0;
  sub_158E8(v39, &qword_428E0);
  sub_2C5BC();
}

uint64_t sub_28D24(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for IntentsUIStandardView();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2 - 8);
  uint64_t v5 = *(void *)(sub_27C0() + 16);
  swift_bridgeObjectRelease();
  v9[0] = 0;
  v9[1] = v5;
  swift_getKeyPath();
  sub_2A0B4(a1, (uint64_t)v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = swift_allocObject();
  sub_2A11C((uint64_t)v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6);
  sub_63C4(&qword_429C0);
  sub_63C4(&qword_429C8);
  sub_2B1DC();
  sub_2B2A4();
  return sub_337F8();
}

uint64_t sub_28EA8@<X0>(unint64_t *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v56 = a3;
  uint64_t v57 = a2;
  uint64_t v4 = type metadata accessor for IntentsUIStandardView();
  uint64_t v49 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v50 = v5;
  uint64_t v51 = (char *)&v48 - (((unint64_t)v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_330F8();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  char v9 = (char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_63C4(&qword_42A38);
  __chkstk_darwin(v10 - 8);
  double v12 = (char *)&v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = sub_63C4(&qword_42A40);
  __chkstk_darwin(v54);
  double v14 = (uint64_t *)((char *)&v48 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v15 = sub_63C4(&qword_41768);
  __chkstk_darwin(v15 - 8);
  double v17 = (char *)&v48 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = sub_63C4(&qword_42A48);
  uint64_t v53 = *(void *)(v55 - 8);
  uint64_t v18 = __chkstk_darwin(v55);
  uint64_t v20 = (char *)&v48 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  uint64_t v52 = (char *)&v48 - v21;
  unint64_t v22 = *a1;
  uint64_t v23 = (uint64_t)v57;
  uint64_t result = sub_27C0();
  if ((v22 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (v22 >= *(void *)(result + 16))
  {
LABEL_11:
    __break(1u);
    return result;
  }
  sub_2B5D4(result + 48 * v22 + 32, (uint64_t)v64);
  swift_bridgeObjectRelease();
  if (v65)
  {
    sub_2B630(v64, (uint64_t)&v58);
    sub_29D64((uint64_t)v9);
    sub_33878();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    uint64_t v25 = sub_33888();
    if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v12, 1, v25) == 1)
    {
      sub_158E8((uint64_t)v12, &qword_42A38);
      uint64_t v26 = 0;
      uint64_t v27 = 0;
      uint64_t v28 = 0;
    }
    else
    {
      uint64_t v26 = sub_33868();
      (*(void (**)(char *, uint64_t))(*(void *)(v25 - 8) + 8))(v12, v25);
      uint64_t v41 = (uint64_t)v51;
      sub_2A0B4(v23, (uint64_t)v51);
      unint64_t v42 = (*(unsigned __int8 *)(v49 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v49 + 80);
      uint64_t v28 = swift_allocObject();
      sub_2A11C(v41, v28 + v42);
      uint64_t v27 = sub_2B7D4;
    }
    uint64_t *v14 = v26;
    v14[1] = (uint64_t)v27;
    v14[3] = 0;
    void v14[4] = 0;
    v14[2] = v28;
    swift_storeEnumTagMultiPayload();
    sub_63C4(&qword_42A20);
    uint64_t v43 = sub_6728(&qword_429E8);
    uint64_t v44 = sub_32E48();
    uint64_t v45 = sub_6728(&qword_429F0);
    unint64_t v46 = sub_2B3BC((uint64_t)&unk_429F8);
    unint64_t v47 = sub_2B434();
    uint64_t v66 = v43;
    uint64_t v67 = v44;
    uint64_t v68 = v45;
    unint64_t v69 = v46;
    *(void *)&long long v70 = v47;
    swift_getOpaqueTypeConformance2();
    sub_2B540();
    sub_334F8();
    return sub_6804((uint64_t)&v58);
  }
  else
  {
    uint64_t v29 = (char *)*(id *)&v64[0];
    uint64_t v51 = v29;
    [v29 preferredContentSize];
    sub_33808();
    sub_332A8();
    id v58 = v29;
    uint64_t v59 = v66;
    LOBYTE(v60) = v67;
    unint64_t v61 = v68;
    LOBYTE(v62) = v69;
    long long v63 = v70;
    uint64_t v30 = sub_32F68();
    uint64_t v50 = &v48;
    __chkstk_darwin(v30);
    *(&v48 - 2) = v23;
    uint64_t v57 = (void *)sub_63C4(&qword_429E8);
    uint64_t v31 = sub_32E48();
    uint64_t v32 = sub_63C4(&qword_429F0);
    unint64_t v33 = sub_2B3BC((uint64_t)&unk_429F8);
    unint64_t v34 = sub_2B434();
    uint64_t v35 = v20;
    uint64_t v36 = v31;
    sub_33678();
    sub_158E8((uint64_t)v17, &qword_41768);

    uint64_t v37 = v53;
    uint64_t v38 = v52;
    uint64_t v39 = v35;
    uint64_t v40 = v55;
    (*(void (**)(char *, char *, uint64_t))(v53 + 32))(v52, v39, v55);
    (*(void (**)(uint64_t *, char *, uint64_t))(v37 + 16))(v14, v38, v40);
    swift_storeEnumTagMultiPayload();
    sub_63C4(&qword_42A20);
    id v58 = v57;
    uint64_t v59 = v36;
    uint64_t v60 = v32;
    unint64_t v61 = v33;
    unint64_t v62 = v34;
    swift_getOpaqueTypeConformance2();
    sub_2B540();
    sub_334F8();

    return (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v38, v40);
  }
}

uint64_t sub_29668@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v26 = a3;
  uint64_t v27 = a2;
  uint64_t v6 = sub_63C4(&qword_42A10);
  uint64_t v7 = v6 - 8;
  __chkstk_darwin(v6);
  char v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void **)a1;
  uint64_t v11 = *(void *)(a1 + 8);
  char v12 = *(unsigned char *)(a1 + 16);
  uint64_t v13 = *(void *)(a1 + 24);
  char v14 = *(unsigned char *)(a1 + 32);
  uint64_t v15 = *(void *)(a1 + 40);
  uint64_t v24 = *(void *)(a1 + 48);
  uint64_t v25 = v15;
  uint64_t v16 = sub_33808();
  uint64_t v18 = v17;
  sub_29798(v26, v27, (uint64_t)v9);
  uint64_t v19 = (uint64_t *)&v9[*(int *)(v7 + 44)];
  *uint64_t v19 = v16;
  v19[1] = v18;
  uint64_t v20 = sub_63C4(&qword_429F0);
  sub_2C520((uint64_t)v9, a4 + *(int *)(v20 + 36), &qword_42A10);
  *(void *)a4 = v10;
  *(void *)(a4 + 8) = v11;
  *(unsigned char *)(a4 + 16) = v12;
  *(void *)(a4 + 24) = v13;
  *(unsigned char *)(a4 + 32) = v14;
  uint64_t v21 = v24;
  *(void *)(a4 + 40) = v25;
  *(void *)(a4 + 48) = v21;
  id v22 = v10;
  return sub_158E8((uint64_t)v9, &qword_42A10);
}

uint64_t sub_29798@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v19 = a2;
  uint64_t v20 = a3;
  uint64_t v4 = sub_32E48();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4);
  uint64_t v7 = type metadata accessor for IntentsUIStandardView();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  __chkstk_darwin(v7 - 8);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_336E8();
  uint64_t v11 = sub_33708();
  swift_release();
  uint64_t v12 = sub_33808();
  sub_285FC(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v35, 0.0, 1, INFINITY, 0, v12, v13, v11);
  swift_release();
  uint64_t v21 = v35[0];
  uint64_t v22 = v35[1];
  char v23 = v36;
  uint64_t v24 = v37;
  char v25 = v38;
  uint64_t v26 = v39;
  char v27 = v40;
  uint64_t v28 = v41;
  char v29 = v42;
  uint64_t v30 = v43;
  char v31 = v44;
  uint64_t v32 = v45;
  char v33 = v46;
  long long v34 = v47;
  sub_2A0B4(a1, (uint64_t)v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v19, v4);
  unint64_t v14 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  unint64_t v15 = (v9 + *(unsigned __int8 *)(v5 + 80) + v14) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v16 = swift_allocObject();
  sub_2A11C((uint64_t)v10, v16 + v14);
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v16 + v15, (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  sub_63C4(&qword_42A50);
  sub_2BACC((uint64_t)&unk_42A58);
  sub_336A8();
  swift_release();
  return swift_release();
}

uint64_t sub_29AF0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_63C4(&qword_41760);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_63C4(&qword_41768);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_63C4(&qword_41770);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for IntentsUIStandardView();
  sub_33898();
  uint64_t v12 = sub_33938();
  if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v11, 1, v12) == 1) {
    return sub_158E8((uint64_t)v11, &qword_41770);
  }
  uint64_t v14 = sub_32E48();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v8, a2, v14);
  _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v8, 0, 1, v14);
  uint64_t v15 = enum case for InteractionType.componentTapped(_:);
  uint64_t v16 = sub_338C8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 104))(v5, v15, v16);
  _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v5, 0, 1, v16);
  sub_33928();
  sub_158E8((uint64_t)v5, &qword_41760);
  sub_158E8((uint64_t)v8, &qword_41768);
  return (*(uint64_t (**)(char *, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
}

uint64_t sub_29D64@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_331C8();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_63C4(&qword_428F8);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for IntentsUIStandardView();
  sub_2C20C();
  uint64_t v9 = sub_330F8();
  if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v8, 1, v9) == 1)
  {
    sub_158E8((uint64_t)v8, &qword_428F8);
    if (qword_411C0 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_7150(v2, (uint64_t)qword_44260);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v11, v2);
    sub_1AFF4((uint64_t)"SystemPlugin/IntentsUIStandardView.swift", 40, 2, 77, (uint64_t)v5);
  }
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v9 - 8) + 32))(a1, v8, v9);
}

void sub_29F80(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + *(int *)(type metadata accessor for IntentsUIStandardView() + 20));
  if (v1)
  {
    id v2 = v1;
    uint64_t v3 = (void *)sub_33988();

    if (v3)
    {
      if ([v3 respondsToSelector:"informHostOfViewResize:"]) {
        objc_msgSend(v3, "informHostOfViewResize:", 0.0, 0.0);
      }
      swift_unknownObjectRelease();
    }
  }
  else
  {
    sub_339B8();
    sub_28A58((uint64_t)&qword_421F0);
    sub_33328();
    __break(1u);
  }
}

uint64_t sub_2A07C()
{
  return sub_2D5C();
}

uint64_t sub_2A0B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for IntentsUIStandardView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2A11C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for IntentsUIStandardView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2A180()
{
  return sub_2B7EC((uint64_t (*)(uint64_t))sub_2A07C);
}

uint64_t sub_2A198()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for IntentsUIStandardView(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_32F78();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    uint64_t v10 = (uint64_t *)((char *)a1 + v8);
    uint64_t v11 = (char *)a2 + v8;
    uint64_t v13 = *(void **)v11;
    uint64_t v12 = *((void *)v11 + 1);
    *uint64_t v10 = v13;
    v10[1] = v12;
    uint64_t v14 = (uint64_t *)((char *)a1 + v9);
    uint64_t v15 = (uint64_t *)((char *)a2 + v9);
    id v16 = v13;
    sub_63C4(&qword_411F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v17 = sub_330F8();
      if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v15, 1, v17))
      {
        uint64_t v18 = sub_63C4(&qword_428F8);
        memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v17 - 8) + 16))(v14, v15, v17);
        _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v14, 0, 1, v17);
      }
    }
    else
    {
      void *v14 = *v15;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v20 = a3[7];
    uint64_t v21 = (char *)a1 + v20;
    uint64_t v22 = (char *)a2 + v20;
    uint64_t v23 = sub_338B8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 16))(v21, v22, v23);
    uint64_t v24 = a3[8];
    char v25 = (uint64_t *)((char *)a1 + v24);
    uint64_t v26 = (uint64_t *)((char *)a2 + v24);
    uint64_t v28 = *v26;
    char v27 = (void *)v26[1];
    *char v25 = v28;
    v25[1] = v27;
    id v29 = v27;
  }
  return a1;
}

void destroy for IntentsUIStandardView(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_32F78();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);

  uint64_t v5 = a1 + a2[6];
  sub_63C4(&qword_411F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_330F8();
    if (!_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0(v5, 1, v6)) {
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
    }
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = a1 + a2[7];
  uint64_t v8 = sub_338B8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  uint64_t v9 = *(void **)(a1 + a2[8] + 8);
}

uint64_t initializeWithCopy for IntentsUIStandardView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_32F78();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)(a1 + v7);
  uint64_t v10 = a2 + v7;
  uint64_t v12 = *(void **)v10;
  uint64_t v11 = *(void *)(v10 + 8);
  *uint64_t v9 = v12;
  v9[1] = v11;
  uint64_t v13 = (void *)(a1 + v8);
  uint64_t v14 = (void *)(a2 + v8);
  id v15 = v12;
  sub_63C4(&qword_411F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v16 = sub_330F8();
    if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v14, 1, v16))
    {
      uint64_t v17 = sub_63C4(&qword_428F8);
      memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v16 - 8) + 16))(v13, v14, v16);
      _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v13, 0, 1, v16);
    }
  }
  else
  {
    *uint64_t v13 = *v14;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v18 = a3[7];
  uint64_t v19 = a1 + v18;
  uint64_t v20 = a2 + v18;
  uint64_t v21 = sub_338B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 16))(v19, v20, v21);
  uint64_t v22 = a3[8];
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = (uint64_t *)(a2 + v22);
  uint64_t v26 = *v24;
  char v25 = (void *)v24[1];
  void *v23 = v26;
  v23[1] = v25;
  id v27 = v25;
  return a1;
}

uint64_t assignWithCopy for IntentsUIStandardView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_32F78();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void **)(a1 + v7);
  uint64_t v11 = *(void **)(a2 + v7);
  *uint64_t v8 = v11;
  id v12 = v11;

  v8[1] = *(void *)(v9 + 8);
  if (a1 != a2)
  {
    uint64_t v13 = a3[6];
    uint64_t v14 = (void *)(a1 + v13);
    id v15 = (void *)(a2 + v13);
    sub_158E8(a1 + v13, &qword_411F8);
    sub_63C4(&qword_411F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v16 = sub_330F8();
      if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v15, 1, v16))
      {
        uint64_t v17 = sub_63C4(&qword_428F8);
        memcpy(v14, v15, *(void *)(*(void *)(v17 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
        _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v14, 0, 1, v16);
      }
    }
    else
    {
      void *v14 = *v15;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v18 = a3[7];
  uint64_t v19 = a1 + v18;
  uint64_t v20 = a2 + v18;
  uint64_t v21 = sub_338B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 24))(v19, v20, v21);
  uint64_t v22 = a3[8];
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = (void *)(a2 + v22);
  void *v23 = *v24;
  char v25 = (void *)v24[1];
  uint64_t v26 = (void *)v23[1];
  v23[1] = v25;
  id v27 = v25;

  return a1;
}

uint64_t initializeWithTake for IntentsUIStandardView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_32F78();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_63C4(&qword_411F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_330F8();
    if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v9, 1, v11))
    {
      uint64_t v12 = sub_63C4(&qword_428F8);
      memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v11 - 8) + 32))(v8, v9, v11);
      _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v8, 0, 1, v11);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
  }
  uint64_t v13 = a3[7];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = sub_338B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 32))(v14, v15, v16);
  *(_OWORD *)(a1 + a3[8]) = *(_OWORD *)(a2 + a3[8]);
  return a1;
}

uint64_t assignWithTake for IntentsUIStandardView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_32F78();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = *(void **)(a1 + v7);
  *uint64_t v8 = *v9;

  v8[1] = v9[1];
  if (a1 != a2)
  {
    uint64_t v11 = a3[6];
    uint64_t v12 = (void *)(a1 + v11);
    uint64_t v13 = (const void *)(a2 + v11);
    sub_158E8(a1 + v11, &qword_411F8);
    uint64_t v14 = sub_63C4(&qword_411F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v15 = sub_330F8();
      if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v13, 1, v15))
      {
        uint64_t v16 = sub_63C4(&qword_428F8);
        memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, const void *, uint64_t))(*(void *)(v15 - 8) + 32))(v12, v13, v15);
        _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v12, 0, 1, v15);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v12, v13, *(void *)(*(void *)(v14 - 8) + 64));
    }
  }
  uint64_t v17 = a3[7];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  uint64_t v20 = sub_338B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 40))(v18, v19, v20);
  uint64_t v21 = a3[8];
  uint64_t v22 = (void *)(a1 + v21);
  uint64_t v23 = (uint64_t *)(a2 + v21);
  uint64_t v25 = *v23;
  uint64_t v24 = v23[1];
  uint64_t v26 = (void *)v22[1];
  *uint64_t v22 = v25;
  v22[1] = v24;

  return a1;
}

uint64_t getEnumTagSinglePayload for IntentsUIStandardView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_2AD54);
}

uint64_t sub_2AD54(uint64_t a1, uint64_t a2, int *a3)
{
  sub_32F78();
  sub_EC0C();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
LABEL_8:
    return _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0(v9, a2, v8);
  }
  sub_63C4(&qword_418C8);
  sub_EC0C();
  if (*(_DWORD *)(v11 + 84) == a2)
  {
    uint64_t v8 = v10;
    uint64_t v12 = a3[6];
LABEL_7:
    uint64_t v9 = a1 + v12;
    goto LABEL_8;
  }
  sub_338B8();
  sub_EC0C();
  if (*(_DWORD *)(v14 + 84) == a2)
  {
    uint64_t v8 = v13;
    uint64_t v12 = a3[7];
    goto LABEL_7;
  }
  unint64_t v16 = *(void *)(a1 + a3[8] + 8);
  if (v16 >= 0xFFFFFFFF) {
    LODWORD(v16) = -1;
  }
  return (v16 + 1);
}

uint64_t storeEnumTagSinglePayload for IntentsUIStandardView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_2AE48);
}

void sub_2AE48(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  sub_32F78();
  sub_EC0C();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    sub_63C4(&qword_418C8);
    sub_EC0C();
    if (*(_DWORD *)(v13 + 84) == a3)
    {
      uint64_t v10 = v12;
      uint64_t v14 = a4[6];
    }
    else
    {
      sub_338B8();
      sub_EC0C();
      if (*(_DWORD *)(v16 + 84) != a3)
      {
        *(void *)(a1 + a4[8] + 8) = (a2 - 1);
        return;
      }
      uint64_t v10 = v15;
      uint64_t v14 = a4[7];
    }
    uint64_t v11 = a1 + v14;
  }

  _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v11, a2, a2, v10);
}

void sub_2AF24()
{
  sub_32F78();
  if (v0 <= 0x3F)
  {
    sub_2B038();
    if (v1 <= 0x3F)
    {
      sub_338B8();
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_2B038()
{
  if (!qword_42968)
  {
    sub_6728(&qword_428F8);
    unint64_t v0 = sub_33288();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_42968);
    }
  }
}

unint64_t sub_2B094()
{
  return sub_2B3BC((uint64_t)&unk_429A8);
}

unint64_t sub_2B0D8()
{
  unint64_t result = qword_429B0;
  if (!qword_429B0)
  {
    sub_6728(&qword_428E0);
    sub_2B500((uint64_t)&unk_429B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_429B0);
  }
  return result;
}

uint64_t sub_2B17C@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = type metadata accessor for IntentsUIStandardView();
  sub_EC34(v5);
  uint64_t v7 = (void *)(v2 + ((*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80)));

  return sub_28EA8(a1, v7, a2);
}

unint64_t sub_2B1DC()
{
  unint64_t result = qword_429D0;
  if (!qword_429D0)
  {
    sub_6728(&qword_429C0);
    sub_2B258();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_429D0);
  }
  return result;
}

unint64_t sub_2B258()
{
  unint64_t result = qword_429D8;
  if (!qword_429D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_429D8);
  }
  return result;
}

unint64_t sub_2B2A4()
{
  unint64_t result = qword_429E0;
  if (!qword_429E0)
  {
    sub_6728(&qword_429C8);
    sub_6728(&qword_429E8);
    sub_32E48();
    sub_6728(&qword_429F0);
    sub_2B3BC((uint64_t)&unk_429F8);
    sub_2B434();
    swift_getOpaqueTypeConformance2();
    sub_2B540();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_429E0);
  }
  return result;
}

unint64_t sub_2B3BC(uint64_t a1)
{
  unint64_t result = sub_2C6B8(a1);
  if (!result)
  {
    uint64_t v5 = v4;
    sub_6728(v3);
    v5();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_2B434()
{
  unint64_t result = qword_42A00;
  if (!qword_42A00)
  {
    sub_6728(&qword_429F0);
    sub_2B3BC((uint64_t)&unk_429F8);
    sub_2B500((uint64_t)&unk_42A08);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_42A00);
  }
  return result;
}

unint64_t sub_2B500(uint64_t a1)
{
  unint64_t result = sub_2C6B8(a1);
  if (!result)
  {
    sub_6728(v3);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_2B540()
{
  unint64_t result = qword_42A18;
  if (!qword_42A18)
  {
    sub_6728(&qword_42A20);
    sub_2BACC((uint64_t)&unk_42A28);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_42A18);
  }
  return result;
}

uint64_t sub_2B5D4(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_2B630(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_2B64C()
{
  type metadata accessor for IntentsUIStandardView();
  sub_2C584();
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v6 = *(void *)(v5 + 64);
  sub_32F78();
  sub_EC24();
  sub_15C04();
  v7();

  uint64_t v8 = v1 + v4 + v0[6];
  sub_63C4(&qword_411F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = sub_330F8();
    if (!_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0(v8, 1, v9))
    {
      sub_15C04();
      v10();
    }
  }
  else
  {
    swift_release();
  }
  sub_338B8();
  sub_EC24();
  sub_15C04();
  v11();

  return _swift_deallocObject(v1, v4 + v6, v3 | 7);
}

uint64_t sub_2B7D4()
{
  return sub_2B7EC((uint64_t (*)(uint64_t))sub_29F80);
}

uint64_t sub_2B7EC(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = type metadata accessor for IntentsUIStandardView();
  sub_EC34(v2);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return a1(v4);
}

uint64_t sub_2B840@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_29668(a1, a2, *(void *)(v3 + 16), a3);
}

uint64_t sub_2B848()
{
  type metadata accessor for IntentsUIStandardView();
  sub_2C584();
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v20 = *(void *)(v5 + 64);
  uint64_t v6 = sub_32E48();
  sub_9370();
  uint64_t v8 = v7;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v19 = *(void *)(v10 + 64);
  uint64_t v11 = v1 + v4;
  sub_32F78();
  sub_EC24();
  sub_15C04();
  v12();

  uint64_t v13 = v1 + v4 + v0[6];
  sub_63C4(&qword_411F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v14 = sub_330F8();
    if (!_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0(v13, 1, v14))
    {
      sub_15C04();
      v15();
    }
  }
  else
  {
    swift_release();
  }
  uint64_t v16 = (v4 + v20 + v9) & ~v9;
  sub_338B8();
  sub_EC24();
  sub_15C04();
  v17();

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v1 + v16, v6);

  return _swift_deallocObject(v1, v16 + v19, v3 | v9 | 7);
}

uint64_t sub_2BA44()
{
  uint64_t v1 = type metadata accessor for IntentsUIStandardView();
  sub_938C(v1);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = *(void *)(v4 + 64);
  uint64_t v6 = sub_32E48();
  sub_EC34(v6);
  uint64_t v8 = v0 + ((v3 + v5 + *(unsigned __int8 *)(v7 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));

  return sub_29AF0(v0 + v3, v8);
}

unint64_t sub_2BACC(uint64_t a1)
{
  unint64_t result = sub_2C6B8(a1);
  if (!result)
  {
    sub_6728(v3);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

void sub_2BB38()
{
  sub_2C5D4();
  char v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = sub_33498();
  sub_9370();
  uint64_t v7 = v6;
  __chkstk_darwin(v8);
  sub_2C56C();
  if ((v2 & 1) == 0)
  {
    swift_retain();
    os_log_type_t v9 = sub_33CA8();
    uint64_t v10 = sub_335A8();
    if (os_log_type_enabled(v10, v9))
    {
      sub_2C630();
      sub_2C648();
      sub_2C6C4(4.8149e-34);
      uint64_t v12 = sub_10310(0x6D6F696449585256, 0xE800000000000000, v11);
      sub_2C608(v12);
      sub_2C698(&dword_0, v13, v14, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.");
      swift_arrayDestroy();
      sub_2C5A4();
      sub_2C5A4();
    }

    sub_33488();
    swift_getAtKeyPath();
    sub_139F8(v4, 0);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0, v5);
  }
  sub_2C5BC();
}

void sub_2BCA0()
{
  sub_2C5D4();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = sub_33498();
  sub_9370();
  uint64_t v7 = v6;
  __chkstk_darwin(v8);
  sub_1AF1C();
  if ((v2 & 0x100) == 0)
  {
    swift_retain();
    os_log_type_t v9 = sub_33CA8();
    uint64_t v10 = sub_335A8();
    if (os_log_type_enabled(v10, v9))
    {
      uint64_t v11 = (_DWORD *)sub_2C630();
      uint64_t v14 = swift_slowAlloc();
      *uint64_t v11 = 136315138;
      sub_10310(0xD000000000000011, 0x8000000000037F70, &v14);
      sub_33D48();
      sub_2C664(&dword_0, v12, v13, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.");
      swift_arrayDestroy();
      sub_2C5A4();
      sub_2C5A4();
    }

    sub_33488();
    swift_getAtKeyPath();
    sub_13A04(v4, v2, 0);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0, v5);
  }
  sub_2C5BC();
}

void sub_2BE50()
{
}

void sub_2BE7C()
{
  sub_2C5D4();
  char v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = sub_33498();
  sub_9370();
  uint64_t v7 = v6;
  __chkstk_darwin(v8);
  sub_2C56C();
  if ((v2 & 1) == 0)
  {
    swift_retain();
    os_log_type_t v9 = sub_33CA8();
    uint64_t v10 = sub_335A8();
    if (os_log_type_enabled(v10, v9))
    {
      sub_2C630();
      sub_2C648();
      sub_2C6C4(4.8149e-34);
      uint64_t v12 = sub_10310(0x74616F6C464743, 0xE700000000000000, v11);
      sub_2C608(v12);
      sub_2C698(&dword_0, v13, v14, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.");
      swift_arrayDestroy();
      sub_2C5A4();
      sub_2C5A4();
    }

    sub_33488();
    swift_getAtKeyPath();
    sub_139F8(v4, 0);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0, v5);
  }
  sub_2C5BC();
}

void sub_2BFE8()
{
  sub_2C5D4();
  uint64_t v3 = v0;
  uint64_t v5 = v4;
  uint64_t v6 = sub_33498();
  sub_9370();
  uint64_t v8 = v7;
  __chkstk_darwin(v9);
  sub_2C56C();
  sub_63C4(&qword_41AD8);
  sub_EC24();
  __chkstk_darwin(v10);
  sub_1AF1C();
  sub_2C520(v3, v2, &qword_41AD8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_332F8();
    sub_EC24();
    (*(void (**)(uint64_t, uint64_t))(v11 + 32))(v5, v2);
  }
  else
  {
    os_log_type_t v12 = sub_33CA8();
    uint64_t v13 = sub_335A8();
    if (os_log_type_enabled(v13, v12))
    {
      uint64_t v14 = (_DWORD *)sub_2C630();
      uint64_t v18 = swift_slowAlloc();
      _DWORD *v14 = 136315138;
      uint64_t v15 = sub_10310(0x694474756F79614CLL, 0xEF6E6F6974636572, &v18);
      sub_2C684(v15);
      sub_33D48();
      sub_2C664(&dword_0, v16, v17, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.");
      swift_arrayDestroy();
      sub_2C5A4();
      sub_2C5A4();
    }

    sub_33488();
    swift_getAtKeyPath();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v1, v6);
  }
  sub_2C5BC();
}

void sub_2C20C()
{
  sub_2C5D4();
  unint64_t v3 = v2;
  uint64_t v23 = v4;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v9 = v0;
  uint64_t v11 = v10;
  uint64_t v12 = sub_33498();
  sub_9370();
  uint64_t v14 = v13;
  __chkstk_darwin(v15);
  sub_2C56C();
  sub_63C4(v8);
  sub_EC24();
  __chkstk_darwin(v16);
  sub_15C10();
  uint64_t v19 = v18 - v17;
  sub_2C520(v9, v18 - v17, v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_2C40C(v19, (uint64_t)v11, v6);
  }
  else
  {
    os_log_type_t v20 = sub_33CA8();
    uint64_t v21 = sub_335A8();
    if (os_log_type_enabled(v21, v20))
    {
      sub_2C630();
      uint64_t v24 = sub_2C648();
      *(_DWORD *)uint64_t v11 = 136315138;
      uint64_t v22 = sub_10310(v23, v3, &v24);
      sub_2C684(v22);
      sub_33D48();
      _os_log_impl(&dword_0, v21, v20, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
      swift_arrayDestroy();
      sub_2C5A4();
      sub_2C5A4();
    }

    sub_33488();
    swift_getAtKeyPath();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v1, v12);
  }
  sub_2C5BC();
}

uint64_t sub_2C40C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_24650(a1, a2, a3);
  sub_EC24();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(v3, v4);
  return v3;
}

uint64_t *sub_2C458(uint64_t *a1)
{
  return a1;
}

uint64_t sub_2C4CC(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_2C510(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_2C510(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_2C520(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_24650(a1, a2, a3);
  sub_EC24();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v3, v4);
  return v3;
}

uint64_t sub_2C5A4()
{
  return swift_slowDealloc();
}

double sub_2C5EC(uint64_t a1)
{
  return *(double *)&a1;
}

uint64_t sub_2C608(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return sub_33D48();
}

uint64_t sub_2C630()
{
  return swift_slowAlloc();
}

uint64_t sub_2C648()
{
  return swift_slowAlloc();
}

void sub_2C664(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t sub_2C684(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return v1 - 96;
}

void sub_2C698(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t sub_2C6B8(uint64_t a1)
{
  return *(void *)a1;
}

void sub_2C6C4(float a1)
{
  *uint64_t v1 = a1;
}

uint64_t CircleImageView.init(model:)(uint64_t *a1)
{
  uint64_t v3 = sub_32C38();
  sub_9370();
  uint64_t v5 = v4;
  __chkstk_darwin(v6);
  sub_2D558();
  sub_339B8();
  sub_2CEA4((unint64_t *)&qword_421F0, (void (*)(uint64_t))&type metadata accessor for Context);
  uint64_t v7 = (void *)sub_33338();
  (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v5 + 16))(v1, a1, v3);
  if ((*(unsigned int (**)(uint64_t *, uint64_t))(v5 + 88))(v1, v3) == enum case for ContactImage.visual(_:))
  {
    uint64_t v8 = *(void (**)(uint64_t *, uint64_t))(v5 + 8);
    id v15 = v7;
    v8(a1, v3);
    (*(void (**)(uint64_t *, uint64_t))(v5 + 96))(v1, v3);
    uint64_t v3 = *v1;
  }
  else
  {
    uint64_t v9 = *(void (**)(uint64_t *, uint64_t))(v5 + 8);
    v9(v1, v3);
    if (qword_411C0 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_331C8();
    sub_7150(v10, (uint64_t)qword_44260);
    uint64_t v11 = sub_331B8();
    os_log_type_t v12 = sub_33C98();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_0, v11, v12, "Provided model is not a visual model.", v13, 2u);
      swift_slowDealloc();
    }

    sub_2C96C();
    swift_allocError();
    swift_willThrow();

    v9(a1, v3);
  }
  return v3;
}

unint64_t sub_2C96C()
{
  unint64_t result = qword_42A60;
  if (!qword_42A60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_42A60);
  }
  return result;
}

uint64_t CircleImageView.body.getter@<X0>(void *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v45 = sub_32CA8();
  sub_9370();
  uint64_t v38 = v4;
  __chkstk_darwin(v5);
  sub_EC48();
  uint64_t v39 = v6;
  uint64_t v34 = sub_32C08();
  sub_9370();
  uint64_t v8 = v7;
  __chkstk_darwin(v9);
  sub_15C10();
  uint64_t v12 = v11 - v10;
  uint64_t v13 = sub_63C4(&qword_41780);
  __chkstk_darwin(v13 - 8);
  sub_EC48();
  uint64_t v14 = sub_33908();
  sub_9370();
  uint64_t v40 = v15;
  __chkstk_darwin(v16);
  sub_15C10();
  uint64_t v19 = v18 - v17;
  sub_63C4(&qword_42A68);
  sub_9370();
  uint64_t v43 = v21;
  uint64_t v44 = v20;
  __chkstk_darwin(v20);
  sub_EC48();
  uint64_t v23 = v22;
  sub_63C4(&qword_42A70);
  sub_9370();
  uint64_t v41 = v25;
  uint64_t v42 = v24;
  __chkstk_darwin(v24);
  sub_EC48();
  uint64_t v37 = v26;
  uint64_t v35 = sub_63C4(&qword_42A78);
  __chkstk_darwin(v35);
  sub_15C10();
  uint64_t v29 = v28 - v27;
  uint64_t v36 = sub_63C4(&qword_42A80);
  __chkstk_darwin(v36);
  sub_2D558();
  if (a1)
  {
    id v30 = a1;
    sub_33948();

    sub_33D18();
    sub_32E38();
    sub_33BA8();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v12, v34);
    sub_338F8();
    (*(void (**)(uint64_t, void, uint64_t))(v38 + 104))(v39, enum case for ImageElement.ImageStyle.contactImage5(_:), v45);
    sub_2CEA4(&qword_42A88, (void (*)(uint64_t))&type metadata accessor for VisualElementView);
    sub_33638();
    (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v39, v45);
    (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v19, v14);
    swift_getOpaqueTypeConformance2();
    sub_33658();
    (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v23, v44);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v41 + 16))(v29, v37, v42);
    *(_WORD *)(v29 + *(int *)(v35 + 36)) = 256;
    (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v37, v42);
    uint64_t KeyPath = swift_getKeyPath();
    sub_2CF44(v29, v2);
    uint64_t v32 = v2 + *(int *)(v36 + 36);
    *(void *)uint64_t v32 = KeyPath;
    *(unsigned char *)(v32 + 8) = 1;
    sub_2CFAC(v29);
    return sub_2D00C(v2, a2);
  }
  else
  {
    sub_339B8();
    sub_2CEA4((unint64_t *)&qword_421F0, (void (*)(uint64_t))&type metadata accessor for Context);
    uint64_t result = sub_33328();
    __break(1u);
  }
  return result;
}

uint64_t sub_2CEA4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2CEEC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_33368();
  *a1 = result & 1;
  return result;
}

uint64_t sub_2CF1C()
{
  return sub_33378();
}

uint64_t sub_2CF44(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_63C4(&qword_42A78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2CFAC(uint64_t a1)
{
  uint64_t v2 = sub_63C4(&qword_42A78);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2D00C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_63C4(&qword_42A80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2D074()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2D090@<X0>(uint64_t a1@<X8>)
{
  return CircleImageView.body.getter(*(void **)(v1 + 8), a1);
}

void destroy for CircleImageView(uint64_t a1)
{
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void **)(a1 + 8);
}

void *_s12SystemPlugin15CircleImageViewVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  id v4 = v3;
  return a1;
}

void *assignWithCopy for CircleImageView(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  id v4 = (void *)a1[1];
  uint64_t v5 = (void *)a2[1];
  a1[1] = v5;
  id v6 = v5;

  a1[2] = a2[2];
  return a1;
}

uint64_t assignWithTake for CircleImageView(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  id v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for CircleImageView(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 24))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CircleImageView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
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
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CircleImageView()
{
  return &type metadata for CircleImageView;
}

unint64_t sub_2D258()
{
  unint64_t result = qword_42A90;
  if (!qword_42A90)
  {
    sub_6728(&qword_42A80);
    sub_2D2F8();
    sub_EAD4(&qword_42AB0, &qword_42AB8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_42A90);
  }
  return result;
}

unint64_t sub_2D2F8()
{
  unint64_t result = qword_42A98;
  if (!qword_42A98)
  {
    sub_6728(&qword_42A78);
    sub_6728(&qword_42A68);
    sub_33908();
    sub_2CEA4(&qword_42A88, (void (*)(uint64_t))&type metadata accessor for VisualElementView);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_EAD4(&qword_42AA0, &qword_42AA8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_42A98);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for CircleImageView.Error(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x2D4D0);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for CircleImageView.Error()
{
  return &type metadata for CircleImageView.Error;
}

unint64_t sub_2D50C()
{
  unint64_t result = qword_42AC0;
  if (!qword_42AC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_42AC0);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for PlaceholderView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for PlaceholderView()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for PlaceholderView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for PlaceholderView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PlaceholderView(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 16))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PlaceholderView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for PlaceholderView()
{
  return &type metadata for PlaceholderView;
}

uint64_t sub_2D6AC()
{
  return swift_getOpaqueTypeConformance2();
}

void *sub_2D6C8@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, void *a3@<X8>)
{
  sub_334C8();
  sub_2D7F8(a1, a2, __src);
  uint64_t v5 = __src[0];
  uint64_t v6 = __src[1];
  char v7 = __src[2];
  uint64_t v8 = __src[3];
  sub_33808();
  sub_28794(0, (uint64_t)__src);
  sub_2DA4C(v5, v6, v7, v8);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return memcpy(a3, __src, 0xD0uLL);
}

uint64_t sub_2D7F8@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6 = sub_63C4(&qword_42AC8);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_63C4(&qword_42AD0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v12 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v12)
  {
    v28[0] = a1;
    v28[1] = a2;
    sub_1BF6C();
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_33628();
    uint64_t v15 = v14;
    uint64_t v17 = v16;
    uint64_t v19 = v18 & 1;
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v15 = 0;
    uint64_t v19 = 0;
    uint64_t v17 = 0;
  }
  sub_33738();
  sub_334D8();
  uint64_t v20 = sub_334E8();
  _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v11, 0, 1, v20);
  uint64_t v21 = sub_33758();
  swift_release();
  sub_2DAA0((uint64_t)v11, &qword_42AD0);
  uint64_t v22 = sub_336C8();
  uint64_t v23 = sub_336F8();
  uint64_t v24 = sub_33608();
  _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v8, 1, 1, v24);
  uint64_t v25 = sub_33618();
  sub_2DAA0((uint64_t)v8, &qword_42AC8);
  uint64_t KeyPath = swift_getKeyPath();
  *a3 = v13;
  a3[1] = v15;
  a3[2] = v19;
  a3[3] = v17;
  a3[4] = v21;
  a3[5] = v22;
  a3[6] = v23;
  a3[7] = KeyPath;
  a3[8] = v25;
  sub_2C4CC(v13, v15, v19, v17);
  return sub_2DA4C(v13, v15, v19, v17);
}

void *sub_2DA44@<X0>(void *a1@<X8>)
{
  return sub_2D6C8(*(void *)v1, *(void *)(v1 + 8), a1);
}

uint64_t sub_2DA4C(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_2DA90(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_2DA90(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_2DAA0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_63C4(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2DAFC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_33448();
  *a1 = result;
  return result;
}

uint64_t sub_2DB28()
{
  return sub_33458();
}

unint64_t sub_2DB5C()
{
  unint64_t result = qword_42AD8;
  if (!qword_42AD8)
  {
    sub_6728(&qword_42AE0);
    sub_2DBD8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_42AD8);
  }
  return result;
}

unint64_t sub_2DBD8()
{
  unint64_t result = qword_42AE8;
  if (!qword_42AE8)
  {
    sub_6728(&qword_42AF0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_42AE8);
  }
  return result;
}

uint64_t MapsOverlayView.init(model:)(uint64_t a1)
{
  uint64_t v3 = sub_32A88();
  uint64_t v4 = type metadata accessor for MapsOverlayView(v3);
  uint64_t v5 = (uint64_t *)(v1 + *(int *)(v4 + 24));
  sub_339B8();
  sub_30A8C((uint64_t)&qword_421F0);
  *uint64_t v5 = sub_33338();
  v5[1] = v6;
  uint64_t v7 = sub_32EE8();
  sub_EC0C();
  uint64_t v9 = v8;
  sub_32A40();
  v10();
  sub_32EC8();
  uint64_t v12 = v11;
  sub_32ED8();
  uint64_t v14 = v13;
  double v15 = COERCE_DOUBLE(sub_32E98());
  if (v16) {
    double v17 = 0.01;
  }
  else {
    double v17 = v15;
  }
  uint64_t v18 = sub_32EA8();
  char v20 = v19;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(a1, v7);
  double v22 = *(double *)&v18;
  if (v20) {
    double v22 = 0.01;
  }
  uint64_t v23 = v1 + *(int *)(v4 + 20);
  *(void *)uint64_t v23 = v12;
  *(void *)(v23 + 8) = v14;
  *(double *)(v23 + 16) = v17;
  *(double *)(v23 + 24) = v22;
  *(void *)(v23 + 32) = 0;
  return result;
}

uint64_t type metadata accessor for MapsOverlayView(uint64_t a1)
{
  return sub_983C(a1, qword_42B80);
}

double property wrapper backing initializer of MapsOverlayView.region@<D0>(uint64_t a1@<X8>)
{
  type metadata accessor for MKCoordinateRegion(0);
  sub_33778();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = v5;
  return result;
}

uint64_t MapsOverlayView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v5 = sub_63C4(&qword_42AF8);
  uint64_t v6 = sub_32A00(v5);
  __chkstk_darwin(v6);
  sub_2D558();
  uint64_t v7 = sub_63C4(&qword_42B00);
  uint64_t v8 = v7 - 8;
  __chkstk_darwin(v7);
  sub_2C56C();
  sub_2DF5C(v1, v3);
  sub_3096C();
  uint64_t v9 = v2 + *(int *)(v8 + 44);
  *(void *)uint64_t v9 = 0x3FF0000000000000;
  *(_WORD *)(v9 + 8) = 0;
  sub_158E8(v3, &qword_42AF8);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = 1;
  sub_3096C();
  uint64_t v12 = (uint64_t *)(a1 + *(int *)(sub_63C4(&qword_42B08) + 36));
  *uint64_t v12 = KeyPath;
  v12[1] = (uint64_t)sub_308C0;
  v12[2] = v11;
  return sub_158E8(v2, &qword_42B00);
}

uint64_t sub_2DF5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v75 = a2;
  uint64_t v76 = sub_63C4(&qword_42DF8);
  __chkstk_darwin(v76);
  long long v4 = (char *)&v71 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_33168();
  __chkstk_darwin(v5 - 8);
  uint64_t v73 = (char *)&v71 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_63C4(&qword_42D98);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v71 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_63C4(&qword_42D80);
  uint64_t v74 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v71 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_63C4(&qword_42E00);
  __chkstk_darwin(v13 - 8);
  double v15 = (char *)&v71 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_330E8();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  char v19 = (char *)&v71 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_32EB8();
  if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v15, 1, v16) == 1)
  {
    sub_158E8((uint64_t)v15, &qword_42E00);
    char v20 = (long long *)(a1 + *(int *)(type metadata accessor for MapsOverlayView(0) + 20));
    uint64_t v21 = *((void *)v20 + 4);
    long long v22 = v20[1];
    long long v82 = *v20;
    long long v83 = v22;
    *(void *)&long long v84 = v21;
    sub_63C4(&qword_42E08);
    sub_337A8();
    uint64_t v23 = sub_63C4(&qword_42DA8);
    _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v9, 1, 1, v23);
    sub_33158();
    sub_33138();
    uint64_t v24 = v74;
    (*(void (**)(char *, char *, uint64_t))(v74 + 16))(v4, v12, v10);
    swift_storeEnumTagMultiPayload();
    sub_63C4(&qword_42D38);
    sub_32368();
    sub_3297C((uint64_t)&unk_42D78);
    sub_334F8();
    return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v12, v10);
  }
  uint64_t v73 = v4;
  uint64_t v26 = *(void (**)(char *, char *, uint64_t))(v17 + 32);
  uint64_t v74 = v16;
  v26(v19, v15, v16);
  MapItems.mapAnnotation.getter();
  uint64_t v72 = v17;
  uint64_t v71 = v19;
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = type metadata accessor for MapsOverlayView(0);
    id v30 = *(void **)(a1 + *(int *)(v29 + 24));
    if (v30)
    {
      char v31 = (long long *)(a1 + *(int *)(v29 + 20));
      uint64_t v32 = *((void *)v31 + 4);
      long long v33 = v31[1];
      long long v82 = *v31;
      long long v83 = v33;
      *(void *)&long long v84 = v32;
      id v34 = v30;
      sub_63C4(&qword_42E08);
      sub_337A8();
      long long v35 = v87;
      long long v36 = v88;
      long long v37 = v89;
      *(void *)&long long v87 = v28;
      *((void *)&v87 + 1) = v30;
      long long v88 = v35;
      long long v89 = v36;
      long long v90 = v37;
      unsigned __int8 v91 = 0;
      sub_324D8();
      sub_32524();
      swift_bridgeObjectRetain();
      id v38 = v34;
      swift_retain();
      swift_retain();
      sub_334F8();
      long long v82 = v77;
      long long v83 = v78;
      long long v84 = v79;
      long long v85 = v80;
      __int16 v86 = v81;
      sub_63C4(&qword_42D58);
      sub_3249C();
      sub_32570();
      sub_334F8();
      swift_release();
      swift_release();

LABEL_9:
      swift_bridgeObjectRelease();
      uint64_t v52 = *((void *)&v87 + 1);
      uint64_t v51 = v87;
      uint64_t v54 = *((void *)&v88 + 1);
      uint64_t v53 = v88;
      uint64_t v56 = *((void *)&v89 + 1);
      uint64_t v55 = v89;
      uint64_t v58 = *((void *)&v90 + 1);
      uint64_t v57 = v90;
      if (v92) {
        __int16 v59 = 256;
      }
      else {
        __int16 v59 = 0;
      }
      __int16 v60 = v59 | v91;
      goto LABEL_13;
    }
    goto LABEL_22;
  }
  MapItems.mapMarker.getter();
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = type metadata accessor for MapsOverlayView(0);
    uint64_t v42 = *(void **)(a1 + *(int *)(v41 + 24));
    if (v42)
    {
      uint64_t v43 = (long long *)(a1 + *(int *)(v41 + 20));
      uint64_t v44 = *((void *)v43 + 4);
      long long v45 = v43[1];
      long long v82 = *v43;
      long long v83 = v45;
      *(void *)&long long v84 = v44;
      id v46 = v42;
      sub_63C4(&qword_42E08);
      sub_337A8();
      long long v47 = v87;
      long long v48 = v88;
      long long v49 = v89;
      *(void *)&long long v87 = v40;
      *((void *)&v87 + 1) = v42;
      long long v88 = v47;
      long long v89 = v48;
      long long v90 = v49;
      unsigned __int8 v91 = 1;
      sub_324D8();
      sub_32524();
      swift_bridgeObjectRetain();
      id v50 = v46;
      swift_retain();
      swift_retain();
      sub_334F8();
      long long v82 = v77;
      long long v83 = v78;
      long long v84 = v79;
      long long v85 = v80;
      __int16 v86 = v81;
      sub_63C4(&qword_42D58);
      sub_3249C();
      sub_32570();
      sub_334F8();
      swift_release();
      swift_release();

      goto LABEL_9;
    }
LABEL_22:
    sub_339B8();
    sub_30A8C((uint64_t)&qword_421F0);
    uint64_t result = sub_33328();
    __break(1u);
    return result;
  }
  MapItems.mapPin.getter();
  if (v62)
  {
    uint64_t v63 = v62;
    uint64_t v64 = type metadata accessor for MapsOverlayView(0);
    char v65 = *(void **)(a1 + *(int *)(v64 + 24));
    if (v65)
    {
      uint64_t v66 = (long long *)(a1 + *(int *)(v64 + 20));
      uint64_t v67 = *((void *)v66 + 4);
      long long v68 = v66[1];
      long long v82 = *v66;
      long long v83 = v68;
      *(void *)&long long v84 = v67;
      id v69 = v65;
      sub_63C4(&qword_42E08);
      sub_337A8();
      *(void *)&long long v82 = v63;
      *((void *)&v82 + 1) = v65;
      long long v83 = v87;
      long long v84 = v88;
      long long v85 = v89;
      __int16 v86 = 256;
      sub_63C4(&qword_42D58);
      sub_3249C();
      sub_32570();
      sub_334F8();
      uint64_t v52 = *((void *)&v87 + 1);
      uint64_t v51 = v87;
      uint64_t v54 = *((void *)&v88 + 1);
      uint64_t v53 = v88;
      uint64_t v56 = *((void *)&v89 + 1);
      uint64_t v55 = v89;
      uint64_t v58 = *((void *)&v90 + 1);
      uint64_t v57 = v90;
      if (v92) {
        __int16 v70 = 256;
      }
      else {
        __int16 v70 = 0;
      }
      __int16 v60 = v70 | v91;
      goto LABEL_13;
    }
    goto LABEL_22;
  }
  uint64_t v51 = 0;
  uint64_t v52 = 0;
  uint64_t v53 = 0;
  uint64_t v54 = 0;
  uint64_t v55 = 0;
  uint64_t v56 = 0;
  uint64_t v57 = 0;
  uint64_t v58 = 0;
  __int16 v60 = -256;
LABEL_13:
  unint64_t v61 = v73;
  *(void *)uint64_t v73 = v51;
  *((void *)v61 + 1) = v52;
  *((void *)v61 + 2) = v53;
  *((void *)v61 + 3) = v54;
  *((void *)v61 + 4) = v55;
  *((void *)v61 + 5) = v56;
  *((void *)v61 + 6) = v57;
  *((void *)v61 + 7) = v58;
  *((_WORD *)v61 + 32) = v60;
  swift_storeEnumTagMultiPayload();
  sub_63C4(&qword_42D38);
  sub_32368();
  sub_3297C((uint64_t)&unk_42D78);
  sub_334F8();
  return (*(uint64_t (**)(char *, uint64_t))(v72 + 8))(v71, v74);
}

void MapItems.mapAnnotation.getter()
{
  sub_32A6C();
  uint64_t v72 = type metadata accessor for MapIdentifiablePlace.ViewType(0);
  sub_EC24();
  __chkstk_darwin(v0);
  sub_15C10();
  uint64_t v3 = (void *)(v2 - v1);
  uint64_t v81 = sub_32BA8();
  sub_9370();
  uint64_t v5 = v4;
  __chkstk_darwin(v6);
  sub_EC48();
  uint64_t v83 = v7;
  uint64_t v8 = sub_63C4(&qword_42B10);
  uint64_t v9 = sub_32A00(v8);
  __chkstk_darwin(v9);
  sub_15C10();
  uint64_t v12 = v11 - v10;
  uint64_t v13 = sub_330D8();
  sub_9370();
  uint64_t v84 = v14;
  __chkstk_darwin(v15);
  sub_EC48();
  uint64_t v85 = v16;
  uint64_t v82 = type metadata accessor for MapIdentifiablePlace(0);
  sub_9370();
  uint64_t v80 = v17;
  __chkstk_darwin(v18);
  sub_329F0();
  uint64_t v21 = v19 - v20;
  __chkstk_darwin(v22);
  uint64_t v24 = (char *)&v70 - v23;
  uint64_t v25 = sub_330E8();
  sub_9370();
  uint64_t v27 = v26;
  __chkstk_darwin(v28);
  sub_15C10();
  char v31 = (uint64_t *)(v30 - v29);
  sub_32A40();
  v32();
  if ((*(unsigned int (**)(uint64_t *, uint64_t))(v27 + 88))(v31, v25) == enum case for MapItems.mapAnnotationItem(_:))
  {
    (*(void (**)(uint64_t *, uint64_t))(v27 + 96))(v31, v25);
    uint64_t v33 = *v31;
    int64_t v34 = *(void *)(*v31 + 16);
    if (v34)
    {
      uint64_t v71 = v3;
      __int16 v86 = _swiftEmptyArrayStorage;
      sub_3069C(0, v34, 0);
      sub_32AEC();
      uint64_t v70 = v33;
      uint64_t v36 = v33 + v35;
      uint64_t v75 = *(void *)(v37 + 56);
      uint64_t v76 = v38;
      uint64_t v84 = v37;
      uint64_t v73 = v37 - 8;
      uint64_t v74 = v5 + 32;
      uint64_t v39 = v72;
      uint64_t v78 = v13;
      uint64_t v79 = v12;
      long long v77 = v24;
      do
      {
        sub_32A40();
        v41(v40);
        sub_330B8();
        uint64_t v43 = v42;
        sub_330C8();
        uint64_t v45 = v44;
        sub_330A8();
        swift_storeEnumTagMultiPayload();
        sub_32A28();
        _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v46, v47, v48, v39);
        sub_32B98();
        uint64_t v49 = v82;
        uint64_t v50 = *(int *)(v82 + 24);
        *(void *)(v21 + v50) = 0;
        uint64_t v51 = v21 + *(int *)(v49 + 28);
        uint64_t v52 = sub_32C58();
        sub_32A34();
        _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v53, v54, v55, v52);
        sub_329C4();
        v57(v56);
        uint64_t v58 = (void *)(v21 + *(int *)(v49 + 20));
        *uint64_t v58 = v43;
        v58[1] = v45;
        if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0(v12, 1, v39) == 1)
        {
          sub_158E8(v12, &qword_42B10);
        }
        else
        {
          __int16 v59 = v71;
          sub_30918();
          if (swift_getEnumCaseMultiPayload() == 1)
          {
            sub_158E8(v51, &qword_42B18);
            sub_329B8();
            sub_329C4();
            v61(v60);
            sub_32A28();
            _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v62, v63, v64, v52);
          }
          else
          {
            *(void *)(v21 + v50) = *v59;
          }
          uint64_t v39 = v72;
        }
        sub_30918();
        sub_15C04();
        v66(v65);
        uint64_t v67 = v86;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_32AB8(v67[2]);
          uint64_t v67 = v86;
        }
        unint64_t v69 = v67[2];
        unint64_t v68 = v67[3];
        if (v69 >= v68 >> 1)
        {
          sub_3069C(v68 > 1, v69 + 1, 1);
          uint64_t v67 = v86;
        }
        v67[2] = v69 + 1;
        sub_32AEC();
        sub_30918();
        v36 += v75;
        --v34;
        uint64_t v12 = v79;
      }
      while (v34);
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t))(v27 + 8))(v31, v25);
  }
  sub_32A94();
}

void MapItems.mapMarker.getter()
{
}

void MapItems.mapPin.getter()
{
}

void sub_2EE9C()
{
  sub_32A6C();
  uint64_t v133 = v1;
  uint64_t v134 = v2;
  uint64_t v138 = v3;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v8 = type metadata accessor for MapIdentifiablePlace.ViewType(0);
  sub_EC24();
  __chkstk_darwin(v9);
  sub_329F0();
  uint64_t v12 = (void *)(v10 - v11);
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v116 - v14;
  uint64_t v132 = sub_32BA8();
  sub_9370();
  int64_t v141 = v16;
  __chkstk_darwin(v17);
  sub_1AF4C();
  uint64_t v118 = v18;
  __chkstk_darwin(v19);
  uint64_t v122 = (char *)&v116 - v20;
  uint64_t v21 = sub_63C4(&qword_42B10);
  uint64_t v22 = sub_32A00(v21);
  __chkstk_darwin(v22);
  sub_329F0();
  uint64_t v25 = v23 - v24;
  __chkstk_darwin(v26);
  uint64_t v121 = (uint64_t *)((char *)&v116 - v27);
  uint64_t v137 = sub_33058();
  sub_9370();
  uint64_t v128 = v28;
  __chkstk_darwin(v29);
  sub_EC48();
  uint64_t v136 = v30;
  uint64_t v31 = v7(0);
  sub_9370();
  uint64_t v139 = v32;
  __chkstk_darwin(v33);
  uint64_t v142 = (char *)&v116 - v34;
  uint64_t v131 = type metadata accessor for MapIdentifiablePlace(0);
  sub_9370();
  uint64_t v135 = v35;
  __chkstk_darwin(v36);
  sub_1AF4C();
  uint64_t v123 = v37;
  uint64_t v39 = __chkstk_darwin(v38);
  uint64_t v140 = (char *)&v116 - v40;
  __chkstk_darwin(v39);
  v143 = (char *)&v116 - v41;
  uint64_t v42 = sub_330E8();
  sub_9370();
  uint64_t v44 = v43;
  __chkstk_darwin(v45);
  sub_1ED60();
  sub_32A40();
  v46();
  if ((*(unsigned int (**)(uint64_t *, uint64_t))(v44 + 88))(v0, v42) == *v5)
  {
    (*(void (**)(uint64_t *, uint64_t))(v44 + 96))(v0, v42);
    uint64_t v47 = *v0;
    int64_t v48 = *(void *)(*v0 + 16);
    if (v48)
    {
      uint64_t v126 = v8;
      v144 = _swiftEmptyArrayStorage;
      sub_3069C(0, v48, 0);
      uint64_t v130 = *(void *)(v139 + 16);
      sub_32AEC();
      uint64_t v116 = v47;
      uint64_t v50 = v47 + v49;
      uint64_t v52 = *(void *)(v51 + 56);
      v128 += 8;
      uint64_t v129 = v52;
      int64_t v125 = v141 + 32;
      uint64_t v139 = v51;
      uint64_t v127 = v51 - 8;
      uint64_t v124 = v25;
      uint64_t v120 = v12;
      uint64_t v119 = v31;
      v117 = v15;
      do
      {
        int64_t v141 = v48;
        sub_32A40();
        uint64_t v55 = v54(v53);
        v138(v55);
        uint64_t v56 = sub_33048();
        sub_15C04();
        uint64_t v59 = v58(v57);
        if (v56)
        {
          double v60 = v133(v59);
          double v62 = v134(v61);
          uint64_t v63 = (uint64_t)v121;
          *uint64_t v121 = v56;
          uint64_t v64 = v126;
          swift_storeEnumTagMultiPayload();
          sub_32A28();
          _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v65, v66, v67, v64);
          swift_retain();
          sub_32B98();
          uint64_t v68 = v131;
          uint64_t v69 = *(int *)(v131 + 24);
          uint64_t v70 = v140;
          *(void *)&v140[v69] = 0;
          uint64_t v71 = (uint64_t)&v70[*(int *)(v68 + 28)];
          uint64_t v72 = sub_32C58();
          sub_32A34();
          _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v73, v74, v75, v72);
          sub_329C4();
          v77(v76);
          uint64_t v78 = (double *)&v70[*(int *)(v68 + 20)];
          *uint64_t v78 = v60;
          v78[1] = v62;
          if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0(v63, 1, v64) == 1)
          {
            sub_158E8(v63, &qword_42B10);
          }
          else
          {
            uint64_t v99 = v117;
            sub_30918();
            if (swift_getEnumCaseMultiPayload() == 1)
            {
              sub_158E8(v71, &qword_42B18);
              sub_329B8();
              sub_329C4();
              v101(v100);
              sub_32A28();
              _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v102, v103, v104, v72);
            }
            else
            {
              *(void *)&v140[v69] = *v99;
            }
          }
          uint64_t v12 = v120;
          int64_t v110 = v141;
          sub_30918();
          swift_release();
        }
        else
        {
          uint64_t v79 = v12;
          double v80 = v133(v59);
          double v82 = v134(v81);
          sub_32A34();
          uint64_t v83 = v126;
          _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v84, v85, v86, v126);
          sub_32B98();
          uint64_t v87 = v131;
          uint64_t v88 = *(int *)(v131 + 24);
          uint64_t v89 = v123;
          *(void *)(v123 + v88) = 0;
          uint64_t v90 = v89 + *(int *)(v87 + 28);
          uint64_t v91 = sub_32C58();
          sub_32A34();
          _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v92, v93, v94, v91);
          uint64_t v95 = v124;
          sub_329C4();
          v97(v96);
          uint64_t v98 = (double *)(v89 + *(int *)(v87 + 20));
          *uint64_t v98 = v80;
          v98[1] = v82;
          if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0(v95, 1, v83) == 1)
          {
            sub_158E8(v95, &qword_42B10);
            uint64_t v12 = v79;
          }
          else
          {
            uint64_t v12 = v79;
            sub_30918();
            if (swift_getEnumCaseMultiPayload() == 1)
            {
              sub_158E8(v90, &qword_42B18);
              sub_329B8();
              sub_329C4();
              v106(v105);
              sub_32A28();
              _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v107, v108, v109, v91);
            }
            else
            {
              *(void *)(v123 + v88) = *v79;
            }
          }
          int64_t v110 = v141;
          sub_30918();
        }
        sub_15C04();
        v112(v111);
        uint64_t v113 = v144;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_32AB8(v113[2]);
          uint64_t v113 = v144;
        }
        unint64_t v115 = v113[2];
        unint64_t v114 = v113[3];
        if (v115 >= v114 >> 1)
        {
          sub_3069C(v114 > 1, v115 + 1, 1);
          uint64_t v113 = v144;
        }
        v113[2] = v115 + 1;
        sub_32AEC();
        sub_30918();
        v50 += v129;
        int64_t v48 = v110 - 1;
      }
      while (v48);
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t))(v44 + 8))(v0, v42);
  }
  sub_32A94();
}

uint64_t sub_2F760()
{
  sub_32A88();
  uint64_t v0 = sub_33168();
  uint64_t v1 = sub_32A00(v0);
  __chkstk_darwin(v1);
  sub_2C56C();
  uint64_t v2 = sub_63C4(&qword_42D98);
  uint64_t v3 = sub_32A00(v2);
  __chkstk_darwin(v3);
  sub_15C10();
  uint64_t v6 = v5 - v4;
  sub_32AD8();
  sub_63C4(&qword_42DA0);
  sub_337E8();
  uint64_t v7 = sub_63C4(&qword_42DA8);
  _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v6, 1, 1, v7);
  swift_bridgeObjectRetain();
  sub_33158();
  sub_63C4(&qword_42DB0);
  sub_63C4(&qword_42DB8);
  sub_3297C((uint64_t)&unk_42DC0);
  sub_3297C((uint64_t)&unk_42DC8);
  sub_30A8C((uint64_t)&unk_42DD0);
  return sub_33128();
}

uint64_t sub_2F950()
{
  return sub_33148();
}

uint64_t sub_2F9E8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v20 = a1;
  uint64_t v1 = sub_338E8();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_63C4(&qword_42B18);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_32C58();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v19 - v13;
  type metadata accessor for MapIdentifiablePlace(0);
  sub_3096C();
  if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v7, 1, v8) == 1)
  {
    sub_158E8((uint64_t)v7, &qword_42B18);
    uint64_t v15 = 1;
    uint64_t v16 = v20;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v14, v7, v8);
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
    sub_338D8();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
    uint64_t v17 = v20;
    (*(void (**)(uint64_t, char *, uint64_t))(v2 + 32))(v20, v4, v1);
    uint64_t v15 = 0;
    uint64_t v16 = v17;
  }
  return _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v16, v15, 1, v1);
}

uint64_t sub_2FC7C(uint64_t a1)
{
  return sub_2FEB0(a1, (uint64_t (*)(uint64_t, __n128, __n128))&MapPin.init(coordinate:tint:));
}

uint64_t sub_2FC94()
{
  return sub_2FCDC((void (*)(void))&type metadata accessor for MapPin);
}

uint64_t sub_2FCDC(void (*a1)(void))
{
  uint64_t v3 = sub_33168();
  uint64_t v4 = sub_32A00(v3);
  __chkstk_darwin(v4);
  sub_1ED60();
  uint64_t v5 = sub_63C4(&qword_42D98);
  uint64_t v6 = sub_32A00(v5);
  __chkstk_darwin(v6);
  sub_2D558();
  sub_32AD8();
  sub_63C4(&qword_42DA0);
  sub_337E8();
  uint64_t v7 = sub_63C4(&qword_42DA8);
  _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v1, 1, 1, v7);
  swift_bridgeObjectRetain();
  sub_33158();
  sub_63C4(&qword_42DB0);
  a1(0);
  sub_3297C((uint64_t)&unk_42DC0);
  sub_30A8C((uint64_t)&unk_42DD0);
  return sub_33128();
}

uint64_t sub_2FE98(uint64_t a1)
{
  return sub_2FEB0(a1, (uint64_t (*)(uint64_t, __n128, __n128))&MapMarker.init(coordinate:tint:));
}

uint64_t sub_2FEB0(uint64_t a1, uint64_t (*a2)(uint64_t, __n128, __n128))
{
  uint64_t v2 = (unint64_t *)(a1 + *(int *)(type metadata accessor for MapIdentifiablePlace(0) + 20));
  unint64_t v3 = *v2;
  unint64_t v4 = v2[1];
  uint64_t v5 = swift_retain();
  v6.n128_u64[0] = v3;
  v7.n128_u64[0] = v4;

  return a2(v5, v6, v7);
}

uint64_t sub_2FF28()
{
  return sub_2FCDC((void (*)(void))&type metadata accessor for MapMarker);
}

void MapIdentifiablePlace.init(id:lat:lon:view:)()
{
  sub_32A6C();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v7 = sub_32A88();
  uint64_t v8 = type metadata accessor for MapIdentifiablePlace.ViewType(v7);
  sub_EC24();
  __chkstk_darwin(v9);
  sub_329F0();
  uint64_t v12 = (void *)(v10 - v11);
  __chkstk_darwin(v13);
  uint64_t v14 = (int *)type metadata accessor for MapIdentifiablePlace(0);
  uint64_t v15 = v14[6];
  *(void *)(v0 + v15) = 0;
  uint64_t v16 = v0 + v14[7];
  uint64_t v17 = sub_32C58();
  sub_32A34();
  _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v18, v19, v20, v17);
  sub_32BA8();
  sub_EC24();
  sub_329C4();
  v21();
  uint64_t v22 = (void *)(v0 + v14[5]);
  *uint64_t v22 = v6;
  v22[1] = v4;
  if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0(v2, 1, v8) == 1)
  {
    sub_158E8(v2, &qword_42B10);
  }
  else
  {
    sub_30918();
    sub_30918();
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      sub_158E8(v16, &qword_42B18);
      sub_329B8();
      sub_329C4();
      v23();
      sub_32A28();
      _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v24, v25, v26, v17);
    }
    else
    {
      *(void *)(v0 + v15) = *v12;
    }
  }
  sub_32A94();
}

uint64_t MapIdentifiablePlace.id.getter()
{
  sub_32A88();
  sub_32BA8();
  sub_EC24();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);

  return v4(v0, v1, v2);
}

double MapIdentifiablePlace.location.getter()
{
  return *(double *)(v0 + *(int *)(type metadata accessor for MapIdentifiablePlace(0) + 20));
}

uint64_t MapIdentifiablePlace.tint.getter()
{
  type metadata accessor for MapIdentifiablePlace(0);

  return swift_retain();
}

uint64_t MapIdentifiablePlace.tint.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for MapIdentifiablePlace(0) + 24);
  uint64_t result = swift_release();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*MapIdentifiablePlace.tint.modify())(void, void)
{
  return CoreChartPluginView.body.getter;
}

uint64_t MapIdentifiablePlace.canvas.getter()
{
  uint64_t v0 = sub_32A88();
  type metadata accessor for MapIdentifiablePlace(v0);
  return sub_3096C();
}

uint64_t MapIdentifiablePlace.canvas.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for MapIdentifiablePlace(0) + 28);

  return sub_309C0(a1, v3);
}

uint64_t (*MapIdentifiablePlace.canvas.modify())(void, void)
{
  return CoreChartPluginView.body.getter;
}

uint64_t sub_30354@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_32BA8();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

char *sub_303BC(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_33F38();
    __break(1u);
  }
  else if (__dst != __src || &__src[48 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 48 * a2);
  }
  return __src;
}

uint64_t sub_30454(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    uint64_t v8 = sub_33F38();
    __break(1u);
    return _swift_arrayInitWithTakeBackToFront(v8, v9, v10, v7);
  }
  if (a3 < a1
    || (uint64_t result = type metadata accessor for MapIdentifiablePlace(0),
        a1 + *(void *)(*(void *)(result - 8) + 72) * a2 <= a3))
  {
    uint64_t v11 = type metadata accessor for MapIdentifiablePlace(0);
    return _swift_arrayInitWithTakeFrontToBack(a3, a1, a2, v11);
  }
  else if (a3 != a1)
  {
    uint64_t v7 = result;
    uint64_t v8 = a3;
    unint64_t v9 = a1;
    uint64_t v10 = a2;
    return _swift_arrayInitWithTakeBackToFront(v8, v9, v10, v7);
  }
  return result;
}

uint64_t sub_30584(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0
    || ((uint64_t v5 = *(void *)(*(void *)(type metadata accessor for MapIdentifiablePlace(0) - 8) + 72) * a2,
         unint64_t v6 = a3 + v5,
         unint64_t v7 = a1 + v5,
         v6 > a1)
      ? (BOOL v8 = v7 > a3)
      : (BOOL v8 = 0),
        v8))
  {
    uint64_t result = sub_33F38();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
  return result;
}

size_t sub_3069C(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_306BC(a1, a2, a3, *v3);
  uint64_t *v3 = result;
  return result;
}

size_t sub_306BC(size_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_25:
        __break(1u);
        return result;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_63C4(&qword_42DF0);
  uint64_t v10 = *(void *)(type metadata accessor for MapIdentifiablePlace(0) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t result = j__malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_24;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(type metadata accessor for MapIdentifiablePlace(0) - 8);
  unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  unint64_t v17 = (unint64_t)v13 + v16;
  unint64_t v18 = a4 + v16;
  if (v5)
  {
    sub_30454(v18, v8, v17);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_30584(v18, v8, v17);
  }
  swift_release();
  return (size_t)v13;
}

uint64_t sub_30858@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_33468();
  *a1 = result & 1;
  return result;
}

uint64_t sub_30888()
{
  return sub_33478();
}

uint64_t sub_308B0()
{
  return _swift_deallocObject(v0, 17, 7);
}

unsigned char *sub_308C0(unsigned char *result)
{
  *result &= ~*(unsigned char *)(v1 + 16) & 1;
  return result;
}

uint64_t type metadata accessor for MapIdentifiablePlace.ViewType(uint64_t a1)
{
  return sub_983C(a1, qword_42CD0);
}

uint64_t type metadata accessor for MapIdentifiablePlace(uint64_t a1)
{
  return sub_983C(a1, (uint64_t *)&unk_42C18);
}

uint64_t sub_30918()
{
  sub_32A4C();
  v1(0);
  sub_EC24();
  sub_329C4();
  v2();
  return v0;
}

uint64_t sub_3096C()
{
  sub_32A4C();
  sub_63C4(v2);
  sub_EC24();
  (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v0, v1);
  return v0;
}

uint64_t sub_309C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_63C4(&qword_42B18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_30A28()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_30A44()
{
  return sub_30A8C((uint64_t)&unk_42B20);
}

unint64_t sub_30A8C(uint64_t a1)
{
  unint64_t result = sub_32A5C(a1);
  if (!result)
  {
    v3(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for MapsOverlayView(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_32EE8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = *(int *)(a3 + 24);
    uint64_t v10 = (char *)a1 + v8;
    uint64_t v11 = (char *)a2 + v8;
    long long v12 = *((_OWORD *)v11 + 1);
    *(_OWORD *)uint64_t v10 = *(_OWORD *)v11;
    *((_OWORD *)v10 + 1) = v12;
    *((void *)v10 + 4) = *((void *)v11 + 4);
    uint64_t v13 = (uint64_t *)((char *)a1 + v9);
    uint64_t v14 = (char *)a2 + v9;
    unint64_t v16 = *(void **)v14;
    uint64_t v15 = *((void *)v14 + 1);
    *uint64_t v13 = v16;
    v13[1] = v15;
    swift_retain();
    id v17 = v16;
  }
  return a1;
}

void destroy for MapsOverlayView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_32EE8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  swift_release();
  int v5 = *(void **)(a1 + *(int *)(a2 + 24));
}

uint64_t initializeWithCopy for MapsOverlayView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_32EE8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  long long v11 = *(_OWORD *)(v10 + 16);
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *(_OWORD *)(v9 + 16) = v11;
  *(void *)(v9 + 32) = *(void *)(v10 + 32);
  long long v12 = (void *)(a1 + v8);
  uint64_t v13 = a2 + v8;
  uint64_t v15 = *(void **)v13;
  uint64_t v14 = *(void *)(v13 + 8);
  *long long v12 = v15;
  v12[1] = v14;
  swift_retain();
  id v16 = v15;
  return a1;
}

uint64_t assignWithCopy for MapsOverlayView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_32EE8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  v8[2] = v9[2];
  v8[3] = v9[3];
  v8[4] = v9[4];
  swift_retain();
  swift_release();
  uint64_t v10 = *(int *)(a3 + 24);
  long long v11 = (void *)(a1 + v10);
  uint64_t v12 = a2 + v10;
  uint64_t v13 = *(void **)(a1 + v10);
  uint64_t v14 = *(void **)v12;
  *long long v11 = *(void *)v12;
  id v15 = v14;

  v11[1] = *(void *)(v12 + 8);
  return a1;
}

uint64_t initializeWithTake for MapsOverlayView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_32EE8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  long long v11 = *(_OWORD *)(v10 + 16);
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *(_OWORD *)(v9 + 16) = v11;
  *(void *)(v9 + 32) = *(void *)(v10 + 32);
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  return a1;
}

uint64_t assignWithTake for MapsOverlayView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_32EE8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  long long v10 = *(_OWORD *)(v9 + 16);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  *(_OWORD *)(v8 + 16) = v10;
  *(void *)(v8 + 32) = *(void *)(v9 + 32);
  swift_release();
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  uint64_t v14 = *(void **)(a1 + v11);
  *uint64_t v12 = *v13;

  v12[1] = v13[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for MapsOverlayView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_30F24);
}

uint64_t sub_30F24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_32EE8();
  sub_EC0C();
  if (*(_DWORD *)(v7 + 84) != a2) {
    return sub_329D0(*(void *)(a1 + *(int *)(a3 + 20) + 32));
  }

  return _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0(a1, a2, v6);
}

uint64_t storeEnumTagSinglePayload for MapsOverlayView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_30FBC);
}

void sub_30FBC()
{
  sub_32A0C();
  sub_32EE8();
  sub_EC0C();
  if (*(_DWORD *)(v5 + 84) == v3)
  {
    _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v1, v0, v0, v4);
  }
  else
  {
    *(void *)(v1 + *(int *)(v2 + 20) + 32) = v0;
  }
}

uint64_t sub_31034()
{
  uint64_t result = sub_32EE8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for MapIdentifiablePlace(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_32BA8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *(_OWORD *)((char *)a1 + a3[5]) = *(_OWORD *)((char *)a2 + a3[5]);
    *(uint64_t *)((char *)a1 + v8) = *(uint64_t *)((char *)a2 + v8);
    uint64_t v9 = a3[7];
    long long v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = sub_32C58();
    swift_retain();
    if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v11, 1, v12))
    {
      uint64_t v13 = sub_63C4(&qword_42B18);
      memcpy(v10, v11, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
      _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v10, 0, 1, v12);
    }
  }
  return a1;
}

uint64_t destroy for MapIdentifiablePlace(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_32BA8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  swift_release();
  uint64_t v5 = a1 + *(int *)(a2 + 28);
  uint64_t v6 = sub_32C58();
  uint64_t result = _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0(v5, 1, v6);
  if (!result)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
    return v8(v5, v6);
  }
  return result;
}

uint64_t initializeWithCopy for MapIdentifiablePlace(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_32BA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[7];
  uint64_t v9 = (void *)(a1 + v8);
  long long v10 = (const void *)(a2 + v8);
  uint64_t v11 = sub_32C58();
  swift_retain();
  if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v10, 1, v11))
  {
    uint64_t v12 = sub_63C4(&qword_42B18);
    memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v9, 0, 1, v11);
  }
  return a1;
}

uint64_t assignWithCopy for MapIdentifiablePlace(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_32BA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  swift_retain();
  swift_release();
  uint64_t v10 = a3[7];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (const void *)(a2 + v10);
  uint64_t v13 = sub_32C58();
  int v14 = _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v11, 1, v13);
  int v15 = _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v12, 1, v13);
  if (!v14)
  {
    uint64_t v16 = *(void *)(v13 - 8);
    if (!v15)
    {
      (*(void (**)(void *, const void *, uint64_t))(v16 + 24))(v11, v12, v13);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v16 + 8))(v11, v13);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    uint64_t v17 = sub_63C4(&qword_42B18);
    memcpy(v11, v12, *(void *)(*(void *)(v17 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
  _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v11, 0, 1, v13);
  return a1;
}

uint64_t initializeWithTake for MapIdentifiablePlace(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_32BA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[7];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (const void *)(a2 + v8);
  uint64_t v11 = sub_32C58();
  if (_s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v10, 1, v11))
  {
    uint64_t v12 = sub_63C4(&qword_42B18);
    memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
    _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v9, 0, 1, v11);
  }
  return a1;
}

uint64_t assignWithTake for MapIdentifiablePlace(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_32BA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  swift_release();
  uint64_t v8 = a3[7];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (const void *)(a2 + v8);
  uint64_t v11 = sub_32C58();
  int v12 = _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v9, 1, v11);
  int v13 = _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0((uint64_t)v10, 1, v11);
  if (!v12)
  {
    uint64_t v14 = *(void *)(v11 - 8);
    if (!v13)
    {
      (*(void (**)(void *, const void *, uint64_t))(v14 + 40))(v9, v10, v11);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v14 + 8))(v9, v11);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v15 = sub_63C4(&qword_42B18);
    memcpy(v9, v10, *(void *)(*(void *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0((uint64_t)v9, 0, 1, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for MapIdentifiablePlace(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_31934);
}

uint64_t sub_31934(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_32BA8();
  sub_EC0C();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    if (a2 == 2147483646) {
      return sub_329D0(*(void *)(a1 + *(int *)(a3 + 24)));
    }
    uint64_t v8 = sub_63C4(&qword_42B18);
    uint64_t v9 = a1 + *(int *)(a3 + 28);
  }

  return _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwet_0(v9, a2, v8);
}

uint64_t storeEnumTagSinglePayload for MapIdentifiablePlace(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_319F0);
}

void sub_319F0()
{
  sub_32A0C();
  sub_32BA8();
  sub_EC0C();
  if (*(_DWORD *)(v5 + 84) == v3)
  {
    uint64_t v6 = v4;
    uint64_t v7 = v1;
  }
  else
  {
    if (v3 == 2147483646)
    {
      *(void *)(v1 + *(int *)(v2 + 24)) = v0;
      return;
    }
    uint64_t v6 = sub_63C4(&qword_42B18);
    uint64_t v7 = v1 + *(int *)(v2 + 28);
  }
  _s12SystemPlugin20MapIdentifiablePlaceV8ViewTypeOwst_0(v7, v0, v0, v6);
}

void sub_31A8C()
{
  sub_32BA8();
  if (v0 <= 0x3F)
  {
    sub_31B68();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_31B68()
{
  if (!qword_42C28)
  {
    sub_32C58();
    unint64_t v0 = sub_33D38();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_42C28);
    }
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for MapIdentifiablePlace.ViewType(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
      uint64_t v6 = sub_32C58();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for MapIdentifiablePlace.ViewType(uint64_t a1)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = sub_32C58();
    int v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
    return v3(a1, v2);
  }
  else
  {
    return swift_release();
  }
}

void *initializeWithCopy for MapIdentifiablePlace.ViewType(void *a1, void *a2)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_32C58();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *assignWithCopy for MapIdentifiablePlace.ViewType(void *a1, void *a2)
{
  if (a1 != a2)
  {
    sub_31EC0((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v4 = sub_32C58();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_31EC0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MapIdentifiablePlace.ViewType(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *initializeWithTake for MapIdentifiablePlace.ViewType(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_32C58();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for MapIdentifiablePlace.ViewType(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_31EC0((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_32C58();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_3209C()
{
  uint64_t result = sub_32C58();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

unint64_t sub_32138()
{
  unint64_t result = qword_42D08;
  if (!qword_42D08)
  {
    sub_6728(&qword_42B08);
    sub_321D8();
    sub_3297C((uint64_t)&unk_42D88);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_42D08);
  }
  return result;
}

unint64_t sub_321D8()
{
  unint64_t result = qword_42D10;
  if (!qword_42D10)
  {
    sub_6728(&qword_42B00);
    sub_32254();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_42D10);
  }
  return result;
}

unint64_t sub_32254()
{
  unint64_t result = qword_42D18;
  if (!qword_42D18)
  {
    sub_6728(&qword_42AF8);
    sub_322C8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_42D18);
  }
  return result;
}

unint64_t sub_322C8()
{
  unint64_t result = qword_42D20;
  if (!qword_42D20)
  {
    sub_6728(&qword_42D28);
    sub_32368();
    sub_3297C((uint64_t)&unk_42D78);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_42D20);
  }
  return result;
}

unint64_t sub_32368()
{
  unint64_t result = qword_42D30;
  if (!qword_42D30)
  {
    sub_6728(&qword_42D38);
    sub_32414(&qword_42D40, &qword_42D48, (void (*)(void))sub_3249C, (void (*)(void))sub_32570);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_42D30);
  }
  return result;
}

uint64_t sub_32414(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_6728(a2);
    a3();
    a4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_3249C()
{
  return sub_32414(&qword_42D50, &qword_42D58, (void (*)(void))sub_324D8, (void (*)(void))sub_32524);
}

unint64_t sub_324D8()
{
  unint64_t result = qword_42D60;
  if (!qword_42D60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_42D60);
  }
  return result;
}

unint64_t sub_32524()
{
  unint64_t result = qword_42D68;
  if (!qword_42D68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_42D68);
  }
  return result;
}

unint64_t sub_32570()
{
  unint64_t result = qword_42D70;
  if (!qword_42D70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_42D70);
  }
  return result;
}

__n128 sub_325C8(uint64_t a1, uint64_t a2)
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

void type metadata accessor for MapPinView()
{
}

void type metadata accessor for MapMarkerView()
{
}

uint64_t sub_32600(uint64_t a1)
{
  sub_32A5C(a1);
  swift_bridgeObjectRelease();

  swift_release();
  return swift_release();
}

uint64_t sub_32644(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  long long v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
  swift_bridgeObjectRetain();
  id v6 = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *sub_326A0(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)a2[1];
  long long v5 = (void *)a1[1];
  a1[1] = v4;
  id v6 = v4;

  a1[2] = a2[2];
  swift_retain();
  swift_release();
  a1[3] = a2[3];
  swift_retain();
  swift_release();
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  return a1;
}

uint64_t sub_3274C()
{
  sub_32A4C();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void **)(v1 + 8);
  *(_OWORD *)uint64_t v1 = *v0;

  swift_release();
  *(_OWORD *)(v1 + 16) = v0[1];
  swift_release();
  long long v3 = v0[3];
  *(_OWORD *)(v1 + 32) = v0[2];
  *(_OWORD *)(v1 + 48) = v3;
  return v1;
}

uint64_t sub_327A4(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 64))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_327E4(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for MapAnnotationView()
{
}

uint64_t sub_32840()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_3285C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_32878()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_32894@<X0>(uint64_t a1@<X8>)
{
  return sub_2F9E8(a1);
}

unint64_t sub_3289C()
{
  unint64_t result = qword_42DE0;
  if (!qword_42DE0)
  {
    sub_6728(&qword_42DD8);
    sub_30A8C((uint64_t)&unk_42DE8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_42DE0);
  }
  return result;
}

unint64_t sub_32940()
{
  return sub_3297C((uint64_t)&unk_42E10);
}

unint64_t sub_3297C(uint64_t a1)
{
  unint64_t result = sub_32A5C(a1);
  if (!result)
  {
    sub_6728(v3);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

uint64_t sub_329D0@<X0>(unint64_t a1@<X8>)
{
  if (a1 >= 0xFFFFFFFF) {
    LODWORD(a1) = -1;
  }
  int v1 = a1 - 1;
  if (v1 < 0) {
    int v1 = -1;
  }
  return (v1 + 1);
}

uint64_t sub_32A00(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_32A0C()
{
  return 0;
}

uint64_t sub_32A5C(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t sub_32A88()
{
  return 0;
}

size_t sub_32AB8@<X0>(uint64_t a1@<X8>)
{
  return sub_3069C(0, a1 + 1, 1);
}

__n128 sub_32AD8()
{
  long long v2 = *(_OWORD *)(v0 + 32);
  *(_OWORD *)(v1 - 160) = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v1 - 144) = v2;
  __n128 result = *(__n128 *)(v0 + 48);
  *(__n128 *)(v1 - 128) = result;
  return result;
}

uint64_t sub_32AF8()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t sub_32B08()
{
  return JSONDecoder.init()();
}

uint64_t sub_32B18()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t sub_32B28()
{
  return _convertNSErrorToError(_:)();
}

NSData sub_32B38()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_32B48()
{
  return Date.addingTimeInterval(_:)();
}

uint64_t sub_32B58()
{
  return static Date.< infix(_:_:)();
}

uint64_t sub_32B68()
{
  return Date.init()();
}

uint64_t sub_32B78()
{
  return type metadata accessor for Date();
}

uint64_t sub_32B88()
{
  return UUID.uuidString.getter();
}

uint64_t sub_32B98()
{
  return UUID.init()();
}

uint64_t sub_32BA8()
{
  return type metadata accessor for UUID();
}

uint64_t sub_32BB8()
{
  return type metadata accessor for ButtonRole();
}

uint64_t sub_32BC8()
{
  return TextElement.asView()();
}

uint64_t sub_32BD8()
{
  return type metadata accessor for TextElement.Font();
}

uint64_t sub_32BE8()
{
  return type metadata accessor for TextElement();
}

uint64_t sub_32BF8()
{
  return TextElement.init(_:font:fontWeight:fontColor:italic:bold:lineLimit:idioms:)();
}

uint64_t sub_32C08()
{
  return type metadata accessor for _ProtoIdiom();
}

uint64_t sub_32C18()
{
  return ColorElement.color.getter();
}

uint64_t sub_32C28()
{
  return type metadata accessor for ColorElement();
}

uint64_t sub_32C38()
{
  return type metadata accessor for ContactImage();
}

uint64_t sub_32C48()
{
  return ContactImage.init(_:)();
}

uint64_t sub_32C58()
{
  return type metadata accessor for CustomCanvas();
}

uint64_t sub_32C68()
{
  return static ImageElement.isCircularImageStyle(_:context:)();
}

uint64_t sub_32C78()
{
  return static ImageElement.cornerRadius(for:context:)();
}

uint64_t sub_32C88()
{
  return static ImageElement.size(for:context:)();
}

uint64_t sub_32C98()
{
  return static ImageElement.ImageStyle.== infix(_:_:)();
}

uint64_t sub_32CA8()
{
  return type metadata accessor for ImageElement.ImageStyle();
}

uint64_t sub_32CB8()
{
  return ImageElement.AppIcon.imageStyle.getter();
}

uint64_t sub_32CC8()
{
  return ImageElement.AppIcon.init(serializedData:)();
}

uint64_t sub_32CD8()
{
  return ImageElement.AppIcon.applicationBundleIdentifier.getter();
}

uint64_t sub_32CE8()
{
  return type metadata accessor for ImageElement.AppIcon();
}

uint64_t sub_32CF8()
{
  return ImageElement.AppIcon.init(_:imageStyle:)();
}

uint64_t sub_32D08()
{
  return ImageElement.Contact.imageStyle.getter();
}

uint64_t sub_32D18()
{
  return ImageElement.Contact.init(proto:)();
}

uint64_t sub_32D28()
{
  return ImageElement.Contact.Avatar.contactIds.getter();
}

uint64_t sub_32D38()
{
  return type metadata accessor for ImageElement.Contact.Avatar();
}

uint64_t sub_32D48()
{
  return type metadata accessor for ImageElement.Contact.Content();
}

uint64_t sub_32D58()
{
  return ImageElement.Contact.content.getter();
}

uint64_t sub_32D68()
{
  return ImageElement.Contact.Monogram.letters.getter();
}

uint64_t sub_32D78()
{
  return type metadata accessor for ImageElement.Contact.Monogram();
}

uint64_t sub_32D88()
{
  return type metadata accessor for ImageElement.Contact();
}

uint64_t sub_32D98()
{
  return SashStandard.titleColor.getter();
}

uint64_t sub_32DA8()
{
  return SashStandard.backgroundColor.getter();
}

uint64_t sub_32DB8()
{
  return SashStandard.Title.applicationBundleIdentifier.getter();
}

uint64_t sub_32DC8()
{
  return type metadata accessor for SashStandard.Title();
}

uint64_t sub_32DD8()
{
  return SashStandard.title.getter();
}

uint64_t sub_32DE8()
{
  return SashStandard.action.getter();
}

uint64_t sub_32DF8()
{
  return SashStandard.thumbnail.getter();
}

uint64_t sub_32E08()
{
  return type metadata accessor for SashStandard();
}

uint64_t sub_32E18()
{
  return type metadata accessor for TextProperty();
}

uint64_t sub_32E28()
{
  return type metadata accessor for _ProtoButton.FormAction();
}

uint64_t sub_32E38()
{
  return type metadata accessor for VisualElement();
}

uint64_t sub_32E48()
{
  return type metadata accessor for ActionProperty();
}

uint64_t sub_32E58()
{
  return ActionProperty.init(_:)();
}

uint64_t sub_32E68()
{
  return VisualProperty.allVisualElements.getter();
}

uint64_t sub_32E78()
{
  return VisualProperty.view.getter();
}

uint64_t sub_32E88()
{
  return type metadata accessor for VisualProperty();
}

uint64_t sub_32E98()
{
  return MapOverlayModel.latitudeSpan.getter();
}

uint64_t sub_32EA8()
{
  return MapOverlayModel.longitudeSpan.getter();
}

uint64_t sub_32EB8()
{
  return MapOverlayModel.annotationItem.getter();
}

uint64_t sub_32EC8()
{
  return MapOverlayModel.latitude.getter();
}

uint64_t sub_32ED8()
{
  return MapOverlayModel.longitude.getter();
}

uint64_t sub_32EE8()
{
  return type metadata accessor for MapOverlayModel();
}

uint64_t sub_32EF8()
{
  return MapOverlayModel.init(_:)();
}

uint64_t sub_32F08()
{
  return ProtobufBuilder.init(serializedData:)();
}

uint64_t sub_32F18()
{
  return IntentsUIStandard.interaction.getter();
}

uint64_t sub_32F28()
{
  return IntentsUIStandard.Slot.parameterKeyPaths.getter();
}

uint64_t sub_32F38()
{
  return IntentsUIStandard.Slot.fallback.getter();
}

uint64_t sub_32F48()
{
  return type metadata accessor for IntentsUIStandard.Slot();
}

uint64_t sub_32F58()
{
  return IntentsUIStandard.slots.getter();
}

uint64_t sub_32F68()
{
  return IntentsUIStandard.action.getter();
}

uint64_t sub_32F78()
{
  return type metadata accessor for IntentsUIStandard();
}

uint64_t sub_32F88()
{
  return MapPlaceCardModel.configOptions.getter();
}

uint64_t sub_32F98()
{
  return MapPlaceCardModel.mapItem.getter();
}

uint64_t sub_32FA8()
{
  return type metadata accessor for MapPlaceCardModel();
}

uint64_t sub_32FB8()
{
  return MapPlaceCardModel.init(_:)();
}

uint64_t sub_32FC8()
{
  return type metadata accessor for _ProtoTextElement.Font.Weight();
}

uint64_t sub_32FD8()
{
  return type metadata accessor for _ProtoImageElement.Contact();
}

uint64_t sub_32FE8()
{
  return ContactPickerButtonModel.userResponseKey.getter();
}

uint64_t sub_32FF8()
{
  return ContactPickerButtonModel.additionalPayload.getter();
}

uint64_t sub_33008()
{
  return ContactPickerButtonModel.directInvocationId.getter();
}

uint64_t sub_33018()
{
  return ContactPickerButtonModel.label.getter();
}

uint64_t sub_33028()
{
  return type metadata accessor for ContactPickerButtonModel();
}

uint64_t sub_33038()
{
  return ContactPickerButtonModel.init(_:)();
}

uint64_t sub_33048()
{
  return Color.swiftValue.getter();
}

uint64_t sub_33058()
{
  return type metadata accessor for Color();
}

uint64_t sub_33068()
{
  return type metadata accessor for Button.LabelStyle();
}

uint64_t sub_33078()
{
  return Button.init(action:label:thumbnail:formAction:labelStyle:buttonRole:componentName:linkIdentifier:)();
}

uint64_t sub_33088()
{
  return type metadata accessor for Button();
}

uint64_t sub_33098()
{
  return type metadata accessor for Command();
}

uint64_t sub_330A8()
{
  return MapItems.MapAnnotationItem.annotationView.getter();
}

uint64_t sub_330B8()
{
  return MapItems.MapAnnotationItem.latitude.getter();
}

uint64_t sub_330C8()
{
  return MapItems.MapAnnotationItem.longitude.getter();
}

uint64_t sub_330D8()
{
  return type metadata accessor for MapItems.MapAnnotationItem();
}

uint64_t sub_330E8()
{
  return type metadata accessor for MapItems();
}

uint64_t sub_330F8()
{
  return type metadata accessor for Response();
}

uint64_t sub_33108()
{
  return CoreChart.init(data:)();
}

uint64_t sub_33118()
{
  return type metadata accessor for CoreChart();
}

uint64_t sub_33128()
{
  return Map.init<A, B>(coordinateRegion:interactionModes:showsUserLocation:userTrackingMode:annotationItems:annotationContent:)();
}

uint64_t sub_33138()
{
  return Map.init<>(coordinateRegion:interactionModes:showsUserLocation:userTrackingMode:)();
}

uint64_t sub_33148()
{
  return MapAnnotation.init(coordinate:anchorPoint:content:)();
}

uint64_t sub_33158()
{
  return static MapInteractionModes.all.getter();
}

uint64_t sub_33168()
{
  return type metadata accessor for MapInteractionModes();
}

uint64_t sub_33178()
{
  return BinaryDecodingOptions.init()();
}

uint64_t sub_33188()
{
  return type metadata accessor for BinaryDecodingOptions();
}

uint64_t sub_33198()
{
  return Message.init(serializedData:extensions:partial:options:)();
}

uint64_t sub_331A8()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_331B8()
{
  return Logger.logObject.getter();
}

uint64_t sub_331C8()
{
  return type metadata accessor for Logger();
}

uint64_t sub_331D8()
{
  return Logger.init(_:)();
}

uint64_t sub_331E8()
{
  return AnyCancellable.store(in:)();
}

uint64_t sub_331F8()
{
  return type metadata accessor for AnyCancellable();
}

uint64_t sub_33208()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t sub_33218()
{
  return Published.init(initialValue:)();
}

uint64_t sub_33228()
{
  return static Published.subscript.modify();
}

uint64_t sub_33238()
{
  return static Published.subscript.getter();
}

uint64_t sub_33248()
{
  return static Published.subscript.setter();
}

uint64_t sub_33258()
{
  return type metadata accessor for Published();
}

uint64_t sub_33268()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t sub_33278()
{
  return EdgeInsets.init(_all:)();
}

uint64_t sub_33288()
{
  return type metadata accessor for Environment.Content();
}

uint64_t sub_33298()
{
  return StateObject.wrappedValue.getter();
}

uint64_t sub_332A8()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t sub_332B8()
{
  return AnyShapeStyle.init<A>(_:)();
}

uint64_t sub_332C8()
{
  return type metadata accessor for _TaskModifier();
}

uint64_t sub_332D8()
{
  return ObservedObject.init(wrappedValue:)();
}

uint64_t sub_332E8()
{
  return static LayoutDirection.== infix(_:_:)();
}

uint64_t sub_332F8()
{
  return type metadata accessor for LayoutDirection();
}

uint64_t sub_33308()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t sub_33318()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t sub_33328()
{
  return EnvironmentObject.error()();
}

uint64_t sub_33338()
{
  return EnvironmentObject.init()();
}

uint64_t sub_33348()
{
  return EnvironmentValues.currentIdiom.getter();
}

uint64_t sub_33358()
{
  return EnvironmentValues.currentIdiom.setter();
}

uint64_t sub_33368()
{
  return EnvironmentValues.isContactImage.getter();
}

uint64_t sub_33378()
{
  return EnvironmentValues.isContactImage.setter();
}

uint64_t sub_33388()
{
  return EnvironmentValues.imageElementFrameWidth.getter();
}

uint64_t sub_33398()
{
  return EnvironmentValues.imageElementFrameWidth.setter();
}

uint64_t sub_333A8()
{
  return EnvironmentValues.imageElementImageStyle.getter();
}

uint64_t sub_333B8()
{
  return EnvironmentValues.imageElementImageStyle.setter();
}

uint64_t sub_333C8()
{
  return EnvironmentValues.response.getter();
}

uint64_t sub_333D8()
{
  return EnvironmentValues.response.setter();
}

uint64_t sub_333E8()
{
  return EnvironmentValues.displayScale.getter();
}

uint64_t sub_333F8()
{
  return EnvironmentValues.displayScale.setter();
}

uint64_t sub_33408()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t sub_33418()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t sub_33428()
{
  return EnvironmentValues.layoutDirection.getter();
}

uint64_t sub_33438()
{
  return EnvironmentValues.layoutDirection.setter();
}

uint64_t sub_33448()
{
  return EnvironmentValues.font.getter();
}

uint64_t sub_33458()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_33468()
{
  return EnvironmentValues.isEnabled.getter();
}

uint64_t sub_33478()
{
  return EnvironmentValues.isEnabled.setter();
}

uint64_t sub_33488()
{
  return EnvironmentValues.init()();
}

uint64_t sub_33498()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t sub_334A8()
{
  return static VerticalAlignment.center.getter();
}

uint64_t sub_334B8()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t sub_334C8()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t sub_334D8()
{
  return static SymbolRenderingMode.palette.getter();
}

uint64_t sub_334E8()
{
  return type metadata accessor for SymbolRenderingMode();
}

uint64_t sub_334F8()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_33508()
{
  return static HierarchicalShapeStyle.secondary.getter();
}

uint64_t sub_33518()
{
  return UIViewControllerRepresentable._resetUIViewController(_:coordinator:destroy:)();
}

uint64_t sub_33528()
{
  return static UIViewControllerRepresentable.dismantleUIViewController(_:coordinator:)();
}

uint64_t sub_33538()
{
  return UIViewControllerRepresentable.sizeThatFits(_:uiViewController:context:)();
}

uint64_t sub_33558()
{
  return static UIViewControllerRepresentable._layoutOptions(_:)();
}

uint64_t sub_33568()
{
  return UIViewControllerRepresentable._identifiedViewTree(in:)();
}

uint64_t sub_33578()
{
  return UIViewControllerRepresentable.body.getter();
}

uint64_t sub_33598()
{
  return UIViewControllerRepresentable<>.makeCoordinator()();
}

uint64_t sub_335A8()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_335B8()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_335C8()
{
  return static Edge.Set.top.getter();
}

uint64_t sub_335D8()
{
  return static Edge.Set.leading.getter();
}

uint64_t sub_335E8()
{
  return Edge.Set.init(rawValue:)();
}

uint64_t sub_335F8()
{
  return static Edge.Set.trailing.getter();
}

uint64_t sub_33608()
{
  return type metadata accessor for Font.Design();
}

uint64_t sub_33618()
{
  return static Font.system(size:weight:design:)();
}

uint64_t sub_33628()
{
  return Text.init<A>(_:)();
}

uint64_t sub_33638()
{
  return View.imageStyle(_:)();
}

uint64_t sub_33648()
{
  return View.imageFixedSize(horizontal:vertical:)();
}

uint64_t sub_33658()
{
  return View.imageElementFixedSize()();
}

uint64_t sub_33668()
{
  return View.onTapGestureWhereSupported(perform:)();
}

uint64_t sub_33678()
{
  return View.ifLet<A, B>(_:transform:)();
}

uint64_t sub_33688()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_33698()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_336A8()
{
  return View.onTapGesture(count:perform:)();
}

uint64_t sub_336B8()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_336C8()
{
  return static Color.red.getter();
}

uint64_t sub_336D8()
{
  return static Color.clear.getter();
}

uint64_t sub_336E8()
{
  return static Color.white.getter();
}

uint64_t sub_336F8()
{
  return static Color.orange.getter();
}

uint64_t sub_33708()
{
  return Color.opacity(_:)();
}

uint64_t sub_33718()
{
  return static Color.secondary.getter();
}

uint64_t sub_33728()
{
  return Image.init(nativeImage:)();
}

uint64_t sub_33738()
{
  return Image.init(systemName:)();
}

uint64_t sub_33748()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t sub_33758()
{
  return Image.symbolRenderingMode(_:)();
}

uint64_t sub_33768()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t sub_33778()
{
  return State.init(wrappedValue:)();
}

uint64_t sub_33788()
{
  return State.wrappedValue.getter();
}

uint64_t sub_33798()
{
  return State.wrappedValue.setter();
}

uint64_t sub_337A8()
{
  return State.projectedValue.getter();
}

uint64_t sub_337B8()
{
  return type metadata accessor for State();
}

uint64_t sub_337C8()
{
  return AnyView.init<A>(_:)();
}

uint64_t sub_337D8()
{
  return Binding.wrappedValue.setter();
}

uint64_t sub_337E8()
{
  return Binding.projectedValue.getter();
}

uint64_t sub_337F8()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t sub_33808()
{
  return static Alignment.center.getter();
}

uint64_t sub_33818()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_33828()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_33838()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_33848()
{
  return ButtonView.init(model:willPerformAction:)();
}

uint64_t sub_33858()
{
  return type metadata accessor for ButtonView();
}

uint64_t sub_33868()
{
  return AnyComponent.view.getter();
}

uint64_t sub_33878()
{
  return static AnyComponent.wrapper(for:response:)();
}

uint64_t sub_33888()
{
  return type metadata accessor for AnyComponent();
}

uint64_t sub_33898()
{
  return ActionHandler.wrappedValue.getter();
}

uint64_t _s12SystemPlugin21IntentsUIStandardViewV14_actionHandler33_B186D5490C027C03FE29A950973ABEA6LL9SnippetUI06ActionG0Vvpfi_0()
{
  return ActionHandler.init()();
}

uint64_t sub_338B8()
{
  return type metadata accessor for ActionHandler();
}

uint64_t sub_338C8()
{
  return type metadata accessor for InteractionType();
}

uint64_t sub_338D8()
{
  return CustomCanvasView.init(model:)();
}

uint64_t sub_338E8()
{
  return type metadata accessor for CustomCanvasView();
}

uint64_t sub_338F8()
{
  return VisualElementView.init(model:)();
}

uint64_t sub_33908()
{
  return type metadata accessor for VisualElementView();
}

uint64_t sub_33918()
{
  return StandardActionHandler.canPerform(_:)();
}

uint64_t sub_33928()
{
  return StandardActionHandler.perform(_:interactionType:)();
}

uint64_t sub_33938()
{
  return type metadata accessor for StandardActionHandler();
}

uint64_t sub_33948()
{
  return dispatch thunk of Context.currentIdiom.getter();
}

uint64_t sub_33958()
{
  return dispatch thunk of Context.snippetWidth.getter();
}

uint64_t sub_33968()
{
  return dispatch thunk of Context.didEndEditing()();
}

uint64_t sub_33978()
{
  return dispatch thunk of Context.willBeginEditing()();
}

uint64_t sub_33988()
{
  return dispatch thunk of Context.interactionDelegate.getter();
}

uint64_t sub_33998()
{
  return Context.init(idiom:)();
}

uint64_t sub_339A8()
{
  return dispatch thunk of Context.perform(directInvocation:payload:)();
}

uint64_t sub_339B8()
{
  return type metadata accessor for Context();
}

NSDictionary sub_339C8()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_339D8()
{
  return Dictionary.init(dictionaryLiteral:)();
}

uint64_t sub_339E8()
{
  return Dictionary.count.getter();
}

void sub_339F8(Swift::Bool keepingCapacity)
{
}

uint64_t sub_33A08()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_33A18()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_33A28()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_33A38()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_33A48()
{
  return String.init(data:encoding:)();
}

uint64_t sub_33A58()
{
  return static String.Encoding.utf8.getter();
}

uint64_t sub_33A68()
{
  return type metadata accessor for String.Encoding();
}

uint64_t sub_33A78()
{
  return String.init<A>(describing:)();
}

uint64_t sub_33A88()
{
  return String.init<A>(describing:)();
}

uint64_t sub_33A98()
{
  return String.lowercased()()._countAndFlagsBits;
}

uint64_t sub_33AA8()
{
  return static String._fromSubstring(_:)();
}

uint64_t sub_33AB8()
{
  return String.hash(into:)();
}

uint64_t sub_33AC8()
{
  return String.index(after:)();
}

void sub_33AD8(Swift::String a1)
{
}

Swift::Int sub_33AE8()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_33AF8()
{
  return String.subscript.getter();
}

uint64_t sub_33B08()
{
  return String.subscript.getter();
}

uint64_t sub_33B18()
{
  return Sequence._copyContents(initializing:)();
}

uint64_t sub_33B28()
{
  return Sequence.underestimatedCount.getter();
}

uint64_t sub_33B38()
{
  return Sequence._copyToContiguousArray()();
}

uint64_t sub_33B48()
{
  return Sequence.withContiguousStorageIfAvailable<A>(_:)();
}

uint64_t sub_33B58()
{
  return Sequence.lazy.getter();
}

uint64_t sub_33B68()
{
  return Sequence<>.joined(separator:)();
}

uint64_t sub_33B78()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_33B88()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_33B98()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_33BA8()
{
  return Array<A>.element(for:)();
}

uint64_t sub_33BB8()
{
  return specialized Array._endMutation()();
}

uint64_t sub_33BC8()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_33BD8()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_33BE8()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_33BF8()
{
  return static MainActor.shared.getter();
}

uint64_t sub_33C08()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_33C18()
{
  return static TaskPriority.userInitiated.getter();
}

uint64_t sub_33C28()
{
  return type metadata accessor for TaskPriority();
}

NSSet sub_33C38()
{
  return Set._bridgeToObjectiveC()();
}

uint64_t sub_33C48()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_33C58()
{
  return Set.description.getter();
}

uint64_t sub_33C68()
{
  return Set.init(minimumCapacity:)();
}

uint64_t sub_33C78()
{
  return Set.Iterator.init(_cocoa:)();
}

uint64_t sub_33C88()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_33C98()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_33CA8()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_33CB8()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_33CC8()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_33CD8()
{
  return type metadata accessor for NSNotificationCenter.Publisher();
}

uint64_t sub_33CE8()
{
  return NSNotificationCenter.publisher(for:object:)();
}

Swift::Int sub_33CF8(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_33D08()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_33D18()
{
  return VRXIdiom.idiom.getter();
}

uint64_t sub_33D28()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t sub_33D38()
{
  return type metadata accessor for Optional();
}

uint64_t sub_33D48()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_33D58()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_33D68()
{
  return BinaryInteger.description.getter();
}

uint64_t sub_33D78()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_33D88()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t sub_33D98()
{
  return __CocoaSet.makeIterator()();
}

uint64_t sub_33DA8()
{
  return __CocoaSet.count.getter();
}

uint64_t sub_33DB8()
{
  return __CocoaSet.member(for:)();
}

uint64_t sub_33DC8()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t sub_33DD8()
{
  return __CocoaSet.contains(_:)();
}

Swift::Int sub_33DE8(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_33DF8()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_33E08()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_33E18()
{
  return static _SetStorage.convert(_:capacity:)();
}

uint64_t sub_33E28()
{
  return static _SetStorage.allocate(capacity:)();
}

void sub_33E38(Swift::Int a1)
{
}

uint64_t sub_33E48()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_33E58()
{
  return type metadata accessor for LazySequence();
}

uint64_t sub_33E68()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_33E78()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_33E88()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_33E98()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_33EA8()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_33EB8()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_33EC8()
{
  return type metadata accessor for LazyMapSequence();
}

BOOL sub_33ED8(Swift::Bool isUnique, Swift::Int capacity)
{
  return _NativeDictionary.ensureUnique(isUnique:capacity:)(isUnique, capacity);
}

uint64_t sub_33EE8()
{
  return _NativeDictionary._delete(at:)();
}

uint64_t sub_33EF8()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_33F08()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_33F18()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_33F28()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_33F38()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_33F48()
{
  return LazySequenceProtocol.map<A>(_:)();
}

uint64_t sub_33F58()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_33F68()
{
  return DefaultStringInterpolation.appendInterpolation<A>(_:)();
}

uint64_t sub_33F78()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_33F88()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_33F98()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_33FA8()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_33FB8()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_33FC8()
{
  return Error._code.getter();
}

uint64_t sub_33FD8()
{
  return Error._domain.getter();
}

uint64_t sub_33FE8()
{
  return Error._userInfo.getter();
}

uint64_t sub_33FF8()
{
  return Hasher.init(_seed:)();
}

void sub_34008(Swift::UInt a1)
{
}

Swift::Int sub_34018()
{
  return Hasher._finalize()();
}

uint64_t sub_34028()
{
  return _typeName(_:qualified:)();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
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

uint64_t swift_checkMetadataState()
{
  return _swift_checkMetadataState();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
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

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
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

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
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

uint64_t swift_release_n()
{
  return _swift_release_n();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
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

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_weakAssign()
{
  return _swift_weakAssign();
}

uint64_t swift_weakDestroy()
{
  return _swift_weakDestroy();
}

uint64_t swift_weakInit()
{
  return _swift_weakInit();
}

uint64_t swift_weakLoadStrong()
{
  return _swift_weakLoadStrong();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}