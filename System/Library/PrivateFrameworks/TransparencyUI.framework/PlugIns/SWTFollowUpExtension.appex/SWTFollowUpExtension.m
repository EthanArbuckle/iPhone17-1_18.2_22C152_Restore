uint64_t sub_100004904@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC20SWTFollowUpExtension22FollowUpViewController_log;
  swift_beginAccess();
  v4 = sub_1000072C0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_100004988(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC20SWTFollowUpExtension22FollowUpViewController_log;
  swift_beginAccess();
  uint64_t v4 = sub_1000072C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(v3, a1, v4);
  return swift_endAccess();
}

uint64_t (*sub_100004A14())()
{
  return j__swift_endAccess;
}

id sub_100004A74()
{
  id v1 = objc_allocWithZone(v0);
  return [v1 init];
}

id sub_100004AA8()
{
  uint64_t v1 = sub_1000072C0();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  uint64_t v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = v0;
  sub_1000072B0();
  (*(void (**)(uint64_t, char *, uint64_t))(v2 + 32))((uint64_t)v5 + OBJC_IVAR____TtC20SWTFollowUpExtension22FollowUpViewController_log, v4, v1);

  v6 = (objc_class *)type metadata accessor for FollowUpViewController();
  v8.receiver = v5;
  v8.super_class = v6;
  return objc_msgSendSuper2(&v8, "initWithNibName:bundle:", 0, 0);
}

uint64_t type metadata accessor for FollowUpViewController()
{
  uint64_t result = qword_10000C228;
  if (!qword_10000C228) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id sub_100004D50(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithCoder:a1];

  return v3;
}

void sub_100004D94()
{
}

Swift::Void __swiftcall FollowUpViewController.viewDidLoad()()
{
}

