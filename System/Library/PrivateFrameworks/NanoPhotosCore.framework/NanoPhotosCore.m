id PHChange.npto_changeDetails<A>(for:)(uint64_t a1)
{
  void *v1;
  id result;

  result = objc_msgSend(v1, sel_changeDetailsForObject_, a1);
  if (result)
  {
    self;
    return (id)swift_dynamicCastObjCClassUnconditional();
  }
  return result;
}

id PHChange.npto_changeDetails<A>(for:)()
{
  self;
  id result = objc_msgSend(v0, sel_changeDetailsForFetchResult_, swift_dynamicCastObjCClassUnconditional());
  if (result)
  {
    self;
    return (id)swift_dynamicCastObjCClassUnconditional();
  }
  return result;
}

uint64_t sub_21ECC4EA4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EA4080);
  swift_allocObject();
  uint64_t result = sub_21ECD4D08();
  static TaskTracing.$id = result;
  return result;
}

uint64_t *TaskTracing.$id.unsafeMutableAddressor()
{
  if (qword_267EA4310 != -1) {
    swift_once();
  }
  return &static TaskTracing.$id;
}

uint64_t static TaskTracing.$id.getter()
{
  if (qword_267EA4310 != -1) {
    swift_once();
  }
  return swift_retain();
}

uint64_t static TaskTracing.id.getter()
{
  if (qword_267EA4310 != -1) {
    swift_once();
  }
  sub_21ECD4D18();
  return v1;
}

ValueMetadata *type metadata accessor for TaskTracing()
{
  return &type metadata for TaskTracing;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

const char *NanoPhotosCoreFeatures.domain.getter()
{
  return "NanoPhotosCore";
}

const char *NanoPhotosCoreFeatures.feature.getter(char a1)
{
  uint64_t result = "LocalLibrary";
  switch(a1)
  {
    case 1:
      uint64_t result = "MemoriesSync";
      break;
    case 2:
      uint64_t result = "PhotosSyncV2";
      break;
    case 3:
      uint64_t result = "GIFSupport";
      break;
    default:
      return result;
  }
  return result;
}

BOOL static NanoPhotosCoreFeatures.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t NanoPhotosCoreFeatures.hash(into:)()
{
  return sub_21ECD4CD8();
}

uint64_t NanoPhotosCoreFeatures.hashValue.getter()
{
  return sub_21ECD4CE8();
}

BOOL sub_21ECC516C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_21ECC5180()
{
  return sub_21ECD4CE8();
}

uint64_t sub_21ECC51C8()
{
  return sub_21ECD4CD8();
}

uint64_t sub_21ECC51F4()
{
  return sub_21ECD4CE8();
}

unint64_t sub_21ECC523C()
{
  unint64_t result = qword_267EA4088;
  if (!qword_267EA4088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EA4088);
  }
  return result;
}

const char *sub_21ECC5290()
{
  return "NanoPhotosCore";
}

const char *sub_21ECC52A4()
{
  unint64_t result = "LocalLibrary";
  switch(*v0)
  {
    case 1:
      unint64_t result = "MemoriesSync";
      break;
    case 2:
      unint64_t result = "PhotosSyncV2";
      break;
    case 3:
      unint64_t result = "GIFSupport";
      break;
    default:
      return result;
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for NanoPhotosCoreFeatures(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
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
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for NanoPhotosCoreFeatures(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0x21ECC5484);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

uint64_t sub_21ECC54AC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_21ECC54B8(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for NanoPhotosCoreFeatures()
{
  return &type metadata for NanoPhotosCoreFeatures;
}

uint64_t property wrapper backing initializer of FetchResultObserver.fetchResult(uint64_t a1)
{
  uint64_t v3 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EA4090);
  return sub_21ECC5518((uint64_t)&v3, v1);
}

uint64_t sub_21ECC5518(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388]();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, a2);
  sub_21ECD48C8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, a2);
}

uint64_t sub_21ECC5608@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x70))();
  *a2 = result;
  return result;
}

uint64_t sub_21ECC5664(id *a1)
{
  id v1 = *a1;
  return sub_21ECC5754();
}

uint64_t FetchResultObserver.fetchResult.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_21ECD48F8();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_21ECC573C()
{
  return 8;
}

void *sub_21ECC5748(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_21ECC5754()
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v1 = v0;
  return sub_21ECD4908();
}

uint64_t variable initialization expression of FetchResultObserver._fetchResult()
{
  return 0;
}

uint64_t sub_21ECC57FC(void **a1)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x88))();
}

uint64_t sub_21ECC5850(uint64_t a1)
{
  return sub_21ECC6460(a1);
}

uint64_t FetchResultObserver.$fetchResult.getter()
{
  return swift_endAccess();
}

uint64_t sub_21ECC58F4(uint64_t a1)
{
  sub_21ECC6460(a1);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EA40A0);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t variable initialization expression of FetchResultObserver.updatePublisher()
{
  return sub_21ECD48B8();
}

uint64_t FetchResultObserver.updatePublisher.getter()
{
  return swift_retain();
}

id FetchResultObserver.__allocating_init(_:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return FetchResultObserver.init(_:)(a1);
}

id FetchResultObserver.init(_:)(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = (void *)MEMORY[0x263F8EED0];
  uint64_t v5 = *MEMORY[0x263F8EED0] & *(void *)v1;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EA4098);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = &v2[*(void *)(v5 + 88)];
  v11 = v2;
  uint64_t v24 = 0;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EA4090);
  sub_21ECC5518((uint64_t)&v24, v12);
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v10, v9, v6);
  uint64_t v13 = *(void *)((*v4 & *(void *)v11) + 0x60);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EA40A8);
  *(void *)&v11[v13] = sub_21ECD48B8();
  *(void *)&v11[*(void *)((*v4 & *(void *)v11) + 0x68)] = a1;
  id v14 = a1;

  ResultObserver = (objc_class *)type metadata accessor for FetchResultObserver();
  v23.receiver = v11;
  v23.super_class = ResultObserver;
  id v16 = objc_msgSendSuper2(&v23, sel_init);
  v17 = self;
  id v18 = v16;
  id v19 = objc_msgSend(v17, sel_sharedPhotoLibrary);
  id v20 = v18;
  objc_msgSend(v19, sel_registerChangeObserver_, v20);

  return v20;
}

id FetchResultObserver.__deallocating_deinit()
{
  id v1 = objc_msgSend(self, sel_sharedPhotoLibrary);
  objc_msgSend(v1, sel_unregisterChangeObserver_, v0);

  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for FetchResultObserver();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

id sub_21ECC5CCC(void *a1)
{
  id v1 = a1;
  return FetchResultObserver.__deallocating_deinit();
}

void sub_21ECC5CF4(void *a1)
{
  uint64_t v2 = (void *)MEMORY[0x263F8EED0];
  objc_super v3 = (char *)a1 + *(void *)((*MEMORY[0x263F8EED0] & *a1) + 0x58);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EA4098);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  uint64_t v5 = *(void **)((char *)a1 + *(void *)((*v2 & *a1) + 0x68));
}

uint64_t FetchResultObserver.setObservedFetchResult(_:)(void *a1)
{
  uint64_t v3 = sub_21ECD4928();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_21ECD4948();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388]();
  v10 = (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v1;
  *(void *)(v11 + 24) = a1;
  aBlock[4] = sub_21ECC65D8;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21ECC6060;
  aBlock[3] = &block_descriptor;
  uint64_t v12 = _Block_copy(aBlock);
  id v13 = a1;
  id v14 = v1;
  sub_21ECD4938();
  v16[1] = MEMORY[0x263F8EE78];
  sub_21ECC6740();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EA40C0);
  sub_21ECC6798();
  sub_21ECD4B98();
  MEMORY[0x223C38640](0, v10, v6, v12);
  _Block_release(v12);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return swift_release();
}

uint64_t sub_21ECC6060(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

Swift::Void __swiftcall FetchResultObserver.photoLibraryDidChange(_:)(PHChange a1)
{
  uint64_t v3 = sub_21ECD4928();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_21ECD4948();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388]();
  v10 = (char *)v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (PHChange *)swift_allocObject();
  v11[2].super.isa = v1;
  v11[3].super.isa = a1.super.isa;
  aBlock[4] = sub_21ECC683C;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21ECC6060;
  aBlock[3] = &block_descriptor_7;
  uint64_t v12 = _Block_copy(aBlock);
  id v13 = v1;
  id v14 = a1.super.isa;
  sub_21ECD4938();
  v15[1] = MEMORY[0x263F8EE78];
  sub_21ECC6740();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EA40C0);
  sub_21ECC6798();
  sub_21ECD4B98();
  MEMORY[0x223C38640](0, v10, v6, v12);
  _Block_release(v12);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  swift_release();
}

void sub_21ECC6330(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  FetchResultObserver.photoLibraryDidChange(_:)((PHChange)v4);
}

id FetchResultObserver.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void FetchResultObserver.init()()
{
}

void sub_21ECC63F4()
{
}

uint64_t sub_21ECC641C@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for FetchResultObserver();
  uint64_t result = sub_21ECD4898();
  *a1 = result;
  return result;
}

uint64_t sub_21ECC6460(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EA40A0);
  MEMORY[0x270FA5388]();
  (*(void (**)(char *, uint64_t))(v3 + 16))((char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EA4098);
  sub_21ECD48E8();
  return swift_endAccess();
}

uint64_t type metadata accessor for FetchResultObserver()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_21ECC6598()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_21ECC65D8()
{
  id v1 = *(void **)(v0 + 24);
  uint64_t v2 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **(void **)(v0 + 16)) + 0x70))();
  if (!v2)
  {
    if (!v1) {
      return;
    }
    id v4 = v1;
    goto LABEL_7;
  }
  uint64_t v3 = v2;
  if (!v1)
  {

    sub_21ECC5754();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EA4138);
    id v7 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
    id v6 = 0;
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EA4138);
  id v4 = v1;
  char v5 = sub_21ECD4B48();

  if ((v5 & 1) == 0)
  {
LABEL_7:
    id v6 = v4;
    sub_21ECC5754();
    id v7 = v6;
LABEL_9:
    id v8 = v6;
    id v9 = v7;
    sub_21ECD48A8();
  }
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

