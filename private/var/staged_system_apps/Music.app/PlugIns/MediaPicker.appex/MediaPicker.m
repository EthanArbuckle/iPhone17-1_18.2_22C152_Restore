uint64_t sub_100003DA0()
{
  uint64_t v0;
  uint64_t result;

  type metadata accessor for MediaPickerServiceCoordinator();
  v0 = swift_allocObject();
  result = swift_unknownObjectWeakInit();
  qword_10000CD20 = v0;
  return result;
}

void sub_100003DE4(void *a1)
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  swift_unknownObjectWeakAssign();
  if (Strong)
  {
    uint64_t v3 = swift_unknownObjectWeakLoadStrong();
    if (v3)
    {
      v4 = (void *)v3;
      sub_100003F80();
      id v10 = Strong;
      char v5 = sub_100006B60();

      if (v5)
      {
LABEL_11:

        v6 = v10;
        goto LABEL_12;
      }
    }
    else
    {
      id v7 = Strong;
    }
    [Strong willMoveToParentViewController:0];
    if ([Strong isViewLoaded])
    {
      id v8 = [Strong view];
      if (!v8)
      {
        __break(1u);
        return;
      }
      v9 = v8;
      [v8 removeFromSuperview];
    }
    [Strong removeFromParentViewController];
    id v10 = Strong;
    goto LABEL_11;
  }
  v6 = a1;
LABEL_12:
}

uint64_t sub_100003F24()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for MediaPickerServiceCoordinator()
{
  return self;
}

unint64_t sub_100003F80()
{
  unint64_t result = qword_10000CBD0;
  if (!qword_10000CBD0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10000CBD0);
  }
  return result;
}

void type metadata accessor for MPMediaPickerSelectionMode()
{
  if (!qword_10000CBD8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_10000CBD8);
    }
  }
}

void sub_10000401C()
{
  id v0 = [self mainScreen];
  [v0 bounds];
  double v2 = v1;
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;

  id v9 = [objc_allocWithZone((Class)sub_100006A30()) initWithFrame:v2, v4, v6, v8];
  id v10 = (id *)sub_1000069E0();
  v11 = *(void (**)(id, void *, void, void, void))((swift_isaMask & *(void *)*v10) + 0xD0);
  id v12 = *v10;
  id v13 = v9;
  v11(v9, &protocol witness table for Window, 0, 0, 0);
}