id sub_100004E9C()
{
  uint64_t v1 = sub_1000072C0();
  uint64_t v62 = *(void *)(v1 - 8);
  uint64_t v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v4 = (char *)&v51 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  v6 = (char *)&v51 - v5;
  uint64_t v7 = sub_100005580(&qword_10000C1B8);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100007290();
  uint64_t v11 = __chkstk_darwin(v10);
  v61 = (char *)&v51 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v11);
  v15 = (char *)&v51 - v14;
  __chkstk_darwin(v13);
  v17 = (char *)&v51 - v16;
  uint64_t v19 = v18;
  sub_100007280();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v9, 1, v10) == 1) {
    return (id)sub_100006DCC((uint64_t)v9, &qword_10000C1B8);
  }
  v58 = v4;
  uint64_t v21 = (*(uint64_t (**)(char *, char *, uint64_t))(v19 + 32))(v17, v9, v10);
  v22 = *(void (**)(void))((swift_isaMask & *(void *)v0) + 0x58);
  uint64_t v55 = (swift_isaMask & *(void *)v0) + 88;
  v56 = v22;
  ((void (*)(uint64_t))v22)(v21);
  v23 = *(void (**)(char *, char *, uint64_t))(v19 + 16);
  v60 = v17;
  v53 = v23;
  uint64_t v54 = v19 + 16;
  v23(v15, v17, v10);
  v24 = sub_1000072A0();
  os_log_type_t v25 = sub_100007350();
  BOOL v26 = os_log_type_enabled(v24, v25);
  uint64_t v59 = v19;
  v57 = v0;
  if (v26)
  {
    uint64_t v27 = swift_slowAlloc();
    uint64_t v52 = v1;
    v28 = (uint8_t *)v27;
    uint64_t v64 = swift_slowAlloc();
    *(_DWORD *)v28 = 136315138;
    v51 = v28 + 4;
    uint64_t v29 = sub_100007260();
    uint64_t v63 = sub_10000660C(v29, v30, &v64);
    sub_100007360();
    swift_bridgeObjectRelease();
    v31 = *(void (**)(char *, uint64_t))(v19 + 8);
    v31(v15, v10);
    _os_log_impl((void *)&_mh_execute_header, v24, v25, "Opening URL for followup %s", v28, 0xCu);
    swift_arrayDestroy();
    v32 = v31;
    swift_slowDealloc();
    uint64_t v1 = v52;
    swift_slowDealloc();
  }
  else
  {
    v32 = *(void (**)(char *, uint64_t))(v19 + 8);
    v32(v15, v10);
  }

  v33 = *(void (**)(char *, uint64_t))(v62 + 8);
  v33(v6, v1);
  id result = [self defaultWorkspace];
  v35 = v60;
  if (result)
  {
    v36 = result;
    sub_100007270(v34);
    v38 = v37;
    sub_1000055C4((uint64_t)&_swiftEmptyArrayStorage);
    Class isa = sub_1000072D0().super.isa;
    swift_bridgeObjectRelease();
    unsigned __int8 v40 = [v36 openSensitiveURL:v38 withOptions:isa];

    if (v40)
    {
      return (id)((uint64_t (*)(char *, uint64_t))v32)(v35, v10);
    }
    else
    {
      v41 = v58;
      v56();
      v42 = v61;
      v53(v61, v35, v10);
      v43 = sub_1000072A0();
      os_log_type_t v44 = sub_100007340();
      if (os_log_type_enabled(v43, v44))
      {
        uint64_t v45 = swift_slowAlloc();
        v57 = v33;
        v46 = v42;
        v47 = (uint8_t *)v45;
        uint64_t v64 = swift_slowAlloc();
        uint64_t v52 = v1;
        *(_DWORD *)v47 = 136315138;
        v56 = (void (*)(void))v32;
        sub_100006C64();
        uint64_t v48 = sub_100007410();
        uint64_t v63 = sub_10000660C(v48, v49, &v64);
        sub_100007360();
        swift_bridgeObjectRelease();
        v50 = v56;
        ((void (*)(char *, uint64_t))v56)(v46, v10);
        _os_log_impl((void *)&_mh_execute_header, v43, v44, "Could not open url %s", v47, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v57(v41, v52);
        return (id)((uint64_t (*)(char *, uint64_t))v50)(v60, v10);
      }
      else
      {

        v32(v42, v10);
        v33(v41, v1);
        return (id)((uint64_t (*)(char *, uint64_t))v32)(v35, v10);
      }
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100005580(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_1000055C4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005580(&qword_10000C210);
  uint64_t v2 = sub_1000073F0();
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
    sub_1000071D8(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_100006CBC(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_100007240(&v17, (_OWORD *)(v3[7] + 32 * result));
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

void FollowUpViewController.processFollowUpItem(_:selectedAction:completion:)(void *a1, void *a2, void (*a3)(uint64_t), uint64_t a4)
{
  uint64_t v5 = v4;
  v77 = a3;
  v75 = a1;
  uint64_t v8 = sub_1000072C0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v78 = v8;
  uint64_t v79 = v9;
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v74 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v10);
  uint64_t v15 = (char *)&v74 - v14;
  uint64_t v16 = __chkstk_darwin(v13);
  uint64_t v18 = (char *)&v74 - v17;
  uint64_t v19 = __chkstk_darwin(v16);
  uint64_t v21 = (char *)&v74 - v20;
  __chkstk_darwin(v19);
  v23 = (char *)&v74 - v22;
  if (!a2)
  {
    __break(1u);
LABEL_57:
    __break(1u);
  }
  uint64_t v76 = a4;
  uint64_t v80 = 0x6E6F69746361;
  unint64_t v81 = 0xE600000000000000;
  sub_1000073A0();
  id v24 = [a2 userInfo];
  if (!v24) {
    goto LABEL_57;
  }
  os_log_type_t v25 = v24;
  uint64_t v26 = sub_1000072E0();

  if (*(void *)(v26 + 16) && (unint64_t v27 = sub_100006D34((uint64_t)v82), (v28 & 1) != 0))
  {
    sub_100006E28(*(void *)(v26 + 56) + 32 * v27, (uint64_t)&v83);
  }
  else
  {
    long long v83 = 0u;
    long long v84 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_100006D78((uint64_t)v82);
  if (!*((void *)&v84 + 1))
  {
    uint64_t v29 = sub_100006DCC((uint64_t)&v83, &qword_10000C1C8);
    goto LABEL_17;
  }
  uint64_t v29 = swift_dynamicCast();
  if ((v29 & 1) == 0)
  {
LABEL_17:
    (*(void (**)(uint64_t))((swift_isaMask & *v5) + 0x58))(v29);
    v23 = a2;
    v37 = sub_1000072A0();
    os_log_type_t v38 = sub_100007340();
    uint64_t v5 = (void *)v38;
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v21 = (char *)swift_slowAlloc();
      v39 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v21 = 138412290;
      v82[0] = v23;
      v23 = v23;
      sub_100007360();
      void *v39 = a2;

      _os_log_impl((void *)&_mh_execute_header, v37, (os_log_type_t)v5, "no action string for %@", (uint8_t *)v21, 0xCu);
      sub_100005580(&qword_10000C1D0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      v37 = v23;
    }

    (*(void (**)(char *, uint64_t))(v79 + 8))(v12, v78);
    unsigned __int8 v40 = v77;
    if (v77) {
      goto LABEL_53;
    }
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v31 = v80;
  unint64_t v30 = v81;
  if (v80 == 0x41736C6961746564 && v81 == 0xED00006E6F697463 || (sub_100007420() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    uint64_t v80 = 7107189;
    unint64_t v81 = 0xE300000000000000;
    sub_1000073A0();
    id v32 = [a2 userInfo];
    if (!v32)
    {
LABEL_59:
      __break(1u);
LABEL_60:
      __break(1u);
      goto LABEL_61;
    }
    v33 = v32;
    uint64_t v34 = sub_1000072E0();

    if (*(void *)(v34 + 16))
    {
      unint64_t v35 = sub_100006D34((uint64_t)v82);
      if (v36)
      {
        sub_100006E28(*(void *)(v34 + 56) + 32 * v35, (uint64_t)&v83);
        goto LABEL_23;
      }
    }
LABEL_22:
    long long v83 = 0u;
    long long v84 = 0u;
LABEL_23:
    swift_bridgeObjectRelease();
    sub_100006D78((uint64_t)v82);
    if (*((void *)&v84 + 1))
    {
      uint64_t v41 = swift_dynamicCast();
      if (v41)
      {
        uint64_t v21 = (char *)v80;
        unint64_t v42 = v81;
        (*(void (**)(void))((swift_isaMask & *v5) + 0x58))();
        swift_bridgeObjectRetain_n();
        v43 = sub_1000072A0();
        os_log_type_t v44 = sub_100007350();
        if (os_log_type_enabled(v43, v44))
        {
          uint64_t v45 = (uint8_t *)swift_slowAlloc();
          v82[0] = (id)swift_slowAlloc();
          *(_DWORD *)uint64_t v45 = 136315138;
          swift_bridgeObjectRetain();
          *(void *)&long long v83 = sub_10000660C((uint64_t)v21, v42, (uint64_t *)v82);
          sub_100007360();
          swift_bridgeObjectRelease_n();
          _os_log_impl((void *)&_mh_execute_header, v43, v44, "action, detailsActions, open URL %s", v45, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        (*(void (**)(char *, uint64_t))(v79 + 8))(v23, v78);
        (*(void (**)(char *, unint64_t))((swift_isaMask & *v5) + 0x70))(v21, v42);
        swift_bridgeObjectRelease();
        goto LABEL_52;
      }
    }
    else
    {
      uint64_t v41 = sub_100006DCC((uint64_t)&v83, &qword_10000C1C8);
    }
    (*(void (**)(uint64_t))((swift_isaMask & *v5) + 0x58))(v41);
    v46 = sub_1000072A0();
    os_log_type_t v47 = sub_100007340();
    if (os_log_type_enabled(v46, v47))
    {
      uint64_t v48 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v48 = 0;
      _os_log_impl((void *)&_mh_execute_header, v46, v47, "action, detailsActions, URL missing", v48, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v79 + 8))(v21, v78);
    goto LABEL_52;
  }
  if (v31 == 0x7463417261656C63 && v30 == 0xEB000000006E6F69)
  {
    uint64_t v49 = swift_bridgeObjectRelease();
    v50 = v75;
LABEL_36:
    (*(void (**)(uint64_t))((swift_isaMask & *v5) + 0x58))(v49);
    uint64_t v52 = v50;
    v53 = sub_1000072A0();
    os_log_type_t v54 = sub_100007350();
    if (os_log_type_enabled(v53, v54))
    {
      uint64_t v21 = (char *)swift_slowAlloc();
      uint64_t v55 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v21 = 138412290;
      if (v50)
      {
        v82[0] = v52;
        v56 = v52;
      }
      else
      {
        v82[0] = 0;
      }
      sub_100007360();
      *uint64_t v55 = v50;

      _os_log_impl((void *)&_mh_execute_header, v53, v54, "action, clearing item %@", (uint8_t *)v21, 0xCu);
      sub_100005580(&qword_10000C1D0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      v53 = v52;
    }

    (*(void (**)(char *, uint64_t))(v79 + 8))(v18, v78);
    if (!v50) {
      goto LABEL_60;
    }
    id v65 = [v52 uniqueIdentifier];
    if (v65)
    {
      v66 = v65;
      uint64_t v67 = sub_100007300();
      uint64_t v69 = v68;

      id v70 = [objc_allocWithZone((Class)FLFollowUpController) init];
      sub_100005580(&qword_10000C1D8);
      uint64_t v21 = (char *)swift_allocObject();
      *((_OWORD *)v21 + 1) = xmmword_100007800;
      *((void *)v21 + 7) = &type metadata for String;
      *((void *)v21 + 4) = v67;
      *((void *)v21 + 5) = v69;
      Class isa = sub_100007330().super.isa;
      swift_bridgeObjectRelease();
      v82[0] = 0;
      LODWORD(v69) = [v70 clearPendingFollowUpItemsWithUniqueIdentifiers:isa error:v82];

      if (v69)
      {
        id v72 = v82[0];
      }
      else
      {
        id v73 = v82[0];
        sub_100007250();

        swift_willThrow();
        swift_errorRelease();
      }
    }
    goto LABEL_52;
  }
  char v51 = sub_100007420();
  uint64_t v49 = swift_bridgeObjectRelease();
  v50 = v75;
  if (v51) {
    goto LABEL_36;
  }
  (*(void (**)(uint64_t))((swift_isaMask & *v5) + 0x58))(v49);
  uint64_t v21 = a2;
  v57 = sub_1000072A0();
  os_log_type_t v58 = sub_100007340();
  if (!os_log_type_enabled(v57, v58))
  {

    goto LABEL_55;
  }
  uint64_t v59 = (uint8_t *)swift_slowAlloc();
  v82[0] = (id)swift_slowAlloc();
  *(_DWORD *)uint64_t v59 = 136315138;
  id v60 = [v21 identifier];
  if (v60)
  {
    v61 = v60;
    uint64_t v62 = sub_100007300();
    unint64_t v64 = v63;

    *(void *)&long long v83 = sub_10000660C(v62, v64, (uint64_t *)v82);
    sub_100007360();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v57, v58, "missing action: %s", v59, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

LABEL_55:
    (*(void (**)(char *, uint64_t))(v79 + 8))(v15, v78);
LABEL_52:
    unsigned __int8 v40 = v77;
    if (v77)
    {
LABEL_53:
      v40(1);
      return;
    }
    __break(1u);
    goto LABEL_59;
  }
LABEL_61:

  __break(1u);
}

id FollowUpViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    NSString v6 = sub_1000072F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  id v7 = [objc_allocWithZone(v4) initWithNibName:v6 bundle:a3];

  return v7;
}

void FollowUpViewController.init(nibName:bundle:)()
{
}

id FollowUpViewController.__deallocating_deinit()
{
  return sub_100006560((SEL *)&selRef_dealloc);
}

id sub_100006560(SEL *a1)
{
  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for FollowUpViewController();
  return objc_msgSendSuper2(&v4, *a1);
}

uint64_t sub_10000660C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000066E0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100006E28((uint64_t)v12, *a3);
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
      sub_100006E28((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100007184((uint64_t)v12);
  return v7;
}

uint64_t sub_1000066E0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100007370();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10000689C(a5, a6);
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
  uint64_t v8 = sub_1000073C0();
  if (!v8)
  {
    sub_1000073D0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100007400();
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

uint64_t sub_10000689C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100006934(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100006B14(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100006B14(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100006934(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100006AAC(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1000073B0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_1000073D0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100007320();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100007400();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_1000073D0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100006AAC(uint64_t a1, uint64_t a2)
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
  sub_100005580(&qword_10000C208);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100006B14(char a1, int64_t a2, char a3, char *a4)
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
    sub_100005580(&qword_10000C208);
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
  uint64_t result = sub_100007400();
  __break(1u);
  return result;
}

unint64_t sub_100006C64()
{
  unint64_t result = qword_10000C1C0;
  if (!qword_10000C1C0)
  {
    sub_100007290();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C1C0);
  }
  return result;
}

unint64_t sub_100006CBC(uint64_t a1, uint64_t a2)
{
  sub_100007430();
  sub_100007310();
  Swift::Int v4 = sub_100007440();
  return sub_100006F7C(a1, a2, v4);
}

unint64_t sub_100006D34(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_100007380(*(void *)(v2 + 40));
  return sub_100007060(a1, v4);
}

uint64_t sub_100006D78(uint64_t a1)
{
  return a1;
}

uint64_t sub_100006DCC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100005580(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100006E28(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100006E84()
{
  return type metadata accessor for FollowUpViewController();
}

uint64_t sub_100006E8C()
{
  uint64_t result = sub_1000072C0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_100006F1C(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_100006F2C()
{
  _Block_release(*(const void **)(v0 + 16));
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100006F64(char a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(v1 + 16) + 16))(*(void *)(v1 + 16), a1 & 1);
}

unint64_t sub_100006F7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100007420() & 1) == 0)
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
      while (!v14 && (sub_100007420() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_100007060(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_100007128(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_100007390();
      sub_100006D78((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_100007128(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100007184(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000071D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005580(&qword_10000C218);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_100007240(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100007250()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_100007260()
{
  return URL.description.getter();
}

void sub_100007270(NSURL *retstr@<X8>)
{
}

uint64_t sub_100007280()
{
  return URL.init(string:)();
}

uint64_t sub_100007290()
{
  return type metadata accessor for URL();
}

uint64_t sub_1000072A0()
{
  return Logger.logObject.getter();
}

uint64_t sub_1000072B0()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_1000072C0()
{
  return type metadata accessor for Logger();
}

NSDictionary sub_1000072D0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_1000072E0()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

NSString sub_1000072F0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100007300()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100007310()
{
  return String.hash(into:)();
}

Swift::Int sub_100007320()
{
  return String.UTF8View._foreignCount()();
}

NSArray sub_100007330()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100007340()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100007350()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100007360()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100007370()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

Swift::Int sub_100007380(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_100007390()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_1000073A0()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_1000073B0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_1000073C0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_1000073D0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1000073E0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1000073F0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100007400()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100007410()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_100007420()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100007430()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100007440()
{
  return Hasher._finalize()();
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

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}