unint64_t sub_21ECC6740()
{
  unint64_t result = qword_267EA40B8;
  if (!qword_267EA40B8)
  {
    sub_21ECD4928();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EA40B8);
  }
  return result;
}

unint64_t sub_21ECC6798()
{
  unint64_t result = qword_267EA40C8;
  if (!qword_267EA40C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EA40C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EA40C8);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void sub_21ECC683C()
{
  uint64_t v1 = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **(void **)(v0 + 16)) + 0x70))();
  if (v1)
  {
    id v7 = (id)v1;
    id v2 = PHChange.npto_changeDetails<A>(for:)();
    if (v2)
    {
      uint64_t v3 = v2;
      id v4 = objc_msgSend(v2, sel_fetchResultAfterChanges);
      sub_21ECC5754();
      id v5 = v4;
      id v6 = v3;
      sub_21ECD48A8();
    }
    else
    {
    }
  }
}

void sub_21ECC69A0()
{
}

uint64_t sub_21ECC69D0()
{
  return MEMORY[0x263EFDDD8];
}

uint64_t sub_21ECC69DC()
{
  return 8;
}

uint64_t sub_21ECC69E8()
{
  return 8;
}

void sub_21ECC69F8()
{
  sub_21ECC6AA4();
  if (v0 <= 0x3F) {
    swift_initClassMetadata2();
  }
}

void sub_21ECC6AA4()
{
  if (!qword_267EA4130)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EA4090);
    unint64_t v0 = sub_21ECD4918();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267EA4130);
    }
  }
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t static TemporaryResourceFileError.__derived_enum_equals(_:_:)()
{
  return 1;
}

uint64_t TemporaryResourceFileError.hash(into:)()
{
  return sub_21ECD4CD8();
}

uint64_t TemporaryResourceFileError.hashValue.getter()
{
  return sub_21ECD4CE8();
}

uint64_t sub_21ECC6BB8()
{
  return 1;
}

uint64_t sub_21ECC6BC0()
{
  return sub_21ECD4CE8();
}

uint64_t sub_21ECC6C04()
{
  return sub_21ECD4CD8();
}

uint64_t sub_21ECC6C2C()
{
  return sub_21ECD4CE8();
}

uint64_t TemporaryResourceFile.url.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC14NanoPhotosCore21TemporaryResourceFile_url;
  uint64_t v4 = sub_21ECD4828();
  id v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t TemporaryResourceFile.metadata.getter()
{
  return swift_bridgeObjectRetain();
}

char *TemporaryResourceFile.__allocating_init(idsResourceURL:metadata:)(char *a1, uint64_t a2)
{
  uint64_t v66 = a2;
  uint64_t v75 = *MEMORY[0x263EF8340];
  uint64_t v60 = sub_21ECD4858();
  uint64_t v59 = *(void *)(v60 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v4 = (char *)&v57 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_21ECD4828();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v63 = (char *)&v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v57 - v10;
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  id v14 = (char *)&v57 - v13;
  MEMORY[0x270FA5388](v12);
  id v16 = (char *)&v57 - v15;
  sub_21ECD47B8();
  uint64_t v17 = sub_21ECD49A8();
  swift_bridgeObjectRelease();
  uint64_t v65 = v5;
  v69 = v14;
  v57 = v16;
  v64 = v11;
  v61 = a1;
  v62 = v4;
  uint64_t v68 = v6;
  if (v17) {
    goto LABEL_14;
  }
  uint64_t v70 = 29805;
  unint64_t v71 = 0xE200000000000000;
  sub_21ECD4BC8();
  uint64_t v18 = v66;
  if (*(void *)(v66 + 16) && (unint64_t v19 = sub_21ECC8598((uint64_t)v72), (v20 & 1) != 0))
  {
    sub_21ECC86E0(*(void *)(v18 + 56) + 32 * v19, (uint64_t)&v73);
  }
  else
  {
    long long v73 = 0u;
    long long v74 = 0u;
  }
  sub_21ECC85D8((uint64_t)v72);
  if (!*((void *)&v74 + 1))
  {
    sub_21ECC862C((uint64_t)&v73);
    goto LABEL_13;
  }
  v21 = (char *)MEMORY[0x263F8EE58];
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_13:
    uint64_t v6 = v68;
    goto LABEL_14;
  }
  uint64_t v6 = v68;
  if (v70 == 1)
  {
    uint64_t v70 = 29549;
    unint64_t v71 = 0xE200000000000000;
    sub_21ECD4BC8();
    uint64_t v22 = v66;
    if (*(void *)(v66 + 16) && (unint64_t v23 = sub_21ECC8598((uint64_t)v72), (v24 & 1) != 0))
    {
      sub_21ECC86E0(*(void *)(v22 + 56) + 32 * v23, (uint64_t)&v73);
    }
    else
    {
      long long v73 = 0u;
      long long v74 = 0u;
    }
    sub_21ECC85D8((uint64_t)v72);
    if (*((void *)&v74 + 1))
    {
      if (swift_dynamicCast())
      {
        uint64_t v53 = v68;
        if ((v70 & 8) != 0)
        {
          uint64_t v54 = 7367790;
LABEL_43:
          uint64_t v58 = v54;
          goto LABEL_23;
        }
LABEL_36:
        uint64_t v70 = 7632997;
        unint64_t v71 = 0xE300000000000000;
        sub_21ECD4BC8();
        if (*(void *)(v22 + 16) && (unint64_t v55 = sub_21ECC8598((uint64_t)v72), (v56 & 1) != 0))
        {
          sub_21ECC86E0(*(void *)(v22 + 56) + 32 * v55, (uint64_t)&v73);
        }
        else
        {
          long long v73 = 0u;
          long long v74 = 0u;
        }
        sub_21ECC85D8((uint64_t)v72);
        if (*((void *)&v74 + 1))
        {
          if (swift_dynamicCast())
          {
            uint64_t v54 = v70;
            goto LABEL_43;
          }
          swift_bridgeObjectRelease();
        }
        else
        {
          swift_bridgeObjectRelease();
          sub_21ECC862C((uint64_t)&v73);
        }
        sub_21ECC868C();
        swift_allocError();
        swift_willThrow();
        (*(void (**)(char *, uint64_t))(v53 + 8))(a1, v5);
        return v21;
      }
    }
    else
    {
      sub_21ECC862C((uint64_t)&v73);
    }
    uint64_t v53 = v68;
    goto LABEL_36;
  }
LABEL_14:
  sub_21ECD47D8();
  uint64_t v25 = sub_21ECD47B8();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v16, v5);
  if (sub_21ECD49A8() < 1) {
    goto LABEL_22;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EA41A0);
  uint64_t v26 = v67;
  sub_21ECD4808();
  uint64_t v67 = v26;
  if (!v72[0]) {
    goto LABEL_22;
  }
  uint64_t v27 = sub_21ECD4998();
  if (!v28) {
    goto LABEL_22;
  }
  uint64_t v29 = v28;
  if (v27 == sub_21ECD47B8() && v29 == v30)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_22:
    swift_bridgeObjectRelease();
    uint64_t v58 = sub_21ECD47B8();
LABEL_23:
    uint64_t v32 = v60;
    uint64_t v33 = v59;
    goto LABEL_24;
  }
  char v31 = sub_21ECD4C58();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v31) {
    goto LABEL_22;
  }
  uint64_t v32 = v60;
  uint64_t v33 = v59;
  uint64_t v58 = v25;
LABEL_24:
  v34 = self;
  id v35 = objc_msgSend(v34, sel_defaultManager);
  id v36 = objc_msgSend(v35, sel_temporaryDirectory);

  v37 = v63;
  sub_21ECD4818();

  v72[0] = (id)0x676E696D6F636E69;
  v72[1] = (id)0xE90000000000002DLL;
  v38 = v62;
  sub_21ECD4848();
  sub_21ECD4838();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v38, v32);
  sub_21ECD49B8();
  swift_bridgeObjectRelease();
  v39 = v64;
  sub_21ECD47E8();
  swift_bridgeObjectRelease();
  v40 = *(void (**)(char *, uint64_t))(v68 + 8);
  v41 = v37;
  uint64_t v42 = v65;
  v40(v41, v65);
  sub_21ECD47F8();
  swift_bridgeObjectRelease();
  v40(v39, v42);
  id v43 = objc_msgSend(v34, sel_defaultManager);
  v44 = v61;
  v45 = (void *)sub_21ECD47C8();
  v46 = (void *)sub_21ECD47C8();
  v72[0] = 0;
  unsigned __int8 v47 = objc_msgSend(v43, sel_copyItemAtURL_toURL_error_, v45, v46, v72);

  v21 = (char *)v72[0];
  if (v47)
  {
    id v48 = v72[0];
    v40(v44, v42);
    v49 = *(void (**)(char *, char *, uint64_t))(v68 + 32);
    v50 = v57;
    v49(v57, v69, v42);
    type metadata accessor for TemporaryResourceFile();
    v21 = (char *)swift_allocObject();
    v49(&v21[OBJC_IVAR____TtC14NanoPhotosCore21TemporaryResourceFile_url], v50, v42);
    *(void *)&v21[OBJC_IVAR____TtC14NanoPhotosCore21TemporaryResourceFile_metadata] = v66;
  }
  else
  {
    id v51 = v72[0];
    swift_bridgeObjectRelease();
    sub_21ECD47A8();

    swift_willThrow();
    v40(v44, v42);
    v40(v69, v42);
  }
  return v21;
}

uint64_t sub_21ECC7554@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

