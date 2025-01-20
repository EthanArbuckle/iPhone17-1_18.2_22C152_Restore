NSString *__cdecl sub_1000060E0(id a1, NSSortDescriptor *a2)
{
  return [(NSSortDescriptor *)a2 key];
}

void sub_100006848(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100006860(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) uuid];
  v3 = +[MTRecencyUtil upNextForPodcastUuid:v2 excludeExplicit:0 ctx:*(void *)(a1 + 40)];

  v4 = [v3 episodeUuid];
  v5 = [*(id *)(a1 + 32) nextEpisodeUuid];
  v6 = _MTLogCategoryDefault();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [*(id *)(a1 + 32) uuid];
    v8 = [v3 episodeUuid];
    [v3 modifiedDate];
    int v14 = 138543874;
    v15 = v7;
    __int16 v16 = 2114;
    v17 = v8;
    __int16 v18 = 2050;
    uint64_t v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "UpNext result from update cursor position for podcast %{public}@: episodeUuid: %{public}@ at %{public}f", (uint8_t *)&v14, 0x20u);
  }
  v10 = _MTLogCategoryDefault();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [v3 episodeUuid];
    int v14 = 138543618;
    v15 = v5;
    __int16 v16 = 2114;
    v17 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "UpNext result updating podcast nextEpisodeUuid from %{public}@ to %{public}@", (uint8_t *)&v14, 0x16u);
  }
  if (v5 != v4 && ([v5 isEqualToString:v4] & 1) == 0)
  {
    v12 = [*(id *)(a1 + 40) episodeForUuid:v4];
    v13 = [*(id *)(a1 + 40) episodeForUuid:v5];
    if ([v13 listenNowEpisode])
    {
      [v13 setListenNowEpisode:0];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
    if (v12 && ([v12 listenNowEpisode] & 1) == 0)
    {
      [v12 setListenNowEpisode:1];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      [v3 modifiedDate];
      [*(id *)(a1 + 32) setModifiedDate:];
    }
  }
  if (*(unsigned char *)(a1 + 56) && *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 40) saveInCurrentBlock];
  }
}

void sub_100006C50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100006C68(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100006C78(uint64_t a1)
{
}

void sub_100006C80(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) podcastForFeedUrl:*(void *)(a1 + 40)];
  uint64_t v2 = [v5 uuid];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_1000070B4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1000070CC(uint64_t a1)
{
  uint64_t v2 = +[NSFetchRequest fetchRequestWithEntityName:kMTEpisodeEntityName];
  uint64_t v3 = [*(id *)(a1 + 32) uuid];
  v4 = +[MTEpisode predicateForEpisodesWithSeasonNumbersOnPodcastUuid:v3];
  [v2 setPredicate:v4];

  [v2 setFetchLimit:1];
  id v5 = *(void **)(a1 + 40);
  id v8 = 0;
  v6 = [v5 executeFetchRequest:v2 error:&v8];
  id v7 = v8;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v6 count] != 0;

  [v7 logAndThrow:0];
}

void sub_100007324(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000733C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _fetchRequestForDistinctSeasons];
  uint64_t v3 = *(void **)(a1 + 40);
  id v9 = 0;
  v4 = [v3 executeFetchRequest:v2 error:&v9];
  id v5 = v9;
  [v5 logAndThrow:0];
  uint64_t v6 = [v4 valueForKey:kEpisodeSeasonNumber];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

void sub_100007544(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000755C(uint64_t a1)
{
  id v10 = [*(id *)(a1 + 32) predicateForPodcast:*(void *)(a1 + 40)];
  uint64_t v2 = +[MTEpisode predicateForEpisodeType:1];
  uint64_t v3 = +[MTEpisode predicateForSeasonNumberWithNoEpisodeNumber:*(void *)(a1 + 64)];
  v4 = [v10 AND:v2];
  id v5 = [v4 AND:v3];

  uint64_t v6 = +[MTEpisode sortDescriptorsForPubDateAscending:0];
  uint64_t v7 = [*(id *)(a1 + 48) objectsInEntity:kMTEpisodeEntityName predicate:v5 sortDescriptors:v6 returnsObjectsAsFaults:0 limit:1];
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

uint64_t sub_100007958()
{
  return 0;
}

uint64_t sub_100007960(uint64_t a1, uint64_t a2)
{
  sub_100008200(&qword_10001D308);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100015CB0;
  *(void *)(v4 + 32) = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 8))(a1, a2);
  *(void *)(v4 + 40) = v5;
  (*(void (**)(long long *__return_ptr, uint64_t, uint64_t))(a2 + 16))(&v9, a1, a2);
  if (v10)
  {
    sub_100008420(&v9, (uint64_t)v11);
    uint64_t v6 = v12;
    uint64_t v7 = v13;
    sub_100008438(v11, v12);
    *(void *)&long long v9 = sub_100007960(v6, v7);
    sub_10000847C(v4);
    uint64_t v4 = v9;
    sub_1000085D4((uint64_t)v11);
  }
  else
  {
    sub_1000083C0((uint64_t)&v9);
  }
  return v4;
}

void sub_100007A60(void *a1, int a2)
{
  uint64_t v3 = v2;
  int v53 = a2;
  uint64_t v5 = type metadata accessor for CLSContextMetadata();
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v8 = &v52[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v6);
  v54 = (id *)&v52[-v9];
  uint64_t v10 = sub_100013120();
  uint64_t v55 = *(void *)(v10 - 8);
  uint64_t v56 = v10;
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v13 = (id *)&v52[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v11);
  v15 = &v52[-v14];
  uint64_t v16 = sub_100008200((uint64_t *)&unk_10001D530);
  __chkstk_darwin(v16 - 8);
  __int16 v18 = &v52[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  id v19 = [a1 identifier];
  uint64_t v20 = sub_100013140();
  uint64_t v22 = v21;

  if (v20 == *(void *)(v3 + 8) && v22 == *(void *)(v3 + 16))
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v23 = sub_100013350();
    swift_bridgeObjectRelease();
    if ((v23 & 1) == 0)
    {
      sub_100008244();
      v41 = v13;
      sub_100013280();
      sub_100008284(v3, (uint64_t)v8);
      id v42 = a1;
      v43 = sub_100013110();
      os_log_type_t v44 = sub_100013240();
      if (os_log_type_enabled(v43, v44))
      {
        uint64_t v45 = swift_slowAlloc();
        uint64_t v58 = swift_slowAlloc();
        *(_DWORD *)uint64_t v45 = 136315394;
        v54 = v41;
        id v46 = [v42 identifier];
        uint64_t v47 = sub_100013140();
        unint64_t v49 = v48;

        id v57 = (id)sub_100009BA0(v47, v49, &v58);
        sub_1000132A0();

        swift_bridgeObjectRelease();
        *(_WORD *)(v45 + 12) = 2080;
        uint64_t v50 = *((void *)v8 + 1);
        unint64_t v51 = *((void *)v8 + 2);
        swift_bridgeObjectRetain();
        id v57 = (id)sub_100009BA0(v50, v51, &v58);
        sub_1000132A0();
        swift_bridgeObjectRelease();
        sub_1000082E8((uint64_t)v8);
        _os_log_impl((void *)&_mh_execute_header, v43, v44, "Unable to update context identifier from %s to %s", (uint8_t *)v45, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(id *, uint64_t))(v55 + 8))(v54, v56);
      }
      else
      {

        sub_1000082E8((uint64_t)v8);
        (*(void (**)(id *, uint64_t))(v55 + 8))(v13, v56);
      }
      return;
    }
  }
  if ([a1 type] == *(id *)v3)
  {
    NSString v24 = sub_100013130();
    [a1 setTitle:v24];

    [a1 setAssignable:*(unsigned __int8 *)(v3 + 40)];
    [a1 setDisplayOrder:*(void *)(v3 + 48)];
    sub_100008358(v3 + *(int *)(v5 + 36), (uint64_t)v18);
    uint64_t v25 = sub_1000130D0();
    uint64_t v26 = *(void *)(v25 - 8);
    v28 = 0;
    if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v26 + 48))(v18, 1, v25) != 1)
    {
      sub_1000130C0(v27);
      v28 = v29;
      (*(void (**)(unsigned char *, uint64_t))(v26 + 8))(v18, v25);
    }
    [a1 setUniversalLinkURL:v28];

    if (v53)
    {
      v30 = (void *)(*(uint64_t (**)(void))(v3 + *(int *)(v5 + 40)))();
      [a1 setThumbnail:v30];
    }
  }
  else
  {
    sub_100008244();
    v31 = v15;
    sub_100013280();
    v32 = v54;
    sub_100008284(v3, (uint64_t)v54);
    id v33 = a1;
    v34 = sub_100013110();
    os_log_type_t v35 = sub_100013240();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = swift_slowAlloc();
      uint64_t v58 = swift_slowAlloc();
      *(_DWORD *)uint64_t v36 = 136315394;
      id v57 = [v33 type];
      type metadata accessor for CLSContextType(0);
      uint64_t v37 = sub_100013150();
      id v57 = (id)sub_100009BA0(v37, v38, &v58);
      sub_1000132A0();

      swift_bridgeObjectRelease();
      *(_WORD *)(v36 + 12) = 2080;
      id v57 = *v32;
      uint64_t v39 = sub_100013150();
      id v57 = (id)sub_100009BA0(v39, v40, &v58);
      sub_1000132A0();
      swift_bridgeObjectRelease();
      sub_1000082E8((uint64_t)v32);
      _os_log_impl((void *)&_mh_execute_header, v34, v35, "Unable to update context type from %s to %s", (uint8_t *)v36, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      sub_1000082E8((uint64_t)v32);
    }

    (*(void (**)(unsigned char *, uint64_t))(v55 + 8))(v31, v56);
  }
}