id sub_10000414C()
{
  double v1 = v0;
  uint64_t v2 = sub_100006A60();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  double v5 = (char *)&v56 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v6 = (objc_class *)type metadata accessor for MusicMediaPickerServiceViewController();
  v59.receiver = v0;
  v59.super_class = v6;
  [super viewDidLoad];
  double v7 = (void *)sub_100006A10();
  uint64_t v9 = v8;
  uint64_t v10 = qword_10000CAA0;
  id v11 = v7;
  if (v10 != -1) {
    swift_once();
  }
  uint64_t ObjectType = swift_getObjectType();
  id v13 = v11;
  sub_100003DE4(v11);
  [self setPrefersInMemoryDatabase:1];
  id v14 = [v13 view];
  if (v14)
  {
    v15 = v14;
    [v1 addChildViewController:v13];
    id result = [v1 view];
    if (result)
    {
      v17 = result;
      [result bounds];
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;
      double v25 = v24;

      [v15 setFrame:v19, v21, v23, v25];
      [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
      id result = [v1 view];
      if (result)
      {
        v26 = result;
        uint64_t v57 = ObjectType;
        [result addSubview:v15];

        sub_10000671C(&qword_10000CCD8);
        uint64_t v27 = swift_allocObject();
        *(_OWORD *)(v27 + 16) = xmmword_1000070A0;
        id v28 = [v15 topAnchor];
        id result = [v1 view];
        if (result)
        {
          v29 = result;
          id v30 = [result topAnchor];

          id v31 = [v28 constraintEqualToAnchor:v30];
          *(void *)(v27 + 32) = v31;
          id v32 = [v15 bottomAnchor];
          id result = [v1 view];
          if (result)
          {
            v33 = result;
            uint64_t v56 = v9;
            id v34 = [result bottomAnchor];

            id v35 = [v32 constraintEqualToAnchor:v34];
            *(void *)(v27 + 40) = v35;
            id v36 = [v15 leadingAnchor];
            id result = [v1 view];
            if (result)
            {
              v37 = result;
              id v38 = [result leadingAnchor];

              id v39 = [v36 constraintEqualToAnchor:v38];
              *(void *)(v27 + 48) = v39;
              id v40 = [v15 trailingAnchor];
              id result = [v1 view];
              if (result)
              {
                v41 = result;
                v42 = self;
                id v43 = [v41 trailingAnchor];

                id v44 = [v40 constraintEqualToAnchor:v43];
                *(void *)(v27 + 56) = v44;
                id v58 = (id)v27;
                sub_100006AD0();
                sub_100006984(0, (unint64_t *)&unk_10000CD10);
                Class isa = sub_100006AC0().super.isa;
                swift_bridgeObjectRelease();
                [v42 activateConstraints:isa];

                [v13 didMoveToParentViewController:v1];
                id v58 = v13;
                uint64_t v46 = v56;
                v47 = *(void (**)(void *, _UNKNOWN **, uint64_t, uint64_t))(v56 + 16);
                swift_unknownObjectRetain();
                v47(v1, &off_100008560, v57, v46);
                v48 = v58;
                swift_unknownObjectWeakAssign();
                v49 = (char *)*(id *)sub_1000069C0();
                sub_1000069F0();
                v50 = &v49[direct field offset for JSSegueCoordinator.seguePerformingDelegate];
                swift_beginAccess();
                *((void *)v50 + 1) = &protocol witness table for MusicSeguePerformer;
                swift_unknownObjectWeakAssign();

                uint64_t v51 = *(void *)sub_1000069D0();
                swift_retain();
                sub_100006A00();
                swift_retain();

                swift_beginAccess();
                *(void *)(v51 + 24) = &protocol witness table for MusicHTTPRequestAuthenticator;
                swift_unknownObjectWeakAssign();
                swift_release();
                return (id)swift_release();
              }
              goto LABEL_19;
            }
LABEL_18:
            __break(1u);
LABEL_19:
            __break(1u);
            return result;
          }
LABEL_17:
          __break(1u);
          goto LABEL_18;
        }
LABEL_16:
        __break(1u);
        goto LABEL_17;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_16;
  }

  uint64_t v52 = sub_100006A40();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v52, v2);
  v53 = sub_100006A50();
  os_log_type_t v54 = sub_100006B20();
  if (os_log_type_enabled(v53, v54))
  {
    v55 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v55 = 0;
    _os_log_impl((void *)&_mh_execute_header, v53, v54, "Could not get a view from CreateMediaPickerNavigationController().", v55, 2u);
    swift_slowDealloc();
  }

  return (id)(*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_1000048F4()
{
  if ([v0 _remoteViewControllerProxy])
  {
    sub_100006B90();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v3, 0, sizeof(v3));
  }
  sub_1000068BC((uint64_t)v3, (uint64_t)v4);
  if (v5)
  {
    sub_10000671C(&qword_10000CD08);
    if (swift_dynamicCast()) {
      return v2;
    }
    else {
      return 0;
    }
  }
  else
  {
    sub_100006924((uint64_t)v4);
    return 0;
  }
}

void sub_1000049B0()
{
  uint64_t v0 = sub_100006A60();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_100006B40())
  {
    uint64_t v4 = (id *)sub_1000069E0();
    uint64_t v5 = *(uint64_t (**)(void))((swift_isaMask & *(void *)*v4) + 0xC0);
    id v6 = *v4;
    LOBYTE(v5) = v5();

    if ((v5 & 1) == 0 && qword_10000CAA8 != -1) {
      swift_once();
    }
  }
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v14 = (void *)Strong;
    sub_100006A20();
    uint64_t v8 = v14;
  }
  else
  {
    uint64_t v9 = sub_100006A40();
    (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v9, v0);
    uint64_t v10 = sub_100006A50();
    os_log_type_t v11 = sub_100006B10();
    if (os_log_type_enabled(v10, v11))
    {
      id v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "update(with:) was called when self.mediaPickerViewController was nil", v12, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
}

id sub_100004C74(uint64_t a1, uint64_t a2, SEL *a3)
{
  id v3 = [self *a3];

  return v3;
}

id sub_100004DE4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MusicMediaPickerServiceViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for MusicMediaPickerServiceViewController()
{
  return self;
}

void sub_100004E4C(uint64_t a1, uint64_t a2, char a3, void *a4)
{
}

void *sub_100004E5C()
{
  id result = (void *)sub_1000048F4();
  if (result)
  {
    [result remoteMediaPickerDidCancel];
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_100004EB0(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  return a3(a2);
}

uint64_t sub_100004EDC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100004FB0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000685C((uint64_t)v12, *a3);
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
      sub_10000685C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000680C((uint64_t)v12);
  return v7;
}

uint64_t sub_100004FB0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100006B80();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10000516C(a5, a6);
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
  uint64_t v8 = sub_100006BD0();
  if (!v8)
  {
    sub_100006BE0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100006C00();
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

uint64_t sub_10000516C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100005204(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000053E4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000053E4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100005204(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10000537C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100006BB0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100006BE0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100006AA0();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100006C00();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100006BE0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10000537C(uint64_t a1, uint64_t a2)
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
  sub_10000671C(&qword_10000CCF8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1000053E4(char a1, int64_t a2, char a3, char *a4)
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
    sub_10000671C(&qword_10000CCF8);
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
  uint64_t result = sub_100006C00();
  __break(1u);
  return result;
}

void sub_100005534(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_100006BF0();
    swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      sub_10000671C(&qword_10000CCF0);
      unint64_t v3 = (void *)sub_100006BA0();
      uint64_t v4 = a1 & 0xFFFFFFFFFFFFFF8;
      if (!v2) {
        goto LABEL_4;
      }
LABEL_8:
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_100006BF0();
      swift_bridgeObjectRelease();
      if (!v5) {
        return;
      }
      goto LABEL_9;
    }
  }
  else if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  unint64_t v3 = &_swiftEmptySetSingleton;
  uint64_t v4 = a1 & 0xFFFFFFFFFFFFFF8;
  if (v2) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5) {
    return;
  }
LABEL_9:
  int64_t v7 = (char *)(v3 + 7);
  uint64_t v43 = v5;
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v8 = 0;
    while (1)
    {
      while (1)
      {
        uint64_t v9 = sub_100006BC0();
        BOOL v10 = __OFADD__(v8++, 1);
        if (v10)
        {
          __break(1u);
          goto LABEL_36;
        }
        uint64_t v11 = v9;
        Swift::Int v12 = sub_100006B50(v3[5]);
        uint64_t v13 = -1 << *((unsigned char *)v3 + 32);
        unint64_t v14 = v12 & ~v13;
        unint64_t v15 = v14 >> 6;
        uint64_t v16 = *(void *)&v7[8 * (v14 >> 6)];
        uint64_t v17 = 1 << v14;
        if (((1 << v14) & v16) != 0) {
          break;
        }
LABEL_20:
        *(void *)&v7[8 * v15] = v17 | v16;
        *(void *)(v3[6] + 8 * v14) = v11;
        uint64_t v23 = v3[2];
        BOOL v10 = __OFADD__(v23, 1);
        uint64_t v24 = v23 + 1;
        if (v10) {
          goto LABEL_37;
        }
        _OWORD v3[2] = v24;
        if (v8 == v5) {
          return;
        }
      }
      sub_100006984(0, &qword_10000CCE0);
      id v18 = *(id *)(v3[6] + 8 * v14);
      char v19 = sub_100006B60();

      if ((v19 & 1) == 0)
      {
        uint64_t v20 = ~v13;
        while (1)
        {
          unint64_t v14 = (v14 + 1) & v20;
          unint64_t v15 = v14 >> 6;
          uint64_t v16 = *(void *)&v7[8 * (v14 >> 6)];
          uint64_t v17 = 1 << v14;
          if ((v16 & (1 << v14)) == 0) {
            break;
          }
          id v21 = *(id *)(v3[6] + 8 * v14);
          char v22 = sub_100006B60();

          if (v22) {
            goto LABEL_11;
          }
        }
        uint64_t v5 = v43;
        goto LABEL_20;
      }
LABEL_11:
      swift_unknownObjectRelease();
      uint64_t v5 = v43;
      if (v8 == v43) {
        return;
      }
    }
  }
  uint64_t v25 = 0;
  unint64_t v41 = a1 + 32;
  uint64_t v42 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v25 != v42)
  {
    Swift::Int v26 = v3[5];
    id v27 = *(id *)(v41 + 8 * v25);
    Swift::Int v28 = sub_100006B50(v26);
    uint64_t v29 = -1 << *((unsigned char *)v3 + 32);
    unint64_t v30 = v28 & ~v29;
    unint64_t v31 = v30 >> 6;
    uint64_t v32 = *(void *)&v7[8 * (v30 >> 6)];
    uint64_t v33 = 1 << v30;
    if (((1 << v30) & v32) != 0)
    {
      sub_100006984(0, &qword_10000CCE0);
      id v34 = *(id *)(v3[6] + 8 * v30);
      char v35 = sub_100006B60();

      if (v35)
      {
LABEL_24:

        goto LABEL_25;
      }
      uint64_t v36 = ~v29;
      while (1)
      {
        unint64_t v30 = (v30 + 1) & v36;
        unint64_t v31 = v30 >> 6;
        uint64_t v32 = *(void *)&v7[8 * (v30 >> 6)];
        uint64_t v33 = 1 << v30;
        if ((v32 & (1 << v30)) == 0) {
          break;
        }
        id v37 = *(id *)(v3[6] + 8 * v30);
        char v38 = sub_100006B60();

        if (v38) {
          goto LABEL_24;
        }
      }
    }
    *(void *)&v7[8 * v31] = v33 | v32;
    *(void *)(v3[6] + 8 * v30) = v27;
    uint64_t v39 = v3[2];
    BOOL v10 = __OFADD__(v39, 1);
    uint64_t v40 = v39 + 1;
    if (v10) {
      goto LABEL_38;
    }
    _OWORD v3[2] = v40;
LABEL_25:
    if (++v25 == v43) {
      return;
    }
  }
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
}

void sub_100005890(uint64_t a1, char a2, void *a3)
{
  uint64_t v7 = sub_100006A60();
  uint64_t v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  BOOL v10 = (char *)v80 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v8);
  uint64_t v13 = (char *)v80 - v12;
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v16 = (char *)v80 - v15;
  uint64_t v17 = __chkstk_darwin(v14);
  char v19 = (char *)v80 - v18;
  __chkstk_darwin(v17);
  char v22 = (char *)v80 - v21;
  if (a2)
  {
    uint64_t v29 = (id *)(id)a1;
    unint64_t v30 = (void *)sub_1000048F4();
    if (v30)
    {
      [v30 remoteMediaPickerDidPickPlaybackArchive:v29];
      swift_unknownObjectRelease();
    }
    sub_100006710((id)a1, 1);
  }
  else
  {
    id v81 = v20;
    swift_bridgeObjectRetain();
    switch((unint64_t)[a3 selectionMode])
    {
      case 0uLL:
      case 1uLL:
        *(void *)&long long v82 = &_swiftEmptyArrayStorage;
        if ((unint64_t)a1 >> 62)
        {
          if (a1 >= 0) {
            char v22 = (char *)(a1 & 0xFFFFFFFFFFFFFF8);
          }
          else {
            char v22 = (char *)a1;
          }
          swift_bridgeObjectRetain();
          uint64_t v7 = sub_100006BF0();
          if (v7) {
            goto LABEL_5;
          }
        }
        else
        {
          uint64_t v7 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
          if (v7)
          {
LABEL_5:
            id v81 = v3;
            if (v7 < 1)
            {
              __break(1u);
              goto LABEL_68;
            }
            uint64_t v23 = 0;
            while (1)
            {
              id v24 = (a1 & 0xC000000000000001) != 0 ? (id)sub_100006BC0() : *(id *)(a1 + 8 * v23 + 32);
              uint64_t v25 = v24;
              self;
              uint64_t v26 = swift_dynamicCastObjCClass();
              if (!v26) {
                break;
              }
              id v27 = [self genericObjectWithModelObject:v26];
              id v28 = [self itemFromModelObject:v27];

              if (v28) {
                goto LABEL_8;
              }
LABEL_11:
              if (v7 == ++v23) {
                goto LABEL_60;
              }
            }
            [objc_allocWithZone((Class)MPModelObjectMediaItem) initWithModelObject:v25];

LABEL_8:
            sub_100006AB0();
            if (*(void *)((v82 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v82 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              sub_100006AE0();
            }
            sub_100006AF0();
            sub_100006AD0();
            goto LABEL_11;
          }
        }
LABEL_60:
        sub_100006710((id)a1, 0);
        sub_100006710((id)a1, 0);
        id v64 = objc_allocWithZone((Class)MPMediaItemCollection);
        sub_100006984(0, &qword_10000CCD0);
        Class isa = sub_100006AC0().super.isa;
        swift_bridgeObjectRelease();
        id v81 = [v64 initWithItems:isa];

        v66 = (void *)sub_1000048F4();
        if (v66)
        {
          [v66 remoteMediaPickerDidPickMediaItems:v81];

          swift_unknownObjectRelease();
        }
        else
        {
          id v67 = v81;
        }
        return;
      case 2uLL:
        if ([a3 picksSingleCollectionEntity])
        {
          unint64_t v3 = (void *)(a1 & 0xFFFFFFFFFFFFFF8);
          if ((unint64_t)a1 >> 62)
          {
LABEL_68:
            swift_bridgeObjectRetain();
            uint64_t v39 = (void *)sub_100006BF0();
            sub_100006710((id)a1, 0);
            if (v39) {
              goto LABEL_29;
            }
          }
          else
          {
            uint64_t v39 = *(void **)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
            if (v39)
            {
LABEL_29:
              if ((a1 & 0xC000000000000001) != 0)
              {
                id v40 = (id)sub_100006BC0();
              }
              else
              {
                if (!v3[2])
                {
                  __break(1u);
                  goto LABEL_75;
                }
                id v40 = *(id *)(a1 + 32);
              }
              uint64_t v39 = v40;
              sub_100006710((id)a1, 0);
              id v41 = [v39 identifiers];
              id v42 = [v41 library];

              if (v42)
              {
                id v43 = [v42 persistentID];
                swift_unknownObjectRelease();
              }
              else
              {
                id v43 = 0;
              }
              self;
              if (swift_dynamicCastObjCClass())
              {
                if (v42) {
                  goto LABEL_51;
                }
                goto LABEL_52;
              }
              self;
              if (swift_dynamicCastObjCClass())
              {
                if (v42)
                {
LABEL_51:
                  *((void *)&v83 + 1) = &type metadata for Int64;
                  *(void *)&long long v82 = v43;
                  sub_100006A80();
                  uint64_t v56 = sub_1000067C8(&v82, (uint64_t)&type metadata for Int64);
                  uint64_t v57 = *(&type metadata for Int64 - 1);
                  __chkstk_darwin(v56);
                  objc_super v59 = (char *)v80 - ((v58 + 15) & 0xFFFFFFFFFFFFFFF0);
                  (*(void (**)(char *))(v57 + 16))(v59);
                  id v42 = (id)sub_100006C10();
                  (*(void (**)(char *, void *))(v57 + 8))(v59, &type metadata for Int64);
                  sub_10000680C((uint64_t)&v82);
                  goto LABEL_53;
                }
LABEL_52:
                long long v82 = 0u;
                long long v83 = 0u;
                sub_100006A80();
LABEL_53:
                NSString v60 = sub_100006A70();
                swift_bridgeObjectRelease();
                uint64_t v7 = (uint64_t)[self predicateWithValue:v42 forProperty:v60];
                swift_unknownObjectRelease();

                sub_10000671C(&qword_10000CCD8);
                uint64_t inited = swift_initStackObject();
                *(_OWORD *)(inited + 16) = xmmword_1000070B0;
                *(void *)(inited + 32) = v7;
                *(void *)&long long v82 = inited;
                sub_100006AD0();
                unint64_t v3 = (void *)v82;
                if (!((unint64_t)v82 >> 62))
                {
                  uint64_t v62 = *(void *)((v82 & 0xFFFFFFFFFFFFFF8) + 0x10);
                  id v63 = (id)v7;
                  if (!v62)
                  {
LABEL_76:
                    swift_bridgeObjectRelease();
                    id v74 = objc_allocWithZone((Class)MPMediaQuery);
                    sub_100006984(0, &qword_10000CCE0);
                    sub_100006760();
                    Class v75 = sub_100006B00().super.isa;
                    swift_bridgeObjectRelease();
                    id v76 = [v74 initWithFilterPredicates:v75];

                    id v77 = [objc_allocWithZone((Class)MPMediaItemCollection) initWithItemsQuery:v76];
                    if (v77)
                    {
                      v78 = v77;
                      v79 = (void *)sub_1000048F4();
                      if (v79)
                      {
                        [v79 remoteMediaPickerDidPickMediaItems:v78];

                        swift_unknownObjectRelease();
                      }
                      else
                      {
                      }
                    }
                    else
                    {
                    }
                    return;
                  }
LABEL_55:
                  sub_100005534((unint64_t)v3);
                  goto LABEL_76;
                }
LABEL_75:
                id v72 = (id)v7;
                swift_bridgeObjectRetain();
                uint64_t v73 = sub_100006BF0();
                swift_bridgeObjectRelease();
                if (!v73) {
                  goto LABEL_76;
                }
                goto LABEL_55;
              }
              goto LABEL_70;
            }
          }
          sub_100006710((id)a1, 0);
LABEL_70:
          uint64_t v68 = sub_100006A40();
          (*((void (**)(char *, uint64_t, uint64_t))v81 + 2))(v22, v68, v7);
          v69 = sub_100006A50();
          os_log_type_t v70 = sub_100006B20();
          if (os_log_type_enabled(v69, v70))
          {
            v71 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v71 = 0;
            _os_log_impl((void *)&_mh_execute_header, v69, v70, "A non-playlist/album was picked while picksSingleCollectionEntity was true.", v71, 2u);
            swift_slowDealloc();
          }

          (*((void (**)(char *, uint64_t))v81 + 1))(v22, v7);
          return;
        }
        sub_100006710((id)a1, 0);
        uint64_t v52 = sub_100006A40();
        (*((void (**)(char *, uint64_t, uint64_t))v81 + 2))(v19, v52, v7);
        v53 = sub_100006A50();
        os_log_type_t v54 = sub_100006B10();
        if (os_log_type_enabled(v53, v54))
        {
          v55 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v55 = 0;
          _os_log_impl((void *)&_mh_execute_header, v53, v54, "A SelectionMode of .singleCollection for non-legacy clients is not yet supported", v55, 2u);
          swift_slowDealloc();
        }

        (*((void (**)(char *, uint64_t))v81 + 1))(v19, v7);
        break;
      case 3uLL:
        sub_100006710((id)a1, 0);
        uint64_t v44 = sub_100006A40();
        (*((void (**)(char *, uint64_t, uint64_t))v81 + 2))(v16, v44, v7);
        v45 = sub_100006A50();
        os_log_type_t v46 = sub_100006B10();
        if (os_log_type_enabled(v45, v46))
        {
          v47 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v47 = 0;
          _os_log_impl((void *)&_mh_execute_header, v45, v46, "A SelectionMode of .collections is not yet supported", v47, 2u);
          swift_slowDealloc();
        }

        (*((void (**)(char *, uint64_t))v81 + 1))(v16, v7);
        return;
      case 4uLL:
        sub_100006710((id)a1, 0);
        uint64_t v48 = sub_100006A40();
        (*((void (**)(char *, uint64_t, uint64_t))v81 + 2))(v13, v48, v7);
        v49 = sub_100006A50();
        os_log_type_t v50 = sub_100006B30();
        if (os_log_type_enabled(v49, v50))
        {
          uint64_t v51 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v51 = 0;
          _os_log_impl((void *)&_mh_execute_header, v49, v50, "Received result of type .modelObject(_) when selectionMode was .playbackArchive", v51, 2u);
          swift_slowDealloc();
        }

        (*((void (**)(char *, uint64_t))v81 + 1))(v13, v7);
        return;
      default:
        sub_100006710((id)a1, 0);
        uint64_t v31 = sub_100006A40();
        uint64_t v32 = (void (**)(char *, uint64_t))v81;
        (*((void (**)(char *, uint64_t, uint64_t))v81 + 2))(v10, v31, v7);
        id v33 = a3;
        id v34 = sub_100006A50();
        os_log_type_t v35 = sub_100006B20();
        if (os_log_type_enabled(v34, v35))
        {
          uint64_t v36 = (uint8_t *)swift_slowAlloc();
          *(void *)&long long v82 = swift_slowAlloc();
          *(_DWORD *)uint64_t v36 = 136446210;
          v80[1] = v36 + 4;
          id v84 = [v33 selectionMode];
          type metadata accessor for MPMediaPickerSelectionMode();
          uint64_t v37 = sub_100006A90();
          id v84 = (id)sub_100004EDC(v37, v38, (uint64_t *)&v82);
          sub_100006B70();

          swift_bridgeObjectRelease();
          _os_log_impl((void *)&_mh_execute_header, v34, v35, "Unknown selectionMode = %{public}s", v36, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
        }
        v32[1](v10, v7);
        return;
    }
  }
}

void sub_100006710(id a1, char a2)
{
  if (a2) {

  }
  else {
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_10000671C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100006760()
{
  unint64_t result = qword_10000CCE8;
  if (!qword_10000CCE8)
  {
    sub_100006984(255, &qword_10000CCE0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000CCE8);
  }
  return result;
}

void *sub_1000067C8(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10000680C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000685C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000068BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000671C(&qword_10000CD00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100006924(uint64_t a1)
{
  uint64_t v2 = sub_10000671C(&qword_10000CD00);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100006984(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1000069C0()
{
  return JSSegueCoordinator.shared.unsafeMutableAddressor();
}

uint64_t sub_1000069D0()
{
  return JSHTTPRequestCoordinator.shared.unsafeMutableAddressor();
}

uint64_t sub_1000069E0()
{
  return JSBridge.shared.unsafeMutableAddressor();
}

uint64_t sub_1000069F0()
{
  return MusicSeguePerformer.shared.unsafeMutableAddressor();
}

uint64_t sub_100006A00()
{
  return MusicHTTPRequestAuthenticator.shared.unsafeMutableAddressor();
}

uint64_t sub_100006A10()
{
  return CreateMediaPickerViewController()();
}

uint64_t sub_100006A20()
{
  return UpdateMediaPickerViewController(_:with:)();
}

uint64_t sub_100006A30()
{
  return type metadata accessor for Window();
}

uint64_t sub_100006A40()
{
  return Logger.mediaPicker.unsafeMutableAddressor();
}

uint64_t sub_100006A50()
{
  return Logger.logObject.getter();
}

uint64_t sub_100006A60()
{
  return type metadata accessor for Logger();
}

NSString sub_100006A70()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100006A80()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100006A90()
{
  return String.init<A>(describing:)();
}

Swift::Int sub_100006AA0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100006AB0()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_100006AC0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100006AD0()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100006AE0()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100006AF0()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

NSSet sub_100006B00()
{
  return Set._bridgeToObjectiveC()();
}

uint64_t sub_100006B10()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_100006B20()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100006B30()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_100006B40()
{
  return MPMediaPickerConfiguration.supportsCatalogContent.getter();
}

Swift::Int sub_100006B50(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_100006B60()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_100006B70()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100006B80()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100006B90()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_100006BA0()
{
  return static _SetStorage.allocate(capacity:)();
}

uint64_t sub_100006BB0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100006BC0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100006BD0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100006BE0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100006BF0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100006C00()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100006C10()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
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

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
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