char *TemporaryResourceFile.__allocating_init(localResourceURL:metadata:)(char *a1, uint64_t a2)
{
  uint64_t v36 = a2;
  uint64_t v33 = a1;
  v37[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v35 = sub_21ECD4858();
  uint64_t v2 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  uint64_t v4 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_21ECD4828();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)&v30 - v11;
  MEMORY[0x270FA5388](v10);
  id v14 = (char *)&v30 - v13;
  id v32 = self;
  id v15 = objc_msgSend(v32, sel_defaultManager);
  id v16 = objc_msgSend(v15, sel_temporaryDirectory);

  sub_21ECD4818();
  sub_21ECD4848();
  sub_21ECD4838();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v35);
  sub_21ECD47E8();
  swift_bridgeObjectRelease();
  uint64_t v31 = v6;
  uint64_t v17 = *(void (**)(char *, uint64_t))(v6 + 8);
  v17(v9, v5);
  uint64_t v18 = v33;
  sub_21ECD47B8();
  sub_21ECD47F8();
  swift_bridgeObjectRelease();
  uint64_t v34 = v5;
  v17(v12, v5);
  unint64_t v19 = v18;
  id v20 = objc_msgSend(v32, sel_defaultManager);
  v21 = (void *)sub_21ECD47C8();
  uint64_t v35 = (uint64_t)v14;
  uint64_t v22 = (void *)sub_21ECD47C8();
  v37[0] = 0;
  LOBYTE(v16) = objc_msgSend(v20, sel_copyItemAtURL_toURL_error_, v21, v22, v37);

  unint64_t v23 = (char *)v37[0];
  if (v16)
  {
    id v24 = v37[0];
    uint64_t v25 = v34;
    v17(v19, v34);
    uint64_t v26 = *(void (**)(char *, uint64_t, uint64_t))(v31 + 32);
    v26(v12, v35, v25);
    type metadata accessor for TemporaryResourceFile();
    unint64_t v23 = (char *)swift_allocObject();
    v26(&v23[OBJC_IVAR____TtC14NanoPhotosCore21TemporaryResourceFile_url], (uint64_t)v12, v25);
    *(void *)&v23[OBJC_IVAR____TtC14NanoPhotosCore21TemporaryResourceFile_metadata] = v36;
  }
  else
  {
    id v27 = v37[0];
    swift_bridgeObjectRelease();
    sub_21ECD47A8();

    swift_willThrow();
    uint64_t v28 = v34;
    v17(v19, v34);
    v17((char *)v35, v28);
  }
  return v23;
}

