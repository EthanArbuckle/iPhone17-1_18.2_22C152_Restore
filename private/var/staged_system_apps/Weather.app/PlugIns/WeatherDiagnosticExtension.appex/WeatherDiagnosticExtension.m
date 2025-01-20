void sub_100003E88(id a1)
{
  uint64_t vars8;

  qword_10000C490 = (uint64_t)os_log_create("com.apple.weather", "Diagnostics");

  _objc_release_x1();
}

unint64_t *DiagnosticFileProvider.files()()
{
  v0 = sub_100003F80();
  v1 = sub_100004234();
  sub_10000551C((uint64_t)v1);
  return v0;
}

unint64_t *sub_100003F80()
{
  uint64_t v0 = sub_100006BF0();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v2);
  v6 = &v18[-v5];
  sub_100006C70();
  sub_100006C60();
  sub_100006C50();
  swift_release();
  sub_100006BD0();
  v7 = *(void (**)(unsigned char *, uint64_t))(v1 + 8);
  v7(v4, v0);
  id v8 = [self defaultManager];
  sub_100006BE0();
  NSString v9 = sub_100006E10();
  swift_bridgeObjectRelease();
  id v19 = 0;
  id v10 = [v8 contentsOfDirectoryAtPath:v9 error:&v19];

  id v11 = v19;
  if (v10)
  {
    uint64_t v12 = sub_100006E60();
    id v13 = v11;

    __chkstk_darwin(v14);
    *(void *)&v18[-16] = v6;
    v15 = sub_100005034((void (*)(void *__return_ptr, void *))sub_1000056F0, (uint64_t)&v18[-32], v12);
    v7(v6, v0);
    swift_bridgeObjectRelease();
  }
  else
  {
    id v16 = v19;
    sub_100006B80();

    swift_willThrow();
    swift_errorRelease();
    v7(v6, v0);
    return (unint64_t *)&_swiftEmptyArrayStorage;
  }
  return v15;
}

