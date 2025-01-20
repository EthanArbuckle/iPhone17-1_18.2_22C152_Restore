uint64_t sub_100003010()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);
  uint64_t vars8;

  v0 = sub_1000355A0();
  sub_10000A434(v0, qword_100046048);
  v1 = sub_100009FEC(v0, (uint64_t)qword_100046048);
  if (qword_1000460A0 != -1) {
    swift_once();
  }
  v2 = sub_100009FEC(v0, (uint64_t)qword_1000472B0);
  v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

void sub_1000032D4(unint64_t a1, void (*a2)(NSObject *))
{
  if (qword_100046040 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_1000355A0();
  sub_100009FEC(v5, (uint64_t)qword_100046048);
  swift_bridgeObjectRetain_n();
  v6 = sub_100035590();
  LOBYTE(v7) = sub_1000357C0();
  unint64_t v8 = a1 >> 62;
  if (!os_log_type_enabled(v6, (os_log_type_t)v7))
  {

    swift_bridgeObjectRelease_n();
    goto LABEL_8;
  }
  v2 = (uint8_t *)swift_slowAlloc();
  *(_DWORD *)v2 = 134217984;
  if (v8) {
    goto LABEL_33;
  }
  uint64_t v9 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    swift_bridgeObjectRelease();
    v26 = (void *)v9;
    sub_1000359B0();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, (os_log_type_t)v7, "Search dataSource returned %ld reminders", v2, 0xCu);
    swift_slowDealloc();

LABEL_8:
    if (v8)
    {
      swift_bridgeObjectRetain();
      uint64_t v10 = sub_100035C00();
      swift_bridgeObjectRelease();
      if (v10 <= 9)
      {
LABEL_10:
        sub_10000A498(0, &qword_100046318);
        a1 = sub_1000358E0();
        goto LABEL_13;
      }
    }
    else if (*(uint64_t *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10) <= 9)
    {
      goto LABEL_10;
    }
    swift_bridgeObjectRetain();
LABEL_13:
    if (a1 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v7 = sub_100035C00();
      swift_bridgeObjectRelease();
      if (!v7) {
        goto LABEL_24;
      }
    }
    else
    {
      uint64_t v7 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (!v7) {
        goto LABEL_24;
      }
    }
    v26 = &_swiftEmptyArrayStorage;
    v6 = &v26;
    sub_100035B00();
    if ((v7 & 0x8000000000000000) == 0) {
      break;
    }
    __break(1u);
LABEL_33:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_100035C00();
    swift_bridgeObjectRelease();
  }
  sub_10000A498(0, &qword_100046318);
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v11 = 0;
    do
    {
      uint64_t v12 = v11 + 1;
      sub_100035AB0();
      sub_1000358F0();
      sub_100035AE0();
      sub_100035B10();
      sub_100035B20();
      sub_100035AF0();
      uint64_t v11 = v12;
    }
    while (v7 != v12);
  }
  else
  {
    v13 = (void **)(a1 + 32);
    do
    {
      v14 = *v13++;
      id v15 = v14;
      sub_1000358F0();
      sub_100035AE0();
      sub_100035B10();
      sub_100035B20();
      sub_100035AF0();
      --v7;
    }
    while (v7);
  }
LABEL_24:
  swift_bridgeObjectRelease();
  id v16 = [objc_allocWithZone((Class)INSearchForNotebookItemsIntentResponse) initWithCode:3 userActivity:0];
  sub_10000A498(0, &qword_100046318);
  Class isa = sub_1000356B0().super.isa;
  swift_bridgeObjectRelease();
  [v16 setTasks:isa];

  v18 = v16;
  v19 = sub_100035590();
  os_log_type_t v20 = sub_1000357C0();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v21 = 134217984;
    id v22 = [v18 tasks];
    if (v22)
    {
      v23 = v22;
      unint64_t v24 = sub_1000356C0();

      if (v24 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v25 = sub_100035C00();

        swift_bridgeObjectRelease_n();
      }
      else
      {
        uint64_t v25 = *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10);

        swift_bridgeObjectRelease();
      }
    }
    else
    {

      uint64_t v25 = -1;
    }
    v26 = (void *)v25;
    sub_1000359B0();

    _os_log_impl((void *)&_mh_execute_header, v19, v20, "Return success search result {tasksCount: %ld}", v21, 0xCu);
    swift_slowDealloc();
  }
  else
  {

    v19 = v18;
  }

  a2(v18);
}

void sub_1000037F8(uint64_t a1, void *a2, void (*a3)(NSObject *))
{
  unint64_t v5 = sub_100035310();
  unint64_t v6 = sub_1000352F0();
  if (qword_100046040 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_1000355A0();
  sub_100009FEC(v7, (uint64_t)qword_100046048);
  swift_bridgeObjectRetain_n();
  unint64_t v8 = sub_100035590();
  os_log_type_t v9 = sub_1000357C0();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 134217984;
    if (v5 >> 62)
    {
      swift_bridgeObjectRetain();
      sub_100035C00();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    sub_1000359B0();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Search dataSource returned %ld lists", v10, 0xCu);
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  uint64_t v11 = sub_100035590();
  os_log_type_t v12 = sub_1000357C0();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v13 = 134217984;
    if (v6 >> 62)
    {
      swift_bridgeObjectRetain();
      sub_100035C00();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    sub_1000359B0();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Search dataSource returned %ld smartLists", v13, 0xCu);
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  id v14 = a2;
  id v15 = sub_10000A2C0(v5, (uint64_t)v14, (uint64_t)v28, (void (*)(uint64_t *__return_ptr, id *, uint64_t))sub_100003CF8);
  swift_bridgeObjectRelease();

  id v16 = v14;
  v17 = sub_10000A2C0(v6, (uint64_t)v16, (uint64_t)v27, (void (*)(uint64_t *__return_ptr, id *, uint64_t))sub_1000041A0);
  swift_bridgeObjectRelease();

  id v18 = [objc_allocWithZone((Class)INSearchForNotebookItemsIntentResponse) initWithCode:3 userActivity:0];
  sub_10000E290((unint64_t)v17);
  sub_10000A498(0, (unint64_t *)&unk_100046320);
  Class isa = sub_1000356B0().super.isa;
  swift_bridgeObjectRelease();
  [v18 setTaskLists:isa, v15];

  os_log_type_t v20 = v18;
  v21 = sub_100035590();
  os_log_type_t v22 = sub_1000357C0();
  if (os_log_type_enabled(v21, v22))
  {
    v23 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v23 = 134217984;
    id v24 = [v20 taskLists];
    if (v24)
    {
      uint64_t v25 = v24;
      unint64_t v26 = sub_1000356C0();

      if (v26 >> 62)
      {
        swift_bridgeObjectRetain();
        sub_100035C00();

        swift_bridgeObjectRelease_n();
      }
      else
      {

        swift_bridgeObjectRelease();
      }
    }
    else
    {
    }
    sub_1000359B0();

    _os_log_impl((void *)&_mh_execute_header, v21, v22, "Return success search result {taskListsCount: %ld}", v23, 0xCu);
    swift_slowDealloc();
  }
  else
  {

    v21 = v20;
  }

  a3(v20);
}

uint64_t sub_100003CF8@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  v2 = *a1;
  sub_100009F5C(&qword_1000465B0);
  uint64_t v3 = sub_100035290();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 72);
  unint64_t v6 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_100038860;
  unint64_t v8 = (void *)(v7 + v6);
  os_log_type_t v9 = (char *)v8 + *(int *)(sub_100009F5C(&qword_100046330) + 48);
  *unint64_t v8 = [v2 objectID];
  uint64_t v10 = enum case for REMSearchCriterion.Inclusion.includeForSiri(_:);
  uint64_t v11 = sub_100035280();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 104))(v9, v10, v11);
  os_log_type_t v12 = *(void (**)(void))(v4 + 104);
  ((void (*)(void *, void, uint64_t))v12)(v8, enum case for REMSearchCriterion.listID(_:), v3);
  *((unsigned char *)v8 + v5) = 0;
  v12();
  sub_100035350();
  id v13 = [self defaultFetchOptions];
  sub_100035340();
  if (v27)
  {

    swift_bridgeObjectRelease();
    if (qword_100046040 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_1000355A0();
    sub_100009FEC(v14, (uint64_t)qword_100046048);
    swift_errorRetain();
    id v15 = v2;
    swift_errorRetain();
    id v16 = sub_100035590();
    os_log_type_t v17 = sub_1000357A0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = swift_slowAlloc();
      v19 = (void *)swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      *(_DWORD *)uint64_t v18 = 138412546;
      id v20 = [v15 objectID];
      sub_1000359B0();
      void *v19 = v20;

      *(_WORD *)(v18 + 12) = 2080;
      swift_getErrorValue();
      uint64_t v21 = sub_100035C90();
      sub_10003007C(v21, v22, &v29);
      sub_1000359B0();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "Error fetching reminders for list {listID: %@, error: %s", (uint8_t *)v18, 0x16u);
      sub_100009F5C((uint64_t *)&unk_1000462F0);
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

    sub_10000A498(0, (unint64_t *)&unk_100046320);
    id v26 = v15;
    uint64_t v25 = sub_100035750();
    uint64_t result = swift_errorRelease();
  }
  else
  {

    swift_bridgeObjectRelease();
    sub_10000A498(0, (unint64_t *)&unk_100046320);
    id v23 = v2;
    uint64_t result = sub_100035760();
    uint64_t v25 = result;
  }
  *a2 = v25;
  return result;
}

uint64_t sub_1000041A0@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = *a1;
  sub_100035350();
  sub_100035330();
  if (v2)
  {
    if (qword_100046040 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_1000355A0();
    sub_100009FEC(v5, (uint64_t)qword_100046048);
    swift_errorRetain();
    id v6 = v4;
    swift_errorRetain();
    uint64_t v7 = sub_100035590();
    os_log_type_t v8 = sub_1000357A0();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = (void *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      *(_DWORD *)uint64_t v9 = 138412546;
      uint64_t v18 = a2;
      id v11 = [v6 objectID];
      sub_1000359B0();
      *uint64_t v10 = v11;

      *(_WORD *)(v9 + 12) = 2080;
      swift_getErrorValue();
      uint64_t v12 = sub_100035C90();
      sub_10003007C(v12, v13, &v19);
      a2 = v18;
      sub_1000359B0();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Error fetching reminders for smartList {smartListID: %@, error: %s", (uint8_t *)v9, 0x16u);
      sub_100009F5C((uint64_t *)&unk_1000462F0);
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

    sub_10000A498(0, (unint64_t *)&unk_100046320);
    id v17 = v6;
    uint64_t v16 = sub_100035730();
    uint64_t result = swift_errorRelease();
  }
  else
  {
    sub_10000A498(0, (unint64_t *)&unk_100046320);
    id v14 = v4;
    uint64_t result = sub_100035730();
    uint64_t v16 = result;
  }
  *a2 = v16;
  return result;
}

void sub_1000044D8(void *a1, int a2, void *a3, void *aBlock, void (*a5)(id, id, void *))
{
  os_log_type_t v8 = _Block_copy(aBlock);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a1;
  a5(v9, v10, v8);
  _Block_release(v8);
  _Block_release(v8);
}

id sub_10000459C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TTRSearchForNotebookItemsIntentHandler();
  return [super dealloc];
}

id variable initialization expression of TTRIntentHandler.store()
{
  id v0 = objc_allocWithZone((Class)REMStore);

  return [v0 initUserInteractive:1];
}

uint64_t variable initialization expression of TTRIntentHandler.queue()
{
  return sub_100035820();
}

uint64_t variable initialization expression of TTRIntentHandler.$__lazy_storage_$_contactStore()
{
  return 0;
}

uint64_t type metadata accessor for TTRSearchForNotebookItemsIntentHandler()
{
  return self;
}

__n128 initializeWithTake for TTRContactRepresentationResolver(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_1000046F0(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100004710(uint64_t result, int a2, int a3)
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

void sub_10000474C(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_100004758(uint64_t a1, uint64_t a2)
{
  return sub_100004A6C(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100004770(uint64_t a1, id *a2)
{
  uint64_t result = sub_100035610();
  *a2 = 0;
  return result;
}

uint64_t sub_1000047E8(uint64_t a1, id *a2)
{
  char v3 = sub_100035620();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_100004868@<X0>(void *a1@<X8>)
{
  sub_100035630();
  NSString v2 = sub_100035600();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1000048AC()
{
  uint64_t v0 = sub_100035630();
  uint64_t v2 = v1;
  if (v0 == sub_100035630() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_100035C70();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

void *sub_100004938@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_100004948@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_100035600();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100004990@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100035630();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000049BC(uint64_t a1)
{
  uint64_t v2 = sub_10000A5FC(&qword_100046370);
  uint64_t v3 = sub_10000A5FC(&qword_100046378);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100004A54(uint64_t a1, uint64_t a2)
{
  return sub_100004A6C(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100004A6C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_100035630();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_100004AB0()
{
  sub_100035630();
  sub_100035670();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100004B04()
{
  sub_100035630();
  sub_100035CB0();
  sub_100035670();
  Swift::Int v0 = sub_100035CC0();
  swift_bridgeObjectRelease();
  return v0;
}

void sub_100004B78(void *a1, uint64_t a2, void (**a3)(void, void))
{
  uint64_t v5 = sub_1000355A0();
  uint64_t v22 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v25 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100046040 != -1) {
    swift_once();
  }
  uint64_t v23 = v5;
  uint64_t v7 = sub_100009FEC(v5, (uint64_t)qword_100046048);
  os_log_type_t v8 = a1;
  id v9 = sub_100035590();
  os_log_type_t v10 = sub_1000357C0();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v24 = v7;
    id v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    id v26 = a3;
    uint64_t v27 = v8;
    unint64_t v13 = (void *)v12;
    *(_DWORD *)id v11 = 138412290;
    id v14 = v8;
    uint64_t v7 = v24;
    sub_1000359B0();
    void *v13 = v8;

    _os_log_impl((void *)&_mh_execute_header, v9, v10, "SiriKit asked for resolving itemType {intent: %@}", v11, 0xCu);
    sub_100009F5C((uint64_t *)&unk_1000462F0);
    swift_arrayDestroy();
    a3 = v26;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  switch((unint64_t)[v8 itemType])
  {
    case 0uLL:
    case 3uLL:
      goto LABEL_7;
    case 1uLL:
      sub_10000A498(0, &qword_100046340);
      id v15 = [(id)swift_getObjCClassFromMetadata() unsupported];
      goto LABEL_9;
    case 2uLL:
      if (sub_100035890()) {
LABEL_7:
      }
        id v15 = [self successWithResolvedNotebookItemType:3];
      else {
        id v15 = [self successWithResolvedNotebookItemType:2];
      }
LABEL_9:
      uint64_t v16 = v15;
      id v17 = sub_100035590();
      os_log_type_t v18 = sub_1000357C0();
      if (os_log_type_enabled(v17, v18))
      {
        uint64_t v19 = (uint8_t *)swift_slowAlloc();
        id v20 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v19 = 138412290;
        uint64_t v27 = v16;
        uint64_t v21 = v16;
        sub_1000359B0();
        *id v20 = v16;

        _os_log_impl((void *)&_mh_execute_header, v17, v18, "Resolved itemType {result: %@}", v19, 0xCu);
        sub_100009F5C((uint64_t *)&unk_1000462F0);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        id v17 = v16;
      }

      ((void (**)(void, NSObject *))a3)[2](a3, v16);
      return;
    default:
      (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v25, v7, v23);
      sub_10001E58C((uint64_t)&_swiftEmptyArrayStorage);
      sub_10001E58C((uint64_t)&_swiftEmptyArrayStorage);
      _Block_release(a3);
      sub_10002AEDC((uint64_t)"unknown item type", 17, 2);
      __break(1u);
      JUMPOUT(0x100004FFCLL);
  }
}

uint64_t sub_10000500C(void *a1, char *a2, const void *a3)
{
  v597 = a2;
  uint64_t v570 = sub_100034FB0();
  uint64_t v569 = *(void *)(v570 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v568 = (char *)v526 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100009F5C(&qword_100046810);
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  v563 = (char *)v526 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  v564 = (char *)v526 - v9;
  uint64_t v10 = __chkstk_darwin(v8);
  v535 = (char *)v526 - v11;
  uint64_t v12 = __chkstk_darwin(v10);
  v536 = (char *)v526 - v13;
  uint64_t v14 = __chkstk_darwin(v12);
  v545 = (char *)v526 - v15;
  uint64_t v16 = __chkstk_darwin(v14);
  v544 = (char *)v526 - v17;
  __chkstk_darwin(v16);
  v555 = (char *)v526 - v18;
  v593 = (void *)sub_100034E30();
  uint64_t v607 = *(v593 - 1);
  uint64_t v19 = __chkstk_darwin(v593);
  v567 = (char *)v526 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __chkstk_darwin(v19);
  v556 = (char *)v526 - v22;
  __chkstk_darwin(v21);
  v554 = (char *)v526 - v23;
  uint64_t v592 = sub_100034F10();
  uint64_t v595 = *(void *)(v592 - 8);
  uint64_t v24 = __chkstk_darwin(v592);
  v562 = (char *)v526 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = __chkstk_darwin(v24);
  v559 = (char *)v526 - v27;
  uint64_t v28 = __chkstk_darwin(v26);
  v534 = (char *)v526 - v29;
  uint64_t v30 = __chkstk_darwin(v28);
  v580 = (char *)v526 - v31;
  uint64_t v32 = __chkstk_darwin(v30);
  v533 = (char *)v526 - v33;
  uint64_t v34 = __chkstk_darwin(v32);
  v589 = (char *)v526 - v35;
  uint64_t v36 = __chkstk_darwin(v34);
  v553 = (char *)v526 - v37;
  uint64_t v38 = __chkstk_darwin(v36);
  v605 = (char *)v526 - v39;
  __chkstk_darwin(v38);
  v596 = (char *)v526 - v40;
  uint64_t v41 = sub_100009F5C((uint64_t *)&unk_1000462B0);
  uint64_t v42 = __chkstk_darwin(v41 - 8);
  v552 = (char *)v526 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v42);
  v588 = (void (*)(void, void))((char *)v526 - v44);
  uint64_t v594 = sub_100034FC0();
  uint64_t v591 = *(void *)(v594 - 8);
  __chkstk_darwin(v594);
  v598 = (char *)v526 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = sub_100009F5C((uint64_t *)&unk_100046550);
  uint64_t v47 = __chkstk_darwin(v46 - 8);
  uint64_t v579 = (uint64_t)v526 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = __chkstk_darwin(v47);
  v585 = (char *)v526 - v50;
  uint64_t v51 = __chkstk_darwin(v49);
  uint64_t v551 = (uint64_t)v526 - v52;
  uint64_t v53 = __chkstk_darwin(v51);
  v587 = (void (*)(void, void))((char *)v526 - v54);
  uint64_t v55 = __chkstk_darwin(v53);
  uint64_t v578 = (uint64_t)v526 - v56;
  uint64_t v57 = __chkstk_darwin(v55);
  v576 = (char *)v526 - v58;
  uint64_t v59 = __chkstk_darwin(v57);
  uint64_t v577 = (uint64_t)v526 - v60;
  uint64_t v61 = __chkstk_darwin(v59);
  uint64_t v611 = (uint64_t)v526 - v62;
  uint64_t v63 = __chkstk_darwin(v61);
  v574 = (char *)v526 - v64;
  uint64_t v65 = __chkstk_darwin(v63);
  uint64_t v575 = (uint64_t)v526 - v66;
  __chkstk_darwin(v65);
  uint64_t v599 = (uint64_t)v526 - v67;
  uint64_t v543 = sub_100009F5C(&qword_1000462C0);
  uint64_t v68 = __chkstk_darwin(v543);
  uint64_t v590 = (uint64_t)v526 - ((v69 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = __chkstk_darwin(v68);
  v581 = (char *)v526 - v71;
  uint64_t v72 = __chkstk_darwin(v70);
  v74 = (BOOL *)v526 - v73;
  __chkstk_darwin(v72);
  v542 = (char *)v526 - v75;
  uint64_t v76 = sub_100009F5C(&qword_1000462C8);
  __chkstk_darwin(v76 - 8);
  v573 = (void (*)(BOOL *, uint64_t, uint64_t, uint64_t))((char *)v526 - ((v77 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v606 = sub_1000354C0();
  v601 = *(void (**)(void))(v606 - 8);
  uint64_t v78 = __chkstk_darwin(v606);
  v550 = (char *)v526 - ((v79 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = __chkstk_darwin(v78);
  v541 = (char *)v526 - v81;
  uint64_t v82 = __chkstk_darwin(v80);
  v547 = (char *)v526 - v83;
  __chkstk_darwin(v82);
  v586 = (char *)v526 - v84;
  uint64_t v85 = sub_100035290();
  uint64_t v610 = *(void *)(v85 - 8);
  uint64_t v86 = __chkstk_darwin(v85);
  v584 = (BOOL *)v526 - ((v87 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v88 = __chkstk_darwin(v86);
  v561 = (char *)v526 - v89;
  uint64_t v90 = __chkstk_darwin(v88);
  v560 = (char *)v526 - v91;
  uint64_t v92 = __chkstk_darwin(v90);
  v546 = (char *)v526 - v93;
  uint64_t v94 = __chkstk_darwin(v92);
  v583 = (char *)v526 - v95;
  uint64_t v96 = __chkstk_darwin(v94);
  v582 = (char *)v526 - v97;
  uint64_t v98 = __chkstk_darwin(v96);
  v571 = (char *)v526 - v99;
  uint64_t v100 = __chkstk_darwin(v98);
  v572 = (char *)v526 - v101;
  uint64_t v102 = __chkstk_darwin(v100);
  v532 = (char *)v526 - v103;
  uint64_t v104 = __chkstk_darwin(v102);
  v558 = (char *)v526 - v105;
  uint64_t v106 = __chkstk_darwin(v104);
  v557 = (char *)v526 - v107;
  uint64_t v108 = __chkstk_darwin(v106);
  v566 = (void *)((char *)v526 - v109);
  uint64_t v110 = __chkstk_darwin(v108);
  v609 = (BOOL *)v526 - v111;
  uint64_t v112 = __chkstk_darwin(v110);
  v548 = (void *)((char *)v526 - v113);
  uint64_t v114 = __chkstk_darwin(v112);
  v549 = (NSObject **)((char *)v526 - v115);
  uint64_t v116 = __chkstk_darwin(v114);
  v540 = (char *)v526 - v117;
  uint64_t v118 = __chkstk_darwin(v116);
  v603 = ((char *)v526 - v119);
  __chkstk_darwin(v118);
  v602 = (char *)v526 - v120;
  uint64_t v121 = sub_1000355A0();
  uint64_t v122 = *(void *)(v121 - 8);
  uint64_t v123 = __chkstk_darwin(v121);
  v125 = (char *)v526 - ((v124 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v126 = __chkstk_darwin(v123);
  v527 = (char *)v526 - v127;
  __chkstk_darwin(v126);
  v129 = (char *)v526 - v128;
  uint64_t v604 = swift_allocObject();
  *(void *)(v604 + 16) = a3;
  v565 = a3;
  _Block_copy(a3);
  if (qword_100046040 != -1) {
    swift_once();
  }
  uint64_t v130 = sub_100009FEC(v121, (uint64_t)qword_100046048);
  v131 = *(void (**)(void, void, void))(v122 + 16);
  uint64_t v529 = v122 + 16;
  v528 = (void (*)(char *, uint64_t, uint64_t))v131;
  v131(v129, v130, v121);
  sub_100009F5C(&qword_1000462D0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100038870;
  *(void *)(inited + 32) = 0x746E65746E69;
  *(void *)(inited + 40) = 0xE600000000000000;
  *(void *)(inited + 72) = sub_10000A498(0, &qword_1000462D8);
  *(void *)(inited + 48) = a1;
  id v133 = a1;
  sub_10001E58C(inited);
  sub_10002B160();
  swift_bridgeObjectRelease();
  v134 = *(void (**)(char *, uint64_t))(v122 + 8);
  uint64_t v530 = v121;
  v134(v129, v121);
  v135 = v133;
  uint64_t v600 = v130;
  v136 = sub_100035590();
  os_log_type_t v137 = sub_1000357C0();
  BOOL v138 = os_log_type_enabled(v136, v137);
  v612 = v74;
  uint64_t v613 = v85;
  v531 = v125;
  if (v138)
  {
    v139 = (uint8_t *)swift_slowAlloc();
    v140 = (void *)swift_slowAlloc();
    *(_DWORD *)v139 = 138412290;
    v618 = v135;
    v141 = v135;
    sub_1000359B0();
    void *v140 = v135;

    v74 = v612;
    _os_log_impl((void *)&_mh_execute_header, v136, v137, "SiriKit asked for handling search {intent: %@}", v139, 0xCu);
    sub_100009F5C((uint64_t *)&unk_1000462F0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    v136 = v135;
  }
  v142 = v135;

  v619 = &_swiftEmptyArrayStorage;
  v620 = &_swiftEmptyArrayStorage;
  id v143 = [v135 title];
  v144 = v143;
  if (v143)
  {
    id v145 = [v143 spokenPhrase];

    v144 = (void *)sub_100035630();
    uint64_t v147 = v146;
  }
  else
  {
    uint64_t v147 = 0;
  }
  id v148 = [v135 content];
  if (v148)
  {
    v149 = v148;
    uint64_t v150 = sub_100035630();
    uint64_t v152 = v151;
  }
  else
  {
    uint64_t v150 = 0;
    uint64_t v152 = 0;
  }
  v608 = v135;
  if (!(v147 | v152)) {
    goto LABEL_41;
  }
  sub_100009F5C(&qword_100046300);
  uint64_t v153 = swift_initStackObject();
  *(_OWORD *)(v153 + 16) = xmmword_100038860;
  *(void *)(v153 + 32) = v144;
  *(void *)(v153 + 40) = v147;
  *(void *)(v153 + 48) = v150;
  *(void *)(v153 + 56) = v152;
  if (!v147)
  {
    v154 = (char *)&_swiftEmptyArrayStorage;
    uint64_t v157 = v613;
    if (!v152) {
      goto LABEL_24;
    }
    goto LABEL_19;
  }
  swift_bridgeObjectRetain();
  v154 = sub_10002FCC8(0, 1, 1, (char *)&_swiftEmptyArrayStorage);
  unint64_t v156 = *((void *)v154 + 2);
  unint64_t v155 = *((void *)v154 + 3);
  if (v156 >= v155 >> 1) {
    v154 = sub_10002FCC8((char *)(v155 > 1), v156 + 1, 1, v154);
  }
  uint64_t v157 = v613;
  *((void *)v154 + 2) = v156 + 1;
  v158 = &v154[16 * v156];
  *((void *)v158 + 4) = v144;
  *((void *)v158 + 5) = v147;
  if (v152)
  {
LABEL_19:
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      v154 = sub_10002FCC8(0, *((void *)v154 + 2) + 1, 1, v154);
    }
    unint64_t v160 = *((void *)v154 + 2);
    unint64_t v159 = *((void *)v154 + 3);
    if (v160 >= v159 >> 1) {
      v154 = sub_10002FCC8((char *)(v159 > 1), v160 + 1, 1, v154);
    }
    *((void *)v154 + 2) = v160 + 1;
    v161 = &v154[16 * v160];
    *((void *)v161 + 4) = v150;
    *((void *)v161 + 5) = v152;
  }
LABEL_24:
  swift_release();
  v618 = v154;
  sub_100009F5C(&qword_100046308);
  sub_10000A21C();
  uint64_t v162 = sub_1000355F0();
  v164 = v163;
  swift_bridgeObjectRelease();
  uint64_t v165 = sub_100009F5C(&qword_1000462E8);
  v166 = v602;
  v167 = &v602[*(int *)(v165 + 48)];
  v526[0] = v162;
  *(void *)v602 = v162;
  *((void *)v166 + 1) = v164;
  uint64_t v168 = enum case for REMStringMatchingStyle.prefix(_:);
  uint64_t v169 = sub_1000353B0();
  v170 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v169 - 8) + 104);
  v170(v167, v168, v169);
  uint64_t v171 = enum case for REMSearchCriterion.textualField(_:);
  v172 = *(void (**)(void, void, void))(v610 + 104);
  v526[1] = v610 + 104;
  v539 = (void (*)(NSObject *, uint64_t, uint64_t))v172;
  v172(v166, enum case for REMSearchCriterion.textualField(_:), v157);
  unint64_t v173 = (unint64_t)v620;
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v173 = sub_10002FCA4(0, *(void *)(v173 + 16) + 1, 1, v173);
  }
  unint64_t v175 = *(void *)(v173 + 16);
  unint64_t v174 = *(void *)(v173 + 24);
  if (v175 >= v174 >> 1) {
    unint64_t v173 = sub_10002FCA4(v174 > 1, v175 + 1, 1, v173);
  }
  *(void *)(v173 + 16) = v175 + 1;
  v176 = *(char **)(v610 + 32);
  unint64_t v538 = (*(unsigned __int8 *)(v610 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v610 + 80);
  uint64_t v537 = *(void *)(v610 + 72);
  unint64_t v177 = v173 + v538 + v537 * v175;
  v178 = v602;
  uint64_t v179 = v613;
  v602 = v176;
  ((void (*)(unint64_t, char *, uint64_t))v176)(v177, v178, v613);
  v620 = (void *)v173;
  uint64_t v180 = *(int *)(v165 + 48);
  v181 = v603;
  v182 = (char *)v603 + v180;
  v603->Class isa = (Class)v526[0];
  v181[1].Class isa = v164;
  v170(v182, v168, v169);
  v539(v181, v171, v179);
  unint64_t v183 = (unint64_t)v619;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v183 = sub_10002FCA4(0, *(void *)(v183 + 16) + 1, 1, v183);
  }
  v74 = v612;
  v142 = v608;
  unint64_t v185 = *(void *)(v183 + 16);
  unint64_t v184 = *(void *)(v183 + 24);
  if (v185 >= v184 >> 1) {
    unint64_t v183 = sub_10002FCA4(v184 > 1, v185 + 1, 1, v183);
  }
  *(void *)(v183 + 16) = v185 + 1;
  ((void (*)(unint64_t, NSObject *, uint64_t))v602)(v183 + v538 + v185 * v537, v603, v613);
  v619 = (void *)v183;
  id v186 = [v142 title];
  if (v186)
  {
    v187 = v186;
    id v188 = [v186 vocabularyIdentifier];

    if (v188)
    {
      uint64_t v189 = sub_100035630();
      uint64_t v191 = v190;

      if (v189 == 0xD000000000000011 && v191 == 0x80000001000391F0)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        char v192 = sub_100035C70();
        swift_bridgeObjectRelease();
        if ((v192 & 1) == 0) {
          goto LABEL_41;
        }
      }
      uint64_t v193 = enum case for REMSearchableListType.grocery(_:);
      uint64_t v194 = sub_1000352D0();
      v195 = v540;
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v194 - 8) + 104))(v540, v193, v194);
      v539(v195, enum case for REMSearchCriterion.listType(_:), v613);
      unint64_t v197 = *(void *)(v183 + 16);
      unint64_t v196 = *(void *)(v183 + 24);
      if (v197 >= v196 >> 1) {
        unint64_t v183 = sub_10002FCA4(v196 > 1, v197 + 1, 1, v183);
      }
      *(void *)(v183 + 16) = v197 + 1;
      ((void (*)(unint64_t, char *, uint64_t))v602)(v183 + v538 + v197 * v537, v195, v613);
      v619 = (void *)v183;
    }
  }
LABEL_41:
  id v198 = [v142 notebookItemIdentifier];
  if (v198)
  {
    v199 = v198;
    uint64_t v200 = sub_100035630();
    unint64_t v202 = v201;

    swift_bridgeObjectRetain();
    uint64_t v203 = (uint64_t)v573;
    sub_1000354B0();
    v204 = v601;
    uint64_t v205 = v606;
    if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t))v601 + 6))(v203, 1, v606) == 1)
    {
      sub_10000A1C0(v203, &qword_1000462C8);
      swift_bridgeObjectRetain();
      v206 = sub_100035590();
      os_log_type_t v207 = sub_1000357A0();
      if (os_log_type_enabled(v206, v207))
      {
        v208 = (uint8_t *)swift_slowAlloc();
        v618 = swift_slowAlloc();
        *(_DWORD *)v208 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v617 = sub_10003007C(v200, v202, (uint64_t *)&v618);
        v142 = v608;
        sub_1000359B0();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v206, v207, "[Announce Reminders] Unable to create itemIdentifier from %s", v208, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      uint64_t v224 = v613;
      uint64_t v225 = v610;
      v74 = v612;
    }
    else
    {
      swift_bridgeObjectRelease();
      v215 = v586;
      (*((void (**)(char *, uint64_t, uint64_t))v204 + 4))(v586, v203, v205);
      v216 = (void (*)(char *, char *, uint64_t))*((void *)v204 + 2);
      v217 = v547;
      v216(v547, v215, v205);
      v218 = sub_100035590();
      os_log_type_t v219 = sub_1000357C0();
      if (os_log_type_enabled(v218, v219))
      {
        v220 = (uint8_t *)swift_slowAlloc();
        v603 = swift_slowAlloc();
        v618 = v603;
        *(_DWORD *)v220 = 136446210;
        v216(v541, v217, v606);
        uint64_t v221 = sub_100035640();
        uint64_t v617 = sub_10003007C(v221, v222, (uint64_t *)&v618);
        uint64_t v205 = v606;
        sub_1000359B0();
        swift_bridgeObjectRelease();
        v223 = (void (*)(char *, uint64_t))*((void *)v204 + 1);
        v223(v217, v205);
        _os_log_impl((void *)&_mh_execute_header, v218, v219, "[Announce Reminders] requestIdentifier:%{public}s", v220, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        v223 = (void (*)(char *, uint64_t))*((void *)v204 + 1);
        v223(v217, v205);
      }

      uint64_t v226 = v610;
      v227 = (uint64_t *)v550;
      v216(v550, v586, v205);
      int v228 = (*((uint64_t (**)(uint64_t *, uint64_t))v204 + 11))(v227, v205);
      if (v228 == enum case for REMNotificationIdentifier.objectID(_:))
      {
        (*((void (**)(uint64_t *, uint64_t))v204 + 12))(v227, v205);
        uint64_t v229 = *v227;
        sub_100009F5C(&qword_1000467F0);
        uint64_t v230 = swift_allocObject();
        *(_OWORD *)(v230 + 16) = xmmword_100038880;
        *(void *)(v230 + 32) = v229;
        v618 = v230;
        sub_1000356E0();
        *v549 = v618;
        uint64_t v224 = v613;
        (*(void (**)(void))(v226 + 104))();
        unint64_t v231 = (unint64_t)v620;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v231 = sub_10002FCA4(0, *(void *)(v231 + 16) + 1, 1, v231);
        }
        v74 = v612;
        unint64_t v233 = *(void *)(v231 + 16);
        unint64_t v232 = *(void *)(v231 + 24);
        if (v233 >= v232 >> 1) {
          unint64_t v231 = sub_10002FCA4(v232 > 1, v233 + 1, 1, v231);
        }
        *(void *)(v231 + 16) = v233 + 1;
        uint64_t v234 = *(unsigned __int8 *)(v226 + 80);
        uint64_t v235 = *(void *)(v226 + 72);
        (*(void (**)(unint64_t, NSObject **, uint64_t))(v226 + 32))(v231 + ((v234 + 32) & ~v234) + v235 * v233, v549, v224);
      }
      else
      {
        uint64_t v224 = v613;
        if (v228 != enum case for REMNotificationIdentifier.daCalendarItemUniqueIdentifier(_:)) {
          goto LABEL_236;
        }
        (*((void (**)(uint64_t *, uint64_t))v204 + 12))(v227, v205);
        uint64_t v236 = v227[1];
        v237 = v548;
        uint64_t *v548 = *v227;
        v237[1] = v236;
        (*(void (**)(void))(v226 + 104))();
        unint64_t v231 = (unint64_t)v620;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v231 = sub_10002FCA4(0, *(void *)(v231 + 16) + 1, 1, v231);
        }
        v74 = v612;
        unint64_t v239 = *(void *)(v231 + 16);
        unint64_t v238 = *(void *)(v231 + 24);
        if (v239 >= v238 >> 1) {
          unint64_t v231 = sub_10002FCA4(v238 > 1, v239 + 1, 1, v231);
        }
        *(void *)(v231 + 16) = v239 + 1;
        uint64_t v234 = *(unsigned __int8 *)(v226 + 80);
        uint64_t v235 = *(void *)(v226 + 72);
        (*(void (**)(unint64_t, uint64_t *, uint64_t))(v226 + 32))(v231 + ((v234 + 32) & ~v234) + v235 * v239, v548, v224);
      }
      v620 = (void *)v231;
      v240 = sub_100035590();
      os_log_type_t v241 = sub_1000357C0();
      if (os_log_type_enabled(v240, v241))
      {
        v242 = (uint8_t *)swift_slowAlloc();
        v618 = swift_slowAlloc();
        *(_DWORD *)v242 = 136446210;
        swift_beginAccess();
        uint64_t v243 = v620[2];
        if (v243)
        {
          unint64_t v244 = (unint64_t)v620
               + ((v234 + 32) & ~(unint64_t)v234)
               + v235 * (v243 - 1);
          uint64_t v245 = v610;
          v246 = v542;
          (*(void (**)(char *, unint64_t, uint64_t))(v610 + 16))(v542, v244, v224);
          uint64_t v247 = 0;
        }
        else
        {
          uint64_t v247 = 1;
          uint64_t v245 = v610;
          v246 = v542;
        }
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v245 + 56))(v246, v247, 1, v224);
        uint64_t v248 = sub_100035640();
        uint64_t v617 = sub_10003007C(v248, v249, (uint64_t *)&v618);
        uint64_t v225 = v610;
        sub_1000359B0();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v240, v241, "[Announce Reminders] Added %{public}s to search criteria", v242, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v223(v586, v606);
      }
      else
      {

        v223(v586, v606);
        uint64_t v225 = v610;
      }
      v142 = v608;
    }
  }
  else
  {
    v209 = v142;
    v210 = sub_100035590();
    os_log_type_t v211 = sub_1000357A0();
    if (os_log_type_enabled(v210, v211))
    {
      v212 = (uint8_t *)swift_slowAlloc();
      v213 = (void *)swift_slowAlloc();
      *(_DWORD *)v212 = 138412290;
      v618 = v209;
      v214 = v209;
      v142 = v608;
      sub_1000359B0();
      void *v213 = v209;

      _os_log_impl((void *)&_mh_execute_header, v210, v211, "[Announce Reminders] notebookIdentifier not found in intent: %@", v212, 0xCu);
      sub_100009F5C((uint64_t *)&unk_1000462F0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    uint64_t v224 = v613;
    uint64_t v225 = v610;
  }
  BOOL v250 = [v142 status] == (id)2;
  BOOL *v609 = v250;
  v251 = *(void (**)(void))(v225 + 104);
  uint64_t v606 = v225 + 104;
  v251();
  swift_beginAccess();
  unint64_t v252 = (unint64_t)v620;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v252 = sub_10002FCA4(0, *(void *)(v252 + 16) + 1, 1, v252);
  }
  unint64_t v254 = *(void *)(v252 + 16);
  unint64_t v253 = *(void *)(v252 + 24);
  if (v254 >= v253 >> 1) {
    unint64_t v252 = sub_10002FCA4(v253 > 1, v254 + 1, 1, v252);
  }
  *(void *)(v252 + 16) = v254 + 1;
  v256 = (char *)(v225 + 32);
  v255 = *(BOOL **)(v225 + 32);
  v603 = ((*(unsigned __int8 *)(v225 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v225 + 80));
  v602 = *(char **)(v225 + 72);
  v257 = v609;
  v609 = v255;
  ((void (*)(char *, BOOL *, uint64_t))v255)((char *)v603 + v252 + (void)v602 * v254, v257, v224);
  v620 = (void *)v252;
  swift_endAccess();
  id v258 = [v142 location];
  if (v258)
  {
    v259 = v258;
    id v260 = [v258 name];

    if (v260)
    {
      uint64_t v261 = sub_100035630();
      uint64_t v263 = v262;

      if ([v142 locationSearchType] == (id)1)
      {
        v264 = v74;
        uint64_t v265 = sub_100009F5C(&qword_1000462E8);
        v266 = v566;
        v267 = (char *)v566 + *(int *)(v265 + 48);
        uint64_t *v566 = v261;
        v266[1] = v263;
        uint64_t v268 = enum case for REMStringMatchingStyle.prefix(_:);
        uint64_t v269 = sub_1000353B0();
        (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v269 - 8) + 104))(v267, v268, v269);
        ((void (*)(uint64_t *, void, uint64_t))v251)(v266, enum case for REMSearchCriterion.location(_:), v224);
        swift_beginAccess();
        unint64_t v270 = (unint64_t)v620;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v270 = sub_10002FCA4(0, *(void *)(v270 + 16) + 1, 1, v270);
        }
        unint64_t v272 = *(void *)(v270 + 16);
        unint64_t v271 = *(void *)(v270 + 24);
        v74 = v264;
        if (v272 >= v271 >> 1) {
          unint64_t v270 = sub_10002FCA4(v271 > 1, v272 + 1, 1, v270);
        }
        *(void *)(v270 + 16) = v272 + 1;
        ((void (*)(char *, uint64_t *, uint64_t))v609)((char *)v603 + v270 + v272 * (void)v602, v566, v224);
        v620 = (void *)v270;
        swift_endAccess();
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
  }
  v601 = v251;
  v573 = *(void (**)(BOOL *, uint64_t, uint64_t, uint64_t))(v225 + 56);
  v573(v74, 1, 1, v224);
  unsigned __int8 v273 = [v142 temporalEventTriggerTypes];
  unsigned __int8 v274 = [v142 temporalEventTriggerTypes];
  BOOL v275 = (v274 & 2) == 0;
  unsigned __int8 v276 = [v142 temporalEventTriggerTypes];
  if (v273)
  {
    uint64_t v277 = v599;
    if ((v274 & 2) != 0)
    {
      if ((v276 & 4) != 0) {
        goto LABEL_103;
      }
      BOOL v275 = 0;
      v278 = v601;
      goto LABEL_97;
    }
    if ((v276 & 4) != 0) {
      goto LABEL_103;
    }
    goto LABEL_102;
  }
  uint64_t v277 = v599;
  if ((v274 & 2) == 0)
  {
    if ((v276 & 4) == 0) {
      goto LABEL_103;
    }
    goto LABEL_94;
  }
  if ((v276 & 4) != 0)
  {
LABEL_102:
    sub_10000A1C0((uint64_t)v74, &qword_1000462C0);
    BOOL *v74 = (v273 & 1) == 0;
    ((void (*)(BOOL *, void, uint64_t))v601)(v74, enum case for REMSearchCriterion.hasDueDate(_:), v224);
    v573(v74, 0, 1, v224);
    goto LABEL_103;
  }
LABEL_94:
  sub_10000A1C0((uint64_t)v74, &qword_1000462C0);
  BOOL *v74 = 1;
  v278 = v601;
  ((void (*)(BOOL *, void, uint64_t))v601)(v74, enum case for REMSearchCriterion.hasDueDate(_:), v224);
  v573(v74, 0, 1, v224);
LABEL_97:
  BOOL *v584 = v275;
  v278();
  swift_beginAccess();
  unint64_t v279 = (unint64_t)v620;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v279 = sub_10002FCA4(0, *(void *)(v279 + 16) + 1, 1, v279);
  }
  unint64_t v281 = *(void *)(v279 + 16);
  unint64_t v280 = *(void *)(v279 + 24);
  if (v281 >= v280 >> 1) {
    unint64_t v279 = sub_10002FCA4(v280 > 1, v281 + 1, 1, v279);
  }
  *(void *)(v279 + 16) = v281 + 1;
  ((void (*)(char *, BOOL *, uint64_t))v609)((char *)v603 + v279 + v281 * (void)v602, v584, v224);
  v620 = (void *)v279;
  swift_endAccess();
LABEL_103:
  v550 = (char *)(v225 + 56);
  id v282 = [v142 dateTime];
  if (!v282) {
    goto LABEL_196;
  }
  v283 = v282;
  id v284 = [v282 allDay];
  if (v284)
  {
    v285 = v284;
    LODWORD(v566) = [v284 BOOLValue];
  }
  else
  {
    LODWORD(v566) = 0;
  }
  uint64_t v286 = v607;
  v287 = v574;
  id v288 = [v283 startDateComponents];
  if (v288)
  {
    v289 = v288;
    sub_100034DD0();

    v290 = *(void (**)(char *, uint64_t, uint64_t, void *))(v286 + 56);
    v291 = v287;
    uint64_t v292 = 0;
  }
  else
  {
    v290 = *(void (**)(char *, uint64_t, uint64_t, void *))(v286 + 56);
    v291 = v287;
    uint64_t v292 = 1;
  }
  v293 = v593;
  v290(v291, v292, 1, v593);
  uint64_t v294 = (uint64_t)v287;
  uint64_t v295 = v575;
  sub_10000A0F4(v294, v575);
  v296 = *(unsigned int (**)(uint64_t, uint64_t, void *))(v286 + 48);
  if (v296(v295, 1, v293) == 1)
  {
    sub_10000A1C0(v295, (uint64_t *)&unk_100046550);
    uint64_t v297 = 1;
  }
  else
  {
    sub_100034DB0();
    (*(void (**)(uint64_t, void *))(v286 + 8))(v295, v293);
    uint64_t v297 = 0;
  }
  v298 = v293;
  uint64_t v299 = 1;
  v290((char *)v277, v297, 1, v298);
  v584 = (BOOL *)v283;
  id v300 = [v283 endDateComponents];
  if (v300)
  {
    v301 = v300;
    v302 = v576;
    sub_100034DD0();

    uint64_t v299 = 0;
    uint64_t v303 = v611;
  }
  else
  {
    uint64_t v303 = v611;
    v302 = v576;
  }
  uint64_t v304 = v299;
  v305 = v593;
  v290(v302, v304, 1, v593);
  uint64_t v306 = (uint64_t)v302;
  v307 = v305;
  uint64_t v308 = v577;
  sub_10000A0F4(v306, v577);
  if (v296(v308, 1, v307) == 1)
  {
    sub_10000A1C0(v308, (uint64_t *)&unk_100046550);
    uint64_t v309 = 1;
  }
  else
  {
    sub_100034DB0();
    uint64_t v303 = v611;
    (*(void (**)(uint64_t, void *))(v607 + 8))(v308, v307);
    uint64_t v309 = 0;
  }
  uint64_t v310 = v591;
  v586 = v256;
  v290((char *)v303, v309, 1, v307);
  uint64_t v311 = v578;
  sub_10000A15C(v277, v578, (uint64_t *)&unk_100046550);
  if (v296(v311, 1, v307) == 1)
  {
    sub_10000A1C0(v311, (uint64_t *)&unk_100046550);
    v312 = v588;
    uint64_t v313 = v594;
    (*(void (**)(void (*)(void, void), uint64_t, uint64_t, uint64_t))(v310 + 56))(v588, 1, 1, v594);
  }
  else
  {
    v312 = v588;
    sub_100034E20();
    uint64_t v303 = v611;
    (*(void (**)(uint64_t, void *))(v607 + 8))(v311, v307);
    uint64_t v313 = v594;
  }
  uint64_t v314 = (uint64_t)v585;
  v315 = v587;
  sub_10000A15C(v303, (uint64_t)v587, (uint64_t *)&unk_100046550);
  v316 = *(unsigned int (**)(void (*)(void, void), uint64_t, uint64_t))(v310 + 48);
  if (v316(v312, 1, v313) != 1)
  {
    sub_10000A1C0((uint64_t)v315, (uint64_t *)&unk_100046550);
    (*(void (**)(char *, void (*)(void, void), uint64_t))(v310 + 32))(v598, v312, v313);
    v319 = v596;
    uint64_t v320 = v611;
    uint64_t v321 = v607;
    v74 = v612;
    goto LABEL_130;
  }
  uint64_t v317 = v551;
  sub_10000A15C((uint64_t)v315, v551, (uint64_t *)&unk_100046550);
  if (v296(v317, 1, v307) == 1)
  {
    sub_10000A1C0(v317, (uint64_t *)&unk_100046550);
    uint64_t v318 = (uint64_t)v552;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v591 + 56))(v552, 1, 1, v594);
    v319 = v596;
    v74 = v612;
  }
  else
  {
    v322 = v552;
    sub_100034E20();
    (*(void (**)(uint64_t, void *))(v607 + 8))(v317, v307);
    unsigned int v323 = v316((void (*)(void, void))v322, 1, v594);
    uint64_t v318 = (uint64_t)v322;
    v319 = v596;
    v74 = v612;
    if (v323 != 1)
    {
      sub_10000A1C0((uint64_t)v587, (uint64_t *)&unk_100046550);
      (*(void (**)(char *, uint64_t, uint64_t))(v591 + 32))(v598, v318, v594);
      goto LABEL_129;
    }
  }
  uint64_t v324 = *(void *)&v597[OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_timeProvider
                        + 24];
  uint64_t v325 = *(void *)&v597[OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_timeProvider
                        + 32];
  sub_10000A024(&v597[OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_timeProvider], v324);
  v326 = *(void (**)(uint64_t, uint64_t))(v325 + 16);
  uint64_t v327 = v325;
  uint64_t v314 = (uint64_t)v585;
  v326(v324, v327);
  sub_10000A1C0((uint64_t)v587, (uint64_t *)&unk_100046550);
  sub_10000A1C0(v318, (uint64_t *)&unk_1000462B0);
LABEL_129:
  uint64_t v320 = v611;
  sub_10000A1C0((uint64_t)v588, (uint64_t *)&unk_1000462B0);
  uint64_t v321 = v607;
LABEL_130:
  sub_100034E90();
  sub_100034EA0();
  sub_10000A15C(v599, v314, (uint64_t *)&unk_100046550);
  if (v296(v314, 1, v307) == 1)
  {
    sub_10000A1C0(v314, (uint64_t *)&unk_100046550);
    v328 = v580;
  }
  else
  {
    v588 = (void (*)(void, void))v296;
    v329 = *(void (**)(char *, uint64_t, void *))(v321 + 32);
    v330 = v554;
    v329(v554, v314, v307);
    if (v566)
    {
      v331 = v556;
      sub_100034DA0();
      (*(void (**)(char *, void *))(v607 + 8))(v330, v307);
      v329(v330, (uint64_t)v331, v307);
    }
    uint64_t v332 = *(void *)&v597[OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_timeProvider
                          + 24];
    uint64_t v333 = *(void *)&v597[OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_timeProvider
                          + 32];
    sub_10000A024(&v597[OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_timeProvider], v332);
    v334 = v589;
    (*(void (**)(uint64_t, uint64_t))(v333 + 8))(v332, v333);
    uint64_t v335 = (uint64_t)v555;
    sub_100034F80();
    uint64_t v336 = v595;
    v337 = *(void (**)(char *, uint64_t))(v595 + 8);
    v338 = v330;
    uint64_t v339 = v592;
    v337(v334, v592);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v336 + 48))(v335, 1, v339) == 1)
    {
      v340 = v553;
      sub_100034E90();
      uint64_t v321 = v607;
      v341 = v338;
      v307 = v593;
      (*(void (**)(char *, void *))(v607 + 8))(v341, v593);
      v337(v319, v339);
      sub_10000A1C0(v335, &qword_100046810);
      (*(void (**)(char *, char *, uint64_t))(v336 + 32))(v319, v340, v339);
    }
    else
    {
      uint64_t v321 = v607;
      v342 = v338;
      v307 = v593;
      (*(void (**)(char *, void *))(v607 + 8))(v342, v593);
      v337(v319, v339);
      v343 = *(void (**)(char *, uint64_t, uint64_t))(v336 + 32);
      v344 = v553;
      v343(v553, v335, v339);
      v343(v319, (uint64_t)v344, v339);
    }
    uint64_t v320 = v611;
    v328 = v580;
    v74 = v612;
    v296 = (unsigned int (*)(uint64_t, uint64_t, void *))v588;
  }
  uint64_t v345 = v320;
  uint64_t v346 = v579;
  sub_10000A15C(v345, v579, (uint64_t *)&unk_100046550);
  if (v296(v346, 1, v307) == 1)
  {
    sub_10000A1C0(v346, (uint64_t *)&unk_100046550);
    v142 = v608;
    uint64_t v347 = v592;
LABEL_149:
    v366 = (void *)v595;
    goto LABEL_150;
  }
  v348 = v74;
  uint64_t v349 = v321;
  v350 = *(void (**)(char *, uint64_t, void *))(v321 + 32);
  v351 = v567;
  v350(v567, v346, v307);
  if ((v566 & 1) == 0)
  {
    uint64_t v367 = *(void *)&v597[OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_timeProvider
                          + 24];
    uint64_t v368 = *(void *)&v597[OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_timeProvider
                          + 32];
    sub_10000A024(&v597[OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_timeProvider], v367);
    v369 = v589;
    (*(void (**)(uint64_t, uint64_t))(v368 + 8))(v367, v368);
    uint64_t v370 = (uint64_t)v545;
    sub_100034F80();
    uint64_t v371 = v595;
    v372 = *(void (**)(char *, uint64_t))(v595 + 8);
    v373 = v369;
    uint64_t v374 = v592;
    v372(v373, v592);
    v375 = v307;
    uint64_t v347 = v374;
    (*(void (**)(char *, void *))(v349 + 8))(v351, v375);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v371 + 48))(v370, 1, v374) == 1)
    {
      v376 = *(void (**)(char *, char *, uint64_t))(v371 + 32);
      v377 = v605;
      v376(v328, v605, v347);
      sub_10000A1C0(v370, &qword_100046810);
    }
    else
    {
      v377 = v605;
      v372(v605, v347);
      v376 = *(void (**)(char *, char *, uint64_t))(v371 + 32);
      v376(v328, (char *)v370, v347);
    }
    v319 = v596;
    v142 = v608;
    v74 = v348;
    v376(v377, v328, v347);
    goto LABEL_149;
  }
  v352 = v556;
  sub_100034DA0();
  uint64_t v353 = v595;
  v354 = v307;
  uint64_t v355 = v592;
  v357 = *(void (**)(void, void))(v349 + 8);
  uint64_t v356 = v349 + 8;
  v588 = v357;
  v357(v351, v307);
  v350(v351, (uint64_t)v352, v307);
  uint64_t v358 = *(void *)&v597[OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_timeProvider
                        + 24];
  uint64_t v359 = *(void *)&v597[OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_timeProvider
                        + 32];
  sub_10000A024(&v597[OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_timeProvider], v358);
  v360 = v351;
  v361 = v589;
  (*(void (**)(uint64_t, uint64_t))(v359 + 8))(v358, v359);
  uint64_t v362 = (uint64_t)v544;
  sub_100034F80();
  v363 = v361;
  uint64_t v364 = v353;
  v587 = *(void (**)(void, void))(v353 + 8);
  v587(v363, v355);
  v365 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v353 + 48);
  if (v365(v362, 1, v355) == 1)
  {
    v588(v360, v354);
    sub_10000A1C0(v362, &qword_100046810);
    v74 = v612;
    v366 = (void *)v364;
    uint64_t v347 = v355;
    v319 = v596;
    v142 = v608;
    goto LABEL_150;
  }
  uint64_t v607 = v356;
  v378 = *(char **)(v364 + 32);
  v379 = v533;
  v585 = (char *)(v364 + 32);
  v580 = v378;
  ((void (*)(char *, uint64_t, uint64_t))v378)(v533, v362, v355);
  uint64_t v380 = v569;
  v381 = v568;
  uint64_t v382 = v570;
  (*(void (**)(char *, void, uint64_t))(v569 + 104))(v568, enum case for Calendar.Component.day(_:), v570);
  uint64_t v383 = (uint64_t)v535;
  sub_100034FA0();
  uint64_t v384 = v383;
  (*(void (**)(char *, uint64_t))(v380 + 8))(v381, v382);
  v385 = v365;
  if (v365(v383, 1, v355) == 1)
  {
    v587(v379, v355);
    v588(v567, v593);
    sub_10000A1C0(v383, &qword_100046810);
    v366 = (void *)v595;
    uint64_t v386 = (uint64_t)v536;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v595 + 56))(v536, 1, 1, v355);
    uint64_t v347 = v355;
  }
  else
  {
    uint64_t v386 = (uint64_t)v536;
    sub_100034EB0();
    v462 = v587;
    v587(v379, v355);
    v588(v567, v593);
    v462(v384, v355);
    v366 = (void *)v595;
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v595 + 56))(v386, 0, 1, v355);
    uint64_t v347 = v355;
    if (v385(v386, 1, v355) != 1)
    {
      v464 = v605;
      v462((uint64_t)v605, v355);
      v463 = v534;
      v465 = (void (*)(char *, char *, uint64_t))v580;
      ((void (*)(char *, uint64_t, uint64_t))v580)(v534, v386, v355);
      goto LABEL_231;
    }
  }
  v463 = v534;
  v464 = v605;
  v465 = (void (*)(char *, char *, uint64_t))v580;
  ((void (*)(char *, char *, uint64_t))v580)(v534, v605, v347);
  sub_10000A1C0(v386, &qword_100046810);
LABEL_231:
  v74 = v612;
  v142 = v608;
  v465(v464, v463, v347);
  v319 = v596;
LABEL_150:
  v387 = &v597[OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_timeProvider];
  if ((sub_100035890() & 1) == 0) {
    goto LABEL_157;
  }
  v388 = v589;
  sub_100034E90();
  v389 = (void (*)(char *, uint64_t))v366[1];
  v389(v319, v347);
  uint64_t v607 = v366[4];
  ((void (*)(char *, char *, uint64_t))v607)(v319, v388, v347);
  uint64_t v390 = *((void *)v387 + 3);
  uint64_t v391 = *((void *)v387 + 4);
  sub_10000A024(v387, v390);
  uint64_t v392 = v595;
  (*(void (**)(uint64_t, uint64_t))(v391 + 8))(v390, v391);
  v393 = v559;
  sub_100034F70();
  v593 = v389;
  v389(v388, v347);
  uint64_t v394 = v347;
  uint64_t v395 = v569;
  v396 = v393;
  v397 = v568;
  uint64_t v398 = v570;
  (*(void (**)(char *, void, uint64_t))(v569 + 104))(v568, enum case for Calendar.Component.day(_:), v570);
  uint64_t v399 = (uint64_t)v563;
  sub_100034FA0();
  (*(void (**)(char *, uint64_t))(v395 + 8))(v397, v398);
  uint64_t v400 = v394;
  v366 = (void *)v392;
  v401 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v392 + 48);
  if (v401(v399, 1, v400) == 1)
  {
    ((void (*)(char *, uint64_t))v593)(v396, v400);
    sub_10000A1C0(v399, &qword_100046810);
    uint64_t v402 = (uint64_t)v564;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v392 + 56))(v564, 1, 1, v400);
    v403 = v562;
  }
  else
  {
    uint64_t v402 = (uint64_t)v564;
    sub_100034EB0();
    v404 = v396;
    v405 = (void (*)(uint64_t, uint64_t))v593;
    ((void (*)(char *, uint64_t))v593)(v404, v400);
    v405(v399, v400);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v392 + 56))(v402, 0, 1, v400);
    int v406 = v401(v402, 1, v400);
    v403 = v562;
    if (v406 != 1)
    {
      v407 = v605;
      v405((uint64_t)v605, v400);
      v408 = (void (*)(char *, char *, uint64_t))v607;
      ((void (*)(char *, uint64_t, uint64_t))v607)(v403, v402, v400);
      goto LABEL_156;
    }
  }
  v407 = v605;
  v408 = (void (*)(char *, char *, uint64_t))v607;
  ((void (*)(char *, char *, uint64_t))v607)(v403, v605, v400);
  sub_10000A1C0(v402, &qword_100046810);
LABEL_156:
  v74 = v612;
  v319 = v596;
  uint64_t v347 = v400;
  v408(v407, v403, v400);
  v142 = v608;
LABEL_157:
  id v409 = [v142 dateSearchType];
  uint64_t v410 = v611;
  v411 = v581;
  switch((unint64_t)v409)
  {
    case 0uLL:

      v412 = (void (*)(char *, uint64_t))v366[1];
      v412(v605, v347);
      v412(v319, v347);
      (*(void (**)(char *, uint64_t))(v591 + 8))(v598, v594);
      sub_10000A1C0(v410, (uint64_t *)&unk_100046550);
      sub_10000A1C0(v599, (uint64_t *)&unk_100046550);
      uint64_t v224 = v613;
      goto LABEL_159;
    case 1uLL:
      sub_10000A15C((uint64_t)v74, (uint64_t)v581, &qword_1000462C0);
      uint64_t v451 = v610;
      uint64_t v224 = v613;
      if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v610 + 48))(v411, 1, v613) == 1)
      {
        sub_10000A1C0((uint64_t)v411, &qword_1000462C0);
LABEL_191:
        uint64_t v466 = sub_100009F5C(&qword_1000462E0);
        v467 = v546;
        v468 = &v546[*(int *)(v466 + 48)];
        v469 = (void (*)(char *, char *, uint64_t))v366[2];
        v469(v546, v319, v347);
        v470 = (void (*)(char *, void, uint64_t, uint64_t))v366[7];
        v470(v467, 0, 1, v347);
        v469(v468, v605, v347);
        v470(v468, 0, 1, v347);
        ((void (*)(char *, void, uint64_t))v601)(v467, enum case for REMSearchCriterion.dueDate(_:), v224);
        swift_beginAccess();
        unint64_t v471 = (unint64_t)v620;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v471 = sub_10002FCA4(0, *(void *)(v471 + 16) + 1, 1, v471);
        }
        uint64_t v225 = v610;
        unint64_t v473 = *(void *)(v471 + 16);
        unint64_t v472 = *(void *)(v471 + 24);
        uint64_t v474 = v595;
        if (v473 >= v472 >> 1) {
          unint64_t v471 = sub_10002FCA4(v472 > 1, v473 + 1, 1, v471);
        }
        *(void *)(v471 + 16) = v473 + 1;
        ((void (*)(char *, char *, uint64_t))v609)((char *)v603 + v471 + v473 * (void)v602, v546, v224);
        v620 = (void *)v471;
        swift_endAccess();

        v475 = *(void (**)(char *, uint64_t))(v474 + 8);
        v475(v605, v347);
        v475(v596, v347);
        (*(void (**)(char *, uint64_t))(v591 + 8))(v598, v594);
        sub_10000A1C0(v611, (uint64_t *)&unk_100046550);
        sub_10000A1C0(v599, (uint64_t *)&unk_100046550);
        break;
      }
      if ((*(unsigned int (**)(unsigned char *, uint64_t))(v451 + 88))(v411, v224) != enum case for REMSearchCriterion.hasDueDate(_:))
      {
        (*(void (**)(unsigned char *, uint64_t))(v451 + 8))(v411, v224);
        goto LABEL_191;
      }
      (*(void (**)(unsigned char *, uint64_t))(v451 + 96))(v411, v224);
      if (*v411)
      {
        uint64_t v452 = sub_100009F5C(&qword_1000462E0);
        v453 = v532;
        v454 = &v532[*(int *)(v452 + 48)];
        v455 = (void (*)(char *, char *, uint64_t))v366[2];
        v455(v532, v319, v347);
        v456 = (void (*)(char *, void, uint64_t, uint64_t))v366[7];
        v456(v453, 0, 1, v347);
        v455(v454, v605, v347);
        v456(v454, 0, 1, v347);
        ((void (*)(char *, void, uint64_t))v601)(v453, enum case for REMSearchCriterion.dueDate(_:), v224);
        swift_beginAccess();
        unint64_t v457 = (unint64_t)v620;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v457 = sub_10002FCA4(0, *(void *)(v457 + 16) + 1, 1, v457);
        }
        uint64_t v225 = v610;
        unint64_t v459 = *(void *)(v457 + 16);
        unint64_t v458 = *(void *)(v457 + 24);
        uint64_t v460 = v595;
        if (v459 >= v458 >> 1) {
          unint64_t v457 = sub_10002FCA4(v458 > 1, v459 + 1, 1, v457);
        }
        *(void *)(v457 + 16) = v459 + 1;
        ((void (*)(char *, char *, uint64_t))v609)((char *)v603 + v457 + v459 * (void)v602, v532, v224);
        v620 = (void *)v457;
        swift_endAccess();

        v461 = *(void (**)(char *, uint64_t))(v460 + 8);
        v461(v605, v347);
        v461(v596, v347);
        (*(void (**)(char *, uint64_t))(v591 + 8))(v598, v594);
        sub_10000A1C0(v611, (uint64_t *)&unk_100046550);
        sub_10000A1C0(v599, (uint64_t *)&unk_100046550);
        sub_10000A1C0((uint64_t)v74, &qword_1000462C0);
        v573(v74, 1, 1, v224);
      }
      else
      {

        v523 = (void (*)(char *, uint64_t))v366[1];
        v523(v605, v347);
        v523(v319, v347);
        (*(void (**)(char *, uint64_t))(v591 + 8))(v598, v594);
        sub_10000A1C0(v410, (uint64_t *)&unk_100046550);
        sub_10000A1C0(v599, (uint64_t *)&unk_100046550);
LABEL_159:
        uint64_t v225 = v610;
      }
      break;
    case 2uLL:
      uint64_t v413 = sub_100009F5C(&qword_1000462E0);
      v414 = v557;
      v415 = &v557[*(int *)(v413 + 48)];
      v416 = (void (*)(char *, char *, uint64_t))v366[2];
      v416(v557, v319, v347);
      v417 = (void (*)(char *, void, uint64_t, uint64_t))v366[7];
      v417(v414, 0, 1, v347);
      v416(v415, v605, v347);
      v417(v415, 0, 1, v347);
      uint64_t v418 = enum case for REMSearchCriterion.modifiedDate(_:);
      ((void (*)(char *, void, uint64_t))v601)(v414, enum case for REMSearchCriterion.modifiedDate(_:), v613);
      swift_beginAccess();
      unint64_t v419 = (unint64_t)v620;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v419 = sub_10002FCA4(0, *(void *)(v419 + 16) + 1, 1, v419);
      }
      unint64_t v421 = *(void *)(v419 + 16);
      unint64_t v420 = *(void *)(v419 + 24);
      if (v421 >= v420 >> 1) {
        unint64_t v419 = sub_10002FCA4(v420 > 1, v421 + 1, 1, v419);
      }
      *(void *)(v419 + 16) = v421 + 1;
      uint64_t v422 = v613;
      ((void (*)(char *, char *, uint64_t))v609)((char *)v603 + v419 + v421 * (void)v602, v557, v613);
      v620 = (void *)v419;
      swift_endAccess();
      v423 = v560;
      v424 = &v560[*(int *)(v413 + 48)];
      uint64_t v425 = v592;
      v416(v560, v596, v592);
      v417(v423, 0, 1, v425);
      v416(v424, v605, v425);
      uint64_t v224 = v422;
      v417(v424, 0, 1, v425);
      ((void (*)(char *, uint64_t, uint64_t))v601)(v423, v418, v422);
      unint64_t v426 = (unint64_t)v619;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v426 = sub_10002FCA4(0, *(void *)(v426 + 16) + 1, 1, v426);
      }
      v74 = v612;
      uint64_t v427 = v595;
      uint64_t v428 = v594;
      v429 = v598;
      unint64_t v431 = *(void *)(v426 + 16);
      unint64_t v430 = *(void *)(v426 + 24);
      uint64_t v432 = v592;
      if (v431 >= v430 >> 1) {
        unint64_t v426 = sub_10002FCA4(v430 > 1, v431 + 1, 1, v426);
      }
      *(void *)(v426 + 16) = v431 + 1;
      v433 = (char *)v603 + v426 + v431 * (void)v602;
      v434 = &v592;
      goto LABEL_178;
    case 3uLL:
      uint64_t v435 = sub_100009F5C(&qword_1000462E0);
      v436 = v558;
      v437 = &v558[*(int *)(v435 + 48)];
      v438 = (void (*)(char *, char *, uint64_t))v366[2];
      v438(v558, v319, v347);
      v439 = (void (*)(char *, void, uint64_t, uint64_t))v366[7];
      v439(v436, 0, 1, v347);
      v438(v437, v605, v347);
      v439(v437, 0, 1, v347);
      uint64_t v440 = enum case for REMSearchCriterion.creationDate(_:);
      ((void (*)(char *, void, uint64_t))v601)(v436, enum case for REMSearchCriterion.creationDate(_:), v613);
      swift_beginAccess();
      unint64_t v441 = (unint64_t)v620;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v441 = sub_10002FCA4(0, *(void *)(v441 + 16) + 1, 1, v441);
      }
      unint64_t v443 = *(void *)(v441 + 16);
      unint64_t v442 = *(void *)(v441 + 24);
      if (v443 >= v442 >> 1) {
        unint64_t v441 = sub_10002FCA4(v442 > 1, v443 + 1, 1, v441);
      }
      *(void *)(v441 + 16) = v443 + 1;
      uint64_t v444 = v613;
      ((void (*)(char *, char *, uint64_t))v609)((char *)v603 + v441 + v443 * (void)v602, v558, v613);
      v620 = (void *)v441;
      swift_endAccess();
      v445 = v561;
      v446 = &v561[*(int *)(v435 + 48)];
      uint64_t v447 = v592;
      v438(v561, v596, v592);
      v439(v445, 0, 1, v447);
      v438(v446, v605, v447);
      uint64_t v224 = v444;
      v439(v446, 0, 1, v447);
      ((void (*)(char *, uint64_t, uint64_t))v601)(v445, v440, v444);
      unint64_t v426 = (unint64_t)v619;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v426 = sub_10002FCA4(0, *(void *)(v426 + 16) + 1, 1, v426);
      }
      v74 = v612;
      uint64_t v427 = v595;
      uint64_t v428 = v594;
      v429 = v598;
      unint64_t v449 = *(void *)(v426 + 16);
      unint64_t v448 = *(void *)(v426 + 24);
      uint64_t v432 = v592;
      if (v449 >= v448 >> 1) {
        unint64_t v426 = sub_10002FCA4(v448 > 1, v449 + 1, 1, v426);
      }
      *(void *)(v426 + 16) = v449 + 1;
      v433 = (char *)v603 + v426 + v449 * (void)v602;
      v434 = (uint64_t *)&v593;
LABEL_178:
      ((void (*)(char *, void, uint64_t))v609)(v433, *(v434 - 32), v224);

      v619 = (void *)v426;
      v450 = *(void (**)(char *, uint64_t))(v427 + 8);
      v450(v605, v432);
      v450(v596, v432);
      (*(void (**)(char *, uint64_t))(v591 + 8))(v429, v428);
      sub_10000A1C0(v611, (uint64_t *)&unk_100046550);
      sub_10000A1C0(v599, (uint64_t *)&unk_100046550);
      uint64_t v225 = v610;
      v142 = v608;
      break;
    default:
      v528(v527, v600, v530);
      sub_10001E58C((uint64_t)&_swiftEmptyArrayStorage);
      sub_10001E58C((uint64_t)&_swiftEmptyArrayStorage);
      swift_release();
      _Block_release(v565);
      v524 = "unknown date search type";
      uint64_t v525 = 24;
      goto LABEL_235;
  }
LABEL_196:
  uint64_t v476 = v590;
  sub_10000A15C((uint64_t)v74, v590, &qword_1000462C0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v225 + 48))(v476, 1, v224) == 1)
  {
    sub_10000A1C0(v476, &qword_1000462C0);
  }
  else
  {
    v477 = v572;
    ((void (*)(char *, uint64_t, uint64_t))v609)(v572, v476, v224);
    v478 = v571;
    (*(void (**)(char *, char *, uint64_t))(v225 + 16))(v571, v477, v224);
    swift_beginAccess();
    unint64_t v479 = (unint64_t)v620;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v479 = sub_10002FCA4(0, *(void *)(v479 + 16) + 1, 1, v479);
    }
    unint64_t v481 = *(void *)(v479 + 16);
    unint64_t v480 = *(void *)(v479 + 24);
    if (v481 >= v480 >> 1) {
      unint64_t v479 = sub_10002FCA4(v480 > 1, v481 + 1, 1, v479);
    }
    *(void *)(v479 + 16) = v481 + 1;
    ((void (*)(char *, char *, uint64_t))v609)((char *)v603 + v479 + v481 * (void)v602, v478, v224);
    v620 = (void *)v479;
    swift_endAccess();
    (*(void (**)(char *, uint64_t))(v225 + 8))(v477, v224);
    v142 = v608;
  }
  id v482 = [v142 taskPriority];
  v483 = v601;
  if (v482)
  {
    if (v482 == (id)1)
    {
      unsigned char *v583 = 0;
      v483();
      swift_beginAccess();
      unint64_t v484 = (unint64_t)v620;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v484 = sub_10002FCA4(0, *(void *)(v484 + 16) + 1, 1, v484);
      }
      unint64_t v486 = *(void *)(v484 + 16);
      unint64_t v485 = *(void *)(v484 + 24);
      if (v486 >= v485 >> 1) {
        unint64_t v484 = sub_10002FCA4(v485 > 1, v486 + 1, 1, v484);
      }
      *(void *)(v484 + 16) = v486 + 1;
      v487 = (char *)v603 + v484 + v486 * (void)v602;
      v488 = &v615;
LABEL_216:
      ((void (*)(char *, void, uint64_t))v609)(v487, *((void *)v488 - 32), v224);
      v620 = (void *)v484;
      swift_endAccess();
      goto LABEL_217;
    }
    if (v482 == (id)2)
    {
      unsigned char *v582 = 1;
      v483();
      swift_beginAccess();
      unint64_t v484 = (unint64_t)v620;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v484 = sub_10002FCA4(0, *(void *)(v484 + 16) + 1, 1, v484);
      }
      unint64_t v490 = *(void *)(v484 + 16);
      unint64_t v489 = *(void *)(v484 + 24);
      if (v490 >= v489 >> 1) {
        unint64_t v484 = sub_10002FCA4(v489 > 1, v490 + 1, 1, v484);
      }
      *(void *)(v484 + 16) = v490 + 1;
      v487 = (char *)v603 + v484 + v490 * (void)v602;
      v488 = &v614;
      goto LABEL_216;
    }
    v528(v531, v600, v530);
    sub_10001E58C((uint64_t)&_swiftEmptyArrayStorage);
    sub_10001E58C((uint64_t)&_swiftEmptyArrayStorage);
    swift_release();
    _Block_release(v565);
    v524 = "unknown task priority";
    uint64_t v525 = 21;
LABEL_235:
    sub_10002AEDC((uint64_t)v524, v525, 2);
    __break(1u);
LABEL_236:
    swift_release();
    _Block_release(v565);
    sub_100035C60();
    __break(1u);
    JUMPOUT(0x100009F4CLL);
  }
LABEL_217:
  id v491 = [v142 itemType];
  if (v491 == (id)2)
  {
    v504 = sub_100035590();
    os_log_type_t v505 = sub_1000357C0();
    if (os_log_type_enabled(v504, v505))
    {
      v506 = (uint8_t *)swift_slowAlloc();
      v618 = swift_slowAlloc();
      *(_DWORD *)v506 = 136315138;
      swift_beginAccess();
      swift_bridgeObjectRetain();
      uint64_t v507 = sub_1000356D0();
      unint64_t v509 = v508;
      swift_bridgeObjectRelease();
      uint64_t v616 = sub_10003007C(v507, v509, (uint64_t *)&v618);
      sub_1000359B0();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v504, v505, "Consulting Search datasource for lists {itemType: taskList, criteria: %s}", v506, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    uint64_t v510 = v604;
    v511 = v597;
    uint64_t v512 = *(void *)&v597[OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_dataSource
                          + 24];
    uint64_t v513 = *(void *)&v597[OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_dataSource
                          + 32];
    sub_10000A024(&v597[OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_dataSource], v512);
    swift_beginAccess();
    v514 = v619;
    v515 = (void *)swift_allocObject();
    v515[2] = v511;
    v515[3] = sub_100009FD8;
    v515[4] = v510;
    v516 = *(void (**)(void *, void (*)(uint64_t), void *, uint64_t, uint64_t))(v513 + 32);
    swift_retain();
    swift_bridgeObjectRetain();
    id v517 = v511;
    v516(v514, sub_10000A0A8, v515, v512, v513);
    goto LABEL_225;
  }
  uint64_t v492 = v604;
  if (v491 == (id)3)
  {
    v493 = sub_100035590();
    os_log_type_t v494 = sub_1000357C0();
    if (os_log_type_enabled(v493, v494))
    {
      v495 = (uint8_t *)swift_slowAlloc();
      v618 = swift_slowAlloc();
      *(_DWORD *)v495 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v496 = sub_1000356D0();
      unint64_t v498 = v497;
      swift_bridgeObjectRelease();
      uint64_t v617 = sub_10003007C(v496, v498, (uint64_t *)&v618);
      uint64_t v492 = v604;
      sub_1000359B0();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v493, v494, "Consulting Search datasource for reminders {itemType: task, criteria: %s}", v495, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    uint64_t v499 = *(void *)&v597[OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_dataSource
                          + 24];
    uint64_t v500 = *(void *)&v597[OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_dataSource
                          + 32];
    sub_10000A024(&v597[OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_dataSource], v499);
    v501 = v620;
    uint64_t v502 = swift_allocObject();
    *(void *)(v502 + 16) = sub_100009FD8;
    *(void *)(v502 + 24) = v492;
    v503 = *(void (**)(void *, void (*)(unint64_t), uint64_t, uint64_t, uint64_t))(v500 + 24);
    swift_bridgeObjectRetain();
    swift_retain();
    v503(v501, sub_10000A0EC, v502, v499, v500);
LABEL_225:
    swift_bridgeObjectRelease();
    swift_release();
    goto LABEL_229;
  }
  v518 = sub_100035590();
  os_log_type_t v519 = sub_1000357B0();
  if (os_log_type_enabled(v518, v519))
  {
    v520 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v520 = 0;
    _os_log_impl((void *)&_mh_execute_header, v518, v519, "Unhandled itemType. Should have been cleaned up in resolve(). Return failure search result.", v520, 2u);
    swift_slowDealloc();
  }

  id v521 = [objc_allocWithZone((Class)INSearchForNotebookItemsIntentResponse) initWithCode:4 userActivity:0];
  (*((void (**)(const void *, id))v565 + 2))(v565, v521);

LABEL_229:
  sub_10000A1C0((uint64_t)v74, &qword_1000462C0);
  swift_bridgeObjectRelease();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_100009F5C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100009FA0()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100009FD8()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_100009FEC(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void *sub_10000A024(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10000A068()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_10000A0A8(uint64_t a1)
{
  sub_1000037F8(a1, *(void **)(v1 + 16), *(void (**))(v1 + 24));
}

uint64_t sub_10000A0B4()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_10000A0EC(unint64_t a1)
{
  sub_1000032D4(a1, *(void (**))(v1 + 16));
}

uint64_t sub_10000A0F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100009F5C((uint64_t *)&unk_100046550);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000A15C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100009F5C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000A1C0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100009F5C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_10000A21C()
{
  unint64_t result = qword_100046310;
  if (!qword_100046310)
  {
    sub_10000A278(&qword_100046308);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100046310);
  }
  return result;
}

uint64_t sub_10000A278(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void *sub_10000A2C0(unint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t *__return_ptr, id *, uint64_t))
{
  if (a1 >> 62) {
    goto LABEL_16;
  }
  uint64_t v7 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t result = &_swiftEmptyArrayStorage;
    if (!v7) {
      break;
    }
    uint64_t v15 = &_swiftEmptyArrayStorage;
    uint64_t result = (void *)sub_100035B00();
    if (v7 < 0)
    {
      __break(1u);
      return result;
    }
    uint64_t v9 = 0;
    while (v7 != v9)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v10 = (id)sub_100035AB0();
      }
      else {
        id v10 = *(id *)(a1 + 8 * v9 + 32);
      }
      uint64_t v11 = v10;
      id v13 = v10;
      a4(&v14, &v13, a2);

      if (v4) {
        return (void *)swift_release();
      }
      ++v9;
      sub_100035AE0();
      sub_100035B10();
      sub_100035B20();
      sub_100035AF0();
      if (v7 == v9) {
        return v15;
      }
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_100035C00();
    swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t *sub_10000A434(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_10000A498(uint64_t a1, unint64_t *a2)
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

uint64_t sub_10000A4D4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void type metadata accessor for INTaskReference(uint64_t a1)
{
}

void type metadata accessor for REMSmartListType(uint64_t a1)
{
}

void sub_10000A54C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_10000A594()
{
  return sub_10000A5FC(&qword_100046358);
}

uint64_t sub_10000A5C8()
{
  return sub_10000A5FC(&qword_100046360);
}

uint64_t sub_10000A5FC(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for REMSmartListType(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000A640()
{
  return sub_10000A5FC(&qword_100046368);
}

uint64_t sub_10000A678()
{
  uint64_t v0 = sub_1000355A0();
  sub_10000A434(v0, qword_1000463E0);
  uint64_t v1 = sub_100009FEC(v0, (uint64_t)qword_1000463E0);
  if (qword_1000460A0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100009FEC(v0, (uint64_t)qword_1000472B0);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

void sub_10000A740(unint64_t a1, void (*a2)(id))
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = (char *)sub_100035C00();
    swift_bridgeObjectRelease();
    if ((uint64_t)v4 > 0) {
      goto LABEL_3;
    }
LABEL_30:
    if (qword_100046060 != -1) {
      swift_once();
    }
    uint64_t v31 = sub_1000355A0();
    sub_100009FEC(v31, (uint64_t)qword_1000463E0);
    uint64_t v32 = sub_100035590();
    os_log_type_t v33 = sub_1000357C0();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v34 = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, v33, "No reminder matches with the term {result: .unsupported}", v34, 2u);
      swift_slowDealloc();
    }

    sub_10000A498(0, (unint64_t *)&unk_1000465A0);
    id v29 = [(id)swift_getObjCClassFromMetadata() unsupported];
    goto LABEL_35;
  }
  uint64_t v4 = *(char **)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if ((uint64_t)v4 <= 0) {
    goto LABEL_30;
  }
LABEL_3:
  if (v4 == (char *)1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      sub_100035AB0();
    }
    else
    {
      if (!*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        goto LABEL_38;
      }
      id v5 = *(id *)(a1 + 32);
    }
    sub_10000A498(0, &qword_100046318);
    uint64_t v4 = (char *)sub_1000358F0();
    if (qword_100046060 == -1)
    {
LABEL_8:
      uint64_t v6 = sub_1000355A0();
      sub_100009FEC(v6, (uint64_t)qword_1000463E0);
      swift_bridgeObjectRetain_n();
      uint64_t v7 = sub_100035590();
      os_log_type_t v8 = sub_1000357C0();
      if (os_log_type_enabled(v7, v8))
      {
        uint64_t v9 = (uint8_t *)swift_slowAlloc();
        id v10 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v9 = 138412290;
        if ((a1 & 0xC000000000000001) != 0) {
          id v11 = (id)sub_100035AB0();
        }
        else {
          id v11 = *(id *)(a1 + 32);
        }
        id v30 = v11;
        uint64_t v35 = v11;
        sub_1000359B0();
        *id v10 = v30;
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v7, v8, "One reminder matches with the term {result: .success(%@)}", v9, 0xCu);
        sub_100009F5C((uint64_t *)&unk_1000462F0);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      id v29 = [self successWithResolvedTask:v4];

      goto LABEL_35;
    }
LABEL_38:
    swift_once();
    goto LABEL_8;
  }
  if (qword_100046060 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_1000355A0();
  sub_100009FEC(v12, (uint64_t)qword_1000463E0);
  id v13 = sub_100035590();
  os_log_type_t v14 = sub_1000357C0();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Multiple reminders match with the term {result: .disambiguation}", v15, 2u);
    swift_slowDealloc();
  }

  swift_bridgeObjectRetain_n();
  uint64_t v16 = sub_100035590();
  os_log_type_t v17 = sub_1000357C0();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    uint64_t v35 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v18 = 136315138;
    sub_10000A498(0, (unint64_t *)&unk_100046800);
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_1000356D0();
    unint64_t v21 = v20;
    swift_bridgeObjectRelease();
    sub_10003007C(v19, v21, (uint64_t *)&v35);
    sub_1000359B0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "Matching reminders: %s", v18, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v35 = &_swiftEmptyArrayStorage;
  sub_100035B00();
  sub_10000A498(0, &qword_100046318);
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v22 = 0;
    do
    {
      uint64_t v23 = v22 + 1;
      sub_100035AB0();
      sub_1000358F0();
      sub_100035AE0();
      sub_100035B10();
      sub_100035B20();
      sub_100035AF0();
      uint64_t v22 = v23;
    }
    while (v4 != v23);
  }
  else
  {
    uint64_t v24 = (void **)(a1 + 32);
    do
    {
      uint64_t v25 = *v24++;
      id v26 = v25;
      sub_1000358F0();
      sub_100035AE0();
      sub_100035B10();
      sub_100035B20();
      sub_100035AF0();
      --v4;
    }
    while (v4);
  }
  uint64_t v27 = self;
  Class isa = sub_1000356B0().super.isa;
  swift_bridgeObjectRelease();
  id v29 = [v27 disambiguationWithTasksToDisambiguate:isa];

LABEL_35:
  a2(v29);
}

void sub_10000AF00(void **a1, uint64_t a2, id a3, uint64_t a4, uint64_t a5, void *a6, void (*a7)(void))
{
  uint64_t v9 = a4;
  id v10 = a3;
  uint64_t v12 = *a1;
  if (*a1)
  {
    uint64_t v13 = qword_100046060;
    id v14 = v12;
    if (v13 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_1000355A0();
    sub_100009FEC(v15, (uint64_t)qword_1000463E0);
    id v16 = v14;
    os_log_type_t v17 = sub_100035590();
    os_log_type_t v18 = sub_1000357C0();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      uint64_t v44 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v19 = 138412290;
      uint64_t v43 = v19 + 4;
      id v48 = v16;
      id v20 = v16;
      sub_1000359B0();
      *uint64_t v44 = v12;

      _os_log_impl((void *)&_mh_execute_header, v17, v18, "Populating contactRepresentation {contactRepresentation: %@}", v19, 0xCu);
      sub_100009F5C((uint64_t *)&unk_1000462F0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    uint64_t v9 = a4;
    id v21 = v16;
    sub_1000350A0();

    id v10 = a3;
  }
  id v48 = 0;
  unsigned int v22 = [v10 saveSynchronouslyWithError:&v48 v43];
  id v23 = v48;
  if (!v22) {
    goto LABEL_11;
  }
  id v24 = v48;
  sub_100035050();
  swift_retain();
  sub_100035040();
  swift_release();
  uint64_t v25 = *(void **)(v9 + OBJC_IVAR____TtC25RemindersIntentsExtension32TTRSetTaskAttributeIntentHandler_store);
  id v48 = 0;
  id v26 = [v25 fetchReminderWithObjectID:a5 error:&v48];
  id v23 = v48;
  if (v26)
  {
    uint64_t v27 = v26;
    id v28 = objc_allocWithZone((Class)INSetTaskAttributeIntentResponse);
    id v29 = v23;
    id v30 = [v28 initWithCode:3 userActivity:0];
    sub_10000A498(0, &qword_100046318);
    id v31 = v27;
    uint64_t v32 = (void *)sub_1000358F0();
    [v30 setModifiedTask:v32];

    id v48 = a6;
    id v33 = [*(id *)(a2 + 16) accountCapabilities];
    sub_10000A498(0, &qword_100046560);
    uint64_t v34 = sub_100035220();

    [v30 setWarnings:v34];
    ((void (*)(id))a7)(v30);
  }
  else
  {
LABEL_11:
    id v35 = v23;
    sub_100034E50();

    swift_willThrow();
    if (qword_100046060 != -1) {
      swift_once();
    }
    uint64_t v36 = sub_1000355A0();
    sub_100009FEC(v36, (uint64_t)qword_1000463E0);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v37 = sub_100035590();
    os_log_type_t v38 = sub_1000357A0();
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v39 = (uint8_t *)swift_slowAlloc();
      id v48 = (id)swift_slowAlloc();
      *(_DWORD *)uint64_t v39 = 136315138;
      swift_getErrorValue();
      uint64_t v40 = sub_100035C90();
      sub_10003007C(v40, v41, (uint64_t *)&v48);
      sub_1000359B0();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v37, v38, "Error saving saveRequest {error: %s}", v39, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    id v42 = [objc_allocWithZone((Class)INSetTaskAttributeIntentResponse) initWithCode:4 userActivity:0];
    a7();

    swift_errorRelease();
  }
}

void sub_10000B4CC(void *a1, int a2, void *a3, void *aBlock, void (*a5)(id, id, void *))
{
  os_log_type_t v8 = _Block_copy(aBlock);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a1;
  a5(v9, v10, v8);
  _Block_release(v8);
  _Block_release(v8);
}

id sub_10000B590()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TTRSetTaskAttributeIntentHandler();
  [super dealloc];
}

uint64_t type metadata accessor for TTRSetTaskAttributeIntentHandler()
{
  return self;
}

_UNKNOWN **sub_10000B664()
{
  return &off_100041DB8;
}

_UNKNOWN **sub_10000B670()
{
  return &off_1000421D0;
}

_UNKNOWN **sub_10000B67C()
{
  return &off_100041730;
}

void sub_10000B688(void *a1, uint64_t a2, void (**a3)(void, void))
{
  uint64_t v6 = sub_100035290();
  uint64_t v44 = *(void *)(v6 - 8);
  uint64_t v45 = v6;
  __chkstk_darwin(v6);
  uint64_t v43 = (BOOL *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = swift_allocObject();
  *(void *)(v46 + 16) = a3;
  _Block_copy(a3);
  if (qword_100046060 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_1000355A0();
  uint64_t v9 = sub_100009FEC(v8, (uint64_t)qword_1000463E0);
  id v10 = a1;
  id v11 = sub_100035590();
  os_log_type_t v12 = sub_1000357C0();
  p_align = &stru_100044FE8.align;
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v42 = v9;
    uint64_t v15 = (uint8_t *)v14;
    unint64_t v41 = swift_slowAlloc();
    unint64_t v48 = v41;
    *(_DWORD *)uint64_t v15 = 136315138;
    id v16 = a3;
    uint64_t v17 = a2;
    id v18 = [v10 targetTask:v15 + 4 v41];
    uint64_t v47 = (uint64_t)v18;
    sub_100009F5C(&qword_100046568);
    uint64_t v19 = sub_1000359A0();
    unint64_t v21 = v20;

    a2 = v17;
    a3 = v16;
    uint64_t v47 = sub_10003007C(v19, v21, (uint64_t *)&v48);
    sub_1000359B0();

    p_align = (_DWORD *)(&stru_100044FE8 + 24);
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "SiriKit asked for resolving target task {targetTask: %s}", v15, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v22 = [v10 *((SEL *)p_align + 167)];
  if (v22)
  {
    id v23 = v22;
    BOOL v24 = [v10 status] == (id)1;
    id v26 = v43;
    uint64_t v25 = v44;
    *uint64_t v43 = v24;
    uint64_t v27 = v45;
    (*(void (**)(BOOL *, void, uint64_t))(v25 + 104))(v26, enum case for REMSearchCriterion.isCompleted(_:), v45);
    uint64_t v28 = *(void *)(a2 + OBJC_IVAR____TtC25RemindersIntentsExtension32TTRSetTaskAttributeIntentHandler_dataSource + 32);
    unint64_t v41 = *(void *)(a2 + OBJC_IVAR____TtC25RemindersIntentsExtension32TTRSetTaskAttributeIntentHandler_dataSource + 24);
    uint64_t v42 = v28;
    uint64_t v40 = sub_10000A024((void *)(a2 + OBJC_IVAR____TtC25RemindersIntentsExtension32TTRSetTaskAttributeIntentHandler_dataSource), v41);
    sub_100009F5C(&qword_1000467F0);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_100038880;
    *(void *)(inited + 32) = v23;
    unint64_t v48 = inited;
    sub_1000356E0();
    unint64_t v30 = v48;
    sub_100009F5C(&qword_1000465B0);
    unint64_t v31 = (*(unsigned __int8 *)(v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);
    uint64_t v32 = swift_allocObject();
    *(_OWORD *)(v32 + 16) = xmmword_100038870;
    (*(void (**)(unint64_t, BOOL *, uint64_t))(v25 + 16))(v32 + v31, v26, v27);
    uint64_t v33 = swift_allocObject();
    uint64_t v34 = v46;
    *(void *)(v33 + 16) = sub_100009FD8;
    *(void *)(v33 + 24) = v34;
    id v35 = v23;
    swift_retain();
    sub_10000D4A0(v30, v32, (void (*)(uint64_t))sub_10000D490, v33, v41, v42);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();

    (*(void (**)(BOOL *, uint64_t))(v25 + 8))(v26, v27);
    swift_release();
  }
  else
  {
    uint64_t v36 = sub_100035590();
    os_log_type_t v37 = sub_1000357A0();
    if (os_log_type_enabled(v36, v37))
    {
      os_log_type_t v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v38 = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, v37, "INSetTaskAttributeIntent contains nil targetTask, returning INTask.disambiguateWithIncompleteReminders", v38, 2u);
      swift_slowDealloc();
    }

    sub_10000A498(0, &qword_100046318);
    sub_10000A498(0, (unint64_t *)&unk_1000465A0);
    uint64_t v39 = (void *)sub_1000358A0();
    ((void (**)(void, void *))a3)[2](a3, v39);
    swift_release();
  }
}

uint64_t sub_10000BBCC(void *a1)
{
  id v2 = [a1 contactEventTrigger];

  if (v2) {
    return 0;
  }
  if ([a1 priority]) {
    return 0;
  }
  id v3 = [a1 spatialEventTrigger];

  if (v3) {
    return 0;
  }
  if ([a1 status]) {
    return 0;
  }
  id v4 = [a1 taskTitle];

  if (v4) {
    return 0;
  }
  id v5 = [a1 temporalEventTrigger];
  if (v5)
  {

    return 0;
  }
  return 1;
}

void sub_10000BCA8(void *a1, uint64_t a2)
{
  if (qword_100046060 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_1000355A0();
  sub_100009FEC(v4, (uint64_t)qword_1000463E0);
  id v5 = a1;
  uint64_t v6 = sub_100035590();
  os_log_type_t v7 = sub_1000357C0();
  p_align = &stru_100044FE8.align;
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    unint64_t v31 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315138;
    id v10 = [v5 taskTitle];
    sub_100009F5C(&qword_100046598);
    uint64_t v11 = sub_1000359A0();
    unint64_t v13 = v12;

    uint64_t v14 = v11;
    p_align = (_DWORD *)(&stru_100044FE8 + 24);
    sub_10003007C(v14, v13, (uint64_t *)&v31);
    sub_1000359B0();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "SiriKit asked for resolving task title {taskTitle: %s}", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v15 = [v5 *((SEL *)p_align + 169)];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = v15;
    id v18 = sub_100035590();
    os_log_type_t v19 = sub_1000357C0();
    if (os_log_type_enabled(v18, v19))
    {
      unint64_t v20 = (uint8_t *)swift_slowAlloc();
      unint64_t v21 = (void *)swift_slowAlloc();
      *(_DWORD *)unint64_t v20 = 138412290;
      unint64_t v31 = v17;
      id v22 = v17;
      sub_1000359B0();
      void *v21 = v16;

      _os_log_impl((void *)&_mh_execute_header, v18, v19, "Resolving TaskTitle, got new task title, returning success {taskTitle: %@}", v20, 0xCu);
      sub_100009F5C((uint64_t *)&unk_1000462F0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      id v18 = v17;
    }

    id v29 = [self successWithResolvedString:v17];
    (*(void (**)(uint64_t, id))(a2 + 16))(a2, v29);
  }
  else
  {
    char v23 = sub_10000BBCC(v5);
    BOOL v24 = sub_100035590();
    os_log_type_t v25 = sub_1000357C0();
    BOOL v26 = os_log_type_enabled(v24, v25);
    if (v23)
    {
      if (v26)
      {
        uint64_t v27 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v27 = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, v25, "Resolving TaskTitle, nothing to do, returning .needsValue()", v27, 2u);
        swift_slowDealloc();
      }

      sub_10000A498(0, &qword_100046590);
      id v28 = [(id)swift_getObjCClassFromMetadata() needsValue];
    }
    else
    {
      if (v26)
      {
        unint64_t v30 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v30 = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, v25, "Resolving TaskTitle, no title, other stuff to do, returning .notRequired()", v30, 2u);
        swift_slowDealloc();
      }

      sub_10000A498(0, &qword_100046590);
      id v28 = [(id)swift_getObjCClassFromMetadata() notRequired];
    }
    id v29 = v28;
    (*(void (**)(uint64_t, id))(a2 + 16))(a2, v29);
  }
}

void sub_10000C168(void *a1, char *a2, const void *a3)
{
  BOOL v138 = a2;
  uint64_t v5 = sub_1000351B0();
  uint64_t v127 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v125 = (uint64_t)&v116 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100009F5C(&qword_100046B40);
  uint64_t v8 = ((uint64_t (*)(uint64_t))__chkstk_darwin)(v7 - 8);
  uint64_t v130 = (char *)&v116 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v134 = (uint64_t)&v116 - v10;
  uint64_t v133 = sub_100034E30();
  uint64_t v132 = *(void *)(v133 - 8);
  __chkstk_darwin(v133);
  v131 = (char *)&v116 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100009F5C((uint64_t *)&unk_100046550);
  uint64_t v13 = ((uint64_t (*)(uint64_t))__chkstk_darwin)(v12 - 8);
  uint64_t v126 = (char *)&v116 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = ((uint64_t (*)(uint64_t))__chkstk_darwin)(v13);
  uint64_t v129 = (uint64_t)&v116 - v16;
  __chkstk_darwin(v15);
  id v18 = (char *)&v116 - v17;
  uint64_t v19 = sub_1000355A0();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = ((uint64_t (*)(uint64_t))__chkstk_darwin)(v19);
  uint64_t v123 = (char *)&v116 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = ((uint64_t (*)(uint64_t))__chkstk_darwin)(v21);
  uint64_t v121 = (char *)&v116 - v24;
  __chkstk_darwin(v23);
  BOOL v26 = (char *)&v116 - v25;
  uint64_t v27 = swift_allocObject();
  *(void *)(v27 + 16) = a3;
  v136 = a3;
  _Block_copy(a3);
  if (qword_100046060 != -1) {
    swift_once();
  }
  uint64_t v28 = sub_100009FEC(v19, (uint64_t)qword_1000463E0);
  id v29 = *(void (**)(char *, uint64_t, uint64_t))(v20 + 16);
  uint64_t v120 = v20 + 16;
  uint64_t v119 = v29;
  v29(v26, v28, v19);
  sub_100009F5C(&qword_1000462D0);
  uint64_t v30 = v19;
  uint64_t inited = swift_initStackObject();
  long long v124 = xmmword_100038870;
  *(_OWORD *)(inited + 16) = xmmword_100038870;
  *(void *)(inited + 32) = 0x746E65746E69;
  *(void *)(inited + 40) = 0xE600000000000000;
  *(void *)(inited + 72) = sub_10000A498(0, &qword_100046560);
  *(void *)(inited + 48) = a1;
  id v32 = a1;
  sub_10001E58C(inited);
  sub_10002B160();
  swift_bridgeObjectRelease();
  uint64_t v33 = *(void (**)(char *, uint64_t))(v20 + 8);
  uint64_t v122 = v30;
  v33(v26, v30);
  uint64_t v34 = v32;
  uint64_t v135 = v28;
  id v35 = sub_100035590();
  os_log_type_t v36 = sub_1000357C0();
  BOOL v37 = os_log_type_enabled(v35, v36);
  uint64_t v128 = v5;
  if (v37)
  {
    uint64_t v38 = swift_slowAlloc();
    os_log_type_t v137 = (char *)v27;
    uint64_t v39 = (uint8_t *)v38;
    uint64_t v40 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v39 = 138412290;
    v139[0] = (uint64_t)v34;
    unint64_t v41 = v18;
    uint64_t v42 = v34;
    sub_1000359B0();
    *uint64_t v40 = v34;

    id v18 = v41;
    _os_log_impl((void *)&_mh_execute_header, v35, v36, "SiriKit asked for handling set task attribute intent {intent: %@}", v39, 0xCu);
    sub_100009F5C((uint64_t *)&unk_1000462F0);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v27 = (uint64_t)v137;
    swift_slowDealloc();
  }
  else
  {

    id v35 = v34;
  }

  id v43 = [v34 targetTask];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)&v138[OBJC_IVAR____TtC25RemindersIntentsExtension32TTRSetTaskAttributeIntentHandler_store];
    uint64_t v46 = (void *)sub_1000358C0();

    if (v46)
    {
      id v118 = [v46 objectID];
      id v47 = [objc_allocWithZone((Class)REMSaveRequest) initWithStore:v45];
      sub_100035150();
      uint64_t v140 = (uint64_t)v46;
      id v48 = v47;
      id v117 = v46;
      id v116 = v48;
      sub_100035080();
      uint64_t v49 = v139[0];
      id v50 = [v34 taskTitle];
      if (v50)
      {
        uint64_t v51 = v50;
        id v52 = [v50 spokenPhrase];
        sub_100035630();
        uint64_t v53 = v34;

        id v54 = objc_allocWithZone((Class)NSAttributedString);
        NSString v55 = sub_100035600();
        swift_bridgeObjectRelease();
        uint64_t v56 = (objc_class *)[v54 initWithString:v55];

        v57.super.Class isa = v56;
        v142.value._countAndFlagsBits = 0;
        v142.value._object = 0;
        sub_100035110(v57, v142, 1);

        uint64_t v34 = v53;
      }
      id v58 = [v34 status];
      uint64_t v59 = v133;
      uint64_t v60 = (uint64_t)v130;
      if (v58)
      {
        if (v58 != (id)1 && v58 != (id)2)
        {
          v119(v121, v135, v122);
          sub_10001E58C((uint64_t)&_swiftEmptyArrayStorage);
          sub_10001E58C((uint64_t)&_swiftEmptyArrayStorage);
          swift_release();
          _Block_release(v136);
          uint64_t v114 = "unknown status";
          uint64_t v115 = 14;
          goto LABEL_50;
        }
        sub_100035130();
      }
      id v71 = [*(id *)(v49 + 16) accountCapabilities];
      unsigned int v72 = [v71 supportsFlagged];

      if (!v72 || (id v73 = [v34 priority]) == 0)
      {
LABEL_26:
        id v75 = [v34 spatialEventTrigger];
        uint64_t v76 = v132;
        if (v75)
        {
          uint64_t v77 = v75;
          uint64_t v78 = v34;
          sub_10000A498(0, &qword_100046580);
          id v79 = v77;
          uint64_t v80 = sub_100035870();
          if (v80)
          {
            uint64_t v81 = (void *)v80;
            sub_1000350C0();
          }
          sub_10000A498(0, &qword_100046588);
          id v82 = v79;
          uint64_t v83 = sub_100035860();
          if (v83)
          {
            uint64_t v84 = (void *)v83;
            sub_1000350B0();

            id v82 = v84;
          }
          uint64_t v34 = v78;
        }
        id v85 = [v34 temporalEventTrigger];
        if (v85)
        {
          uint64_t v86 = v85;
          sub_100035840();
        }
        else
        {
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v76 + 56))(v18, 1, 1, v59);
        }
        uint64_t v87 = v129;
        sub_10000A15C((uint64_t)v18, v129, (uint64_t *)&unk_100046550);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v76 + 48))(v87, 1, v59) == 1)
        {
          uint64_t v88 = (uint64_t *)&unk_100046550;
          uint64_t v89 = v87;
        }
        else
        {
          uint64_t v90 = v87;
          uint64_t v91 = v131;
          (*(void (**)(char *, uint64_t, uint64_t))(v76 + 32))(v131, v90, v59);
          uint64_t v92 = (uint64_t)v126;
          (*(void (**)(char *, char *, uint64_t))(v76 + 16))(v126, v91, v59);
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v76 + 56))(v92, 0, 1, v59);
          sub_1000350E0();
          sub_10000A1C0(v92, (uint64_t *)&unk_100046550);
          if ([v34 temporalEventTrigger])
          {
            sub_10000D3F4((uint64_t)&v138[OBJC_IVAR____TtC25RemindersIntentsExtension32TTRSetTaskAttributeIntentHandler_timeProvider], (uint64_t)v139);
            sub_1000351A0();
            uint64_t v93 = v128;
            uint64_t v94 = v127;
          }
          else
          {
            uint64_t v94 = v127;
            uint64_t v93 = v128;
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v127 + 56))(v134, 1, 1, v128);
          }
          sub_10000A15C(v134, v60, &qword_100046B40);
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v94 + 48))(v60, 1, v93) != 1)
          {
            uint64_t v95 = v125;
            sub_10000D2D0(v60, v125);
            sub_100009F5C(&qword_100046578);
            unint64_t v96 = (*(unsigned __int8 *)(v94 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v94 + 80);
            uint64_t v97 = (_OWORD *)swift_allocObject();
            v97[1] = v124;
            sub_10000D334(v95, (uint64_t)v97 + v96);
            v141.value._rawValue = v97;
            v141.is_nil = 0;
            sub_1000350D0(v141, v98);
            swift_setDeallocating();
            swift_arrayDestroy();
            swift_deallocClassInstance();
            sub_10000D398(v95);
            sub_10000A1C0(v134, &qword_100046B40);
            (*(void (**)(char *, uint64_t))(v76 + 8))(v131, v133);
            goto LABEL_44;
          }
          sub_10000A1C0(v134, &qword_100046B40);
          (*(void (**)(char *, uint64_t))(v76 + 8))(v131, v59);
          uint64_t v89 = v60;
          uint64_t v88 = &qword_100046B40;
        }
        sub_10000A1C0(v89, v88);
LABEL_44:
        os_log_type_t v137 = v18;
        uint64_t v99 = v34;
        id v100 = [v34 contactEventTrigger];
        id v101 = [v100 triggerContact];

        if (v101)
        {
          uint64_t v102 = sub_10000A024(&v138[OBJC_IVAR____TtC25RemindersIntentsExtension32TTRSetTaskAttributeIntentHandler_contactRepresentationResolver], *(void *)&v138[OBJC_IVAR____TtC25RemindersIntentsExtension32TTRSetTaskAttributeIntentHandler_contactRepresentationResolver+ 24]);
          *(double *)&long long v103 = __chkstk_darwin(v102);
          *((_OWORD *)&v116 - 2) = v103;
          *(&v116 - 2) = v101;
          sub_100009F5C(&qword_100046570);
          swift_allocObject();
          id v104 = v101;
          sub_100035560();

          swift_retain();
        }
        else
        {
          v139[0] = 0;
          sub_100009F5C(&qword_100046570);
          swift_allocObject();
          sub_100035550();
        }
        uint64_t v105 = (void *)swift_allocObject();
        uint64_t v106 = v116;
        v105[2] = v49;
        v105[3] = v106;
        uint64_t v107 = v138;
        uint64_t v108 = v118;
        v105[4] = v138;
        v105[5] = v108;
        v105[6] = v99;
        v105[7] = sub_10000D498;
        v105[8] = v27;
        uint64_t v109 = v99;
        id v110 = v106;
        swift_retain();
        id v111 = v107;
        id v112 = v108;
        swift_retain();
        uint64_t v113 = (void *)sub_1000354F0();
        sub_100035530();

        swift_release();
        swift_release();

        swift_release();
        swift_release();
        swift_release();

        sub_10000A1C0((uint64_t)v137, (uint64_t *)&unk_100046550);
        swift_release();
        return;
      }
      if (v73 == (id)1)
      {
        Swift::Bool v74 = 0;
LABEL_25:
        sub_100035140(v74);
        goto LABEL_26;
      }
      if (v73 == (id)2)
      {
        Swift::Bool v74 = 1;
        goto LABEL_25;
      }
      v119(v123, v135, v122);
      sub_10001E58C((uint64_t)&_swiftEmptyArrayStorage);
      sub_10001E58C((uint64_t)&_swiftEmptyArrayStorage);
      swift_release();
      _Block_release(v136);
      uint64_t v114 = "unknown priority";
      uint64_t v115 = 16;
LABEL_50:
      sub_10002AEDC((uint64_t)v114, v115, 2);
      __break(1u);
      return;
    }
  }
  uint64_t v61 = v34;
  uint64_t v62 = sub_100035590();
  os_log_type_t v63 = sub_1000357A0();
  if (os_log_type_enabled(v62, v63))
  {
    uint64_t v64 = (uint8_t *)swift_slowAlloc();
    uint64_t v65 = swift_slowAlloc();
    os_log_type_t v137 = (char *)v27;
    v139[0] = v65;
    *(_DWORD *)uint64_t v64 = 136315138;
    id v66 = [v61 targetTask];
    uint64_t v140 = (uint64_t)v66;
    sub_100009F5C(&qword_100046568);
    uint64_t v67 = sub_1000359A0();
    unint64_t v69 = v68;

    uint64_t v140 = sub_10003007C(v67, v69, v139);
    sub_1000359B0();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v62, v63, "Should have resolved targetTask into a reminder. {targetTask: %s}", v64, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v70 = [objc_allocWithZone((Class)INSetTaskAttributeIntentResponse) initWithCode:4 userActivity:0];
  (*((void (**)(const void *, id))v136 + 2))(v136, v70);
  swift_release();
}

uint64_t sub_10000D204()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000D23C()
{
  swift_release();

  swift_release();

  return _swift_deallocObject(v0, 72, 7);
}

void sub_10000D29C(void **a1)
{
  sub_10000AF00(a1, *(void *)(v1 + 16), *(id *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void **)(v1 + 48), *(void (**)(void))(v1 + 56));
}

void sub_10000D2C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_10002BD90(a1, a2, a3, a4, *(uint64_t (**)(uint64_t))(v4 + 16), *(void *)(v4 + 24), *(void **)(v4 + 32));
}

uint64_t sub_10000D2D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000351B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000D334(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000351B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000D398(uint64_t a1)
{
  uint64_t v2 = sub_1000351B0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000D3F4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000D458()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_10000D490(unint64_t a1)
{
  sub_10000A740(a1, *(void (**)(id))(v1 + 16));
}

void sub_10000D4A0(unint64_t a1, uint64_t a2, void (*a3)(uint64_t), uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v43 = a6;
  uint64_t v42 = a5;
  uint64_t v51 = sub_100035290();
  uint64_t v10 = *(void *)(v51 - 8);
  __chkstk_darwin(v51);
  uint64_t v12 = (uint64_t *)((char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v54 = (unint64_t)&_swiftEmptyArrayStorage;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_100035C00();
  }
  else
  {
    uint64_t v13 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  uint64_t v45 = a3;
  uint64_t v46 = a4;
  uint64_t v41 = a2;
  if (v13)
  {
    if (v13 < 1)
    {
      __break(1u);
      return;
    }
    uint64_t v14 = 0;
    unint64_t v52 = a1 & 0xC000000000000001;
    unsigned int v50 = enum case for REMStringMatchingStyle.prefix(_:);
    unsigned int v49 = enum case for REMSearchCriterion.textualField(_:);
    uint64_t v47 = v10 + 32;
    id v48 = (void (**)(uint64_t *, void, uint64_t))(v10 + 104);
    uint64_t v15 = &_swiftEmptyArrayStorage;
    do
    {
      if (v52) {
        id v18 = (id)sub_100035AB0();
      }
      else {
        id v18 = *(id *)(a1 + 8 * v14 + 32);
      }
      uint64_t v17 = v18;
      uint64_t v19 = (void *)sub_1000358B0();
      if (v19)
      {
        id v16 = v19;
        sub_1000356A0();
        if (*(void *)((v54 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v54 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_1000356F0();
        }
        sub_100035700();
        sub_1000356E0();

        uint64_t v17 = v16;
      }
      else
      {
        id v20 = [v17 title];
        id v21 = [v20 spokenPhrase];

        uint64_t v22 = sub_100035630();
        uint64_t v24 = v23;

        uint64_t v25 = (char *)v12 + *(int *)(sub_100009F5C(&qword_1000462E8) + 48);
        *uint64_t v12 = v22;
        v12[1] = v24;
        uint64_t v26 = sub_1000353B0();
        (*(void (**)(char *, void, uint64_t))(*(void *)(v26 - 8) + 104))(v25, v50, v26);
        (*v48)(v12, v49, v51);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v15 = (void *)sub_10002FCA4(0, v15[2] + 1, 1, (unint64_t)v15);
        }
        unint64_t v28 = v15[2];
        unint64_t v27 = v15[3];
        if (v28 >= v27 >> 1) {
          uint64_t v15 = (void *)sub_10002FCA4(v27 > 1, v28 + 1, 1, (unint64_t)v15);
        }
        v15[2] = v28 + 1;
        (*(void (**)(unint64_t, uint64_t *, uint64_t))(v10 + 32))((unint64_t)v15+ ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80))+ *(void *)(v10 + 72) * v28, v12, v51);
      }
      ++v14;
    }
    while (v13 != v14);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v15 = &_swiftEmptyArrayStorage;
  }
  uint64_t v29 = v43;
  uint64_t v30 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v43 + 8);
  uint64_t v31 = swift_bridgeObjectRetain();
  uint64_t v32 = v44;
  uint64_t v33 = v42;
  uint64_t v34 = v30(v31, v42, v29);
  swift_bridgeObjectRelease();
  if (v15[2])
  {
    uint64_t v35 = sub_100009F5C(&qword_100046608);
    __chkstk_darwin(v35);
    *(&v40 - 4) = v33;
    *(&v40 - 3) = v29;
    uint64_t v36 = v41;
    *(&v40 - 2) = v32;
    *(&v40 - 1) = v36;
    swift_bridgeObjectRetain();
    BOOL v37 = sub_10002C464((void (*)(uint64_t *__return_ptr, uint64_t))sub_10000F324, (uint64_t)(&v40 - 6), (uint64_t)v15);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v53 = v37;
    sub_100009F5C(&qword_100046610);
    sub_10000F3DC(&qword_100046618, &qword_100046610);
    sub_100035510();
    swift_bridgeObjectRelease();
    uint64_t v38 = (void *)swift_allocObject();
    v38[2] = v45;
    v38[3] = v46;
    v38[4] = v34;
    swift_retain();
    uint64_t v39 = (void *)sub_1000354F0();
    sub_100035530();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v45(v34);
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_10000D9EC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  sub_100009F5C(&qword_1000465B0);
  uint64_t v3 = sub_100035290();
  uint64_t v4 = *(void *)(v3 - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_100038870;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v4 + 16))(v6 + v5, a1, v3);
  swift_bridgeObjectRetain();
  sub_10000E2A8(v6);
  uint64_t v7 = sub_10000DB64();
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v7;
  return result;
}

uint64_t sub_10000DB64()
{
  return sub_100035560();
}

uint64_t sub_10000DBC8(uint64_t a1, void (*a2)(uint64_t), uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)a1 + 16);
  if (v6)
  {
    swift_bridgeObjectRetain();
    for (uint64_t i = 0; i != v6; ++i)
    {
      unint64_t v8 = swift_bridgeObjectRetain();
      sub_10000E494(v8, (uint64_t (*)(uint64_t, void, unint64_t))sub_10000E9DC);
    }
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  sub_10000E494((unint64_t)&_swiftEmptyArrayStorage, (uint64_t (*)(uint64_t, void, unint64_t))sub_10000E9DC);
  a2(a4);
  return swift_bridgeObjectRelease();
}

uint64_t sub_10000DCC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a1;
  *(void *)(v13 + 24) = a2;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = sub_10000F2C4;
  *(void *)(v14 + 24) = v13;
  uint64_t v15 = *(void (**)(uint64_t, uint64_t (*)(), uint64_t, uint64_t, uint64_t))(a8 + 24);
  swift_retain();
  v15(a6, sub_10000F3B4, v14, a7, a8);

  return swift_release();
}

uint64_t sub_10000DDB0(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t sub_10000DDD8(uint64_t a1, uint64_t a2)
{
  return sub_10000DECC(a1, a2, &qword_1000465F8);
}

uint64_t sub_10000DDF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a1;
  *(void *)(v11 + 24) = a2;
  uint64_t v12 = *(void (**)(uint64_t (*)(), uint64_t, uint64_t, uint64_t))(a7 + 80);
  swift_retain();
  v12(sub_10000F290, v11, a6, a7);

  return swift_release();
}

uint64_t sub_10000DEAC(uint64_t a1, uint64_t a2)
{
  return sub_10000DECC(a1, a2, &qword_100046600);
}

uint64_t sub_10000DECC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_100035560();
}

uint64_t sub_10000DF20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a1;
  *(void *)(v11 + 24) = a2;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = sub_10000F2C4;
  *(void *)(v12 + 24) = v11;
  uint64_t v13 = *(void (**)(uint64_t (*)(), uint64_t, uint64_t, uint64_t))(a7 + 88);
  swift_retain();
  v13(sub_10000F2FC, v12, a6, a7);

  return swift_release();
}

uint64_t sub_10000E000(uint64_t *a1, void (*a2)(void *, void *), uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_100035320();
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *a1;
  uint64_t v40 = &_swiftEmptyArrayStorage;
  uint64_t v14 = *(void *)(v13 + 16);
  if (v14)
  {
    uint64_t v32 = a3;
    uint64_t v33 = a2;
    uint64_t v34 = v4;
    uint64_t v35 = v13;
    uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
    uint64_t v15 = v10 + 16;
    id v16 = v17;
    uint64_t v18 = v13 + ((*(unsigned __int8 *)(v15 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 64));
    uint64_t v19 = *(void *)(v15 + 56);
    uint64_t v36 = v15;
    uint64_t v37 = v9;
    uint64_t v38 = (void (**)(char *, uint64_t))(v15 - 8);
    uint64_t v39 = v19;
    swift_bridgeObjectRetain();
    uint64_t v20 = v18;
    uint64_t v31 = v14;
    uint64_t v21 = v14;
    uint64_t v22 = v37;
    do
    {
      v16(v12, v20, v22);
      uint64_t v23 = v16;
      unint64_t v24 = sub_100035310();
      uint64_t v25 = *v38;
      (*v38)(v12, v22);
      sub_10000E494(v24, (uint64_t (*)(uint64_t, void, unint64_t))sub_10000EE1C);
      v20 += v39;
      --v21;
    }
    while (v21);
    swift_bridgeObjectRelease();
    uint64_t v30 = v40;
    uint64_t v40 = &_swiftEmptyArrayStorage;
    swift_bridgeObjectRetain();
    uint64_t v26 = v37;
    uint64_t v27 = v31;
    do
    {
      v16(v12, v18, v26);
      unint64_t v28 = sub_1000352F0();
      v25(v12, v26);
      sub_10000E494(v28, (uint64_t (*)(uint64_t, void, unint64_t))sub_10000EBFC);
      id v16 = v23;
      v18 += v39;
      --v27;
    }
    while (v27);
    swift_bridgeObjectRelease();
    v33(v30, v40);
  }
  else
  {
    a2(&_swiftEmptyArrayStorage, &_swiftEmptyArrayStorage);
  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_10000E290(unint64_t a1)
{
  return sub_10000E494(a1, (uint64_t (*)(uint64_t, void, unint64_t))sub_10000E7BC);
}

uint64_t sub_10000E2A8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *(void *)(v3 + 24) >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v22 = v4 + v2;
  }
  else {
    int64_t v22 = v4;
  }
  unint64_t v3 = sub_10002FCA4(isUniquelyReferenced_nonNull_native, v22, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = (*(void *)(v3 + 24) >> 1) - v8;
  uint64_t v10 = *(void *)(sub_100035290() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  if (v9 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = v3 + v12 + v11 * v8;
  unint64_t v14 = a1 + v12;
  uint64_t v15 = v11 * v2;
  unint64_t v16 = v13 + v15;
  unint64_t v17 = v14 + v15;
  if (v14 < v16 && v13 < v17) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    unint64_t *v1 = v3;
    return result;
  }
  uint64_t v19 = *(void *)(v3 + 16);
  BOOL v20 = __OFADD__(v19, v2);
  uint64_t v21 = v19 + v2;
  if (!v20)
  {
    *(void *)(v3 + 16) = v21;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_100035C20();
  __break(1u);
  return result;
}

uint64_t sub_10000E44C(unint64_t a1)
{
  return sub_10000E494(a1, (uint64_t (*)(uint64_t, void, unint64_t))sub_10000EBFC);
}

uint64_t sub_10000E464(unint64_t a1)
{
  return sub_10000E494(a1, (uint64_t (*)(uint64_t, void, unint64_t))sub_10000EE1C);
}

uint64_t sub_10000E47C(unint64_t a1)
{
  return sub_10000E494(a1, (uint64_t (*)(uint64_t, void, unint64_t))sub_10000F03C);
}

uint64_t sub_10000E494(unint64_t a1, uint64_t (*a2)(uint64_t, void, unint64_t))
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_100035C00();
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
  uint64_t v17 = sub_100035C00();
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
    uint64_t v11 = sub_100035AC0();
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
    sub_100035C00();
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

  return sub_1000356E0();
}

uint64_t sub_10000E668(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = *v1;
  int64_t v4 = *((void *)*v1 + 2);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  int isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *((void *)v3 + 3) >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v14 = v4 + v2;
  }
  else {
    int64_t v14 = v4;
  }
  unint64_t v3 = sub_10002FCC8(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = *((void *)v3 + 2);
  if ((*((void *)v3 + 3) >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v9 = (unint64_t)&v3[16 * v8 + 32];
  if (a1 + 32 < v9 + 16 * v2 && v9 < a1 + 32 + 16 * v2) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    unint64_t *v1 = v3;
    return result;
  }
  uint64_t v11 = *((void *)v3 + 2);
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    *((void *)v3 + 2) = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_100035C20();
  __break(1u);
  return result;
}

uint64_t sub_10000E7BC(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_100035C00();
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
    uint64_t v10 = sub_100035C00();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_10000F3DC(&qword_100046638, &qword_100046630);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_100009F5C(&qword_100046630);
          BOOL v12 = sub_10003090C(v16, i, a3);
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
    sub_10000A498(0, (unint64_t *)&unk_100046320);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_100035C20();
  __break(1u);
  return result;
}

uint64_t sub_10000E9DC(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_100035C00();
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
    uint64_t v10 = sub_100035C00();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_10000F3DC(&qword_100046628, &qword_100046620);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_100009F5C(&qword_100046620);
          BOOL v12 = sub_10003090C(v16, i, a3);
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
    sub_10000A498(0, (unint64_t *)&unk_100046800);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_100035C20();
  __break(1u);
  return result;
}

uint64_t sub_10000EBFC(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_100035C00();
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
    uint64_t v10 = sub_100035C00();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_10000F3DC(&qword_1000465C8, &qword_1000465C0);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_100009F5C(&qword_1000465C0);
          BOOL v12 = sub_10003090C(v16, i, a3);
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
    sub_10000A498(0, &qword_1000465B8);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_100035C20();
  __break(1u);
  return result;
}

uint64_t sub_10000EE1C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_100035C00();
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
    uint64_t v10 = sub_100035C00();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_10000F3DC(&qword_1000465E0, &qword_1000465D8);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_100009F5C(&qword_1000465D8);
          BOOL v12 = sub_10003090C(v16, i, a3);
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
    sub_10000A498(0, (unint64_t *)&qword_1000465D0);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_100035C20();
  __break(1u);
  return result;
}

uint64_t sub_10000F03C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_100035C00();
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
    uint64_t v10 = sub_100035C00();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_10000F3DC(&qword_1000465F0, &qword_1000465E8);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_100009F5C(&qword_1000465E8);
          BOOL v12 = sub_100030978(v16, i, a3);
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
    sub_100035260();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_100035C20();
  __break(1u);
  return result;
}

uint64_t sub_10000F24C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10000DDF8(a1, a2, a3, a4, v4[4], v4[2], v4[3]);
}

uint64_t sub_10000F258()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000F290()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10000F2B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10000DF20(a1, a2, a3, a4, v4[4], v4[2], v4[3]);
}

uint64_t sub_10000F2C4(uint64_t a1)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  uint64_t v4 = a1;
  return v2(&v4);
}

uint64_t sub_10000F2FC()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10000F324@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_10000D9EC(a1, a2);
}

uint64_t sub_10000F348()
{
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000F388(uint64_t a1)
{
  return sub_10000DBC8(a1, *(void (**)(uint64_t))(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_10000F3A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10000DCC4(a1, a2, a3, a4, v4[4], v4[5], v4[2], v4[3]);
}

uint64_t sub_10000F3B4()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10000F3DC(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000A278(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000F43C(uint64_t a1, unint64_t a2)
{
  uint64_t v80 = a1;
  uint64_t v91 = sub_1000352D0();
  uint64_t v3 = *(void *)(v91 - 8);
  __chkstk_darwin(v91);
  uint64_t v90 = (char *)&v73 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v89 = (char *)&v73 - v6;
  uint64_t v93 = sub_100035290();
  uint64_t v7 = *(void *)(v93 - 8);
  __chkstk_darwin(v93);
  uint64_t v9 = (char *)&v73 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  BOOL v12 = (char *)&v73 - v11;
  __chkstk_darwin(v13);
  uint64_t v78 = (char *)&v73 - v14;
  __chkstk_darwin(v15);
  id v79 = (char *)&v73 - v16;
  __chkstk_darwin(v17);
  uint64_t v92 = (char *)&v73 - v18;
  __chkstk_darwin(v19);
  uint64_t v21 = (char *)&v73 - v20;
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v70 = sub_100035C00();
    swift_bridgeObjectRelease();
    if (v70 < 2) {
      goto LABEL_12;
    }
  }
  else if (*(uint64_t *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10) < 2)
  {
LABEL_12:
    swift_bridgeObjectRetain();
    if (((unint64_t)&_swiftEmptyArrayStorage & 0xC000000000000000) != 0 && sub_100035C00()) {
      goto LABEL_29;
    }
    uint64_t v42 = &_swiftEmptySetSingleton;
LABEL_14:
    id v100 = v42;
    unint64_t v43 = swift_bridgeObjectRetain();
    uint64_t v44 = sub_100011A88(v43);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (uint64_t)v44;
  }
  unint64_t v22 = *(void *)(v80 + 16);
  if (!v22) {
    goto LABEL_12;
  }
  id v73 = v9;
  Swift::Bool v74 = v12;
  uint64_t v76 = 0;
  uint64_t v24 = v7 + 16;
  uint64_t v23 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  unint64_t v25 = v22;
  uint64_t v26 = (char *)(v80 + ((*(unsigned __int8 *)(v24 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 64)));
  uint64_t v27 = *(void *)(v24 + 56);
  uint64_t v97 = (uint64_t (**)(char *, uint64_t))(v24 + 72);
  Swift::Bool v98 = v23;
  LODWORD(v96) = enum case for REMSearchCriterion.listType(_:);
  uint64_t v88 = (char **)(v24 + 80);
  uint64_t v86 = (void (**)(char *, char *, uint64_t))(v3 + 32);
  unsigned int v85 = enum case for REMSearchableListType.grocery(_:);
  uint64_t v83 = (void (**)(char *, uint64_t))(v3 + 8);
  uint64_t v84 = (void (**)(char *, void, uint64_t))(v3 + 104);
  unint64_t v77 = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v99 = (void (**)(char *, uint64_t))(v24 - 8);
  id v75 = v26;
  unint64_t v81 = v25;
  uint64_t v82 = v27;
  unint64_t v28 = v25;
  uint64_t v30 = v92;
  uint64_t v29 = v93;
  uint64_t v87 = v24;
  while (1)
  {
    uint64_t v32 = v98;
    v98(v21, v26, v29);
    v32(v30, v21, v29);
    uint64_t v33 = *v97;
    int v34 = (*v97)(v30, v29);
    if (v34 == v96) {
      break;
    }
    uint64_t v31 = *v99;
    (*v99)(v30, v29);
LABEL_6:
    v31(v21, v29);
    v26 += v27;
    if (!--v28)
    {
      swift_bridgeObjectRelease();
      goto LABEL_11;
    }
  }
  uint64_t v35 = v21;
  uint64_t v94 = v33;
  uint64_t v36 = *v88;
  ((void (*)(char *, uint64_t))*v88)(v30, v29);
  uint64_t v37 = v30;
  uint64_t v38 = v89;
  uint64_t v39 = v91;
  (*v86)(v89, v37, v91);
  uint64_t v40 = v90;
  (*v84)(v90, v85, v39);
  int v95 = sub_1000352C0();
  uint64_t v41 = *v83;
  (*v83)(v40, v39);
  v41(v38, v39);
  uint64_t v31 = *v99;
  if ((v95 & 1) == 0)
  {
    uint64_t v27 = v82;
    uint64_t v30 = v92;
    uint64_t v29 = v93;
    uint64_t v21 = v35;
    goto LABEL_6;
  }
  uint64_t v92 = v36;
  uint64_t v46 = v93;
  unint64_t v96 = v31;
  v31(v35, v93);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  unint64_t v47 = 0;
  int v95 = enum case for REMSearchCriterion.textualField(_:);
  id v48 = v79;
  unsigned int v49 = v78;
  unsigned int v50 = v75;
  uint64_t v51 = v82;
  unint64_t v52 = v96;
  while (1)
  {
    uint64_t v53 = v50;
    unint64_t v54 = v98;
    ((void (*)(char *))v98)(v48);
    v54(v49, v48, v46);
    NSString v55 = v94;
    int v56 = v94(v49, v46);
    if (v56 == v95) {
      break;
    }
    swift_bridgeObjectRetain();
    v52(v49, v46);
    v52(v48, v46);
    swift_bridgeObjectRelease();
    ++v47;
    unsigned int v50 = &v53[v51];
    if (v81 == v47) {
      goto LABEL_11;
    }
  }
  id v75 = v53;
  NSAttributedString v57 = (void (*)(char *, uint64_t))v92;
  ((void (*)(char *, uint64_t))v92)(v49, v46);
  uint64_t v91 = *((void *)v49 + 1);
  id v58 = &v49[*(int *)(sub_100009F5C(&qword_1000462E8) + 48)];
  uint64_t v59 = sub_1000353B0();
  uint64_t v60 = *(void *)(v59 - 8);
  uint64_t v61 = *(void (**)(char *, uint64_t))(v60 + 8);
  uint64_t v62 = (char *)(v60 + 8);
  swift_bridgeObjectRetain();
  uint64_t v90 = v62;
  v61(v58, v59);
  v96(v48, v46);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v81 == v47) {
    goto LABEL_11;
  }
  if (v47 >= v81)
  {
    __break(1u);
    goto LABEL_31;
  }
  os_log_type_t v63 = v74;
  uint64_t v64 = v98;
  v98(v74, v75, v46);
  uint64_t v65 = v73;
  v64(v73, v63, v46);
  int v66 = v55(v65, v46);
  if (v66 == v95)
  {
    v57(v65, v46);
    uint64_t v67 = sub_100009F5C(&qword_1000462E8);
    v61(&v65[*(int *)(v67 + 48)], v59);
    v96(v63, v46);
    swift_bridgeObjectRelease();
    unint64_t v68 = swift_bridgeObjectRetain();
    unint64_t v69 = (unint64_t)sub_10001152C(v68);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (!(v69 >> 62))
    {
      if (*(void *)((v69 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
LABEL_24:
        if (((unint64_t)&_swiftEmptyArrayStorage & 0xC000000000000000) != 0 && sub_100035C00()) {
LABEL_29:
        }
          sub_100011730((unint64_t)&_swiftEmptyArrayStorage);
        else {
          uint64_t v42 = &_swiftEmptySetSingleton;
        }
        goto LABEL_14;
      }
LABEL_11:
      swift_bridgeObjectRelease();
      goto LABEL_12;
    }
LABEL_31:
    swift_bridgeObjectRetain();
    uint64_t v71 = sub_100035C00();
    swift_bridgeObjectRelease();
    if (v71) {
      goto LABEL_24;
    }
    goto LABEL_11;
  }
  unsigned int v72 = v96;
  v96(v65, v46);
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v72)(v63, v46);
  __break(1u);
  return result;
}

uint64_t sub_10000FDAC(void *a1, void *a2)
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
    uint64_t v9 = sub_100035A30();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_100011C68();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      uint64_t result = 0;
      *a1 = v27;
      return result;
    }
    uint64_t result = sub_100035A20();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    Swift::Int v22 = sub_1000101DC(v7, result + 1);
    unint64_t v28 = (void *)v22;
    if (*(void *)(v22 + 24) <= *(void *)(v22 + 16))
    {
      id v26 = v8;
      sub_1000103C4();
      uint64_t v23 = v28;
    }
    else
    {
      uint64_t v23 = (void *)v22;
      id v24 = v8;
    }
    sub_100010930((uint64_t)v8, v23);
    *uint64_t v3 = (uint64_t)v23;
  }
  else
  {
    Swift::Int v11 = *(void *)(v6 + 40);
    swift_bridgeObjectRetain();
    Swift::Int v12 = sub_100035960(v11);
    uint64_t v13 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v14 = v12 & ~v13;
    if ((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14))
    {
      sub_100011C68();
      id v15 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
      char v16 = sub_100035970();

      if (v16)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        uint64_t v20 = *(void **)(*(void *)(*v3 + 48) + 8 * v14);
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
        char v19 = sub_100035970();

        if (v19) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v29 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    id v8 = a2;
    sub_1000109B4((uint64_t)v8, v14, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v29;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_10001002C(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  sub_100035CB0();
  swift_bridgeObjectRetain();
  sub_100035670();
  Swift::Int v8 = sub_100035CC0();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    Swift::Int v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_100035C70() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
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
      id v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_100035C70() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_100010B2C(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

Swift::Int sub_1000101DC(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_100009F5C(&qword_100046648);
    uint64_t v2 = sub_100035A70();
    uint64_t v14 = v2;
    sub_100035A10();
    if (sub_100035A40())
    {
      sub_100011C68();
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_1000103C4();
          uint64_t v2 = v14;
        }
        Swift::Int result = sub_100035960(*(void *)(v2 + 40));
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
      while (sub_100035A40());
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

uint64_t sub_1000103C4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100009F5C(&qword_100046648);
  uint64_t v3 = sub_100035A60();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    unint64_t v28 = v0;
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
LABEL_36:
          __break(1u);
LABEL_37:
          __break(1u);
          return result;
        }
        if (v16 >= v9) {
          goto LABEL_31;
        }
        unint64_t v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          int64_t v12 = v16 + 1;
          if (v16 + 1 >= v9) {
            goto LABEL_31;
          }
          unint64_t v17 = v6[v12];
          if (!v17)
          {
            int64_t v18 = v16 + 2;
            if (v18 >= v9)
            {
LABEL_31:
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
                  goto LABEL_37;
                }
                if (v12 >= v9) {
                  goto LABEL_31;
                }
                unint64_t v17 = v6[v12];
                ++v18;
                if (v17) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v12 = v18;
          }
        }
LABEL_21:
        unint64_t v8 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      uint64_t v19 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
      uint64_t result = sub_100035960(*(void *)(v4 + 40));
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
            goto LABEL_36;
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
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_100010650()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100009F5C(&qword_100046650);
  uint64_t v3 = sub_100035A60();
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
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_100035CB0();
      sub_100035670();
      uint64_t result = sub_100035CC0();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      unint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      void *v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

unint64_t sub_100010930(uint64_t a1, void *a2)
{
  sub_100035960(a2[5]);
  unint64_t result = sub_100035A00();
  *(void *)((char *)a2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 56) |= 1 << result;
  *(void *)(a2[6] + 8 * result) = a1;
  ++a2[2];
  return result;
}

void sub_1000109B4(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_1000103C4();
  }
  else
  {
    if (v7 > v6)
    {
      sub_100010CC8();
      goto LABEL_14;
    }
    sub_100011014();
  }
  uint64_t v8 = *v3;
  Swift::Int v9 = sub_100035960(*(void *)(*v3 + 40));
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_100011C68();
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = sub_100035970();

    if (v12)
    {
LABEL_13:
      sub_100035C80();
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
        char v15 = sub_100035970();

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

Swift::Int sub_100010B2C(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
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
    sub_100010650();
  }
  else
  {
    if (v10 > v9)
    {
      unint64_t result = (Swift::Int)sub_100010E60();
      goto LABEL_22;
    }
    sub_10001127C();
  }
  uint64_t v11 = *v4;
  sub_100035CB0();
  sub_100035670();
  unint64_t result = sub_100035CC0();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    char v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (unint64_t result = sub_100035C70(), (result & 1) != 0))
    {
LABEL_21:
      unint64_t result = sub_100035C80();
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
          unint64_t result = sub_100035C70();
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
  uint64_t v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
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

id sub_100010CC8()
{
  uint64_t v1 = v0;
  sub_100009F5C(&qword_100046648);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100035A50();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
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
      goto LABEL_28;
    }
    if (v18 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    id result = v17;
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v13) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_100010E60()
{
  uint64_t v1 = v0;
  sub_100009F5C(&qword_100046650);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100035A50();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (void *)swift_release();
    uint64_t *v1 = v4;
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    unint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    void *v19 = *v17;
    v19[1] = v18;
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_100011014()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100009F5C(&qword_100046648);
  uint64_t v3 = sub_100035A60();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_32:
    uint64_t *v1 = v4;
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
  uint64_t result = swift_retain_n();
  int64_t v12 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v12 << 6);
      goto LABEL_21;
    }
    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
    if (v16 >= v9) {
      goto LABEL_30;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      int64_t v12 = v16 + 1;
      if (v16 + 1 >= v9) {
        goto LABEL_30;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v12);
      if (!v17)
      {
        int64_t v18 = v16 + 2;
        if (v18 >= v9)
        {
LABEL_30:
          uint64_t result = swift_release_n();
          uint64_t v1 = v28;
          goto LABEL_32;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v18);
        int64_t v12 = v18;
        if (!v17) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_21:
    Swift::Int v19 = *(void *)(v4 + 40);
    id v20 = *(id *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t result = sub_100035960(v19);
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
          goto LABEL_33;
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
  while (1)
  {
    int64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_30;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v12);
    ++v18;
    if (v17) {
      goto LABEL_20;
    }
  }
LABEL_34:
  __break(1u);
  return result;
}

uint64_t sub_10001127C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100009F5C(&qword_100046650);
  uint64_t v3 = sub_100035A60();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
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
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    Swift::Int v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_100035CB0();
    swift_bridgeObjectRetain();
    sub_100035670();
    uint64_t result = sub_100035CC0();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    unint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    void *v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

void *sub_10001152C(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_21;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = 0;
      unint64_t v4 = v1 & 0xC000000000000001;
      uint64_t v5 = v1 & 0xFFFFFFFFFFFFFF8;
      p_align = &stru_100044FE8.align;
      unint64_t v17 = v1;
      uint64_t v16 = v1 & 0xFFFFFFFFFFFFFF8;
      while (v4)
      {
        id v7 = (id)sub_100035AB0();
LABEL_9:
        unint64_t v8 = v7;
        unint64_t v9 = v3 + 1;
        if (__OFADD__(v3, 1)) {
          goto LABEL_20;
        }
        id v10 = [v7 *((SEL *)p_align + 186)];
        if (v10)
        {
          int64_t v11 = v10;
          if ([v10 shouldCategorizeGroceryItems])
          {
            unint64_t v12 = v4;
            id v13 = [v8 name];
            sub_100035630();

            sub_100011C14();
            uint64_t v14 = sub_1000359D0();
            swift_bridgeObjectRelease();

            if (v14)
            {
            }
            else
            {
              sub_100035AE0();
              sub_100035B10();
              sub_100035B20();
              sub_100035AF0();
            }
            unint64_t v4 = v12;
            uint64_t v5 = v16;
            unint64_t v1 = v17;
            p_align = (_DWORD *)(&stru_100044FE8 + 24);
          }
          else
          {
          }
        }
        else
        {
        }
        ++v3;
        if (v9 == v2) {
          return &_swiftEmptyArrayStorage;
        }
      }
      if (v3 < *(void *)(v5 + 16)) {
        break;
      }
      __break(1u);
LABEL_20:
      __break(1u);
LABEL_21:
      uint64_t v2 = sub_100035C00();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    id v7 = *(id *)(v1 + 8 * v3 + 32);
    goto LABEL_9;
  }
  return &_swiftEmptyArrayStorage;
}

void sub_100011730(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_100035C00();
    swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      sub_100009F5C(&qword_100046648);
      unint64_t v3 = (void *)sub_100035A80();
      uint64_t v4 = a1 & 0xFFFFFFFFFFFFFF8;
      if (!v2) {
        goto LABEL_4;
      }
LABEL_8:
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_100035C00();
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
  id v7 = (char *)(v3 + 7);
  uint64_t v42 = v5;
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v8 = 0;
    while (1)
    {
      uint64_t v9 = sub_100035AB0();
      BOOL v10 = __OFADD__(v8++, 1);
      if (v10)
      {
        __break(1u);
        goto LABEL_36;
      }
      uint64_t v11 = v9;
      Swift::Int v12 = sub_100035960(v3[5]);
      uint64_t v13 = -1 << *((unsigned char *)v3 + 32);
      unint64_t v14 = v12 & ~v13;
      unint64_t v15 = v14 >> 6;
      uint64_t v16 = *(void *)&v7[8 * (v14 >> 6)];
      uint64_t v17 = 1 << v14;
      if (((1 << v14) & v16) != 0)
      {
        sub_100011C68();
        id v18 = *(id *)(v3[6] + 8 * v14);
        char v19 = sub_100035970();

        if (v19)
        {
LABEL_11:
          swift_unknownObjectRelease();
          goto LABEL_12;
        }
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
          char v22 = sub_100035970();

          if (v22) {
            goto LABEL_11;
          }
        }
      }
      *(void *)&v7[8 * v15] = v17 | v16;
      *(void *)(v3[6] + 8 * v14) = v11;
      uint64_t v23 = v3[2];
      BOOL v10 = __OFADD__(v23, 1);
      uint64_t v24 = v23 + 1;
      if (v10) {
        goto LABEL_37;
      }
      v3[2] = v24;
LABEL_12:
      if (v8 == v42) {
        return;
      }
    }
  }
  uint64_t v25 = 0;
  uint64_t v41 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v25 != v41)
  {
    Swift::Int v26 = v3[5];
    id v27 = *(id *)(a1 + 32 + 8 * v25);
    Swift::Int v28 = sub_100035960(v26);
    uint64_t v29 = -1 << *((unsigned char *)v3 + 32);
    unint64_t v30 = v28 & ~v29;
    unint64_t v31 = v30 >> 6;
    uint64_t v32 = *(void *)&v7[8 * (v30 >> 6)];
    uint64_t v33 = 1 << v30;
    if (((1 << v30) & v32) != 0)
    {
      sub_100011C68();
      id v34 = *(id *)(v3[6] + 8 * v30);
      char v35 = sub_100035970();

      if (v35) {
        goto LABEL_23;
      }
      uint64_t v36 = ~v29;
      unint64_t v30 = (v30 + 1) & v36;
      unint64_t v31 = v30 >> 6;
      uint64_t v32 = *(void *)&v7[8 * (v30 >> 6)];
      uint64_t v33 = 1 << v30;
      if ((v32 & (1 << v30)) != 0)
      {
        while (1)
        {
          id v37 = *(id *)(v3[6] + 8 * v30);
          char v38 = sub_100035970();

          if (v38) {
            break;
          }
          unint64_t v30 = (v30 + 1) & v36;
          unint64_t v31 = v30 >> 6;
          uint64_t v32 = *(void *)&v7[8 * (v30 >> 6)];
          uint64_t v33 = 1 << v30;
          if ((v32 & (1 << v30)) == 0) {
            goto LABEL_31;
          }
        }
LABEL_23:

        uint64_t v5 = v42;
        goto LABEL_24;
      }
LABEL_31:
      uint64_t v5 = v42;
    }
    *(void *)&v7[8 * v31] = v33 | v32;
    *(void *)(v3[6] + 8 * v30) = v27;
    uint64_t v39 = v3[2];
    BOOL v10 = __OFADD__(v39, 1);
    uint64_t v40 = v39 + 1;
    if (v10) {
      goto LABEL_38;
    }
    v3[2] = v40;
LABEL_24:
    if (++v25 == v5) {
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

void *sub_100011A88(unint64_t a1)
{
  uint64_t v11 = &_swiftEmptyArrayStorage;
  if (a1 >> 62)
  {
LABEL_16:
    uint64_t v2 = sub_100035C00();
    if (v2) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v2)
    {
LABEL_3:
      unint64_t v3 = 0;
      uint64_t v4 = a1 & 0xFFFFFFFFFFFFFF8;
      while (1)
      {
        if ((a1 & 0xC000000000000001) != 0)
        {
          id v5 = (id)sub_100035AB0();
          unint64_t v6 = v3 + 1;
          if (__OFADD__(v3, 1))
          {
LABEL_13:
            __break(1u);
            return v11;
          }
        }
        else
        {
          if (v3 >= *(void *)(v4 + 16))
          {
            __break(1u);
            goto LABEL_16;
          }
          id v5 = *(id *)(a1 + 8 * v3 + 32);
          unint64_t v6 = v3 + 1;
          if (__OFADD__(v3, 1)) {
            goto LABEL_13;
          }
        }
        id v7 = v5;
        char v8 = sub_10000FDAC(&v10, v7);

        if (v8)
        {
          sub_100035AE0();
          sub_100035B10();
          uint64_t v4 = a1 & 0xFFFFFFFFFFFFFF8;
          sub_100035B20();
          sub_100035AF0();
        }
        else
        {
        }
        ++v3;
        if (v6 == v2) {
          return v11;
        }
      }
    }
  }
  return &_swiftEmptyArrayStorage;
}

unint64_t sub_100011C14()
{
  unint64_t result = qword_100046640;
  if (!qword_100046640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100046640);
  }
  return result;
}

unint64_t sub_100011C68()
{
  unint64_t result = qword_1000465D0;
  if (!qword_1000465D0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000465D0);
  }
  return result;
}

uint64_t sub_100011CA8()
{
  uint64_t v0 = sub_1000355A0();
  sub_10000A434(v0, qword_100046658);
  uint64_t v1 = sub_100009FEC(v0, (uint64_t)qword_100046658);
  if (qword_1000460A0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100009FEC(v0, (uint64_t)qword_1000472B0);
  unint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t sub_100011D70(uint64_t a1, void (*a2)(uint64_t))
{
  sub_100035350();
  id v3 = [self defaultFetchOptions];
  uint64_t v4 = sub_100035340();

  a2(v4);

  return swift_bridgeObjectRelease();
}

uint64_t *sub_10001201C(unint64_t a1)
{
  if (!(a1 >> 62))
  {
    if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_3;
    }
    return (uint64_t *)&_swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRetain();
  uint64_t v18 = sub_100035C00();
  swift_bridgeObjectRelease();
  if (!v18) {
    return (uint64_t *)&_swiftEmptyArrayStorage;
  }
LABEL_3:
  uint64_t v2 = *(void **)(v1 + 16);
  sub_10000A498(0, &qword_100046778);
  Class isa = sub_1000356B0().super.isa;
  id v19 = 0;
  id v4 = [v2 fetchRemindersWithObjectIDs:isa error:&v19];

  id v5 = v19;
  if (!v4)
  {
    id v9 = v19;
    sub_100034E50();

    swift_willThrow();
    if (qword_100046068 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_1000355A0();
    sub_100009FEC(v10, (uint64_t)qword_100046658);
    swift_bridgeObjectRetain_n();
    uint64_t v11 = sub_100035590();
    os_log_type_t v12 = sub_1000357A0();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      id v19 = (id)swift_slowAlloc();
      *(_DWORD *)uint64_t v13 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v14 = sub_1000356D0();
      unint64_t v16 = v15;
      swift_bridgeObjectRelease();
      sub_10003007C(v14, v16, (uint64_t *)&v19);
      sub_1000359B0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Error fetching reminders by objetIDs {objectIDs: %s}", v13, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    swift_errorRelease();
    return (uint64_t *)&_swiftEmptyArrayStorage;
  }
  sub_10000A498(0, (unint64_t *)&unk_100046800);
  sub_100014DA4();
  unint64_t v6 = sub_1000355C0();
  id v7 = v5;

  char v8 = sub_1000306D4(v6);
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_100012348(uint64_t a1, void (*a2)(char *), uint64_t a3)
{
  uint64_t v6 = sub_100035320();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v13 - v9;
  if (*(void *)(a1 + 16) <= 1uLL)
  {
    sub_100035350();
    sub_1000352E0();
    a2(v10);
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  else
  {
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = a2;
    *(void *)(v11 + 24) = a3;
    swift_retain();
    sub_10002C734(a1, (uint64_t)sub_100014E5C, v11);
    return swift_release();
  }
}

uint64_t sub_1000126F0(uint64_t a1, uint64_t a2, void (*a3)(char *))
{
  uint64_t v4 = sub_100035320();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_100035300();
  a3(v7);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_1000127F4(unint64_t a1, void (*a2)(char *), uint64_t a3)
{
  uint64_t v76 = a2;
  uint64_t v74 = sub_100035320();
  uint64_t v73 = *(void *)(v74 - 8);
  __chkstk_darwin(v74);
  unsigned int v72 = (char *)&v72 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v92 = sub_100035290();
  uint64_t v88 = *(void *)(v92 - 8);
  __chkstk_darwin(v92);
  uint64_t v82 = (char *)&v72 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v91 = (uint64_t *)((char *)&v72 - v10);
  unint64_t v94 = (unint64_t)&_swiftEmptyArrayStorage;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_100035C00();
  }
  else
  {
    uint64_t v11 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  unint64_t v77 = v3;
  if (!v11)
  {
    swift_bridgeObjectRelease();
    unint64_t v48 = (unint64_t)&_swiftEmptyArrayStorage;
    uint64_t v14 = &_swiftEmptyArrayStorage;
LABEL_30:
    uint64_t v92 = (uint64_t)v14;
    if (v48 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v67 = sub_100035C00();
      swift_bridgeObjectRelease();
      if (v67)
      {
LABEL_32:
        unsigned int v49 = (void *)v3[2];
        sub_10000A498(0, &qword_100046778);
        unsigned int v50 = v3;
        swift_bridgeObjectRetain();
        Class isa = sub_1000356B0().super.isa;
        swift_bridgeObjectRelease();
        v95[0] = 0;
        id v52 = [v49 fetchListsWithObjectIDs:isa error:v95];

        id v53 = v95[0];
        if (v52)
        {
          sub_10000A498(0, (unint64_t *)&qword_1000465D0);
          sub_100014DA4();
          unint64_t v54 = sub_1000355C0();
          id v55 = v53;

          uint64_t v4 = sub_1000306E8(v54);
          swift_bridgeObjectRelease();
          swift_retain();
          unint64_t v56 = swift_bridgeObjectRetain();
          int v66 = sub_100014588(v56, v50);
          swift_bridgeObjectRelease();
          swift_release();
          goto LABEL_41;
        }
        id v57 = v95[0];
        sub_100034E50();

        swift_willThrow();
        uint64_t v4 = (uint64_t *)&_swiftEmptyArrayStorage;
        if (qword_100046068 == -1) {
          goto LABEL_35;
        }
        goto LABEL_46;
      }
    }
    else if (*(void *)((v48 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_32;
    }
    int v66 = &_swiftEmptyArrayStorage;
    uint64_t v4 = (uint64_t *)&_swiftEmptyArrayStorage;
    goto LABEL_41;
  }
  if (v11 >= 1)
  {
    uint64_t v75 = a3;
    uint64_t v12 = 0;
    unint64_t v13 = a1 & 0xC000000000000001;
    unsigned int v84 = enum case for REMStringMatchingStyle.prefix(_:);
    unsigned int v83 = enum case for REMSearchCriterion.textualField(_:);
    uint64_t v89 = v88 + 32;
    uint64_t v90 = (void (**)(uint64_t *, void, uint64_t))(v88 + 104);
    unsigned int v80 = enum case for REMSearchableListType.grocery(_:);
    unsigned int v79 = enum case for REMSearchCriterion.listType(_:);
    uint64_t v14 = &_swiftEmptyArrayStorage;
    unint64_t v81 = "TTRContactEventTriggerBearing";
    unint64_t v78 = 0x80000001000391F0;
    unint64_t v85 = a1 & 0xC000000000000001;
    uint64_t v86 = v11;
    unint64_t v87 = a1;
    while (1)
    {
      if (v13) {
        id v15 = (id)sub_100035AB0();
      }
      else {
        id v15 = *(id *)(a1 + 8 * v12 + 32);
      }
      unint64_t v16 = v15;
      uint64_t v17 = (void *)sub_100035770();
      if (v17)
      {
        id v18 = v17;
        sub_1000356A0();
        if (*(void *)((v94 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v94 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_1000356F0();
        }
        sub_100035700();
        sub_1000356E0();

        unint64_t v16 = v18;
        goto LABEL_8;
      }
      id v19 = [v16 title];
      id v20 = [v19 spokenPhrase];

      uint64_t v21 = sub_100035630();
      uint64_t v23 = v22;

      uint64_t v24 = sub_100009F5C(&qword_1000462E8);
      uint64_t v25 = v91;
      Swift::Int v26 = (char *)v91 + *(int *)(v24 + 48);
      *uint64_t v91 = v21;
      v25[1] = v23;
      uint64_t v27 = sub_1000353B0();
      (*(void (**)(char *, void, uint64_t))(*(void *)(v27 - 8) + 104))(v26, v84, v27);
      Swift::Int v28 = (void (*)(char *, void, uint64_t))*v90;
      (*v90)(v25, v83, v92);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v14 = (void *)sub_10002FCA4(0, v14[2] + 1, 1, (unint64_t)v14);
      }
      unint64_t v30 = v14[2];
      unint64_t v29 = v14[3];
      if (v30 >= v29 >> 1) {
        uint64_t v14 = (void *)sub_10002FCA4(v29 > 1, v30 + 1, 1, (unint64_t)v14);
      }
      v14[2] = v30 + 1;
      unint64_t v31 = (*(unsigned __int8 *)(v88 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v88 + 80);
      unint64_t v32 = (unint64_t)v14;
      uint64_t v33 = (char *)v14 + v31;
      uint64_t v34 = *(void *)(v88 + 72);
      char v35 = &v33[v34 * v30];
      uint64_t v36 = *(void (**)(char *, uint64_t *, uint64_t))(v88 + 32);
      v36(v35, v91, v92);
      id v37 = [v16 title];
      id v38 = [v37 vocabularyIdentifier];

      if (v38)
      {
        uint64_t v39 = sub_100035630();
        uint64_t v41 = v40;

        if (v39 == 0xD000000000000011 && v41 == v78)
        {
          swift_bridgeObjectRelease();
LABEL_25:
          uint64_t v43 = sub_1000352D0();
          uint64_t v44 = v82;
          (*(void (**)(char *, void, uint64_t))(*(void *)(v43 - 8) + 104))(v82, v80, v43);
          v28(v44, v79, v92);
          unint64_t v46 = *(void *)(v32 + 16);
          unint64_t v45 = *(void *)(v32 + 24);
          if (v46 >= v45 >> 1) {
            unint64_t v32 = sub_10002FCA4(v45 > 1, v46 + 1, 1, v32);
          }
          *(void *)(v32 + 16) = v46 + 1;
          unint64_t v47 = v32 + v31 + v46 * v34;
          uint64_t v14 = (void *)v32;
          v36((char *)v47, (uint64_t *)v82, v92);
          goto LABEL_7;
        }
        char v42 = sub_100035C70();
        swift_bridgeObjectRelease();
        if (v42) {
          goto LABEL_25;
        }
      }
      uint64_t v14 = (void *)v32;
LABEL_7:
      uint64_t v11 = v86;
      a1 = v87;
      unint64_t v13 = v85;
LABEL_8:
      ++v12;

      if (v11 == v12)
      {
        swift_bridgeObjectRelease();
        unint64_t v48 = v94;
        a3 = v75;
        id v3 = v77;
        goto LABEL_30;
      }
    }
  }
  __break(1u);
LABEL_46:
  swift_once();
LABEL_35:
  uint64_t v58 = sub_1000355A0();
  sub_100009FEC(v58, (uint64_t)qword_100046658);
  uint64_t v59 = sub_100035590();
  os_log_type_t v60 = sub_1000357A0();
  if (os_log_type_enabled(v59, v60))
  {
    uint64_t v61 = (uint8_t *)swift_slowAlloc();
    uint64_t v62 = swift_slowAlloc();
    uint64_t v75 = a3;
    uint64_t v96 = v62;
    *(_DWORD *)uint64_t v61 = 136315138;
    uint64_t v91 = (uint64_t *)(v61 + 4);
    swift_beginAccess();
    swift_bridgeObjectRetain();
    uint64_t v63 = sub_1000356D0();
    unint64_t v65 = v64;
    swift_bridgeObjectRelease();
    uint64_t v93 = sub_10003007C(v63, v65, &v96);
    sub_1000359B0();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v59, v60, "Error fetching lists by objetIDs {objectIDs: %s}", v61, 0xCu);
    swift_arrayDestroy();
    a3 = v75;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  swift_errorRelease();

  int v66 = &_swiftEmptyArrayStorage;
LABEL_41:
  uint64_t v68 = v92;
  if (*(void *)(v92 + 16))
  {
    unint64_t v69 = (void *)swift_allocObject();
    v69[2] = v76;
    v69[3] = a3;
    v69[4] = v4;
    v69[5] = v68;
    v69[6] = v66;
    swift_bridgeObjectRetain();
    swift_retain();
    sub_10002C734(v68, (uint64_t)sub_100014D94, (uint64_t)v69);
    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v70 = v72;
    sub_100035300();
    v76(v70);
    (*(void (**)(char *, uint64_t))(v73 + 8))(v70, v74);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_100013250(unint64_t a1, unint64_t a2, void (*a3)(char *), uint64_t a4, unint64_t a5, uint64_t a6, unint64_t a7)
{
  uint64_t v13 = sub_100035320();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  unint64_t v16 = (char *)&v18 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v19 = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_10000E464(a5);
  sub_10000F43C(a6, v19);
  swift_bridgeObjectRelease();
  unint64_t v19 = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_10000E44C(a7);
  sub_100035300();
  a3(v16);
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

uint64_t sub_1000133BC(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = &_swiftEmptyArrayStorage;
  uint64_t v8 = *(void **)(v3 + 16);
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = a1;
  v9[3] = a2;
  v9[4] = v7;
  v13[4] = sub_100014918;
  v13[5] = v9;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256;
  v13[2] = sub_100013EE4;
  v13[3] = &unk_100041658;
  uint64_t v10 = _Block_copy(v13);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  [v8 enumerateAllListsWithBlock:v10];
  _Block_release(v10);
  swift_beginAccess();
  uint64_t v11 = swift_bridgeObjectRetain();
  a3(v11);
  swift_release();
  return swift_bridgeObjectRelease();
}

id sub_100013538(SEL *p_align, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  uint64_t v9 = sub_1000355A0();
  uint64_t v51 = *(void *)(v9 - 8);
  uint64_t v52 = v9;
  double v10 = __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id result = [(SEL *)p_align isShared];
  if (!result) {
    return result;
  }
  uint64_t v14 = (void *)(a5 + 16);
  id v15 = [(SEL *)p_align sharedOwnerAddress];
  if (v15)
  {
    unint64_t v16 = v15;
    uint64_t v17 = sub_100035630();
    uint64_t v19 = v18;

    if (sub_100013AC8(v17, v19, a3))
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v20 = sub_100013AC8(v17, v19, a4);
      swift_bridgeObjectRelease();
      if ((v20 & 1) == 0) {
        goto LABEL_10;
      }
    }
    if ([(SEL *)p_align isShared])
    {
      swift_beginAccess();
      uint64_t v21 = p_align;
      sub_1000356A0();
      if (*(void *)((*v14 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v14 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_1000356F0();
      }
      sub_100035700();
      sub_1000356E0();
      swift_endAccess();
    }
  }
LABEL_10:
  id result = [(SEL *)p_align shareeContext];
  if (result)
  {
    uint64_t v22 = result;
    uint64_t v48 = a3;
    id v23 = [result sharees];

    sub_10000A498(0, &qword_100046770);
    unint64_t v24 = sub_1000356C0();

    if (v24 >> 62) {
      goto LABEL_38;
    }
    uint64_t v25 = *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    while (1)
    {
      unint64_t v47 = a4;
      unsigned int v49 = p_align;
      unsigned int v50 = v14;
      if (!v25) {
        break;
      }
      unint64_t v46 = v12;
      a4 = v24 & 0xC000000000000001;
      uint64_t v12 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v26 = 4;
      p_align = (SEL *)&stru_100044FE8.align;
      while (2)
      {
        if (a4) {
          id v27 = (id)sub_100035AB0();
        }
        else {
          id v27 = *(id *)(v24 + 8 * v26);
        }
        Swift::Int v28 = v27;
        uint64_t v14 = (void *)(v26 - 3);
        if (!__OFADD__(v26 - 4, 1))
        {
          switch((unint64_t)objc_msgSend(v27, p_align[140]))
          {
            case 0uLL:
            case 2uLL:
            case 3uLL:
            case 4uLL:
              goto LABEL_15;
            case 1uLL:
            case 5uLL:
              id v29 = [v28 address];
              if (v29)
              {
                unint64_t v30 = v29;
                sub_100035630();

                NSString v31 = sub_100035600();
                swift_bridgeObjectRelease();
                id v32 = [v31 rem_removingMailto];

                uint64_t v33 = sub_100035630();
                uint64_t v35 = v34;

                if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                  uint64_t v12 = sub_10002FCC8(0, *((void *)v12 + 2) + 1, 1, v12);
                }
                unint64_t v37 = *((void *)v12 + 2);
                unint64_t v36 = *((void *)v12 + 3);
                if (v37 >= v36 >> 1) {
                  uint64_t v12 = sub_10002FCC8((char *)(v36 > 1), v37 + 1, 1, v12);
                }
                *((void *)v12 + 2) = v37 + 1;
                id v38 = &v12[16 * v37];
                *((void *)v38 + 4) = v33;
                *((void *)v38 + 5) = v35;
                p_align = (SEL *)(&stru_100044FE8 + 24);
              }
              else
              {
LABEL_15:
              }
              ++v26;
              if (v14 != (void *)v25) {
                continue;
              }
              goto LABEL_29;
            default:
              if (qword_100046068 != -1) {
                swift_once();
              }
              uint64_t v44 = v52;
              uint64_t v45 = sub_100009FEC(v52, (uint64_t)qword_100046658);
              (*(void (**)(char *, uint64_t, uint64_t))(v51 + 16))(v46, v45, v44);
              sub_10001E58C((uint64_t)&_swiftEmptyArrayStorage);
              sub_10001E58C((uint64_t)&_swiftEmptyArrayStorage);
              sub_10002AEDC((uint64_t)"unknown status", 14, 2);
              __break(1u);
              JUMPOUT(0x100013AB0);
          }
        }
        break;
      }
      __break(1u);
LABEL_38:
      swift_bridgeObjectRetain_n();
      uint64_t v25 = sub_100035C00();
      swift_bridgeObjectRelease();
    }
    uint64_t v12 = (char *)&_swiftEmptyArrayStorage;
LABEL_29:
    swift_bridgeObjectRelease_n();
    uint64_t v39 = sub_1000256F4((uint64_t)v12);
    swift_bridgeObjectRelease();
    if (sub_100013C00(v39, v48))
    {
      char v40 = sub_100013C00(v39, v47);
      id result = (id)swift_bridgeObjectRelease();
      uint64_t v41 = v49;
      char v42 = v50;
      if (v40) {
        return result;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v41 = v49;
      char v42 = v50;
    }
    swift_beginAccess();
    uint64_t v43 = v41;
    sub_1000356A0();
    if (*(void *)((*v42 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v42 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_1000356F0();
    }
    sub_100035700();
    sub_1000356E0();
    return (id)swift_endAccess();
  }
  return result;
}

uint64_t sub_100013AC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_100035CB0();
    sub_100035670();
    Swift::Int v6 = sub_100035CC0();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      uint64_t v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_100035C70() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          unint64_t v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_100035C70() & 1) != 0) {
            break;
          }
          uint64_t result = 0;
          unint64_t v15 = (v15 + 1) & v14;
          if (((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
            return result;
          }
        }
        return 1;
      }
    }
  }
  return 0;
}

uint64_t sub_100013C00(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 1;
  }
  unint64_t v3 = *(void *)(a1 + 16);
  if (!v3) {
    return 1;
  }
  if (v2 >= v3) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = a2;
  }
  if (v2 >= v3) {
    uint64_t v5 = a2;
  }
  else {
    uint64_t v5 = a1;
  }
  uint64_t v32 = v4;
  uint64_t v33 = v4 + 56;
  uint64_t v6 = -1 << *(unsigned char *)(v4 + 32);
  if (-v6 < 64) {
    uint64_t v7 = ~(-1 << -(char)v6);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v4 + 56);
  int64_t v31 = (unint64_t)(63 - v6) >> 6;
  uint64_t v9 = v5 + 56;
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v11 = 0;
  while (1)
  {
    while (1)
    {
      int64_t v12 = v11;
      if (!v8) {
        break;
      }
      unint64_t v13 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v14 = v13 | (v11 << 6);
      if (*(void *)(v5 + 16)) {
        goto LABEL_31;
      }
    }
    int64_t v15 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_50;
    }
    if (v15 >= v31) {
      goto LABEL_48;
    }
    unint64_t v16 = *(void *)(v33 + 8 * v15);
    ++v11;
    if (!v16)
    {
      int64_t v11 = v12 + 2;
      if (v12 + 2 >= v31) {
        goto LABEL_48;
      }
      unint64_t v16 = *(void *)(v33 + 8 * v11);
      if (!v16)
      {
        int64_t v11 = v12 + 3;
        if (v12 + 3 >= v31) {
          goto LABEL_48;
        }
        unint64_t v16 = *(void *)(v33 + 8 * v11);
        if (!v16) {
          break;
        }
      }
    }
LABEL_30:
    unint64_t v8 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
    if (*(void *)(v5 + 16))
    {
LABEL_31:
      uint64_t v18 = (uint64_t *)(*(void *)(v32 + 48) + 16 * v14);
      uint64_t v20 = *v18;
      uint64_t v19 = v18[1];
      sub_100035CB0();
      swift_bridgeObjectRetain();
      sub_100035670();
      Swift::Int v21 = sub_100035CC0();
      uint64_t v22 = -1 << *(unsigned char *)(v5 + 32);
      unint64_t v23 = v21 & ~v22;
      if ((*(void *)(v9 + ((v23 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v23))
      {
        uint64_t v24 = *(void *)(v5 + 48);
        uint64_t v25 = (void *)(v24 + 16 * v23);
        BOOL v26 = *v25 == v20 && v25[1] == v19;
        if (v26 || (sub_100035C70() & 1) != 0)
        {
LABEL_44:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v30 = 0;
LABEL_45:
          sub_100014D3C();
          return v30;
        }
        uint64_t v27 = ~v22;
        while (1)
        {
          unint64_t v23 = (v23 + 1) & v27;
          if (((*(void *)(v9 + ((v23 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v23) & 1) == 0) {
            break;
          }
          Swift::Int v28 = (void *)(v24 + 16 * v23);
          BOOL v29 = *v28 == v20 && v28[1] == v19;
          if (v29 || (sub_100035C70() & 1) != 0) {
            goto LABEL_44;
          }
        }
      }
      uint64_t result = swift_bridgeObjectRelease();
    }
  }
  int64_t v17 = v12 + 4;
  if (v12 + 4 >= v31)
  {
LABEL_48:
    swift_bridgeObjectRelease();
    uint64_t v30 = 1;
    goto LABEL_45;
  }
  unint64_t v16 = *(void *)(v33 + 8 * v17);
  if (v16)
  {
    int64_t v11 = v12 + 4;
    goto LABEL_30;
  }
  while (1)
  {
    int64_t v11 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v11 >= v31) {
      goto LABEL_48;
    }
    unint64_t v16 = *(void *)(v33 + 8 * v11);
    ++v17;
    if (v16) {
      goto LABEL_30;
    }
  }
LABEL_50:
  __break(1u);
  return result;
}

void sub_100013EE4(uint64_t a1, void *a2)
{
  unint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

id sub_100013F58()
{
  uint64_t v1 = *(void **)(v0 + 16);
  id v12 = 0;
  id v2 = [v1 fetchDefaultListWithError:&v12];
  if (v12)
  {
    id v3 = v12;

    swift_willThrow();
    if (qword_100046068 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_1000355A0();
    sub_100009FEC(v4, (uint64_t)qword_100046658);
    id v5 = v3;
    uint64_t v6 = sub_100035590();
    os_log_type_t v7 = sub_1000357A0();
    if (os_log_type_enabled(v6, v7))
    {
      unint64_t v8 = (uint8_t *)swift_slowAlloc();
      id v12 = (id)swift_slowAlloc();
      *(_DWORD *)unint64_t v8 = 136315138;
      swift_getErrorValue();
      uint64_t v9 = sub_100035C90();
      sub_10003007C(v9, v10, (uint64_t *)&v12);
      sub_1000359B0();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Error fetching default list %s", v8, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    return 0;
  }
  return v2;
}

uint64_t sub_100014184(uint64_t a1)
{
  v14[0] = a1;
  uint64_t v1 = sub_1000353E0();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100035490();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  unint64_t v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100009F5C(&qword_100046768);
  __chkstk_darwin(v9 - 8);
  int64_t v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000354A0();
  sub_1000353D0();
  sub_1000353C0();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  sub_100035480();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v12 = sub_100035470();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 0, 1, v12);
  ((void (*)(char *))v14[0])(v11);
  return sub_100014838((uint64_t)v11);
}

uint64_t sub_10001442C()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for TTRIntentsHandlerStoreDataSource()
{
  return self;
}

uint64_t *sub_100014488(unint64_t a1)
{
  return sub_10001201C(a1);
}

uint64_t sub_1000144AC(uint64_t a1, void (*a2)(uint64_t))
{
  return sub_100011D70(a1, a2);
}

uint64_t sub_1000144D0(uint64_t a1, void (*a2)(char *), uint64_t a3)
{
  return sub_100012348(a1, a2, a3);
}

uint64_t sub_1000144F4(unint64_t a1, void (*a2)(char *), uint64_t a3)
{
  return sub_1000127F4(a1, a2, a3);
}

uint64_t sub_100014518(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  return sub_1000133BC(a1, a2, a3);
}

id sub_10001453C()
{
  return sub_100013F58();
}

uint64_t sub_100014560(uint64_t a1)
{
  return sub_100014184(a1);
}

void *sub_100014588(unint64_t a1, void *a2)
{
  p_align = v2;
  if (a1 >> 62) {
    goto LABEL_16;
  }
  uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t result = &_swiftEmptyArrayStorage;
    if (!v6) {
      break;
    }
    int64_t v15 = &_swiftEmptyArrayStorage;
    sub_100035B00();
    if (v6 < 0) {
      __break(1u);
    }
    unint64_t v13 = p_align;
    uint64_t v8 = 0;
    a2 = (void *)a2[2];
    p_align = &stru_100044FE8.align;
    while (v6 != v8)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v9 = (id)sub_100035AB0();
      }
      else {
        id v9 = *(id *)(a1 + 8 * v8 + 32);
      }
      uint64_t v10 = v9;
      id v14 = 0;
      if (!objc_msgSend(a2, "fetchCustomSmartListWithObjectID:error:", v9, &v14, v13))
      {
        id v12 = v14;
        sub_100034E50();

        swift_willThrow();
        return (void *)swift_release();
      }
      ++v8;
      id v11 = v14;

      sub_100035AE0();
      sub_100035B10();
      sub_100035B20();
      sub_100035AF0();
      if (v6 == v8) {
        return v15;
      }
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_100035C00();
    swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100014758(void (*a1)(uint64_t))
{
  sub_100009F5C(&qword_100046C30);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_100038BE0;
  uint64_t v3 = (void *)REMSmartListTypeToday;
  uint64_t v4 = (void *)REMSmartListTypeScheduled;
  *(void *)(v2 + 32) = REMSmartListTypeToday;
  *(void *)(v2 + 40) = v4;
  uint64_t v5 = (void *)REMSmartListTypeAll;
  uint64_t v6 = (void *)REMSmartListTypeFlagged;
  *(void *)(v2 + 48) = REMSmartListTypeAll;
  *(void *)(v2 + 56) = v6;
  uint64_t v7 = (void *)REMSmartListTypeAssigned;
  *(void *)(v2 + 64) = REMSmartListTypeAssigned;
  id v8 = v3;
  id v9 = v4;
  id v10 = v5;
  id v11 = v6;
  id v12 = v7;
  a1(v2);

  return swift_bridgeObjectRelease();
}

uint64_t sub_100014838(uint64_t a1)
{
  uint64_t v2 = sub_100009F5C(&qword_100046768);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100014898()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000148D0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

id sub_100014918(SEL *a1, uint64_t a2)
{
  return sub_100013538(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32));
}

uint64_t sub_100014924(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100014934()
{
  return swift_release();
}

uint64_t sub_10001493C(uint64_t a1, uint64_t a2, void (*a3)(char *), uint64_t a4)
{
  uint64_t v7 = sub_100035320();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  __chkstk_darwin(v9);
  id v11 = (char *)&v15 - v10;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a3;
  *(void *)(v12 + 24) = a4;
  if (*(void *)(a1 + 16) < 2uLL)
  {
    sub_100035350();
    swift_retain();
    sub_1000352E0();
    a3(v11);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
    return swift_release();
  }
  else
  {
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = sub_100014E44;
    *(void *)(v13 + 24) = v12;
    swift_retain();
    swift_retain();
    sub_10002C734(a1, sub_100014E4C, v13);
    swift_release();
    return swift_release();
  }
}

uint64_t sub_100014D3C()
{
  return swift_release();
}

uint64_t sub_100014D44()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100014D94(unint64_t a1, unint64_t a2)
{
  return sub_100013250(a1, a2, *(void (**)(char *))(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 48));
}

unint64_t sub_100014DA4()
{
  unint64_t result = qword_100046780;
  if (!qword_100046780)
  {
    sub_10000A498(255, &qword_100046778);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100046780);
  }
  return result;
}

uint64_t sub_100014E0C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100014E44(uint64_t a1)
{
  return sub_10000DDB0(a1, *(uint64_t (**)(void))(v1 + 16));
}

uint64_t sub_100014E4C(uint64_t a1, uint64_t a2)
{
  return sub_1000126F0(a1, a2, *(void (**)(char *))(v2 + 16));
}

uint64_t sub_100014E60()
{
  uint64_t v0 = sub_1000355A0();
  sub_10000A434(v0, qword_100046790);
  uint64_t v1 = sub_100009FEC(v0, (uint64_t)qword_100046790);
  if (qword_1000460A0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100009FEC(v0, (uint64_t)qword_1000472B0);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t sub_100014F28(void *a1, uint64_t a2, uint64_t a3)
{
  id v7 = [a1 tasks];
  if (v7)
  {
    uint64_t v8 = v7;
    sub_10000A498(0, &qword_100046318);
    unint64_t v9 = sub_1000356C0();

    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = a2;
    *(void *)(v10 + 24) = a3;
    swift_retain();
    sub_100031B3C(v9, (uint64_t)sub_10001641C, v10);
    swift_bridgeObjectRelease();
  }
  else
  {
    id v11 = *(void **)(v3 + OBJC_IVAR____TtC25RemindersIntentsExtension27TTRSnoozeTasksIntentHandler_dataSource);
    uint64_t v12 = (void *)swift_allocObject();
    v12[2] = a2;
    v12[3] = a3;
    v12[4] = a1;
    uint64_t v13 = v11[6];
    uint64_t v14 = v11[7];
    sub_10000A024(v11 + 3, v13);
    uint64_t v15 = (void *)swift_allocObject();
    v15[2] = v11;
    v15[3] = sub_10001638C;
    v15[4] = v12;
    unint64_t v16 = *(void (**)(uint64_t (*)(unint64_t), void *, uint64_t, uint64_t))(v14 + 8);
    swift_retain();
    id v17 = a1;
    swift_retain();
    swift_retain();
    v16(sub_1000163D8, v15, v13, v14);
    swift_release();
  }

  return swift_release();
}

void sub_1000150F4(unint64_t a1, void (*a2)(uint64_t))
{
  if (!(a1 >> 62))
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v4) {
      goto LABEL_3;
    }
LABEL_27:
    if (qword_100046070 != -1) {
      swift_once();
    }
    uint64_t v27 = sub_1000355A0();
    sub_100009FEC(v27, (uint64_t)qword_100046790);
    Swift::Int v28 = sub_100035590();
    os_log_type_t v29 = sub_100035780();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v30 = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, v29, "No reminders found for searchTerm {result: .unsupported(.noTasksFound)}", v30, 2u);
      swift_slowDealloc();
    }

    id v13 = [self unsupportedForReason:1];
    goto LABEL_32;
  }
  swift_bridgeObjectRetain();
  uint64_t v26 = sub_100035C00();
  swift_bridgeObjectRelease();
  if (!v26) {
    goto LABEL_27;
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_100035C00();
  swift_bridgeObjectRelease();
LABEL_3:
  if (v4 == 1)
  {
    if (qword_100046070 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_1000355A0();
    sub_100009FEC(v5, (uint64_t)qword_100046790);
    uint64_t v6 = sub_100035590();
    os_log_type_t v7 = sub_100035780();
    uint64_t v4 = v7;
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, (os_log_type_t)v4, "One reminder found for searchTerm {result: .success}", v8, 2u);
      swift_slowDealloc();
    }

    if ((a1 & 0xC000000000000001) != 0)
    {
      sub_100035AB0();
      goto LABEL_11;
    }
    if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      id v9 = *(id *)(a1 + 32);
LABEL_11:
      uint64_t v10 = self;
      sub_10000A498(0, &qword_100046318);
      id v11 = (void *)sub_1000358F0();
      id v12 = [v10 successWithResolvedTask:v11];

      id v13 = [objc_allocWithZone((Class)INSnoozeTasksTaskResolutionResult) initWithTaskResolutionResult:v12];
LABEL_32:
      sub_100009F5C(&qword_1000467F0);
      uint64_t v31 = swift_allocObject();
      *(_OWORD *)(v31 + 16) = xmmword_100038880;
      *(void *)(v31 + 32) = v13;
      uint64_t v33 = v31;
      sub_1000356E0();
      id v32 = v13;
      a2(v33);
      swift_bridgeObjectRelease();

      return;
    }
    __break(1u);
  }
  else if (qword_100046070 == -1)
  {
    goto LABEL_13;
  }
  swift_once();
LABEL_13:
  uint64_t v14 = sub_1000355A0();
  sub_100009FEC(v14, (uint64_t)qword_100046790);
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_100035590();
  os_log_type_t v16 = sub_100035780();
  if (os_log_type_enabled(v15, v16))
  {
    id v17 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)id v17 = 134217984;
    sub_1000359B0();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Found %ld reminders found for searchTerm {result: .disambiguation}", v17, 0xCu);
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease();
  }
  if (!v4) {
    goto LABEL_24;
  }
  sub_100035B00();
  if ((v4 & 0x8000000000000000) == 0)
  {
    sub_10000A498(0, &qword_100046318);
    if ((a1 & 0xC000000000000001) != 0)
    {
      uint64_t v18 = 0;
      do
      {
        uint64_t v19 = v18 + 1;
        sub_100035AB0();
        sub_1000358F0();
        sub_100035AE0();
        sub_100035B10();
        sub_100035B20();
        sub_100035AF0();
        uint64_t v18 = v19;
      }
      while (v4 != v19);
    }
    else
    {
      uint64_t v20 = (void **)(a1 + 32);
      do
      {
        Swift::Int v21 = *v20++;
        id v22 = v21;
        sub_1000358F0();
        sub_100035AE0();
        sub_100035B10();
        sub_100035B20();
        sub_100035AF0();
        --v4;
      }
      while (v4);
    }
LABEL_24:
    unint64_t v23 = self;
    sub_10000A498(0, &qword_100046318);
    Class isa = sub_1000356B0().super.isa;
    swift_bridgeObjectRelease();
    id v25 = [v23 disambiguationWithTasksToDisambiguate:isa];

    id v13 = [objc_allocWithZone((Class)INSnoozeTasksTaskResolutionResult) initWithTaskResolutionResult:v25];
    goto LABEL_32;
  }
  __break(1u);
}

uint64_t sub_1000156D4(unint64_t a1, void (*a2)(void), int a3, id a4)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v48 = sub_100035C00();
    swift_bridgeObjectRelease();
    if (v48)
    {
      swift_bridgeObjectRetain();
      uint64_t v7 = sub_100035C00();
      swift_bridgeObjectRelease();
      if (v7 == 1) {
        goto LABEL_6;
      }
LABEL_4:
      id v8 = [a4 all];
      if (!v8 || (id v9 = v8, v10 = [v8 BOOLValue], v9, !v10))
      {
        if (qword_100046070 == -1)
        {
LABEL_17:
          uint64_t v20 = sub_1000355A0();
          sub_100009FEC(v20, (uint64_t)qword_100046790);
          swift_bridgeObjectRetain_n();
          Swift::Int v21 = sub_100035590();
          os_log_type_t v22 = sub_1000357A0();
          if (os_log_type_enabled(v21, v22))
          {
            unint64_t v23 = (uint8_t *)swift_slowAlloc();
            id v55 = (void *)swift_slowAlloc();
            *(_DWORD *)unint64_t v23 = 136315138;
            sub_10000A498(0, (unint64_t *)&unk_100046800);
            uint64_t v24 = a2;
            swift_bridgeObjectRetain();
            uint64_t v25 = sub_1000356D0();
            unint64_t v27 = v26;
            swift_bridgeObjectRelease();
            uint64_t v28 = v25;
            a2 = v24;
            sub_10003007C(v28, v27, (uint64_t *)&v55);
            sub_1000359B0();
            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease();
            _os_log_impl((void *)&_mh_execute_header, v21, v22, "Multiple reminders match but user didn't say 'all'. Ask the user to disambiguate which reminder to snooze. {reminders: %s, result: .disambiguation}", v23, 0xCu);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();
          }
          else
          {

            swift_bridgeObjectRelease_n();
          }
          sub_100009F5C(&qword_1000467F0);
          uint64_t v39 = (_OWORD *)swift_allocObject();
          v39[1] = xmmword_100038880;
          if (!v7) {
            goto LABEL_38;
          }
          id v55 = &_swiftEmptyArrayStorage;
          uint64_t result = sub_100035B00();
          if ((v7 & 0x8000000000000000) == 0)
          {
            sub_10000A498(0, &qword_100046318);
            if ((a1 & 0xC000000000000001) != 0)
            {
              uint64_t v40 = 0;
              do
              {
                uint64_t v41 = v40 + 1;
                sub_100035AB0();
                sub_1000358F0();
                sub_100035AE0();
                sub_100035B10();
                sub_100035B20();
                sub_100035AF0();
                uint64_t v40 = v41;
              }
              while (v7 != v41);
            }
            else
            {
              char v42 = (void **)(a1 + 32);
              do
              {
                uint64_t v43 = *v42++;
                id v44 = v43;
                sub_1000358F0();
                sub_100035AE0();
                sub_100035B10();
                sub_100035B20();
                sub_100035AF0();
                --v7;
              }
              while (v7);
            }
LABEL_38:
            sub_10000A498(0, &qword_1000467F8);
            ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
            sub_10000A498(0, &qword_100046318);
            Class isa = sub_1000356B0().super.isa;
            swift_bridgeObjectRelease();
            id v47 = [ObjCClassFromMetadata disambiguationWithTasksToDisambiguate:isa];

            *((void *)v39 + 4) = v47;
            id v55 = v39;
            sub_1000356E0();
            id v32 = v55;
            goto LABEL_39;
          }
          goto LABEL_54;
        }
LABEL_52:
        swift_once();
        goto LABEL_17;
      }
LABEL_6:
      if (qword_100046070 != -1) {
        swift_once();
      }
      uint64_t v11 = sub_1000355A0();
      sub_100009FEC(v11, (uint64_t)qword_100046790);
      swift_bridgeObjectRetain_n();
      id v12 = sub_100035590();
      os_log_type_t v13 = sub_1000357C0();
      if (os_log_type_enabled(v12, v13))
      {
        os_log_type_t v54 = v13;
        uint64_t v14 = swift_slowAlloc();
        id v55 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v14 = 134218242;
        sub_1000359B0();
        *(_WORD *)(v14 + 12) = 2080;
        if (v7)
        {
          uint64_t result = sub_100035B00();
          if (v7 < 0)
          {
            __break(1u);
LABEL_54:
            __break(1u);
            return result;
          }
          uint64_t v16 = 0;
          do
          {
            if ((a1 & 0xC000000000000001) != 0) {
              id v17 = (id)sub_100035AB0();
            }
            else {
              id v17 = *(id *)(a1 + 8 * v16 + 32);
            }
            uint64_t v18 = v17;
            ++v16;
            id v19 = [v17 objectID];

            sub_100035AE0();
            sub_100035B10();
            sub_100035B20();
            sub_100035AF0();
          }
          while (v7 != v16);
        }
        sub_10000A498(0, &qword_100046778);
        uint64_t v29 = sub_1000356D0();
        unint64_t v31 = v30;
        swift_bridgeObjectRelease();
        sub_10003007C(v29, v31, (uint64_t *)&v55);
        sub_1000359B0();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v12, v54, "Resolved %ld tasks to snooze. {reminderIDs: %s, result: .success}", (uint8_t *)v14, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      id v32 = &_swiftEmptyArrayStorage;
      if (!v7)
      {
LABEL_39:
        a2(v32);
        return swift_bridgeObjectRelease();
      }
      id v55 = &_swiftEmptyArrayStorage;
      sub_100035B00();
      if ((v7 & 0x8000000000000000) == 0)
      {
        sub_10000A498(0, &qword_1000467F8);
        uint64_t v33 = (void *)swift_getObjCClassFromMetadata();
        sub_10000A498(0, &qword_100046318);
        uint64_t v34 = 0;
        do
        {
          if ((a1 & 0xC000000000000001) != 0) {
            id v35 = (id)sub_100035AB0();
          }
          else {
            id v35 = *(id *)(a1 + 8 * v34 + 32);
          }
          ++v34;
          id v36 = v35;
          unint64_t v37 = (void *)sub_1000358F0();
          id v38 = [v33 successWithResolvedTask:v37];

          sub_100035AE0();
          sub_100035B10();
          sub_100035B20();
          sub_100035AF0();
        }
        while (v7 != v34);
        a2(v55);
        return swift_bridgeObjectRelease();
      }
      __break(1u);
      goto LABEL_52;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v7)
    {
      if (v7 == 1) {
        goto LABEL_6;
      }
      goto LABEL_4;
    }
  }
  if (qword_100046070 != -1) {
    swift_once();
  }
  uint64_t v49 = sub_1000355A0();
  sub_100009FEC(v49, (uint64_t)qword_100046790);
  unsigned int v50 = sub_100035590();
  os_log_type_t v51 = sub_1000357C0();
  if (os_log_type_enabled(v50, v51))
  {
    uint64_t v52 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v52 = 0;
    _os_log_impl((void *)&_mh_execute_header, v50, v51, "No reminders to snooze. {result: .unsupported(.noTasksFound)}", v52, 2u);
    swift_slowDealloc();
  }

  sub_100009F5C(&qword_1000467F0);
  id v53 = (_OWORD *)swift_allocObject();
  v53[1] = xmmword_100038880;
  *((void *)v53 + 4) = [self unsupportedForReason:1];
  id v55 = v53;
  sub_1000356E0();
  a2(v53);

  return swift_bridgeObjectRelease();
}

void sub_1000160D8(uint64_t a1, uint64_t a2)
{
  sub_10000A498(0, &qword_1000467F8);
  Class isa = sub_1000356B0().super.isa;
  (*(void (**)(uint64_t, objc_class *))(a2 + 16))(a2, isa);
}

id sub_100016298()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TTRSnoozeTasksIntentHandler();
  [super dealloc];
}

uint64_t type metadata accessor for TTRSnoozeTasksIntentHandler()
{
  return self;
}

uint64_t sub_10001634C()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10001638C(unint64_t a1)
{
  return sub_1000156D4(a1, *(void (**)(void))(v1 + 16), *(void *)(v1 + 24), *(id *)(v1 + 32));
}

uint64_t sub_100016398()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000163D8(unint64_t a1)
{
  return sub_1000320A4(a1, *(void (***)(unsigned char *, uint64_t, uint64_t, uint64_t))(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_1000163E4()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_10001641C(unint64_t a1)
{
  sub_1000150F4(a1, *(void (**)(uint64_t))(v1 + 16));
}

id sub_100016424(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = sub_100034F10();
  uint64_t v11 = *(void *)(v10 - 8);
  id v12 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48);
  Class isa = 0;
  if (v12(a1, 1, v10) != 1)
  {
    Class isa = sub_100034EC0().super.isa;
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a1, v10);
  }
  if (v12(a2, 1, v10) == 1)
  {
    Class v14 = 0;
  }
  else
  {
    Class v14 = sub_100034EC0().super.isa;
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a2, v10);
  }
  uint64_t v15 = sub_100034FC0();
  uint64_t v16 = *(void *)(v15 - 8);
  Class v17 = 0;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))(a3, 1, v15) != 1)
  {
    Class v17 = sub_100034F90().super.isa;
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(a3, v15);
  }
  uint64_t v18 = sub_100034FF0();
  uint64_t v19 = *(void *)(v18 - 8);
  Class v20 = 0;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v19 + 48))(a4, 1, v18) != 1)
  {
    Class v20 = sub_100034FD0().super.isa;
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(a4, v18);
  }
  id v21 = [v5 initWithStartDate:isa endDate:v14 onCalendar:v17 inTimeZone:v20];

  return v21;
}

uint64_t sub_1000166CC(uint64_t a1)
{
  if ((a1 & 0xC000000000000001) != 0) {
    return sub_100035B30();
  }
  unint64_t v2 = *(void *)(a1 + 64);
  if (v2)
  {
    uint64_t v3 = 0;
    return __clz(__rbit64(v2)) + v3;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v1 = 1 << v5;
  if (v6 < 7) {
    return v1;
  }
  unint64_t v2 = *(void *)(a1 + 72);
  if (v2)
  {
    uint64_t v3 = 64;
    return __clz(__rbit64(v2)) + v3;
  }
  unint64_t v7 = (unint64_t)(v1 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  id v9 = (unint64_t *)(a1 + 80);
  uint64_t v3 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v2 = v10;
    --v8;
    v3 += 64;
    if (v10) {
      return __clz(__rbit64(v2)) + v3;
    }
  }
  return v1;
}

void sub_100016790(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  if ((a3 & 1) == 0)
  {
    if (a1 < 0 || -(-1 << *(unsigned char *)(a4 + 32)) <= a1)
    {
      __break(1u);
    }
    else if ((*(void *)(a4 + 64 + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> a1))
    {
      if (*(_DWORD *)(a4 + 36) == a2)
      {
        sub_1000359F0();
        return;
      }
      goto LABEL_12;
    }
    __break(1u);
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (sub_100035B70() != *(_DWORD *)(a4 + 36))
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  sub_100035B80();
  sub_1000183E4(a1, a2, 1);
  sub_10000A498(0, &qword_100046778);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  swift_unknownObjectRelease();
  sub_100024D84((uint64_t)v8);
  char v7 = v6;

  if (v7)
  {
    sub_100035B50();
    sub_100035BA0();
    sub_1000183D8(a1, a2, 1);
    swift_unknownObjectRelease();
    return;
  }
LABEL_14:
  __break(1u);
}

void sub_100016930(uint64_t a1, int a2, char a3, uint64_t a4)
{
  unint64_t v5 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a3)
    {
      sub_100035BB0();
      sub_10000A498(0, (unint64_t *)&unk_100046800);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      return;
    }
    goto LABEL_19;
  }
  if (a3)
  {
LABEL_10:
    if (sub_100035B70() == *(_DWORD *)(a4 + 36))
    {
      sub_100035B80();
      sub_10000A498(0, &qword_100046778);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      unint64_t v5 = sub_100024D84((uint64_t)v10);
      char v7 = v6;

      if (v7) {
        goto LABEL_12;
      }
LABEL_18:
      __break(1u);
LABEL_19:
      __break(1u);
      return;
    }
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (a1 < 0 || 1 << *(unsigned char *)(a4 + 32) <= a1)
  {
    __break(1u);
    goto LABEL_16;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)a1 >> 6) + 64) >> a1) & 1) == 0)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
    __break(1u);
    goto LABEL_10;
  }
LABEL_12:
  unint64_t v8 = *(void **)(*(void *)(a4 + 56) + 8 * v5);

  id v9 = v8;
}

void *sub_100016AFC(uint64_t a1, void *a2)
{
  unint64_t v21 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0) {
    uint64_t v4 = sub_100035B90();
  }
  else {
    uint64_t v4 = *(void *)(a1 + 16);
  }
  uint64_t result = &_swiftEmptyArrayStorage;
  if (v4)
  {
    unint64_t v26 = &_swiftEmptyArrayStorage;
    sub_100035B00();
    uint64_t result = (void *)sub_1000166CC(a1);
    uint64_t v23 = (uint64_t)result;
    uint64_t v24 = v6;
    char v25 = v7 & 1;
    if (v4 < 0)
    {
      __break(1u);
LABEL_16:
      __break(1u);
    }
    else
    {
      do
      {
        while (1)
        {
          uint64_t v14 = v23;
          uint64_t v15 = v24;
          char v16 = v25;
          sub_100016930(v23, v24, v25, a1);
          uint64_t v18 = v17;
          id v19 = [a2 updateReminder:v17];

          sub_100035AE0();
          sub_100035B10();
          sub_100035B20();
          uint64_t result = (void *)sub_100035AF0();
          if (v21) {
            break;
          }
          sub_100016790(v14, v15, v16, a1);
          uint64_t v9 = v8;
          uint64_t v11 = v10;
          char v13 = v12;
          sub_1000183D8(v14, v15, v16);
          uint64_t v23 = v9;
          uint64_t v24 = v11;
          char v25 = v13 & 1;
          if (!--v4) {
            goto LABEL_13;
          }
        }
        if ((v16 & 1) == 0) {
          goto LABEL_16;
        }
        if (sub_100035B60()) {
          swift_isUniquelyReferenced_nonNull_native();
        }
        sub_100009F5C(&qword_100046818);
        Class v20 = (void (*)(char *, void))sub_1000355E0();
        sub_100035BE0();
        v20(v22, 0);
        --v4;
      }
      while (v4);
LABEL_13:
      sub_1000183D8(v23, v24, v25);
      return v26;
    }
  }
  return result;
}

uint64_t sub_100016D0C(void *a1, uint64_t a2)
{
  uint64_t v93 = a2;
  uint64_t v3 = sub_100009F5C((uint64_t *)&unk_100046820);
  __chkstk_darwin(v3 - 8);
  uint64_t v92 = (uint8_t *)&v82 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100009F5C((uint64_t *)&unk_1000462B0);
  __chkstk_darwin(v5 - 8);
  uint64_t v91 = (char *)&v82 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100009F5C(&qword_100046810);
  __chkstk_darwin(v7 - 8);
  unsigned int v84 = (char *)&v82 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v90 = (char *)&v82 - v10;
  __chkstk_darwin(v11);
  uint64_t v89 = (char *)&v82 - v12;
  __chkstk_darwin(v13);
  unint64_t v87 = (char *)&v82 - v14;
  __chkstk_darwin(v15);
  unint64_t v85 = (char *)&v82 - v16;
  uint64_t v17 = sub_100034F10();
  uint64_t v97 = *(void **)(v17 - 8);
  __chkstk_darwin(v17);
  unsigned int v83 = (char *)&v82 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  unint64_t v21 = (char *)&v82 - v20;
  __chkstk_darwin(v22);
  uint64_t v24 = (char *)&v82 - v23;
  __chkstk_darwin(v25);
  unint64_t v27 = (char *)&v82 - v26;
  if (qword_100046070 != -1) {
    swift_once();
  }
  uint64_t v28 = sub_1000355A0();
  uint64_t v29 = sub_100009FEC(v28, (uint64_t)qword_100046790);
  id v30 = a1;
  uint64_t v88 = v29;
  unint64_t v31 = sub_100035590();
  os_log_type_t v32 = sub_1000357C0();
  BOOL v33 = os_log_type_enabled(v31, v32);
  uint64_t v96 = v27;
  if (v33)
  {
    uint64_t v34 = (uint8_t *)swift_slowAlloc();
    uint64_t v35 = swift_slowAlloc();
    uint64_t v86 = v24;
    uint64_t v99 = (void *)v35;
    *(_DWORD *)uint64_t v34 = 136315138;
    int v95 = v34 + 4;
    id v98 = [v30 nextTriggerTime];
    sub_100009F5C((uint64_t *)&unk_100046830);
    uint64_t v36 = sub_100035640();
    id v98 = (id)sub_10003007C(v36, v37, (uint64_t *)&v99);
    sub_1000359B0();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v31, v32, "Resolving nextTriggerTime {nextTriggerTime: %s}", v34, 0xCu);
    swift_arrayDestroy();
    uint64_t v24 = v86;
    swift_slowDealloc();
    unint64_t v27 = v96;
    swift_slowDealloc();
  }
  else
  {
  }
  sub_100034F00();
  sub_100034F00();
  sub_100034EB0();
  unint64_t v94 = (void (*)(char *, uint64_t))v97[1];
  int v95 = (uint8_t *)(v97 + 1);
  v94(v21, v17);
  id v38 = [v30 nextTriggerTime];
  uint64_t v39 = (uint64_t)v87;
  if (v38)
  {
    uint64_t v40 = v38;
    id v41 = [v38 endDate];
    if (v41)
    {
      char v42 = v41;
      uint64_t v86 = v24;
      sub_100034EF0();

      uint64_t v43 = v97;
      id v44 = (void (*)(uint64_t, char *, uint64_t))v97[4];
      v44(v39, v21, v17);
      uint64_t v45 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v43[7];
      v45(v39, 0, 1, v17);
      unint64_t v46 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v43[6];
      if (v46(v39, 1, v17) != 1)
      {
        uint64_t v47 = (uint64_t)v85;
        v44((uint64_t)v85, (char *)v39, v17);
        v45(v47, 0, 1, v17);
        uint64_t v24 = v86;
        unint64_t v27 = v96;
LABEL_16:
        if (v46(v47, 1, v17) == 1)
        {

          sub_100018378(v47);
        }
        else
        {
          os_log_type_t v54 = (void (*)(char *, uint64_t, uint64_t))v97[4];
          id v55 = v83;
          v54(v83, v47, v17);
          char v56 = sub_100034ED0();

          if (v56)
          {
            v94(v24, v17);
            v54(v24, (uint64_t)v55, v17);
          }
          else
          {
            v94(v55, v17);
          }
        }
        goto LABEL_21;
      }
      uint64_t v24 = v86;
      unint64_t v27 = v96;
    }
    else
    {
      uint64_t v45 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v97[7];
      v45(v39, 1, 1, v17);
    }
    uint64_t v47 = (uint64_t)v85;
    id v48 = [v40 startDate];
    if (v48)
    {
      uint64_t v49 = v48;
      unsigned int v50 = v84;
      sub_100034EF0();

      uint64_t v51 = (uint64_t)v50;
      uint64_t v52 = 0;
    }
    else
    {
      uint64_t v52 = 1;
      uint64_t v51 = (uint64_t)v84;
    }
    id v53 = v97;
    v45(v51, v52, 1, v17);
    sub_1000183F0(v51, v47);
    sub_100018378(v39);
    unint64_t v46 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v53[6];
    goto LABEL_16;
  }
LABEL_21:
  id v57 = v97;
  uint64_t v58 = (void (*)(char *, char *, uint64_t))v97[2];
  uint64_t v59 = (uint64_t)v89;
  v58(v89, v27, v17);
  os_log_type_t v60 = (void (*)(uint64_t, void, uint64_t, uint64_t))v57[7];
  v60(v59, 0, 1, v17);
  uint64_t v61 = (uint64_t)v90;
  v58(v90, v24, v17);
  v60(v61, 0, 1, v17);
  uint64_t v62 = sub_100034FC0();
  uint64_t v63 = (uint64_t)v91;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v62 - 8) + 56))(v91, 1, 1, v62);
  uint64_t v64 = sub_100034FF0();
  unint64_t v65 = v92;
  (*(void (**)(uint8_t *, uint64_t, uint64_t, uint64_t))(*(void *)(v64 - 8) + 56))(v92, 1, 1, v64);
  id v66 = objc_allocWithZone((Class)INDateComponentsRange);
  id v67 = sub_100016424(v59, v61, v63, (uint64_t)v65);
  uint64_t v68 = sub_100035590();
  os_log_type_t v69 = sub_1000357C0();
  if (os_log_type_enabled(v68, v69))
  {
    uint64_t v70 = (uint8_t *)swift_slowAlloc();
    uint64_t v97 = (void *)swift_slowAlloc();
    uint64_t v99 = v97;
    *(_DWORD *)uint64_t v70 = 136315138;
    uint64_t v91 = (char *)(v70 + 4);
    uint64_t v92 = v70;
    id v71 = v67;
    uint64_t v72 = v17;
    id v73 = [v71 description];
    uint64_t v74 = v24;
    uint64_t v75 = sub_100035630();
    unint64_t v77 = v76;

    uint64_t v17 = v72;
    uint64_t v78 = v75;
    uint64_t v24 = v74;
    id v98 = (id)sub_10003007C(v78, v77, (uint64_t *)&v99);
    sub_1000359B0();

    unint64_t v27 = v96;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v68, v69, "Resolved nextTriggerTime. {nextTriggerTime: %s, result: .success", v92, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v79 = [self successWithResolvedDateComponentsRange:v67];
  (*(void (**)(uint64_t, id))(v93 + 16))(v93, v79);

  unsigned int v80 = (uint64_t (*)(char *, uint64_t))v94;
  v94(v24, v17);
  return v80(v27, v17);
}

void sub_100017710(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v90 = a3;
  uint64_t v86 = a2;
  uint64_t v4 = sub_100009F5C(&qword_100046810);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v82 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100034F10();
  uint64_t v8 = *(void (***)(char *, uint64_t, uint64_t, uint64_t))(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v82 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v82 - v12;
  if (qword_100046070 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_1000355A0();
  uint64_t v15 = (uint8_t *)sub_100009FEC(v14, (uint64_t)qword_100046790);
  id v16 = a1;
  uint64_t v17 = sub_100035590();
  os_log_type_t v18 = sub_1000357C0();
  BOOL v19 = os_log_type_enabled(v17, v18);
  uint64_t v89 = v10;
  if (v19)
  {
    unint64_t v85 = v6;
    uint64_t v20 = swift_slowAlloc();
    uint64_t v87 = v7;
    unint64_t v21 = (uint8_t *)v20;
    uint64_t v22 = (void *)swift_slowAlloc();
    unsigned int v84 = v21;
    *(_DWORD *)unint64_t v21 = 138412290;
    uint64_t v92 = (uint64_t)v16;
    id v23 = v16;
    uint64_t v88 = v13;
    id v24 = v23;
    uint64_t v6 = v85;
    sub_1000359B0();
    *uint64_t v22 = v16;

    uint64_t v13 = v88;
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "SiriKit asked for handling snooze tasks intent {intent: %@}", v84, 0xCu);
    sub_100009F5C((uint64_t *)&unk_1000462F0);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v7 = v87;
    swift_slowDealloc();
  }
  else
  {
  }
  id v25 = [v16 tasks];
  if (!v25)
  {
    uint64_t v43 = sub_100035590();
    os_log_type_t v44 = sub_1000357A0();
    if (os_log_type_enabled(v43, v44))
    {
      uint64_t v45 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v45 = 0;
      _os_log_impl((void *)&_mh_execute_header, v43, v44, "No .tasks to snooze. Should have resolved this in resolve stage. Giving up", v45, 2u);
      swift_slowDealloc();
    }

    id v46 = [objc_allocWithZone((Class)INSnoozeTasksIntentResponse) initWithCode:4 userActivity:0];
    uint64_t v47 = *(void (**)(void))(v90 + 16);
    goto LABEL_32;
  }
  uint64_t v26 = v25;
  sub_10000A498(0, &qword_100046318);
  unint64_t v27 = sub_1000356C0();
  uint64_t v28 = (char *)[v16 nextTriggerTime];
  if (!v28)
  {
    swift_bridgeObjectRelease();

LABEL_29:
    id v48 = sub_100035590();
    os_log_type_t v49 = sub_1000357A0();
    BOOL v50 = os_log_type_enabled(v48, v49);
    uint64_t v51 = v90;
    if (v50)
    {
      uint64_t v52 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v52 = 0;
      _os_log_impl((void *)&_mh_execute_header, v48, v49, "No nextTriggerTime.endDate. Should have resolved this in resolve stage. Giving up.", v52, 2u);
      swift_slowDealloc();
    }

    id v46 = [objc_allocWithZone((Class)INSnoozeTasksIntentResponse) initWithCode:4 userActivity:0];
    uint64_t v47 = *(void (**)(void))(v51 + 16);
LABEL_32:
    v47();

    return;
  }
  unsigned int v84 = v15;
  unint64_t v85 = v28;
  id v29 = [v28 endDate];
  if (!v29)
  {
    v8[7](v6, 1, 1, v7);
    goto LABEL_28;
  }
  id v30 = v29;
  unint64_t v31 = v89;
  sub_100034EF0();

  os_log_type_t v32 = v8[4];
  ((void (*)(char *, char *, uint64_t))v32)(v6, v31, v7);
  v8[7](v6, 0, 1, v7);
  if (((unsigned int (*)(char *, uint64_t, uint64_t))v8[6])(v6, 1, v7) == 1)
  {
LABEL_28:

    swift_bridgeObjectRelease();
    sub_100018378((uint64_t)v6);
    goto LABEL_29;
  }
  ((void (*)(char *, char *, uint64_t))v32)(v13, v6, v7);
  uint64_t v88 = v13;
  sub_100034EE0();
  double v34 = v33;
  unint64_t v35 = *(void *)(v86 + OBJC_IVAR____TtC25RemindersIntentsExtension27TTRSnoozeTasksIntentHandler_store);
  uint64_t v36 = (char *)[objc_allocWithZone((Class)REMSaveRequest) initWithStore:v35];
  uint64_t v92 = (uint64_t)&_swiftEmptyArrayStorage;
  if (v27 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v37 = sub_100035C00();
  }
  else
  {
    uint64_t v37 = *(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  id v82 = v26;
  unsigned int v83 = v8;
  uint64_t v89 = v36;
  if (v37)
  {
    if (v37 < 1)
    {
      __break(1u);
      goto LABEL_46;
    }
    unint64_t v38 = v35;
    for (uint64_t i = 0; i != v37; ++i)
    {
      if ((v27 & 0xC000000000000001) != 0) {
        id v40 = (id)sub_100035AB0();
      }
      else {
        id v40 = *(id *)(v27 + 8 * i + 32);
      }
      id v41 = v40;
      uint64_t v42 = sub_1000358B0();

      if (v42)
      {
        sub_1000356A0();
        if (*(void *)((v92 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v92 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_1000356F0();
        }
        sub_100035700();
        sub_1000356E0();
      }
    }
    swift_bridgeObjectRelease();
    unint64_t v35 = v38;
    uint64_t v36 = v89;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  sub_10000A498(0, &qword_100046778);
  Class isa = sub_1000356B0().super.isa;
  uint64_t v92 = 0;
  id v54 = [(id)v35 fetchRemindersWithObjectIDs:isa error:&v92];

  id v55 = (id)v92;
  uint64_t v87 = v7;
  if (!v54) {
    goto LABEL_51;
  }
  sub_10000A498(0, (unint64_t *)&unk_100046800);
  sub_100014DA4();
  uint64_t v56 = sub_1000355C0();
  id v57 = v55;

  uint64_t v8 = v36;
  unint64_t v35 = (unint64_t)sub_100016AFC(v56, v8);
  swift_bridgeObjectRelease();

  if (v35 >> 62)
  {
LABEL_46:
    swift_bridgeObjectRetain();
    uint64_t v58 = sub_100035C00();
    if (v58) {
      goto LABEL_38;
    }
    goto LABEL_47;
  }
  uint64_t v58 = *(void *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v58)
  {
LABEL_38:
    if (v58 < 1) {
      __break(1u);
    }
    for (uint64_t j = 0; j != v58; ++j)
    {
      if ((v35 & 0xC000000000000001) != 0) {
        id v60 = (id)sub_100035AB0();
      }
      else {
        id v60 = *(id *)(v35 + 8 * j + 32);
      }
      uint64_t v61 = v60;
      [v60 snoozeFromNowForTimeInterval:v34, v82];
    }
  }
LABEL_47:
  swift_bridgeObjectRelease_n();
  uint64_t v92 = 0;
  unsigned int v62 = [v8 saveSynchronouslyWithError:&v92];
  id v55 = (id)v92;
  if (v62)
  {
    id v63 = (id)v92;
    sub_100035050();
    swift_retain();
    sub_100035040();
    swift_release();
    swift_bridgeObjectRetain();
    uint64_t v64 = sub_100035590();
    os_log_type_t v65 = sub_1000357C0();
    if (os_log_type_enabled(v64, v65))
    {
      id v66 = (uint8_t *)swift_slowAlloc();
      uint64_t v92 = swift_slowAlloc();
      *(_DWORD *)id v66 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v67 = sub_1000356D0();
      unint64_t v69 = v68;
      swift_bridgeObjectRelease();
      uint64_t v91 = sub_10003007C(v67, v69, &v92);
      sub_1000359B0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v64, v65, "Successfully snoozed reminders. {reminderIDs: %s}", v66, 0xCu);
      swift_arrayDestroy();
      uint64_t v70 = v90;
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v71 = v87;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      uint64_t v71 = v87;
      uint64_t v70 = v90;
    }
    id v80 = [objc_allocWithZone((Class)INSnoozeTasksIntentResponse) initWithCode:3 userActivity:0];
    id v81 = v82;
    [v80 setSnoozedTasks:v82];

    (*(void (**)(uint64_t, id))(v70 + 16))(v70, v80);
    ((void (*)(char *, uint64_t))v83[1])(v88, v71);
    return;
  }
  uint64_t v7 = v87;
  uint64_t v36 = v89;
LABEL_51:
  id v72 = v55;

  sub_100034E50();
  swift_willThrow();
  swift_bridgeObjectRetain();
  id v73 = sub_100035590();
  os_log_type_t v74 = sub_1000357A0();
  if (os_log_type_enabled(v73, v74))
  {
    uint64_t v75 = (uint8_t *)swift_slowAlloc();
    uint64_t v92 = swift_slowAlloc();
    *(_DWORD *)uint64_t v75 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v76 = sub_1000356D0();
    unint64_t v78 = v77;
    swift_bridgeObjectRelease();
    uint64_t v91 = sub_10003007C(v76, v78, &v92);
    uint64_t v36 = v89;
    uint64_t v7 = v87;
    sub_1000359B0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v73, v74, "Error snoozing reminders {reminderIDs: %s}", v75, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  id v79 = [objc_allocWithZone((Class)INSnoozeTasksIntentResponse) initWithCode:4 userActivity:0];
  (*(void (**)(uint64_t, id))(v90 + 16))(v90, v79);

  swift_errorRelease();
  ((void (*)(char *, uint64_t))v83[1])(v88, v7);
}

uint64_t sub_100018378(uint64_t a1)
{
  uint64_t v2 = sub_100009F5C(&qword_100046810);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000183D8(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1000183E4(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_1000183F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100009F5C(&qword_100046810);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100018458()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100018490(uint64_t a1)
{
  sub_1000160D8(a1, *(void *)(v1 + 16));
}

uint64_t sub_100018498()
{
  uint64_t v0 = sub_1000355A0();
  sub_10000A434(v0, qword_100046840);
  uint64_t v1 = sub_100009FEC(v0, (uint64_t)qword_100046840);
  if (qword_1000460A0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100009FEC(v0, (uint64_t)qword_1000472B0);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

id sub_100018560()
{
  uint64_t v1 = OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler____lazy_storage___contactStore;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler____lazy_storage___contactStore);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler____lazy_storage___contactStore);
  }
  else
  {
    id v4 = [objc_allocWithZone((Class)CNContactStore) init];
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id TTRIntentHandler.handler(for:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t ObjectType = swift_getObjectType();
  if (qword_100046078 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_1000355A0();
  sub_100009FEC(v4, (uint64_t)qword_100046840);
  id v5 = a1;
  id v6 = sub_100035590();
  os_log_type_t v7 = sub_100035790();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 138412290;
    id v10 = v5;
    sub_1000359B0();
    *uint64_t v9 = v5;

    _os_log_impl((void *)&_mh_execute_header, v6, v7, "SiriKit asks for handler for intent: %@", v8, 0xCu);
    sub_100009F5C((uint64_t *)&unk_1000462F0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  self;
  if (swift_dynamicCastObjCClass())
  {
    uint64_t v11 = &OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler____lazy_storage___addTasksHandler;
    uint64_t v12 = (uint64_t (*)(uint64_t))sub_100018EE0;
LABEL_8:
    uint64_t v13 = sub_100018C0C(v11, v12);
LABEL_11:
    uint64_t v14 = v13;
    id result = (id)swift_getObjectType();
LABEL_12:
    a2[3] = (uint64_t)result;
    *a2 = v14;
    return result;
  }
  self;
  if (swift_dynamicCastObjCClass())
  {
    uint64_t v13 = (uint64_t)sub_1000189F8();
    goto LABEL_11;
  }
  self;
  if (swift_dynamicCastObjCClass())
  {
    uint64_t v11 = &OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler____lazy_storage___snoozeTasksHandler;
    uint64_t v12 = (uint64_t (*)(uint64_t))sub_1000191D8;
    goto LABEL_8;
  }
  self;
  if (swift_dynamicCastObjCClass())
  {
    uint64_t v11 = &OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler____lazy_storage___searchForNotebookItemsHandler;
    uint64_t v12 = (uint64_t (*)(uint64_t))sub_100019338;
    goto LABEL_8;
  }
  sub_1000352A0();
  if (swift_dynamicCastClass())
  {
    uint64_t v14 = (uint64_t)sub_100018C74();
    id result = (id)type metadata accessor for ConfigurationIntentHandler();
    goto LABEL_12;
  }
  id v16 = v5;
  uint64_t v17 = sub_100035590();
  os_log_type_t v18 = sub_1000357B0();
  if (os_log_type_enabled(v17, v18))
  {
    BOOL v19 = (uint8_t *)swift_slowAlloc();
    uint64_t v20 = (void *)swift_slowAlloc();
    *(_DWORD *)BOOL v19 = 138412290;
    unint64_t v21 = v16;
    sub_1000359B0();
    *uint64_t v20 = v16;

    _os_log_impl((void *)&_mh_execute_header, v17, v18, "TTRIntentHandler does not know how to handle intent of class: %@", v19, 0xCu);
    sub_100009F5C((uint64_t *)&unk_1000462F0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    uint64_t v17 = v16;
  }

  a2[3] = ObjectType;
  *a2 = (uint64_t)v23;

  return v23;
}

id sub_1000189F8()
{
  uint64_t v1 = OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler____lazy_storage___setTaskAttributeHandler;
  if (*(void *)&v0[OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler____lazy_storage___setTaskAttributeHandler])
  {
    id v2 = *(id *)&v0[OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler____lazy_storage___setTaskAttributeHandler];
  }
  else
  {
    id v3 = v0;
    uint64_t v4 = *(void **)&v0[OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler_store];
    id v5 = *(void **)&v3[OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler_queue];
    type metadata accessor for TTRIntentsHandlerStoreDataSource();
    uint64_t v6 = swift_allocObject();
    uint64_t v7 = qword_100046068;
    id v8 = v4;
    if (v7 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_1000355A0();
    sub_100009FEC(v9, (uint64_t)qword_100046658);
    id v10 = sub_100035590();
    os_log_type_t v11 = sub_1000357C0();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "[TTRIntentsHandlerStoreDataSource] Using the backup intents handler data source", v12, 2u);
      swift_slowDealloc();
    }

    *(void *)(v6 + 16) = v8;
    type metadata accessor for TTRIntentsHandlerSpotlightDataSource();
    uint64_t v13 = swift_allocObject();
    id v14 = v8;
    id v15 = v5;
    uint64_t v16 = sub_100019810((uint64_t)v14, (uint64_t)v15, v6, v13);
    uint64_t v17 = swift_allocObject();
    *(void *)(v17 + 16) = v3;
    sub_100035190();
    os_log_type_t v18 = (uint64_t *)swift_allocObject();
    id v19 = v14;
    id v20 = v15;
    unint64_t v21 = v3;
    id v22 = sub_100019B7C((uint64_t)v19, (uint64_t)v20, (uint64_t)sub_100019F48, v17, v16, v18);
    *(void *)&v3[v1] = v22;
    id v2 = v22;
    swift_unknownObjectRelease();
  }
  swift_unknownObjectRetain();
  return v2;
}

uint64_t sub_100018C0C(uint64_t *a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = *a1;
  uint64_t v4 = *(void *)(v2 + *a1);
  if (v4)
  {
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v5 = a2(v2);
    *(void *)(v2 + v3) = v5;
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
  }
  swift_unknownObjectRetain();
  return v5;
}

id sub_100018C74()
{
  uint64_t v1 = OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler____lazy_storage___widgetListHandler;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler____lazy_storage___widgetListHandler);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler____lazy_storage___widgetListHandler);
  }
  else
  {
    uint64_t v4 = v0;
    uint64_t v5 = *(void **)(v0 + OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler_store);
    uint64_t v6 = *(void **)(v4 + OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler_queue);
    type metadata accessor for TTRIntentsHandlerStoreDataSource();
    uint64_t v7 = swift_allocObject();
    uint64_t v8 = qword_100046068;
    id v9 = v5;
    if (v8 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_1000355A0();
    sub_100009FEC(v10, (uint64_t)qword_100046658);
    os_log_type_t v11 = sub_100035590();
    os_log_type_t v12 = sub_1000357C0();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "[TTRIntentsHandlerStoreDataSource] Using the backup intents handler data source", v13, 2u);
      swift_slowDealloc();
    }

    *(void *)(v7 + 16) = v9;
    type metadata accessor for TTRIntentsHandlerSpotlightDataSource();
    uint64_t v14 = swift_allocObject();
    id v15 = v9;
    id v16 = v6;
    uint64_t v17 = sub_100019810((uint64_t)v15, (uint64_t)v16, v7, v14);
    os_log_type_t v18 = (char *)objc_allocWithZone((Class)type metadata accessor for ConfigurationIntentHandler());
    id v19 = v15;
    id v20 = v16;
    id v21 = sub_100019D9C(v19, v20, v17, v18);

    id v22 = *(void **)(v4 + v1);
    *(void *)(v4 + v1) = v21;
    id v3 = v21;

    uint64_t v2 = 0;
  }
  id v23 = v2;
  return v3;
}

id sub_100018EE0(char *a1)
{
  uint64_t v2 = *(void **)&a1[OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler_store];
  id v3 = *(void **)&a1[OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler_queue];
  type metadata accessor for TTRIntentsHandlerStoreDataSource();
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = qword_100046068;
  id v6 = v2;
  if (v5 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_1000355A0();
  sub_100009FEC(v7, (uint64_t)qword_100046658);
  uint64_t v8 = sub_100035590();
  os_log_type_t v9 = sub_1000357C0();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "[TTRIntentsHandlerStoreDataSource] Using the backup intents handler data source", v10, 2u);
    swift_slowDealloc();
  }

  *(void *)(v4 + 16) = v6;
  type metadata accessor for TTRIntentsHandlerSpotlightDataSource();
  uint64_t v11 = swift_allocObject();
  id v12 = v6;
  id v13 = v3;
  uint64_t v14 = sub_100019810((uint64_t)v12, (uint64_t)v13, v4, v11);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a1;
  sub_100035190();
  uint64_t v16 = swift_allocObject();
  v31[3] = &type metadata for TTRContactRepresentationResolver;
  v31[4] = &off_100041EC0;
  v31[0] = sub_10001996C;
  v31[1] = v15;
  uint64_t v17 = objc_allocWithZone((Class)type metadata accessor for TTRAddTasksIntentHandler());
  uint64_t v18 = sub_100019990((uint64_t)v31, (uint64_t)&type metadata for TTRContactRepresentationResolver);
  double v19 = __chkstk_darwin(v18);
  id v21 = (void *)((char *)&v31[-1] - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *, double))(v22 + 16))(v21, v19);
  uint64_t v23 = *v21;
  uint64_t v24 = v21[1];
  id v25 = v12;
  id v26 = v13;
  unint64_t v27 = a1;
  swift_retain();
  swift_retain();
  swift_retain();
  id v28 = sub_1000199E0((uint64_t)v25, (uint64_t)v26, v14, v23, v24, v16, v17);
  sub_10000A4D4((uint64_t)v31);
  swift_release();
  swift_release();
  swift_release();
  return v28;
}

id sub_1000191D8(uint64_t a1)
{
  sub_100035630();
  id v2 = objc_allocWithZone((Class)UNUserNotificationCenter);
  NSString v3 = sub_100035600();
  swift_bridgeObjectRelease();
  id v4 = [v2 initWithBundleIdentifier:v3];

  uint64_t v5 = *(void **)(a1 + OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler_store);
  uint64_t v15 = sub_10000A498(0, (unint64_t *)&unk_1000468D0);
  uint64_t v16 = &off_1000420E8;
  *(void *)&long long v14 = v4;
  type metadata accessor for TTRIntentsHandlerNotificationCenterDataSource();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  sub_100019B64(&v14, v6 + 24);
  uint64_t v7 = *(void **)(a1 + OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler_queue);
  uint64_t v8 = (objc_class *)type metadata accessor for TTRSnoozeTasksIntentHandler();
  os_log_type_t v9 = (char *)objc_allocWithZone(v8);
  *(void *)&v9[OBJC_IVAR____TtC25RemindersIntentsExtension27TTRSnoozeTasksIntentHandler_store] = v5;
  *(void *)&v9[OBJC_IVAR____TtC25RemindersIntentsExtension27TTRSnoozeTasksIntentHandler_queue] = v7;
  *(void *)&v9[OBJC_IVAR____TtC25RemindersIntentsExtension27TTRSnoozeTasksIntentHandler_dataSource] = v6;
  v13.receiver = v9;
  v13.super_class = v8;
  id v10 = v5;
  id v11 = v7;
  return [super init];
}

id sub_100019338(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler_store);
  id v2 = *(void **)(a1 + OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler_queue);
  type metadata accessor for TTRIntentsHandlerStoreDataSource();
  uint64_t v3 = swift_allocObject();
  uint64_t v4 = qword_100046068;
  id v5 = v1;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_1000355A0();
  sub_100009FEC(v6, (uint64_t)qword_100046658);
  uint64_t v7 = sub_100035590();
  os_log_type_t v8 = sub_1000357C0();
  if (os_log_type_enabled(v7, v8))
  {
    os_log_type_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "[TTRIntentsHandlerStoreDataSource] Using the backup intents handler data source", v9, 2u);
    swift_slowDealloc();
  }

  *(void *)(v3 + 16) = v5;
  uint64_t v10 = type metadata accessor for TTRIntentsHandlerSpotlightDataSource();
  uint64_t v11 = swift_allocObject();
  id v12 = v5;
  id v13 = v2;
  swift_retain();
  uint64_t v14 = sub_100019810((uint64_t)v12, (uint64_t)v13, v3, v11);
  v24[3] = v10;
  v24[4] = &off_100041ED0;
  swift_release();
  v24[0] = v14;
  sub_10000D3F4((uint64_t)v24, (uint64_t)v23);
  v22[3] = sub_100035190();
  v22[4] = &protocol witness table for TTRCurrentTimeProvider;
  v22[0] = swift_allocObject();
  uint64_t v15 = (objc_class *)type metadata accessor for TTRSearchForNotebookItemsIntentHandler();
  uint64_t v16 = (char *)objc_allocWithZone(v15);
  *(void *)&v16[OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_store] = v12;
  *(void *)&v16[OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_queue] = v13;
  sub_10000D3F4((uint64_t)v23, (uint64_t)&v16[OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_dataSource]);
  sub_10000D3F4((uint64_t)v22, (uint64_t)&v16[OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_timeProvider]);
  v21.receiver = v16;
  v21.super_class = v15;
  id v17 = v12;
  id v18 = v13;
  swift_retain();
  [super init];
  sub_10000A4D4((uint64_t)v22);
  sub_10000A4D4((uint64_t)v23);
  swift_release();
  sub_10000A4D4((uint64_t)v24);
  return v19;
}

id TTRIntentHandler.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id TTRIntentHandler.init()()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler_store;
  id v3 = objc_allocWithZone((Class)REMStore);
  uint64_t v4 = v0;
  *(void *)&v0[v2] = [v3 initUserInteractive:1];
  uint64_t v5 = OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler_queue;
  sub_10000A498(0, (unint64_t *)&qword_1000460D0);
  *(void *)&v4[v5] = sub_100035820();
  *(void *)&v4[OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler____lazy_storage___contactStore] = 0;
  *(void *)&v4[OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler____lazy_storage___addTasksHandler] = 0;
  *(void *)&v4[OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler____lazy_storage___setTaskAttributeHandler] = 0;
  *(void *)&v4[OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler____lazy_storage___snoozeTasksHandler] = 0;
  *(void *)&v4[OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler____lazy_storage___searchForNotebookItemsHandler] = 0;
  *(void *)&v4[OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler____lazy_storage___widgetListHandler] = 0;

  v7.receiver = v4;
  v7.super_class = ObjectType;
  return [super init];
}

id TTRIntentHandler.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return [super dealloc];
}

uint64_t type metadata accessor for TTRIntentHandler()
{
  return self;
}

uint64_t sub_100019810(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v14 = type metadata accessor for TTRIntentsHandlerStoreDataSource();
  uint64_t v15 = &off_1000415A8;
  *(void *)&long long v13 = a3;
  if (qword_1000460B8 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_1000355A0();
  sub_100009FEC(v8, (uint64_t)qword_100046C88);
  os_log_type_t v9 = sub_100035590();
  os_log_type_t v10 = sub_1000357C0();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "[TTRIntentsHandlerSpotlightDataSource] Using the Spotlight intents handler data source", v11, 2u);
    swift_slowDealloc();
  }

  *(void *)(a4 + 16) = a1;
  *(void *)(a4 + 24) = a2;
  sub_100019B64(&v13, a4 + 32);
  return a4;
}

uint64_t sub_100019934()
{
  return _swift_deallocObject(v0, 24, 7);
}

id sub_10001996C()
{
  return sub_100018560();
}

uint64_t sub_100019990(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

id sub_1000199E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  v22[3] = type metadata accessor for TTRIntentsHandlerSpotlightDataSource();
  v22[4] = &off_100041ED0;
  v22[0] = a3;
  uint64_t v20 = &type metadata for TTRCurrentUserActivityProvider;
  objc_super v21 = &protocol witness table for TTRCurrentUserActivityProvider;
  v18[3] = sub_100035190();
  v18[4] = &protocol witness table for TTRCurrentTimeProvider;
  v18[0] = a6;
  v17[3] = &type metadata for TTRContactRepresentationResolver;
  v17[4] = &off_100041EC0;
  v17[0] = a4;
  v17[1] = a5;
  a7[OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_didNotSpecifyTargetList] = 0;
  sub_10000D3F4((uint64_t)v18, (uint64_t)&a7[OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_timeProvider]);
  *(void *)&a7[OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_store] = a1;
  *(void *)&a7[OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_queue] = a2;
  sub_10000D3F4((uint64_t)v22, (uint64_t)&a7[OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_dataSource]);
  sub_10000D3F4((uint64_t)v17, (uint64_t)&a7[OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_contactRepresentationResolver]);
  sub_10000D3F4((uint64_t)v19, (uint64_t)&a7[OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_userActivityProvider]);
  v16.receiver = a7;
  v16.super_class = (Class)type metadata accessor for TTRAddTasksIntentHandler();
  [super init];
  sub_10000A4D4((uint64_t)v18);
  sub_10000A4D4((uint64_t)v19);
  sub_10000A4D4((uint64_t)v17);
  sub_10000A4D4((uint64_t)v22);
  return v14;
}

uint64_t sub_100019B64(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

id sub_100019B7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6)
{
  uint64_t v12 = *a6;
  v28[4] = &off_100041ED0;
  v28[3] = type metadata accessor for TTRIntentsHandlerSpotlightDataSource();
  v28[0] = a5;
  v27[3] = &type metadata for TTRContactRepresentationResolver;
  v27[4] = &off_100041EC0;
  v27[0] = a3;
  v27[1] = a4;
  v26[3] = v12;
  v26[4] = &protocol witness table for TTRCurrentTimeProvider;
  v26[0] = a6;
  long long v13 = (objc_class *)type metadata accessor for TTRSetTaskAttributeIntentHandler();
  id v14 = (char *)objc_allocWithZone(v13);
  uint64_t v15 = sub_100019990((uint64_t)v27, (uint64_t)&type metadata for TTRContactRepresentationResolver);
  double v16 = __chkstk_darwin(v15);
  id v18 = (long long *)((char *)&v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(long long *, double))(v19 + 16))(v18, v16);
  uint64_t v24 = &type metadata for TTRContactRepresentationResolver;
  id v25 = &off_100041EC0;
  long long v23 = *v18;
  *(void *)&v14[OBJC_IVAR____TtC25RemindersIntentsExtension32TTRSetTaskAttributeIntentHandler_store] = a1;
  *(void *)&v14[OBJC_IVAR____TtC25RemindersIntentsExtension32TTRSetTaskAttributeIntentHandler_queue] = a2;
  sub_10000D3F4((uint64_t)&v23, (uint64_t)&v14[OBJC_IVAR____TtC25RemindersIntentsExtension32TTRSetTaskAttributeIntentHandler_contactRepresentationResolver]);
  sub_10000D3F4((uint64_t)v28, (uint64_t)&v14[OBJC_IVAR____TtC25RemindersIntentsExtension32TTRSetTaskAttributeIntentHandler_dataSource]);
  sub_10000D3F4((uint64_t)v26, (uint64_t)&v14[OBJC_IVAR____TtC25RemindersIntentsExtension32TTRSetTaskAttributeIntentHandler_timeProvider]);
  v22.receiver = v14;
  v22.super_class = v13;
  id v20 = [super init];
  sub_10000A4D4((uint64_t)v26);
  sub_10000A4D4((uint64_t)v28);
  sub_10000A4D4((uint64_t)&v23);
  sub_10000A4D4((uint64_t)v27);
  return v20;
}

id sub_100019D9C(void *a1, void *a2, uint64_t a3, char *a4)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  v20[3] = type metadata accessor for TTRIntentsHandlerSpotlightDataSource();
  v20[4] = &off_100041ED0;
  v20[0] = a3;
  *(int64x2_t *)&a4[OBJC_IVAR____TtC25RemindersIntentsExtension26ConfigurationIntentHandler_badgeSize] = vdupq_n_s64(0x4040000000000000uLL);
  uint64_t v9 = qword_100046080;
  os_log_type_t v10 = a4;
  if (v9 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_1000355A0();
  sub_100009FEC(v11, (uint64_t)qword_1000468E0);
  uint64_t v12 = sub_100035590();
  os_log_type_t v13 = sub_1000357C0();
  if (os_log_type_enabled(v12, v13))
  {
    id v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "ConfigurationIntentHandler Created", v14, 2u);
    swift_slowDealloc();
  }

  *(void *)&v10[OBJC_IVAR____TtC25RemindersIntentsExtension26ConfigurationIntentHandler_store] = a1;
  *(void *)&v10[OBJC_IVAR____TtC25RemindersIntentsExtension26ConfigurationIntentHandler_queue] = a2;
  sub_10000D3F4((uint64_t)v20, (uint64_t)&v10[OBJC_IVAR____TtC25RemindersIntentsExtension26ConfigurationIntentHandler_dataSource]);
  id v15 = a1;
  id v16 = a2;

  v19.receiver = v10;
  v19.super_class = ObjectType;
  id v17 = [super init];
  sub_10000A4D4((uint64_t)v20);
  return v17;
}

uint64_t sub_100019F4C()
{
  uint64_t v0 = sub_1000355A0();
  sub_10000A434(v0, qword_1000468E0);
  uint64_t v1 = sub_100009FEC(v0, (uint64_t)qword_1000468E0);
  if (qword_1000460A0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100009FEC(v0, (uint64_t)qword_1000472B0);
  long long v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

void sub_10001A09C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (qword_100046080 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_1000355A0();
  sub_100009FEC(v8, (uint64_t)qword_1000468E0);
  swift_bridgeObjectRetain_n();
  id v9 = a1;
  os_log_type_t v10 = sub_100035590();
  os_log_type_t v11 = sub_1000357C0();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v35 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136315394;
    id v13 = v9;
    id v14 = [v13 description];
    uint64_t v15 = sub_100035630();
    unint64_t v17 = v16;

    sub_10003007C(v15, v17, &v35);
    sub_1000359B0();

    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2080;
    uint64_t v18 = a2;
    swift_bridgeObjectRetain();
    sub_100009F5C(&qword_100046950);
    uint64_t v19 = sub_100035640();
    sub_10003007C(v19, v20, &v35);
    sub_1000359B0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Widget provideListOptions {intent: %s, searchTerm: %s}", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    uint64_t v18 = a2;
  }
  sub_100009F5C(&qword_100046948);
  objc_super v21 = &v33[OBJC_IVAR____TtC25RemindersIntentsExtension26ConfigurationIntentHandler_dataSource];
  uint64_t v22 = *(void *)&v33[OBJC_IVAR____TtC25RemindersIntentsExtension26ConfigurationIntentHandler_dataSource + 24];
  uint64_t v23 = *(void *)&v33[OBJC_IVAR____TtC25RemindersIntentsExtension26ConfigurationIntentHandler_dataSource + 32];
  sub_10000A024(&v33[OBJC_IVAR____TtC25RemindersIntentsExtension26ConfigurationIntentHandler_dataSource], v22);
  sub_10000DEAC(v22, v23);
  uint64_t v24 = *((void *)v21 + 3);
  uint64_t v25 = *((void *)v21 + 4);
  sub_10000A024(v21, v24);
  sub_10000DDD8(v24, v25);
  sub_100035520();
  swift_release();
  swift_release();
  id v26 = (void *)swift_allocObject();
  v26[2] = a4;
  v26[3] = a5;
  v26[4] = v33;
  void v26[5] = v18;
  v26[6] = a3;
  uint64_t v27 = swift_allocObject();
  *(void *)(v27 + 16) = sub_10001DD70;
  *(void *)(v27 + 24) = v26;
  swift_bridgeObjectRetain();
  swift_retain();
  id v28 = v33;
  id v29 = (void *)sub_1000354F0();
  sub_100035530();
  swift_release();

  uint64_t v30 = swift_allocObject();
  *(void *)(v30 + 16) = a4;
  *(void *)(v30 + 24) = a5;
  swift_retain();
  unint64_t v31 = (void *)sub_1000354F0();
  sub_100035540();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
}

void sub_10001A59C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = sub_100034E40();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
}

uint64_t sub_10001A60C(uint64_t a1, uint64_t a2, uint64_t (*a3)(id, void), uint64_t a4, char *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v188 = a7;
  uint64_t v180 = a6;
  unint64_t v233 = a5;
  uint64_t v175 = a4;
  v176 = (uint64_t (*)(id, void))a3;
  uint64_t v224 = sub_1000353F0();
  uint64_t v192 = *(void *)(v224 - 8);
  __chkstk_darwin(v224);
  os_log_type_t v10 = (id *)((char *)&v170 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v11);
  v223 = (char *)&v170 - v12;
  uint64_t v199 = sub_100035420();
  id v13 = *(char **)(v199 - 8);
  __chkstk_darwin(v199);
  id v198 = (char *)&v170 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v229 = sub_100034E80();
  unint64_t v232 = *(void *)(v229 - 8);
  __chkstk_darwin(v229);
  int v228 = (char *)&v170 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v212 = sub_100035400();
  uint64_t v185 = *(void *)(v212 - 8);
  __chkstk_darwin(v212);
  v206 = (void **)((char *)&v170 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v17);
  uint64_t v19 = (char *)&v170 - v18;
  uint64_t v191 = sub_100035450();
  uint64_t v189 = *(void *)(v191 - 8);
  __chkstk_darwin(v191);
  unint64_t v184 = (char *)&v170 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_100009F5C(&qword_100046768);
  __chkstk_darwin(v21 - 8);
  uint64_t v23 = (char *)&v170 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_100035470();
  uint64_t v25 = *(void *)(v24 - 8);
  __chkstk_darwin(v24);
  uint64_t v27 = (char *)&v170 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v28);
  unint64_t v177 = (char *)&v170 - v29;
  if (!a1)
  {
LABEL_4:
    if (qword_100046080 == -1)
    {
LABEL_5:
      uint64_t v30 = sub_1000355A0();
      sub_100009FEC(v30, (uint64_t)qword_1000468E0);
      unint64_t v31 = sub_100035590();
      os_log_type_t v32 = sub_1000357A0();
      if (os_log_type_enabled(v31, v32))
      {
        double v33 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)double v33 = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, v32, "Widget provideListOptions failed no data", v33, 2u);
        swift_slowDealloc();
      }

      return v176(0, 0);
    }
LABEL_76:
    swift_once();
    goto LABEL_5;
  }
  sub_10001DE20(a2, (uint64_t)v23);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24) == 1)
  {
    sub_10000A1C0((uint64_t)v23, &qword_100046768);
    goto LABEL_4;
  }
  uint64_t v226 = v13;
  uint64_t v35 = v177;
  (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v177, v23, v24);
  uint64_t v36 = qword_100046080;
  swift_bridgeObjectRetain();
  if (v36 != -1) {
    swift_once();
  }
  uint64_t v37 = sub_1000355A0();
  uint64_t v38 = sub_100009FEC(v37, (uint64_t)qword_1000468E0);
  (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v27, v35, v24);
  swift_bridgeObjectRetain();
  uint64_t v39 = v25;
  uint64_t v172 = v38;
  id v40 = sub_100035590();
  os_log_type_t v41 = sub_1000357C0();
  BOOL v42 = os_log_type_enabled(v40, v41);
  unint64_t v222 = v10;
  v210 = v19;
  uint64_t v174 = v24;
  uint64_t v173 = v39;
  if (v42)
  {
    uint64_t v43 = swift_slowAlloc();
    *(_DWORD *)uint64_t v43 = 134218240;
    aBlock = *(void ***)(a1 + 16);
    sub_1000359B0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v43 + 12) = 2048;
    os_log_type_t v44 = *(void ***)(sub_100035460() + 16);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v39 + 8))(v27, v24);
    aBlock = v44;
    sub_1000359B0();
    _os_log_impl((void *)&_mh_execute_header, v40, v41, "Widget provideListOptions smartListTypes: %ld, accounts %ld ", (uint8_t *)v43, 0x16u);
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v39 + 8))(v27, v24);

    swift_bridgeObjectRelease();
  }
  unint64_t v243 = (unint64_t)&_swiftEmptyArrayStorage;
  sub_100035210();
  uint64_t v45 = sub_100035200();
  uint64_t v46 = *(void *)(a1 + 16);
  uint64_t v47 = v224;
  id v48 = v226;
  if (v46)
  {
    uint64_t v49 = v45;
    BOOL v50 = (id *)(a1 + 32);
    uint64_t v51 = (void **)&_swiftEmptyArrayStorage;
    do
    {
      id v248 = *v50;
      id v52 = v248;
      if (sub_10001C34C((uint64_t)&v248, v49))
      {
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        aBlock = v51;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_100024FC8(0, (int64_t)v51[2] + 1, 1);
          uint64_t v51 = aBlock;
        }
        unint64_t v55 = (unint64_t)v51[2];
        unint64_t v54 = (unint64_t)v51[3];
        if (v55 >= v54 >> 1)
        {
          sub_100024FC8(v54 > 1, v55 + 1, 1);
          uint64_t v51 = aBlock;
        }
        v51[2] = (void *)(v55 + 1);
        v51[v55 + 4] = v52;
        uint64_t v47 = v224;
      }
      else
      {
      }
      ++v50;
      --v46;
    }
    while (v46);
  }
  else
  {
    uint64_t v51 = (void **)&_swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRelease();
  uint64_t v56 = v233;
  id v57 = sub_10001DE88((uint64_t)v51);
  swift_release();
  unint64_t v231 = v56;

  uint64_t v58 = v188;
  if (v188)
  {
    swift_bridgeObjectRetain();
    sub_10001DF60((unint64_t)v57, v180, v58);
    uint64_t v187 = 0;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v187 = 0;
  }
  uint64_t v59 = v222;
  id v60 = v223;
  uint64_t v61 = v184;
  id v62 = objc_allocWithZone((Class)INObjectSection);
  uint64_t v230 = sub_100035260();
  Class isa = sub_1000356B0().super.isa;
  swift_bridgeObjectRelease();
  id v64 = [v62 initWithTitle:0 items:isa];

  id v65 = v64;
  sub_1000356A0();
  if (*(void *)((v243 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v243 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_1000356F0();
  }
  id v171 = v65;
  sub_100035700();
  sub_1000356E0();
  uint64_t v66 = sub_100035460();
  uint64_t v181 = *(void *)(v66 + 16);
  if (!v181)
  {
LABEL_67:
    swift_bridgeObjectRelease();
    unint64_t v160 = v243;
    swift_bridgeObjectRetain_n();
    v161 = sub_100035590();
    os_log_type_t v162 = sub_1000357C0();
    if (os_log_type_enabled(v161, v162))
    {
      v163 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v163 = 134217984;
      if (v160 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v164 = sub_100035C00();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v164 = *(void *)((v160 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      aBlock = (void **)v164;
      sub_1000359B0();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v161, v162, "Widget provideListOptions sections %ld ", v163, 0xCu);
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v165 = v171;
    swift_beginAccess();
    id v166 = objc_allocWithZone((Class)INObjectCollection);
    sub_100009F5C(&qword_100046960);
    Class v167 = sub_1000356B0().super.isa;
    swift_bridgeObjectRelease();
    id v168 = [v166 initWithSections:v167];

    id v169 = v168;
    v176(v168, 0);

    return (*(uint64_t (**)(char *, uint64_t))(v173 + 8))(v177, v174);
  }
  unint64_t v67 = 0;
  unint64_t v183 = v66 + ((*(unsigned __int8 *)(v189 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v189 + 80));
  uint64_t v182 = v189 + 16;
  uint64_t v205 = v185 + 16;
  v204 = (uint64_t (**)(void **, uint64_t))(v185 + 88);
  int v203 = enum case for REMAccountsListDataView.Model.AccountChild.list(_:);
  unint64_t v202 = (void (**)(void **, uint64_t))(v185 + 96);
  v195 = (void (**)(char *, void **, uint64_t))(v48 + 32);
  uint64_t v221 = v192 + 16;
  v220 = (uint64_t (**)(id *, uint64_t))(v192 + 88);
  int v197 = enum case for REMAccountsListDataView.Model.AccountChild.customSmartList(_:);
  os_log_type_t v219 = (void (**)(id *, uint64_t))(v192 + 96);
  v227 = (void (**)(char *, uint64_t))(v232 + 8);
  int v194 = enum case for REMAccountsListDataView.Model.AccountChild.group(_:);
  v218 = &v236;
  int v217 = enum case for REMAccountsListDataView.Model.GroupChild.list(_:);
  v216 = (void (**)(char *, uint64_t))(v192 + 8);
  uint64_t v193 = (void (**)(char *, uint64_t))(v48 + 8);
  int v214 = enum case for REMAccountsListDataView.Model.GroupChild.customSmartList(_:);
  unint64_t v201 = (void (**)(char *, uint64_t))(v185 + 8);
  v178 = (void (**)(char *, uint64_t))(v189 + 8);
  long long v200 = xmmword_100038880;
  uint64_t v179 = v66;
  while (1)
  {
    if (v67 >= *(void *)(v66 + 16))
    {
LABEL_75:
      __break(1u);
      goto LABEL_76;
    }
    uint64_t v68 = *(void *)(v189 + 72);
    unint64_t v190 = v67;
    (*(void (**)(char *, unint64_t, uint64_t))(v189 + 16))(v61, v183 + v68 * v67, v191);
    uint64_t v69 = sub_100035440();
    uint64_t v70 = &_swiftEmptyArrayStorage;
    v242 = &_swiftEmptyArrayStorage;
    uint64_t v211 = *(void *)(v69 + 16);
    if (v211) {
      break;
    }
    swift_bridgeObjectRelease();
LABEL_62:
    uint64_t v151 = v188;
    if (v188)
    {
      swift_bridgeObjectRetain();
      uint64_t v152 = v187;
      sub_10001DF60((unint64_t)v70, v180, v151);
      uint64_t v187 = v152;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    uint64_t v153 = (void *)sub_100035430();
    id v154 = [v153 displayName];

    sub_100035630();
    id v155 = objc_allocWithZone((Class)INObjectSection);
    NSString v156 = sub_100035600();
    swift_bridgeObjectRelease();
    Class v157 = sub_1000356B0().super.isa;
    swift_bridgeObjectRelease();
    id v158 = [v155 initWithTitle:v156 items:v157];

    id v159 = v158;
    sub_1000356A0();
    if (*(void *)((v243 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v243 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_1000356F0();
    }
    unint64_t v67 = v190 + 1;
    sub_100035700();
    sub_1000356E0();

    (*v178)(v61, v191);
    uint64_t v66 = v179;
    if (v67 == v181) {
      goto LABEL_67;
    }
  }
  unint64_t v209 = v69 + ((*(unsigned __int8 *)(v185 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v185 + 80));
  uint64_t v208 = *(void *)(v185 + 72);
  os_log_type_t v207 = *(void (**)(void, void, void))(v185 + 16);
  uint64_t v186 = v69;
  swift_bridgeObjectRetain();
  uint64_t v71 = 0;
  uint64_t v72 = v212;
  id v73 = v210;
  while (1)
  {
    uint64_t v213 = v71;
    id v80 = (void (*)(void **, char *, uint64_t))v207;
    v207(v73, v209 + v208 * v71, v72);
    id v81 = v206;
    v80(v206, v73, v72);
    int v82 = (*v204)(v81, v72);
    if (v82 != v203) {
      break;
    }
    (*v202)(v81, v72);
    os_log_type_t v74 = *v81;
    sub_100009F5C(&qword_1000467F0);
    uint64_t v75 = swift_allocObject();
    *(_OWORD *)(v75 + 16) = v200;
    *(void *)(v75 + 32) = sub_10001C948(v74);
    aBlock = (void **)v75;
    sub_1000356E0();
    uint64_t v76 = v212;
    unint64_t v77 = aBlock;

LABEL_35:
    uint64_t v78 = v213 + 1;
    id v73 = v210;
    (*v201)(v210, v76);
    uint64_t v72 = v76;
    unint64_t v79 = (unint64_t)v77;
    uint64_t v71 = v78;
    sub_10000E47C(v79);
    if (v78 == v211)
    {
      swift_bridgeObjectRelease_n();
      uint64_t v70 = v242;
      uint64_t v61 = v184;
      goto LABEL_62;
    }
  }
  if (v82 == v197)
  {
    (*v202)(v81, v72);
    unsigned int v83 = *v81;
    sub_100009F5C(&qword_1000467F0);
    uint64_t v84 = swift_allocObject();
    *(_OWORD *)(v84 + 16) = v200;
    id v85 = [v83 objectID];
    id v86 = [v85 urlRepresentation];

    uint64_t v87 = v228;
    sub_100034E70();

    sub_100034E60();
    (*v227)(v87, v229);
    id v88 = [v83 name];
    sub_100035630();

    id v89 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
    NSString v90 = sub_100035600();
    swift_bridgeObjectRelease();
    NSString v91 = sub_100035600();
    swift_bridgeObjectRelease();
    id v92 = [v89 initWithIdentifier:v90 displayString:v91];

    id v93 = [v83 customContext];
    id v94 = [v93 badge];
    id v95 = [v93 color];
    uint64_t v96 = sub_100035060();
    sub_10001DA84(v96, (uint64_t)v244);
    uint64_t v97 = (void *)sub_10001D2F4(v94, v95, (uint64_t)v244);

    if (v97)
    {
      [v92 setDisplayImage:v97];
    }
    [v92 setSubtitleString:0];
    *(void *)(v84 + 32) = v92;
    aBlock = (void **)v84;
    sub_1000356E0();
    unint64_t v77 = aBlock;

    uint64_t v76 = v212;
    goto LABEL_35;
  }
  if (v82 != v194) {
    goto LABEL_79;
  }
  (*v202)(v81, v72);
  (*v195)(v198, v81, v199);
  uint64_t v98 = sub_100035410();
  uint64_t v99 = *(char **)(v98 + 16);
  if (!v99)
  {
    swift_bridgeObjectRelease();
    unint64_t v77 = (void **)&_swiftEmptyArrayStorage;
LABEL_59:
    uint64_t v76 = v212;
    (*v193)(v198, v199);
    goto LABEL_35;
  }
  os_log_type_t v241 = (void **)&_swiftEmptyArrayStorage;
  sub_100035B00();
  unint64_t v100 = (*(unsigned __int8 *)(v192 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v192 + 80);
  uint64_t v196 = v98;
  unint64_t v101 = v98 + v100;
  uint64_t v225 = *(void *)(v192 + 72);
  uint64_t v226 = *(char **)(v192 + 16);
  while (2)
  {
    id v104 = v226;
    ((void (*)(char *, unint64_t, uint64_t))v226)(v60, v101, v47);
    ((void (*)(id *, char *, uint64_t))v104)(v59, v60, v47);
    int v105 = (*v220)(v59, v47);
    unint64_t v233 = v99;
    unint64_t v232 = v101;
    if (v105 == v217)
    {
      (*v219)(v59, v47);
      id v106 = *v59;
      id v107 = [*v59 objectID];
      id v108 = [v107 urlRepresentation];

      uint64_t v109 = v228;
      sub_100034E70();

      sub_100034E60();
      (*v227)(v109, v229);
      id v110 = [v106 displayName];
      sub_100035630();

      id v111 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
      NSString v112 = sub_100035600();
      swift_bridgeObjectRelease();
      NSString v113 = sub_100035600();
      swift_bridgeObjectRelease();
      id v114 = [v111 initWithIdentifier:v112 displayString:v113];

      id v115 = [v106 appearanceContext];
      id v116 = [v115 badge];

      id v117 = [v106 color];
      memset(v245, 0, sizeof(v245));
      uint64_t v246 = 0;
      char v247 = 2;
      v240 = 0;
      sub_10001DA40();
      id v118 = sub_100035820();
      uint64_t v119 = (void *)swift_allocObject();
      uint64_t v120 = v231;
      v119[2] = v231;
      v119[3] = v116;
      v119[4] = v117;
      sub_10001DA84((uint64_t)v245, (uint64_t)(v119 + 5));
      v119[11] = &v240;
      uint64_t v121 = swift_allocObject();
      *(void *)(v121 + 16) = sub_10001DAE0;
      *(void *)(v121 + 24) = v119;
      unint64_t v238 = sub_10001E568;
      uint64_t v239 = v121;
      aBlock = _NSConcreteStackBlock;
      uint64_t v235 = 1107296256;
      uint64_t v236 = sub_10001D7CC;
      v237 = &unk_100041A88;
      uint64_t v122 = _Block_copy(&aBlock);
      uint64_t v123 = v120;
      swift_retain();
      id v124 = v116;
      id v125 = v117;
      swift_release();
      dispatch_sync(v118, v122);

      _Block_release(v122);
      LOBYTE(v109) = swift_isEscapingClosureAtFileLocation();
      swift_release();
      if (v109)
      {
        __break(1u);
LABEL_74:
        __break(1u);
        goto LABEL_75;
      }
      uint64_t v126 = v240;

      swift_release();
      if (v126)
      {
        [v114 setDisplayImage:v126];
      }
      id v127 = v114;
      NSString v128 = [v106 sharingStatusText];
      uint64_t v59 = v222;
      uint64_t v47 = v224;
      if (v128)
      {
        sub_100035630();

        NSString v128 = sub_100035600();
        swift_bridgeObjectRelease();
      }
      uint64_t v102 = v233;
      unint64_t v103 = v232;
      [v127 setSubtitleString:v128];

      goto LABEL_45;
    }
    if (v105 == v214)
    {
      (*v219)(v59, v47);
      id v129 = *v59;
      id v130 = [*v59 objectID];
      id v131 = [v130 urlRepresentation];

      uint64_t v132 = v228;
      sub_100034E70();

      sub_100034E60();
      (*v227)(v132, v229);
      id v133 = [v129 name];
      sub_100035630();

      id v134 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
      NSString v135 = sub_100035600();
      swift_bridgeObjectRelease();
      NSString v136 = sub_100035600();
      swift_bridgeObjectRelease();
      id v137 = [v134 initWithIdentifier:v135 displayString:v136];

      id v215 = v129;
      id v138 = [v129 customContext];
      id v139 = [v138 badge];
      id v140 = [v138 color];
      uint64_t v141 = sub_100035060();
      sub_10001DA84(v141, (uint64_t)&v248);
      v240 = 0;
      sub_10001DA40();
      uint64_t v142 = sub_100035820();
      id v143 = (void *)swift_allocObject();
      v144 = v231;
      v143[2] = v231;
      v143[3] = v139;
      v143[4] = v140;
      sub_10001DA84((uint64_t)&v248, (uint64_t)(v143 + 5));
      v143[11] = &v240;
      uint64_t v145 = swift_allocObject();
      *(void *)(v145 + 16) = sub_10001DAE0;
      *(void *)(v145 + 24) = v143;
      unint64_t v238 = sub_10001E568;
      uint64_t v239 = v145;
      aBlock = _NSConcreteStackBlock;
      uint64_t v235 = 1107296256;
      uint64_t v236 = sub_10001D7CC;
      v237 = &unk_100041A10;
      uint64_t v146 = _Block_copy(&aBlock);
      uint64_t v147 = v144;
      swift_retain();
      id v148 = v139;
      id v149 = v140;
      swift_release();
      dispatch_sync((dispatch_queue_t)v142, v146);

      _Block_release(v146);
      LOBYTE(v142) = swift_isEscapingClosureAtFileLocation();
      swift_release();
      if (v142) {
        goto LABEL_74;
      }
      uint64_t v150 = v240;

      swift_release();
      if (v150)
      {
        [v137 setDisplayImage:v150];
      }
      [v137 setSubtitleString:0];
      uint64_t v47 = v224;
      uint64_t v59 = v222;
      uint64_t v102 = v233;
      unint64_t v103 = v232;
      NSString v128 = v215;
LABEL_45:

      id v60 = v223;
      (*v216)(v223, v47);
      sub_100035AE0();
      sub_100035B10();
      sub_100035B20();
      sub_100035AF0();
      unint64_t v101 = v103 + v225;
      uint64_t v99 = v102 - 1;
      if (!v99)
      {
        unint64_t v77 = v241;
        swift_bridgeObjectRelease();
        goto LABEL_59;
      }
      continue;
    }
    break;
  }
  sub_100035C60();
  __break(1u);
LABEL_79:
  uint64_t result = sub_100035C60();
  __break(1u);
  return result;
}

BOOL sub_10001C34C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_100035630();
  uint64_t v5 = v4;
  if (v3 == sub_100035630() && v5 == v6) {
    goto LABEL_14;
  }
  char v8 = sub_100035C70();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v8) {
    return 1;
  }
  uint64_t v10 = sub_100035630();
  uint64_t v12 = v11;
  if (v10 == sub_100035630() && v12 == v13)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_16;
  }
  char v15 = sub_100035C70();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v15)
  {
LABEL_16:
    uint64_t v20 = (void *)sub_1000351E0();
    return (*v20 & ~a2) == 0;
  }
  uint64_t v16 = sub_100035630();
  uint64_t v18 = v17;
  if (v16 == sub_100035630() && v18 == v19)
  {
LABEL_14:
    swift_bridgeObjectRelease_n();
    return 1;
  }
  char v21 = sub_100035C70();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v21) {
    return 1;
  }
  uint64_t v22 = sub_100035630();
  uint64_t v24 = v23;
  if (v22 == sub_100035630() && v24 == v25) {
    goto LABEL_22;
  }
  char v26 = sub_100035C70();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  BOOL result = 0;
  if ((v26 & 1) == 0)
  {
    uint64_t v27 = sub_100035630();
    uint64_t v29 = v28;
    if (v27 == sub_100035630() && v29 == v30)
    {
      swift_bridgeObjectRelease_n();
LABEL_29:
      uint64_t v20 = (void *)sub_1000351F0();
      return (*v20 & ~a2) == 0;
    }
    char v31 = sub_100035C70();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v31) {
      goto LABEL_29;
    }
    uint64_t v32 = sub_100035630();
    uint64_t v34 = v33;
    if (v32 == sub_100035630() && v34 == v35)
    {
LABEL_22:
      swift_bridgeObjectRelease_n();
      return 0;
    }
    char v36 = sub_100035C70();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    BOOL result = 0;
    if ((v36 & 1) == 0)
    {
      uint64_t v37 = sub_100035630();
      uint64_t v39 = v38;
      if (v37 != sub_100035630() || v39 != v40)
      {
        sub_100035C70();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return 0;
      }
      goto LABEL_22;
    }
  }
  return result;
}

id sub_10001C6AC(void *a1)
{
  uint64_t v2 = sub_100034E80();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100009F5C(&qword_100046940);
  __chkstk_darwin(v6 - 8);
  char v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = a1;
  sub_1000353A0();
  uint64_t v10 = sub_100035390();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) == 1)
  {
    sub_10000A1C0((uint64_t)v8, &qword_100046940);
    uint64_t v12 = 0;
  }
  else
  {
    sub_100035380();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
    sub_100034E60();
    uint64_t v12 = v13;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  sub_100035810();
  if (v12)
  {
    NSString v14 = sub_100035600();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v14 = 0;
  }
  sub_100035260();
  id v15 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  NSString v16 = sub_100035600();
  swift_bridgeObjectRelease();
  id v17 = [v15 initWithIdentifier:v14 displayString:v16];

  uint64_t v18 = sub_10001D16C(v9);
  if (v18)
  {
    uint64_t v19 = (void *)v18;
    [v17 setDisplayImage:v18];
  }
  return v17;
}

id sub_10001C948(void *a1)
{
  uint64_t v2 = sub_100034E80();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100035260();
  id v6 = [a1 objectID];
  id v7 = [v6 urlRepresentation];

  sub_100034E70();
  sub_100034E60();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  id v8 = [a1 displayName];
  sub_100035630();

  id v9 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  NSString v10 = sub_100035600();
  swift_bridgeObjectRelease();
  NSString v11 = sub_100035600();
  swift_bridgeObjectRelease();
  id v12 = [v9 initWithIdentifier:v10 displayString:v11];

  id v13 = [a1 appearanceContext];
  id v14 = [v13 badge];

  id v15 = [a1 color];
  memset(v20, 0, sizeof(v20));
  uint64_t v21 = 0;
  char v22 = 2;
  NSString v16 = (void *)sub_10001D2F4(v14, v15, (uint64_t)v20);

  if (v16)
  {
    [v12 setDisplayImage:v16];
  }
  id v17 = v12;
  id v18 = [a1 sharingStatusText];
  [v17 setSubtitleString:v18];

  return v17;
}

uint64_t sub_10001CBF4(uint64_t a1, uint64_t (*a2)(void, uint64_t))
{
  if (qword_100046080 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_1000355A0();
  sub_100009FEC(v4, (uint64_t)qword_1000468E0);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v5 = sub_100035590();
  os_log_type_t v6 = sub_1000357A0();
  if (os_log_type_enabled(v5, v6))
  {
    id v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    *(_DWORD *)id v7 = 136315138;
    swift_getErrorValue();
    uint64_t v8 = sub_100035C90();
    sub_10003007C(v8, v9, &v11);
    sub_1000359B0();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Widget provideListOptions failed error %s", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  return a2(0, a1);
}

id sub_10001CEB4(void *a1)
{
  uint64_t v2 = v1;
  if (qword_100046080 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_1000355A0();
  sub_100009FEC(v4, (uint64_t)qword_1000468E0);
  id v5 = a1;
  os_log_type_t v6 = sub_100035590();
  os_log_type_t v7 = sub_1000357C0();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136315138;
    id v9 = v5;
    id v10 = [v9 description];
    uint64_t v11 = sub_100035630();
    unint64_t v13 = v12;

    sub_10003007C(v11, v13, &v20);
    sub_1000359B0();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Widget defaultList {intent: %s}", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v14 = *(void *)(v2 + OBJC_IVAR____TtC25RemindersIntentsExtension26ConfigurationIntentHandler_dataSource + 24);
  uint64_t v15 = *(void *)(v2 + OBJC_IVAR____TtC25RemindersIntentsExtension26ConfigurationIntentHandler_dataSource + 32);
  sub_10000A024((void *)(v2 + OBJC_IVAR____TtC25RemindersIntentsExtension26ConfigurationIntentHandler_dataSource), v14);
  NSString v16 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v15 + 72))(v14, v15);
  if (!v16) {
    return sub_10001C6AC(REMSmartListTypeToday);
  }
  id v17 = v16;
  id v18 = sub_10001C948(v16);

  return v18;
}

uint64_t sub_10001D16C(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v13 = 0;
  sub_10001DA40();
  uint64_t v4 = sub_100035820();
  id v5 = (void *)swift_allocObject();
  v5[2] = a1;
  v5[3] = v2;
  v5[4] = &v13;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_10001DCCC;
  *(void *)(v6 + 24) = v5;
  aBlock[4] = sub_10001E568;
  aBlock[5] = v6;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10001D7CC;
  aBlock[3] = &unk_1000418F8;
  os_log_type_t v7 = _Block_copy(aBlock);
  id v8 = a1;
  id v9 = v2;
  swift_retain();
  swift_release();
  dispatch_sync((dispatch_queue_t)v4, v7);

  _Block_release(v7);
  LOBYTE(v4) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v4)
  {
    __break(1u);
  }
  else
  {
    uint64_t v11 = v13;
    swift_release();
    return v11;
  }
  return result;
}

uint64_t sub_10001D2F4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v18 = 0;
  sub_10001DA40();
  uint64_t v8 = sub_100035820();
  id v9 = (void *)swift_allocObject();
  v9[2] = v4;
  v9[3] = a1;
  v9[4] = a2;
  sub_10001DA84(a3, (uint64_t)(v9 + 5));
  v9[11] = &v18;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = sub_10001DAE0;
  *(void *)(v10 + 24) = v9;
  aBlock[4] = sub_10001DAF4;
  aBlock[5] = v10;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10001D7CC;
  aBlock[3] = &unk_100041880;
  uint64_t v11 = _Block_copy(aBlock);
  id v12 = a2;
  swift_retain();
  id v13 = v4;
  id v14 = a1;
  swift_release();
  dispatch_sync((dispatch_queue_t)v8, v11);

  _Block_release(v11);
  LOBYTE(v8) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v8)
  {
    __break(1u);
  }
  else
  {
    uint64_t v16 = v18;
    swift_release();
    return v16;
  }
  return result;
}

void sub_10001D498(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, id *a5)
{
  id v9 = [objc_allocWithZone((Class)sub_100035070()) initWithFrame:0.0, 0.0, 32.0, 32.0];
  if (!a2) {
    goto LABEL_7;
  }
  id v10 = [a2 emoji];
  if (!v10)
  {
    id v19 = [a2 emblem];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = sub_100035830();

      goto LABEL_8;
    }
LABEL_7:
    uint64_t v21 = sub_100035830();
LABEL_8:
    (*(void (**)(uint64_t))((swift_isaMask & *v9) + 0x140))(v21);
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  uint64_t v11 = v10;
  uint64_t v12 = sub_100035630();
  uint64_t v14 = v13;

  uint64_t v15 = (*(uint64_t (**)(uint64_t, uint64_t))((swift_isaMask & *v9) + 0x158))(v12, v14);
  (*(void (**)(uint64_t, double))((swift_isaMask & *v9) + 0x170))(v15, 20.0);
  if (!a3)
  {
LABEL_4:
    uint64_t v16 = v9;
    uint64_t v17 = sub_100035000();
    swift_beginAccess();
    sub_10001DB34(v17, (uint64_t)v28);
    sub_10001DBEC((uint64_t)v28, (void (*)(void, void, void, void, void, void, void))sub_10001DB90);
    uint64_t v18 = (void *)sub_100035010();
    sub_10001DBEC((uint64_t)v28, (void (*)(void, void, void, void, void, void, void))sub_10001DC30);
    goto LABEL_10;
  }
LABEL_9:
  char v22 = v9;
  uint64_t v18 = (void *)sub_100035980();
LABEL_10:
  [v9 setTintColor:v18];

  (*(void (**)(uint64_t))((swift_isaMask & *v9) + 0x110))(a4);
  sub_100035910();
  [v9 layoutIfNeeded];
  unint64_t v23 = sub_100035900();
  if (v23)
  {
    uint64_t v24 = (void *)v23;
    id v25 = [self imageWithUIImage:v23];
    id v26 = *a5;
    *a5 = v25;

    if (*a5)
    {
      id v27 = *a5;
      [v27 _setRenderingMode:1];
    }
    id v9 = v24;
  }
}

uint64_t sub_10001D7CC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

void sub_10001D7F4(uint64_t a1, uint64_t a2, id *a3)
{
  uint64_t v4 = sub_100035800();
  if (v4)
  {
    id v5 = (void *)v4;
    uint64_t v6 = sub_1000357F0();
    if (v6)
    {
      os_log_type_t v7 = (void *)v6;
      uint64_t v8 = [objc_allocWithZone((Class)sub_100035070()) initWithFrame:0.0, 0.0, 32.0, 32.0];
      id v9 = *(void (**)(void *))((swift_isaMask & *v8) + 0x140);
      id v16 = v5;
      v9(v5);
      [v8 setTintColor:v7];
      unint64_t v10 = sub_100035900();
      if (v10)
      {
        uint64_t v11 = (void *)v10;
        id v12 = [self imageWithUIImage:v10];
        id v13 = *a3;
        *a3 = v12;

        if (*a3)
        {
          id v14 = *a3;
          [v14 _setRenderingMode:1];
        }
      }
      else
      {
        uint64_t v11 = v16;
        id v16 = v8;
      }

      uint64_t v15 = v16;
    }
    else
    {
      uint64_t v15 = v5;
    }
  }
}

uint64_t type metadata accessor for ConfigurationIntentHandler()
{
  return self;
}

unint64_t sub_10001DA40()
{
  unint64_t result = qword_1000460D0;
  if (!qword_1000460D0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000460D0);
  }
  return result;
}

uint64_t sub_10001DA84(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_10001DAE4()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001DAF4()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10001DB1C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001DB2C()
{
  return swift_release();
}

uint64_t sub_10001DB34(uint64_t a1, uint64_t a2)
{
  return a2;
}

id sub_10001DB90(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  if (a7)
  {
    return a1;
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return (id)swift_bridgeObjectRetain();
  }
}

uint64_t sub_10001DBEC(uint64_t a1, void (*a2)(void, void, void, void, void, void, void))
{
  return a1;
}

void sub_10001DC30(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  if (a7)
  {
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_10001DC8C()
{
  return _swift_deallocObject(v0, 40, 7);
}

void sub_10001DCCC()
{
  sub_10001D7F4(*(void *)(v0 + 16), *(void *)(v0 + 24), *(id **)(v0 + 32));
}

uint64_t sub_10001DCD8()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001DCE8()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10001DD20(uint64_t a1, uint64_t a2)
{
  sub_10001A59C(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_10001DD28()
{
  swift_release();

  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10001DD70(uint64_t a1, uint64_t a2)
{
  return sub_10001A60C(a1, a2, *(uint64_t (**)(id, void))(v2 + 16), *(void *)(v2 + 24), *(char **)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 48));
}

uint64_t sub_10001DD80()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001DDB8(char *a1)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t, char *))(v1 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = sub_100009F5C(&qword_100046958);
  return v3(v4, &a1[*(int *)(v5 + 48)]);
}

uint64_t sub_10001DE18(uint64_t a1)
{
  return sub_10001CBF4(a1, *(uint64_t (**)(void, uint64_t))(v1 + 16));
}

uint64_t sub_10001DE20(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100009F5C(&qword_100046768);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void *sub_10001DE88(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  unint64_t result = &_swiftEmptyArrayStorage;
  if (v2)
  {
    sub_100035B00();
    uint64_t v4 = (void **)(a1 + 32);
    do
    {
      uint64_t v5 = *v4++;
      id v6 = v5;
      sub_10001C6AC(v6);

      sub_100035AE0();
      sub_100035B10();
      sub_100035B20();
      sub_100035AF0();
      --v2;
    }
    while (v2);
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

uint64_t sub_10001DF50()
{
  return _swift_deallocObject(v0, 32, 7);
}

void *sub_10001DF60(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v23 = a2;
  uint64_t v24 = a3;
  uint64_t v6 = sub_100009F5C(&qword_100046968);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = &_swiftEmptyArrayStorage;
  if (a1 >> 62) {
    goto LABEL_16;
  }
  uint64_t v9 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9)
  {
    while (1)
    {
      unint64_t v10 = 0;
      unint64_t v22 = a1 & 0xC000000000000001;
      v20[1] = v4;
      uint64_t v21 = a1 & 0xFFFFFFFFFFFFFF8;
      while (v22)
      {
        id v11 = (id)sub_100035AB0();
LABEL_9:
        uint64_t v4 = v11;
        unint64_t v12 = v10 + 1;
        if (__OFADD__(v10, 1)) {
          goto LABEL_15;
        }
        id v13 = [v11 displayString];
        uint64_t v14 = sub_100035630();
        uint64_t v16 = v15;

        uint64_t v27 = v14;
        uint64_t v28 = v16;
        uint64_t v25 = v23;
        uint64_t v26 = v24;
        uint64_t v17 = sub_100034F60();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v8, 1, 1, v17);
        sub_100011C14();
        sub_1000359E0();
        LOBYTE(v13) = v18;
        sub_10000A1C0((uint64_t)v8, &qword_100046968);
        swift_bridgeObjectRelease();
        if (v13)
        {
        }
        else
        {
          sub_100035AE0();
          sub_100035B10();
          sub_100035B20();
          sub_100035AF0();
        }
        ++v10;
        if (v12 == v9) {
          return v29;
        }
      }
      if (v10 < *(void *)(v21 + 16)) {
        break;
      }
      __break(1u);
LABEL_15:
      __break(1u);
LABEL_16:
      uint64_t v9 = sub_100035C00();
      if (!v9) {
        return &_swiftEmptyArrayStorage;
      }
    }
    id v11 = *(id *)(a1 + 8 * v10 + 32);
    goto LABEL_9;
  }
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_10001E1BC()
{
  return _swift_deallocObject(v0, 96, 7);
}

void sub_10001E204()
{
  sub_10001D498(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void *)(v0 + 32), v0 + 40, *(id **)(v0 + 88));
}

uint64_t sub_10001E218()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_10001E228(void *a1, uint64_t a2)
{
  sub_1000354E0();
  uint64_t v4 = (void *)sub_1000354D0();
  id v5 = [a1 list];
  NSString v6 = v5;
  if (v5)
  {
    id v7 = [v5 identifier];

    if (v7)
    {
      sub_100035630();

      NSString v6 = sub_100035600();
      swift_bridgeObjectRelease();
    }
    else
    {
      NSString v6 = 0;
    }
  }
  [v4 setList:v6];

  if (qword_100046080 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_1000355A0();
  sub_100009FEC(v8, (uint64_t)qword_1000468E0);
  id v9 = a1;
  id v10 = v4;
  id v11 = v9;
  id v12 = v10;
  id v13 = sub_100035590();
  os_log_type_t v14 = sub_1000357C0();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    *(_DWORD *)uint64_t v15 = 136315394;
    id v16 = v11;
    id v17 = [v16 description];
    uint64_t v18 = sub_100035630();
    uint64_t v26 = a2;
    unint64_t v20 = v19;

    sub_10003007C(v18, v20, &v27);
    sub_1000359B0();

    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 2080;
    id v21 = v12;
    id v22 = [v21 description];
    uint64_t v23 = sub_100035630();
    unint64_t v25 = v24;

    sub_10003007C(v23, v25, &v27);
    a2 = v26;
    sub_1000359B0();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Widget handle {intent: %s, response: %s}", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  (*(void (**)(uint64_t, id))(a2 + 16))(a2, v12);
}

unint64_t sub_10001E58C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100009F5C(&qword_100046BB0);
  uint64_t v2 = sub_100035C10();
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
    sub_10000A15C(v6, (uint64_t)&v15, &qword_100046BB8);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_100024D0C(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    id v11 = (uint64_t *)(v3[6] + 16 * result);
    *id v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_10002AD68(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_10001E6C4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100009F5C(&qword_100046BA8);
  uint64_t v2 = (void *)sub_100035C10();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_100024D0C(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    id v11 = (uint64_t *)(v2[6] + 16 * result);
    *id v11 = v5;
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

uint64_t sub_10001E7E0()
{
  uint64_t v0 = sub_1000355A0();
  sub_10000A434(v0, qword_100046970);
  uint64_t v1 = sub_100009FEC(v0, (uint64_t)qword_100046970);
  if (qword_1000460A0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100009FEC(v0, (uint64_t)qword_1000472B0);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

void sub_10001E8A8(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v5 = (void *)sub_100035310();
  unint64_t v6 = sub_1000352F0();
  id v57 = v5;
  sub_100009F5C(&qword_1000465D8);
  sub_100034F50();
  sub_10002AE58();
  sub_10002AC58(&qword_100046C28, (void (*)(uint64_t))&type metadata accessor for UUID);
  unint64_t v7 = sub_100035690();
  swift_bridgeObjectRelease();
  if (v7 >> 62)
  {
    swift_bridgeObjectRetain();
    id v8 = (void *)sub_100035C00();
    swift_bridgeObjectRelease();
    if (v8) {
      goto LABEL_5;
    }
  }
  else
  {
    id v8 = *(void **)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v8) {
      goto LABEL_5;
    }
  }
  if (!(v6 >> 62))
  {
    if (*(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_5;
    }
LABEL_52:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_100046088 != -1) {
      swift_once();
    }
    uint64_t v52 = sub_1000355A0();
    sub_100009FEC(v52, (uint64_t)qword_100046970);
    id v53 = sub_100035590();
    os_log_type_t v54 = sub_1000357C0();
    if (os_log_type_enabled(v53, v54))
    {
      unint64_t v55 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v55 = 0;
      _os_log_impl((void *)&_mh_execute_header, v53, v54, "No REMList or REMSmartList matches the name, prompt for creation {result: .confirmationRequired(.listShouldBeCreated)}", v55, 2u);
      swift_slowDealloc();
    }

    id v39 = [self confirmationRequiredWithTaskListToConfirm:a2 forReason:1];
    goto LABEL_57;
  }
  swift_bridgeObjectRetain();
  uint64_t v51 = sub_100035C00();
  swift_bridgeObjectRelease();
  if (!v51) {
    goto LABEL_52;
  }
LABEL_5:
  if (v7 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_100035C00();
    swift_bridgeObjectRelease();
    if (!v8) {
      goto LABEL_16;
    }
LABEL_9:
    if (v9 != 1) {
      goto LABEL_16;
    }
    if ((v7 & 0xC000000000000001) != 0)
    {
      swift_bridgeObjectRetain();
      id v10 = (id)sub_100035AB0();
      swift_bridgeObjectRelease();
    }
    else
    {
      if (!*(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        goto LABEL_50;
      }
      id v10 = *(id *)(v7 + 32);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_10000A498(0, (unint64_t *)&unk_100046320);
    unint64_t v7 = (unint64_t)v10;
    id v8 = (void *)sub_100035750();
    if (qword_100046088 == -1)
    {
LABEL_14:
      uint64_t v11 = sub_1000355A0();
      sub_100009FEC(v11, (uint64_t)qword_100046970);
      uint64_t v12 = (id *)(id)v7;
      id v13 = v8;
      uint64_t v14 = v12;
      id v15 = v13;
      uint64_t v16 = sub_100035590();
      os_log_type_t v17 = sub_1000357C0();
      if (os_log_type_enabled(v16, v17))
      {
        uint64_t v18 = swift_slowAlloc();
        unint64_t v19 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v18 = 138412546;
        *(void *)type = a3;
        id v20 = [v14 objectID];
        sub_1000359B0();
        void *v19 = v20;

        *(_WORD *)(v18 + 12) = 2112;
        id v57 = v15;
        id v21 = v14;
        id v22 = v15;
        a3 = *(void (**)(void))type;
        sub_1000359B0();
        v19[1] = v15;

        uint64_t v14 = v21;
        _os_log_impl((void *)&_mh_execute_header, v16, v17, "Got one REMList(%@) matches the name {result: .success(%@)}", (uint8_t *)v18, 0x16u);
        sub_100009F5C((uint64_t *)&unk_1000462F0);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        uint64_t v16 = v14;
      }

      sub_10000A498(0, (unint64_t *)&unk_100046B30);
      id v39 = [(id)swift_getObjCClassFromMetadata() successWithResolvedTaskList:v15];

      goto LABEL_57;
    }
LABEL_50:
    swift_once();
    goto LABEL_14;
  }
  uint64_t v9 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v8) {
    goto LABEL_9;
  }
LABEL_16:
  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v40 = sub_100035C00();
    swift_bridgeObjectRelease();
    if (v40 != 1) {
      goto LABEL_35;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    uint64_t v23 = (void *)sub_100035C00();
    swift_bridgeObjectRelease();
    if (v23)
    {
LABEL_19:
      if ((v6 & 0xC000000000000001) != 0)
      {
        id v24 = (id)sub_100035AB0();
      }
      else
      {
        if (!*(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          goto LABEL_60;
        }
        id v24 = *(id *)(v6 + 32);
      }
      unint64_t v25 = v24;
      swift_bridgeObjectRelease();
      sub_10000A498(0, (unint64_t *)&unk_100046320);
      unint64_t v7 = v25;
      uint64_t v23 = (void *)sub_100035730();
      if (qword_100046088 == -1)
      {
LABEL_23:
        uint64_t v26 = sub_1000355A0();
        sub_100009FEC(v26, (uint64_t)qword_100046970);
        uint64_t v27 = (id *)(id)v7;
        id v28 = v23;
        Class isa = v27;
        id v30 = v28;
        char v31 = sub_100035590();
        os_log_type_t v32 = sub_1000357C0();
        if (os_log_type_enabled(v31, v32))
        {
          uint64_t v33 = swift_slowAlloc();
          uint64_t v34 = (void *)swift_slowAlloc();
          *(_DWORD *)uint64_t v33 = 138412546;
          id v35 = [(objc_class *)isa objectID];
          sub_1000359B0();
          *uint64_t v34 = v35;

          *(_WORD *)(v33 + 12) = 2112;
          id v57 = v30;
          char v36 = isa;
          uint64_t v37 = a3;
          id v38 = v30;
          sub_1000359B0();
          v34[1] = v30;

          a3 = v37;
          Class isa = v36;
          _os_log_impl((void *)&_mh_execute_header, v31, v32, "Found REMSmartList matching the name {objectID: %@, result: .success(%@)}", (uint8_t *)v33, 0x16u);
          sub_100009F5C((uint64_t *)&unk_1000462F0);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {

          char v31 = isa;
        }

        sub_10000A498(0, (unint64_t *)&unk_100046B30);
        id v39 = [(id)swift_getObjCClassFromMetadata() successWithResolvedTaskList:v30];

LABEL_48:
LABEL_57:
        a3(v39);

        return;
      }
LABEL_60:
      swift_once();
      goto LABEL_23;
    }
  }
  else
  {
    if (*(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10) != 1) {
      goto LABEL_35;
    }
    swift_bridgeObjectRelease();
    uint64_t v23 = *(void **)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v23) {
      goto LABEL_19;
    }
  }
  swift_bridgeObjectRelease();
  __break(1u);
LABEL_35:
  swift_bridgeObjectRelease();
  if (!v9) {
    goto LABEL_42;
  }
  id v57 = &_swiftEmptyArrayStorage;
  sub_100035B00();
  if ((v9 & 0x8000000000000000) == 0)
  {
    sub_10000A498(0, (unint64_t *)&unk_100046320);
    uint64_t v41 = 0;
    do
    {
      if ((v7 & 0xC000000000000001) != 0) {
        sub_100035AB0();
      }
      else {
        id v42 = *(id *)(v7 + 8 * v41 + 32);
      }
      ++v41;
      sub_100035750();
      sub_100035AE0();
      sub_100035B10();
      sub_100035B20();
      sub_100035AF0();
    }
    while (v9 != v41);
LABEL_42:
    if (qword_100046088 != -1) {
      swift_once();
    }
    uint64_t v43 = sub_1000355A0();
    sub_100009FEC(v43, (uint64_t)qword_100046970);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    os_log_type_t v44 = sub_100035590();
    os_log_type_t v45 = sub_1000357C0();
    if (os_log_type_enabled(v44, v45))
    {
      uint64_t v46 = swift_slowAlloc();
      id v57 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v46 = 134218242;
      swift_bridgeObjectRelease();
      sub_1000359B0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v46 + 12) = 2080;
      sub_10000A498(0, (unint64_t *)&unk_100046320);
      swift_bridgeObjectRetain();
      uint64_t v47 = sub_1000356D0();
      unint64_t v49 = v48;
      swift_bridgeObjectRelease();
      sub_10003007C(v47, v49, (uint64_t *)&v57);
      sub_1000359B0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v44, v45, "Got %ld REMList matches the name {result: .disambiguation(%s)}", (uint8_t *)v46, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    sub_10000A498(0, (unint64_t *)&unk_100046B30);
    ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
    sub_10000A498(0, (unint64_t *)&unk_100046320);
    Class isa = sub_1000356B0().super.isa;
    swift_bridgeObjectRelease();
    id v39 = [ObjCClassFromMetadata disambiguationWithTaskListsToDisambiguate:isa];
    goto LABEL_48;
  }
  __break(1u);
}

void sub_10001F44C(id *a1)
{
  id v1 = [*a1 remObjectID];
  id v2 = [v1 uuid];

  sub_100034F40();
}

void sub_10001F4C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(void))
{
  if (!((unint64_t)a1 >> 62))
  {
    uint64_t v9 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v9) {
      goto LABEL_3;
    }
LABEL_32:
    if (qword_100046088 != -1) {
      swift_once();
    }
    uint64_t v54 = sub_1000355A0();
    sub_100009FEC(v54, (uint64_t)qword_100046970);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    unint64_t v55 = sub_100035590();
    os_log_type_t v56 = sub_1000357C0();
    if (os_log_type_enabled(v55, v56))
    {
      uint64_t v57 = swift_slowAlloc();
      uint64_t v72 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v57 = 136315650;
      sub_10000A498(0, &qword_100046BC8);
      uint64_t v71 = a6;
      swift_bridgeObjectRetain();
      uint64_t v58 = sub_1000356D0();
      unint64_t v60 = v59;
      swift_bridgeObjectRelease();
      sub_10003007C(v58, v60, (uint64_t *)&v72);
      sub_1000359B0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v57 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v61 = sub_1000356D0();
      unint64_t v63 = v62;
      swift_bridgeObjectRelease();
      sub_10003007C(v61, v63, (uint64_t *)&v72);
      sub_1000359B0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v57 + 22) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v64 = sub_1000356D0();
      unint64_t v66 = v65;
      swift_bridgeObjectRelease();
      sub_10003007C(v64, v66, (uint64_t *)&v72);
      a6 = v71;
      sub_1000359B0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v55, v56, "No list shared with the specified .targetTaskListMembers {targetTaskListMembers: %s, emails: %s, phones: %s, result: .disambiguateDueToNoDefaultList}", (uint8_t *)v57, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    id v30 = sub_1000201BC();
    goto LABEL_38;
  }
  if (a1 < 0) {
    unint64_t v6 = (void *)a1;
  }
  else {
    unint64_t v6 = (void *)(a1 & 0xFFFFFFFFFFFFFF8);
  }
  swift_bridgeObjectRetain();
  uint64_t v53 = sub_100035C00();
  swift_bridgeObjectRelease();
  if (!v53) {
    goto LABEL_32;
  }
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_100035C00();
  swift_bridgeObjectRelease();
LABEL_3:
  if (!v9)
  {
LABEL_21:
    if (qword_100046088 != -1) {
      swift_once();
    }
    uint64_t v35 = sub_1000355A0();
    sub_100009FEC(v35, (uint64_t)qword_100046970);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    char v36 = sub_100035590();
    os_log_type_t v37 = sub_1000357C0();
    if (os_log_type_enabled(v36, v37))
    {
      uint64_t v38 = swift_slowAlloc();
      uint64_t v72 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v38 = 134219010;
      swift_bridgeObjectRelease();
      sub_1000359B0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v38 + 12) = 2080;
      sub_10000A498(0, &qword_100046BC8);
      swift_bridgeObjectRetain();
      uint64_t v39 = sub_1000356D0();
      os_log_type_t v68 = v37;
      unint64_t v41 = v40;
      swift_bridgeObjectRelease();
      sub_10003007C(v39, v41, (uint64_t *)&v72);
      sub_1000359B0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v38 + 22) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v42 = sub_1000356D0();
      unint64_t v44 = v43;
      swift_bridgeObjectRelease();
      sub_10003007C(v42, v44, (uint64_t *)&v72);
      sub_1000359B0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v38 + 32) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v45 = sub_1000356D0();
      unint64_t v47 = v46;
      swift_bridgeObjectRelease();
      sub_10003007C(v45, v47, (uint64_t *)&v72);
      sub_1000359B0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v38 + 42) = 2080;
      sub_10000A498(0, (unint64_t *)&unk_100046320);
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_1000356D0();
      unint64_t v50 = v49;
      swift_bridgeObjectRelease();
      sub_10003007C(v48, v50, (uint64_t *)&v72);
      sub_1000359B0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v36, v68, "Got %ld REMList matching .targetTaskListMembers {targetTaskListMembers: %s, emails: %s, phones: %s, result: .disambiguation(%s)}", (uint8_t *)v38, 0x34u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    sub_10000A498(0, (unint64_t *)&unk_100046B30);
    ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
    sub_10000A498(0, (unint64_t *)&unk_100046320);
    Class isa = sub_1000356B0().super.isa;
    swift_bridgeObjectRelease();
    id v30 = [ObjCClassFromMetadata disambiguationWithTaskListsToDisambiguate:isa];

    goto LABEL_38;
  }
  if (v9 == 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      sub_100035AB0();
    }
    else
    {
      if (!*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        goto LABEL_41;
      }
      id v10 = *(id *)(a1 + 32);
    }
    sub_10000A498(0, (unint64_t *)&unk_100046320);
    unint64_t v6 = (void *)sub_100035750();
    if (qword_100046088 == -1)
    {
LABEL_9:
      uint64_t v11 = sub_1000355A0();
      sub_100009FEC(v11, (uint64_t)qword_100046970);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      id v12 = v6;
      id v13 = sub_100035590();
      os_log_type_t v14 = sub_1000357C0();
      if (os_log_type_enabled(v13, v14))
      {
        log = v13;
        uint64_t v15 = swift_slowAlloc();
        unint64_t v67 = (void *)swift_slowAlloc();
        uint64_t v72 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v15 = 136315906;
        sub_10000A498(0, &qword_100046BC8);
        swift_bridgeObjectRetain();
        uint64_t v16 = sub_1000356D0();
        os_log_type_t v17 = a6;
        unint64_t v19 = v18;
        swift_bridgeObjectRelease();
        sub_10003007C(v16, v19, (uint64_t *)&v72);
        sub_1000359B0();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v15 + 12) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v20 = sub_1000356D0();
        unint64_t v22 = v21;
        swift_bridgeObjectRelease();
        uint64_t v23 = v20;
        a6 = v17;
        sub_10003007C(v23, v22, (uint64_t *)&v72);
        sub_1000359B0();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v15 + 22) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v24 = sub_1000356D0();
        unint64_t v26 = v25;
        swift_bridgeObjectRelease();
        sub_10003007C(v24, v26, (uint64_t *)&v72);
        sub_1000359B0();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v15 + 32) = 2112;
        id v27 = v12;
        sub_1000359B0();
        *unint64_t v67 = v12;

        _os_log_impl((void *)&_mh_execute_header, log, v14, "Found exactly 1 list matching .targetTaskListMembers, using that. {targetTaskListMembers: %s, emails: %s, phones: %s, result: .success(%@)}", (uint8_t *)v15, 0x2Au);
        sub_100009F5C((uint64_t *)&unk_1000462F0);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
      }
      sub_10000A498(0, (unint64_t *)&unk_100046B30);
      id v30 = [(id)swift_getObjCClassFromMetadata() successWithResolvedTaskList:v12];

LABEL_38:
      a6(v30);

      return;
    }
LABEL_41:
    swift_once();
    goto LABEL_9;
  }
  uint64_t v72 = &_swiftEmptyArrayStorage;
  sub_100035B00();
  if ((v9 & 0x8000000000000000) == 0)
  {
    uint64_t v70 = a6;
    sub_10000A498(0, (unint64_t *)&unk_100046320);
    if ((a1 & 0xC000000000000001) != 0)
    {
      uint64_t v28 = 0;
      do
      {
        uint64_t v29 = v28 + 1;
        sub_100035AB0();
        sub_100035750();
        sub_100035AE0();
        sub_100035B10();
        sub_100035B20();
        sub_100035AF0();
        uint64_t v28 = v29;
      }
      while (v9 != v29);
    }
    else
    {
      char v31 = (void **)(a1 + 32);
      uint64_t v32 = v9;
      do
      {
        uint64_t v33 = *v31++;
        id v34 = v33;
        sub_100035750();
        sub_100035AE0();
        sub_100035B10();
        sub_100035B20();
        sub_100035AF0();
        --v32;
      }
      while (v32);
    }
    a6 = v70;
    goto LABEL_21;
  }
  __break(1u);
}

id sub_1000201BC()
{
  uint64_t v1 = sub_100009F5C((uint64_t *)&unk_100046550);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v57 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v5 = __chkstk_darwin(v4);
  unint64_t v7 = (char *)&v57 - v6;
  id v8 = *(void **)(v0 + OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_store);
  id v60 = 0;
  id v9 = [v8 fetchEligibleDefaultListsWithError:&v60 v5];
  id v10 = v60;
  if (!v9)
  {
    id v24 = v60;
    sub_100034E50();

    swift_willThrow();
    goto LABEL_38;
  }
  uint64_t v11 = v9;
  id v58 = v8;
  sub_10000A498(0, (unint64_t *)&qword_1000465D0);
  unint64_t v12 = sub_1000356C0();
  id v13 = v10;

  if (!(v12 >> 62))
  {
    unint64_t v14 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v14) {
      goto LABEL_4;
    }
LABEL_28:
    swift_bridgeObjectRelease();
    unint64_t v14 = (unint64_t)&_swiftEmptyArrayStorage;
    if (!((unint64_t)&_swiftEmptyArrayStorage >> 62)) {
      goto LABEL_11;
    }
    goto LABEL_29;
  }
  swift_bridgeObjectRetain();
  unint64_t v14 = sub_100035C00();
  swift_bridgeObjectRelease();
  if (!v14) {
    goto LABEL_28;
  }
LABEL_4:
  id v60 = &_swiftEmptyArrayStorage;
  sub_100035B00();
  if ((v14 & 0x8000000000000000) == 0)
  {
    sub_10000A498(0, (unint64_t *)&unk_100046320);
    uint64_t v15 = 0;
    do
    {
      if ((v12 & 0xC000000000000001) != 0) {
        sub_100035AB0();
      }
      else {
        id v16 = *(id *)(v12 + 8 * v15 + 32);
      }
      ++v15;
      sub_100035750();
      sub_100035AE0();
      sub_100035B10();
      sub_100035B20();
      sub_100035AF0();
    }
    while (v14 != v15);
    unint64_t v14 = (unint64_t)v60;
    swift_bridgeObjectRelease();
    if (!(v14 >> 62))
    {
LABEL_11:
      os_log_type_t v17 = *(void **)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v17) {
        goto LABEL_12;
      }
LABEL_31:
      swift_bridgeObjectRelease();
      v62._object = (void *)0x80000001000399D0;
      v61._countAndFlagsBits = 0x7265646E696D6552;
      v61._object = (void *)0xE900000000000073;
      v62._countAndFlagsBits = 0xD00000000000006ALL;
      sub_100035160(v61, v62);
      uint64_t v33 = (void *)sub_100035660();
      swift_bridgeObjectRelease();
      uint64_t v34 = sub_100034E30();
      uint64_t v35 = *(void *)(v34 - 8);
      char v36 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v35 + 56);
      v36(v7, 1, 1, v34);
      v36(v3, 1, 1, v34);
      sub_10000A498(0, &qword_100046318);
      v37.super.Class isa = sub_1000356B0().super.isa;
      uint64_t v38 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48);
      Class isa = 0;
      if (v38(v7, 1, v34) != 1)
      {
        Class isa = sub_100034DC0().super.isa;
        (*(void (**)(char *, uint64_t))(v35 + 8))(v7, v34);
      }
      if (v38(v3, 1, v34) == 1)
      {
        Class v40 = 0;
      }
      else
      {
        Class v40 = sub_100034DC0().super.isa;
        (*(void (**)(char *, uint64_t))(v35 + 8))(v3, v34);
      }
      unint64_t v7 = (char *)[objc_allocWithZone((Class)INTaskList) initWithTitle:v33 tasks:v37.super.isa groupName:0 createdDateComponents:isa modifiedDateComponents:v40 identifier:0];

      id v60 = 0;
      unint64_t v41 = (char *)[v58 fetchDefaultAccountWithError:&v60];
      uint64_t v3 = v41;
      if (!v60)
      {
        if (!v41)
        {
          if (qword_100046088 != -1) {
            swift_once();
          }
          uint64_t v53 = sub_1000355A0();
          sub_100009FEC(v53, (uint64_t)qword_100046970);
          uint64_t v54 = sub_100035590();
          os_log_type_t v55 = sub_1000357A0();
          if (os_log_type_enabled(v54, v55))
          {
            os_log_type_t v56 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)os_log_type_t v56 = 0;
            _os_log_impl((void *)&_mh_execute_header, v54, v55, "No lists found in fetchEligibleDefaultLists and no default account available. Responding with .success so that we can fail the user in handle() with .failureRequiringAppLaunch. {result: .success}", v56, 2u);
            swift_slowDealloc();
          }

          sub_10000A498(0, (unint64_t *)&unk_100046B30);
          id v31 = [(id)swift_getObjCClassFromMetadata() successWithResolvedTaskList:v7];

          return v31;
        }
        if (qword_100046088 == -1) {
          goto LABEL_47;
        }
        goto LABEL_60;
      }
      v60;

      swift_willThrow();
LABEL_38:
      if (qword_100046088 != -1) {
        swift_once();
      }
      uint64_t v42 = sub_1000355A0();
      sub_100009FEC(v42, (uint64_t)qword_100046970);
      swift_errorRetain();
      swift_errorRetain();
      unint64_t v43 = sub_100035590();
      os_log_type_t v44 = sub_1000357A0();
      if (os_log_type_enabled(v43, v44))
      {
        uint64_t v45 = (uint8_t *)swift_slowAlloc();
        id v60 = (id)swift_slowAlloc();
        *(_DWORD *)uint64_t v45 = 136315138;
        swift_getErrorValue();
        uint64_t v46 = sub_100035C90();
        uint64_t v59 = sub_10003007C(v46, v47, (uint64_t *)&v60);
        sub_1000359B0();
        swift_bridgeObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, v43, v44, "Error trying to retrieve eligible default lists {error: %s}", v45, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_errorRelease();
        swift_errorRelease();
      }

      sub_10000A498(0, (unint64_t *)&unk_100046B30);
      id v23 = [(id)swift_getObjCClassFromMetadata() unsupported];
      swift_errorRelease();
      return v23;
    }
LABEL_29:
    swift_bridgeObjectRetain();
    uint64_t v32 = sub_100035C00();
    swift_bridgeObjectRelease();
    if (v32)
    {
      swift_bridgeObjectRetain();
      os_log_type_t v17 = (void *)sub_100035C00();
      swift_bridgeObjectRelease();
LABEL_12:
      if (v17 != (void *)1)
      {
        if (qword_100046088 != -1) {
          swift_once();
        }
        uint64_t v25 = sub_1000355A0();
        sub_100009FEC(v25, (uint64_t)qword_100046970);
        swift_bridgeObjectRetain();
        unint64_t v26 = sub_100035590();
        os_log_type_t v27 = sub_1000357C0();
        if (os_log_type_enabled(v26, v27))
        {
          uint64_t v28 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)uint64_t v28 = 134217984;
          id v60 = v17;
          sub_1000359B0();
          swift_bridgeObjectRelease();
          _os_log_impl((void *)&_mh_execute_header, v26, v27, "Disambiguating with some lists {count: %ld}", v28, 0xCu);
          swift_slowDealloc();
        }
        else
        {

          swift_bridgeObjectRelease();
        }
        sub_10000A498(0, (unint64_t *)&unk_100046B30);
        ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
        sub_10000A498(0, (unint64_t *)&unk_100046320);
        Class v30 = sub_1000356B0().super.isa;
        swift_bridgeObjectRelease();
        id v31 = [ObjCClassFromMetadata disambiguationWithTaskListsToDisambiguate:v30];

        return v31;
      }
      if (qword_100046088 == -1) {
        goto LABEL_14;
      }
      goto LABEL_57;
    }
    goto LABEL_31;
  }
  __break(1u);
LABEL_57:
  swift_once();
LABEL_14:
  uint64_t v18 = sub_1000355A0();
  sub_100009FEC(v18, (uint64_t)qword_100046970);
  unint64_t v19 = sub_100035590();
  os_log_type_t v20 = sub_1000357C0();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v3 = (char *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "Got exactly 1 list from fetchEligibleDefaultLists, using that. {result: .confirmationRequired}", (uint8_t *)v3, 2u);
    swift_slowDealloc();
  }

  if ((v14 & 0xC000000000000001) != 0)
  {
    id v21 = (id)sub_100035AB0();
    goto LABEL_19;
  }
  if (*(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v21 = *(id *)(v14 + 32);
LABEL_19:
    unint64_t v22 = v21;
    swift_bridgeObjectRelease();
    sub_10000A498(0, (unint64_t *)&unk_100046B30);
    id v23 = [(id)swift_getObjCClassFromMetadata() confirmationRequiredWithTaskListToConfirm:v22];

    return v23;
  }
  __break(1u);
LABEL_60:
  swift_once();
LABEL_47:
  uint64_t v49 = sub_1000355A0();
  sub_100009FEC(v49, (uint64_t)qword_100046970);
  unint64_t v50 = sub_100035590();
  os_log_type_t v51 = sub_1000357C0();
  if (os_log_type_enabled(v50, v51))
  {
    uint64_t v52 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v52 = 0;
    _os_log_impl((void *)&_mh_execute_header, v50, v51, "No lists found in fetchEligibleDefaultLists(), prompt for creation {result: .confirmationRequired(.listShouldBeCreated)}", v52, 2u);
    swift_slowDealloc();
  }

  id v31 = [self confirmationRequiredWithTaskListToConfirm:v7 forReason:1];
  return v31;
}

void sub_100020D0C(void *a1, uint64_t a2, uint64_t a3)
{
  if (qword_100046088 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_1000355A0();
  sub_100009FEC(v6, (uint64_t)qword_100046970);
  id v7 = a1;
  id v8 = sub_100035590();
  os_log_type_t v9 = sub_1000357C0();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v22 = a3;
    id v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    *(_DWORD *)id v10 = 136315138;
    id v11 = [v7 taskTitles];
    if (v11)
    {
      unint64_t v12 = v11;
      sub_10000A498(0, &qword_100046B10);
      sub_1000356C0();
    }
    sub_100009F5C(&qword_100046B08);
    uint64_t v14 = sub_1000359A0();
    unint64_t v16 = v15;
    swift_bridgeObjectRelease();
    sub_10003007C(v14, v16, &v23);
    sub_1000359B0();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "SiriKit asked for resolving task titles {taskTitles: %s}", v10, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    a3 = v22;
  }
  else
  {
  }
  __chkstk_darwin(v13);
  sub_100009F5C((uint64_t *)&unk_100046AF0);
  swift_allocObject();
  sub_100035560();
  os_log_type_t v17 = (void *)sub_1000354F0();
  sub_100009F5C(&qword_100046950);
  sub_100035530();
  swift_release();

  *(void *)(swift_allocObject() + 16) = v7;
  id v18 = v7;
  unint64_t v19 = (void *)sub_1000354F0();
  sub_100009F5C(&qword_100046B00);
  sub_100035530();
  swift_release();
  swift_release();

  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = a2;
  *(void *)(v20 + 24) = a3;
  swift_retain();
  id v21 = (void *)sub_1000354F0();
  sub_100035530();
  swift_release();
  swift_release();
  swift_release();
}

uint64_t sub_1000210D8@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = sub_100009F5C((uint64_t *)&unk_100046B20);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (uint64_t *)((char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v7);
  os_log_type_t v9 = (char *)&v14 - v8;
  if (*a1)
  {
    sub_1000357E0();
    uint64_t v10 = sub_1000357D0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 0, 1, v10);
  }
  else
  {
    uint64_t v10 = sub_1000357D0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  }
  sub_10002AA18((uint64_t)v9, (uint64_t)v6, (uint64_t *)&unk_100046B20);
  sub_1000357D0();
  if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48))(v6, 1, v10) == 1)
  {
    uint64_t result = sub_10000A1C0((uint64_t)v6, (uint64_t *)&unk_100046B20);
    uint64_t v12 = 0;
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v12 = *v6;
    uint64_t v13 = v6[1];
    swift_bridgeObjectRetain();
    uint64_t result = sub_10002ACA0((uint64_t)v6, (uint64_t (*)(void))&type metadata accessor for NSUserActivity.ExtractedInfo);
  }
  *a2 = v12;
  a2[1] = v13;
  return result;
}

uint64_t sub_1000212A4@<X0>(id a1@<X1>, uint64_t *a2@<X0>, char *a3@<X8>)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  id v6 = [a1 taskTitles];
  uint64_t v42 = a3;
  if (!v6)
  {
    a3 = (char *)_swiftEmptyArrayStorage;
    if (!v5) {
      goto LABEL_22;
    }
    goto LABEL_15;
  }
  uint64_t v7 = v6;
  sub_10000A498(0, &qword_100046B10);
  unint64_t v8 = sub_1000356C0();

  if (!(v8 >> 62))
  {
    uint64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v9) {
      goto LABEL_4;
    }
LABEL_21:
    swift_bridgeObjectRelease();
    a3 = (char *)_swiftEmptyArrayStorage;
    if (!v5) {
      goto LABEL_22;
    }
    goto LABEL_15;
  }
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_100035C00();
  swift_bridgeObjectRelease();
  if (!v9) {
    goto LABEL_21;
  }
LABEL_4:
  sub_100024FE8(0, v9 & ~(v9 >> 63), 0);
  if (v9 < 0)
  {
    __break(1u);
    goto LABEL_39;
  }
  uint64_t v40 = v5;
  uint64_t v41 = v4;
  uint64_t v10 = 0;
  a3 = (char *)_swiftEmptyArrayStorage;
  unint64_t v43 = v8 & 0xC000000000000001;
  unint64_t v11 = v8;
  uint64_t v12 = v9;
  do
  {
    if (v43) {
      id v13 = (id)sub_100035AB0();
    }
    else {
      id v13 = *(id *)(v8 + 8 * v10 + 32);
    }
    uint64_t v14 = v13;
    id v15 = [v13 spokenPhrase];
    uint64_t v16 = sub_100035630();
    uint64_t v18 = v17;

    unint64_t v20 = _swiftEmptyArrayStorage[2];
    unint64_t v19 = _swiftEmptyArrayStorage[3];
    if (v20 >= v19 >> 1) {
      sub_100024FE8(v19 > 1, v20 + 1, 1);
    }
    ++v10;
    _swiftEmptyArrayStorage[2] = v20 + 1;
    id v21 = (char *)&_swiftEmptyArrayStorage[2 * v20];
    *((void *)v21 + 4) = v16;
    *((void *)v21 + 5) = v18;
    unint64_t v8 = v11;
  }
  while (v12 != v10);
  swift_bridgeObjectRelease();
  uint64_t v5 = v40;
  uint64_t v4 = v41;
  if (v40)
  {
LABEL_15:
    if (_swiftEmptyArrayStorage[2])
    {
LABEL_23:
      if (qword_100046088 != -1) {
        swift_once();
      }
      uint64_t v25 = sub_1000355A0();
      sub_100009FEC(v25, (uint64_t)qword_100046970);
      unint64_t v26 = sub_100035590();
      os_log_type_t v27 = sub_1000357C0();
      if (os_log_type_enabled(v26, v27))
      {
        uint64_t v28 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v28 = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, v27, "Resolved taskTitles {result: .success}", v28, 2u);
        swift_slowDealloc();
      }

      uint64_t v29 = *((void *)a3 + 2);
      if (v29)
      {
        swift_bridgeObjectRetain();
        sub_100035B00();
        Class v30 = self;
        id v31 = a3 + 40;
        do
        {
          swift_bridgeObjectRetain();
          uint64_t v32 = (void *)sub_100035660();
          id v33 = [v30 successWithResolvedString:v32];
          swift_bridgeObjectRelease();

          sub_100035AE0();
          sub_100035B10();
          sub_100035B20();
          sub_100035AF0();
          v31 += 16;
          --v29;
        }
        while (v29);
        uint64_t v34 = _swiftEmptyArrayStorage;
        uint64_t result = swift_bridgeObjectRelease_n();
      }
      else
      {
        uint64_t result = swift_bridgeObjectRelease();
        uint64_t v34 = _swiftEmptyArrayStorage;
      }
      goto LABEL_37;
    }
    swift_bridgeObjectRetain();
    if (swift_isUniquelyReferenced_nonNull_native())
    {
LABEL_17:
      unint64_t v23 = *((void *)a3 + 2);
      unint64_t v22 = *((void *)a3 + 3);
      if (v23 >= v22 >> 1) {
        a3 = sub_10002FCC8((char *)(v22 > 1), v23 + 1, 1, a3);
      }
      *((void *)a3 + 2) = v23 + 1;
      id v24 = &a3[16 * v23];
      *((void *)v24 + 4) = v4;
      *((void *)v24 + 5) = v5;
      goto LABEL_23;
    }
LABEL_39:
    a3 = sub_10002FCC8(0, 1, 1, a3);
    goto LABEL_17;
  }
LABEL_22:
  if (_swiftEmptyArrayStorage[2]) {
    goto LABEL_23;
  }
  swift_bridgeObjectRelease();
  if (qword_100046088 != -1) {
    swift_once();
  }
  uint64_t v36 = sub_1000355A0();
  sub_100009FEC(v36, (uint64_t)qword_100046970);
  NSArray v37 = sub_100035590();
  os_log_type_t v38 = sub_1000357C0();
  if (os_log_type_enabled(v37, v38))
  {
    uint64_t v39 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v39 = 0;
    _os_log_impl((void *)&_mh_execute_header, v37, v38, "userTitles has 0 elements {result: .needsValue}", v39, 2u);
    swift_slowDealloc();
  }

  sub_100009F5C(&qword_1000467F0);
  uint64_t v34 = (_OWORD *)swift_allocObject();
  v34[1] = xmmword_100038880;
  sub_10000A498(0, &qword_100046590);
  *((void *)v34 + 4) = [(id)swift_getObjCClassFromMetadata() needsValue];
  uint64_t result = sub_1000356E0();
LABEL_37:
  *(void *)uint64_t v42 = v34;
  return result;
}

void sub_1000218A8(uint64_t a1, uint64_t a2)
{
  sub_10000A498(0, &qword_100046590);
  Class isa = sub_1000356B0().super.isa;
  (*(void (**)(uint64_t, objc_class *))(a2 + 16))(a2, isa);
}

id sub_100021954(void *a1)
{
  uint64_t v2 = v1;
  id v3 = [a1 targetTaskList];
  if (!v3 || (v4 = v3, uint64_t v5 = (void *)sub_100035720(), v4, !v5))
  {
    id v6 = sub_1000254CC(*(void **)(v2 + OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_store));
    if (!v6) {
      return 0;
    }
LABEL_6:
    id v7 = [v6 capabilities];

    return v7;
  }
  id v6 = [v5 account];

  if (v6) {
    goto LABEL_6;
  }
  return 0;
}

void sub_100021A1C(void *a1, void (*a2)(void))
{
  if (*a1)
  {
    if (qword_100046088 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_1000355A0();
    sub_100009FEC(v3, (uint64_t)qword_100046970);
    uint64_t v4 = sub_100035590();
    os_log_type_t v5 = sub_1000357C0();
    if (os_log_type_enabled(v4, v5))
    {
      id v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Got userActivity {result: .success(.currentActivity)", v6, 2u);
      swift_slowDealloc();
    }

    id v7 = [self successWithResolvedTaskReference:1];
  }
  else
  {
    if (qword_100046088 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_1000355A0();
    sub_100009FEC(v8, (uint64_t)qword_100046970);
    uint64_t v9 = sub_100035590();
    os_log_type_t v10 = sub_1000357C0();
    if (os_log_type_enabled(v9, v10))
    {
      unint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Got nil userActivity {result: .notRequired}", v11, 2u);
      swift_slowDealloc();
    }

    sub_10000A498(0, &qword_100046BD8);
    id v7 = [(id)swift_getObjCClassFromMetadata() notRequired];
  }
  id v12 = v7;
  a2();
}

void sub_100021C20(uint64_t a1, void (*a2)(id))
{
  if (qword_100046088 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1000355A0();
  sub_100009FEC(v3, (uint64_t)qword_100046970);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v4 = sub_100035590();
  os_log_type_t v5 = sub_1000357A0();
  if (os_log_type_enabled(v4, v5))
  {
    id v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)id v6 = 136315138;
    swift_getErrorValue();
    uint64_t v7 = sub_100035C90();
    sub_10003007C(v7, v8, &v10);
    sub_1000359B0();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Got error userActivity. {result: .notRequired, error: %s}", v6, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  sub_10000A498(0, &qword_100046BD8);
  id v9 = [(id)swift_getObjCClassFromMetadata() notRequired];
  a2(v9);
}

void sub_100021E68(void *a1, int a2, void *a3, void *aBlock, void (*a5)(id, void *))
{
  unint64_t v8 = _Block_copy(aBlock);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a1;
  a5(v9, v8);
  _Block_release(v8);
  _Block_release(v8);
}

void sub_100021F10(void **a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  if (*a1)
  {
    swift_beginAccess();
    uint64_t v4 = *(void **)(a2 + 16);
    *(void *)(a2 + 16) = v2;
    id v5 = v2;
  }
}

uint64_t sub_100021F74(void **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = sub_1000357D0();
  __chkstk_darwin(v7 - 8);
  id v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100009F5C(&qword_100046B68);
  __chkstk_darwin(v10 - 8);
  id v12 = (char *)v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = *a1;
  uint64_t result = swift_projectBox();
  if (v13)
  {
    uint64_t v15 = result;
    v26[11] = a4 + 16;
    id v16 = objc_allocWithZone((Class)REMUserActivity);
    id v17 = v13;
    id v18 = [v16 initWithUserActivity:v17];
    swift_beginAccess();
    unint64_t v19 = *(void **)(a2 + 16);
    *(void *)(a2 + 16) = v18;

    id v20 = [v17 webpageURL];
    if (v20)
    {
      id v21 = v20;
      sub_100034E70();

      uint64_t v22 = sub_100034E80();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v12, 0, 1, v22);
    }
    else
    {
      uint64_t v23 = sub_100034E80();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v12, 1, 1, v23);
    }
    swift_beginAccess();
    sub_10002AD00((uint64_t)v12, v15);
    sub_1000357E0();

    uint64_t v25 = *((void *)v9 + 2);
    uint64_t v24 = *((void *)v9 + 3);
    swift_bridgeObjectRetain();
    sub_10002ACA0((uint64_t)v9, (uint64_t (*)(void))&type metadata accessor for NSUserActivity.ExtractedInfo);
    swift_beginAccess();
    *(void *)(a4 + 16) = v25;
    *(void *)(a4 + 24) = v24;
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_1000221E0(uint64_t a1, uint64_t a2, void *a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void (*a16)(void))
{
  uint64_t v55 = swift_projectBox();
  uint64_t v18 = swift_projectBox();
  id v19 = [objc_allocWithZone((Class)REMSaveRequest) initWithStore:*(void *)(a2 + OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_store)];
  sub_100035030();
  a3;
  id v20 = v19;
  sub_100035080();
  Swift::String v61 = p_isa;
  uint64_t v62 = 0;
  uint64_t v63 = a5;
  uint64_t v64 = a6;
  uint64_t v65 = v55;
  uint64_t v66 = a8;
  uint64_t v67 = a9 + 16;
  uint64_t v68 = a10 + 16;
  uint64_t v69 = v18;
  uint64_t v70 = a12 + 16;
  uint64_t v71 = a13 + 16;
  uint64_t v72 = a14;
  id v21 = v20;
  unint64_t v22 = (unint64_t)sub_10002C5C4((void (*)(uint64_t *__return_ptr, id *))sub_10002AC10, (uint64_t)v60, a4);
  p_Class isa = 0;
  if ([v21 saveSynchronouslyWithError:&p_isa])
  {
    uint64_t v23 = p_isa;
    sub_100035050();
    swift_retain();
    sub_100035040();
    swift_release();
    if (v22 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v24 = sub_100035C00();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v24 = *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v54 = v21;
    if (v24)
    {
      p_Class isa = _swiftEmptyArrayStorage;
      sub_100035B00();
      if (v24 < 0) {
        __break(1u);
      }
      sub_10000A498(0, &qword_100046318);
      uint64_t v25 = 0;
      do
      {
        if ((v22 & 0xC000000000000001) != 0) {
          sub_100035AB0();
        }
        else {
          id v26 = *(id *)(v22 + 8 * v25 + 32);
        }
        ++v25;
        sub_1000358D0();
        sub_100035AE0();
        sub_100035B10();
        sub_100035B20();
        sub_100035AF0();
      }
      while (v24 != v25);
    }
    swift_bridgeObjectRelease();
    uint64_t v35 = a15;
    if (qword_100046088 != -1) {
      swift_once();
    }
    uint64_t v36 = sub_1000355A0();
    sub_100009FEC(v36, (uint64_t)qword_100046970);
    swift_bridgeObjectRetain_n();
    NSArray v37 = sub_100035590();
    os_log_type_t v38 = sub_1000357C0();
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v39 = (uint8_t *)swift_slowAlloc();
      p_Class isa = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v39 = 136315138;
      sub_10000A498(0, &qword_100046318);
      swift_bridgeObjectRetain();
      uint64_t v40 = sub_1000356D0();
      unint64_t v42 = v41;
      swift_bridgeObjectRelease();
      uint64_t v43 = v40;
      uint64_t v35 = a15;
      sub_10003007C(v43, v42, (uint64_t *)&p_isa);
      sub_1000359B0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v37, v38, "insertedTasks: %s", v39, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    id v44 = [objc_allocWithZone((Class)INAddTasksIntentResponse) initWithCode:3 userActivity:0];
    [v44 setModifiedTaskList:v35];
    sub_10000A498(0, &qword_100046318);
    Class isa = sub_1000356B0().super.isa;
    swift_bridgeObjectRelease();
    [v44 setAddedTasks:isa];

    p_Class isa = a14;
    uint64_t v46 = (void *)sub_100035920();
    sub_10000A498(0, (unint64_t *)&unk_100046B58);
    uint64_t v47 = sub_100035220();

    [v44 setWarnings:v47];
    uint64_t v48 = v44;
    uint64_t v49 = sub_100035590();
    os_log_type_t v50 = sub_1000357C0();
    if (os_log_type_enabled(v49, v50))
    {
      os_log_type_t v51 = (uint8_t *)swift_slowAlloc();
      uint64_t v52 = (void *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v51 = 138412290;
      p_Class isa = &v48->isa;
      uint64_t v53 = v48;
      sub_1000359B0();
      *uint64_t v52 = v48;

      _os_log_impl((void *)&_mh_execute_header, v49, v50, "successfully handled intent {result: %@}", v51, 0xCu);
      sub_100009F5C((uint64_t *)&unk_1000462F0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      uint64_t v49 = v48;
    }

    ((void (*))a16)(v48);
    swift_release();
  }
  else
  {
    os_log_type_t v27 = p_isa;
    swift_bridgeObjectRelease();
    sub_100034E50();

    swift_willThrow();
    if (qword_100046088 != -1) {
      swift_once();
    }
    uint64_t v28 = sub_1000355A0();
    sub_100009FEC(v28, (uint64_t)qword_100046970);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v29 = sub_100035590();
    os_log_type_t v30 = sub_1000357A0();
    if (os_log_type_enabled(v29, v30))
    {
      id v31 = (uint8_t *)swift_slowAlloc();
      p_Class isa = (void *)swift_slowAlloc();
      *(_DWORD *)id v31 = 136446210;
      swift_getErrorValue();
      uint64_t v32 = sub_100035CA0();
      sub_10003007C(v32, v33, (uint64_t *)&p_isa);
      sub_1000359B0();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "Error saving saveRequest {error: %{public}s}", v31, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    id v34 = [objc_allocWithZone((Class)INAddTasksIntentResponse) initWithCode:4 userActivity:0];
    a16();

    swift_errorRelease();
    swift_release();
  }
}

void sub_100022AA0(void **a1@<X0>, void *a2@<X2>, void *a3@<X3>, void *a4@<X4>, void (*a5)(char *, char *, uint64_t)@<X5>, uint64_t a6@<X6>, NSObject *a7@<X7>, void *a8@<X8>, void **a9, void *a10, void *a11, id *a12, id a13)
{
  os_log_t v183 = a7;
  uint64_t v169 = a6;
  uint64_t v181 = a5;
  id v190 = a4;
  uint64_t v187 = a8;
  uint64_t v16 = sub_1000355A0();
  uint64_t v162 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  v163 = (char *)&v162 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v176 = sub_100034F10();
  uint64_t v175 = *(void *)(v176 - 8);
  __chkstk_darwin(v176);
  uint64_t v174 = (char *)&v162 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_100009F5C(&qword_100046B68);
  __chkstk_darwin(v19 - 8);
  uint64_t v172 = (char *)&v162 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  uint64_t v191 = (id *)((char *)&v162 - v22);
  uint64_t v186 = sub_100034E80();
  uint64_t v185 = *(void *)(v186 - 8);
  __chkstk_darwin(v186);
  id v171 = (char *)&v162 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v24);
  unint64_t v184 = (char *)&v162 - v25;
  uint64_t v26 = sub_100009F5C(&qword_100046B40);
  __chkstk_darwin(v26 - 8);
  uint64_t v168 = (uint64_t)&v162 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v179 = sub_1000351B0();
  uint64_t v177 = *(void *)(v179 - 8);
  __chkstk_darwin(v179);
  uint64_t v164 = (uint64_t)&v162 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v29);
  uint64_t v165 = (uint64_t)&v162 - v30;
  __chkstk_darwin(v31);
  uint64_t v170 = (uint64_t)&v162 - v32;
  uint64_t v33 = sub_100009F5C((uint64_t *)&unk_100046550);
  __chkstk_darwin(v33 - 8);
  Class v167 = (char *)&v162 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v35);
  uint64_t v180 = (uint64_t)&v162 - v36;
  uint64_t v37 = sub_100034E30();
  os_log_type_t v38 = *(void **)(v37 - 8);
  __chkstk_darwin(v37);
  id v166 = (char *)&v162 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v40);
  uint64_t v182 = (char *)&v162 - v41;
  unint64_t v42 = *a1;
  uint64_t v43 = (void *)sub_100035020();
  sub_100035150();
  sub_10002AC58((unint64_t *)&unk_100046B90, (void (*)(uint64_t))&type metadata accessor for TTRReminderEditor);
  id v44 = v43;
  id v45 = a2;
  id v188 = v44;
  uint64_t v46 = a3;
  sub_100035170();
  uint64_t v47 = v198;
  id v48 = [v42 spokenPhrase];
  sub_100035630();

  id v49 = objc_allocWithZone((Class)NSAttributedString);
  NSString v50 = sub_100035600();
  swift_bridgeObjectRelease();
  os_log_type_t v51 = (objc_class *)[v49 initWithString:v50];

  v52.super.Class isa = v51;
  v202.value._countAndFlagsBits = 0;
  v202.value._object = 0;
  sub_100035110(v52, v202, 1);

  uint64_t v53 = &off_100046000;
  uint64_t v192 = v47;
  uint64_t v193 = v16;
  uint64_t v189 = v38;
  if (v46)
  {
    uint64_t v54 = qword_100046088;
    id v55 = v46;
    if (v54 != -1) {
      swift_once();
    }
    sub_100009FEC(v16, (uint64_t)qword_100046970);
    os_log_type_t v56 = v55;
    uint64_t v57 = sub_100035590();
    os_log_type_t v58 = sub_1000357C0();
    if (os_log_type_enabled(v57, v58))
    {
      uint64_t v178 = v37;
      uint64_t v59 = (uint8_t *)swift_slowAlloc();
      id v60 = (void *)swift_slowAlloc();
      uint64_t v173 = (uint64_t)v46;
      *(_DWORD *)uint64_t v59 = 138412290;
      id v198 = v56;
      Swift::String v61 = v56;
      uint64_t v37 = v178;
      uint64_t v62 = v173;
      sub_1000359B0();
      *id v60 = v62;

      uint64_t v16 = v193;
      _os_log_impl((void *)&_mh_execute_header, v57, v58, "setting locationTrigger {locationTrigger: %@}", v59, 0xCu);
      sub_100009F5C((uint64_t *)&unk_1000462F0);
      swift_arrayDestroy();
      uint64_t v53 = &off_100046000;
      swift_slowDealloc();
      os_log_type_t v38 = v189;
      swift_slowDealloc();
    }
    else
    {

      uint64_t v57 = v56;
    }

    uint64_t v63 = v56;
    sub_1000350C0();
  }
  if (v190)
  {
    uint64_t v64 = v53[17];
    id v65 = v190;
    if (v64 != (void *)-1) {
      swift_once();
    }
    sub_100009FEC(v16, (uint64_t)qword_100046970);
    uint64_t v66 = v65;
    uint64_t v67 = sub_100035590();
    os_log_type_t v68 = sub_1000357C0();
    if (os_log_type_enabled(v67, v68))
    {
      uint64_t v69 = (uint8_t *)swift_slowAlloc();
      uint64_t v70 = (void *)swift_slowAlloc();
      uint64_t v178 = v37;
      *(_DWORD *)uint64_t v69 = 138412290;
      id v198 = v66;
      uint64_t v71 = v66;
      uint64_t v53 = &off_100046000;
      uint64_t v16 = v193;
      uint64_t v37 = v178;
      sub_1000359B0();
      *uint64_t v70 = v190;

      _os_log_impl((void *)&_mh_execute_header, v67, v68, "setting vehicleTrigger {vehicleTrigger: %@}", v69, 0xCu);
      sub_100009F5C((uint64_t *)&unk_1000462F0);
      swift_arrayDestroy();
      os_log_type_t v38 = v189;
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      uint64_t v67 = v66;
    }

    uint64_t v72 = v66;
    sub_1000350B0();
  }
  id v73 = a9;
  uint64_t v74 = (uint64_t)v181;
  swift_beginAccess();
  uint64_t v75 = v180;
  sub_10000A15C(v74, v180, (uint64_t *)&unk_100046550);
  if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v38[6])(v75, 1, v37) == 1)
  {
    sub_10000A1C0(v75, (uint64_t *)&unk_100046550);
    uint64_t v76 = (uint64_t)v191;
  }
  else
  {
    unint64_t v77 = v182;
    ((void (*)(char *, uint64_t, uint64_t))v38[4])(v182, v75, v37);
    if (v53[17] != (_UNKNOWN *)-1) {
      swift_once();
    }
    uint64_t v78 = sub_100009FEC(v16, (uint64_t)qword_100046970);
    unint64_t v79 = v166;
    uint64_t v181 = (void (*)(char *, char *, uint64_t))v38[2];
    v181(v166, v77, v37);
    uint64_t v180 = v78;
    id v80 = sub_100035590();
    os_log_type_t v81 = sub_1000357C0();
    BOOL v82 = os_log_type_enabled(v80, v81);
    uint64_t v173 = (uint64_t)a9;
    if (v82)
    {
      unsigned int v83 = (uint8_t *)swift_slowAlloc();
      uint64_t v197 = swift_slowAlloc();
      *(_DWORD *)unsigned int v83 = 136315138;
      id v190 = v83 + 4;
      sub_10002AC58(&qword_100046BA0, (void (*)(uint64_t))&type metadata accessor for DateComponents);
      uint64_t v84 = sub_100035C40();
      uint64_t v196 = sub_10003007C(v84, v85, &v197);
      unint64_t v77 = v182;
      sub_1000359B0();
      swift_bridgeObjectRelease();
      id v190 = (id)v189[1];
      ((void (*)(char *, uint64_t))v190)(v79, v37);
      _os_log_impl((void *)&_mh_execute_header, v80, v81, "setting dueDateComponents {dueDateComponents: %s}", v83, 0xCu);
      swift_arrayDestroy();
      os_log_type_t v38 = v189;
      swift_slowDealloc();
      uint64_t v16 = v193;
      swift_slowDealloc();
    }
    else
    {
      id v190 = (id)v38[1];
      ((void (*)(char *, uint64_t))v190)(v79, v37);

      uint64_t v16 = v193;
    }
    uint64_t v86 = (uint64_t)v167;
    v181(v167, v77, v37);
    ((void (*)(uint64_t, void, uint64_t, uint64_t))v38[7])(v86, 0, 1, v37);
    sub_1000350E0();
    sub_10000A1C0(v86, (uint64_t *)&unk_100046550);
    uint64_t v87 = v168;
    sub_10000A15C(v169, v168, &qword_100046B40);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v177 + 48))(v87, 1, v179) == 1)
    {
      ((void (*)(char *, uint64_t))v190)(v77, v37);
      sub_10000A1C0(v87, &qword_100046B40);
      uint64_t v53 = &off_100046000;
    }
    else
    {
      uint64_t v178 = v37;
      uint64_t v88 = v170;
      sub_10000D2D0(v87, v170);
      uint64_t v89 = v165;
      sub_10000D334(v88, v165);
      NSString v90 = sub_100035590();
      os_log_type_t v91 = sub_1000357C0();
      uint64_t v53 = &off_100046000;
      if (os_log_type_enabled(v90, v91))
      {
        id v92 = (uint8_t *)swift_slowAlloc();
        uint64_t v197 = swift_slowAlloc();
        *(_DWORD *)id v92 = 136315138;
        uint64_t v181 = (void (*)(char *, char *, uint64_t))(v92 + 4);
        sub_10000D334(v89, v164);
        uint64_t v93 = sub_100035640();
        uint64_t v196 = sub_10003007C(v93, v94, &v197);
        sub_1000359B0();
        uint64_t v16 = v193;
        swift_bridgeObjectRelease();
        sub_10002ACA0(v89, (uint64_t (*)(void))&type metadata accessor for TTRRecurrenceRuleModel);
        _os_log_impl((void *)&_mh_execute_header, v90, v91, "setting recurrenceRule {recurrenceRule: %s}", v92, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        sub_10002ACA0(v89, (uint64_t (*)(void))&type metadata accessor for TTRRecurrenceRuleModel);
      }

      sub_100009F5C(&qword_100046578);
      unint64_t v95 = (*(unsigned __int8 *)(v177 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v177 + 80);
      uint64_t v96 = (_OWORD *)swift_allocObject();
      v96[1] = xmmword_100038870;
      uint64_t v97 = v170;
      sub_10000D334(v170, (uint64_t)v96 + v95);
      v200.value._rawValue = v96;
      v200.is_nil = 0;
      sub_1000350D0(v200, v98);
      swift_setDeallocating();
      swift_arrayDestroy();
      swift_deallocClassInstance();
      sub_10002ACA0(v97, (uint64_t (*)(void))&type metadata accessor for TTRRecurrenceRuleModel);
      ((void (*)(char *, uint64_t))v190)(v182, v178);
    }
    uint64_t v76 = (uint64_t)v191;
    id v73 = (void **)v173;
  }
  id v190 = a10;
  os_log_t v99 = v183;
  swift_beginAccess();
  Class isa = v99->isa;
  if (isa)
  {
    unint64_t v101 = v53[17];
    uint64_t v102 = isa;
    if (v101 != (void *)-1) {
      swift_once();
    }
    sub_100009FEC(v16, (uint64_t)qword_100046970);
    unint64_t v103 = v102;
    id v104 = sub_100035590();
    os_log_type_t v105 = sub_1000357C0();
    if (os_log_type_enabled(v104, v105))
    {
      uint64_t v173 = (uint64_t)v73;
      id v106 = (uint8_t *)swift_slowAlloc();
      uint64_t v189 = (void *)swift_slowAlloc();
      *(_DWORD *)id v106 = 138412290;
      uint64_t v196 = (uint64_t)v103;
      id v107 = v103;
      id v73 = (void **)v173;
      uint64_t v53 = &off_100046000;
      sub_1000359B0();
      *uint64_t v189 = isa;

      uint64_t v16 = v193;
      _os_log_impl((void *)&_mh_execute_header, v104, v105, "setting contactRepresentation {contactRepresentation: %@}", v106, 0xCu);
      sub_100009F5C((uint64_t *)&unk_1000462F0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      id v104 = v103;
    }

    id v108 = v103;
    sub_1000350A0();

    uint64_t v76 = (uint64_t)v191;
  }
  uint64_t v109 = (uint64_t)a11;
  swift_beginAccess();
  id v110 = *v73;
  if (*v73)
  {
    id v111 = v53[17];
    id v112 = v110;
    if (v111 != (void *)-1) {
      swift_once();
    }
    sub_100009FEC(v16, (uint64_t)qword_100046970);
    NSString v113 = v112;
    id v114 = sub_100035590();
    os_log_type_t v115 = sub_1000357C0();
    if (os_log_type_enabled(v114, v115))
    {
      uint64_t v116 = swift_slowAlloc();
      uint64_t v189 = a11;
      id v117 = (uint8_t *)v116;
      os_log_t v183 = (os_log_t)swift_slowAlloc();
      *(_DWORD *)id v117 = 138412290;
      v195[3] = (uint64_t)v113;
      id v118 = v113;
      uint64_t v53 = &off_100046000;
      sub_1000359B0();
      v183->Class isa = (Class)v110;

      _os_log_impl((void *)&_mh_execute_header, v114, v115, "setting userActivity {remUserActivity: %@}", v117, 0xCu);
      sub_100009F5C((uint64_t *)&unk_1000462F0);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v109 = (uint64_t)v189;
      swift_slowDealloc();
    }
    else
    {

      id v114 = v113;
    }

    uint64_t v119 = v113;
    sub_100035090();

    uint64_t v16 = v193;
    uint64_t v76 = (uint64_t)v191;
  }
  uint64_t v191 = a12;
  uint64_t v120 = (uint64_t)v190;
  swift_beginAccess();
  sub_10000A15C(v120, v76, &qword_100046B68);
  uint64_t v121 = v185;
  uint64_t v122 = v186;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v185 + 48))(v76, 1, v186) == 1)
  {
    sub_10000A1C0(v76, &qword_100046B68);
  }
  else
  {
    uint64_t v189 = (void *)v109;
    uint64_t v123 = v184;
    (*(void (**)(char *, uint64_t, uint64_t))(v121 + 32))(v184, v76, v122);
    if (v53[17] != (_UNKNOWN *)-1) {
      swift_once();
    }
    sub_100009FEC(v16, (uint64_t)qword_100046970);
    id v124 = v171;
    id v190 = *(id *)(v121 + 16);
    ((void (*)(char *, char *, uint64_t))v190)(v171, v123, v122);
    id v125 = sub_100035590();
    os_log_type_t v126 = sub_1000357C0();
    if (os_log_type_enabled(v125, v126))
    {
      os_log_t v183 = v125;
      id v127 = (uint8_t *)swift_slowAlloc();
      uint64_t v182 = (char *)swift_slowAlloc();
      v195[0] = (uint64_t)v182;
      uint64_t v128 = v121;
      *(_DWORD *)id v127 = 136315138;
      uint64_t v129 = sub_100034E60();
      uint64_t v194 = sub_10003007C(v129, v130, v195);
      sub_1000359B0();
      swift_bridgeObjectRelease();
      id v131 = *(void (**)(char *, uint64_t))(v121 + 8);
      v131(v124, v122);
      id v125 = v183;
      _os_log_impl((void *)&_mh_execute_header, v183, v126, "setting URL attachment {userActivityURL: %s}", v127, 0xCu);
      swift_arrayDestroy();
      uint64_t v132 = v193;
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      uint64_t v132 = v16;
      uint64_t v128 = v121;
      id v131 = *(void (**)(char *, uint64_t))(v121 + 8);
      v131(v124, v122);
    }

    uint64_t v133 = (uint64_t)v172;
    id v134 = v184;
    ((void (*)(char *, char *, uint64_t))v190)(v172, v184, v122);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v128 + 56))(v133, 0, 1, v122);
    sub_1000350F0();
    sub_10000A1C0(v133, &qword_100046B68);
    v131(v134, v122);
    uint64_t v53 = &off_100046000;
    uint64_t v16 = v132;
    uint64_t v109 = (uint64_t)v189;
  }
  swift_beginAccess();
  if (*(void *)(v109 + 8))
  {
    NSString v135 = v53[17];
    swift_bridgeObjectRetain();
    if (v135 != (void *)-1) {
      swift_once();
    }
    sub_100009FEC(v16, (uint64_t)qword_100046970);
    NSString v136 = sub_100035590();
    os_log_type_t v137 = sub_1000357C0();
    if (os_log_type_enabled(v136, v137))
    {
      id v138 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v138 = 0;
      _os_log_impl((void *)&_mh_execute_header, v136, v137, "setting notes", v138, 2u);
      swift_slowDealloc();
    }

    id v139 = objc_allocWithZone((Class)NSAttributedString);
    NSString v140 = sub_100035600();
    swift_bridgeObjectRelease();
    uint64_t v141 = (objc_class *)[v139 initWithString:v140];

    v201.value.super.Class isa = v141;
    sub_100035100(v201);
  }
  uint64_t v142 = v191;
  swift_beginAccess();
  id v143 = v188;
  if (*v142)
  {
    v144 = v53[17];
    id v145 = *v142;
    if (v144 != (void *)-1) {
      swift_once();
    }
    sub_100009FEC(v16, (uint64_t)qword_100046970);
    uint64_t v146 = sub_100035590();
    os_log_type_t v147 = sub_1000357C0();
    if (os_log_type_enabled(v146, v147))
    {
      id v148 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v148 = 0;
      _os_log_impl((void *)&_mh_execute_header, v146, v147, "setting custom smart list filters", v148, 2u);
      id v143 = v188;
      swift_slowDealloc();
    }

    id v149 = v174;
    sub_100034F00();
    sub_100035120();

    (*(void (**)(char *, uint64_t))(v175 + 8))(v149, v176);
  }
  id v150 = [v143 accountCapabilities:v162];
  unsigned int v151 = [v150 supportsFlagged];

  if (!v151) {
    goto LABEL_70;
  }
  id v152 = [a13 priority];
  if (!v152) {
    goto LABEL_70;
  }
  if (v152 == (id)1)
  {
    Swift::Bool v153 = 0;
LABEL_69:
    sub_100035140(v153);
LABEL_70:
    if (v53[17] != (_UNKNOWN *)-1) {
      swift_once();
    }
    sub_100009FEC(v16, (uint64_t)qword_100046970);
    id v154 = v143;
    id v155 = sub_100035590();
    os_log_type_t v156 = sub_1000357C0();
    if (os_log_type_enabled(v155, v156))
    {
      Class v157 = (uint8_t *)swift_slowAlloc();
      id v158 = (void *)swift_slowAlloc();
      *(_DWORD *)Class v157 = 138543362;
      id v159 = [v154 objectID];
      id v199 = v159;
      sub_1000359B0();
      void *v158 = v159;

      _os_log_impl((void *)&_mh_execute_header, v155, v156, "Inserting reminder: {objectID: %{public}@}", v157, 0xCu);
      sub_100009F5C((uint64_t *)&unk_1000462F0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_release();
    }
    else
    {

      swift_release();
    }
    void *v187 = v154;
    return;
  }
  if (v152 == (id)2)
  {
    Swift::Bool v153 = 1;
    goto LABEL_69;
  }
  if (v53[17] != (_UNKNOWN *)-1) {
    swift_once();
  }
  uint64_t v160 = v193;
  uint64_t v161 = sub_100009FEC(v193, (uint64_t)qword_100046970);
  (*(void (**)(char *, uint64_t, uint64_t))(v162 + 16))(v163, v161, v160);
  sub_10001E58C((uint64_t)_swiftEmptyArrayStorage);
  sub_10001E58C((uint64_t)_swiftEmptyArrayStorage);
  sub_10002AEDC((uint64_t)"unknown priority", 16, 2);
  __break(1u);
}

void sub_100024610(void *a1, int a2, void *a3, void *aBlock, void (*a5)(id, id, void *))
{
  uint64_t v8 = _Block_copy(aBlock);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a1;
  a5(v9, v10, v8);
  _Block_release(v8);
  _Block_release(v8);
}

uint64_t sub_1000246A4(uint64_t (*a1)(uint64_t *), uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a1;
  *(void *)(v12 + 24) = a2;
  swift_retain();
  id v13 = [a5 taskReference];
  if (!v13)
  {
    swift_release();
    if (qword_100046088 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_1000355A0();
    sub_100009FEC(v19, (uint64_t)qword_100046970);
    uint64_t v20 = sub_100035590();
    os_log_type_t v21 = sub_100035790();
    if (!os_log_type_enabled(v20, v21)) {
      goto LABEL_15;
    }
    uint64_t v22 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v22 = 0;
    uint64_t v23 = ".taskReference is .unknown. {resolve: nil}";
    goto LABEL_14;
  }
  if (v13 != (id)1)
  {
    swift_release();
    if (qword_100046088 != -1) {
      swift_once();
    }
    uint64_t v24 = sub_1000355A0();
    sub_100009FEC(v24, (uint64_t)qword_100046970);
    uint64_t v20 = sub_100035590();
    os_log_type_t v21 = sub_1000357A0();
    if (!os_log_type_enabled(v20, v21)) {
      goto LABEL_15;
    }
    uint64_t v22 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v22 = 0;
    uint64_t v23 = ".taskReference is an unhandled enum. {resolve: nil}";
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, v20, v21, v23, v22, 2u);
    swift_slowDealloc();
LABEL_15:

    uint64_t v25 = 0;
    return a1(&v25);
  }
  uint64_t v14 = *(void *)(a6 + OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_userActivityProvider + 24);
  uint64_t v15 = *(void *)(a6 + OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_userActivityProvider + 32);
  sub_10000A024((void *)(a6 + OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_userActivityProvider), v14);
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = a3;
  v16[3] = a4;
  v16[4] = sub_10000F2C4;
  v16[5] = v12;
  uint64_t v17 = *(void (**)(uint64_t (*)(uint64_t, uint64_t), void *, uint64_t, uint64_t))(v15 + 8);
  swift_retain();
  v17(sub_100025340, v16, v14, v15);

  return swift_release();
}

uint64_t sub_10002495C(uint64_t a1, uint64_t a2, void (*a3)(uint64_t), uint64_t a4, uint64_t (*a5)(void))
{
  if (!a2) {
    return a5();
  }
  swift_errorRetain();
  a3(a2);

  return swift_errorRelease();
}

uint64_t sub_1000249D4(void *a1)
{
  id v2 = [a1 contactEventTrigger];
  id v3 = [v2 triggerContact];

  if (v3)
  {
    uint64_t v4 = sub_10000A024((void *)(v1+ OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_contactRepresentationResolver), *(void *)(v1+ OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_contactRepresentationResolver+ 24));
    __chkstk_darwin(v4);
    sub_100009F5C(&qword_100046570);
    swift_allocObject();
    id v5 = v3;
    uint64_t v6 = sub_100035560();
  }
  else
  {
    sub_100009F5C(&qword_100046570);
    swift_allocObject();
    return sub_100035550();
  }
  return v6;
}

id sub_100024B3C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TTRAddTasksIntentHandler();
  return [super dealloc];
}

uint64_t type metadata accessor for TTRAddTasksIntentHandler()
{
  return self;
}

_UNKNOWN **sub_100024C20()
{
  return &off_100041DA8;
}

_UNKNOWN **sub_100024C2C()
{
  return &off_1000421C0;
}

_UNKNOWN **sub_100024C38()
{
  return &off_100041720;
}

uint64_t sub_100024C44(uint64_t (*a1)(uint64_t *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1000246A4(a1, a2, a3, a4, *(void **)(v4 + 16), *(void *)(v4 + 24));
}

uint64_t sub_100024C4C()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100024C84@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  return sub_1000212A4(*(id *)(v2 + 16), a1, a2);
}

uint64_t sub_100024CA0()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100024CD8(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

unint64_t sub_100024D0C(uint64_t a1, uint64_t a2)
{
  sub_100035CB0();
  sub_100035670();
  Swift::Int v4 = sub_100035CC0();

  return sub_100024DC8(a1, a2, v4);
}

unint64_t sub_100024D84(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_100035960(*(void *)(v2 + 40));

  return sub_100024EAC(a1, v4);
}

unint64_t sub_100024DC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    id v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100035C70() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        id v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_100035C70() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_100024EAC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    sub_10000A498(0, &qword_100046778);
    id v6 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    char v7 = sub_100035970();

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = ~v4;
      for (unint64_t i = (i + 1) & v8; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v8)
      {
        id v9 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v10 = sub_100035970();

        if (v10) {
          break;
        }
      }
    }
  }
  return i;
}

uint64_t sub_100024FC8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100025008(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_100024FE8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100025190(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_100025008(char a1, int64_t a2, char a3, void *a4)
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
    sub_100009F5C(&qword_100046C30);
    char v10 = (void *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    char v10 = &_swiftEmptyArrayStorage;
  }
  unint64_t v13 = (unint64_t)(v10 + 4);
  unint64_t v14 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v13 >= v14 + 8 * v8) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 8 * v8 || v13 >= v14 + 8 * v8)
  {
    type metadata accessor for REMSmartListType(0);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_100035C20();
  __break(1u);
  return result;
}

uint64_t sub_100025190(char a1, int64_t a2, char a3, char *a4)
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
    sub_100009F5C(&qword_100046B18);
    char v10 = (char *)swift_allocObject();
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
    char v10 = (char *)&_swiftEmptyArrayStorage;
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
  uint64_t result = sub_100035C20();
  __break(1u);
  return result;
}

uint64_t sub_100025300()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100025340(uint64_t a1, uint64_t a2)
{
  return sub_10002495C(a1, a2, *(void (**)(uint64_t))(v2 + 16), *(void *)(v2 + 24), *(uint64_t (**)(void))(v2 + 32));
}

void *sub_10002534C(unint64_t a1, void *a2)
{
  if (a1 >> 62) {
    goto LABEL_14;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t result = _swiftEmptyArrayStorage;
    if (!v4) {
      break;
    }
    uint64_t result = (void *)sub_100035B00();
    if (v4 < 0)
    {
      __break(1u);
      return result;
    }
    uint64_t v6 = 0;
    while (v4 != v6)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v7 = (id)sub_100035AB0();
      }
      else {
        id v7 = *(id *)(a1 + 8 * v6 + 32);
      }
      ++v6;
      id v8 = v7;
      [objc_allocWithZone((Class)INSpatialEventTrigger) initWithPlacemark:v8 event:[a2 event]];

      sub_100035AE0();
      sub_100035B10();
      sub_100035B20();
      sub_100035AF0();
      if (v4 == v6) {
        return _swiftEmptyArrayStorage;
      }
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_100035C00();
    swift_bridgeObjectRelease();
  }
  return result;
}

id sub_1000254CC(void *a1)
{
  id v11 = 0;
  id v1 = [a1 fetchDefaultAccountWithError:&v11];
  if (v11)
  {
    id v2 = v11;

    swift_willThrow();
    if (qword_100046088 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_1000355A0();
    sub_100009FEC(v3, (uint64_t)qword_100046970);
    id v4 = v2;
    uint64_t v5 = sub_100035590();
    os_log_type_t v6 = sub_1000357A0();
    if (os_log_type_enabled(v5, v6))
    {
      id v7 = (uint8_t *)swift_slowAlloc();
      id v11 = (id)swift_slowAlloc();
      *(_DWORD *)id v7 = 136315138;
      swift_getErrorValue();
      uint64_t v8 = sub_100035C90();
      sub_10003007C(v8, v9, (uint64_t *)&v11);
      sub_1000359B0();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Unable to determine default account {error: %s}", v7, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    return 0;
  }
  return v1;
}

uint64_t sub_1000256F4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_100035710();
  uint64_t v8 = result;
  if (v2)
  {
    id v4 = (Swift::Int *)(a1 + 40);
    do
    {
      Swift::Int v5 = *(v4 - 1);
      Swift::Int v6 = *v4;
      swift_bridgeObjectRetain();
      sub_10001002C(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

void sub_10002578C(void *a1, char *a2, void (**a3)(void, void))
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a3;
  _Block_copy(a3);
  if (qword_100046088 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_1000355A0();
  sub_100009FEC(v7, (uint64_t)qword_100046970);
  id v8 = a1;
  unint64_t v9 = sub_100035590();
  os_log_type_t v10 = sub_1000357C0();
  p_align = &stru_100044FE8.align;
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v71 = a3;
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    id v75 = (id)swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136315138;
    id v13 = [v8 targetTaskList];
    sub_100009F5C((uint64_t *)&unk_100046C10);
    uint64_t v14 = sub_1000359A0();
    unint64_t v16 = v15;

    uint64_t v17 = v14;
    p_align = (_DWORD *)(&stru_100044FE8 + 24);
    sub_10003007C(v17, v16, (uint64_t *)&v75);
    sub_1000359B0();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "SiriKit asked for resolving tasklist {targetTaskList: %s}", v12, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    a3 = v71;
    swift_slowDealloc();
  }
  else
  {
  }
  id v18 = [v8 *((SEL *)p_align + 244)];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)&a2[OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_dataSource + 24];
    uint64_t v21 = *(void *)&a2[OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_dataSource + 32];
    sub_10000A024(&a2[OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_dataSource], v20);
    sub_100009F5C(&qword_1000467F0);
    uint64_t v22 = swift_allocObject();
    *(_OWORD *)(v22 + 16) = xmmword_100038880;
    *(void *)(v22 + 32) = v19;
    id v75 = (id)v22;
    sub_1000356E0();
    id v23 = v75;
    uint64_t v24 = (void *)swift_allocObject();
    v24[2] = v19;
    v24[3] = sub_10000D498;
    v24[4] = v6;
    uint64_t v25 = *(void (**)(id, void (*)(uint64_t), void *, uint64_t, uint64_t))(v21 + 40);
    id v26 = v19;
    swift_retain();
    v25(v23, sub_10002AE4C, v24, v20, v21);
    swift_release();

    swift_bridgeObjectRelease();
LABEL_8:
    swift_release();
    return;
  }
  id v27 = [v8 targetTaskListMembers];
  if (v27)
  {
    uint64_t v28 = v27;
    sub_10000A498(0, &qword_100046BC8);
    unint64_t v29 = sub_1000356C0();

    if (v29 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v30 = sub_100035C00();
      swift_bridgeObjectRelease();
      if (v30) {
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v30 = *(void *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v30)
      {
LABEL_12:
        id v75 = &_swiftEmptyArrayStorage;
        if (v30 < 1) {
          __break(1u);
        }
        unint64_t v31 = v29 & 0xC000000000000001;
        swift_bridgeObjectRetain();
        uint64_t v32 = 0;
        do
        {
          if (v31) {
            id v33 = (id)sub_100035AB0();
          }
          else {
            id v33 = *(id *)(v29 + 8 * v32 + 32);
          }
          uint64_t v34 = v33;
          ++v32;
          uint64_t v35 = sub_100035930();

          sub_10000E668(v35);
        }
        while (v30 != v32);
        swift_bridgeObjectRelease();
        id v36 = v75;
        id v75 = &_swiftEmptyArrayStorage;
        swift_bridgeObjectRetain();
        uint64_t v37 = 0;
        do
        {
          if (v31) {
            id v38 = (id)sub_100035AB0();
          }
          else {
            id v38 = *(id *)(v29 + 8 * v37 + 32);
          }
          uint64_t v39 = v38;
          ++v37;
          uint64_t v40 = sub_100035940();

          sub_10000E668(v40);
        }
        while (v30 != v37);
        swift_bridgeObjectRelease();
        id v41 = v75;
        uint64_t v42 = *(void *)&a2[OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_dataSource + 32];
        uint64_t v73 = *(void *)&a2[OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_dataSource + 24];
        sub_10000A024(&a2[OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_dataSource], v73);
        uint64_t v43 = swift_bridgeObjectRetain();
        uint64_t v44 = sub_1000256F4(v43);
        swift_bridgeObjectRelease();
        uint64_t v45 = swift_bridgeObjectRetain();
        uint64_t v46 = sub_1000256F4(v45);
        swift_bridgeObjectRelease();
        uint64_t v47 = (void *)swift_allocObject();
        v47[2] = v29;
        v47[3] = v36;
        v47[4] = v41;
        v47[5] = a2;
        v47[6] = sub_10000D498;
        v47[7] = v6;
        id v48 = *(void (**)(uint64_t, uint64_t, void (*)(uint64_t), void *, uint64_t, uint64_t))(v42 + 56);
        swift_retain();
        id v49 = a2;
        v48(v44, v46, sub_10002ADFC, v47, v73, v42);
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_8;
      }
    }
    swift_bridgeObjectRelease();
  }
  NSString v50 = *(void **)&a2[OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_store];
  id v75 = 0;
  id v51 = [v50 fetchDefaultListWithError:&v75];
  NSAttributedString v52 = v51;
  if (v75)
  {
    id v53 = v75;

    swift_willThrow();
  }
  else if (v51)
  {
    uint64_t v74 = a2;
    sub_10000A498(0, (unint64_t *)&unk_100046320);
    id v58 = v52;
    uint64_t v59 = (void *)sub_100035750();
    id v60 = v58;
    id v61 = v59;
    uint64_t v62 = v60;
    id v63 = v61;
    uint64_t v64 = sub_100035590();
    os_log_type_t v65 = sub_1000357C0();
    if (os_log_type_enabled(v64, v65))
    {
      uint64_t v66 = swift_slowAlloc();
      uint64_t v67 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v66 = 138412546;
      uint64_t v72 = a3;
      id v68 = [v62 objectID];
      id v75 = v68;
      sub_1000359B0();
      *uint64_t v67 = v68;

      *(_WORD *)(v66 + 12) = 2112;
      id v75 = v63;
      id v69 = v63;
      a3 = v72;
      sub_1000359B0();
      v67[1] = v63;

      _os_log_impl((void *)&_mh_execute_header, v64, v65, "Using defaultList {objectID: %@, result: .success(%@)}", (uint8_t *)v66, 0x16u);
      sub_100009F5C((uint64_t *)&unk_1000462F0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      uint64_t v64 = v62;
    }

    v74[OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_didNotSpecifyTargetList] = 1;
    sub_10000A498(0, (unint64_t *)&unk_100046B30);
    id v70 = [(id)swift_getObjCClassFromMetadata() successWithResolvedTaskList:v63];
    ((void (**)(void, id))a3)[2](a3, v70);
    swift_release();

    return;
  }
  uint64_t v54 = sub_100035590();
  os_log_type_t v55 = sub_1000357C0();
  if (os_log_type_enabled(v54, v55))
  {
    os_log_type_t v56 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v56 = 0;
    _os_log_impl((void *)&_mh_execute_header, v54, v55, "No .targetTaskList and unable to get defaultList. {result: .disambiguateDueToNoDefaultList}", v56, 2u);
    swift_slowDealloc();
  }

  id v57 = sub_1000201BC();
  ((void (**)(void, id))a3)[2](a3, v57);
  swift_release();
}

void sub_10002608C(void *a1, uint64_t a2)
{
  if (qword_100046088 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_1000355A0();
  sub_100009FEC(v4, (uint64_t)qword_100046970);
  id v5 = a1;
  uint64_t v6 = sub_100035590();
  os_log_type_t v7 = sub_1000357C0();
  p_align = &stru_100044FE8.align;
  if (os_log_type_enabled(v6, v7))
  {
    unint64_t v9 = (uint8_t *)swift_slowAlloc();
    unint64_t v94 = swift_slowAlloc();
    *(_DWORD *)unint64_t v9 = 136315138;
    id v10 = [v5 spatialEventTrigger];
    sub_100009F5C(&qword_100046C08);
    uint64_t v11 = sub_1000359A0();
    unint64_t v13 = v12;

    sub_10003007C(v11, v13, (uint64_t *)&v94);
    sub_1000359B0();

    p_align = (_DWORD *)(&stru_100044FE8 + 24);
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "SiriKit asked for resolving spatial event trigger {spatialEventTrigger: %s}", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v14 = [v5 *((SEL *)p_align + 172)];
  if (!v14)
  {
    uint64_t v25 = sub_100035590();
    os_log_type_t v26 = sub_1000357C0();
    if (os_log_type_enabled(v25, v26))
    {
      id v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v27 = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, v26, ".spatialEventTrigger is nil {result: .notRequired}", v27, 2u);
      swift_slowDealloc();
    }

    sub_10000A498(0, &qword_100046BE0);
    uint64_t v28 = [(id)swift_getObjCClassFromMetadata() notRequired];
    (*(void (**)(uint64_t, NSObject *))(a2 + 16))(a2, v28);
    goto LABEL_61;
  }
  unint64_t v15 = v14;
  if (![v14 event])
  {
    unint64_t v29 = sub_100035590();
    os_log_type_t v30 = sub_1000357A0();
    if (os_log_type_enabled(v29, v30))
    {
      unint64_t v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v31 = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "spatialEventTrigger.event must not be .unknown {result: .unsupported}", v31, 2u);
      swift_slowDealloc();
    }

    sub_10000A498(0, &qword_100046BE0);
    uint64_t v28 = [(id)swift_getObjCClassFromMetadata() unsupported];
    (*(void (**)(uint64_t, NSObject *))(a2 + 16))(a2, v28);

    goto LABEL_61;
  }
  id v16 = [v15 mobileSpace];
  uint64_t v17 = v15;
  id v18 = sub_100035590();
  os_log_type_t v19 = sub_1000357C0();
  BOOL v20 = os_log_type_enabled(v18, v19);
  if (v16 == (id)1)
  {
    if (v20)
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      uint64_t v22 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v21 = 138412290;
      unint64_t v94 = v17;
      id v23 = v17;
      uint64_t v24 = v17;
      sub_1000359B0();
      *uint64_t v22 = v15;

      uint64_t v17 = v23;
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "Resolved vehicle trigger {result: .success, spatialEventTrigger: %@}", v21, 0xCu);
      sub_100009F5C((uint64_t *)&unk_1000462F0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      id v18 = v17;
    }

    uint64_t v28 = [self successWithResolvedSpatialEventTrigger:v17];
    (*(void (**)(uint64_t, NSObject *))(a2 + 16))(a2, v28);

LABEL_61:
    return;
  }
  uint64_t v93 = a2;
  os_log_type_t v91 = v17;
  if (v20)
  {
    uint64_t v32 = (uint8_t *)swift_slowAlloc();
    unint64_t v94 = swift_slowAlloc();
    *(_DWORD *)uint64_t v32 = 136315138;
    id v33 = [v17 suggestedValues];
    if (v33)
    {
      uint64_t v34 = v33;
      sub_10000A498(0, &qword_100046BF0);
      sub_1000356C0();
    }
    sub_100009F5C(&qword_100046C00);
    uint64_t v35 = sub_1000359A0();
    unint64_t v37 = v36;
    swift_bridgeObjectRelease();
    sub_10003007C(v35, v37, (uint64_t *)&v94);
    sub_1000359B0();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "suggestedValues: %s", v32, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    a2 = v93;
  }
  else
  {
  }
  id v38 = [v17 suggestedValues];
  if (v38)
  {
    uint64_t v39 = v38;
    sub_10000A498(0, &qword_100046BF0);
    unint64_t v40 = sub_1000356C0();
  }
  else
  {
    unint64_t v40 = (unint64_t)_swiftEmptyArrayStorage;
  }
  unint64_t v41 = v40 >> 62;
  if (!(v40 >> 62))
  {
    if (*(void *)((v40 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_29;
    }
LABEL_38:
    swift_bridgeObjectRelease();
    os_log_type_t v55 = sub_100035590();
    os_log_type_t v56 = sub_1000357C0();
    if (os_log_type_enabled(v55, v56))
    {
      id v57 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v57 = 0;
      _os_log_impl((void *)&_mh_execute_header, v55, v56, "fallback to spatialEventTrigger.placemark instead because placemark count is 0 {count: 0}", v57, 2u);
      swift_slowDealloc();
    }

    id v58 = [v17 placemark];
    if (!v58)
    {
      uint64_t v59 = sub_100035590();
      os_log_type_t v60 = sub_1000357A0();
      if (os_log_type_enabled(v59, v60))
      {
        id v61 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v61 = 0;
        _os_log_impl((void *)&_mh_execute_header, v59, v60, "spatialEventTrigger.placemark == nil. Siri is messed up. Ignoring. {result: .notRequired}", v61, 2u);
        swift_slowDealloc();
      }

      sub_10000A498(0, &qword_100046BE0);
      id v62 = [(id)swift_getObjCClassFromMetadata() notRequired];
      (*(void (**)(uint64_t, id))(a2 + 16))(a2, v62);

      uint64_t v28 = v17;
      goto LABEL_61;
    }
    id v42 = [v17 placemark];
LABEL_50:
    id v67 = [v42 region];
    if (v67)
    {
      id v68 = v67;
      self;
      uint64_t v69 = swift_dynamicCastObjCClass();
      if (v69)
      {
        uint64_t v70 = v69;
        uint64_t v71 = v17;
        id v72 = v68;
        uint64_t v73 = v71;
        uint64_t v74 = v72;
        id v75 = sub_100035590();
        os_log_type_t v76 = sub_1000357C0();
        if (os_log_type_enabled(v75, v76))
        {
          id v92 = v73;
          uint64_t v77 = swift_slowAlloc();
          uint64_t v78 = (void *)swift_slowAlloc();
          *(_DWORD *)uint64_t v77 = 138412546;
          unint64_t v94 = v70;
          unint64_t v79 = v74;
          sub_1000359B0();
          *uint64_t v78 = v70;

          *(_WORD *)(v77 + 12) = 2112;
          unint64_t v94 = v92;
          id v80 = v92;
          sub_1000359B0();
          v78[1] = v15;

          a2 = v93;
          _os_log_impl((void *)&_mh_execute_header, v75, v76, "Resolved circularRegion {circularRegion: %@, result: .success(%@)}", (uint8_t *)v77, 0x16u);
          sub_100009F5C((uint64_t *)&unk_1000462F0);
          swift_arrayDestroy();
          swift_slowDealloc();
          uint64_t v73 = v92;
          swift_slowDealloc();
        }
        else
        {

          id v75 = v74;
        }

        uint64_t v28 = v42;
        id v89 = [objc_allocWithZone((Class)INSpatialEventTrigger) initWithPlacemark:v28 event:[v73 event]];

        id v90 = [self successWithResolvedSpatialEventTrigger:v89];
        (*(void (**)(uint64_t, id))(a2 + 16))(a2, v90);

        goto LABEL_61;
      }
    }
    uint64_t v28 = v42;
    os_log_type_t v81 = sub_100035590();
    os_log_type_t v82 = sub_1000357A0();
    if (os_log_type_enabled(v81, v82))
    {
      unsigned int v83 = (uint8_t *)swift_slowAlloc();
      unint64_t v94 = swift_slowAlloc();
      *(_DWORD *)unsigned int v83 = 136315138;
      id v84 = [v28 region];
      sub_100009F5C(&qword_100046BF8);
      uint64_t v85 = sub_1000359A0();
      unint64_t v87 = v86;

      sub_10003007C(v85, v87, (uint64_t *)&v94);
      sub_1000359B0();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v81, v82, "Got a placemark with a CLRegion that is not a CLCircularRegion {region: %s, result: unsupported}", v83, 0xCu);
      swift_arrayDestroy();
      a2 = v93;
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    sub_10000A498(0, &qword_100046BE0);
    id v88 = [(id)swift_getObjCClassFromMetadata() unsupported];
    (*(void (**)(uint64_t, id))(a2 + 16))(a2, v88);

    goto LABEL_61;
  }
  swift_bridgeObjectRetain();
  uint64_t v54 = sub_100035C00();
  swift_bridgeObjectRelease();
  if (!v54) {
    goto LABEL_38;
  }
LABEL_29:
  if ((v40 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    id v42 = (id)sub_100035AB0();
    swift_bridgeObjectRelease();
    uint64_t v43 = v40 & 0xFFFFFFFFFFFFFF8;
    if (!v41)
    {
LABEL_32:
      if (*(void *)(v43 + 16) != 1)
      {
LABEL_33:

        swift_bridgeObjectRetain_n();
        uint64_t v44 = sub_100035590();
        os_log_type_t v45 = sub_1000357C0();
        if (os_log_type_enabled(v44, v45))
        {
          uint64_t v46 = (uint8_t *)swift_slowAlloc();
          unint64_t v94 = swift_slowAlloc();
          *(_DWORD *)uint64_t v46 = 136315138;
          sub_10000A498(0, &qword_100046BF0);
          swift_bridgeObjectRetain();
          uint64_t v47 = sub_1000356D0();
          id v48 = v17;
          unint64_t v50 = v49;
          swift_bridgeObjectRelease();
          sub_10003007C(v47, v50, (uint64_t *)&v94);
          a2 = v93;
          sub_1000359B0();
          swift_bridgeObjectRelease_n();
          uint64_t v17 = v48;
          swift_bridgeObjectRelease();
          _os_log_impl((void *)&_mh_execute_header, v44, v45, "Disambiguate suggestedValues {result: .disambiguation, placemarks: %s}", v46, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        uint64_t v28 = v17;
        sub_10002534C(v40, v28);
        swift_bridgeObjectRelease();

        id v51 = self;
        sub_10000A498(0, &qword_100046BE8);
        Class isa = sub_1000356B0().super.isa;
        swift_bridgeObjectRelease();
        id v53 = [v51 disambiguationWithSpatialEventTriggersToDisambiguate:isa];

        (*(void (**)(uint64_t, id))(a2 + 16))(a2, v53);
        goto LABEL_61;
      }
      goto LABEL_47;
    }
LABEL_46:
    swift_bridgeObjectRetain();
    uint64_t v63 = sub_100035C00();
    swift_bridgeObjectRelease();
    if (v63 != 1) {
      goto LABEL_33;
    }
LABEL_47:
    swift_bridgeObjectRelease();
    uint64_t v64 = sub_100035590();
    os_log_type_t v65 = sub_1000357C0();
    if (os_log_type_enabled(v64, v65))
    {
      uint64_t v66 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v66 = 0;
      _os_log_impl((void *)&_mh_execute_header, v64, v65, "Using the only suggestedValue because placemarks.count is 1 {count: 1}", v66, 2u);
      swift_slowDealloc();
    }

    goto LABEL_50;
  }
  if (*(void *)((v40 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v42 = *(id *)(v40 + 32);
    uint64_t v43 = v40 & 0xFFFFFFFFFFFFFF8;
    if (!v41) {
      goto LABEL_32;
    }
    goto LABEL_46;
  }
  __break(1u);
}

void sub_100027044(void *a1, uint64_t a2, void (**a3)(void, void))
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a3;
  _Block_copy(a3);
  if (qword_100046088 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_1000355A0();
  sub_100009FEC(v6, (uint64_t)qword_100046970);
  id v7 = a1;
  id v8 = sub_100035590();
  os_log_type_t v9 = sub_1000357C0();
  p_align = &stru_100044FE8.align;
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v28 = v5;
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v29 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315138;
    [v7 taskReference];
    type metadata accessor for INTaskReference(0);
    uint64_t v12 = sub_100035640();
    sub_10003007C(v12, v13, &v29);
    sub_1000359B0();

    p_align = (_DWORD *)(&stru_100044FE8 + 24);
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "SiriKit asked for resolving task reference {taskReference: %s}", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v5 = v28;
    swift_slowDealloc();
  }
  else
  {
  }
  if (objc_msgSend(v7, *((SEL *)p_align + 236)) != (id)1)
  {
    uint64_t v21 = sub_100035590();
    os_log_type_t v22 = sub_1000357C0();
    if (os_log_type_enabled(v21, v22))
    {
      id v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "userActivity not requested {result: .notRequired}", v23, 2u);
      swift_slowDealloc();
    }

    sub_10000A498(0, &qword_100046BD8);
    id v24 = [(id)swift_getObjCClassFromMetadata() notRequired];
    goto LABEL_16;
  }
  id v14 = sub_100021954(v7);
  if (v14)
  {
    unint64_t v15 = v14;
    unsigned __int8 v16 = [v14 supportsReminderActions];

    if ((v16 & 1) == 0)
    {
      uint64_t v25 = sub_100035590();
      os_log_type_t v26 = sub_1000357A0();
      if (os_log_type_enabled(v25, v26))
      {
        id v27 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v27 = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, v26, "Target list account doesn't support userActivity. {result: .unsupported()}", v27, 2u);
        swift_slowDealloc();
      }

      sub_10000A498(0, &qword_100046BD8);
      id v24 = [(id)swift_getObjCClassFromMetadata() unsupported];
LABEL_16:
      id v20 = v24;
      ((void (**)(void, id))a3)[2](a3, v20);
      goto LABEL_17;
    }
  }
  __chkstk_darwin(v14);
  sub_100009F5C((uint64_t *)&unk_100046AF0);
  swift_allocObject();
  sub_100035560();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = sub_10000D498;
  *(void *)(v17 + 24) = v5;
  swift_retain();
  id v18 = (void *)sub_1000354F0();
  sub_100035530();
  swift_release();
  swift_release();

  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = sub_10000D498;
  *(void *)(v19 + 24) = v5;
  swift_retain();
  id v20 = (id)sub_1000354F0();
  sub_100035540();
  swift_release();
  swift_release();
  swift_release();
LABEL_17:
  swift_release();
}

void sub_100027558(void *a1, uint64_t a2)
{
  if (qword_100046088 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_1000355A0();
  sub_100009FEC(v4, (uint64_t)qword_100046970);
  id v5 = a1;
  uint64_t v6 = sub_100035590();
  os_log_type_t v7 = sub_1000357C0();
  if (os_log_type_enabled(v6, v7))
  {
    id v8 = (uint8_t *)swift_slowAlloc();
    id v27 = (void *)swift_slowAlloc();
    *(_DWORD *)id v8 = 136315138;
    id v9 = [v5 targetTaskListMembers];
    if (v9)
    {
      id v10 = v9;
      sub_10000A498(0, &qword_100046BC8);
      sub_1000356C0();
    }
    sub_100009F5C(&qword_100046BD0);
    uint64_t v11 = sub_100035640();
    uint64_t v26 = sub_10003007C(v11, v12, (uint64_t *)&v27);
    sub_1000359B0();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "SiriKit asked for resolving target task list members {targetTaskListMembers: %s}", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v13 = [v5 targetTaskListMembers:v26];
  if (!v13)
  {
    sub_10000A498(0, &qword_100046BC0);
    id v22 = [(id)swift_getObjCClassFromMetadata() notRequired];
    sub_100009F5C(&qword_1000467F0);
    id v23 = (void *)swift_allocObject();
    *((_OWORD *)v23 + 1) = xmmword_100038880;
    v23[4] = v22;
    id v27 = v23;
    sub_1000356E0();
    id v24 = v22;
    v25.super.Class isa = sub_1000356B0().super.isa;
    (*(void (**)(uint64_t, Class))(a2 + 16))(a2, v25.super.isa);

LABEL_21:
    swift_bridgeObjectRelease();

    return;
  }
  id v14 = v13;
  sub_10000A498(0, &qword_100046BC8);
  unint64_t v15 = sub_1000356C0();

  if (!(v15 >> 62))
  {
    uint64_t v16 = *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v16) {
      goto LABEL_11;
    }
LABEL_20:
    swift_bridgeObjectRelease();
    sub_10000A498(0, &qword_100046BC0);
    v25.super.Class isa = sub_1000356B0().super.isa;
    (*(void (**)(uint64_t, Class))(a2 + 16))(a2, v25.super.isa);
    goto LABEL_21;
  }
  swift_bridgeObjectRetain();
  uint64_t v16 = sub_100035C00();
  swift_bridgeObjectRelease();
  if (!v16) {
    goto LABEL_20;
  }
LABEL_11:
  id v27 = _swiftEmptyArrayStorage;
  sub_100035B00();
  if ((v16 & 0x8000000000000000) == 0)
  {
    uint64_t v17 = self;
    uint64_t v18 = 0;
    do
    {
      if ((v15 & 0xC000000000000001) != 0) {
        id v19 = (id)sub_100035AB0();
      }
      else {
        id v19 = *(id *)(v15 + 8 * v18 + 32);
      }
      id v20 = v19;
      ++v18;
      id v21 = [v17 successWithResolvedPerson:v19];

      sub_100035AE0();
      sub_100035B10();
      sub_100035B20();
      sub_100035AF0();
    }
    while (v16 != v18);
    goto LABEL_20;
  }
  __break(1u);
}

void sub_1000279BC(void *a1, unsigned char *a2, const void *a3)
{
  uint64_t v295 = sub_100034FF0();
  uint64_t v294 = *(void *)(v295 - 8);
  __chkstk_darwin(v295);
  v293 = (char *)&v281 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v301 = sub_100034E30();
  uint64_t v300 = *(void *)(v301 - 8);
  __chkstk_darwin(v301);
  uint64_t v299 = (char *)&v281 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v298 = sub_100034F10();
  uint64_t v297 = *(void *)(v298 - 8);
  __chkstk_darwin(v298);
  v296 = (char *)&v281 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v304 = sub_100035240();
  uint64_t v303 = *(void *)(v304 - 8);
  __chkstk_darwin(v304);
  v302 = (char *)&v281 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100009F5C(&qword_100046B40);
  unint64_t v305 = *(void *)(v10 - 8);
  __chkstk_darwin(v10 - 8);
  v307 = (char *)&v281 - ((unint64_t)(v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v306 = v11;
  __chkstk_darwin(v12);
  uint64_t v309 = (uint64_t)&v281 - v13;
  uint64_t v14 = sub_100009F5C((uint64_t *)&unk_100046B48);
  __chkstk_darwin(v14 - 8);
  uint64_t v310 = (char *)&v281 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  v316 = (uint8_t **)((char *)&v281 - v17);
  v315 = (void *)sub_100034F50();
  uint64_t v314 = *(v315 - 1);
  __chkstk_darwin(v315);
  uint64_t v311 = ((char *)&v281 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v19);
  uint64_t v308 = (char *)&v281 - v20;
  uint64_t v21 = sub_1000355A0();
  uint64_t v22 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  id v24 = (char *)&v281 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = a3;
  _Block_copy(a3);
  if (qword_100046088 != -1) {
    swift_once();
  }
  uint64_t v26 = sub_100009FEC(v21, (uint64_t)qword_100046970);
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v24, v26, v21);
  sub_100009F5C(&qword_1000462D0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100038870;
  *(void *)(inited + 32) = 0x746E65746E69;
  *(void *)(inited + 40) = 0xE600000000000000;
  *(void *)(inited + 72) = sub_10000A498(0, (unint64_t *)&unk_100046B58);
  *(void *)(inited + 48) = a1;
  id v28 = a1;
  sub_10001E58C(inited);
  sub_10002B160();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v21);
  uint64_t v29 = v28;
  uint64_t v317 = v26;
  os_log_type_t v30 = sub_100035590();
  os_log_type_t v31 = sub_1000357C0();
  if (os_log_type_enabled(v30, v31))
  {
    uint64_t v32 = swift_slowAlloc();
    uint64_t v313 = a2;
    uint64_t v312 = v25;
    id v33 = (uint8_t *)v32;
    uint64_t v34 = (void *)swift_slowAlloc();
    *(_DWORD *)id v33 = 138412290;
    id v321 = v29;
    uint64_t v35 = v29;
    sub_1000359B0();
    *uint64_t v34 = v29;

    _os_log_impl((void *)&_mh_execute_header, v30, v31, "SiriKit asked for handling intent {intent: %@}", v33, 0xCu);
    sub_100009F5C((uint64_t *)&unk_1000462F0);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v25 = v312;
    a2 = v313;
    swift_slowDealloc();
  }
  else
  {

    os_log_type_t v30 = v29;
  }

  id v36 = [v29 taskTitles];
  id v37 = v316;
  if (!v36)
  {
    uint64_t v46 = sub_100035590();
    os_log_type_t v47 = sub_1000357A0();
    if (!os_log_type_enabled(v46, v47))
    {
LABEL_18:

      id v55 = [objc_allocWithZone((Class)INAddTasksIntentResponse) initWithCode:4 userActivity:0];
      (*((void (**)(const void *, id))a3 + 2))(a3, v55);
      swift_release();

      return;
    }
    id v48 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v48 = 0;
    _os_log_impl((void *)&_mh_execute_header, v46, v47, "intent.taskTitles is nil - should have resolved it in previous calls. {result: .failure}", v48, 2u);
LABEL_16:
    swift_slowDealloc();
    goto LABEL_18;
  }
  id v38 = v36;
  sub_10000A498(0, &qword_100046B10);
  uint64_t v39 = sub_1000356C0();

  id v40 = [v29 targetTaskList];
  if (!v40)
  {
    swift_bridgeObjectRelease();
    unint64_t v49 = v29;
    uint64_t v46 = sub_100035590();
    os_log_type_t v50 = sub_1000357A0();
    if (!os_log_type_enabled(v46, v50))
    {

      uint64_t v46 = v49;
      goto LABEL_18;
    }
    id v51 = (uint8_t *)swift_slowAlloc();
    uint64_t v52 = swift_slowAlloc();
    uint64_t v292 = a3;
    id v53 = (void *)v52;
    *(_DWORD *)id v51 = 138412290;
    id v321 = v49;
    uint64_t v54 = v49;
    sub_1000359B0();
    *id v53 = v49;

    _os_log_impl((void *)&_mh_execute_header, v46, v50, "Unexpected nil .targetTaskList from intent. {intent: %@, result: .failure}", v51, 0xCu);
    sub_100009F5C((uint64_t *)&unk_1000462F0);
    swift_arrayDestroy();
    a3 = v292;
    swift_slowDealloc();
    goto LABEL_16;
  }
  id v41 = v40;
  v289 = v29;
  uint64_t v291 = swift_allocObject();
  *(void *)(v291 + 16) = 0;
  unsigned __int8 v42 = sub_100035740();
  id v290 = v41;
  if (!v43) {
    goto LABEL_27;
  }
  if (v42)
  {
    sub_100034F20();
    uint64_t v44 = v314;
    os_log_type_t v45 = v315;
    if ((*(unsigned int (**)(id, uint64_t, void *))(v314 + 48))(v37, 1, v315) == 1)
    {
      sub_10000A1C0((uint64_t)v37, (uint64_t *)&unk_100046B48);
      goto LABEL_25;
    }
    (*(void (**)(char *, id, void *))(v44 + 32))(v308, v37, v45);
    os_log_type_t v56 = self;
    Class isa = sub_100034F30().super.isa;
    id v58 = [v56 objectIDWithUUID:isa];

    uint64_t v59 = *(void **)&a2[OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_store];
    id v321 = 0;
    v316 = [v59 fetchCustomSmartListWithObjectID:v58 error:&v321];
    if (v316)
    {
      id v60 = v321;
      id v61 = [v316 customContext];
      if (!v61 || (id v62 = v61, v63 = sub_100035880(), v62, !v63))
      {

        (*(void (**)(char *, void *))(v314 + 8))(v308, v315);
        id v41 = v290;
        goto LABEL_25;
      }
      uint64_t v286 = (void *)v63;
      uint64_t v64 = v58;
      os_log_type_t v65 = sub_100035590();
      os_log_type_t v66 = sub_1000357C0();
      LODWORD(v284) = v66;
      BOOL v67 = os_log_type_enabled(v65, v66);
      id v287 = v58;
      v285 = v64;
      if (v67)
      {
        uint64_t v288 = v39;
        id v68 = (uint8_t *)swift_slowAlloc();
        v283 = (void *)swift_slowAlloc();
        uint64_t v292 = a3;
        id v282 = v68;
        *(_DWORD *)id v68 = 138543362;
        unint64_t v281 = v68 + 4;
        id v321 = v64;
        uint64_t v69 = v64;
        uint64_t v39 = v288;
        a3 = v292;
        sub_1000359B0();
        void *v283 = v64;

        _os_log_impl((void *)&_mh_execute_header, v65, (os_log_type_t)v284, "Successfully fetched custom smart list {smartListID: %{public}@}", v282, 0xCu);
        sub_100009F5C((uint64_t *)&unk_1000462F0);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        os_log_type_t v65 = v64;
      }

      v257 = *(void **)(v291 + 16);
      id v258 = v286;
      *(void *)(v291 + 16) = v286;
      id v259 = v258;

      id v321 = 0;
      id v260 = [v59 fetchDefaultListWithError:&v321];
      if (!v321)
      {
        (*(void (**)(char *, void *))(v314 + 8))(v308, v315);

        id v41 = v290;
        if (v260)
        {
          id v90 = v260;
          swift_bridgeObjectRelease();
          v316 = v90;
LABEL_52:
          unsigned int v156 = [v90 isGroup];
          Class v157 = v289;
          if (v156)
          {
            swift_bridgeObjectRelease();
            id v158 = v90;
            id v159 = sub_100035590();
            os_log_type_t v160 = sub_1000357A0();
            if (os_log_type_enabled(v159, v160))
            {
              uint64_t v161 = (uint8_t *)swift_slowAlloc();
              uint64_t v162 = swift_slowAlloc();
              uint64_t v292 = a3;
              v163 = (void *)v162;
              *(_DWORD *)uint64_t v161 = 138543362;
              id v164 = [v158 objectID];
              id v321 = v164;
              sub_1000359B0();
              void *v163 = v164;

              _os_log_impl((void *)&_mh_execute_header, v159, v160, "Fetched list is a Group, can't add reminder to groups. {result: .failure, listID: %{public}@}", v161, 0xCu);
              sub_100009F5C((uint64_t *)&unk_1000462F0);
              swift_arrayDestroy();
              a3 = v292;
              swift_slowDealloc();
              swift_slowDealloc();
            }
            else
            {

              id v159 = v158;
            }
            id v165 = v316;

            id v166 = [objc_allocWithZone((Class)INAddTasksIntentResponse) initWithCode:4 userActivity:0];
            (*((void (**)(const void *, id))a3 + 2))(a3, v166);
            swift_release();
            swift_release();

            return;
          }
          uint64_t v288 = v39;
          if ([v289 spatialEventTrigger])
          {
            sub_10000A498(0, &qword_100046580);
            uint64_t v311 = sub_100035870();
          }
          else
          {
            uint64_t v311 = 0;
          }
          id v184 = [v157 spatialEventTrigger];
          v315 = v90;
          if (v184)
          {
            sub_10000A498(0, &qword_100046588);
            id v287 = (id)sub_100035860();
          }
          else
          {
            id v287 = 0;
          }
          sub_100009F5C((uint64_t *)&unk_100046550);
          uint64_t v314 = swift_allocBox();
          uint64_t v186 = v185;
          id v187 = [v157 temporalEventTrigger];
          unint64_t v281 = (uint8_t *)v186;
          if (v187)
          {
            id v188 = v187;
            sub_100035840();
          }
          else
          {
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v300 + 56))(v186, 1, 1, v301);
          }
          id v189 = [v157 temporalEventTrigger];
          uint64_t v292 = a3;
          if (v189)
          {
            sub_10000D3F4((uint64_t)&a2[OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_timeProvider], (uint64_t)&v321);
            sub_1000351A0();
          }
          else
          {
            uint64_t v190 = sub_1000351B0();
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v190 - 8) + 56))(v309, 1, 1, v190);
          }
          uint64_t v312 = v25;
          uint64_t v191 = swift_allocObject();
          *(void *)(v191 + 16) = 0;
          uint64_t v192 = sub_1000249D4(v157);
          uint64_t v193 = swift_allocObject();
          uint64_t v313 = a2;
          *(void *)(v193 + 16) = 0;
          __chkstk_darwin(v193);
          *(&v281 - 2) = (uint8_t *)v157;
          *(&v281 - 1) = (uint8_t *)v194;
          sub_100009F5C((uint64_t *)&unk_100046AF0);
          swift_allocObject();
          uint64_t v195 = sub_100035560();
          sub_100009F5C(&qword_100046B68);
          uint64_t v196 = swift_allocBox();
          uint64_t v198 = v197;
          uint64_t v199 = sub_100034E80();
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v199 - 8) + 56))(v198, 1, 1, v199);
          Swift::OpaquePointer_optional v200 = swift_allocObject();
          v200[2].Class isa = 0;
          v200[3].Class isa = 0;
          id v282 = (uint8_t *)sub_100009F5C(&qword_100046B70);
          sub_100009F5C(&qword_1000467F0);
          uint64_t v201 = swift_allocObject();
          *(_OWORD *)(v201 + 16) = xmmword_100038DA0;
          swift_retain();
          Swift::String_optional v202 = (void *)sub_1000354F0();
          uint64_t v286 = (void *)v192;
          uint64_t v203 = sub_100035530();
          uint64_t v317 = v191;
          swift_release();

          *(void *)(v201 + 32) = v203;
          v204 = (void *)swift_allocObject();
          v204[2] = v193;
          v204[3] = v196;
          v204[4] = v200;
          uint64_t v310 = (char *)v193;
          swift_retain();
          uint64_t v308 = (char *)v196;
          swift_retain();
          v285 = v200;
          swift_retain();
          uint64_t v205 = (void *)sub_1000354F0();
          v283 = (void *)((char *)&type metadata for () + 8);
          uint64_t v284 = v195;
          uint64_t v206 = sub_100035530();
          swift_release();

          *(void *)(v201 + 40) = v206;
          id v321 = (id)v201;
          sub_1000356E0();
          id v282 = (uint8_t *)sub_100035500();
          swift_bridgeObjectRelease();
          uint64_t v207 = v303;
          uint64_t v208 = v302;
          uint64_t v209 = v304;
          (*(void (**)(char *, void, uint64_t))(v303 + 104))(v302, enum case for REMFeatureFlags.siriDefaultTime(_:), v304);
          LOBYTE(v206) = sub_100035230();
          (*(void (**)(char *, uint64_t))(v207 + 8))(v208, v209);
          v210 = v313;
          if ((v206 & 1) != 0
            && v313[OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_didNotSpecifyTargetList] == 1)
          {
            id v211 = [v289 temporalEventTrigger];

            if (!v211)
            {
              id v212 = [v289 spatialEventTrigger];

              if (!v212)
              {
                id v213 = [v289 contactEventTrigger];

                if (!v213)
                {
                  int v214 = v210;
                  id v215 = &v210[OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_timeProvider];
                  uint64_t v216 = *(void *)&v210[OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_timeProvider
                                        + 24];
                  uint64_t v217 = v215[4];
                  sub_10000A024(v215, v216);
                  v218 = v296;
                  (*(void (**)(uint64_t, uint64_t))(v217 + 8))(v216, v217);
                  os_log_type_t v219 = self;
                  Class v220 = sub_100034EC0().super.isa;
                  uint64_t v221 = v293;
                  sub_100034FE0();
                  Class v222 = sub_100034FD0().super.isa;
                  (*(void (**)(char *, uint64_t))(v294 + 8))(v221, v295);
                  id v223 = [v219 rem_dateComponentsWithDate:v220 timeZone:v222 isAllDay:0];

                  uint64_t v224 = v299;
                  sub_100034DD0();

                  uint64_t v225 = sub_100034DE0();
                  if (v226)
                  {
                    _Block_release(v292);

                    __break(1u);
                    return;
                  }
                  uint64_t v227 = v225;
                  int v228 = self;
                  [v228 nextThirdsHour:[v228 nextThirdsHourFromHour:v227]];
                  sub_100034DF0();
                  sub_100034E00();
                  sub_100034E10();
                  (*(void (**)(char *, uint64_t))(v297 + 8))(v218, v298);
                  uint64_t v229 = (uint64_t)v281;
                  sub_10000A1C0((uint64_t)v281, (uint64_t *)&unk_100046550);
                  uint64_t v230 = v300;
                  unint64_t v231 = v224;
                  uint64_t v232 = v301;
                  (*(void (**)(uint64_t, char *, uint64_t))(v300 + 32))(v229, v231, v301);
                  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v230 + 56))(v229, 0, 1, v232);
                  v210 = v214;
                }
              }
            }
          }
          sub_10000A15C(v309, (uint64_t)v307, &qword_100046B40);
          unint64_t v233 = (*(unsigned __int8 *)(v305 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v305 + 80);
          unint64_t v305 = (unint64_t)&v306[v233 + 7] & 0xFFFFFFFFFFFFFFF8;
          unint64_t v234 = (v305 + 15) & 0xFFFFFFFFFFFFFFF8;
          unint64_t v235 = (v234 + 15) & 0xFFFFFFFFFFFFFFF8;
          unint64_t v236 = (v235 + 15) & 0xFFFFFFFFFFFFFFF8;
          uint64_t v306 = (char *)((v236 + 15) & 0xFFFFFFFFFFFFFFF8);
          unint64_t v237 = (unint64_t)(v306 + 15) & 0xFFFFFFFFFFFFFFF8;
          unint64_t v238 = (v237 + 15) & 0xFFFFFFFFFFFFFFF8;
          uint64_t v239 = swift_allocObject();
          v240 = v315;
          *(void *)(v239 + 16) = v210;
          *(void *)(v239 + 24) = v240;
          os_log_type_t v241 = v311;
          *(void *)(v239 + 32) = v288;
          *(void *)(v239 + 40) = v241;
          id v242 = v287;
          uint64_t v243 = v314;
          *(void *)(v239 + 48) = v287;
          *(void *)(v239 + 56) = v243;
          sub_10002AA18((uint64_t)v307, v239 + v233, &qword_100046B40);
          *(void *)(v239 + v305) = v317;
          *(void *)(v239 + v234) = v310;
          *(void *)(v239 + v235) = v308;
          *(void *)(v239 + v236) = v285;
          unint64_t v244 = (uint64_t (**)())(v239 + ((v238 + 15) & 0xFFFFFFFFFFFFFFF8));
          *(void *)&v306[v239] = v291;
          uint64_t v245 = v289;
          *(void *)(v239 + v237) = v289;
          id v246 = v290;
          *(void *)(v239 + v238) = v290;
          char v247 = (uint64_t (*)())v312;
          *unint64_t v244 = sub_100009FD8;
          v244[1] = v247;
          v307 = (char *)v242;
          swift_retain();
          swift_retain();
          uint64_t v306 = (char *)v246;
          swift_retain();
          id v248 = v245;
          unint64_t v249 = v315;
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          BOOL v250 = v313;
          v251 = v311;
          unint64_t v252 = (void *)sub_1000354F0();
          sub_100035530();

          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();

          sub_10000A1C0(v309, &qword_100046B40);
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
LABEL_84:
          swift_release();
          return;
        }
        goto LABEL_25;
      }
      uint64_t v313 = v259;
      id v261 = v321;
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      swift_willThrow();
      id v321 = v261;
      id v168 = v261;
      sub_100009F5C(&qword_100046B78);
      sub_10000A498(0, &qword_100046B80);
      char v262 = swift_dynamicCast();
      uint64_t v312 = v25;
      if (v262)
      {

        uint64_t v263 = v319;
        v264 = v285;
        id v265 = v263;
        v266 = v264;
        id v267 = v265;
        uint64_t v268 = sub_100035590();
        os_log_type_t v269 = sub_1000357A0();
        if (os_log_type_enabled(v268, v269))
        {
          uint64_t v270 = swift_slowAlloc();
          uint64_t v292 = a3;
          uint64_t v271 = v270;
          unint64_t v272 = (void *)swift_slowAlloc();
          uint64_t v317 = swift_slowAlloc();
          uint64_t v318 = (uint64_t)v266;
          uint64_t v320 = v317;
          *(_DWORD *)uint64_t v271 = 138543618;
          uint64_t v311 = v268;
          unsigned __int8 v273 = v267;
          unsigned __int8 v274 = v266;
          sub_1000359B0();
          *unint64_t v272 = v266;

          id v267 = v273;
          *(_WORD *)(v271 + 12) = 2082;
          uint64_t v318 = (uint64_t)v273;
          sub_10002ABA8();
          uint64_t v275 = sub_100035CA0();
          uint64_t v318 = sub_10003007C(v275, v276, &v320);
          sub_1000359B0();

          swift_bridgeObjectRelease();
          uint64_t v277 = v311;
          _os_log_impl((void *)&_mh_execute_header, v311, v269, "Smart List found and unable to fetch default list. {result: .failure, smartListID: %{public}@, error: %{public}s}", (uint8_t *)v271, 0x16u);
          sub_100009F5C((uint64_t *)&unk_1000462F0);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_arrayDestroy();
          swift_slowDealloc();
          a3 = v292;
          swift_slowDealloc();
        }
        else
        {
        }
        id v278 = v290;
        id v279 = v313;
        id v280 = [objc_allocWithZone((Class)INAddTasksIntentResponse) initWithCode:4 userActivity:0];
        (*((void (**)(const void *, id))a3 + 2))(a3, v280);

LABEL_87:
        (*(void (**)(char *, void *))(v314 + 8))(v308, v315);
        swift_errorRelease();
        goto LABEL_83;
      }

      swift_errorRelease();
    }
    else
    {
      id v287 = v58;
      uint64_t v312 = v25;
      id v167 = v321;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      id v168 = (id)sub_100034E50();

      swift_willThrow();
    }
    id v321 = v168;
    sub_100009F5C(&qword_100046B78);
    uint64_t v169 = (void *)sub_10000A498(0, &qword_100046B80);
    swift_dynamicCast();
    uint64_t v170 = v319;
    id v171 = v287;
    id v172 = v170;
    id v173 = v171;
    id v174 = v172;
    uint64_t v175 = sub_100035590();
    os_log_type_t v176 = sub_1000357A0();
    if (os_log_type_enabled(v175, v176))
    {
      uint64_t v177 = swift_slowAlloc();
      uint64_t v292 = a3;
      uint64_t v178 = v177;
      uint64_t v179 = swift_slowAlloc();
      v316 = v169;
      uint64_t v180 = (void *)v179;
      uint64_t v317 = swift_slowAlloc();
      uint64_t v318 = (uint64_t)v173;
      uint64_t v320 = v317;
      *(_DWORD *)uint64_t v178 = 138543618;
      id v181 = v173;
      sub_1000359B0();
      *uint64_t v180 = v173;

      *(_WORD *)(v178 + 12) = 2082;
      uint64_t v318 = (uint64_t)v174;
      sub_10002ABA8();
      uint64_t v182 = sub_100035CA0();
      uint64_t v318 = sub_10003007C(v182, v183, &v320);
      sub_1000359B0();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v175, v176, "Error fetching smart list. {listID: %{public}@, error: %{public}s}", (uint8_t *)v178, 0x16u);
      sub_100009F5C((uint64_t *)&unk_1000462F0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      a3 = v292;
      swift_slowDealloc();
    }
    else
    {
    }
    id v255 = v290;
    id v256 = [objc_allocWithZone((Class)INAddTasksIntentResponse) initWithCode:4 userActivity:0];
    (*((void (**)(const void *, id))a3 + 2))(a3, v256);

    goto LABEL_87;
  }
LABEL_25:
  uint64_t v70 = v310;
  sub_100034F20();
  uint64_t v71 = (uint64_t)v70;
  swift_bridgeObjectRelease();
  uint64_t v72 = v314;
  uint64_t v73 = v70;
  uint64_t v74 = v315;
  if ((*(unsigned int (**)(char *, uint64_t, void *))(v314 + 48))(v73, 1, v315) != 1)
  {
    (*(void (**)(NSObject *, uint64_t, void *))(v72 + 32))(v311, v71, v74);
    uint64_t v102 = self;
    Class v103 = sub_100034F30().super.isa;
    id v104 = [v102 objectIDWithUUID:v103];

    os_log_type_t v105 = *(void **)&a2[OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_store];
    id v321 = 0;
    id v106 = [v105 fetchListWithObjectID:v104 error:&v321];
    id v107 = v321;
    if (v106)
    {
      id v90 = v106;
      id v108 = v107;
      uint64_t v109 = sub_100035590();
      os_log_type_t v110 = sub_1000357C0();
      if (os_log_type_enabled(v109, v110))
      {
        uint64_t v292 = a3;
        uint64_t v111 = swift_slowAlloc();
        uint64_t v313 = a2;
        id v112 = (uint8_t *)v111;
        v316 = (void *)swift_slowAlloc();
        *(_DWORD *)id v112 = 138543362;
        id v113 = [v90 objectID];
        id v114 = v90;
        uint64_t v115 = v39;
        id v116 = v113;
        id v321 = v113;
        a3 = v292;
        sub_1000359B0();
        void *v316 = v116;
        uint64_t v39 = v115;
        id v90 = v114;

        _os_log_impl((void *)&_mh_execute_header, v109, v110, "Successfully fetched list {listID: %{public}@}", v112, 0xCu);
        sub_100009F5C((uint64_t *)&unk_1000462F0);
        swift_arrayDestroy();
        id v41 = v290;
        swift_slowDealloc();
        a2 = v313;
        swift_slowDealloc();
      }
      else
      {

        id v104 = v90;
      }

      (*(void (**)(NSObject *, void *))(v314 + 8))(v311, v315);
      v316 = 0;
      goto LABEL_52;
    }
    id v125 = v321;
    swift_bridgeObjectRelease();
    os_log_type_t v126 = (void *)sub_100034E50();

    swift_willThrow();
    id v321 = v126;
    sub_100009F5C(&qword_100046B78);
    id v127 = (void *)sub_10000A498(0, &qword_100046B80);
    swift_dynamicCast();
    uint64_t v128 = v319;
    id v129 = v104;
    id v130 = v128;
    id v131 = v129;
    id v132 = v130;
    uint64_t v133 = sub_100035590();
    os_log_type_t v134 = sub_1000357A0();
    if (os_log_type_enabled(v133, v134))
    {
      uint64_t v135 = swift_slowAlloc();
      uint64_t v292 = a3;
      uint64_t v136 = v135;
      uint64_t v137 = swift_slowAlloc();
      v316 = v127;
      id v138 = (void *)v137;
      uint64_t v317 = swift_slowAlloc();
      uint64_t v318 = (uint64_t)v131;
      uint64_t v320 = v317;
      *(_DWORD *)uint64_t v136 = 138543618;
      uint64_t v312 = v25;
      id v139 = v131;
      sub_1000359B0();
      *id v138 = v131;

      *(_WORD *)(v136 + 12) = 2082;
      uint64_t v318 = (uint64_t)v132;
      sub_10002ABA8();
      uint64_t v140 = sub_100035CA0();
      uint64_t v318 = sub_10003007C(v140, v141, &v320);
      id v41 = v290;
      sub_1000359B0();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v133, v134, "Unable to fetch list. {result: .failure, listID: %{public}@, error: %{public}s}", (uint8_t *)v136, 0x16u);
      sub_100009F5C((uint64_t *)&unk_1000462F0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      a3 = v292;
      swift_slowDealloc();
    }
    else
    {
    }
    unint64_t v253 = v315;
    id v254 = [objc_allocWithZone((Class)INAddTasksIntentResponse) initWithCode:4 userActivity:0];
    (*((void (**)(const void *, id))a3 + 2))(a3, v254);

    (*(void (**)(NSObject *, void *))(v314 + 8))(v311, v253);
LABEL_82:
    swift_errorRelease();
LABEL_83:
    swift_release();
    goto LABEL_84;
  }
  sub_10000A1C0(v71, (uint64_t *)&unk_100046B48);
LABEL_27:
  uint64_t v75 = v39;
  os_log_type_t v76 = *(void **)&a2[OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_store];
  id v77 = sub_1000254CC(v76);
  if (v77)
  {
    uint64_t v78 = v77;
    uint64_t v313 = a2;
    id v79 = [v41 title];
    NSString v80 = [v79 spokenPhrase];

    if (!v80)
    {
      sub_100035630();
      NSString v80 = sub_100035600();
      swift_bridgeObjectRelease();
    }
    id v81 = [objc_allocWithZone((Class)REMSaveRequest) initWithStore:v76];
    v316 = [v81 updateAccount:v78];
    id v82 = [v81 addListWithName:v80];

    id v321 = 0;
    unsigned int v83 = [v81 saveSynchronouslyWithError:&v321];
    id v84 = v321;
    if (v83)
    {
      uint64_t v292 = a3;
      id v85 = v321;
      id v86 = [v82 objectID];
      id v321 = 0;
      id v87 = [v76 fetchListWithObjectID:v86 error:&v321];

      id v84 = v321;
      if (v87)
      {
        v315 = v81;
        uint64_t v312 = v25;
        id v88 = v87;
        id v89 = v78;
        id v90 = v88;
        id v91 = v89;
        id v92 = v84;
        uint64_t v93 = sub_100035590();
        os_log_type_t v94 = sub_1000357C0();
        int v95 = v94;
        if (os_log_type_enabled(v93, v94))
        {
          uint64_t v96 = swift_slowAlloc();
          uint64_t v97 = swift_slowAlloc();
          LODWORD(v314) = v95;
          Swift::Bool v98 = (void *)v97;
          *(_DWORD *)uint64_t v96 = 138543618;
          uint64_t v311 = v93;
          id v99 = [v90 objectID];
          id v321 = v99;
          sub_1000359B0();
          *Swift::Bool v98 = v99;

          *(_WORD *)(v96 + 12) = 2112;
          id v321 = v91;
          id v100 = v91;
          sub_1000359B0();
          v98[1] = v78;

          unint64_t v101 = v311;
          _os_log_impl((void *)&_mh_execute_header, v311, (os_log_type_t)v314, "Successfully created new list {listID: %{public}@, account: %@}", (uint8_t *)v96, 0x16u);
          sub_100009F5C((uint64_t *)&unk_1000462F0);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
        }
        v316 = 0;
        uint64_t v25 = v312;
        a3 = v292;
        id v41 = v290;
        a2 = v313;
        uint64_t v39 = v75;
        goto LABEL_52;
      }
      a3 = v292;
    }
    id v142 = v84;
    swift_bridgeObjectRelease();
    uint64_t v143 = sub_100034E50();

    swift_willThrow();
    id v144 = v78;
    id v145 = v82;
    uint64_t v146 = sub_100035590();
    os_log_type_t v147 = sub_1000357A0();
    if (os_log_type_enabled(v146, v147))
    {
      uint64_t v148 = swift_slowAlloc();
      uint64_t v149 = swift_slowAlloc();
      uint64_t v312 = v25;
      id v150 = (void *)v149;
      *(_DWORD *)uint64_t v148 = 138543618;
      v315 = v81;
      id v151 = [v145 objectID];
      uint64_t v292 = a3;
      id v152 = v151;
      id v321 = v151;
      uint64_t v314 = (uint64_t)v78;
      uint64_t v317 = v143;
      sub_1000359B0();
      *id v150 = v152;

      *(_WORD *)(v148 + 12) = 2112;
      id v321 = v144;
      Swift::Bool v153 = v145;
      id v154 = v144;
      a3 = v292;
      id v81 = v315;
      sub_1000359B0();
      v150[1] = v314;

      id v145 = v153;
      _os_log_impl((void *)&_mh_execute_header, v146, v147, "Error creating new list. {listID: %{public}@, account: %@, result: .failure}", (uint8_t *)v148, 0x16u);
      sub_100009F5C((uint64_t *)&unk_1000462F0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      uint64_t v146 = v145;
    }

    id v155 = [objc_allocWithZone((Class)INAddTasksIntentResponse) initWithCode:4 userActivity:0];
    (*((void (**)(const void *, id))a3 + 2))(a3, v155);

    goto LABEL_82;
  }
  swift_bridgeObjectRelease();
  id v117 = v289;
  id v118 = sub_100035590();
  os_log_type_t v119 = sub_1000357A0();
  if (os_log_type_enabled(v118, v119))
  {
    uint64_t v120 = (uint8_t *)swift_slowAlloc();
    uint64_t v121 = swift_slowAlloc();
    uint64_t v292 = a3;
    uint64_t v122 = (void *)v121;
    *(_DWORD *)uint64_t v120 = 138412290;
    id v321 = v117;
    uint64_t v123 = v117;
    id v41 = v290;
    sub_1000359B0();
    *uint64_t v122 = v117;

    _os_log_impl((void *)&_mh_execute_header, v118, v119, "Unable to create list because there is no default account. {intent: %@, result: .failureRequiringAppLaunch}", v120, 0xCu);
    sub_100009F5C((uint64_t *)&unk_1000462F0);
    swift_arrayDestroy();
    a3 = v292;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    id v118 = v117;
  }

  id v124 = [objc_allocWithZone((Class)INAddTasksIntentResponse) initWithCode:5 userActivity:0];
  (*((void (**)(const void *, id))a3 + 2))(a3, v124);
  swift_release();
  swift_release();
}

uint64_t sub_10002A68C()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10002A6C4()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_10002A6FC(void **a1)
{
  sub_100021F10(a1, v1);
}

uint64_t sub_10002A718()
{
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10002A760(void **a1)
{
  return sub_100021F74(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_10002A780()
{
  uint64_t v1 = *(void *)(sub_100009F5C(&qword_100046B40) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 64) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);

  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v5 = sub_1000351B0();
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))((char *)v0 + v3, 1, v5))
  {
    uint64_t v6 = sub_100035180();
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48))((char *)v0 + v3, 1, v6)&& !swift_getEnumCaseMultiPayload())
    {
      uint64_t v7 = sub_100034F10();
      (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))((char *)v0 + v3, v7);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  unint64_t v8 = (((((((((((v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
        + 15) & 0xFFFFFFFFFFFFFFF8)
      + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v9 = (v8 + 15) & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();

  return _swift_deallocObject(v0, ((v9 + 15) & 0xFFFFFFFFFFFFFFF8) + 16, v2 | 7);
}

uint64_t sub_10002AA18(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100009F5C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void sub_10002AA7C(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_100009F5C(&qword_100046B40) - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v9 = (v8 + 15) & 0xFFFFFFFFFFFFFFF8;
  sub_1000221E0(a1, *(void *)(v1 + 16), *(void **)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), v1 + v4, *(void *)(v1 + v5), *(void *)(v1 + v6), *(void *)(v1 + v7), *(void *)(v1 + v8), *(void *)(v1 + v9), *(void **)(v1 + ((v9 + 15) & 0xFFFFFFFFFFFFFFF8)), *(void *)(v1 + ((((v9 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)), *(void (**)(void))(v1+ ((((((v9 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)));
}

unint64_t sub_10002ABA8()
{
  unint64_t result = qword_100046B88;
  if (!qword_100046B88)
  {
    sub_10000A498(255, &qword_100046B80);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100046B88);
  }
  return result;
}

void sub_10002AC10(void **a1@<X0>, void *a2@<X8>)
{
  sub_100022AA0(a1, *(void **)(v2 + 24), *(void **)(v2 + 32), *(void **)(v2 + 40), *(void (**)(char *, char *, uint64_t))(v2 + 48), *(void *)(v2 + 56), *(NSObject **)(v2 + 64), a2, *(void ***)(v2 + 72), *(void **)(v2 + 80), *(void **)(v2 + 88), *(id **)(v2 + 96), *(id *)(v2 + 104));
}

uint64_t sub_10002AC58(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10002ACA0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10002AD00(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100009F5C(&qword_100046B68);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

_OWORD *sub_10002AD68(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void sub_10002AD78(void *a1)
{
  sub_100021A1C(a1, *(void (**)(void))(v1 + 16));
}

void sub_10002AD94(uint64_t a1)
{
  sub_100021C20(a1, *(void (**)(id))(v1 + 16));
}

void sub_10002AD9C(uint64_t a1)
{
  sub_1000218A8(a1, *(void *)(v1 + 16));
}

uint64_t sub_10002ADA4()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

void sub_10002ADFC(uint64_t a1)
{
  sub_10001F4C4(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void (**)(void))(v1 + 48));
}

uint64_t sub_10002AE0C()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_10002AE4C(uint64_t a1)
{
  sub_10001E8A8(a1, *(void *)(v1 + 16), *(void (**)(void))(v1 + 24));
}

unint64_t sub_10002AE58()
{
  unint64_t result = qword_100046C20;
  if (!qword_100046C20)
  {
    sub_10000A278(&qword_1000465D8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100046C20);
  }
  return result;
}

void sub_10002AEDC(uint64_t a1, uint64_t a2, char a3)
{
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  unint64_t v5 = sub_100035590();
  os_log_type_t v6 = sub_1000357B0();
  uint64_t v17 = a1;
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136446722;
    uint64_t v8 = sub_100035AA0();
    sub_10003007C(v8, v9, &v18);
    sub_1000359B0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 2080;
    swift_bridgeObjectRetain();
    char v16 = a3;
    uint64_t v10 = sub_1000355D0();
    unint64_t v12 = v11;
    swift_bridgeObjectRelease();
    sub_10003007C(v10, v12, &v18);
    sub_1000359B0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 22) = 2082;
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_1000355D0();
    unint64_t v15 = v14;
    swift_bridgeObjectRelease();
    sub_10003007C(v13, v15, &v18);
    sub_1000359B0();
    swift_bridgeObjectRelease_n();
    a3 = v16;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "%{public}s; UserInfo=%s; PublicUserInfo=%{public}s",
      (uint8_t *)v7,
      0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }

  if (a3) {
    goto LABEL_7;
  }
  if (v17)
  {
    rdi_os_crash();
LABEL_7:
    __break(1u);
  }
  __break(1u);
}

void sub_10002B160()
{
  sub_100035250();
  sub_100009F5C(&qword_100046C38);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100038870;
  sub_100035580();
  *(void *)(inited + 32) = 0x696669746E656449;
  *(void *)(inited + 40) = 0xEA00000000007265;
  sub_100035AA0();
  NSString v1 = sub_100035600();
  swift_bridgeObjectRelease();
  *(void *)(inited + 48) = v1;
  sub_10001E6C4(inited);
  sub_100035570();
  swift_bridgeObjectRelease();
  if (qword_100046090 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1000355A0();
  sub_100009FEC(v2, (uint64_t)qword_100047280);
  swift_bridgeObjectRetain_n();
  uint64_t v3 = sub_100035590();
  os_log_type_t v4 = sub_1000357C0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136446466;
    uint64_t v6 = sub_100035AA0();
    sub_10003007C(v6, v7, &v11);
    sub_1000359B0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v5 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_1000355D0();
    unint64_t v10 = v9;
    swift_bridgeObjectRelease();
    sub_10003007C(v8, v10, &v11);
    sub_1000359B0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "%{public}s; UserInfo=%s", (uint8_t *)v5, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

uint64_t sub_10002B454(uint64_t a1)
{
  return sub_10002B490(a1, qword_100047280, (SEL *)&selRef_userAction);
}

uint64_t sub_10002B468(uint64_t a1)
{
  return sub_10002B490(a1, qword_100047298, (SEL *)&selRef_utility);
}

uint64_t sub_10002B47C(uint64_t a1)
{
  return sub_10002B490(a1, qword_1000472B0, (SEL *)&selRef_siriKit);
}

uint64_t sub_10002B490(uint64_t a1, uint64_t *a2, SEL *a3)
{
  uint64_t v5 = sub_1000355A0();
  sub_10000A434(v5, a2);
  sub_100009FEC(v5, (uint64_t)a2);
  id v6 = [self *a3];
  return sub_1000355B0();
}

uint64_t sub_10002B504()
{
  uint64_t v0 = sub_1000355A0();
  sub_10000A434(v0, qword_100046C40);
  uint64_t v1 = sub_100009FEC(v0, (uint64_t)qword_100046C40);
  if (qword_1000460A0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100009FEC(v0, (uint64_t)qword_1000472B0);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

void sub_10002B5CC(void *a1, uint64_t a2, uint64_t a3)
{
}

void sub_10002B5E8(void *a1, uint64_t a2, uint64_t a3)
{
}

void sub_10002B604(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t *a6)
{
  if (qword_1000460A8 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_1000355A0();
  sub_100009FEC(v9, (uint64_t)qword_100046C40);
  id v10 = a1;
  uint64_t v11 = sub_100035590();
  os_log_type_t v12 = sub_1000357C0();
  p_align = &stru_100044FE8.align;
  if (os_log_type_enabled(v11, v12))
  {
    unint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v49 = swift_slowAlloc();
    *(_DWORD *)unint64_t v14 = 136315138;
    unint64_t v15 = a6;
    id v16 = [v10 temporalEventTrigger];
    sub_100009F5C(&qword_100046C60);
    uint64_t v17 = sub_1000359A0();
    uint64_t v48 = a3;
    unint64_t v19 = v18;

    a6 = v15;
    uint64_t v20 = v17;
    p_align = (_DWORD *)(&stru_100044FE8 + 24);
    sub_10003007C(v20, v19, &v49);
    sub_1000359B0();

    a3 = v48;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "SiriKit asked for resolving temporalEventTrigger {temporalEventTrigger: %s}", v14, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v21 = [v10 *((SEL *)p_align + 173)];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = (void *)sub_100035850();
    id v24 = v23;
    if (v25)
    {
      if ((_BYTE)v23)
      {
        if (v23 == 1)
        {
          uint64_t v34 = sub_100035590();
          os_log_type_t v35 = sub_1000357C0();
          if (os_log_type_enabled(v34, v35))
          {
            id v36 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)id v36 = 0;
            _os_log_impl((void *)&_mh_execute_header, v34, v35, ".temporalEventTrigger.recurrenceRule is not supported {result: .unsupported(.invalidRecurrence)}", v36, 2u);
            swift_slowDealloc();
          }

          id v37 = [self unsupportedForReason:2];
        }
        else
        {
          unsigned __int8 v42 = sub_100035590();
          os_log_type_t v43 = sub_1000357C0();
          if (os_log_type_enabled(v42, v43))
          {
            uint64_t v44 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v44 = 0;
            _os_log_impl((void *)&_mh_execute_header, v42, v43, ".temporalEventTrigger could not be converted into a dueDate, ignoring it {result: .notRequired}", v44, 2u);
            swift_slowDealloc();
          }

          sub_10000A498(0, a6);
          id v37 = [(id)swift_getObjCClassFromMetadata() notRequired];
        }
      }
      else
      {
        uint64_t v39 = sub_100035590();
        os_log_type_t v40 = sub_1000357C0();
        if (os_log_type_enabled(v39, v40))
        {
          id v41 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)id v41 = 0;
          _os_log_impl((void *)&_mh_execute_header, v39, v40, ".temporalEventTrigger would create a due date in the past {result: .unsupported(.timeInPast)}", v41, 2u);
          swift_slowDealloc();
        }

        id v37 = [self unsupportedForReason:1];
      }
      id v45 = v37;
      (*(void (**)(uint64_t, id))(a3 + 16))(a3, v45);

      id v22 = v45;
    }
    else
    {
      id v26 = v23;
      id v27 = sub_100035590();
      os_log_type_t v28 = sub_1000357C0();
      if (os_log_type_enabled(v27, v28))
      {
        os_log_type_t v47 = v26;
        uint64_t v29 = (uint8_t *)swift_slowAlloc();
        uint64_t v46 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v29 = 138412290;
        uint64_t v49 = (uint64_t)v47;
        id v30 = v47;
        sub_1000359B0();
        *uint64_t v46 = v24;
        sub_10002BCBC(v24, 0);
        sub_10002BCBC(v24, 0);
        _os_log_impl((void *)&_mh_execute_header, v27, v28, ".temporalEventTrigger resolved to a valid date {result: .success(with: %@)}", v29, 0xCu);
        sub_100009F5C((uint64_t *)&unk_1000462F0);
        swift_arrayDestroy();
        swift_slowDealloc();
        id v26 = v47;
        swift_slowDealloc();
      }
      else
      {
        sub_10002BCBC(v24, 0);
        sub_10002BCBC(v24, 0);
      }

      sub_10000A498(0, a6);
      id v38 = [(id)swift_getObjCClassFromMetadata() successWithResolvedTemporalEventTrigger:v26];
      (*(void (**)(uint64_t, id))(a3 + 16))(a3, v38);

      sub_10002BCBC(v24, 0);
    }
  }
  else
  {
    os_log_type_t v31 = sub_100035590();
    os_log_type_t v32 = sub_1000357C0();
    if (os_log_type_enabled(v31, v32))
    {
      id v33 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v33 = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, v32, ".temporalEventTrigger is nil {result: .notRequired}", v33, 2u);
      swift_slowDealloc();
    }

    sub_10000A498(0, a6);
    id v22 = [(id)swift_getObjCClassFromMetadata() notRequired];
    (*(void (**)(uint64_t, id))(a3 + 16))(a3, v22);
  }
}

void sub_10002BCBC(id a1, char a2)
{
  if ((a2 & 1) == 0) {
}
  }

uint64_t sub_10002BCC8()
{
  uint64_t v0 = sub_1000355A0();
  sub_10000A434(v0, qword_100046C70);
  uint64_t v1 = sub_100009FEC(v0, (uint64_t)qword_100046C70);
  if (qword_100046098 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100009FEC(v0, (uint64_t)qword_100047298);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

void sub_10002BD90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t), uint64_t a6, void *a7)
{
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a1;
  *(void *)(v12 + 24) = a2;
  uint64_t v13 = swift_retain();
  unint64_t v14 = (void *)a5(v13);
  unint64_t v15 = (void *)swift_allocObject();
  v15[2] = sub_10000F2C4;
  v15[3] = v12;
  v15[4] = a7;
  v15[5] = a5;
  v15[6] = a6;
  v18[4] = sub_10002C284;
  void v18[5] = v15;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 1107296256;
  v18[2] = sub_10002C294;
  v18[3] = &unk_100041E18;
  id v16 = _Block_copy(v18);
  id v17 = a7;
  swift_retain();
  swift_release();
  [v14 requestAccessForEntityType:0 completionHandler:v16];
  _Block_release(v16);
}

uint64_t sub_10002BED8()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_10002BF10(char a1, uint64_t a2, void (*a3)(id), uint64_t a4, uint64_t a5, uint64_t (*a6)(void))
{
  if (a2)
  {
    swift_errorRetain();
    if (qword_1000460B0 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_1000355A0();
    sub_100009FEC(v7, (uint64_t)qword_100046C70);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v8 = sub_100035590();
    os_log_type_t v9 = sub_1000357A0();
    if (os_log_type_enabled(v8, v9))
    {
      id v10 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      *(_DWORD *)id v10 = 136315138;
      swift_getErrorValue();
      uint64_t v11 = sub_100035C90();
      sub_10003007C(v11, v12, &v19);
      sub_1000359B0();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Error requesting permission for CNContactStore {error: %s}", v10, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    a3(0);
    swift_errorRelease();
  }
  else if (a1)
  {
    uint64_t v13 = (void *)a6();
    id v18 = (id)sub_100035950();

    a3(v18);
  }
  else
  {
    if (qword_1000460B0 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_1000355A0();
    sub_100009FEC(v14, (uint64_t)qword_100046C70);
    unint64_t v15 = sub_100035590();
    os_log_type_t v16 = sub_1000357A0();
    if (os_log_type_enabled(v15, v16))
    {
      id v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "Permission not granted for accessing CNContactStore {granted: false}", v17, 2u);
      swift_slowDealloc();
    }

    a3(0);
  }
}

uint64_t sub_10002C23C()
{
  swift_release();

  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

void sub_10002C284(char a1, uint64_t a2)
{
  sub_10002BF10(a1, a2, *(void (**)(id))(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(uint64_t (**)(void))(v2 + 40));
}

void sub_10002C294(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_10002C30C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10002C31C()
{
  return swift_release();
}

void *initializeBufferWithCopyOfBuffer for TTRContactRepresentationResolver(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for TTRContactRepresentationResolver()
{
  return swift_release();
}

void *assignWithCopy for TTRContactRepresentationResolver(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for TTRContactRepresentationResolver(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for TTRContactRepresentationResolver(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for TTRContactRepresentationResolver(uint64_t result, int a2, int a3)
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
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TTRContactRepresentationResolver()
{
  return &type metadata for TTRContactRepresentationResolver;
}

void *sub_10002C464(void (*a1)(uint64_t *__return_ptr, uint64_t), uint64_t a2, uint64_t a3)
{
  return sub_10002C47C(a1, a2, a3);
}

void *sub_10002C47C(void (*a1)(uint64_t *__return_ptr, uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = *(void *)(a3 + 16);
  unint64_t result = &_swiftEmptyArrayStorage;
  if (v6)
  {
    uint64_t v13 = &_swiftEmptyArrayStorage;
    sub_100035B00();
    uint64_t v9 = *(void *)(sub_100035290() - 8);
    uint64_t v10 = a3 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v11 = *(void *)(v9 + 72);
    while (1)
    {
      a1(&v12, v10);
      if (v4) {
        break;
      }
      uint64_t v4 = 0;
      sub_100035AE0();
      sub_100035B10();
      sub_100035B20();
      sub_100035AF0();
      v10 += v11;
      if (!--v6) {
        return v13;
      }
    }
    return (void *)swift_release();
  }
  return result;
}

void *sub_10002C5C4(void (*a1)(uint64_t *__return_ptr, id *), uint64_t a2, unint64_t a3)
{
  if (a3 >> 62) {
    goto LABEL_16;
  }
  uint64_t v6 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    unint64_t result = _swiftEmptyArrayStorage;
    if (!v6) {
      break;
    }
    uint64_t v13 = _swiftEmptyArrayStorage;
    unint64_t result = (void *)sub_100035B00();
    if (v6 < 0)
    {
      __break(1u);
      return result;
    }
    uint64_t v8 = 0;
    while (v6 != v8)
    {
      if ((a3 & 0xC000000000000001) != 0) {
        id v9 = (id)sub_100035AB0();
      }
      else {
        id v9 = *(id *)(a3 + 8 * v8 + 32);
      }
      uint64_t v10 = v9;
      id v11 = v9;
      a1(&v12, &v11);

      if (v3) {
        return (void *)swift_release();
      }
      ++v8;
      sub_100035AE0();
      sub_100035B10();
      sub_100035B20();
      sub_100035AF0();
      if (v6 == v8) {
        return v13;
      }
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_100035C00();
    swift_bridgeObjectRelease();
  }
  return result;
}

void sub_10002C734(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_10002C768(a1, a2, a3, (void (*)(uint64_t *__return_ptr, uint64_t))sub_100031A80);
}

void sub_10002C768(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t *__return_ptr, uint64_t))
{
  v9[2] = &v10;
  uint64_t v6 = sub_10002C47C(a4, (uint64_t)v9, a1);
  sub_100009F5C(&qword_100046DB8);
  v9[4] = v6;
  sub_100009F5C(&qword_100046DC0);
  sub_100030D50();
  sub_100035510();
  swift_bridgeObjectRelease();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  swift_retain();
  uint64_t v8 = (void *)sub_1000354F0();
  sub_100035530();
  swift_release();
  swift_release();
  swift_release();
}

uint64_t sub_10002C87C()
{
  uint64_t v0 = sub_1000355A0();
  sub_10000A434(v0, qword_100046C88);
  uint64_t v1 = sub_100009FEC(v0, (uint64_t)qword_100046C88);
  if (qword_1000460A0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100009FEC(v0, (uint64_t)qword_1000472B0);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

void sub_10002C944(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_100035290();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  id v11 = (char *)&v55 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v55 - v13;
  uint64_t v15 = *(void *)(a1 + 16);
  if (v15)
  {
    id v57 = v4;
    uint64_t v58 = a2;
    uint64_t v60 = a3;
    uint64_t v56 = v9;
    id v18 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
    uint64_t v17 = v9 + 16;
    os_log_type_t v16 = v18;
    uint64_t v19 = a1 + ((*(unsigned __int8 *)(v17 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 64));
    int v62 = enum case for REMSearchCriterion.textualField(_:);
    uint64_t v20 = (void (**)(char *, uint64_t))(v17 - 8);
    uint64_t v61 = *(void *)(v17 + 56);
    uint64_t v59 = a1;
    swift_bridgeObjectRetain();
    while (1)
    {
      v16(v14, v19, v8);
      v16(v11, (uint64_t)v14, v8);
      int v21 = (*(uint64_t (**)(char *, uint64_t))(v17 + 72))(v11, v8);
      if (v21 == v62) {
        break;
      }
      id v22 = *v20;
      (*v20)(v11, v8);
      v22(v14, v8);
      v19 += v61;
      if (!--v15)
      {
        a1 = v59;
        swift_bridgeObjectRelease();
        a3 = v60;
        uint64_t v4 = v57;
        a2 = v58;
        goto LABEL_6;
      }
    }
    uint64_t v30 = v56 + 96;
    (*(void (**)(char *, uint64_t))(v56 + 96))(v11, v8);
    swift_bridgeObjectRelease();
    os_log_type_t v31 = &v11[*(int *)(sub_100009F5C(&qword_1000462E8) + 48)];
    uint64_t v32 = sub_1000353B0();
    (*(void (**)(char *, uint64_t))(*(void *)(v32 - 8) + 8))(v31, v32);
    (*(void (**)(char *, uint64_t))(v30 - 88))(v14, v8);
    uint64_t v33 = v59;
    swift_bridgeObjectRelease();
    if (qword_1000460B8 != -1) {
      swift_once();
    }
    uint64_t v34 = sub_1000355A0();
    sub_100009FEC(v34, (uint64_t)qword_100046C88);
    swift_bridgeObjectRetain_n();
    os_log_type_t v35 = sub_100035590();
    os_log_type_t v36 = sub_1000357C0();
    BOOL v37 = os_log_type_enabled(v35, v36);
    id v38 = v57;
    if (v37)
    {
      uint64_t v39 = (uint8_t *)swift_slowAlloc();
      uint64_t v64 = swift_slowAlloc();
      *(_DWORD *)uint64_t v39 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v40 = sub_1000356D0();
      unint64_t v42 = v41;
      swift_bridgeObjectRelease();
      uint64_t v63 = sub_10003007C(v40, v42, &v64);
      sub_1000359B0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v35, v36, "Querying Spotlight for reminders {criteria: %s}", v39, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v43 = v33;
    sub_1000351D0();
    sub_100009F5C(&qword_100046DD0);
    uint64_t v44 = sub_1000352B0();
    uint64_t v45 = *(void *)(v44 - 8);
    unint64_t v46 = (*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80);
    uint64_t v47 = swift_allocObject();
    *(_OWORD *)(v47 + 16) = xmmword_100038870;
    (*(void (**)(unint64_t, void, uint64_t))(v45 + 104))(v47 + v46, enum case for REMSearchableItemType.reminder(_:), v44);
    sub_10000A498(0, (unint64_t *)&qword_1000460D0);
    uint64_t v48 = (void *)sub_100035820();
    sub_1000351C0();
    swift_bridgeObjectRelease();

    uint64_t v49 = (void *)swift_allocObject();
    v49[2] = v43;
    v49[3] = v38;
    uint64_t v50 = v58;
    uint64_t v51 = v60;
    v49[4] = v58;
    v49[5] = v51;
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    uint64_t v52 = (void *)sub_1000354F0();
    sub_100035530();
    swift_release();
    swift_release();

    id v53 = (void *)swift_allocObject();
    v53[2] = v43;
    v53[3] = v50;
    v53[4] = v51;
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t v54 = (void *)sub_1000354F0();
    sub_100035540();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
LABEL_6:
    if (qword_1000460B8 != -1) {
      swift_once();
    }
    uint64_t v23 = sub_1000355A0();
    sub_100009FEC(v23, (uint64_t)qword_100046C88);
    id v24 = sub_100035590();
    os_log_type_t v25 = sub_1000357C0();
    if (os_log_type_enabled(v24, v25))
    {
      id v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v26 = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "Criteria does not contain a text search, using fallback data source", v26, 2u);
      swift_slowDealloc();
    }

    id v27 = v4 + 4;
    uint64_t v29 = v4[7];
    uint64_t v28 = v4[8];
    sub_10000A024(v27, v29);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v28 + 24))(a1, a2, a3, v29, v28);
  }
}

uint64_t sub_10002D040(uint64_t a1, uint64_t a2, void *a3, void (*a4)(unint64_t), uint64_t a5)
{
  id v124 = a4;
  os_log_type_t v126 = a3;
  uint64_t v8 = sub_100035280();
  uint64_t v116 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v105 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v111 = (char *)&v105 - v12;
  __chkstk_darwin(v13);
  id v112 = (char *)&v105 - v14;
  uint64_t v15 = sub_100035290();
  uint64_t v121 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  id v114 = (void **)((char *)&v105 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v17);
  os_log_type_t v119 = (id *)((char *)&v105 - v18);
  __chkstk_darwin(v19);
  uint64_t v120 = (uint8_t *)&v105 - v20;
  __chkstk_darwin(v21);
  id v113 = (uint8_t *)&v105 - v22;
  __chkstk_darwin(v23);
  uint64_t v115 = (char *)&v105 - v24;
  unint64_t v25 = swift_bridgeObjectRetain();
  id v26 = sub_100030810(v25);
  swift_bridgeObjectRelease();
  if (qword_1000460B8 != -1) {
    swift_once();
  }
  uint64_t v27 = sub_1000355A0();
  uint64_t v28 = sub_100009FEC(v27, (uint64_t)qword_100046C88);
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v118 = v28;
  uint64_t v29 = sub_100035590();
  int v30 = sub_1000357C0();
  BOOL v31 = os_log_type_enabled(v29, (os_log_type_t)v30);
  os_log_type_t v110 = v10;
  uint64_t v122 = a5;
  uint64_t v123 = v5;
  uint64_t v117 = v8;
  uint64_t v125 = v15;
  if (v31)
  {
    LODWORD(v130) = v30;
    uint64_t v32 = swift_slowAlloc();
    uint64_t v33 = (void *)swift_slowAlloc();
    id v132 = v33;
    *(_DWORD *)uint64_t v32 = 134218498;
    id v129 = v33;
    if (((unint64_t)v26 & 0x8000000000000000) != 0 || ((unint64_t)v26 & 0x4000000000000000) != 0)
    {
      uint64_t v34 = v29;
      swift_bridgeObjectRetain();
      uint64_t v35 = sub_100035C00();
      swift_release();
    }
    else
    {
      uint64_t v34 = v29;
      uint64_t v35 = v26[2];
    }
    swift_release();
    uint64_t v131 = v35;
    sub_1000359B0();
    swift_release();
    *(_WORD *)(v32 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v36 = sub_1000356D0();
    unint64_t v38 = v37;
    swift_bridgeObjectRelease();
    uint64_t v131 = sub_10003007C(v36, v38, (uint64_t *)&v132);
    sub_1000359B0();
    uint64_t v39 = a2;
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v32 + 22) = 2080;
    sub_10000A498(0, &qword_100046778);
    swift_bridgeObjectRetain();
    uint64_t v40 = sub_1000356D0();
    unint64_t v42 = v41;
    swift_release();
    uint64_t v131 = sub_10003007C(v40, v42, (uint64_t *)&v132);
    sub_1000359B0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v34, (os_log_type_t)v130, "Got %ld reminders from Spotlight {criteria: %s, reminderIDs: %s}", (uint8_t *)v32, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    uint64_t v39 = a2;
    swift_bridgeObjectRelease_n();
    swift_release_n();
  }
  uint64_t v43 = (void *)v126[2];
  sub_10000A498(0, &qword_100046778);
  Class isa = sub_1000356B0().super.isa;
  swift_release();
  id v132 = 0;
  id v45 = [v43 fetchRemindersWithObjectIDs:isa error:&v132];

  id v46 = v132;
  if (!v45)
  {
    id v64 = v132;
    sub_100034E50();

    return swift_willThrow();
  }
  sub_10000A498(0, (unint64_t *)&unk_100046800);
  sub_100014DA4();
  unint64_t v47 = sub_1000355C0();
  id v48 = v46;

  unint64_t v49 = (unint64_t)sub_1000306FC(v47, (unint64_t *)&unk_100046800);
  swift_bridgeObjectRelease();
  uint64_t v50 = v39;
  uint64_t v51 = *(void *)(v39 + 16);
  if (v51)
  {
    unint64_t v108 = v49;
    id v130 = *(void (**)(id *, uint8_t *, uint64_t))(v121 + 16);
    uint64_t v52 = (uint8_t *)(v39
                    + ((*(unsigned __int8 *)(v121 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v121 + 80)));
    id v53 = (uint64_t (**)(id *, uint64_t))(v121 + 88);
    LODWORD(v129) = enum case for REMSearchCriterion.listID(_:);
    id v127 = *(void (**)(char *, uint64_t))(v121 + 72);
    uint64_t v128 = (void (**)(char *, uint64_t))(v121 + 8);
    uint64_t v109 = v39;
    swift_bridgeObjectRetain();
    uint64_t v54 = v125;
    uint64_t v56 = v119;
    uint64_t v55 = v120;
    id v57 = (void (**)(id *, uint64_t))v128;
    while (1)
    {
      uint64_t v58 = v130;
      v130((id *)v55, v52, v54);
      v58(v56, v55, v54);
      uint64_t v59 = *v53;
      int v60 = (*v53)(v56, v54);
      if (v60 == v129) {
        break;
      }
      uint64_t v61 = *v57;
      (*v57)(v56, v54);
      v61((id *)v55, v54);
      uint64_t v52 = (uint8_t *)v127 + (void)v52;
      if (!--v51)
      {
        uint64_t v50 = v109;
        swift_bridgeObjectRelease();
        uint64_t v62 = v122;
        uint64_t v63 = v124;
LABEL_27:
        unint64_t v49 = v108;
        goto LABEL_28;
      }
    }
    uint64_t v66 = v121;
    BOOL v67 = *(void (**)(void **, uint64_t))(v121 + 96);
    uint64_t v107 = v121 + 96;
    id v106 = v67;
    v67(v56, v54);

    uint64_t v105 = sub_100009F5C(&qword_100046330);
    id v68 = (char *)v56 + *(int *)(v105 + 48);
    uint64_t v69 = (void (*)(id *, uint8_t *, uint64_t))(v116 + 8);
    id v127 = *(void (**)(char *, uint64_t))(v116 + 8);
    v127(v68, v117);
    swift_bridgeObjectRelease();
    uint64_t v70 = *(void (**)(char *, uint8_t *, uint64_t))(v66 + 32);
    uint64_t v71 = v113;
    v70((char *)v113, v55, v54);
    uint64_t v72 = v115;
    v70(v115, v71, v54);
    uint64_t v73 = v114;
    v130(v114, (uint8_t *)v72, v54);
    int v74 = v59(v73, v54);
    if (v74 != v129)
    {
      id v88 = v73;
      id v89 = *v128;
      (*v128)(v72, v54);
      v89((char *)v88, v54);
      uint64_t v62 = v122;
      uint64_t v63 = v124;
      uint64_t v50 = v109;
      goto LABEL_27;
    }
    v106(v73, v54);
    uint64_t v75 = *v73;
    uint64_t v76 = v116;
    uint64_t v77 = v117;
    uint64_t v78 = v112;
    (*(void (**)(char *, char *, uint64_t))(v116 + 32))(v112, (char *)v73 + *(int *)(v105 + 48), v117);
    id v79 = v111;
    (*(void (**)(char *, void, uint64_t))(v76 + 104))(v111, enum case for REMSearchCriterion.Inclusion.includeForSiri(_:), v77);
    char v80 = sub_100035270();
    id v81 = v79;
    id v130 = v69;
    id v82 = v127;
    v127(v81, v77);
    uint64_t v63 = v124;
    if ((v80 & 1) == 0)
    {
      id v90 = v82;
      id v129 = v75;
      id v91 = v110;
      (*(void (**)(char *, char *, uint64_t))(v76 + 16))(v110, v78, v77);
      id v92 = sub_100035590();
      uint64_t v93 = v78;
      os_log_type_t v94 = sub_1000357B0();
      BOOL v95 = os_log_type_enabled(v92, v94);
      uint64_t v50 = v109;
      if (v95)
      {
        uint64_t v96 = (uint8_t *)swift_slowAlloc();
        uint64_t v121 = swift_slowAlloc();
        id v132 = (id)v121;
        *(_DWORD *)uint64_t v96 = 136315138;
        os_log_type_t v119 = (id *)(v96 + 4);
        uint64_t v120 = v96;
        sub_100031724();
        uint64_t v97 = sub_100035C40();
        uint64_t v131 = sub_10003007C(v97, v98, (uint64_t *)&v132);
        sub_1000359B0();
        swift_bridgeObjectRelease();
        v90(v91, v77);
        _os_log_impl((void *)&_mh_execute_header, v92, v94, "Called with %s, but should only be .includeForSiri in TTRIntentsHandlerSpotlightDataSource.", v120, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v90(v112, v77);
        (*v128)(v115, v125);
      }
      else
      {

        v90(v91, v77);
        v90(v93, v77);
        (*v128)(v115, v54);
      }
      uint64_t v62 = v122;
      goto LABEL_27;
    }
    unsigned int v83 = sub_100035590();
    os_log_type_t v84 = sub_1000357C0();
    BOOL v85 = os_log_type_enabled(v83, v84);
    uint64_t v50 = v109;
    if (v85)
    {
      id v86 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v86 = 0;
      _os_log_impl((void *)&_mh_execute_header, v83, v84, "Criteria had list id, filtering further", v86, 2u);
      uint64_t v78 = v112;
      swift_slowDealloc();
    }

    id v87 = v75;
    unint64_t v49 = (unint64_t)sub_10003177C(v108);
    swift_release();

    v127(v78, v77);
    (*v128)(v115, v54);

    uint64_t v62 = v122;
  }
  else
  {
    uint64_t v63 = v124;
    uint64_t v62 = v122;
  }
LABEL_28:
  if (v49 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v99 = sub_100035C00();
    swift_bridgeObjectRelease();
    if (v99) {
      goto LABEL_30;
    }
  }
  else if (*(void *)((v49 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_30:
    v63(v49);
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  id v100 = sub_100035590();
  os_log_type_t v101 = sub_1000357C0();
  if (os_log_type_enabled(v100, v101))
  {
    uint64_t v102 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v102 = 0;
    _os_log_impl((void *)&_mh_execute_header, v100, v101, "Consulting fallbackDataSource since Spotlight result is empty.", v102, 2u);
    swift_slowDealloc();
  }

  uint64_t v103 = v126[7];
  uint64_t v104 = v126[8];
  sub_10000A024(v126 + 4, v103);
  return (*(uint64_t (**)(uint64_t, void (*)(unint64_t), uint64_t, uint64_t, uint64_t))(v104 + 24))(v50, v63, v62, v103, v104);
}

uint64_t sub_10002DD8C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  if (qword_1000460B8 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_1000355A0();
  sub_100009FEC(v4, (uint64_t)qword_100046C88);
  swift_bridgeObjectRetain();
  swift_errorRetain();
  swift_bridgeObjectRetain();
  swift_errorRetain();
  uint64_t v5 = sub_100035590();
  os_log_type_t v6 = sub_1000357A0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315394;
    sub_100035290();
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_1000356D0();
    uint64_t v9 = a3;
    unint64_t v11 = v10;
    swift_bridgeObjectRelease();
    sub_10003007C(v8, v11, &v15);
    sub_1000359B0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 2080;
    swift_getErrorValue();
    uint64_t v12 = sub_100035C90();
    sub_10003007C(v12, v13, &v15);
    a3 = v9;
    sub_1000359B0();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Error matching reminders from Spotlight {criteria: %s, error: %s}", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_errorRelease();
    swift_errorRelease();
  }

  return a3(_swiftEmptyArrayStorage);
}

void sub_10002E014(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  if (*(void *)(a1 + 16) < 2uLL)
  {
    if (qword_1000460B8 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_1000355A0();
    sub_100009FEC(v10, (uint64_t)qword_100046C88);
    swift_bridgeObjectRetain_n();
    unint64_t v11 = sub_100035590();
    os_log_type_t v12 = sub_1000357C0();
    if (os_log_type_enabled(v11, v12))
    {
      unint64_t v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      *(_DWORD *)unint64_t v13 = 136315138;
      sub_100035290();
      swift_bridgeObjectRetain();
      uint64_t v14 = sub_1000356D0();
      unint64_t v16 = v15;
      swift_bridgeObjectRelease();
      sub_10003007C(v14, v16, &v26);
      sub_1000359B0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Querying Spotlight for lists {criteria: %s}", v13, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    sub_1000351D0();
    sub_100009F5C(&qword_100046DD0);
    uint64_t v17 = sub_1000352B0();
    uint64_t v18 = *(void *)(v17 - 8);
    unint64_t v19 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
    uint64_t v20 = swift_allocObject();
    *(_OWORD *)(v20 + 16) = xmmword_100038870;
    (*(void (**)(unint64_t, void, uint64_t))(v18 + 104))(v20 + v19, enum case for REMSearchableItemType.list(_:), v17);
    sub_10000A498(0, (unint64_t *)&qword_1000460D0);
    uint64_t v21 = (void *)sub_100035820();
    sub_1000351C0();
    swift_bridgeObjectRelease();

    uint64_t v22 = (void *)swift_allocObject();
    v22[2] = a1;
    v22[3] = v4;
    v22[4] = a2;
    void v22[5] = a3;
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t v23 = (void *)sub_1000354F0();
    sub_100035530();
    swift_release();
    swift_release();

    uint64_t v24 = (void *)swift_allocObject();
    v24[2] = a1;
    v24[3] = a2;
    v24[4] = a3;
    swift_retain();
    swift_bridgeObjectRetain();
    unint64_t v25 = (void *)sub_1000354F0();
    sub_100035540();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    uint64_t v8 = (void *)swift_allocObject();
    v8[2] = a2;
    v8[3] = a3;
    v8[4] = a1;
    swift_retain();
    uint64_t v9 = swift_bridgeObjectRetain();
    sub_10002C768(v9, (uint64_t)sub_100031600, (uint64_t)v8, (void (*)(uint64_t *__return_ptr, uint64_t))sub_100030D1C);
    swift_release();
  }
}

uint64_t sub_10002E4BC(unint64_t a1, uint64_t a2, void (*a3)(char *), uint64_t a4, uint64_t a5)
{
  uint64_t v8 = sub_100035320();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  unint64_t v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000F43C(a5, a1);
  swift_bridgeObjectRetain();
  sub_100035300();
  a3(v11);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_10002E5CC(uint64_t a1, uint64_t a2, void *a3, void (*a4)(void), uint64_t a5)
{
  id v48 = a3;
  uint64_t v9 = sub_100035320();
  uint64_t v46 = *(void *)(v9 - 8);
  uint64_t v47 = v9;
  __chkstk_darwin(v9);
  id v45 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v11 = swift_bridgeObjectRetain();
  os_log_type_t v12 = sub_100030810(v11);
  swift_bridgeObjectRelease();
  if (qword_1000460B8 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_1000355A0();
  uint64_t v14 = sub_100009FEC(v13, (uint64_t)qword_100046C88);
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v44 = v14;
  unint64_t v15 = sub_100035590();
  os_log_type_t v16 = sub_1000357C0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v40 = (void *)swift_slowAlloc();
    id v50 = v40;
    *(_DWORD *)uint64_t v17 = 134218498;
    uint64_t v42 = a5;
    uint64_t v43 = v5;
    unint64_t v41 = a4;
    if (((unint64_t)v12 & 0x8000000000000000) != 0 || ((unint64_t)v12 & 0x4000000000000000) != 0)
    {
      uint64_t v18 = a2;
      swift_bridgeObjectRetain();
      uint64_t v19 = sub_100035C00();
      swift_release();
    }
    else
    {
      uint64_t v18 = a2;
      uint64_t v19 = v12[2];
    }
    swift_release();
    uint64_t v49 = v19;
    sub_1000359B0();
    swift_release();
    *(_WORD *)(v17 + 12) = 2080;
    sub_100035290();
    swift_bridgeObjectRetain();
    uint64_t v20 = sub_1000356D0();
    unint64_t v22 = v21;
    swift_bridgeObjectRelease();
    uint64_t v49 = sub_10003007C(v20, v22, (uint64_t *)&v50);
    sub_1000359B0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 22) = 2080;
    sub_10000A498(0, &qword_100046778);
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_1000356D0();
    unint64_t v25 = v24;
    swift_release();
    uint64_t v49 = sub_10003007C(v23, v25, (uint64_t *)&v50);
    sub_1000359B0();
    swift_release_n();
    a2 = v18;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Got %ld lists from Spotlight {criteria: %s, listIDs: %s}", (uint8_t *)v17, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    a5 = v42;
    a4 = v41;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
  }
  uint64_t v26 = (void *)v48[2];
  sub_10000A498(0, &qword_100046778);
  Class isa = sub_1000356B0().super.isa;
  swift_release();
  id v50 = 0;
  id v28 = [v26 fetchListsWithObjectIDs:isa error:&v50];

  id v29 = v50;
  if (v28)
  {
    sub_10000A498(0, (unint64_t *)&qword_1000465D0);
    sub_100014DA4();
    unint64_t v30 = sub_1000355C0();
    id v31 = v29;

    if ((v30 & 0xC000000000000001) != 0)
    {
      if (sub_100035B90())
      {
LABEL_12:
        sub_1000306FC(v30, (unint64_t *)&qword_1000465D0);
        swift_bridgeObjectRelease();
        uint64_t v32 = v45;
        sub_100035300();
        a4(v32);
        return (*(uint64_t (**)(char *, uint64_t))(v46 + 8))(v32, v47);
      }
    }
    else if (*(void *)(v30 + 16))
    {
      goto LABEL_12;
    }
    swift_bridgeObjectRelease();
    uint64_t v35 = sub_100035590();
    os_log_type_t v36 = sub_1000357C0();
    if (os_log_type_enabled(v35, v36))
    {
      unint64_t v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v37 = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, v36, "Consulting fallbackDataSource for CSL or non-Spotlight-indexed list", v37, 2u);
      swift_slowDealloc();
    }

    uint64_t v38 = v48[7];
    uint64_t v39 = v48[8];
    sub_10000A024(v48 + 4, v38);
    return (*(uint64_t (**)(uint64_t, void (*)(void), uint64_t, uint64_t, uint64_t))(v39 + 32))(a2, a4, a5, v38, v39);
  }
  else
  {
    id v34 = v50;
    sub_100034E50();

    return swift_willThrow();
  }
}

uint64_t sub_10002EBA8(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t a4)
{
  uint64_t v6 = sub_100035320();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000460B8 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_1000355A0();
  sub_100009FEC(v10, (uint64_t)qword_100046C88);
  swift_bridgeObjectRetain();
  swift_errorRetain();
  swift_bridgeObjectRetain();
  swift_errorRetain();
  unint64_t v11 = sub_100035590();
  os_log_type_t v12 = sub_1000357A0();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v22 = v6;
    uint64_t v14 = v13;
    uint64_t v21 = swift_slowAlloc();
    uint64_t v26 = v21;
    *(_DWORD *)uint64_t v14 = 136315394;
    sub_100035290();
    unint64_t v24 = a3;
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_1000356D0();
    uint64_t v23 = a4;
    unint64_t v17 = v16;
    swift_bridgeObjectRelease();
    uint64_t v25 = sub_10003007C(v15, v17, &v26);
    sub_1000359B0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2080;
    swift_getErrorValue();
    uint64_t v18 = sub_100035C90();
    uint64_t v25 = sub_10003007C(v18, v19, &v26);
    a3 = v24;
    sub_1000359B0();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Error matching lists from Spotlight {criteria: %s, error: %s}", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v6 = v22;
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_errorRelease();
    swift_errorRelease();
  }

  sub_100035300();
  a3(v9);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_10002EED8(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v49 = a3;
  uint64_t v48 = a2;
  uint64_t v65 = sub_100035290();
  uint64_t v58 = *(void *)(v65 - 8);
  __chkstk_darwin(v65);
  uint64_t v55 = (char *)&v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v7 = (uint64_t *)((char *)&v47 - v6);
  uint64_t v61 = swift_allocObject();
  *(void *)(v61 + 16) = _swiftEmptyArrayStorage;
  unint64_t v66 = (unint64_t)_swiftEmptyArrayStorage;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_100035C00();
    uint64_t v8 = result;
    if (result) {
      goto LABEL_3;
    }
LABEL_29:
    swift_bridgeObjectRelease();
    uint64_t v40 = _swiftEmptyArrayStorage;
LABEL_30:
    unint64_t v41 = v66;
    if (v40[2])
    {
      uint64_t v42 = (void *)swift_allocObject();
      uint64_t v43 = v49;
      v42[2] = v50;
      v42[3] = a1;
      v42[4] = v48;
      v42[5] = v43;
      uint64_t v44 = v61;
      v42[6] = v41;
      v42[7] = v44;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_retain();
      swift_retain();
      swift_retain();
      sub_10002C768((uint64_t)v40, (uint64_t)sub_100030B38, (uint64_t)v42, (void (*)(uint64_t *__return_ptr, uint64_t))sub_100030D1C);
      swift_release();
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v45 = v50[7];
      uint64_t v46 = v50[8];
      sub_10000A024(v50 + 4, v45);
      (*(void (**)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v46 + 40))(a1, v48, v49, v45, v46);
    }
    return swift_release();
  }
  uint64_t v8 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
  if (!v8) {
    goto LABEL_29;
  }
LABEL_3:
  if (v8 >= 1)
  {
    uint64_t v10 = 0;
    unint64_t v62 = a1 & 0xC000000000000001;
    unsigned int v57 = enum case for REMStringMatchingStyle.prefix(_:);
    unsigned int v56 = enum case for REMSearchCriterion.textualField(_:);
    uint64_t v59 = v58 + 32;
    int v60 = (void (**)(uint64_t *, void, uint64_t))(v58 + 104);
    unsigned int v53 = enum case for REMSearchableListType.grocery(_:);
    unsigned int v52 = enum case for REMSearchCriterion.listType(_:);
    uint64_t v54 = "TTRContactEventTriggerBearing";
    unint64_t v51 = 0x80000001000391F0;
    uint64_t v63 = v8;
    unint64_t v64 = a1;
    while (1)
    {
      if (v62) {
        id v12 = (id)sub_100035AB0();
      }
      else {
        id v12 = *(id *)(a1 + 8 * v10 + 32);
      }
      uint64_t v13 = v12;
      uint64_t v14 = (void *)sub_100035770();

      if (v14)
      {
        id v11 = v13;
        sub_1000356A0();
        if (*(void *)((v66 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v66 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_1000356F0();
        }
        sub_100035700();
        sub_1000356E0();
        goto LABEL_8;
      }
      id v15 = [v13 title];
      id v16 = [v15 spokenPhrase];

      uint64_t v17 = sub_100035630();
      uint64_t v19 = v18;

      uint64_t v20 = (char *)v7 + *(int *)(sub_100009F5C(&qword_1000462E8) + 48);
      *uint64_t v7 = v17;
      v7[1] = v19;
      uint64_t v21 = sub_1000353B0();
      (*(void (**)(char *, void, uint64_t))(*(void *)(v21 - 8) + 104))(v20, v57, v21);
      uint64_t v22 = (void (*)(char *, void, uint64_t))*v60;
      (*v60)(v7, v56, v65);
      unint64_t v23 = *(void *)(v61 + 16);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        unint64_t v23 = sub_10002FDFC(0, *(void *)(v23 + 16) + 1, 1, v23, &qword_1000465B0, (uint64_t (*)(void))&type metadata accessor for REMSearchCriterion, (uint64_t (*)(void))&type metadata accessor for REMSearchCriterion);
        *(void *)(v61 + 16) = v23;
      }
      unint64_t v25 = *(void *)(v23 + 16);
      unint64_t v24 = *(void *)(v23 + 24);
      if (v25 >= v24 >> 1)
      {
        unint64_t v23 = sub_10002FDFC(v24 > 1, v25 + 1, 1, v23, &qword_1000465B0, (uint64_t (*)(void))&type metadata accessor for REMSearchCriterion, (uint64_t (*)(void))&type metadata accessor for REMSearchCriterion);
        *(void *)(v61 + 16) = v23;
      }
      *(void *)(v23 + 16) = v25 + 1;
      unint64_t v26 = (*(unsigned __int8 *)(v58 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v58 + 80);
      uint64_t v27 = *(void *)(v58 + 72);
      id v28 = *(void (**)(unint64_t, uint64_t *, uint64_t))(v58 + 32);
      v28(v23 + v26 + v27 * v25, v7, v65);
      id v29 = [v13 title];
      id v30 = [v29 vocabularyIdentifier];

      if (v30)
      {
        uint64_t v31 = sub_100035630();
        uint64_t v33 = v32;

        if (v31 == 0xD000000000000011 && v33 == v51)
        {
          swift_bridgeObjectRelease();
LABEL_22:
          uint64_t v35 = sub_1000352D0();
          os_log_type_t v36 = v55;
          (*(void (**)(char *, void, uint64_t))(*(void *)(v35 - 8) + 104))(v55, v53, v35);
          v22(v36, v52, v65);
          unint64_t v37 = *(void *)(v61 + 16);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            unint64_t v37 = sub_10002FDFC(0, *(void *)(v37 + 16) + 1, 1, v37, &qword_1000465B0, (uint64_t (*)(void))&type metadata accessor for REMSearchCriterion, (uint64_t (*)(void))&type metadata accessor for REMSearchCriterion);
            *(void *)(v61 + 16) = v37;
          }
          unint64_t v39 = *(void *)(v37 + 16);
          unint64_t v38 = *(void *)(v37 + 24);
          if (v39 >= v38 >> 1)
          {
            unint64_t v37 = sub_10002FDFC(v38 > 1, v39 + 1, 1, v37, &qword_1000465B0, (uint64_t (*)(void))&type metadata accessor for REMSearchCriterion, (uint64_t (*)(void))&type metadata accessor for REMSearchCriterion);
            *(void *)(v61 + 16) = v37;
          }
          *(void *)(v37 + 16) = v39 + 1;
          v28(v37 + v26 + v39 * v27, (uint64_t *)v55, v65);
          goto LABEL_8;
        }
        char v34 = sub_100035C70();
        swift_bridgeObjectRelease();
        if (v34) {
          goto LABEL_22;
        }
      }
LABEL_8:
      ++v10;

      a1 = v64;
      if (v63 == v10)
      {
        swift_bridgeObjectRelease();
        uint64_t v40 = *(void **)(v61 + 16);
        goto LABEL_30;
      }
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_10002F624(unint64_t a1, unint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_100035C00();
    swift_bridgeObjectRelease();
    if (v22) {
      goto LABEL_5;
    }
LABEL_3:
    if (a2 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v23 = sub_100035C00();
      swift_bridgeObjectRelease();
      if (v23) {
        goto LABEL_5;
      }
    }
    else if (*(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_5;
    }
    uint64_t v24 = a6;
    uint64_t v25 = a3[7];
    uint64_t v26 = a3[8];
    sub_10000A024(a3 + 4, v25);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v26 + 40))(a4, a5, v24, v25, v26);
  }
  if (!*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_3;
  }
LABEL_5:
  id v16 = a3 + 4;
  uint64_t v17 = a3[7];
  uint64_t v18 = a3[8];
  sub_10000A024(v16, v17);
  uint64_t v19 = (void *)swift_allocObject();
  v19[2] = a1;
  v19[3] = a8;
  v19[4] = a2;
  v19[5] = a5;
  v19[6] = a6;
  uint64_t v20 = *(void (**)(uint64_t, uint64_t (*)(uint64_t), void *, uint64_t, uint64_t))(v18 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  v20(a7, sub_100030EEC, v19, v17, v18);

  return swift_release();
}

uint64_t sub_10002F818(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(char *), uint64_t a6)
{
  uint64_t v17 = a6;
  uint64_t v18 = a5;
  uint64_t v8 = sub_100035320();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  id v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v12 = sub_100035310();
  unint64_t v20 = a2;
  swift_bridgeObjectRetain();
  sub_10000E464(v12);
  unint64_t v13 = v20;
  swift_beginAccess();
  uint64_t v14 = swift_bridgeObjectRetain();
  sub_10000F43C(v14, v13);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v15 = sub_1000352F0();
  uint64_t v19 = a4;
  swift_bridgeObjectRetain();
  sub_10000E44C(v15);
  sub_100035300();
  v18(v11);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_10002F9AC()
{
  sub_10000A4D4(v0 + 32);

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for TTRIntentsHandlerSpotlightDataSource()
{
  return self;
}

uint64_t sub_10002FA18(uint64_t a1)
{
  uint64_t v3 = *(void *)(*(void *)v1 + 56);
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  sub_10000A024((void *)(*(void *)v1 + 32), v3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 8))(a1, v3, v4);
}

void sub_10002FA78(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_10002FA9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

uint64_t sub_10002FAC0(unint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10002EED8(a1, a2, a3);
}

uint64_t sub_10002FAE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *(void *)(*(void *)v4 + 56);
  uint64_t v10 = *(void *)(*(void *)v4 + 64);
  sub_10000A024((void *)(*(void *)v4 + 32), v9);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56))(a1, a2, a3, a4, v9, v10);
}

uint64_t sub_10002FB6C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 56);
  uint64_t v2 = *(void *)(*(void *)v0 + 64);
  sub_10000A024((void *)(*(void *)v0 + 32), v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 72))(v1, v2);
}

uint64_t sub_10002FBC4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(*(void *)v2 + 56);
  uint64_t v6 = *(void *)(*(void *)v2 + 64);
  sub_10000A024((void *)(*(void *)v2 + 32), v5);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 80))(a1, a2, v5, v6);
}

uint64_t sub_10002FC34(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(*(void *)v2 + 56);
  uint64_t v6 = *(void *)(*(void *)v2 + 64);
  sub_10000A024((void *)(*(void *)v2 + 32), v5);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 88))(a1, a2, v5, v6);
}

uint64_t sub_10002FCA4(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_10002FDFC(a1, a2, a3, a4, &qword_1000465B0, (uint64_t (*)(void))&type metadata accessor for REMSearchCriterion, (uint64_t (*)(void))&type metadata accessor for REMSearchCriterion);
}

char *sub_10002FCC8(char *result, int64_t a2, char a3, char *a4)
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
      sub_100009F5C(&qword_100046B18);
      uint64_t v10 = (char *)swift_allocObject();
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
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
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
    sub_100031498(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_10002FDD8(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_10002FDFC(a1, a2, a3, a4, &qword_100046DF0, (uint64_t (*)(void))&type metadata accessor for REMNotificationIdentifier, (uint64_t (*)(void))&type metadata accessor for REMNotificationIdentifier);
}

uint64_t sub_10002FDFC(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void))
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
  sub_100009F5C(a5);
  uint64_t v15 = *(void *)(a6(0) - 8);
  uint64_t v16 = *(void *)(v15 + 72);
  unint64_t v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v18 = (void *)swift_allocObject();
  size_t v19 = j__malloc_size(v18);
  if (!v16 || (v19 - v17 == 0x8000000000000000 ? (BOOL v20 = v16 == -1) : (BOOL v20 = 0), v20))
  {
LABEL_29:
    uint64_t result = sub_100035BF0();
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
    sub_100031924(0, v13, v23, a4, a7);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v18;
}

uint64_t sub_10003007C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100030150(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10003160C((uint64_t)v12, *a3);
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
      sub_10003160C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000A4D4((uint64_t)v12);
  return v7;
}

uint64_t sub_100030150(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1000359C0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10003030C(a5, a6);
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
  uint64_t v8 = sub_100035AD0();
  if (!v8)
  {
    sub_100035BF0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100035C20();
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

uint64_t sub_10003030C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1000303A4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100030584(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100030584(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1000303A4(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10003051C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100035A90();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100035BF0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100035680();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100035C20();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100035BF0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10003051C(uint64_t a1, uint64_t a2)
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
  sub_100009F5C(&qword_100046DD8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100030584(char a1, int64_t a2, char a3, char *a4)
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
    sub_100009F5C(&qword_100046DD8);
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
  uint64_t result = sub_100035C20();
  __break(1u);
  return result;
}

uint64_t *sub_1000306D4(unint64_t a1)
{
  return sub_1000306FC(a1, (unint64_t *)&unk_100046800);
}

uint64_t *sub_1000306E8(unint64_t a1)
{
  return sub_1000306FC(a1, (unint64_t *)&qword_1000465D0);
}

uint64_t *sub_1000306FC(unint64_t a1, unint64_t *a2)
{
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v4 = sub_100035B90();
    if (v4) {
      goto LABEL_3;
    }
    return (uint64_t *)&_swiftEmptyArrayStorage;
  }
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4) {
    return (uint64_t *)&_swiftEmptyArrayStorage;
  }
LABEL_3:
  if (v4 <= 0)
  {
    size_t v5 = (uint64_t *)&_swiftEmptyArrayStorage;
  }
  else
  {
    sub_100009F5C(&qword_1000467F0);
    size_t v5 = (uint64_t *)swift_allocObject();
    int64_t v6 = j__malloc_size(v5);
    uint64_t v7 = v6 - 32;
    if (v6 < 32) {
      uint64_t v7 = v6 - 25;
    }
    v5[2] = v4;
    v5[3] = (2 * (v7 >> 3)) | 1;
  }
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_100030EFC((uint64_t)&v10, v5 + 4, v4, a1, a2);
  uint64_t result = (uint64_t *)sub_100014D3C();
  if (v8 == v4) {
    return v5;
  }
  __break(1u);
  return result;
}

uint64_t *sub_100030810(unint64_t a1)
{
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v2 = sub_100035B90();
    if (v2) {
      goto LABEL_3;
    }
    return _swiftEmptyArrayStorage;
  }
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    return _swiftEmptyArrayStorage;
  }
LABEL_3:
  if (v2 <= 0)
  {
    unint64_t v3 = _swiftEmptyArrayStorage;
  }
  else
  {
    sub_100009F5C(&qword_1000467F0);
    unint64_t v3 = (uint64_t *)swift_allocObject();
    int64_t v4 = j__malloc_size(v3);
    uint64_t v5 = v4 - 32;
    if (v4 < 32) {
      uint64_t v5 = v4 - 25;
    }
    v3[2] = v2;
    v3[3] = (2 * (v5 >> 3)) | 1;
  }
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_1000311C8((uint64_t)&v8, v3 + 4, v2, a1);
  uint64_t result = (uint64_t *)sub_100014D3C();
  if (v6 == v2) {
    return v3;
  }
  __break(1u);
  return result;
}

uint64_t (*sub_10003090C(uint64_t (**a1)(), unint64_t a2, uint64_t a3))()
{
  uint64_t v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_100030A28(v6, a2, a3);
  return sub_100030974;
}

uint64_t (*sub_100030978(void (**a1)(id *a1), unint64_t a2, uint64_t a3))()
{
  uint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_100030B48(v6, a2, a3);
  return sub_100030974;
}

void sub_1000309E0(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

uint64_t (*sub_100030A28(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  unint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)sub_100035AB0();
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
    *(void *)unint64_t v3 = v4;
    return sub_100031B38;
  }
  __break(1u);
  return result;
}

uint64_t sub_100030AA8()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100030AE0()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_100030B38(unint64_t a1, unint64_t a2)
{
  return sub_10002F624(a1, a2, *(void **)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 48), *(void *)(v2 + 56));
}

void (*sub_100030B48(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  unint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)sub_100035AB0();
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
    *(void *)unint64_t v3 = v4;
    return sub_100030BC8;
  }
  __break(1u);
  return result;
}

void sub_100030BC8(id *a1)
{
}

uint64_t sub_100030BD0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  sub_100009F5C(&qword_1000465B0);
  uint64_t v4 = sub_100035290();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_100038870;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v5 + 16))(v7 + v6, a1, v4);
  sub_100009F5C(&qword_100046DB8);
  swift_allocObject();
  uint64_t v8 = sub_100035560();
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v8;
  return result;
}

uint64_t sub_100030D1C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_100030BD0(a1, a2);
}

unint64_t sub_100030D50()
{
  unint64_t result = qword_100046DC8;
  if (!qword_100046DC8)
  {
    sub_10000A278(&qword_100046DC0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100046DC8);
  }
  return result;
}

uint64_t sub_100030DAC()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100030DE4(uint64_t *a1)
{
  return sub_10000E000(a1, *(void (**)(void *, void *))(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_100030E00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a1;
  *(void *)(v9 + 24) = a2;
  swift_retain();
  sub_10002E014(a6, sub_100014E44, v9);

  return swift_release();
}

uint64_t sub_100030E94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100030E00(a1, a2, a3, a4, *(void *)(v4 + 16), *(void *)(v4 + 24));
}

uint64_t sub_100030E9C()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100030EEC(uint64_t a1)
{
  return sub_10002F818(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void (**)(char *))(v1 + 40), *(void *)(v1 + 48));
}

uint64_t sub_100030EFC(uint64_t result, uint64_t *a2, uint64_t a3, unint64_t a4, unint64_t *a5)
{
  unint64_t v5 = a4;
  uint64_t v7 = a2;
  uint64_t v8 = (void *)result;
  if ((a4 & 0xC000000000000001) != 0)
  {
    unint64_t result = sub_100035B40();
    unint64_t v9 = 0;
    uint64_t v10 = 0;
    unint64_t v11 = 0;
    unint64_t v5 = result | 0x8000000000000000;
    if (v7) {
      goto LABEL_3;
    }
LABEL_36:
    int64_t v12 = 0;
    a3 = 0;
LABEL_45:
    *uint64_t v8 = v5;
    v8[1] = v9;
    v8[2] = v10;
    v8[3] = v12;
    v8[4] = v11;
    return a3;
  }
  uint64_t v20 = -1 << *(unsigned char *)(a4 + 32);
  unint64_t v9 = a4 + 64;
  uint64_t v21 = ~v20;
  uint64_t v22 = -v20;
  if (v22 < 64) {
    uint64_t v23 = ~(-1 << v22);
  }
  else {
    uint64_t v23 = -1;
  }
  unint64_t v11 = v23 & *(void *)(a4 + 64);
  uint64_t v10 = v21;
  if (!a2) {
    goto LABEL_36;
  }
LABEL_3:
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_45;
  }
  if (a3 < 0)
  {
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  uint64_t v24 = v10;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v25 = (unint64_t)(v10 + 64) >> 6;
  while ((v5 & 0x8000000000000000) != 0)
  {
    if (!sub_100035BC0())
    {
      a3 = v13;
LABEL_44:
      uint64_t v10 = v24;
      goto LABEL_45;
    }
    swift_unknownObjectRelease();
    sub_10000A498(0, a5);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    uint64_t v16 = v27;
    unint64_t result = swift_unknownObjectRelease();
    if (!v27) {
      goto LABEL_43;
    }
LABEL_8:
    ++v13;
    *v7++ = v16;
    if (v13 == a3) {
      goto LABEL_44;
    }
  }
  if (v11)
  {
    unint64_t v14 = __clz(__rbit64(v11));
    v11 &= v11 - 1;
    unint64_t v15 = v14 | (v12 << 6);
    goto LABEL_7;
  }
  int64_t v17 = v12 + 1;
  if (__OFADD__(v12, 1))
  {
    __break(1u);
    goto LABEL_47;
  }
  if (v17 >= v25) {
    goto LABEL_39;
  }
  unint64_t v18 = *(void *)(v9 + 8 * v17);
  if (v18) {
    goto LABEL_23;
  }
  v12 += 2;
  if (v17 + 1 >= v25)
  {
    unint64_t v11 = 0;
    int64_t v12 = v17;
    goto LABEL_43;
  }
  unint64_t v18 = *(void *)(v9 + 8 * v12);
  if (v18)
  {
LABEL_16:
    int64_t v17 = v12;
LABEL_23:
    unint64_t v11 = (v18 - 1) & v18;
    unint64_t v15 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
LABEL_7:
    unint64_t result = (uint64_t)*(id *)(*(void *)(v5 + 56) + 8 * v15);
    uint64_t v16 = result;
    if (!result) {
      goto LABEL_43;
    }
    goto LABEL_8;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v25) {
    goto LABEL_39;
  }
  unint64_t v18 = *(void *)(v9 + 8 * v19);
  if (v18)
  {
LABEL_22:
    int64_t v17 = v19;
    goto LABEL_23;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v25)
  {
    unint64_t v11 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_43;
  }
  unint64_t v18 = *(void *)(v9 + 8 * v12);
  if (v18) {
    goto LABEL_16;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v25)
  {
LABEL_39:
    unint64_t v11 = 0;
LABEL_43:
    a3 = v13;
    goto LABEL_44;
  }
  unint64_t v18 = *(void *)(v9 + 8 * v19);
  if (v18) {
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v25)
    {
      unint64_t v11 = 0;
      int64_t v12 = v25 - 1;
      goto LABEL_43;
    }
    unint64_t v18 = *(void *)(v9 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_23;
    }
  }
LABEL_48:
  __break(1u);
  return result;
}

uint64_t sub_1000311C8(uint64_t result, uint64_t *a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4;
  unint64_t v6 = a2;
  uint64_t v7 = (void *)result;
  if ((a4 & 0xC000000000000001) != 0)
  {
    unint64_t result = sub_100035B40();
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
    if (!sub_100035BD0())
    {
      a3 = v12;
LABEL_44:
      uint64_t v9 = v23;
      goto LABEL_45;
    }
    sub_10000A498(0, &qword_100046778);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    uint64_t v15 = v25;
    unint64_t result = swift_unknownObjectRelease();
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
    unint64_t result = (uint64_t)*(id *)(*(void *)(v4 + 48) + 8 * v14);
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

uint64_t sub_100031498(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_100035C20();
  __break(1u);
  return result;
}

uint64_t sub_100031590(uint64_t a1)
{
  return sub_10002E5CC(a1, *(void *)(v1 + 16), *(void **)(v1 + 24), *(void (**)(void))(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_1000315B4(uint64_t a1)
{
  return sub_10002EBA8(a1, *(void *)(v1 + 16), *(void (**)(void))(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_1000315C0()
{
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100031600(unint64_t a1, uint64_t a2)
{
  return sub_10002E4BC(a1, a2, *(void (**)(char *))(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32));
}

uint64_t sub_10003160C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10003166C()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000316B4(uint64_t a1)
{
  return sub_10002D040(a1, *(void *)(v1 + 16), *(void **)(v1 + 24), *(void (**)(unint64_t))(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_1000316D8()
{
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100031718(uint64_t a1)
{
  return sub_10002DD8C(a1, *(void *)(v1 + 16), *(uint64_t (**)(void))(v1 + 24));
}

unint64_t sub_100031724()
{
  unint64_t result = qword_100046DE0;
  if (!qword_100046DE0)
  {
    sub_100035280();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100046DE0);
  }
  return result;
}

void *sub_10003177C(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_16;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = 0;
      while ((a1 & 0xC000000000000001) != 0)
      {
        id v4 = (id)sub_100035AB0();
LABEL_9:
        unint64_t v5 = v4;
        unint64_t v6 = v3 + 1;
        if (__OFADD__(v3, 1)) {
          goto LABEL_15;
        }
        sub_10000A498(0, &qword_100046DE8);
        id v7 = [v5 list];
        id v8 = [v7 objectID];

        LOBYTE(v7) = sub_100035970();
        if (v7)
        {
          sub_100035AE0();
          sub_100035B10();
          sub_100035B20();
          sub_100035AF0();
        }
        else
        {
        }
        ++v3;
        if (v6 == v2) {
          return _swiftEmptyArrayStorage;
        }
      }
      if (v3 < *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        break;
      }
      __break(1u);
LABEL_15:
      __break(1u);
LABEL_16:
      uint64_t v2 = sub_100035C00();
      if (!v2) {
        return _swiftEmptyArrayStorage;
      }
    }
    id v4 = *(id *)(a1 + 8 * v3 + 32);
    goto LABEL_9;
  }
  return _swiftEmptyArrayStorage;
}

uint64_t sub_100031924(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
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
  uint64_t result = sub_100035C20();
  __break(1u);
  return result;
}

uint64_t sub_100031A80@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_100030BD0(a1, a2);
}

uint64_t sub_100031AB4(void (*a1)(char *), uint64_t a2)
{
  uint64_t v5 = *(uint64_t **)(v2 + 16);
  uint64_t v6 = *(void *)(v2 + 24);
  uint64_t v7 = *v5;
  swift_retain();
  sub_10001493C(v6, v7, a1, a2);

  return swift_release();
}

uint64_t sub_100031B20(uint64_t *a1)
{
  return sub_100030DE4(a1);
}

uint64_t sub_100031B3C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v30 = swift_allocObject();
  *(void *)(v30 + 16) = &_swiftEmptyArrayStorage;
  uint64_t v32 = swift_allocObject();
  *(void *)(v32 + 16) = &_swiftEmptyArrayStorage;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_100035C00();
    uint64_t v4 = result;
    if (!result) {
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v4) {
      goto LABEL_19;
    }
  }
  if (v4 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v6 = 0;
  unint64_t v7 = a1 & 0xC000000000000001;
  unint64_t v31 = a1;
  do
  {
    if (v7) {
      id v10 = (id)sub_100035AB0();
    }
    else {
      id v10 = *(id *)(a1 + 8 * v6 + 32);
    }
    uint64_t v9 = v10;
    uint64_t v11 = (void *)sub_1000358B0();
    if (v11)
    {
      id v8 = v11;
      sub_1000356A0();
      if (*(void *)((*(void *)(v30 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v30 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                          + 0x18) >> 1)
        sub_1000356F0();
      sub_100035700();
      sub_1000356E0();

      uint64_t v9 = v8;
    }
    else
    {
      id v12 = [v9 title];
      id v13 = [v12 spokenPhrase];

      uint64_t v14 = sub_100035630();
      uint64_t v16 = v15;

      unint64_t v17 = *(char **)(v32 + 16);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(void *)(v32 + 16) = v17;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        unint64_t v17 = sub_10002FCC8(0, *((void *)v17 + 2) + 1, 1, v17);
        *(void *)(v32 + 16) = v17;
      }
      unint64_t v20 = *((void *)v17 + 2);
      unint64_t v19 = *((void *)v17 + 3);
      if (v20 >= v19 >> 1)
      {
        unint64_t v17 = sub_10002FCC8((char *)(v19 > 1), v20 + 1, 1, v17);
        *(void *)(v32 + 16) = v17;
      }
      *((void *)v17 + 2) = v20 + 1;
      uint64_t v21 = &v17[16 * v20];
      *((void *)v21 + 4) = v14;
      *((void *)v21 + 5) = v16;
      a1 = v31;
    }
    ++v6;
  }
  while (v4 != v6);
LABEL_19:
  swift_bridgeObjectRelease();
  uint64_t v22 = (void *)swift_allocObject();
  v22[2] = v30;
  v22[3] = v32;
  v22[4] = a2;
  void v22[5] = a3;
  uint64_t v23 = v29[6];
  uint64_t v24 = v29[7];
  sub_10000A024(v29 + 3, v23);
  uint64_t v25 = (void *)swift_allocObject();
  v25[2] = v29;
  v25[3] = sub_100033164;
  v25[4] = v22;
  uint64_t v26 = *(void (**)(uint64_t (*)(unint64_t), void *, uint64_t, uint64_t))(v24 + 8);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  v26(sub_1000163D8, v25, v23, v24);
  swift_release();
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t sub_100031EA4()
{
  uint64_t v0 = sub_1000355A0();
  sub_10000A434(v0, qword_100046DF8);
  uint64_t v1 = sub_100009FEC(v0, (uint64_t)qword_100046DF8);
  if (qword_1000460A0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100009FEC(v0, (uint64_t)qword_1000472B0);
  unint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t sub_100031F6C(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *v2;
  v6[4] = a1;
  v6[5] = a2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 1107296256;
  v6[2] = sub_100032020;
  v6[3] = &unk_100042198;
  uint64_t v4 = _Block_copy(v6);
  swift_retain();
  [v3 getDeliveredNotificationsWithCompletionHandler:v4];
  _Block_release(v4);
  return swift_release();
}

uint64_t sub_100032020(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  sub_10000A498(0, &qword_100046EC0);
  uint64_t v2 = sub_1000356C0();
  swift_retain();
  v1(v2);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000320A4(unint64_t a1, void (**a2)(unsigned char *, uint64_t, uint64_t, uint64_t), uint64_t a3, uint64_t a4)
{
  uint64_t v72 = a4;
  uint64_t v7 = sub_100009F5C(&qword_100046EB8);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = &v63[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = sub_100035370();
  uint64_t v11 = *(char **)(v10 - 8);
  __chkstk_darwin(v10);
  id v13 = &v63[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v14);
  BOOL v85 = &v63[-v15];
  uint64_t v16 = sub_100009F5C(&qword_1000462C8);
  __chkstk_darwin(v16 - 8);
  int64_t v18 = &v63[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v19 = sub_1000354C0();
  uint64_t v83 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  id v91 = &v63[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v21);
  id v82 = &v63[-v22];
  if (a1 >> 62)
  {
LABEL_52:
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_100035C00();
  }
  else
  {
    uint64_t v23 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  uint64_t v93 = v19;
  uint64_t v90 = v23;
  uint64_t v71 = a3;
  if (v23)
  {
    os_log_type_t v84 = v13;
    uint64_t v69 = a2;
    unint64_t v89 = a1 & 0xC000000000000001;
    id v87 = (unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v11 + 48);
    id v79 = (void (**)(unsigned char *, unsigned char *, uint64_t))(v11 + 16);
    char v80 = (void (**)(unsigned char *, unsigned char *, uint64_t))(v11 + 32);
    uint64_t v78 = (uint64_t (**)(unsigned char *, uint64_t))(v11 + 88);
    int v77 = enum case for RDUserNotificationType.reminderAlarm(_:);
    int v75 = enum case for RDUserNotificationType.todayNotificationForSingleReminder(_:);
    int v73 = enum case for RDUserNotificationType.caldavSharedList(_:);
    int v70 = enum case for RDUserNotificationType.assignmentNotification(_:);
    int v68 = enum case for RDUserNotificationType.sharedListAddedReminderNotification(_:);
    int v67 = enum case for RDUserNotificationType.dueDateDeltaAlarm(_:);
    uint64_t v76 = (void (**)(unsigned char *, uint64_t))(v11 + 8);
    a2 = (void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v83 + 56);
    int v74 = (void (**)(unsigned char *, uint64_t))(v11 + 96);
    id v13 = (unsigned char *)(v83 + 32);
    id v86 = (unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v83 + 48);
    int v66 = enum case for RDUserNotificationType.todayNotification(_:);
    a3 = 4;
    int v65 = enum case for RDUserNotificationType.todayNotificationBadge(_:);
    int v64 = enum case for RDUserNotificationType.beforeFirstUnlock(_:);
    id v92 = (char *)&_swiftEmptyArrayStorage;
    unint64_t v88 = a1;
    id v81 = v9;
    while (1)
    {
      uint64_t v19 = a3 - 4;
      if (v89) {
        uint64_t v25 = (char *)sub_100035AB0();
      }
      else {
        uint64_t v25 = (char *)*(id *)(a1 + 8 * a3);
      }
      uint64_t v11 = v25;
      a1 = a3 - 3;
      if (__OFADD__(v19, 1))
      {
        __break(1u);
        goto LABEL_52;
      }
      id v26 = [v25 request];
      id v27 = [v26 content];

      id v28 = v27;
      sub_100035360();
      if ((*v87)(v9, 1, v10) == 1)
      {

        sub_10000A1C0((uint64_t)v9, &qword_100046EB8);
      }
      else
      {
        unint64_t v31 = v9;
        uint64_t v32 = a2;
        uint64_t v33 = v85;
        (*v80)(v85, v31, v10);
        char v34 = v84;
        (*v79)(v84, v33, v10);
        int v35 = (*v78)(v34, v10);
        if (v35 == v77)
        {
          (*v76)(v33, v10);

          (*v74)(v34, v10);
          uint64_t v30 = v93;
          (*(void (**)(unsigned char *, unsigned char *, uint64_t))v13)(v18, v34, v93);
          uint64_t v29 = 0;
          goto LABEL_22;
        }
        if (v35 == v75 || v35 == v73 || v35 == v70 || v35 == v68 || v35 == v67)
        {
          os_log_type_t v36 = *v76;
          (*v76)(v85, v10);

          v36(v84, v10);
          uint64_t v29 = 1;
          uint64_t v30 = v93;
LABEL_22:
          a2 = v32;
LABEL_23:
          uint64_t v9 = v81;
          goto LABEL_24;
        }
        a2 = v32;
        if (v35 == v66)
        {
          (*v76)(v85, v10);

          uint64_t v29 = 1;
          uint64_t v30 = v93;
          goto LABEL_23;
        }
        uint64_t v9 = v81;
        if (v35 != v65 && v35 != v64)
        {
          uint64_t result = sub_100035C60();
          __break(1u);
          return result;
        }
        (*v76)(v85, v10);
      }
      uint64_t v29 = 1;
      uint64_t v30 = v93;
LABEL_24:
      (*a2)(v18, v29, 1, v30);

      if ((*v86)(v18, 1, v30) == 1)
      {
        sub_10000A1C0((uint64_t)v18, &qword_1000462C8);
      }
      else
      {
        unint64_t v37 = *(void (**)(char *, unsigned char *, uint64_t))v13;
        unint64_t v38 = v82;
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))v13)(v82, v18, v30);
        v37(v91, v38, v30);
        unint64_t v39 = (unint64_t)v92;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v39 = sub_10002FDD8(0, *(void *)(v39 + 16) + 1, 1, v39);
        }
        unint64_t v41 = *(void *)(v39 + 16);
        unint64_t v40 = *(void *)(v39 + 24);
        id v92 = (char *)v39;
        if (v41 >= v40 >> 1) {
          id v92 = (char *)sub_10002FDD8(v40 > 1, v41 + 1, 1, (unint64_t)v92);
        }
        uint64_t v42 = v91;
        uint64_t v43 = v92;
        *((void *)v92 + 2) = v41 + 1;
        v37(&v43[((*(unsigned __int8 *)(v83 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v83 + 80))+ *(void *)(v83 + 72) * v41], v42, v93);
      }
      ++a3;
      BOOL v24 = a1 == v90;
      a1 = v88;
      if (v24)
      {
        swift_bridgeObjectRelease();
        a3 = v71;
        uint64_t v44 = v92;
        goto LABEL_37;
      }
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v44 = (char *)&_swiftEmptyArrayStorage;
LABEL_37:
  uint64_t v45 = v44;
  unint64_t v46 = sub_100035990();
  unint64_t v47 = v46;
  if (v46 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v48 = sub_100035C00();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v48 = *(void *)((v46 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v49 = *((void *)v45 + 2);
  if (v48 != v49)
  {
    if (qword_1000460C0 != -1) {
      swift_once();
    }
    uint64_t v50 = sub_1000355A0();
    sub_100009FEC(v50, (uint64_t)qword_100046DF8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v51 = sub_100035590();
    os_log_type_t v52 = sub_1000357A0();
    if (os_log_type_enabled(v51, v52))
    {
      uint64_t v53 = swift_slowAlloc();
      *(_DWORD *)uint64_t v53 = 134218240;
      v95[0] = v48;
      sub_1000359B0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v53 + 12) = 2048;
      v95[0] = v49;
      sub_1000359B0();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v51, v52, "Unable to fetch some reminders. reminders count doesn't match with reminderIDs count. {notificationIdentifiers.count: %ld, reminders.count: %ld}", (uint8_t *)v53, 0x16u);
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  if (qword_1000460C0 != -1) {
    swift_once();
  }
  uint64_t v54 = sub_1000355A0();
  sub_100009FEC(v54, (uint64_t)qword_100046DF8);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  uint64_t v55 = sub_100035590();
  os_log_type_t v56 = sub_1000357C0();
  if (os_log_type_enabled(v55, v56))
  {
    uint64_t v57 = swift_slowAlloc();
    uint64_t v93 = swift_slowAlloc();
    v95[0] = v93;
    *(_DWORD *)uint64_t v57 = 134218242;
    swift_bridgeObjectRelease();
    uint64_t v94 = v48;
    sub_1000359B0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v57 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v58 = sub_1000356D0();
    uint64_t v59 = a3;
    unint64_t v61 = v60;
    swift_bridgeObjectRelease();
    uint64_t v94 = sub_10003007C(v58, v61, v95);
    sub_1000359B0();
    swift_bridgeObjectRelease_n();
    a3 = v59;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v55, v56, "Retrieved %ld reminders from notification center {notificationIdentifiers: %s}", (uint8_t *)v57, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  ((void (*)(unint64_t))a3)(v47);
  return swift_bridgeObjectRelease();
}

uint64_t sub_100032DE0(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(unint64_t))
{
  uint64_t v5 = (void *)(a2 + 16);
  uint64_t v6 = (uint64_t *)(a3 + 16);
  unint64_t v7 = swift_bridgeObjectRetain();
  unint64_t v8 = (unint64_t)sub_1000331B0(v7, v5, v6);
  swift_bridgeObjectRelease();
  if (qword_1000460C0 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_1000355A0();
  sub_100009FEC(v9, (uint64_t)qword_100046DF8);
  swift_bridgeObjectRetain_n();
  uint64_t v10 = sub_100035590();
  os_log_type_t v11 = sub_1000357C0();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 134218242;
    uint64_t v17 = a4;
    if (v8 >> 62)
    {
      swift_bridgeObjectRetain();
      sub_100035C00();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    sub_1000359B0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2080;
    sub_10000A498(0, (unint64_t *)&unk_100046800);
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_1000356D0();
    unint64_t v15 = v14;
    swift_bridgeObjectRelease();
    sub_10003007C(v13, v15, &v18);
    sub_1000359B0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Got %ld matchingReminders matching searchTerms {matchingReminders: %s}", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v17(v8);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    a4(v8);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_100033080()
{
  sub_10000A4D4(v0 + 24);

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for TTRIntentsHandlerNotificationCenterDataSource()
{
  return self;
}

uint64_t sub_1000330E4()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10003311C()
{
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100033164(uint64_t a1)
{
  return sub_100032DE0(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void (**)(unint64_t))(v1 + 32));
}

uint64_t sub_100033170()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

void *sub_1000331B0(unint64_t a1, void *a2, uint64_t *a3)
{
  uint64_t v4 = a1;
  if (a1 >> 62) {
    goto LABEL_52;
  }
  uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_3:
  swift_beginAccess();
  swift_beginAccess();
  if (v5)
  {
    unint64_t v6 = 0;
    uint64_t v35 = v4 & 0xFFFFFFFFFFFFFF8;
    unint64_t v36 = v4 & 0xC000000000000001;
    uint64_t v33 = v4;
    uint64_t v34 = v4 + 32;
    uint64_t v30 = a2;
    uint64_t v32 = v5;
    while (1)
    {
      if (v36)
      {
        id v8 = (id)sub_100035AB0();
      }
      else
      {
        if (v6 >= *(void *)(v35 + 16)) {
          goto LABEL_49;
        }
        id v8 = *(id *)(v34 + 8 * v6);
      }
      uint64_t v9 = v8;
      BOOL v10 = __OFADD__(v6, 1);
      unint64_t v11 = v6 + 1;
      if (v10) {
        goto LABEL_50;
      }
      unint64_t v37 = v11;
      unint64_t v12 = *a2;
      swift_bridgeObjectRetain();
      id v13 = [v9 objectID];
      if (v12 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v14 = sub_100035C00();
        if (!v14) {
          goto LABEL_19;
        }
      }
      else
      {
        uint64_t v14 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (!v14) {
          goto LABEL_19;
        }
      }
      if ((v12 & 0xC000000000000001) != 0) {
        id v15 = (id)sub_100035AB0();
      }
      else {
        id v15 = *(id *)(v12 + 32);
      }
      uint64_t v16 = v15;
      sub_10000A498(0, &qword_100046778);
      uint64_t v4 = sub_100035970();

      if (v4)
      {

        swift_bridgeObjectRelease_n();
LABEL_41:
        uint64_t v7 = v32;
        uint64_t v4 = v33;
        unint64_t v6 = v37;
        sub_100035AE0();
        sub_100035B10();
        sub_100035B20();
        sub_100035AF0();
        goto LABEL_7;
      }
      if (v14 != 1)
      {
        if ((v12 & 0xC000000000000001) != 0)
        {
          uint64_t v24 = 1;
          while (1)
          {
            uint64_t v25 = sub_100035AB0();
            a2 = (void *)(v24 + 1);
            if (__OFADD__(v24, 1)) {
              break;
            }
            uint64_t v4 = v25;
            char v26 = sub_100035970();
            swift_unknownObjectRelease();
            if (v26) {
              goto LABEL_39;
            }
            ++v24;
            if (a2 == (void *)v14) {
              goto LABEL_38;
            }
          }
          __break(1u);
LABEL_49:
          __break(1u);
LABEL_50:
          __break(1u);
          goto LABEL_51;
        }
        uint64_t v27 = 5;
        while (1)
        {
          a2 = (void *)(v27 - 3);
          if (__OFADD__(v27 - 4, 1)) {
            break;
          }
          id v28 = *(id *)(v12 + 8 * v27);
          uint64_t v4 = sub_100035970();

          if (v4)
          {
LABEL_39:

            swift_bridgeObjectRelease_n();
LABEL_40:
            a2 = v30;
            goto LABEL_41;
          }
          ++v27;
          if (a2 == (void *)v14)
          {
LABEL_38:

            swift_bridgeObjectRelease();
            a2 = v30;
            goto LABEL_20;
          }
        }
LABEL_51:
        __break(1u);
LABEL_52:
        uint64_t v5 = sub_100035C00();
        goto LABEL_3;
      }
LABEL_19:

      swift_bridgeObjectRelease();
LABEL_20:
      swift_bridgeObjectRelease();
      uint64_t v17 = *a3;
      uint64_t v18 = *(void *)(*a3 + 16);
      if (v18)
      {
        swift_bridgeObjectRetain();
        uint64_t v19 = (void **)(v17 + 40);
        while (1)
        {
          uint64_t v21 = (uint64_t)*(v19 - 1);
          uint64_t v20 = *v19;
          swift_bridgeObjectRetain();
          id v22 = [v9 titleAsString];
          if (v22)
          {
            uint64_t v23 = v22;
            sub_100035630();

            v38._countAndFlagsBits = v21;
            v38._object = v20;
            LOBYTE(v23) = sub_100035650(v38);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (v23)
            {
              swift_bridgeObjectRelease();
              goto LABEL_40;
            }
          }
          else
          {
            swift_bridgeObjectRelease();
          }
          v19 += 2;
          if (!--v18)
          {

            swift_bridgeObjectRelease();
            a2 = v30;
            goto LABEL_6;
          }
        }
      }

LABEL_6:
      uint64_t v7 = v32;
      uint64_t v4 = v33;
      unint64_t v6 = v37;
LABEL_7:
      if (v6 == v7) {
        return &_swiftEmptyArrayStorage;
      }
    }
  }
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_100033594(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000335A4()
{
  return swift_release();
}

uint64_t sub_1000335B0()
{
  uint64_t v0 = sub_1000355A0();
  sub_10000A434(v0, qword_100046EC8);
  uint64_t v1 = sub_100009FEC(v0, (uint64_t)qword_100046EC8);
  if (qword_1000460A0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100009FEC(v0, (uint64_t)qword_1000472B0);
  unint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

void sub_100033678(void *a1, uint64_t a2, uint64_t a3)
{
  if (qword_1000460C8 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_1000355A0();
  unint64_t v6 = (uint8_t *)sub_100009FEC(v5, (uint64_t)qword_100046EC8);
  id v7 = a1;
  id v8 = sub_100035590();
  os_log_type_t v9 = sub_1000357C0();
  p_align = &stru_100044FE8.align;
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v73 = a3;
    unint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v72 = v6;
    int v74 = (id *)swift_slowAlloc();
    *(_DWORD *)unint64_t v11 = 136315138;
    id v12 = [v7 contactEventTrigger];
    sub_100009F5C(&qword_100046EF0);
    uint64_t v13 = sub_1000359A0();
    unint64_t v15 = v14;

    uint64_t v16 = v13;
    p_align = (_DWORD *)(&stru_100044FE8 + 24);
    sub_10003007C(v16, v15, (uint64_t *)&v74);
    sub_1000359B0();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "SiriKit asked for resolving contactEventTrigger {contactEventTrigger: %s}", v11, 0xCu);
    swift_arrayDestroy();
    unint64_t v6 = v72;
    swift_slowDealloc();
    a3 = v73;
    swift_slowDealloc();
  }
  else
  {
  }
  id v17 = [v7 *((SEL *)p_align + 174)];
  if (!v17) {
    goto LABEL_18;
  }
  id v18 = v17;
  id v19 = [v17 triggerContact];
  if (!v19)
  {

LABEL_18:
    uint64_t v34 = sub_100035590();
    os_log_type_t v35 = sub_1000357C0();
    if (os_log_type_enabled(v34, v35))
    {
      unint64_t v36 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v36 = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, v35, "Got nil contactEventTrigger. {result: .notRequired}", v36, 2u);
      swift_slowDealloc();
    }

    sub_10000A498(0, &qword_100046EF8);
    id v18 = [(id)swift_getObjCClassFromMetadata() notRequired];
    (*(void (**)(uint64_t, id))(a3 + 16))(a3, v18);
    goto LABEL_21;
  }
  uint64_t v20 = v19;
  id v21 = [v7 targetTask];
  if (!v21
    || (id v22 = v21, v23 = (void *)sub_1000358C0(), v22, !v23)
    || (id v24 = [v23 account],
        id v25 = [v24 capabilities],
        v24,
        v23,
        !v25))
  {
    uint64_t v30 = sub_100035590();
    os_log_type_t v31 = sub_1000357A0();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v32 = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "Unable to lookup capabilities. Ignoring contactEventTrigger. {result: .notRequired}", v32, 2u);
      swift_slowDealloc();
    }

    sub_10000A498(0, &qword_100046EF8);
    id v33 = [(id)swift_getObjCClassFromMetadata() notRequired];
    (*(void (**)(uint64_t, id))(a3 + 16))(a3, v33);

    id v18 = v33;
    goto LABEL_21;
  }
  if (![v25 supportsPersonTrigger])
  {
    unint64_t v37 = sub_100035590();
    os_log_type_t v38 = sub_1000357C0();
    if (os_log_type_enabled(v37, v38))
    {
      unint64_t v39 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v39 = 0;
      _os_log_impl((void *)&_mh_execute_header, v37, v38, "Reminder account doesn't support contactTrigger. {result: .unsupported(.accountDoesNotSupport)}", v39, 2u);
      swift_slowDealloc();
    }

    id v40 = [self unsupportedForReason:1];
    (*(void (**)(uint64_t, id))(a3 + 16))(a3, v40);

    id v18 = v40;
    goto LABEL_21;
  }
  id v26 = [v20 contactIdentifier];
  if (v26)
  {

    sub_100009F5C(&qword_1000467F0);
    uint64_t v27 = (_OWORD *)swift_allocObject();
    v27[1] = xmmword_100038880;
    *((void *)v27 + 4) = v20;
    int v74 = (id *)v27;
    sub_1000356E0();
    unint64_t v28 = (unint64_t)v74;
    id v29 = v20;
  }
  else
  {
    id v41 = [v20 alternatives];
    if (v41)
    {
      uint64_t v42 = v41;
      sub_10000A498(0, &qword_100046BC8);
      unint64_t v28 = sub_1000356C0();
    }
    else
    {
      unint64_t v28 = (unint64_t)&_swiftEmptyArrayStorage;
    }
  }
  if (v28 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v43 = sub_100035C00();
    swift_bridgeObjectRelease();
    id v71 = v25;
    if (v43) {
      goto LABEL_30;
    }
LABEL_38:
    swift_bridgeObjectRelease();
    unint64_t v47 = (unint64_t)&_swiftEmptyArrayStorage;
    goto LABEL_39;
  }
  uint64_t v43 = *(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10);
  id v71 = v25;
  if (!v43) {
    goto LABEL_38;
  }
LABEL_30:
  int v74 = (id *)&_swiftEmptyArrayStorage;
  sub_100035B00();
  if (v43 < 0)
  {
    __break(1u);
LABEL_63:
    int v70 = (objc_class *)sub_100035AB0();
LABEL_59:
    v58.super.Class isa = v70;
    swift_bridgeObjectRelease();
    sub_10000A498(0, &qword_100046EF8);
    id v59 = [(id)swift_getObjCClassFromMetadata() successWithResolvedContactEventTrigger:v58.super.isa];
    goto LABEL_60;
  }
  uint64_t v44 = 0;
  do
  {
    if ((v28 & 0xC000000000000001) != 0) {
      id v45 = (id)sub_100035AB0();
    }
    else {
      id v45 = *(id *)(v28 + 8 * v44 + 32);
    }
    unint64_t v46 = v45;
    ++v44;
    [objc_allocWithZone((Class)INContactEventTrigger) initWithTriggerContact:v45];

    sub_100035AE0();
    sub_100035B10();
    sub_100035B20();
    sub_100035AF0();
  }
  while (v43 != v44);
  unint64_t v47 = (unint64_t)v74;
  swift_bridgeObjectRelease();
  id v25 = v71;
LABEL_39:
  if (v47 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v48 = sub_100035C00();
    swift_bridgeObjectRelease();
    if (v48 >= 2) {
      goto LABEL_41;
    }
  }
  else
  {
    uint64_t v48 = *(void *)((v47 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v48 >= 2)
    {
LABEL_41:
      swift_bridgeObjectRetain_n();
      uint64_t v49 = sub_100035590();
      os_log_type_t v50 = sub_1000357C0();
      if (os_log_type_enabled(v49, v50))
      {
        unint64_t v51 = (uint8_t *)swift_slowAlloc();
        int v74 = (id *)swift_slowAlloc();
        *(_DWORD *)unint64_t v51 = 136315138;
        sub_10000A498(0, &qword_100046EE8);
        os_log_type_t v52 = v20;
        swift_bridgeObjectRetain();
        uint64_t v53 = sub_1000356D0();
        unint64_t v55 = v54;
        swift_bridgeObjectRelease();
        uint64_t v56 = v53;
        uint64_t v20 = v52;
        id v25 = v71;
        sub_10003007C(v56, v55, (uint64_t *)&v74);
        sub_1000359B0();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v49, v50, "Got >1 triggersToChoose {result: .disambiguation(%s)}", v51, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      sub_10000A498(0, &qword_100046EF8);
      ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
      sub_10000A498(0, &qword_100046EE8);
      v58.super.Class isa = sub_1000356B0().super.isa;
      swift_bridgeObjectRelease();
      id v59 = [ObjCClassFromMetadata disambiguationWithContactEventTriggersToDisambiguate:v58.super.isa];
LABEL_60:
      id v69 = v59;

LABEL_61:
      (*(void (**)(uint64_t, id))(a3 + 16))(a3, v69);

LABEL_21:
      return;
    }
  }
  if (v48 != 1)
  {
    swift_bridgeObjectRelease();
    int v66 = sub_100035590();
    os_log_type_t v67 = sub_1000357C0();
    if (os_log_type_enabled(v66, v67))
    {
      int v68 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int v68 = 0;
      _os_log_impl((void *)&_mh_execute_header, v66, v67, "Got 0 triggersToChoose {result: .unsupported}", v68, 2u);
      swift_slowDealloc();
    }

    sub_10000A498(0, &qword_100046EF8);
    id v69 = [(id)swift_getObjCClassFromMetadata() unsupported];
    goto LABEL_61;
  }
  swift_bridgeObjectRetain_n();
  unint64_t v60 = sub_100035590();
  os_log_type_t v61 = sub_1000357C0();
  if (!os_log_type_enabled(v60, v61))
  {

    swift_bridgeObjectRelease_n();
    unint64_t v62 = v47 & 0xC000000000000001;
    goto LABEL_56;
  }
  unint64_t v6 = (uint8_t *)swift_slowAlloc();
  unint64_t v28 = swift_slowAlloc();
  *(_DWORD *)unint64_t v6 = 138412290;
  unint64_t v62 = v47 & 0xC000000000000001;
  if ((v47 & 0xC000000000000001) != 0) {
    goto LABEL_65;
  }
  if (*(void *)((v47 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    uint64_t v63 = v20;
    for (id i = *(id *)(v47 + 32); ; id i = (id)sub_100035AB0())
    {
      id v65 = i;
      int v74 = (id *)i;
      sub_1000359B0();
      *(void *)unint64_t v28 = v65;
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v60, v61, "Got 1 triggersToChoose {result: .success(%@)}", v6, 0xCu);
      sub_100009F5C((uint64_t *)&unk_1000462F0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v20 = v63;
      id v25 = v71;
LABEL_56:
      if (v62) {
        break;
      }
      if (*(void *)((v47 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        int v70 = (objc_class *)*(id *)(v47 + 32);
        goto LABEL_59;
      }
      __break(1u);
LABEL_65:
      uint64_t v63 = v20;
    }
    goto LABEL_63;
  }
  __break(1u);
}

void sub_100034244(void *a1, uint64_t a2, uint64_t a3)
{
  if (qword_1000460C8 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_1000355A0();
  unint64_t v6 = (uint8_t *)sub_100009FEC(v5, (uint64_t)qword_100046EC8);
  id v7 = a1;
  id v8 = sub_100035590();
  os_log_type_t v9 = sub_1000357C0();
  p_align = &stru_100044FE8.align;
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v70 = a3;
    unint64_t v11 = (uint8_t *)swift_slowAlloc();
    id v69 = v6;
    id v71 = (void *)swift_slowAlloc();
    *(_DWORD *)unint64_t v11 = 136315138;
    id v12 = [v7 contactEventTrigger];
    sub_100009F5C(&qword_100046EF0);
    uint64_t v13 = sub_1000359A0();
    unint64_t v15 = v14;

    uint64_t v16 = v13;
    p_align = (_DWORD *)(&stru_100044FE8 + 24);
    sub_10003007C(v16, v15, (uint64_t *)&v71);
    sub_1000359B0();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "SiriKit asked for resolving contactEventTrigger {contactEventTrigger: %s}", v11, 0xCu);
    swift_arrayDestroy();
    unint64_t v6 = v69;
    swift_slowDealloc();
    a3 = v70;
    swift_slowDealloc();
  }
  else
  {
  }
  id v17 = [v7 *((SEL *)p_align + 174)];
  if (!v17) {
    goto LABEL_13;
  }
  id v18 = v17;
  id v19 = [v17 triggerContact];
  if (!v19)
  {

LABEL_13:
    uint64_t v27 = sub_100035590();
    os_log_type_t v28 = sub_1000357C0();
    if (os_log_type_enabled(v27, v28))
    {
      id v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v29 = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "Got nil contactEventTrigger. {result: .notRequired}", v29, 2u);
      swift_slowDealloc();
    }

    sub_10000A498(0, &qword_100046EE0);
    id v18 = [(id)swift_getObjCClassFromMetadata() notRequired];
    (*(void (**)(uint64_t, id))(a3 + 16))(a3, v18);
    goto LABEL_16;
  }
  uint64_t v20 = v19;
  id v21 = sub_100021954(v7);
  if (!v21)
  {
    uint64_t v30 = sub_100035590();
    os_log_type_t v31 = sub_1000357A0();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v32 = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "Unable to lookup capabilities. Ignoring contactEventTrigger. {result: .notRequired}", v32, 2u);
      swift_slowDealloc();
    }

    sub_10000A498(0, &qword_100046EE0);
    id v33 = [(id)swift_getObjCClassFromMetadata() notRequired];
    (*(void (**)(uint64_t, id))(a3 + 16))(a3, v33);

    id v18 = v33;
    goto LABEL_16;
  }
  id v22 = v21;
  if (([v21 supportsPersonTrigger] & 1) == 0)
  {
    uint64_t v34 = sub_100035590();
    os_log_type_t v35 = sub_1000357C0();
    if (os_log_type_enabled(v34, v35))
    {
      unint64_t v36 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v36 = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, v35, "Reminder account doesn't support contactTrigger. {result: .unsupported(.accountDoesNotSupport)}", v36, 2u);
      swift_slowDealloc();
    }

    id v37 = [self unsupportedForReason:1];
    (*(void (**)(uint64_t, id))(a3 + 16))(a3, v37);

    id v18 = v37;
    goto LABEL_16;
  }
  id v23 = [v20 contactIdentifier];
  if (v23)
  {

    sub_100009F5C(&qword_1000467F0);
    id v24 = (void *)swift_allocObject();
    *((_OWORD *)v24 + 1) = xmmword_100038880;
    v24[4] = v20;
    id v71 = v24;
    sub_1000356E0();
    unint64_t v25 = (unint64_t)v71;
    id v26 = v20;
  }
  else
  {
    id v38 = [v20 alternatives];
    if (v38)
    {
      unint64_t v39 = v38;
      sub_10000A498(0, &qword_100046BC8);
      unint64_t v25 = sub_1000356C0();
    }
    else
    {
      unint64_t v25 = (unint64_t)_swiftEmptyArrayStorage;
    }
  }
  if (v25 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v40 = sub_100035C00();
    swift_bridgeObjectRelease();
    int v68 = v22;
    if (v40)
    {
LABEL_28:
      id v71 = _swiftEmptyArrayStorage;
      sub_100035B00();
      if (v40 < 0)
      {
        __break(1u);
LABEL_60:
        os_log_type_t v67 = (objc_class *)sub_100035AB0();
LABEL_56:
        v55.super.Class isa = v67;
        swift_bridgeObjectRelease();
        sub_10000A498(0, &qword_100046EE0);
        id v56 = [(id)swift_getObjCClassFromMetadata() successWithResolvedContactEventTrigger:v55.super.isa];
        goto LABEL_57;
      }
      uint64_t v41 = 0;
      do
      {
        if ((v25 & 0xC000000000000001) != 0) {
          id v42 = (id)sub_100035AB0();
        }
        else {
          id v42 = *(id *)(v25 + 8 * v41 + 32);
        }
        uint64_t v43 = v42;
        ++v41;
        [objc_allocWithZone((Class)INContactEventTrigger) initWithTriggerContact:v42];

        sub_100035AE0();
        sub_100035B10();
        sub_100035B20();
        sub_100035AF0();
      }
      while (v40 != v41);
      unint64_t v44 = (unint64_t)v71;
      swift_bridgeObjectRelease();
      id v22 = v68;
      if (!(v44 >> 62)) {
        goto LABEL_35;
      }
LABEL_42:
      swift_bridgeObjectRetain();
      uint64_t v45 = sub_100035C00();
      swift_bridgeObjectRelease();
      if (v45 >= 2) {
        goto LABEL_36;
      }
      goto LABEL_43;
    }
  }
  else
  {
    uint64_t v40 = *(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10);
    int v68 = v22;
    if (v40) {
      goto LABEL_28;
    }
  }
  swift_bridgeObjectRelease();
  unint64_t v44 = (unint64_t)_swiftEmptyArrayStorage;
  if ((unint64_t)_swiftEmptyArrayStorage >> 62) {
    goto LABEL_42;
  }
LABEL_35:
  uint64_t v45 = *(void *)((v44 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v45 >= 2)
  {
LABEL_36:
    swift_bridgeObjectRetain_n();
    unint64_t v46 = sub_100035590();
    os_log_type_t v47 = sub_1000357C0();
    if (os_log_type_enabled(v46, v47))
    {
      uint64_t v48 = (uint8_t *)swift_slowAlloc();
      id v71 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v48 = 136315138;
      sub_10000A498(0, &qword_100046EE8);
      uint64_t v49 = v20;
      swift_bridgeObjectRetain();
      uint64_t v50 = sub_1000356D0();
      unint64_t v52 = v51;
      swift_bridgeObjectRelease();
      uint64_t v53 = v50;
      uint64_t v20 = v49;
      id v22 = v68;
      sub_10003007C(v53, v52, (uint64_t *)&v71);
      sub_1000359B0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v46, v47, "Got >1 triggersToChoose {result: .disambiguation(%s)}", v48, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    sub_10000A498(0, &qword_100046EE0);
    ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
    sub_10000A498(0, &qword_100046EE8);
    v55.super.Class isa = sub_1000356B0().super.isa;
    swift_bridgeObjectRelease();
    id v56 = [ObjCClassFromMetadata disambiguationWithContactEventTriggersToDisambiguate:v55.super.isa];
LABEL_57:
    id v66 = v56;

LABEL_58:
    (*(void (**)(uint64_t, id))(a3 + 16))(a3, v66);

LABEL_16:
    return;
  }
LABEL_43:
  if (v45 != 1)
  {
    swift_bridgeObjectRelease();
    uint64_t v63 = sub_100035590();
    os_log_type_t v64 = sub_1000357C0();
    if (os_log_type_enabled(v63, v64))
    {
      id v65 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v65 = 0;
      _os_log_impl((void *)&_mh_execute_header, v63, v64, "Got 0 triggersToChoose {result: .unsupported}", v65, 2u);
      swift_slowDealloc();
    }

    sub_10000A498(0, &qword_100046EE0);
    id v66 = [(id)swift_getObjCClassFromMetadata() unsupported];
    goto LABEL_58;
  }
  swift_bridgeObjectRetain_n();
  uint64_t v57 = sub_100035590();
  os_log_type_t v58 = sub_1000357C0();
  if (!os_log_type_enabled(v57, v58))
  {

    swift_bridgeObjectRelease_n();
    unint64_t v59 = v44 & 0xC000000000000001;
    goto LABEL_53;
  }
  unint64_t v6 = (uint8_t *)swift_slowAlloc();
  unint64_t v25 = swift_slowAlloc();
  *(_DWORD *)unint64_t v6 = 138412290;
  unint64_t v59 = v44 & 0xC000000000000001;
  if ((v44 & 0xC000000000000001) != 0) {
    goto LABEL_62;
  }
  if (*(void *)((v44 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    unint64_t v60 = v20;
    for (id i = *(id *)(v44 + 32); ; id i = (void *)sub_100035AB0())
    {
      unint64_t v62 = i;
      id v71 = i;
      sub_1000359B0();
      *(void *)unint64_t v25 = v62;
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v57, v58, "Got 1 triggersToChoose {result: .success(%@)}", v6, 0xCu);
      sub_100009F5C((uint64_t *)&unk_1000462F0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v20 = v60;
      id v22 = v68;
LABEL_53:
      if (v59) {
        break;
      }
      if (*(void *)((v44 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        os_log_type_t v67 = (objc_class *)*(id *)(v44 + 32);
        goto LABEL_56;
      }
      __break(1u);
LABEL_62:
      unint64_t v60 = v20;
    }
    goto LABEL_60;
  }
  __break(1u);
  sub_100034DA0();
}

uint64_t sub_100034DA0()
{
  return DateComponents.rem_allDayDateComponents()();
}

uint64_t sub_100034DB0()
{
  return DateComponents.smartlyCorrectedValue.getter();
}

NSDateComponents sub_100034DC0()
{
  return DateComponents._bridgeToObjectiveC()();
}

uint64_t sub_100034DD0()
{
  return static DateComponents._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100034DE0()
{
  return DateComponents.hour.getter();
}

uint64_t sub_100034DF0()
{
  return DateComponents.hour.setter();
}

uint64_t sub_100034E00()
{
  return DateComponents.minute.setter();
}

uint64_t sub_100034E10()
{
  return DateComponents.second.setter();
}

uint64_t sub_100034E20()
{
  return DateComponents.calendar.getter();
}

uint64_t sub_100034E30()
{
  return type metadata accessor for DateComponents();
}

uint64_t sub_100034E40()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_100034E50()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_100034E60()
{
  return URL.absoluteString.getter();
}

uint64_t sub_100034E70()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100034E80()
{
  return type metadata accessor for URL();
}

uint64_t sub_100034E90()
{
  return static Date.distantPast.getter();
}

uint64_t sub_100034EA0()
{
  return static Date.distantFuture.getter();
}

uint64_t sub_100034EB0()
{
  return Date.addingTimeInterval(_:)();
}

NSDate sub_100034EC0()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_100034ED0()
{
  return static Date.< infix(_:_:)();
}

uint64_t sub_100034EE0()
{
  return Date.timeIntervalSinceNow.getter();
}

uint64_t sub_100034EF0()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100034F00()
{
  return Date.init()();
}

uint64_t sub_100034F10()
{
  return type metadata accessor for Date();
}

uint64_t sub_100034F20()
{
  return UUID.init(uuidString:)();
}

NSUUID sub_100034F30()
{
  return UUID._bridgeToObjectiveC()();
}

uint64_t sub_100034F40()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100034F50()
{
  return type metadata accessor for UUID();
}

uint64_t sub_100034F60()
{
  return type metadata accessor for Locale();
}

uint64_t sub_100034F70()
{
  return Calendar.startOfDay(for:)();
}

uint64_t sub_100034F80()
{
  return Calendar.dateMatching(_:now:)();
}

NSCalendar sub_100034F90()
{
  return Calendar._bridgeToObjectiveC()();
}

uint64_t sub_100034FA0()
{
  return Calendar.date(byAdding:value:to:wrappingComponents:)();
}

uint64_t sub_100034FB0()
{
  return type metadata accessor for Calendar.Component();
}

uint64_t sub_100034FC0()
{
  return type metadata accessor for Calendar();
}

NSTimeZone sub_100034FD0()
{
  return TimeZone._bridgeToObjectiveC()();
}

uint64_t sub_100034FE0()
{
  return static TimeZone.current.getter();
}

uint64_t sub_100034FF0()
{
  return type metadata accessor for TimeZone();
}

uint64_t sub_100035000()
{
  return TTRListColors.defaultColor.unsafeMutableAddressor();
}

uint64_t sub_100035010()
{
  return TTRListColors.Color.nativeColor.getter();
}

uint64_t sub_100035020()
{
  return TTRListEditor.addNewReminder(with:title:)();
}

uint64_t sub_100035030()
{
  return type metadata accessor for TTRListEditor();
}

void sub_100035040()
{
}

uint64_t sub_100035050()
{
  return TTRWidgetCenter.shared.unsafeMutableAddressor();
}

uint64_t sub_100035060()
{
  return TTRListBadgeView.Shape.customSmartListInListRowView.unsafeMutableAddressor();
}

uint64_t sub_100035070()
{
  return type metadata accessor for TTRListBadgeView();
}

uint64_t sub_100035080()
{
  return TTROneshotEditing.init(item:saveRequest:undoManager:)();
}

uint64_t sub_100035090()
{
  return TTRReminderEditor.edit(userActivity:)();
}

uint64_t sub_1000350A0()
{
  return TTRReminderEditor.edit(contactHandles:)();
}

uint64_t sub_1000350B0()
{
  return TTRReminderEditor.edit(vehicleTrigger:)();
}

uint64_t sub_1000350C0()
{
  return TTRReminderEditor.edit(locationTrigger:)();
}

void sub_1000350D0(Swift::OpaquePointer_optional recurrenceRules, Swift::Bool shouldCopyRecurrenceEnd)
{
}

uint64_t sub_1000350E0()
{
  return TTRReminderEditor.edit(dueDateComponents:)();
}

uint64_t sub_1000350F0()
{
  return TTRReminderEditor.edit(url:)();
}

void sub_100035100(NSAttributedString_optional notes)
{
}

void sub_100035110(NSAttributedString title, Swift::String_optional locale, Swift::Bool registeringUndo)
{
}

uint64_t sub_100035120()
{
  return TTRReminderEditor.edit(toMatch:now:)();
}

uint64_t sub_100035130()
{
  return TTRReminderEditor.edit(completed:trackEditedUsing:)();
}

void sub_100035140(Swift::Bool isFlagged)
{
}

uint64_t sub_100035150()
{
  return type metadata accessor for TTRReminderEditor();
}

uint64_t sub_100035160(Swift::String _, Swift::String comment)
{
  return TTRLocalizedString(_:comment:)(_, comment)._countAndFlagsBits;
}

uint64_t sub_100035170()
{
  return TTRUndoableEditing.init(changeItem:undoManager:)();
}

uint64_t sub_100035180()
{
  return type metadata accessor for TTRRecurrenceEndModel();
}

uint64_t sub_100035190()
{
  return type metadata accessor for TTRCurrentTimeProvider();
}

uint64_t sub_1000351A0()
{
  return TTRRecurrenceRuleModel.init(temporalEventTrigger:timeProvider:)();
}

uint64_t sub_1000351B0()
{
  return type metadata accessor for TTRRecurrenceRuleModel();
}

uint64_t sub_1000351C0()
{
  return static TTRSearchResultCollector.promise(criteria:itemTypes:attributesToFetch:queue:)();
}

uint64_t sub_1000351D0()
{
  return type metadata accessor for TTRSearchResultCollector();
}

uint64_t sub_1000351E0()
{
  return TTRAccountsListsViewModel.AccountsCapabilities.supportsFlagged.unsafeMutableAddressor();
}

uint64_t sub_1000351F0()
{
  return TTRAccountsListsViewModel.AccountsCapabilities.supportsAssignment.unsafeMutableAddressor();
}

uint64_t sub_100035200()
{
  return static TTRAccountsListsViewModel.generateAccountsCapabilities(_:)();
}

uint64_t sub_100035210()
{
  return type metadata accessor for TTRAccountsListsViewModel();
}

uint64_t sub_100035220()
{
  return TTRIntentResultWarningBearing.warnings(store:accountCapabilties:)();
}

uint64_t sub_100035230()
{
  return REMFeatureFlags.isEnabled.getter();
}

uint64_t sub_100035240()
{
  return type metadata accessor for REMFeatureFlags();
}

uint64_t sub_100035250()
{
  return static REM_os_activity.labelUserAction(_:dso:)();
}

uint64_t sub_100035260()
{
  return type metadata accessor for ConfigurationList();
}

uint64_t sub_100035270()
{
  return static REMSearchCriterion.Inclusion.== infix(_:_:)();
}

uint64_t sub_100035280()
{
  return type metadata accessor for REMSearchCriterion.Inclusion();
}

uint64_t sub_100035290()
{
  return type metadata accessor for REMSearchCriterion();
}

uint64_t sub_1000352A0()
{
  return type metadata accessor for ConfigurationIntent();
}

uint64_t sub_1000352B0()
{
  return type metadata accessor for REMSearchableItemType();
}

uint64_t sub_1000352C0()
{
  return static REMSearchableListType.== infix(_:_:)();
}

uint64_t sub_1000352D0()
{
  return type metadata accessor for REMSearchableListType();
}

uint64_t sub_1000352E0()
{
  return static REMSiriSearchDataView.fetchLists(store:criteria:diffingAgainst:)();
}

uint64_t sub_1000352F0()
{
  return REMSiriSearchDataView.ListsResult.smartLists.getter();
}

uint64_t sub_100035300()
{
  return REMSiriSearchDataView.ListsResult.init(lists:smartLists:)();
}

uint64_t sub_100035310()
{
  return REMSiriSearchDataView.ListsResult.lists.getter();
}

uint64_t sub_100035320()
{
  return type metadata accessor for REMSiriSearchDataView.ListsResult();
}

uint64_t sub_100035330()
{
  return static REMSiriSearchDataView.fetchReminders(store:inCustomSmartList:diffingAgainst:)();
}

uint64_t sub_100035340()
{
  return static REMSiriSearchDataView.fetchReminders(store:criteria:fetchOptions:diffingAgainst:)();
}

uint64_t sub_100035350()
{
  return type metadata accessor for REMSiriSearchDataView();
}

uint64_t sub_100035360()
{
  return RDUserNotificationType.init(notificationContent:)();
}

uint64_t sub_100035370()
{
  return type metadata accessor for RDUserNotificationType();
}

uint64_t sub_100035380()
{
  return REMNavigationSpecifier.url.getter();
}

uint64_t sub_100035390()
{
  return type metadata accessor for REMNavigationSpecifier();
}

uint64_t sub_1000353A0()
{
  return REMNavigationSpecifier.init(_:)();
}

uint64_t sub_1000353B0()
{
  return type metadata accessor for REMStringMatchingStyle();
}

uint64_t sub_1000353C0()
{
  return static REMAccountsListDataView.fetchModel(store:diffingAgainst:options:)();
}

uint64_t sub_1000353D0()
{
  return static REMAccountsListDataView.FetchOptions.accountsOnly.getter();
}

uint64_t sub_1000353E0()
{
  return type metadata accessor for REMAccountsListDataView.FetchOptions();
}

uint64_t sub_1000353F0()
{
  return type metadata accessor for REMAccountsListDataView.Model.GroupChild();
}

uint64_t sub_100035400()
{
  return type metadata accessor for REMAccountsListDataView.Model.AccountChild();
}

uint64_t sub_100035410()
{
  return REMAccountsListDataView.Model.Group.lists.getter();
}

uint64_t sub_100035420()
{
  return type metadata accessor for REMAccountsListDataView.Model.Group();
}

uint64_t sub_100035430()
{
  return REMAccountsListDataView.Model.Account.account.getter();
}

uint64_t sub_100035440()
{
  return REMAccountsListDataView.Model.Account.children.getter();
}

uint64_t sub_100035450()
{
  return type metadata accessor for REMAccountsListDataView.Model.Account();
}

uint64_t sub_100035460()
{
  return REMAccountsListDataView.Model.accounts.getter();
}

uint64_t sub_100035470()
{
  return type metadata accessor for REMAccountsListDataView.Model();
}

uint64_t sub_100035480()
{
  return REMAccountsListDataView.Result.model.getter();
}

uint64_t sub_100035490()
{
  return type metadata accessor for REMAccountsListDataView.Result();
}

uint64_t sub_1000354A0()
{
  return type metadata accessor for REMAccountsListDataView();
}

uint64_t sub_1000354B0()
{
  return REMNotificationIdentifier.init(requestIdentifier:)();
}

uint64_t sub_1000354C0()
{
  return type metadata accessor for REMNotificationIdentifier();
}

uint64_t sub_1000354D0()
{
  return ConfigurationIntentResponse.__allocating_init(code:userActivity:)();
}

uint64_t sub_1000354E0()
{
  return type metadata accessor for ConfigurationIntentResponse();
}

uint64_t sub_1000354F0()
{
  return zalgo.getter();
}

uint64_t sub_100035500()
{
  return static Promise.all(_:)();
}

uint64_t sub_100035510()
{
  return static Promise.all<A>(_:)();
}

uint64_t sub_100035520()
{
  return static Promise.zip<A, B>(_:_:)();
}

uint64_t sub_100035530()
{
  return dispatch thunk of Promise.then<A>(on:closure:)();
}

uint64_t sub_100035540()
{
  return dispatch thunk of Promise.error(on:closure:)();
}

uint64_t sub_100035550()
{
  return Promise.init(value:)();
}

uint64_t sub_100035560()
{
  return Promise.init(resolver:)();
}

uint64_t sub_100035570()
{
  return static Analytics.postEvent(_:payload:duration:)();
}

uint64_t sub_100035580()
{
  return type metadata accessor for Analytics();
}

uint64_t sub_100035590()
{
  return Logger.logObject.getter();
}

uint64_t sub_1000355A0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_1000355B0()
{
  return Logger.init(_:)();
}

uint64_t sub_1000355C0()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000355D0()
{
  return Dictionary.description.getter();
}

uint64_t sub_1000355E0()
{
  return Dictionary.Index._asCocoa.modify();
}

uint64_t sub_1000355F0()
{
  return BidirectionalCollection<>.joined(separator:)();
}

NSString sub_100035600()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100035610()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100035620()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100035630()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100035640()
{
  return String.init<A>(describing:)();
}

BOOL sub_100035650(Swift::String a1)
{
  return String.fuzzyMatch(_:)(a1);
}

uint64_t sub_100035660()
{
  return String.speakableString.getter();
}

uint64_t sub_100035670()
{
  return String.hash(into:)();
}

Swift::Int sub_100035680()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100035690()
{
  return Sequence.unique<A>(by:)();
}

uint64_t sub_1000356A0()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_1000356B0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_1000356C0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000356D0()
{
  return Array.description.getter();
}

uint64_t sub_1000356E0()
{
  return specialized Array._endMutation()();
}

uint64_t sub_1000356F0()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100035700()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100035710()
{
  return Set.init(minimumCapacity:)();
}

uint64_t sub_100035720()
{
  return INTaskList.remList(store:)();
}

uint64_t sub_100035730()
{
  return INTaskList.init(smartList:reminders:)();
}

unsigned __int8 sub_100035740()
{
  return INTaskList.decodeIdentifier()();
}

uint64_t sub_100035750()
{
  return INTaskList.init(list:includeReminders:)();
}

uint64_t sub_100035760()
{
  return INTaskList.init(list:reminders:)();
}

uint64_t sub_100035770()
{
  return INTaskList.listID.getter();
}

uint64_t sub_100035780()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_100035790()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_1000357A0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_1000357B0()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_1000357C0()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_1000357D0()
{
  return type metadata accessor for NSUserActivity.ExtractedInfo();
}

uint64_t sub_1000357E0()
{
  return NSUserActivity.ttrExtractedInfo.getter();
}

uint64_t sub_1000357F0()
{
  return REMSmartListType.color.getter();
}

uint64_t sub_100035800()
{
  return REMSmartListType.glyph.getter();
}

uint64_t sub_100035810()
{
  return REMSmartListType.title.getter();
}

uint64_t sub_100035820()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_100035830()
{
  return REMListBadgeEmblem.image.getter();
}

uint64_t sub_100035840()
{
  return INTemporalEventTrigger.dueDateComponents(timeProvider:)();
}

uint64_t sub_100035850()
{
  return INTemporalEventTrigger.validate(timeProvider:)();
}

uint64_t sub_100035860()
{
  return REMAlarmVehicleTrigger.init(spatialEventTrigger:)();
}

uint64_t sub_100035870()
{
  return REMAlarmLocationTrigger.init(spatialEventTrigger:)();
}

uint64_t sub_100035880()
{
  return REMSmartListCustomContext.filter.getter();
}

uint64_t sub_100035890()
{
  return INSearchForNotebookItemsIntent.isTodayQuery(timeProvider:)();
}

uint64_t sub_1000358A0()
{
  return static INTask.disambiguateWithIncompleteReminders<A>(store:)();
}

uint64_t sub_1000358B0()
{
  return INTask.reminderID.getter();
}

uint64_t sub_1000358C0()
{
  return INTask.remReminder(store:)();
}

uint64_t sub_1000358D0()
{
  return INTask.init(reminderChangeItem:)();
}

uint64_t sub_1000358E0()
{
  return static INTask.augmentWithSubtasks(reminders:)();
}

uint64_t sub_1000358F0()
{
  return INTask.init(reminder:)();
}

unint64_t sub_100035900()
{
  return (unint64_t)UIView.snapshotImage()();
}

void sub_100035910()
{
}

uint64_t sub_100035920()
{
  return REMList.accountCapabilities.getter();
}

uint64_t sub_100035930()
{
  return INPerson.flattenedEmails.getter();
}

uint64_t sub_100035940()
{
  return INPerson.flattenedPhones.getter();
}

uint64_t sub_100035950()
{
  return INPerson.contactRepresentation(contactStore:)();
}

Swift::Int sub_100035960(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_100035970()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_100035980()
{
  return REMColor.nativeColor.getter();
}

uint64_t sub_100035990()
{
  return REMStore.fetchReminders(notificationIdentifiers:)();
}

uint64_t sub_1000359A0()
{
  return Optional.descriptionOrNil.getter();
}

uint64_t sub_1000359B0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_1000359C0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_1000359D0()
{
  return StringProtocol.caseInsensitiveCompare<A>(_:)();
}

uint64_t sub_1000359E0()
{
  return StringProtocol.range<A>(of:options:range:locale:)();
}

uint64_t sub_1000359F0()
{
  return _HashTable.occupiedBucket(after:)();
}

uint64_t sub_100035A00()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t sub_100035A10()
{
  return __CocoaSet.makeIterator()();
}

uint64_t sub_100035A20()
{
  return __CocoaSet.count.getter();
}

uint64_t sub_100035A30()
{
  return __CocoaSet.member(for:)();
}

uint64_t sub_100035A40()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t sub_100035A50()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_100035A60()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_100035A70()
{
  return static _SetStorage.convert(_:capacity:)();
}

uint64_t sub_100035A80()
{
  return static _SetStorage.allocate(capacity:)();
}

uint64_t sub_100035A90()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100035AA0()
{
  return StaticString.description.getter();
}

uint64_t sub_100035AB0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100035AC0()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100035AD0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100035AE0()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_100035AF0()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_100035B00()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_100035B10()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_100035B20()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100035B30()
{
  return __CocoaDictionary.startIndex.getter();
}

uint64_t sub_100035B40()
{
  return __CocoaDictionary.makeIterator()();
}

uint64_t sub_100035B50()
{
  return __CocoaDictionary.Index.dictionary.getter();
}

uint64_t sub_100035B60()
{
  return __CocoaDictionary.Index.handleBitPattern.getter();
}

uint64_t sub_100035B70()
{
  return __CocoaDictionary.Index.age.getter();
}

uint64_t sub_100035B80()
{
  return __CocoaDictionary.Index.key.getter();
}

uint64_t sub_100035B90()
{
  return __CocoaDictionary.count.getter();
}

uint64_t sub_100035BA0()
{
  return __CocoaDictionary.index(after:)();
}

uint64_t sub_100035BB0()
{
  return __CocoaDictionary.value(at:)();
}

uint64_t sub_100035BC0()
{
  return __CocoaDictionary.Iterator.next()();
}

uint64_t sub_100035BD0()
{
  return __CocoaDictionary.Iterator.nextKey()();
}

uint64_t sub_100035BE0()
{
  return __CocoaDictionary.formIndex(after:isUnique:)();
}

uint64_t sub_100035BF0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100035C00()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100035C10()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100035C20()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100035C40()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_100035C50()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t sub_100035C60()
{
  return _diagnoseUnexpectedEnumCase<A>(type:)();
}

uint64_t sub_100035C70()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100035C80()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100035C90()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_100035CA0()
{
  return Error.rem_errorDescription.getter();
}

uint64_t sub_100035CB0()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100035CC0()
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

void bzero(void *a1, size_t a2)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
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

uint64_t rdi_os_crash()
{
  return _rdi_os_crash();
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
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

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
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

uint64_t swift_projectBox()
{
  return _swift_projectBox();
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

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_all(void *a1, const char *a2, ...)
{
  return _[a1 all];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}