uint64_t TemporaryResourceFile.deinit()
{
  uint64_t v1 = v0;
  v51[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v2 = sub_21ECD4888();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v42 - v7;
  uint64_t v9 = sub_21ECC8D40();
  uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  uint64_t v45 = v9;
  v46 = (uint8_t *)(v3 + 16);
  v44 = v10;
  ((void (*)(char *))v10)(v8);
  swift_retain_n();
  uint64_t v11 = sub_21ECD4868();
  os_log_type_t v12 = sub_21ECD4B28();
  unint64_t v13 = 0x267EA4000uLL;
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v49 = v2;
    id v15 = (uint8_t *)v14;
    id v16 = (void *)swift_slowAlloc();
    uint64_t v48 = v3;
    uint64_t v17 = v16;
    v51[0] = v16;
    *(_DWORD *)id v15 = 136315138;
    unsigned __int8 v47 = v6;
    sub_21ECD4828();
    sub_21ECC873C();
    unint64_t v13 = 0x267EA4000;
    uint64_t v18 = sub_21ECD4C48();
    uint64_t v50 = sub_21ECC7F40(v18, v19, (uint64_t *)v51);
    uint64_t v6 = v47;
    sub_21ECD4B68();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21ECC3000, v11, v12, "Removing %s", v15, 0xCu);
    swift_arrayDestroy();
    id v20 = v17;
    uint64_t v3 = v48;
    MEMORY[0x223C38EA0](v20, -1, -1);
    v21 = v15;
    uint64_t v1 = v0;
    uint64_t v2 = v49;
    MEMORY[0x223C38EA0](v21, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  uint64_t v22 = *(void (**)(char *, uint64_t))(v3 + 8);
  v22(v8, v2);
  id v23 = objc_msgSend(self, sel_defaultManager);
  uint64_t v24 = v1 + *(void *)(v13 + 3064);
  uint64_t v25 = (void *)sub_21ECD47C8();
  v51[0] = 0;
  unsigned int v26 = objc_msgSend(v23, sel_removeItemAtURL_error_, v25, v51);

  if (v26)
  {
    id v27 = v51[0];
  }
  else
  {
    id v43 = v22;
    id v28 = v51[0];
    uint64_t v29 = (void *)sub_21ECD47A8();

    swift_willThrow();
    v44(v6, v45, v2);
    swift_retain_n();
    uint64_t v30 = sub_21ECD4868();
    os_log_type_t v31 = sub_21ECD4B18();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v49 = v2;
      uint64_t v32 = swift_slowAlloc();
      unsigned __int8 v47 = v6;
      uint64_t v33 = (uint8_t *)v32;
      uint64_t v34 = (void *)swift_slowAlloc();
      uint64_t v48 = v3;
      uint64_t v35 = v34;
      v51[0] = v34;
      *(_DWORD *)uint64_t v33 = 136315138;
      v46 = v33 + 4;
      sub_21ECD4828();
      sub_21ECC873C();
      uint64_t v36 = sub_21ECD4C48();
      uint64_t v50 = sub_21ECC7F40(v36, v37, (uint64_t *)v51);
      sub_21ECD4B68();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21ECC3000, v30, v31, "Failed to remove %s", v33, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C38EA0](v35, -1, -1);
      MEMORY[0x223C38EA0](v33, -1, -1);

      v38 = v47;
      uint64_t v39 = v49;
    }
    else
    {

      swift_release_n();
      v38 = v6;
      uint64_t v39 = v2;
    }
    v43(v38, v39);
  }
  uint64_t v40 = sub_21ECD4828();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v40 - 8) + 8))(v24, v40);
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t TemporaryResourceFile.__deallocating_deinit()
{
  TemporaryResourceFile.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t type metadata accessor for TemporaryResourceFile()
{
  uint64_t result = qword_267EA4720;
  if (!qword_267EA4720) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_21ECC7F40(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_21ECC8014(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_21ECC86E0((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_21ECC86E0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_21ECC8014(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_21ECD4B78();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_21ECC81D0(a5, a6);
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
  uint64_t v8 = sub_21ECD4C08();
  if (!v8)
  {
    sub_21ECD4C18();
    __break(1u);
LABEL_17:
    uint64_t result = sub_21ECD4C38();
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

uint64_t sub_21ECC81D0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_21ECC8268(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_21ECC8448(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_21ECC8448(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_21ECC8268(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_21ECC83E0(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_21ECD4BD8();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_21ECD4C18();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_21ECD49C8();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_21ECD4C38();
    __break(1u);
LABEL_14:
    uint64_t result = sub_21ECD4C18();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_21ECC83E0(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EA41C8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_21ECC8448(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EA41C8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
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
  uint64_t result = sub_21ECD4C38();
  __break(1u);
  return result;
}

unint64_t sub_21ECC8598(uint64_t a1)
{
  uint64_t v2 = sub_21ECD4BA8();
  return sub_21ECC8A14(a1, v2);
}

uint64_t sub_21ECC85D8(uint64_t a1)
{
  return a1;
}

uint64_t sub_21ECC862C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EA41A8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_21ECC868C()
{
  unint64_t result = qword_267EA41B0;
  if (!qword_267EA41B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EA41B0);
  }
  return result;
}

uint64_t sub_21ECC86E0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_21ECC873C()
{
  unint64_t result = qword_267EA41B8;
  if (!qword_267EA41B8)
  {
    sub_21ECD4828();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EA41B8);
  }
  return result;
}

unint64_t sub_21ECC8798()
{
  unint64_t result = qword_267EA41C0;
  if (!qword_267EA41C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EA41C0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for TemporaryResourceFileError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for TemporaryResourceFileError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x21ECC88DCLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_21ECC8904()
{
  return 0;
}

ValueMetadata *type metadata accessor for TemporaryResourceFileError()
{
  return &type metadata for TemporaryResourceFileError;
}

uint64_t sub_21ECC891C()
{
  return type metadata accessor for TemporaryResourceFile();
}

uint64_t sub_21ECC8924()
{
  uint64_t result = sub_21ECD4828();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_21ECC8A14(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_21ECC8ADC(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x223C386C0](v9, a1);
      sub_21ECC85D8((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_21ECC8ADC(uint64_t a1, uint64_t a2)
{
  return a2;
}

ValueMetadata *type metadata accessor for TimeoutError()
{
  return &type metadata for TimeoutError;
}

unint64_t NPTOCollectionTarget.description.getter(uint64_t a1)
{
  uint64_t v1 = a1 - 1;
  unint64_t result = 0x6C416465636E7953;
  switch(v1)
  {
    case 0:
      return result;
    case 1:
    case 2:
      unint64_t result = 0xD000000000000012;
      break;
    case 3:
      unint64_t result = 0xD000000000000010;
      break;
    case 4:
      unint64_t result = 0x654D6465636E7953;
      break;
    case 5:
      unint64_t result = 0xD000000000000014;
      break;
    default:
      unint64_t result = 0x6E776F6E6B6E55;
      break;
  }
  return result;
}

unint64_t sub_21ECC8C44()
{
  return NPTOCollectionTarget.description.getter(*v0);
}

void type metadata accessor for NPTOCollectionTarget()
{
  if (!qword_267EA41D0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_267EA41D0);
    }
  }
}

uint64_t sub_21ECC8CA4()
{
  uint64_t v0 = sub_21ECD4888();
  __swift_allocate_value_buffer(v0, qword_267EA4C08);
  __swift_project_value_buffer(v0, (uint64_t)qword_267EA4C08);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  return sub_21ECD4878();
}

uint64_t sub_21ECC8D40()
{
  if (qword_267EA4830 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_21ECD4888();
  return __swift_project_value_buffer(v0, (uint64_t)qword_267EA4C08);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_21ECC8E40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[4] = a6;
  v7[5] = a7;
  v7[2] = a4;
  v7[3] = a5;
  v7[6] = *(void *)(a7 - 8);
  v7[7] = swift_task_alloc();
  sub_21ECD4B58();
  v7[8] = swift_task_alloc();
  uint64_t v8 = sub_21ECD4AD8();
  v7[9] = v8;
  v7[10] = *(void *)(v8 - 8);
  v7[11] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_21ECC8F90, 0, 0);
}

uint64_t sub_21ECC8F90()
{
  sub_21ECD4AE8();
  sub_21ECD4AB8();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[12] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_21ECC9050;
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[9];
  return MEMORY[0x270FA1F68](v2, 0, 0, v3);
}

uint64_t sub_21ECC9050()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_21ECC914C, 0, 0);
}

uint64_t sub_21ECC914C()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = v0[5];
  uint64_t v3 = v0[6];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    (*(void (**)(void, void))(v0[10] + 8))(v0[11], v0[9]);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v4 = (uint64_t (*)(void))v0[1];
    return v4();
  }
  else
  {
    uint64_t v6 = (int *)v0[3];
    (*(void (**)(void, uint64_t, uint64_t))(v3 + 32))(v0[7], v1, v2);
    int64_t v9 = (uint64_t (*)(uint64_t))((char *)v6 + *v6);
    char v7 = (void *)swift_task_alloc();
    v0[13] = v7;
    *char v7 = v0;
    v7[1] = sub_21ECC92EC;
    uint64_t v8 = v0[7];
    return v9(v8);
  }
}

uint64_t sub_21ECC92EC()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_21ECC93E8, 0, 0);
}

uint64_t sub_21ECC93E8()
{
  (*(void (**)(void, void))(v0[6] + 8))(v0[7], v0[5]);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[12] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_21ECC9050;
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[9];
  return MEMORY[0x270FA1F68](v2, 0, 0, v3);
}

uint64_t sub_21ECC94A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_21ECD4AA8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_21ECD4A98();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_21ECC9EB4(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_21ECD4A48();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t AsyncStream.Subscription.deinit()
{
  sub_21ECD4AF8();
  swift_release();
  return v0;
}

uint64_t AsyncStream.Subscription.__deallocating_deinit()
{
  sub_21ECD4AF8();
  swift_release();
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t AsyncStream.subscription(handler:)(uint64_t a1, uint64_t a2)
{
  type metadata accessor for AsyncStream.Subscription();
  type metadata accessor for AsyncStream.Subscription();
  uint64_t v5 = swift_allocObject();
  swift_retain();
  sub_21ECC9960(v2, a1, a2);
  return v5;
}

uint64_t type metadata accessor for AsyncStream.Subscription()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_21ECC978C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *unint64_t v4 = v2;
  v4[1] = sub_21ECC9868;
  return v6(a1);
}

uint64_t sub_21ECC9868()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void *sub_21ECC9960(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v22 = a3;
  uint64_t v6 = *(void *)(*v3 + 80);
  uint64_t v7 = sub_21ECD4AE8();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](v7);
  size_t v11 = (char *)&v21 - v10;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EA41E8);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_21ECD4AA8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 1, 1, v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, a1, v7);
  unint64_t v16 = (*(unsigned __int8 *)(v8 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v17 = (char *)swift_allocObject();
  *((void *)v17 + 2) = 0;
  *((void *)v17 + 3) = 0;
  *((void *)v17 + 4) = v6;
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v17[v16], v11, v7);
  uint64_t v18 = &v17[(v9 + v16 + 7) & 0xFFFFFFFFFFFFFFF8];
  uint64_t v19 = v22;
  *(void *)uint64_t v18 = a2;
  *((void *)v18 + 1) = v19;
  v3[2] = sub_21ECC94A4((uint64_t)v14, (uint64_t)&unk_267EA41F8, (uint64_t)v17);
  return v3;
}

uint64_t sub_21ECC9B70()
{
  return swift_initClassMetadata2();
}

uint64_t sub_21ECC9BB8()
{
  uint64_t v1 = sub_21ECD4AE8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_21ECC9CA8()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(sub_21ECD4AE8() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = v0 + v4;
  unint64_t v6 = (uint64_t *)(v0 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v7 = *v6;
  uint64_t v8 = v6[1];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v9;
  void *v9 = v1;
  v9[1] = sub_21ECC9DC0;
  return sub_21ECC8E40((uint64_t)v9, v10, v11, v5, v7, v8, v2);
}

uint64_t sub_21ECC9DC0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_21ECC9EB4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EA41E8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21ECC9F14()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21ECC9F4C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_21ECC9DC0;
  unint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_267EA4200 + dword_267EA4200);
  return v6(a1, v4);
}

void static PairedDeviceRegistry.isCurrentDeviceTinkerPaired()()
{
  uint64_t v0 = self;
  id v1 = objc_msgSend(v0, sel_sharedInstance);
  if (!v1)
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    return;
  }
  uint64_t v2 = v1;
  uint64_t v3 = (uint64_t (*)())objc_msgSend(v0, sel_activePairedDeviceSelectorBlock);
  if (v3)
  {
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v3;
    uint64_t v5 = swift_allocObject();
    uint64_t v3 = sub_21ECCA40C;
    *(void *)(v5 + 16) = sub_21ECCA40C;
    *(void *)(v5 + 24) = v4;
    uint64_t v15 = sub_21ECCA444;
    uint64_t v16 = v5;
    *(void *)&long long v13 = MEMORY[0x263EF8330];
    *((void *)&v13 + 1) = 1107296256;
    *(void *)&long long v14 = sub_21ECCA470;
    *((void *)&v14 + 1) = &block_descriptor_0;
    unint64_t v6 = _Block_copy(&v13);
    swift_release();
  }
  else
  {
    unint64_t v6 = 0;
  }
  id v7 = objc_msgSend(v2, sel_getAllDevicesWithArchivedAltAccountDevicesMatching_, v6);
  sub_21ECCA320((uint64_t)v3);
  _Block_release(v6);

  if (!v7) {
    goto LABEL_27;
  }
  sub_21ECCA398(0, &qword_267EA4210);
  unint64_t v8 = sub_21ECD49D8();

  if (!(v8 >> 62))
  {
    if (*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_8;
    }
LABEL_21:
    swift_bridgeObjectRelease();
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_21ECD4C28();
  swift_bridgeObjectRelease();
  if (!v12) {
    goto LABEL_21;
  }
LABEL_8:
  if ((v8 & 0xC000000000000001) == 0)
  {
    if (*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      id v9 = *(id *)(v8 + 32);
      goto LABEL_11;
    }
    __break(1u);
    goto LABEL_26;
  }
  id v9 = (id)MEMORY[0x223C38700](0, v8);
LABEL_11:
  uint64_t v10 = v9;
  swift_bridgeObjectRelease();
  if (!v10)
  {
LABEL_22:
    long long v13 = 0u;
    long long v14 = 0u;
    goto LABEL_23;
  }
  if (objc_msgSend(v10, sel_valueForProperty_, *MEMORY[0x263F575B0]))
  {
    sub_21ECD4B88();
    swift_unknownObjectRelease();
  }
  else
  {
    *(_OWORD *)uint64_t v17 = 0u;
    long long v18 = 0u;
  }
  sub_21ECCA330((uint64_t)v17, (uint64_t)&v13);
  if (!*((void *)&v14 + 1))
  {

LABEL_23:
    sub_21ECC862C((uint64_t)&v13);
    return;
  }
  sub_21ECCA398(0, &qword_267EA4218);
  if (swift_dynamicCast())
  {
    id v11 = v17[0];
    objc_msgSend(v17[0], sel_BOOLValue);
  }
  else
  {
  }
}

uint64_t sub_21ECCA320(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_21ECCA330(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EA41A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21ECCA398(uint64_t a1, unint64_t *a2)
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

uint64_t sub_21ECCA3D4()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_21ECCA40C()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_21ECCA434()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21ECCA444()
{
  return (*(uint64_t (**)(void))(v0 + 16))() & 1;
}

uint64_t sub_21ECCA470(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = *(uint64_t (**)(void *))(a1 + 32);
  id v4 = a2;
  LOBYTE(v2) = v3(v2);

  return v2 & 1;
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

ValueMetadata *type metadata accessor for PairedDeviceRegistry()
{
  return &type metadata for PairedDeviceRegistry;
}

uint64_t static Task<>.sleep(seconds:)(double a1)
{
  *(double *)(v1 + 16) = a1;
  return MEMORY[0x270FA2498](sub_21ECCA504, 0, 0);
}

uint64_t sub_21ECCA504(unint64_t a1)
{
  double v2 = *(double *)(v1 + 16) * 1000000000.0;
  if ((~*(void *)&v2 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v2 <= -1.0)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (v2 >= 1.84467441e19)
  {
LABEL_9:
    __break(1u);
    return MEMORY[0x270FA1FF0](a1);
  }
  unint64_t v3 = (unint64_t)v2;
  id v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v4;
  *id v4 = v1;
  v4[1] = sub_21ECCA5E8;
  a1 = v3;
  return MEMORY[0x270FA1FF0](a1);
}

uint64_t sub_21ECCA5E8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t variable initialization expression of CancellationHandlingContinuation.resumptionHandlers()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EA4228);
  sub_21ECD4CF8();
  swift_getFunctionTypeMetadata1();
  return sub_21ECD4958();
}

uint64_t variable initialization expression of CancellationHandlingContinuation.result@<X0>(uint64_t a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EA4228);
  uint64_t v2 = sub_21ECD4CF8();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);
  return v3(a1, 1, 1, v2);
}

BOOL CancellationHandlingContinuation.isResumed.getter()
{
  uint64_t v1 = *v0;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EA4228);
  uint64_t v2 = sub_21ECD4CF8();
  uint64_t v3 = sub_21ECD4B58();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v10 - v5;
  id v7 = (char *)v0 + *(void *)(v1 + 104);
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v7, v3);
  BOOL v8 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(v6, 1, v2) != 1;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v8;
}

uint64_t CancellationHandlingContinuation.addResumptionHandler(_:)(uint64_t a1, uint64_t a2)
{
  v3[11] = a2;
  v3[12] = v2;
  v3[10] = a1;
  v3[13] = *(void *)(*(void *)v2 + 80);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EA4228);
  uint64_t v4 = sub_21ECD4CF8();
  v3[14] = v4;
  uint64_t v5 = sub_21ECD4B58();
  v3[15] = v5;
  v3[16] = *(void *)(v5 - 8);
  v3[17] = swift_task_alloc();
  v3[18] = *(void *)(v4 - 8);
  v3[19] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_21ECCAAC4, v2, 0);
}

uint64_t sub_21ECCAAC4()
{
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[18];
  uint64_t v3 = v0[15];
  uint64_t v4 = v0[16];
  uint64_t v5 = v0[14];
  uint64_t v6 = v0[12] + *(void *)(*(void *)v0[12] + 104);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v1, v6, v3);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v1, 1, v5) == 1)
  {
    uint64_t v7 = v0[13];
    uint64_t v9 = v0[10];
    uint64_t v8 = v0[11];
    (*(void (**)(void, void))(v0[16] + 8))(v0[17], v0[15]);
    uint64_t v10 = (void *)swift_allocObject();
    v10[2] = v7;
    v10[3] = v9;
    v10[4] = v8;
    v0[8] = &unk_267EA4240;
    v0[9] = v10;
    swift_beginAccess();
    swift_getFunctionTypeMetadata1();
    sub_21ECD4A38();
    swift_retain();
    sub_21ECD4A08();
    swift_endAccess();
    swift_task_dealloc();
    swift_task_dealloc();
    id v11 = (uint64_t (*)(void))v0[1];
    return v11();
  }
  else
  {
    long long v13 = (int *)v0[10];
    (*(void (**)(void, void, void))(v0[18] + 32))(v0[19], v0[17], v0[14]);
    uint64_t v16 = (uint64_t (*)(uint64_t))((char *)v13 + *v13);
    long long v14 = (void *)swift_task_alloc();
    v0[20] = v14;
    *long long v14 = v0;
    v14[1] = sub_21ECCAD58;
    uint64_t v15 = v0[19];
    return v16(v15);
  }
}

uint64_t sub_21ECCAD58()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 96);
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_21ECCAE68, v1, 0);
}