char *sub_100004234()
{
  uint64_t v0 = sub_100006DD0();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  v67 = (char *)&v66 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __chkstk_darwin(v2);
  v6 = (char *)&v66 - v5;
  uint64_t v7 = __chkstk_darwin(v4);
  NSString v9 = (char *)&v66 - v8;
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v12 = (char *)&v66 - v11;
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v66 - v13;
  sub_1000055F8(&qword_10000C448);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100007510;
  sub_100006CB0();
  sub_100006CA0();
  uint64_t v16 = sub_100006DC0();
  uint64_t v18 = v17;
  id v19 = *(void (**)(char *, uint64_t))(v1 + 8);
  v19(v14, v0);
  *(void *)(inited + 32) = v16;
  *(void *)(inited + 40) = v18;
  sub_100006C90();
  sub_100006C80();
  uint64_t v20 = sub_100006DC0();
  uint64_t v22 = v21;
  v19(v12, v0);
  *(void *)(inited + 48) = v20;
  *(void *)(inited + 56) = v22;
  sub_100006D10();
  sub_100006D00();
  uint64_t v23 = sub_100006DC0();
  uint64_t v25 = v24;
  v19(v9, v0);
  *(void *)(inited + 64) = v23;
  *(void *)(inited + 72) = v25;
  sub_100006C40();
  *(void *)(inited + 80) = sub_100006C30();
  *(void *)(inited + 88) = v26;
  sub_100006CD0();
  sub_100006CC0();
  uint64_t v27 = sub_100006DC0();
  uint64_t v29 = v28;
  v19(v6, v0);
  *(void *)(inited + 96) = v27;
  *(void *)(inited + 104) = v29;
  sub_100006CF0();
  v30 = v67;
  sub_100006CE0();
  uint64_t v31 = sub_100006DC0();
  uint64_t v33 = v32;
  v19(v30, v0);
  *(void *)(inited + 112) = v31;
  *(void *)(inited + 120) = v33;
  uint64_t v34 = *(void *)(inited + 40);
  if (v34)
  {
    uint64_t v35 = *(void *)(inited + 32);
    swift_bridgeObjectRetain();
    v36 = sub_10000515C(0, 1, 1, (uint64_t)&_swiftEmptyArrayStorage);
    unint64_t v38 = *((void *)v36 + 2);
    unint64_t v37 = *((void *)v36 + 3);
    if (v38 >= v37 >> 1) {
      v36 = sub_10000515C((char *)(v37 > 1), v38 + 1, 1, (uint64_t)v36);
    }
    *((void *)v36 + 2) = v38 + 1;
    v39 = &v36[16 * v38];
    *((void *)v39 + 4) = v35;
    *((void *)v39 + 5) = v34;
  }
  else
  {
    v36 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v40 = *(void *)(inited + 56);
  if (v40)
  {
    uint64_t v41 = *(void *)(inited + 48);
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      v36 = sub_10000515C(0, *((void *)v36 + 2) + 1, 1, (uint64_t)v36);
    }
    unint64_t v43 = *((void *)v36 + 2);
    unint64_t v42 = *((void *)v36 + 3);
    if (v43 >= v42 >> 1) {
      v36 = sub_10000515C((char *)(v42 > 1), v43 + 1, 1, (uint64_t)v36);
    }
    *((void *)v36 + 2) = v43 + 1;
    v44 = &v36[16 * v43];
    *((void *)v44 + 4) = v41;
    *((void *)v44 + 5) = v40;
  }
  uint64_t v45 = *(void *)(inited + 72);
  if (v45)
  {
    uint64_t v46 = *(void *)(inited + 64);
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      v36 = sub_10000515C(0, *((void *)v36 + 2) + 1, 1, (uint64_t)v36);
    }
    unint64_t v48 = *((void *)v36 + 2);
    unint64_t v47 = *((void *)v36 + 3);
    if (v48 >= v47 >> 1) {
      v36 = sub_10000515C((char *)(v47 > 1), v48 + 1, 1, (uint64_t)v36);
    }
    *((void *)v36 + 2) = v48 + 1;
    v49 = &v36[16 * v48];
    *((void *)v49 + 4) = v46;
    *((void *)v49 + 5) = v45;
  }
  uint64_t v50 = *(void *)(inited + 88);
  if (v50)
  {
    uint64_t v51 = *(void *)(inited + 80);
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      v36 = sub_10000515C(0, *((void *)v36 + 2) + 1, 1, (uint64_t)v36);
    }
    unint64_t v53 = *((void *)v36 + 2);
    unint64_t v52 = *((void *)v36 + 3);
    if (v53 >= v52 >> 1) {
      v36 = sub_10000515C((char *)(v52 > 1), v53 + 1, 1, (uint64_t)v36);
    }
    *((void *)v36 + 2) = v53 + 1;
    v54 = &v36[16 * v53];
    *((void *)v54 + 4) = v51;
    *((void *)v54 + 5) = v50;
  }
  uint64_t v55 = *(void *)(inited + 104);
  if (v55)
  {
    uint64_t v56 = *(void *)(inited + 96);
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      v36 = sub_10000515C(0, *((void *)v36 + 2) + 1, 1, (uint64_t)v36);
    }
    unint64_t v58 = *((void *)v36 + 2);
    unint64_t v57 = *((void *)v36 + 3);
    if (v58 >= v57 >> 1) {
      v36 = sub_10000515C((char *)(v57 > 1), v58 + 1, 1, (uint64_t)v36);
    }
    *((void *)v36 + 2) = v58 + 1;
    v59 = &v36[16 * v58];
    *((void *)v59 + 4) = v56;
    *((void *)v59 + 5) = v55;
  }
  uint64_t v60 = *(void *)(inited + 120);
  if (v60)
  {
    uint64_t v61 = *(void *)(inited + 112);
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      v36 = sub_10000515C(0, *((void *)v36 + 2) + 1, 1, (uint64_t)v36);
    }
    unint64_t v63 = *((void *)v36 + 2);
    unint64_t v62 = *((void *)v36 + 3);
    if (v63 >= v62 >> 1) {
      v36 = sub_10000515C((char *)(v62 > 1), v63 + 1, 1, (uint64_t)v36);
    }
    *((void *)v36 + 2) = v63 + 1;
    v64 = &v36[16 * v63];
    *((void *)v64 + 4) = v61;
    *((void *)v64 + 5) = v60;
  }
  swift_setDeallocating();
  sub_1000053D8();
  return v36;
}

