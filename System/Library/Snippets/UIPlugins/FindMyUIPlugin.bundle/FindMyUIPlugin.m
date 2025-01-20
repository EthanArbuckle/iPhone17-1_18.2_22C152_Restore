uint64_t sub_289C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);
  uint64_t vars8;

  v0 = sub_3740();
  sub_3668(v0, qword_8248);
  v1 = sub_2D3C(v0, (uint64_t)qword_8248);
  v2 = sub_3710();
  v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t sub_2928(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  sub_3700();
  __chkstk_darwin();
  v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_8240 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_3740();
  sub_2D3C(v11, (uint64_t)qword_8248);
  swift_bridgeObjectRetain_n();
  v12 = sub_3730();
  os_log_type_t v13 = sub_3760();
  if (os_log_type_enabled(v12, v13))
  {
    v18[0] = v10;
    uint64_t v14 = swift_slowAlloc();
    v18[1] = a4;
    v15 = (uint8_t *)v14;
    uint64_t v16 = swift_slowAlloc();
    uint64_t v19 = v4;
    uint64_t v21 = v16;
    *(_DWORD *)v15 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v20 = sub_2DBC(a1, a2, &v21);
    sub_3770();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, v12, v13, "FindMyUIPlugin creating view for id=%s", v15, 0xCu);
    swift_arrayDestroy();
    uint64_t v5 = v19;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  sub_36F0();
  swift_allocObject();
  sub_36E0();
  sub_2D74(&qword_8130, (void (*)(uint64_t))&type metadata accessor for FindFriendSnippetData);
  sub_36D0();
  if (v5) {
    return swift_release();
  }
  uint64_t result = sub_37C0();
  __break(1u);
  return result;
}

uint64_t sub_2C30()
{
  return sub_3720();
}

uint64_t sub_2C58()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for FindMyUIPlugin()
{
  return self;
}

uint64_t sub_2C8C()
{
  return swift_allocObject();
}

uint64_t sub_2C9C()
{
  return sub_2D74(&qword_8128, (void (*)(uint64_t))&type metadata accessor for Snippets);
}

uint64_t sub_2CE4(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2928(a1, a2, a3, a4);
}

uint64_t sub_2CFC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2C8C();
  *a1 = result;
  return result;
}

uint64_t sub_2D24()
{
  return sub_2C30();
}

uint64_t sub_2D3C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_2D74(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2DBC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2E90(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_35C4((uint64_t)v12, *a3);
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
      sub_35C4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_3574((uint64_t)v12);
  return v7;
}

uint64_t sub_2E90(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_2FE8((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_3780();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = (uint64_t)sub_30C0(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_37A0();
    if (!v8)
    {
      uint64_t result = sub_37B0();
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

void *sub_2FE8(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_37D0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

void *sub_30C0(uint64_t a1, unint64_t a2)
{
  v2 = sub_3158(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    v2 = sub_3334(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    v2 = sub_3334((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_3158(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = sub_3750();
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
  unint64_t v3 = sub_32CC(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_3790();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return v4;
  }
  sub_37D0();
  __break(1u);
LABEL_14:
  uint64_t result = (void *)sub_37B0();
  __break(1u);
  return result;
}

void *sub_32CC(uint64_t a1, uint64_t a2)
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
  sub_3620(&qword_8138);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_3334(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_3620(&qword_8138);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  v12 = v10 + 32;
  os_log_type_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_34E4(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_340C(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_340C(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_37D0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_34E4(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_37D0();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_3574(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_35C4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_3620(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t *sub_3668(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_36D0()
{
  return dispatch thunk of PropertyListDecoder.decode<A>(_:from:)();
}

uint64_t sub_36E0()
{
  return PropertyListDecoder.init()();
}

uint64_t sub_36F0()
{
  return type metadata accessor for PropertyListDecoder();
}

uint64_t sub_3700()
{
  return type metadata accessor for FindFriendSnippetData();
}

uint64_t sub_3710()
{
  return SFMLog.snippet.unsafeMutableAddressor();
}

uint64_t sub_3720()
{
  return SnippetViewProvider.snippetView(for:)();
}

uint64_t sub_3730()
{
  return Logger.logObject.getter();
}

uint64_t sub_3740()
{
  return type metadata accessor for Logger();
}

Swift::Int sub_3750()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_3760()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_3770()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_3780()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_3790()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_37A0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_37B0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_37C0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_37D0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
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

uint64_t self
{
  return _self;
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

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
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