uint64_t sub_21ECCAE68()
{
  (*(void (**)(void, void))(v0[18] + 8))(v0[19], v0[14]);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_21ECCAEEC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v7 = (uint64_t (*)(uint64_t))((char *)a3 + *a3);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v5;
  *uint64_t v5 = v3;
  v5[1] = sub_21ECCEEB4;
  return v7(a2);
}

uint64_t sub_21ECCAFC4()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_21ECCAFFC(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(int **)(v2 + 24);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_21ECCEEB4;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_267EA4238 + dword_267EA4238);
  return v8(a1, a2, v6);
}

uint64_t CancellationHandlingContinuation.resume(returning:)(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  v2[4] = *(void *)(*(void *)v1 + 80);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EA4228);
  uint64_t v3 = sub_21ECD4CF8();
  v2[5] = v3;
  v2[6] = *(void *)(v3 - 8);
  v2[7] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_21ECCB1C0, v1, 0);
}

uint64_t sub_21ECCB1C0()
{
  uint64_t v1 = v0[3];
  (*(void (**)(void, void))(*(void *)(v0[4] - 8) + 16))(v0[7], v0[2]);
  swift_storeEnumTagMultiPayload();
  uint64_t v5 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 192) + **(int **)(*(void *)v1 + 192));
  uint64_t v2 = (void *)swift_task_alloc();
  v0[8] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_21ECCB310;
  uint64_t v3 = v0[7];
  return v5(v3);
}

uint64_t sub_21ECCB310()
{
  uint64_t v1 = *(void *)(*v0 + 56);
  uint64_t v2 = *(void *)(*v0 + 48);
  uint64_t v3 = *(void *)(*v0 + 40);
  uint64_t v6 = *v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

uint64_t CancellationHandlingContinuation.resume(throwing:)(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EA4228);
  uint64_t v3 = sub_21ECD4CF8();
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_21ECCB558, v1, 0);
}

uint64_t sub_21ECCB558()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = *(void **)(v0 + 16);
  **(void **)(v0 + 48) = v2;
  swift_storeEnumTagMultiPayload();
  uint64_t v3 = *(int **)(*(void *)v1 + 192);
  id v4 = v2;
  uint64_t v8 = (uint64_t (*)(uint64_t))((char *)v3 + *v3);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_21ECCB680;
  uint64_t v6 = *(void *)(v0 + 48);
  return v8(v6);
}

uint64_t sub_21ECCB680()
{
  uint64_t v1 = *(void *)(*v0 + 48);
  uint64_t v2 = *(void *)(*v0 + 40);
  uint64_t v3 = *(void *)(*v0 + 32);
  uint64_t v6 = *v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  id v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

uint64_t CancellationHandlingContinuation.resume(with:)(uint64_t a1)
{
  v2[14] = a1;
  v2[15] = v1;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EA4228);
  v2[16] = sub_21ECD4CF8();
  uint64_t v3 = sub_21ECD4B58();
  v2[17] = v3;
  v2[18] = *(void *)(v3 - 8);
  v2[19] = swift_task_alloc();
  v2[20] = swift_task_alloc();
  v2[21] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_21ECCB8F4, v1, 0);
}

uint64_t sub_21ECCB8F4()
{
  uint64_t v1 = v0[21];
  uint64_t v2 = v0[17];
  uint64_t v3 = v0[18];
  uint64_t v4 = v0[16];
  uint64_t v5 = v0[15] + *(void *)(*(void *)v0[15] + 104);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v5, v2);
  uint64_t v6 = *(void *)(v4 - 8);
  LODWORD(v4) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v1, 1, v4);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  if (v4 == 1)
  {
    uint64_t v8 = v0[19];
    uint64_t v7 = v0[20];
    uint64_t v10 = v0[17];
    uint64_t v9 = v0[18];
    uint64_t v12 = v0[15];
    uint64_t v11 = v0[16];
    (*(void (**)(uint64_t, void, uint64_t))(v6 + 16))(v7, v0[14], v11);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v6 + 56))(v7, 0, 1, v11);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 32))(v8, v7, v10);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 40))(v5, v8, v10);
    swift_endAccess();
    swift_beginAccess();
    v0[22] = *(void *)(v12 + 112);
    FunctionTypeMetadata1 = swift_getFunctionTypeMetadata1();
    v0[23] = FunctionTypeMetadata1;
    uint64_t v14 = swift_bridgeObjectRetain();
    if (MEMORY[0x223C38520](v14, FunctionTypeMetadata1))
    {
      char v15 = sub_21ECD49F8();
      sub_21ECD49E8();
      if (v15)
      {
        uint64_t v16 = v0[22];
        uint64_t v17 = *(int **)(v16 + 32);
        v0[24] = *(void *)(v16 + 40);
        v0[25] = 1;
        uint64_t v21 = (uint64_t (*)(void))((char *)v17 + *v17);
        swift_retain();
        long long v18 = (void *)swift_task_alloc();
        v0[26] = v18;
        *long long v18 = v0;
        v18[1] = sub_21ECCBCAC;
        return v21();
      }
      else
      {
        uint64_t result = sub_21ECD4BE8();
        __break(1u);
      }
      return result;
    }
    swift_bridgeObjectRelease();
    swift_beginAccess();
    sub_21ECD4A38();
    sub_21ECD4A28();
    swift_endAccess();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v20 = (uint64_t (*)(void))v0[1];
  return v20();
}

uint64_t sub_21ECCBCAC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 120);
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_21ECCBDBC, v1, 0);
}

uint64_t sub_21ECCBDBC()
{
  uint64_t v1 = v0[25];
  uint64_t v2 = v0[22];
  uint64_t v3 = v0[23];
  swift_release();
  if (v1 == MEMORY[0x223C38520](v2, v3))
  {
    swift_bridgeObjectRelease();
    swift_beginAccess();
    sub_21ECD4A38();
    sub_21ECD4A28();
    swift_endAccess();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = (uint64_t (*)(void))v0[1];
    return v4();
  }
  uint64_t v6 = v0[25];
  char v7 = sub_21ECD49F8();
  sub_21ECD49E8();
  if ((v7 & 1) == 0)
  {
    uint64_t result = sub_21ECD4BE8();
    __break(1u);
LABEL_14:
    __break(1u);
    return result;
  }
  uint64_t v8 = v0[22] + 16 * v6;
  uint64_t v9 = *(int **)(v8 + 32);
  v0[24] = *(void *)(v8 + 40);
  BOOL v10 = __OFADD__(v6, 1);
  uint64_t v11 = v6 + 1;
  char v12 = v10;
  uint64_t result = swift_retain();
  if (v12) {
    goto LABEL_14;
  }
  v0[25] = v11;
  uint64_t v14 = (uint64_t (*)(void))((char *)v9 + *v9);
  long long v13 = (void *)swift_task_alloc();
  v0[26] = v13;
  *long long v13 = v0;
  v13[1] = sub_21ECCBCAC;
  return v14();
}

uint64_t CancellationHandlingContinuation.deinit()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + *(void *)(*(void *)v0 + 104);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EA4228);
  sub_21ECD4CF8();
  uint64_t v2 = sub_21ECD4B58();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_defaultActor_destroy();
  return v0;
}

uint64_t CancellationHandlingContinuation.__deallocating_deinit()
{
  CancellationHandlingContinuation.deinit();
  return MEMORY[0x270FA2418](v0);
}

uint64_t sub_21ECCC0B8()
{
  uint64_t v0 = swift_allocObject();
  sub_21ECCC0F0();
  return v0;
}