void *sub_10000816C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_10000817C(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_100008188@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100013140();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t type metadata accessor for CLSContextMetadata()
{
  uint64_t result = qword_10001D380;
  if (!qword_10001D380) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100008200(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100008244()
{
  unint64_t result = qword_10001D520;
  if (!qword_10001D520)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10001D520);
  }
  return result;
}

uint64_t sub_100008284(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CLSContextMetadata();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000082E8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CLSContextMetadata();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void type metadata accessor for CLSContextType(uint64_t a1)
{
}

uint64_t sub_100008358(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100008200((uint64_t *)&unk_10001D530);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000083C0(uint64_t a1)
{
  uint64_t v2 = sub_100008200(&qword_10001D310);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100008420(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

void *sub_100008438(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10000847C(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  long long v3 = *v1;
  int64_t v4 = *((void *)*v1 + 2);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *((void *)v3 + 3) >> 1)
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
    int64_t v15 = v4 + v2;
  }
  else {
    int64_t v15 = v4;
  }
  long long v3 = sub_10000B68C(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  unint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = *((void *)v3 + 2);
  if ((*((void *)v3 + 3) >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v10 = (unint64_t)&v3[16 * v9 + 32];
  if (a1 + 32 < v10 + 16 * v8 && v10 < a1 + 32 + 16 * v8) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v12 = *((void *)v3 + 2);
  BOOL v13 = __OFADD__(v12, v8);
  uint64_t v14 = v12 + v8;
  if (!v13)
  {
    *((void *)v3 + 2) = v14;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_100013320();
  __break(1u);
  return result;
}

uint64_t sub_1000085D4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

__n128 sub_100008624(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100008634(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100008654(uint64_t result, int a2, int a3)
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

void *sub_100008690(uint64_t a1, uint64_t *a2, int *a3)
{
  int64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    void *v4 = *a2;
    int64_t v4 = (void *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    uint64_t v7 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v7;
    uint64_t v8 = a2[4];
    *(unsigned char *)(a1 + 40) = *((unsigned char *)a2 + 40);
    *(void *)(a1 + 48) = a2[6];
    uint64_t v9 = a3[9];
    __dst = (void *)(a1 + v9);
    unint64_t v10 = (char *)a2 + v9;
    *(void *)(a1 + 32) = v8;
    uint64_t v11 = sub_1000130D0();
    uint64_t v12 = *(void *)(v11 - 8);
    BOOL v13 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      uint64_t v14 = sub_100008200((uint64_t *)&unk_10001D530);
      memcpy(__dst, v10, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v12 + 16))(__dst, v10, v11);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(__dst, 0, 1, v11);
    }
    uint64_t v16 = a3[10];
    uint64_t v17 = a3[11];
    __int16 v18 = (void *)((char *)v4 + v16);
    id v19 = (uint64_t *)((char *)a2 + v16);
    uint64_t v20 = v19[1];
    *__int16 v18 = *v19;
    v18[1] = v20;
    *(void *)((char *)v4 + v17) = *(uint64_t *)((char *)a2 + v17);
    *(void *)((char *)v4 + a3[12]) = *(uint64_t *)((char *)a2 + a3[12]);
    swift_retain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_100008880(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 36);
  uint64_t v5 = sub_1000130D0();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_100008968(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  uint64_t v7 = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  uint64_t v8 = a3[9];
  __dst = (void *)(a1 + v8);
  uint64_t v9 = (const void *)(a2 + v8);
  *(void *)(a1 + 32) = v7;
  uint64_t v10 = sub_1000130D0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v12(v9, 1, v10))
  {
    uint64_t v13 = sub_100008200((uint64_t *)&unk_10001D530);
    memcpy(__dst, v9, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(__dst, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(__dst, 0, 1, v10);
  }
  uint64_t v14 = a3[10];
  uint64_t v15 = a3[11];
  uint64_t v16 = (void *)(a1 + v14);
  uint64_t v17 = (void *)(a2 + v14);
  uint64_t v18 = v17[1];
  *uint64_t v16 = *v17;
  v16[1] = v18;
  *(void *)(a1 + v15) = *(void *)(a2 + v15);
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_100008B08(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  uint64_t v6 = a3[9];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (void *)(a2 + v6);
  uint64_t v9 = sub_1000130D0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 24))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v14 = sub_100008200((uint64_t *)&unk_10001D530);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  uint64_t v15 = a3[10];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (void *)(a2 + v15);
  uint64_t v18 = v17[1];
  *uint64_t v16 = *v17;
  v16[1] = v18;
  swift_retain();
  swift_release();
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100008D2C(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  uint64_t v6 = a3[9];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_1000130D0();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = sub_100008200((uint64_t *)&unk_10001D530);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v12 = a3[11];
  *(_OWORD *)(a1 + a3[10]) = *(_OWORD *)(a2 + a3[10]);
  *(void *)(a1 + v12) = *(void *)(a2 + v12);
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  return a1;
}

uint64_t sub_100008E90(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  uint64_t v7 = a3[9];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = sub_1000130D0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = sub_100008200((uint64_t *)&unk_10001D530);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  *(_OWORD *)(a1 + a3[10]) = *(_OWORD *)(a2 + a3[10]);
  swift_release();
  uint64_t v16 = a3[12];
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  *(void *)(a1 + v16) = *(void *)(a2 + v16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10000907C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100009090);
}

uint64_t sub_100009090(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_100008200((uint64_t *)&unk_10001D530);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 36);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_100009144(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100009158);
}

uint64_t sub_100009158(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 16) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100008200((uint64_t *)&unk_10001D530);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 36);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_100009204()
{
  sub_1000092D0();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_1000092D0()
{
  if (!qword_10001D390)
  {
    sub_1000130D0();
    unint64_t v0 = sub_100013290();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10001D390);
    }
  }
}

void type metadata accessor for CGImage(uint64_t a1)
{
}

void sub_10000933C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

void sub_100009384(uint64_t a1, uint64_t a2)
{
  sub_100009A78(0, &qword_10001D3E8);
  sub_100008200(&qword_10001D3F0);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_100015DF0;
  sub_100013140();
  NSString v6 = sub_100013130();
  swift_bridgeObjectRelease();
  *(void *)(v5 + 56) = sub_100009A78(0, &qword_10001D3F8);
  *(void *)(v5 + 64) = sub_1000099C4(&qword_10001D400, &qword_10001D3F8);
  *(void *)(v5 + 32) = v6;
  *(void *)(v5 + 96) = sub_100009A78(0, &qword_10001D408);
  *(void *)(v5 + 104) = sub_1000099C4((unint64_t *)&qword_10001D540, &qword_10001D408);
  *(void *)(v5 + 72) = v2;
  id v7 = v2;
  uint64_t v8 = (void *)sub_100013210();
  id v9 = [self shared];
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = v8;
  v10[3] = a1;
  v10[4] = a2;
  v13[4] = sub_100009A54;
  v13[5] = v10;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256;
  v13[2] = sub_100009914;
  v13[3] = &unk_100018A68;
  uint64_t v11 = _Block_copy(v13);
  id v12 = v8;
  swift_retain();
  swift_release();
  [v9 contextsMatchingPredicate:v12 completion:v11];
  _Block_release(v11);
}

uint64_t sub_1000095C0(uint64_t a1, uint64_t a2, void *a3, uint64_t (*a4)(void))
{
  uint64_t v8 = sub_100013120();
  __chkstk_darwin();
  uint64_t v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    uint64_t v33 = v9;
    sub_100009A78(0, (unint64_t *)&qword_10001D520);
    swift_errorRetain();
    sub_100013280();
    swift_errorRetain();
    id v12 = a3;
    swift_errorRetain();
    id v13 = v12;
    int v14 = sub_100013110();
    os_log_type_t v15 = sub_100013230();
    int v16 = v15;
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v17 = swift_slowAlloc();
      uint64_t v31 = a1;
      uint64_t v18 = v17;
      id v19 = (void *)swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      uint64_t v34 = (uint64_t)v13;
      uint64_t v35 = v29;
      *(_DWORD *)uint64_t v18 = 138412546;
      v32 = a4;
      uint64_t v30 = v8;
      int v28 = v16;
      id v20 = v13;
      os_log_t v27 = v14;
      id v21 = v20;
      sub_1000132A0();
      *id v19 = v13;

      *(_WORD *)(v18 + 12) = 2080;
      uint64_t v34 = a2;
      swift_errorRetain();
      sub_100008200(&qword_10001D510);
      uint64_t v22 = sub_100013150();
      uint64_t v34 = sub_100009BA0(v22, v23, &v35);
      a4 = v32;
      sub_1000132A0();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      os_log_t v24 = v27;
      _os_log_impl((void *)&_mh_execute_header, v27, (os_log_type_t)v28, "Error loading contexts for predicate %@ - %s", (uint8_t *)v18, 0x16u);
      sub_100008200(&qword_10001D410);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      a1 = v31;
      swift_slowDealloc();

      swift_errorRelease();
      (*(void (**)(char *, uint64_t))(v33 + 8))(v11, v30);
    }
    else
    {
      swift_errorRelease();

      swift_errorRelease();
      swift_errorRelease();

      (*(void (**)(char *, uint64_t))(v33 + 8))(v11, v8);
    }
  }
  return a4(a1);
}

void sub_100009914(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void (**)(uint64_t, void *))(a1 + 32);
  sub_100009A78(0, &qword_10001D408);
  uint64_t v5 = sub_1000131F0();
  swift_retain();
  id v6 = a3;
  v4(v5, a3);
  swift_release();
  swift_bridgeObjectRelease();
}

uint64_t sub_1000099C4(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100009A78(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100009A14()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100009A54(uint64_t a1, uint64_t a2)
{
  return sub_1000095C0(a1, a2, *(void **)(v2 + 16), *(uint64_t (**)(void))(v2 + 24));
}

uint64_t sub_100009A60(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100009A70()
{
  return swift_release();
}

uint64_t sub_100009A78(uint64_t a1, unint64_t *a2)
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

uint64_t sub_100009AB4(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  unsigned char *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_100009AC4(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_100009B00(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100009B28(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_100009BA0(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_1000132A0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_100009BA0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100009C74(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000A284((uint64_t)v12, *a3);
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
      sub_10000A284((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1000085D4((uint64_t)v12);
  return v7;
}

uint64_t sub_100009C74(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1000132B0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100009E30(a5, a6);
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
  uint64_t v8 = sub_1000132E0();
  if (!v8)
  {
    sub_100013300();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100013320();
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

uint64_t sub_100009E30(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100009EC8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000A124(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000A124(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100009EC8(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10000A040(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1000132C0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100013300();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100013170();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100013320();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100013300();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10000A040(uint64_t a1, uint64_t a2)
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
  sub_100008200(&qword_10001D418);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10000A0A8(unsigned __int16 a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_1000131C0();
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
    uint64_t v5 = sub_100013190();
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_10000A124(char a1, int64_t a2, char a3, char *a4)
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
    sub_100008200(&qword_10001D418);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
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
  uint64_t result = sub_100013320();
  __break(1u);
  return result;
}

unsigned char **sub_10000A274(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  unsigned char *v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_10000A284(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_10000A370(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = sub_1000130B0();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

void sub_10000A3D4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_10000A440@<X0>(uint64_t a1@<X8>)
{
  return sub_100010360(a1);
}

uint64_t sub_10000A464(void *a1, uint64_t a2, uint64_t a3)
{
  [a1 setFetchBatchSize:10];
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  int64_t v7 = (void *)swift_allocObject();
  v7[2] = &v14;
  v7[3] = v3;
  v7[4] = a1;
  v7[5] = a2;
  v7[6] = a3;
  v7[7] = &v15;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_10000E7E0;
  *(void *)(v8 + 24) = v7;
  v13[4] = sub_10000E804;
  v13[5] = v8;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256;
  v13[2] = sub_10000B5A0;
  v13[3] = &unk_100018B80;
  int64_t v9 = _Block_copy(v13);
  id v10 = v3;
  id v11 = a1;
  swift_retain();
  swift_retain();
  swift_release();
  [v10 performBlockAndWait:v9];
  _Block_release(v9);
  LOBYTE(v10) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v10)
  {
    __break(1u);
  }
  else
  {
    if (v15)
    {
      swift_errorRetain();
      swift_willThrow();
      swift_bridgeObjectRelease();
      swift_errorRelease();
    }
    else
    {
      a3 = v14;
    }
    swift_release();
    return a3;
  }
  return result;
}

uint64_t sub_10000A644(void *a1, uint64_t a2, uint64_t a3)
{
  [a1 setFetchBatchSize:10];
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  int64_t v7 = (void *)swift_allocObject();
  v7[2] = &v14;
  v7[3] = v3;
  v7[4] = a1;
  v7[5] = a2;
  v7[6] = a3;
  v7[7] = &v15;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_10000F0C8;
  *(void *)(v8 + 24) = v7;
  v13[4] = sub_10000F274;
  v13[5] = v8;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256;
  v13[2] = sub_10000B5A0;
  v13[3] = &unk_100018C98;
  int64_t v9 = _Block_copy(v13);
  id v10 = v3;
  id v11 = a1;
  swift_retain();
  swift_retain();
  swift_release();
  [v10 performBlockAndWait:v9];
  _Block_release(v9);
  LOBYTE(v10) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v10)
  {
    __break(1u);
  }
  else
  {
    if (v15)
    {
      swift_errorRetain();
      swift_willThrow();
      swift_bridgeObjectRelease();
      swift_errorRelease();
    }
    else
    {
      a3 = v14;
    }
    swift_release();
    return a3;
  }
  return result;
}

uint64_t sub_10000A824(void *a1, uint64_t a2, uint64_t a3)
{
  [a1 setFetchBatchSize:10];
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  int64_t v7 = (void *)swift_allocObject();
  v7[2] = &v14;
  v7[3] = v3;
  v7[4] = a1;
  v7[5] = a2;
  v7[6] = a3;
  v7[7] = &v15;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_10000EAF8;
  *(void *)(v8 + 24) = v7;
  v13[4] = sub_10000F274;
  v13[5] = v8;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256;
  v13[2] = sub_10000B5A0;
  v13[3] = &unk_100018C20;
  int64_t v9 = _Block_copy(v13);
  id v10 = v3;
  id v11 = a1;
  swift_retain();
  swift_retain();
  swift_release();
  [v10 performBlockAndWait:v9];
  _Block_release(v9);
  LOBYTE(v10) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v10)
  {
    __break(1u);
  }
  else
  {
    if (v15)
    {
      swift_errorRetain();
      swift_willThrow();
      swift_bridgeObjectRelease();
      swift_errorRelease();
    }
    else
    {
      a3 = v14;
    }
    swift_release();
    return a3;
  }
  return result;
}

void sub_10000AA04(void *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = [a1 uuid];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = sub_100013140();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  *a2 = v5;
  a2[1] = v7;
}

uint64_t sub_10000AA68@<X0>(uint64_t a1@<X8>)
{
  return sub_10000F29C(a1);
}

uint64_t sub_10000AA8C(unint64_t a1, unint64_t a2, void *a3)
{
  id v44 = a3;
  uint64_t v5 = sub_100008200((uint64_t *)&unk_10001D530);
  uint64_t result = __chkstk_darwin(v5 - 8);
  uint64_t v45 = (uint64_t)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = *(void *)(a2 + 16);
  if (v49)
  {
    if (a1 >> 62)
    {
LABEL_28:
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v52 = sub_100013310();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v52 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
    }
    uint64_t v8 = type metadata accessor for CLSContextMetadata();
    uint64_t v9 = 0;
    unint64_t v42 = a2;
    uint64_t v43 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    unint64_t v48 = a2 + ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80));
    unint64_t v51 = a1 & 0xC000000000000001;
    uint64_t v47 = *(void *)(v10 + 72);
    long long v46 = xmmword_100015CB0;
    do
    {
      uint64_t v14 = (uint64_t *)(v48 + v47 * v9);
      if (v52)
      {
        uint64_t v50 = v9;
        uint64_t v16 = v14[1];
        uint64_t v15 = v14[2];
        unint64_t v17 = a1;
        swift_bridgeObjectRetain();
        a1 = 4;
        while (1)
        {
          id v18 = v51 ? (id)sub_1000132D0() : *(id *)(v17 + 8 * a1);
          id v19 = v18;
          a2 = a1 - 3;
          if (__OFADD__(a1 - 4, 1)) {
            break;
          }
          id v20 = [v18 identifier:v42];
          uint64_t v21 = sub_100013140();
          uint64_t v23 = v22;

          if (v21 == v16 && v23 == v15)
          {
            a1 = v17;
            swift_bridgeObjectRelease();
LABEL_24:
            swift_bridgeObjectRelease();
            sub_100007A60(v19, 0);
            sub_100013220();
            sub_100008200(&qword_10001D3F0);
            uint64_t v40 = swift_allocObject();
            *(_OWORD *)(v40 + 16) = v46;
            *(void *)(v40 + 56) = sub_100009A78(0, &qword_10001D408);
            *(void *)(v40 + 64) = sub_10000E720();
            *(void *)(v40 + 32) = v19;
            sub_100009A78(0, (unint64_t *)&qword_10001D520);
            id v41 = v19;
            id v12 = (id)sub_100013270();
            sub_100013100();

            swift_bridgeObjectRelease();
            uint64_t v9 = v50;
            goto LABEL_6;
          }
          char v25 = sub_100013350();
          swift_bridgeObjectRelease();
          if (v25)
          {
            a1 = v17;
            goto LABEL_24;
          }

          ++a1;
          if (a2 == v52)
          {
            a1 = v17;
            swift_bridgeObjectRelease();
            uint64_t v9 = v50;
            goto LABEL_20;
          }
        }
        __break(1u);
        goto LABEL_28;
      }
LABEL_20:
      uint64_t v26 = *v14;
      id v27 = objc_allocWithZone((Class)CLSContext);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      NSString v28 = sub_100013130();
      swift_bridgeObjectRelease();
      NSString v29 = sub_100013130();
      swift_bridgeObjectRelease();
      id v30 = [v27 initWithType:v26 identifier:v28 title:v29];

      [v30 setAssignable:*((unsigned __int8 *)v14 + 40)];
      [v30 setDisplayOrder:v14[6]];
      uint64_t v31 = (uint64_t)v14 + *(int *)(v43 + 36);
      uint64_t v32 = v45;
      sub_100008358(v31, v45);
      uint64_t v33 = sub_1000130D0();
      uint64_t v34 = *(void *)(v33 - 8);
      int v35 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v34 + 48))(v32, 1, v33);
      uint64_t v37 = 0;
      if (v35 != 1)
      {
        uint64_t v38 = v45;
        sub_1000130C0(v36);
        uint64_t v37 = v39;
        (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v38, v33);
      }
      [v30 setUniversalLinkURL:v37, v42];

      sub_100013220();
      sub_100008200(&qword_10001D3F0);
      uint64_t v11 = swift_allocObject();
      *(_OWORD *)(v11 + 16) = v46;
      *(void *)(v11 + 56) = sub_100009A78(0, &qword_10001D408);
      *(void *)(v11 + 64) = sub_10000E720();
      *(void *)(v11 + 32) = v30;
      sub_100009A78(0, (unint64_t *)&qword_10001D520);
      id v12 = v30;
      unint64_t v13 = (void *)sub_100013270();
      sub_100013100();
      swift_bridgeObjectRelease();

      [v44 addChildContext:v12];
LABEL_6:

      ++v9;
    }
    while (v9 != v49);
    return swift_bridgeObjectRelease();
  }
  return result;
}

Swift::Int sub_10000B01C(unint64_t *a1)
{
  uint64_t v2 = *(void *)(type metadata accessor for CLSContextMetadata() - 8);
  unint64_t v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v3 = sub_10000D7C0(v3);
  }
  uint64_t v4 = *(void *)(v3 + 16);
  v6[0] = v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  Swift::Int result = sub_10000BB28(v6);
  *a1 = v3;
  return result;
}

void *sub_10000B0C8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CLSContextMetadata();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100008200(&qword_10001D578);
  uint64_t v7 = __chkstk_darwin(v6);
  id v30 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (uint64_t *)((char *)&v26 - v10);
  __chkstk_darwin(v9);
  unint64_t v13 = (uint64_t *)((char *)&v26 - v12);
  uint64_t v31 = _swiftEmptyArrayStorage;
  sub_10000D560(0, 0, 0);
  uint64_t v14 = v31;
  uint64_t v15 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  uint64_t v29 = v15;
  uint64_t v26 = a1;
  if (v15)
  {
    uint64_t v16 = 0;
    unint64_t v17 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
    uint64_t v27 = *(void *)(v3 + 72);
    unint64_t v28 = v17;
    uint64_t v18 = a1 + v17;
    do
    {
      uint64_t v19 = (uint64_t)&v30[*(int *)(v6 + 48)];
      sub_100008284(v18, v19);
      uint64_t v20 = (uint64_t)v11 + *(int *)(v6 + 48);
      void *v11 = v16;
      sub_10000E988(v19, v20);
      sub_10000EA30((uint64_t)v11, (uint64_t)v13);
      uint64_t v21 = *v13;
      sub_100008284((uint64_t)v13 + *(int *)(v6 + 48), (uint64_t)v5);
      *((void *)v5 + 6) = v21;
      sub_10000EA98((uint64_t)v13, &qword_10001D578);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_10000D560(0, v14[2] + 1, 1);
        uint64_t v14 = v31;
      }
      unint64_t v23 = v14[2];
      unint64_t v22 = v14[3];
      if (v23 >= v22 >> 1)
      {
        sub_10000D560(v22 > 1, v23 + 1, 1);
        uint64_t v14 = v31;
      }
      ++v16;
      v14[2] = v23 + 1;
      uint64_t v24 = v27;
      sub_10000E988((uint64_t)v5, (uint64_t)v14 + v28 + v23 * v27);
      v18 += v24;
    }
    while (v29 != v16);
  }
  swift_bridgeObjectRelease();
  return v14;
}

id sub_10000B3A8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ContextRequestHandler();
  return [super dealloc];
}

uint64_t type metadata accessor for ContextRequestHandler()
{
  return self;
}

id sub_10000B400(char **a1, void *a2, uint64_t a3, void (*a4)(uint64_t *__return_ptr, id))
{
  sub_100009A78(0, &qword_10001D550);
  unint64_t v7 = sub_100013250();
  uint64_t v8 = sub_10000EB48(v7, a4);
  swift_bridgeObjectRelease();
  *a1 = v8;
  swift_bridgeObjectRelease();

  return [a2 reset];
}

id sub_10000B4D4(void *a1, void *a2, uint64_t a3, void (*a4)(id), uint64_t a5, uint64_t a6, unint64_t *a7)
{
  sub_100009A78(0, a7);
  unint64_t v10 = sub_100013250();
  uint64_t v11 = sub_10000ED18(v10, a4);
  swift_bridgeObjectRelease();
  *a1 = v11;
  swift_bridgeObjectRelease();

  return [a2 reset];
}

uint64_t sub_10000B5A0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_10000B5C8()
{
  return 1;
}

Swift::Int sub_10000B5D0()
{
  return sub_1000133C0();
}

void sub_10000B614()
{
}

Swift::Int sub_10000B63C()
{
  return sub_1000133C0();
}

char *sub_10000B68C(char *result, int64_t a2, char a3, char *a4)
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
      sub_100008200(&qword_10001D308);
      unint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      unint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      unint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      unint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[16 * v8 + 32]) {
          memmove(v13, a4 + 32, 16 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_10000D808(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000B79C(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_10000B7C0(a1, a2, a3, a4, &qword_10001D570, (uint64_t (*)(void))&type metadata accessor for URLQueryItem, (uint64_t (*)(void))&type metadata accessor for URLQueryItem);
}

uint64_t sub_10000B7C0(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void))
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
    uint64_t v18 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100008200(a5);
  uint64_t v15 = *(void *)(a6(0) - 8);
  uint64_t v16 = *(void *)(v15 + 72);
  unint64_t v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v18 = (void *)swift_allocObject();
  size_t v19 = j__malloc_size(v18);
  if (!v16 || (v19 - v17 == 0x8000000000000000 ? (BOOL v20 = v16 == -1) : (BOOL v20 = 0), v20))
  {
LABEL_29:
    uint64_t result = sub_100013300();
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
    sub_10000E82C(0, v13, v23, a4, a7);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v18;
}

unsigned __int8 *sub_10000BA40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_1000131D0();
  unint64_t v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v8 = HIBYTE(v6) & 0xF;
    uint64_t v13 = v5;
    uint64_t v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    uint64_t v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  uint64_t v5 = sub_10000D074();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t v6 = v10;
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    uint64_t v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v7 = (unsigned __int8 *)sub_1000132E0();
  }
LABEL_7:
  unint64_t v11 = sub_10000CDF8(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

Swift::Int sub_10000BB28(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v137 = type metadata accessor for CLSContextMetadata();
  uint64_t v132 = *(void *)(v137 - 8);
  uint64_t v4 = __chkstk_darwin(v137);
  uint64_t v129 = (uint64_t)&v123 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v138 = (uint64_t)&v123 - v7;
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v135 = (uint64_t)&v123 - v9;
  __chkstk_darwin(v8);
  uint64_t v134 = (uint64_t)&v123 - v10;
  Swift::Int v11 = a1[1];
  Swift::Int result = sub_100013330(v11);
  if (result >= v11)
  {
    if (v11 < 0) {
      goto LABEL_138;
    }
    if (v11) {
      return sub_10000C4E4(0, v11, 1, a1);
    }
    return result;
  }
  if (v11 >= 0) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v11 + 1;
  }
  if (v11 < -1) {
    goto LABEL_146;
  }
  Swift::Int v125 = result;
  if (v11 < 2)
  {
    unint64_t v17 = (char *)&_swiftEmptyArrayStorage;
    unint64_t v131 = (unint64_t)&_swiftEmptyArrayStorage
         + ((*(unsigned __int8 *)(v132 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v132 + 80));
    v124 = &_swiftEmptyArrayStorage;
    if (v11 != 1)
    {
      unint64_t v19 = *((void *)&_swiftEmptyArrayStorage + 2);
LABEL_104:
      if (v19 >= 2)
      {
        uint64_t v116 = *a1;
        do
        {
          unint64_t v117 = v19 - 2;
          if (v19 < 2) {
            goto LABEL_133;
          }
          if (!v116) {
            goto LABEL_145;
          }
          v118 = v17;
          uint64_t v119 = *(void *)&v17[16 * v117 + 32];
          uint64_t v120 = *(void *)&v17[16 * v19 + 24];
          sub_10000C740(v116 + *(void *)(v132 + 72) * v119, v116 + *(void *)(v132 + 72) * *(void *)&v17[16 * v19 + 16], v116 + *(void *)(v132 + 72) * v120, v131);
          if (v2) {
            break;
          }
          if (v120 < v119) {
            goto LABEL_134;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v118 = sub_10000CDE4((uint64_t)v17);
          }
          if (v117 >= *((void *)v118 + 2)) {
            goto LABEL_135;
          }
          v121 = &v118[16 * v117 + 32];
          *(void *)v121 = v119;
          *((void *)v121 + 1) = v120;
          unint64_t v122 = *((void *)v118 + 2);
          if (v19 > v122) {
            goto LABEL_136;
          }
          memmove(&v118[16 * v19 + 16], &v118[16 * v19 + 32], 16 * (v122 - v19));
          *((void *)v118 + 2) = v122 - 1;
          unint64_t v19 = v122 - 1;
          unint64_t v17 = v118;
        }
        while (v122 > 2);
      }
LABEL_115:
      swift_bridgeObjectRelease();
      v124[2] = 0;
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v14 = v13 >> 1;
    uint64_t v15 = sub_100013200();
    *(void *)(v15 + 16) = v14;
    uint64_t v16 = *(unsigned __int8 *)(v132 + 80);
    v124 = (void *)v15;
    unint64_t v131 = v15 + ((v16 + 32) & ~v16);
  }
  uint64_t v18 = 0;
  unint64_t v17 = (char *)&_swiftEmptyArrayStorage;
  v136 = a1;
  while (1)
  {
    uint64_t v20 = v18;
    uint64_t v21 = v18 + 1;
    if (v18 + 1 >= v11)
    {
      Swift::Int v31 = v18 + 1;
    }
    else
    {
      uint64_t v22 = *a1;
      uint64_t v23 = *(void *)(v132 + 72);
      uint64_t v24 = *a1 + v23 * v21;
      uint64_t v130 = v18;
      uint64_t v25 = v134;
      sub_100008284(v24, v134);
      uint64_t v26 = v135;
      sub_100008284(v22 + v23 * v130, v135);
      uint64_t v27 = *(int *)(v137 + 44);
      double v28 = *(double *)(v25 + v27);
      double v29 = *(double *)(v26 + v27);
      sub_1000082E8(v26);
      uint64_t v30 = v25;
      uint64_t v20 = v130;
      sub_1000082E8(v30);
      Swift::Int v31 = v20 + 2;
      uint64_t v133 = v22;
      uint64_t v139 = v23;
      if (v20 + 2 < v11)
      {
        uint64_t v128 = v2;
        v126 = v17;
        uint64_t v32 = v23 * v21;
        uint64_t v33 = v22;
        Swift::Int v34 = v20 + 2;
        uint64_t v35 = v23 * (v20 + 2);
        while (1)
        {
          Swift::Int v36 = v11;
          uint64_t v37 = v134;
          sub_100008284(v33 + v35, v134);
          uint64_t v38 = v135;
          sub_100008284(v33 + v32, v135);
          BOOL v39 = *(double *)(v37 + *(int *)(v137 + 44)) >= *(double *)(v38 + *(int *)(v137 + 44));
          sub_1000082E8(v38);
          sub_1000082E8(v37);
          if (v28 < v29 == v39) {
            break;
          }
          v33 += v139;
          ++v34;
          Swift::Int v11 = v36;
          if (v36 == v34)
          {
            Swift::Int v31 = v36;
            a1 = v136;
            unint64_t v17 = v126;
            uint64_t v20 = v130;
            goto LABEL_23;
          }
        }
        a1 = v136;
        unint64_t v17 = v126;
        Swift::Int v31 = v34;
        uint64_t v20 = v130;
        Swift::Int v11 = v36;
LABEL_23:
        uint64_t v2 = v128;
      }
      if (v28 < v29)
      {
        if (v31 < v20) {
          goto LABEL_139;
        }
        if (v20 < v31)
        {
          v126 = v17;
          Swift::Int v127 = v11;
          uint64_t v40 = 0;
          uint64_t v41 = v139;
          uint64_t v42 = v139 * (v31 - 1);
          uint64_t v43 = v31 * v139;
          uint64_t v44 = v20;
          uint64_t v45 = v20 * v139;
          do
          {
            if (v44 != v31 + v40 - 1)
            {
              uint64_t v128 = v2;
              uint64_t v46 = v133;
              if (!v133) {
                goto LABEL_144;
              }
              unint64_t v47 = v133 + v45;
              sub_10000E988(v133 + v45, v129);
              if (v45 < v42 || v47 >= v46 + v43)
              {
                swift_arrayInitWithTakeFrontToBack();
              }
              else if (v45 != v42)
              {
                swift_arrayInitWithTakeBackToFront();
              }
              sub_10000E988(v129, v46 + v42);
              a1 = v136;
              uint64_t v2 = v128;
              uint64_t v41 = v139;
            }
            ++v44;
            --v40;
            v42 -= v41;
            v43 -= v41;
            v45 += v41;
          }
          while (v44 < v31 + v40);
          unint64_t v17 = v126;
          Swift::Int v11 = v127;
          uint64_t v20 = v130;
        }
      }
    }
    if (v31 < v11)
    {
      if (__OFSUB__(v31, v20)) {
        goto LABEL_137;
      }
      if (v31 - v20 < v125) {
        break;
      }
    }
LABEL_56:
    if (v31 < v20) {
      goto LABEL_132;
    }
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v139 = v31;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      unint64_t v17 = sub_10000CBA8(0, *((void *)v17 + 2) + 1, 1, v17);
    }
    unint64_t v65 = *((void *)v17 + 2);
    unint64_t v64 = *((void *)v17 + 3);
    unint64_t v19 = v65 + 1;
    if (v65 >= v64 >> 1) {
      unint64_t v17 = sub_10000CBA8((char *)(v64 > 1), v65 + 1, 1, v17);
    }
    *((void *)v17 + 2) = v19;
    v66 = v17 + 32;
    v67 = &v17[16 * v65 + 32];
    uint64_t v68 = v139;
    *(void *)v67 = v20;
    *((void *)v67 + 1) = v68;
    if (v65)
    {
      while (1)
      {
        unint64_t v69 = v19 - 1;
        if (v19 >= 4)
        {
          v74 = &v66[16 * v19];
          uint64_t v75 = *((void *)v74 - 8);
          uint64_t v76 = *((void *)v74 - 7);
          BOOL v80 = __OFSUB__(v76, v75);
          uint64_t v77 = v76 - v75;
          if (v80) {
            goto LABEL_121;
          }
          uint64_t v79 = *((void *)v74 - 6);
          uint64_t v78 = *((void *)v74 - 5);
          BOOL v80 = __OFSUB__(v78, v79);
          uint64_t v72 = v78 - v79;
          char v73 = v80;
          if (v80) {
            goto LABEL_122;
          }
          unint64_t v81 = v19 - 2;
          v82 = &v66[16 * v19 - 32];
          uint64_t v84 = *(void *)v82;
          uint64_t v83 = *((void *)v82 + 1);
          BOOL v80 = __OFSUB__(v83, v84);
          uint64_t v85 = v83 - v84;
          if (v80) {
            goto LABEL_124;
          }
          BOOL v80 = __OFADD__(v72, v85);
          uint64_t v86 = v72 + v85;
          if (v80) {
            goto LABEL_127;
          }
          if (v86 >= v77)
          {
            v104 = &v66[16 * v69];
            uint64_t v106 = *(void *)v104;
            uint64_t v105 = *((void *)v104 + 1);
            BOOL v80 = __OFSUB__(v105, v106);
            uint64_t v107 = v105 - v106;
            if (v80) {
              goto LABEL_131;
            }
            BOOL v97 = v72 < v107;
            goto LABEL_93;
          }
        }
        else
        {
          if (v19 != 3)
          {
            uint64_t v98 = *((void *)v17 + 4);
            uint64_t v99 = *((void *)v17 + 5);
            BOOL v80 = __OFSUB__(v99, v98);
            uint64_t v91 = v99 - v98;
            char v92 = v80;
            goto LABEL_87;
          }
          uint64_t v71 = *((void *)v17 + 4);
          uint64_t v70 = *((void *)v17 + 5);
          BOOL v80 = __OFSUB__(v70, v71);
          uint64_t v72 = v70 - v71;
          char v73 = v80;
        }
        if (v73) {
          goto LABEL_123;
        }
        unint64_t v81 = v19 - 2;
        v87 = &v66[16 * v19 - 32];
        uint64_t v89 = *(void *)v87;
        uint64_t v88 = *((void *)v87 + 1);
        BOOL v90 = __OFSUB__(v88, v89);
        uint64_t v91 = v88 - v89;
        char v92 = v90;
        if (v90) {
          goto LABEL_126;
        }
        v93 = &v66[16 * v69];
        uint64_t v95 = *(void *)v93;
        uint64_t v94 = *((void *)v93 + 1);
        BOOL v80 = __OFSUB__(v94, v95);
        uint64_t v96 = v94 - v95;
        if (v80) {
          goto LABEL_129;
        }
        if (__OFADD__(v91, v96)) {
          goto LABEL_130;
        }
        if (v91 + v96 >= v72)
        {
          BOOL v97 = v72 < v96;
LABEL_93:
          if (v97) {
            unint64_t v69 = v81;
          }
          goto LABEL_95;
        }
LABEL_87:
        if (v92) {
          goto LABEL_125;
        }
        v100 = &v66[16 * v69];
        uint64_t v102 = *(void *)v100;
        uint64_t v101 = *((void *)v100 + 1);
        BOOL v80 = __OFSUB__(v101, v102);
        uint64_t v103 = v101 - v102;
        if (v80) {
          goto LABEL_128;
        }
        if (v103 < v91) {
          goto LABEL_14;
        }
LABEL_95:
        unint64_t v108 = v69 - 1;
        if (v69 - 1 >= v19)
        {
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
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
          goto LABEL_141;
        }
        uint64_t v109 = *a1;
        if (!*a1) {
          goto LABEL_143;
        }
        v110 = v17;
        v111 = &v66[16 * v108];
        uint64_t v112 = *(void *)v111;
        v113 = &v66[16 * v69];
        uint64_t v114 = *((void *)v113 + 1);
        sub_10000C740(v109 + *(void *)(v132 + 72) * *(void *)v111, v109 + *(void *)(v132 + 72) * *(void *)v113, v109 + *(void *)(v132 + 72) * v114, v131);
        if (v2) {
          goto LABEL_115;
        }
        if (v114 < v112) {
          goto LABEL_118;
        }
        if (v69 > *((void *)v110 + 2)) {
          goto LABEL_119;
        }
        *(void *)v111 = v112;
        *(void *)&v66[16 * v108 + 8] = v114;
        unint64_t v115 = *((void *)v110 + 2);
        if (v69 >= v115) {
          goto LABEL_120;
        }
        unint64_t v17 = v110;
        unint64_t v19 = v115 - 1;
        memmove(&v66[16 * v69], v113 + 16, 16 * (v115 - 1 - v69));
        *((void *)v110 + 2) = v115 - 1;
        a1 = v136;
        if (v115 <= 2) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v19 = 1;
LABEL_14:
    Swift::Int v11 = a1[1];
    uint64_t v18 = v139;
    if (v139 >= v11) {
      goto LABEL_104;
    }
  }
  if (__OFADD__(v20, v125)) {
    goto LABEL_140;
  }
  if (v20 + v125 >= v11) {
    Swift::Int v48 = v11;
  }
  else {
    Swift::Int v48 = v20 + v125;
  }
  if (v48 >= v20)
  {
    if (v31 != v48)
    {
      uint64_t v130 = v20;
      v126 = v17;
      Swift::Int v127 = v48;
      uint64_t v128 = v2;
      uint64_t v49 = *(void *)(v132 + 72);
      uint64_t v139 = v49 * (v31 - 1);
      uint64_t v133 = v49;
      Swift::Int v50 = v31 * v49;
      do
      {
        uint64_t v51 = 0;
        uint64_t v52 = v130;
        while (1)
        {
          Swift::Int v53 = v31;
          uint64_t v54 = *a1;
          uint64_t v55 = v134;
          sub_100008284(v50 + v51 + *a1, v134);
          uint64_t v56 = v139 + v51 + v54;
          uint64_t v57 = v135;
          sub_100008284(v56, v135);
          uint64_t v58 = *(int *)(v137 + 44);
          double v59 = *(double *)(v55 + v58);
          double v60 = *(double *)(v57 + v58);
          sub_1000082E8(v57);
          sub_1000082E8(v55);
          if (v59 >= v60) {
            break;
          }
          uint64_t v61 = *a1;
          if (!*a1) {
            goto LABEL_142;
          }
          uint64_t v62 = v61 + v139 + v51;
          sub_10000E988(v61 + v50 + v51, v138);
          swift_arrayInitWithTakeFrontToBack();
          sub_10000E988(v138, v62);
          v51 -= v133;
          ++v52;
          Swift::Int v31 = v53;
          a1 = v136;
          if (v53 == v52) {
            goto LABEL_49;
          }
        }
        Swift::Int v31 = v53;
LABEL_49:
        ++v31;
        v139 += v133;
        v50 += v133;
      }
      while (v31 != v127);
      Swift::Int v31 = v127;
      uint64_t v2 = v128;
      unint64_t v17 = v126;
      uint64_t v20 = v130;
    }
    goto LABEL_56;
  }
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
  Swift::Int result = sub_100013300();
  __break(1u);
  return result;
}

uint64_t sub_10000C4E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v27 = a1;
  uint64_t v30 = type metadata accessor for CLSContextMetadata();
  uint64_t v7 = __chkstk_darwin(v30);
  uint64_t v31 = (uint64_t)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v7);
  Swift::Int v11 = (char *)&v25 - v10;
  uint64_t result = __chkstk_darwin(v9);
  uint64_t v15 = (char *)&v25 - v14;
  uint64_t v29 = a3;
  uint64_t v26 = a2;
  if (a3 != a2)
  {
    uint64_t v16 = *(void *)(v13 + 72);
    uint64_t v33 = v16 * (v29 - 1);
    uint64_t v28 = v16;
    uint64_t v32 = v16 * v29;
LABEL_5:
    uint64_t v17 = 0;
    uint64_t v18 = v27;
    while (1)
    {
      uint64_t v19 = *a4;
      sub_100008284(v32 + v17 + *a4, (uint64_t)v15);
      sub_100008284(v33 + v17 + v19, (uint64_t)v11);
      uint64_t v20 = *(int *)(v30 + 44);
      double v21 = *(double *)&v15[v20];
      double v22 = *(double *)&v11[v20];
      sub_1000082E8((uint64_t)v11);
      uint64_t result = sub_1000082E8((uint64_t)v15);
      if (v21 >= v22)
      {
LABEL_4:
        v33 += v28;
        v32 += v28;
        if (++v29 == v26) {
          return result;
        }
        goto LABEL_5;
      }
      uint64_t v23 = *a4;
      if (!*a4) {
        break;
      }
      uint64_t v24 = v23 + v33 + v17;
      sub_10000E988(v23 + v32 + v17, v31);
      swift_arrayInitWithTakeFrontToBack();
      uint64_t result = sub_10000E988(v31, v24);
      v17 -= v28;
      if (v29 == ++v18) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_10000C740(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v8 = type metadata accessor for CLSContextMetadata();
  uint64_t v9 = __chkstk_darwin(v8);
  Swift::Int v11 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v43 - v12;
  uint64_t v15 = *(void *)(v14 + 72);
  if (!v15)
  {
    __break(1u);
LABEL_70:
    __break(1u);
LABEL_71:
    __break(1u);
    goto LABEL_72;
  }
  unint64_t v16 = a1;
  if (a2 - a1 == 0x8000000000000000 && v15 == -1) {
    goto LABEL_70;
  }
  int64_t v17 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v15 == -1) {
    goto LABEL_71;
  }
  uint64_t v18 = (uint64_t)(a2 - a1) / v15;
  unint64_t v47 = a1;
  unint64_t v46 = a4;
  uint64_t v19 = v17 / v15;
  if (v18 >= v17 / v15)
  {
    if ((v19 & 0x8000000000000000) == 0)
    {
      unint64_t v44 = a1;
      uint64_t v21 = v19 * v15;
      if (a4 < a2 || a2 + v21 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (a4 != a2)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      unint64_t v32 = a4 + v21;
      unint64_t v45 = a4 + v21;
      unint64_t v47 = a2;
      if (v21 >= 1 && v44 < a2)
      {
        uint64_t v34 = -v15;
        do
        {
          unint64_t v35 = a3 + v34;
          sub_100008284(v32 + v34, (uint64_t)v13);
          unint64_t v36 = a2 + v34;
          sub_100008284(a2 + v34, (uint64_t)v11);
          uint64_t v37 = *(int *)(v8 + 44);
          double v38 = *(double *)&v13[v37];
          double v39 = *(double *)&v11[v37];
          sub_1000082E8((uint64_t)v11);
          sub_1000082E8((uint64_t)v13);
          if (v38 >= v39)
          {
            unint64_t v40 = v45;
            v45 += v34;
            if (a3 < v40 || v35 >= v40)
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (a3 != v40)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            unint64_t v36 = a2;
          }
          else
          {
            if (a3 < a2 || v35 >= a2)
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (a3 != a2)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            v47 += v34;
          }
          unint64_t v32 = v45;
          if (v45 <= a4) {
            break;
          }
          a2 = v36;
          a3 += v34;
        }
        while (v36 > v44);
      }
      goto LABEL_68;
    }
  }
  else if ((v18 & 0x8000000000000000) == 0)
  {
    uint64_t v20 = v18 * v15;
    if (a4 < v16 || v16 + v20 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != v16)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    unint64_t v22 = a4 + v20;
    unint64_t v45 = a4 + v20;
    if (v20 >= 1 && a2 < a3)
    {
      do
      {
        sub_100008284(a2, (uint64_t)v13);
        sub_100008284(a4, (uint64_t)v11);
        uint64_t v24 = *(int *)(v8 + 44);
        double v25 = *(double *)&v13[v24];
        double v26 = *(double *)&v11[v24];
        sub_1000082E8((uint64_t)v11);
        sub_1000082E8((uint64_t)v13);
        unint64_t v27 = v47;
        if (v25 >= v26)
        {
          unint64_t v30 = v46 + v15;
          if (v47 < v46 || v47 >= v30)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v47 != v46)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          unint64_t v46 = v30;
          unint64_t v28 = a2;
        }
        else
        {
          unint64_t v28 = a2 + v15;
          if (v47 < a2 || v47 >= v28)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v47 == a2)
          {
            unint64_t v27 = a2;
          }
          else
          {
            swift_arrayInitWithTakeBackToFront();
          }
        }
        unint64_t v47 = v27 + v15;
        a4 = v46;
        if (v46 >= v22) {
          break;
        }
        a2 = v28;
      }
      while (v28 < a3);
    }
LABEL_68:
    sub_10000CCA4(&v47, &v46, (uint64_t *)&v45);
    return 1;
  }
LABEL_72:
  uint64_t result = sub_100013320();
  __break(1u);
  return result;
}

char *sub_10000CBA8(char *result, int64_t a2, char a3, char *a4)
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
    sub_100008200(&qword_10001D580);
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
  uint64_t v14 = a4 + 32;
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

uint64_t sub_10000CCA4(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  uint64_t v5 = *a3;
  uint64_t result = type metadata accessor for CLSContextMetadata();
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
    uint64_t result = sub_100013320();
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

char *sub_10000CDE4(uint64_t a1)
{
  return sub_10000CBA8(0, *(void *)(a1 + 16), 0, (char *)a1);
}

unsigned __int8 *sub_10000CDF8(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        uint64_t v5 = a2 - 1;
        if (a2 != 1)
        {
          unsigned __int8 v6 = a3 + 48;
          unsigned __int8 v7 = a3 + 55;
          unsigned __int8 v8 = a3 + 87;
          if (a3 > 10)
          {
            unsigned __int8 v6 = 58;
          }
          else
          {
            unsigned __int8 v8 = 97;
            unsigned __int8 v7 = 65;
          }
          if (result)
          {
            uint64_t v9 = 0;
            for (i = result + 1; ; ++i)
            {
              unsigned int v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8) {
                    return 0;
                  }
                  char v12 = -87;
                }
                else
                {
                  char v12 = -55;
                }
              }
              else
              {
                char v12 = -48;
              }
              uint64_t v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
                return 0;
              }
              uint64_t v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12))) {
                return 0;
              }
              if (!--v5) {
                return (unsigned __int8 *)v9;
              }
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_65;
    }
    if (a2)
    {
      unsigned __int8 v22 = a3 + 48;
      unsigned __int8 v23 = a3 + 55;
      unsigned __int8 v24 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v22 = 58;
      }
      else
      {
        unsigned __int8 v24 = 97;
        unsigned __int8 v23 = 65;
      }
      if (result)
      {
        uint64_t v25 = 0;
        do
        {
          unsigned int v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24) {
                return 0;
              }
              char v27 = -87;
            }
            else
            {
              char v27 = -55;
            }
          }
          else
          {
            char v27 = -48;
          }
          uint64_t v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63) {
            return 0;
          }
          uint64_t v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27))) {
            return 0;
          }
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  uint64_t v14 = a2 - 1;
  if (a2 == 1) {
    return 0;
  }
  unsigned __int8 v15 = a3 + 48;
  unsigned __int8 v16 = a3 + 55;
  unsigned __int8 v17 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v15 = 58;
  }
  else
  {
    unsigned __int8 v17 = 97;
    unsigned __int8 v16 = 65;
  }
  if (!result) {
    return 0;
  }
  uint64_t v9 = 0;
  uint64_t v18 = result + 1;
  do
  {
    unsigned int v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17) {
          return 0;
        }
        char v20 = -87;
      }
      else
      {
        char v20 = -55;
      }
    }
    else
    {
      char v20 = -48;
    }
    uint64_t v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
      return 0;
    }
    uint64_t v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20))) {
      return 0;
    }
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_10000D074()
{
  unint64_t v0 = sub_1000131E0();
  uint64_t v4 = sub_10000D0F4(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_10000D0F4(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_10000D24C(a1, a2, a3, a4);
    if (!v9
      || (uint64_t v10 = v9,
          unsigned int v11 = sub_10000A040(v9, 0),
          unint64_t v12 = sub_10000D34C((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4),
          swift_bridgeObjectRetain(),
          swift_bridgeObjectRelease(),
          v12 == v10))
    {
      uint64_t v13 = sub_100013160();
      swift_release();
      return v13;
    }
    __break(1u);
  }
  else
  {
    if ((a4 & 0x2000000000000000) != 0)
    {
      v14[0] = a3;
      v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
      return sub_100013160();
    }
    if ((a3 & 0x1000000000000000) != 0) {
      goto LABEL_4;
    }
  }
  sub_1000132E0();
LABEL_4:

  return sub_100013160();
}

uint64_t sub_10000D24C(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4;
  uint64_t v5 = a3;
  unint64_t v6 = a2;
  unint64_t v7 = a1;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((a1 & 0xC) == 4 << v8)
  {
    a1 = sub_10000A0A8(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_10000A0A8(v6, v5, v4);
    unint64_t v6 = a1;
    if ((v4 & 0x1000000000000000) == 0) {
      return (v6 >> 16) - (v7 >> 16);
    }
  }
  else if ((v4 & 0x1000000000000000) == 0)
  {
    return (v6 >> 16) - (v7 >> 16);
  }
  unint64_t v11 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    unint64_t v11 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v11 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v11 >= v6 >> 16)
  {
    a1 = v7;
    a2 = v6;
    a3 = v5;
    a4 = v4;
    return String.UTF8View._foreignDistance(from:to:)(a1, a2, a3, a4);
  }
  __break(1u);
  return String.UTF8View._foreignDistance(from:to:)(a1, a2, a3, a4);
}

unint64_t sub_10000D34C(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0) {
    goto LABEL_36;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_33:
    *uint64_t v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  uint64_t v11 = 0;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4 << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t v17 = v12 & 0xC;
    uint64_t result = v12;
    if (v17 == v15) {
      uint64_t result = sub_10000A0A8(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      uint64_t result = sub_1000131B0();
      char v19 = result;
      if (v17 != v15) {
        goto LABEL_23;
      }
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
        if (v17 != v15) {
          goto LABEL_23;
        }
      }
      else
      {
        uint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          uint64_t result = sub_1000132E0();
        }
        char v19 = *(unsigned char *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
      }
    }
    uint64_t result = sub_10000A0A8(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16) {
      goto LABEL_35;
    }
    unint64_t v12 = sub_100013180();
LABEL_29:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_10000D560(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10000D580(a1, a2, a3, (void *)*v3);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_10000D580(char a1, int64_t a2, char a3, void *a4)
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
  sub_100008200((uint64_t *)&unk_10001D560);
  uint64_t v10 = *(void *)(type metadata accessor for CLSContextMetadata() - 8);
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
  uint64_t v16 = *(void *)(type metadata accessor for CLSContextMetadata() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (char *)v13 + v17;
  char v19 = (char *)a4 + v17;
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
  uint64_t result = sub_100013320();
  __break(1u);
  return result;
}

uint64_t sub_10000D7C0(unint64_t a1)
{
  return sub_10000B7C0(0, *(void *)(a1 + 16), 0, a1, (uint64_t *)&unk_10001D560, (uint64_t (*)(void))type metadata accessor for CLSContextMetadata, (uint64_t (*)(void))type metadata accessor for CLSContextMetadata);
}

uint64_t sub_10000D808(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      return v6;
    }
  }
  uint64_t result = sub_100013320();
  __break(1u);
  return result;
}

uint64_t sub_10000D8FC()
{
  unint64_t v1 = self;
  if ([v1 canExtensionOpenDatabase])
  {
    id v2 = [v1 sharedInstance];
    id v3 = [v2 resetableImportContext];

    sub_100013140();
    id v4 = objc_allocWithZone((Class)NSFetchRequest);
    NSString v5 = sub_100013130();
    swift_bridgeObjectRelease();
    id v6 = [v4 initWithEntityName:v5];

    id v7 = [self predicateForNotHiddenNotImplicitlyFollowedPodcasts];
    [v6 setPredicate:v7];

    uint64_t v0 = sub_10000A464(v6, (uint64_t)sub_10000A440, 0);
  }
  else
  {
    sub_10000E788();
    swift_allocError();
    swift_willThrow();
  }
  return v0;
}

void sub_10000DA88(void *a1)
{
  sub_100009A78(0, &qword_10001D528);
  id v3 = [self shared];
  id v4 = [v3 mainAppContext];

  char v5 = sub_100013260();
  if (v5)
  {
    uint64_t v6 = sub_10000D8FC();
    if (!v1)
    {
      uint64_t v7 = v6;
      if (v6)
      {
        uint64_t v8 = swift_allocObject();
        *(void *)(v8 + 16) = v7;
        *(void *)(v8 + 24) = a1;
        swift_bridgeObjectRetain();
        id v9 = a1;
        sub_100009384((uint64_t)sub_10000E718, v8);
        swift_bridgeObjectRelease();
        swift_release();
      }
    }
  }
}

uint64_t sub_10000DBA4(uint64_t a1)
{
  uint64_t v2 = v1;
  sub_100013140();
  id v4 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v5 = sub_100013130();
  swift_bridgeObjectRelease();
  id v6 = [v4 initWithEntityName:v5];

  id v7 = [self predicateForPodcastStoreId:a1];
  [v6 setPredicate:v7];

  uint64_t v8 = sub_10000A644(v6, (uint64_t)sub_10000AA04, 0);
  if (!v1)
  {
    if (v8)
    {
      if (*(void *)(v8 + 16))
      {
        uint64_t v2 = *(void *)(v8 + 32);
        swift_bridgeObjectRetain();
      }
      else
      {
        uint64_t v2 = 0;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

id sub_10000DD00(uint64_t a1)
{
  id v4 = self;
  if ([v4 canExtensionOpenDatabase])
  {
    id v2 = [v4 sharedInstance];
    id v5 = [v2 resetableImportContext];

    sub_10000DBA4(a1);
    if (v1 || (id v2 = v6) == 0)
    {
    }
    else
    {
      sub_100013140();
      id v8 = objc_allocWithZone((Class)NSFetchRequest);
      NSString v9 = sub_100013130();
      swift_bridgeObjectRelease();
      id v10 = [v8 initWithEntityName:v9];

      uint64_t v11 = self;
      NSString v12 = sub_100013130();
      swift_bridgeObjectRelease();
      id v13 = [v11 predicateForUserEpisodesOnPodcastUuid:v12 ctx:v5];

      [v10 setPredicate:v13];
      id v2 = (id)sub_10000A824(v10, (uint64_t)sub_10000AA68, 0);
    }
  }
  else
  {
    sub_10000E788();
    swift_allocError();
    swift_willThrow();
  }
  return v2;
}

void sub_10000DEF8(void *a1)
{
  id v3 = [a1 identifier];
  unint64_t v4 = sub_100013140();
  unint64_t v6 = v5;

  uint64_t v7 = HIBYTE(v6) & 0xF;
  uint64_t v8 = v4 & 0xFFFFFFFFFFFFLL;
  if ((v6 & 0x2000000000000000) != 0) {
    uint64_t v9 = HIBYTE(v6) & 0xF;
  }
  else {
    uint64_t v9 = v4 & 0xFFFFFFFFFFFFLL;
  }
  if (!v9)
  {
    swift_bridgeObjectRelease();
    return;
  }
  if ((v6 & 0x1000000000000000) != 0)
  {
    uint64_t v11 = (uint64_t)sub_10000BA40(v4, v6, 10);
    LOBYTE(v4) = v30;
    goto LABEL_44;
  }
  if ((v6 & 0x2000000000000000) == 0)
  {
    if ((v4 & 0x1000000000000000) != 0) {
      id v10 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      id v10 = (unsigned __int8 *)sub_1000132E0();
    }
    uint64_t v11 = (uint64_t)sub_10000CDF8(v10, v8, 10);
    LOBYTE(v4) = v12 & 1;
    goto LABEL_44;
  }
  v31[0] = v4;
  v31[1] = v6 & 0xFFFFFFFFFFFFFFLL;
  if (v4 == 43)
  {
    if (!v7)
    {
LABEL_59:
      __break(1u);
      return;
    }
    if (v7 == 1 || (BYTE1(v4) - 48) > 9u) {
      goto LABEL_31;
    }
    uint64_t v11 = (BYTE1(v4) - 48);
    if (v7 != 2)
    {
      if ((BYTE2(v4) - 48) > 9u) {
        goto LABEL_31;
      }
      uint64_t v11 = 10 * (BYTE1(v4) - 48) + (BYTE2(v4) - 48);
      uint64_t v13 = v7 - 3;
      if (v13)
      {
        size_t v14 = (unsigned __int8 *)v31 + 3;
        while (1)
        {
          unsigned int v15 = *v14 - 48;
          if (v15 > 9) {
            goto LABEL_31;
          }
          uint64_t v16 = 10 * v11;
          if ((unsigned __int128)(v11 * (__int128)10) >> 64 != (10 * v11) >> 63) {
            goto LABEL_31;
          }
          uint64_t v11 = v16 + v15;
          if (__OFADD__(v16, v15)) {
            goto LABEL_31;
          }
          LOBYTE(v4) = 0;
          ++v14;
          if (!--v13) {
            goto LABEL_44;
          }
        }
      }
    }
LABEL_43:
    LOBYTE(v4) = 0;
    goto LABEL_44;
  }
  if (v4 != 45)
  {
    if (!v7 || (v4 - 48) > 9u) {
      goto LABEL_31;
    }
    uint64_t v11 = (v4 - 48);
    if (v7 != 1)
    {
      if ((BYTE1(v4) - 48) > 9u) {
        goto LABEL_31;
      }
      uint64_t v11 = 10 * (v4 - 48) + (BYTE1(v4) - 48);
      uint64_t v17 = v7 - 2;
      if (v17)
      {
        unint64_t v18 = (unsigned __int8 *)v31 + 2;
        while (1)
        {
          unsigned int v19 = *v18 - 48;
          if (v19 > 9) {
            goto LABEL_31;
          }
          uint64_t v20 = 10 * v11;
          if ((unsigned __int128)(v11 * (__int128)10) >> 64 != (10 * v11) >> 63) {
            goto LABEL_31;
          }
          uint64_t v11 = v20 + v19;
          if (__OFADD__(v20, v19)) {
            goto LABEL_31;
          }
          LOBYTE(v4) = 0;
          ++v18;
          if (!--v17) {
            goto LABEL_44;
          }
        }
      }
    }
    goto LABEL_43;
  }
  if (!v7)
  {
    __break(1u);
    goto LABEL_59;
  }
  if (v7 == 1 || (BYTE1(v4) - 48) > 9u) {
    goto LABEL_31;
  }
  if (v7 != 2)
  {
    if ((BYTE2(v4) - 48) <= 9u)
    {
      uint64_t v11 = -10 * (BYTE1(v4) - 48) - (BYTE2(v4) - 48);
      uint64_t v21 = v7 - 3;
      if (!v21) {
        goto LABEL_43;
      }
      unint64_t v27 = (unsigned __int8 *)v31 + 3;
      while (1)
      {
        unsigned int v28 = *v27 - 48;
        if (v28 > 9) {
          break;
        }
        uint64_t v29 = 10 * v11;
        if ((unsigned __int128)(v11 * (__int128)10) >> 64 != (10 * v11) >> 63) {
          break;
        }
        uint64_t v11 = v29 - v28;
        if (__OFSUB__(v29, v28)) {
          break;
        }
        LOBYTE(v4) = 0;
        ++v27;
        if (!--v21) {
          goto LABEL_44;
        }
      }
    }
LABEL_31:
    uint64_t v11 = 0;
    LOBYTE(v4) = 1;
    goto LABEL_44;
  }
  LOBYTE(v4) = 0;
  uint64_t v11 = -(uint64_t)(BYTE1(v4) - 48);
LABEL_44:
  swift_bridgeObjectRelease();
  if ((v4 & 1) == 0)
  {
    id v22 = sub_10000DD00(v11);
    if (!v1)
    {
      if (v22)
      {
        v31[0] = (unint64_t)v22;
        sub_10000B01C(v31);
        uint64_t v23 = swift_bridgeObjectRetain();
        unsigned __int8 v24 = sub_10000B0C8(v23);
        swift_bridgeObjectRelease_n();
        uint64_t v25 = swift_allocObject();
        *(void *)(v25 + 16) = v24;
        *(void *)(v25 + 24) = a1;
        swift_bridgeObjectRetain();
        id v26 = a1;
        sub_100009384((uint64_t)sub_10000F298, v25);
        swift_bridgeObjectRelease();
        swift_release();
      }
    }
  }
}

void sub_10000E2A4(void *a1, uint64_t a2, uint64_t a3)
{
  id v7 = [a1 identifierPath];
  uint64_t v8 = sub_1000131F0();

  uint64_t v9 = *(void *)(v8 + 16);
  swift_bridgeObjectRelease();
  if (v9 == 2)
  {
    sub_10000DEF8(a1);
    if (v3) {
      return;
    }
    id v10 = [self shared];
    uint64_t v17 = a2;
    uint64_t v18 = a3;
    uint64_t v13 = _NSConcreteStackBlock;
    uint64_t v14 = 1107296256;
    uint64_t v11 = &unk_100018AB8;
    goto LABEL_7;
  }
  if (v9 == 1)
  {
    sub_10000DA88(a1);
    if (!v3)
    {
      id v10 = [self shared];
      uint64_t v17 = a2;
      uint64_t v18 = a3;
      uint64_t v13 = _NSConcreteStackBlock;
      uint64_t v14 = 1107296256;
      uint64_t v11 = &unk_100018AE0;
LABEL_7:
      unsigned int v15 = sub_10000A3D4;
      uint64_t v16 = v11;
      char v12 = _Block_copy(&v13);
      swift_retain();
      swift_release();
      [v10 saveWithCompletion:v12, v13, v14];
      _Block_release(v12);
    }
  }
}

uint64_t sub_10000E474(void *a1, void (**a2)(void, void))
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a2;
  _Block_copy(a2);
  sub_10000E2A4(a1, (uint64_t)sub_10000E6A0, v4);
  a2[2](a2, 0);

  return swift_release();
}

uint64_t sub_10000E668()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10000E6A0(uint64_t a1)
{
  sub_10000A370(a1, *(void *)(v1 + 16));
}

unint64_t sub_10000E6A8()
{
  unint64_t result = qword_10001D518;
  if (!qword_10001D518)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001D518);
  }
  return result;
}

uint64_t sub_10000E6FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000E70C()
{
  return swift_release();
}

uint64_t sub_10000E718(unint64_t a1)
{
  return sub_10000AA8C(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

unint64_t sub_10000E720()
{
  unint64_t result = qword_10001D540;
  if (!qword_10001D540)
  {
    sub_100009A78(255, &qword_10001D408);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001D540);
  }
  return result;
}

unint64_t sub_10000E788()
{
  unint64_t result = qword_10001D548;
  if (!qword_10001D548)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001D548);
  }
  return result;
}

id sub_10000E7E0()
{
  return sub_10000EB0C(&qword_10001D550);
}

uint64_t sub_10000E7F4()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000E804()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10000E82C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
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
  uint64_t result = sub_100013320();
  __break(1u);
  return result;
}

uint64_t sub_10000E988(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CLSContextMetadata();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000E9F0()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000EA30(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100008200(&qword_10001D578);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000EA98(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100008200(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

id sub_10000EAF8()
{
  return sub_10000EB0C(&qword_10001D588);
}

id sub_10000EB0C(unint64_t *a1)
{
  return sub_10000B4D4(*(void **)(v1 + 16), *(void **)(v1 + 24), *(void *)(v1 + 32), *(void (**)(id))(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), a1);
}

uint64_t sub_10000EB38()
{
  return _swift_deallocObject(v0, 32, 7);
}

char *sub_10000EB48(unint64_t a1, void (*a2)(uint64_t *__return_ptr, id))
{
  void (*v21)(uint64_t *__return_ptr, id);

  uint64_t v21 = a2;
  unint64_t v3 = a1;
  if (a1 >> 62) {
    goto LABEL_19;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v4; uint64_t v4 = sub_100013310())
  {
    unint64_t v18 = v3 & 0xC000000000000001;
    uint64_t v5 = (char *)_swiftEmptyArrayStorage;
    uint64_t v6 = 4;
    unint64_t v17 = v3;
    while (1)
    {
      id v8 = v18 ? (id)sub_1000132D0() : *(id *)(v3 + 8 * v6);
      uint64_t v9 = v8;
      uint64_t v10 = v6 - 3;
      if (__OFADD__(v6 - 4, 1)) {
        break;
      }
      v21(&v19, v8);
      if (v2)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        return v5;
      }

      uint64_t v11 = v20;
      if (v20)
      {
        uint64_t v12 = v4;
        uint64_t v13 = v19;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v5 = sub_10000B68C(0, *((void *)v5 + 2) + 1, 1, v5);
        }
        unint64_t v15 = *((void *)v5 + 2);
        unint64_t v14 = *((void *)v5 + 3);
        if (v15 >= v14 >> 1) {
          uint64_t v5 = sub_10000B68C((char *)(v14 > 1), v15 + 1, 1, v5);
        }
        *((void *)v5 + 2) = v15 + 1;
        id v7 = &v5[16 * v15];
        *((void *)v7 + 4) = v13;
        *((void *)v7 + 5) = v11;
        unint64_t v3 = v17;
        uint64_t v4 = v12;
      }
      ++v6;
      if (v10 == v4)
      {
        swift_bridgeObjectRelease();
        return v5;
      }
    }
    __break(1u);
LABEL_19:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return (char *)_swiftEmptyArrayStorage;
}

void *sub_10000ED18(unint64_t a1, void (*a2)(id))
{
  unsigned int v28 = a2;
  uint64_t v4 = sub_100008200(&qword_10001D558);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = type metadata accessor for CLSContextMetadata();
  uint64_t v23 = *(void *)(v27 - 8);
  uint64_t v7 = __chkstk_darwin(v27);
  uint64_t v26 = (uint64_t)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v22 = (uint64_t)&v20 - v9;
  if (a1 >> 62) {
    goto LABEL_20;
  }
  uint64_t v10 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v10; uint64_t v10 = sub_100013310())
  {
    unint64_t v25 = a1 & 0xC000000000000001;
    uint64_t v11 = &_swiftEmptyArrayStorage;
    unsigned __int8 v24 = (unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48);
    uint64_t v12 = 4;
    unint64_t v21 = a1;
    while (1)
    {
      id v13 = v25 ? (id)sub_1000132D0() : *(id *)(a1 + 8 * v12);
      unint64_t v14 = v13;
      uint64_t v15 = v12 - 3;
      if (__OFADD__(v12 - 4, 1)) {
        break;
      }
      v28(v13);
      if (v2)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        return v11;
      }

      if ((*v24)(v6, 1, v27) == 1)
      {
        sub_10000EA98((uint64_t)v6, &qword_10001D558);
      }
      else
      {
        uint64_t v16 = v22;
        sub_10000E988((uint64_t)v6, v22);
        sub_10000E988(v16, v26);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v11 = (void *)sub_10000B7C0(0, v11[2] + 1, 1, (unint64_t)v11, (uint64_t *)&unk_10001D560, (uint64_t (*)(void))type metadata accessor for CLSContextMetadata, (uint64_t (*)(void))type metadata accessor for CLSContextMetadata);
        }
        unint64_t v18 = v11[2];
        unint64_t v17 = v11[3];
        if (v18 >= v17 >> 1) {
          uint64_t v11 = (void *)sub_10000B7C0(v17 > 1, v18 + 1, 1, (unint64_t)v11, (uint64_t *)&unk_10001D560, (uint64_t (*)(void))type metadata accessor for CLSContextMetadata, (uint64_t (*)(void))type metadata accessor for CLSContextMetadata);
        }
        v11[2] = v18 + 1;
        sub_10000E988(v26, (uint64_t)v11+ ((*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80))+ *(void *)(v23 + 72) * v18);
        a1 = v21;
      }
      ++v12;
      if (v15 == v10)
      {
        swift_bridgeObjectRelease();
        return v11;
      }
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_10000F080()
{
  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

id sub_10000F0C8()
{
  return sub_10000B400(*(char ***)(v0 + 16), *(void **)(v0 + 24), *(void *)(v0 + 32), *(void (**)(uint64_t *__return_ptr, id))(v0 + 40));
}

uint64_t sub_10000F0D8()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t getEnumTagSinglePayload for ClassKitError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for ClassKitError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x10000F1D8);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10000F200()
{
  return 0;
}

ValueMetadata *type metadata accessor for ClassKitError()
{
  return &type metadata for ClassKitError;
}

unint64_t sub_10000F220()
{
  unint64_t result = qword_10001D590;
  if (!qword_10001D590)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001D590);
  }
  return result;
}

uint64_t sub_10000F29C@<X0>(uint64_t a1@<X8>)
{
  int v2 = v1;
  uint64_t v4 = sub_100008200((uint64_t *)&unk_10001D530);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (int *)type metadata accessor for CLSContextMetadata();
  uint64_t v40 = *((void *)v7 - 1);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((objc_msgSend(self, "isEmpty:", objc_msgSend(v1, "storeTrackId")) & 1) != 0
    || (id v10 = [v1 title]) == 0)
  {
    uint64_t v19 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, int *))(v40 + 56);
    return v19(a1, 1, 1, v7);
  }
  else
  {
    uint64_t v11 = v10;
    uint64_t v39 = a1;
    uint64_t v12 = sub_100013140();
    uint64_t v37 = v13;

    *(void *)&long long v44 = [v2 storeTrackId];
    uint64_t v14 = sub_100013340();
    uint64_t v16 = v15;
    id v17 = [v2 podcast];
    if (v17)
    {
      id v18 = v17;
      *((void *)&v45 + 1) = sub_100009A78(0, &qword_10001D550);
      unint64_t v46 = &off_100018D98;
      *(void *)&long long v44 = v18;
    }
    else
    {
      unint64_t v46 = 0;
      long long v44 = 0u;
      long long v45 = 0u;
    }
    v9[40] = 1;
    *((void *)v9 + 6) = 0;
    uint64_t v21 = (uint64_t)&v9[v7[9]];
    uint64_t v22 = sub_1000130D0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v21, 1, 1, v22);
    uint64_t v23 = (uint64_t (**)())&v9[v7[10]];
    *uint64_t v23 = sub_100007958;
    v23[1] = 0;
    uint64_t v38 = v7[11];
    *(void *)&v9[v38] = 0;
    uint64_t v24 = v7[12];
    *(void *)&v9[v24] = 0;
    *(void *)uint64_t v9 = 14;
    *((void *)v9 + 1) = v14;
    *((void *)v9 + 2) = v16;
    *((void *)v9 + 3) = v12;
    *((void *)v9 + 4) = v37;
    sub_100010120((uint64_t)&v44, (uint64_t)v41);
    uint64_t v25 = v42;
    if (v42)
    {
      uint64_t v26 = v43;
      sub_100008438(v41, v42);
      uint64_t v25 = sub_100007960(v25, v26);
      sub_1000083C0((uint64_t)&v44);
      sub_1000085D4((uint64_t)v41);
    }
    else
    {
      sub_1000083C0((uint64_t)&v44);
      sub_1000083C0((uint64_t)v41);
    }
    swift_bridgeObjectRelease();
    *(void *)&v9[v24] = v25;
    *((void *)v9 + 6) = [v2 episodeNumber];
    sub_10000F728((uint64_t)v6);
    sub_100010188((uint64_t)v6, v21);
    id v27 = [v2 uuid];
    unsigned int v28 = sub_100007958;
    if (v27)
    {
      uint64_t v29 = sub_100013140();
      uint64_t v31 = v30;

      double v32 = (double)CLSContextThumbnailMaximumAllowedDimension;
      id v27 = (id)swift_allocObject();
      *((void *)v27 + 2) = v29;
      *((void *)v27 + 3) = v31;
      *((double *)v27 + 4) = v32;
      *((double *)v27 + 5) = v32;
      unsigned int v28 = (uint64_t (*)())sub_100010228;
    }
    uint64_t v33 = v28;
    swift_release();
    *uint64_t v23 = v33;
    v23[1] = (uint64_t (*)())v27;
    [v2 pubDate];
    uint64_t v34 = v39;
    *(void *)&v9[v38] = v35;
    sub_100010234((uint64_t)v9, v34, (uint64_t (*)(void))type metadata accessor for CLSContextMetadata);
    (*(void (**)(uint64_t, void, uint64_t, int *))(v40 + 56))(v34, 0, 1, v7);
    return sub_100010300((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for CLSContextMetadata);
  }
}

uint64_t sub_10000F728@<X0>(uint64_t a1@<X8>)
{
  int v2 = v1;
  uint64_t v38 = a1;
  uint64_t v3 = sub_100013120();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = sub_1000130A0();
  uint64_t v7 = *(void *)(v37 - 8);
  __chkstk_darwin(v37);
  uint64_t v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for PodcastsURLEpisodeParameters(0);
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v36 - v14;
  id v16 = [v2 podcast];
  if (v16)
  {
    id v17 = v16;
    id v18 = [v16 storeCollectionId];

    *(_OWORD *)uint64_t v15 = 0u;
    *((_OWORD *)v15 + 1) = 0u;
    *(_WORD *)(v15 + 57) = 514;
    uint64_t v19 = &v15[*(int *)(v10 + 40)];
    uint64_t v20 = sub_1000130F0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v19, 1, 1, v20);
    *((void *)v15 + 4) = v18;
    v15[40] = 0;
    *((void *)v15 + 6) = [v2 storeTrackId];
    v15[56] = 0;
    type metadata accessor for PodcastsURLScheme();
    sub_100010234((uint64_t)v15, (uint64_t)v13, type metadata accessor for PodcastsURLEpisodeParameters);
    type metadata accessor for PodcastsURLShowCommand(0);
    uint64_t v21 = swift_allocObject();
    sub_10001029C((uint64_t)v13, v21 + OBJC_IVAR____TtC25PodcastsClassKitExtension25PodcastsURLEpisodeCommand_episodeParameters);
    type metadata accessor for PodcastsURLNowPlayingCommand();
    if (swift_dynamicCastClass())
    {
      swift_retain();
      sub_100013090();
      if (qword_10001D290 != -1) {
        swift_once();
      }
      swift_bridgeObjectRetain();
      sub_100013080();
      if (qword_10001D298 == -1) {
        goto LABEL_13;
      }
      goto LABEL_37;
    }
    type metadata accessor for PodcastsURLBrowseCommand();
    if (swift_dynamicCastClass())
    {
      swift_retain();
      sub_100013090();
      if (qword_10001D290 != -1) {
        swift_once();
      }
      swift_bridgeObjectRetain();
      sub_100013080();
      if (qword_10001D2A0 == -1) {
        goto LABEL_13;
      }
LABEL_37:
      swift_once();
LABEL_13:
      swift_bridgeObjectRetain();
      sub_100013070();
LABEL_14:
      sub_100013060();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v37);
LABEL_15:
      swift_release();
LABEL_16:
      swift_release();
      return sub_100010300((uint64_t)v15, type metadata accessor for PodcastsURLEpisodeParameters);
    }
    type metadata accessor for PodcastsURLOpenCommand(0);
    uint64_t v29 = swift_dynamicCastClass();
    if (v29)
    {
      uint64_t v30 = v29;
      swift_retain();
      sub_1000115A4(v30, v38);
      goto LABEL_15;
    }
    uint64_t v31 = swift_dynamicCastClass();
    if (v31)
    {
      uint64_t v32 = v31;
      swift_retain();
      sub_100013090();
      if (qword_10001D290 != -1) {
        swift_once();
      }
      swift_bridgeObjectRetain();
      sub_100013080();
      if (qword_10001D2B0 == -1) {
        goto LABEL_35;
      }
    }
    else
    {
      type metadata accessor for PodcastsURLPlayCommand(0);
      uint64_t v33 = swift_dynamicCastClass();
      if (v33)
      {
        uint64_t v32 = v33;
        swift_retain();
        sub_100013090();
        if (qword_10001D290 != -1) {
          swift_once();
        }
        swift_bridgeObjectRetain();
        sub_100013080();
        if (qword_10001D2B8 == -1) {
          goto LABEL_35;
        }
      }
      else
      {
        type metadata accessor for PodcastsURLShowAndPlayCommand(0);
        uint64_t v34 = swift_dynamicCastClass();
        if (!v34)
        {
          uint64_t v35 = sub_1000130D0();
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v38, 1, 1, v35);
          goto LABEL_16;
        }
        uint64_t v32 = v34;
        swift_retain();
        sub_100013090();
        if (qword_10001D290 != -1) {
          swift_once();
        }
        swift_bridgeObjectRetain();
        sub_100013080();
        if (qword_10001D2C0 == -1) {
          goto LABEL_35;
        }
      }
    }
    swift_once();