uint64_t DiagnosticFileProvider.exportDirectory()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v58 = a1;
  uint64_t v1 = sub_100006C20();
  sub_100005814();
  uint64_t v3 = v2;
  __chkstk_darwin(v4);
  v6 = (char *)&v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100006BF0();
  sub_100005814();
  uint64_t v9 = v8;
  uint64_t v11 = __chkstk_darwin(v10);
  v65 = (char *)&v58 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v11);
  v64 = (char *)&v58 - v14;
  __chkstk_darwin(v13);
  v15 = sub_100003F80();
  uint64_t v16 = sub_100004234();
  uint64_t v66 = v15;
  sub_10000551C((uint64_t)v16);
  v59 = v66;
  uint64_t v17 = NSTemporaryDirectory();
  sub_100006E20();

  sub_100006B90();
  swift_bridgeObjectRelease();
  sub_100006C10();
  sub_100006C00();
  uint64_t v18 = v6;
  uint64_t v19 = v58;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v18, v1);
  sub_100006BD0();
  swift_bridgeObjectRelease();
  uint64_t v22 = *(void (**)(uint64_t))(v9 + 8);
  uint64_t v20 = v9 + 8;
  uint64_t v21 = v22;
  uint64_t v23 = sub_100005830();
  v22(v23);
  id v63 = self;
  id v24 = [v63 defaultManager];
  sub_100006BC0(v25);
  uint64_t v27 = v26;
  uint64_t v66 = 0;
  unsigned int v28 = [v24 createDirectoryAtURL:v26 withIntermediateDirectories:1 attributes:0 error:&v66];

  if (v28)
  {
    unint64_t v62 = v21;
    unint64_t v29 = v59[2];
    if (v29)
    {
      v30 = v59;
      uint64_t v31 = v66;
      uint64_t v32 = v30 + 5;
      long long v60 = xmmword_100007520;
      do
      {
        swift_bridgeObjectRetain();
        sub_100006BA0();
        swift_bridgeObjectRelease();
        sub_100006BB0();
        sub_100006BD0();
        swift_bridgeObjectRelease();
        id v33 = [v63 defaultManager];
        sub_100006BC0(v34);
        v36 = v35;
        sub_100006BC0(v37);
        v39 = v38;
        uint64_t v66 = 0;
        unsigned int v40 = [v33 copyItemAtURL:v36 toURL:v38 error:&v66];

        if (v40)
        {
          uint64_t v41 = v66;
        }
        else
        {
          unint64_t v42 = v66;
          unint64_t v43 = (unint64_t *)sub_100006B80();

          swift_willThrow();
          LODWORD(v61) = sub_100006E70();
          sub_1000055F8(&qword_10000C3F8);
          uint64_t v44 = swift_allocObject();
          *(_OWORD *)(v44 + 16) = v60;
          uint64_t v66 = v43;
          swift_errorRetain();
          sub_1000055F8(&qword_10000C400);
          uint64_t v45 = sub_100006E30();
          uint64_t v46 = v20;
          uint64_t v47 = v7;
          uint64_t v48 = v19;
          uint64_t v50 = v49;
          *(void *)(v44 + 56) = &type metadata for String;
          *(void *)(v44 + 64) = sub_10000563C();
          *(void *)(v44 + 32) = v45;
          *(void *)(v44 + 40) = v50;
          sub_100005688();
          uint64_t v51 = (void *)sub_100006E90();
          sub_100006D20();
          swift_bridgeObjectRelease();

          uint64_t v19 = v48;
          uint64_t v7 = v47;
          uint64_t v20 = v46;
          swift_errorRelease();
          uint64_t v61 = 0;
        }
        v32 += 2;
        unint64_t v52 = v62;
        ((void (*)(char *, uint64_t))v62)(v65, v7);
        uint64_t v53 = sub_100005830();
        v52(v53);
        --v29;
      }
      while (v29);
    }
    else
    {
      unint64_t v57 = v66;
    }
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v54 = v7;
    uint64_t v55 = v66;
    swift_bridgeObjectRelease();
    sub_100006B80();

    swift_willThrow();
    return ((uint64_t (*)(uint64_t, uint64_t))v21)(v19, v54);
  }
}

id DatabaseManager.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id DatabaseManager.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return [super init];
}

id DatabaseManager.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return [super dealloc];
}

uint64_t sub_100004F38@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_100006BF0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006BD0();
  uint64_t v6 = sub_100006BE0();
  uint64_t v8 = v7;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *a1 = v6;
  a1[1] = v8;
  return result;
}