void *sub_21ECCC0F0()
{
  swift_defaultActor_initialize();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EA4228);
  sub_21ECD4CF8();
  swift_getFunctionTypeMetadata1();
  v0[14] = sub_21ECD4958();
  uint64_t v1 = (char *)v0 + *(void *)(*v0 + 104);
  uint64_t v2 = swift_checkMetadataState();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  return v0;
}

uint64_t CancellationHandlingContinuation.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_21ECCC1EC()
{
  return CancellationHandlingContinuation.unownedExecutor.getter();
}

uint64_t CancellationHandlingContinuation<>.resume()()
{
  *(void *)(v1 + 16) = 0;
  *(unsigned char *)(v1 + 24) = 0;
  uint64_t v4 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v0 + 192) + **(int **)(*(void *)v0 + 192));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 32) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_21ECCC314;
  return v4(v1 + 16);
}

uint64_t sub_21ECCC314()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t withCancellationHandlingContinuation<A>(timeout:_:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 40) = a5;
  *(void *)(v6 + 48) = a6;
  *(void *)(v6 + 24) = a2;
  *(void *)(v6 + 32) = a4;
  *(unsigned char *)(v6 + 120) = a3;
  *(void *)(v6 + 16) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EA41E8);
  *(void *)(v6 + 56) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_21ECCC4A8, 0, 0);
}

uint64_t sub_21ECCC4A8()
{
  char v1 = *(unsigned char *)(v0 + 120);
  type metadata accessor for CancellationHandlingContinuation();
  uint64_t v2 = swift_allocObject();
  *(void *)(v0 + 64) = v2;
  sub_21ECCC0F0();
  if (v1)
  {
    uint64_t v12 = *(void *)(v0 + 64);
    uint64_t v13 = swift_task_alloc();
    *(void *)(v0 + 96) = v13;
    *(_OWORD *)(v13 + 16) = *(_OWORD *)(v0 + 32);
    *(void *)(v13 + 32) = v12;
    uint64_t v19 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_267EA4280
                                                                                       + dword_267EA4280);
    uint64_t v14 = (void *)swift_task_alloc();
    *(void *)(v0 + 104) = v14;
    *uint64_t v14 = v0;
    v14[1] = sub_21ECCC9B0;
    uint64_t v15 = *(void *)(v0 + 64);
    uint64_t v16 = *(void *)(v0 + 48);
    uint64_t v17 = *(void *)(v0 + 16);
    return v19(v17, (uint64_t)sub_21ECCE4FC, v15, (uint64_t)&unk_267EA4278, v13, v16);
  }
  else
  {
    uint64_t v4 = *(void *)(v0 + 48);
    uint64_t v3 = *(void *)(v0 + 56);
    uint64_t v5 = *(void *)(v0 + 24);
    uint64_t v6 = sub_21ECD4AA8();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v3, 1, 1, v6);
    char v7 = (void *)swift_allocObject();
    v7[2] = 0;
    v7[3] = 0;
    v7[4] = v5;
    v7[5] = v2;
    swift_retain();
    uint64_t v8 = sub_21ECCCFBC(v3, (uint64_t)&unk_267EA4290, (uint64_t)v7);
    *(void *)(v0 + 72) = v8;
    uint64_t v9 = swift_allocObject();
    *(void *)(v0 + 80) = v9;
    *(void *)(v9 + 16) = v4;
    *(void *)(v9 + 24) = v8;
    long long v18 = (uint64_t (*)(void *, uint64_t))(*(void *)(*(void *)v2 + 168)
                                                  + **(int **)(*(void *)v2 + 168));
    swift_retain();
    BOOL v10 = (void *)swift_task_alloc();
    *(void *)(v0 + 88) = v10;
    void *v10 = v0;
    v10[1] = sub_21ECCC790;
    return v18(&unk_267EA42A0, v9);
  }
}

uint64_t sub_21ECCC790()
{
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x270FA2498](sub_21ECCC8A8, 0, 0);
}

uint64_t sub_21ECCC8A8()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 64);
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 96) = v2;
  *(_OWORD *)(v2 + 16) = *(_OWORD *)(v0 + 32);
  *(void *)(v2 + 32) = v1;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t (*)(), uint64_t, void *, uint64_t, uint64_t))((char *)&dword_267EA4280
                                                                                         + dword_267EA4280);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 104) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_21ECCC9B0;
  uint64_t v4 = *(void *)(v0 + 64);
  uint64_t v5 = *(void *)(v0 + 48);
  uint64_t v6 = *(void *)(v0 + 16);
  return v8(v6, sub_21ECCE4FC, v4, &unk_267EA4278, v2, v5);
}

uint64_t sub_21ECCC9B0()
{
  *(void *)(*(void *)v1 + 112) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_21ECCCB38;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_21ECCCACC;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_21ECCCACC()
{
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_21ECCCB38()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_21ECCCBB0(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 16) = a5;
  char v7 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v7;
  *char v7 = v5;
  v7[1] = sub_21ECCCC4C;
  return static Task<>.sleep(seconds:)(a1);
}

uint64_t sub_21ECCCC4C()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
  else
  {
    return MEMORY[0x270FA2498](sub_21ECCCD7C, 0, 0);
  }
}

uint64_t sub_21ECCCD7C()
{
  uint64_t v1 = v0[2];
  nullsub_1();
  sub_21ECCE8CC();
  uint64_t v2 = swift_allocError();
  v0[4] = v2;
  uint64_t v5 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 184) + **(int **)(*(void *)v1 + 184));
  uint64_t v3 = (void *)swift_task_alloc();
  v0[5] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_21ECCCEA8;
  return v5(v2);
}

uint64_t sub_21ECCCEA8()
{
  uint64_t v1 = *(void **)(*v0 + 32);
  uint64_t v4 = *v0;
  swift_task_dealloc();

  uint64_t v2 = *(uint64_t (**)(void))(v4 + 8);
  return v2();
}

uint64_t sub_21ECCCFBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_21ECD4AA8();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_21ECD4A98();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_21ECC9EB4(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_21ECD4A48();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_21ECCD13C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a2;
  return MEMORY[0x270FA2498](sub_21ECCD15C, 0, 0);
}

uint64_t sub_21ECCD15C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EA4228);
  sub_21ECD4AF8();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_21ECCD1E4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EA41E8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_21ECD4AA8();
  uint64_t v6 = *(void *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  char v7 = (void *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = a1;
  int v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  swift_retain();
  if (v8 == 1)
  {
    sub_21ECC9EB4((uint64_t)v4);
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }
  else
  {
    sub_21ECD4A98();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
    if (v7[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v9 = sub_21ECD4A48();
      uint64_t v10 = v11;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v9 = 0;
      uint64_t v10 = 0;
    }
  }
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = &unk_267EA42E0;
  *(void *)(v12 + 24) = v7;
  if (v10 | v9)
  {
    v14[0] = 0;
    v14[1] = 0;
    v14[2] = v9;
    v14[3] = v10;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_21ECCD420(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a4;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EA4228);
  uint64_t v5 = sub_21ECD4CF8();
  v4[3] = v5;
  v4[4] = *(void *)(v5 - 8);
  v4[5] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_21ECCD510, 0, 0);
}

uint64_t sub_21ECCD510()
{
  uint64_t v1 = (uint64_t *)v0[5];
  uint64_t v2 = v0[2];
  sub_21ECD4A88();
  sub_21ECCEE5C();
  uint64_t v3 = swift_allocError();
  sub_21ECD4968();
  *uint64_t v1 = v3;
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v2 + 192) + **(int **)(*(void *)v2 + 192));
  uint64_t v4 = (void *)swift_task_alloc();
  v0[6] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_21ECCD66C;
  uint64_t v5 = v0[5];
  return v7(v5);
}

uint64_t sub_21ECCD66C()
{
  uint64_t v1 = *(void *)(*v0 + 40);
  uint64_t v2 = *(void *)(*v0 + 32);
  uint64_t v3 = *(void *)(*v0 + 24);
  uint64_t v6 = *v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

uint64_t sub_21ECCD7C4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  v4[6] = *a4;
  return MEMORY[0x270FA2498](sub_21ECCD810, 0, 0);
}

uint64_t sub_21ECCD810()
{
  uint64_t v1 = *(void *)(v0 + 48);
  (*(void (**)(void))(v0 + 24))(*(void *)(v0 + 40));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v2;
  uint64_t v3 = *(void *)(v1 + 80);
  *uint64_t v2 = v0;
  v2[1] = sub_21ECCD8F4;
  uint64_t v4 = *(void *)(v0 + 40);
  uint64_t v5 = *(void *)(v0 + 16);
  return MEMORY[0x270FA2360](v5, 0, 0, 0xD000000000000030, 0x800000021ECD6AB0, sub_21ECCE920, v4, v3);
}

uint64_t sub_21ECCD8F4()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_21ECCDA28, 0, 0);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_21ECCDA28()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21ECCDA40(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(*(void *)a2 + 80);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EA4228);
  uint64_t v5 = sub_21ECD4A78();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v16 - v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EA41E8);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_21ECD4AA8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, v5);
  unint64_t v13 = (*(unsigned __int8 *)(v6 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v14 = (char *)swift_allocObject();
  *((void *)v14 + 2) = 0;
  *((void *)v14 + 3) = 0;
  *((void *)v14 + 4) = v4;
  *((void *)v14 + 5) = a2;
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(&v14[v13], v8, v5);
  swift_retain();
  sub_21ECC94A4((uint64_t)v11, (uint64_t)&unk_267EA42C0, (uint64_t)v14);
  return swift_release();
}

uint64_t sub_21ECCDC4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = a4;
  v5[3] = a5;
  v5[4] = *(void *)(*(void *)a4 + 80);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EA4228);
  uint64_t v6 = sub_21ECD4A78();
  v5[5] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v5[6] = v7;
  v5[7] = *(void *)(v7 + 64);
  v5[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_21ECCDD48, 0, 0);
}