LABEL_35:
    swift_bridgeObjectRetain();
    sub_100013070();
    sub_100012620(v32 + OBJC_IVAR____TtC25PodcastsClassKitExtension25PodcastsURLEpisodeCommand_episodeParameters);
    sub_100013050();
    goto LABEL_14;
  }
  sub_100009A78(0, (unint64_t *)&qword_10001D520);
  sub_100013280();
  uint64_t v22 = v2;
  uint64_t v23 = sub_100013110();
  os_log_type_t v24 = sub_100013230();
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v25 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v25 = 134217984;
    id v39 = [v22 storeTrackId];
    sub_1000132A0();

    _os_log_impl((void *)&_mh_execute_header, v23, v24, "Unable to build share URL, unknown show for episode - %lld", v25, 0xCu);
    swift_slowDealloc();
  }
  else
  {

    uint64_t v23 = v22;
  }
  uint64_t v27 = v38;

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  uint64_t v28 = sub_1000130D0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v27, 1, 1, v28);
}

id sub_10000FFA8(double a1, double a2)
{
  uint64_t v4 = self;
  NSString v5 = sub_100013130();
  id v6 = [v4 artworkForEpisodeUuid:v5 size:0 triggerDownload:a1, a2];

  id v7 = [v6 CGImage];
  return v7;
}