unint64_t *sub_100005034(void (*a1)(void *__return_ptr, void *), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  int64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = (unint64_t *)&_swiftEmptyArrayStorage;
  if (v5)
  {
    uint64_t v19 = (unint64_t *)&_swiftEmptyArrayStorage;
    sub_100005710(0, v5, 0);
    uint64_t v6 = (unint64_t *)&_swiftEmptyArrayStorage;
    uint64_t v8 = (uint64_t *)(a3 + 40);
    while (1)
    {
      uint64_t v9 = *v8;
      v17[0] = *(v8 - 1);
      v17[1] = v9;
      swift_bridgeObjectRetain();
      a1(v18, v17);
      if (v4) {
        break;
      }
      uint64_t v4 = 0;
      swift_bridgeObjectRelease();
      unint64_t v11 = v18[0];
      unint64_t v10 = v18[1];
      uint64_t v19 = v6;
      unint64_t v13 = v6[2];
      unint64_t v12 = v6[3];
      if (v13 >= v12 >> 1)
      {
        sub_100005710((char *)(v12 > 1), v13 + 1, 1);
        uint64_t v6 = v19;
      }
      v8 += 2;
      v6[2] = v13 + 1;
      uint64_t v14 = &v6[2 * v13];
      v14[4] = v11;
      v14[5] = v10;
      if (!--v5) {
        return v6;
      }
    }
    swift_release();
    swift_bridgeObjectRelease();
  }
  return v6;
}