uint64_t sub_21ECCDD48()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = v0[5];
  uint64_t v3 = v0[6];
  uint64_t v4 = v0[4];
  uint64_t v5 = v0[2];
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 16))(v1, v0[3], v2);
  unint64_t v6 = (*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = swift_allocObject();
  v0[9] = v7;
  *(void *)(v7 + 16) = v4;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v7 + v6, v1, v2);
  uint64_t v10 = (uint64_t (*)(void *, uint64_t))(*(void *)(*(void *)v5 + 168) + **(int **)(*(void *)v5 + 168));
  uint64_t v8 = (void *)swift_task_alloc();
  v0[10] = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_21ECCDEE4;
  return v10(&unk_267EA42D0, v7);
}

uint64_t sub_21ECCDEE4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_21ECCE010(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return MEMORY[0x270FA2498](sub_21ECCE034, 0, 0);
}

uint64_t sub_21ECCE034()
{
  uint64_t v1 = *(void *)(v0 + 16);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EA4228);
  uint64_t v2 = sub_21ECD4A78();
  sub_21ECCE0CC(v1, v2);
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_21ECCE0CC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](a1);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(v8 + 24);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_21ECD4CF8();
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v18 - v14;
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))((char *)&v18 - v14, a1, v13);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v15, v9);
    return sub_21ECD4A58();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v7, v15, v3);
    return sub_21ECD4A68();
  }
}

uint64_t sub_21ECCE308(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v15 = (char *)&dword_267EA42B0 + dword_267EA42B0;
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v13;
  *uint64_t v13 = v6;
  v13[1] = sub_21ECC9DC0;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, uint64_t))v15)(a1, a4, a5, a2, a3, 0, 0, a6);
}

uint64_t sub_21ECCE3F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v17 = (void *)swift_task_alloc();
  *(void *)(v8 + 16) = v17;
  void *v17 = v8;
  v17[1] = sub_21ECCEEB4;
  return MEMORY[0x270FA2338](a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t type metadata accessor for CancellationHandlingContinuation()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_21ECCE4FC()
{
  return sub_21ECCD1E4(v0);
}

uint64_t sub_21ECCE504(uint64_t a1)
{
  uint64_t v4 = *(void **)(v1 + 32);
  uint64_t v5 = swift_task_alloc();
  long long v6 = *(_OWORD *)(v1 + 16);
  *(void *)(v2 + 16) = v5;
  *(void *)uint64_t v5 = v2;
  *(void *)(v5 + 8) = sub_21ECC9DC0;
  *(void *)(v5 + 40) = v4;
  *(_OWORD *)(v5 + 24) = v6;
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 48) = *v4;
  return MEMORY[0x270FA2498](sub_21ECCD810, 0, 0);
}

uint64_t sub_21ECCE5F0()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_21ECCE630()
{
  double v2 = *(double *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_21ECCEEB4;
  v4[2] = v3;
  uint64_t v5 = (void *)swift_task_alloc();
  v4[3] = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_21ECCCC4C;
  return static Task<>.sleep(seconds:)(v2);
}

uint64_t sub_21ECCE718()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21ECCE750()
{
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_21ECCEEB4;
  v3[2] = v2;
  return MEMORY[0x270FA2498](sub_21ECCD15C, 0, 0);
}

uint64_t sub_21ECCE7F8()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EA4228);
  sub_21ECD4CF8();
  uint64_t result = sub_21ECD4B58();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

unint64_t sub_21ECCE8CC()
{
  unint64_t result = qword_267EA42A8;
  if (!qword_267EA42A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EA42A8);
  }
  return result;
}

uint64_t sub_21ECCE920(uint64_t a1)
{
  return sub_21ECCDA40(a1, v1);
}

uint64_t sub_21ECCE928()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EA4228);
  uint64_t v1 = sub_21ECD4A78();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_21ECCEA1C()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EA4228);
  uint64_t v2 = *(void *)(sub_21ECD4A78() - 8);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_21ECC9DC0;
  return sub_21ECCDC4C((uint64_t)v5, v6, v7, v3, v4);
}

uint64_t sub_21ECCEB10()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EA4228);
  uint64_t v1 = sub_21ECD4A78();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_21ECCEBC0(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EA4228);
  uint64_t v5 = *(void *)(sub_21ECD4A78() - 8);
  uint64_t v6 = v1 + ((*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[3] = v6;
  v7[4] = v4;
  v7[1] = sub_21ECCEEB4;
  v7[2] = a1;
  return MEMORY[0x270FA2498](sub_21ECCE034, 0, 0);
}

uint64_t sub_21ECCECD0()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_21ECCED10()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_21ECCEEB4;
  return sub_21ECCD420((uint64_t)v3, v4, v5, v2);
}

uint64_t sub_21ECCEDA4(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_21ECCEEB4;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_267EA4200 + dword_267EA4200);
  return v6(a1, v4);
}

unint64_t sub_21ECCEE5C()
{
  unint64_t result = qword_267EA42F0;
  if (!qword_267EA42F0)
  {
    sub_21ECD4A88();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EA42F0);
  }
  return result;
}

id variable initialization expression of Cache.cache()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EA42F8);
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return objc_msgSend(v0, sel_init);
}

uint64_t type metadata accessor for Cache.WrappedKey()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for Cache.WrappedValue()
{
  return __swift_instantiateGenericMetadata();
}

char *Cache.__allocating_init(capacity:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return Cache.init(capacity:)(a1);
}

char *Cache.init(capacity:)(uint64_t a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = qword_267EA4300;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EA42F8);
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  uint64_t v6 = v1;
  *(void *)&v1[v4] = objc_msgSend(objc_allocWithZone(ObjCClassFromMetadata), sel_init);

  v9.receiver = v6;
  v9.super_class = ObjectType;
  uint64_t v7 = (char *)objc_msgSendSuper2(&v9, sel_init);
  objc_msgSend(*(id *)&v7[qword_267EA4300], sel_setCountLimit_, a1);
  return v7;
}

uint64_t Cache.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void **)((char *)v2 + qword_267EA4300);
  uint64_t v6 = *(void *)((*MEMORY[0x263F8EED0] & *v2) + 0x58);
  type metadata accessor for Cache.WrappedKey();
  id v7 = sub_21ECCFDA4(a1);
  uint64_t v8 = (char *)objc_msgSend(v5, sel_objectForKey_, v7);

  if (v8)
  {
    uint64_t v13 = *(void *)(v6 - 8);
    (*(void (**)(uint64_t, char *, uint64_t))(v13 + 16))(a2, &v8[*(void *)(*(void *)v8 + 104)], v6);
    swift_release();
    uint64_t v9 = v13;
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v9 = *(void *)(v6 - 8);
    uint64_t v10 = 1;
  }
  uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
  return v11(a2, v10, 1, v6);
}

uint64_t Cache.subscript.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v29 = a2;
  uint64_t v4 = *MEMORY[0x263F8EED0] & *v2;
  uint64_t v5 = *(void *)(v4 + 0x58);
  uint64_t v6 = sub_21ECD4B58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v28 - v9;
  uint64_t v11 = *(void *)(v5 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v8);
  uint64_t v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v28 - v15;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, a1, v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v10, 1, v5) == 1)
  {
    uint64_t v17 = *(void (**)(char *, uint64_t))(v7 + 8);
    v17(v10, v6);
    uint64_t v18 = *(void **)((char *)v2 + qword_267EA4300);
    uint64_t v19 = *(void *)(v4 + 80);
    type metadata accessor for Cache.WrappedKey();
    uint64_t v20 = v29;
    id v21 = sub_21ECCFDA4(v29);
    objc_msgSend(v18, sel_removeObjectForKey_, v21);

    (*(void (**)(uint64_t, uint64_t))(*(void *)(v19 - 8) + 8))(v20, v19);
    return ((uint64_t (*)(uint64_t, uint64_t))v17)(a1, v6);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v16, v10, v5);
    uint64_t v28 = a1;
    id v23 = *(void **)((char *)v2 + qword_267EA4300);
    uint64_t v24 = *(void *)(v4 + 80);
    type metadata accessor for Cache.WrappedValue();
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v16, v5);
    uint64_t v25 = sub_21ECCF598((uint64_t)v14);
    type metadata accessor for Cache.WrappedKey();
    uint64_t v26 = v29;
    id v27 = sub_21ECCFDA4(v29);
    objc_msgSend(v23, sel_setObject_forKey_, v25, v27);
    swift_release();

    (*(void (**)(uint64_t, uint64_t))(*(void *)(v24 - 8) + 8))(v26, v24);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v28, v6);
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v16, v5);
  }
}

uint64_t sub_21ECCF598(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(*(void *)(*(void *)v2 + 88) - 8) + 32))(v2 + *(void *)(*(void *)v2 + 104), a1);
  return v2;
}

void (*Cache.subscript.modify(void *a1, uint64_t a2))(uint64_t a1, char a2)
{
  uint64_t v5 = malloc(0x48uLL);
  *a1 = v5;
  *uint64_t v5 = v2;
  uint64_t v6 = *MEMORY[0x263F8EED0] & *v2;
  uint64_t v7 = sub_21ECD4B58();
  v5[1] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v5[2] = v8;
  size_t v9 = *(void *)(v8 + 64);
  v5[3] = malloc(v9);
  uint64_t v10 = malloc(v9);
  v5[4] = v10;
  uint64_t v11 = *(void *)(v6 + 80);
  v5[5] = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = v12;
  v5[6] = v12;
  size_t v14 = *(void *)(v12 + 64);
  v5[7] = malloc(v14);
  v5[8] = malloc(v14);
  (*(void (**)(void))(v13 + 16))();
  Cache.subscript.getter(a2, (uint64_t)v10);
  return sub_21ECCF7C4;
}