uint64_t sub_100010058()
{
  [*v0 storeTrackId];
  return sub_100013340();
}

double sub_1000100A8@<D0>(uint64_t a1@<X8>)
{
  id v3 = [*v1 podcast];
  if (v3)
  {
    id v4 = v3;
    *(void *)(a1 + 24) = sub_100009A78(0, &qword_10001D550);
    *(void *)(a1 + 32) = &off_100018D98;
    *(void *)a1 = v4;
  }
  else
  {
    *(void *)(a1 + 32) = 0;
    double result = 0.0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
  return result;
}

uint64_t sub_100010120(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100008200(&qword_10001D310);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100010188(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100008200((uint64_t *)&unk_10001D530);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000101F0()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

id sub_100010228()
{
  return sub_10000FFA8(*(double *)(v0 + 32), *(double *)(v0 + 40));
}

uint64_t sub_100010234(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10001029C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PodcastsURLEpisodeParameters(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100010300(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100010360@<X0>(uint64_t a1@<X8>)
{
  int v2 = v1;
  uint64_t v4 = sub_100008200((uint64_t *)&unk_10001D530);
  __chkstk_darwin(v4 - 8);
  id v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = (int *)type metadata accessor for CLSContextMetadata();
  uint64_t v35 = *((void *)v7 - 1);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((objc_msgSend(self, "isEmpty:", objc_msgSend(v1, "storeCollectionId")) & 1) != 0
    || (id v10 = [v1 title]) == 0)
  {
    uint64_t v23 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, int *))(v35 + 56);
    return v23(a1, 1, 1, v7);
  }
  else
  {
    uint64_t v11 = v10;
    uint64_t v34 = a1;
    uint64_t v12 = sub_100013140();
    uint64_t v33 = v13;

    *(void *)&v39[0] = [v2 storeCollectionId];
    uint64_t v14 = sub_100013340();
    uint64_t v16 = v15;
    uint64_t v40 = 0;
    memset(v39, 0, sizeof(v39));
    v9[40] = 1;
    *((void *)v9 + 6) = 0;
    uint64_t v17 = (uint64_t)&v9[v7[9]];
    uint64_t v18 = sub_1000130D0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v17, 1, 1, v18);
    uint64_t v19 = (uint64_t (**)())&v9[v7[10]];
    *uint64_t v19 = sub_100007958;
    v19[1] = 0;
    *(void *)&v9[v7[11]] = 0;
    uint64_t v20 = v7[12];
    *(void *)&v9[v20] = 0;
    *(void *)uint64_t v9 = 0;
    *((void *)v9 + 1) = v14;
    *((void *)v9 + 2) = v16;
    *((void *)v9 + 3) = v12;
    *((void *)v9 + 4) = v33;
    sub_100010120((uint64_t)v39, (uint64_t)v36);
    uint64_t v21 = v37;
    if (v37)
    {
      uint64_t v22 = v38;
      sub_100008438(v36, v37);
      uint64_t v21 = sub_100007960(v21, v22);
      sub_1000083C0((uint64_t)v39);
      sub_1000085D4((uint64_t)v36);
    }
    else
    {
      sub_1000083C0((uint64_t)v39);
      sub_1000083C0((uint64_t)v36);
    }
    swift_bridgeObjectRelease();
    *(void *)&v9[v20] = v21;
    v9[40] = 0;
    sub_100010774((uint64_t)v6);
    sub_100010188((uint64_t)v6, v17);
    id v25 = [v2 uuid];
    uint64_t v26 = sub_100007958;
    if (v25)
    {
      uint64_t v27 = sub_100013140();
      uint64_t v29 = v28;

      double v30 = (double)CLSContextThumbnailMaximumAllowedDimension;
      id v25 = (id)swift_allocObject();
      *((void *)v25 + 2) = v27;
      *((void *)v25 + 3) = v29;
      *((double *)v25 + 4) = v30;
      *((double *)v25 + 5) = v30;
      uint64_t v26 = (uint64_t (*)())sub_100010F34;
    }
    uint64_t v31 = v26;
    uint64_t v32 = v34;
    swift_release();
    *uint64_t v19 = v31;
    v19[1] = (uint64_t (*)())v25;
    sub_100010234((uint64_t)v9, v32, (uint64_t (*)(void))type metadata accessor for CLSContextMetadata);
    (*(void (**)(uint64_t, void, uint64_t, int *))(v35 + 56))(v32, 0, 1, v7);
    return sub_100010300((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for CLSContextMetadata);
  }
}

uint64_t sub_100010774@<X0>(uint64_t a1@<X8>)
{
  int v2 = v1;
  uint64_t v4 = sub_1000130A0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for PodcastsURLEpisodeParameters(0);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  uint64_t v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = (char *)&v26 - v13;
  *((void *)v14 + 6) = 0;
  *(_OWORD *)uint64_t v14 = 0u;
  *((_OWORD *)v14 + 1) = 0u;
  v14[56] = 1;
  *(_WORD *)(v14 + 57) = 514;
  uint64_t v15 = (char *)&v26 + *(int *)(v12 + 48) - v13;
  uint64_t v16 = sub_1000130F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 1, 1, v16);
  *((void *)v14 + 4) = [v2 storeCollectionId];
  v14[40] = 0;
  type metadata accessor for PodcastsURLScheme();
  sub_100010234((uint64_t)v14, (uint64_t)v11, type metadata accessor for PodcastsURLEpisodeParameters);
  type metadata accessor for PodcastsURLShowCommand(0);
  uint64_t v17 = swift_allocObject();
  sub_10001029C((uint64_t)v11, v17 + OBJC_IVAR____TtC25PodcastsClassKitExtension25PodcastsURLEpisodeCommand_episodeParameters);
  type metadata accessor for PodcastsURLNowPlayingCommand();
  if (swift_dynamicCastClass())
  {
    swift_retain();
    sub_100013090();
    if (qword_10001D290 != -1) {
      swift_once();
    }
    swift_bridgeObjectRetain();
    sub_100013080();
    if (qword_10001D298 == -1) {
      goto LABEL_10;
    }
    goto LABEL_32;
  }
  type metadata accessor for PodcastsURLBrowseCommand();
  if (!swift_dynamicCastClass())
  {
    type metadata accessor for PodcastsURLOpenCommand(0);
    uint64_t v19 = swift_dynamicCastClass();
    if (v19)
    {
      uint64_t v20 = v19;
      swift_retain();
      sub_1000115A4(v20, a1);
      goto LABEL_12;
    }
    uint64_t v21 = swift_dynamicCastClass();
    if (v21)
    {
      uint64_t v22 = v21;
      swift_retain();
      sub_100013090();
      if (qword_10001D290 != -1) {
        swift_once();
      }
      swift_bridgeObjectRetain();
      sub_100013080();
      if (qword_10001D2B0 == -1) {
        goto LABEL_30;
      }
    }
    else
    {
      type metadata accessor for PodcastsURLPlayCommand(0);
      uint64_t v23 = swift_dynamicCastClass();
      if (v23)
      {
        uint64_t v22 = v23;
        swift_retain();
        sub_100013090();
        if (qword_10001D290 != -1) {
          swift_once();
        }
        swift_bridgeObjectRetain();
        sub_100013080();
        if (qword_10001D2B8 == -1) {
          goto LABEL_30;
        }
      }
      else
      {
        type metadata accessor for PodcastsURLShowAndPlayCommand(0);
        uint64_t v24 = swift_dynamicCastClass();
        if (!v24)
        {
          uint64_t v25 = sub_1000130D0();
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(a1, 1, 1, v25);
          goto LABEL_13;
        }
        uint64_t v22 = v24;
        swift_retain();
        sub_100013090();
        if (qword_10001D290 != -1) {
          swift_once();
        }
        swift_bridgeObjectRetain();
        sub_100013080();
        if (qword_10001D2C0 == -1) {
          goto LABEL_30;
        }
      }
    }
    swift_once();
LABEL_30:
    swift_bridgeObjectRetain();
    sub_100013070();
    sub_100012620(v22 + OBJC_IVAR____TtC25PodcastsClassKitExtension25PodcastsURLEpisodeCommand_episodeParameters);
    sub_100013050();
    goto LABEL_11;
  }
  swift_retain();
  sub_100013090();
  if (qword_10001D290 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  sub_100013080();
  if (qword_10001D2A0 == -1) {
    goto LABEL_10;
  }
LABEL_32:
  swift_once();
LABEL_10:
  swift_bridgeObjectRetain();
  sub_100013070();
LABEL_11:
  sub_100013060();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
LABEL_12:
  swift_release();
LABEL_13:
  swift_release();
  return sub_100010300((uint64_t)v14, type metadata accessor for PodcastsURLEpisodeParameters);
}

id sub_100010DEC(double a1, double a2)
{
  uint64_t v4 = self;
  NSString v5 = sub_100013130();
  id v6 = [v4 artworkForPodcastUuid:v5 size:0 triggerDownload:a1, a2];

  id v7 = [v6 CGImage];
  return v7;
}

uint64_t sub_100010E9C()
{
  [*v0 storeCollectionId];
  return sub_100013340();
}

double sub_100010EEC@<D0>(uint64_t a1@<X8>)
{
  *(void *)(a1 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t sub_100010EFC()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

id sub_100010F34()
{
  return sub_100010DEC(*(double *)(v0 + 32), *(double *)(v0 + 40));
}

uint64_t sub_100010F40()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for PodcastsURLCommand()
{
  return self;
}

uint64_t type metadata accessor for PodcastsURLNowPlayingCommand()
{
  return self;
}

uint64_t type metadata accessor for PodcastsURLBrowseCommand()
{
  return self;
}

uint64_t sub_100010FBC()
{
  return sub_100012558(v0 + OBJC_IVAR____TtC25PodcastsClassKitExtension22PodcastsURLOpenCommand_widgetContext);
}

uint64_t sub_100010FCC()
{
  return sub_1000110B4(&OBJC_IVAR____TtC25PodcastsClassKitExtension22PodcastsURLOpenCommand_widgetContext, (void (*)(uint64_t))sub_100012558);
}

uint64_t sub_100010FEC()
{
  return type metadata accessor for PodcastsURLOpenCommand(0);
}

uint64_t type metadata accessor for PodcastsURLOpenCommand(uint64_t a1)
{
  return sub_1000112F0(a1, (uint64_t *)&unk_10001D8D0);
}

uint64_t sub_100011014(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100011158(a1, a2, a3, (uint64_t (*)(uint64_t))sub_10001102C);
}

void sub_10001102C()
{
  if (!qword_10001D8E0)
  {
    sub_1000130F0();
    unint64_t v0 = sub_100013290();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10001D8E0);
    }
  }
}

uint64_t sub_100011084()
{
  return sub_1000124FC(v0 + OBJC_IVAR____TtC25PodcastsClassKitExtension25PodcastsURLEpisodeCommand_episodeParameters);
}

uint64_t sub_100011094()
{
  return sub_1000110B4(&OBJC_IVAR____TtC25PodcastsClassKitExtension25PodcastsURLEpisodeCommand_episodeParameters, (void (*)(uint64_t))sub_1000124FC);
}

uint64_t sub_1000110B4(void *a1, void (*a2)(uint64_t))
{
  a2(v2 + *a1);
  uint64_t v3 = *(unsigned int *)(*(void *)v2 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v2 + 52);

  return _swift_deallocClassInstance(v2, v3, v4);
}

uint64_t sub_100011118()
{
  return type metadata accessor for PodcastsURLEpisodeCommand(0);
}

uint64_t type metadata accessor for PodcastsURLEpisodeCommand(uint64_t a1)
{
  return sub_1000112F0(a1, qword_10001D990);
}

uint64_t sub_100011140(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100011158(a1, a2, a3, type metadata accessor for PodcastsURLEpisodeParameters);
}

uint64_t sub_100011158(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t result = a4(319);
  if (v5 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for PodcastsURLEpisodeParameters(uint64_t a1)
{
  return sub_1000112F0(a1, qword_10001DE70);
}

uint64_t sub_100011210()
{
  return type metadata accessor for PodcastsURLShowCommand(0);
}

uint64_t type metadata accessor for PodcastsURLShowCommand(uint64_t a1)
{
  return sub_1000112F0(a1, qword_10001DA48);
}

uint64_t sub_10001123C()
{
  return type metadata accessor for PodcastsURLPlayCommand(0);
}

uint64_t type metadata accessor for PodcastsURLPlayCommand(uint64_t a1)
{
  return sub_1000112F0(a1, qword_10001DB00);
}

uint64_t sub_100011264()
{
  sub_1000124FC(v0 + OBJC_IVAR____TtC25PodcastsClassKitExtension25PodcastsURLEpisodeCommand_episodeParameters);
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_1000112C8()
{
  return type metadata accessor for PodcastsURLShowAndPlayCommand(0);
}

uint64_t type metadata accessor for PodcastsURLShowAndPlayCommand(uint64_t a1)
{
  return sub_1000112F0(a1, qword_10001DBB8);
}

uint64_t sub_1000112F0(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100011328()
{
  return swift_updateClassMetadata2();
}

void sub_100011360()
{
  qword_10001E0C0 = 0x7374736163646F70;
  *(void *)algn_10001E0C8 = 0xE800000000000000;
}

void sub_100011384()
{
  qword_10001D600 = 0x6979616C50776F6ELL;
  *(void *)algn_10001D608 = 0xEA0000000000676ELL;
}

void sub_1000113AC()
{
  qword_10001D610 = 0x6573776F7262;
  *(void *)algn_10001D618 = 0xE600000000000000;
}

void sub_1000113CC()
{
  qword_10001D620 = 1852141679;
  *(void *)algn_10001D628 = 0xE400000000000000;
}

void sub_1000113E8()
{
  qword_10001D630 = 2003789939;
  *(void *)algn_10001D638 = 0xE400000000000000;
}

void sub_100011404()
{
  qword_10001D640 = 2036427888;
  *(void *)algn_10001D648 = 0xE400000000000000;
}

void sub_100011420()
{
  qword_10001D650 = 0x79616C70776F6873;
  *(void *)algn_10001D658 = 0xE800000000000000;
}

void sub_100011444()
{
  qword_10001D660 = 0x5574736163646F70;
  *(void *)algn_10001D668 = 0xEB00000000646975;
}

void sub_100011470()
{
  qword_10001D670 = 0x5565646F73697065;
  *(void *)algn_10001D678 = 0xEB00000000646975;
}

void sub_10001149C()
{
  qword_10001D680 = 0x4974736163646F70;
  *(void *)algn_10001D688 = 0xE900000000000064;
}

void sub_1000114C4()
{
  qword_10001D690 = 0x4965646F73697065;
  *(void *)algn_10001D698 = 0xE900000000000064;
}

void sub_1000114EC()
{
  qword_10001D6A0 = 0x616C506563726F66;
  *(void *)algn_10001D6A8 = 0xE900000000000079;
}

void sub_100011514()
{
  algn_10001D6B8[7] = -18;
}

void sub_100011544()
{
  qword_10001D6C0 = 0x6F4E6E657473696CLL;
  *(void *)algn_10001D6C8 = 0xEF7478654E705577;
}

void sub_100011574()
{
  *(_WORD *)&algn_10001D6D8[6] = -4864;
}

uint64_t sub_1000115A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v15[1] = a2;
  sub_100008200(&qword_10001DE10);
  __chkstk_darwin();
  uint64_t v4 = (char *)v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000130F0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000130A0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin();
  uint64_t v12 = (char *)v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100013090();
  if (qword_10001D290 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  sub_100013080();
  if (qword_10001D2A8 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  sub_100013070();
  sub_1000125B8(a1 + OBJC_IVAR____TtC25PodcastsClassKitExtension22PodcastsURLOpenCommand_widgetContext, (uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_100012558((uint64_t)v4);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
    sub_1000130E0();
    if (v13)
    {
      sub_100008200(&qword_10001D570);
      sub_100013040();
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_100015CB0;
      if (qword_10001D300 != -1) {
        swift_once();
      }
      sub_100013030();
      swift_bridgeObjectRelease();
      sub_100013050();
    }
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  sub_100013060();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t type metadata accessor for PodcastsURLScheme()
{
  return self;
}

uint64_t type metadata accessor for PodcastsURLScheme.Command()
{
  return self;
}

uint64_t type metadata accessor for PodcastsURLScheme.Param()
{
  return self;
}

void *sub_1000119E4(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = (void *)a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    void *v3 = *a2;
    uint64_t v3 = (void *)(v14 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v5;
    uint64_t v6 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v6;
    *(void *)(a1 + 32) = a2[4];
    *(unsigned char *)(a1 + 40) = *((unsigned char *)a2 + 40);
    *(void *)(a1 + 48) = a2[6];
    *(_WORD *)(a1 + 56) = *((_WORD *)a2 + 28);
    uint64_t v7 = *(int *)(a3 + 40);
    uint64_t v8 = (char *)a2 + v7;
    uint64_t v9 = (void *)(a1 + v7);
    *(unsigned char *)(a1 + 58) = *((unsigned char *)a2 + 58);
    uint64_t v10 = sub_1000130F0();
    uint64_t v11 = *(void *)(v10 - 8);
    uint64_t v12 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v12(v8, 1, v10))
    {
      uint64_t v13 = sub_100008200(&qword_10001DE10);
      memcpy(v9, v8, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v11 + 16))(v9, v8, v10);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
    }
  }
  return v3;
}

uint64_t sub_100011B98(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 40);
  uint64_t v5 = sub_1000130F0();
  uint64_t v8 = *(void *)(v5 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v4, 1, v5);
  if (!result)
  {
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8);
    return v7(v4, v5);
  }
  return result;
}

uint64_t sub_100011C70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_WORD *)(a1 + 56) = *(_WORD *)(a2 + 56);
  uint64_t v6 = *(int *)(a3 + 40);
  uint64_t v7 = (const void *)(a2 + v6);
  uint64_t v8 = (void *)(a1 + v6);
  *(unsigned char *)(a1 + 58) = *(unsigned char *)(a2 + 58);
  uint64_t v9 = sub_1000130F0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v11(v7, 1, v9))
  {
    uint64_t v12 = sub_100008200(&qword_10001DE10);
    memcpy(v8, v7, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 16))(v8, v7, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v8, 0, 1, v9);
  }
  return a1;
}

uint64_t sub_100011DD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 32) = v6;
  uint64_t v7 = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 48) = v7;
  *(unsigned char *)(a1 + 57) = *(unsigned char *)(a2 + 57);
  *(unsigned char *)(a1 + 58) = *(unsigned char *)(a2 + 58);
  uint64_t v8 = *(int *)(a3 + 40);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  uint64_t v11 = sub_1000130F0();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v12 + 48);
  int v14 = v13(v9, 1, v11);
  int v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (!v15)
    {
      (*(void (**)(void *, void *, uint64_t))(v12 + 24))(v9, v10, v11);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v12 + 8))(v9, v11);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    uint64_t v16 = sub_100008200(&qword_10001DE10);
    memcpy(v9, v10, *(void *)(*(void *)(v16 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v12 + 16))(v9, v10, v11);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  return a1;
}