char *sub_10000515C(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_1000055F8(&qword_10000C440);
    unint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    unint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v12 = v10 + 32;
  if (v5)
  {
    sub_100005344((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_10000524C(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

uint64_t sub_10000524C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_100006EF0();
  __break(1u);
  return result;
}

char *sub_100005344(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_100006EF0();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

uint64_t sub_1000053D8()
{
  sub_1000055F8(&qword_10000C450);
  swift_arrayDestroy();

  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t sub_10000543C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 16 * a2 > a1 ? (BOOL v3 = a1 + 16 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    uint64_t result = sub_100006EF0();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_10000551C(uint64_t result)
{
  uint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v6 = result;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (!result || v5 > *(void *)(v3 + 24) >> 1)
  {
    if (v4 <= v5) {
      int64_t v7 = v4 + v2;
    }
    else {
      int64_t v7 = v4;
    }
    uint64_t result = (uint64_t)sub_10000515C((char *)result, v7, 1, v3);
    uint64_t v3 = result;
  }
  if (!*(void *)(v6 + 16))
  {
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
  uint64_t v8 = *(void *)(v3 + 16);
  if ((*(void *)(v3 + 24) >> 1) - v8 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t result = sub_10000543C(v6 + 32, v2, v3 + 16 * v8 + 32);
  if (!v2)
  {
LABEL_14:
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t *v1 = v3;
    return result;
  }
  uint64_t v9 = *(void *)(v3 + 16);
  BOOL v10 = __OFADD__(v9, v2);
  uint64_t v11 = v9 + v2;
  if (!v10)
  {
    *(void *)(v3 + 16) = v11;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_1000055F8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_10000563C()
{
  unint64_t result = qword_10000C408;
  if (!qword_10000C408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C408);
  }
  return result;
}

unint64_t sub_100005688()
{
  unint64_t result = qword_10000C410;
  if (!qword_10000C410)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10000C410);
  }
  return result;
}

uint64_t type metadata accessor for DiagnosticFileProvider()
{
  return self;
}

uint64_t sub_1000056F0@<X0>(uint64_t *a1@<X8>)
{
  return sub_100004F38(a1);
}

char *sub_100005710(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_100005730(a1, a2, a3, *v3);
  *uint64_t v3 = (uint64_t)result;
  return result;
}

char *sub_100005730(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_1000055F8(&qword_10000C440);
    BOOL v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    BOOL v10 = (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v12 = v10 + 32;
  unint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_100005344(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_10000543C((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

uint64_t sub_100005830()
{
  return v0;
}

Swift::Void __swiftcall DatabaseManager.checkpoint()()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100006DD0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  unint64_t v29 = (void *)((char *)v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)v27 - v7;
  uint64_t v9 = __chkstk_darwin(v6);
  size_t v11 = (char *)v27 - v10;
  uint64_t v12 = __chkstk_darwin(v9);
  v30 = (char *)v27 - v13;
  __chkstk_darwin(v12);
  v15 = (char *)v27 - v14;
  if (qword_10000C3F0 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_100006D50();
  sub_1000061B8(v16, (uint64_t)qword_10000C498);
  uint64_t v17 = sub_100006D30();
  os_log_type_t v18 = sub_100006E80();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    unsigned int v28 = v11;
    *(_WORD *)uint64_t v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "Performing checkpoint operation on Weather databases", v19, 2u);
    size_t v11 = v28;
    swift_slowDealloc();
  }

  sub_100006CB0();
  sub_100006CA0();
  sub_100005D5C((uint64_t)v15);
  unsigned int v28 = *(char **)(v3 + 8);
  ((void (*)(char *, uint64_t))v28)(v15, v2);
  sub_100006D10();
  uint64_t v20 = (uint64_t)v30;
  sub_100006D00();
  v27[1] = v1;
  sub_100005D5C(v20);
  sub_100006A78();
  v21();
  sub_100006C90();
  sub_100006C80();
  sub_100005D5C((uint64_t)v11);
  sub_100006A78();
  v22();
  sub_100006CD0();
  sub_100006CC0();
  sub_100005D5C((uint64_t)v8);
  sub_100006A78();
  v23();
  sub_100006C40();
  uint64_t v24 = sub_100006C30();
  if (v25)
  {
    uint64_t v26 = (uint64_t)v29;
    *unint64_t v29 = v24;
    *(void *)(v26 + 8) = v25;
    (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v26, enum case for Database.Location.path(_:), v2);
    sub_100005D5C(v26);
    ((void (*)(uint64_t *, uint64_t))v28)(v29, v2);
  }
}

uint64_t sub_100005D5C(uint64_t a1)
{
  uint64_t v21 = a1;
  uint64_t v1 = sub_100006D80();
  uint64_t v24 = *(void *)(v1 - 8);
  uint64_t v25 = v1;
  __chkstk_darwin(v1);
  uint64_t v23 = (char *)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_100006DF0();
  uint64_t v3 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  uint64_t v20 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100006DA0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100006DB0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100006D70();
  __chkstk_darwin(v13 - 8);
  uint64_t v14 = sub_100006DD0();
  __chkstk_darwin(v14);
  (*(void (**)(char *, uint64_t))(v16 + 16))((char *)&v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), v21);
  sub_100006D60();
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, enum case for Database.JournalingMode.wal(_:), v9);
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for Database.RecoveryMode.throw(_:), v5);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v20, enum case for Database.CacheSize.default(_:), v22);
  (*(void (**)(char *, void, uint64_t))(v24 + 104))(v23, enum case for Database.VacuumMode.none(_:), v25);
  sub_100006E00();
  swift_allocObject();
  char v27 = 0;
  uint64_t v17 = v26;
  uint64_t result = sub_100006DE0();
  if (!v17)
  {
    sub_100006D90();
    return swift_release();
  }
  return result;
}

uint64_t sub_1000061B8(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_1000061F0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000062C4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100006A1C((uint64_t)v12, *a3);
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
      sub_100006A1C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1000069CC((uint64_t)v12);
  return v7;
}

uint64_t sub_1000062C4(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_10000641C((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_100006EB0();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = (uint64_t)sub_1000064F4(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_100006ED0();
    if (!v8)
    {
      uint64_t result = sub_100006EE0();
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

void *sub_10000641C(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_100006EF0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

void *sub_1000064F4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_10000658C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100006768(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100006768((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_10000658C(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = sub_100006E40();
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
  unint64_t v3 = sub_100006700(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_100006EC0();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return v4;
  }
  sub_100006EF0();
  __break(1u);
LABEL_14:
  uint64_t result = (void *)sub_100006EE0();
  __break(1u);
  return result;
}

void *sub_100006700(uint64_t a1, uint64_t a2)
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
  sub_1000055F8(&qword_10000C480);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_100006768(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_1000055F8(&qword_10000C480);
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
    sub_100006918(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_100006840(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_100006840(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_100006EF0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_100006918(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_100006EF0();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t type metadata accessor for DatabaseManager()
{
  return self;
}

uint64_t sub_1000069CC(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100006A1C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100006A8C()
{
  uint64_t v0 = sub_100006D50();
  sub_100006B0C(v0, qword_10000C498);
  sub_1000061B8(v0, (uint64_t)qword_10000C498);
  return sub_100006D40();
}

uint64_t *sub_100006B0C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100006B70()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_100006B80()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_100006B90()
{
  return URL.init(fileURLWithPath:isDirectory:)();
}

uint64_t sub_100006BA0()
{
  return URL.init(fileURLWithPath:)();
}

uint64_t sub_100006BB0()
{
  return URL.lastPathComponent.getter();
}

void sub_100006BC0(NSURL *retstr@<X8>)
{
}

uint64_t sub_100006BD0()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t sub_100006BE0()
{
  return URL.path.getter();
}

uint64_t sub_100006BF0()
{
  return type metadata accessor for URL();
}

uint64_t sub_100006C00()
{
  return UUID.uuidString.getter();
}

uint64_t sub_100006C10()
{
  return UUID.init()();
}

uint64_t sub_100006C20()
{
  return type metadata accessor for UUID();
}

uint64_t sub_100006C30()
{
  return static AQIScaleStore.locationPath.getter();
}

uint64_t sub_100006C40()
{
  return type metadata accessor for AQIScaleStore();
}

uint64_t sub_100006C50()
{
  return AppGroup.containerURL.getter();
}

uint64_t sub_100006C60()
{
  return static AppGroup.weather.getter();
}

uint64_t sub_100006C70()
{
  return type metadata accessor for AppGroup();
}

uint64_t sub_100006C80()
{
  return static GeocodeStore.location.getter();
}

uint64_t sub_100006C90()
{
  return type metadata accessor for GeocodeStore();
}

uint64_t sub_100006CA0()
{
  return static NotificationStore.location.getter();
}

uint64_t sub_100006CB0()
{
  return type metadata accessor for NotificationStore();
}

uint64_t sub_100006CC0()
{
  return static LocationMetadataStore.location.getter();
}

uint64_t sub_100006CD0()
{
  return type metadata accessor for LocationMetadataStore();
}

uint64_t sub_100006CE0()
{
  return static WeatherStatisticsDataStore.location.getter();
}

uint64_t sub_100006CF0()
{
  return type metadata accessor for WeatherStatisticsDataStore();
}

uint64_t sub_100006D00()
{
  return static WeatherDataStore.location.getter();
}

uint64_t sub_100006D10()
{
  return type metadata accessor for WeatherDataStore();
}

uint64_t sub_100006D20()
{
  return os_log(_:dso:log:type:_:)();
}

uint64_t sub_100006D30()
{
  return Logger.logObject.getter();
}

uint64_t sub_100006D40()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100006D50()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100006D60()
{
  return static AssertionOptions.weatherAssertions.getter();
}

uint64_t sub_100006D70()
{
  return type metadata accessor for AssertionOptions();
}

uint64_t sub_100006D80()
{
  return type metadata accessor for Database.VacuumMode();
}

void sub_100006D90()
{
}

uint64_t sub_100006DA0()
{
  return type metadata accessor for Database.RecoveryMode();
}

uint64_t sub_100006DB0()
{
  return type metadata accessor for Database.JournalingMode();
}

uint64_t sub_100006DC0()
{
  return Database.Location.path.getter();
}

uint64_t sub_100006DD0()
{
  return type metadata accessor for Database.Location();
}

uint64_t sub_100006DE0()
{
  return Database.init(location:assertions:journalingMode:recoveryMode:cacheSize:vacuumMode:busyTimeout:)();
}

uint64_t sub_100006DF0()
{
  return type metadata accessor for Database.CacheSize();
}

uint64_t sub_100006E00()
{
  return type metadata accessor for Database();
}

NSString sub_100006E10()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100006E20()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100006E30()
{
  return String.init<A>(describing:)();
}

Swift::Int sub_100006E40()
{
  return String.UTF8View._foreignCount()();
}

NSArray sub_100006E50()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100006E60()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100006E70()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100006E80()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100006E90()
{
  return static OS_os_log.default.getter();
}

uint64_t sub_100006EA0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100006EB0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100006EC0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100006ED0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100006EE0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100006EF0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
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

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
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

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_attachmentWithPathURL_(void *a1, const char *a2, ...)
{
  return [a1 attachmentWithPathURL:];
}

id objc_msgSend_checkpoint(void *a1, const char *a2, ...)
{
  return _[a1 checkpoint];
}

id objc_msgSend_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return [a1 countByEnumeratingWithState:objects:count:];
}

id objc_msgSend_databaseManager(void *a1, const char *a2, ...)
{
  return _[a1 databaseManager];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_exportDirectoryAndReturnError_(void *a1, const char *a2, ...)
{
  return [a1 exportDirectoryAndReturnError:];
}

id objc_msgSend_fileProvider(void *a1, const char *a2, ...)
{
  return _[a1 fileProvider];
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return _[a1 log];
}

id objc_msgSend_setDeleteOnAttach_(void *a1, const char *a2, ...)
{
  return [a1 setDeleteOnAttach:];
}