void sub_21ECCF7C4(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  id v3 = *(void **)(*(void *)a1 + 56);
  uint64_t v4 = *(void **)(*(void *)a1 + 64);
  if (a2)
  {
    uint64_t v5 = v2[5];
    uint64_t v6 = v2[6];
    uint64_t v8 = (void *)v2[3];
    uint64_t v7 = (void *)v2[4];
    uint64_t v9 = v2[1];
    uint64_t v10 = v2[2];
    (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v8, v7, v9);
    (*(void (**)(void *, void *, uint64_t))(v6 + 32))(v3, v4, v5);
    Cache.subscript.setter((uint64_t)v8, (uint64_t)v3);
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
  }
  else
  {
    uint64_t v8 = (void *)v2[3];
    uint64_t v7 = (void *)v2[4];
    Cache.subscript.setter((uint64_t)v7, (uint64_t)v4);
  }
  free(v4);
  free(v3);
  free(v7);
  free(v8);
  free(v2);
}

id Cache.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void Cache.init()()
{
}

void sub_21ECCF950()
{
}

void sub_21ECCF9AC(uint64_t a1)
{
}

uint64_t sub_21ECCF9BC@<X0>(uint64_t *a1@<X8>)
{
  swift_getObjectType();
  uint64_t result = sub_21ECD4898();
  *a1 = result;
  return result;
}

uint64_t sub_21ECCF9FC(void *a1)
{
  id v1 = a1;
  uint64_t v2 = sub_21ECCFA30();

  return v2;
}

uint64_t sub_21ECCFA30()
{
  return sub_21ECD4978();
}

uint64_t sub_21ECCFAA8(uint64_t a1)
{
  swift_getObjectType();
  sub_21ECD0050(a1, (uint64_t)v5);
  if (!v6)
  {
    sub_21ECC862C((uint64_t)v5);
    goto LABEL_5;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_5:
    char v2 = 0;
    return v2 & 1;
  }
  char v2 = sub_21ECD4988();

  return v2 & 1;
}

uint64_t sub_21ECCFBCC(void *a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = a1;
    swift_unknownObjectRetain();
    sub_21ECD4B88();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    id v5 = a1;
  }
  char v6 = sub_21ECCFAA8((uint64_t)v8);

  sub_21ECC862C((uint64_t)v8);
  return v6 & 1;
}

void sub_21ECCFC44()
{
}

id _s14NanoPhotosCore5CacheCfD_0()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_21ECCFC90(char *a1)
{
  return (*(uint64_t (**)(char *))(*(void *)(*(void *)((*MEMORY[0x263F8EED0] & *(void *)a1) + 0x50)
                                                       - 8)
                                           + 8))(&a1[*(void *)((*MEMORY[0x263F8EED0] & *(void *)a1) + 0x68)]);
}

uint64_t sub_21ECCFCF8()
{
  (*(void (**)(uint64_t))(*(void *)(*(void *)(*(void *)v0 + 88) - 8) + 8))(v0 + *(void *)(*(void *)v0 + 104));
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

id sub_21ECCFDA4(uint64_t a1)
{
  id v3 = (char *)objc_allocWithZone(v1);
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  (*(void (**)(char *, uint64_t))(*(void *)(*(void *)((*MEMORY[0x263F8EED0] & *(void *)v3) + 0x50)
                                                      - 8)
                                          + 16))(&v3[*(void *)((*MEMORY[0x263F8EED0] & *(void *)v3) + 0x68)], a1);
  v6.receiver = v3;
  v6.super_class = ObjectType;
  return objc_msgSendSuper2(&v6, sel_init);
}

void sub_21ECCFE68()
{
}

uint64_t sub_21ECCFE98()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for Cache()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_21ECCFEF8()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_21ECCFF8C()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void sub_21ECD0020()
{
}

uint64_t sub_21ECD0050(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EA41A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_21ECD2988(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21ECD2AA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21ECD2BC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21ECD40E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id nanophotos_log_NanoPhotosCore()
{
  if (nanophotos_log_NanoPhotosCore_onceToken != -1) {
    dispatch_once(&nanophotos_log_NanoPhotosCore_onceToken, &__block_literal_global);
  }
  uint64_t v0 = (void *)nanophotos_log_NanoPhotosCore_log;
  return v0;
}

id nanophotos_log_NanoPhotosUI()
{
  if (qword_267EA4BC8 != -1) {
    dispatch_once(&qword_267EA4BC8, &__block_literal_global_4);
  }
  uint64_t v0 = (void *)_MergedGlobals;
  return v0;
}

id nanophotos_log_sync()
{
  if (nanophotos_log_sync_onceToken != -1) {
    dispatch_once(&nanophotos_log_sync_onceToken, &__block_literal_global_7);
  }
  uint64_t v0 = (void *)nanophotos_log_sync_log;
  return v0;
}

uint64_t __nanophotos_log_sync_block_invoke()
{
  nanophotos_log_sync_log = (uint64_t)os_log_create("com.apple.NanoPhotos", "sync");
  return MEMORY[0x270F9A758]();
}

id nanophotos_log_sync_oversize()
{
  if (nanophotos_log_sync_oversize_onceToken != -1) {
    dispatch_once(&nanophotos_log_sync_oversize_onceToken, &__block_literal_global_10);
  }
  uint64_t v0 = (void *)nanophotos_log_sync_oversize_log;
  return v0;
}

uint64_t __nanophotos_log_sync_oversize_block_invoke()
{
  nanophotos_log_sync_oversize_log = (uint64_t)os_log_create("com.apple.NanoPhotos", "sync_oversize");
  return MEMORY[0x270F9A758]();
}

id nanophotos_log_bridge()
{
  if (qword_267EA4BD8 != -1) {
    dispatch_once(&qword_267EA4BD8, &__block_literal_global_13);
  }
  uint64_t v0 = (void *)qword_267EA4BD0;
  return v0;
}

uint64_t __nanophotos_log_bridge_block_invoke()
{
  qword_267EA4BD0 = (uint64_t)os_log_create("com.apple.NanoPhotos", "bridge");
  return MEMORY[0x270F9A758]();
}

id nanophotos_log_Settings()
{
  if (qword_267EA4BE8 != -1) {
    dispatch_once(&qword_267EA4BE8, &__block_literal_global_16);
  }
  uint64_t v0 = (void *)qword_267EA4BE0;
  return v0;
}

uint64_t sub_21ECD47A8()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_21ECD47B8()
{
  return MEMORY[0x270EEFC48]();
}

uint64_t sub_21ECD47C8()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_21ECD47D8()
{
  return MEMORY[0x270EEFD58]();
}

uint64_t sub_21ECD47E8()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t sub_21ECD47F8()
{
  return MEMORY[0x270EEFD90]();
}

uint64_t sub_21ECD4808()
{
  return MEMORY[0x270EEFE00]();
}

uint64_t sub_21ECD4818()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_21ECD4828()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_21ECD4838()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_21ECD4848()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_21ECD4858()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_21ECD4868()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_21ECD4878()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_21ECD4888()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_21ECD4898()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_21ECD48A8()
{
  return MEMORY[0x270EE3C50]();
}

uint64_t sub_21ECD48B8()
{
  return MEMORY[0x270EE3C60]();
}

uint64_t sub_21ECD48C8()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_21ECD48D8()
{
  return MEMORY[0x270EE3DB0]();
}

uint64_t sub_21ECD48E8()
{
  return MEMORY[0x270EE3DB8]();
}

uint64_t sub_21ECD48F8()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_21ECD4908()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_21ECD4918()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_21ECD4928()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_21ECD4938()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_21ECD4948()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_21ECD4958()
{
  return MEMORY[0x270F9CFC0]();
}

uint64_t sub_21ECD4968()
{
  return MEMORY[0x270FA1DF0]();
}

uint64_t sub_21ECD4978()
{
  return MEMORY[0x270F9D328]();
}

uint64_t sub_21ECD4988()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_21ECD4998()
{
  return MEMORY[0x270EF1890]();
}

uint64_t sub_21ECD49A8()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_21ECD49B8()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_21ECD49C8()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_21ECD49D8()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_21ECD49E8()
{
  return MEMORY[0x270F9DBD0]();
}

uint64_t sub_21ECD49F8()
{
  return MEMORY[0x270F9DC30]();
}

uint64_t sub_21ECD4A08()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_21ECD4A18()
{
  return MEMORY[0x270F9DCA8]();
}

uint64_t sub_21ECD4A28()
{
  return MEMORY[0x270F9DCC8]();
}

uint64_t sub_21ECD4A38()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_21ECD4A48()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_21ECD4A58()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_21ECD4A68()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_21ECD4A78()
{
  return MEMORY[0x270FA1E28]();
}

uint64_t sub_21ECD4A88()
{
  return MEMORY[0x270FA1E30]();
}

uint64_t sub_21ECD4A98()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_21ECD4AA8()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_21ECD4AB8()
{
  return MEMORY[0x270FA1F60]();
}

uint64_t sub_21ECD4AD8()
{
  return MEMORY[0x270FA1F78]();
}

uint64_t sub_21ECD4AE8()
{
  return MEMORY[0x270FA1F88]();
}

uint64_t sub_21ECD4AF8()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_21ECD4B18()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_21ECD4B28()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_21ECD4B38()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_21ECD4B48()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_21ECD4B58()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_21ECD4B68()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_21ECD4B78()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_21ECD4B88()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_21ECD4B98()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_21ECD4BA8()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_21ECD4BB8()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_21ECD4BC8()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_21ECD4BD8()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_21ECD4BE8()
{
  return MEMORY[0x270F9EA38]();
}

uint64_t sub_21ECD4BF8()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_21ECD4C08()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_21ECD4C18()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_21ECD4C28()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_21ECD4C38()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_21ECD4C48()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_21ECD4C58()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_21ECD4C88()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_21ECD4C98()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_21ECD4CA8()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_21ECD4CB8()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_21ECD4CC8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_21ECD4CD8()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_21ECD4CE8()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_21ECD4CF8()
{
  return MEMORY[0x270F9FCF8]();
}

uint64_t sub_21ECD4D08()
{
  return MEMORY[0x270FA23A8]();
}

uint64_t sub_21ECD4D18()
{
  return MEMORY[0x270FA23B8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x270FA2428]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x270FA0290]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getFunctionTypeMetadata1()
{
  return MEMORY[0x270FA0390]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}