uint64_t sub_100011FBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_WORD *)(a1 + 56) = *(_WORD *)(a2 + 56);
  uint64_t v5 = *(int *)(a3 + 40);
  uint64_t v6 = (const void *)(a2 + v5);
  uint64_t v7 = (void *)(a1 + v5);
  *(unsigned char *)(a1 + 58) = *(unsigned char *)(a2 + 58);
  uint64_t v8 = sub_1000130F0();
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8))
  {
    uint64_t v10 = sub_100008200(&qword_10001DE10);
    memcpy(v7, v6, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v9 + 32))(v7, v6, v8);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
  }
  return a1;
}

uint64_t sub_1000120F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  __int16 v8 = *(_WORD *)(a2 + 57);
  uint64_t v9 = *(int *)(a3 + 40);
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (void *)(a2 + v9);
  *(_WORD *)(a1 + 57) = v8;
  uint64_t v12 = sub_1000130F0();
  uint64_t v13 = *(void *)(v12 - 8);
  int v14 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v13 + 48);
  int v15 = v14(v10, 1, v12);
  int v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(void *, void *, uint64_t))(v13 + 40))(v10, v11, v12);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v13 + 8))(v10, v12);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    uint64_t v17 = sub_100008200(&qword_10001DE10);
    memcpy(v10, v11, *(void *)(*(void *)(v17 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v13 + 32))(v10, v11, v12);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  return a1;
}

