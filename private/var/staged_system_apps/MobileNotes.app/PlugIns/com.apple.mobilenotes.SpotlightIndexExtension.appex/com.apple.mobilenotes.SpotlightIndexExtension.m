void sub_100003874(id a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t vars8;

  +[ICNoteContext startSharedContextWithOptions:8456256];
  v5 = +[ICSearchIndexer sharedIndexer];
  v1 = +[ICNoteContext sharedContext];
  v2 = [v1 persistentContainer];
  v3 = +[ICNoteContext initializeSearchIndexerDataSourceWithPersistentContainer:v2];
  [v5 addDataSource:v3];

  v4 = objc_alloc_init((Class)ICHTMLSearchIndexerDataSource);
  [v5 addDataSource:v4];
  [v5 setRetryOnErrors:0];
}

void sub_100003A78(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = os_log_create("com.apple.notes", "SearchIndexer");
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000064F0((uint64_t)v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    sub_1000064B0();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100003C30(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = os_log_create("com.apple.notes", "SearchIndexer");
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100006670(a1, (uint64_t)v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    sub_1000065E0(a1, v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t ICCloudSyncingObject.MoveAction.Types.init(fromParentObject:toParentObject:)(void *a1, void *a2)
{
  return sub_100005B10(a1, a2);
}

unint64_t ICCloudSyncingObject.MoveAction.Types.init(rawValue:)(unint64_t a1)
{
  return sub_100005CD8(a1);
}

BOOL sub_1000042F4(void *a1, void *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_100004308()
{
  Swift::UInt v1 = *v0;
  sub_100006890();
  sub_1000068A0(v1);
  return sub_1000068B0();
}

void sub_100004350()
{
  sub_1000068A0(*v0);
}

Swift::Int sub_10000437C()
{
  Swift::UInt v1 = *v0;
  sub_100006890();
  sub_1000068A0(v1);
  return sub_1000068B0();
}

unint64_t sub_1000043C0@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_100005CD8(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_1000043F4(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t ICCloudSyncingObject.MoveAction.type.getter()
{
  return *(void *)(v0 + OBJC_IVAR___ICCloudSyncingObjectMoveAction_type);
}

id ICCloudSyncingObject.MoveAction.object.getter()
{
  return *(id *)(v0 + OBJC_IVAR___ICCloudSyncingObjectMoveAction_object);
}

id ICCloudSyncingObject.MoveAction.fromParentObject.getter()
{
  return *(id *)(v0 + OBJC_IVAR___ICCloudSyncingObjectMoveAction_fromParentObject);
}

id ICCloudSyncingObject.MoveAction.toParentObject.getter()
{
  return *(id *)(v0 + OBJC_IVAR___ICCloudSyncingObjectMoveAction_toParentObject);
}

uint64_t ICCloudSyncingObject.MoveAction.isCopy.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR___ICCloudSyncingObjectMoveAction_isCopy);
}

id ICCloudSyncingObject.MoveAction.__allocating_init(type:object:fromParentObject:toParentObject:isCopy:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  v11 = objc_allocWithZone(v5);
  *(void *)&v11[OBJC_IVAR___ICCloudSyncingObjectMoveAction_type] = a1;
  *(void *)&v11[OBJC_IVAR___ICCloudSyncingObjectMoveAction_object] = a2;
  *(void *)&v11[OBJC_IVAR___ICCloudSyncingObjectMoveAction_fromParentObject] = a3;
  *(void *)&v11[OBJC_IVAR___ICCloudSyncingObjectMoveAction_toParentObject] = a4;
  v11[OBJC_IVAR___ICCloudSyncingObjectMoveAction_isCopy] = a5;
  v13.receiver = v11;
  v13.super_class = v5;
  return [super init];
}

id ICCloudSyncingObject.MoveAction.init(type:object:fromParentObject:toParentObject:isCopy:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v5[OBJC_IVAR___ICCloudSyncingObjectMoveAction_type] = a1;
  *(void *)&v5[OBJC_IVAR___ICCloudSyncingObjectMoveAction_object] = a2;
  *(void *)&v5[OBJC_IVAR___ICCloudSyncingObjectMoveAction_fromParentObject] = a3;
  *(void *)&v5[OBJC_IVAR___ICCloudSyncingObjectMoveAction_toParentObject] = a4;
  v5[OBJC_IVAR___ICCloudSyncingObjectMoveAction_isCopy] = a5;
  v13.receiver = v5;
  v13.super_class = ObjectType;
  return [super init];
}

id ICCloudSyncingObject.MoveAction.__allocating_init(object:fromParentObject:toParentObject:isCopy:)(void *a1, void *a2, void *a3, char a4)
{
  id v9 = objc_allocWithZone(v4);
  if (!a2)
  {

    a1 = a3;
LABEL_8:

    swift_getObjectType();
    swift_deallocPartialClassInstance();
    return 0;
  }
  if (!a3)
  {

    goto LABEL_8;
  }
  id v10 = a3;
  id v11 = a2;
  uint64_t v12 = sub_100005B10(v11, v10);
  if (v13)
  {

    goto LABEL_8;
  }
  id v14 = [v9 initWithType:v12 object:a1 fromParentObject:v11 toParentObject:v10 isCopy:a4 & 1];

  return v14;
}

id ICCloudSyncingObject.MoveAction.init(object:fromParentObject:toParentObject:isCopy:)(void *a1, void *a2, void *a3, char a4)
{
  v6 = a1;
  if (!a2)
  {

    v6 = a3;
LABEL_8:

    swift_getObjectType();
    swift_deallocPartialClassInstance();
    return 0;
  }
  if (!a3)
  {

    goto LABEL_8;
  }
  id v8 = a2;
  id v9 = a3;
  uint64_t v10 = sub_100005B10(v8, v9);
  if (v11)
  {

    goto LABEL_8;
  }
  id v12 = [v4 initWithType:v10 object:v6 fromParentObject:v8 toParentObject:v9 isCopy:a4 & 1];

  return v12;
}

id ICCloudSyncingObject.MoveAction.__allocating_init(folder:toParentObject:isCopy:)(void *a1, void *a2, char a3)
{
  char v4 = v3;
  id v8 = objc_allocWithZone(v4);
  id v9 = [a1 parent];
  if (!v9) {
    id v9 = [a1 account];
  }
  id v10 = [v8 initWithObject:a1 fromParentObject:v9 toParentObject:a2 isCopy:a3 & 1];

  return v10;
}

id ICCloudSyncingObject.MoveAction.init(folder:toParentObject:isCopy:)(void *a1, void *a2, char a3)
{
  char v4 = v3;
  id v8 = [a1 parent];
  if (!v8) {
    id v8 = [a1 account];
  }
  id v9 = [v4 initWithObject:a1 fromParentObject:v8 toParentObject:a2 isCopy:a3 & 1];

  return v9;
}

id ICCloudSyncingObject.MoveAction.__allocating_init(note:toFolder:isCopy:)(void *a1, void *a2, char a3)
{
  id v7 = objc_allocWithZone(v3);
  id v8 = [a1 folder];
  id v9 = [v7 initWithObject:a1 fromParentObject:v8 toParentObject:a2 isCopy:a3 & 1];

  return v9;
}

id ICCloudSyncingObject.MoveAction.init(note:toFolder:isCopy:)(void *a1, void *a2, char a3)
{
  id v7 = [a1 folder];
  id v8 = [v3 initWithObject:a1 fromParentObject:v7 toParentObject:a2 isCopy:a3 & 1];

  return v8;
}

id ICCloudSyncingObject.MoveAction.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

void ICCloudSyncingObject.MoveAction.init()()
{
}

id ICCloudSyncingObject.MoveAction.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return [super dealloc];
}

Swift::Void __swiftcall ICCloudSyncingObject.persistParticipantActivityEvents(oldShare:newShare:)(CKShare_optional oldShare, CKShare_optional newShare)
{
  id v3 = *(void **)&oldShare.is_nil;
  Class isa = oldShare.value.super.super.isa;
  uint64_t v38 = sub_1000061A0(&qword_10000C528);
  uint64_t v5 = *(void *)(v38 - 8);
  ((void (*)(void))__chkstk_darwin)();
  id v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000061A0(&qword_10000C530);
  uint64_t v9 = ((uint64_t (*)(void))__chkstk_darwin)();
  char v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v37 = (char *)&v32 - v12;
  if (isa)
  {
    id v13 = [(objc_class *)isa ic_nonCurrentUserParticipants];
    sub_100006434(0, &qword_10000C550);
    unint64_t v14 = sub_1000067F0();

    if ((v14 & 0x8000000000000000) != 0) {
      goto LABEL_9;
    }
  }
  else
  {
    unint64_t v14 = (unint64_t)&_swiftEmptyArrayStorage;
    if (((unint64_t)&_swiftEmptyArrayStorage & 0x8000000000000000) != 0) {
      goto LABEL_9;
    }
  }
  if ((v14 & 0x4000000000000000) == 0)
  {
    uint64_t v15 = v14 & 0xFFFFFFFFFFFFFF8;
    if (!v3) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
LABEL_9:
  uint64_t v15 = (uint64_t)sub_100005A18(v14);
  swift_bridgeObjectRelease();
  if (!v3)
  {
LABEL_10:
    unint64_t v17 = (unint64_t)&_swiftEmptyArrayStorage;
    v32 = v2;
    if (((unint64_t)&_swiftEmptyArrayStorage & 0x8000000000000000) != 0) {
      goto LABEL_18;
    }
    goto LABEL_11;
  }
LABEL_7:
  id v16 = [v3 ic_nonCurrentUserParticipants];
  sub_100006434(0, &qword_10000C550);
  unint64_t v17 = sub_1000067F0();

  v32 = v2;
  if ((v17 & 0x8000000000000000) != 0) {
    goto LABEL_18;
  }
LABEL_11:
  if ((v17 & 0x4000000000000000) == 0)
  {
    uint64_t v18 = v17 & 0xFFFFFFFFFFFFFF8;
    goto LABEL_13;
  }
LABEL_18:
  uint64_t v18 = (uint64_t)sub_100005A18(v17);
  swift_bridgeObjectRelease();
LABEL_13:
  v39[0] = v18;
  v39[4] = v15;
  sub_1000061A0(&qword_10000C538);
  sub_1000063F0(&qword_10000C540, &qword_10000C538);
  sub_10000622C();
  sub_1000067E0();
  swift_release();
  swift_release();
  uint64_t v19 = v38;
  v34 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
  uint64_t v35 = v5 + 16;
  v34(v11, v7, v38);
  sub_1000063F0(&qword_10000C558, &qword_10000C528);
  sub_100006800();
  v20 = *(void (**)(char *, uint64_t))(v5 + 8);
  uint64_t v36 = v5 + 8;
  v33 = v20;
  v20(v7, v19);
  *(void *)&v11[*(int *)(v8 + 36)] = v39[0];
  uint64_t v21 = (uint64_t)v37;
  sub_100006294((uint64_t)v11, (uint64_t)v37);
  v22 = (uint64_t *)(v21 + *(int *)(v8 + 36));
  uint64_t v23 = *v22;
  sub_100006810();
  v24 = v32;
  if (v23 != v39[0])
  {
    do
    {
      v25 = (void (*)(void *, void))sub_100006830();
      v27 = *(void **)(v26 + 8);
      int v28 = *(unsigned __int8 *)(v26 + 25);
      id v29 = v27;
      v25(v39, 0);
      v34(v7, v37, v38);
      sub_100006820();
      v33(v7, v38);
      v30 = &selRef_persistRemoveParticipantActivityEventForObject_participant_;
      if (!v28) {
        v30 = &selRef_persistAddParticipantActivityEventForObject_participant_;
      }

      uint64_t v21 = (uint64_t)v37;
      uint64_t v31 = *v22;
      sub_100006810();
    }
    while (v31 != v39[0]);
  }
  sub_100006304(v21, &qword_10000C530);
}

Swift::Void __swiftcall ICCloudSyncingObject.persistJoinActivityEvent()()
{
}

Swift::Void __swiftcall ICCloudSyncingObject.persistLeaveActivityEvent()()
{
}

uint64_t sub_1000053BC(unsigned int *a1)
{
  uint64_t v18 = a1;
  uint64_t v19 = sub_1000067A0();
  uint64_t v2 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  char v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000067B0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000061A0(&qword_10000C560);
  __chkstk_darwin(v9 - 8);
  char v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000067D0();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v16 = v1;
  sub_1000067C0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1) {
    return sub_100006304((uint64_t)v11, &qword_10000C560);
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v11, v12);
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v8, v15, v12);
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *v18, v5);
  sub_100006790();

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v19);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

uint64_t sub_100005710(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_100006870();
    unint64_t result = swift_bridgeObjectRelease();
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
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_100006870();
      unint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_1000063F0(&qword_10000C5A0, &qword_10000C538);
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            sub_1000061A0(&qword_10000C538);
            uint64_t v10 = sub_1000058E0(v13, i, a3);
            id v12 = *v11;
            ((void (*)(void (**)(id *), void))v10)(v13, 0);
            *(void *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_100006434(0, &qword_10000C550);
        swift_arrayInitWithCopy();
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

void (*sub_1000058E0(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_100005990(v6, a2, a3);
  return sub_100005948;
}

void sub_100005948(void *a1)
{
  id v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*sub_100005990(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)sub_100006860();
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
    return sub_100005A10;
  }
  __break(1u);
  return result;
}

void sub_100005A10(id *a1)
{
}

void *sub_100005A18(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_10;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  while (1)
  {
    if (v2 <= 0)
    {
      uint64_t v3 = &_swiftEmptyArrayStorage;
    }
    else
    {
      sub_1000061A0(&qword_10000C598);
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
    sub_100005710((uint64_t)(v3 + 4), v2, v1);
    unint64_t v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_100006870();
    swift_bridgeObjectRelease();
    if (!v2) {
      return &_swiftEmptyArrayStorage;
    }
  }
  return v3;
}

uint64_t sub_100005B10(void *a1, void *a2)
{
  self;
  int64_t v4 = (void *)swift_dynamicCastObjCClass();
  if (v4 && [v4 isTrashFolder]
    || (self, (uint64_t v5 = (void *)swift_dynamicCastObjCClass()) != 0)
    && [v5 isTrashFolder])
  {

    return 0;
  }
  if ([a1 isSharedViaICloud] && objc_msgSend(a2, "isSharedViaICloud"))
  {
    id v7 = [a1 sharedRootObject];
    id v8 = [a2 sharedRootObject];
    uint64_t v9 = v8;
    if (v7)
    {
      if (v8)
      {
        sub_100006434(0, &qword_10000C5A8);
        id v10 = v7;
        char v11 = sub_100006850();

        if ((v11 & 1) == 0) {
          return 2;
        }
        return 3;
      }

      uint64_t v9 = a2;
    }
    else
    {

      if (!v9) {
        return 3;
      }
    }

    return 2;
  }
  if ([a1 isSharedViaICloud])
  {
    unsigned int v12 = [a2 isSharedViaICloud];

    if (v12) {
      return 0;
    }
    else {
      return 4;
    }
  }
  else
  {

    return 1;
  }
}

unint64_t sub_100005CD8(unint64_t result)
{
  if (result > 4) {
    return 0;
  }
  return result;
}

void _sSo20ICCloudSyncingObjectC45com_apple_mobilenotes_SpotlightIndexExtensionE29undoablyPersistActivityEvents3for03oldC003newC0yAbCE10MoveActionC_ABSgAJtFZ_0(uint64_t a1, void *a2, void *a3)
{
  switch(*(void *)(a1 + OBJC_IVAR___ICCloudSyncingObjectMoveAction_type))
  {
    case 0:
      return;
    case 1:
      if (!a3) {
        return;
      }
      uint64_t v4 = *(void *)(a1 + OBJC_IVAR___ICCloudSyncingObjectMoveAction_toParentObject);
      id v30 = a3;
      if (*(unsigned char *)(a1 + OBJC_IVAR___ICCloudSyncingObjectMoveAction_isCopy) != 1) {
        goto LABEL_28;
      }
      uint64_t v5 = *(void *)(a1 + OBJC_IVAR___ICCloudSyncingObjectMoveAction_object);
      id v6 = a3;
      id v7 = [v6 persistCopyActivityEventForObject:v6 originalObject:v5 fromParentObject:0 toParentObject:v4];
      goto LABEL_29;
    case 2:
      id v30 = a3;
      if (a2)
      {
        unsigned int v12 = *(void **)(a1 + OBJC_IVAR___ICCloudSyncingObjectMoveAction_fromParentObject);
        id v13 = a2;
        id v14 = [v12 sharedRootObject];
        if (v14)
        {
          uint64_t v15 = v14;
          if (*(unsigned char *)(a1 + OBJC_IVAR___ICCloudSyncingObjectMoveAction_isCopy) == 1) {
            id v16 = [v14 persistCopyActivityEventForObject:v13 originalObject:*(void *)(a1 + OBJC_IVAR___ICCloudSyncingObjectMoveAction_object) fromParentObject:v12 toParentObject:0];
          }
          else {
            id v16 = [v14 persistMoveActivityEventForObject:v13 fromParentObject:v12 toParentObject:0];
          }
          id v25 = v16;
          id v26 = [self shared];
          [v26 registerUndoForCloudSyncingObjectActivityEvent:v25 cloudSyncingObject:v15];

          id v13 = v26;
        }

        a3 = v30;
      }
      if (!a3) {
        return;
      }
      uint64_t v4 = *(void *)(a1 + OBJC_IVAR___ICCloudSyncingObjectMoveAction_toParentObject);
      if (*(unsigned char *)(a1 + OBJC_IVAR___ICCloudSyncingObjectMoveAction_isCopy) == 1)
      {
        uint64_t v27 = *(void *)(a1 + OBJC_IVAR___ICCloudSyncingObjectMoveAction_object);
        id v28 = a3;
        id v7 = [v28 persistCopyActivityEventForObject:v28 originalObject:v27 fromParentObject:0 toParentObject:v4];
      }
      else
      {
LABEL_28:
        id v29 = a3;
        id v7 = [v29 persistMoveActivityEventForObject:v29 fromParentObject:0 toParentObject:v4];
      }
      goto LABEL_29;
    case 3:
      if (!a3) {
        return;
      }
      uint64_t v17 = *(void *)(a1 + OBJC_IVAR___ICCloudSyncingObjectMoveAction_fromParentObject);
      uint64_t v18 = *(void *)(a1 + OBJC_IVAR___ICCloudSyncingObjectMoveAction_toParentObject);
      id v30 = a3;
      if (*(unsigned char *)(a1 + OBJC_IVAR___ICCloudSyncingObjectMoveAction_isCopy) == 1)
      {
        uint64_t v19 = *(void *)(a1 + OBJC_IVAR___ICCloudSyncingObjectMoveAction_object);
        id v20 = a3;
        id v7 = [v20 persistCopyActivityEventForObject:v20 originalObject:v19 fromParentObject:v17 toParentObject:v18];
      }
      else
      {
        id v21 = a3;
        id v7 = [v21 persistMoveActivityEventForObject:v21 fromParentObject:v17 toParentObject:v18];
      }
LABEL_29:
      id v23 = v7;
      id v24 = [self shared];
      [v24 registerUndoForCloudSyncingObjectActivityEvent:v23 cloudSyncingObject:v30];
      goto LABEL_30;
    case 4:
      if (!a2) {
        return;
      }
      id v8 = *(void **)(a1 + OBJC_IVAR___ICCloudSyncingObjectMoveAction_fromParentObject);
      id v30 = a2;
      id v9 = [v8 sharedRootObject];
      if (v9)
      {
        id v10 = v9;
        if (*(unsigned char *)(a1 + OBJC_IVAR___ICCloudSyncingObjectMoveAction_isCopy) == 1) {
          id v11 = [v9 persistCopyActivityEventForObject:v30 originalObject:*(void *)(a1 + OBJC_IVAR___ICCloudSyncingObjectMoveAction_object) fromParentObject:v8 toParentObject:0];
        }
        else {
          id v11 = [v9 persistMoveActivityEventForObject:v30 fromParentObject:v8 toParentObject:0];
        }
        id v23 = v11;
        id v24 = [self shared];
        [v24 registerUndoForCloudSyncingObjectActivityEvent:v23 cloudSyncingObject:v10];

LABEL_30:
        v22 = v24;
      }
      else
      {
        v22 = v30;
      }

      return;
    default:
      sub_100006880();
      __break(1u);
      JUMPOUT(0x10000618CLL);
  }
}

uint64_t sub_1000061A0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000061E4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_10000622C()
{
  unint64_t result = qword_10000C548;
  if (!qword_10000C548)
  {
    sub_100006434(255, &qword_10000C550);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C548);
  }
  return result;
}

uint64_t sub_100006294(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000061A0(&qword_10000C530);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100006304(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000061A0(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_100006364()
{
  unint64_t result = qword_10000C568;
  if (!qword_10000C568)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C568);
  }
  return result;
}

uint64_t type metadata accessor for ICCloudSyncingObject.MoveAction()
{
  return self;
}

ValueMetadata *type metadata accessor for ICCloudSyncingObject.MoveAction.Types()
{
  return &type metadata for ICCloudSyncingObject.MoveAction.Types;
}

uint64_t sub_1000063F0(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000061E4(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100006434(uint64_t a1, unint64_t *a2)
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

void sub_100006470()
{
  sub_1000042AC();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Index extension wants to reindex. Deleting everything", v1, 2u);
}

void sub_1000064B0()
{
  sub_1000042AC();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Index extension did delete everything", v1, 2u);
}

void sub_1000064F0(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error deleting everything in extension: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100006568(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Index extension reindexing objectIDURIs: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000065E0(uint64_t a1, NSObject *a2)
{
  unsigned int v3 = [*(id *)(a1 + 32) count];
  v4[0] = 67109120;
  v4[1] = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Index extension did reindex %d items", (uint8_t *)v4, 8u);
}

void sub_100006670(uint64_t a1, uint64_t a2, NSObject *a3)
{
  unsigned int v5 = [*(id *)(a1 + 32) count];
  v6[0] = 67109378;
  v6[1] = v5;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Error reindexing %d searchable items in extension: %@", (uint8_t *)v6, 0x12u);
}

void sub_100006710()
{
  sub_1000042AC();
}

void sub_100006750()
{
  sub_1000042AC();
}

uint64_t sub_100006790()
{
  return Date.init()();
}

uint64_t sub_1000067A0()
{
  return type metadata accessor for Date();
}

uint64_t sub_1000067B0()
{
  return type metadata accessor for PersistedActivityEvent.Activities();
}

uint64_t sub_1000067C0()
{
  return ActivityEventParticipant.init(cloudSyncingObject:)();
}

uint64_t sub_1000067D0()
{
  return type metadata accessor for ActivityEventParticipant();
}

uint64_t sub_1000067E0()
{
  return BidirectionalCollection<>.difference<A>(from:)();
}

uint64_t sub_1000067F0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100006800()
{
  return dispatch thunk of Collection.startIndex.getter();
}

uint64_t sub_100006810()
{
  return dispatch thunk of Collection.endIndex.getter();
}

uint64_t sub_100006820()
{
  return dispatch thunk of Collection.formIndex(after:)();
}

uint64_t sub_100006830()
{
  return dispatch thunk of Collection.subscript.read();
}

uint64_t sub_100006840()
{
  return ICCloudSyncingObject.persist(activity:for:timestamp:)();
}

uint64_t sub_100006850()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_100006860()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100006870()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100006880()
{
  return _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
}

uint64_t sub_100006890()
{
  return Hasher.init(_seed:)();
}

void sub_1000068A0(Swift::UInt a1)
{
}

Swift::Int sub_1000068B0()
{
  return Hasher._finalize()();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
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

uint64_t swift_release()
{
  return _swift_release();
}

id objc_msgSend_addDataSource_(void *a1, const char *a2, ...)
{
  return [a1 addDataSource:];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_dataForTypeIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 dataForTypeIdentifier:];
}

id objc_msgSend_deleteAllSearchableItemsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 deleteAllSearchableItemsWithCompletionHandler:];
}

id objc_msgSend_fileURLForTypeIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 fileURLForTypeIdentifier:];
}

id objc_msgSend_initializeSearchIndexerDataSourceWithPersistentContainer_(void *a1, const char *a2, ...)
{
  return [a1 initializeSearchIndexerDataSourceWithPersistentContainer:];
}

id objc_msgSend_isValidItemIdentifier_typeIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 isValidItemIdentifier:typeIdentifier:];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_logMethodCall_(void *a1, const char *a2, ...)
{
  return [a1 logMethodCall:];
}

id objc_msgSend_newContextsForAllDataSources(void *a1, const char *a2, ...)
{
  return _[a1 newContextsForAllDataSources];
}

id objc_msgSend_objectForManagedObjectIDURI_inContexts_(void *a1, const char *a2, ...)
{
  return [a1 objectForManagedObjectIDURI:inContexts:];
}

id objc_msgSend_persistentContainer(void *a1, const char *a2, ...)
{
  return _[a1 persistentContainer];
}

id objc_msgSend_reindexSearchableItemsWithObjectIDURIs_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reindexSearchableItemsWithObjectIDURIs:completionHandler:");
}

id objc_msgSend_reindexer(void *a1, const char *a2, ...)
{
  return _[a1 reindexer];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return _[a1 reset];
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKey:];
}

id objc_msgSend_setRetryOnErrors_(void *a1, const char *a2, ...)
{
  return [a1 setRetryOnErrors:];
}

id objc_msgSend_sharedContext(void *a1, const char *a2, ...)
{
  return _[a1 sharedContext];
}

id objc_msgSend_sharedIndexer(void *a1, const char *a2, ...)
{
  return _[a1 sharedIndexer];
}

id objc_msgSend_startSharedContextWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 startSharedContextWithOptions:];
}