uint64_t sub_1000122B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000122CC);
}

uint64_t sub_1000122CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
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
    uint64_t v9 = sub_100008200(&qword_10001DE10);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48);
    uint64_t v11 = v9;
    uint64_t v12 = a1 + *(int *)(a3 + 40);
    return v10(v12, a2, v11);
  }
}

uint64_t sub_10001238C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000123A0);
}

uint64_t sub_1000123A0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 8) = a2;
  }
  else
  {
    uint64_t v7 = sub_100008200(&qword_10001DE10);
    __int16 v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 40);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_10001244C()
{
  sub_10001102C();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_1000124FC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PodcastsURLEpisodeParameters(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100012558(uint64_t a1)
{
  uint64_t v2 = sub_100008200(&qword_10001DE10);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000125B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100008200(&qword_10001DE10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

char *sub_100012620(uint64_t a1)
{
  sub_100008200(&qword_10001DE10);
  ((void (*)(void))__chkstk_darwin)();
  unint64_t v69 = (char *)&v57 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1000130F0();
  uint64_t v4 = *(void *)(v3 - 8);
  ((void (*)(void))__chkstk_darwin)();
  unint64_t v64 = (char *)&v57 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = sub_100013040();
  uint64_t v6 = *(void *)(v67 - 8);
  uint64_t v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v9 = (char *)&v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v7);
  v66 = (char *)&v57 - v11;
  uint64_t v12 = __chkstk_darwin(v10);
  unint64_t v65 = (char *)&v57 - v13;
  uint64_t v14 = __chkstk_darwin(v12);
  int v16 = (char *)&v57 - v15;
  uint64_t v17 = __chkstk_darwin(v14);
  uint64_t v19 = (char *)&v57 - v18;
  uint64_t v20 = __chkstk_darwin(v17);
  uint64_t v22 = (char *)&v57 - v21;
  __chkstk_darwin(v20);
  uint64_t v24 = (char *)&v57 - v23;
  if (*(void *)(a1 + 8))
  {
    uint64_t v68 = a1;
    if (qword_10001D2C8 != -1) {
      swift_once();
    }
    sub_100013030();
    uint64_t v25 = (char *)sub_10000B79C(0, 1, 1, (unint64_t)&_swiftEmptyArrayStorage);
    unint64_t v27 = *((void *)v25 + 2);
    unint64_t v26 = *((void *)v25 + 3);
    uint64_t v62 = v4;
    uint64_t v63 = v3;
    uint64_t v61 = v9;
    if (v27 >= v26 >> 1) {
      uint64_t v25 = (char *)sub_10000B79C(v26 > 1, v27 + 1, 1, (unint64_t)v25);
    }
    *((void *)v25 + 2) = v27 + 1;
    uint64_t v28 = v6;
    uint64_t v29 = v6 + 32;
    double v30 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
    unint64_t v31 = (*(unsigned __int8 *)(v29 + 48) + 32) & ~(unint64_t)*(unsigned __int8 *)(v29 + 48);
    uint64_t v32 = *(void *)(v29 + 40);
    uint64_t v33 = v24;
    uint64_t v34 = v67;
    v30(&v25[v31 + v32 * v27], v33, v67);
    uint64_t v35 = v68;
    if (*(void *)(v68 + 24))
    {
      if (qword_10001D2D0 != -1) {
        swift_once();
      }
      sub_100013030();
      unint64_t v37 = *((void *)v25 + 2);
      unint64_t v36 = *((void *)v25 + 3);
      if (v37 >= v36 >> 1) {
        uint64_t v25 = (char *)sub_10000B79C(v36 > 1, v37 + 1, 1, (unint64_t)v25);
      }
      *((void *)v25 + 2) = v37 + 1;
      v30(&v25[v31 + v37 * v32], v22, v34);
      uint64_t v4 = v62;
      uint64_t v3 = v63;
      uint64_t v6 = v28;
      uint64_t v9 = v61;
LABEL_12:
      uint64_t v35 = v68;
      goto LABEL_22;
    }
    uint64_t v4 = v62;
    uint64_t v3 = v63;
    uint64_t v6 = v28;
    uint64_t v9 = v61;
  }
  else if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v25 = (char *)&_swiftEmptyArrayStorage;
    uint64_t v34 = v67;
    uint64_t v35 = a1;
  }
  else
  {
    uint64_t v60 = v6;
    uint64_t v68 = a1;
    uint64_t v38 = *(void *)(a1 + 32);
    if (qword_10001D2D8 != -1) {
      swift_once();
    }
    uint64_t v70 = v38;
    sub_100013340();
    sub_100013030();
    swift_bridgeObjectRelease();
    uint64_t v25 = (char *)sub_10000B79C(0, 1, 1, (unint64_t)&_swiftEmptyArrayStorage);
    unint64_t v40 = *((void *)v25 + 2);
    unint64_t v39 = *((void *)v25 + 3);
    if (v40 >= v39 >> 1) {
      uint64_t v25 = (char *)sub_10000B79C(v39 > 1, v40 + 1, 1, (unint64_t)v25);
    }
    uint64_t v34 = v67;
    *((void *)v25 + 2) = v40 + 1;
    uint64_t v41 = *(void (**)(char *, char *, uint64_t))(v60 + 32);
    unint64_t v59 = (*(unsigned __int8 *)(v60 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v60 + 80);
    uint64_t v58 = *(void *)(v60 + 72);
    v41(&v25[v59 + v58 * v40], v19, v34);
    if ((*(unsigned char *)(v68 + 56) & 1) == 0)
    {
      uint64_t v57 = v41;
      uint64_t v54 = *(void *)(v68 + 48);
      if (qword_10001D2E0 != -1) {
        swift_once();
      }
      uint64_t v70 = v54;
      sub_100013340();
      sub_100013030();
      swift_bridgeObjectRelease();
      unint64_t v56 = *((void *)v25 + 2);
      unint64_t v55 = *((void *)v25 + 3);
      uint64_t v6 = v60;
      if (v56 >= v55 >> 1) {
        uint64_t v25 = (char *)sub_10000B79C(v55 > 1, v56 + 1, 1, (unint64_t)v25);
      }
      uint64_t v34 = v67;
      *((void *)v25 + 2) = v56 + 1;
      v57(&v25[v59 + v56 * v58], v16, v34);
      goto LABEL_12;
    }
    uint64_t v6 = v60;
    uint64_t v35 = v68;
  }
LABEL_22:
  if (*(unsigned char *)(v35 + 57) != 2)
  {
    if (qword_10001D2E8 != -1) {
      swift_once();
    }
    sub_100013030();
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v25 = (char *)sub_10000B79C(0, *((void *)v25 + 2) + 1, 1, (unint64_t)v25);
    }
    unint64_t v43 = *((void *)v25 + 2);
    unint64_t v42 = *((void *)v25 + 3);
    if (v43 >= v42 >> 1) {
      uint64_t v25 = (char *)sub_10000B79C(v42 > 1, v43 + 1, 1, (unint64_t)v25);
    }
    *((void *)v25 + 2) = v43 + 1;
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(&v25[((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(void *)(v6 + 72) * v43], v65, v34);
  }
  uint64_t v44 = (uint64_t)v69;
  if (*(unsigned char *)(v35 + 58))
  {
    if (qword_10001D2F0 != -1) {
      swift_once();
    }
    if (qword_10001D2F8 != -1) {
      swift_once();
    }
    sub_100013030();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v25 = (char *)sub_10000B79C(0, *((void *)v25 + 2) + 1, 1, (unint64_t)v25);
    }
    unint64_t v46 = *((void *)v25 + 2);
    unint64_t v45 = *((void *)v25 + 3);
    if (v46 >= v45 >> 1) {
      uint64_t v25 = (char *)sub_10000B79C(v45 > 1, v46 + 1, 1, (unint64_t)v25);
    }
    *((void *)v25 + 2) = v46 + 1;
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(&v25[((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(void *)(v6 + 72) * v46], v66, v34);
    uint64_t v44 = (uint64_t)v69;
  }
  uint64_t v47 = type metadata accessor for PodcastsURLEpisodeParameters(0);
  sub_1000125B8(v35 + *(int *)(v47 + 40), v44);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v44, 1, v3) == 1)
  {
    sub_100012558(v44);
  }
  else
  {
    uint64_t v48 = v6;
    uint64_t v49 = v64;
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 32))(v64, v44, v3);
    sub_1000130E0();
    if (v50)
    {
      if (qword_10001D300 != -1) {
        swift_once();
      }
      sub_100013030();
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v25 = (char *)sub_10000B79C(0, *((void *)v25 + 2) + 1, 1, (unint64_t)v25);
      }
      unint64_t v52 = *((void *)v25 + 2);
      unint64_t v51 = *((void *)v25 + 3);
      if (v52 >= v51 >> 1) {
        uint64_t v25 = (char *)sub_10000B79C(v51 > 1, v52 + 1, 1, (unint64_t)v25);
      }
      *((void *)v25 + 2) = v52 + 1;
      (*(void (**)(char *, char *, uint64_t))(v48 + 32))(&v25[((*(unsigned __int8 *)(v48 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v48 + 80))+ *(void *)(v48 + 72) * v52], v9, v34);
    }
    (*(void (**)(char *, uint64_t))(v4 + 8))(v49, v3);
  }
  return v25;
}

uint64_t sub_100013030()
{
  return URLQueryItem.init(name:value:)();
}

uint64_t sub_100013040()
{
  return type metadata accessor for URLQueryItem();
}

uint64_t sub_100013050()
{
  return URLComponents.queryItems.setter();
}

uint64_t sub_100013060()
{
  return URLComponents.url.getter();
}

uint64_t sub_100013070()
{
  return URLComponents.host.setter();
}

uint64_t sub_100013080()
{
  return URLComponents.scheme.setter();
}

uint64_t sub_100013090()
{
  return URLComponents.init()();
}

uint64_t sub_1000130A0()
{
  return type metadata accessor for URLComponents();
}

uint64_t sub_1000130B0()
{
  return _convertErrorToNSError(_:)();
}

void sub_1000130C0(NSURL *retstr@<X8>)
{
}

uint64_t sub_1000130D0()
{
  return type metadata accessor for URL();
}

uint64_t sub_1000130E0()
{
  return MetricsWidgetContext.encodeToString()().value._countAndFlagsBits;
}

uint64_t sub_1000130F0()
{
  return type metadata accessor for MetricsWidgetContext();
}

uint64_t sub_100013100()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_100013110()
{
  return Logger.logObject.getter();
}

uint64_t sub_100013120()
{
  return type metadata accessor for Logger();
}

NSString sub_100013130()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100013140()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100013150()
{
  return String.init<A>(describing:)();
}

uint64_t sub_100013160()
{
  return static String._uncheckedFromUTF8(_:)();
}

Swift::Int sub_100013170()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100013180()
{
  return String.UTF8View._foreignIndex(after:)();
}

uint64_t sub_100013190()
{
  return String.UTF8View._foreignIndex(_:offsetBy:)();
}

uint64_t sub_1000131B0()
{
  return String.UTF8View._foreignSubscript(position:)();
}

uint64_t sub_1000131C0()
{
  return String.UTF16View.index(_:offsetBy:)();
}

uint64_t sub_1000131D0()
{
  return String.init<A>(_:)();
}

uint64_t sub_1000131E0()
{
  return String.subscript.getter();
}

uint64_t sub_1000131F0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100013200()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_100013210()
{
  return NSPredicate.init(format:_:)();
}

uint64_t sub_100013220()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100013230()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100013240()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_100013250()
{
  return NSManagedObjectContext.fetch<A>(_:)();
}

uint64_t sub_100013260()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_100013270()
{
  return static OS_os_log.default.getter();
}

uint64_t sub_100013280()
{
  return static OS_os_log.classKit.getter();
}

uint64_t sub_100013290()
{
  return type metadata accessor for Optional();
}

uint64_t sub_1000132A0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_1000132B0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_1000132C0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_1000132D0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_1000132E0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_1000132F0()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_100013300()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100013310()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100013320()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_100013330(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t sub_100013340()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_100013350()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100013360()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_100013370()
{
  return Error._code.getter();
}

uint64_t sub_100013380()
{
  return Error._domain.getter();
}

uint64_t sub_100013390()
{
  return Error._userInfo.getter();
}

uint64_t sub_1000133A0()
{
  return Hasher.init(_seed:)();
}

void sub_1000133B0(Swift::UInt a1)
{
}

Swift::Int sub_1000133C0()
{
  return Hasher._finalize()();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t NSPersistentStringForMTDisplayType()
{
  return _NSPersistentStringForMTDisplayType();
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

uint64_t _MTLogCategoryDatabase()
{
  return __MTLogCategoryDatabase();
}

uint64_t _MTLogCategoryDefault()
{
  return __MTLogCategoryDefault();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

uint64_t objc_opt_class()
{
  return _objc_opt_class();
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

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
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

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
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

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_AND_(void *a1, const char *a2, ...)
{
  return [a1 AND:];
}

id objc_msgSend__fetchRequestForDistinctSeasons(void *a1, const char *a2, ...)
{
  return _[a1 _fetchRequestForDistinctSeasons];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _[a1 absoluteString];
}

id objc_msgSend_adamID(void *a1, const char *a2, ...)
{
  return _[a1 adamID];
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return [a1 addObjectsFromArray:];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_applyShowTypeSetting_(void *a1, const char *a2, ...)
{
  return [a1 applyShowTypeSetting:];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:count:];
}

id objc_msgSend_author(void *a1, const char *a2, ...)
{
  return _[a1 author];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_databaseID(void *a1, const char *a2, ...)
{
  return _[a1 databaseID];
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return [a1 dateWithTimeIntervalSinceReferenceDate:];
}

id objc_msgSend_didChangeValueForKey_(void *a1, const char *a2, ...)
{
  return [a1 didChangeValueForKey:];
}

id objc_msgSend_episodeForUuid_(void *a1, const char *a2, ...)
{
  return [a1 episodeForUuid:];
}

id objc_msgSend_episodeUuid(void *a1, const char *a2, ...)
{
  return _[a1 episodeUuid];
}

id objc_msgSend_executeFetchRequest_error_(void *a1, const char *a2, ...)
{
  return [a1 executeFetchRequest:error:];
}

id objc_msgSend_feedChangedDate(void *a1, const char *a2, ...)
{
  return _[a1 feedChangedDate];
}

id objc_msgSend_feedURL(void *a1, const char *a2, ...)
{
  return _[a1 feedURL];
}

id objc_msgSend_fetchRequestWithEntityName_(void *a1, const char *a2, ...)
{
  return [a1 fetchRequestWithEntityName:];
}

id objc_msgSend_findEpisodeWithRequest_(void *a1, const char *a2, ...)
{
  return [a1 findEpisodeWithRequest:];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_flags(void *a1, const char *a2, ...)
{
  return _[a1 flags];
}

id objc_msgSend_hasHTML(void *a1, const char *a2, ...)
{
  return _[a1 hasHTML];
}

id objc_msgSend_identifiers(void *a1, const char *a2, ...)
{
  return _[a1 identifiers];
}

id objc_msgSend_imageURL(void *a1, const char *a2, ...)
{
  return _[a1 imageURL];
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return [a1 initWithArray:];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_isSerialShowTypeInFeed(void *a1, const char *a2, ...)
{
  return _[a1 isSerialShowTypeInFeed];
}

id objc_msgSend_isValidShowTypeSetting_(void *a1, const char *a2, ...)
{
  return [a1 isValidShowTypeSetting:];
}

id objc_msgSend_itemDescription(void *a1, const char *a2, ...)
{
  return _[a1 itemDescription];
}

id objc_msgSend_lastDatePlayed(void *a1, const char *a2, ...)
{
  return _[a1 lastDatePlayed];
}

id objc_msgSend_lastImplicitlyFollowedDate(void *a1, const char *a2, ...)
{
  return _[a1 lastImplicitlyFollowedDate];
}

id objc_msgSend_latestSeasonNumber(void *a1, const char *a2, ...)
{
  return _[a1 latestSeasonNumber];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_lenientSharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 lenientSharedInstance];
}

id objc_msgSend_library(void *a1, const char *a2, ...)
{
  return _[a1 library];
}

id objc_msgSend_listenNowEpisode(void *a1, const char *a2, ...)
{
  return _[a1 listenNowEpisode];
}

id objc_msgSend_logAndThrow_(void *a1, const char *a2, ...)
{
  return [a1 logAndThrow:];
}

id objc_msgSend_managedObjectContext(void *a1, const char *a2, ...)
{
  return _[a1 managedObjectContext];
}

id objc_msgSend_markPlaylistsForUpdate(void *a1, const char *a2, ...)
{
  return _[a1 markPlaylistsForUpdate];
}

id objc_msgSend_markSubscriptionSyncDirty_for_(void *a1, const char *a2, ...)
{
  return [a1 markSubscriptionSyncDirty:for:];
}

id objc_msgSend_modifiedDate(void *a1, const char *a2, ...)
{
  return _[a1 modifiedDate];
}

id objc_msgSend_mt_compactMap_(void *a1, const char *a2, ...)
{
  return [a1 mt_compactMap:];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_needsUpdate(void *a1, const char *a2, ...)
{
  return _[a1 needsUpdate];
}

id objc_msgSend_newestEpisodeWithFilter_(void *a1, const char *a2, ...)
{
  return [a1 newestEpisodeWithFilter:];
}

id objc_msgSend_nextEpisodeUuid(void *a1, const char *a2, ...)
{
  return _[a1 nextEpisodeUuid];
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return [a1 numberWithDouble:];
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithLongLong:];
}

id objc_msgSend_objectsInEntity_predicate_sortDescriptors_returnsObjectsAsFaults_limit_(void *a1, const char *a2, ...)
{
  return [a1 objectsInEntity:predicate:sortDescriptors:returnsObjectsAsFaults:limit:];
}

id objc_msgSend_performBlockAndWait_(void *a1, const char *a2, ...)
{
  return [a1 performBlockAndWait:];
}

id objc_msgSend_persistentID(void *a1, const char *a2, ...)
{
  return _[a1 persistentID];
}

id objc_msgSend_playbackNewestToOldest(void *a1, const char *a2, ...)
{
  return _[a1 playbackNewestToOldest];
}

id objc_msgSend_playlist(void *a1, const char *a2, ...)
{
  return _[a1 playlist];
}

id objc_msgSend_playlistIfDefault(void *a1, const char *a2, ...)
{
  return _[a1 playlistIfDefault];
}

id objc_msgSend_playlistSettings(void *a1, const char *a2, ...)
{
  return _[a1 playlistSettings];
}

id objc_msgSend_podcast(void *a1, const char *a2, ...)
{
  return _[a1 podcast];
}

id objc_msgSend_podcastForFeedUrl_(void *a1, const char *a2, ...)
{
  return [a1 podcastForFeedUrl:];
}

id objc_msgSend_podcastUuidForFeedUrlString_ctx_(void *a1, const char *a2, ...)
{
  return [a1 podcastUuidForFeedUrlString:ctx:];
}

id objc_msgSend_predicateForEpisodeType_(void *a1, const char *a2, ...)
{
  return [a1 predicateForEpisodeType:];
}

id objc_msgSend_predicateForEpisodesWithSeasonNumbersOnPodcastUuid_(void *a1, const char *a2, ...)
{
  return [a1 predicateForEpisodesWithSeasonNumbersOnPodcastUuid:];
}

id objc_msgSend_predicateForNotHiddenNotImplicitlyFollowedPodcasts(void *a1, const char *a2, ...)
{
  return _[a1 predicateForNotHiddenNotImplicitlyFollowedPodcasts];
}

id objc_msgSend_predicateForPodcast_(void *a1, const char *a2, ...)
{
  return [a1 predicateForPodcast:];
}

id objc_msgSend_predicateForSeasonNumberWithNoEpisodeNumber_(void *a1, const char *a2, ...)
{
  return [a1 predicateForSeasonNumberWithNoEpisodeNumber];
}

id objc_msgSend_predicateForSubscriptionSyncType_(void *a1, const char *a2, ...)
{
  return [a1 predicateForSubscriptionSyncType:];
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 predicateWithFormat:];
}

id objc_msgSend_saveInCurrentBlock(void *a1, const char *a2, ...)
{
  return _[a1 saveInCurrentBlock];
}

id objc_msgSend_seasonNumbers(void *a1, const char *a2, ...)
{
  return _[a1 seasonNumbers];
}

id objc_msgSend_seasonSortDescriptorsForSortOrder(void *a1, const char *a2, ...)
{
  return _[a1 seasonSortDescriptorsForSortOrder];
}

id objc_msgSend_seasonTrailerInSeason_(void *a1, const char *a2, ...)
{
  return [a1 seasonTrailerInSeason:];
}

id objc_msgSend_setEpisodeGuid_(void *a1, const char *a2, ...)
{
  return [a1 setEpisodeGuid:];
}

id objc_msgSend_setEpisodeTitle_(void *a1, const char *a2, ...)
{
  return [a1 setEpisodeTitle:];
}

id objc_msgSend_setExcludeUnentitled_(void *a1, const char *a2, ...)
{
  return [a1 setExcludeUnentitled:];
}

id objc_msgSend_setFetchLimit_(void *a1, const char *a2, ...)
{
  return [a1 setFetchLimit:];
}

id objc_msgSend_setFlags_(void *a1, const char *a2, ...)
{
  return [a1 setFlags:];
}

id objc_msgSend_setListenNowEpisode_(void *a1, const char *a2, ...)
{
  return [a1 setListenNowEpisode:];
}

id objc_msgSend_setModifiedDate_(void *a1, const char *a2, ...)
{
  return [a1 setModifiedDate:];
}

id objc_msgSend_setNeedsUpdate_(void *a1, const char *a2, ...)
{
  return [a1 setNeedsUpdate:];
}

id objc_msgSend_setPersistentID_(void *a1, const char *a2, ...)
{
  return [a1 setPersistentID:];
}

id objc_msgSend_setPodcastFeedUrl_(void *a1, const char *a2, ...)
{
  return [a1 setPodcastFeedUrl:];
}

id objc_msgSend_setPodcastTitle_(void *a1, const char *a2, ...)
{
  return [a1 setPodcastTitle:];
}

id objc_msgSend_setPredicate_(void *a1, const char *a2, ...)
{
  return [a1 setPredicate:];
}

id objc_msgSend_setPrimitiveValue_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setPrimitiveValue:forKey:];
}

id objc_msgSend_setPropertiesToFetch_(void *a1, const char *a2, ...)
{
  return [a1 setPropertiesToFetch:];
}

id objc_msgSend_setResultType_(void *a1, const char *a2, ...)
{
  return [a1 setResultType:];
}

id objc_msgSend_setReturnsDistinctResults_(void *a1, const char *a2, ...)
{
  return [a1 setReturnsDistinctResults:];
}

id objc_msgSend_setSortAscending_(void *a1, const char *a2, ...)
{
  return [a1 setSortAscending:];
}

id objc_msgSend_setSortDescriptors_(void *a1, const char *a2, ...)
{
  return [a1 setSortDescriptors:];
}

id objc_msgSend_setStoreTrackId_(void *a1, const char *a2, ...)
{
  return [a1 setStoreTrackId:];
}

id objc_msgSend_setStreamUrl_(void *a1, const char *a2, ...)
{
  return [a1 setStreamUrl:];
}

id objc_msgSend_setUuid_(void *a1, const char *a2, ...)
{
  return [a1 setUuid:];
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return [a1 setWithArray:];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return _[a1 shared];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_showTypeInFeed(void *a1, const char *a2, ...)
{
  return _[a1 showTypeInFeed];
}

id objc_msgSend_showTypeSetting(void *a1, const char *a2, ...)
{
  return _[a1 showTypeSetting];
}

id objc_msgSend_sortAscending(void *a1, const char *a2, ...)
{
  return _[a1 sortAscending];
}

id objc_msgSend_sortDescriptorWithKey_ascending_(void *a1, const char *a2, ...)
{
  return [a1 sortDescriptorWithKey:ascending:];
}

id objc_msgSend_sortDescriptorWithKey_ascending_selector_(void *a1, const char *a2, ...)
{
  return [a1 sortDescriptorWithKey:ascending:selector:];
}

id objc_msgSend_sortDescriptorsForPlayOrderByEpisodeNumber(void *a1, const char *a2, ...)
{
  return _[a1 sortDescriptorsForPlayOrderByEpisodeNumber];
}

id objc_msgSend_sortDescriptorsForPlayOrderByPubDate(void *a1, const char *a2, ...)
{
  return _[a1 sortDescriptorsForPlayOrderByPubDate];
}

id objc_msgSend_sortDescriptorsForPubDateAscending_(void *a1, const char *a2, ...)
{
  return [a1 sortDescriptorsForPubDateAscending];
}

id objc_msgSend_sortOrderAscForShowType_(void *a1, const char *a2, ...)
{
  return [a1 sortOrderAscForShowType:];
}

id objc_msgSend_storeCollectionId(void *a1, const char *a2, ...)
{
  return _[a1 storeCollectionId];
}

id objc_msgSend_streamURL(void *a1, const char *a2, ...)
{
  return _[a1 streamURL];
}

id objc_msgSend_stringBySmartlyStrippingHTML(void *a1, const char *a2, ...)
{
  return _[a1 stringBySmartlyStrippingHTML];
}

id objc_msgSend_subscribed(void *a1, const char *a2, ...)
{
  return _[a1 subscribed];
}

id objc_msgSend_syncType(void *a1, const char *a2, ...)
{
  return _[a1 syncType];
}

id objc_msgSend_timestampBoundByNow_(void *a1, const char *a2, ...)
{
  return [a1 timestampBoundByNow];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _[a1 title];
}

id objc_msgSend_universalStore(void *a1, const char *a2, ...)
{
  return _[a1 universalStore];
}

id objc_msgSend_upNextForPodcastUuid_excludeExplicit_ctx_(void *a1, const char *a2, ...)
{
  return [a1 upNextForPodcastUuid:excludeExplicit:ctx:];
}

id objc_msgSend_updateAvg(void *a1, const char *a2, ...)
{
  return _[a1 updateAvg];
}

id objc_msgSend_updateStdDev(void *a1, const char *a2, ...)
{
  return _[a1 updateStdDev];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return _[a1 uuid];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return [a1 valueForKey:];
}

id objc_msgSend_vendorID(void *a1, const char *a2, ...)
{
  return _[a1 vendorID];
}

id objc_msgSend_webpageURL(void *a1, const char *a2, ...)
{
  return _[a1 webpageURL];
}

id objc_msgSend_willChangeValueForKey_(void *a1, const char *a2, ...)
{
  return [a1 willChangeValueForKey:];
}