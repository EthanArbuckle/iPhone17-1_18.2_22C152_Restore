uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

uint64_t block_destroy_helper_5()
{
  return swift_release();
}

uint64_t block_destroy_helper_6()
{
  return swift_release();
}

uint64_t block_destroy_helper_7()
{
  return swift_release();
}

uint64_t block_destroy_helper_8()
{
  return swift_release();
}

uint64_t block_destroy_helper_9()
{
  return swift_release();
}

uint64_t block_destroy_helper_10()
{
  return swift_release();
}

uint64_t objectdestroy_24Tm()
{
  v1 = (int *)type metadata accessor for XPCServiceDescription();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  swift_release();
  uint64_t v5 = v0 + v3;
  uint64_t v6 = sub_1BBBEABA8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);

  if (*(void *)(v0 + v3 + v1[9])) {
    swift_release();
  }
  if (*(void *)(v5 + v1[10])) {
    swift_release();
  }
  if (*(void *)(v5 + v1[11])) {
    swift_release();
  }
  unint64_t v7 = (v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = v7 + 8;

  return MEMORY[0x1F4186498](v0, v8, v2 | 7);
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

SPShared::NetworkReachabilityStatus_optional __swiftcall NetworkReachabilityStatus.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_1BBBEB9B8();
  result.value = swift_bridgeObjectRelease();
  char v5 = 3;
  if (v3 < 3) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t NetworkReachabilityStatus.rawValue.getter()
{
  if (*v0) {
    return 0xD000000000000010;
  }
  else {
    return 0x6863616552746F6ELL;
  }
}

uint64_t sub_1BBBABAC4(char *a1, unsigned __int8 *a2)
{
  return sub_1BBBABAD0(*a1, *a2);
}

uint64_t sub_1BBBABAD0(char a1, unsigned __int8 a2)
{
  unint64_t v2 = 0xEC000000656C6261;
  unint64_t v3 = 0x6863616552746F6ELL;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v4 = 0x80000001BBBEE7B0;
    }
    else {
      unint64_t v4 = 0x80000001BBBEE7D0;
    }
    unint64_t v5 = 0xD000000000000010;
    int v6 = a2;
    if (!a2) {
      goto LABEL_10;
    }
    goto LABEL_6;
  }
  unint64_t v5 = 0x6863616552746F6ELL;
  unint64_t v4 = 0xEC000000656C6261;
  int v6 = a2;
  if (a2)
  {
LABEL_6:
    if (v6 == 1) {
      unint64_t v2 = 0x80000001BBBEE7B0;
    }
    else {
      unint64_t v2 = 0x80000001BBBEE7D0;
    }
    unint64_t v3 = 0xD000000000000010;
  }
LABEL_10:
  if (v5 == v3 && v4 == v2) {
    char v7 = 1;
  }
  else {
    char v7 = sub_1BBBEBAA8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_1BBBABBDC()
{
  return sub_1BBBABBE4();
}

uint64_t sub_1BBBABBE4()
{
  return sub_1BBBEBBB8();
}

uint64_t sub_1BBBABC98()
{
  sub_1BBBEB2E8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BBBABD38()
{
  return sub_1BBBABD40();
}

uint64_t sub_1BBBABD40()
{
  return sub_1BBBEBBB8();
}

SPShared::NetworkReachabilityStatus_optional sub_1BBBABDF0(Swift::String *a1)
{
  return NetworkReachabilityStatus.init(rawValue:)(*a1);
}

void sub_1BBBABDFC(unint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xEC000000656C6261;
  unint64_t v4 = 0x80000001BBBEE7B0;
  if (v2 != 1) {
    unint64_t v4 = 0x80000001BBBEE7D0;
  }
  BOOL v5 = v2 == 0;
  if (*v1) {
    unint64_t v6 = 0xD000000000000010;
  }
  else {
    unint64_t v6 = 0x6863616552746F6ELL;
  }
  if (!v5) {
    unint64_t v3 = v4;
  }
  *a1 = v6;
  a1[1] = v3;
}

void sub_1BBBABE6C(char *a1@<X8>)
{
  v21[3] = *MEMORY[0x1E4F143B8];
  char v20 = 0;
  unint64_t v3 = *(void **)(v1 + 16);
  if (v3)
  {
    SCNetworkReachabilityFlags flags = 0;
    unint64_t v4 = v3;
    SCNetworkReachabilityGetFlags(v4, &flags);
    if ((flags & 2) != 0)
    {
      BOOL v9 = (flags & 0x28) != 0;
      if ((flags & 0x10) != 0) {
        BOOL v9 = 0;
      }
      if ((flags & 0x40004) != 4 || v9)
      {
        if ((flags & 0x40000) != 0) {
          char v11 = 2;
        }
        else {
          char v11 = 1;
        }
        char v20 = v11;
      }
    }
    else
    {
      char v20 = 0;
    }
    if (qword_1EB9F8258 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_1BBBEAE28();
    __swift_project_value_buffer(v12, (uint64_t)qword_1EB9F8B90);
    v13 = sub_1BBBEAE08();
    os_log_type_t v14 = sub_1BBBEB558();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      v21[0] = v16;
      *(_DWORD *)v15 = 136315138;
      uint64_t v17 = sub_1BBBEB2B8();
      sub_1BBBAC938(v17, v18, v21);
      sub_1BBBEB6C8();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1BBBA9000, v13, v14, "Network reachability: %s", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C1862BC0](v16, -1, -1);
      MEMORY[0x1C1862BC0](v15, -1, -1);
    }

    swift_beginAccess();
    *a1 = v20;
  }
  else
  {
    if (qword_1EB9F8258 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_1BBBEAE28();
    __swift_project_value_buffer(v5, (uint64_t)qword_1EB9F8B90);
    unint64_t v6 = sub_1BBBEAE08();
    os_log_type_t v7 = sub_1BBBEB558();
    if (os_log_type_enabled(v6, v7))
    {
      unint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v8 = 0;
      _os_log_impl(&dword_1BBBA9000, v6, v7, "Reachability object can't be instantiated. Network not reachable.", v8, 2u);
      MEMORY[0x1C1862BC0](v8, -1, -1);
    }

    *a1 = 0;
  }
}

uint64_t NetworkReachability.__allocating_init()()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = swift_allocObject();
  *(void *)&address.sa_data[6] = 0;
  *(void *)address.sa_data = 0;
  *(_WORD *)&address.sa_len = 528;
  *(void *)(v0 + 16) = SCNetworkReachabilityCreateWithAddress(0, &address);
  return v0;
}

uint64_t NetworkReachability.init()()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  *(void *)(v0 + 16) = 0;
  *(void *)&address.sa_data[6] = 0;
  *(void *)address.sa_data = 0;
  *(_WORD *)&address.sa_len = 528;
  SCNetworkReachabilityRef v1 = SCNetworkReachabilityCreateWithAddress(0, &address);
  int v2 = *(void **)(v0 + 16);
  *(void *)(v0 + 16) = v1;

  return v0;
}

uint64_t NetworkReachability.deinit()
{
  return v0;
}

uint64_t NetworkReachability.__deallocating_deinit()
{
  return MEMORY[0x1F4186488](v0, 24, 7);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_1BBBAC2FC(uint64_t a1, uint64_t a2)
{
  return sub_1BBBAC3F4(a1, a2, MEMORY[0x1E4FBB198]);
}

uint64_t sub_1BBBAC314()
{
  sub_1BBBEB2A8();
  sub_1BBBEB2E8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BBBAC368()
{
  sub_1BBBEB2A8();
  sub_1BBBEBB78();
  sub_1BBBEB2E8();
  uint64_t v0 = sub_1BBBEBBB8();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1BBBAC3DC(uint64_t a1, uint64_t a2)
{
  return sub_1BBBAC3F4(a1, a2, MEMORY[0x1E4F27EB8]);
}

uint64_t sub_1BBBAC3F4(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_1BBBEB2A8();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1BBBAC438(uint64_t a1, id *a2)
{
  uint64_t result = sub_1BBBEB288();
  *a2 = 0;
  return result;
}

uint64_t sub_1BBBAC4B0(uint64_t a1, id *a2)
{
  char v3 = sub_1BBBEB298();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1BBBAC530@<X0>(uint64_t *a1@<X8>)
{
  sub_1BBBEB2A8();
  uint64_t v2 = sub_1BBBEB278();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

void sub_1BBBAC574(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_1BBBAC57C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_1BBBAC590@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_1BBBAC5A4@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_1BBBAC5B8(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_1BBBAC5E8@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_1BBBAC614@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_1BBBAC638(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_1BBBAC64C(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_1BBBAC660(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_1BBBAC674@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_1BBBAC688(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_1BBBAC69C(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_1BBBAC6B0(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_1BBBAC6C4()
{
  return *v0 == 0;
}

uint64_t sub_1BBBAC6D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x1F4184B08](a1, a4, a2, a5, a3);
}

void *sub_1BBBAC6EC(void *result)
{
  *v1 &= ~*result;
  return result;
}

uint64_t sub_1BBBAC700()
{
  uint64_t v0 = sub_1BBBEB2A8();
  uint64_t v2 = v1;
  if (v0 == sub_1BBBEB2A8() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_1BBBEBAA8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

BOOL sub_1BBBAC78C(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1BBBAC7A0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = sub_1BBBAD434(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

void *sub_1BBBAC7E0@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_1BBBAC7EC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_1BBBEB278();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1BBBAC834@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1BBBEB2A8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1BBBAC860(uint64_t a1)
{
  uint64_t v2 = sub_1BBBAD35C((unint64_t *)&qword_1EB9F7690, type metadata accessor for NSKeyValueChangeKey);
  uint64_t v3 = sub_1BBBAD35C(&qword_1E9F83538, type metadata accessor for NSKeyValueChangeKey);
  uint64_t v4 = MEMORY[0x1E4FBB1B0];
  return MEMORY[0x1F4185450](a1, v2, v3, v4);
}

void *sub_1BBBAC91C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_1BBBAC92C(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_1BBBAC938(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1BBBACA0C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1BBBAD4BC((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x1E4FBB9B0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1BBBAD4BC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1BBBACA0C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1BBBEB6D8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1BBBACBC8(a5, a6);
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
  uint64_t v8 = sub_1BBBEB898();
  if (!v8)
  {
    sub_1BBBEB948();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1BBBEB998();
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

uint64_t sub_1BBBACBC8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1BBBACC60(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1BBBACE40(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1BBBACE40(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1BBBACC60(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1BBBACDD8(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1BBBEB868();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_1BBBEB948();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1BBBEB318();
      if (!v2) {
        return MEMORY[0x1E4FBC860];
      }
    }
    sub_1BBBEB998();
    __break(1u);
LABEL_14:
    uint64_t result = sub_1BBBEB948();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC860];
  }
  return result;
}

void *sub_1BBBACDD8(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F83520);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1BBBACE40(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F83520);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  v13 = a4 + 32;
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
  uint64_t result = sub_1BBBEB998();
  __break(1u);
  return result;
}

unint64_t sub_1BBBACF94()
{
  unint64_t result = qword_1E9F83410;
  if (!qword_1E9F83410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F83410);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for NetworkReachabilityStatus(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
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
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for NetworkReachabilityStatus(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
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
        JUMPOUT(0x1BBBAD154);
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
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_1BBBAD17C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1BBBAD188(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for NetworkReachabilityStatus()
{
  return &type metadata for NetworkReachabilityStatus;
}

uint64_t type metadata accessor for NetworkReachability()
{
  return self;
}

uint64_t method lookup function for NetworkReachability(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for NetworkReachability);
}

uint64_t dispatch thunk of NetworkReachability.status.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of NetworkReachability.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

void type metadata accessor for CFNotificationName(uint64_t a1)
{
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_1BBBAD234(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1BBBAD254(uint64_t result, int a2, int a3)
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

void type metadata accessor for os_activity_scope_state_s(uint64_t a1)
{
}

void type metadata accessor for Options(uint64_t a1)
{
}

void type metadata accessor for SCNetworkReachability(uint64_t a1)
{
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

uint64_t sub_1BBBAD2CC()
{
  return sub_1BBBAD35C(&qword_1E9F83500, type metadata accessor for Options);
}

uint64_t sub_1BBBAD314()
{
  return sub_1BBBAD35C(&qword_1E9F83508, type metadata accessor for Options);
}

uint64_t sub_1BBBAD35C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1BBBAD3A4()
{
  return sub_1BBBAD35C(&qword_1E9F83510, type metadata accessor for Options);
}

uint64_t sub_1BBBAD3EC()
{
  return sub_1BBBAD35C(&qword_1E9F83518, type metadata accessor for Options);
}

uint64_t sub_1BBBAD434(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t result = 0;
  unsigned int v4 = (uint64_t *)(a1 + 32);
  do
  {
    uint64_t v6 = *v4++;
    uint64_t v5 = v6;
    if ((v6 & ~result) == 0) {
      uint64_t v5 = 0;
    }
    result |= v5;
    --v1;
  }
  while (v1);
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

uint64_t sub_1BBBAD4BC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void type metadata accessor for NSKeyValueChangeKey(uint64_t a1)
{
}

void type metadata accessor for CFString(uint64_t a1)
{
}

void sub_1BBBAD544(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_1BBBAD58C()
{
  return sub_1BBBAD35C(&qword_1E9F83528, type metadata accessor for NSKeyValueChangeKey);
}

uint64_t sub_1BBBAD5D4()
{
  return sub_1BBBAD35C(&qword_1E9F83530, type metadata accessor for NSKeyValueChangeKey);
}

uint64_t sub_1BBBAD61C()
{
  return sub_1BBBAD35C((unint64_t *)&unk_1EB9F7698, type metadata accessor for NSKeyValueChangeKey);
}

uint64_t sub_1BBBAD668()
{
  sub_1BBBEB578();
  MEMORY[0x1F4188790]();
  sub_1BBBEB0F8();
  MEMORY[0x1F4188790]();
  uint64_t v0 = sub_1BBBEB608();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v3 = (char *)v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BBBAEE84();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4FBCC68], v0);
  sub_1BBBEB0D8();
  v5[1] = MEMORY[0x1E4FBC860];
  sub_1BBBAEEC4((unint64_t *)&qword_1EB9F8330, MEMORY[0x1E4FBCC10]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F8320);
  sub_1BBBAEF0C((unint64_t *)&qword_1EB9F8328, &qword_1EB9F8320);
  sub_1BBBEB798();
  uint64_t result = sub_1BBBEB648();
  qword_1EB9F7230 = result;
  return result;
}

uint64_t Publisher.futureSink(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v33 = a1;
  uint64_t v34 = a2;
  uint64_t v6 = sub_1BBBEAE78();
  uint64_t v32 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  int v8 = (char *)&v24 - v7;
  swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v9 = sub_1BBBEBBC8();
  uint64_t v27 = v6;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v24 = v9;
  uint64_t v10 = sub_1BBBEAE48();
  uint64_t v30 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (char *)&v24 - v11;
  uint64_t v13 = sub_1BBBEAF78();
  uint64_t v14 = swift_getWitnessTable();
  uint64_t v26 = v14;
  uint64_t v25 = swift_getWitnessTable();
  uint64_t v35 = v10;
  uint64_t v36 = v13;
  uint64_t v37 = v14;
  uint64_t v38 = v25;
  uint64_t v29 = sub_1BBBEAE68();
  uint64_t v31 = *(void *)(v29 - 8);
  MEMORY[0x1F4188790](v29);
  uint64_t v16 = (char *)&v24 - v15;
  sub_1BBBEB028();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a3;
  *(void *)(v17 + 24) = a4;
  uint64_t v18 = v27;
  sub_1BBBEAFE8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v32 + 8))(v8, v18);
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = a3;
  *(void *)(v19 + 24) = a4;
  sub_1BBBEB018();
  swift_release();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v12, v10);
  char v20 = (void *)swift_allocObject();
  v20[2] = a3;
  v20[3] = a4;
  v20[4] = v33;
  v20[5] = v34;
  swift_retain();
  uint64_t v21 = v29;
  swift_getWitnessTable();
  uint64_t v22 = sub_1BBBEB008();
  swift_release();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v16, v21);
  return v22;
}

uint64_t sub_1BBBADD18()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1BBBADD28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1BBBAE808(a1, a2);
}

uint64_t sub_1BBBADD44()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1BBBADD54(uint64_t a1)
{
  return sub_1BBBAE90C(a1);
}

uint64_t sub_1BBBADD70()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1BBBADDA8()
{
  return (*(uint64_t (**)(void))(v0 + 32))();
}

uint64_t Publisher.oneshot(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v25 = a4;
  uint64_t v26 = a1;
  uint64_t v27 = a2;
  uint64_t v7 = sub_1BBBEB0B8();
  uint64_t v30 = *(void *)(v7 - 8);
  ((void (*)(void))MEMORY[0x1F4188790])();
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1BBBEB0F8();
  uint64_t v28 = *(void *)(v10 - 8);
  uint64_t v29 = v10;
  uint64_t v11 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  uint64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void *)(a3 - 8);
  uint64_t v15 = *(void *)(v14 + 64);
  MEMORY[0x1F4188790](v11);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = 0;
  if (qword_1EB9F7250 != -1) {
    swift_once();
  }
  uint64_t v24 = qword_1EB9F7230;
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))((char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), v5, a3);
  unint64_t v17 = (*(unsigned __int8 *)(v14 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  uint64_t v18 = (char *)swift_allocObject();
  uint64_t v19 = v25;
  *((void *)v18 + 2) = a3;
  *((void *)v18 + 3) = v19;
  *((void *)v18 + 4) = v16;
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(&v18[v17], (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), a3);
  char v20 = &v18[(v15 + v17 + 7) & 0xFFFFFFFFFFFFFFF8];
  uint64_t v21 = v27;
  *(void *)char v20 = v26;
  *((void *)v20 + 1) = v21;
  aBlock[4] = sub_1BBBAE798;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BBBAED3C;
  aBlock[3] = &block_descriptor;
  uint64_t v22 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  sub_1BBBEB0D8();
  uint64_t v31 = MEMORY[0x1E4FBC860];
  sub_1BBBAEEC4(qword_1EB9F78A0, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F7968);
  sub_1BBBAEF0C((unint64_t *)&qword_1EB9F7970, &qword_1EB9F7968);
  sub_1BBBEB798();
  MEMORY[0x1C1861D70](0, v13, v9, v22);
  _Block_release(v22);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v9, v7);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v13, v29);
  swift_release();
  return swift_release();
}

uint64_t sub_1BBBAE1C4()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1BBBAE1FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v41 = a3;
  uint64_t v42 = a4;
  uint64_t v39 = a2;
  uint64_t v32 = a1;
  uint64_t v9 = sub_1BBBEAE78();
  uint64_t v40 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v11 = (char *)&v29 - v10;
  swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v12 = sub_1BBBEBBC8();
  uint64_t v33 = v9;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v29 = v12;
  uint64_t v13 = sub_1BBBEAE48();
  uint64_t v36 = *(void *)(v13 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v15 = (char *)&v29 - v14;
  uint64_t v16 = sub_1BBBEAF78();
  uint64_t v17 = swift_getWitnessTable();
  uint64_t v31 = v17;
  uint64_t v30 = swift_getWitnessTable();
  uint64_t v43 = v13;
  uint64_t v44 = v16;
  uint64_t v45 = v17;
  uint64_t v46 = v30;
  uint64_t v35 = sub_1BBBEAE68();
  uint64_t v38 = *(void *)(v35 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v19 = (char *)&v29 - v18;
  uint64_t v37 = a1 + 16;
  sub_1BBBEB028();
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = a5;
  *(void *)(v20 + 24) = a6;
  uint64_t v21 = v33;
  sub_1BBBEAFE8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v11, v21);
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = a5;
  *(void *)(v22 + 24) = a6;
  sub_1BBBEB018();
  swift_release();
  (*(void (**)(char *, uint64_t))(v36 + 8))(v15, v13);
  v23 = (void *)swift_allocObject();
  v23[2] = a5;
  v23[3] = a6;
  v23[4] = v41;
  uint64_t v24 = v32;
  v23[5] = v42;
  v23[6] = v24;
  swift_retain();
  uint64_t v25 = v24;
  swift_retain();
  uint64_t v26 = v35;
  swift_getWitnessTable();
  uint64_t v27 = sub_1BBBEB008();
  swift_release();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v19, v26);
  swift_beginAccess();
  *(void *)(v25 + 16) = v27;
  return swift_release();
}

uint64_t sub_1BBBAE6B4()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  return MEMORY[0x1F4186498](v0, v6, v5);
}

uint64_t sub_1BBBAE798()
{
  unint64_t v1 = (*(unsigned __int8 *)(*(void *)(v0[2] - 8) + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v0[2] - 8) + 80);
  uint64_t v2 = (uint64_t *)((char *)v0 + ((*(void *)(*(void *)(v0[2] - 8) + 64) + v1 + 7) & 0xFFFFFFFFFFFFFFF8));
  return sub_1BBBAE1FC(v0[4], (uint64_t)v0 + v1, *v2, v2[1], v0[2], v0[3]);
}

uint64_t sub_1BBBAE808@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16))(a2, a1, AssociatedTypeWitness);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  sub_1BBBEBBC8();
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_1BBBAE90C(uint64_t a1)
{
  swift_getAssociatedTypeWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v3 = sub_1BBBEBBC8();
  MEMORY[0x1F4188790](v3);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16))((char *)&v6 - v4, a1, AssociatedTypeWitness);
  swift_storeEnumTagMultiPayload();
  return sub_1BBBEAF88();
}

uint64_t sub_1BBBAEA60(uint64_t a1, void (*a2)(uint64_t), uint64_t a3, uint64_t a4)
{
  uint64_t v7 = sub_1BBBEB0B8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v10 = (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16[0] = sub_1BBBEB0F8();
  uint64_t v11 = *(void *)(v16[0] - 8);
  MEMORY[0x1F4188790]();
  uint64_t v13 = (char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  a2(a1);
  if (qword_1EB9F7250 != -1) {
    swift_once();
  }
  aBlock[4] = sub_1BBBAEE48;
  aBlock[5] = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BBBAED3C;
  aBlock[3] = &block_descriptor_24;
  uint64_t v14 = _Block_copy(aBlock);
  swift_retain();
  sub_1BBBEB0D8();
  v16[1] = MEMORY[0x1E4FBC860];
  sub_1BBBAEEC4(qword_1EB9F78A0, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F7968);
  sub_1BBBAEF0C((unint64_t *)&qword_1EB9F7970, &qword_1EB9F7968);
  sub_1BBBEB798();
  MEMORY[0x1C1861D70](0, v13, v10, v14);
  _Block_release(v14);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  (*(void (**)(char *, void))(v11 + 8))(v13, v16[0]);
  return swift_release();
}

uint64_t sub_1BBBAED3C(uint64_t a1)
{
  unint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
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

uint64_t sub_1BBBAEDD8()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1BBBAEDE8()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1BBBAEDF8()
{
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1BBBAEE38(uint64_t a1)
{
  return sub_1BBBAEA60(a1, *(void (**)(uint64_t))(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48));
}

uint64_t sub_1BBBAEE48()
{
  swift_beginAccess();
  *(void *)(v0 + 16) = 0;
  return swift_release();
}

unint64_t sub_1BBBAEE84()
{
  unint64_t result = qword_1EB9F8340;
  if (!qword_1EB9F8340)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EB9F8340);
  }
  return result;
}

uint64_t sub_1BBBAEEC4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1BBBAEF0C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

id UserDefaultsObserver.__allocating_init(keys:defaults:notificationBlock:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (char *)objc_allocWithZone(v4);
  *(void *)&v9[OBJC_IVAR____TtC8SPShared20UserDefaultsObserver_monitoredKeys] = a1;
  *(void *)&v9[OBJC_IVAR____TtC8SPShared20UserDefaultsObserver_defaults] = a2;
  uint64_t v10 = &v9[OBJC_IVAR____TtC8SPShared20UserDefaultsObserver_notify];
  *(void *)uint64_t v10 = a3;
  *((void *)v10 + 1) = a4;
  v12.receiver = v9;
  v12.super_class = v4;
  return objc_msgSendSuper2(&v12, sel_init);
}

id UserDefaultsObserver.init(keys:defaults:notificationBlock:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)&v4[OBJC_IVAR____TtC8SPShared20UserDefaultsObserver_monitoredKeys] = a1;
  *(void *)&v4[OBJC_IVAR____TtC8SPShared20UserDefaultsObserver_defaults] = a2;
  uint64_t v5 = &v4[OBJC_IVAR____TtC8SPShared20UserDefaultsObserver_notify];
  *(void *)uint64_t v5 = a3;
  *((void *)v5 + 1) = a4;
  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for UserDefaultsObserver();
  return objc_msgSendSuper2(&v7, sel_init);
}

uint64_t type metadata accessor for UserDefaultsObserver()
{
  return self;
}

id UserDefaultsObserver.__deallocating_deinit()
{
  uint64_t v1 = *(void *)&v0[OBJC_IVAR____TtC8SPShared20UserDefaultsObserver_monitoredKeys];
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v3 = *(void **)&v0[OBJC_IVAR____TtC8SPShared20UserDefaultsObserver_defaults];
    swift_bridgeObjectRetain();
    uint64_t v4 = v1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      uint64_t v5 = (void *)sub_1BBBEB278();
      swift_bridgeObjectRelease();
      objc_msgSend(v3, sel_removeObserver_forKeyPath_context_, v0, v5, 0);

      v4 += 16;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for UserDefaultsObserver();
  return objc_msgSendSuper2(&v7, sel_dealloc);
}

void sub_1BBBAF1F4()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC8SPShared20UserDefaultsObserver_monitoredKeys);
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v3 = *(void **)(v0 + OBJC_IVAR____TtC8SPShared20UserDefaultsObserver_defaults);
    swift_bridgeObjectRetain();
    uint64_t v4 = v1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      uint64_t v5 = (void *)sub_1BBBEB278();
      swift_bridgeObjectRelease();
      objc_msgSend(v3, sel_addObserver_forKeyPath_options_context_, v0, v5, 0, 0);

      v4 += 16;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
}

void sub_1BBBAF2D4()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC8SPShared20UserDefaultsObserver_monitoredKeys);
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v3 = *(void **)(v0 + OBJC_IVAR____TtC8SPShared20UserDefaultsObserver_defaults);
    swift_bridgeObjectRetain();
    uint64_t v4 = v1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      uint64_t v5 = (void *)sub_1BBBEB278();
      swift_bridgeObjectRelease();
      objc_msgSend(v3, sel_removeObserver_forKeyPath_context_, v0, v5, 0);

      v4 += 16;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
}

id UserDefaultsObserver.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void UserDefaultsObserver.init()()
{
}

uint64_t method lookup function for UserDefaultsObserver(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for UserDefaultsObserver);
}

uint64_t dispatch thunk of UserDefaultsObserver.__allocating_init(keys:defaults:notificationBlock:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of UserDefaultsObserver.start()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of UserDefaultsObserver.stop()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x90))();
}

uint64_t sub_1BBBAF618(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F7FB0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1BBBAF678()
{
  unint64_t result = qword_1EB9F7690;
  if (!qword_1EB9F7690)
  {
    type metadata accessor for NSKeyValueChangeKey(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9F7690);
  }
  return result;
}

uint64_t CurrentValueSubject.eraseToAnyCurrentValuePublisher()()
{
  type metadata accessor for AnyCurrentValuePublisher();
  swift_unownedRetainStrong();
  swift_unownedRetain();
  swift_allocObject();
  uint64_t v1 = sub_1BBBAF8C0(v0);
  swift_release();
  swift_unownedRelease();
  return v1;
}

uint64_t type metadata accessor for AnyCurrentValuePublisher()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t AnyCurrentValuePublisher.publisher.getter()
{
  sub_1BBBAF990();
  return swift_retain();
}

uint64_t AnyCurrentValuePublisher.value.getter()
{
  swift_unownedRetainStrong();
  sub_1BBBEAF58();
  return swift_release();
}

uint64_t AnyCurrentValuePublisher.deinit()
{
  swift_unownedRelease();
  swift_release();
  return v0;
}

uint64_t AnyCurrentValuePublisher.__deallocating_deinit()
{
  swift_unownedRelease();
  swift_release();
  return MEMORY[0x1F4186488](v0, 32, 7);
}

uint64_t sub_1BBBAF868()
{
  sub_1BBBAF990();
  return swift_retain();
}

uint64_t sub_1BBBAF89C()
{
  return AnyCurrentValuePublisher.value.getter();
}

uint64_t sub_1BBBAF8C0(uint64_t a1)
{
  uint64_t v2 = v1;
  *(void *)(v1 + 16) = a1;
  swift_unownedRetainStrong();
  swift_unownedRetain();
  sub_1BBBEAF68();
  swift_getWitnessTable();
  uint64_t v3 = sub_1BBBEAFC8();
  swift_release();
  *(void *)(v2 + 24) = v3;
  return v2;
}

uint64_t sub_1BBBAF990()
{
  return *(void *)(v0 + 24);
}

uint64_t sub_1BBBAF998(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 96);
}

uint64_t dispatch thunk of AnyCurrentValuePublishing.publisher.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of AnyCurrentValuePublishing.value.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t sub_1BBBAF9CC()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for AnyCurrentValuePublisher(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for AnyCurrentValuePublisher);
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t FutureError.hash(into:)()
{
  return sub_1BBBEBB88();
}

uint64_t static FutureError.== infix(_:_:)()
{
  return 1;
}

uint64_t FutureError.hashValue.getter()
{
  return sub_1BBBEBBB8();
}

uint64_t _s8SPShared13HashAlgorithmO9hashValueSivg_0()
{
  return sub_1BBBEBBB8();
}

uint64_t sub_1BBBAFB1C()
{
  return sub_1BBBEBB88();
}

uint64_t sub_1BBBAFB44()
{
  return sub_1BBBEBBB8();
}

uint64_t sub_1BBBAFB94()
{
  return 1;
}

uint64_t sub_1BBBAFB9C()
{
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t sub_1BBBAFBA4(uint64_t result)
{
  *(unsigned char *)(v1 + 16) = result;
  return result;
}

uint64_t sub_1BBBAFBAC()
{
  return *(unsigned __int8 *)(v0 + 17);
}

uint64_t sub_1BBBAFBB4(uint64_t result)
{
  *(unsigned char *)(v1 + 17) = result;
  return result;
}

uint64_t sub_1BBBAFBBC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(void *)(*(void *)v1 + 104);
  swift_beginAccess();
  uint64_t v4 = sub_1BBBEB6B8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_1BBBAFC6C(uint64_t a1)
{
  uint64_t v3 = v1 + *(void *)(*(void *)v1 + 104);
  swift_beginAccess();
  uint64_t v4 = sub_1BBBEB6B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(v3, a1, v4);
  return swift_endAccess();
}

void sub_1BBBAFD24(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 112);
  uint64_t v3 = *(void **)(v1 + v2);
  *(void *)(v1 + v2) = a1;
}

uint64_t sub_1BBBAFD48(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + *(void *)(*(void *)v1 + 120));
  swift_beginAccess();
  *uint64_t v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BBBAFDA8()
{
  unsigned __int8 v8 = 0;
  uint64_t v1 = *(NSObject **)(v0 + *(void *)(*(void *)v0 + 128));
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = &v8;
  *(void *)(v2 + 24) = v0;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = sub_1BBBAFF58;
  *(void *)(v3 + 24) = v2;
  aBlock[4] = sub_1BBBAFFA0;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BBBAFFC8;
  aBlock[3] = &block_descriptor_0;
  uint64_t v4 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v1, v4);
  _Block_release(v4);
  LOBYTE(v1) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v6 = v8;
    swift_release();
    return v6;
  }
  return result;
}

uint64_t sub_1BBBAFF20()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

void sub_1BBBAFF58()
{
  **(unsigned char **)(v0 + 16) = *(unsigned char *)(*(void *)(v0 + 24) + 16);
}

uint64_t sub_1BBBAFF68(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1BBBAFF90()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1BBBAFFA0()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1BBBAFFC8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1BBBB0000()
{
  unsigned __int8 v8 = 0;
  uint64_t v1 = *(NSObject **)(v0 + *(void *)(*(void *)v0 + 128));
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = &v8;
  *(void *)(v2 + 24) = v0;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = sub_1BBBB0178;
  *(void *)(v3 + 24) = v2;
  aBlock[4] = sub_1BBBB3744;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BBBAFFC8;
  aBlock[3] = &block_descriptor_13;
  uint64_t v4 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v1, v4);
  _Block_release(v4);
  LOBYTE(v1) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v6 = v8;
    swift_release();
    return v6;
  }
  return result;
}

void sub_1BBBB0178()
{
  uint64_t v1 = *(unsigned char **)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);
  if (*(unsigned char *)(v2 + 16) == 1) {
    unsigned char *v1 = *(unsigned char *)(v2 + 17);
  }
  else {
    unsigned char *v1 = 0;
  }
}

uint64_t sub_1BBBB019C()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1BBBB01AC(uint64_t a1)
{
  type metadata accessor for Promise();
  uint64_t v2 = sub_1BBBB021C();
  sub_1BBBB28D8(a1);
  uint64_t v3 = *(void *)(v2 + 16);
  swift_retain();
  swift_release();
  return v3;
}

uint64_t type metadata accessor for Promise()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1BBBB021C()
{
  type metadata accessor for Future();
  uint64_t v0 = swift_allocObject();
  Future.init()();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = v0;
  return result;
}

uint64_t sub_1BBBB0270(void *a1)
{
  type metadata accessor for Promise();
  uint64_t v2 = sub_1BBBB021C();
  sub_1BBBB2894(a1);
  uint64_t v3 = *(void *)(v2 + 16);
  swift_retain();
  swift_release();
  return v3;
}

uint64_t sub_1BBBB02C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1BBBB29C8(a1, (uint64_t)&v12);
  if (v13)
  {
    sub_1BBBB2BA8(&v12, (uint64_t)v14);
  }
  else
  {
    if (qword_1E9F833E0 != -1) {
      swift_once();
    }
    swift_beginAccess();
    sub_1BBBB2A30((uint64_t)&qword_1E9F837B8, (uint64_t)v14);
    sub_1BBBB2A94((uint64_t)&v12);
  }
  type metadata accessor for Promise();
  uint64_t v5 = sub_1BBBB021C();
  uint64_t v6 = v15;
  uint64_t v7 = v16;
  __swift_project_boxed_opaque_existential_1(v14, v15);
  unsigned __int8 v8 = (void *)swift_allocObject();
  v8[2] = a2;
  v8[3] = a3;
  v8[4] = v5;
  uint64_t v9 = *(void (**)(uint64_t (*)(), void *, uint64_t, uint64_t))(v7 + 8);
  swift_retain();
  swift_retain();
  v9(sub_1BBBB2B78, v8, v6, v7);
  swift_release();
  uint64_t v10 = *(void *)(v5 + 16);
  swift_retain();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v14);
  return v10;
}

uint64_t Future.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  Future.init()();
  return v0;
}

char *Future.init()()
{
  uint64_t v1 = *(void *)v0;
  uint64_t v2 = sub_1BBBEB578();
  MEMORY[0x1F4188790](v2);
  uint64_t v3 = sub_1BBBEB0F8();
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v4 = sub_1BBBEB608();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *((_WORD *)v0 + 8) = 0;
  (*(void (**)(char *, uint64_t, uint64_t, void))(*(void *)(*(void *)(v1 + 80) - 8) + 56))(&v0[*(void *)(v1 + 104)], 1, 1, *(void *)(v1 + 80));
  *(void *)&v0[*(void *)(*(void *)v0 + 112)] = 0;
  uint64_t v8 = *(void *)(*(void *)v0 + 120);
  sub_1BBBEB6B8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB9F7C28);
  swift_getFunctionTypeMetadata2();
  *(void *)&v0[v8] = sub_1BBBEB198();
  uint64_t v9 = *(void *)(*(void *)v0 + 128);
  sub_1BBBAEE84();
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E4FBCC68], v4);
  sub_1BBBEB0D8();
  v11[1] = MEMORY[0x1E4FBC860];
  sub_1BBBB2FC4((unint64_t *)&qword_1EB9F8330, MEMORY[0x1E4FBCC10]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F8320);
  sub_1BBBB2BC0();
  sub_1BBBEB798();
  *(void *)&v0[v9] = sub_1BBBEB648();
  sub_1BBBEADB8();
  return v0;
}

uint64_t sub_1BBBB07B8()
{
  unsigned __int8 v9 = 0;
  uint64_t v1 = *(NSObject **)(v0 + *(void *)(*(void *)v0 + 128));
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = v0;
  *(void *)(v2 + 24) = &v9;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = sub_1BBBB2C54;
  *(void *)(v3 + 24) = v2;
  aBlock[4] = sub_1BBBB3744;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BBBAFFC8;
  aBlock[3] = &block_descriptor_26;
  uint64_t v4 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v1, v4);
  _Block_release(v4);
  LOBYTE(v1) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v1)
  {
    __break(1u);
  }
  else
  {
    if (v9 == 1)
    {
      uint64_t v6 = sub_1BBBB09EC();
      (*(void (**)(uint64_t))(*(void *)v0 + 320))(v6);
      uint64_t v7 = v9;
    }
    else
    {
      uint64_t v7 = 0;
    }
    swift_release();
    return v7;
  }
  return result;
}

void sub_1BBBB0970(_WORD *a1, unsigned char *a2)
{
  if ((a1[8] & 1) == 0)
  {
    sub_1BBBB36E8();
    uint64_t v4 = swift_allocError();
    uint64_t v5 = *(void *)(*(void *)a1 + 112);
    uint64_t v6 = *(void **)((char *)a1 + v5);
    *(void *)((char *)a1 + v5) = v4;

    a1[8] = 257;
    *a2 = 1;
  }
}

uint64_t sub_1BBBB09EC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 80);
  uint64_t v2 = sub_1BBBEB6B8();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x1F4188790](v2);
  uint64_t v31 = (char *)v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v27 - v6;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v1 - 8) + 56))((char *)v27 - v6, 1, 1, v1);
  id v36 = 0;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB9F7C28);
  uint64_t v33 = v2;
  FunctionTypeMetadata2 = swift_getFunctionTypeMetadata2();
  uint64_t v35 = sub_1BBBEB198();
  unsigned __int8 v9 = *(NSObject **)(v0 + *(void *)(*(void *)v0 + 128));
  uint64_t v10 = (void *)swift_allocObject();
  uint64_t v32 = v7;
  v10[2] = v7;
  v10[3] = v0;
  v10[4] = &v36;
  v10[5] = &v35;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = sub_1BBBB36CC;
  *(void *)(v11 + 24) = v10;
  aBlock[4] = sub_1BBBB3744;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BBBAFFC8;
  aBlock[3] = &block_descriptor_90;
  long long v12 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v9, v12);
  _Block_release(v12);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation)
  {
LABEL_15:
    __break(1u);
    return result;
  }
  uint64_t v15 = v35;
  uint64_t v16 = swift_bridgeObjectRetain();
  if (MEMORY[0x1C1861B40](v16, FunctionTypeMetadata2))
  {
    v27[1] = v10;
    uint64_t v28 = v3;
    uint64_t v17 = 0;
    uint64_t v29 = (void (**)(char *, uint64_t))(v3 + 8);
    uint64_t v30 = (void (**)(char *, char *, uint64_t))(v3 + 16);
    uint64_t v18 = v15 + 40;
    uint64_t v19 = v31;
    uint64_t v20 = v33;
    while (1)
    {
      char v21 = sub_1BBBEB3C8();
      sub_1BBBEB398();
      if ((v21 & 1) == 0) {
        break;
      }
      uint64_t v22 = *(void (**)(char *, void *))(v18 - 8);
      uint64_t v23 = v17 + 1;
      BOOL v24 = __OFADD__(v17, 1);
      uint64_t result = swift_retain();
      if (v24) {
        goto LABEL_14;
      }
      (*v30)(v19, v32, v20);
      id v25 = v36;
      aBlock[0] = v36;
      id v26 = v36;
      v22(v19, aBlock);
      swift_release();

      (*v29)(v19, v20);
      ++v17;
      v18 += 16;
      if (v23 == MEMORY[0x1C1861B40](v15, FunctionTypeMetadata2))
      {
        swift_bridgeObjectRelease();
        uint64_t v3 = v28;
        goto LABEL_12;
      }
    }
    uint64_t result = sub_1BBBEB878();
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  swift_bridgeObjectRelease();
LABEL_12:
  swift_bridgeObjectRelease();

  (*(void (**)(char *, uint64_t))(v3 + 8))(v32, v33);
  return swift_release();
}

uint64_t Future.deinit()
{
  uint64_t v1 = v0 + *(void *)(*(void *)v0 + 104);
  uint64_t v2 = sub_1BBBEB6B8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  swift_bridgeObjectRelease();
  uint64_t v3 = v0 + *(void *)(*(void *)v0 + 136);
  uint64_t v4 = sub_1BBBEADC8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  return v0;
}

uint64_t Future.__deallocating_deinit()
{
  Future.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t Future.finish(error:)(void *a1)
{
  uint64_t v3 = *(void *)(*(void *)v1 + 80);
  uint64_t v4 = sub_1BBBEB6B8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v9 - v6;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))((char *)&v9 - v6, 1, 1, v3);
  LOBYTE(a1) = Future.finish(result:error:)((uint64_t)v7, a1);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return a1 & 1;
}

uint64_t Future.finish(result:error:)(uint64_t a1, void *a2)
{
  uint64_t v5 = *v2;
  uint64_t v6 = *(void *)(*v2 + 80);
  uint64_t v7 = sub_1BBBEB6B8();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x1F4188790](v7);
  uint64_t v11 = (char *)&aBlock[-1] - v10;
  unsigned __int8 v22 = 0;
  dispatch_queue_t v20 = *(dispatch_queue_t *)((char *)v2 + *(void *)(v5 + 128));
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&aBlock[-1] - v10, a1, v7);
  unint64_t v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  unint64_t v13 = (v9 + v12 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v6;
  *(void *)(v14 + 24) = v2;
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v14 + v12, v11, v7);
  *(void *)(v14 + v13) = a2;
  *(void *)(v14 + ((v13 + 15) & 0xFFFFFFFFFFFFFFF8)) = &v22;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = sub_1BBBB2DB0;
  *(void *)(v15 + 24) = v14;
  aBlock[4] = sub_1BBBB3744;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BBBAFFC8;
  aBlock[3] = &block_descriptor_36;
  uint64_t v16 = _Block_copy(aBlock);
  swift_retain();
  id v17 = a2;
  swift_retain();
  swift_release();
  dispatch_sync(v20, v16);
  _Block_release(v16);
  LOBYTE(a2) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (a2)
  {
    __break(1u);
  }
  else
  {
    sub_1BBBB09EC();
    uint64_t v19 = v22;
    swift_release();
    return v19;
  }
  return result;
}

uint64_t Future.finish(result:)(uint64_t a1)
{
  uint64_t v3 = *(void *)(*(void *)v1 + 80);
  uint64_t v4 = sub_1BBBEB6B8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v10 - v6;
  uint64_t v8 = *(void *)(v3 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v10 - v6, a1, v3);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v7, 0, 1, v3);
  LOBYTE(a1) = Future.finish(result:error:)((uint64_t)v7, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return a1 & 1;
}

void sub_1BBBB148C(unsigned char *a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v8 = sub_1BBBEB6B8();
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v15 - v10;
  if ((a1[16] & 1) == 0)
  {
    (*(void (**)(char *, uint64_t))(v9 + 16))(v11, a2);
    sub_1BBBAFC6C((uint64_t)v11);
    id v12 = a3;
    uint64_t v13 = *(void *)(*(void *)a1 + 112);
    uint64_t v14 = *(void **)&a1[v13];
    *(void *)&a1[v13] = a3;

    a1[16] = 1;
    *a4 = 1;
  }
}

uint64_t Future.addCompletion(block:)(void (*a1)(char *, id), uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *(void *)(*(void *)v3 + 80);
  uint64_t v23 = sub_1BBBEB6B8();
  uint64_t v7 = *(void *)(v23 - 8);
  uint64_t v8 = MEMORY[0x1F4188790](v23);
  uint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  id v12 = (char *)&v22 - v11;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))((char *)&v22 - v11, 1, 1, v6);
  id v26 = 0;
  char v25 = 0;
  uint64_t v13 = *(NSObject **)(v3 + *(void *)(*(void *)v3 + 128));
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = v12;
  void v14[3] = v3;
  v14[4] = &v26;
  v14[5] = &v25;
  unsigned __int8 v22 = a1;
  v14[6] = a1;
  v14[7] = a2;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = sub_1BBBB2EA0;
  *(void *)(v15 + 24) = v14;
  aBlock[4] = sub_1BBBB3744;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BBBAFFC8;
  aBlock[3] = &block_descriptor_46;
  uint64_t v16 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v13, v16);
  _Block_release(v16);
  LOBYTE(a1) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (a1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v18 = v23;
    if (v25 == 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v23);
      id v19 = v26;
      id v20 = v26;
      v22(v10, v19);

      (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v18);
    }
    id v21 = v26;
    swift_retain();

    (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v18);
    swift_release();
    return v3;
  }
  return result;
}

void sub_1BBBB18E0(uint64_t a1, unsigned char *a2, void **a3, unsigned char *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = *(void *)(*(void *)a2 + 80);
  uint64_t v13 = sub_1BBBEB6B8();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x1F4188790](v13);
  uint64_t v16 = (char *)v22 - v15;
  sub_1BBBAFBBC((uint64_t)v22 - v15);
  (*(void (**)(uint64_t, char *, uint64_t))(v14 + 40))(a1, v16, v13);
  id v17 = *(void **)&a2[*(void *)(*(void *)a2 + 112)];
  uint64_t v18 = *a3;
  *a3 = v17;
  id v19 = v17;

  char v20 = a2[16];
  *a4 = v20;
  if ((v20 & 1) == 0)
  {
    id v21 = (void *)swift_allocObject();
    v21[2] = v12;
    v21[3] = a5;
    uint64_t v21[4] = a6;
    v22[4] = sub_1BBBB3668;
    v22[5] = v21;
    swift_beginAccess();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB9F7C28);
    swift_getFunctionTypeMetadata2();
    sub_1BBBEB428();
    sub_1BBBEB3F8();
    swift_endAccess();
  }
}

uint64_t *Future.addSuccess(block:)(uint64_t a1, uint64_t a2)
{
  return sub_1BBBB1CF8(a1, a2, (uint64_t)&unk_1F14F5DA8, (void (*)(char *, id))sub_1BBBB2EF8);
}

uint64_t sub_1BBBB1AF8(uint64_t a1, uint64_t a2, void (*a3)(char *), uint64_t a4, uint64_t a5)
{
  uint64_t v8 = sub_1BBBEB6B8();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x1F4188790](v8);
  uint64_t v12 = (char *)&v17 - v11;
  uint64_t v13 = *(void *)(a5 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v15 = (char *)&v17 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, a1, v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v12, 1, a5) == 1) {
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v12, a5);
  a3(v15);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, a5);
}

uint64_t *Future.addFailure(block:)(uint64_t a1, uint64_t a2)
{
  return sub_1BBBB1CF8(a1, a2, (uint64_t)&unk_1F14F5DD0, (void (*)(char *, id))sub_1BBBB2F04);
}

uint64_t *sub_1BBBB1CF8(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(char *, id))
{
  uint64_t v8 = *v4;
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = *(void *)(v8 + 80);
  v9[3] = a1;
  v9[4] = a2;
  swift_retain();
  Future.addCompletion(block:)(a4, (uint64_t)v9);
  swift_release();
  return v4;
}

void sub_1BBBB1D84(uint64_t a1, void *a2, void (*a3)(void *), uint64_t a4, uint64_t a5)
{
  if (a2 && (*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a5 - 8) + 48))(a1, 1, a5) == 1)
  {
    id v7 = a2;
    a3(a2);
  }
}

uint64_t sub_1BBBB1E28(uint64_t a1, uint64_t a2, void **a3, void *a4)
{
  uint64_t v8 = sub_1BBBEB6B8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v18 - v10;
  sub_1BBBAFBBC((uint64_t)&v18 - v10);
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 40))(a1, v11, v8);
  uint64_t v12 = *(void **)(a2 + *(void *)(*(void *)a2 + 112));
  uint64_t v13 = *a3;
  *a3 = v12;
  id v14 = v12;

  uint64_t v15 = (void *)(a2 + *(void *)(*(void *)a2 + 120));
  swift_beginAccess();
  *a4 = *v15;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB9F7C28);
  swift_getFunctionTypeMetadata2();
  uint64_t v16 = sub_1BBBEB198();
  return sub_1BBBAFD48(v16);
}

uint64_t Future.flatMap(continuation:)(uint64_t a1, uint64_t a2)
{
  type metadata accessor for Promise();
  uint64_t v5 = sub_1BBBB021C();
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = a1;
  v6[3] = a2;
  v6[4] = v2;
  v6[5] = v5;
  swift_retain();
  swift_retain();
  swift_retain();
  Future.addSuccess(block:)((uint64_t)sub_1BBBB2F14, (uint64_t)v6);
  swift_release();
  swift_release();
  swift_retain();
  Future.addFailure(block:)((uint64_t)sub_1BBBB3740, v5);
  swift_release();
  swift_release();
  uint64_t v7 = *(void *)(v5 + 16);
  swift_retain();
  swift_release();
  return v7;
}

uint64_t sub_1BBBB20D8(uint64_t a1, void (*a2)(void), uint64_t a3, uint64_t a4, uint64_t a5)
{
  a2();
  swift_retain();
  Future.addSuccess(block:)((uint64_t)sub_1BBBB373C, a5);
  swift_release();
  swift_release();
  swift_retain();
  Future.addFailure(block:)((uint64_t)sub_1BBBB3740, a5);
  swift_release_n();
  return swift_release();
}

uint64_t Future.reschedule(scheduler:)(uint64_t a1)
{
  type metadata accessor for Promise();
  uint64_t v2 = sub_1BBBB021C();
  sub_1BBBB2A30(a1, (uint64_t)v6);
  uint64_t v3 = swift_allocObject();
  sub_1BBBB2BA8(v6, v3 + 16);
  *(void *)(v3 + 56) = v2;
  swift_retain();
  Future.addCompletion(block:)((void (*)(char *, id))sub_1BBBB2F60, v3);
  swift_release();
  swift_release();
  uint64_t v4 = *(void *)(v2 + 16);
  swift_retain();
  swift_release();
  return v4;
}

uint64_t sub_1BBBB2260(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v23 = a2;
  uint64_t v7 = *(void *)(*(void *)a4 + 80);
  uint64_t v8 = sub_1BBBEB6B8();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x1F4188790](v8);
  uint64_t v12 = (char *)&v22 - v11;
  uint64_t v13 = a3[3];
  uint64_t v14 = a3[4];
  unsigned __int8 v22 = __swift_project_boxed_opaque_existential_1(a3, v13);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, a1, v8);
  unint64_t v15 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  unint64_t v16 = (v10 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v7;
  *(void *)(v17 + 24) = a4;
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v17 + v15, v12, v8);
  uint64_t v18 = v23;
  *(void *)(v17 + v16) = v23;
  id v19 = *(void (**)(uint64_t (*)(), uint64_t, uint64_t, uint64_t))(v14 + 8);
  swift_retain();
  id v20 = v18;
  v19(sub_1BBBB35D4, v17, v13, v14);
  return swift_release();
}

uint64_t Future.recover(recovery:)(uint64_t a1, uint64_t a2)
{
  type metadata accessor for Promise();
  uint64_t v5 = sub_1BBBB021C();
  swift_retain();
  Future.addSuccess(block:)((uint64_t)sub_1BBBB373C, v5);
  swift_release();
  uint64_t v6 = (void *)swift_allocObject();
  long long v6[2] = a1;
  v6[3] = a2;
  v6[4] = v2;
  v6[5] = v5;
  swift_retain();
  swift_retain();
  swift_retain();
  Future.addFailure(block:)((uint64_t)sub_1BBBB2FB8, (uint64_t)v6);
  swift_release_n();
  swift_release();
  uint64_t v7 = *(void *)(v5 + 16);
  swift_retain();
  swift_release();
  return v7;
}

uint64_t sub_1BBBB252C(uint64_t a1, void (*a2)(void), uint64_t a3, uint64_t a4, uint64_t a5)
{
  a2();
  swift_retain();
  Future.addSuccess(block:)((uint64_t)sub_1BBBB3490, a5);
  swift_release();
  swift_release();
  swift_retain();
  Future.addFailure(block:)((uint64_t)sub_1BBBB3494, a5);
  swift_release_n();
  return swift_release();
}

uint64_t Future.hash(into:)()
{
  return sub_1BBBEB238();
}

uint64_t Future.hashValue.getter()
{
  return sub_1BBBEBBB8();
}

uint64_t sub_1BBBB26A4()
{
  return Future.hashValue.getter();
}

uint64_t sub_1BBBB26C8()
{
  return Future.hash(into:)();
}

uint64_t sub_1BBBB26EC()
{
  return sub_1BBBEBBB8();
}

BOOL static Future.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

BOOL sub_1BBBB2738(uint64_t *a1, uint64_t *a2)
{
  return static Future.== infix(_:_:)(*a1, *a2);
}

uint64_t Future.debugDescription.getter()
{
  return 60;
}

uint64_t sub_1BBBB283C()
{
  return Future.debugDescription.getter();
}

uint64_t sub_1BBBB2860(uint64_t a1)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  return result;
}

uint64_t sub_1BBBB2894(void *a1)
{
  LOBYTE(a1) = Future.finish(error:)(a1);
  swift_release();
  return a1 & 1;
}

uint64_t sub_1BBBB28D8(uint64_t a1)
{
  LOBYTE(a1) = Future.finish(result:)(a1);
  swift_release();
  return a1 & 1;
}

uint64_t sub_1BBBB291C(uint64_t a1, void *a2)
{
  LOBYTE(a2) = Future.finish(result:error:)(a1, a2);
  swift_release();
  return a2 & 1;
}

uint64_t Promise.deinit()
{
  swift_release();
  return v0;
}

uint64_t Promise.__deallocating_deinit()
{
  swift_release();
  return MEMORY[0x1F4186488](v0, 24, 7);
}

uint64_t sub_1BBBB29C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F835B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BBBB2A30(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1BBBB2A94(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F835B8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1BBBB2B38()
{
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1BBBB2B78()
{
  return (*(uint64_t (**)(void))(v0 + 16))(*(void *)(v0 + 32));
}

uint64_t sub_1BBBB2BA8(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

unint64_t sub_1BBBB2BC0()
{
  unint64_t result = qword_1EB9F8328;
  if (!qword_1EB9F8328)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB9F8320);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9F8328);
  }
  return result;
}

uint64_t sub_1BBBB2C1C()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

void sub_1BBBB2C54()
{
  sub_1BBBB0970(*(_WORD **)(v0 + 16), *(unsigned char **)(v0 + 24));
}

uint64_t sub_1BBBB2C5C()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1BBBB2C6C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(sub_1BBBEB6B8() - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  swift_release();
  uint64_t v6 = *(void *)(v1 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v4, 1, v1)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v4, v1);
  }
  unint64_t v7 = (v5 + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = ((v7 + 15) & 0xFFFFFFFFFFFFFFF8) + 8;

  return MEMORY[0x1F4186498](v0, v8, v3 | 7);
}

void sub_1BBBB2DB0()
{
  uint64_t v1 = *(void *)(sub_1BBBEB6B8() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v3 = (*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v4 = *(unsigned char **)(v0 + 24);
  uint64_t v5 = *(void **)(v0 + v3);
  uint64_t v6 = *(unsigned char **)(v0 + ((v3 + 15) & 0xFFFFFFFFFFFFFFF8));
  sub_1BBBB148C(v4, v0 + v2, v5, v6);
}

uint64_t sub_1BBBB2E50()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1BBBB2E60()
{
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 64, 7);
}

void sub_1BBBB2EA0()
{
  sub_1BBBB18E0(*(void *)(v0 + 16), *(unsigned char **)(v0 + 24), *(void ***)(v0 + 32), *(unsigned char **)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56));
}

uint64_t sub_1BBBB2EB0()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1BBBB2EC0()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1BBBB2EF8(uint64_t a1, uint64_t a2)
{
  return sub_1BBBB1AF8(a1, a2, *(void (**)(char *))(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 16));
}

void sub_1BBBB2F04(uint64_t a1, void *a2)
{
  sub_1BBBB1D84(a1, a2, *(void (**)(void *))(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 16));
}

uint64_t sub_1BBBB2F14(uint64_t a1)
{
  return sub_1BBBB20D8(a1, *(void (**)(void))(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_1BBBB2F20()
{
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  swift_release();
  return MEMORY[0x1F4186498](v0, 64, 7);
}

uint64_t sub_1BBBB2F60(uint64_t a1, void *a2)
{
  return sub_1BBBB2260(a1, a2, (void *)(v2 + 16), *(void *)(v2 + 56));
}

uint64_t objectdestroy_54Tm()
{
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1BBBB2FB8(uint64_t a1)
{
  return sub_1BBBB252C(a1, *(void (**)(void))(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_1BBBB2FC4(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1BBBB300C()
{
  unint64_t result = qword_1EB9F7960;
  if (!qword_1EB9F7960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9F7960);
  }
  return result;
}

unint64_t sub_1BBBB3064()
{
  unint64_t result = qword_1E9F835C0[0];
  if (!qword_1E9F835C0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1E9F835C0);
  }
  return result;
}

uint64_t sub_1BBBB30B8()
{
  return swift_getWitnessTable();
}

uint64_t getEnumTagSinglePayload for FutureError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for FutureError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1BBBB31C4);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1BBBB31EC()
{
  return 0;
}

ValueMetadata *type metadata accessor for FutureError()
{
  return &type metadata for FutureError;
}

uint64_t sub_1BBBB3204()
{
  uint64_t result = sub_1BBBEB6B8();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_1BBBEADC8();
    if (v2 <= 0x3F) {
      return swift_initClassMetadata2();
    }
  }
  return result;
}

uint64_t type metadata accessor for Future()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for Future(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for Future);
}

uint64_t dispatch thunk of Future.isFinished.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 264))();
}

uint64_t dispatch thunk of Future.isCancelled.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 272))();
}

uint64_t dispatch thunk of static Future.futureWithResult(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 280))();
}

uint64_t dispatch thunk of static Future.futureWithError(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 288))();
}

uint64_t dispatch thunk of static Future.future(scheduler:block:)()
{
  return (*(uint64_t (**)(void))(v0 + 296))();
}

uint64_t dispatch thunk of Future.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 304))();
}

uint64_t dispatch thunk of Future.cancel()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 312))();
}

uint64_t dispatch thunk of Future.didCancel()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 320))();
}

uint64_t sub_1BBBB3430()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for Promise(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for Promise);
}

uint64_t sub_1BBBB3498()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(sub_1BBBEB6B8() - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  swift_release();
  uint64_t v6 = *(void *)(v1 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v4, 1, v1)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v4, v1);
  }
  unint64_t v7 = (v5 + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = v7 + 8;

  return MEMORY[0x1F4186498](v0, v8, v3 | 7);
}

uint64_t sub_1BBBB35D4()
{
  uint64_t v1 = *(void *)(sub_1BBBEB6B8() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  return sub_1BBBB291C(v0 + v2, *(void **)(v0 + ((*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t sub_1BBBB3668(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(uint64_t, void))(v2 + 24))(a1, *a2);
}

uint64_t sub_1BBBB3694()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1BBBB36CC()
{
  return sub_1BBBB1E28(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void ***)(v0 + 32), *(void **)(v0 + 40));
}

uint64_t sub_1BBBB36D8()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

unint64_t sub_1BBBB36E8()
{
  unint64_t result = qword_1E9F83648;
  if (!qword_1E9F83648)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F83648);
  }
  return result;
}

uint64_t Publisher.unique<A>(by:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v51 = a2;
  uint64_t v50 = a1;
  uint64_t v43 = a6;
  sub_1BBBEB4C8();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v10 = sub_1BBBEB6B8();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v49 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v12 = MEMORY[0x1F4188790](TupleTypeMetadata2);
  uint64_t v14 = (uint64_t *)((char *)&v39 - v13);
  uint64_t v44 = v10;
  uint64_t v15 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v12);
  uint64_t v17 = (char *)&v39 - v16;
  uint64_t v52 = a3;
  uint64_t v53 = a5;
  uint64_t v40 = v18;
  uint64_t v19 = sub_1BBBEAE58();
  uint64_t v48 = *(void *)(v19 - 8);
  MEMORY[0x1F4188790](v19);
  uint64_t v46 = (char *)&v39 - v20;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v39 = v19;
  uint64_t v22 = AssociatedTypeWitness;
  uint64_t v41 = WitnessTable;
  uint64_t v47 = sub_1BBBEAE38();
  uint64_t v45 = *(void *)(v47 - 8);
  MEMORY[0x1F4188790](v47);
  uint64_t v42 = (char *)&v39 - v23;
  uint64_t v24 = sub_1BBBEB3B8();
  if (MEMORY[0x1C1861B50](v24, a4))
  {
    uint64_t v25 = v43;
    uint64_t v26 = sub_1BBBB4120(v24, a4, v43);
  }
  else
  {
    uint64_t v25 = v43;
    uint64_t v26 = MEMORY[0x1E4FBC870];
  }
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v17, 1, 1, v22);
  uint64_t v27 = v40;
  uint64_t v28 = (char *)v14 + *(int *)(v40 + 48);
  *uint64_t v14 = v26;
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v28, v17, v44);
  uint64_t v29 = (void *)swift_allocObject();
  uint64_t v31 = v52;
  uint64_t v30 = v53;
  v29[2] = v52;
  v29[3] = a4;
  v29[4] = v30;
  v29[5] = v25;
  v29[6] = v50;
  v29[7] = v51;
  swift_retain();
  uint64_t v32 = v46;
  sub_1BBBEAFF8();
  swift_release();
  (*(void (**)(uint64_t *, uint64_t))(v49 + 8))(v14, v27);
  uint64_t v33 = (void *)swift_allocObject();
  v33[2] = v31;
  v33[3] = a4;
  v33[4] = v30;
  v33[5] = v25;
  uint64_t v34 = v42;
  uint64_t v35 = v39;
  sub_1BBBEAFD8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v48 + 8))(v32, v35);
  uint64_t v36 = v47;
  swift_getWitnessTable();
  uint64_t v37 = sub_1BBBEAFC8();
  (*(void (**)(char *, uint64_t))(v45 + 8))(v34, v36);
  return v37;
}

uint64_t sub_1BBBB3C4C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, void (*a3)(uint64_t)@<X2>, uint64_t a4@<X3>, uint64_t a5@<X5>, void *a6@<X8>)
{
  uint64_t v31 = a4;
  uint64_t v32 = a3;
  uint64_t v29 = a5;
  uint64_t v30 = a2;
  uint64_t v33 = a6;
  uint64_t v7 = *(void *)(a5 - 8);
  uint64_t v8 = MEMORY[0x1F4188790](a1);
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)v28 - v9;
  v28[1] = sub_1BBBEB4C8();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v12 = sub_1BBBEB6B8();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v14 = TupleTypeMetadata2 - 8;
  MEMORY[0x1F4188790](TupleTypeMetadata2);
  uint64_t v16 = (char *)v28 - v15;
  uint64_t v17 = *(int *)(v14 + 56);
  uint64_t v18 = &v16[v17];
  uint64_t v19 = (char *)a1 + v17;
  uint64_t v20 = *a1;
  *(void *)uint64_t v16 = v20;
  uint64_t v21 = *(void *)(v12 - 8);
  (*(void (**)(char *, char *, uint64_t))(v21 + 16))(&v16[v17], v19, v12);
  uint64_t v34 = v20;
  uint64_t v22 = *(void (**)(char *, uint64_t))(v21 + 8);
  swift_bridgeObjectRetain();
  v22(v18, v12);
  uint64_t v23 = v30;
  v32(v30);
  LOBYTE(v18) = sub_1BBBEB4B8();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v29);
  uint64_t v24 = (char *)v33 + *(int *)(v14 + 56);
  *uint64_t v33 = v34;
  uint64_t v25 = *(void *)(AssociatedTypeWitness - 8);
  if (v18)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16))(v24, v23, AssociatedTypeWitness);
    uint64_t v26 = 0;
  }
  else
  {
    uint64_t v26 = 1;
  }
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v25 + 56))(v24, v26, 1, AssociatedTypeWitness);
}

uint64_t sub_1BBBB3F28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_1BBBEB4C8();
  swift_getAssociatedTypeWitness();
  uint64_t v4 = sub_1BBBEB6B8();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v7 = *(int *)(MEMORY[0x1F4188790](TupleTypeMetadata2 - 8) + 56);
  uint64_t v8 = (char *)&v12 + v7 - v6;
  uint64_t v9 = a1 + v7;
  uint64_t v10 = *(void *)(v4 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v8, v9, v4);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v10 + 32))(a2, v8, v4);
}

uint64_t Publisher<>.unique()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (void *)swift_allocObject();
  long long v6[2] = a1;
  v6[3] = a2;
  v6[4] = a3;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = Publisher.unique<A>(by:)((uint64_t)sub_1BBBB4550, (uint64_t)v6, a1, AssociatedTypeWitness, a2, a3);
  swift_release();
  return v8;
}

uint64_t sub_1BBBB4120(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a1;
  uint64_t v6 = *(void *)(a2 - 8);
  uint64_t v7 = MEMORY[0x1F4188790](a1);
  uint64_t v9 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x1F4188790](v7);
  uint64_t v51 = (char *)&v39 - v11;
  uint64_t v40 = v12;
  uint64_t v13 = MEMORY[0x1F4188790](v10);
  uint64_t v15 = (char *)&v39 - v14;
  if (MEMORY[0x1C1861B20](v13))
  {
    sub_1BBBEB848();
    uint64_t v16 = sub_1BBBEB838();
  }
  else
  {
    uint64_t v16 = MEMORY[0x1E4FBC870];
  }
  uint64_t v44 = MEMORY[0x1C1861B50](v5, a2);
  if (!v44) {
    return v16;
  }
  uint64_t v17 = 0;
  uint64_t v49 = (void (**)(char *, uint64_t *, uint64_t))(v6 + 16);
  uint64_t v50 = v16 + 56;
  uint64_t v46 = v6 + 32;
  uint64_t v48 = (void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v41 = v6;
  uint64_t v42 = v5;
  uint64_t v43 = v15;
  while (1)
  {
    char v18 = sub_1BBBEB3C8();
    sub_1BBBEB398();
    if (v18)
    {
      uint64_t v19 = *(void (**)(char *, uint64_t *, uint64_t))(v6 + 16);
      v19(v15, (uint64_t *)(v5+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(void *)(v6 + 72) * v17), a2);
      BOOL v20 = __OFADD__(v17, 1);
      uint64_t v21 = v17 + 1;
      if (v20) {
        goto LABEL_20;
      }
    }
    else
    {
      uint64_t result = sub_1BBBEB878();
      if (v40 != 8) {
        goto LABEL_23;
      }
      uint64_t v52 = result;
      uint64_t v19 = *v49;
      (*v49)(v15, &v52, a2);
      swift_unknownObjectRelease();
      BOOL v20 = __OFADD__(v17, 1);
      uint64_t v21 = v17 + 1;
      if (v20)
      {
LABEL_20:
        __break(1u);
        return v16;
      }
    }
    uint64_t v47 = v21;
    uint64_t v45 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
    v45(v51, v15, a2);
    uint64_t v22 = sub_1BBBEB228();
    uint64_t v23 = v16;
    uint64_t v24 = -1 << *(unsigned char *)(v16 + 32);
    unint64_t v25 = v22 & ~v24;
    unint64_t v26 = v25 >> 6;
    uint64_t v27 = *(void *)(v50 + 8 * (v25 >> 6));
    uint64_t v28 = 1 << v25;
    uint64_t v29 = *(void *)(v6 + 72);
    if (((1 << v25) & v27) != 0)
    {
      uint64_t v30 = ~v24;
      do
      {
        v19(v9, (uint64_t *)(*(void *)(v23 + 48) + v29 * v25), a2);
        uint64_t v31 = a3;
        char v32 = sub_1BBBEB268();
        uint64_t v33 = *v48;
        (*v48)(v9, a2);
        if (v32)
        {
          v33(v51, a2);
          a3 = v31;
          uint64_t v6 = v41;
          uint64_t v5 = v42;
          uint64_t v16 = v23;
          goto LABEL_7;
        }
        unint64_t v25 = (v25 + 1) & v30;
        unint64_t v26 = v25 >> 6;
        uint64_t v27 = *(void *)(v50 + 8 * (v25 >> 6));
        uint64_t v28 = 1 << v25;
        a3 = v31;
      }
      while ((v27 & (1 << v25)) != 0);
      uint64_t v6 = v41;
      uint64_t v5 = v42;
    }
    uint64_t v34 = v51;
    *(void *)(v50 + 8 * v26) = v28 | v27;
    unint64_t v35 = *(void *)(v23 + 48) + v29 * v25;
    uint64_t v16 = v23;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v45)(v35, v34, a2);
    uint64_t v37 = *(void *)(v23 + 16);
    BOOL v20 = __OFADD__(v37, 1);
    uint64_t v38 = v37 + 1;
    if (v20) {
      break;
    }
    *(void *)(v23 + 16) = v38;
LABEL_7:
    uint64_t v15 = v43;
    uint64_t v17 = v47;
    if (v47 == v44) {
      return v16;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
  return result;
}

uint64_t sub_1BBBB44DC()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 64, 7);
}

uint64_t sub_1BBBB4514@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  return sub_1BBBB3C4C(a1, a2, *(void (**)(uint64_t))(v3 + 48), *(void *)(v3 + 56), *(void *)(v3 + 24), a3);
}

uint64_t sub_1BBBB4524()
{
  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1BBBB4534@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1BBBB3F28(a1, a2);
}

uint64_t sub_1BBBB4540()
{
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1BBBB4550@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16);
  return v5(a2, a1, AssociatedTypeWitness);
}

uint64_t sub_1BBBB45D8()
{
  __swift_instantiateConcreteTypeFromMangledName(qword_1EB9F7438);
  uint64_t result = swift_allocObject();
  *(_DWORD *)(result + 16) = 0;
  qword_1E9F83650 = result;
  return result;
}

void sub_1BBBB4610()
{
  if ((byte_1E9F83658 & 1) == 0)
  {
    uint64_t v0 = dispatch_group_create();
    dispatch_group_enter(v0);
    uint64_t v1 = self;
    uint64_t v2 = swift_allocObject();
    *(void *)(v2 + 16) = v0;
    v5[4] = sub_1BBBB4E78;
    v5[5] = v2;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 1107296256;
    void v5[2] = sub_1BBBAED3C;
    v5[3] = &block_descriptor_1;
    uint64_t v3 = _Block_copy(v5);
    uint64_t v4 = v0;
    swift_release();
    objc_msgSend(v1, sel_detachNewThreadWithBlock_, v3);
    _Block_release(v3);
    sub_1BBBEB568();
  }
}

void sub_1BBBB4728(NSObject *a1)
{
  id v2 = objc_msgSend(self, sel_currentThread);
  uint64_t v3 = (void *)sub_1BBBEB278();
  objc_msgSend(v2, sel_setName_, v3);

  id v4 = objc_msgSend(self, sel_currentRunLoop);
  uint64_t v5 = (void *)qword_1E9F83660;
  qword_1E9F83660 = (uint64_t)v4;

  uint64_t v6 = (void *)qword_1E9F83660;
  if (!qword_1E9F83660) {
    __break(1u);
  }
  v12[4] = nullsub_1;
  v12[5] = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 1107296256;
  v12[2] = sub_1BBBD2A18;
  uint64_t v12[3] = &block_descriptor_3;
  uint64_t v7 = _Block_copy(v12);
  uint64_t v8 = self;
  id v9 = v6;
  id v10 = objc_msgSend(v8, sel_timerWithTimeInterval_repeats_block_, 1, v7, 86400.0);
  _Block_release(v7);
  swift_release();
  objc_msgSend(v9, sel_addTimer_forMode_, v10, *MEMORY[0x1E4F1C3A0]);

  byte_1E9F83658 = 1;
  dispatch_group_leave(a1);
  for (i = (void *)qword_1E9F83660; qword_1E9F83660; i = (void *)qword_1E9F83660)
    objc_msgSend(i, sel_run);
  __break(1u);
}

uint64_t Publisher.timeout(_:queue:customError:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v34 = a1;
  uint64_t v30 = a2;
  uint64_t v31 = a3;
  uint64_t v35 = a6;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F7978);
  MEMORY[0x1F4188790](v8 - 8);
  id v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F83668);
  MEMORY[0x1F4188790](v11 - 8);
  uint64_t v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_1BBBEB688();
  uint64_t v14 = *(void *)(v29 - 8);
  MEMORY[0x1F4188790](v29);
  uint64_t v16 = (char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_1BBBB4D64(255, &qword_1E9F83670);
  uint64_t v18 = sub_1BBBB4DA0(&qword_1E9F83678, &qword_1E9F83670);
  char v32 = a4;
  uint64_t v33 = a5;
  id v36 = a4;
  uint64_t v37 = v17;
  uint64_t v38 = a5;
  uint64_t v39 = v18;
  uint64_t v19 = sub_1BBBEAE98();
  uint64_t v20 = *(void *)(v19 - 8);
  MEMORY[0x1F4188790](v19);
  uint64_t v22 = (char *)&v28 - v21;
  if (qword_1E9F833A8 != -1) {
    swift_once();
  }
  sub_1BBBEADF8();
  uint64_t result = sub_1BBBEB678();
  uint64_t v24 = (void *)qword_1E9F83660;
  if (qword_1E9F83660)
  {
    id v36 = (id)qword_1E9F83660;
    uint64_t v25 = sub_1BBBEB668();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v13, 1, 1, v25);
    id v26 = v24;
    sub_1BBBEB058();
    sub_1BBBB4DE4((uint64_t)v13, &qword_1E9F83668);

    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v29);
    id v36 = v34;
    uint64_t v27 = sub_1BBBEB5D8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v10, 1, 1, v27);
    sub_1BBBB4D64(0, (unint64_t *)&qword_1EB9F8340);
    swift_getWitnessTable();
    sub_1BBBB4DA0(&qword_1EB9F8270, (unint64_t *)&qword_1EB9F8340);
    sub_1BBBEB048();
    sub_1BBBB4DE4((uint64_t)v10, &qword_1EB9F7978);
    return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v22, v19);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1BBBB4D64(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1BBBB4DA0(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1BBBB4D64(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1BBBB4DE4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1BBBB4E40()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1BBBB4E78()
{
  sub_1BBBB4728(*(NSObject **)(v0 + 16));
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1BBBB4E98()
{
  uint64_t v0 = sub_1BBBEAE28();
  __swift_allocate_value_buffer(v0, qword_1E9F85850);
  __swift_project_value_buffer(v0, (uint64_t)qword_1E9F85850);
  return sub_1BBBEAE18();
}

unint64_t BluetoothPairingState.Reason.description.getter()
{
  unint64_t result = 0x6E776F6E6B6E752ELL;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x6465726961702ELL;
      break;
    case 2:
    case 4:
      unint64_t result = 0x65726961706E752ELL;
      break;
    case 3:
      unint64_t result = 0xD000000000000013;
      break;
    case 5:
      unint64_t result = 0x4D726961706E752ELL;
      break;
    default:
      return result;
  }
  return result;
}

SPShared::BluetoothPairingState::Reason_optional __swiftcall BluetoothPairingState.Reason.init(rawValue:)(SPShared::BluetoothPairingState::Reason_optional rawValue)
{
  switch(rawValue.value)
  {
    case 0xC8:
      SPShared::BluetoothPairingState::Reason *v1 = SPShared_BluetoothPairingState_Reason_unpaired;
      break;
    case 0xC9:
      SPShared::BluetoothPairingState::Reason *v1 = SPShared_BluetoothPairingState_Reason_unpairedUserSwitch;
      break;
    case 0xCA:
      SPShared::BluetoothPairingState::Reason *v1 = SPShared_BluetoothPairingState_Reason_unpairedCloud;
      break;
    case 0xCB:
      SPShared::BluetoothPairingState::Reason *v1 = SPShared_BluetoothPairingState_Reason_unpairMagnet;
      break;
    default:
      if (rawValue.value == SPShared_BluetoothPairingState_Reason_paired) {
        SPShared::BluetoothPairingState::Reason value = rawValue.value;
      }
      else {
        SPShared::BluetoothPairingState::Reason value = SPShared_BluetoothPairingState_Reason_unknownDefault;
      }
      if (rawValue.value) {
        SPShared::BluetoothPairingState::Reason v3 = value;
      }
      else {
        SPShared::BluetoothPairingState::Reason v3 = SPShared_BluetoothPairingState_Reason_unknown;
      }
      SPShared::BluetoothPairingState::Reason *v1 = v3;
      break;
  }
  return rawValue;
}

unint64_t BluetoothPairingState.Reason.rawValue.getter()
{
  return 0xCBCAC9C80100uLL >> (8 * *v0);
}

BOOL sub_1BBBB509C(unsigned char *a1, unsigned char *a2)
{
  return (0xCBCAC9C80100uLL >> (8 * *a1)) == (0xCBCAC9C80100uLL >> (8 * *a2));
}

uint64_t sub_1BBBB50D4()
{
  return sub_1BBBEBBB8();
}

uint64_t sub_1BBBB512C()
{
  return sub_1BBBEBB98();
}

uint64_t sub_1BBBB516C()
{
  return sub_1BBBEBBB8();
}

SPShared::BluetoothPairingState::Reason_optional sub_1BBBB51C0(Swift::UInt8 *a1)
{
  return BluetoothPairingState.Reason.init(rawValue:)(*a1);
}

void sub_1BBBB51C8(unsigned char *a1@<X8>)
{
  *a1 = 0xCBCAC9C80100uLL >> (8 * *v1);
}

unint64_t sub_1BBBB51E8()
{
  unint64_t result = 0x6E776F6E6B6E752ELL;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x6465726961702ELL;
      break;
    case 2:
    case 4:
      unint64_t result = 0x65726961706E752ELL;
      break;
    case 3:
      unint64_t result = 0xD000000000000013;
      break;
    case 5:
      unint64_t result = 0x4D726961706E752ELL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t BluetoothPairingState.rawValue.getter()
{
  return *(void *)v0;
}

uint64_t BluetoothPairingState.rawValue.setter(uint64_t result)
{
  void *v1 = result;
  return result;
}

uint64_t (*BluetoothPairingState.rawValue.modify())()
{
  return nullsub_1;
}

uint64_t BluetoothPairingState.macAddress.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for BluetoothPairingState() + 20);
  uint64_t v4 = sub_1BBBEAB88();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for BluetoothPairingState()
{
  uint64_t result = qword_1E9F836A8;
  if (!qword_1E9F836A8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t BluetoothPairingState.reason.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for BluetoothPairingState();
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 24));
  return result;
}

BOOL BluetoothPairingState.isPaired.getter()
{
  return *(unsigned char *)(v0 + *(int *)(type metadata accessor for BluetoothPairingState() + 24)) == 1;
}

uint64_t BluetoothPairingState.isUnpaired.getter()
{
  unsigned int v1 = *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for BluetoothPairingState() + 24));
  return (v1 < 6) & (0x34u >> v1);
}

uint64_t BluetoothPairingState.init(rawValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v48 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F83680);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)&v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1BBBEAB88();
  uint64_t v46 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for BluetoothPairingState();
  uint64_t v47 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (uint64_t *)((char *)&v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v45 = a1;
  uint64_t v49 = a1;
  sub_1BBBB5A88();
  uint64_t v12 = sub_1BBBEB8F8();
  unint64_t v14 = v13;
  uint64_t v15 = sub_1BBBEAD38();
  unint64_t v17 = v16;
  uint64_t v18 = sub_1BBBB65B8(v15, v16);
  sub_1BBBB6774(v15, v17);
  sub_1BBBEAD58();
  uint64_t v19 = (uint64_t)v18;
  uint64_t v20 = v6;
  uint64_t v21 = v46;
  sub_1BBBB5ADC(v19);
  sub_1BBBEAB78();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v5, 1, v20) == 1)
  {
    unint64_t v22 = v14;
    uint64_t v45 = v9;
    sub_1BBBB4DE4((uint64_t)v5, &qword_1E9F83680);
    if (qword_1E9F833B0 != -1) {
      swift_once();
    }
    uint64_t v23 = sub_1BBBEAE28();
    __swift_project_value_buffer(v23, (uint64_t)qword_1E9F85850);
    uint64_t v24 = v12;
    sub_1BBBB67CC(v12, v14);
    sub_1BBBB67CC(v12, v14);
    uint64_t v25 = sub_1BBBEAE08();
    os_log_type_t v26 = sub_1BBBEB538();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      unint64_t v50 = v22;
      uint64_t v51 = v28;
      *(_DWORD *)uint64_t v27 = 136446210;
      uint64_t v49 = v24;
      sub_1BBBB6824();
      uint64_t v29 = sub_1BBBEABE8();
      uint64_t v49 = sub_1BBBAC938(v29, v30, &v51);
      sub_1BBBEB6C8();
      swift_bridgeObjectRelease();
      sub_1BBBB6774(v24, v22);
      sub_1BBBB6774(v24, v22);
      _os_log_impl(&dword_1BBBA9000, v25, v26, "Invalid MACAddress %{public}s", v27, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C1862BC0](v28, -1, -1);
      MEMORY[0x1C1862BC0](v27, -1, -1);

      sub_1BBBB6774(v24, v22);
    }
    else
    {
      sub_1BBBB6774(v24, v22);
      sub_1BBBB6774(v24, v22);
      sub_1BBBB6774(v24, v22);
    }
    uint64_t v9 = v45;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v47 + 56))(v48, 1, 1, v9);
  }
  (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v8, v5, v20);
  uint64_t v31 = (char *)v11 + *(int *)(v9 + 20);
  (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v31, v8, v20);
  Swift::UInt8 v32 = sub_1BBBEAD58();
  BluetoothPairingState.Reason.init(rawValue:)(v32);
  char v33 = v49;
  if (v49 == 6)
  {
    if (qword_1E9F833B0 != -1) {
      swift_once();
    }
    uint64_t v34 = sub_1BBBEAE28();
    __swift_project_value_buffer(v34, (uint64_t)qword_1E9F85850);
    uint64_t v35 = sub_1BBBEAE08();
    os_log_type_t v36 = sub_1BBBEB538();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = (uint8_t *)swift_slowAlloc();
      uint64_t v45 = v9;
      uint64_t v38 = v20;
      uint64_t v39 = v37;
      *(_DWORD *)uint64_t v37 = 16908544;
      LOBYTE(v49) = v32;
      sub_1BBBEB6C8();
      _os_log_impl(&dword_1BBBA9000, v35, v36, "Invalid reason %{public}hhu", v39, 5u);
      uint64_t v40 = v39;
      uint64_t v20 = v38;
      uint64_t v9 = v45;
      MEMORY[0x1C1862BC0](v40, -1, -1);
    }

    sub_1BBBB6774(v12, v14);
    uint64_t v41 = *(void (**)(char *, uint64_t))(v21 + 8);
    v41(v8, v20);
    v41(v31, v20);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v47 + 56))(v48, 1, 1, v9);
  }
  (*(void (**)(char *, uint64_t))(v21 + 8))(v8, v20);
  sub_1BBBB6774(v12, v14);
  *((unsigned char *)v11 + *(int *)(v9 + 24)) = v33;
  *uint64_t v11 = v45;
  uint64_t v43 = v48;
  sub_1BBBB6878((uint64_t)v11, v48);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v47 + 56))(v43, 0, 1, v9);
  return sub_1BBBB68DC((uint64_t)v11);
}

unint64_t sub_1BBBB5A88()
{
  unint64_t result = qword_1E9F83688;
  if (!qword_1E9F83688)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F83688);
  }
  return result;
}

uint64_t sub_1BBBB5ADC(uint64_t a1)
{
  v20[5] = *MEMORY[0x1E4F143B8];
  *(void *)&long long v17 = a1;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F836B8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F836C0);
  if (!swift_dynamicCast())
  {
    uint64_t v19 = 0;
    memset(v18, 0, sizeof(v18));
    sub_1BBBB4DE4((uint64_t)v18, &qword_1E9F836C8);
    *(void *)&v18[0] = sub_1BBBB71DC(*(void *)(a1 + 16));
    *((void *)&v18[0] + 1) = v1;
    MEMORY[0x1F4188790](*(void *)&v18[0]);
    uint64_t v2 = sub_1BBBB5FF4((void *(*)(uint64_t *__return_ptr, char *, char *))sub_1BBBB727C);
    uint64_t v5 = *((void *)&v18[0] + 1) >> 62;
    uint64_t v6 = v2;
    uint64_t v7 = v3;
    switch(*((void *)&v18[0] + 1) >> 62)
    {
      case 1:
        LODWORD(v8) = DWORD1(v18[0]) - LODWORD(v18[0]);
        if (__OFSUB__(DWORD1(v18[0]), v18[0])) {
          goto LABEL_37;
        }
        uint64_t v8 = (int)v8;
LABEL_8:
        if (v4 == v8)
        {
LABEL_14:
          memset(v20, 0, 15);
          if (!v3)
          {
LABEL_29:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            return *(void *)&v18[0];
          }
          if (!__OFSUB__(v3, 1))
          {
            if (v3 - 1 < 0)
            {
LABEL_31:
              __break(1u);
            }
            else
            {
              LOBYTE(v13) = 0;
              while (1)
              {
                uint64_t v14 = v7 - 1;
                if ((unint64_t)(v7 - 1) >= *((void *)v6 + 2)) {
                  break;
                }
                *((unsigned char *)v20 + v13) = v6[v7 + 31];
                __int16 v13 = v13 + 1;
                if ((v13 & 0x100) != 0) {
                  goto LABEL_33;
                }
                if (v13 == 14)
                {
                  sub_1BBBEAD18();
                  if (v7 == 1) {
                    goto LABEL_29;
                  }
                  LOBYTE(v13) = 0;
                }
                else if (v7 == 1)
                {
                  goto LABEL_34;
                }
                --v7;
                if (v14 < 1) {
                  goto LABEL_31;
                }
              }
            }
            __break(1u);
LABEL_33:
            __break(1u);
LABEL_34:
            sub_1BBBEAD18();
            goto LABEL_29;
          }
        }
        else
        {
          if (v5)
          {
            if (v5 == 1) {
              uint64_t v12 = *(uint64_t *)&v18[0] >> 32;
            }
            else {
              uint64_t v12 = *(void *)(*(void *)&v18[0] + 24);
            }
          }
          else
          {
            uint64_t v12 = BYTE14(v18[0]);
          }
LABEL_27:
          if (v12 >= v4)
          {
            sub_1BBBEAD08();
            goto LABEL_29;
          }
          __break(1u);
        }
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
        return result;
      case 2:
        uint64_t v10 = *(void *)(*(void *)&v18[0] + 16);
        uint64_t v9 = *(void *)(*(void *)&v18[0] + 24);
        BOOL v11 = __OFSUB__(v9, v10);
        uint64_t v8 = v9 - v10;
        if (!v11) {
          goto LABEL_8;
        }
        goto LABEL_38;
      case 3:
        if (!v4) {
          goto LABEL_14;
        }
        uint64_t v12 = 0;
        goto LABEL_27;
      default:
        uint64_t v8 = BYTE14(v18[0]);
        goto LABEL_8;
    }
  }
  sub_1BBBB2BA8(v18, (uint64_t)v20);
  __swift_project_boxed_opaque_existential_1(v20, v20[3]);
  sub_1BBBEAC68();
  swift_bridgeObjectRelease();
  v18[0] = v17;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v20);
  return *(void *)&v18[0];
}

uint64_t BluetoothPairingState.description.getter()
{
  return 0x203A43414DLL;
}

uint64_t sub_1BBBB5FE8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return BluetoothPairingState.init(rawValue:)(*a1, a2);
}

char *sub_1BBBB5FF4(void *(*a1)(uint64_t *__return_ptr, char *, char *))
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *v1;
  unint64_t v3 = v1[1];
  uint64_t v5 = v1;
  switch(v3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      *(_OWORD *)uint64_t v1 = xmmword_1BBBECEA0;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v11 = v4 >> 32;
      if (isUniquelyReferenced_nonNull_native) {
        goto LABEL_16;
      }
      if (v11 < (int)v4) {
        goto LABEL_23;
      }
      if (sub_1BBBEAC18() && __OFSUB__((int)v4, sub_1BBBEAC48())) {
        goto LABEL_24;
      }
      sub_1BBBEAC58();
      swift_allocObject();
      uint64_t v13 = sub_1BBBEABF8();
      swift_release();
      uint64_t v9 = v13;
      uint64_t v11 = v4 >> 32;
LABEL_16:
      if (v11 < (int)v4)
      {
        __break(1u);
LABEL_23:
        __break(1u);
LABEL_24:
        __break(1u);
      }
      uint64_t result = sub_1BBBB63DC((int)v4, v11, a1);
      unint64_t v12 = v9 | 0x4000000000000000;
      if (v2)
      {
        *uint64_t v5 = v4;
        goto LABEL_19;
      }
      *uint64_t v5 = v4;
      v5[1] = v12;
      break;
    case 2uLL:
      uint64_t v14 = *v1;
      uint64_t v15 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      sub_1BBBEACC8();
      uint64_t result = sub_1BBBB63DC(*(void *)(v14 + 16), *(void *)(v14 + 24), a1);
      unint64_t v12 = v15 | 0x8000000000000000;
      if (v2)
      {
        uint64_t *v1 = v14;
LABEL_19:
        v5[1] = v12;
      }
      else
      {
        uint64_t *v1 = v14;
        v1[1] = v12;
      }
      break;
    case 3uLL:
      memset(v16, 0, 15);
      uint64_t result = (char *)a1(&v14, (char *)v16, (char *)v16);
      if (!v2) {
        return (char *)v14;
      }
      return result;
    default:
      v16[0] = *v1;
      LOWORD(v16[1]) = v3;
      BYTE2(v16[1]) = BYTE2(v3);
      BYTE3(v16[1]) = BYTE3(v3);
      BYTE4(v16[1]) = BYTE4(v3);
      BYTE5(v16[1]) = BYTE5(v3);
      BYTE6(v16[1]) = BYTE6(v3);
      uint64_t result = (char *)a1(&v14, (char *)v16, (char *)v16 + BYTE6(v3));
      if (!v2) {
        uint64_t result = (char *)v14;
      }
      unint64_t v8 = LODWORD(v16[1]) | ((unint64_t)BYTE4(v16[1]) << 32) | ((unint64_t)BYTE5(v16[1]) << 40) | ((unint64_t)BYTE6(v16[1]) << 48);
      uint64_t *v1 = v16[0];
      v1[1] = v8;
      return result;
  }
  return result;
}

unsigned char *sub_1BBBB62F4@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X1>, void *a3@<X8>)
{
  if (!result) {
    goto LABEL_4;
  }
  uint64_t v4 = a2 - result;
  if (a2 == result)
  {
    uint64_t result = 0;
LABEL_4:
    unint64_t v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    uint64_t result = (unsigned char *)sub_1BBBB72E8(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    uint64_t result = (unsigned char *)sub_1BBBB73AC((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000;
  }
  else
  {
    uint64_t result = (unsigned char *)sub_1BBBB7428((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

void *sub_1BBBB636C(void *(*a1)(uint64_t *__return_ptr, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3)
  {
    uint64_t result = a1(&v6, a3, a4 - a3);
    if (v4) {
      return result;
    }
    return (void *)v6;
  }
  uint64_t result = a1(&v6, 0, 0);
  if (!v4) {
    return (void *)v6;
  }
  return result;
}

char *sub_1BBBB63DC(uint64_t a1, uint64_t a2, void *(*a3)(uint64_t *__return_ptr, char *, char *))
{
  uint64_t result = (char *)sub_1BBBEAC18();
  if (!result) {
    goto LABEL_12;
  }
  uint64_t v8 = result;
  uint64_t result = (char *)sub_1BBBEAC48();
  uint64_t v9 = a1 - (void)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  BOOL v10 = __OFSUB__(a2, a1);
  uint64_t v11 = a2 - a1;
  if (v10)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  uint64_t v12 = sub_1BBBEAC38();
  if (v12 >= v11) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v12;
  }
  uint64_t result = (char *)a3(&v14, &v8[v9], &v8[v9 + v13]);
  if (!v3) {
    return (char *)v14;
  }
  return result;
}

uint64_t sub_1BBBB6490(void *a1, unsigned char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(a4 + 16);
  if (!a2)
  {
    uint64_t v5 = *(void *)(a4 + 16);
    uint64_t v4 = 0;
    goto LABEL_26;
  }
  if (!a3)
  {
    uint64_t v5 = *(void *)(a4 + 16);
    goto LABEL_18;
  }
  if (a3 < 0)
  {
    __break(1u);
    goto LABEL_29;
  }
  if (!v4)
  {
LABEL_29:
    uint64_t v5 = 0;
    goto LABEL_26;
  }
  uint64_t v5 = v4 - 1;
  *a2 = *(unsigned char *)(a4 + v4 - 1 + 32);
  if (a3 == 1)
  {
LABEL_18:
    uint64_t v4 = a3;
    goto LABEL_26;
  }
  if (v4 != 1)
  {
    unint64_t v6 = v4 - 2;
    if (v4 - 2 >= (unint64_t)(a3 - 2)) {
      uint64_t v7 = a3 - 2;
    }
    else {
      uint64_t v7 = v4 - 2;
    }
    unint64_t v8 = v7 + 1;
    if (v8 < 0x11) {
      goto LABEL_15;
    }
    uint64_t v9 = (int8x16_t *)(a2 + 1);
    if (v6 >= a3 - 2) {
      unint64_t v6 = a3 - 2;
    }
    if ((unint64_t)v9 >= v4 + a4 + 31 || v4 - v6 + a4 + 30 >= (unint64_t)&a2[v6 + 2])
    {
      uint64_t v11 = v8 & 0xF;
      if ((v8 & 0xF) == 0) {
        uint64_t v11 = 16;
      }
      unint64_t v12 = v8 - v11;
      v5 -= v12;
      a2 += v12;
      uint64_t v10 = v12 + 2;
      uint64_t v13 = (int8x16_t *)(v4 + a4 + 15);
      do
      {
        int8x16_t v14 = *v13--;
        int8x16_t v15 = vrev64q_s8(v14);
        *v9++ = vextq_s8(v15, v15, 8uLL);
        v12 -= 16;
      }
      while (v12);
    }
    else
    {
LABEL_15:
      uint64_t v10 = 2;
    }
    unint64_t v16 = a2 + 1;
    while (1)
    {
      uint64_t v17 = v5 - 1;
      *unint64_t v16 = *(unsigned char *)(a4 + 31 + v5);
      if (a3 == v10) {
        break;
      }
      ++v10;
      ++v16;
      --v5;
      if (!v17) {
        goto LABEL_26;
      }
    }
    --v5;
    goto LABEL_18;
  }
LABEL_26:
  *a1 = a4;
  a1[1] = v5;
  return v4;
}

void *sub_1BBBB65B8(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_1BBBEAD48();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v8 = (void *)MEMORY[0x1E4FBC860];
  switch(a2 >> 62)
  {
    case 1uLL:
      if (__OFSUB__(HIDWORD(a1), a1)) {
        goto LABEL_12;
      }
      uint64_t v9 = HIDWORD(a1) - (int)a1;
LABEL_6:
      if (v9)
      {
        if (v9 >= 1)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F83520);
          unint64_t v8 = (void *)swift_allocObject();
          size_t v12 = _swift_stdlib_malloc_size(v8);
          v8[2] = v9;
          v8[3] = 2 * v12 - 64;
        }
        sub_1BBBB67CC(a1, a2);
        uint64_t v13 = sub_1BBBEACE8();
        sub_1BBBB6774(a1, a2);
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
        if (v13 != v9)
        {
          __break(1u);
LABEL_12:
          __break(1u);
LABEL_13:
          __break(1u);
          JUMPOUT(0x1BBBB6764);
        }
      }
      return v8;
    case 2uLL:
      uint64_t v11 = *(void *)(a1 + 16);
      uint64_t v10 = *(void *)(a1 + 24);
      uint64_t v9 = v10 - v11;
      if (!__OFSUB__(v10, v11)) {
        goto LABEL_6;
      }
      goto LABEL_13;
    case 3uLL:
      return v8;
    default:
      uint64_t v9 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t sub_1BBBB6774(uint64_t a1, unint64_t a2)
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

uint64_t sub_1BBBB67CC(uint64_t a1, unint64_t a2)
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

unint64_t sub_1BBBB6824()
{
  unint64_t result = qword_1E9F83690;
  if (!qword_1E9F83690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F83690);
  }
  return result;
}

uint64_t sub_1BBBB6878(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for BluetoothPairingState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BBBB68DC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for BluetoothPairingState();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1BBBB6938()
{
  unint64_t result = qword_1E9F83698;
  if (!qword_1E9F83698)
  {
    sub_1BBBEAB88();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F83698);
  }
  return result;
}

unint64_t sub_1BBBB6994()
{
  unint64_t result = qword_1E9F836A0;
  if (!qword_1E9F836A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F836A0);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for BluetoothPairingState(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *a2;
    uint64_t v7 = *(int *)(a3 + 20);
    unint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_1BBBEAB88();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    *((unsigned char *)v4 + *(int *)(a3 + 24)) = *((unsigned char *)a2 + *(int *)(a3 + 24));
  }
  return v4;
}

uint64_t destroy for BluetoothPairingState(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  uint64_t v3 = sub_1BBBEAB88();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
  return v4(v2, v3);
}

void *initializeWithCopy for BluetoothPairingState(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  unint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1BBBEAB88();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  *((unsigned char *)a1 + *(int *)(a3 + 24)) = *((unsigned char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void *assignWithCopy for BluetoothPairingState(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  unint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1BBBEAB88();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  *((unsigned char *)a1 + *(int *)(a3 + 24)) = *((unsigned char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void *initializeWithTake for BluetoothPairingState(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  unint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1BBBEAB88();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  *((unsigned char *)a1 + *(int *)(a3 + 24)) = *((unsigned char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void *assignWithTake for BluetoothPairingState(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  unint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1BBBEAB88();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  *((unsigned char *)a1 + *(int *)(a3 + 24)) = *((unsigned char *)a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t getEnumTagSinglePayload for BluetoothPairingState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1BBBB6DAC);
}

uint64_t sub_1BBBB6DAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1BBBEAB88();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else
  {
    unsigned int v12 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 24));
    if (v12 >= 6) {
      return v12 - 5;
    }
    else {
      return 0;
    }
  }
}

uint64_t storeEnumTagSinglePayload for BluetoothPairingState(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1BBBB6E80);
}

uint64_t sub_1BBBB6E80(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1BBBEAB88();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
    unsigned int v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 24)) = a2 + 5;
  }
  return result;
}

uint64_t sub_1BBBB6F40()
{
  uint64_t result = sub_1BBBEAB88();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for BluetoothPairingState.Reason(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
  if (a2 + 5 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 5) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
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
      return (*a1 | (v4 << 8)) - 5;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for BluetoothPairingState.Reason(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *uint64_t result = a2 + 5;
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
        JUMPOUT(0x1BBBB7140);
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
          *uint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BluetoothPairingState.Reason()
{
  return &type metadata for BluetoothPairingState.Reason;
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

uint64_t sub_1BBBB71DC(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    if (result <= 14)
    {
      if (result < 0) {
        __break(1u);
      }
      else {
        return 0;
      }
    }
    else
    {
      sub_1BBBEAC58();
      swift_allocObject();
      sub_1BBBEAC28();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_1BBBEACF8();
        uint64_t result = swift_allocObject();
        *(void *)(result + 16) = 0;
        *(void *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

void *sub_1BBBB727C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v9 = **(void **)(v3 + 16);
  v8[2] = &v9;
  uint64_t result = sub_1BBBB636C((void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_1BBBB74AC, (uint64_t)v8, a1, a2);
  *a3 = result;
  a3[1] = v6;
  a3[2] = v7;
  return result;
}

uint64_t sub_1BBBB72E8(unsigned char *__src, unsigned char *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0;
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

uint64_t sub_1BBBB73AC(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_1BBBEAC58();
  swift_allocObject();
  uint64_t result = sub_1BBBEAC08();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_1BBBEACF8();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_1BBBB7428(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_1BBBEAC58();
  swift_allocObject();
  uint64_t result = sub_1BBBEAC08();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0) {
    return v2 << 32;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_1BBBB74AC@<X0>(unsigned char *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = sub_1BBBB6490(v8, a1, a2, **(void **)(v3 + 16));
  uint64_t v6 = v8[1];
  *a3 = v8[0];
  a3[1] = v6;
  a3[2] = v5;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BBBB7514()
{
  uint64_t v0 = sub_1BBBEAE28();
  __swift_allocate_value_buffer(v0, qword_1EB9F8B50);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EB9F8B50);
  return sub_1BBBEAE18();
}

uint64_t DarwinNotification.name.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DarwinNotification.value.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t DarwinNotification.description.getter()
{
  return 91;
}

unint64_t sub_1BBBB76C0()
{
  unint64_t result = qword_1EB9F75B8;
  if (!qword_1EB9F75B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9F75B8);
  }
  return result;
}

uint64_t DarwinNotification.init(name:value:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

uint64_t DarwinNotification.hash(into:)()
{
  return sub_1BBBEBBA8();
}

BOOL static DarwinNotification.== infix(_:_:)(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a2[2];
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return v2 == v3;
  }
  char v5 = sub_1BBBEBAA8();
  BOOL result = 0;
  if (v5) {
    return v2 == v3;
  }
  return result;
}

uint64_t DarwinNotification.hashValue.getter()
{
  return sub_1BBBEBBB8();
}

uint64_t sub_1BBBB784C()
{
  return sub_1BBBEBBB8();
}

uint64_t sub_1BBBB78C0()
{
  return sub_1BBBEBBA8();
}

uint64_t sub_1BBBB791C()
{
  return sub_1BBBEBBB8();
}

BOOL sub_1BBBB7990(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a2[2];
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return v2 == v3;
  }
  char v5 = sub_1BBBEBAA8();
  BOOL result = 0;
  if (v5) {
    return v2 == v3;
  }
  return result;
}

void *sub_1BBBB79EC()
{
  type metadata accessor for DarwinNotificationManager();
  uint64_t v0 = (void *)swift_allocObject();
  BOOL result = sub_1BBBB8314();
  off_1EB9F7EB0 = v0;
  return result;
}

uint64_t static DarwinNotificationManager.shared.getter()
{
  if (qword_1EB9F81A0 != -1) {
    swift_once();
  }
  return swift_retain();
}

uint64_t static DarwinNotificationManager.currentValue(name:token:)(int a1, int a2, unint64_t a3)
{
  return sub_1BBBB8564(a1, a2, a3 | ((HIDWORD(a3) & 1) << 32));
}

void static DarwinNotificationManager.setValue(name:value:token:)(int a1, int a2, uint64_t a3, unint64_t a4)
{
}

uint64_t sub_1BBBB7AB4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  int v8 = (uint64_t *)(a1 + 32);
  swift_beginAccess();
  if (!*(void *)(*(void *)(a1 + 32) + 16)) {
    goto LABEL_5;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1BBBE7E88(a2, a3);
  if ((v9 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_5:
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F7858);
    swift_allocObject();
    uint64_t v11 = sub_1BBBEAF38();
    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v14 = *v8;
    *int v8 = 0x8000000000000000;
    sub_1BBBE928C(v11, a2, a3, isUniquelyReferenced_nonNull_native);
    *int v8 = v14;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    sub_1BBBB8B7C(&qword_1EB9F7898, &qword_1EB9F7858);
    uint64_t v10 = sub_1BBBEAFC8();
    goto LABEL_6;
  }
  swift_retain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F7858);
  sub_1BBBB8B7C(&qword_1EB9F7898, &qword_1EB9F7858);
  uint64_t v10 = sub_1BBBEAFC8();
LABEL_6:
  uint64_t result = swift_release();
  *a4 = v10;
  return result;
}

void sub_1BBBB7CC8()
{
  uint64_t v1 = *(NSObject **)(v0 + 16);
  uint64_t v2 = swift_allocObject();
  swift_weakInit();
  v4[4] = sub_1BBBB88AC;
  v4[5] = v2;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 1107296256;
  v4[2] = sub_1BBBB8174;
  v4[3] = &block_descriptor_2;
  uint64_t v3 = _Block_copy(v4);
  swift_release();
  xpc_set_event_stream_handler("com.apple.notifyd.matching", v1, v3);
  _Block_release(v3);
}

uint64_t sub_1BBBB7DA4(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    if (xpc_dictionary_get_string(a1, (const char *)*MEMORY[0x1E4F14560]))
    {
      uint64_t v3 = sub_1BBBEB308();
      uint64_t v5 = v4;
      if (qword_1EB9F7238 != -1) {
        swift_once();
      }
      uint64_t v6 = sub_1BBBEAE28();
      __swift_project_value_buffer(v6, (uint64_t)qword_1EB9F8B50);
      swift_bridgeObjectRetain_n();
      uint64_t v7 = sub_1BBBEAE08();
      os_log_type_t v8 = sub_1BBBEB518();
      if (os_log_type_enabled(v7, v8))
      {
        char v9 = (uint8_t *)swift_slowAlloc();
        uint64_t v10 = swift_slowAlloc();
        uint64_t v12 = v10;
        *(_DWORD *)char v9 = 136446210;
        uint64_t v14 = v5;
        uint64_t v15 = 0;
        sub_1BBBB76C0();
        sub_1BBBEBA28();
        sub_1BBBEB2F8();
        swift_bridgeObjectRelease();
        sub_1BBBEB2F8();
        swift_bridgeObjectRetain();
        sub_1BBBEB2F8();
        swift_bridgeObjectRelease();
        sub_1BBBEB2F8();
        uint64_t v13 = 0;
        sub_1BBBEBA48();
        sub_1BBBEB2F8();
        swift_bridgeObjectRelease();
        uint64_t v13 = sub_1BBBAC938(91, 0xE100000000000000, &v12);
        sub_1BBBEB6C8();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1BBBA9000, v7, v8, "On XPC event stream, com.apple.notifyd.matching, notification: %{public}s)", v9, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1C1862BC0](v10, -1, -1);
        MEMORY[0x1C1862BC0](v9, -1, -1);
      }
      else
      {

        uint64_t v11 = swift_bridgeObjectRelease_n();
      }
      MEMORY[0x1F4188790](v11);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F75A0);
      sub_1BBBEADF8();
      if (v13)
      {
        type metadata accessor for Transaction();
        swift_initStackObject();
        sub_1BBBDD448("DarwinNotificaton", 17, 2);
        uint64_t v13 = v3;
        uint64_t v14 = v5;
        uint64_t v15 = 0;
        sub_1BBBEAF18();
        swift_bridgeObjectRelease();
        swift_release();
        swift_release();
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
    return swift_release();
  }
  return result;
}

uint64_t sub_1BBBB8174(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

void sub_1BBBB81D4(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_1BBBB81DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t result = swift_beginAccess();
  uint64_t v9 = *(void *)(a1 + 32);
  if (*(void *)(v9 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v10 = sub_1BBBE7E88(a2, a3);
    if (v11)
    {
      uint64_t v12 = *(void *)(*(void *)(v9 + 56) + 8 * v10);
      swift_retain();
    }
    else
    {
      uint64_t v12 = 0;
    }
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v12 = 0;
  }
  *a4 = v12;
  return result;
}

uint64_t DarwinNotificationManager.deinit()
{
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t DarwinNotificationManager.__deallocating_deinit()
{
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186488](v0, 40, 7);
}

void *sub_1BBBB8314()
{
  uint64_t v1 = sub_1BBBEB578();
  MEMORY[0x1F4188790](v1);
  uint64_t v2 = sub_1BBBEB0F8();
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v3 = sub_1BBBEB608();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BBBAEE84();
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E4FBCC68], v3);
  sub_1BBBEB0D8();
  v10[1] = MEMORY[0x1E4FBC860];
  sub_1BBBB8B24();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F8320);
  sub_1BBBB8B7C((unint64_t *)&qword_1EB9F8328, &qword_1EB9F8320);
  sub_1BBBEB798();
  v0[2] = sub_1BBBEB648();
  __swift_instantiateConcreteTypeFromMangledName(qword_1EB9F7438);
  uint64_t v7 = swift_allocObject();
  *(_DWORD *)(v7 + 16) = 0;
  uint64_t v8 = MEMORY[0x1E4FBC868];
  v0[3] = v7;
  v0[4] = v8;
  return v0;
}

uint64_t sub_1BBBB8564(int a1, int a2, uint64_t token)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ((token & 0x100000000) == 0)
  {
    uint64_t state64 = 0;
    notify_get_state(token, &state64);
    return state64;
  }
  int out_token = 0;
  uint64_t v3 = sub_1BBBEB2C8();
  notify_register_check((const char *)(v3 + 32), &out_token);
  swift_release();
  int v4 = out_token;
  if (out_token != -1)
  {
    uint64_t state64 = 0;
    notify_get_state(out_token, &state64);
    notify_cancel(v4);
    return state64;
  }
  if (qword_1EB9F7238 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_1BBBEAE28();
  __swift_project_value_buffer(v6, (uint64_t)qword_1EB9F8B50);
  uint64_t v7 = sub_1BBBEAE08();
  os_log_type_t v8 = sub_1BBBEB538();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_1BBBA9000, v7, v8, "Failed notify_register_check.", v9, 2u);
    MEMORY[0x1C1862BC0](v9, -1, -1);
  }

  return 0;
}

void sub_1BBBB86D8(int a1, int a2, uint64_t state64, uint64_t token)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ((token & 0x100000000) != 0)
  {
    int out_token = 0;
    uint64_t v5 = sub_1BBBEB2C8();
    notify_register_check((const char *)(v5 + 32), &out_token);
    swift_release();
    int v6 = out_token;
    if (out_token == -1)
    {
      if (qword_1EB9F7238 != -1) {
        swift_once();
      }
      uint64_t v7 = sub_1BBBEAE28();
      __swift_project_value_buffer(v7, (uint64_t)qword_1EB9F8B50);
      os_log_type_t v8 = sub_1BBBEAE08();
      os_log_type_t v9 = sub_1BBBEB538();
      if (os_log_type_enabled(v8, v9))
      {
        unint64_t v10 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v10 = 0;
        _os_log_impl(&dword_1BBBA9000, v8, v9, "Failed notify_register_check.", v10, 2u);
        MEMORY[0x1C1862BC0](v10, -1, -1);
      }
    }
    else
    {
      notify_set_state(out_token, state64);
      notify_cancel(v6);
    }
  }
  else
  {
    notify_set_state(token, state64);
  }
}

uint64_t sub_1BBBB8874()
{
  swift_weakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1BBBB88AC(void *a1)
{
  return sub_1BBBB7DA4(a1);
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

unint64_t sub_1BBBB88C8()
{
  unint64_t result = qword_1E9F836D0;
  if (!qword_1E9F836D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F836D0);
  }
  return result;
}

uint64_t destroy for DarwinNotification()
{
  return swift_bridgeObjectRelease();
}

void *_s8SPShared18DarwinNotificationVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for DarwinNotification(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

void *assignWithTake for DarwinNotification(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

uint64_t getEnumTagSinglePayload for DarwinNotification(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DarwinNotification(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DarwinNotification()
{
  return &type metadata for DarwinNotification;
}

uint64_t type metadata accessor for DarwinNotificationManager()
{
  return self;
}

uint64_t method lookup function for DarwinNotificationManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for DarwinNotificationManager);
}

uint64_t dispatch thunk of DarwinNotificationManager.setUp()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t sub_1BBBB8B04@<X0>(void *a1@<X8>)
{
  return sub_1BBBB81DC(v1[2], v1[3], v1[4], a1);
}

unint64_t sub_1BBBB8B24()
{
  unint64_t result = qword_1EB9F8330;
  if (!qword_1EB9F8330)
  {
    sub_1BBBEB578();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9F8330);
  }
  return result;
}

uint64_t sub_1BBBB8B7C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

int *XPCServiceDescription.init(name:options:exportedObject:exportedInterface:remoteObjectInterface:shouldAccept:interruptionHandler:invalidationHandler:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v19 = sub_1BBBEABA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 32))(a9, a1, v19);
  uint64_t result = (int *)type metadata accessor for XPCServiceDescription();
  *(void *)(a9 + result[5]) = a2;
  *(void *)(a9 + result[6]) = a3;
  *(void *)(a9 + result[7]) = a4;
  *(void *)(a9 + result[8]) = a5;
  uint64_t v21 = (void *)(a9 + result[10]);
  *uint64_t v21 = a8;
  v21[1] = a10;
  unint64_t v22 = (void *)(a9 + result[11]);
  *unint64_t v22 = a11;
  v22[1] = a12;
  uint64_t v23 = (void *)(a9 + result[9]);
  void *v23 = a6;
  v23[1] = a7;
  return result;
}

uint64_t type metadata accessor for XPCServiceDescription()
{
  uint64_t result = qword_1EB9F7428;
  if (!qword_1EB9F7428) {
    return swift_getSingletonMetadata();
  }
  return result;
}

int *XPCServiceDescription.init(name:options:remoteObjectInterface:interruptionHandler:invalidationHandler:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v16 = sub_1BBBEABA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 32))(a8, a1, v16);
  uint64_t result = (int *)type metadata accessor for XPCServiceDescription();
  *(void *)(a8 + result[5]) = a2;
  *(void *)(a8 + result[6]) = 0;
  *(void *)(a8 + result[7]) = 0;
  *(void *)(a8 + result[8]) = a3;
  uint64_t v18 = (void *)(a8 + result[10]);
  *uint64_t v18 = a4;
  v18[1] = a5;
  uint64_t v19 = (void *)(a8 + result[11]);
  *uint64_t v19 = a6;
  v19[1] = a7;
  uint64_t v20 = (void *)(a8 + result[9]);
  *uint64_t v20 = 0;
  v20[1] = 0;
  return result;
}

int *XPCServiceDescription.init(name:options:exportedObject:exportedInterface:shouldAccept:interruptionHandler:invalidationHandler:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11)
{
  uint64_t v19 = sub_1BBBEABA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 32))(a9, a1, v19);
  uint64_t result = (int *)type metadata accessor for XPCServiceDescription();
  *(void *)(a9 + result[5]) = a2;
  *(void *)(a9 + result[6]) = a3;
  *(void *)(a9 + result[7]) = a4;
  *(void *)(a9 + result[8]) = 0;
  uint64_t v21 = (void *)(a9 + result[10]);
  *uint64_t v21 = a7;
  v21[1] = a8;
  unint64_t v22 = (void *)(a9 + result[11]);
  *unint64_t v22 = a10;
  v22[1] = a11;
  uint64_t v23 = (void *)(a9 + result[9]);
  void *v23 = a5;
  v23[1] = a6;
  return result;
}

uint64_t XPCServiceDescription.init(connection:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1BBBEABA8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = objc_msgSend(a1, sel_serviceName);
  if (v8)
  {
    os_log_type_t v9 = v8;
    sub_1BBBEB2A8();

    sub_1BBBEABB8();
    if (objc_msgSend(a1, sel_exportedObject))
    {
      sub_1BBBEB778();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v21, 0, sizeof(v21));
    }
    sub_1BBBB91B4((uint64_t)v21, (uint64_t)v22);
    if (v23)
    {
      sub_1BBBB921C();
      if (swift_dynamicCast()) {
        uint64_t v13 = v20[1];
      }
      else {
        uint64_t v13 = 0;
      }
    }
    else
    {
      sub_1BBBAF618((uint64_t)v22);
      uint64_t v13 = 0;
    }
    id v14 = objc_msgSend(a1, sel_exportedInterface);
    id v15 = objc_msgSend(a1, sel_remoteObjectInterface);

    (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(a2, v7, v4);
    uint64_t v16 = (int *)type metadata accessor for XPCServiceDescription();
    *(void *)(a2 + v16[5]) = 0;
    *(void *)(a2 + v16[6]) = v13;
    *(void *)(a2 + v16[7]) = v14;
    *(void *)(a2 + v16[8]) = v15;
    uint64_t v17 = (void *)(a2 + v16[10]);
    *uint64_t v17 = 0;
    v17[1] = 0;
    uint64_t v18 = (void *)(a2 + v16[11]);
    *uint64_t v18 = 0;
    v18[1] = 0;
    uint64_t v19 = (void *)(a2 + v16[9]);
    *uint64_t v19 = 0;
    v19[1] = 0;
    return (*(uint64_t (**)(uint64_t, void, uint64_t, int *))(*((void *)v16 - 1) + 56))(a2, 0, 1, v16);
  }
  else
  {

    uint64_t v10 = type metadata accessor for XPCServiceDescription();
    char v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56);
    return v11(a2, 1, 1, v10);
  }
}

uint64_t sub_1BBBB91B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F7FB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_1BBBB921C()
{
  unint64_t result = qword_1EB9F76B0;
  if (!qword_1EB9F76B0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EB9F76B0);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for XPCServiceDescription(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v22 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v22 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1BBBEABA8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *(uint64_t *)((char *)a1 + a3[5]) = *(uint64_t *)((char *)a2 + a3[5]);
    os_log_type_t v9 = *(void **)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = (uint64_t)v9;
    uint64_t v10 = a3[7];
    uint64_t v11 = a3[8];
    uint64_t v12 = *(void **)((char *)a2 + v10);
    *(uint64_t *)((char *)a1 + v10) = (uint64_t)v12;
    uint64_t v13 = *(void **)((char *)a2 + v11);
    *(uint64_t *)((char *)a1 + v11) = (uint64_t)v13;
    uint64_t v14 = a3[9];
    id v15 = (uint64_t *)((char *)a1 + v14);
    uint64_t v16 = (char *)a2 + v14;
    uint64_t v17 = *(uint64_t *)((char *)a2 + v14);
    id v18 = v9;
    id v19 = v12;
    id v20 = v13;
    if (v17)
    {
      uint64_t v21 = *((void *)v16 + 1);
      void *v15 = v17;
      v15[1] = v21;
      swift_retain();
    }
    else
    {
      *(_OWORD *)id v15 = *(_OWORD *)v16;
    }
    uint64_t v23 = a3[10];
    uint64_t v24 = (uint64_t *)((char *)a1 + v23);
    uint64_t v25 = (uint64_t *)((char *)a2 + v23);
    if (*v25)
    {
      uint64_t v26 = v25[1];
      *uint64_t v24 = *v25;
      v24[1] = v26;
      swift_retain();
    }
    else
    {
      *(_OWORD *)uint64_t v24 = *(_OWORD *)v25;
    }
    uint64_t v27 = a3[11];
    uint64_t v28 = (uint64_t *)((char *)a1 + v27);
    uint64_t v29 = (uint64_t *)((char *)a2 + v27);
    if (*v29)
    {
      uint64_t v30 = v29[1];
      *uint64_t v28 = *v29;
      v28[1] = v30;
      swift_retain();
    }
    else
    {
      *(_OWORD *)uint64_t v28 = *(_OWORD *)v29;
    }
  }
  return a1;
}

void destroy for XPCServiceDescription(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_1BBBEABA8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);

  if (*(void *)(a1 + a2[9])) {
    swift_release();
  }
  if (*(void *)(a1 + a2[10])) {
    swift_release();
  }
  if (*(void *)(a1 + a2[11]))
  {
    swift_release();
  }
}

uint64_t initializeWithCopy for XPCServiceDescription(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1BBBEABA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v8 = *(void **)(a2 + v7);
  *(void *)(a1 + v7) = v8;
  uint64_t v9 = a3[7];
  uint64_t v10 = a3[8];
  uint64_t v11 = *(void **)(a2 + v9);
  *(void *)(a1 + v9) = v11;
  uint64_t v12 = *(void **)(a2 + v10);
  *(void *)(a1 + v10) = v12;
  uint64_t v13 = a3[9];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = a2 + v13;
  uint64_t v16 = *(void *)(a2 + v13);
  id v17 = v8;
  id v18 = v11;
  id v19 = v12;
  if (v16)
  {
    uint64_t v20 = *(void *)(v15 + 8);
    *uint64_t v14 = v16;
    v14[1] = v20;
    swift_retain();
  }
  else
  {
    *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
  }
  uint64_t v21 = a3[10];
  uint64_t v22 = (void *)(a1 + v21);
  uint64_t v23 = (void *)(a2 + v21);
  if (*v23)
  {
    uint64_t v24 = v23[1];
    *uint64_t v22 = *v23;
    v22[1] = v24;
    swift_retain();
  }
  else
  {
    *(_OWORD *)uint64_t v22 = *(_OWORD *)v23;
  }
  uint64_t v25 = a3[11];
  uint64_t v26 = (void *)(a1 + v25);
  uint64_t v27 = (void *)(a2 + v25);
  if (*v27)
  {
    uint64_t v28 = v27[1];
    *uint64_t v26 = *v27;
    v26[1] = v28;
    swift_retain();
  }
  else
  {
    *(_OWORD *)uint64_t v26 = *(_OWORD *)v27;
  }
  return a1;
}

uint64_t assignWithCopy for XPCServiceDescription(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1BBBEABA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v7 = a3[6];
  uint64_t v8 = *(void **)(a1 + v7);
  uint64_t v9 = *(void **)(a2 + v7);
  *(void *)(a1 + v7) = v9;
  id v10 = v9;

  uint64_t v11 = a3[7];
  uint64_t v12 = *(void **)(a1 + v11);
  uint64_t v13 = *(void **)(a2 + v11);
  *(void *)(a1 + v11) = v13;
  id v14 = v13;

  uint64_t v15 = a3[8];
  uint64_t v16 = *(void **)(a1 + v15);
  id v17 = *(void **)(a2 + v15);
  *(void *)(a1 + v15) = v17;
  id v18 = v17;

  uint64_t v19 = a3[9];
  uint64_t v20 = (void *)(a1 + v19);
  uint64_t v21 = a2 + v19;
  uint64_t v22 = *(void *)(a1 + v19);
  uint64_t v23 = *(void *)(a2 + v19);
  if (v22)
  {
    if (v23)
    {
      uint64_t v24 = *(void *)(v21 + 8);
      *uint64_t v20 = v23;
      v20[1] = v24;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v23)
  {
    uint64_t v25 = *(void *)(v21 + 8);
    *uint64_t v20 = v23;
    v20[1] = v25;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)uint64_t v20 = *(_OWORD *)v21;
LABEL_8:
  uint64_t v26 = a3[10];
  uint64_t v27 = (void *)(a1 + v26);
  uint64_t v28 = a2 + v26;
  uint64_t v29 = *(void *)(a1 + v26);
  uint64_t v30 = *(void *)(a2 + v26);
  if (v29)
  {
    if (v30)
    {
      uint64_t v31 = *(void *)(v28 + 8);
      *uint64_t v27 = v30;
      v27[1] = v31;
      swift_retain();
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v30)
  {
    uint64_t v32 = *(void *)(v28 + 8);
    *uint64_t v27 = v30;
    v27[1] = v32;
    swift_retain();
    goto LABEL_15;
  }
  *(_OWORD *)uint64_t v27 = *(_OWORD *)v28;
LABEL_15:
  uint64_t v33 = a3[11];
  uint64_t v34 = (void *)(a1 + v33);
  uint64_t v35 = (uint64_t *)(a2 + v33);
  uint64_t v36 = *(void *)(a1 + v33);
  uint64_t v37 = *v35;
  if (!v36)
  {
    if (v37)
    {
      uint64_t v39 = v35[1];
      *uint64_t v34 = v37;
      v34[1] = v39;
      swift_retain();
      return a1;
    }
LABEL_21:
    *(_OWORD *)uint64_t v34 = *(_OWORD *)v35;
    return a1;
  }
  if (!v37)
  {
    swift_release();
    goto LABEL_21;
  }
  uint64_t v38 = v35[1];
  *uint64_t v34 = v37;
  v34[1] = v38;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for XPCServiceDescription(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1BBBEABA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  uint64_t v9 = a3[9];
  id v10 = (void *)(a1 + v9);
  uint64_t v11 = (uint64_t *)(a2 + v9);
  uint64_t v12 = *v11;
  if (*v11)
  {
    uint64_t v13 = v11[1];
    *id v10 = v12;
    v10[1] = v13;
  }
  else
  {
    *(_OWORD *)id v10 = *(_OWORD *)v11;
  }
  uint64_t v14 = a3[10];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (uint64_t *)(a2 + v14);
  uint64_t v17 = *v16;
  if (*v16)
  {
    uint64_t v18 = v16[1];
    void *v15 = v17;
    v15[1] = v18;
  }
  else
  {
    *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
  }
  uint64_t v19 = a3[11];
  uint64_t v20 = (void *)(a1 + v19);
  uint64_t v21 = (uint64_t *)(a2 + v19);
  uint64_t v22 = *v21;
  if (*v21)
  {
    uint64_t v23 = v21[1];
    *uint64_t v20 = v22;
    v20[1] = v23;
  }
  else
  {
    *(_OWORD *)uint64_t v20 = *(_OWORD *)v21;
  }
  return a1;
}

uint64_t assignWithTake for XPCServiceDescription(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1BBBEABA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v8 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);

  uint64_t v9 = a3[7];
  id v10 = *(void **)(a1 + v9);
  *(void *)(a1 + v9) = *(void *)(a2 + v9);

  uint64_t v11 = a3[8];
  uint64_t v12 = *(void **)(a1 + v11);
  *(void *)(a1 + v11) = *(void *)(a2 + v11);

  uint64_t v13 = a3[9];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = a2 + v13;
  uint64_t v16 = *(void *)(a1 + v13);
  uint64_t v17 = *(void *)(a2 + v13);
  if (v16)
  {
    if (v17)
    {
      uint64_t v18 = *(void *)(v15 + 8);
      *uint64_t v14 = v17;
      v14[1] = v18;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v17)
  {
    uint64_t v19 = *(void *)(v15 + 8);
    *uint64_t v14 = v17;
    v14[1] = v19;
    goto LABEL_8;
  }
  *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
LABEL_8:
  uint64_t v20 = a3[10];
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = a2 + v20;
  uint64_t v23 = *(void *)(a1 + v20);
  uint64_t v24 = *(void *)(a2 + v20);
  if (v23)
  {
    if (v24)
    {
      uint64_t v25 = *(void *)(v22 + 8);
      *uint64_t v21 = v24;
      v21[1] = v25;
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v24)
  {
    uint64_t v26 = *(void *)(v22 + 8);
    *uint64_t v21 = v24;
    v21[1] = v26;
    goto LABEL_15;
  }
  *(_OWORD *)uint64_t v21 = *(_OWORD *)v22;
LABEL_15:
  uint64_t v27 = a3[11];
  uint64_t v28 = (void *)(a1 + v27);
  uint64_t v29 = (uint64_t *)(a2 + v27);
  uint64_t v30 = *(void *)(a1 + v27);
  uint64_t v31 = *v29;
  if (!v30)
  {
    if (v31)
    {
      uint64_t v33 = v29[1];
      *uint64_t v28 = v31;
      v28[1] = v33;
      return a1;
    }
LABEL_21:
    *(_OWORD *)uint64_t v28 = *(_OWORD *)v29;
    return a1;
  }
  if (!v31)
  {
    swift_release();
    goto LABEL_21;
  }
  uint64_t v32 = v29[1];
  *uint64_t v28 = v31;
  v28[1] = v32;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for XPCServiceDescription(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1BBBB9AAC);
}

uint64_t sub_1BBBB9AAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1BBBEABA8();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 24));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    int v11 = v10 - 1;
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for XPCServiceDescription(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1BBBB9B8C);
}

uint64_t sub_1BBBB9B8C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1BBBEABA8();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24)) = a2;
  }
  return result;
}

uint64_t sub_1BBBB9C48()
{
  uint64_t result = sub_1BBBEABA8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t Publisher.retryWithDelay<A>(retries:delay:scheduler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v18[0] = a7;
  long long v18[2] = a1;
  swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  sub_1BBBEAEE8();
  swift_getWitnessTable();
  uint64_t v12 = sub_1BBBEAE88();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12);
  uint64_t v15 = (char *)v18 - v14;
  v18[3] = sub_1BBBB9F04(a2, a3, a4, a5, a6, v18[0]);
  sub_1BBBEB038();
  swift_release();
  swift_getWitnessTable();
  uint64_t v16 = sub_1BBBEAFC8();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  return v16;
}

uint64_t sub_1BBBB9F04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v40 = a6;
  uint64_t v38 = a2;
  uint64_t v39 = a1;
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v9 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v37 = *(void *)(v9 + 64);
  uint64_t v10 = MEMORY[0x1F4188790](AssociatedTypeWitness);
  uint64_t v34 = (char *)&v28 - v11;
  uint64_t v12 = *(void *)(a4 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  MEMORY[0x1F4188790](v10);
  uint64_t v30 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  uint64_t v29 = a5;
  swift_getAssociatedConformanceWitness();
  uint64_t v14 = sub_1BBBEAF98();
  uint64_t v32 = v14;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v41 = a3;
  uint64_t v42 = v14;
  uint64_t v15 = a3;
  uint64_t v43 = a5;
  uint64_t v44 = WitnessTable;
  uint64_t v33 = sub_1BBBEAE68();
  uint64_t v35 = *(void *)(v33 - 8);
  MEMORY[0x1F4188790](v33);
  uint64_t v17 = (char *)&v28 - v16;
  uint64_t v18 = v30;
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v30, v38, a4);
  uint64_t v28 = v9;
  uint64_t v19 = v34;
  uint64_t v20 = AssociatedTypeWitness;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v34, v39, AssociatedTypeWitness);
  unint64_t v21 = (*(unsigned __int8 *)(v12 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  unint64_t v22 = (v13 + v21 + *(unsigned __int8 *)(v9 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v23 = (char *)swift_allocObject();
  *((void *)v23 + 2) = v15;
  *((void *)v23 + 3) = a4;
  uint64_t v24 = v40;
  *((void *)v23 + 4) = v29;
  *((void *)v23 + 5) = v24;
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(&v23[v21], v18, a4);
  (*(void (**)(char *, char *, uint64_t))(v28 + 32))(&v23[v22], v19, v20);
  sub_1BBBEB018();
  swift_release();
  uint64_t v25 = v33;
  swift_getWitnessTable();
  uint64_t v26 = sub_1BBBEAFC8();
  (*(void (**)(char *, uint64_t))(v35 + 8))(v17, v25);
  return v26;
}

uint64_t sub_1BBBBA334@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t *a8@<X8>)
{
  uint64_t v40 = a2;
  uint64_t v41 = a7;
  uint64_t v43 = a3;
  uint64_t v44 = a1;
  uint64_t v45 = a8;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v46 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v42 = *(void *)(v46 + 64);
  MEMORY[0x1F4188790](AssociatedTypeWitness);
  uint64_t v39 = (char *)&v31 - v12;
  swift_getAssociatedTypeWitness();
  uint64_t v13 = a5;
  uint64_t v31 = a5;
  swift_getAssociatedConformanceWitness();
  uint64_t v36 = swift_getAssociatedTypeWitness();
  uint64_t v14 = *(void *)(v36 - 8);
  uint64_t v37 = *(void *)(v14 + 64);
  uint64_t v15 = MEMORY[0x1F4188790](v36);
  uint64_t v17 = (char *)&v31 - v16;
  uint64_t v18 = *(void *)(v13 - 8);
  uint64_t v19 = *(void *)(v18 + 64);
  MEMORY[0x1F4188790](v15);
  uint64_t v32 = (char *)&v31 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = a4;
  uint64_t v35 = a6;
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v20 = AssociatedTypeWitness;
  uint64_t v33 = AssociatedTypeWitness;
  uint64_t v38 = sub_1BBBEAF98();
  uint64_t v21 = v31;
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))((char *)&v31 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0), v40, v31);
  uint64_t v22 = v36;
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v17, v43, v36);
  uint64_t v23 = v46;
  uint64_t v24 = v39;
  (*(void (**)(char *, uint64_t, uint64_t))(v46 + 16))(v39, v44, v20);
  unint64_t v25 = (*(unsigned __int8 *)(v18 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  unint64_t v26 = (v19 + v25 + *(unsigned __int8 *)(v14 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  unint64_t v27 = (v37 + *(unsigned __int8 *)(v23 + 80) + v26) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
  uint64_t v28 = (char *)swift_allocObject();
  *((void *)v28 + 2) = v34;
  *((void *)v28 + 3) = v21;
  uint64_t v29 = v41;
  *((void *)v28 + 4) = v35;
  *((void *)v28 + 5) = v29;
  (*(void (**)(char *, char *, uint64_t))(v18 + 32))(&v28[v25], v32, v21);
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(&v28[v26], v17, v22);
  (*(void (**)(char *, char *, uint64_t))(v46 + 32))(&v28[v27], v24, v33);
  uint64_t result = sub_1BBBEAFA8();
  *uint64_t v45 = result;
  return result;
}

uint64_t sub_1BBBBA730(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(char *, uint64_t), uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v32 = a6;
  uint64_t v33 = a8;
  uint64_t v30 = a4;
  uint64_t v31 = a5;
  uint64_t v28 = a3;
  uint64_t v34 = a1;
  uint64_t v35 = a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v10 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x1F4188790](AssociatedTypeWitness);
  unint64_t v27 = (char *)&v26 - v11;
  uint64_t v12 = swift_getAssociatedTypeWitness();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x1F4188790](v12);
  uint64_t v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v14);
  uint64_t v18 = (char *)&v26 - v17;
  sub_1BBBEB088();
  swift_getAssociatedConformanceWitness();
  sub_1BBBEB6E8();
  uint64_t v19 = *(uint64_t (**)(char *, uint64_t))(v13 + 8);
  uint64_t v26 = v13 + 8;
  uint64_t v30 = v19;
  v19(v16, v12);
  uint64_t v20 = v27;
  uint64_t v21 = AssociatedTypeWitness;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v27, v31, AssociatedTypeWitness);
  unint64_t v22 = (*(unsigned __int8 *)(v10 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v23 = (char *)swift_allocObject();
  *((void *)v23 + 2) = v32;
  *((void *)v23 + 3) = a7;
  *((void *)v23 + 4) = v33;
  *((void *)v23 + 5) = a9;
  uint64_t v24 = v35;
  *((void *)v23 + 6) = v34;
  *((void *)v23 + 7) = v24;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v23[v22], v20, v21);
  swift_retain();
  sub_1BBBEB098();
  swift_release();
  return v30(v18, v12);
}

uint64_t sub_1BBBBAA14(void (*a1)(char *), uint64_t a2, uint64_t a3)
{
  swift_getAssociatedTypeWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v6 = sub_1BBBEBBC8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v11 - v8;
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16))((char *)&v11 - v8, a3, AssociatedTypeWitness);
  swift_storeEnumTagMultiPayload();
  a1(v9);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t Sequence<>.merged()(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 - 8);
  MEMORY[0x1F4188790](a1);
  int v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getAssociatedTypeWitness();
  uint64_t v6 = sub_1BBBEAEB8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v12 - v8;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, a1);
  sub_1BBBEAEC8();
  swift_getWitnessTable();
  uint64_t v10 = sub_1BBBEAFC8();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v10;
}

uint64_t sub_1BBBBAD88()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v5 + v8) & ~v8;
  uint64_t v10 = v9 + *(void *)(v7 + 64);
  uint64_t v11 = v3 | v8 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, AssociatedTypeWitness);
  return MEMORY[0x1F4186498](v0, v10, v11);
}

uint64_t sub_1BBBBAF30@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = v2[3];
  uint64_t v13 = v2[2];
  uint64_t v6 = v2[4];
  uint64_t v7 = v2[5];
  unint64_t v8 = (*(unsigned __int8 *)(*(void *)(v5 - 8) + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v5 - 8) + 80);
  unint64_t v9 = v8 + *(void *)(*(void *)(v5 - 8) + 64);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v10 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  uint64_t v11 = (uint64_t)v2 + ((v9 + *(unsigned __int8 *)(v10 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80));
  return sub_1BBBBA334(a1, (uint64_t)v2 + v8, v11, v13, v5, v6, v7, a2);
}

uint64_t sub_1BBBBB09C()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = *(void *)(v1 - 8);
  unint64_t v16 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v17 = *(unsigned __int8 *)(v2 + 80);
  unint64_t v3 = v16 + *(void *)(v2 + 64);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = (v3 + v6) & ~v6;
  uint64_t v8 = *(void *)(v5 + 64);
  uint64_t v9 = swift_getAssociatedTypeWitness();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned __int8 *)(v10 + 80);
  unint64_t v12 = (v7 + v8 + v11) & ~v11;
  unint64_t v15 = v12 + *(void *)(v10 + 64);
  uint64_t v13 = v17 | v11 | v6 | 7;
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v16, v1);
  (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v0 + v7, AssociatedTypeWitness);
  (*(void (**)(unint64_t, uint64_t))(v10 + 8))(v0 + v12, v9);
  return MEMORY[0x1F4186498](v0, v15, v13);
}

uint64_t sub_1BBBBB2F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2[2];
  uint64_t v5 = v2[3];
  uint64_t v6 = v2[4];
  uint64_t v7 = v2[5];
  unint64_t v8 = (*(unsigned __int8 *)(*(void *)(v5 - 8) + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v5 - 8) + 80);
  unint64_t v9 = v8 + *(void *)(*(void *)(v5 - 8) + 64);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v10 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unint64_t v11 = (v9 + *(unsigned __int8 *)(v10 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v12 = *(void *)(v10 + 64);
  uint64_t v13 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  return sub_1BBBBA730(a1, a2, (uint64_t)v2 + v8, (uint64_t (*)(char *, uint64_t))((char *)v2 + v11), (uint64_t)v2+ ((v11 + v12 + *(unsigned __int8 *)(v13 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80)), v4, v5, v6, v7);
}

uint64_t sub_1BBBBB4C4()
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v2 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 64) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, AssociatedTypeWitness);
  return MEMORY[0x1F4186498](v0, v5, v6);
}

uint64_t sub_1BBBBB5A8()
{
  uint64_t v1 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  uint64_t v2 = *(void (**)(char *))(v0 + 48);
  uint64_t v3 = *(void *)(v0 + 56);
  uint64_t v4 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
  return sub_1BBBBAA14(v2, v3, v4);
}

uint64_t ServerStatusCode.description.getter()
{
  switch(*v0)
  {
    case 2:
      sub_1BBBEB858();
      swift_bridgeObjectRelease();
      strcpy((char *)v2, ".notModified(");
      HIWORD(v2[1]) = -4864;
      break;
    case 3:
      strcpy((char *)v2, ".badRequest(");
      BYTE5(v2[1]) = 0;
      HIWORD(v2[1]) = -5120;
      break;
    case 4:
      sub_1BBBEB858();
      swift_bridgeObjectRelease();
      strcpy((char *)v2, ".unauthorized(");
      HIBYTE(v2[1]) = -18;
      break;
    case 5:
      strcpy((char *)v2, ".forbidden(");
      HIDWORD(v2[1]) = -352321536;
      break;
    case 6:
      sub_1BBBEB858();
      swift_bridgeObjectRelease();
      v2[0] = 0xD000000000000010;
      v2[1] = 0x80000001BBBEED80;
      break;
    case 7:
      sub_1BBBEB858();
      swift_bridgeObjectRelease();
      v2[0] = 0xD000000000000014;
      v2[1] = 0x80000001BBBEED60;
      break;
    case 8:
      strcpy((char *)v2, ".locked(");
      BYTE1(v2[1]) = 0;
      WORD1(v2[1]) = 0;
      HIDWORD(v2[1]) = -402653184;
      break;
    case 9:
      sub_1BBBEB858();
      swift_bridgeObjectRelease();
      strcpy((char *)v2, ".serverError(");
      HIWORD(v2[1]) = -4864;
      break;
    default:
      strcpy((char *)v2, ".success(");
      WORD1(v2[1]) = 0;
      HIDWORD(v2[1]) = -385875968;
      break;
  }
  sub_1BBBEBA48();
  sub_1BBBEB2F8();
  swift_bridgeObjectRelease();
  sub_1BBBEB2F8();
  return v2[0];
}

uint64_t ServerStatusCode.rawValue.getter()
{
  return qword_1BBBED300[*v0];
}

SPShared::ServerStatusCode_optional __swiftcall ServerStatusCode.init(rawValue:)(Swift::Int rawValue)
{
  if (rawValue <= 399)
  {
    if (rawValue)
    {
      if (rawValue == 200)
      {
        unsigned char *v1 = 1;
      }
      else if (rawValue == 304)
      {
        unsigned char *v1 = 2;
      }
      else
      {
LABEL_10:
        unsigned char *v1 = 10;
      }
    }
    else
    {
      unsigned char *v1 = 0;
    }
  }
  else
  {
    switch(rawValue)
    {
      case 400:
        unsigned char *v1 = 3;
        break;
      case 401:
        unsigned char *v1 = 4;
        break;
      case 402:
      case 404:
      case 405:
      case 406:
      case 407:
      case 408:
      case 410:
      case 411:
      case 413:
      case 414:
      case 415:
      case 416:
      case 417:
      case 418:
      case 419:
      case 420:
      case 421:
      case 422:
        goto LABEL_10;
      case 403:
        unsigned char *v1 = 5;
        break;
      case 409:
        unsigned char *v1 = 6;
        break;
      case 412:
        unsigned char *v1 = 7;
        break;
      case 423:
        unsigned char *v1 = 8;
        break;
      default:
        if (rawValue != 500) {
          goto LABEL_10;
        }
        unsigned char *v1 = 9;
        break;
    }
  }
  return (SPShared::ServerStatusCode_optional)rawValue;
}

BOOL sub_1BBBBBA5C(char *a1, char *a2)
{
  return qword_1BBBED300[*a1] == qword_1BBBED300[*a2];
}

unint64_t sub_1BBBBBA84()
{
  unint64_t result = qword_1E9F836D8;
  if (!qword_1E9F836D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F836D8);
  }
  return result;
}

uint64_t sub_1BBBBBAD8()
{
  return sub_1BBBEBBB8();
}

uint64_t sub_1BBBBBB28()
{
  return sub_1BBBEBB88();
}

uint64_t sub_1BBBBBB60()
{
  return sub_1BBBEBBB8();
}

SPShared::ServerStatusCode_optional sub_1BBBBBBAC(Swift::Int *a1)
{
  return ServerStatusCode.init(rawValue:)(*a1);
}

void sub_1BBBBBBB4(void *a1@<X8>)
{
  *a1 = qword_1BBBED300[*v1];
}

uint64_t sub_1BBBBBBCC()
{
  return sub_1BBBEB368();
}

uint64_t sub_1BBBBBC2C()
{
  return sub_1BBBEB358();
}

uint64_t getEnumTagSinglePayload for ServerStatusCode(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF7) {
    goto LABEL_17;
  }
  if (a2 + 9 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 9) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 9;
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
      return (*a1 | (v4 << 8)) - 9;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 9;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xA;
  int v8 = v6 - 10;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ServerStatusCode(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 9 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 9) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF7) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF6)
  {
    unsigned int v6 = ((a2 - 247) >> 8) + 1;
    *unint64_t result = a2 + 9;
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
        JUMPOUT(0x1BBBBBDDCLL);
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
          *unint64_t result = a2 + 9;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ServerStatusCode()
{
  return &type metadata for ServerStatusCode;
}

unint64_t sub_1BBBBBE14()
{
  unint64_t result = qword_1E9F836E0;
  if (!qword_1E9F836E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F836E0);
  }
  return result;
}

uint64_t UnknownRawRepresentable<>.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X8>)
{
  uint64_t v41 = a5;
  uint64_t v42 = a4;
  uint64_t v8 = sub_1BBBEB6B8();
  uint64_t v37 = *(void *)(v8 - 8);
  uint64_t v38 = v8;
  uint64_t v9 = MEMORY[0x1F4188790](v8);
  unint64_t v11 = (char *)&v32 - v10;
  uint64_t v40 = *(void *)(a2 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = a3;
  uint64_t v14 = *(void *)(a3 + 8);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v39 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v15 = MEMORY[0x1F4188790](AssociatedTypeWitness);
  uint64_t v17 = (char *)&v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v15);
  uint64_t v43 = (char *)&v32 - v18;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v19 = v46;
  sub_1BBBEBBE8();
  if (v19)
  {
    uint64_t v20 = (uint64_t)a1;
  }
  else
  {
    uint64_t v33 = v17;
    uint64_t v34 = v14;
    uint64_t v46 = a1;
    uint64_t v35 = v13;
    __swift_project_boxed_opaque_existential_1(v45, v45[3]);
    sub_1BBBEBAD8();
    uint64_t v22 = v39;
    (*(void (**)(char *, char *, uint64_t))(v39 + 16))(v33, v43, AssociatedTypeWitness);
    uint64_t v23 = v11;
    uint64_t v24 = v22;
    uint64_t v25 = a2;
    sub_1BBBEB348();
    uint64_t v26 = v40;
    int v27 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v40 + 48))(v23, 1, v25);
    uint64_t v28 = v41;
    uint64_t v29 = v35;
    uint64_t v30 = (uint64_t)v46;
    if (v27 == 1)
    {
      (*(void (**)(uint64_t))(v36 + 16))(v25);
      (*(void (**)(char *, uint64_t))(v24 + 8))(v43, AssociatedTypeWitness);
      (*(void (**)(char *, uint64_t))(v37 + 8))(v23, v38);
      (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v28, v29, v25);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v24 + 8))(v43, AssociatedTypeWitness);
      uint64_t v31 = *(void (**)(char *, char *, uint64_t))(v26 + 32);
      v31(v29, v23, v25);
      v31(v28, v29, v25);
    }
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v45);
    uint64_t v20 = v30;
  }
  return __swift_destroy_boxed_opaque_existential_0(v20);
}

uint64_t dispatch thunk of static UnknownRawRepresentable.unknownValue.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

BOOL static PrivilegeDropper.User.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t PrivilegeDropper.User.hash(into:)()
{
  return sub_1BBBEBB88();
}

uint64_t PrivilegeDropper.User.hashValue.getter()
{
  return sub_1BBBEBBB8();
}

BOOL sub_1BBBBC2B8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_1BBBBC2D0()
{
  return sub_1BBBEBBB8();
}

uint64_t sub_1BBBBC318()
{
  return sub_1BBBEBB88();
}

uint64_t sub_1BBBBC344()
{
  return sub_1BBBEBBB8();
}

BOOL sub_1BBBBC388(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1BBBBC39C()
{
  uint64_t result = sub_1BBBBC3C0();
  byte_1E9F836E8 = result & 1;
  return result;
}

uint64_t sub_1BBBBC3C0()
{
  id v0 = objc_msgSend(self, sel_processInfo);
  id v1 = objc_msgSend(v0, sel_environment);

  uint64_t v2 = sub_1BBBEB1A8();
  if (!*(void *)(v2 + 16)) {
    goto LABEL_7;
  }
  sub_1BBBE7E88(0xD000000000000014, 0x80000001BBBEEDF0);
  if ((v3 & 1) == 0)
  {
    if (*(void *)(v2 + 16))
    {
      sub_1BBBE7E88(0xD000000000000020, 0x80000001BBBEEE10);
      if (v5)
      {
        swift_bridgeObjectRetain();
        uint64_t v4 = 1;
LABEL_8:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return v4;
      }
    }
LABEL_7:
    uint64_t v4 = 0;
    goto LABEL_8;
  }
  swift_bridgeObjectRelease();
  return 1;
}

uint64_t static PrivilegeDropper.runningUnderXcode.getter()
{
  if (qword_1E9F833B8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return byte_1E9F836E8;
}

uint64_t static PrivilegeDropper.runningUnderXcode.setter(char a1)
{
  if (qword_1E9F833B8 != -1) {
    swift_once();
  }
  uint64_t result = swift_beginAccess();
  byte_1E9F836E8 = a1 & 1;
  return result;
}

uint64_t (*static PrivilegeDropper.runningUnderXcode.modify())()
{
  if (qword_1E9F833B8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t static PrivilegeDropper.validateUser(user:)(unsigned __int8 *a1)
{
  int v1 = *a1;
  if (getuid() == 501)
  {
    if ((v1 & 1) == 0) {
      return 1;
    }
  }
  else if (v1)
  {
    return 1;
  }
  sub_1BBBBC994();
  char v3 = (void *)swift_allocError();
  *uint64_t v4 = 3;
  swift_willThrow();
  sub_1BBBEB538();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F7C80);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1BBBED370;
  id v6 = v3;
  __swift_instantiateConcreteTypeFromMangledName(qword_1EB9F74C0);
  uint64_t v7 = sub_1BBBEB2B8();
  uint64_t v9 = v8;
  *(void *)(v5 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v5 + 64) = sub_1BBBBC9E8();
  *(void *)(v5 + 32) = v7;
  *(void *)(v5 + 40) = v9;
  sub_1BBBBCA3C();
  uint64_t v10 = (void *)sub_1BBBEB698();
  sub_1BBBEADE8();

  swift_bridgeObjectRelease();
  return 0;
}

uint64_t static PrivilegeDropper.validateUser(user:dropPrivileges:)(char *a1, char a2)
{
  char v3 = *a1;
  if (getuid() != 501)
  {
    if (v3) {
      return 1;
    }
    if ((a2 & 1) == 0)
    {
LABEL_10:
      sub_1BBBBC994();
      swift_allocError();
      *uint64_t v9 = 3;
      swift_willThrow();
      return 1;
    }
    id v4 = (id) sub_1BBBEB278();
    uint64_t v5 = (const char *)objc_msgSend(v4, sel_UTF8String);
    id v6 = getpwnam(v5);
    if (v6)
    {
      uid_t pw_uid = v6->pw_uid;
      gid_t pw_gid = v6->pw_gid;
      if ((setregid(pw_gid, pw_gid) & 0x80000000) == 0)
      {
        if ((pw_gid & 0x80000000) != 0)
        {
          __break(1u);
          goto LABEL_10;
        }
        goto LABEL_12;
      }
    }
    else
    {
      gid_t pw_gid = 501;
      uid_t pw_uid = 501;
      if ((setregid(0x1F5u, 0x1F5u) & 0x80000000) == 0)
      {
LABEL_12:
        if (initgroups(v5, pw_gid) < 0)
        {
          sub_1BBBBC994();
          swift_allocError();
          char v13 = 1;
        }
        else
        {
          if ((setreuid(pw_uid, pw_uid) & 0x80000000) == 0)
          {
            sub_1BBBBCA3C();
            uint64_t v10 = (void *)sub_1BBBEB698();
            sub_1BBBEB558();
            sub_1BBBEADD8();

LABEL_20:
            return 1;
          }
          sub_1BBBBC994();
          swift_allocError();
          char v13 = 2;
        }
        *uint64_t v12 = v13;
LABEL_19:
        swift_willThrow();
        goto LABEL_20;
      }
    }
    sub_1BBBBC994();
    swift_allocError();
    *unint64_t v11 = 0;
    goto LABEL_19;
  }
  if (v3) {
    goto LABEL_10;
  }
  return 1;
}

unint64_t sub_1BBBBC994()
{
  unint64_t result = qword_1E9F836F0;
  if (!qword_1E9F836F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F836F0);
  }
  return result;
}

unint64_t sub_1BBBBC9E8()
{
  unint64_t result = qword_1EB9F7C40;
  if (!qword_1EB9F7C40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9F7C40);
  }
  return result;
}

unint64_t sub_1BBBBCA3C()
{
  unint64_t result = qword_1EB9F7C78;
  if (!qword_1EB9F7C78)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EB9F7C78);
  }
  return result;
}

unint64_t sub_1BBBBCA84()
{
  unint64_t result = qword_1E9F836F8;
  if (!qword_1E9F836F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F836F8);
  }
  return result;
}

ValueMetadata *type metadata accessor for PrivilegeDropper()
{
  return &type metadata for PrivilegeDropper;
}

uint64_t getEnumTagSinglePayload for PrivilegeDropper.User(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
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
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for PrivilegeDropper.User(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
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
        JUMPOUT(0x1BBBBCC44);
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
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *sub_1BBBBCC6C(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PrivilegeDropper.User()
{
  return &type metadata for PrivilegeDropper.User;
}

uint64_t getEnumTagSinglePayload for PrivilegeDropper.UserPrivilegeError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PrivilegeDropper.UserPrivilegeError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BBBBCDE4);
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

ValueMetadata *type metadata accessor for PrivilegeDropper.UserPrivilegeError()
{
  return &type metadata for PrivilegeDropper.UserPrivilegeError;
}

unint64_t sub_1BBBBCE20()
{
  unint64_t result = qword_1E9F83700;
  if (!qword_1E9F83700)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F83700);
  }
  return result;
}

uint64_t static FileCombiner.FileCombinerError.== infix(_:_:)()
{
  return 1;
}

uint64_t FileCombiner.FileCombinerError.hash(into:)()
{
  return sub_1BBBEBB88();
}

uint64_t FileCombiner.FileCombinerError.hashValue.getter()
{
  return sub_1BBBEBBB8();
}

uint64_t FileCombiner.combine(fileURLs:to:bufferSize:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v88 = a3;
  v94[2] = *MEMORY[0x1E4F143B8];
  uint64_t v87 = sub_1BBBEACA8();
  uint64_t v5 = *(void *)(v87 - 8);
  MEMORY[0x1F4188790](v87);
  v85 = (char *)v71 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(qword_1EB9F7B20);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)v71 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = objc_allocWithZone(MEMORY[0x1E4F1CAA8]);
  unint64_t v11 = (void *)sub_1BBBEAC98();
  id v12 = objc_msgSend(v10, sel_initWithURL_append_, v11, 1);

  if (v12)
  {
    v86 = v9;
    objc_msgSend(v12, sel_open);
    uint64_t v84 = *(void *)(a1 + 16);
    uint64_t v73 = a1;
    if (v84)
    {
      uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
      uint64_t v13 = v5 + 16;
      uint64_t v81 = a1 + ((*(unsigned __int8 *)(v13 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 64));
      v82 = v14;
      uint64_t v15 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 40);
      uint64_t v16 = *(void *)(v13 + 56);
      v78 = (unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 32);
      uint64_t v79 = v16;
      uint64_t v83 = v13;
      v76 = (void (**)(char *, uint64_t))(v13 - 8);
      v77 = (void (**)(char *, char *, uint64_t))(v13 + 16);
      uint64_t v17 = v88;
      uint64_t v75 = v88 << 32;
      swift_bridgeObjectRetain();
      uint64_t v18 = 0;
      uint64_t v3 = 0;
      v80 = v15;
      v71[1] = (unint64_t)v15 & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
      long long v72 = xmmword_1BBBED370;
      uint64_t v19 = v87;
      id v91 = v12;
      while (1)
      {
        uint64_t v90 = v18;
        uint64_t v21 = v86;
        v82(v86, v81 + v79 * v18, v19);
        v89 = *v80;
        v89(v21, 0, 1, v19);
        if ((*v78)(v21, 1, v19) == 1) {
          break;
        }
        uint64_t v22 = v85;
        (*v77)(v85, v21, v19);
        id v23 = objc_allocWithZone(MEMORY[0x1E4F1CA10]);
        uint64_t v24 = (void *)sub_1BBBEAC98();
        id v25 = objc_msgSend(v23, sel_initWithURL_, v24);

        (*v76)(v22, v19);
        if (v25)
        {
          uint64_t v20 = (void *)MEMORY[0x1C18624B0](objc_msgSend(v25, sel_open));
          if (objc_msgSend(v25, sel_hasBytesAvailable))
          {
            id v92 = v25;
            while (objc_msgSend(v12, sel_hasSpaceAvailable))
            {
              if (v17)
              {
                if (v17 <= 14)
                {
                  if (v17 < 0)
                  {
                    __break(1u);
LABEL_72:
                    __break(1u);
LABEL_73:
                    __break(1u);
LABEL_74:
                    __break(1u);
LABEL_75:
                    __break(1u);
LABEL_76:
                    __break(1u);
LABEL_77:
                    __break(1u);
LABEL_78:
                    __break(1u);
LABEL_79:
                    __break(1u);
LABEL_80:
                    __break(1u);
LABEL_81:
                    __break(1u);
LABEL_82:
                    __break(1u);
LABEL_83:
                    __break(1u);
LABEL_84:
                    __break(1u);
LABEL_85:
                    __break(1u);
LABEL_86:
                    __break(1u);
LABEL_87:
                    __break(1u);
LABEL_88:
                    __break(1u);
                  }
                  *(void *)((char *)v94 + 6) = 0;
                  v94[0] = 0;
                  BYTE6(v94[1]) = v17;
                  id v28 = objc_msgSend(v25, sel_read_maxLength_, v94, v17);
                  uint64_t v29 = v94[0];
                  unint64_t v30 = LODWORD(v94[1]) | ((unint64_t)BYTE4(v94[1]) << 32) | ((unint64_t)BYTE5(v94[1]) << 40) | ((unint64_t)BYTE6(v94[1]) << 48);
                  if ((uint64_t)v28 <= 0) {
                    goto LABEL_64;
                  }
                }
                else
                {
                  v93 = v20;
                  sub_1BBBEAC58();
                  swift_allocObject();
                  uint64_t v27 = sub_1BBBEAC28();
                  if ((unint64_t)v17 > 0x7FFFFFFE)
                  {
                    sub_1BBBEACF8();
                    uint64_t v29 = swift_allocObject();
                    *(void *)(v29 + 16) = 0;
                    *(void *)(v29 + 24) = v17;
                    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                    {
                      uint64_t v32 = *(void *)(v29 + 16);
                      uint64_t v31 = *(void *)(v29 + 24);
                      if (sub_1BBBEAC18() && __OFSUB__(v32, sub_1BBBEAC48())) {
                        goto LABEL_86;
                      }
                      if (__OFSUB__(v31, v32)) {
                        goto LABEL_84;
                      }
                      swift_allocObject();
                      uint64_t v33 = sub_1BBBEABF8();
                      swift_release();
                      uint64_t v27 = v33;
                      id v12 = v91;
                    }
                    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                    {
                      uint64_t v34 = *(void *)(v29 + 16);
                      uint64_t v35 = *(void *)(v29 + 24);
                      uint64_t v36 = swift_allocObject();
                      *(void *)(v36 + 16) = v34;
                      *(void *)(v36 + 24) = v35;
                      swift_release();
                      uint64_t v29 = v36;
                    }
                    uint64_t v37 = *(void *)(v29 + 16);
                    uint64_t v38 = *(void *)(v29 + 24);
                    uint64_t v39 = sub_1BBBEAC18();
                    if (!v39) {
                      goto LABEL_87;
                    }
                    uint64_t v40 = v39;
                    uint64_t v41 = sub_1BBBEAC48();
                    uint64_t v42 = v37 - v41;
                    if (__OFSUB__(v37, v41)) {
                      goto LABEL_78;
                    }
                    if (__OFSUB__(v38, v37)) {
                      goto LABEL_79;
                    }
                    sub_1BBBEAC38();
                    uint64_t v43 = v40 + v42;
                    id v25 = v92;
                    uint64_t v17 = v88;
                    id v28 = objc_msgSend(v92, sel_read_maxLength_, v43, v88);
                    unint64_t v30 = v27 | 0x8000000000000000;
                    uint64_t v19 = v87;
                  }
                  else
                  {
                    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                    {
                      if (sub_1BBBEAC18() && __OFSUB__(0, sub_1BBBEAC48())) {
                        goto LABEL_85;
                      }
                      swift_allocObject();
                      uint64_t v44 = sub_1BBBEABF8();
                      swift_release();
                      uint64_t v27 = v44;
                      id v12 = v91;
                    }
                    uint64_t v45 = sub_1BBBEAC18();
                    if (!v45) {
                      goto LABEL_88;
                    }
                    uint64_t v46 = v45;
                    uint64_t v47 = sub_1BBBEAC48();
                    uint64_t v48 = -v47;
                    if (__OFSUB__(0, v47)) {
                      goto LABEL_77;
                    }
                    sub_1BBBEAC38();
                    uint64_t v49 = v46 + v48;
                    id v25 = v92;
                    id v28 = objc_msgSend(v92, sel_read_maxLength_, v49, v17);
                    unint64_t v30 = v27 | 0x4000000000000000;
                    uint64_t v29 = v75;
                  }
                  uint64_t v20 = v93;
                  if ((uint64_t)v28 <= 0)
                  {
LABEL_64:
                    v93 = v20;
                    id v61 = objc_msgSend(v25, sel_streamError);
                    if (v61)
                    {
                      v62 = v61;
                      LODWORD(v92) = sub_1BBBEB538();
                      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F7C80);
                      uint64_t v63 = swift_allocObject();
                      *(_OWORD *)(v63 + 16) = v72;
                      v94[0] = v62;
                      id v64 = v62;
                      __swift_instantiateConcreteTypeFromMangledName(qword_1EB9F74C0);
                      uint64_t v65 = sub_1BBBEB2B8();
                      uint64_t v67 = v66;
                      *(void *)(v63 + 56) = MEMORY[0x1E4FBB1A0];
                      *(void *)(v63 + 64) = sub_1BBBBC9E8();
                      *(void *)(v63 + 32) = v65;
                      *(void *)(v63 + 40) = v67;
                      sub_1BBBBCA3C();
                      v68 = (void *)sub_1BBBEB698();
                      sub_1BBBEADE8();

                      id v12 = v91;
                      uint64_t v17 = v88;
                      swift_bridgeObjectRelease();
                    }
                    sub_1BBBB6774(v29, v30);
                    uint64_t v20 = v93;
                    break;
                  }
                }
              }
              else
              {
                memset(v94, 0, 15);
                id v28 = objc_msgSend(v25, sel_read_maxLength_, v94, 0);
                uint64_t v29 = 0;
                unint64_t v30 = 0xC000000000000000;
                if ((uint64_t)v28 <= 0) {
                  goto LABEL_64;
                }
              }
              switch(v30 >> 62)
              {
                case 1uLL:
                  if ((int)v29 > v29 >> 32) {
                    goto LABEL_73;
                  }
                  v93 = v20;
                  swift_retain();
                  uint64_t v50 = sub_1BBBEAC18();
                  if (v50)
                  {
                    uint64_t v51 = v50;
                    uint64_t v52 = sub_1BBBEAC48();
                    uint64_t v53 = (int)v29 - v52;
                    if (__OFSUB__((int)v29, v52)) {
                      goto LABEL_81;
                    }
                    sub_1BBBEAC38();
                    uint64_t v54 = v51 + v53;
                    id v12 = v91;
                    objc_msgSend(v91, sel_write_maxLength_, v54, v28);
                    sub_1BBBB6774(v29, v30);
                    sub_1BBBB6774(v29, v30);
                    BOOL v26 = __OFADD__(v3++, 1);
                    if (v26) {
                      goto LABEL_83;
                    }
                    id v25 = v92;
                    uint64_t v20 = v93;
                  }
                  else
                  {
                    sub_1BBBEAC38();
LABEL_61:
                    id v25 = v92;
                    sub_1BBBB6774(v29, v30);
                    sub_1BBBB6774(v29, v30);
                    BOOL v26 = __OFADD__(v3++, 1);
                    id v12 = v91;
                    uint64_t v20 = v93;
                    if (v26) {
                      goto LABEL_76;
                    }
                  }
LABEL_12:
                  uint64_t v20 = (void *)MEMORY[0x1C18624B0]();
                  if ((objc_msgSend(v25, sel_hasBytesAvailable) & 1) == 0) {
                    goto LABEL_5;
                  }
                  break;
                case 2uLL:
                  v93 = v20;
                  uint64_t v55 = *(void *)(v29 + 16);
                  uint64_t v56 = *(void *)(v29 + 24);
                  sub_1BBBB67CC(v29, v30);
                  swift_retain();
                  swift_retain();
                  uint64_t v57 = sub_1BBBEAC18();
                  if (v57)
                  {
                    uint64_t v58 = v57;
                    uint64_t v59 = sub_1BBBEAC48();
                    if (__OFSUB__(v55, v59)) {
                      goto LABEL_80;
                    }
                    uint64_t v60 = v58 + v55 - v59;
                  }
                  else
                  {
                    uint64_t v60 = 0;
                  }
                  uint64_t v17 = v88;
                  if (__OFSUB__(v56, v55)) {
                    goto LABEL_75;
                  }
                  sub_1BBBEAC38();
                  if (!v60)
                  {
                    swift_release();
                    swift_release();
                    uint64_t v19 = v87;
                    goto LABEL_61;
                  }
                  objc_msgSend(v91, sel_write_maxLength_, v60, v28);
                  swift_release();
                  swift_release();
                  sub_1BBBB6774(v29, v30);
                  sub_1BBBB6774(v29, v30);
                  BOOL v26 = __OFADD__(v3++, 1);
                  uint64_t v19 = v87;
                  id v25 = v92;
                  if (v26) {
                    goto LABEL_82;
                  }
                  id v12 = v91;
                  uint64_t v20 = v93;
                  goto LABEL_12;
                case 3uLL:
                  *(void *)((char *)v94 + 6) = 0;
                  v94[0] = 0;
                  objc_msgSend(v12, sel_write_maxLength_, v94, v28);
                  sub_1BBBB6774(v29, v30);
                  sub_1BBBB6774(v29, v30);
                  BOOL v26 = __OFADD__(v3++, 1);
                  if (!v26) {
                    goto LABEL_12;
                  }
                  goto LABEL_74;
                default:
                  v94[0] = v29;
                  LOWORD(v94[1]) = v30;
                  BYTE2(v94[1]) = BYTE2(v30);
                  BYTE3(v94[1]) = BYTE3(v30);
                  BYTE4(v94[1]) = BYTE4(v30);
                  BYTE5(v94[1]) = BYTE5(v30);
                  objc_msgSend(v12, sel_write_maxLength_, v94, v28);
                  sub_1BBBB6774(v29, v30);
                  sub_1BBBB6774(v29, v30);
                  BOOL v26 = __OFADD__(v3++, 1);
                  if (!v26) {
                    goto LABEL_12;
                  }
                  goto LABEL_72;
              }
            }
          }
LABEL_5:
          objc_msgSend(v25, sel_close);
        }
        uint64_t v18 = v90 + 1;
        if (v90 + 1 == v84)
        {
          v89(v86, 1, 1, v19);
          break;
        }
      }
    }
    else
    {
      v69 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
      swift_bridgeObjectRetain();
      uint64_t v3 = 0;
      v69(v86, 1, 1, v87);
    }
    swift_bridgeObjectRelease();
    objc_msgSend(v12, sel_close);
  }
  else
  {
    sub_1BBBBDA24();
    uint64_t v74 = swift_allocError();
    swift_willThrow();
  }
  return v3;
}

unint64_t sub_1BBBBDA24()
{
  unint64_t result = qword_1E9F83708;
  if (!qword_1E9F83708)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F83708);
  }
  return result;
}

unint64_t sub_1BBBBDA7C()
{
  unint64_t result = qword_1E9F83710;
  if (!qword_1E9F83710)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F83710);
  }
  return result;
}

ValueMetadata *type metadata accessor for FileCombiner()
{
  return &type metadata for FileCombiner;
}

unsigned char *storeEnumTagSinglePayload for FileCombiner.FileCombinerError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1BBBBDB7CLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for FileCombiner.FileCombinerError()
{
  return &type metadata for FileCombiner.FileCombinerError;
}

uint64_t Subscription.subscriber.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t Subscription.init(subscriber:unsubscribeBlock:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = type metadata accessor for Subscription();
  sub_1BBBEADB8();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32))(a5, a1, a4);
  id v12 = (void *)(a5 + *(int *)(v10 + 32));
  *id v12 = a2;
  v12[1] = a3;
  return result;
}

uint64_t type metadata accessor for Subscription()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t Subscription.unsubscribe(completion:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v27 = a1;
  uint64_t v28 = a2;
  uint64_t v29 = sub_1BBBEB0B8();
  uint64_t v32 = *(void *)(v29 - 8);
  MEMORY[0x1F4188790](v29);
  uint64_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1BBBEB0F8();
  uint64_t v30 = *(void *)(v6 - 8);
  uint64_t v31 = v6;
  uint64_t v7 = MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)(a3 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x1F4188790](v7);
  uint64_t v12 = sub_1BBBEB0C8();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12);
  uint64_t v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BBBAEE84();
  (*(void (**)(char *, void, uint64_t))(v13 + 104))(v15, *MEMORY[0x1E4FBCB48], v12);
  uint64_t v25 = sub_1BBBEB658();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v26, a3);
  unint64_t v16 = (*(unsigned __int8 *)(v10 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = *(void *)(a3 + 16);
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v17 + v16, (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a3);
  uint64_t v18 = (void *)(v17 + ((v11 + v16 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v19 = v28;
  *uint64_t v18 = v27;
  v18[1] = v19;
  aBlock[4] = sub_1BBBBE2C4;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BBBAED3C;
  aBlock[3] = &block_descriptor_3;
  uint64_t v20 = _Block_copy(aBlock);
  swift_retain();
  sub_1BBBEB0D8();
  uint64_t v33 = MEMORY[0x1E4FBC860];
  sub_1BBBBE378();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F7968);
  sub_1BBBBE3D0();
  uint64_t v21 = v29;
  sub_1BBBEB798();
  uint64_t v22 = (void *)v25;
  MEMORY[0x1C1861D70](0, v9, v5, v20);
  _Block_release(v20);

  (*(void (**)(char *, uint64_t))(v32 + 8))(v5, v21);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v9, v31);
  return swift_release();
}

uint64_t sub_1BBBBE0B4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v4 = type metadata accessor for Subscription();
  (*(void (**)(uint64_t))(a1 + *(int *)(v4 + 32)))(a1);
  return a2(0);
}

uint64_t sub_1BBBBE170()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = (int *)(type metadata accessor for Subscription() - 8);
  uint64_t v3 = *(unsigned __int8 *)(*(void *)v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(*(void *)v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = v0 + v4;
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v0 + v4, v1);
  uint64_t v8 = v7 + v2[9];
  uint64_t v9 = sub_1BBBEADC8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, v6 + 16, v5);
}

uint64_t sub_1BBBBE2C4()
{
  uint64_t v1 = *(void *)(type metadata accessor for Subscription() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(uint64_t (**)(void))(v0 + ((*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8));
  return sub_1BBBBE0B4(v0 + v2, v3);
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

unint64_t sub_1BBBBE378()
{
  unint64_t result = qword_1EB9F78A0[0];
  if (!qword_1EB9F78A0[0])
  {
    sub_1BBBEB0B8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1EB9F78A0);
  }
  return result;
}

unint64_t sub_1BBBBE3D0()
{
  unint64_t result = qword_1EB9F7970;
  if (!qword_1EB9F7970)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB9F7968);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9F7970);
  }
  return result;
}

uint64_t static Subscription.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(int *)(type metadata accessor for Subscription() + 28);
  return MEMORY[0x1F40E53E8](a1 + v4, a2 + v4);
}

uint64_t sub_1BBBBE478(uint64_t a1, uint64_t a2)
{
  return static Subscription.== infix(_:_:)(a1, a2);
}

uint64_t sub_1BBBBE480(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 24);
}

uint64_t sub_1BBBBE488()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_1BBBEADC8();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_1BBBBE560(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = sub_1BBBEADC8();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(_DWORD *)(v9 + 80);
  uint64_t v11 = v7 + v10;
  uint64_t v12 = (v7 + v10) & ~v10;
  uint64_t v13 = *(void *)(v9 + 64) + 7;
  unint64_t v14 = ((v13 + v12) & 0xFFFFFFFFFFFFFFF8) + 16;
  unsigned int v15 = v10 | *(_DWORD *)(v6 + 80) & 0xF8;
  if (v15 > 7 || ((*(_DWORD *)(v6 + 80) | *(_DWORD *)(v9 + 80)) & 0x100000) != 0 || v14 > 0x18)
  {
    uint64_t v18 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v18 + (((v15 | 7) + 16) & ~(unint64_t)(v15 | 7)));
  }
  else
  {
    uint64_t v19 = v8;
    uint64_t v20 = ~v10;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    unint64_t v21 = ((unint64_t)a2 + v11) & v20;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 16))(((unint64_t)a1 + v11) & v20, v21, v19);
    uint64_t v22 = (void *)((v13 + v21) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v23 = v22[1];
    uint64_t v24 = (void *)((v13 + (((unint64_t)a1 + v11) & v20)) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v24 = *v22;
    v24[1] = v23;
  }
  swift_retain();
  return a1;
}

uint64_t sub_1BBBBE708(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a2 + 16) - 8) + 8;
  (*(void (**)(void))v3)();
  uint64_t v4 = *(void *)(v3 + 56);
  uint64_t v5 = sub_1BBBEADC8();
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v5 - 8) + 8))((v4 + a1 + *(unsigned __int8 *)(*(void *)(v5 - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v5 - 8) + 80), v5);
  return swift_release();
}

uint64_t sub_1BBBBE7CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 48);
  uint64_t v7 = sub_1BBBEADC8();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = v8 + 16;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = v6 + v10;
  uint64_t v12 = (v6 + v10 + a1) & ~v10;
  uint64_t v13 = (v11 + a2) & ~v10;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v12, v13, v7);
  uint64_t v14 = *(void *)(v9 + 48) + 7;
  unsigned int v15 = (void *)((v14 + v12) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v16 = (void *)((v14 + v13) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v17 = v16[1];
  void *v15 = *v16;
  v15[1] = v17;
  swift_retain();
  return a1;
}

uint64_t sub_1BBBBE8A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 40);
  uint64_t v7 = sub_1BBBEADC8();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = v8 + 24;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = v6 + v10;
  uint64_t v12 = (v6 + v10 + a1) & ~v10;
  uint64_t v13 = (v11 + a2) & ~v10;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 24))(v12, v13, v7);
  uint64_t v14 = *(void *)(v9 + 40) + 7;
  unsigned int v15 = (void *)((v14 + v12) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v16 = (void *)((v14 + v13) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v17 = v16[1];
  void *v15 = *v16;
  v15[1] = v17;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_1BBBBE988(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 32);
  uint64_t v7 = sub_1BBBEADC8();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = v8 + 32;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = v6 + v10;
  uint64_t v12 = (v6 + v10 + a1) & ~v10;
  uint64_t v13 = (v11 + a2) & ~v10;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v12, v13, v7);
  *(_OWORD *)((*(void *)(v9 + 32) + 7 + v12) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((*(void *)(v9 + 32) + 7 + v13) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_1BBBBEA5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 24);
  uint64_t v7 = sub_1BBBEADC8();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = v8 + 40;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = v6 + v10;
  uint64_t v12 = (v6 + v10 + a1) & ~v10;
  uint64_t v13 = (v11 + a2) & ~v10;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 40))(v12, v13, v7);
  *(_OWORD *)((*(void *)(v9 + 24) + 7 + v12) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((*(void *)(v9 + 24) + 7 + v13) & 0xFFFFFFFFFFFFFFF8);
  swift_release();
  return a1;
}

uint64_t sub_1BBBBEB38(int *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned int *)(v6 + 84);
  uint64_t v8 = sub_1BBBEADC8();
  uint64_t v9 = *(void *)(v8 - 8);
  unsigned int v10 = *(_DWORD *)(v9 + 84);
  uint64_t v11 = *(unsigned __int8 *)(v9 + 80);
  if (v10 <= v7) {
    unsigned int v12 = v7;
  }
  else {
    unsigned int v12 = *(_DWORD *)(v9 + 84);
  }
  if (v12 <= 0x7FFFFFFF) {
    unsigned int v12 = 0x7FFFFFFF;
  }
  if (!a2) {
    return 0;
  }
  uint64_t v13 = *(void *)(v6 + 64) + v11;
  uint64_t v14 = *(void *)(*(void *)(v8 - 8) + 64) + 7;
  if (v12 < a2)
  {
    unint64_t v15 = ((v14 + (v13 & ~v11)) & 0xFFFFFFFFFFFFFFF8) + 16;
    uint64_t v16 = v15 & 0xFFFFFFF8;
    if ((v15 & 0xFFFFFFF8) != 0) {
      unsigned int v17 = 2;
    }
    else {
      unsigned int v17 = a2 - v12 + 1;
    }
    if (v17 >= 0x10000) {
      unsigned int v18 = 4;
    }
    else {
      unsigned int v18 = 2;
    }
    if (v17 < 0x100) {
      unsigned int v18 = 1;
    }
    if (v17 >= 2) {
      uint64_t v19 = v18;
    }
    else {
      uint64_t v19 = 0;
    }
    switch(v19)
    {
      case 1:
        int v20 = *((unsigned __int8 *)a1 + v15);
        if (!v20) {
          break;
        }
        goto LABEL_24;
      case 2:
        int v20 = *(unsigned __int16 *)((char *)a1 + v15);
        if (v20) {
          goto LABEL_24;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x1BBBBEDA0);
      case 4:
        int v20 = *(int *)((char *)a1 + v15);
        if (!v20) {
          break;
        }
LABEL_24:
        int v22 = v20 - 1;
        if (v16)
        {
          int v22 = 0;
          int v23 = *a1;
        }
        else
        {
          int v23 = 0;
        }
        return v12 + (v23 | v22) + 1;
      default:
        break;
    }
  }
  if (v7 == v12)
  {
    uint64_t v24 = *(uint64_t (**)(int *, uint64_t, uint64_t))(v6 + 48);
    return v24(a1, v7, v5);
  }
  else
  {
    unint64_t v25 = ((unint64_t)a1 + v13) & ~v11;
    if (v10 == v12)
    {
      uint64_t v26 = *(uint64_t (**)(unint64_t))(v9 + 48);
      return v26(v25);
    }
    else
    {
      unint64_t v27 = *(void *)((v14 + v25) & 0xFFFFFFFFFFFFFFF8);
      if (v27 >= 0xFFFFFFFF) {
        LODWORD(v27) = -1;
      }
      return (v27 + 1);
    }
  }
}

void sub_1BBBBEDB4(_DWORD *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a4 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v30 = v8;
  uint64_t v9 = *(unsigned int *)(v8 + 84);
  uint64_t v10 = sub_1BBBEADC8();
  uint64_t v11 = *(void *)(v10 - 8);
  unsigned int v12 = *(_DWORD *)(v11 + 84);
  uint64_t v13 = *(unsigned __int8 *)(v11 + 80);
  if (v12 <= v9) {
    unsigned int v14 = v9;
  }
  else {
    unsigned int v14 = *(_DWORD *)(v11 + 84);
  }
  if (v14 <= 0x7FFFFFFF) {
    unsigned int v14 = 0x7FFFFFFF;
  }
  uint64_t v15 = *(void *)(v8 + 64) + v13;
  uint64_t v16 = *(void *)(*(void *)(v10 - 8) + 64) + 7;
  unint64_t v17 = ((v16 + (v15 & ~v13)) & 0xFFFFFFFFFFFFFFF8) + 16;
  if (((v16 + (v15 & ~v13)) & 0xFFFFFFF8) == 0xFFFFFFF0) {
    unsigned int v18 = a3 - v14 + 1;
  }
  else {
    unsigned int v18 = 2;
  }
  if (v18 >= 0x10000) {
    int v19 = 4;
  }
  else {
    int v19 = 2;
  }
  if (v18 < 0x100) {
    int v19 = 1;
  }
  if (v18 >= 2) {
    unsigned int v20 = v19;
  }
  else {
    unsigned int v20 = 0;
  }
  if (v14 < a3) {
    uint64_t v21 = v20;
  }
  else {
    uint64_t v21 = 0;
  }
  if (a2 > v14)
  {
    if (((v16 + (v15 & ~v13)) & 0xFFFFFFF8) == 0xFFFFFFF0) {
      int v22 = a2 - v14;
    }
    else {
      int v22 = 1;
    }
    if (((v16 + (v15 & ~v13)) & 0xFFFFFFF8) != 0xFFFFFFF0)
    {
      int v23 = ~v14 + a2;
      bzero(a1, ((v16 + (v15 & ~v13)) & 0xFFFFFFFFFFFFFFF8) + 16);
      *a1 = v23;
    }
    switch(v21)
    {
      case 1:
        *((unsigned char *)a1 + v17) = v22;
        return;
      case 2:
        *(_WORD *)((char *)a1 + v17) = v22;
        return;
      case 3:
        goto LABEL_50;
      case 4:
        *(_DWORD *)((char *)a1 + v17) = v22;
        return;
      default:
        return;
    }
  }
  uint64_t v24 = ~v13;
  switch(v21)
  {
    case 1:
      *((unsigned char *)a1 + v17) = 0;
      if (!a2) {
        return;
      }
      goto LABEL_35;
    case 2:
      *(_WORD *)((char *)a1 + v17) = 0;
      if (!a2) {
        return;
      }
      goto LABEL_35;
    case 3:
LABEL_50:
      __break(1u);
      JUMPOUT(0x1BBBBF074);
    case 4:
      *(_DWORD *)((char *)a1 + v17) = 0;
      goto LABEL_34;
    default:
LABEL_34:
      if (a2)
      {
LABEL_35:
        if (v9 == v14)
        {
          unint64_t v25 = *(void (**)(_DWORD *, uint64_t, uint64_t, uint64_t))(v30 + 56);
          v25(a1, a2, v9, v7);
        }
        else
        {
          unint64_t v26 = ((unint64_t)a1 + v15) & v24;
          if (v12 == v14)
          {
            unint64_t v27 = *(void (**)(unint64_t, uint64_t))(v11 + 56);
            v27(v26, a2);
          }
          else
          {
            uint64_t v28 = (void *)((v16 + v26) & 0xFFFFFFFFFFFFFFF8);
            if ((a2 & 0x80000000) != 0)
            {
              uint64_t v29 = a2 ^ 0x80000000;
              v28[1] = 0;
            }
            else
            {
              uint64_t v29 = (a2 - 1);
            }
            *uint64_t v28 = v29;
          }
        }
      }
      return;
  }
}

uint64_t dispatch thunk of Subscribable.subscriptions.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of Subscribable.subscriptions.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of Subscribable.subscriptions.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of Subscribable.subscribe(subscriber:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

SPShared::CryptoError_optional __swiftcall CryptoError.init(rawValue:)(Swift::Int rawValue)
{
  if ((unint64_t)(rawValue + 4320) > 0x14) {
    unsigned char *v1 = 13;
  }
  else {
    unsigned char *v1 = asc_1BBBEEEEA[rawValue + 4320];
  }
  return (SPShared::CryptoError_optional)rawValue;
}

uint64_t CryptoError.rawValue.getter()
{
  return qword_1BBBED998[*v0];
}

BOOL sub_1BBBBF130(char *a1, char *a2)
{
  return qword_1BBBED998[*a1] == qword_1BBBED998[*a2];
}

uint64_t sub_1BBBBF154()
{
  return sub_1BBBEBBB8();
}

uint64_t sub_1BBBBF1A4()
{
  return sub_1BBBEBB88();
}

uint64_t sub_1BBBBF1DC()
{
  return sub_1BBBEBBB8();
}

SPShared::CryptoError_optional sub_1BBBBF228(Swift::Int *a1)
{
  return CryptoError.init(rawValue:)(*a1);
}

void sub_1BBBBF230(void *a1@<X8>)
{
  *a1 = qword_1BBBED998[*v1];
}

uint64_t sub_1BBBBF248(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_1BBBC6804();
  unint64_t v5 = sub_1BBBC6858();
  return MEMORY[0x1F4185E20](a1, a2, v4, v5);
}

BOOL static HmacAlgorithm.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t HmacAlgorithm.hash(into:)()
{
  return sub_1BBBEBB88();
}

uint64_t HmacAlgorithm.hashValue.getter()
{
  return sub_1BBBEBBB8();
}

uint64_t static HashAlgorithm.== infix(_:_:)()
{
  return 1;
}

uint64_t HashAlgorithm.hash(into:)()
{
  return sub_1BBBEBB88();
}

uint64_t static NSFileHandle.bufferSize.getter()
{
  return 0x2000;
}

uint64_t static NSFileHandle.FileHandleHashError.== infix(_:_:)()
{
  return 1;
}

uint64_t static NSFileHandle.hash(fileURL:algorithm:)(uint64_t a1)
{
  uint64_t v3 = sub_1BBBEACA8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v7 = sub_1BBBBF4A0();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
  uint64_t v8 = v7;
  id v9 = sub_1BBBBF4E0((uint64_t)v6);
  if (!v1)
  {
    uint64_t v10 = v9;
    uint64_t v8 = sub_1BBBBF638();
    objc_msgSend(v10, sel_closeFile);
  }
  return v8;
}

unint64_t sub_1BBBBF4A0()
{
  unint64_t result = qword_1E9F83718;
  if (!qword_1E9F83718)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1E9F83718);
  }
  return result;
}

id sub_1BBBBF4E0(uint64_t a1)
{
  v11[1] = *(id *)MEMORY[0x1E4F143B8];
  unint64_t v2 = (void *)sub_1BBBEAC98();
  v11[0] = 0;
  id v3 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_fileHandleForReadingFromURL_error_, v2, v11);

  id v4 = v11[0];
  if (v3)
  {
    uint64_t v5 = sub_1BBBEACA8();
    uint64_t v6 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    id v7 = v4;
    v6(a1, v5);
  }
  else
  {
    id v8 = v11[0];
    sub_1BBBEAC88();

    swift_willThrow();
    uint64_t v9 = sub_1BBBEACA8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(a1, v9);
  }
  return v3;
}

uint64_t sub_1BBBBF638()
{
  uint64_t v1 = v0;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  memset(&c, 0, sizeof(c));
  uint64_t v2 = CC_SHA256_Init(&c);
  while (2)
  {
    id v3 = (void *)MEMORY[0x1C18624B0](v2);
    id v4 = objc_msgSend(v1, sel_readDataOfLength_, 0x2000);
    uint64_t v5 = sub_1BBBEAD28();
    unint64_t v7 = v6;

    switch(v7 >> 62)
    {
      case 1uLL:
        if (!((v5 ^ (unint64_t)(v5 << 32)) >> 32)) {
          goto LABEL_25;
        }
        goto LABEL_18;
      case 2uLL:
        uint64_t v8 = *(void *)(v5 + 16);
        if (v8 == *(void *)(v5 + 24)) {
          goto LABEL_25;
        }
        if (v7 >> 62 == 2)
        {
          swift_retain();
          swift_retain();
          uint64_t v9 = (char *)sub_1BBBEAC18();
          if (v9)
          {
            uint64_t v10 = sub_1BBBEAC48();
            if (__OFSUB__(v8, v10)) {
              goto LABEL_32;
            }
            v9 += v8 - v10;
          }
          sub_1BBBEAC38();
          uint64_t v12 = *(void *)(v5 + 16);
          uint64_t v11 = *(void *)(v5 + 24);
          unint64_t v13 = v11 - v12;
          if (__OFSUB__(v11, v12)) {
            goto LABEL_29;
          }
          if ((v13 & 0x8000000000000000) != 0) {
            goto LABEL_30;
          }
          if (HIDWORD(v13)) {
            goto LABEL_31;
          }
          CC_SHA256_Update(&c, v9, v13);
          swift_release();
          swift_release();
LABEL_3:
          sub_1BBBB6774(v5, v7);
          continue;
        }
LABEL_18:
        if ((int)v5 > v5 >> 32)
        {
          __break(1u);
LABEL_27:
          __break(1u);
LABEL_28:
          __break(1u);
LABEL_29:
          __break(1u);
LABEL_30:
          __break(1u);
LABEL_31:
          __break(1u);
LABEL_32:
          __break(1u);
        }
        sub_1BBBB67CC(v5, v7);
        unsigned int v14 = (char *)sub_1BBBEAC18();
        if (v14)
        {
          uint64_t v15 = sub_1BBBEAC48();
          if (__OFSUB__((int)v5, v15)) {
            goto LABEL_28;
          }
          v14 += (int)v5 - v15;
        }
        sub_1BBBEAC38();
        CC_LONG v16 = HIDWORD(v5) - v5;
        if (__OFSUB__(HIDWORD(v5), v5)) {
          goto LABEL_27;
        }
        if ((v16 & 0x80000000) == 0)
        {
          CC_SHA256_Update(&c, v14, v16);
          sub_1BBBB6774(v5, v7);
          goto LABEL_3;
        }
        __break(1u);
LABEL_25:
        sub_1BBBB6774(v5, v7);
        sub_1BBBEAC58();
        swift_allocObject();
        uint64_t v17 = sub_1BBBEAC28();
        uint64_t data = 0x2000000000;
        uint64_t v20 = v17;
        sub_1BBBC41F4((int *)&data, &c);
        return data;
      case 3uLL:
        goto LABEL_25;
      default:
        if ((v7 & 0xFF000000000000) == 0) {
          goto LABEL_25;
        }
        uint64_t data = v5;
        LOWORD(v20) = v7;
        BYTE2(v20) = BYTE2(v7);
        BYTE3(v20) = BYTE3(v7);
        BYTE4(v20) = BYTE4(v7);
        BYTE5(v20) = BYTE5(v7);
        CC_SHA256_Update(&c, &data, BYTE6(v7));
        goto LABEL_3;
    }
  }
}

uint64_t Data.hash(algorithm:)(uint64_t a1, uint64_t a2, unint64_t a3)
{
  sub_1BBBEAC58();
  swift_allocObject();
  v6[0] = 0x2000000000;
  v6[1] = sub_1BBBEAC28();
  sub_1BBBB67CC(a2, a3);
  sub_1BBBC427C((int *)v6, a2, a3);
  return v6[0];
}

unsigned __int8 *sub_1BBBBF9C8(unsigned __int8 *a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  v24[2] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (char *)a4;
  switch(a4 >> 62)
  {
    case 1uLL:
      uint64_t v17 = (a3 >> 32) - (int)a3;
      if (a3 >> 32 < (int)a3)
      {
        __break(1u);
LABEL_30:
        __break(1u);
LABEL_31:
        __break(1u);
        goto LABEL_32;
      }
      sub_1BBBB67CC(a3, a4);
      unsigned int v18 = (char *)sub_1BBBEAC18();
      if (!v18) {
        goto LABEL_21;
      }
      uint64_t v19 = sub_1BBBEAC48();
      if (__OFSUB__((int)a3, v19)) {
LABEL_32:
      }
        __break(1u);
      v18 += (int)a3 - v19;
LABEL_21:
      uint64_t v20 = sub_1BBBEAC38();
      if (v20 >= v17) {
        uint64_t v21 = (a3 >> 32) - (int)a3;
      }
      else {
        uint64_t v21 = v20;
      }
      uint64_t v22 = &v18[v21];
      if (v18) {
        uint64_t v23 = (uint64_t)v22;
      }
      else {
        uint64_t v23 = 0;
      }
      sub_1BBBBFC80(v18, v23, a1);
      if (v4)
      {
LABEL_34:
        sub_1BBBB6774(a3, (unint64_t)v5);
        __break(1u);
        JUMPOUT(0x1BBBBFC70);
      }
      return (unsigned __int8 *)sub_1BBBB6774(a3, (unint64_t)v5);
    case 2uLL:
      uint64_t v9 = *(void *)(a3 + 16);
      uint64_t v10 = *(void *)(a3 + 24);
      swift_retain();
      swift_retain();
      uint64_t v5 = (char *)sub_1BBBEAC18();
      if (!v5) {
        goto LABEL_6;
      }
      uint64_t v11 = sub_1BBBEAC48();
      if (__OFSUB__(v9, v11)) {
        goto LABEL_31;
      }
      v5 += v9 - v11;
LABEL_6:
      if (__OFSUB__(v10, v9)) {
        goto LABEL_30;
      }
      uint64_t v12 = sub_1BBBEAC38();
      if (v12 >= v10 - v9) {
        uint64_t v13 = v10 - v9;
      }
      else {
        uint64_t v13 = v12;
      }
      unsigned int v14 = &v5[v13];
      if (v5) {
        uint64_t v15 = (uint64_t)v14;
      }
      else {
        uint64_t v15 = 0;
      }
      sub_1BBBBFC80(v5, v15, a1);
      if (!v4)
      {
        swift_release();
        return (unsigned __int8 *)swift_release();
      }
      swift_release();
      swift_release();
      __break(1u);
      goto LABEL_34;
    case 3uLL:
      memset(v24, 0, 14);
      uint64_t v8 = (char *)v24;
      return sub_1BBBBFC80(v24, (uint64_t)v8, a1);
    default:
      v24[0] = a3;
      LOWORD(v24[1]) = a4;
      BYTE2(v24[1]) = BYTE2(a4);
      BYTE3(v24[1]) = BYTE3(a4);
      BYTE4(v24[1]) = BYTE4(a4);
      BYTE5(v24[1]) = BYTE5(a4);
      uint64_t v8 = (char *)v24 + BYTE6(a4);
      return sub_1BBBBFC80(v24, (uint64_t)v8, a1);
  }
}

unsigned __int8 *sub_1BBBBFC80(const void *a1, uint64_t a2, unsigned __int8 *a3)
{
  if (!a1) {
    goto LABEL_4;
  }
  uint64_t v3 = a2 - (void)a1;
  if (v3 >= 0x100000000)
  {
    a1 = (const void *)sub_1BBBEB948();
    __break(1u);
LABEL_4:
    LODWORD(v3) = 0;
  }
  return CC_SHA256(a1, v3, a3);
}

uint64_t Data.spEncrypt(key:ivLength:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, unint64_t a5@<X4>, uint64_t a6@<X8>)
{
  unint64_t v7 = a2 >> 62;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v12) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_26:
        __break(1u);
        goto LABEL_27;
      }
      uint64_t v12 = (int)v12;
LABEL_6:
      if (v12 < 16) {
        goto LABEL_13;
      }
      if (v7)
      {
        if (v7 != 1)
        {
          uint64_t v18 = *(void *)(a1 + 16);
          uint64_t v17 = *(void *)(a1 + 24);
          BOOL v15 = __OFSUB__(v17, v18);
          uint64_t v16 = v17 - v18;
          if (!v15)
          {
LABEL_12:
            if (v16 >= 257)
            {
LABEL_13:
              sub_1BBBC53BC();
              swift_allocError();
              *uint64_t v19 = 10;
              return swift_willThrow();
            }
            goto LABEL_14;
          }
LABEL_28:
          __break(1u);
LABEL_29:
          __break(1u);
LABEL_30:
          __break(1u);
          JUMPOUT(0x1BBBBFFD0);
        }
        LODWORD(v16) = HIDWORD(a1) - a1;
        if (!__OFSUB__(HIDWORD(a1), a1))
        {
          uint64_t v16 = (int)v16;
          goto LABEL_12;
        }
LABEL_27:
        __break(1u);
        goto LABEL_28;
      }
LABEL_14:
      uint64_t v21 = MEMORY[0x1C18613F0](a3);
      unint64_t v23 = v22;
      sub_1BBBEAC58();
      swift_allocObject();
      *(void *)&long long v34 = 0x1000000000;
      *((void *)&v34 + 1) = sub_1BBBEAC28() | 0x4000000000000000;
      uint64_t v24 = 0;
      switch(a5 >> 62)
      {
        case 1uLL:
          if (__OFSUB__(HIDWORD(a4), a4)) {
            goto LABEL_29;
          }
          uint64_t v24 = HIDWORD(a4) - (int)a4;
LABEL_19:
          *(void *)&long long v33 = sub_1BBBB71DC(v24);
          *((void *)&v33 + 1) = v27;
          sub_1BBBB67CC(v21, v23);
          sub_1BBBB67CC(a1, a2);
          sub_1BBBB67CC(a4, a5);
          int v28 = sub_1BBBC4CD8((uint64_t *)&v33, (uint64_t *)&v34, v21, v23, a1, a2, a4, a5);
          sub_1BBBB6774(a4, a5);
          sub_1BBBB6774(a1, a2);
          uint64_t result = sub_1BBBB6774(v21, v23);
          if (v28)
          {
            CryptoError.init(rawValue:)(v28);
            int v29 = v35;
            sub_1BBBC53BC();
            swift_allocError();
            if (v29 == 13) {
              char v31 = 8;
            }
            else {
              char v31 = v29;
            }
            *uint64_t v30 = v31;
            swift_willThrow();
            sub_1BBBB6774(v21, v23);
            sub_1BBBB6774(v33, *((unint64_t *)&v33 + 1));
            uint64_t result = sub_1BBBB6774(v34, *((unint64_t *)&v34 + 1));
          }
          else
          {
            *(void *)a6 = v21;
            *(void *)(a6 + 8) = v23;
            long long v32 = v33;
            *(_OWORD *)(a6 + 16) = v34;
            *(_OWORD *)(a6 + 32) = v32;
          }
          break;
        case 2uLL:
          uint64_t v26 = *(void *)(a4 + 16);
          uint64_t v25 = *(void *)(a4 + 24);
          uint64_t v24 = v25 - v26;
          if (!__OFSUB__(v25, v26)) {
            goto LABEL_19;
          }
          goto LABEL_30;
        case 3uLL:
          goto LABEL_19;
        default:
          uint64_t v24 = BYTE6(a5);
          goto LABEL_19;
      }
      return result;
    case 2uLL:
      uint64_t v14 = *(void *)(a1 + 16);
      uint64_t v13 = *(void *)(a1 + 24);
      BOOL v15 = __OFSUB__(v13, v14);
      uint64_t v12 = v13 - v14;
      if (!v15) {
        goto LABEL_6;
      }
      goto LABEL_26;
    case 3uLL:
      goto LABEL_13;
    default:
      uint64_t v12 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t sub_1BBBBFFF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X4>, unint64_t a6@<X5>, uint64_t a7@<X6>, unint64_t a8@<X7>, unsigned int *a9@<X8>, char *a10, uint64_t a11)
{
  uint64_t v11 = a9;
  v47[2] = *MEMORY[0x1E4F143B8];
  unint64_t v12 = a6;
  uint64_t v14 = a4;
  switch(a4 >> 62)
  {
    case 1uLL:
      uint64_t v41 = a9;
      if (a3 >> 32 < (int)a3)
      {
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
      }
      uint64_t v40 = a4 & 0x3FFFFFFFFFFFFFFFLL;
      sub_1BBBB67CC(a5, a6);
      sub_1BBBB67CC(a7, a8);
      sub_1BBBB67CC(a3, v14);
      unsigned int v26 = sub_1BBBC5548((int)a3, a3 >> 32, v40, a5, v12, a7, a8, a10, a11, a1, a2, (void (*)(int *__return_ptr, void *, char *, uint64_t, unint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t))sub_1BBBC0790, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t))sub_1BBBC4520);
      if (v42) {
        goto LABEL_34;
      }
      unsigned int v23 = v26;
      sub_1BBBB6774(a3, v14);
      goto LABEL_27;
    case 2uLL:
      uint64_t v41 = a9;
      uint64_t v14 = a4 & 0x3FFFFFFFFFFFFFFFLL;
      uint64_t v37 = *(void *)(a3 + 24);
      uint64_t v39 = *(void *)(a3 + 16);
      sub_1BBBB67CC(a5, a6);
      unint64_t v21 = v12;
      unint64_t v12 = a7;
      sub_1BBBB67CC(a7, a8);
      swift_retain();
      swift_retain();
      unsigned int v22 = sub_1BBBC5548(v39, v37, v14, a5, v21, a7, a8, a10, a11, a1, a2, (void (*)(int *__return_ptr, void *, char *, uint64_t, unint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t))sub_1BBBC0790, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t))sub_1BBBC4520);
      if (!v42)
      {
        unsigned int v23 = v22;
        swift_release();
        swift_release();
        uint64_t v24 = a5;
        unint64_t v25 = v21;
        goto LABEL_28;
      }
      sub_1BBBB6774(a5, v21);
      sub_1BBBB6774(a7, a8);
      swift_release();
      swift_release();
      __break(1u);
LABEL_34:
      sub_1BBBB6774(a5, v12);
      sub_1BBBB6774(a7, a8);
      sub_1BBBB6774(a3, v14);
      __break(1u);
LABEL_35:
      sub_1BBBB6774(a5, v12);
      sub_1BBBB6774(a7, a8);
      __break(1u);
LABEL_36:
      sub_1BBBB6774(a7, a8);
      sub_1BBBB6774(a5, v12);
      __break(1u);
LABEL_37:
      sub_1BBBB6774(a5, v12);
      sub_1BBBB6774(a7, a8);
      goto LABEL_39;
    case 3uLL:
      memset(v47, 0, 14);
      sub_1BBBB67CC(a7, a8);
      switch(v12 >> 62)
      {
        case 1uLL:
          if (a5 >> 32 < (int)a5) {
            goto LABEL_31;
          }
          sub_1BBBB67CC(a5, v12);
          unsigned int v33 = sub_1BBBC4520((int)a5, a5 >> 32, v12 & 0x3FFFFFFFFFFFFFFFLL, a7, a8, (uint64_t)v47, (uint64_t)v47, (uint64_t)a10, a11, a1, a2);
          if (v42) {
            goto LABEL_36;
          }
          unsigned int v23 = v33;
LABEL_23:
          sub_1BBBB6774(a5, v12);
          break;
        case 2uLL:
          uint64_t v27 = *(void *)(a5 + 16);
          uint64_t v28 = *(void *)(a5 + 24);
          sub_1BBBB67CC(a5, v12);
          swift_retain();
          swift_retain();
          unsigned int v29 = sub_1BBBC4520(v27, v28, v12 & 0x3FFFFFFFFFFFFFFFLL, a7, a8, (uint64_t)v47, (uint64_t)v47, (uint64_t)a10, a11, a1, a2);
          if (v42) {
            goto LABEL_37;
          }
          unsigned int v23 = v29;
          swift_release();
          swift_release();
          goto LABEL_23;
        case 3uLL:
          memset(v46, 0, 14);
          sub_1BBBB67CC(a5, v12);
          goto LABEL_16;
        default:
          v46[0] = a5;
          LOWORD(v46[1]) = v12;
          BYTE2(v46[1]) = BYTE2(v12);
          BYTE3(v46[1]) = BYTE3(v12);
          BYTE4(v46[1]) = BYTE4(v12);
          BYTE5(v46[1]) = BYTE5(v12);
          sub_1BBBB67CC(a5, v12);
LABEL_16:
          uint64_t v19 = a7;
          unint64_t v20 = a8;
          goto LABEL_18;
      }
      goto LABEL_29;
    default:
      v47[0] = a3;
      LOWORD(v47[1]) = a4;
      BYTE2(v47[1]) = BYTE2(a4);
      BYTE3(v47[1]) = BYTE3(a4);
      BYTE4(v47[1]) = BYTE4(a4);
      BYTE5(v47[1]) = BYTE5(a4);
      uint64_t v18 = (char *)v47 + BYTE6(a4);
      sub_1BBBB67CC(a7, a8);
      switch(v12 >> 62)
      {
        case 1uLL:
          uint64_t v41 = v11;
          if (a5 >> 32 < (int)a5) {
            goto LABEL_32;
          }
          sub_1BBBB67CC(a5, v12);
          unsigned int v34 = sub_1BBBC4520((int)a5, a5 >> 32, v12 & 0x3FFFFFFFFFFFFFFFLL, a7, a8, (uint64_t)v47, (uint64_t)v47 + BYTE6(v14), (uint64_t)a10, a11, a1, a2);
          if (v42) {
            goto LABEL_36;
          }
          unsigned int v23 = v34;
          goto LABEL_27;
        case 2uLL:
          uint64_t v41 = v11;
          uint64_t v30 = *(void *)(a5 + 16);
          uint64_t v31 = *(void *)(a5 + 24);
          sub_1BBBB67CC(a5, v12);
          swift_retain();
          swift_retain();
          unsigned int v32 = sub_1BBBC4520(v30, v31, v12 & 0x3FFFFFFFFFFFFFFFLL, a7, a8, (uint64_t)v47, (uint64_t)v18, (uint64_t)a10, a11, a1, a2);
          if (v42)
          {
            sub_1BBBB6774(a5, v12);
            sub_1BBBB6774(a7, a8);
LABEL_39:
            swift_release();
            swift_release();
            __break(1u);
            JUMPOUT(0x1BBBC0760);
          }
          unsigned int v23 = v32;
          swift_release();
          swift_release();
LABEL_27:
          uint64_t v24 = a5;
          unint64_t v25 = v12;
LABEL_28:
          sub_1BBBB6774(v24, v25);
          uint64_t v11 = v41;
LABEL_29:
          uint64_t result = sub_1BBBB6774(a7, a8);
          *uint64_t v11 = v23;
          return result;
        case 3uLL:
          memset(v46, 0, 14);
          sub_1BBBB67CC(a5, v12);
          uint64_t v19 = a7;
          unint64_t v20 = a8;
          goto LABEL_18;
        default:
          v46[0] = a5;
          LOWORD(v46[1]) = v12;
          BYTE2(v46[1]) = BYTE2(v12);
          BYTE3(v46[1]) = BYTE3(v12);
          BYTE4(v46[1]) = BYTE4(v12);
          BYTE5(v46[1]) = BYTE5(v12);
          sub_1BBBB67CC(a5, v12);
          uint64_t v19 = a7;
          unint64_t v20 = a8;
LABEL_18:
          sub_1BBBC0790(v19, v20, &v45);
          if (v42) {
            goto LABEL_35;
          }
          sub_1BBBB6774(a5, v12);
          unsigned int v23 = v45;
          goto LABEL_29;
      }
  }
}

uint64_t sub_1BBBC0790@<X0>(uint64_t a1@<X2>, unint64_t a2@<X3>, _DWORD *a3@<X8>)
{
  uint64_t v3 = a3;
  switch(a2 >> 62)
  {
    case 1uLL:
      if (a1 >> 32 < (int)a1)
      {
        __break(1u);
LABEL_13:
        __break(1u);
LABEL_14:
        __break(1u);
LABEL_15:
        __break(1u);
      }
      sub_1BBBB67CC(a1, a2);
      if (sub_1BBBEAC18() && __OFSUB__((int)a1, sub_1BBBEAC48())) {
        goto LABEL_15;
      }
      sub_1BBBEAC38();
      int v6 = CCCryptorGCMOneshotEncrypt();
      uint64_t result = sub_1BBBB6774(a1, a2);
LABEL_11:
      *uint64_t v3 = v6;
      return result;
    case 2uLL:
      uint64_t v8 = *(void *)(a1 + 16);
      uint64_t v9 = *(void *)(a1 + 24);
      swift_retain();
      swift_retain();
      if (sub_1BBBEAC18() && __OFSUB__(v8, sub_1BBBEAC48())) {
        goto LABEL_14;
      }
      if (__OFSUB__(v9, v8)) {
        goto LABEL_13;
      }
      sub_1BBBEAC38();
      int v6 = CCCryptorGCMOneshotEncrypt();
      swift_release();
      uint64_t result = swift_release();
      uint64_t v3 = a3;
      goto LABEL_11;
    default:
      uint64_t result = CCCryptorGCMOneshotEncrypt();
      int v6 = result;
      goto LABEL_11;
  }
}

uint64_t EncryptedData.init(initializationVector:tag:cipherText:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>)
{
  *a7 = result;
  a7[1] = a2;
  a7[2] = a3;
  a7[3] = a4;
  a7[4] = a5;
  a7[5] = a6;
  return result;
}

uint64_t Data.hmac(key:algorithm:)(uint64_t a1, unint64_t a2, unsigned __int8 *a3, uint64_t a4, unint64_t a5)
{
  uint64_t v9 = *a3;
  v12[0] = sub_1BBBB71DC(qword_1BBBEDA00[(char)v9]);
  v12[1] = v10;
  sub_1BBBB67CC(a1, a2);
  sub_1BBBB67CC(a4, a5);
  sub_1BBBC3EA8(v12, a1, a2, a4, a5, v9);
  return v12[0];
}

uint64_t sub_1BBBC0BAC(void *a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7)
{
  key[2] = *MEMORY[0x1E4F143B8];
  char v8 = a7;
  uint64_t v11 = a4;
  uint64_t v12 = a3;
  switch(a4 >> 62)
  {
    case 1uLL:
      char v22 = a7;
      if (a3 >> 32 < (int)a3) {
        __break(1u);
      }
      sub_1BBBB67CC(a5, a6);
      sub_1BBBB67CC(v12, v11);
      sub_1BBBC443C((int)v12, v12 >> 32, v11 & 0x3FFFFFFFFFFFFFFFLL, a5, a6, v22, a1);
      if (v7) {
        goto LABEL_14;
      }
      uint64_t result = sub_1BBBB6774(v12, v11);
      break;
    case 2uLL:
      uint64_t v11 = a4 & 0x3FFFFFFFFFFFFFFFLL;
      char v21 = a7;
      uint64_t v18 = *(void *)(a3 + 16);
      uint64_t v19 = *(void *)(a3 + 24);
      sub_1BBBB67CC(a5, a6);
      swift_retain();
      swift_retain();
      sub_1BBBC443C(v18, v19, v11, a5, a6, v21, a1);
      if (v7) {
        goto LABEL_13;
      }
      swift_release();
      uint64_t result = swift_release();
      break;
    case 3uLL:
      memset(key, 0, 14);
      sub_1BBBB67CC(a5, a6);
      uint64_t v14 = (char *)key;
      uint64_t v15 = a5;
      unint64_t v16 = a6;
      char v17 = v8;
      goto LABEL_6;
    default:
      key[0] = a3;
      LOWORD(key[1]) = a4;
      BYTE2(key[1]) = BYTE2(a4);
      BYTE3(key[1]) = BYTE3(a4);
      BYTE4(key[1]) = BYTE4(a4);
      BYTE5(key[1]) = BYTE5(a4);
      uint64_t v12 = a7;
      sub_1BBBB67CC(a5, a6);
      uint64_t v14 = (char *)key + BYTE6(v11);
      uint64_t v15 = a5;
      unint64_t v16 = a6;
      char v17 = v8;
LABEL_6:
      sub_1BBBC0EAC(key, (uint64_t)v14, v15, v16, v17, a1);
      if (v7)
      {
        sub_1BBBB6774(a5, a6);
        __break(1u);
LABEL_13:
        swift_release();
        swift_release();
        __break(1u);
LABEL_14:
        sub_1BBBB6774(v12, v11);
        __break(1u);
        JUMPOUT(0x1BBBC0E9CLL);
      }
      uint64_t result = sub_1BBBB6774(a5, a6);
      break;
  }
  return result;
}

void sub_1BBBC0EAC(void *key, uint64_t a2, uint64_t a3, unint64_t a4, char a5, void *a6)
{
  data[2] = *MEMORY[0x1E4F143B8];
  switch(a4 >> 62)
  {
    case 1uLL:
      uint64_t v15 = (a3 >> 32) - (int)a3;
      if (a3 >> 32 < (int)a3)
      {
        __break(1u);
LABEL_40:
        __break(1u);
        goto LABEL_41;
      }
      sub_1BBBB67CC(a3, a4);
      unint64_t v16 = (char *)sub_1BBBEAC18();
      if (v16)
      {
        uint64_t v17 = sub_1BBBEAC48();
        if (!__OFSUB__((int)a3, v17))
        {
          v16 += (int)a3 - v17;
          goto LABEL_10;
        }
LABEL_41:
        __break(1u);
LABEL_42:
        __break(1u);
      }
LABEL_10:
      uint64_t v18 = sub_1BBBEAC38();
      if (v18 >= v15) {
        uint64_t v19 = (a3 >> 32) - (int)a3;
      }
      else {
        uint64_t v19 = v18;
      }
      if (key) {
        size_t v20 = a2 - (void)key;
      }
      else {
        size_t v20 = 0;
      }
      if (v16) {
        size_t v21 = v19;
      }
      else {
        size_t v21 = 0;
      }
      CCHmac(dword_1BBBEDA30[a5], key, v20, v16, v21, a6);
      sub_1BBBB6774(a3, a4);
      return;
    case 2uLL:
      uint64_t v22 = *(void *)(a3 + 16);
      uint64_t v23 = *(void *)(a3 + 24);
      swift_retain();
      swift_retain();
      uint64_t v24 = (char *)sub_1BBBEAC18();
      if (!v24) {
        goto LABEL_23;
      }
      uint64_t v25 = sub_1BBBEAC48();
      if (__OFSUB__(v22, v25)) {
        goto LABEL_42;
      }
      v24 += v22 - v25;
LABEL_23:
      BOOL v26 = __OFSUB__(v23, v22);
      uint64_t v27 = v23 - v22;
      if (v26) {
        goto LABEL_40;
      }
      uint64_t v28 = sub_1BBBEAC38();
      if (v28 >= v27) {
        size_t v29 = v27;
      }
      else {
        size_t v29 = v28;
      }
      if (key) {
        size_t v30 = a2 - (void)key;
      }
      else {
        size_t v30 = 0;
      }
      if (v24) {
        size_t v31 = v29;
      }
      else {
        size_t v31 = 0;
      }
      CCHmac(dword_1BBBEDA30[a5], key, v30, v24, v31, a6);
      swift_release();
      swift_release();
      return;
    case 3uLL:
      if (key) {
        size_t v11 = a2 - (void)key;
      }
      else {
        size_t v11 = 0;
      }
      memset(data, 0, 14);
      CCHmacAlgorithm v13 = dword_1BBBEDA30[a5];
      uint64_t v14 = key;
      size_t v12 = 0;
      goto LABEL_38;
    default:
      data[0] = a3;
      LOWORD(data[1]) = a4;
      BYTE2(data[1]) = BYTE2(a4);
      BYTE3(data[1]) = BYTE3(a4);
      if (key) {
        size_t v11 = a2 - (void)key;
      }
      else {
        size_t v11 = 0;
      }
      BYTE4(data[1]) = BYTE4(a4);
      size_t v12 = BYTE6(a4);
      BYTE5(data[1]) = BYTE5(a4);
      CCHmacAlgorithm v13 = dword_1BBBEDA30[a5];
      uint64_t v14 = key;
LABEL_38:
      CCHmac(v13, v14, v11, data, v12, a6);
      return;
  }
}

uint64_t EncryptedData.initializationVector.getter()
{
  uint64_t v1 = *(void *)v0;
  sub_1BBBB67CC(*(void *)v0, *(void *)(v0 + 8));
  return v1;
}

uint64_t EncryptedData.tag.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  sub_1BBBB67CC(v1, *(void *)(v0 + 24));
  return v1;
}

uint64_t EncryptedData.cipherText.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  sub_1BBBB67CC(v1, *(void *)(v0 + 40));
  return v1;
}

uint64_t EncryptedData.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BBBEBBD8();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v9, v10);
  sub_1BBBC5460();
  sub_1BBBEBA68();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v9, v10);
  sub_1BBBB67CC(v7, v8);
  sub_1BBBEBA68();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v9, v10);
  uint64_t v11 = v7;
  sub_1BBBB67CC(v7, v8);
  sub_1BBBEBA68();
  sub_1BBBB67CC(v7, v8);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
  sub_1BBBB67CC(v7, v8);
  uint64_t v5 = v11;
  sub_1BBBB67CC(v11, v8);
  sub_1BBBB67CC(v7, v8);
  sub_1BBBB6774(v7, v8);
  sub_1BBBB6774(v5, v8);
  sub_1BBBB6774(v7, v8);
  *a2 = v7;
  a2[1] = v8;
  a2[2] = v5;
  a2[3] = v8;
  a2[4] = v7;
  a2[5] = v8;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  sub_1BBBB6774(v7, v8);
  sub_1BBBB6774(v5, v8);
  return sub_1BBBB6774(v7, v8);
}

uint64_t EncryptedData.encode(to:)(void *a1)
{
  uint64_t v6 = *(void *)(v1 + 32);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BBBEBC08();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v4, v5);
  sub_1BBBC54B4();
  sub_1BBBEBA78();
  if (!v2)
  {
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v4, v5);
    sub_1BBBEBA78();
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v4, v5);
    sub_1BBBEBA78();
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v4);
}

uint64_t EncryptedData.decrypt(key:)(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = *v2;
  uint64_t v4 = v2[2];
  unint64_t v5 = v2[3];
  unint64_t v6 = a2 >> 62;
  uint64_t v8 = v2[4];
  unint64_t v7 = v2[5];
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v11) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_26:
        __break(1u);
        goto LABEL_27;
      }
      uint64_t v11 = (int)v11;
LABEL_6:
      if (v11 < 16) {
        goto LABEL_13;
      }
      if (v6)
      {
        if (v6 != 1)
        {
          uint64_t v17 = *(void *)(a1 + 16);
          uint64_t v16 = *(void *)(a1 + 24);
          BOOL v14 = __OFSUB__(v16, v17);
          uint64_t v15 = v16 - v17;
          if (!v14)
          {
LABEL_12:
            if (v15 >= 257)
            {
LABEL_13:
              sub_1BBBC53BC();
              swift_allocError();
              *uint64_t v18 = 10;
              return swift_willThrow();
            }
            goto LABEL_14;
          }
LABEL_28:
          __break(1u);
LABEL_29:
          __break(1u);
LABEL_30:
          __break(1u);
          JUMPOUT(0x1BBBC1888);
        }
        LODWORD(v15) = HIDWORD(a1) - a1;
        if (!__OFSUB__(HIDWORD(a1), a1))
        {
          uint64_t v15 = (int)v15;
          goto LABEL_12;
        }
LABEL_27:
        __break(1u);
        goto LABEL_28;
      }
LABEL_14:
      uint64_t v20 = 0;
      unint64_t v21 = v2[1];
      switch(v7 >> 62)
      {
        case 1uLL:
          if (__OFSUB__(HIDWORD(v8), v8)) {
            goto LABEL_29;
          }
          uint64_t v20 = HIDWORD(v8) - (int)v8;
LABEL_19:
          uint64_t v30 = sub_1BBBB71DC(v20);
          unint64_t v31 = v24;
          sub_1BBBB67CC(v8, v7);
          sub_1BBBB67CC(v3, v21);
          sub_1BBBB67CC(a1, a2);
          sub_1BBBB67CC(v4, v5);
          uint64_t v29 = v3;
          int v25 = sub_1BBBC5838(&v30, v8, v7, v3, v21, a1, a2, v4, v5);
          sub_1BBBB6774(a1, a2);
          if (v25)
          {
            CryptoError.init(rawValue:)(v25);
            int v26 = v32;
            sub_1BBBC53BC();
            swift_allocError();
            if (v26 == 13) {
              char v28 = 8;
            }
            else {
              char v28 = v26;
            }
            *uint64_t v27 = v28;
            swift_willThrow();
            sub_1BBBB6774(v8, v7);
            sub_1BBBB6774(v29, v21);
            sub_1BBBB6774(v4, v5);
            uint64_t result = sub_1BBBB6774(v30, v31);
          }
          else
          {
            sub_1BBBB6774(v8, v7);
            sub_1BBBB6774(v4, v5);
            sub_1BBBB6774(v29, v21);
            uint64_t result = v30;
          }
          break;
        case 2uLL:
          uint64_t v23 = *(void *)(v8 + 16);
          uint64_t v22 = *(void *)(v8 + 24);
          uint64_t v20 = v22 - v23;
          if (!__OFSUB__(v22, v23)) {
            goto LABEL_19;
          }
          goto LABEL_30;
        case 3uLL:
          goto LABEL_19;
        default:
          uint64_t v20 = BYTE6(v7);
          goto LABEL_19;
      }
      return result;
    case 2uLL:
      uint64_t v13 = *(void *)(a1 + 16);
      uint64_t v12 = *(void *)(a1 + 24);
      BOOL v14 = __OFSUB__(v12, v13);
      uint64_t v11 = v12 - v13;
      if (!v14) {
        goto LABEL_6;
      }
      goto LABEL_26;
    case 3uLL:
      goto LABEL_13;
    default:
      uint64_t v11 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t sub_1BBBC18A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X4>, unint64_t a6@<X5>, uint64_t a7@<X6>, unint64_t a8@<X7>, unsigned int *a9@<X8>, uint64_t a10, unint64_t a11)
{
  uint64_t v12 = a9;
  unint64_t v13 = a11;
  v107[2] = *MEMORY[0x1E4F143B8];
  uint64_t v14 = a4;
  uint64_t v15 = a3;
  switch(a4 >> 62)
  {
    case 1uLL:
      if (a3 >> 32 < (int)a3)
      {
        __break(1u);
LABEL_60:
        __break(1u);
LABEL_61:
        __break(1u);
LABEL_62:
        __break(1u);
LABEL_63:
        __break(1u);
LABEL_64:
        __break(1u);
LABEL_65:
        __break(1u);
      }
      uint64_t v83 = a9;
      unint64_t v26 = a11;
      unint64_t v13 = a7;
      uint64_t v74 = a3 >> 32;
      uint64_t v77 = a4 & 0x3FFFFFFFFFFFFFFFLL;
      sub_1BBBB67CC(a5, a6);
      sub_1BBBB67CC(a7, a8);
      sub_1BBBB67CC(a10, a11);
      sub_1BBBB67CC(a10, a11);
      sub_1BBBB67CC(v15, v14);
      unsigned int v27 = sub_1BBBC5648((int)v15, v74, v77, a5, a6, a7, a8, a10, a11, a1, a2, (void *(*)(uint64_t *__return_ptr, void *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1BBBC3058);
      if (v11) {
        goto LABEL_67;
      }
      unsigned int v24 = v27;
      sub_1BBBB6774(v15, v14);
      sub_1BBBB6774(a10, a11);
      unint64_t v13 = a11;
      goto LABEL_13;
    case 2uLL:
      uint64_t v14 = a4 & 0x3FFFFFFFFFFFFFFFLL;
      uint64_t v78 = *(void *)(a3 + 16);
      uint64_t v83 = a9;
      uint64_t v76 = *(void *)(a3 + 24);
      sub_1BBBB67CC(a5, a6);
      sub_1BBBB67CC(a7, a8);
      sub_1BBBB67CC(a10, a11);
      sub_1BBBB67CC(a10, a11);
      swift_retain();
      swift_retain();
      unsigned int v23 = sub_1BBBC5648(v78, v76, v14, a5, a6, a7, a8, a10, a11, a1, a2, (void *(*)(uint64_t *__return_ptr, void *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1BBBC3058);
      if (v11)
      {
        unint64_t v26 = a10;
        sub_1BBBB6774(a10, a11);
        sub_1BBBB6774(a5, a6);
        sub_1BBBB6774(a7, a8);
        sub_1BBBB6774(a10, a11);
        swift_release();
        swift_release();
        __break(1u);
LABEL_67:
        sub_1BBBB6774(a10, v26);
        sub_1BBBB6774(a5, a6);
        sub_1BBBB6774(a7, a8);
        sub_1BBBB6774(a10, v26);
        sub_1BBBB6774(v15, v14);
        __break(1u);
LABEL_68:
        sub_1BBBB6774(a5, v15);
        sub_1BBBB6774(a5, v15);
        sub_1BBBB6774(a7, a8);
        sub_1BBBB6774(a10, v13);
        sub_1BBBB6774(a7, a8);
        sub_1BBBB6774(a10, v13);
        sub_1BBBB6774(a7, a8);
        sub_1BBBB6774(a10, v13);
        swift_release();
        swift_release();
        __break(1u);
LABEL_69:
        sub_1BBBB6774(a5, a6);
        sub_1BBBB6774(a7, a8);
        sub_1BBBB6774(a10, v13);
        sub_1BBBB6774(a7, a8);
        sub_1BBBB6774(a10, v13);
        sub_1BBBB6774(a7, a8);
        sub_1BBBB6774(a10, v13);
        sub_1BBBB6774(a5, a6);
        __break(1u);
LABEL_70:
        sub_1BBBB6774(a5, v15);
        sub_1BBBB6774(a5, v15);
        sub_1BBBB6774(a7, a8);
        sub_1BBBB6774(a10, v13);
        sub_1BBBB6774(a7, a8);
        sub_1BBBB6774(a10, v13);
        sub_1BBBB6774(a7, a8);
        sub_1BBBB6774(a10, v13);
        sub_1BBBB6774(a10, v13);
        sub_1BBBB6774(a10, v13);
        __break(1u);
LABEL_71:
        sub_1BBBB6774(a5, v15);
        sub_1BBBB6774(a5, v15);
        sub_1BBBB6774(a7, a8);
        sub_1BBBB6774(a10, v13);
        sub_1BBBB6774(a7, a8);
        sub_1BBBB6774(a10, v13);
        sub_1BBBB6774(a7, a8);
        sub_1BBBB6774(a10, v13);
        sub_1BBBB6774(a10, v13);
        sub_1BBBB6774(a10, v13);
        swift_release();
        swift_release();
        __break(1u);
LABEL_72:
        sub_1BBBB6774(a5, a6);
        sub_1BBBB6774(a5, a6);
        sub_1BBBB6774(a7, a8);
        sub_1BBBB6774(a10, v13);
        sub_1BBBB6774(a7, a8);
        sub_1BBBB6774(a10, v13);
        sub_1BBBB6774(a7, a8);
        sub_1BBBB6774(a10, v13);
        sub_1BBBB6774(a10, v13);
        sub_1BBBB6774(a10, v13);
        sub_1BBBB6774(a7, a8);
        __break(1u);
        JUMPOUT(0x1BBBC2FE8);
      }
      unsigned int v24 = v23;
      swift_release();
      swift_release();
      sub_1BBBB6774(a10, a11);
LABEL_13:
      uint64_t v15 = a6;
      uint64_t v12 = v83;
      break;
    case 3uLL:
      unint64_t v25 = a8 >> 62;
      memset(v107, 0, 14);
      sub_1BBBB67CC(a7, a8);
      sub_1BBBB67CC(a10, a11);
      sub_1BBBB67CC(a7, a8);
      sub_1BBBB67CC(a10, a11);
      uint64_t v15 = a6;
      switch(a6 >> 62)
      {
        case 1uLL:
          uint64_t v92 = a1;
          uint64_t v97 = v11;
          uint64_t v84 = v12;
          uint64_t v38 = (int)a5;
          uint64_t v15 = a5 >> 32;
          if (a5 >> 32 < (int)a5) {
            goto LABEL_60;
          }
          unint64_t v19 = a11;
          uint64_t v39 = a6 & 0x3FFFFFFFFFFFFFFFLL;
          sub_1BBBB67CC(a5, a6);
          unint64_t v41 = a8;
          uint64_t v40 = a7;
          sub_1BBBB67CC(a7, a8);
          uint64_t v42 = a10;
          sub_1BBBB67CC(a10, a11);
          sub_1BBBB67CC(a5, a6);
          uint64_t v71 = a2;
          uint64_t v43 = v107;
          uint64_t v67 = v92;
          break;
        case 2uLL:
          uint64_t v28 = a6 & 0x3FFFFFFFFFFFFFFFLL;
          uint64_t v96 = v11;
          uint64_t v29 = *(void *)(a5 + 24);
          uint64_t v84 = v12;
          uint64_t v91 = *(void *)(a5 + 16);
          sub_1BBBB67CC(a5, a6);
          unint64_t v31 = a8;
          uint64_t v30 = a7;
          sub_1BBBB67CC(a7, a8);
          uint64_t v32 = a10;
          sub_1BBBB67CC(a10, a11);
          sub_1BBBB67CC(a5, a6);
          swift_retain();
          swift_retain();
          uint64_t v70 = a2;
          uint64_t v63 = v107;
          uint64_t v66 = a1;
          uint64_t v33 = v91;
          uint64_t v34 = v29;
          goto LABEL_16;
        case 3uLL:
          memset(v106, 0, 14);
          sub_1BBBB67CC(a10, a11);
          switch((int)v25)
          {
            case 1:
              uint64_t v94 = a1;
              uint64_t v99 = v11;
              uint64_t v87 = v12;
              uint64_t v55 = (int)a7;
              uint64_t v56 = a7 >> 32;
              if (a7 >> 32 < (int)a7) {
                goto LABEL_62;
              }
              unint64_t v19 = a11;
              uint64_t v57 = a8 & 0x3FFFFFFFFFFFFFFFLL;
              sub_1BBBB67CC(a5, a6);
              sub_1BBBB67CC(a7, a8);
              uint64_t v58 = a10;
              sub_1BBBB67CC(a10, a11);
              sub_1BBBB67CC(a5, a6);
              sub_1BBBB67CC(a7, a8);
              sub_1BBBB67CC(a10, a11);
              uint64_t v69 = v94;
              uint64_t v73 = a2;
              uint64_t v65 = v107;
              uint64_t v59 = (char *)v106;
              goto LABEL_54;
            case 2:
              uint64_t v46 = a8 & 0x3FFFFFFFFFFFFFFFLL;
              uint64_t v93 = *(void *)(a7 + 16);
              uint64_t v98 = v11;
              uint64_t v47 = *(void *)(a7 + 24);
              sub_1BBBB67CC(a5, a6);
              sub_1BBBB67CC(a7, a8);
              uint64_t v48 = a10;
              sub_1BBBB67CC(a10, a11);
              sub_1BBBB67CC(a5, a6);
              sub_1BBBB67CC(a10, a11);
              swift_retain();
              swift_retain();
              uint64_t v68 = a1;
              uint64_t v72 = a2;
              id v64 = v107;
              uint64_t v49 = (char *)v106;
              goto LABEL_31;
            case 3:
              memset(v105, 0, 14);
              sub_1BBBB67CC(a5, a6);
              sub_1BBBB67CC(a7, a8);
              sub_1BBBB67CC(a10, a11);
              sub_1BBBB67CC(a5, a6);
              sub_1BBBB67CC(a10, a11);
              uint64_t v20 = a10;
              goto LABEL_38;
            default:
              v105[0] = a7;
              LODWORD(v105[1]) = a8;
              WORD2(v105[1]) = WORD2(a8);
              sub_1BBBB67CC(a5, a6);
              sub_1BBBB67CC(a7, a8);
              sub_1BBBB67CC(a10, a11);
              sub_1BBBB67CC(a5, a6);
              sub_1BBBB67CC(a10, a11);
              uint64_t v20 = a10;
LABEL_38:
              unint64_t v21 = a11;
              goto LABEL_45;
          }
        default:
          v106[0] = a5;
          LODWORD(v106[1]) = a6;
          WORD2(v106[1]) = WORD2(a6);
          sub_1BBBB67CC(a10, a11);
          switch((int)v25)
          {
            case 1:
              uint64_t v95 = a1;
              uint64_t v99 = v11;
              uint64_t v87 = v12;
              uint64_t v55 = (int)a7;
              uint64_t v56 = a7 >> 32;
              if (a7 >> 32 < (int)a7) {
                goto LABEL_63;
              }
              unint64_t v19 = a11;
              uint64_t v57 = a8 & 0x3FFFFFFFFFFFFFFFLL;
              sub_1BBBB67CC(a5, a6);
              sub_1BBBB67CC(a7, a8);
              uint64_t v58 = a10;
              sub_1BBBB67CC(a10, a11);
              sub_1BBBB67CC(a5, a6);
              sub_1BBBB67CC(a7, a8);
              sub_1BBBB67CC(a10, a11);
              uint64_t v59 = (char *)v106 + BYTE6(a6);
              uint64_t v69 = v95;
              uint64_t v73 = a2;
              uint64_t v65 = v107;
              break;
            case 2:
              uint64_t v46 = a8 & 0x3FFFFFFFFFFFFFFFLL;
              uint64_t v93 = *(void *)(a7 + 16);
              uint64_t v98 = v11;
              uint64_t v47 = *(void *)(a7 + 24);
              sub_1BBBB67CC(a5, a6);
              sub_1BBBB67CC(a7, a8);
              uint64_t v48 = a10;
              sub_1BBBB67CC(a10, a11);
              sub_1BBBB67CC(a5, a6);
              sub_1BBBB67CC(a10, a11);
              swift_retain();
              swift_retain();
              uint64_t v49 = (char *)v106 + BYTE6(a6);
              uint64_t v68 = a1;
              uint64_t v72 = a2;
              id v64 = v107;
LABEL_31:
              uint64_t v50 = v93;
              uint64_t v51 = v47;
              goto LABEL_35;
            case 3:
              memset(v105, 0, 14);
              sub_1BBBB67CC(a5, a6);
              sub_1BBBB67CC(a7, a8);
              sub_1BBBB67CC(a10, a11);
              sub_1BBBB67CC(a5, a6);
              sub_1BBBB67CC(a10, a11);
              uint64_t v20 = a10;
              unint64_t v21 = a11;
              goto LABEL_45;
            default:
              v105[0] = a7;
              LODWORD(v105[1]) = a8;
              WORD2(v105[1]) = WORD2(a8);
              sub_1BBBB67CC(a5, a6);
              sub_1BBBB67CC(a7, a8);
              sub_1BBBB67CC(a10, a11);
              sub_1BBBB67CC(a5, a6);
              sub_1BBBB67CC(a10, a11);
              uint64_t v20 = a10;
              unint64_t v21 = a11;
              goto LABEL_45;
          }
          goto LABEL_54;
      }
LABEL_26:
      uint64_t v44 = v40;
      unint64_t v13 = v19;
      unsigned int v45 = sub_1BBBC5548(v38, v15, v39, v44, v41, v42, v19, (char *)v107, (uint64_t)v43, v67, v71, (void (*)(int *__return_ptr, void *, char *, uint64_t, unint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t))sub_1BBBC3B18, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t))sub_1BBBC5508);
      if (v97) {
        goto LABEL_69;
      }
      unsigned int v24 = v45;
      sub_1BBBB6774(a7, a8);
      uint64_t v15 = a6;
LABEL_28:
      uint64_t v12 = v84;
LABEL_57:
      sub_1BBBB6774(a10, v13);
      sub_1BBBB6774(a5, v15);
      sub_1BBBB6774(a7, a8);
      sub_1BBBB6774(a10, v13);
      break;
    default:
      v107[0] = a3;
      LOWORD(v107[1]) = a4;
      BYTE2(v107[1]) = BYTE2(a4);
      BYTE3(v107[1]) = BYTE3(a4);
      BYTE4(v107[1]) = BYTE4(a4);
      BYTE5(v107[1]) = BYTE5(a4);
      unint64_t v18 = a8 >> 62;
      uint64_t v75 = (char *)v107 + BYTE6(a4);
      unint64_t v19 = a11;
      sub_1BBBB67CC(a7, a8);
      sub_1BBBB67CC(a10, a11);
      unint64_t v13 = a11;
      sub_1BBBB67CC(a7, a8);
      sub_1BBBB67CC(a10, a11);
      uint64_t v15 = a6;
      switch(a6 >> 62)
      {
        case 1uLL:
          uint64_t v82 = a2;
          uint64_t v84 = v12;
          uint64_t v97 = v11;
          uint64_t v38 = (int)a5;
          uint64_t v15 = a5 >> 32;
          if (a5 >> 32 < (int)a5) {
            goto LABEL_61;
          }
          uint64_t v39 = a6 & 0x3FFFFFFFFFFFFFFFLL;
          sub_1BBBB67CC(a5, a6);
          unint64_t v41 = a8;
          uint64_t v40 = a7;
          sub_1BBBB67CC(a7, a8);
          uint64_t v42 = a10;
          sub_1BBBB67CC(a10, a11);
          sub_1BBBB67CC(a5, a6);
          uint64_t v71 = v82;
          uint64_t v67 = a1;
          uint64_t v43 = v75;
          goto LABEL_26;
        case 2uLL:
          uint64_t v28 = a6 & 0x3FFFFFFFFFFFFFFFLL;
          uint64_t v96 = v11;
          uint64_t v35 = *(void *)(a5 + 24);
          uint64_t v81 = *(void *)(a5 + 16);
          uint64_t v84 = v12;
          sub_1BBBB67CC(a5, a6);
          uint64_t v30 = a7;
          uint64_t v36 = a2;
          unint64_t v31 = a8;
          sub_1BBBB67CC(a7, a8);
          uint64_t v32 = a10;
          sub_1BBBB67CC(a10, a11);
          sub_1BBBB67CC(a5, a6);
          swift_retain();
          swift_retain();
          uint64_t v70 = v36;
          uint64_t v33 = v81;
          uint64_t v63 = v75;
          uint64_t v66 = a1;
          uint64_t v34 = v35;
LABEL_16:
          unsigned int v37 = sub_1BBBC5548(v33, v34, v28, v30, v31, v32, v13, (char *)v107, (uint64_t)v63, v66, v70, (void (*)(int *__return_ptr, void *, char *, uint64_t, unint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t))sub_1BBBC3B18, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t))sub_1BBBC5508);
          if (v96) {
            goto LABEL_68;
          }
          unsigned int v24 = v37;
          swift_release();
          swift_release();
          sub_1BBBB6774(a7, a8);
          goto LABEL_28;
        case 3uLL:
          memset(v106, 0, 14);
          sub_1BBBB67CC(a10, a11);
          switch((int)v18)
          {
            case 1:
              uint64_t v87 = v12;
              uint64_t v99 = v11;
              uint64_t v55 = (int)a7;
              uint64_t v56 = a7 >> 32;
              if (a7 >> 32 < (int)a7) {
                goto LABEL_64;
              }
              uint64_t v57 = a8 & 0x3FFFFFFFFFFFFFFFLL;
              sub_1BBBB67CC(a5, a6);
              sub_1BBBB67CC(a7, a8);
              uint64_t v58 = a10;
              sub_1BBBB67CC(a10, a11);
              sub_1BBBB67CC(a5, a6);
              unint64_t v13 = a11;
              sub_1BBBB67CC(a7, a8);
              sub_1BBBB67CC(a10, a11);
              uint64_t v59 = (char *)v106;
              uint64_t v69 = a1;
              uint64_t v73 = a2;
              uint64_t v60 = v75;
              goto LABEL_53;
            case 2:
              uint64_t v46 = a8 & 0x3FFFFFFFFFFFFFFFLL;
              uint64_t v98 = v11;
              uint64_t v52 = *(void *)(a7 + 24);
              uint64_t v85 = *(void *)(a7 + 16);
              sub_1BBBB67CC(a5, a6);
              sub_1BBBB67CC(a7, a8);
              uint64_t v48 = a10;
              sub_1BBBB67CC(a10, a11);
              sub_1BBBB67CC(a5, a6);
              sub_1BBBB67CC(a10, a11);
              swift_retain();
              swift_retain();
              uint64_t v49 = (char *)v106;
              uint64_t v50 = v85;
              uint64_t v68 = a1;
              uint64_t v72 = a2;
              uint64_t v53 = v75;
              goto LABEL_34;
            case 3:
              memset(v105, 0, 14);
              sub_1BBBB67CC(a5, a6);
              sub_1BBBB67CC(a7, a8);
              sub_1BBBB67CC(a10, a11);
              sub_1BBBB67CC(a5, a6);
              sub_1BBBB67CC(a10, a11);
              uint64_t v20 = a10;
              goto LABEL_43;
            default:
              v105[0] = a7;
              LODWORD(v105[1]) = a8;
              WORD2(v105[1]) = WORD2(a8);
              sub_1BBBB67CC(a5, a6);
              sub_1BBBB67CC(a7, a8);
              sub_1BBBB67CC(a10, a11);
              sub_1BBBB67CC(a5, a6);
              sub_1BBBB67CC(a10, a11);
              uint64_t v20 = a10;
LABEL_43:
              unint64_t v21 = a11;
              goto LABEL_45;
          }
        default:
          v106[0] = a5;
          LODWORD(v106[1]) = a6;
          WORD2(v106[1]) = WORD2(a6);
          sub_1BBBB67CC(a10, a11);
          switch((int)v18)
          {
            case 1:
              uint64_t v87 = v12;
              uint64_t v99 = v11;
              uint64_t v55 = (int)a7;
              uint64_t v56 = a7 >> 32;
              if (a7 >> 32 < (int)a7) {
                goto LABEL_65;
              }
              uint64_t v57 = a8 & 0x3FFFFFFFFFFFFFFFLL;
              sub_1BBBB67CC(a5, a6);
              sub_1BBBB67CC(a7, a8);
              uint64_t v58 = a10;
              sub_1BBBB67CC(a10, a11);
              sub_1BBBB67CC(a5, a6);
              unint64_t v13 = a11;
              sub_1BBBB67CC(a7, a8);
              sub_1BBBB67CC(a10, a11);
              uint64_t v69 = a1;
              uint64_t v73 = a2;
              uint64_t v59 = (char *)v106 + BYTE6(a6);
              uint64_t v60 = v75;
LABEL_53:
              uint64_t v65 = v60;
LABEL_54:
              unsigned int v61 = sub_1BBBC5508(v55, v56, v57, v58, v19, (uint64_t)v106, (uint64_t)v59, (uint64_t)v107, (uint64_t)v65, v69, v73);
              if (v99) {
                goto LABEL_72;
              }
              unsigned int v24 = v61;
              sub_1BBBB6774(a10, v13);
              sub_1BBBB6774(a7, a8);
              sub_1BBBB6774(a10, v13);
              uint64_t v15 = a6;
              uint64_t v12 = v87;
              break;
            case 2:
              uint64_t v46 = a8 & 0x3FFFFFFFFFFFFFFFLL;
              uint64_t v98 = v11;
              uint64_t v52 = *(void *)(a7 + 24);
              uint64_t v86 = *(void *)(a7 + 16);
              sub_1BBBB67CC(a5, a6);
              sub_1BBBB67CC(a7, a8);
              uint64_t v48 = a10;
              sub_1BBBB67CC(a10, a11);
              sub_1BBBB67CC(a5, a6);
              sub_1BBBB67CC(a10, a11);
              swift_retain();
              swift_retain();
              uint64_t v50 = v86;
              uint64_t v68 = a1;
              uint64_t v72 = a2;
              uint64_t v49 = (char *)v106 + BYTE6(a6);
              uint64_t v53 = v75;
LABEL_34:
              id v64 = v53;
              uint64_t v51 = v52;
LABEL_35:
              unsigned int v54 = sub_1BBBC5508(v50, v51, v46, v48, v13, (uint64_t)v106, (uint64_t)v49, (uint64_t)v107, (uint64_t)v64, v68, v72);
              if (v98) {
                goto LABEL_71;
              }
              unsigned int v24 = v54;
              swift_release();
              swift_release();
              sub_1BBBB6774(a10, v13);
              sub_1BBBB6774(a10, v13);
              break;
            case 3:
              memset(v105, 0, 14);
              sub_1BBBB67CC(a5, a6);
              sub_1BBBB67CC(a7, a8);
              sub_1BBBB67CC(a10, a11);
              sub_1BBBB67CC(a5, a6);
              sub_1BBBB67CC(a10, a11);
              uint64_t v20 = a10;
              unint64_t v21 = a11;
              goto LABEL_45;
            default:
              v105[0] = a7;
              LODWORD(v105[1]) = a8;
              WORD2(v105[1]) = WORD2(a8);
              sub_1BBBB67CC(a5, a6);
              sub_1BBBB67CC(a7, a8);
              sub_1BBBB67CC(a10, a11);
              sub_1BBBB67CC(a5, a6);
              sub_1BBBB67CC(a10, a11);
              uint64_t v20 = a10;
              unint64_t v21 = a11;
LABEL_45:
              sub_1BBBC3B18(v20, v21, &v104);
              if (v11) {
                goto LABEL_70;
              }
              sub_1BBBB6774(a10, v13);
              sub_1BBBB6774(a10, v13);
              unsigned int v24 = v104;
              break;
          }
          sub_1BBBB6774(a7, a8);
          goto LABEL_57;
      }
  }
  sub_1BBBB6774(a5, v15);
  sub_1BBBB6774(a7, a8);
  uint64_t result = sub_1BBBB6774(a10, v13);
  *uint64_t v12 = v24;
  return result;
}

uint64_t sub_1BBBC3058@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X4>, unint64_t a6@<X5>, uint64_t a7@<X6>, unint64_t a8@<X7>, unsigned int *a9@<X8>, uint64_t a10, uint64_t a11)
{
  v43[2] = *MEMORY[0x1E4F143B8];
  unint64_t v12 = a6;
  uint64_t v14 = (char *)a4;
  uint64_t v15 = a3;
  switch(a4 >> 62)
  {
    case 1uLL:
      if (a3 >> 32 < (int)a3)
      {
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
      }
      uint64_t v34 = a4 & 0x3FFFFFFFFFFFFFFFLL;
      sub_1BBBB67CC(a5, a6);
      sub_1BBBB67CC(a7, a8);
      sub_1BBBB67CC(v15, (unint64_t)v14);
      unsigned int v23 = sub_1BBBC5548((int)v15, v15 >> 32, v34, a5, v12, a7, a8, a1, a2, a10, a11, (void (*)(int *__return_ptr, void *, char *, uint64_t, unint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t))sub_1BBBC3B18, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t))sub_1BBBC5508);
      if (v11) {
        goto LABEL_35;
      }
      unsigned int v20 = v23;
      sub_1BBBB6774(v15, (unint64_t)v14);
LABEL_27:
      uint64_t v21 = a5;
      unint64_t v22 = v12;
      break;
    case 2uLL:
      uint64_t v14 = (char *)(a4 & 0x3FFFFFFFFFFFFFFFLL);
      uint64_t v35 = *(void *)(a3 + 16);
      uint64_t v33 = *(void *)(a3 + 24);
      sub_1BBBB67CC(a5, a6);
      unint64_t v17 = v12;
      unint64_t v12 = a7;
      sub_1BBBB67CC(a7, a8);
      swift_retain();
      swift_retain();
      unint64_t v18 = v17;
      unsigned int v19 = sub_1BBBC5548(v35, v33, (uint64_t)v14, a5, v17, a7, a8, a1, a2, a10, a11, (void (*)(int *__return_ptr, void *, char *, uint64_t, unint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t))sub_1BBBC3B18, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t))sub_1BBBC5508);
      if (v11)
      {
        sub_1BBBB6774(a5, v17);
        sub_1BBBB6774(a7, a8);
        swift_release();
        swift_release();
        __break(1u);
LABEL_34:
        sub_1BBBB6774(a5, v12);
        sub_1BBBB6774(a7, a8);
        __break(1u);
LABEL_35:
        sub_1BBBB6774(a5, v12);
        sub_1BBBB6774(a7, a8);
        sub_1BBBB6774(v15, (unint64_t)v14);
        __break(1u);
LABEL_36:
        sub_1BBBB6774(a5, v12);
        sub_1BBBB6774(a7, a8);
        swift_release();
        swift_release();
        __break(1u);
LABEL_37:
        sub_1BBBB6774(a7, a8);
        sub_1BBBB6774(a5, v12);
        __break(1u);
        JUMPOUT(0x1BBBC376CLL);
      }
      unsigned int v20 = v19;
      swift_release();
      swift_release();
      uint64_t v21 = a5;
      unint64_t v22 = v18;
      break;
    case 3uLL:
      memset(v43, 0, 14);
      sub_1BBBB67CC(a7, a8);
      switch(v12 >> 62)
      {
        case 1uLL:
          if (a5 >> 32 < (int)a5) {
            goto LABEL_31;
          }
          sub_1BBBB67CC(a5, v12);
          unsigned int v31 = sub_1BBBC5508((int)a5, a5 >> 32, v12 & 0x3FFFFFFFFFFFFFFFLL, a7, a8, (uint64_t)v43, (uint64_t)v43, (uint64_t)a1, a2, a10, a11);
          goto LABEL_25;
        case 2uLL:
          uint64_t v24 = *(void *)(a5 + 16);
          uint64_t v25 = *(void *)(a5 + 24);
          sub_1BBBB67CC(a5, v12);
          swift_retain();
          swift_retain();
          unsigned int v26 = sub_1BBBC5508(v24, v25, v12 & 0x3FFFFFFFFFFFFFFFLL, a7, a8, (uint64_t)v43, (uint64_t)v43, (uint64_t)a1, a2, a10, a11);
          goto LABEL_13;
        case 3uLL:
          memset(v42, 0, 14);
          sub_1BBBB67CC(a5, v12);
          goto LABEL_16;
        default:
          v42[0] = a5;
          LOWORD(v42[1]) = v12;
          BYTE2(v42[1]) = BYTE2(v12);
          BYTE3(v42[1]) = BYTE3(v12);
          BYTE4(v42[1]) = BYTE4(v12);
          BYTE5(v42[1]) = BYTE5(v12);
          uint64_t v14 = (char *)v42 + BYTE6(v12);
          sub_1BBBB67CC(a5, v12);
LABEL_16:
          uint64_t v29 = a7;
          unint64_t v30 = a8;
          goto LABEL_19;
      }
    default:
      v43[0] = a3;
      LOWORD(v43[1]) = a4;
      BYTE2(v43[1]) = BYTE2(a4);
      BYTE3(v43[1]) = BYTE3(a4);
      BYTE4(v43[1]) = BYTE4(a4);
      BYTE5(v43[1]) = BYTE5(a4);
      uint64_t v15 = (uint64_t)v43 + BYTE6(a4);
      sub_1BBBB67CC(a7, a8);
      switch(v12 >> 62)
      {
        case 1uLL:
          if (a5 >> 32 < (int)a5) {
            goto LABEL_32;
          }
          sub_1BBBB67CC(a5, v12);
          unsigned int v31 = sub_1BBBC5508((int)a5, a5 >> 32, v12 & 0x3FFFFFFFFFFFFFFFLL, a7, a8, (uint64_t)v43, v15, (uint64_t)a1, a2, a10, a11);
LABEL_25:
          if (v11) {
            goto LABEL_37;
          }
          unsigned int v20 = v31;
          goto LABEL_27;
        case 2uLL:
          uint64_t v27 = *(void *)(a5 + 16);
          uint64_t v28 = *(void *)(a5 + 24);
          sub_1BBBB67CC(a5, v12);
          swift_retain();
          swift_retain();
          unsigned int v26 = sub_1BBBC5508(v27, v28, v12 & 0x3FFFFFFFFFFFFFFFLL, a7, a8, (uint64_t)v43, v15, (uint64_t)a1, a2, a10, a11);
LABEL_13:
          if (v11) {
            goto LABEL_36;
          }
          unsigned int v20 = v26;
          swift_release();
          swift_release();
          goto LABEL_27;
        case 3uLL:
          memset(v42, 0, 14);
          sub_1BBBB67CC(a5, v12);
          goto LABEL_18;
        default:
          v42[0] = a5;
          LOWORD(v42[1]) = v12;
          BYTE2(v42[1]) = BYTE2(v12);
          BYTE3(v42[1]) = BYTE3(v12);
          BYTE4(v42[1]) = BYTE4(v12);
          BYTE5(v42[1]) = BYTE5(v12);
          uint64_t v14 = (char *)v42 + BYTE6(v12);
          sub_1BBBB67CC(a5, v12);
LABEL_18:
          uint64_t v29 = a7;
          unint64_t v30 = a8;
LABEL_19:
          sub_1BBBC3B18(v29, v30, &v41);
          if (v11) {
            goto LABEL_34;
          }
          sub_1BBBB6774(a5, v12);
          unsigned int v20 = v41;
          goto LABEL_29;
      }
  }
  sub_1BBBB6774(v21, v22);
LABEL_29:
  uint64_t result = sub_1BBBB6774(a7, a8);
  *a9 = v20;
  return result;
}

uint64_t sub_1BBBC379C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X4>, unint64_t a6@<X5>, char *a7@<X6>, uint64_t a8@<X7>, _DWORD *a9@<X8>, uint64_t a10, uint64_t a11, void (*a12)(int *__return_ptr, void *, char *, uint64_t, unint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t), uint64_t (*a13)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t))
{
  v39[2] = *MEMORY[0x1E4F143B8];
  uint64_t v16 = (char *)a4;
  uint64_t v17 = a3;
  switch(a4 >> 62)
  {
    case 1uLL:
      if (a3 >> 32 < (int)a3) {
        __break(1u);
      }
      uint64_t v31 = a4 & 0x3FFFFFFFFFFFFFFFLL;
      sub_1BBBB67CC(a5, a6);
      sub_1BBBB67CC(v17, (unint64_t)v16);
      int v28 = a13((int)v17, v17 >> 32, v31, a5, a6, a1, a2, a7, a8, a10, a11);
      if (v13) {
        goto LABEL_16;
      }
      int v23 = v28;
      sub_1BBBB6774(v17, (unint64_t)v16);
      goto LABEL_11;
    case 2uLL:
      uint64_t v16 = (char *)(a4 & 0x3FFFFFFFFFFFFFFFLL);
      uint64_t v30 = *(void *)(a3 + 24);
      uint64_t v32 = *(void *)(a3 + 16);
      sub_1BBBB67CC(a5, a6);
      swift_retain();
      swift_retain();
      int v22 = a13(v32, v30, (uint64_t)v16, a5, a6, a1, a2, a7, a8, a10, a11);
      if (v13) {
        goto LABEL_15;
      }
      int v23 = v22;
      swift_release();
      swift_release();
LABEL_11:
      uint64_t result = sub_1BBBB6774(a5, a6);
      break;
    case 3uLL:
      memset(v39, 0, 14);
      uint64_t v16 = a7;
      uint64_t v17 = a10;
      sub_1BBBB67CC(a5, a6);
      a12(&v38, v39, (char *)v39, a5, a6, a1, a2, v16, a8, a10, a11);
      goto LABEL_6;
    default:
      v39[0] = a3;
      LOWORD(v39[1]) = a4;
      BYTE2(v39[1]) = BYTE2(a4);
      BYTE3(v39[1]) = BYTE3(a4);
      BYTE4(v39[1]) = BYTE4(a4);
      BYTE5(v39[1]) = BYTE5(a4);
      uint64_t v16 = (char *)v39 + BYTE6(a4);
      uint64_t v17 = a2;
      sub_1BBBB67CC(a5, a6);
      a12(&v38, v39, v16, a5, a6, a1, v17, a7, a8, a10, a11);
LABEL_6:
      if (v13)
      {
        sub_1BBBB6774(a5, a6);
        __break(1u);
LABEL_15:
        sub_1BBBB6774(a5, a6);
        swift_release();
        swift_release();
        __break(1u);
LABEL_16:
        sub_1BBBB6774(a5, a6);
        sub_1BBBB6774(v17, (unint64_t)v16);
        __break(1u);
        JUMPOUT(0x1BBBC3B08);
      }
      uint64_t result = sub_1BBBB6774(a5, a6);
      int v23 = v38;
      break;
  }
  *a9 = v23;
  return result;
}

uint64_t sub_1BBBC3B18@<X0>(uint64_t a1@<X2>, unint64_t a2@<X3>, _DWORD *a3@<X8>)
{
  uint64_t v3 = a3;
  switch(a2 >> 62)
  {
    case 1uLL:
      if (a1 >> 32 < (int)a1)
      {
        __break(1u);
LABEL_14:
        __break(1u);
LABEL_15:
        __break(1u);
LABEL_16:
        __break(1u);
      }
      uint64_t v10 = a3;
      sub_1BBBB67CC(a1, a2);
      if (sub_1BBBEAC18() && __OFSUB__((int)a1, sub_1BBBEAC48())) {
        goto LABEL_16;
      }
      sub_1BBBEAC38();
      int v6 = CCCryptorGCMOneshotDecrypt();
      uint64_t result = sub_1BBBB6774(a1, a2);
LABEL_10:
      uint64_t v3 = v10;
LABEL_12:
      *uint64_t v3 = v6;
      return result;
    case 2uLL:
      uint64_t v10 = a3;
      uint64_t v8 = *(void *)(a1 + 16);
      uint64_t v9 = *(void *)(a1 + 24);
      swift_retain();
      swift_retain();
      if (sub_1BBBEAC18() && __OFSUB__(v8, sub_1BBBEAC48())) {
        goto LABEL_15;
      }
      if (__OFSUB__(v9, v8)) {
        goto LABEL_14;
      }
      sub_1BBBEAC38();
      int v6 = CCCryptorGCMOneshotDecrypt();
      swift_release();
      uint64_t result = swift_release();
      goto LABEL_10;
    default:
      uint64_t result = CCCryptorGCMOneshotDecrypt();
      int v6 = result;
      goto LABEL_12;
  }
}

uint64_t sub_1BBBC3E78@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return EncryptedData.init(from:)(a1, a2);
}

uint64_t sub_1BBBC3E90(void *a1)
{
  return EncryptedData.encode(to:)(a1);
}

uint64_t sub_1BBBC3EA8(void *a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = a1[1];
  unsigned int v7 = a6;
  unint64_t v8 = a5;
  uint64_t v9 = a4;
  switch(v6 >> 62)
  {
    case 1uLL:
      *(void *)&long long v39 = *a1;
      *((void *)&v39 + 1) = v6 & 0x3FFFFFFFFFFFFFFFLL;
      sub_1BBBB67CC(a4, a5);
      sub_1BBBB67CC(a2, a3);
      sub_1BBBC4344((int *)&v39, a2, a3, v9, v8, v7);
      sub_1BBBB6774(a2, a3);
      uint64_t v19 = *((void *)&v39 + 1) | 0x4000000000000000;
      *a1 = v39;
      a1[1] = v19;
      return sub_1BBBB6774(v9, v8);
    case 2uLL:
      unsigned int v33 = a6;
      *(void *)&long long v39 = *a1;
      *((void *)&v39 + 1) = v6 & 0x3FFFFFFFFFFFFFFFLL;
      sub_1BBBB67CC(a2, a3);
      sub_1BBBEACC8();
      uint64_t v20 = *((void *)&v39 + 1);
      uint64_t v21 = *(void *)(v39 + 16);
      uint64_t v36 = *(void *)(v39 + 24);
      uint64_t v22 = sub_1BBBEAC18();
      if (!v22)
      {
        sub_1BBBB6774(a2, a3);
        __break(1u);
        JUMPOUT(0x1BBBC41E4);
      }
      uint64_t v23 = v22;
      uint64_t v24 = sub_1BBBEAC48();
      uint64_t v25 = v21 - v24;
      if (__OFSUB__(v21, v24))
      {
        __break(1u);
LABEL_14:
        __break(1u);
      }
      BOOL v26 = __OFSUB__(v36, v21);
      uint64_t v27 = v36 - v21;
      if (v26) {
        goto LABEL_14;
      }
      uint64_t v28 = sub_1BBBEAC38();
      if (v28 >= v27) {
        uint64_t v29 = v27;
      }
      else {
        uint64_t v29 = v28;
      }
      uint64_t v30 = (void *)(v23 + v25);
      uint64_t v31 = v23 + v25 + v29;
      uint64_t v9 = a4;
      unint64_t v8 = a5;
      sub_1BBBC0BAC(v30, v31, a2, a3, a4, a5, v33);
      sub_1BBBB6774(a2, a3);
      sub_1BBBB6774(a2, a3);
      *a1 = v39;
      a1[1] = v20 | 0x8000000000000000;
      return sub_1BBBB6774(v9, v8);
    case 3uLL:
      *(void *)((char *)&v39 + 7) = 0;
      *(void *)&long long v39 = 0;
      sub_1BBBC0BAC(&v39, (uint64_t)&v39, a2, a3, a4, a5, a6);
      sub_1BBBB6774(a2, a3);
      return sub_1BBBB6774(v9, v8);
    default:
      *(void *)&long long v39 = *a1;
      WORD4(v39) = v6;
      BYTE10(v39) = BYTE2(v6);
      BYTE11(v39) = BYTE3(v6);
      BYTE12(v39) = BYTE4(v6);
      BYTE13(v39) = BYTE5(v6);
      BYTE14(v39) = BYTE6(v6);
      sub_1BBBC0BAC(&v39, (uint64_t)&v39 + BYTE6(v6), a2, a3, a4, a5, a6);
      uint64_t v35 = v39;
      unint64_t v37 = v8;
      uint64_t v13 = v9;
      uint64_t v14 = DWORD2(v39);
      uint64_t v15 = BYTE12(v39);
      uint64_t v16 = BYTE13(v39);
      uint64_t v17 = BYTE14(v39);
      sub_1BBBB6774(a2, a3);
      uint64_t v18 = v14 | (v15 << 32);
      uint64_t v9 = v13;
      unint64_t v8 = v37;
      *a1 = v35;
      a1[1] = v18 | (v16 << 40) | (v17 << 48);
      return sub_1BBBB6774(v9, v8);
  }
}

uint64_t sub_1BBBC41F4(int *a1, CC_SHA256_CTX *a2)
{
  uint64_t result = sub_1BBBEACD8();
  uint64_t v5 = *a1;
  if (a1[1] < (int)v5)
  {
    __break(1u);
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  uint64_t result = sub_1BBBEAC18();
  if (result)
  {
    uint64_t v6 = result;
    uint64_t result = sub_1BBBEAC48();
    BOOL v7 = __OFSUB__(v5, result);
    uint64_t v8 = v5 - result;
    if (!v7)
    {
      sub_1BBBEAC38();
      return CC_SHA256_Final((unsigned __int8 *)(v6 + v8), a2);
    }
    goto LABEL_6;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_1BBBC427C(int *a1, uint64_t a2, unint64_t a3)
{
  uint64_t result = sub_1BBBEACD8();
  uint64_t v7 = *a1;
  uint64_t v8 = a1[1];
  if ((int)v8 < (int)v7)
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t result = sub_1BBBEAC18();
  if (!result)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  uint64_t v9 = result;
  uint64_t result = sub_1BBBEAC48();
  uint64_t v10 = v7 - result;
  if (__OFSUB__(v7, result))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v11 = v8 - v7;
  uint64_t v12 = sub_1BBBEAC38();
  if (v12 >= v11) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v12;
  }
  sub_1BBBBF9C8((unsigned __int8 *)(v9 + v10), v9 + v10 + v13, a2, a3);
  return sub_1BBBB6774(a2, a3);
}

uint64_t sub_1BBBC4344(int *a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5, unsigned int a6)
{
  uint64_t result = sub_1BBBEACD8();
  uint64_t v13 = *a1;
  uint64_t v14 = a1[1];
  if ((int)v14 < (int)v13)
  {
    __break(1u);
    goto LABEL_9;
  }
  unsigned int v20 = a6;
  uint64_t result = sub_1BBBEAC18();
  if (!result)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  uint64_t v15 = result;
  uint64_t result = sub_1BBBEAC48();
  uint64_t v16 = v13 - result;
  if (__OFSUB__(v13, result))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v17 = v14 - v13;
  uint64_t v18 = sub_1BBBEAC38();
  if (v18 >= v17) {
    uint64_t v19 = v17;
  }
  else {
    uint64_t v19 = v18;
  }
  sub_1BBBC0BAC((void *)(v15 + v16), v15 + v16 + v19, a2, a3, a4, a5, v20);
  sub_1BBBB6774(a2, a3);
  return sub_1BBBB6774(a4, a5);
}

uint64_t sub_1BBBC443C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, char a6, void *a7)
{
  uint64_t result = sub_1BBBEAC18();
  uint64_t v14 = (char *)result;
  if (result)
  {
    uint64_t result = sub_1BBBEAC48();
    if (__OFSUB__(a1, result))
    {
LABEL_13:
      __break(1u);
      return result;
    }
    v14 += a1 - result;
  }
  BOOL v15 = __OFSUB__(a2, a1);
  uint64_t v16 = a2 - a1;
  if (v15)
  {
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v17 = sub_1BBBEAC38();
  if (v17 >= v16) {
    uint64_t v18 = v16;
  }
  else {
    uint64_t v18 = v17;
  }
  uint64_t v19 = &v14[v18];
  if (v14) {
    uint64_t v20 = (uint64_t)v19;
  }
  else {
    uint64_t v20 = 0;
  }
  sub_1BBBC0EAC(v14, v20, a4, a5, a6, a7);
  return sub_1BBBB6774(a4, a5);
}

void *sub_1BBBC4520(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  return sub_1BBBC5648(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, (void *(*)(uint64_t *__return_ptr, void *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1BBBC0790);
}

uint64_t sub_1BBBC4560(uint64_t *a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, unint64_t a7, char *a8, uint64_t a9)
{
  uint64_t v10 = a9;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = *a1;
  unint64_t v11 = a1[1];
  uint64_t v13 = a8;
  switch(v11 >> 62)
  {
    case 1uLL:
      uint64_t v25 = v11 & 0x3FFFFFFFFFFFFFFFLL;
      *(_OWORD *)a1 = xmmword_1BBBECEA0;
      sub_1BBBB67CC(a2, a3);
      sub_1BBBB67CC(a4, a5);
      sub_1BBBB67CC(a6, a7);
      sub_1BBBB67CC(a2, a3);
      sub_1BBBB67CC(a4, a5);
      sub_1BBBB67CC(a6, a7);
      uint64_t v43 = v25;
      uint64_t v10 = v12 >> 32;
      if (swift_isUniquelyReferenced_nonNull_native()) {
        goto LABEL_18;
      }
      long long v39 = v13;
      if (v10 < (int)v12) {
        goto LABEL_24;
      }
      if (sub_1BBBEAC18() && __OFSUB__((int)v12, sub_1BBBEAC48())) {
        goto LABEL_25;
      }
      sub_1BBBEAC58();
      swift_allocObject();
      uint64_t v36 = sub_1BBBEABF8();
      swift_release();
      uint64_t v43 = v36;
      uint64_t v13 = v39;
LABEL_18:
      if (v10 < (int)v12)
      {
        __break(1u);
LABEL_24:
        __break(1u);
LABEL_25:
        __break(1u);
      }
      sub_1BBBB67CC(a2, a3);
      sub_1BBBB67CC(a4, a5);
      sub_1BBBB67CC(a6, a7);
      unint64_t v37 = sub_1BBBC5744((int)v12, v10, v43, a2, a3, a4, a5, a6, a7, (uint64_t)v13, a9, (void *(*)(uint64_t *__return_ptr, char *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1BBBBFFF0);
      if (!v9) {
        uint64_t v10 = (uint64_t)v37;
      }
      sub_1BBBB6774(a6, a7);
      sub_1BBBB6774(a4, a5);
      sub_1BBBB6774(a2, a3);
      sub_1BBBB6774(a2, a3);
      sub_1BBBB6774(a4, a5);
      sub_1BBBB6774(a6, a7);
      sub_1BBBB6774(a2, a3);
      sub_1BBBB6774(a4, a5);
      *a1 = v12;
      a1[1] = v43 | 0x4000000000000000;
LABEL_22:
      sub_1BBBB6774(a6, a7);
      return v10;
    case 2uLL:
      *(void *)&long long v50 = *a1;
      *((void *)&v50 + 1) = v11 & 0x3FFFFFFFFFFFFFFFLL;
      sub_1BBBB67CC(a2, a3);
      sub_1BBBB67CC(a4, a5);
      sub_1BBBB67CC(a6, a7);
      sub_1BBBB67CC(a2, a3);
      sub_1BBBB67CC(a4, a5);
      sub_1BBBB67CC(a6, a7);
      uint64_t v40 = (uint64_t)v13;
      sub_1BBBEACC8();
      unint64_t v26 = a7;
      uint64_t v27 = *(void *)(v50 + 16);
      uint64_t v28 = *(void *)(v50 + 24);
      sub_1BBBB67CC(a2, a3);
      sub_1BBBB67CC(a4, a5);
      sub_1BBBB67CC(a6, v26);
      uint64_t v29 = v28;
      uint64_t v30 = *((void *)&v50 + 1);
      uint64_t v31 = sub_1BBBC5744(v27, v29, *((uint64_t *)&v50 + 1), a2, a3, a4, a5, a6, v26, v40, a9, (void *(*)(uint64_t *__return_ptr, char *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1BBBBFFF0);
      if (!v9) {
        uint64_t v10 = (uint64_t)v31;
      }
      sub_1BBBB6774(a6, v26);
      sub_1BBBB6774(a4, a5);
      sub_1BBBB6774(a2, a3);
      sub_1BBBB6774(a2, a3);
      sub_1BBBB6774(a4, a5);
      sub_1BBBB6774(a6, v26);
      sub_1BBBB6774(a2, a3);
      sub_1BBBB6774(a4, a5);
      *a1 = v50;
      a1[1] = v30 | 0x8000000000000000;
      a7 = v26;
      goto LABEL_22;
    case 3uLL:
      *(void *)((char *)&v50 + 7) = 0;
      *(void *)&long long v50 = 0;
      sub_1BBBB67CC(a2, a3);
      sub_1BBBB67CC(a4, a5);
      sub_1BBBB67CC(a6, a7);
      sub_1BBBBFFF0((uint64_t)&v50, (uint64_t)&v50, a2, a3, a4, a5, a6, a7, &v49, v13, a9);
      sub_1BBBB6774(a2, a3);
      sub_1BBBB6774(a4, a5);
      if (!v9) {
        uint64_t v10 = v49;
      }
      goto LABEL_22;
    default:
      *(void *)&long long v50 = *a1;
      WORD4(v50) = v11;
      BYTE10(v50) = BYTE2(v11);
      BYTE11(v50) = BYTE3(v11);
      BYTE12(v50) = BYTE4(v11);
      BYTE13(v50) = BYTE5(v11);
      BYTE14(v50) = BYTE6(v11);
      uint64_t v20 = (char *)&v50 + BYTE6(v11);
      sub_1BBBB67CC(a2, a3);
      sub_1BBBB67CC(a4, a5);
      sub_1BBBB67CC(a6, a7);
      unint64_t v41 = a7;
      unint64_t v42 = a5;
      sub_1BBBBFFF0((uint64_t)&v50, (uint64_t)v20, a2, a3, a4, a5, a6, a7, &v49, a8, a9);
      if (v9)
      {
        uint64_t v21 = v50;
        uint64_t v22 = DWORD2(v50);
        uint64_t v10 = BYTE12(v50);
        uint64_t v23 = BYTE13(v50);
        uint64_t v24 = BYTE14(v50);
        sub_1BBBB6774(a2, a3);
        sub_1BBBB6774(a4, v42);
        *a1 = v21;
        a1[1] = v22 | (v10 << 32) | (v23 << 40) | (v24 << 48);
      }
      else
      {
        uint64_t v10 = v49;
        uint64_t v32 = v50;
        uint64_t v33 = DWORD2(v50);
        uint64_t v47 = BYTE12(v50);
        uint64_t v34 = BYTE13(v50);
        uint64_t v35 = BYTE14(v50);
        sub_1BBBB6774(a2, a3);
        sub_1BBBB6774(a4, v42);
        *a1 = v32;
        a1[1] = v33 | (v47 << 32) | (v34 << 40) | (v35 << 48);
      }
      a7 = v41;
      goto LABEL_22;
  }
}

uint64_t sub_1BBBC4CD8(uint64_t *a1, uint64_t *a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, unint64_t a8)
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = *a1;
  unint64_t v8 = a1[1];
  switch(v8 >> 62)
  {
    case 1uLL:
      uint64_t v29 = v8 & 0x3FFFFFFFFFFFFFFFLL;
      *(_OWORD *)a1 = xmmword_1BBBECEA0;
      sub_1BBBB67CC(a3, a4);
      sub_1BBBB67CC(a5, a6);
      sub_1BBBB67CC(a7, a8);
      sub_1BBBB67CC(a3, a4);
      sub_1BBBB67CC(a5, a6);
      sub_1BBBB67CC(a7, a8);
      uint64_t v65 = v29;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v31 = (int)v9;
      uint64_t v32 = v9 >> 32;
      uint64_t v62 = a7;
      if (isUniquelyReferenced_nonNull_native) {
        goto LABEL_18;
      }
      if (v32 < (int)v9) {
        goto LABEL_31;
      }
      if (sub_1BBBEAC18() && __OFSUB__((int)v9, sub_1BBBEAC48())) {
        goto LABEL_32;
      }
      sub_1BBBEAC58();
      swift_allocObject();
      uint64_t v44 = sub_1BBBEABF8();
      swift_release();
      uint64_t v31 = (int)v9;
      uint64_t v65 = v44;
      uint64_t v32 = v9 >> 32;
LABEL_18:
      uint64_t v45 = v32 - v31;
      if (v32 < v31) {
        goto LABEL_28;
      }
      uint64_t v56 = v31;
      sub_1BBBB67CC(a3, a4);
      sub_1BBBB67CC(a5, a6);
      unint64_t v61 = a8;
      sub_1BBBB67CC(a7, a8);
      uint64_t v46 = sub_1BBBEAC18();
      if (!v46) {
        goto LABEL_34;
      }
      uint64_t v47 = v46;
      uint64_t v48 = sub_1BBBEAC48();
      uint64_t v49 = v56 - v48;
      if (__OFSUB__(v56, v48)) {
        goto LABEL_30;
      }
      uint64_t v50 = sub_1BBBEAC38();
      if (v50 >= v45) {
        uint64_t v51 = v45;
      }
      else {
        uint64_t v51 = v50;
      }
      uint64_t v52 = (char *)(v47 + v49);
      uint64_t v53 = v47 + v49 + v51;
      sub_1BBBB67CC(a3, a4);
      sub_1BBBB67CC(a5, a6);
      a8 = v61;
      a7 = v62;
      sub_1BBBB67CC(v62, v61);
      uint64_t v26 = sub_1BBBC4560(a2, a3, a4, a5, a6, v62, v61, v52, v53);
      sub_1BBBB6774(v62, v61);
      sub_1BBBB6774(a5, a6);
      sub_1BBBB6774(a3, a4);
      sub_1BBBB6774(v62, v61);
      sub_1BBBB6774(a5, a6);
      sub_1BBBB6774(a3, a4);
      sub_1BBBB6774(a3, a4);
      sub_1BBBB6774(a5, a6);
      sub_1BBBB6774(v62, v61);
      sub_1BBBB6774(a3, a4);
      sub_1BBBB6774(a5, a6);
      uint64_t v27 = a1;
      unint64_t v25 = v65 | 0x4000000000000000;
      *a1 = v9;
      goto LABEL_25;
    case 2uLL:
      *(void *)&long long v70 = *a1;
      *((void *)&v70 + 1) = v8 & 0x3FFFFFFFFFFFFFFFLL;
      sub_1BBBB67CC(a3, a4);
      sub_1BBBB67CC(a5, a6);
      sub_1BBBB67CC(a7, a8);
      sub_1BBBB67CC(a3, a4);
      sub_1BBBB67CC(a5, a6);
      sub_1BBBB67CC(a7, a8);
      sub_1BBBEACC8();
      uint64_t v55 = v9;
      uint64_t v33 = *(void *)(v9 + 16);
      uint64_t v66 = *(void *)(v9 + 24);
      sub_1BBBB67CC(a3, a4);
      sub_1BBBB67CC(a5, a6);
      uint64_t v63 = a7;
      sub_1BBBB67CC(a7, a8);
      uint64_t v34 = sub_1BBBEAC18();
      if (!v34)
      {
        __break(1u);
LABEL_34:
        __break(1u);
        JUMPOUT(0x1BBBC53ACLL);
      }
      uint64_t v35 = v34;
      uint64_t v36 = sub_1BBBEAC48();
      uint64_t v37 = v33 - v36;
      if (__OFSUB__(v33, v36))
      {
        __break(1u);
LABEL_28:
        __break(1u);
        goto LABEL_29;
      }
      BOOL v38 = __OFSUB__(v66, v33);
      uint64_t v39 = v66 - v33;
      if (v38)
      {
LABEL_29:
        __break(1u);
LABEL_30:
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
      }
      uint64_t v40 = sub_1BBBEAC38();
      if (v40 >= v39) {
        uint64_t v41 = v39;
      }
      else {
        uint64_t v41 = v40;
      }
      unint64_t v42 = (char *)(v35 + v37);
      uint64_t v43 = v35 + v37 + v41;
      sub_1BBBB67CC(a3, a4);
      sub_1BBBB67CC(a5, a6);
      a7 = v63;
      sub_1BBBB67CC(v63, a8);
      uint64_t v26 = sub_1BBBC4560(a2, a3, a4, a5, a6, v63, a8, v42, v43);
      sub_1BBBB6774(v63, a8);
      sub_1BBBB6774(a5, a6);
      sub_1BBBB6774(a3, a4);
      sub_1BBBB6774(v63, a8);
      sub_1BBBB6774(a5, a6);
      sub_1BBBB6774(a3, a4);
      sub_1BBBB6774(a3, a4);
      sub_1BBBB6774(a5, a6);
      sub_1BBBB6774(v63, a8);
      sub_1BBBB6774(a3, a4);
      sub_1BBBB6774(a5, a6);
      uint64_t v28 = v55;
      unint64_t v25 = *((void *)&v70 + 1) | 0x8000000000000000;
      uint64_t v27 = a1;
LABEL_15:
      *uint64_t v27 = v28;
LABEL_25:
      v27[1] = v25;
LABEL_26:
      sub_1BBBB6774(a7, a8);
      return v26;
    case 3uLL:
      *(void *)((char *)&v70 + 7) = 0;
      *(void *)&long long v70 = 0;
      sub_1BBBB67CC(a3, a4);
      sub_1BBBB67CC(a5, a6);
      sub_1BBBB67CC(a7, a8);
      uint64_t v26 = sub_1BBBC4560(a2, a3, a4, a5, a6, a7, a8, (char *)&v70, (uint64_t)&v70);
      sub_1BBBB6774(a3, a4);
      sub_1BBBB6774(a5, a6);
      goto LABEL_26;
    default:
      *(void *)&long long v70 = *a1;
      WORD4(v70) = v8;
      BYTE10(v70) = BYTE2(v8);
      BYTE11(v70) = BYTE3(v8);
      BYTE12(v70) = BYTE4(v8);
      BYTE13(v70) = BYTE5(v8);
      BYTE14(v70) = BYTE6(v8);
      uint64_t v18 = (char *)&v70 + BYTE6(v8);
      sub_1BBBB67CC(a3, a4);
      sub_1BBBB67CC(a5, a6);
      sub_1BBBB67CC(a7, a8);
      unsigned int v64 = sub_1BBBC4560(a2, a3, a4, a5, a6, a7, a8, (char *)&v70, (uint64_t)v18);
      uint64_t v57 = v70;
      unint64_t v60 = a8;
      uint64_t v19 = DWORD2(v70);
      uint64_t v20 = BYTE12(v70);
      uint64_t v21 = BYTE13(v70);
      uint64_t v22 = a7;
      uint64_t v23 = BYTE14(v70);
      sub_1BBBB6774(a3, a4);
      sub_1BBBB6774(a5, a6);
      uint64_t v24 = v19 | (v20 << 32) | (v21 << 40);
      a8 = v60;
      unint64_t v25 = v24 | (v23 << 48);
      a7 = v22;
      uint64_t v26 = v64;
      uint64_t v27 = a1;
      uint64_t v28 = v57;
      goto LABEL_15;
  }
}

unint64_t sub_1BBBC53BC()
{
  unint64_t result = qword_1E9F83720;
  if (!qword_1E9F83720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F83720);
  }
  return result;
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

unint64_t sub_1BBBC5460()
{
  unint64_t result = qword_1EB9F7248;
  if (!qword_1EB9F7248)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9F7248);
  }
  return result;
}

unint64_t sub_1BBBC54B4()
{
  unint64_t result = qword_1EB9F7240;
  if (!qword_1EB9F7240)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9F7240);
  }
  return result;
}

void *sub_1BBBC5508(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  return sub_1BBBC5648(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, (void *(*)(uint64_t *__return_ptr, void *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1BBBC3B18);
}

uint64_t sub_1BBBC5548(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, unint64_t a7, char *a8, uint64_t a9, uint64_t a10, uint64_t a11, void (*a12)(int *__return_ptr, void *, char *, uint64_t, unint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t), uint64_t (*a13)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t))
{
  uint64_t result = sub_1BBBEAC18();
  uint64_t v21 = result;
  if (result)
  {
    uint64_t result = sub_1BBBEAC48();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }
    v21 += a1 - result;
  }
  BOOL v22 = __OFSUB__(a2, a1);
  uint64_t v23 = a2 - a1;
  if (v22)
  {
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v24 = sub_1BBBEAC38();
  if (v24 >= v23) {
    uint64_t v25 = v23;
  }
  else {
    uint64_t v25 = v24;
  }
  uint64_t v26 = v21 + v25;
  if (v21) {
    uint64_t v27 = v26;
  }
  else {
    uint64_t v27 = 0;
  }
  uint64_t result = sub_1BBBC379C(v21, v27, a4, a5, a6, a7, a8, a9, &v29, a10, a11, a12, a13);
  if (!v13) {
    return v29;
  }
  return result;
}

void *sub_1BBBC5648(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *(*a12)(uint64_t *__return_ptr, void *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t result = (void *)sub_1BBBEAC18();
  uint64_t v20 = result;
  if (result)
  {
    uint64_t result = (void *)sub_1BBBEAC48();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }
    uint64_t v20 = (void *)((char *)v20 + a1 - (void)result);
  }
  BOOL v21 = __OFSUB__(a2, a1);
  uint64_t v22 = a2 - a1;
  if (v21)
  {
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v23 = sub_1BBBEAC38();
  if (v23 >= v22) {
    uint64_t v24 = v22;
  }
  else {
    uint64_t v24 = v23;
  }
  uint64_t v25 = (char *)v20 + v24;
  if (v20) {
    uint64_t v26 = v25;
  }
  else {
    uint64_t v26 = 0;
  }
  uint64_t result = a12(&v28, v20, v26, a4, a5, a6, a7, a8, a9, a10, a11);
  if (!v12) {
    return (void *)v28;
  }
  return result;
}

char *sub_1BBBC5744(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *(*a12)(uint64_t *__return_ptr, char *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t result = (char *)sub_1BBBEAC18();
  if (!result) {
    goto LABEL_12;
  }
  uint64_t v19 = result;
  uint64_t result = (char *)sub_1BBBEAC48();
  uint64_t v20 = a1 - (void)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  BOOL v21 = __OFSUB__(a2, a1);
  uint64_t v22 = a2 - a1;
  if (v21)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  uint64_t v23 = sub_1BBBEAC38();
  if (v23 >= v22) {
    uint64_t v24 = v22;
  }
  else {
    uint64_t v24 = v23;
  }
  uint64_t result = (char *)a12(&v27, &v19[v20], &v19[v20 + v24], a4, a5, a6, a7, a8, a9, a10, a11);
  if (!v12) {
    return (char *)v27;
  }
  return result;
}

uint64_t sub_1BBBC5838(uint64_t *a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8, unint64_t a9)
{
  unint64_t v9 = a9;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = *a1;
  unint64_t v10 = a1[1];
  switch(v10 >> 62)
  {
    case 1uLL:
      uint64_t v38 = v10 & 0x3FFFFFFFFFFFFFFFLL;
      *(_OWORD *)a1 = xmmword_1BBBECEA0;
      sub_1BBBB67CC(a2, a3);
      sub_1BBBB67CC(a4, a5);
      sub_1BBBB67CC(a6, a7);
      sub_1BBBB67CC(a8, a9);
      uint64_t v22 = v38;
      sub_1BBBB67CC(a8, a9);
      sub_1BBBB67CC(a2, a3);
      sub_1BBBB67CC(a4, a5);
      sub_1BBBB67CC(a6, a7);
      uint64_t v23 = v11 >> 32;
      if (swift_isUniquelyReferenced_nonNull_native()) {
        goto LABEL_18;
      }
      if (v23 < (int)v11) {
        goto LABEL_25;
      }
      if (sub_1BBBEAC18() && __OFSUB__((int)v11, sub_1BBBEAC48())) {
        goto LABEL_26;
      }
      sub_1BBBEAC58();
      swift_allocObject();
      uint64_t v35 = sub_1BBBEABF8();
      swift_release();
      uint64_t v22 = v35;
      unint64_t v9 = a9;
LABEL_18:
      if (v23 < (int)v11)
      {
        __break(1u);
LABEL_25:
        __break(1u);
LABEL_26:
        __break(1u);
      }
      sub_1BBBB67CC(a8, v9);
      sub_1BBBB67CC(a2, a3);
      sub_1BBBB67CC(a4, a5);
      sub_1BBBB67CC(a6, a7);
      uint64_t v41 = v22;
      uint64_t v36 = sub_1BBBC5744((int)v11, v23, v22, a2, a3, a4, a5, a6, a7, a8, v9, (void *(*)(uint64_t *__return_ptr, char *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1BBBC18A8);
      if (v48)
      {
        uint64_t v20 = a8;
        unint64_t v9 = a9;
        sub_1BBBB6774(a8, a9);
        sub_1BBBB6774(a6, a7);
        sub_1BBBB6774(a4, a5);
        sub_1BBBB6774(a2, a3);
        sub_1BBBB6774(a2, a3);
        sub_1BBBB6774(a4, a5);
        sub_1BBBB6774(a6, a7);
        sub_1BBBB6774(a8, a9);
        sub_1BBBB6774(a2, a3);
        *a1 = v11;
        a1[1] = v41 | 0x4000000000000000;
        goto LABEL_23;
      }
      uint64_t v20 = (uint64_t)v36;
      unint64_t v9 = a9;
      sub_1BBBB6774(a8, a9);
      sub_1BBBB6774(a6, a7);
      sub_1BBBB6774(a4, a5);
      sub_1BBBB6774(a2, a3);
      sub_1BBBB6774(a2, a3);
      sub_1BBBB6774(a4, a5);
      sub_1BBBB6774(a6, a7);
      sub_1BBBB6774(a8, a9);
      sub_1BBBB6774(a2, a3);
      unint64_t v33 = v41 | 0x4000000000000000;
      uint64_t v34 = a1;
      uint64_t v32 = v11;
      goto LABEL_22;
    case 2uLL:
      *(void *)&long long v53 = *a1;
      *((void *)&v53 + 1) = v10 & 0x3FFFFFFFFFFFFFFFLL;
      sub_1BBBB67CC(a2, a3);
      sub_1BBBB67CC(a4, a5);
      sub_1BBBB67CC(a6, a7);
      sub_1BBBB67CC(a8, a9);
      sub_1BBBB67CC(a8, a9);
      sub_1BBBB67CC(a2, a3);
      sub_1BBBB67CC(a4, a5);
      sub_1BBBB67CC(a6, a7);
      sub_1BBBEACC8();
      uint64_t v44 = *(void *)(v11 + 16);
      uint64_t v39 = *(void *)(v11 + 24);
      sub_1BBBB67CC(a8, a9);
      sub_1BBBB67CC(a2, a3);
      sub_1BBBB67CC(a4, a5);
      sub_1BBBB67CC(a6, a7);
      uint64_t v24 = v39;
      uint64_t v40 = *((void *)&v53 + 1);
      uint64_t v25 = sub_1BBBC5744(v44, v24, *((uint64_t *)&v53 + 1), a2, a3, a4, a5, a6, a7, a8, a9, (void *(*)(uint64_t *__return_ptr, char *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1BBBC18A8);
      if (v48)
      {
        uint64_t v20 = a8;
        sub_1BBBB6774(a8, a9);
        sub_1BBBB6774(a6, a7);
        sub_1BBBB6774(a4, a5);
        sub_1BBBB6774(a2, a3);
        sub_1BBBB6774(a2, a3);
        sub_1BBBB6774(a4, a5);
        sub_1BBBB6774(a6, a7);
        sub_1BBBB6774(a8, a9);
        sub_1BBBB6774(a2, a3);
        *a1 = v11;
        a1[1] = v40 | 0x8000000000000000;
      }
      else
      {
        uint64_t v20 = (uint64_t)v25;
        sub_1BBBB6774(a8, a9);
        sub_1BBBB6774(a6, a7);
        sub_1BBBB6774(a4, a5);
        sub_1BBBB6774(a2, a3);
        sub_1BBBB6774(a2, a3);
        sub_1BBBB6774(a4, a5);
        sub_1BBBB6774(a6, a7);
        sub_1BBBB6774(a8, a9);
        sub_1BBBB6774(a2, a3);
        uint64_t v32 = v11;
        unint64_t v33 = *((void *)&v53 + 1) | 0x8000000000000000;
        uint64_t v34 = a1;
LABEL_22:
        *uint64_t v34 = v32;
        v34[1] = v33;
      }
LABEL_23:
      sub_1BBBB6774(a4, a5);
      sub_1BBBB6774(a6, a7);
      sub_1BBBB6774(a8, v9);
      return v20;
    case 3uLL:
      *(void *)((char *)&v53 + 7) = 0;
      *(void *)&long long v53 = 0;
      uint64_t v20 = a8;
      sub_1BBBB67CC(a8, a9);
      sub_1BBBB67CC(a2, a3);
      sub_1BBBB67CC(a4, a5);
      sub_1BBBB67CC(a6, a7);
      sub_1BBBC18A8((uint64_t)&v53, (uint64_t)&v53, a2, a3, a4, a5, a6, a7, &v52, a8, a9);
      sub_1BBBB6774(a2, a3);
      if (!v48) {
        uint64_t v20 = v52;
      }
      goto LABEL_23;
    default:
      *(void *)&long long v53 = *a1;
      WORD4(v53) = v10;
      BYTE10(v53) = BYTE2(v10);
      BYTE11(v53) = BYTE3(v10);
      BYTE12(v53) = BYTE4(v10);
      BYTE13(v53) = BYTE5(v10);
      BYTE14(v53) = BYTE6(v10);
      uint64_t v16 = (char *)&v53 + BYTE6(v10);
      sub_1BBBB67CC(a8, a9);
      sub_1BBBB67CC(a2, a3);
      sub_1BBBB67CC(a4, a5);
      sub_1BBBB67CC(a6, a7);
      uint64_t v42 = a4;
      unint64_t v43 = a5;
      sub_1BBBC18A8((uint64_t)&v53, (uint64_t)v16, a2, a3, a4, a5, a6, a7, &v52, a8, a9);
      if (v48)
      {
        uint64_t v17 = v53;
        uint64_t v18 = DWORD2(v53);
        uint64_t v19 = BYTE12(v53);
        uint64_t v20 = BYTE13(v53);
        uint64_t v21 = BYTE14(v53);
        sub_1BBBB6774(a2, a3);
        *a1 = v17;
        a1[1] = v18 | (v19 << 32) | (v20 << 40) | (v21 << 48);
        a5 = v43;
      }
      else
      {
        uint64_t v20 = v52;
        uint64_t v26 = v53;
        uint64_t v27 = DWORD2(v53);
        uint64_t v28 = BYTE12(v53);
        uint64_t v29 = BYTE13(v53);
        uint64_t v30 = BYTE14(v53);
        sub_1BBBB6774(a2, a3);
        uint64_t v31 = v27 | (v28 << 32) | (v29 << 40) | (v30 << 48);
        a5 = v43;
        *a1 = v26;
        a1[1] = v31;
      }
      a4 = v42;
      goto LABEL_23;
  }
}

unint64_t sub_1BBBC6088()
{
  unint64_t result = qword_1E9F83728;
  if (!qword_1E9F83728)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F83728);
  }
  return result;
}

unint64_t sub_1BBBC60E0()
{
  unint64_t result = qword_1E9F83730;
  if (!qword_1E9F83730)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F83730);
  }
  return result;
}

unint64_t sub_1BBBC6138()
{
  unint64_t result = qword_1E9F83738;
  if (!qword_1E9F83738)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F83738);
  }
  return result;
}

unint64_t sub_1BBBC6190()
{
  unint64_t result = qword_1E9F83740;
  if (!qword_1E9F83740)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F83740);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for CryptoError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF4) {
    goto LABEL_17;
  }
  if (a2 + 12 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 12) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 12;
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
      return (*a1 | (v4 << 8)) - 12;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 12;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xD;
  int v8 = v6 - 13;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for CryptoError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 12 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 12) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF3)
  {
    unsigned int v6 = ((a2 - 244) >> 8) + 1;
    *unint64_t result = a2 + 12;
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
        JUMPOUT(0x1BBBC6340);
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
          *unint64_t result = a2 + 12;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CryptoError()
{
  return &type metadata for CryptoError;
}

unsigned char *storeEnumTagSinglePayload for HmacAlgorithm(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *unint64_t result = a2 + 5;
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
        JUMPOUT(0x1BBBC6444);
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
          *unint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HmacAlgorithm()
{
  return &type metadata for HmacAlgorithm;
}

ValueMetadata *type metadata accessor for HashAlgorithm()
{
  return &type metadata for HashAlgorithm;
}

unsigned char *_s8SPShared13HashAlgorithmOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1BBBC6530);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for NSFileHandle.FileHandleHashError()
{
  return &type metadata for NSFileHandle.FileHandleHashError;
}

uint64_t initializeBufferWithCopyOfBuffer for EncryptedData(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for EncryptedData(uint64_t *a1)
{
  sub_1BBBB6774(*a1, a1[1]);
  sub_1BBBB6774(a1[2], a1[3]);
  uint64_t v2 = a1[4];
  unint64_t v3 = a1[5];
  return sub_1BBBB6774(v2, v3);
}

uint64_t *initializeWithCopy for EncryptedData(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  sub_1BBBB67CC(*a2, v5);
  *a1 = v4;
  a1[1] = v5;
  uint64_t v6 = a2[2];
  unint64_t v7 = a2[3];
  sub_1BBBB67CC(v6, v7);
  a1[2] = v6;
  a1[3] = v7;
  uint64_t v9 = a2[4];
  unint64_t v8 = a2[5];
  sub_1BBBB67CC(v9, v8);
  a1[4] = v9;
  a1[5] = v8;
  return a1;
}

uint64_t *assignWithCopy for EncryptedData(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  sub_1BBBB67CC(*a2, v5);
  uint64_t v6 = *a1;
  unint64_t v7 = a1[1];
  *a1 = v4;
  a1[1] = v5;
  sub_1BBBB6774(v6, v7);
  uint64_t v8 = a2[2];
  unint64_t v9 = a2[3];
  sub_1BBBB67CC(v8, v9);
  uint64_t v10 = a1[2];
  unint64_t v11 = a1[3];
  a1[2] = v8;
  a1[3] = v9;
  sub_1BBBB6774(v10, v11);
  uint64_t v13 = a2[4];
  unint64_t v12 = a2[5];
  sub_1BBBB67CC(v13, v12);
  uint64_t v14 = a1[4];
  unint64_t v15 = a1[5];
  a1[4] = v13;
  a1[5] = v12;
  sub_1BBBB6774(v14, v15);
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t *assignWithTake for EncryptedData(uint64_t *a1, _OWORD *a2)
{
  uint64_t v4 = *a1;
  unint64_t v5 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_1BBBB6774(v4, v5);
  uint64_t v6 = a1[2];
  unint64_t v7 = a1[3];
  *((_OWORD *)a1 + 1) = a2[1];
  sub_1BBBB6774(v6, v7);
  uint64_t v8 = a1[4];
  unint64_t v9 = a1[5];
  *((_OWORD *)a1 + 2) = a2[2];
  sub_1BBBB6774(v8, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for EncryptedData(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xD && *(unsigned char *)(a1 + 48)) {
    return (*(_DWORD *)a1 + 13);
  }
  unsigned int v3 = (((*(void *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(void *)(a1 + 8) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for EncryptedData(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 13;
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 48) = 1;
    }
  }
  else
  {
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 48) = 0;
    }
    if (a2)
    {
      *(void *)__n128 result = 0;
      *(void *)(result + 8) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EncryptedData()
{
  return &type metadata for EncryptedData;
}

unint64_t sub_1BBBC6804()
{
  unint64_t result = qword_1E9F83748;
  if (!qword_1E9F83748)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F83748);
  }
  return result;
}

unint64_t sub_1BBBC6858()
{
  unint64_t result = qword_1E9F83750;
  if (!qword_1E9F83750)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F83750);
  }
  return result;
}

uint64_t dispatch thunk of Queueable.identifer.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of Queueable.blocks.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_1BBBC68E4()
{
  uint64_t v0 = sub_1BBBEAE28();
  __swift_allocate_value_buffer(v0, qword_1E9F85868);
  __swift_project_value_buffer(v0, (uint64_t)qword_1E9F85868);
  return sub_1BBBEAE18();
}

uint64_t AsynchronousCache.__allocating_init(timeout:timeoutError:fetchBlock:)(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t v8 = swift_allocObject();
  AsynchronousCache.init(timeout:timeoutError:fetchBlock:)(a1, a2, a3, a4);
  return v8;
}

double *AsynchronousCache.init(timeout:timeoutError:fetchBlock:)(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  unint64_t v5 = v4;
  uint64_t v24 = a2;
  uint64_t v25 = a3;
  double v8 = *v4;
  uint64_t v9 = sub_1BBBEB578();
  MEMORY[0x1F4188790](v9);
  uint64_t v10 = sub_1BBBEB0F8();
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v11 = sub_1BBBEB608();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(qword_1EB9F7438);
  uint64_t v15 = swift_allocObject();
  *(_DWORD *)(v15 + 16) = 0;
  *((void *)v4 + 2) = v15;
  sub_1BBBB4D64(0, (unint64_t *)&qword_1EB9F8340);
  (*(void (**)(char *, void, uint64_t))(v12 + 104))(v14, *MEMORY[0x1E4FBCC68], v11);
  sub_1BBBEB0D8();
  uint64_t v26 = MEMORY[0x1E4FBC860];
  sub_1BBBB8B24();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F8320);
  sub_1BBBB2BC0();
  sub_1BBBEB798();
  *((void *)v4 + 3) = sub_1BBBEB648();
  *((void *)v4 + 4) = sub_1BBBEB188();
  uint64_t v16 = *(void *)(*(void *)v4 + 168);
  uint64_t v17 = *(void *)(*(void *)&v8 + 96);
  sub_1BBBEAF98();
  *(void *)((char *)v5 + v16) = sub_1BBBEB188();
  uint64_t v18 = *(void *)(*(void *)v5 + 176);
  sub_1BBBEBBC8();
  swift_getFunctionTypeMetadata1();
  *(void *)((char *)v5 + v18) = sub_1BBBEB188();
  uint64_t v19 = *(void *)(*(void *)v5 + 184);
  sub_1BBBEAF08();
  *(void *)((char *)v5 + v19) = sub_1BBBEB188();
  v5[5] = a4;
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v17 - 8) + 32))((char *)v5 + *(void *)(*(void *)v5 + 152), a1, v17);
  uint64_t v20 = (void *)((char *)v5 + *(void *)(*(void *)v5 + 160));
  uint64_t v21 = v25;
  *uint64_t v20 = v24;
  v20[1] = v21;
  return v5;
}

uint64_t sub_1BBBC6DC8()
{
  sub_1BBBEAEE8();
  sub_1BBBEADF8();
  return v1;
}

uint64_t sub_1BBBC6E80@<X0>(void *a1@<X0>, char *a2@<X1>, uint64_t *a3@<X8>)
{
  v110 = a3;
  v112 = (void *)*a1;
  unint64_t v5 = v112;
  uint64_t v6 = v112[10];
  uint64_t v113 = *(void *)(v6 - 8);
  uint64_t v7 = MEMORY[0x1F4188790](a1);
  v103 = (char *)v95 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x1F4188790](v7);
  v109 = (char *)v95 - v10;
  v101 = v11;
  MEMORY[0x1F4188790](v9);
  v106 = (char *)v95 - v12;
  uint64_t v13 = v5[11];
  uint64_t v105 = sub_1BBBEB6B8();
  unsigned int v104 = *(char **)(v105 - 8);
  uint64_t v14 = MEMORY[0x1F4188790](v105);
  uint64_t v16 = (char *)v95 - v15;
  uint64_t v17 = *(void *)(v13 - 8);
  uint64_t v18 = MEMORY[0x1F4188790](v14);
  v108 = (uint8_t *)v95 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x1F4188790](v18);
  v111 = (char *)v95 - v21;
  v107 = v22;
  MEMORY[0x1F4188790](v20);
  uint64_t v24 = (char *)v95 - v23;
  swift_beginAccess();
  uint64_t v25 = a1[4];
  uint64_t v26 = v5[13];
  swift_bridgeObjectRetain();
  MEMORY[0x1C1861940](a2, v25, v6, v13, v26);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v16, 1, v13) != 1)
  {
    uint64_t v102 = v26;
    uint64_t v46 = *(void (**)(char *, uint8_t *, uint64_t))(v17 + 32);
    v103 = (char *)(v17 + 32);
    v101 = v46;
    v46(v24, (uint8_t *)v16, v13);
    uint64_t v47 = v17;
    if (qword_1E9F833C0 != -1) {
      swift_once();
    }
    uint64_t v48 = sub_1BBBEAE28();
    __swift_project_value_buffer(v48, (uint64_t)qword_1E9F85868);
    uint64_t v49 = v113;
    uint64_t v50 = *(void (**)(char *, char *, uint64_t))(v113 + 16);
    uint64_t v51 = v106;
    uint64_t v105 = v6;
    uint64_t v99 = v50;
    v50(v106, a2, v6);
    uint64_t v52 = v47 + 16;
    unsigned int v104 = *(char **)(v47 + 16);
    ((void (*)(char *, char *, uint64_t))v104)(v111, v24, v13);
    long long v53 = sub_1BBBEAE08();
    os_log_type_t v54 = sub_1BBBEB528();
    int v55 = v54;
    if (os_log_type_enabled(v53, v54))
    {
      uint64_t v56 = swift_slowAlloc();
      uint64_t v100 = v47;
      uint64_t v57 = v56;
      uint64_t v97 = swift_slowAlloc();
      v116[0] = v97;
      *(_DWORD *)uint64_t v57 = 136315394;
      v95[1] = v57 + 4;
      os_log_t v96 = v53;
      uint64_t v98 = v52;
      uint64_t v58 = v105;
      v99(v109, v51, v105);
      uint64_t v59 = sub_1BBBEB2B8();
      LODWORD(v109) = v55;
      v115[0] = sub_1BBBAC938(v59, v60, v116);
      sub_1BBBEB6C8();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v49 + 8))(v51, v58);
      *(_WORD *)(v57 + 12) = 2080;
      unint64_t v61 = v108;
      uint64_t v62 = v111;
      ((void (*)(uint8_t *, char *, uint64_t))v104)(v108, v111, v13);
      uint64_t v63 = sub_1BBBEB2B8();
      v115[0] = sub_1BBBAC938(v63, v64, v116);
      sub_1BBBEB6C8();
      swift_bridgeObjectRelease();
      uint64_t v113 = *(void *)(v100 + 8);
      ((void (*)(char *, uint64_t))v113)(v62, v13);
      os_log_t v65 = v96;
      _os_log_impl(&dword_1BBBA9000, v96, (os_log_type_t)v109, "already have a cached value for %s -- %s", (uint8_t *)v57, 0x16u);
      uint64_t v66 = v97;
      swift_arrayDestroy();
      MEMORY[0x1C1862BC0](v66, -1, -1);
      uint64_t v67 = v57;
      uint64_t v47 = v100;
      MEMORY[0x1C1862BC0](v67, -1, -1);

      uint64_t v68 = v112;
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v49 + 8))(v51, v105);
      uint64_t v113 = *(void *)(v47 + 8);
      ((void (*)(char *, uint64_t))v113)(v111, v13);

      uint64_t v68 = v112;
      unint64_t v61 = v108;
    }
    uint64_t v69 = v68[12];
    uint64_t v70 = v68[14];
    sub_1BBBEAF98();
    ((void (*)(uint8_t *, char *, uint64_t))v104)(v61, v24, v13);
    unint64_t v71 = (*(unsigned __int8 *)(v47 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v47 + 80);
    uint64_t v72 = (char *)swift_allocObject();
    *((void *)v72 + 2) = v105;
    *((void *)v72 + 3) = v13;
    uint64_t v73 = v102;
    *((void *)v72 + 4) = v69;
    *((void *)v72 + 5) = v73;
    *((void *)v72 + 6) = v70;
    v101(&v72[v71], v61, v13);
    v116[0] = sub_1BBBEAFA8();
    swift_getWitnessTable();
    uint64_t v74 = sub_1BBBEAFC8();
    swift_release();
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v113)(v24, v13);
    goto LABEL_14;
  }
  (*((void (**)(char *, uint64_t))v104 + 1))(v16, v105);
  uint64_t v27 = (void *)((char *)a1 + *(void *)(*a1 + 168));
  swift_beginAccess();
  uint64_t v28 = *v27;
  uint64_t v29 = v112[14];
  v111 = (char *)v112[12];
  uint64_t v30 = sub_1BBBEAF98();
  swift_bridgeObjectRetain();
  MEMORY[0x1C1861940](v115, a2, v28, v6, v30, v26);
  swift_bridgeObjectRelease();
  uint64_t v31 = v115[0];
  v112 = (void *)v30;
  if (!v115[0])
  {
    uint64_t v76 = swift_allocObject();
    *(void *)(v76 + 16) = 0;
    v107 = (uint64_t *)(v76 + 16);
    v108 = (uint8_t *)v76;
    v103 = (char *)swift_allocObject();
    swift_weakInit();
    uint64_t v77 = v113;
    uint64_t v100 = v29;
    uint64_t v78 = *(char **)(v113 + 16);
    uint64_t v105 = v113 + 16;
    v106 = v78;
    ((void (*)(char *, char *, uint64_t))v78)(v109, a2, v6);
    uint64_t v79 = *(unsigned __int8 *)(v77 + 80);
    unsigned int v104 = a2;
    uint64_t v80 = (v79 + 64) & ~v79;
    uint64_t v81 = v6;
    unint64_t v82 = ((unint64_t)v101 + v80 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v83 = (void *)swift_allocObject();
    v83[2] = v81;
    v83[3] = v13;
    v83[4] = v111;
    v83[5] = v26;
    uint64_t v102 = v26;
    uint64_t v84 = v103;
    v83[6] = v100;
    v83[7] = v84;
    uint64_t v85 = (char *)v83 + v80;
    uint64_t v86 = v109;
    uint64_t v87 = v81;
    (*(void (**)(char *, char *, uint64_t))(v77 + 32))(v85, v109, v81);
    *(void *)((char *)v83 + v82) = v108;
    swift_retain();
    uint64_t v88 = sub_1BBBEAFA8();
    v89 = v104;
    uint64_t v90 = (void (*)(char *, uint64_t, uint64_t))v106;
    ((void (*)(char *, char *, uint64_t))v106)(v86, v104, v87);
    uint64_t v114 = v88;
    swift_beginAccess();
    sub_1BBBEB1E8();
    uint64_t v91 = v88;
    swift_retain();
    uint64_t v92 = v109;
    sub_1BBBEB218();
    swift_endAccess();
    v90(v92, (uint64_t)v89, v87);
    uint64_t v93 = v107;
    swift_beginAccess();
    v116[5] = *v93;
    swift_beginAccess();
    sub_1BBBEAF08();
    sub_1BBBEB1E8();
    swift_retain();
    sub_1BBBEB218();
    swift_endAccess();
    uint64_t v114 = v91;
    swift_getWitnessTable();
    uint64_t v74 = sub_1BBBEAFC8();
    swift_release();
    uint64_t result = swift_release();
LABEL_14:
    uint64_t v94 = v110;
    goto LABEL_17;
  }
  uint64_t v32 = v6;
  unint64_t v33 = a2;
  if (qword_1E9F833C0 != -1) {
    swift_once();
  }
  uint64_t v34 = sub_1BBBEAE28();
  __swift_project_value_buffer(v34, (uint64_t)qword_1E9F85868);
  uint64_t v35 = v113;
  uint64_t v36 = *(void (**)(char *, uint64_t, uint64_t))(v113 + 16);
  uint64_t v37 = v103;
  uint64_t v38 = v6;
  v36(v103, (uint64_t)v33, v6);
  uint64_t v39 = sub_1BBBEAE08();
  os_log_type_t v40 = sub_1BBBEB528();
  if (os_log_type_enabled(v39, v40))
  {
    uint64_t v41 = (uint8_t *)swift_slowAlloc();
    v111 = (char *)swift_slowAlloc();
    v115[0] = (uint64_t)v111;
    *(_DWORD *)uint64_t v41 = 136315138;
    v107 = (uint64_t *)(v41 + 4);
    v108 = v41;
    v36(v109, (uint64_t)v37, v38);
    uint64_t v42 = sub_1BBBEB2B8();
    uint64_t v114 = sub_1BBBAC938(v42, v43, v115);
    sub_1BBBEB6C8();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v35 + 8))(v103, v38);
    uint64_t v44 = v108;
    _os_log_impl(&dword_1BBBA9000, v39, v40, "already have a request in-flight for %s -- returning existing future", v108, 0xCu);
    uint64_t v45 = v111;
    swift_arrayDestroy();
    MEMORY[0x1C1862BC0](v45, -1, -1);
    MEMORY[0x1C1862BC0](v44, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v35 + 8))(v37, v32);
  }

  uint64_t v94 = v110;
  v115[0] = v31;
  swift_getWitnessTable();
  uint64_t v74 = sub_1BBBEAFC8();
  uint64_t result = swift_release();
LABEL_17:
  *uint64_t v94 = v74;
  return result;
}

uint64_t sub_1BBBC7BEC@<X0>(uint64_t *a1@<X8>)
{
  return sub_1BBBC6E80(*(void **)(v1 + 16), *(char **)(v1 + 24), a1);
}

uint64_t sub_1BBBC7C08(void (*a1)(char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = sub_1BBBEBBC8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v13 - v10;
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a5 - 8) + 16))((char *)&v13 - v10, a3, a5);
  swift_storeEnumTagMultiPayload();
  a1(v11);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_1BBBC7D3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v74 = a5;
  uint64_t v75 = a4;
  uint64_t v66 = a2;
  uint64_t v61 = a1;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F7978);
  MEMORY[0x1F4188790](v13 - 8);
  uint64_t v72 = (char *)&v53 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = a8;
  uint64_t v76 = a10;
  uint64_t v15 = (void *)sub_1BBBEAEE8();
  uint64_t v16 = sub_1BBBB4D64(255, &qword_1E9F83670);
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v18 = sub_1BBBB4DA0(&qword_1E9F83678, &qword_1E9F83670);
  uint64_t v69 = v15;
  uint64_t v80 = (uint64_t)v15;
  uint64_t v81 = v16;
  uint64_t v67 = WitnessTable;
  uint64_t v82 = WitnessTable;
  uint64_t v83 = v18;
  uint64_t v19 = sub_1BBBEAE98();
  uint64_t v20 = sub_1BBBB4D64(255, (unint64_t *)&qword_1EB9F8340);
  uint64_t v21 = swift_getWitnessTable();
  uint64_t v22 = sub_1BBBB4DA0(&qword_1EB9F8270, (unint64_t *)&qword_1EB9F8340);
  uint64_t v80 = v19;
  uint64_t v81 = v20;
  uint64_t v82 = v21;
  uint64_t v83 = v22;
  uint64_t v23 = sub_1BBBEAED8();
  uint64_t v60 = *(void *)(v23 - 8);
  MEMORY[0x1F4188790](v23);
  uint64_t v63 = (uint64_t)&v53 - v24;
  uint64_t v25 = swift_getWitnessTable();
  uint64_t v80 = v23;
  uint64_t v81 = v20;
  uint64_t v68 = v20;
  uint64_t v62 = v25;
  uint64_t v82 = v25;
  uint64_t v83 = v22;
  uint64_t v64 = v22;
  uint64_t v26 = sub_1BBBEAED8();
  uint64_t v70 = *(void *)(v26 - 8);
  uint64_t v71 = v26;
  uint64_t v27 = MEMORY[0x1F4188790](v26);
  os_log_t v65 = (char *)&v53 - v28;
  uint64_t v29 = a6;
  uint64_t v30 = *(void *)(a6 - 8);
  uint64_t v31 = *(void *)(v30 + 64);
  MEMORY[0x1F4188790](v27);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    unint64_t v33 = (void *)result;
    uint64_t v55 = v23;
    uint64_t v59 = v74 + 16;
    uint64_t v58 = v30;
    uint64_t v56 = *(void (**)(char *, uint64_t, uint64_t))(v30 + 16);
    uint64_t v57 = v30 + 16;
    v56((char *)&v53 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0), v75, v29);
    uint64_t v34 = (void *)swift_allocObject();
    v34[2] = v29;
    v34[3] = a7;
    v34[4] = v73;
    v34[5] = a9;
    uint64_t v54 = a9;
    uint64_t v35 = v61;
    v34[6] = v76;
    v34[7] = v35;
    v34[8] = v66;
    uint64_t v78 = sub_1BBBCB728;
    uint64_t v79 = v34;
    swift_beginAccess();
    sub_1BBBEBBC8();
    swift_getFunctionTypeMetadata1();
    sub_1BBBEB1E8();
    swift_retain();
    uint64_t v36 = (char *)&v53 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_1BBBEB218();
    swift_endAccess();
    uint64_t v37 = v75;
    id v77 = (id)(*(uint64_t (**)(uint64_t))((char *)v33 + *(void *)(*v33 + 160)))(v75);
    uint64_t v38 = (void *)v33[3];
    swift_retain();
    uint64_t v66 = v31;
    uint64_t v39 = v63;
    Publisher.timeout(_:queue:customError:)(v38, (uint64_t)sub_1BBBCB750, (uint64_t)v33, v69, v67, v63);
    swift_release();
    swift_release();
    id v77 = (id)v33[3];
    id v40 = v77;
    uint64_t v41 = sub_1BBBEB5D8();
    uint64_t v42 = (uint64_t)v72;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 56))(v72, 1, 1, v41);
    id v43 = v40;
    uint64_t v44 = v65;
    uint64_t v45 = v55;
    sub_1BBBEB048();
    sub_1BBBCB7AC(v42);

    (*(void (**)(uint64_t, uint64_t))(v60 + 8))(v39, v45);
    v56(v36, v37, v29);
    uint64_t v46 = v58;
    unint64_t v47 = (*(unsigned __int8 *)(v58 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v58 + 80);
    uint64_t v48 = (char *)swift_allocObject();
    *((void *)v48 + 2) = v29;
    *((void *)v48 + 3) = a7;
    uint64_t v49 = v54;
    *((void *)v48 + 4) = v73;
    *((void *)v48 + 5) = v49;
    *((void *)v48 + 6) = v76;
    *((void *)v48 + 7) = v33;
    (*(void (**)(char *, char *, uint64_t))(v46 + 32))(&v48[v47], v36, v29);
    swift_retain();
    uint64_t v50 = v71;
    uint64_t v51 = swift_getWitnessTable();
    uint64_t v52 = Publisher.futureSink(_:)((uint64_t)sub_1BBBCB8D0, (uint64_t)v48, v50, v51);
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v70 + 8))(v44, v50);
    swift_beginAccess();
    *(void *)(v74 + 16) = v52;
    return swift_release();
  }
  return result;
}

uint64_t sub_1BBBC84C0()
{
  sub_1BBBEADF8();
  return v1;
}

uint64_t sub_1BBBC852C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
  uint64_t v77 = a3;
  uint64_t v87 = a2;
  uint64_t v84 = a4;
  uint64_t v79 = (uint8_t *)*a1;
  unint64_t v5 = v79;
  uint64_t v6 = *((void *)v79 + 10);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x1F4188790](a1);
  uint64_t v78 = (char *)&v72 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x1F4188790](v8);
  uint64_t v74 = (char *)&v72 - v11;
  uint64_t v12 = MEMORY[0x1F4188790](v10);
  uint64_t v83 = (char *)&v72 - v13;
  uint64_t v14 = MEMORY[0x1F4188790](v12);
  uint64_t v86 = (char *)&v72 - v15;
  MEMORY[0x1F4188790](v14);
  uint64_t v17 = (char *)&v72 - v16;
  uint64_t v18 = *((void *)v5 + 11);
  uint64_t v85 = (void (*)(char *, uint64_t))sub_1BBBEB6B8();
  uint64_t v19 = *((void *)v85 - 1);
  uint64_t v20 = MEMORY[0x1F4188790](v85);
  uint64_t v76 = (char *)&v72 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v20);
  uint64_t v23 = (char *)&v72 - v22;
  uint64_t v75 = a1 + 4;
  swift_beginAccess();
  uint64_t v24 = a1[4];
  uint64_t v81 = (uint64_t)a1;
  uint64_t v25 = *((void *)v5 + 13);
  swift_bridgeObjectRetain();
  uint64_t v26 = v87;
  uint64_t v82 = v25;
  MEMORY[0x1C1861940](v87, v24, v6, v18, v25);
  swift_bridgeObjectRelease();
  uint64_t v27 = *(void *)(v18 - 8);
  uint64_t v28 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v27 + 48);
  uint64_t v80 = v18;
  LODWORD(v5) = v28(v23, 1, v18);
  (*(void (**)(char *, void *))(v19 + 8))(v23, v85);
  uint64_t v29 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  uint64_t v88 = v6;
  v29(v17, v26, v6);
  if (v5 != 1)
  {
    uint64_t v37 = *(void (**)(char *, uint64_t))(v7 + 8);
    uint64_t v38 = v88;
    v37(v17, v88);
    uint64_t v39 = v86;
    uint64_t v35 = v87;
    v29(v86, v87, v38);
    uint64_t v36 = v39;
    goto LABEL_5;
  }
  uint64_t v73 = v27;
  uint64_t v30 = (uint64_t *)(v81 + *(void *)(*(void *)v81 + 168));
  swift_beginAccess();
  uint64_t v31 = *v30;
  uint64_t v32 = v88;
  uint64_t v79 = (uint8_t *)*((void *)v79 + 14);
  uint64_t v33 = sub_1BBBEAF98();
  swift_bridgeObjectRetain();
  MEMORY[0x1C1861940](v90, v17, v31, v32, v33, v82);
  swift_bridgeObjectRelease();
  uint64_t v85 = *(void (**)(char *, uint64_t))(v7 + 8);
  v85(v17, v32);
  uint64_t v34 = v90[0];
  swift_release();
  uint64_t v35 = v87;
  v29(v86, v87, v32);
  if (v34)
  {
    uint64_t v37 = v85;
    uint64_t v36 = v86;
LABEL_5:
    uint64_t v40 = v88;
    v37(v36, v88);
    uint64_t v41 = v83;
    v29(v83, v35, v40);
    uint64_t v42 = v84;
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v37)(v41, v88);
LABEL_6:
    char v44 = 0;
    goto LABEL_7;
  }
  uint64_t v45 = (uint64_t *)(v81 + *(void *)(*(void *)v81 + 176));
  swift_beginAccess();
  uint64_t v46 = *v45;
  sub_1BBBEBBC8();
  FunctionTypeMetadata1 = swift_getFunctionTypeMetadata1();
  swift_bridgeObjectRetain();
  uint64_t v48 = v86;
  MEMORY[0x1C1861940](v90, v86, v46, v32, FunctionTypeMetadata1, v82);
  swift_bridgeObjectRelease();
  v85(v48, v32);
  uint64_t v49 = v90[0];
  sub_1BBBCB428(v90[0]);
  uint64_t v50 = v83;
  v29(v83, v35, v32);
  if (v49)
  {
    uint64_t v42 = v84;
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v85)(v50, v88);
    goto LABEL_6;
  }
  uint64_t v51 = (uint64_t *)(v81 + *(void *)(*(void *)v81 + 184));
  swift_beginAccess();
  uint64_t v52 = *v51;
  uint64_t v53 = sub_1BBBEAF08();
  swift_bridgeObjectRetain();
  uint64_t v54 = v88;
  MEMORY[0x1C1861940](v89, v50, v52, v88, v53, v82);
  swift_bridgeObjectRelease();
  v85(v50, v54);
  uint64_t v55 = v89[0];
  uint64_t result = swift_release();
  if (v55)
  {
    char v44 = 0;
    uint64_t v42 = v84;
  }
  else
  {
    if (qword_1E9F833C0 != -1) {
      swift_once();
    }
    uint64_t v56 = sub_1BBBEAE28();
    __swift_project_value_buffer(v56, (uint64_t)qword_1E9F85868);
    uint64_t v57 = v74;
    uint64_t v58 = v29;
    v29(v74, v35, v88);
    uint64_t v59 = sub_1BBBEAE08();
    os_log_type_t v60 = sub_1BBBEB518();
    if (os_log_type_enabled(v59, v60))
    {
      uint64_t v83 = (char *)(v7 + 8);
      uint64_t v61 = swift_slowAlloc();
      uint64_t v62 = v88;
      uint64_t v86 = (char *)v29;
      uint64_t v63 = (uint8_t *)v61;
      uint64_t v81 = swift_slowAlloc();
      v89[0] = v81;
      *(_DWORD *)uint64_t v63 = 136315138;
      uint64_t v79 = v63 + 4;
      uint64_t v64 = v78;
      ((void (*)(char *, char *, uint64_t))v86)(v78, v57, v62);
      uint64_t v65 = sub_1BBBEB2B8();
      v90[5] = sub_1BBBAC938(v65, v66, v89);
      sub_1BBBEB6C8();
      swift_bridgeObjectRelease();
      v85(v57, v62);
      _os_log_impl(&dword_1BBBA9000, v59, v60, "Inserting cached value for: %s", v63, 0xCu);
      uint64_t v67 = v81;
      swift_arrayDestroy();
      MEMORY[0x1C1862BC0](v67, -1, -1);
      uint64_t v68 = v63;
      uint64_t v58 = (void (*)(char *, uint64_t, uint64_t))v86;
      MEMORY[0x1C1862BC0](v68, -1, -1);

      uint64_t v42 = v84;
    }
    else
    {
      v85(v57, v88);

      uint64_t v42 = v84;
      uint64_t v64 = v78;
    }
    v58(v64, v87, v88);
    uint64_t v69 = v73;
    uint64_t v70 = v76;
    uint64_t v71 = v80;
    (*(void (**)(char *, uint64_t, uint64_t))(v73 + 16))(v76, v77, v80);
    char v44 = 1;
    (*(void (**)(char *, void, uint64_t, uint64_t))(v69 + 56))(v70, 0, 1, v71);
    swift_beginAccess();
    sub_1BBBEB1E8();
    sub_1BBBEB218();
    uint64_t result = swift_endAccess();
  }
LABEL_7:
  *uint64_t v42 = v44;
  return result;
}

uint64_t sub_1BBBC8EAC@<X0>(char *a1@<X8>)
{
  return sub_1BBBC852C(*(void **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), a1);
}

uint64_t sub_1BBBC8ECC()
{
  return sub_1BBBEADF8();
}

uint64_t sub_1BBBC8F28(char *a1, void *a2)
{
  uint64_t v35 = *a2;
  uint64_t v5 = *(void *)(v35 + 88);
  uint64_t v6 = sub_1BBBEB6B8();
  uint64_t v7 = MEMORY[0x1F4188790](v6 - 8);
  uint64_t v33 = (char *)v27 - v8;
  uint64_t v34 = a2;
  uint64_t v9 = *(void *)(v35 + 80);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v7);
  uint64_t v13 = (char *)v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  uint64_t v15 = (char *)v27 - v14;
  if (qword_1E9F833C0 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_1BBBEAE28();
  __swift_project_value_buffer(v16, (uint64_t)qword_1E9F85868);
  uint64_t v17 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  uint64_t v32 = a1;
  uint64_t v36 = v17;
  v17(v15, a1, v9);
  uint64_t v18 = sub_1BBBEAE08();
  os_log_type_t v19 = sub_1BBBEB518();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v31 = v2;
    uint64_t v21 = (uint8_t *)v20;
    uint64_t v29 = swift_slowAlloc();
    v37[0] = v29;
    uint64_t v30 = v5;
    *(_DWORD *)uint64_t v21 = 136315138;
    v27[1] = v21 + 4;
    uint64_t v28 = v21;
    v36(v13, v15, v9);
    uint64_t v22 = sub_1BBBEB2B8();
    v37[4] = sub_1BBBAC938(v22, v23, v37);
    uint64_t v5 = v30;
    sub_1BBBEB6C8();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
    uint64_t v24 = v28;
    _os_log_impl(&dword_1BBBA9000, v18, v19, "Removing cached value for: %s", v28, 0xCu);
    uint64_t v25 = v29;
    swift_arrayDestroy();
    MEMORY[0x1C1862BC0](v25, -1, -1);
    MEMORY[0x1C1862BC0](v24, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
  }

  v36(v13, v32, v9);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v33, 1, 1, v5);
  swift_beginAccess();
  sub_1BBBEB1E8();
  sub_1BBBEB218();
  return swift_endAccess();
}

uint64_t sub_1BBBC9320()
{
  return sub_1BBBC8F28(*(char **)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_1BBBC933C()
{
  return sub_1BBBEADF8();
}

uint64_t sub_1BBBC9394()
{
  if (qword_1E9F833C0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1BBBEAE28();
  __swift_project_value_buffer(v0, (uint64_t)qword_1E9F85868);
  uint64_t v1 = sub_1BBBEAE08();
  os_log_type_t v2 = sub_1BBBEB518();
  if (os_log_type_enabled(v1, v2))
  {
    unsigned int v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unsigned int v3 = 0;
    _os_log_impl(&dword_1BBBA9000, v1, v2, "Flushing cache.", v3, 2u);
    MEMORY[0x1C1862BC0](v3, -1, -1);
  }

  swift_beginAccess();
  sub_1BBBEB1E8();
  sub_1BBBEB1D8();
  return swift_endAccess();
}

uint64_t sub_1BBBC94EC()
{
  return sub_1BBBC9394();
}

uint64_t sub_1BBBC9508()
{
  return sub_1BBBEADF8();
}

uint64_t sub_1BBBC9568(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v51 = a3;
  uint64_t v52 = a2;
  uint64_t v4 = (void *)*a1;
  uint64_t v5 = *(void *)(*a1 + 88);
  uint64_t v6 = sub_1BBBEB6B8();
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v46 = (char *)&v44 - v7;
  uint64_t v8 = sub_1BBBEBBC8();
  unint64_t v47 = *(uint8_t **)(v8 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v44 - v10;
  uint64_t v45 = *(void *)(v5 - 8);
  uint64_t v12 = MEMORY[0x1F4188790](v9);
  uint64_t v48 = (char *)&v44 - v13;
  uint64_t v14 = v4[10];
  uint64_t v49 = *(void *)(v14 - 8);
  uint64_t v15 = MEMORY[0x1F4188790](v12);
  uint64_t v50 = (char *)&v44 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v15);
  uint64_t v18 = (char *)&v44 - v17;
  os_log_type_t v19 = (uint64_t *)((char *)a1 + v4[22]);
  swift_beginAccess();
  uint64_t v20 = *v19;
  FunctionTypeMetadata1 = swift_getFunctionTypeMetadata1();
  uint64_t v22 = v4[13];
  swift_bridgeObjectRetain();
  MEMORY[0x1C1861940](v53, v52, v20, v14, FunctionTypeMetadata1, v22);
  swift_bridgeObjectRelease();
  unint64_t v23 = (void (*)(uint64_t))v53[0];
  if (v53[0])
  {
    uint64_t v44 = v53[1];
    uint64_t v24 = v47;
    uint64_t v25 = v51;
    (*((void (**)(char *, uint64_t, uint64_t))v47 + 2))(v11, v51, v8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      (*((void (**)(char *, uint64_t))v24 + 1))(v11, v8);
      uint64_t v26 = v52;
    }
    else
    {
      uint64_t v40 = v45;
      uint64_t v41 = v48;
      (*(void (**)(char *, char *, uint64_t))(v45 + 32))(v48, v11, v5);
      uint64_t v26 = v52;
      (*(void (**)(char *, uint64_t, uint64_t))(v49 + 16))(v50, v52, v14);
      uint64_t v42 = v46;
      (*(void (**)(char *, char *, uint64_t))(v40 + 16))(v46, v41, v5);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v40 + 56))(v42, 0, 1, v5);
      swift_beginAccess();
      sub_1BBBEB1E8();
      uint64_t v25 = v51;
      sub_1BBBEB218();
      swift_endAccess();
      (*(void (**)(char *, uint64_t))(v40 + 8))(v48, v5);
    }
    v23(v25);
    sub_1BBBCB428((uint64_t)v23);
  }
  else
  {
    if (qword_1E9F833C0 != -1) {
      swift_once();
    }
    uint64_t v27 = sub_1BBBEAE28();
    __swift_project_value_buffer(v27, (uint64_t)qword_1E9F85868);
    uint64_t v28 = v49;
    uint64_t v29 = *(void (**)(char *, uint64_t, uint64_t))(v49 + 16);
    uint64_t v26 = v52;
    v29(v18, v52, v14);
    uint64_t v30 = sub_1BBBEAE08();
    os_log_type_t v31 = sub_1BBBEB538();
    int v32 = v31;
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v33 = swift_slowAlloc();
      LODWORD(v48) = v32;
      uint64_t v34 = (uint8_t *)v33;
      uint64_t v51 = swift_slowAlloc();
      v53[0] = v51;
      *(_DWORD *)uint64_t v34 = 136315138;
      uint64_t v46 = (char *)(v34 + 4);
      unint64_t v47 = v34;
      uint64_t v35 = v30;
      v29(v50, (uint64_t)v18, v14);
      uint64_t v36 = sub_1BBBEB2B8();
      v53[7] = sub_1BBBAC938(v36, v37, v53);
      sub_1BBBEB6C8();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v28 + 8))(v18, v14);
      uint64_t v38 = v47;
      _os_log_impl(&dword_1BBBA9000, v30, (os_log_type_t)v48, "Expected inFlightPromise for key: %s", v47, 0xCu);
      uint64_t v39 = v51;
      swift_arrayDestroy();
      uint64_t v26 = v52;
      MEMORY[0x1C1862BC0](v39, -1, -1);
      MEMORY[0x1C1862BC0](v38, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v28 + 8))(v18, v14);
    }
  }
  return sub_1BBBC9BBC(a1, v26);
}

uint64_t sub_1BBBC9BBC(uint64_t *a1, uint64_t a2)
{
  uint64_t v11 = a2;
  uint64_t v2 = *a1;
  uint64_t v3 = *(void *)(*a1 + 80);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](a1);
  uint64_t v6 = (char *)v10 - v5;
  uint64_t v7 = *(void (**)(char *))(v4 + 16);
  v7((char *)v10 - v5);
  uint64_t v12 = 0;
  swift_beginAccess();
  sub_1BBBEAF98();
  v10[1] = *(void *)(v2 + 104);
  sub_1BBBEB1E8();
  sub_1BBBEB218();
  swift_endAccess();
  uint64_t v8 = v11;
  ((void (*)(char *, uint64_t, uint64_t))v7)(v6, v11, v3);
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  swift_beginAccess();
  sub_1BBBEBBC8();
  swift_getFunctionTypeMetadata1();
  sub_1BBBEB1E8();
  sub_1BBBEB218();
  swift_endAccess();
  ((void (*)(char *, uint64_t, uint64_t))v7)(v6, v8, v3);
  uint64_t v12 = 0;
  swift_beginAccess();
  sub_1BBBEAF08();
  sub_1BBBEB1E8();
  sub_1BBBEB218();
  return swift_endAccess();
}

id *AsynchronousCache.deinit()
{
  uint64_t v1 = *v0;
  swift_release();

  swift_bridgeObjectRelease();
  (*(void (**)(char *))(*(void *)(v1[12] - 8) + 8))((char *)v0 + *((void *)*v0 + 19));
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t AsynchronousCache.__deallocating_deinit()
{
  AsynchronousCache.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t AsynchronousCache<>.removeCachedValue(_:)()
{
  return sub_1BBBEADF8();
}

uint64_t sub_1BBBCA048(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v65 = a2;
  uint64_t v66 = a3;
  int64_t v3 = (int64_t)a1;
  uint64_t v56 = *a1;
  uint64_t v4 = v56;
  uint64_t v5 = *(void *)(v56 + 88);
  uint64_t v6 = sub_1BBBEB6B8();
  uint64_t v7 = MEMORY[0x1F4188790](v6 - 8);
  uint64_t v55 = (char *)v46 - v8;
  uint64_t v58 = *(void *)(v5 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v7);
  uint64_t v73 = (char *)v46 - v10;
  uint64_t v11 = *(void *)(v4 + 80);
  uint64_t v57 = *(void *)(v11 - 8);
  uint64_t v12 = MEMORY[0x1F4188790](v9);
  uint64_t v54 = (char *)v46 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12);
  uint64_t v64 = (char *)v46 - v14;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v69 = sub_1BBBEB6B8();
  int64_t v16 = *(void *)(v69 - 8);
  uint64_t v17 = MEMORY[0x1F4188790](v69);
  uint64_t v70 = (char *)v46 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v17);
  uint64_t v20 = (char *)v46 - v19;
  if (qword_1E9F833C0 != -1) {
LABEL_42:
  }
    swift_once();
  uint64_t v21 = sub_1BBBEAE28();
  __swift_project_value_buffer(v21, (uint64_t)qword_1E9F85868);
  uint64_t v22 = sub_1BBBEAE08();
  os_log_type_t v23 = sub_1BBBEB518();
  if (os_log_type_enabled(v22, v23))
  {
    int64_t v24 = v16;
    uint64_t v25 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v25 = 0;
    _os_log_impl(&dword_1BBBA9000, v22, v23, "Removing cached value", v25, 2u);
    uint64_t v26 = v25;
    int64_t v16 = v24;
    MEMORY[0x1C1862BC0](v26, -1, -1);
  }

  uint64_t v53 = (void *)(v3 + 32);
  swift_beginAccess();
  unint64_t v27 = *(void *)(v3 + 32);
  if ((v27 & 0xC000000000000001) != 0)
  {
    uint64_t v28 = sub_1BBBEB918();
    unint64_t v47 = 0;
    uint64_t v29 = 0;
    unint64_t v30 = 0;
    unint64_t v31 = v28 | 0x8000000000000000;
  }
  else
  {
    uint64_t v32 = -1 << *(unsigned char *)(v27 + 32);
    uint64_t v29 = ~v32;
    uint64_t v33 = *(void *)(v27 + 64);
    unint64_t v47 = v27 + 64;
    uint64_t v34 = -v32;
    if (v34 < 64) {
      uint64_t v35 = ~(-1 << v34);
    }
    else {
      uint64_t v35 = -1;
    }
    unint64_t v30 = v35 & v33;
    unint64_t v31 = v27;
  }
  uint64_t v49 = v31 & 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v68 = TupleTypeMetadata2 - 8;
  v46[1] = v29;
  uint64_t v59 = (void (**)(char *, char *, uint64_t))(v57 + 16);
  uint64_t v50 = v58 + 16;
  uint64_t v67 = (void (**)(char *, char *, uint64_t))(v16 + 32);
  uint64_t v63 = (void (**)(char *, char *, uint64_t))(v57 + 32);
  uint64_t v62 = (void (**)(char *, char *, uint64_t))(v58 + 32);
  os_log_type_t v60 = (void (**)(char *, uint64_t))(v57 + 8);
  uint64_t v61 = (void (**)(char *, uint64_t))(v58 + 8);
  uint64_t v52 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v58 + 56);
  int64_t v48 = (unint64_t)(v29 + 64) >> 6;
  v46[0] = v48 - 1;
  swift_bridgeObjectRetain();
  int64_t v3 = 0;
  uint64_t v71 = v11;
  unint64_t v51 = v31;
  while (1)
  {
    if ((v31 & 0x8000000000000000) != 0)
    {
      if (sub_1BBBEB928())
      {
        uint64_t v38 = v70;
        sub_1BBBEBA88();
        swift_unknownObjectRelease();
        sub_1BBBEBA88();
        swift_unknownObjectRelease();
        uint64_t v39 = 0;
        int64_t v16 = v3;
        uint64_t v72 = v30;
      }
      else
      {
        uint64_t v39 = 1;
        int64_t v16 = v3;
        uint64_t v72 = v30;
        uint64_t v38 = v70;
      }
    }
    else
    {
      if (v30)
      {
        uint64_t v72 = (v30 - 1) & v30;
        unint64_t v36 = __clz(__rbit64(v30)) | (v3 << 6);
        int64_t v16 = v3;
        unint64_t v37 = v70;
        goto LABEL_15;
      }
      int64_t v16 = v3 + 1;
      unint64_t v37 = v70;
      if (__OFADD__(v3, 1))
      {
        __break(1u);
        goto LABEL_42;
      }
      if (v16 >= v48)
      {
        uint64_t v72 = 0;
        uint64_t v39 = 1;
        int64_t v16 = v3;
      }
      else
      {
        unint64_t v40 = *(void *)(v47 + 8 * v16);
        if (v40) {
          goto LABEL_21;
        }
        if (v3 + 2 >= v48)
        {
          uint64_t v72 = 0;
          uint64_t v39 = 1;
        }
        else
        {
          unint64_t v40 = *(void *)(v47 + 8 * (v3 + 2));
          if (v40)
          {
            int64_t v16 = v3 + 2;
LABEL_21:
            uint64_t v72 = (v40 - 1) & v40;
            unint64_t v36 = __clz(__rbit64(v40)) + (v16 << 6);
LABEL_15:
            uint64_t v38 = v37;
            (*(void (**)(void))(v57 + 16))();
            (*(void (**)(char *, unint64_t, uint64_t))(v58 + 16))(&v38[*(int *)(TupleTypeMetadata2 + 48)], *(void *)(v31 + 56) + *(void *)(v58 + 72) * v36, v5);
            uint64_t v39 = 0;
            goto LABEL_25;
          }
          int64_t v16 = v3 + 3;
          if (v3 + 3 >= v48)
          {
            uint64_t v72 = 0;
            uint64_t v39 = 1;
            int64_t v16 = v3 + 2;
          }
          else
          {
            unint64_t v40 = *(void *)(v47 + 8 * v16);
            if (v40) {
              goto LABEL_21;
            }
            uint64_t v44 = (char *)(v3 + 4);
            while ((char *)v48 != v44)
            {
              unint64_t v40 = *(void *)(v47 + 8 * (void)v44++);
              if (v40)
              {
                int64_t v16 = (int64_t)(v44 - 1);
                goto LABEL_21;
              }
            }
            uint64_t v72 = 0;
            uint64_t v39 = 1;
            int64_t v16 = v46[0];
          }
        }
      }
      uint64_t v38 = v70;
    }
LABEL_25:
    uint64_t v41 = *(void *)(TupleTypeMetadata2 - 8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v41 + 56))(v38, v39, 1, TupleTypeMetadata2);
    (*v67)(v20, v38, v69);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v41 + 48))(v20, 1, TupleTypeMetadata2) == 1) {
      return sub_1BBBCB438();
    }
    uint64_t v42 = &v20[*(int *)(TupleTypeMetadata2 + 48)];
    id v43 = v64;
    uint64_t v11 = v71;
    (*v63)(v64, v20, v71);
    (*v62)(v73, v42, v5);
    if (sub_1BBBEB268())
    {
      (*v59)(v54, v43, v11);
      (*v52)(v55, 1, 1, v5);
      swift_beginAccess();
      sub_1BBBEB1E8();
      unint64_t v31 = v51;
      sub_1BBBEB218();
      swift_endAccess();
    }
    (*v61)(v73, v5);
    (*v60)(v43, v11);
    int64_t v3 = v16;
    unint64_t v30 = v72;
  }
}

uint64_t sub_1BBBCA93C()
{
  return sub_1BBBCA048(*(uint64_t **)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 16));
}

uint64_t AsynchronousCache.description.getter()
{
  sub_1BBBEADF8();
  return v1;
}

uint64_t sub_1BBBCA9C0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v42 = a2;
  uint64_t v3 = *a1;
  uint64_t v4 = *(void *)(*a1 + 88);
  uint64_t v55 = sub_1BBBEB6B8();
  unint64_t v47 = *(uint64_t (***)(char *, uint64_t))(v55 - 8);
  uint64_t v5 = MEMORY[0x1F4188790](v55);
  uint64_t v56 = (char *)&v41 - v6;
  uint64_t v7 = *(void *)(v4 - 8);
  uint64_t v8 = MEMORY[0x1F4188790](v5);
  uint64_t v54 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x1F4188790](v8);
  uint64_t v53 = (char *)&v41 - v11;
  uint64_t v12 = *(void *)(v3 + 80);
  uint64_t v57 = *(void *)(v12 - 8);
  uint64_t v13 = MEMORY[0x1F4188790](v10);
  uint64_t v52 = (char *)&v41 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13);
  int64_t v16 = (char *)&v41 - v15;
  uint64_t v17 = sub_1BBBEB6B8();
  MEMORY[0x1F4188790](v17 - 8);
  uint64_t v19 = (char *)&v41 - v18;
  uint64_t v66 = 2651;
  unint64_t v67 = 0xE200000000000000;
  uint64_t v20 = a1 + 4;
  swift_beginAccess();
  uint64_t v21 = a1[4];
  uint64_t v62 = *(void *)(v3 + 104);
  uint64_t v41 = v21;
  if ((v21 & 0xC000000000000001) != 0)
  {
    unint64_t v22 = sub_1BBBEB918() | 0x8000000000000000;
    uint64_t result = swift_bridgeObjectRetain_n();
    uint64_t v46 = 0;
    uint64_t v24 = 0;
    uint64_t v58 = 0;
    unint64_t v25 = 0;
  }
  else
  {
    swift_bridgeObjectRetain_n();
    uint64_t result = sub_1BBBEB908();
    unint64_t v22 = v68;
    uint64_t v46 = v69;
    uint64_t v24 = v70;
    uint64_t v58 = v71;
    unint64_t v25 = v72;
  }
  uint64_t v44 = v22 & 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v63 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v57 + 56);
  uint64_t v43 = v24;
  int64_t v45 = (unint64_t)(v24 + 64) >> 6;
  uint64_t v73 = (void (**)(char *, char *, uint64_t))(v57 + 16);
  os_log_type_t v60 = (unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
  uint64_t v61 = (void (**)(char *, char *, uint64_t))(v57 + 32);
  uint64_t v50 = (void (**)(char *, char *, uint64_t))(v7 + 32);
  uint64_t v49 = (void (**)(char *, char *, uint64_t))(v7 + 16);
  int64_t v48 = (void (**)(char *, uint64_t))(v7 + 8);
  uint64_t v59 = (void (**)(char *, uint64_t))(v57 + 8);
  ++v47;
  uint64_t v26 = v56;
  unint64_t v51 = v19;
  if ((v22 & 0x8000000000000000) == 0) {
    goto LABEL_25;
  }
LABEL_7:
  if (!sub_1BBBEB938()) {
    goto LABEL_31;
  }
  sub_1BBBEBA88();
  swift_unknownObjectRelease();
  while (1)
  {
    (*v63)(v19, 0, 1, v12);
    (*v61)(v16, v19, v12);
    swift_beginAccess();
    uint64_t v38 = *v20;
    swift_bridgeObjectRetain();
    MEMORY[0x1C1861940](v16, v38, v12, v4, v62);
    swift_bridgeObjectRelease();
    if ((*v60)(v26, 1, v4) == 1)
    {
      (*v59)(v16, v12);
      uint64_t result = (*v47)(v26, v55);
      if ((v22 & 0x8000000000000000) != 0) {
        goto LABEL_7;
      }
    }
    else
    {
      unint64_t v27 = v20;
      unint64_t v28 = v22;
      uint64_t v29 = v53;
      (*v50)(v53, v26, v4);
      (*v73)(v52, v16, v12);
      uint64_t v64 = sub_1BBBEB2B8();
      uint64_t v65 = v30;
      sub_1BBBEB2F8();
      (*v49)(v54, v29, v4);
      sub_1BBBEB2B8();
      sub_1BBBEB2F8();
      swift_bridgeObjectRelease();
      sub_1BBBEB2F8();
      sub_1BBBEB2F8();
      uint64_t v26 = v56;
      swift_bridgeObjectRelease();
      unint64_t v31 = v29;
      unint64_t v22 = v28;
      uint64_t v20 = v27;
      uint64_t v19 = v51;
      (*v48)(v31, v4);
      uint64_t result = ((uint64_t (*)(char *, uint64_t))*v59)(v16, v12);
      if ((v22 & 0x8000000000000000) != 0) {
        goto LABEL_7;
      }
    }
LABEL_25:
    if (!v25) {
      break;
    }
    unint64_t v37 = __clz(__rbit64(v25));
    v25 &= v25 - 1;
    unint64_t v36 = v37 | (v58 << 6);
LABEL_27:
    (*(void (**)(char *, unint64_t, uint64_t))(v57 + 16))(v19, *(void *)(v22 + 48) + *(void *)(v57 + 72) * v36, v12);
  }
  int64_t v32 = v58 + 1;
  if (__OFADD__(v58, 1))
  {
    __break(1u);
    return result;
  }
  if (v32 >= v45) {
    goto LABEL_31;
  }
  unint64_t v33 = *(void *)(v46 + 8 * v32);
  uint64_t v34 = v58 + 1;
  if (v33) {
    goto LABEL_24;
  }
  uint64_t v34 = v58 + 2;
  if (v58 + 2 >= v45) {
    goto LABEL_31;
  }
  unint64_t v33 = *(void *)(v46 + 8 * v34);
  if (v33) {
    goto LABEL_24;
  }
  uint64_t v34 = v58 + 3;
  if (v58 + 3 >= v45) {
    goto LABEL_31;
  }
  unint64_t v33 = *(void *)(v46 + 8 * v34);
  if (v33) {
    goto LABEL_24;
  }
  uint64_t v34 = v58 + 4;
  if (v58 + 4 >= v45) {
    goto LABEL_31;
  }
  unint64_t v33 = *(void *)(v46 + 8 * v34);
  if (v33) {
    goto LABEL_24;
  }
  uint64_t v34 = v58 + 5;
  if (v58 + 5 >= v45) {
    goto LABEL_31;
  }
  unint64_t v33 = *(void *)(v46 + 8 * v34);
  if (v33)
  {
LABEL_24:
    unint64_t v25 = (v33 - 1) & v33;
    unint64_t v36 = __clz(__rbit64(v33)) + (v34 << 6);
    uint64_t v58 = v34;
    goto LABEL_27;
  }
  uint64_t v35 = v58 + 6;
  while (v45 != v35)
  {
    unint64_t v33 = *(void *)(v46 + 8 * v35++);
    if (v33)
    {
      uint64_t v34 = v35 - 1;
      goto LABEL_24;
    }
  }
LABEL_31:
  uint64_t v39 = v42;
  (*v63)(v19, 1, 1, v12);
  sub_1BBBCB438();
  sub_1BBBEB2F8();
  uint64_t result = swift_bridgeObjectRelease();
  unint64_t v40 = v67;
  *uint64_t v39 = v66;
  v39[1] = v40;
  return result;
}

uint64_t sub_1BBBCB1F8@<X0>(uint64_t *a1@<X8>)
{
  return sub_1BBBCA9C0(v1, a1);
}

uint64_t sub_1BBBCB214()
{
  return AsynchronousCache.description.getter();
}

uint64_t sub_1BBBCB238()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F) {
    return swift_initClassMetadata2();
  }
  return result;
}

uint64_t type metadata accessor for AsynchronousCache()
{
  return swift_getGenericMetadata();
}

uint64_t method lookup function for AsynchronousCache(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for AsynchronousCache);
}

uint64_t dispatch thunk of AsynchronousCache.__allocating_init(timeout:timeoutError:fetchBlock:)()
{
  return (*(uint64_t (**)(void))(v0 + 288))();
}

uint64_t dispatch thunk of AsynchronousCache.value(for:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 296))();
}

uint64_t dispatch thunk of AsynchronousCache.insert(key:value:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 304))();
}

uint64_t dispatch thunk of AsynchronousCache.removeCachedValue(for:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 312))();
}

uint64_t dispatch thunk of AsynchronousCache.flushCache()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 320))();
}

uint64_t sub_1BBBCB408()
{
  return sub_1BBBC9568(*(uint64_t **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_1BBBCB428(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_1BBBCB438()
{
  return swift_release();
}

uint64_t sub_1BBBCB440()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1BBBCB478()
{
  swift_weakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1BBBCB4B0()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 64) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  return MEMORY[0x1F4186498](v0, v6, v5);
}

uint64_t sub_1BBBCB590(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)(v2[2] - 8) + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v2[2] - 8) + 80);
  return sub_1BBBC7D3C(a1, a2, v2[7], (uint64_t)v2 + v3, *(uint64_t *)((char *)v2 + ((*(void *)(*(void *)(v2[2] - 8) + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8)), v2[2], v2[3], v2[4], v2[5], v2[6]);
}

uint64_t sub_1BBBCB620()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 24) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 56) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);
  return MEMORY[0x1F4186498](v0, v4, v5);
}

uint64_t sub_1BBBCB6A8(void (*a1)(char *), uint64_t a2)
{
  return sub_1BBBC7C08(a1, a2, v2+ ((*(unsigned __int8 *)(*(void *)(*(void *)(v2 + 24) - 8) + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v2 + 24) - 8) + 80)), *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_1BBBCB6F0()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 72, 7);
}

uint64_t sub_1BBBCB728()
{
  return (*(uint64_t (**)(void))(v0 + 56))();
}

uint64_t sub_1BBBCB750@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(*(void *)v1 + 96) - 8) + 16))(a1, v1 + *(void *)(*(void *)v1 + 152));
}

uint64_t sub_1BBBCB7AC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F7978);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1BBBCB80C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 64) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x1F4186498](v0, v5, v6);
}

uint64_t sub_1BBBCB8D0()
{
  return sub_1BBBEADF8();
}

uint64_t sub_1BBBCB96C()
{
  uint64_t v0 = sub_1BBBEAE28();
  __swift_allocate_value_buffer(v0, qword_1E9F85880);
  __swift_project_value_buffer(v0, (uint64_t)qword_1E9F85880);
  return sub_1BBBEAE18();
}

uint64_t sub_1BBBCB9E8(uint64_t a1)
{
  MEMORY[0x1F4188790](a1);
  uint64_t v2 = (char *)&v5 - v1;
  (*(void (**)(char *))(v3 + 16))((char *)&v5 - v1);
  return sub_1BBBCBB4C((uint64_t)v2);
}

uint64_t sub_1BBBCBAA8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = (uint64_t)v1 + *(void *)(*v1 + 96);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(v3 + 80) - 8) + 16))(a1, v4);
}

uint64_t sub_1BBBCBB4C(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = (uint64_t)v1 + *(void *)(*v1 + 96);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(*(void *)(v3 + 80) - 8) + 40))(v4, a1);
  return swift_endAccess();
}

uint64_t (*sub_1BBBCBBF8())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1BBBCBC60()
{
  sub_1BBBCDF0C();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BBBCBC88(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + *(void *)(*(void *)v1 + 104));
  swift_beginAccess();
  *uint64_t v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1BBBCBCE8())()
{
  return j__swift_endAccess;
}

uint64_t QueuePool.Wrapper.__allocating_init(identifier:blocks:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(*(void *)(*(void *)v4 + 80) - 8) + 32))(v4 + *(void *)(*(void *)v4 + 96), a1);
  *(void *)(v4 + *(void *)(*(void *)v4 + 104)) = a2;
  return v4;
}

uint64_t QueuePool.Wrapper.init(identifier:blocks:)(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(void *)(*(void *)(*(void *)v2 + 80) - 8) + 32))(v2 + *(void *)(*(void *)v2 + 96), a1);
  *(void *)(v2 + *(void *)(*(void *)v2 + 104)) = a2;
  return v2;
}

uint64_t QueuePool.Wrapper.__allocating_init(identifier:block:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *(void *)(v3 + 80);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](a1);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v7);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F7798);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_1BBBED370;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a2;
  *(void *)(v12 + 24) = a3;
  *(void *)(v11 + 32) = sub_1BBBAFFA0;
  *(void *)(v11 + 40) = v12;
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(a1, v7);
  return QueuePool.Wrapper.__allocating_init(identifier:blocks:)((uint64_t)v10, v11);
}

uint64_t QueuePool.Wrapper.deinit()
{
  (*(void (**)(uint64_t))(*(void *)(*(void *)(*(void *)v0 + 80) - 8) + 8))(v0 + *(void *)(*(void *)v0 + 96));
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t QueuePool.Wrapper.__deallocating_deinit()
{
  QueuePool.Wrapper.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t sub_1BBBCC0D0@<X0>(uint64_t a1@<X8>)
{
  return sub_1BBBCBAA8(a1);
}

uint64_t sub_1BBBCC0F4()
{
  sub_1BBBCDF0C();
  return swift_bridgeObjectRetain();
}

uint64_t QueuePool.__allocating_init(name:workers:completionQueue:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  swift_allocObject();
  uint64_t v8 = sub_1BBBCDF98(a1, a2, a3, a4);
  swift_bridgeObjectRelease();

  return v8;
}

uint64_t QueuePool.init(name:workers:completionQueue:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = sub_1BBBCDF98(a1, a2, a3, a4);
  swift_bridgeObjectRelease();

  return v5;
}

void sub_1BBBCC1E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v53 = a1;
  uint64_t v68 = sub_1BBBEB0B8();
  uint64_t v55 = *(void *)(v68 - 8);
  MEMORY[0x1F4188790](v68);
  uint64_t v66 = (char *)&v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = sub_1BBBEB0F8();
  uint64_t v54 = *(void *)(v67 - 8);
  MEMORY[0x1F4188790](v67);
  uint64_t v65 = (char *)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = dispatch_group_create();
  uint64_t v11 = dispatch_group_create();
  uint64_t v12 = (void *)v4[5];
  uint64_t v13 = v4[3];
  uint64_t v62 = v4[2];
  uint64_t v63 = v13;
  swift_bridgeObjectRetain();
  uint64_t v64 = v11;
  dispatch_group_enter(v11);
  uint64_t v56 = v4;
  uint64_t v14 = v4[4];
  if (v14 < 0)
  {
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v49 = v12;
  uint64_t v50 = a2;
  uint64_t v51 = a3;
  uint64_t v52 = a4;
  unint64_t v61 = v14 - 1;
  if (v14 == 1) {
    goto LABEL_14;
  }
  if (!v14)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v15 = v56[6];
  unint64_t v60 = v15 & 0xC000000000000001;
  if ((v15 & 0xC000000000000001) == 0)
  {
    unint64_t v16 = *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v16 < 2 || v61 >= v16) {
      goto LABEL_22;
    }
  }
  uint64_t v18 = 0;
  uint64_t v58 = &v72;
  uint64_t v57 = (void (**)(char *, uint64_t))(v55 + 8);
  uint64_t v19 = (void (**)(char *, uint64_t))(v54 + 8);
  uint64_t v59 = v15;
  uint64_t v20 = v65;
  uint64_t v21 = v68;
  do
  {
    dispatch_group_enter(v10);
    if (v60) {
      id v22 = (id)MEMORY[0x1C1861FC0](v18 + 1, v15);
    }
    else {
      id v22 = *(id *)(v15 + 8 * v18 + 40);
    }
    os_log_type_t v23 = v22;
    uint64_t v24 = (void *)swift_allocObject();
    uint64_t v25 = v62;
    uint64_t v26 = v63;
    v24[2] = v10;
    void v24[3] = v25;
    v24[4] = v26;
    v24[5] = v18 + 1;
    unint64_t v27 = v64;
    v24[6] = v64;
    uint64_t v74 = sub_1BBBCE354;
    uint64_t v75 = v24;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v71 = 1107296256;
    unint64_t v72 = sub_1BBBAED3C;
    uint64_t v73 = &block_descriptor_4;
    unint64_t v28 = _Block_copy(&aBlock);
    swift_bridgeObjectRetain();
    uint64_t v29 = v10;
    uint64_t v30 = v27;
    sub_1BBBEB0D8();
    uint64_t v69 = MEMORY[0x1E4FBC860];
    sub_1BBBCE7B4(qword_1EB9F78A0, 255, MEMORY[0x1E4FBCB00]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F7968);
    sub_1BBBAEF0C((unint64_t *)&qword_1EB9F7970, &qword_1EB9F7968);
    unint64_t v31 = v66;
    sub_1BBBEB798();
    MEMORY[0x1C1861D70](0, v20, v31, v28);
    _Block_release(v28);

    (*v57)(v31, v21);
    (*v19)(v20, v67);
    swift_release();
    ++v18;
    uint64_t v15 = v59;
  }
  while (v61 != v18);
LABEL_14:
  uint64_t v32 = v56[6];
  if ((v32 & 0xC000000000000001) != 0)
  {
LABEL_20:
    id v33 = (id)MEMORY[0x1C1861FC0](0);
    goto LABEL_17;
  }
  if (*(void *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v33 = *(id *)(v32 + 32);
LABEL_17:
    uint64_t v34 = v33;
    uint64_t v35 = (void *)swift_allocObject();
    uint64_t v36 = v63;
    unint64_t v37 = v64;
    v35[2] = v62;
    v35[3] = v36;
    uint64_t v38 = v53;
    v35[4] = v10;
    v35[5] = v38;
    v35[6] = v50;
    v35[7] = v37;
    uint64_t v39 = v51;
    uint64_t v40 = v52;
    v35[8] = v51;
    v35[9] = v40;
    uint64_t v41 = v49;
    v35[10] = v49;
    uint64_t v74 = sub_1BBBCE3DC;
    uint64_t v75 = v35;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v71 = 1107296256;
    unint64_t v72 = sub_1BBBAED3C;
    uint64_t v73 = &block_descriptor_9;
    uint64_t v42 = _Block_copy(&aBlock);
    uint64_t v43 = v10;
    uint64_t v44 = v37;
    swift_retain();
    sub_1BBBCE414(v39);
    id v45 = v41;
    uint64_t v46 = v65;
    sub_1BBBEB0D8();
    uint64_t v69 = MEMORY[0x1E4FBC860];
    sub_1BBBCE7B4(qword_1EB9F78A0, 255, MEMORY[0x1E4FBCB00]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F7968);
    sub_1BBBAEF0C((unint64_t *)&qword_1EB9F7970, &qword_1EB9F7968);
    unint64_t v47 = v66;
    uint64_t v48 = v68;
    sub_1BBBEB798();
    MEMORY[0x1C1861D70](0, v46, v47, v42);
    _Block_release(v42);

    (*(void (**)(char *, uint64_t))(v55 + 8))(v47, v48);
    (*(void (**)(char *, uint64_t))(v54 + 8))(v46, v67);
    swift_release();
    return;
  }
  __break(1u);
LABEL_22:
  __break(1u);
}

void sub_1BBBCC840(NSObject *a1, uint64_t a2, unint64_t a3)
{
  dispatch_group_leave(a1);
  if (qword_1E9F833C8 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_1BBBEAE28();
  __swift_project_value_buffer(v5, (uint64_t)qword_1E9F85880);
  swift_bridgeObjectRetain_n();
  uint64_t v6 = sub_1BBBEAE08();
  os_log_type_t v7 = sub_1BBBEB528();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v14 = v9;
    *(_DWORD *)uint64_t v8 = 136315394;
    swift_bridgeObjectRetain();
    sub_1BBBAC938(a2, a3, &v14);
    sub_1BBBEB6C8();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v8 + 12) = 2048;
    sub_1BBBEB6C8();
    _os_log_impl(&dword_1BBBA9000, v6, v7, "%s-workQueue-%ld: >>> wait on barrierGroup", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1C1862BC0](v9, -1, -1);
    MEMORY[0x1C1862BC0](v8, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  sub_1BBBEB568();
  swift_bridgeObjectRetain_n();
  uint64_t v10 = sub_1BBBEAE08();
  os_log_type_t v11 = sub_1BBBEB528();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    uint64_t v14 = v13;
    *(_DWORD *)uint64_t v12 = 136315394;
    swift_bridgeObjectRetain();
    sub_1BBBAC938(a2, a3, &v14);
    sub_1BBBEB6C8();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v12 + 12) = 2048;
    sub_1BBBEB6C8();
    _os_log_impl(&dword_1BBBA9000, v10, v11, "%s-workQueue-%ld: <<< wait on barrierGroup", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1C1862BC0](v13, -1, -1);
    MEMORY[0x1C1862BC0](v12, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

void sub_1BBBCCB74(uint64_t a1, unint64_t a2, uint64_t a3, void (*a4)(uint64_t), uint64_t a5, NSObject *a6, uint64_t a7, uint64_t a8)
{
  uint64_t v46 = a4;
  dispatch_group_t v47 = a6;
  uint64_t v45 = a5;
  uint64_t v48 = a1;
  uint64_t v11 = sub_1BBBEB0B8();
  uint64_t v43 = *(void *)(v11 - 8);
  uint64_t v44 = v11;
  MEMORY[0x1F4188790](v11);
  uint64_t v41 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = sub_1BBBEB0F8();
  uint64_t v40 = *(void *)(v42 - 8);
  MEMORY[0x1F4188790](v42);
  uint64_t v39 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1E9F833C8 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_1BBBEAE28();
  uint64_t v15 = __swift_project_value_buffer(v14, (uint64_t)qword_1E9F85880);
  swift_bridgeObjectRetain_n();
  unint64_t v16 = sub_1BBBEAE08();
  os_log_type_t v17 = sub_1BBBEB528();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v38 = v15;
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    aBlock[0] = v19;
    *(_DWORD *)uint64_t v18 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v49 = sub_1BBBAC938(v48, a2, aBlock);
    sub_1BBBEB6C8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1BBBA9000, v16, v17, "%s-workQueue-0: >>> wait on enterGroup", v18, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C1862BC0](v19, -1, -1);
    MEMORY[0x1C1862BC0](v18, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  sub_1BBBEB568();
  swift_bridgeObjectRetain_n();
  uint64_t v20 = sub_1BBBEAE08();
  os_log_type_t v21 = sub_1BBBEB528();
  if (os_log_type_enabled(v20, v21))
  {
    id v22 = (uint8_t *)swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    aBlock[0] = v23;
    *(_DWORD *)id v22 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v49 = sub_1BBBAC938(v48, a2, aBlock);
    sub_1BBBEB6C8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1BBBA9000, v20, v21, "%s-workQueue-0: <<< wait on enterGroup", v22, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C1862BC0](v23, -1, -1);
    MEMORY[0x1C1862BC0](v22, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  uint64_t v24 = sub_1BBBEAE08();
  os_log_type_t v25 = sub_1BBBEB528();
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v26 = (uint8_t *)swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    aBlock[0] = v27;
    *(_DWORD *)uint64_t v26 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v49 = sub_1BBBAC938(v48, a2, aBlock);
    sub_1BBBEB6C8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1BBBA9000, v24, v25, "%s-workQueue-0: >>> Executing barrier block", v26, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C1862BC0](v27, -1, -1);
    MEMORY[0x1C1862BC0](v26, -1, -1);
  }
  else
  {

    uint64_t v28 = swift_bridgeObjectRelease_n();
  }
  v46(v28);
  swift_bridgeObjectRetain_n();
  uint64_t v29 = sub_1BBBEAE08();
  os_log_type_t v30 = sub_1BBBEB528();
  if (os_log_type_enabled(v29, v30))
  {
    unint64_t v31 = (uint8_t *)swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    aBlock[0] = v32;
    *(_DWORD *)unint64_t v31 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v49 = sub_1BBBAC938(v48, a2, aBlock);
    sub_1BBBEB6C8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1BBBA9000, v29, v30, "%s-workQueue-0: <<< Executing barrier block", v31, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C1862BC0](v32, -1, -1);
    MEMORY[0x1C1862BC0](v31, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  dispatch_group_leave(v47);
  if (a7)
  {
    uint64_t v33 = swift_allocObject();
    *(void *)(v33 + 16) = a7;
    *(void *)(v33 + 24) = a8;
    aBlock[4] = (uint64_t)sub_1BBBAFFA0;
    aBlock[5] = v33;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1BBBAED3C;
    aBlock[3] = (uint64_t)&block_descriptor_43;
    uint64_t v34 = _Block_copy(aBlock);
    swift_retain_n();
    uint64_t v35 = v39;
    sub_1BBBEB0D8();
    uint64_t v49 = MEMORY[0x1E4FBC860];
    sub_1BBBCE7B4(qword_1EB9F78A0, 255, MEMORY[0x1E4FBCB00]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F7968);
    sub_1BBBAEF0C((unint64_t *)&qword_1EB9F7970, &qword_1EB9F7968);
    uint64_t v36 = v41;
    uint64_t v37 = v44;
    sub_1BBBEB798();
    MEMORY[0x1C1861D70](0, v35, v36, v34);
    _Block_release(v34);
    sub_1BBBCB428(a7);
    (*(void (**)(char *, uint64_t))(v43 + 8))(v36, v37);
    (*(void (**)(char *, uint64_t))(v40 + 8))(v35, v42);
    swift_release();
  }
}

void sub_1BBBCD36C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  uint64_t v40 = a3;
  uint64_t v43 = a2;
  uint64_t v41 = sub_1BBBEB0B8();
  uint64_t v45 = *(void *)(v41 - 8);
  MEMORY[0x1F4188790](v41);
  uint64_t v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = sub_1BBBEB0F8();
  uint64_t v44 = *(void *)(v42 - 8);
  MEMORY[0x1F4188790](v42);
  uint64_t v51 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v13 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x1F4188790](AssociatedTypeWitness);
  uint64_t v15 = (char *)&v38 - v14;
  (*(void (**)(uint64_t, uint64_t))(a5 + 24))(a4, a5);
  swift_getAssociatedConformanceWitness();
  unint64_t v16 = sub_1BBBEB248();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, AssociatedTypeWitness);
  unint64_t v17 = v6[4];
  if (!v17)
  {
    __break(1u);
    goto LABEL_13;
  }
  unint64_t v18 = v16 % v17;
  if (((v16 % v17) & 0x8000000000000000) != 0)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v19 = v6[6];
  if ((v19 & 0xC000000000000001) != 0)
  {
LABEL_14:
    id v20 = (id)MEMORY[0x1C1861FC0]();
    goto LABEL_6;
  }
  if (v18 >= *(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    return;
  }
  id v20 = *(id *)(v19 + 8 * v18 + 32);
LABEL_6:
  id v50 = v20;
  uint64_t v39 = (void *)v6[5];
  uint64_t v46 = (*(uint64_t (**)(uint64_t, uint64_t))(a5 + 32))(a4, a5);
  uint64_t v21 = *(void *)(v46 + 16);
  uint64_t v22 = MEMORY[0x1E4FBC860];
  uint64_t v23 = v41;
  uint64_t v24 = v42;
  os_log_type_t v25 = v51;
  if (v21)
  {
    uint64_t v26 = (long long *)(v46 + 32);
    uint64_t v48 = (void (**)(char *, uint64_t))(v45 + 8);
    uint64_t v49 = &v57;
    dispatch_group_t v47 = (void (**)(char *, uint64_t))(v44 + 8);
    do
    {
      uint64_t v53 = v21;
      uint64_t v27 = swift_allocObject();
      long long v28 = *v26++;
      long long v52 = v28;
      *(_OWORD *)(v27 + 16) = v28;
      uint64_t v29 = swift_allocObject();
      *(void *)(v29 + 16) = sub_1BBBCE424;
      *(void *)(v29 + 24) = v27;
      uint64_t v59 = sub_1BBBB3744;
      unint64_t v60 = (void *)v29;
      uint64_t aBlock = MEMORY[0x1E4F143A8];
      uint64_t v56 = 1107296256;
      uint64_t v57 = sub_1BBBAED3C;
      uint64_t v58 = &block_descriptor_18;
      os_log_type_t v30 = _Block_copy(&aBlock);
      swift_retain();
      swift_retain();
      sub_1BBBEB0D8();
      uint64_t v54 = v22;
      sub_1BBBCE7B4(qword_1EB9F78A0, 255, MEMORY[0x1E4FBCB00]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F7968);
      sub_1BBBAEF0C((unint64_t *)&qword_1EB9F7970, &qword_1EB9F7968);
      os_log_type_t v25 = v51;
      sub_1BBBEB798();
      MEMORY[0x1C1861D70](0, v25, v10, v30);
      _Block_release(v30);
      swift_release();
      (*v48)(v10, v23);
      (*v47)(v25, v24);
      swift_release();
      uint64_t v21 = v53 - 1;
    }
    while (v53 != 1);
  }
  swift_bridgeObjectRelease();
  uint64_t v31 = v43;
  if (v43)
  {
    uint64_t v32 = (void *)swift_allocObject();
    uint64_t v33 = v22;
    uint64_t v34 = v39;
    v32[2] = v39;
    v32[3] = v31;
    v32[4] = v40;
    uint64_t v59 = sub_1BBBCE48C;
    unint64_t v60 = v32;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v56 = 1107296256;
    uint64_t v57 = sub_1BBBAED3C;
    uint64_t v58 = &block_descriptor_24_0;
    uint64_t v35 = _Block_copy(&aBlock);
    sub_1BBBCE414(v31);
    sub_1BBBCE414(v31);
    id v36 = v34;
    sub_1BBBEB0D8();
    uint64_t v54 = v33;
    sub_1BBBCE7B4(qword_1EB9F78A0, 255, MEMORY[0x1E4FBCB00]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F7968);
    sub_1BBBAEF0C((unint64_t *)&qword_1EB9F7970, &qword_1EB9F7968);
    sub_1BBBEB798();
    id v37 = v50;
    MEMORY[0x1C1861D70](0, v25, v10, v35);

    _Block_release(v35);
    sub_1BBBCB428(v31);
    (*(void (**)(char *, uint64_t))(v45 + 8))(v10, v23);
    (*(void (**)(char *, uint64_t))(v44 + 8))(v25, v24);
    swift_release();
  }
  else
  {
  }
}

uint64_t sub_1BBBCDA54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v16[0] = a1;
  uint64_t v5 = sub_1BBBEB0B8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1BBBEB0F8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a2;
  *(void *)(v13 + 24) = a3;
  aBlock[4] = sub_1BBBB3744;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BBBAED3C;
  aBlock[3] = &block_descriptor_37;
  uint64_t v14 = _Block_copy(aBlock);
  swift_retain();
  sub_1BBBEB0D8();
  v16[1] = MEMORY[0x1E4FBC860];
  sub_1BBBCE7B4(qword_1EB9F78A0, 255, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F7968);
  sub_1BBBAEF0C((unint64_t *)&qword_1EB9F7970, &qword_1EB9F7968);
  sub_1BBBEB798();
  MEMORY[0x1C1861D70](0, v12, v8, v14);
  _Block_release(v14);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return swift_release();
}

uint64_t QueuePool.deinit()
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t QueuePool.__deallocating_deinit()
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186488](v0, 56, 7);
}

uint64_t QueuePool.description.getter()
{
  uint64_t v0 = type metadata accessor for QueuePool();
  uint64_t v2 = sub_1BBBCE7B4(&qword_1E9F83758, v1, (void (*)(uint64_t))type metadata accessor for QueuePool);
  sub_1BBBEBA28();
  sub_1BBBEB2F8();
  swift_bridgeObjectRelease();
  sub_1BBBEB2F8();
  MEMORY[0x1C1862170](v0, v2);
  sub_1BBBEB2F8();
  swift_bridgeObjectRelease();
  sub_1BBBEB2F8();
  swift_bridgeObjectRetain();
  sub_1BBBEB2F8();
  swift_bridgeObjectRelease();
  sub_1BBBEB2F8();
  sub_1BBBEBA48();
  sub_1BBBEB2F8();
  swift_bridgeObjectRelease();
  sub_1BBBEB2F8();
  return 60;
}

uint64_t sub_1BBBCDEE8()
{
  return QueuePool.description.getter();
}

uint64_t sub_1BBBCDF0C()
{
  uint64_t v1 = v0 + *(void *)(*(void *)v0 + 104);
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_1BBBCDF60()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1BBBCDF98(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v27 = sub_1BBBEB578();
  MEMORY[0x1F4188790](v27);
  uint64_t v26 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1BBBEB0F8();
  MEMORY[0x1F4188790](v10 - 8);
  os_log_type_t v25 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_1BBBEB608();
  uint64_t v12 = *(void *)(v24 - 8);
  uint64_t result = MEMORY[0x1F4188790](v24);
  uint64_t v23 = (char *)&v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3 < 2)
  {
    __break(1u);
  }
  else
  {
    uint64_t v31 = MEMORY[0x1E4FBC860];
    v4[2] = a1;
    v4[3] = a2;
    v4[4] = a3;
    v4[5] = a4;
    unint64_t v18 = v4;
    unint64_t v21 = sub_1BBBAEE84();
    unsigned int v20 = *MEMORY[0x1E4FBCC68];
    uint64_t v19 = (void (**)(char *, void, uint64_t))(v12 + 104);
    swift_bridgeObjectRetain();
    id v15 = a4;
    uint64_t v16 = 0;
    uint64_t v22 = a1;
    unint64_t v17 = v23;
    do
    {
      uint64_t v29 = a1;
      uint64_t v30 = a2;
      swift_bridgeObjectRetain();
      sub_1BBBEB2F8();
      uint64_t v28 = v16;
      sub_1BBBEBA48();
      sub_1BBBEB2F8();
      swift_bridgeObjectRelease();
      (*v19)(v17, v20, v24);
      sub_1BBBEB0D8();
      uint64_t v29 = MEMORY[0x1E4FBC860];
      sub_1BBBCE7B4((unint64_t *)&qword_1EB9F8330, 255, MEMORY[0x1E4FBCC10]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F8320);
      sub_1BBBAEF0C((unint64_t *)&qword_1EB9F8328, &qword_1EB9F8320);
      sub_1BBBEB798();
      sub_1BBBEB648();
      MEMORY[0x1C1861AB0]();
      if (*(void *)((v31 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v31 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_1BBBEB3A8();
      }
      ++v16;
      sub_1BBBEB3D8();
      sub_1BBBEB388();
      a1 = v22;
    }
    while (a3 != v16);
    uint64_t result = (uint64_t)v18;
    v18[6] = v31;
  }
  return result;
}

uint64_t sub_1BBBCE30C()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 56, 7);
}

void sub_1BBBCE354()
{
  sub_1BBBCC840(*(NSObject **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1BBBCE374()
{
  swift_bridgeObjectRelease();

  swift_release();
  if (*(void *)(v0 + 64)) {
    swift_release();
  }

  return MEMORY[0x1F4186498](v0, 88, 7);
}

void sub_1BBBCE3DC()
{
  sub_1BBBCCB74(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void (**)(uint64_t))(v0 + 40), *(void *)(v0 + 48), *(NSObject **)(v0 + 56), *(void *)(v0 + 64), *(void *)(v0 + 72));
}

uint64_t sub_1BBBCE414(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_1BBBCE424()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1BBBCE44C()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1BBBCE48C()
{
  return sub_1BBBCDA54(v0[2], v0[3], v0[4]);
}

uint64_t type metadata accessor for QueuePool()
{
  return self;
}

uint64_t sub_1BBBCE4BC(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 88);
}

uint64_t sub_1BBBCE4C4@<X0>(uint64_t a1@<X8>)
{
  return sub_1BBBCBAA8(a1);
}

uint64_t sub_1BBBCE4EC()
{
  return 16;
}

__n128 sub_1BBBCE4F8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_1BBBCE504@<X0>(uint64_t *a1@<X8>)
{
  *a1 = sub_1BBBCDF0C();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BBBCE540()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  return sub_1BBBCBC88(v0);
}

uint64_t sub_1BBBCE56C()
{
  return 16;
}

__n128 sub_1BBBCE578(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t method lookup function for QueuePool(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for QueuePool);
}

uint64_t dispatch thunk of QueuePool.__allocating_init(name:workers:completionQueue:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of QueuePool.insertBarrier(block:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of QueuePool.insert<A>(_:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t sub_1BBBCE5F8()
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

uint64_t type metadata accessor for QueuePool.Wrapper()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for QueuePool.Wrapper(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for QueuePool.Wrapper);
}

uint64_t dispatch thunk of QueuePool.Wrapper.identifer.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of QueuePool.Wrapper.identifer.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of QueuePool.Wrapper.identifer.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of QueuePool.Wrapper.blocks.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of QueuePool.Wrapper.blocks.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of QueuePool.Wrapper.blocks.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of QueuePool.Wrapper.__allocating_init(identifier:blocks:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t sub_1BBBCE7B4(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t SimpleThrottle.init(interval:block:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v34 = a2;
  uint64_t v35 = a3;
  uint64_t v33 = a1;
  id v36 = a5;
  uint64_t v32 = sub_1BBBEB608();
  uint64_t v30 = *(void *)(v32 - 8);
  MEMORY[0x1F4188790](v32);
  uint64_t v29 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1BBBEB578();
  MEMORY[0x1F4188790](v7);
  uint64_t v8 = sub_1BBBEB0F8();
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v25 = a4;
  uint64_t v9 = sub_1BBBEAEE8();
  unint64_t v10 = sub_1BBBAEE84();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v27 = WitnessTable;
  uint64_t v26 = sub_1BBBCED0C(&qword_1EB9F8270, (void (*)(uint64_t))sub_1BBBAEE84);
  uint64_t v38 = v9;
  unint64_t v39 = v10;
  uint64_t v40 = WitnessTable;
  uint64_t v41 = v26;
  uint64_t v12 = sub_1BBBEAEA8();
  uint64_t v31 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12);
  uint64_t v14 = (char *)&v24 - v13;
  sub_1BBBEAF48();
  uint64_t v28 = sub_1BBBEAF28();
  uint64_t v38 = v28;
  swift_getWitnessTable();
  uint64_t v38 = sub_1BBBEAFC8();
  sub_1BBBEB0D8();
  id v37 = (void *)MEMORY[0x1E4FBC860];
  sub_1BBBCED0C((unint64_t *)&qword_1EB9F8330, MEMORY[0x1E4FBCC10]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F8320);
  sub_1BBBB2BC0();
  sub_1BBBEB798();
  (*(void (**)(char *, void, uint64_t))(v30 + 104))(v29, *MEMORY[0x1E4FBCC58], v32);
  id v15 = (void *)sub_1BBBEB648();
  id v37 = v15;
  uint64_t v16 = v33;
  sub_1BBBEB068();
  swift_release();

  unint64_t v17 = (void *)swift_allocObject();
  uint64_t v18 = v34;
  uint64_t v19 = v35;
  v17[2] = v25;
  v17[3] = v18;
  v17[4] = v19;
  swift_retain();
  swift_getWitnessTable();
  uint64_t v20 = sub_1BBBEB078();
  swift_release();
  swift_release();
  uint64_t v21 = sub_1BBBEB5F8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v21 - 8) + 8))(v16, v21);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v14, v12);
  uint64_t v23 = v36;
  *id v36 = v28;
  v23[1] = v20;
  return result;
}

uint64_t sub_1BBBCED0C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1BBBCED54()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1BBBCED8C()
{
  return (*(uint64_t (**)(void))(v0 + 24))();
}

uint64_t SimpleThrottle.send(_:)()
{
  return sub_1BBBEAF18();
}

uint64_t sub_1BBBCEDD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 16);
}

uint64_t sub_1BBBCEDE4()
{
  swift_release();
  return swift_release();
}

void *sub_1BBBCEE20(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *sub_1BBBCEE58(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_1BBBCEEB8(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t sub_1BBBCEEF8(uint64_t *a1, int a2)
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

uint64_t sub_1BBBCEF40(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for SimpleThrottle()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t XPCSession.identifier.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + qword_1EB9F8B68;
  uint64_t v4 = sub_1BBBEADC8();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t XPCSession.service.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1BBBCF01C(v1 + qword_1EB9F8B70, a1);
}

uint64_t sub_1BBBCF01C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for XPCServiceDescription();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t XPCSession.connection.getter()
{
  sub_1BBBB4D64(0, &qword_1EB9F7C60);
  sub_1BBBEB628();
  return v1;
}

uint64_t sub_1BBBCF10C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1BBBCF13C();
  *a1 = result;
  return result;
}

uint64_t sub_1BBBCF13C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1BBBEABA8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1BBBEB158();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  unint64_t v10 = (uint64_t *)((char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = *(void **)((char *)v0 + *(void *)(v2 + 120));
  *unint64_t v10 = v11;
  (*(void (**)(void *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x1E4FBCBF0], v7);
  id v12 = v11;
  LOBYTE(v11) = sub_1BBBEB178();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v8 + 8))(v10, v7);
  if (v11)
  {
    uint64_t v14 = *(void **)((char *)v1 + qword_1EB9F75E8);
    if (v14)
    {
      id v15 = *(id *)((char *)v1 + qword_1EB9F75E8);
    }
    else
    {
      uint64_t v16 = (char *)v1 + qword_1EB9F8B70;
      uint64_t v39 = qword_1EB9F75E8;
      (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, (uint64_t)v1 + qword_1EB9F8B70, v3);
      unint64_t v17 = (int *)type metadata accessor for XPCServiceDescription();
      uint64_t v18 = v17[5];
      id v38 = v12;
      uint64_t v19 = *(void *)&v16[v18];
      id v20 = objc_allocWithZone(MEMORY[0x1E4F29268]);
      uint64_t v37 = v2;
      id v21 = v20;
      sub_1BBBEAB98();
      uint64_t v22 = (void *)sub_1BBBEB278();
      swift_bridgeObjectRelease();
      id v23 = objc_msgSend(v21, sel_initWithMachServiceName_options_, v22, v19);

      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      objc_msgSend(v23, sel_setExportedInterface_, *(void *)&v16[v17[7]]);
      objc_msgSend(v23, sel_setExportedObject_, *(void *)&v16[v17[6]]);
      objc_msgSend(v23, sel_setRemoteObjectInterface_, *(void *)&v16[v17[8]]);
      uint64_t v24 = swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v25 = swift_allocObject();
      swift_weakInit();
      uint64_t v26 = (void *)swift_allocObject();
      uint64_t v27 = *(void *)(v37 + 80);
      v26[2] = v27;
      v26[3] = v25;
      v26[4] = v24;
      uint64_t v44 = sub_1BBBD2750;
      uint64_t v45 = v26;
      uint64_t aBlock = MEMORY[0x1E4F143A8];
      uint64_t v41 = 1107296256;
      uint64_t v42 = sub_1BBBAED3C;
      uint64_t v43 = &block_descriptor_30;
      uint64_t v28 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
      objc_msgSend(v23, sel_setInterruptionHandler_, v28);
      _Block_release(v28);
      uint64_t v29 = swift_allocObject();
      swift_weakInit();
      uint64_t v30 = (void *)swift_allocObject();
      v30[2] = v27;
      v30[3] = v29;
      uint64_t v31 = v38;
      v30[4] = v38;
      v30[5] = v24;
      uint64_t v44 = sub_1BBBD27A4;
      uint64_t v45 = v30;
      uint64_t aBlock = MEMORY[0x1E4F143A8];
      uint64_t v41 = 1107296256;
      uint64_t v42 = sub_1BBBAED3C;
      uint64_t v43 = &block_descriptor_37_0;
      uint64_t v32 = _Block_copy(&aBlock);
      id v33 = v31;
      swift_retain();
      swift_release();
      objc_msgSend(v23, sel_setInvalidationHandler_, v32);
      _Block_release(v32);
      uint64_t v34 = *(void **)((char *)v1 + v39);
      *(void *)((char *)v1 + v39) = v23;
      id v15 = v23;
      swift_release();

      uint64_t v14 = 0;
    }
    id v35 = v14;
    return (uint64_t)v15;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1BBBCF628(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for XPCServiceDescription();
  MEMORY[0x1F4188790](v3);
  uint64_t v5 = &v16[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = a2 + 16;
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    sub_1BBBCF01C(Strong + qword_1EB9F8B70, (uint64_t)v5);
    swift_release();
    uint64_t v8 = *(void (**)(void))&v5[*(int *)(v3 + 40)];
    sub_1BBBCE414((uint64_t)v8);
    sub_1BBBD2398((uint64_t)v5);
    if (v8)
    {
      swift_beginAccess();
      uint64_t v9 = MEMORY[0x1C1862C70](v6);
      if (v9)
      {
        unint64_t v10 = (void *)v9;
        v8();

        return sub_1BBBCB428((uint64_t)v8);
      }
      sub_1BBBCB428((uint64_t)v8);
    }
  }
  sub_1BBBEB558();
  if (qword_1EB9F7C88 != -1) {
    swift_once();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F7C80);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_1BBBED370;
  swift_beginAccess();
  uint64_t v17 = MEMORY[0x1C1862C70](v6);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F7680);
  uint64_t v13 = sub_1BBBEB2B8();
  uint64_t v15 = v14;
  *(void *)(v12 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v12 + 64) = sub_1BBBBC9E8();
  *(void *)(v12 + 32) = v13;
  *(void *)(v12 + 40) = v15;
  sub_1BBBEADE8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BBBCF858(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v33 = a2;
  uint64_t v31 = type metadata accessor for XPCServiceDescription();
  MEMORY[0x1F4188790](v31);
  uint64_t v30 = (uint64_t)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1BBBEB0B8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  unint64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = sub_1BBBEB0F8();
  uint64_t v11 = *(void *)(v32 - 8);
  MEMORY[0x1F4188790](v32);
  uint64_t v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = a3 + 16;
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a4;
  *(void *)(v15 + 24) = Strong;
  aBlock[4] = sub_1BBBD27E8;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BBBAED3C;
  aBlock[3] = &block_descriptor_43_0;
  uint64_t v16 = _Block_copy(aBlock);
  uint64_t v34 = Strong;
  swift_retain();
  sub_1BBBEB0D8();
  uint64_t v37 = MEMORY[0x1E4FBC860];
  sub_1BBBD2810(qword_1EB9F78A0, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F7968);
  sub_1BBBAEF0C((unint64_t *)&qword_1EB9F7970, &qword_1EB9F7968);
  sub_1BBBEB798();
  MEMORY[0x1C1861D70](0, v13, v10, v16);
  _Block_release(v16);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v32);
  swift_release();
  swift_beginAccess();
  uint64_t v17 = swift_weakLoadStrong();
  if (v17)
  {
    uint64_t v18 = v30;
    sub_1BBBCF01C(v17 + qword_1EB9F8B70, v30);
    swift_release();
    uint64_t v19 = *(void (**)(void))(v18 + *(int *)(v31 + 44));
    sub_1BBBCE414((uint64_t)v19);
    sub_1BBBD2398(v18);
    if (v19)
    {
      uint64_t v20 = v35;
      swift_beginAccess();
      uint64_t v21 = MEMORY[0x1C1862C70](v20);
      if (v21)
      {
        uint64_t v22 = (void *)v21;
        v19();

        sub_1BBBCB428((uint64_t)v19);
        return swift_release();
      }
      sub_1BBBCB428((uint64_t)v19);
    }
  }
  sub_1BBBEB558();
  if (qword_1EB9F7C88 != -1) {
    swift_once();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F7C80);
  uint64_t v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_1BBBED370;
  uint64_t v25 = v35;
  swift_beginAccess();
  uint64_t v36 = MEMORY[0x1C1862C70](v25);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F7680);
  uint64_t v26 = sub_1BBBEB2B8();
  uint64_t v28 = v27;
  *(void *)(v24 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v24 + 64) = sub_1BBBBC9E8();
  *(void *)(v24 + 32) = v26;
  *(void *)(v24 + 40) = v28;
  sub_1BBBEADE8();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BBBCFD50()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 80);
  uint64_t v2 = sub_1BBBEB6B8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v11 - v4;
  uint64_t v6 = qword_1EB9F75E8;
  uint64_t v7 = *(void **)(v0 + qword_1EB9F75E8);
  if (v7)
  {
    objc_msgSend(v7, sel_invalidate);
    uint64_t v8 = *(void **)(v0 + v6);
  }
  else
  {
    uint64_t v8 = 0;
  }
  *(void *)(v0 + v6) = 0;

  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v1 - 8) + 56))(v5, 1, 1, v1);
  uint64_t v9 = v0 + *(void *)(*(void *)v0 + 112);
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 40))(v9, v5, v2);
  return swift_endAccess();
}

uint64_t XPCSession.__allocating_init(service:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  XPCSession.init(service:)(a1);
  return v2;
}

uint64_t *XPCSession.init(service:)(uint64_t a1)
{
  uint64_t v17 = a1;
  uint64_t v2 = *v1;
  uint64_t v3 = sub_1BBBEADC8();
  uint64_t v15 = *(void *)(v3 - 8);
  uint64_t v16 = v3;
  MEMORY[0x1F4188790](v3);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1BBBEB578();
  MEMORY[0x1F4188790](v6);
  uint64_t v7 = sub_1BBBEB0F8();
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v8 = sub_1BBBEB608();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(uint64_t *)((char *)v1 + qword_1EB9F75E8) = 0;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)(v2 + 80) - 8) + 56))((uint64_t)v1 + *(void *)(*v1 + 112), 1, 1);
  uint64_t v14 = *(void *)(*v1 + 120);
  sub_1BBBB4D64(0, (unint64_t *)&qword_1EB9F8340);
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x1E4FBCC68], v8);
  sub_1BBBEB0D8();
  uint64_t v18 = MEMORY[0x1E4FBC860];
  sub_1BBBD2810((unint64_t *)&qword_1EB9F8330, MEMORY[0x1E4FBCC10]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F8320);
  sub_1BBBAEF0C((unint64_t *)&qword_1EB9F8328, &qword_1EB9F8320);
  sub_1BBBEB798();
  *(uint64_t *)((char *)v1 + v14) = sub_1BBBEB648();
  sub_1BBBEADB8();
  (*(void (**)(uint64_t, char *, uint64_t))(v15 + 32))((uint64_t)v1 + qword_1EB9F8B68, v5, v16);
  sub_1BBBD029C(v17, (uint64_t)v1 + qword_1EB9F8B70);
  return v1;
}

uint64_t sub_1BBBD029C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for XPCServiceDescription();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t *XPCSession.__allocating_init(connection:)(void *a1)
{
  return XPCSession.init(connection:)(a1);
}

uint64_t *XPCSession.init(connection:)(void *a1)
{
  uint64_t v2 = v1;
  id v49 = a1;
  uint64_t v39 = *v1;
  uint64_t v3 = v39;
  uint64_t v4 = sub_1BBBEADC8();
  uint64_t v47 = *(void *)(v4 - 8);
  uint64_t v48 = v4;
  MEMORY[0x1F4188790](v4);
  uint64_t v46 = (char *)v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = sub_1BBBEABA8();
  uint64_t v42 = *(void *)(v44 - 8);
  MEMORY[0x1F4188790](v44);
  uint64_t v40 = (char *)v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = type metadata accessor for XPCServiceDescription();
  uint64_t v7 = MEMORY[0x1F4188790](v43);
  uint64_t v41 = (char *)v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  uint64_t v45 = (uint64_t)v36 - v9;
  uint64_t v10 = sub_1BBBEB578();
  MEMORY[0x1F4188790](v10);
  uint64_t v11 = sub_1BBBEB0F8();
  MEMORY[0x1F4188790](v11 - 8);
  uint64_t v12 = sub_1BBBEB608();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12);
  uint64_t v15 = (char *)v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = qword_1EB9F75E8;
  *(uint64_t *)((char *)v1 + qword_1EB9F75E8) = 0;
  uint64_t v16 = *(void *)(v3 + 80);
  uint64_t v17 = *(void (**)(void))(*(void *)(v16 - 8) + 56);
  uint64_t v38 = (uint64_t)v2 + *(void *)(*v2 + 112);
  v36[1] = v16;
  v17();
  uint64_t v18 = *(void *)(*v1 + 120);
  sub_1BBBB4D64(0, (unint64_t *)&qword_1EB9F8340);
  (*(void (**)(char *, void, uint64_t))(v13 + 104))(v15, *MEMORY[0x1E4FBCC68], v12);
  sub_1BBBEB0D8();
  v52[0] = MEMORY[0x1E4FBC860];
  sub_1BBBD2810((unint64_t *)&qword_1EB9F8330, MEMORY[0x1E4FBCC10]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F8320);
  sub_1BBBAEF0C((unint64_t *)&qword_1EB9F8328, &qword_1EB9F8320);
  sub_1BBBEB798();
  *(uint64_t *)((char *)v1 + v18) = sub_1BBBEB648();
  id v19 = v49;
  id v20 = objc_msgSend(v19, sel_serviceName);
  if (v20)
  {
    uint64_t v21 = v20;
    sub_1BBBEB2A8();

    uint64_t v22 = v40;
    sub_1BBBEABB8();
    if (objc_msgSend(v19, sel_exportedObject))
    {
      sub_1BBBEB778();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v51, 0, sizeof(v51));
    }
    sub_1BBBB91B4((uint64_t)v51, (uint64_t)v52);
    if (v52[3])
    {
      sub_1BBBB4D64(0, (unint64_t *)&qword_1EB9F76B0);
      if (swift_dynamicCast()) {
        uint64_t v24 = v50;
      }
      else {
        uint64_t v24 = 0;
      }
    }
    else
    {
      sub_1BBBAF618((uint64_t)v52);
      uint64_t v24 = 0;
    }
    id v25 = objc_msgSend(v19, sel_exportedInterface);
    id v26 = objc_msgSend(v19, sel_remoteObjectInterface);

    uint64_t v27 = (uint64_t)v41;
    (*(void (**)(char *, char *, uint64_t))(v42 + 32))(v41, v22, v44);
    uint64_t v28 = (int *)v43;
    *(void *)(v27 + *(int *)(v43 + 20)) = 0;
    *(void *)(v27 + v28[6]) = v24;
    *(void *)(v27 + v28[7]) = v25;
    *(void *)(v27 + v28[8]) = v26;
    uint64_t v29 = (void *)(v27 + v28[10]);
    *uint64_t v29 = 0;
    v29[1] = 0;
    uint64_t v30 = (void *)(v27 + v28[11]);
    *uint64_t v30 = 0;
    v30[1] = 0;
    uint64_t v31 = (void *)(v27 + v28[9]);
    *uint64_t v31 = 0;
    v31[1] = 0;
    uint64_t v32 = v45;
    sub_1BBBD029C(v27, v45);
    uint64_t v33 = v46;
    sub_1BBBEADB8();
    (*(void (**)(uint64_t, char *, uint64_t))(v47 + 32))((uint64_t)v2 + qword_1EB9F8B68, v33, v48);
    sub_1BBBD029C(v32, (uint64_t)v2 + qword_1EB9F8B70);
    uint64_t v34 = *(void **)((char *)v2 + qword_1EB9F75E8);
    *(uint64_t *)((char *)v2 + qword_1EB9F75E8) = (uint64_t)v19;
  }
  else
  {

    uint64_t v23 = sub_1BBBEB6B8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v23 - 8) + 8))(v38, v23);

    swift_deallocPartialClassInstance();
    return 0;
  }
  return v2;
}

uint64_t XPCSession.deinit()
{
  sub_1BBBEB528();
  if (qword_1EB9F7C88 != -1) {
    swift_once();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F7C80);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_1BBBED370;
  swift_retain();
  uint64_t v2 = sub_1BBBEB2B8();
  uint64_t v4 = v3;
  *(void *)(v1 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v1 + 64) = sub_1BBBBC9E8();
  *(void *)(v1 + 32) = v2;
  *(void *)(v1 + 40) = v4;
  sub_1BBBEADE8();
  swift_bridgeObjectRelease();
  sub_1BBBCFD50();
  uint64_t v5 = v0 + qword_1EB9F8B68;
  uint64_t v6 = sub_1BBBEADC8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  sub_1BBBD2398(v0 + qword_1EB9F8B70);

  uint64_t v7 = v0 + *(void *)(*(void *)v0 + 112);
  uint64_t v8 = sub_1BBBEB6B8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);

  return v0;
}

uint64_t XPCSession.__deallocating_deinit()
{
  XPCSession.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x1F4186488](v0, v1, v2);
}

Swift::Void __swiftcall XPCSession.resume()()
{
  uint64_t v1 = *(NSObject **)(v0 + *(void *)(*(void *)v0 + 120));
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = sub_1BBBD23F4;
  *(void *)(v2 + 24) = v0;
  v4[4] = sub_1BBBD2448;
  v4[5] = v2;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 1107296256;
  v4[2] = sub_1BBBAFFC8;
  v4[3] = &block_descriptor_5;
  uint64_t v3 = _Block_copy(v4);
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v1, v3);
  _Block_release(v3);
  LOBYTE(v1) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  if (v1) {
    __break(1u);
  }
}

Swift::Void __swiftcall XPCSession.suspend()()
{
  uint64_t v1 = *(NSObject **)(v0 + *(void *)(*(void *)v0 + 120));
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = sub_1BBBD2460;
  *(void *)(v2 + 24) = v0;
  v4[4] = sub_1BBBD29D4;
  v4[5] = v2;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 1107296256;
  v4[2] = sub_1BBBAFFC8;
  v4[3] = &block_descriptor_7;
  uint64_t v3 = _Block_copy(v4);
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v1, v3);
  _Block_release(v3);
  LOBYTE(v1) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  if (v1) {
    __break(1u);
  }
}

Swift::Void __swiftcall XPCSession.invalidate()()
{
  uint64_t v1 = *(NSObject **)(v0 + *(void *)(*(void *)v0 + 120));
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = sub_1BBBD24B4;
  *(void *)(v2 + 24) = v0;
  v4[4] = sub_1BBBD29D4;
  v4[5] = v2;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 1107296256;
  v4[2] = sub_1BBBAFFC8;
  v4[3] = &block_descriptor_14;
  uint64_t v3 = _Block_copy(v4);
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v1, v3);
  _Block_release(v3);
  LOBYTE(v1) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  if (v1) {
    __break(1u);
  }
}

uint64_t XPCSession.proxy.getter()
{
  return sub_1BBBEB628();
}

uint64_t sub_1BBBD1130@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v20 = a2;
  uint64_t v3 = *a1;
  uint64_t v4 = *(void *)(*a1 + 80);
  uint64_t v5 = sub_1BBBEB6B8();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  uint64_t v11 = (char *)&v19 - v10;
  uint64_t v12 = (uint64_t)a1 + *(void *)(v3 + 112);
  swift_beginAccess();
  id v19 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v19(v11, v12, v5);
  uint64_t v13 = *(void *)(v4 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v4) == 1)
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
    uint64_t v14 = (void *)sub_1BBBCF13C();
    id v15 = objc_msgSend(v14, sel_remoteObjectProxy);

    sub_1BBBEB778();
    swift_unknownObjectRelease();
    int v16 = swift_dynamicCast();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v9, v16 ^ 1u, 1, v4);
    swift_beginAccess();
    (*(void (**)(uint64_t, char *, uint64_t))(v6 + 40))(v12, v9, v5);
    swift_endAccess();
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v19)(v20, v12, v5);
  }
  else
  {
    uint64_t v18 = v20;
    (*(void (**)(uint64_t, char *, uint64_t))(v13 + 32))(v20, v11, v4);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v13 + 56))(v18, 0, 1, v4);
  }
}

uint64_t XPCSession.proxy(errorHandler:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  void v4[6] = *v3;
  return MEMORY[0x1F4188298](sub_1BBBD1454, 0, 0);
}

uint64_t sub_1BBBD1454()
{
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 56) = v2;
  long long v3 = *(_OWORD *)(v0 + 24);
  *(void *)(v2 + 16) = v1;
  *(_OWORD *)(v2 + 24) = v3;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v4;
  uint64_t v5 = sub_1BBBEB6B8();
  *uint64_t v4 = v0;
  v4[1] = sub_1BBBD155C;
  uint64_t v6 = *(void *)(v0 + 16);
  return MEMORY[0x1F41880D8](v6, 0, 0, 0xD000000000000014, 0x80000001BBBEF040, sub_1BBBD24E4, v2, v5);
}

uint64_t sub_1BBBD155C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1BBBD166C(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v23 = a3;
  uint64_t v24 = a4;
  uint64_t v22 = a1;
  uint64_t v5 = *a2;
  uint64_t v6 = sub_1BBBEB0B8();
  uint64_t v28 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1BBBEB0F8();
  uint64_t v26 = *(void *)(v9 - 8);
  uint64_t v27 = v9;
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(void *)(v5 + 80);
  sub_1BBBEB6B8();
  uint64_t v13 = sub_1BBBEB458();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x1F4188790](v13);
  int v16 = (char *)&v22 - v15;
  uint64_t v25 = *(uint64_t *)((char *)a2 + *(void *)(v5 + 120));
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))((char *)&v22 - v15, v22, v13);
  unint64_t v17 = (*(unsigned __int8 *)(v14 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  uint64_t v18 = (char *)swift_allocObject();
  *((void *)v18 + 2) = v12;
  *((void *)v18 + 3) = a2;
  uint64_t v19 = v24;
  *((void *)v18 + 4) = v23;
  *((void *)v18 + 5) = v19;
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(&v18[v17], v16, v13);
  aBlock[4] = sub_1BBBD294C;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BBBAED3C;
  aBlock[3] = &block_descriptor_49;
  uint64_t v20 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  sub_1BBBEB0D8();
  uint64_t v29 = MEMORY[0x1E4FBC860];
  sub_1BBBD2810(qword_1EB9F78A0, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F7968);
  sub_1BBBAEF0C((unint64_t *)&qword_1EB9F7970, &qword_1EB9F7968);
  sub_1BBBEB798();
  MEMORY[0x1C1861D70](0, v11, v8, v20);
  _Block_release(v20);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v8, v6);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v11, v27);
  return swift_release();
}

uint64_t sub_1BBBD1A40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)a1 + 80);
  uint64_t v6 = sub_1BBBEB6B8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x1F4188790](v6);
  uint64_t v10 = (char *)aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  uint64_t v12 = (char *)aBlock - v11;
  uint64_t v13 = (void *)sub_1BBBCF13C();
  aBlock[4] = a2;
  aBlock[5] = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BBBD1CB0;
  aBlock[3] = &block_descriptor_52;
  uint64_t v14 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  id v15 = objc_msgSend(v13, sel_remoteObjectProxyWithErrorHandler_, v14);
  _Block_release(v14);

  sub_1BBBEB778();
  swift_unknownObjectRelease();
  int v16 = swift_dynamicCast();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v12, v16 ^ 1u, 1, v5);
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
  sub_1BBBEB458();
  sub_1BBBEB448();
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v12, v6);
}

void sub_1BBBD1CB0(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t XPCSession.syncProxy(errorHandler:)()
{
  return sub_1BBBEB628();
}

uint64_t sub_1BBBD1DB4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = *a1;
  uint64_t v8 = (void *)sub_1BBBCF13C();
  v14[4] = a2;
  v14[5] = a3;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 1107296256;
  v14[2] = sub_1BBBD1CB0;
  void v14[3] = &block_descriptor_18_0;
  uint64_t v9 = _Block_copy(v14);
  swift_retain();
  swift_release();
  id v10 = objc_msgSend(v8, sel_synchronousRemoteObjectProxyWithErrorHandler_, v9);
  _Block_release(v9);

  sub_1BBBEB778();
  swift_unknownObjectRelease();
  uint64_t v11 = *(void *)(v7 + 80);
  int v12 = swift_dynamicCast();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(a4, v12 ^ 1u, 1, v11);
}

uint64_t static XPCSession.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F40E53E8](a1 + qword_1EB9F8B68, a2 + qword_1EB9F8B68);
}

uint64_t XPCSession.hash(into:)()
{
  return sub_1BBBEB238();
}

uint64_t XPCSession.hashValue.getter()
{
  return sub_1BBBEBBB8();
}

uint64_t sub_1BBBD2000()
{
  return XPCSession.hashValue.getter();
}

uint64_t sub_1BBBD2024()
{
  return XPCSession.hash(into:)();
}

uint64_t sub_1BBBD2048()
{
  return sub_1BBBEBBB8();
}

uint64_t sub_1BBBD2088(uint64_t *a1, uint64_t *a2)
{
  return static XPCSession.== infix(_:_:)(*a1, *a2) & 1;
}

void NSXPCInterface.setClasses(_:for:argumentIndex:ofReply:)(uint64_t a1)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1CA80]), sel_init);
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = 0;
    do
    {
      ++v4;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F7C70);
      objc_msgSend(v2, sel_addObject_, sub_1BBBEBAF8());
      swift_unknownObjectRelease();
    }
    while (v3 != v4);
    swift_bridgeObjectRelease();
  }
  id v5 = v2;
  sub_1BBBEB4A8();

  sub_1BBBEB958();
  __break(1u);
}

uint64_t XPCSession.debugDescription.getter()
{
  uint64_t v1 = *v0;
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_1BBBEBAB8();
  sub_1BBBEB2F8();
  swift_bridgeObjectRelease();
  sub_1BBBEB2F8();
  MEMORY[0x1C1862200](v1, WitnessTable);
  sub_1BBBEB2F8();
  swift_bridgeObjectRelease();
  sub_1BBBEB2F8();
  return 60;
}

uint64_t sub_1BBBD2374()
{
  return XPCSession.debugDescription.getter();
}

uint64_t sub_1BBBD2398(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for XPCServiceDescription();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1BBBD23F4()
{
  id v0 = (id)sub_1BBBCF13C();
  objc_msgSend(v0, sel_resume);
}

uint64_t sub_1BBBD2438()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1BBBD2448()
{
  return sub_1BBBAFF68(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t block_copy_helper_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

void sub_1BBBD2460()
{
  id v0 = (id)sub_1BBBCF13C();
  objc_msgSend(v0, sel_suspend);
}

uint64_t sub_1BBBD24A4()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1BBBD24B8()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1BBBD24C8@<X0>(uint64_t a1@<X8>)
{
  return sub_1BBBD1130(v1, a1);
}

uint64_t sub_1BBBD24E4(uint64_t a1)
{
  return sub_1BBBD166C(a1, *(uint64_t **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_1BBBD24F0@<X0>(uint64_t a1@<X8>)
{
  return sub_1BBBD1DB4(*(uint64_t **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), a1);
}

uint64_t sub_1BBBD2510()
{
  return swift_getWitnessTable();
}

uint64_t sub_1BBBD252C()
{
  uint64_t result = sub_1BBBEADC8();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for XPCServiceDescription();
    if (v2 <= 0x3F)
    {
      uint64_t result = sub_1BBBEB6B8();
      if (v3 <= 0x3F) {
        return swift_initClassMetadata2();
      }
    }
  }
  return result;
}

uint64_t type metadata accessor for XPCSession()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for XPCSession(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for XPCSession);
}

uint64_t dispatch thunk of XPCSession.__allocating_init(service:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of XPCSession.__allocating_init(connection:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t sub_1BBBD26A0()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1BBBD26D8()
{
  swift_weakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1BBBD2710()
{
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1BBBD2750()
{
  return sub_1BBBCF628(*(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_1BBBD275C()
{
  swift_release();

  swift_release();
  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1BBBD27A4()
{
  return sub_1BBBCF858(v0[3], v0[4], v0[5], v0[2]);
}

uint64_t sub_1BBBD27B0()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1BBBD27E8()
{
  if (*(void *)(v0 + 24)) {
    return sub_1BBBCFD50();
  }
  return result;
}

uint64_t sub_1BBBD2810(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1BBBD2858()
{
  sub_1BBBEB6B8();
  uint64_t v1 = sub_1BBBEB458();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x1F4186498](v0, v5, v6);
}

uint64_t sub_1BBBD294C()
{
  sub_1BBBEB6B8();
  sub_1BBBEB458();
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[5];
  return sub_1BBBD1A40(v1, v2, v3);
}

void sub_1BBBD2A18(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_1BBBD2A80()
{
  uint64_t v0 = type metadata accessor for _ImmediateScheduler();
  uint64_t result = swift_allocObject();
  qword_1E9F83780 = v0;
  unk_1E9F83788 = &off_1F14F72B8;
  qword_1E9F83768 = result;
  return result;
}

uint64_t static Scheduler.immediateScheduler.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1BBBD3038(&qword_1E9F833D0, (uint64_t)&qword_1E9F83768, a1);
}

uint64_t static Scheduler.immediateScheduler.setter(uint64_t *a1)
{
  return sub_1BBBD30C0(a1, &qword_1E9F833D0, &qword_1E9F83768);
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        uint64_t result = (uint64_t *)swift_release();
        *uint64_t v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

uint64_t (*static Scheduler.immediateScheduler.modify())()
{
  if (qword_1E9F833D0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1BBBD2DCC()
{
  uint64_t v0 = sub_1BBBEB0C8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BBBAEE84();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4FBCB48], v0);
  uint64_t v4 = sub_1BBBEB658();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  uint64_t v5 = type metadata accessor for _QueueScheduler();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = v4;
  qword_1E9F837A8 = v5;
  unk_1E9F837B0 = &off_1F14F7308;
  qword_1E9F83790 = result;
  return result;
}

uint64_t static Scheduler.globalAsyncScheduler.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1BBBD3038(&qword_1E9F833D8, (uint64_t)&qword_1E9F83790, a1);
}

uint64_t static Scheduler.globalAsyncScheduler.setter(uint64_t *a1)
{
  return sub_1BBBD30C0(a1, &qword_1E9F833D8, &qword_1E9F83790);
}

uint64_t (*static Scheduler.globalAsyncScheduler.modify())()
{
  if (qword_1E9F833D8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1BBBD2FC8()
{
  uint64_t v0 = type metadata accessor for _MainThreadScheduler();
  uint64_t result = swift_allocObject();
  qword_1E9F837D0 = v0;
  unk_1E9F837D8 = &off_1F14F7298;
  qword_1E9F837B8 = result;
  return result;
}

uint64_t static Scheduler.mainThreadScheduler.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1BBBD3038(&qword_1E9F833E0, (uint64_t)&qword_1E9F837B8, a1);
}

uint64_t sub_1BBBD3038@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return sub_1BBBB2A30(a2, a3);
}

uint64_t static Scheduler.mainThreadScheduler.setter(uint64_t *a1)
{
  return sub_1BBBD30C0(a1, &qword_1E9F833E0, &qword_1E9F837B8);
}

uint64_t sub_1BBBD30C0(uint64_t *a1, void *a2, uint64_t *a3)
{
  if (*a2 != -1) {
    swift_once();
  }
  swift_beginAccess();
  __swift_assign_boxed_opaque_existential_1(a3, a1);
  swift_endAccess();
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t (*static Scheduler.mainThreadScheduler.modify())()
{
  if (qword_1E9F833E0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t static Scheduler.scheduler(with:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = type metadata accessor for _QueueScheduler();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  a2[3] = v3;
  a2[4] = (uint64_t)&off_1F14F7308;
  *a2 = v4;
  return MEMORY[0x1F41818D8]();
}

uint64_t type metadata accessor for _QueueScheduler()
{
  return self;
}

uint64_t static Scheduler.serialDispatchQueueScheduler(name:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_1BBBEB578();
  MEMORY[0x1F4188790](v2);
  uint64_t v3 = sub_1BBBEB608();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1BBBEB0F8();
  MEMORY[0x1F4188790](v7 - 8);
  sub_1BBBAEE84();
  sub_1BBBEB0E8();
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E4FBCC68], v3);
  v11[1] = MEMORY[0x1E4FBC860];
  sub_1BBBD5B34((unint64_t *)&qword_1EB9F8330, MEMORY[0x1E4FBCC10]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F8320);
  sub_1BBBAEF0C((unint64_t *)&qword_1EB9F8328, &qword_1EB9F8320);
  sub_1BBBEB798();
  uint64_t v8 = sub_1BBBEB648();
  uint64_t v9 = type metadata accessor for _QueueScheduler();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = v8;
  a1[3] = v9;
  a1[4] = (uint64_t)&off_1F14F7308;
  *a1 = result;
  return result;
}

id static Scheduler.operationQueueScheduler(maxConcurrentOperationCount:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for _OperationQueueScheduler();
  uint64_t v5 = swift_allocObject();
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28F08]), sel_init);
  *(void *)(v5 + 16) = v6;
  id result = objc_msgSend(v6, sel_setMaxConcurrentOperationCount_, a1);
  a2[3] = v4;
  a2[4] = (uint64_t)&off_1F14F72E8;
  *a2 = v5;
  return result;
}

uint64_t type metadata accessor for _OperationQueueScheduler()
{
  return self;
}

uint64_t dispatch thunk of Cancellable.cancel()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of SchedulerProtocol.perform(block:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of SchedulerProtocol.perform(cancellableBlock:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of SchedulerProtocol.after(delay:perform:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

ValueMetadata *type metadata accessor for Scheduler()
{
  return &type metadata for Scheduler;
}

uint64_t sub_1BBBD35B4()
{
  uint64_t v12 = MEMORY[0x1E4FBC860];
  uint64_t v1 = *(NSObject **)(v0 + 32);
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = &v12;
  *(void *)(v2 + 24) = v0;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = sub_1BBBD5E2C;
  *(void *)(v3 + 24) = v2;
  aBlock[4] = sub_1BBBD29D4;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BBBAFFC8;
  aBlock[3] = &block_descriptor_127;
  uint64_t v4 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v1, v4);
  _Block_release(v4);
  LOBYTE(v1) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v6 = v12;
    uint64_t v7 = *(void *)(v12 + 16);
    if (v7)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = v6 + 40;
      do
      {
        uint64_t v9 = *(void (**)(uint64_t))(v8 - 8);
        uint64_t v10 = swift_retain();
        v9(v10);
        swift_release();
        v8 += 16;
        --v7;
      }
      while (v7);
      swift_bridgeObjectRelease();
    }
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1BBBD376C(void *a1, uint64_t a2)
{
  uint64_t v3 = MEMORY[0x1E4FBC860];
  if ((*(unsigned char *)(a2 + 16) & 1) == 0)
  {
    *(unsigned char *)(a2 + 16) = 1;
    swift_beginAccess();
    uint64_t v5 = *(void *)(a2 + 24);
    *(void *)(a2 + 24) = v3;
    uint64_t v3 = v5;
  }
  *a1 = v3;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BBBD37E4()
{
  unsigned __int8 v8 = 0;
  uint64_t v1 = *(NSObject **)(v0 + 32);
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = &v8;
  *(void *)(v2 + 24) = v0;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = sub_1BBBAFF58;
  *(void *)(v3 + 24) = v2;
  aBlock[4] = sub_1BBBD29D4;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BBBAFFC8;
  aBlock[3] = &block_descriptor_117;
  uint64_t v4 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v1, v4);
  _Block_release(v4);
  LOBYTE(v1) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v6 = v8;
    swift_release();
    return v6;
  }
  return result;
}

uint64_t sub_1BBBD3948(uint64_t result, unsigned char *a2, uint64_t a3, uint64_t a4)
{
  if (*(unsigned char *)(result + 16) == 1)
  {
    *a2 = 1;
  }
  else
  {
    uint64_t v6 = result;
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = a3;
    *(void *)(v7 + 24) = a4;
    unsigned __int8 v8 = (void *)(v6 + 24);
    swift_beginAccess();
    uint64_t v9 = *(void **)(v6 + 24);
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v6 + 24) = v9;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v9 = sub_1BBBD561C(0, v9[2] + 1, 1, v9);
      *unsigned __int8 v8 = v9;
    }
    unint64_t v12 = v9[2];
    unint64_t v11 = v9[3];
    if (v12 >= v11 >> 1)
    {
      uint64_t v9 = sub_1BBBD561C((void *)(v11 > 1), v12 + 1, 1, v9);
      *unsigned __int8 v8 = v9;
    }
    v9[2] = v12 + 1;
    uint64_t v13 = &v9[2 * v12];
    v13[4] = sub_1BBBD2448;
    v13[5] = v7;
    return swift_endAccess();
  }
  return result;
}

uint64_t sub_1BBBD3A68()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186488](v0, 40, 7);
}

uint64_t type metadata accessor for CancellationToken()
{
  return self;
}

uint64_t sub_1BBBD3ACC()
{
  uint64_t v1 = sub_1BBBEB578();
  MEMORY[0x1F4188790](v1);
  uint64_t v2 = sub_1BBBEB0F8();
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v3 = sub_1BBBEB608();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(unsigned char *)(v0 + 16) = 0;
  uint64_t v7 = MEMORY[0x1E4FBC860];
  *(void *)(v0 + 24) = MEMORY[0x1E4FBC860];
  sub_1BBBAEE84();
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E4FBCC68], v3);
  sub_1BBBEB0D8();
  v9[1] = v7;
  sub_1BBBD5B34((unint64_t *)&qword_1EB9F8330, MEMORY[0x1E4FBCC10]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F8320);
  sub_1BBBAEF0C((unint64_t *)&qword_1EB9F8328, &qword_1EB9F8320);
  sub_1BBBEB798();
  *(void *)(v0 + 32) = sub_1BBBEB648();
  return v0;
}

uint64_t sub_1BBBD3D18()
{
  return sub_1BBBD35B4();
}

uint64_t sub_1BBBD3D3C()
{
  return MEMORY[0x1F4186488](v0, 16, 7);
}

uint64_t type metadata accessor for _ImmediateScheduler()
{
  return self;
}

uint64_t sub_1BBBD3D70@<X0>(void (*a1)(void *)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for CancellationToken();
  swift_allocObject();
  v6[3] = v4;
  v6[4] = &off_1F14F72D8;
  v6[0] = sub_1BBBD3ACC();
  a1(v6);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  swift_allocObject();
  uint64_t result = sub_1BBBD3ACC();
  a2[3] = v4;
  a2[4] = (uint64_t)&off_1F14F72D8;
  *a2 = result;
  return result;
}

uint64_t sub_1BBBD3E18@<X0>(void (*a1)(id)@<X0>, uint64_t *a2@<X8>, double a3@<D0>)
{
  id v5 = objc_msgSend(self, sel_sleepForTimeInterval_, a3);
  a1(v5);
  uint64_t v6 = type metadata accessor for CancellationToken();
  swift_allocObject();
  uint64_t result = sub_1BBBD3ACC();
  a2[3] = v6;
  a2[4] = (uint64_t)&off_1F14F72D8;
  *a2 = result;
  return result;
}

void sub_1BBBD3EA8(void (*a1)(void *)@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6 = type metadata accessor for CancellationToken();
  swift_allocObject();
  uint64_t v7 = sub_1BBBD3ACC();
  if (objc_msgSend(self, sel_isMainThread))
  {
    uint64_t v14 = (void *)v6;
    id v15 = (uint64_t (*)())&off_1F14F72D8;
    v13[0] = v7;
    swift_retain();
    a1(v13);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
LABEL_5:
    a3[3] = v6;
    a3[4] = (uint64_t)&off_1F14F72D8;
    *a3 = v7;
    return;
  }
  unsigned __int8 v8 = (void *)swift_allocObject();
  void v8[2] = v7;
  void v8[3] = a1;
  v8[4] = a2;
  swift_retain();
  swift_retain();
  uint64_t v9 = CFRunLoopGetMain();
  uint64_t v10 = (const void *)*MEMORY[0x1E4F1D418];
  if (*MEMORY[0x1E4F1D418])
  {
    unint64_t v11 = v9;
    id v15 = sub_1BBBD6014;
    int v16 = v8;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 1107296256;
    v13[2] = sub_1BBBAED3C;
    uint64_t v14 = &block_descriptor_107;
    unint64_t v12 = _Block_copy(v13);
    swift_retain();
    swift_release();
    CFRunLoopPerformBlock(v11, v10, v12);
    _Block_release(v12);
    swift_release();

    goto LABEL_5;
  }
  __break(1u);
}

uint64_t sub_1BBBD4064@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>, double a4@<D0>)
{
  id v36 = 0;
  if (objc_msgSend(self, sel_isMainThread))
  {
    uint64_t v7 = self;
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = a1;
    *(void *)(v8 + 24) = a2;
    uint64_t v34 = sub_1BBBAFFA0;
    uint64_t v35 = v8;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v31 = 1107296256;
    uint64_t v32 = sub_1BBBD2A18;
    uint64_t v33 = &block_descriptor_92;
    uint64_t v9 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    id v10 = objc_msgSend(v7, sel_scheduledTimerWithTimeInterval_repeats_block_, 0, v9, a4);
    _Block_release(v9);
    uint64_t v27 = 0;
    id v36 = v10;
  }
  else
  {
    sub_1BBBAEE84();
    uint64_t v11 = sub_1BBBEB618();
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = &v36;
    *(double *)(v12 + 24) = a4;
    *(void *)(v12 + 32) = a1;
    *(void *)(v12 + 40) = a2;
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = sub_1BBBD5BD8;
    *(void *)(v13 + 24) = v12;
    uint64_t v34 = sub_1BBBD2448;
    uint64_t v35 = v13;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v31 = 1107296256;
    uint64_t v32 = sub_1BBBAFFC8;
    uint64_t v33 = &block_descriptor_73;
    uint64_t v14 = _Block_copy(&aBlock);
    swift_retain();
    swift_retain();
    swift_release();
    dispatch_sync((dispatch_queue_t)v11, v14);

    _Block_release(v14);
    LOBYTE(v11) = swift_isEscapingClosureAtFileLocation();
    uint64_t result = swift_release();
    if (v11)
    {
LABEL_13:
      __break(1u);
      return result;
    }
    uint64_t v27 = sub_1BBBD5BD8;
  }
  uint64_t v16 = type metadata accessor for CancellationToken();
  swift_allocObject();
  uint64_t v17 = sub_1BBBD3ACC();
  uint64_t v18 = swift_allocObject();
  swift_unknownObjectWeakInit();
  char v29 = 0;
  uint64_t v19 = *(NSObject **)(v17 + 32);
  uint64_t v20 = (void *)swift_allocObject();
  void v20[2] = v17;
  v20[3] = &v29;
  v20[4] = sub_1BBBD5C30;
  v20[5] = v18;
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = sub_1BBBD5C78;
  *(void *)(v21 + 24) = v20;
  uint64_t v34 = sub_1BBBD29D4;
  uint64_t v35 = v21;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v31 = 1107296256;
  uint64_t v32 = sub_1BBBAFFC8;
  uint64_t v33 = &block_descriptor_86;
  uint64_t v22 = _Block_copy(&aBlock);
  swift_retain_n();
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v19, v22);
  _Block_release(v22);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation)
  {
    __break(1u);
    goto LABEL_13;
  }
  if (v29 == 1)
  {
    swift_beginAccess();
    uint64_t v24 = (void *)MEMORY[0x1C1862C70](v18 + 16);
    uint64_t v25 = (uint64_t)v27;
    if (v24)
    {
      uint64_t v26 = v24;
      objc_msgSend(v24, sel_invalidate);
      swift_release();
      swift_release();
    }
    else
    {
      swift_release();
      swift_release();
    }
  }
  else
  {
    swift_release();
    swift_release();
    uint64_t v25 = (uint64_t)v27;
  }
  swift_release_n();
  a3[3] = v16;
  a3[4] = (uint64_t)&off_1F14F72D8;
  *a3 = v17;

  return sub_1BBBCB428(v25);
}

void sub_1BBBD4534(void **a1, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t v8 = self;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a2;
  *(void *)(v9 + 24) = a3;
  v13[4] = sub_1BBBB3744;
  v13[5] = v9;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 1107296256;
  v13[2] = sub_1BBBD2A18;
  void v13[3] = &block_descriptor_101;
  id v10 = _Block_copy(v13);
  swift_retain();
  swift_release();
  id v11 = objc_msgSend(v8, sel_scheduledTimerWithTimeInterval_repeats_block_, 0, v10, a4);
  _Block_release(v10);
  uint64_t v12 = *a1;
  *a1 = v11;
}

void sub_1BBBD465C(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = (void *)MEMORY[0x1C1862C70](v1);
  if (v2)
  {
    uint64_t v3 = v2;
    objc_msgSend(v2, sel_invalidate);
  }
}

uint64_t type metadata accessor for _MainThreadScheduler()
{
  return self;
}

void sub_1BBBD46E0(void (*a1)(void *)@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
}

uint64_t sub_1BBBD4704@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>, double a4@<D0>)
{
  return sub_1BBBD4064(a1, a2, a3, a4);
}

uint64_t sub_1BBBD4728(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_1BBBEB0B8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1BBBEB0F8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16[0] = *(void *)(v2 + 16);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a1;
  *(void *)(v13 + 24) = a2;
  aBlock[4] = sub_1BBBAFFA0;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BBBAED3C;
  aBlock[3] = &block_descriptor_64;
  uint64_t v14 = _Block_copy(aBlock);
  swift_retain();
  sub_1BBBEB0D8();
  v16[1] = MEMORY[0x1E4FBC860];
  sub_1BBBD5B34(qword_1EB9F78A0, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F7968);
  sub_1BBBAEF0C((unint64_t *)&qword_1EB9F7970, &qword_1EB9F7968);
  sub_1BBBEB798();
  MEMORY[0x1C1861D70](0, v12, v8, v14);
  _Block_release(v14);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return swift_release();
}

uint64_t sub_1BBBD49D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v21 = a3;
  uint64_t v6 = sub_1BBBEB0B8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_1BBBEB0F8();
  uint64_t v10 = *(void *)(v20 - 8);
  MEMORY[0x1F4188790](v20);
  uint64_t v12 = (char *)v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = type metadata accessor for CancellationToken();
  swift_allocObject();
  uint64_t v13 = sub_1BBBD3ACC();
  v18[1] = *(void *)(v3 + 16);
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = v13;
  void v14[3] = a1;
  v14[4] = a2;
  aBlock[4] = sub_1BBBD5B80;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BBBAED3C;
  aBlock[3] = &block_descriptor_58;
  id v15 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  sub_1BBBEB0D8();
  uint64_t v22 = MEMORY[0x1E4FBC860];
  sub_1BBBD5B34(qword_1EB9F78A0, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F7968);
  sub_1BBBAEF0C((unint64_t *)&qword_1EB9F7970, &qword_1EB9F7968);
  sub_1BBBEB798();
  MEMORY[0x1C1861D70](0, v12, v9, v15);
  _Block_release(v15);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v20);
  uint64_t result = swift_release();
  uint64_t v17 = v21;
  v21[3] = v19;
  v17[4] = (uint64_t)&off_1F14F72D8;
  *uint64_t v17 = v13;
  return result;
}

uint64_t sub_1BBBD4CD8(uint64_t a1, void (*a2)(void *))
{
  uint64_t result = sub_1BBBD37E4();
  if ((result & 1) == 0)
  {
    v5[3] = type metadata accessor for CancellationToken();
    v5[4] = &off_1F14F72D8;
    v5[0] = a1;
    swift_retain();
    a2(v5);
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
  }
  return result;
}

uint64_t sub_1BBBD4D50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>, double a4@<D0>)
{
  uint64_t v26 = a1;
  uint64_t v32 = a3;
  uint64_t v7 = sub_1BBBEB0B8();
  uint64_t v31 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1BBBEB0F8();
  uint64_t v29 = *(void *)(v10 - 8);
  uint64_t v30 = v10;
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1BBBEB118();
  uint64_t v25 = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x1F4188790](v13);
  uint64_t v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v15);
  uint64_t v19 = (char *)&v24 - v18;
  uint64_t v28 = type metadata accessor for CancellationToken();
  swift_allocObject();
  uint64_t v27 = sub_1BBBD3ACC();
  uint64_t v24 = *(void *)(v4 + 16);
  sub_1BBBEB108();
  MEMORY[0x1C18618A0](v17, a4);
  uint64_t v20 = *(void (**)(char *, uint64_t))(v14 + 8);
  v20(v17, v13);
  aBlock[4] = v26;
  aBlock[5] = a2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BBBAED3C;
  aBlock[3] = &block_descriptor_52_0;
  uint64_t v21 = _Block_copy(aBlock);
  swift_retain();
  sub_1BBBEB0D8();
  uint64_t v33 = MEMORY[0x1E4FBC860];
  sub_1BBBD5B34(qword_1EB9F78A0, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F7968);
  sub_1BBBAEF0C((unint64_t *)&qword_1EB9F7970, &qword_1EB9F7968);
  sub_1BBBEB798();
  MEMORY[0x1C1861CC0](v19, v12, v9, v21);
  _Block_release(v21);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v9, v7);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v12, v30);
  v20(v19, v25);
  uint64_t result = swift_release();
  uint64_t v23 = v32;
  v32[3] = v28;
  v23[4] = (uint64_t)&off_1F14F72D8;
  uint64_t *v23 = v27;
  return result;
}

uint64_t sub_1BBBD5110()
{
  return MEMORY[0x1F4186488](v0, 24, 7);
}

uint64_t sub_1BBBD5148(uint64_t a1, uint64_t a2)
{
  return sub_1BBBD4728(a1, a2);
}

uint64_t sub_1BBBD516C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_1BBBD49D8(a1, a2, a3);
}

uint64_t sub_1BBBD5190@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>, double a4@<D0>)
{
  return sub_1BBBD4D50(a1, a2, a3, a4);
}

void sub_1BBBD51B4(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v4 = v3;
  uint64_t v8 = type metadata accessor for CancellationToken();
  swift_allocObject();
  uint64_t v9 = sub_1BBBD3ACC();
  uint64_t v10 = (void *)swift_allocObject();
  void v10[2] = a1;
  v10[3] = a2;
  v10[4] = v9;
  v14[4] = sub_1BBBD5B28;
  v14[5] = v10;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 1107296256;
  v14[2] = sub_1BBBAED3C;
  void v14[3] = &block_descriptor_49_0;
  uint64_t v11 = _Block_copy(v14);
  uint64_t v12 = self;
  swift_retain();
  swift_retain();
  id v13 = objc_msgSend(v12, sel_blockOperationWithBlock_, v11);
  _Block_release(v11);
  swift_release();
  objc_msgSend(*(id *)(v4 + 16), sel_addOperation_, v13);
  a3[3] = v8;
  a3[4] = (uint64_t)&off_1F14F72D8;

  *a3 = v9;
}

uint64_t sub_1BBBD531C(void (*a1)(void *), uint64_t a2, uint64_t a3)
{
  v6[3] = type metadata accessor for CancellationToken();
  v6[4] = &off_1F14F72D8;
  v6[0] = a3;
  swift_retain();
  a1(v6);
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
}

uint64_t sub_1BBBD5388@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>, double a4@<D0>)
{
  void (*v13)(void *__return_ptr, uint64_t (*)(), void *, uint64_t, uint64_t, double);
  uint64_t result;
  void v15[5];
  void v16[3];
  uint64_t v17;
  uint64_t v18;

  uint64_t v8 = type metadata accessor for CancellationToken();
  swift_allocObject();
  uint64_t v9 = sub_1BBBD3ACC();
  if (qword_1E9F833D8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  sub_1BBBB2A30((uint64_t)&qword_1E9F83790, (uint64_t)v16);
  uint64_t v10 = v17;
  uint64_t v11 = v18;
  __swift_project_boxed_opaque_existential_1(v16, v17);
  uint64_t v12 = (void *)swift_allocObject();
  void v12[2] = v9;
  uint64_t v12[3] = a1;
  v12[4] = a2;
  id v13 = *(void (**)(void *__return_ptr, uint64_t (*)(), void *, uint64_t, uint64_t, double))(v11 + 24);
  swift_retain();
  swift_retain();
  v13(v15, sub_1BBBD5AA4, v12, v10, v11, a4);
  swift_release();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v15);
  uint64_t result = __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
  a3[3] = v8;
  a3[4] = (uint64_t)&off_1F14F72D8;
  *a3 = v9;
  return result;
}

void sub_1BBBD5508(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(*(void *)v2 + 16);
  v5[4] = a1;
  void v5[5] = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 1107296256;
  void v5[2] = sub_1BBBAED3C;
  v5[3] = &block_descriptor_6;
  uint64_t v4 = _Block_copy(v5);
  swift_retain();
  swift_release();
  objc_msgSend(v3, sel_addOperationWithBlock_, v4);
  _Block_release(v4);
}

void sub_1BBBD55C4(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
}

uint64_t sub_1BBBD55E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>, double a4@<D0>)
{
  return sub_1BBBD5388(a1, a2, a3, a4);
}

uint64_t block_copy_helper_6(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

void *sub_1BBBD561C(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
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
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F7798);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      void v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      id v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x1E4FBC860];
      id v13 = (void *)(MEMORY[0x1E4FBC860] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_1BBBD5C94(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1BBBD572C(char a1, int64_t a2, char a3, unint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
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
    id v13 = (void *)MEMORY[0x1E4FBC860];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F837E8);
  uint64_t v10 = *(void *)(type metadata accessor for Sequencer.WorkItem() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  id v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_1BBBEB948();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  void v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for Sequencer.WorkItem() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1BBBD5E44(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

void sub_1BBBD5994(void (*a1)(void), uint64_t a2)
{
  if (objc_msgSend(self, sel_isMainThread))
  {
    a1();
  }
  else
  {
    uint64_t v4 = CFRunLoopGetMain();
    char v5 = (const void *)*MEMORY[0x1E4F1D418];
    if (*MEMORY[0x1E4F1D418])
    {
      unint64_t v6 = v4;
      v8[4] = a1;
      v8[5] = a2;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 1107296256;
      void v8[2] = sub_1BBBAED3C;
      void v8[3] = &block_descriptor_43_1;
      uint64_t v7 = _Block_copy(v8);
      swift_retain();
      swift_release();
      CFRunLoopPerformBlock(v6, v5, v7);
      _Block_release(v7);
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t sub_1BBBD5AA4()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 24);
  uint64_t result = sub_1BBBD37E4();
  if ((result & 1) == 0) {
    return v1();
  }
  return result;
}

uint64_t sub_1BBBD5AE8()
{
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1BBBD5B28()
{
  return sub_1BBBD531C(*(void (**)(void *))(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_1BBBD5B34(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1BBBD5B80()
{
  return sub_1BBBD4CD8(*(void *)(v0 + 16), *(void (**)(void *))(v0 + 24));
}

uint64_t sub_1BBBD5BA0()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 48, 7);
}

void sub_1BBBD5BD8()
{
  sub_1BBBD4534(*(void ***)(v0 + 16), *(void *)(v0 + 32), *(void *)(v0 + 40), *(double *)(v0 + 24));
}

uint64_t sub_1BBBD5BE8()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1BBBD5BF8()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1BBBD5C30()
{
  sub_1BBBD465C(v0);
}

uint64_t sub_1BBBD5C38()
{
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1BBBD5C78()
{
  return sub_1BBBD3948(*(void *)(v0 + 16), *(unsigned char **)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40));
}

uint64_t sub_1BBBD5C84()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1BBBD5C94(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F837E0);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_1BBBEB998();
  __break(1u);
  return result;
}

uint64_t objectdestroyTm()
{
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1BBBD5DE4()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1BBBD5E1C()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1BBBD5E2C()
{
  return sub_1BBBD376C(*(void **)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_1BBBD5E34()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1BBBD5E44(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(type metadata accessor for Sequencer.WorkItem() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = sub_1BBBEB998();
  __break(1u);
  return result;
}

uint64_t CustomCodableKeyDictionary.wrappedValue.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t CustomCodableKeyDictionary.encode(to:)(void *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v55 = *(void *)(*(void *)(a2 + 24) - 8);
  uint64_t v6 = MEMORY[0x1F4188790](a1);
  unint64_t v60 = (char *)v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(v8 + 16);
  uint64_t v54 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v6);
  unint64_t v11 = (char *)v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = v12;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v65 = sub_1BBBEB6B8();
  int64_t v70 = *(void *)(v65 - 8);
  uint64_t v14 = MEMORY[0x1F4188790](v65);
  uint64_t v66 = (char *)v47 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v14);
  uint64_t v67 = (char *)v47 - v16;
  uint64_t v61 = a2;
  uint64_t v69 = sub_1BBBEBA18();
  uint64_t v48 = *(void *)(v69 - 8);
  MEMORY[0x1F4188790](v69);
  unint64_t v18 = (char *)v47 - v17;
  unint64_t v19 = *v3;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v68 = v18;
  sub_1BBBEBC18();
  uint64_t v71 = v9;
  if (v19)
  {
    unint64_t v20 = v19;
  }
  else
  {
    swift_getTupleTypeMetadata2();
    sub_1BBBEB3B8();
    unint64_t v20 = sub_1BBBEB1B8();
  }
  uint64_t v21 = v66;
  if ((v20 & 0xC000000000000001) != 0)
  {
    uint64_t v22 = sub_1BBBEB918();
    unint64_t v49 = 0;
    uint64_t v23 = 0;
    unint64_t v24 = 0;
    unint64_t v20 = v22 | 0x8000000000000000;
  }
  else
  {
    uint64_t v25 = -1 << *(unsigned char *)(v20 + 32);
    uint64_t v26 = *(void *)(v20 + 64);
    unint64_t v49 = v20 + 64;
    uint64_t v23 = ~v25;
    uint64_t v27 = -v25;
    if (v27 < 64) {
      uint64_t v28 = ~(-1 << v27);
    }
    else {
      uint64_t v28 = -1;
    }
    unint64_t v24 = v28 & v26;
  }
  uint64_t v51 = v20 & 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v64 = TupleTypeMetadata2 - 8;
  v47[1] = v23;
  uint64_t v53 = v54 + 16;
  uint64_t v52 = v55 + 16;
  uint64_t v63 = (void (**)(char *, char *, uint64_t))(v70 + 32);
  uint64_t v59 = (void (**)(char *, char *, uint64_t))(v54 + 32);
  uint64_t v56 = (void (**)(char *, uint64_t))(v55 + 8);
  uint64_t v57 = (void (**)(char *, uint64_t))(v54 + 8);
  uint64_t v58 = (void (**)(char *, char *, uint64_t))(v55 + 32);
  int64_t v50 = (unint64_t)(v23 + 64) >> 6;
  v47[0] = v50 - 1;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v30 = 0;
  while (1)
  {
    uint64_t v31 = v67;
    unint64_t v62 = v24;
    int64_t v70 = v30;
    if ((v20 & 0x8000000000000000) == 0) {
      break;
    }
    if (sub_1BBBEB928())
    {
      sub_1BBBEBA88();
      swift_unknownObjectRelease();
      sub_1BBBEBA88();
      swift_unknownObjectRelease();
      uint64_t v35 = 0;
    }
    else
    {
      uint64_t v35 = 1;
    }
    int64_t v34 = v70;
LABEL_24:
    uint64_t v37 = *(void *)(TupleTypeMetadata2 - 8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v37 + 56))(v21, v35, 1, TupleTypeMetadata2);
    (*v63)(v31, v21, v65);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v31, 1, TupleTypeMetadata2) == 1) {
      goto LABEL_42;
    }
    unint64_t v38 = v20;
    uint64_t v39 = &v31[*(int *)(TupleTypeMetadata2 + 48)];
    uint64_t v40 = v31;
    uint64_t v41 = v71;
    (*v59)(v11, v40, v71);
    uint64_t v42 = v11;
    uint64_t v43 = v60;
    uint64_t v44 = v72;
    (*v58)(v60, v39, v72);
    uint64_t v45 = v73;
    sub_1BBBEBA08();
    uint64_t v73 = v45;
    if (v45)
    {
      (*v56)(v43, v44);
      (*v57)(v42, v41);
LABEL_42:
      sub_1BBBCB438();
      return (*(uint64_t (**)(char *, uint64_t))(v48 + 8))(v68, v69);
    }
    (*v56)(v43, v44);
    uint64_t result = ((uint64_t (*)(char *, uint64_t))*v57)(v42, v41);
    int64_t v30 = v34;
    unint64_t v11 = v42;
    uint64_t v21 = v66;
    unint64_t v20 = v38;
  }
  if (v24)
  {
    unint64_t v32 = __clz(__rbit64(v24));
    v24 &= v24 - 1;
    unint64_t v33 = v32 | (v30 << 6);
    int64_t v34 = v30;
    goto LABEL_14;
  }
  int64_t v34 = v30 + 1;
  if (__OFADD__(v30, 1))
  {
    __break(1u);
    goto LABEL_44;
  }
  if (v34 >= v50)
  {
    unint64_t v24 = 0;
    uint64_t v35 = 1;
    int64_t v34 = v30;
    goto LABEL_24;
  }
  unint64_t v36 = *(void *)(v49 + 8 * v34);
  if (v36) {
    goto LABEL_21;
  }
  if (v30 + 2 >= v50)
  {
    unint64_t v24 = 0;
    uint64_t v35 = 1;
    goto LABEL_24;
  }
  unint64_t v36 = *(void *)(v49 + 8 * (v30 + 2));
  if (v36)
  {
    int64_t v34 = v30 + 2;
    goto LABEL_21;
  }
  int64_t v46 = v30 + 3;
  if (v30 + 3 >= v50)
  {
    unint64_t v24 = 0;
    uint64_t v35 = 1;
    int64_t v34 = v30 + 2;
    goto LABEL_24;
  }
  unint64_t v36 = *(void *)(v49 + 8 * v46);
  if (v36)
  {
    int64_t v34 = v30 + 3;
LABEL_21:
    unint64_t v24 = (v36 - 1) & v36;
    unint64_t v33 = __clz(__rbit64(v36)) + (v34 << 6);
LABEL_14:
    (*(void (**)(char *, unint64_t, uint64_t))(v54 + 16))(v21, *(void *)(v20 + 48) + *(void *)(v54 + 72) * v33, v71);
    (*(void (**)(char *, unint64_t, uint64_t))(v55 + 16))(&v21[*(int *)(TupleTypeMetadata2 + 48)], *(void *)(v20 + 56) + *(void *)(v55 + 72) * v33, v72);
    uint64_t v35 = 0;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v34 = v46 + 1;
    if (__OFADD__(v46, 1)) {
      break;
    }
    if (v34 >= v50)
    {
      unint64_t v24 = 0;
      uint64_t v35 = 1;
      int64_t v34 = v47[0];
      goto LABEL_24;
    }
    unint64_t v36 = *(void *)(v49 + 8 * v34);
    ++v46;
    if (v36) {
      goto LABEL_21;
    }
  }
LABEL_44:
  __break(1u);
  return result;
}

uint64_t CustomCodableKeyDictionary.init(wrappedValue:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t CustomCodableKeyDictionary.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t *a8@<X8>)
{
  uint64_t v29 = a6;
  uint64_t v30 = a7;
  uint64_t v31 = a3;
  uint64_t v32 = a5;
  uint64_t v28 = a8;
  uint64_t v33 = sub_1BBBEB9F8();
  uint64_t v12 = *(void *)(v33 - 8);
  MEMORY[0x1F4188790](v33);
  uint64_t v14 = (char *)v26 - v13;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BBBEBBF8();
  if (!v8)
  {
    uint64_t v27 = v12;
    uint64_t v15 = sub_1BBBEB9E8();
    v26[1] = v26;
    uint64_t v35 = v15;
    MEMORY[0x1F4188790](v15);
    uint64_t v17 = v31;
    uint64_t v16 = v32;
    v26[-8] = a2;
    v26[-7] = v17;
    v26[-6] = a4;
    v26[-5] = v16;
    uint64_t v18 = v30;
    v26[-4] = v29;
    v26[-3] = v18;
    v26[-2] = v14;
    uint64_t v19 = sub_1BBBEB428();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(qword_1EB9F74C0);
    uint64_t WitnessTable = swift_getWitnessTable();
    uint64_t v23 = sub_1BBBD6C30((void (*)(char *, char *))sub_1BBBD71F8, (uint64_t)&v26[-10], v19, TupleTypeMetadata2, v21, WitnessTable, MEMORY[0x1E4FBC0F0], (uint64_t)&v34);
    swift_bridgeObjectRelease();
    uint64_t v35 = v23;
    sub_1BBBEB428();
    swift_getWitnessTable();
    uint64_t v24 = sub_1BBBEB1C8();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v14, v33);
    *uint64_t v28 = v24;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t sub_1BBBD6AF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>, void *a4)
{
  swift_getTupleTypeMetadata2();
  uint64_t v7 = *(void *)(a2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(a3, a1, a2);
  sub_1BBBEB9F8();
  uint64_t result = sub_1BBBEB9D8();
  if (v9)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a3, a2);
    *a4 = v9;
  }
  return result;
}

uint64_t sub_1BBBD6C30(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v28 = a5;
  uint64_t v29 = a8;
  unint64_t v38 = a1;
  uint64_t v39 = a2;
  uint64_t v27 = *(void *)(a5 - 8);
  MEMORY[0x1F4188790](a1);
  uint64_t v40 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v33 = *(void (***)(char *, uint64_t))(AssociatedTypeWitness - 8);
  uint64_t v10 = MEMORY[0x1F4188790](AssociatedTypeWitness);
  uint64_t v12 = (char *)&v26 - v11;
  MEMORY[0x1F4188790](v10);
  uint64_t v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = swift_getAssociatedTypeWitness();
  uint64_t v30 = *(void *)(v15 - 8);
  uint64_t v31 = v15;
  MEMORY[0x1F4188790](v15);
  uint64_t v17 = (char *)&v26 - v16;
  uint64_t v18 = sub_1BBBEB4E8();
  if (!v18) {
    return sub_1BBBEB3B8();
  }
  uint64_t v19 = v18;
  uint64_t v43 = sub_1BBBEB198();
  uint64_t v32 = sub_1BBBEB8D8();
  sub_1BBBEB8A8();
  uint64_t v36 = v8;
  uint64_t result = sub_1BBBEB4D8();
  if (v19 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v34 = (void (**)(char *))(v33 + 2);
    uint64_t v35 = v14;
    ++v33;
    while (1)
    {
      uint64_t v21 = (void (*)(char *, void))sub_1BBBEB508();
      uint64_t v22 = v12;
      uint64_t v23 = v12;
      uint64_t v24 = AssociatedTypeWitness;
      (*v34)(v22);
      v21(v42, 0);
      uint64_t v25 = v41;
      v38(v23, v40);
      if (v25) {
        break;
      }
      uint64_t v41 = 0;
      (*v33)(v23, v24);
      sub_1BBBEB8B8();
      sub_1BBBEB4F8();
      --v19;
      uint64_t v12 = v23;
      if (!v19)
      {
        (*(void (**)(char *, uint64_t))(v30 + 8))(v17, v31);
        return v43;
      }
    }
    (*v33)(v23, v24);
    (*(void (**)(char *, uint64_t))(v30 + 8))(v17, v31);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v27 + 32))(v29, v40, v28);
  }
  return result;
}

uint64_t sub_1BBBD7030@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  return CustomCodableKeyDictionary.init(from:)(a1, a2[2], a2[3], a2[4], a2[5], a2[6], a2[7], a3);
}

uint64_t sub_1BBBD7058(void *a1, uint64_t a2)
{
  return CustomCodableKeyDictionary.encode(to:)(a1, a2);
}

uint64_t KeyedDecodingContainer.decode<A, B>(_:forKey:)@<X0>(void *a1@<X8>)
{
  type metadata accessor for CustomCodableKeyDictionary();
  swift_getWitnessTable();
  uint64_t result = sub_1BBBEB9C8();
  if (!v1)
  {
    uint64_t v4 = v5;
    if (v5 == 1) {
      uint64_t v4 = 0;
    }
    *a1 = v4;
  }
  return result;
}

uint64_t static CustomCodableKeyDictionary<>.== infix(_:_:)(void *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  if (*a1)
  {
    if (v2)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      char v3 = sub_1BBBEB1F8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v3) {
        return 1;
      }
    }
  }
  else if (!v2)
  {
    return 1;
  }
  return 0;
}

uint64_t sub_1BBBD71C0(void *a1, uint64_t *a2)
{
  return static CustomCodableKeyDictionary<>.== infix(_:_:)(a1, a2) & 1;
}

uint64_t sub_1BBBD71F8@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  return sub_1BBBD6AF0(a1, *(void *)(v3 + 16), a3, a2);
}

uint64_t type metadata accessor for CustomCodableKeyDictionary()
{
  return swift_getGenericMetadata();
}

uint64_t sub_1BBBD7248(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 56);
}

void *sub_1BBBD7250(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1BBBD7280()
{
  return swift_bridgeObjectRelease();
}

void *sub_1BBBD7288(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void *sub_1BBBD72D0(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1BBBD7304(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t sub_1BBBD7360(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
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
      *(void *)uint64_t result = a2;
    }
  }
  return result;
}

uint64_t sub_1BBBD73B4()
{
  uint64_t v0 = sub_1BBBEAE28();
  __swift_allocate_value_buffer(v0, qword_1EB9F8B90);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EB9F8B90);
  return sub_1BBBEAE18();
}

uint64_t sub_1BBBD7420()
{
  sub_1BBBBCA3C();
  uint64_t result = sub_1BBBEB6A8();
  qword_1E9F85898 = result;
  return result;
}

uint64_t sub_1BBBD7488()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

char *sub_1BBBD751C(char *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  if (*(void *)(v4 + 64) <= 8uLL) {
    uint64_t v5 = 8;
  }
  else {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  int v6 = *(_DWORD *)(v4 + 80);
  if ((v6 & 0x1000F8) != 0 || (unint64_t)(v5 + 1) > 0x18)
  {
    uint64_t v8 = *(char **)a2;
    *(void *)uint64_t v3 = *(void *)a2;
    uint64_t v3 = &v8[(unsigned __int16)((v6 & 0xF8) + 23) & (unsigned __int16)~(v6 & 0xF8) & 0x1F8];
    swift_retain();
  }
  else
  {
    unsigned int v9 = a2[v5];
    unsigned int v10 = v9 - 2;
    if (v9 >= 2)
    {
      if (v5 <= 3) {
        uint64_t v11 = v5;
      }
      else {
        uint64_t v11 = 4;
      }
      switch(v11)
      {
        case 1:
          int v12 = *a2;
          goto LABEL_19;
        case 2:
          int v12 = *(unsigned __int16 *)a2;
          goto LABEL_19;
        case 3:
          int v12 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_19;
        case 4:
          int v12 = *(_DWORD *)a2;
LABEL_19:
          int v13 = (v12 | (v10 << (8 * v5))) + 2;
          unsigned int v9 = v12 + 2;
          if (v5 < 4) {
            unsigned int v9 = v13;
          }
          break;
        default:
          break;
      }
    }
    if (v9 == 1)
    {
      uint64_t v14 = *(void *)a2;
      id v15 = *(id *)a2;
      *(void *)uint64_t v3 = v14;
      v3[v5] = 1;
    }
    else
    {
      (*(void (**)(char *))(v4 + 16))(a1);
      v3[v5] = 0;
    }
  }
  return v3;
}

void sub_1BBBD76A4(unsigned __int8 *a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(*(void *)(*(void *)(a2 + 16) - 8) + 64);
  if (v2 <= 8) {
    unint64_t v2 = 8;
  }
  unsigned int v3 = a1[v2];
  unsigned int v4 = v3 - 2;
  if (v3 >= 2)
  {
    if (v2 <= 3) {
      uint64_t v5 = v2;
    }
    else {
      uint64_t v5 = 4;
    }
    switch(v5)
    {
      case 1:
        int v6 = *a1;
        goto LABEL_12;
      case 2:
        int v6 = *(unsigned __int16 *)a1;
        goto LABEL_12;
      case 3:
        int v6 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_12;
      case 4:
        int v6 = *(_DWORD *)a1;
LABEL_12:
        int v7 = (v6 | (v4 << (8 * v2))) + 2;
        unsigned int v3 = v6 + 2;
        if (v2 < 4) {
          unsigned int v3 = v7;
        }
        break;
      default:
        break;
    }
  }
  if (v3 == 1) {

  }
  else {
    (*(void (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
  }
}

void *sub_1BBBD77A4(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 8uLL) {
    uint64_t v4 = 8;
  }
  else {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  unsigned int v5 = a2[v4];
  unsigned int v6 = v5 - 2;
  if (v5 >= 2)
  {
    if (v4 <= 3) {
      uint64_t v7 = v4;
    }
    else {
      uint64_t v7 = 4;
    }
    switch(v7)
    {
      case 1:
        int v8 = *a2;
        goto LABEL_13;
      case 2:
        int v8 = *(unsigned __int16 *)a2;
        goto LABEL_13;
      case 3:
        int v8 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_13;
      case 4:
        int v8 = *(_DWORD *)a2;
LABEL_13:
        int v9 = (v8 | (v6 << (8 * v4))) + 2;
        unsigned int v5 = v8 + 2;
        if (v4 < 4) {
          unsigned int v5 = v9;
        }
        break;
      default:
        break;
    }
  }
  if (v5 == 1)
  {
    uint64_t v10 = *(void *)a2;
    id v11 = *(id *)a2;
    *a1 = v10;
    char v12 = 1;
  }
  else
  {
    (*(void (**)(void *))(*(void *)(*(void *)(a3 + 16) - 8) + 16))(a1);
    char v12 = 0;
  }
  *((unsigned char *)a1 + v4) = v12;
  return a1;
}

unsigned __int8 *sub_1BBBD78EC(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    if (*(void *)(v6 + 64) <= 8uLL) {
      uint64_t v7 = 8;
    }
    else {
      uint64_t v7 = *(void *)(v6 + 64);
    }
    unsigned int v8 = a1[v7];
    unsigned int v9 = v8 - 2;
    if (v8 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v10 = v7;
      }
      else {
        uint64_t v10 = 4;
      }
      switch(v10)
      {
        case 1:
          int v11 = *a1;
          goto LABEL_14;
        case 2:
          int v11 = *(unsigned __int16 *)a1;
          goto LABEL_14;
        case 3:
          int v11 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          goto LABEL_14;
        case 4:
          int v11 = *(_DWORD *)a1;
LABEL_14:
          int v12 = (v11 | (v9 << (8 * v7))) + 2;
          unsigned int v8 = v11 + 2;
          if (v7 < 4) {
            unsigned int v8 = v12;
          }
          break;
        default:
          break;
      }
    }
    if (v8 == 1) {

    }
    else {
      (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(a1, v5);
    }
    unsigned int v13 = a2[v7];
    unsigned int v14 = v13 - 2;
    if (v13 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v15 = v7;
      }
      else {
        uint64_t v15 = 4;
      }
      switch(v15)
      {
        case 1:
          int v16 = *a2;
          goto LABEL_28;
        case 2:
          int v16 = *(unsigned __int16 *)a2;
          goto LABEL_28;
        case 3:
          int v16 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_28;
        case 4:
          int v16 = *(_DWORD *)a2;
LABEL_28:
          int v17 = (v16 | (v14 << (8 * v7))) + 2;
          unsigned int v13 = v16 + 2;
          if (v7 < 4) {
            unsigned int v13 = v17;
          }
          break;
        default:
          break;
      }
    }
    if (v13 == 1)
    {
      uint64_t v18 = *(void **)a2;
      id v19 = v18;
      *(void *)a1 = v18;
      char v20 = 1;
    }
    else
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 16))(a1, a2, v5);
      char v20 = 0;
    }
    a1[v7] = v20;
  }
  return a1;
}

void *sub_1BBBD7B0C(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 8uLL) {
    uint64_t v4 = 8;
  }
  else {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  unsigned int v5 = a2[v4];
  unsigned int v6 = v5 - 2;
  if (v5 >= 2)
  {
    if (v4 <= 3) {
      uint64_t v7 = v4;
    }
    else {
      uint64_t v7 = 4;
    }
    switch(v7)
    {
      case 1:
        int v8 = *a2;
        goto LABEL_13;
      case 2:
        int v8 = *(unsigned __int16 *)a2;
        goto LABEL_13;
      case 3:
        int v8 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_13;
      case 4:
        int v8 = *(_DWORD *)a2;
LABEL_13:
        int v9 = (v8 | (v6 << (8 * v4))) + 2;
        unsigned int v5 = v8 + 2;
        if (v4 < 4) {
          unsigned int v5 = v9;
        }
        break;
      default:
        break;
    }
  }
  if (v5 == 1)
  {
    *a1 = *(void *)a2;
    char v10 = 1;
  }
  else
  {
    (*(void (**)(void *))(*(void *)(*(void *)(a3 + 16) - 8) + 32))(a1);
    char v10 = 0;
  }
  *((unsigned char *)a1 + v4) = v10;
  return a1;
}

unsigned __int8 *sub_1BBBD7C44(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    if (*(void *)(v6 + 64) <= 8uLL) {
      uint64_t v7 = 8;
    }
    else {
      uint64_t v7 = *(void *)(v6 + 64);
    }
    unsigned int v8 = a1[v7];
    unsigned int v9 = v8 - 2;
    if (v8 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v10 = v7;
      }
      else {
        uint64_t v10 = 4;
      }
      switch(v10)
      {
        case 1:
          int v11 = *a1;
          goto LABEL_14;
        case 2:
          int v11 = *(unsigned __int16 *)a1;
          goto LABEL_14;
        case 3:
          int v11 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          goto LABEL_14;
        case 4:
          int v11 = *(_DWORD *)a1;
LABEL_14:
          int v12 = (v11 | (v9 << (8 * v7))) + 2;
          unsigned int v8 = v11 + 2;
          if (v7 < 4) {
            unsigned int v8 = v12;
          }
          break;
        default:
          break;
      }
    }
    if (v8 == 1) {

    }
    else {
      (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(a1, v5);
    }
    unsigned int v13 = a2[v7];
    unsigned int v14 = v13 - 2;
    if (v13 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v15 = v7;
      }
      else {
        uint64_t v15 = 4;
      }
      switch(v15)
      {
        case 1:
          int v16 = *a2;
          goto LABEL_28;
        case 2:
          int v16 = *(unsigned __int16 *)a2;
          goto LABEL_28;
        case 3:
          int v16 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_28;
        case 4:
          int v16 = *(_DWORD *)a2;
LABEL_28:
          int v17 = (v16 | (v14 << (8 * v7))) + 2;
          unsigned int v13 = v16 + 2;
          if (v7 < 4) {
            unsigned int v13 = v17;
          }
          break;
        default:
          break;
      }
    }
    if (v13 == 1)
    {
      *(void *)a1 = *(void *)a2;
      char v18 = 1;
    }
    else
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 32))(a1, a2, v5);
      char v18 = 0;
    }
    a1[v7] = v18;
  }
  return a1;
}

uint64_t sub_1BBBD7E5C(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v4 = 8;
  if (*(void *)(v3 + 64) > 8uLL) {
    uint64_t v4 = *(void *)(v3 + 64);
  }
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_22;
  }
  uint64_t v5 = v4 + 1;
  char v6 = 8 * (v4 + 1);
  if ((v4 + 1) <= 3)
  {
    unsigned int v9 = ((a2 + ~(-1 << v6) - 254) >> v6) + 1;
    if (HIWORD(v9))
    {
      int v7 = *(_DWORD *)((char *)a1 + v5);
      if (!v7) {
        goto LABEL_22;
      }
      goto LABEL_14;
    }
    if (v9 > 0xFF)
    {
      int v7 = *(unsigned __int16 *)((char *)a1 + v5);
      if (!*(unsigned __int16 *)((char *)a1 + v5)) {
        goto LABEL_22;
      }
      goto LABEL_14;
    }
    if (v9 < 2)
    {
LABEL_22:
      unsigned int v11 = *((unsigned __int8 *)a1 + v4);
      if (v11 >= 2) {
        return (v11 ^ 0xFF) + 1;
      }
      else {
        return 0;
      }
    }
  }
  int v7 = *((unsigned __int8 *)a1 + v5);
  if (!*((unsigned char *)a1 + v5)) {
    goto LABEL_22;
  }
LABEL_14:
  int v10 = (v7 - 1) << v6;
  if (v5 > 3) {
    int v10 = 0;
  }
  if (v5)
  {
    if (v5 > 3) {
      LODWORD(v5) = 4;
    }
    switch((int)v5)
    {
      case 2:
        LODWORD(v5) = *a1;
        break;
      case 3:
        LODWORD(v5) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v5) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v5) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return (v5 | v10) + 255;
}

void sub_1BBBD7F90(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  if (v5 <= 8) {
    unint64_t v5 = 8;
  }
  size_t v6 = v5 + 1;
  if (a3 < 0xFF)
  {
    int v7 = 0;
  }
  else if (v6 <= 3)
  {
    unsigned int v10 = ((a3 + ~(-1 << (8 * v6)) - 254) >> (8 * v6)) + 1;
    if (HIWORD(v10))
    {
      int v7 = 4;
    }
    else if (v10 >= 0x100)
    {
      int v7 = 2;
    }
    else
    {
      int v7 = v10 > 1;
    }
  }
  else
  {
    int v7 = 1;
  }
  if (a2 > 0xFE)
  {
    unsigned int v8 = a2 - 255;
    if (v6 < 4)
    {
      int v9 = (v8 >> (8 * v6)) + 1;
      if (v5 != -1)
      {
        int v11 = v8 & ~(-1 << (8 * v6));
        bzero(a1, v6);
        if (v6 == 3)
        {
          *(_WORD *)a1 = v11;
          a1[2] = BYTE2(v11);
        }
        else if (v6 == 2)
        {
          *(_WORD *)a1 = v11;
        }
        else
        {
          *a1 = v11;
        }
      }
    }
    else
    {
      bzero(a1, v5 + 1);
      *(_DWORD *)a1 = v8;
      int v9 = 1;
    }
    switch(v7)
    {
      case 1:
        a1[v6] = v9;
        break;
      case 2:
        *(_WORD *)&a1[v6] = v9;
        break;
      case 3:
LABEL_34:
        __break(1u);
        JUMPOUT(0x1BBBD8158);
      case 4:
        *(_DWORD *)&a1[v6] = v9;
        break;
      default:
        return;
    }
  }
  else
  {
    switch(v7)
    {
      case 1:
        a1[v6] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_23;
      case 2:
        *(_WORD *)&a1[v6] = 0;
        goto LABEL_22;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v6] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_23;
      default:
LABEL_22:
        if (a2) {
LABEL_23:
        }
          a1[v5] = -(char)a2;
        break;
    }
  }
}

uint64_t sub_1BBBD8180(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v3 = 8;
  if (*(void *)(v2 + 64) > 8uLL) {
    uint64_t v3 = *(void *)(v2 + 64);
  }
  uint64_t v4 = a1[v3];
  int v5 = v4 - 2;
  if (v4 >= 2)
  {
    if (v3 <= 3) {
      uint64_t v6 = v3;
    }
    else {
      uint64_t v6 = 4;
    }
    switch(v6)
    {
      case 1:
        int v7 = *a1;
        goto LABEL_12;
      case 2:
        int v7 = *(unsigned __int16 *)a1;
        goto LABEL_12;
      case 3:
        int v7 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_12;
      case 4:
        int v7 = *(_DWORD *)a1;
LABEL_12:
        unsigned int v8 = (v7 | (v5 << (8 * v3))) + 2;
        LODWORD(v4) = v7 + 2;
        if (v3 >= 4) {
          uint64_t v4 = v4;
        }
        else {
          uint64_t v4 = v8;
        }
        break;
      default:
        return v4;
    }
  }
  return v4;
}

void sub_1BBBD8238(unsigned char *a1, unsigned int a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 8uLL) {
    size_t v4 = 8;
  }
  else {
    size_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  if (a2 > 1)
  {
    unsigned int v5 = a2 - 2;
    if (v4 < 4)
    {
      unsigned int v6 = v5 >> (8 * v4);
      int v7 = v5 & ~(-1 << (8 * v4));
      a1[v4] = v6 + 2;
      bzero(a1, v4);
      if (v4 == 3)
      {
        *(_WORD *)a1 = v7;
        a1[2] = BYTE2(v7);
      }
      else if (v4 == 2)
      {
        *(_WORD *)a1 = v7;
      }
      else
      {
        *a1 = v7;
      }
    }
    else
    {
      a1[v4] = 2;
      bzero(a1, v4);
      *(_DWORD *)a1 = v5;
    }
  }
  else
  {
    a1[v4] = a2;
  }
}

uint64_t type metadata accessor for LegacyResult()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t Lock.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  unint64_t v1 = (_DWORD *)swift_slowAlloc();
  *(void *)(v0 + 16) = v1;
  _DWORD *v1 = 0;
  return v0;
}

uint64_t Lock.init()()
{
  unint64_t v1 = (_DWORD *)swift_slowAlloc();
  *(void *)(v0 + 16) = v1;
  _DWORD *v1 = 0;
  return v0;
}

uint64_t Lock.deinit()
{
  MEMORY[0x1C1862BC0](*(void *)(v0 + 16), -1, -1);
  return v0;
}

uint64_t Lock.__deallocating_deinit()
{
  MEMORY[0x1C1862BC0](*(void *)(v0 + 16), -1, -1);
  return MEMORY[0x1F4186488](v0, 24, 7);
}

void Lock.criticalSection<A>(_:)(void (*a1)(void))
{
  uint64_t v3 = *(os_unfair_lock_s **)(v1 + 16);
  os_unfair_lock_lock(v3);
  a1();
  os_unfair_lock_unlock(v3);
}

void Lock.callAsFunction<A>(_:)(void (*a1)(void))
{
  uint64_t v3 = *(os_unfair_lock_s **)(v1 + 16);
  os_unfair_lock_lock(v3);
  a1();
  os_unfair_lock_unlock(v3);
}

uint64_t Lock.debugDescription.getter()
{
  sub_1BBBEB2F8();
  uint64_t v2 = HIDWORD(*(void *)(v0 + 16));
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F837F0);
  sub_1BBBEB8E8();
  sub_1BBBEB2F8();
  sub_1BBBEBA48();
  sub_1BBBEB2F8();
  swift_bridgeObjectRelease();
  sub_1BBBEB2F8();
  return HIDWORD(v2);
}

uint64_t sub_1BBBD85B0()
{
  return Lock.debugDescription.getter();
}

uint64_t type metadata accessor for Lock()
{
  return self;
}

uint64_t method lookup function for Lock(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for Lock);
}

uint64_t dispatch thunk of Lock.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t sub_1BBBD8624()
{
  id v0 = objc_msgSend(self, sel_sharedInstance);
  unsigned int v1 = objc_msgSend(v0, sel_isInternalBuild);

  if (!v1) {
    return 0;
  }
  id v2 = objc_msgSend(self, sel_processInfo);
  id v3 = objc_msgSend(v2, sel_environment);

  uint64_t v4 = sub_1BBBEB1A8();
  if (*(void *)(v4 + 16) && (sub_1BBBE7E88(0x45545F5245444E55, 0xEA00000000005453), (v5 & 1) != 0))
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v6 = 0;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_1BBBD8750()
{
  uint64_t v0 = sub_1BBBEAE28();
  __swift_allocate_value_buffer(v0, qword_1E9F837F8);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1E9F837F8);
  if (qword_1E9F83400 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_1E9F858A0);
  id v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

uint64_t Sequencer.__allocating_init(name:softTimeout:hardTimeout:)(uint64_t a1, unint64_t a2, double a3, double a4)
{
  uint64_t v11 = 0;
  memset(v10, 0, sizeof(v10));
  uint64_t v8 = swift_allocObject();
  sub_1BBBD8898(a1, a2, (uint64_t)v10, a3, a4);
  return v8;
}

uint64_t sub_1BBBD8898(uint64_t a1, unint64_t a2, uint64_t a3, double a4, double a5)
{
  uint64_t v21 = a1;
  uint64_t v22 = a3;
  unint64_t v20 = a2;
  uint64_t v8 = sub_1BBBEB578();
  MEMORY[0x1F4188790](v8);
  uint64_t v9 = sub_1BBBEB0F8();
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v10 = sub_1BBBEB608();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  unsigned int v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BBBAEE84();
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, *MEMORY[0x1E4FBCC68], v10);
  sub_1BBBEB0D8();
  uint64_t v14 = MEMORY[0x1E4FBC860];
  uint64_t v23 = MEMORY[0x1E4FBC860];
  sub_1BBBDC644((unint64_t *)&qword_1EB9F8330, MEMORY[0x1E4FBCC10]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F8320);
  sub_1BBBAEF0C((unint64_t *)&qword_1EB9F8328, &qword_1EB9F8320);
  sub_1BBBEB798();
  uint64_t v15 = sub_1BBBEB648();
  *(void *)(v5 + 96) = v14;
  unint64_t v16 = v20;
  uint64_t v17 = 0x65636E6575716553;
  if (v20) {
    uint64_t v17 = v21;
  }
  *(void *)(v5 + 16) = v15;
  *(void *)(v5 + 24) = v17;
  if (v16) {
    unint64_t v18 = v16;
  }
  else {
    unint64_t v18 = 0xE900000000000072;
  }
  *(void *)(v5 + 32) = v18;
  *(double *)(v5 + 40) = a4;
  *(double *)(v5 + 48) = a5;
  if (sub_1BBBD8624())
  {
    sub_1BBBDC68C(v22, v5 + 56);
  }
  else
  {
    sub_1BBBDB6DC(v22);
    *(_OWORD *)(v5 + 56) = 0u;
    *(_OWORD *)(v5 + 72) = 0u;
    *(void *)(v5 + 88) = 0;
  }
  return v5;
}

uint64_t Sequencer.perform(identifier:_:enqueueCompletion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v33 = a4;
  uint64_t v34 = a5;
  uint64_t v31 = a1;
  uint64_t v32 = a2;
  uint64_t v7 = sub_1BBBEB0B8();
  uint64_t v37 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1BBBEB0F8();
  uint64_t v35 = *(void *)(v10 - 8);
  uint64_t v36 = v10;
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for Sequencer.WorkItem();
  uint64_t v14 = v13 - 8;
  uint64_t v15 = *(void *)(v13 - 8);
  uint64_t v16 = *(void *)(v15 + 64);
  uint64_t v17 = MEMORY[0x1F4188790](v13);
  unint64_t v18 = (char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v17);
  unint64_t v20 = (char *)&v31 - v19;
  uint64_t v21 = sub_1BBBEADC8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v21 - 8) + 16))(v20, v31, v21);
  uint64_t v22 = &v20[*(int *)(v14 + 28)];
  *(void *)uint64_t v22 = v32;
  *((void *)v22 + 1) = a3;
  uint64_t v32 = *(void *)(v5 + 16);
  uint64_t v23 = swift_allocObject();
  swift_weakInit();
  sub_1BBBD9078((uint64_t)v20, (uint64_t)v18);
  unint64_t v24 = (*(unsigned __int8 *)(v15 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = v23;
  sub_1BBBD91F0((uint64_t)v18, v25 + v24);
  uint64_t v26 = (uint64_t *)(v25 + ((v16 + v24 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v28 = v33;
  uint64_t v27 = v34;
  *uint64_t v26 = v33;
  v26[1] = v27;
  aBlock[4] = sub_1BBBD9254;
  aBlock[5] = v25;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BBBAED3C;
  aBlock[3] = &block_descriptor_7;
  uint64_t v29 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  sub_1BBBCE414(v28);
  sub_1BBBEB0D8();
  uint64_t v38 = MEMORY[0x1E4FBC860];
  sub_1BBBDC644(qword_1EB9F78A0, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F7968);
  sub_1BBBAEF0C((unint64_t *)&qword_1EB9F7970, &qword_1EB9F7968);
  sub_1BBBEB798();
  MEMORY[0x1C1861D70](0, v12, v9, v29);
  _Block_release(v29);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v9, v7);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v12, v36);
  sub_1BBBD92F8((uint64_t)v20);
  swift_release();
  return swift_release();
}

uint64_t type metadata accessor for Sequencer.WorkItem()
{
  uint64_t result = qword_1E9F83810;
  if (!qword_1E9F83810) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1BBBD8FC4()
{
  swift_weakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1BBBD8FFC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_1BBBD9354(a2, a3, a4);
    return swift_release();
  }
  return result;
}

uint64_t sub_1BBBD9078(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Sequencer.WorkItem();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BBBD90DC()
{
  uint64_t v1 = *(void *)(type metadata accessor for Sequencer.WorkItem() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  unint64_t v4 = (*(void *)(v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  uint64_t v5 = sub_1BBBEADC8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  swift_release();
  if (*(void *)(v0 + v4)) {
    swift_release();
  }
  return MEMORY[0x1F4186498](v0, v4 + 16, v2 | 7);
}

uint64_t sub_1BBBD91F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Sequencer.WorkItem();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BBBD9254()
{
  uint64_t v1 = *(void *)(type metadata accessor for Sequencer.WorkItem() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v4 = v0 + v2;
  uint64_t v5 = v0 + ((*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v6 = *(uint64_t (**)(uint64_t))v5;
  uint64_t v7 = *(void *)(v5 + 8);
  return sub_1BBBD8FFC(v3, v4, v6, v7);
}

uint64_t block_copy_helper_7(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1BBBD92F8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Sequencer.WorkItem();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1BBBD9354(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = type metadata accessor for Sequencer.WorkItem();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v11 = (char *)v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (void *)sub_1BBBEB158();
  uint64_t v13 = *(v12 - 1);
  MEMORY[0x1F4188790](v12);
  uint64_t v15 = (void *)((char *)v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v16 = *(void **)(v4 + 16);
  void *v15 = v16;
  (*(void (**)(void *, void, void *))(v13 + 104))(v15, *MEMORY[0x1E4FBCBF0], v12);
  id v17 = v16;
  LOBYTE(v16) = sub_1BBBEB178();
  (*(void (**)(void *, void *))(v13 + 8))(v15, v12);
  if (v16)
  {
    v22[1] = a3;
    uint64_t v12 = (void *)(v4 + 96);
    swift_beginAccess();
    a3 = *(void *)(*(void *)(v4 + 96) + 16);
    sub_1BBBD9078(a1, (uint64_t)v11);
    swift_beginAccess();
    uint64_t v15 = *(void **)(v4 + 96);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v4 + 96) = v15;
    if (isUniquelyReferenced_nonNull_native) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  uint64_t v15 = (void *)sub_1BBBD572C(0, v15[2] + 1, 1, (unint64_t)v15);
  *uint64_t v12 = v15;
LABEL_3:
  unint64_t v20 = v15[2];
  unint64_t v19 = v15[3];
  if (v20 >= v19 >> 1)
  {
    uint64_t v15 = (void *)sub_1BBBD572C(v19 > 1, v20 + 1, 1, (unint64_t)v15);
    *uint64_t v12 = v15;
  }
  v15[2] = v20 + 1;
  sub_1BBBD91F0((uint64_t)v11, (uint64_t)v15+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(void *)(v9 + 72) * v20);
  uint64_t result = swift_endAccess();
  if (a2) {
    uint64_t result = a2(a1);
  }
  if (!a3) {
    return sub_1BBBD95EC();
  }
  return result;
}

uint64_t sub_1BBBD95EC()
{
  uint64_t v1 = v0;
  double v85 = *v0;
  uint64_t v78 = sub_1BBBEB118();
  uint64_t v2 = *(void *)(v78 - 8);
  uint64_t v3 = MEMORY[0x1F4188790](v78);
  uint64_t v77 = (char *)v67 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)v67 - v5;
  uint64_t v73 = sub_1BBBEB0B8();
  MEMORY[0x1F4188790](v73);
  uint64_t v74 = (char *)v67 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = type metadata accessor for Sequencer.WorkItem();
  uint64_t v8 = *(void *)(v75 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v10 = MEMORY[0x1F4188790](v75);
  uint64_t v84 = (uint64_t)v67 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)v67 - v12;
  MEMORY[0x1F4188790](v11);
  uint64_t v86 = (uint64_t)v67 - v14;
  uint64_t v15 = sub_1BBBEB158();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x1F4188790](v15);
  unint64_t v18 = (void *)((char *)v67 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v19 = (void *)*((void *)v1 + 2);
  *unint64_t v18 = v19;
  (*(void (**)(void *, void, uint64_t))(v16 + 104))(v18, *MEMORY[0x1E4FBCBF0], v15);
  id v76 = v19;
  uint64_t v20 = sub_1BBBEB178();
  uint64_t v22 = *(void (**)(void *, uint64_t))(v16 + 8);
  unint64_t v21 = v16 + 8;
  v22(v18, v15);
  if ((v20 & 1) == 0)
  {
    __break(1u);
LABEL_13:
    swift_once();
    goto LABEL_4;
  }
  uint64_t result = swift_beginAccess();
  uint64_t v24 = *((void *)v1 + 12);
  if (!*(void *)(v24 + 16)) {
    return result;
  }
  uint64_t v15 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v69 = (v15 + 32) & ~v15;
  uint64_t v20 = v86;
  sub_1BBBD9078(v24 + v69, v86);
  unint64_t v21 = *((void *)v1 + 4);
  uint64_t v83 = *((void *)v1 + 3);
  uint64_t v25 = qword_1E9F833F8;
  swift_bridgeObjectRetain();
  if (v25 != -1) {
    goto LABEL_13;
  }
LABEL_4:
  uint64_t v80 = v15;
  unint64_t v70 = ~v15;
  uint64_t v26 = sub_1BBBEAE28();
  __swift_project_value_buffer(v26, (uint64_t)qword_1E9F837F8);
  sub_1BBBD9078(v20, (uint64_t)v13);
  swift_bridgeObjectRetain_n();
  uint64_t v27 = sub_1BBBEAE08();
  os_log_type_t v28 = sub_1BBBEB518();
  BOOL v29 = os_log_type_enabled(v27, v28);
  uint64_t v72 = v2;
  uint64_t v71 = v6;
  unint64_t v81 = v21;
  uint64_t v82 = v1;
  if (v29)
  {
    uint64_t v30 = swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    uint64_t aBlock = v31;
    *(_DWORD *)uint64_t v30 = 136446466;
    swift_bridgeObjectRetain();
    uint64_t v87 = sub_1BBBAC938(v83, v21, &aBlock);
    sub_1BBBEB6C8();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v30 + 12) = 2082;
    sub_1BBBEADC8();
    sub_1BBBDC644((unint64_t *)&unk_1EB9F76D8, MEMORY[0x1E4F27990]);
    uint64_t v20 = v86;
    uint64_t v32 = sub_1BBBEBA48();
    uint64_t v87 = sub_1BBBAC938(v32, v33, &aBlock);
    sub_1BBBEB6C8();
    swift_bridgeObjectRelease();
    sub_1BBBD92F8((uint64_t)v13);
    _os_log_impl(&dword_1BBBA9000, v27, v28, "%{public}s: Execute %{public}s", (uint8_t *)v30, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1C1862BC0](v31, -1, -1);
    uint64_t v34 = v30;
    uint64_t v1 = v82;
    MEMORY[0x1C1862BC0](v34, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    sub_1BBBD92F8((uint64_t)v13);
  }

  double v35 = v1[5];
  uint64_t v36 = swift_allocObject();
  swift_weakInit();
  uint64_t v37 = v84;
  sub_1BBBD9078(v20, v84);
  uint64_t v79 = v80 | 7;
  uint64_t v68 = v9 + 7;
  uint64_t v38 = v69;
  unint64_t v39 = (v9 + 7 + v69) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v40 = (v39 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v41 = swift_allocObject();
  unint64_t v42 = v81;
  *(void *)(v41 + 16) = v83;
  *(void *)(v41 + 24) = v42;
  sub_1BBBD91F0(v37, v41 + v38);
  *(double *)(v41 + v39) = v35;
  *(void *)(v41 + v40) = v36;
  *(double *)(v41 + ((v40 + 15) & 0xFFFFFFFFFFFFFFF8)) = v85;
  uint64_t v92 = (void (**)(uint64_t, void *, void *))sub_1BBBDBF0C;
  uint64_t v93 = v41;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v89 = 1107296256;
  v67[3] = &v90;
  uint64_t v90 = sub_1BBBAED3C;
  uint64_t v91 = &block_descriptor_13_0;
  _Block_copy(&aBlock);
  uint64_t v87 = MEMORY[0x1E4FBC860];
  v67[1] = sub_1BBBDC644(qword_1EB9F78A0, MEMORY[0x1E4FBCB00]);
  swift_bridgeObjectRetain();
  swift_retain();
  v67[0] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F7968);
  v67[2] = sub_1BBBAEF0C((unint64_t *)&qword_1EB9F7970, &qword_1EB9F7968);
  sub_1BBBEB798();
  sub_1BBBEB148();
  swift_allocObject();
  uint64_t v69 = sub_1BBBEB128();
  swift_release();
  swift_release();
  uint64_t v43 = swift_allocObject();
  swift_weakInit();
  uint64_t v44 = v84;
  sub_1BBBD9078(v86, v84);
  uint64_t v45 = (v80 + 24) & v70;
  unint64_t v46 = (v68 + v45) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v47 = swift_allocObject();
  *(void *)(v47 + 16) = v43;
  uint64_t v68 = v45;
  sub_1BBBD91F0(v44, v47 + v45);
  unint64_t v70 = v46;
  uint64_t v48 = (void *)(v47 + v46);
  *uint64_t v48 = v83;
  v48[1] = v42;
  *(double *)(v47 + ((v46 + 23) & 0xFFFFFFFFFFFFFFF8)) = v85;
  uint64_t v92 = (void (**)(uint64_t, void *, void *))sub_1BBBDC0D0;
  uint64_t v93 = v47;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v89 = 1107296256;
  uint64_t v90 = sub_1BBBAED3C;
  uint64_t v91 = &block_descriptor_20;
  _Block_copy(&aBlock);
  uint64_t v87 = MEMORY[0x1E4FBC860];
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1BBBEB798();
  swift_allocObject();
  uint64_t v80 = sub_1BBBEB128();
  swift_release();
  swift_release();
  uint64_t v74 = (char *)swift_allocObject();
  v74[16] = 0;
  uint64_t v73 = mach_continuous_time();
  sub_1BBBDC180((uint64_t)(v82 + 7), (uint64_t)&aBlock);
  unint64_t v49 = v91;
  if (v91)
  {
    int64_t v50 = v92;
    __swift_project_boxed_opaque_existential_1(&aBlock, (uint64_t)v91);
    v50[3](v86, v49, v50);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&aBlock);
  }
  else
  {
    sub_1BBBDB6DC((uint64_t)&aBlock);
  }
  uint64_t v51 = v86;
  uint64_t v75 = *(void *)(v86 + *(int *)(v75 + 20));
  uint64_t v52 = swift_allocObject();
  swift_weakInit();
  uint64_t v53 = v84;
  sub_1BBBD9078(v51, v84);
  unint64_t v54 = v70;
  unint64_t v55 = (v70 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v56 = (v55 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v57 = (v56 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v58 = (v57 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v59 = swift_allocObject();
  *(void *)(v59 + 16) = v52;
  sub_1BBBD91F0(v53, v59 + v68);
  *(void *)(v59 + v54) = v74;
  unint64_t v60 = (void *)(v59 + v55);
  uint64_t v62 = v80;
  unint64_t v61 = v81;
  *unint64_t v60 = v83;
  v60[1] = v61;
  *(void *)(v59 + v56) = v69;
  *(void *)(v59 + v57) = v62;
  *(void *)(v59 + v58) = v73;
  *(double *)(v59 + ((v58 + 15) & 0xFFFFFFFFFFFFFFF8)) = v85;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  ((void (*)(uint64_t (*)(), uint64_t))v75)(sub_1BBBDC34C, v59);
  swift_release();
  swift_release();
  swift_release();
  uint64_t v63 = v77;
  sub_1BBBEB108();
  uint64_t v64 = v71;
  MEMORY[0x1C18618A0](v63, v35);
  uint64_t v65 = *(void (**)(char *, uint64_t))(v72 + 8);
  uint64_t v66 = v78;
  v65(v63, v78);
  sub_1BBBEB598();
  v65(v64, v66);
  sub_1BBBEB108();
  MEMORY[0x1C18618A0](v63, v82[6]);
  v65(v63, v66);
  sub_1BBBEB598();
  swift_release();
  swift_release();
  v65(v64, v66);
  sub_1BBBD92F8(v86);
  return swift_release();
}

uint64_t sub_1BBBDA204(uint64_t a1, unint64_t a2, uint64_t a3, double a4)
{
  uint64_t v8 = type metadata accessor for Sequencer.WorkItem();
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1E9F833F8 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_1BBBEAE28();
  __swift_project_value_buffer(v11, (uint64_t)qword_1E9F837F8);
  sub_1BBBD9078(a3, (uint64_t)v10);
  swift_bridgeObjectRetain_n();
  uint64_t v12 = sub_1BBBEAE08();
  os_log_type_t v13 = sub_1BBBEB558();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v24 = a3;
    uint64_t v15 = v14;
    uint64_t v16 = swift_slowAlloc();
    v26[0] = v16;
    *(_DWORD *)uint64_t v15 = 136446722;
    swift_bridgeObjectRetain();
    uint64_t v25 = sub_1BBBAC938(a1, a2, v26);
    sub_1BBBEB6C8();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v15 + 12) = 2082;
    sub_1BBBEADC8();
    sub_1BBBDC644((unint64_t *)&unk_1EB9F76D8, MEMORY[0x1E4F27990]);
    uint64_t v17 = sub_1BBBEBA48();
    uint64_t v25 = sub_1BBBAC938(v17, v18, v26);
    sub_1BBBEB6C8();
    swift_bridgeObjectRelease();
    sub_1BBBD92F8((uint64_t)v10);
    *(_WORD *)(v15 + 22) = 2048;
    uint64_t v25 = *(void *)&a4;
    sub_1BBBEB6C8();
    _os_log_impl(&dword_1BBBA9000, v12, v13, "%{public}s: queue item %{public}s took longer than %f seconds.", (uint8_t *)v15, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x1C1862BC0](v16, -1, -1);
    uint64_t v19 = v15;
    a3 = v24;
    MEMORY[0x1C1862BC0](v19, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    sub_1BBBD92F8((uint64_t)v10);
  }

  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_1BBBDC180(result + 56, (uint64_t)v26);
    swift_release();
    uint64_t v21 = v27;
    if (v27)
    {
      uint64_t v22 = v28;
      __swift_project_boxed_opaque_existential_1(v26, v27);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 8))(a3, v21, v22);
      return __swift_destroy_boxed_opaque_existential_0((uint64_t)v26);
    }
    else
    {
      return sub_1BBBDB6DC((uint64_t)v26);
    }
  }
  return result;
}

void sub_1BBBDA55C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v7 = type metadata accessor for Sequencer.WorkItem();
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  if (sub_1BBBD8624())
  {
    swift_beginAccess();
    uint64_t Strong = swift_weakLoadStrong();
    if (Strong)
    {
      sub_1BBBDC180(Strong + 56, (uint64_t)v21);
      swift_release();
      uint64_t v11 = v22;
      if (v22)
      {
        uint64_t v12 = v23;
        __swift_project_boxed_opaque_existential_1(v21, v22);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(a2, v11, v12);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v21);
      }
      else
      {
        sub_1BBBDB6DC((uint64_t)v21);
      }
    }
  }
  else
  {
    if (qword_1E9F833F8 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_1BBBEAE28();
    __swift_project_value_buffer(v13, (uint64_t)qword_1E9F837F8);
    sub_1BBBD9078(a2, (uint64_t)v9);
    swift_bridgeObjectRetain_n();
    uint64_t v14 = sub_1BBBEAE08();
    os_log_type_t v15 = sub_1BBBEB548();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      v21[0] = v17;
      *(_DWORD *)uint64_t v16 = 136446466;
      swift_bridgeObjectRetain();
      uint64_t v20 = sub_1BBBAC938(a3, a4, v21);
      sub_1BBBEB6C8();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v16 + 12) = 2082;
      sub_1BBBEADC8();
      sub_1BBBDC644((unint64_t *)&unk_1EB9F76D8, MEMORY[0x1E4F27990]);
      uint64_t v18 = sub_1BBBEBA48();
      uint64_t v20 = sub_1BBBAC938(v18, v19, v21);
      sub_1BBBEB6C8();
      swift_bridgeObjectRelease();
      sub_1BBBD92F8((uint64_t)v9);
      _os_log_impl(&dword_1BBBA9000, v14, v15, "%{public}s: queue item %{public}s did not call completion block in time!", (uint8_t *)v16, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1C1862BC0](v17, -1, -1);
      MEMORY[0x1C1862BC0](v16, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
      sub_1BBBD92F8((uint64_t)v9);
    }
  }
}

uint64_t sub_1BBBDA894(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v53 = a6;
  uint64_t v54 = a7;
  uint64_t v51 = a4;
  uint64_t v52 = a5;
  uint64_t v56 = a3;
  uint64_t v50 = a2;
  uint64_t v10 = sub_1BBBEB0B8();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1BBBEB0F8();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v14);
  unint64_t v55 = (char *)&v40 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for Sequencer.WorkItem();
  uint64_t v49 = *(void *)(v17 - 8);
  uint64_t v18 = *(void *)(v49 + 64);
  MEMORY[0x1F4188790](v17 - 8);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v20 = result;
    uint64_t v44 = v15;
    uint64_t v45 = v13;
    uint64_t v42 = a9;
    uint64_t v41 = mach_continuous_time();
    sub_1BBBDC180(v20 + 56, (uint64_t)aBlock);
    uint64_t v21 = v59;
    uint64_t v47 = v11;
    uint64_t v48 = v10;
    uint64_t v46 = v14;
    uint64_t v43 = a8;
    if (v59)
    {
      uint64_t v22 = v60;
      __swift_project_boxed_opaque_existential_1(aBlock, (uint64_t)v59);
      uint64_t v23 = v50;
      (*((void (**)(uint64_t, void *, uint64_t (*)()))v22 + 4))(v50, v21, v22);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)aBlock);
    }
    else
    {
      sub_1BBBDB6DC((uint64_t)aBlock);
      uint64_t v23 = v50;
    }
    uint64_t v50 = *(void *)(v20 + 16);
    uint64_t v24 = swift_allocObject();
    swift_weakInit();
    uint64_t v25 = (char *)&v40 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_1BBBD9078(v23, (uint64_t)v25);
    unint64_t v26 = (*(unsigned __int8 *)(v49 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v49 + 80);
    unint64_t v27 = (v18 + v26 + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v28 = (v27 + 15) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v29 = (v28 + 15) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v30 = (v29 + 15) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v31 = (void *)swift_allocObject();
    uint64_t v32 = v56;
    v31[2] = v24;
    v31[3] = v32;
    uint64_t v33 = v51;
    uint64_t v51 = v20;
    uint64_t v34 = v52;
    v31[4] = v33;
    v31[5] = v34;
    sub_1BBBD91F0((uint64_t)v25, (uint64_t)v31 + v26);
    uint64_t v35 = v54;
    *(void *)((char *)v31 + v27) = v53;
    *(void *)((char *)v31 + v28) = v35;
    *(void *)((char *)v31 + v29) = v41;
    *(void *)((char *)v31 + v30) = v43;
    *(void *)((char *)v31 + ((v30 + 15) & 0xFFFFFFFFFFFFFFF8)) = v42;
    unint64_t v60 = sub_1BBBDC56C;
    unint64_t v61 = v31;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1BBBAED3C;
    uint64_t v59 = &block_descriptor_34;
    uint64_t v36 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    uint64_t v37 = v55;
    sub_1BBBEB0D8();
    uint64_t v57 = MEMORY[0x1E4FBC860];
    sub_1BBBDC644(qword_1EB9F78A0, MEMORY[0x1E4FBCB00]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F7968);
    sub_1BBBAEF0C((unint64_t *)&qword_1EB9F7970, &qword_1EB9F7968);
    uint64_t v38 = v45;
    uint64_t v39 = v48;
    sub_1BBBEB798();
    MEMORY[0x1C1861D70](0, v37, v38, v36);
    _Block_release(v36);
    (*(void (**)(char *, uint64_t))(v47 + 8))(v38, v39);
    (*(void (**)(char *, uint64_t))(v44 + 8))(v37, v46);
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1BBBDADA4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unint64_t a8, unint64_t a9)
{
  uint64_t v47 = a3;
  uint64_t v48 = a5;
  uint64_t v12 = type metadata accessor for Sequencer.WorkItem();
  uint64_t v13 = MEMORY[0x1F4188790](v12 - 8);
  uint64_t v15 = (char *)&v46 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x1F4188790](v13);
  uint64_t v18 = (char *)&v46 - v17;
  uint64_t v19 = MEMORY[0x1F4188790](v16);
  uint64_t v21 = ((char *)&v46 - v20);
  MEMORY[0x1F4188790](v19);
  uint64_t v23 = (char *)&v46 - v22;
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v25 = (void *)result;
    unint64_t v26 = (unsigned char *)(a2 + 16);
    swift_beginAccess();
    if (*v26)
    {
      if (qword_1E9F833F8 != -1) {
        swift_once();
      }
      uint64_t v27 = sub_1BBBEAE28();
      __swift_project_value_buffer(v27, (uint64_t)qword_1E9F837F8);
      sub_1BBBD9078(v48, (uint64_t)v18);
      swift_bridgeObjectRetain_n();
      uint64_t v21 = sub_1BBBEAE08();
      os_log_type_t v28 = sub_1BBBEB548();
      if (os_log_type_enabled(v21, v28))
      {
        uint64_t v23 = (char *)swift_slowAlloc();
        uint64_t v46 = swift_slowAlloc();
        uint64_t v51 = v46;
        *(_DWORD *)uint64_t v23 = 136446466;
        swift_bridgeObjectRetain();
        v50[0] = sub_1BBBAC938(v47, a4, &v51);
        sub_1BBBEB6C8();
        swift_bridgeObjectRelease_n();
        *((_WORD *)v23 + 6) = 2082;
        sub_1BBBEADC8();
        sub_1BBBDC644((unint64_t *)&unk_1EB9F76D8, MEMORY[0x1E4F27990]);
        uint64_t v29 = sub_1BBBEBA48();
        v50[0] = sub_1BBBAC938(v29, v30, &v51);
        sub_1BBBEB6C8();
        swift_bridgeObjectRelease();
        sub_1BBBD92F8((uint64_t)v18);
        _os_log_impl(&dword_1BBBA9000, v21, v28, "%{public}s: Completion block called twice: %{public}s", (uint8_t *)v23, 0x16u);
        uint64_t v31 = v46;
        swift_arrayDestroy();
        MEMORY[0x1C1862BC0](v31, -1, -1);
        MEMORY[0x1C1862BC0](v23, -1, -1);
      }
      else
      {
        swift_bridgeObjectRelease_n();
        sub_1BBBD92F8((uint64_t)v18);
      }

      id v41 = objc_msgSend(self, sel_sharedInstance);
      unsigned int v42 = objc_msgSend(v41, sel_isInternalBuild);

      if (!v42) {
        return swift_release();
      }
      sub_1BBBD9078(v48, (uint64_t)v15);
      uint64_t v51 = 0;
      unint64_t v52 = 0xE000000000000000;
      sub_1BBBEB858();
      uint64_t v34 = v25[3];
      unint64_t v43 = v25[4];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v51 = (uint64_t)v34;
      unint64_t v52 = v43;
      sub_1BBBEB2F8();
      sub_1BBBEADC8();
      sub_1BBBDC644((unint64_t *)&unk_1EB9F76D8, MEMORY[0x1E4F27990]);
      sub_1BBBEBA48();
      uint64_t v25 = v44;
      sub_1BBBEB2F8();
      swift_bridgeObjectRelease();
      sub_1BBBEB958();
      __break(1u);
      goto LABEL_14;
    }
    uint64_t v32 = a9;
    swift_beginAccess();
    *unint64_t v26 = 1;
    sub_1BBBEB138();
    sub_1BBBEB138();
    if (a8 < a9)
    {
      __break(1u);
    }
    else
    {
      uint64_t v32 = sub_1BBBEABC8();
      if (qword_1E9F833F8 == -1) {
        goto LABEL_9;
      }
    }
    swift_once();
LABEL_9:
    uint64_t v33 = sub_1BBBEAE28();
    __swift_project_value_buffer(v33, (uint64_t)qword_1E9F837F8);
    sub_1BBBD9078(v48, (uint64_t)v23);
    swift_bridgeObjectRetain_n();
    sub_1BBBB31EC();
    sub_1BBBB31EC();
    uint64_t v34 = sub_1BBBEAE08();
    os_log_type_t v35 = sub_1BBBEB518();
    if (os_log_type_enabled(v34, v35))
    {
      *(double *)&uint64_t v36 = (double)(unint64_t)v32 / 1000000.0;
      uint64_t v37 = swift_slowAlloc();
      uint64_t v48 = swift_slowAlloc();
      v50[0] = v48;
      *(_DWORD *)uint64_t v37 = 136446978;
      swift_bridgeObjectRetain();
      uint64_t v49 = sub_1BBBAC938(v47, a4, v50);
      sub_1BBBEB6C8();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v37 + 12) = 2082;
      sub_1BBBEADC8();
      sub_1BBBDC644((unint64_t *)&unk_1EB9F76D8, MEMORY[0x1E4F27990]);
      uint64_t v38 = sub_1BBBEBA48();
      uint64_t v49 = sub_1BBBAC938(v38, v39, v50);
      sub_1BBBEB6C8();
      swift_bridgeObjectRelease();
      sub_1BBBD92F8((uint64_t)v23);
      *(_WORD *)(v37 + 22) = 1040;
      LODWORD(v49) = 3;
      sub_1BBBEB6C8();
      *(_WORD *)(v37 + 28) = 2048;
      uint64_t v49 = v36;
      sub_1BBBEB6C8();
      _os_log_impl(&dword_1BBBA9000, v34, v35, "%{public}s: Completion %{public}s [%.*fms]", (uint8_t *)v37, 0x26u);
      uint64_t v40 = v48;
      swift_arrayDestroy();
      MEMORY[0x1C1862BC0](v40, -1, -1);
      MEMORY[0x1C1862BC0](v37, -1, -1);
      goto LABEL_15;
    }
LABEL_14:
    swift_bridgeObjectRelease_n();
    sub_1BBBD92F8((uint64_t)v23);
LABEL_15:

    swift_beginAccess();
    sub_1BBBDB530(0, (uint64_t)v21);
    swift_endAccess();
    uint64_t v45 = sub_1BBBD92F8((uint64_t)v21);
    if (*(void *)(v25[12] + 16)) {
      sub_1BBBD95EC(v45);
    }
    return swift_release();
  }
  return result;
}

uint64_t sub_1BBBDB530@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t v5 = *v2;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v5 = sub_1BBBDC630(v5);
  }
  unint64_t v6 = *(void *)(v5 + 16);
  if (v6 <= a1)
  {
    __break(1u);
    goto LABEL_15;
  }
  unint64_t v7 = v6 - 1;
  uint64_t v8 = *(void *)(type metadata accessor for Sequencer.WorkItem() - 8);
  uint64_t v9 = *(void *)(v8 + 72);
  unint64_t v10 = v5 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80)) + v9 * a1;
  uint64_t result = sub_1BBBD91F0(v10, a2);
  if ((uint64_t)(v7 - a1) < 0)
  {
LABEL_15:
    uint64_t result = sub_1BBBEB998();
    __break(1u);
    return result;
  }
  if (v9 > 0 || v10 >= v10 + v9 + v9 * (v7 - a1))
  {
    uint64_t result = swift_arrayInitWithTakeFrontToBack();
  }
  else if (v9)
  {
    uint64_t result = swift_arrayInitWithTakeBackToFront();
  }
  *(void *)(v5 + 16) = v7;
  *uint64_t v2 = v5;
  return result;
}

uint64_t Sequencer.deinit()
{
  swift_bridgeObjectRelease();
  sub_1BBBDB6DC(v0 + 56);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1BBBDB6DC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F7B08);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t Sequencer.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  sub_1BBBDB6DC(v0 + 56);
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186488](v0, 104, 7);
}

uint64_t type metadata accessor for Sequencer()
{
  return self;
}

uint64_t method lookup function for Sequencer(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for Sequencer);
}

uint64_t *sub_1BBBDB7C8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_1BBBEADC8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    unint64_t v10 = (uint64_t *)((char *)a2 + v8);
    uint64_t v11 = v10[1];
    *uint64_t v9 = *v10;
    v9[1] = v11;
  }
  swift_retain();
  return a1;
}

uint64_t sub_1BBBDB89C(uint64_t a1)
{
  uint64_t v2 = sub_1BBBEADC8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return swift_release();
}

uint64_t sub_1BBBDB914(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1BBBEADC8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  swift_retain();
  return a1;
}

uint64_t sub_1BBBDB99C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1BBBEADC8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_1BBBDBA30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1BBBEADC8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_1BBBDBAAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1BBBEADC8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  swift_release();
  return a1;
}

uint64_t sub_1BBBDBB34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1BBBDBB48);
}

uint64_t sub_1BBBDBB48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1BBBEADC8();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_1BBBDBC08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1BBBDBC1C);
}

uint64_t sub_1BBBDBC1C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1BBBEADC8();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_1BBBDBCD8()
{
  uint64_t result = sub_1BBBEADC8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1BBBDBD70()
{
  uint64_t v0 = sub_1BBBEAE28();
  __swift_allocate_value_buffer(v0, qword_1E9F858A0);
  __swift_project_value_buffer(v0, (uint64_t)qword_1E9F858A0);
  return sub_1BBBEAE18();
}

uint64_t sub_1BBBDBDEC()
{
  uint64_t v1 = *(void *)(type metadata accessor for Sequencer.WorkItem() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = ((((((*(void *)(v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
     + 8;
  swift_bridgeObjectRelease();
  uint64_t v6 = sub_1BBBEADC8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, v5, v4);
}

uint64_t sub_1BBBDBF0C()
{
  uint64_t v1 = *(void *)(type metadata accessor for Sequencer.WorkItem() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(void *)(v0 + 16);
  unint64_t v4 = *(void *)(v0 + 24);
  double v5 = *(double *)(v0 + ((*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8));
  return sub_1BBBDA204(v3, v4, v0 + v2, v5);
}

uint64_t sub_1BBBDBFB4()
{
  uint64_t v1 = *(void *)(type metadata accessor for Sequencer.WorkItem() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = ((((*(void *)(v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_release();
  uint64_t v6 = sub_1BBBEADC8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, v5, v4);
}

void sub_1BBBDC0D0()
{
  uint64_t v1 = *(void *)(type metadata accessor for Sequencer.WorkItem() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v3 = (*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v4 = *(void *)(v0 + 16);
  uint64_t v5 = *(void *)(v0 + v3);
  unint64_t v6 = *(void *)(v0 + v3 + 8);
  sub_1BBBDA55C(v4, v0 + v2, v5, v6);
}

uint64_t sub_1BBBDC170()
{
  return MEMORY[0x1F4186498](v0, 17, 7);
}

uint64_t sub_1BBBDC180(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F7B08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BBBDC1E8()
{
  uint64_t v1 = *(void *)(type metadata accessor for Sequencer.WorkItem() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = ((((((((((((*(void *)(v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
           + 15) & 0xFFFFFFFFFFFFFFF8)
         + 15) & 0xFFFFFFFFFFFFFFF8)
       + 15) & 0xFFFFFFFFFFFFFFF8)
     + 8;
  swift_release();
  uint64_t v6 = sub_1BBBEADC8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, v5, v4);
}

uint64_t sub_1BBBDC34C()
{
  uint64_t v1 = *(void *)(type metadata accessor for Sequencer.WorkItem() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v3 = (*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v4 = (v3 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v5 = (v4 + 23) & 0xFFFFFFFFFFFFFFF8;
  return sub_1BBBDA894(*(void *)(v0 + 16), v0 + v2, *(void *)(v0 + v3), *(void *)(v0 + v4), *(void *)(v0 + v4 + 8), *(void *)(v0 + v5), *(void *)(v0 + ((v5 + 15) & 0xFFFFFFFFFFFFFFF8)), *(void *)(v0 + ((((v5 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)), *(void *)(v0+ ((((((v5 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t sub_1BBBDC41C()
{
  uint64_t v1 = *(void *)(type metadata accessor for Sequencer.WorkItem() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 48) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = ((((((((((*(void *)(v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
         + 15) & 0xFFFFFFFFFFFFFFF8)
       + 15) & 0xFFFFFFFFFFFFFFF8)
     + 8;
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v6 = sub_1BBBEADC8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, v5, v4);
}

uint64_t sub_1BBBDC56C()
{
  uint64_t v1 = *(void *)(type metadata accessor for Sequencer.WorkItem() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v3 = (*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  return sub_1BBBDADA4(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), v0 + v2, *(void *)(v0 + v3), *(void *)(v0 + ((v3 + 15) & 0xFFFFFFFFFFFFFFF8)), *(void *)(v0 + ((((v3 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)), *(void *)(v0+ ((((((v3 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t sub_1BBBDC630(unint64_t a1)
{
  return sub_1BBBD572C(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t sub_1BBBDC644(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1BBBDC68C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F7B08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t static Transaction.named<A>(_:with:)(char *a1, uint64_t a2, int a3)
{
  return static Transaction.named<A>(_:with:)(a1, a2, a3, (void (*)(void))sub_1BBBDDC18);
}

uint64_t sub_1BBBDC74C()
{
  uint64_t v0 = sub_1BBBEAE28();
  __swift_allocate_value_buffer(v0, qword_1EB9F8B78);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EB9F8B78);
  return sub_1BBBEAE18();
}

uint64_t sub_1BBBDC7CC(uint64_t a1)
{
  return sub_1BBBDC83C(a1, &qword_1EB9F76C8, &qword_1EB9F7710);
}

uint64_t static Transaction.$current.getter()
{
  return sub_1BBBDC8B0(&qword_1EB9F7700);
}

uint64_t static Transaction.current.getter()
{
  return sub_1BBBDC920(&qword_1EB9F7700);
}

uint64_t sub_1BBBDC828(uint64_t a1)
{
  return sub_1BBBDC83C(a1, &qword_1EB9F76D0, &qword_1EB9F76F8);
}

uint64_t sub_1BBBDC83C(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  swift_allocObject();
  uint64_t result = sub_1BBBEBC28();
  *a3 = result;
  return result;
}

uint64_t static Transaction.$currentNSXPCConnection.getter()
{
  return sub_1BBBDC8B0(&qword_1EB9F76E8);
}

uint64_t sub_1BBBDC8B0(void *a1)
{
  if (*a1 != -1) {
    swift_once();
  }
  return swift_retain();
}

uint64_t static Transaction.currentNSXPCConnection.getter()
{
  return sub_1BBBDC920(&qword_1EB9F76E8);
}

uint64_t sub_1BBBDC920(void *a1)
{
  if (*a1 != -1) {
    swift_once();
  }
  sub_1BBBEBC38();
  return v2;
}

uint64_t static Transaction.asyncTask(name:block:)(char *a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F7678);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_allocObject();
  uint64_t v13 = sub_1BBBDD448(a1, a2, a3);
  id v14 = objc_msgSend(self, sel_currentConnection);
  uint64_t v15 = sub_1BBBEB478();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v12, 1, 1, v15);
  uint64_t v16 = (void *)swift_allocObject();
  void v16[2] = 0;
  void v16[3] = 0;
  v16[4] = v13;
  v16[5] = v14;
  v16[6] = a4;
  v16[7] = a5;
  swift_retain();
  swift_retain();
  sub_1BBBDD208((uint64_t)v12, (uint64_t)&unk_1E9F83828, (uint64_t)v16);
  swift_release();
  return swift_release();
}

uint64_t sub_1BBBDCAF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[6] = a6;
  v7[7] = a7;
  v7[4] = a4;
  v7[5] = a5;
  v7[3] = a1;
  return MEMORY[0x1F4188298](sub_1BBBDCB20, 0, 0);
}

uint64_t sub_1BBBDCB20()
{
  if (qword_1EB9F7700 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 40);
  *(void *)(v0 + 16) = *(void *)(v0 + 32);
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 64) = v2;
  long long v3 = *(_OWORD *)(v0 + 48);
  *(void *)(v2 + 16) = v1;
  *(_OWORD *)(v2 + 24) = v3;
  swift_retain();
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_1BBBDCC88;
  uint64_t v5 = *(void *)(v0 + 24);
  return MEMORY[0x1F41881B8](v5, v0 + 16, &unk_1E9F83880, v2, 0, 0, 0xD00000000000001ALL, 0x80000001BBBEF610);
}

uint64_t sub_1BBBDCC88()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1BBBDCDBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[5] = a3;
  void v4[6] = a4;
  v4[3] = a1;
  v4[4] = a2;
  return MEMORY[0x1F4188298](sub_1BBBDCDE0, 0, 0);
}

uint64_t sub_1BBBDCDE0()
{
  if (qword_1EB9F76E8 != -1) {
    swift_once();
  }
  *(void *)(v0 + 16) = *(void *)(v0 + 32);
  uint64_t v1 = swift_task_alloc();
  *(void *)(v0 + 56) = v1;
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 40);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_1BBBDCF30;
  uint64_t v3 = *(void *)(v0 + 24);
  return MEMORY[0x1F41881B8](v3, v0 + 16, &unk_1E9F83890, v1, 0, 0, 0xD00000000000001ALL, 0x80000001BBBEF610);
}

uint64_t sub_1BBBDCF30()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1BBBDD044(uint64_t a1, int *a2)
{
  uint64_t v5 = (uint64_t (*)(void))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_1BBBDD110;
  return v5();
}

uint64_t sub_1BBBDD110()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1BBBDD208(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1BBBEB478();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1BBBEB468();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1BBBDFFFC(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1BBBEB438();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t static Transaction.named<A>(_:with:)(char *a1, uint64_t a2, int a3, void (*a4)(void))
{
  return swift_release();
}

os_activity_scope_state_s *sub_1BBBDD448(char *a1, uint64_t a2, int a3)
{
  uint64_t v6 = sub_1BBBEADC8();
  uint64_t v7 = *(uint64_t **)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3[3].opaque[0] = 0;
  v3[2].opaque[0] = 0;
  v3[3].opaque[1] = 0;
  __swift_instantiateConcreteTypeFromMangledName(qword_1EB9F7438);
  uint64_t v10 = swift_allocObject();
  *(_DWORD *)(v10 + 16) = 0;
  uint64_t v11 = MEMORY[0x1E4FBC870];
  v3[4].opaque[0] = v10;
  v3[4].opaque[1] = v11;
  swift_weakInit();
  int v37 = a3;
  uint64_t v36 = v6;
  if (a3)
  {
    unint64_t v12 = (unint64_t)a1 >> 32;
    if (!((unint64_t)a1 >> 32))
    {
      LODWORD(v12) = a1 >> 11;
      if (a1 >> 11 == 27) {
        goto LABEL_47;
      }
      LODWORD(v12) = a1 >> 16;
      if (a1 >> 16 <= 0x10)
      {
        if ((a1 & 0xFFFFFF80) != 0) {
          goto LABEL_36;
        }
        if (a1 <= 0xFF)
        {
          unsigned int v14 = ((_BYTE)a1 + 1);
          goto LABEL_10;
        }
        __break(1u);
        goto LABEL_43;
      }
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  if (!a1)
  {
    __break(1u);
    goto LABEL_32;
  }
  while (1)
  {
    *(void *)description = sub_1BBBEB2D8();
    unint64_t v40 = v15;
    swift_bridgeObjectRetain();
    sub_1BBBEB2F8();
    swift_bridgeObjectRelease();
    uint64_t v16 = *(void *)description;
    unint64_t v17 = v40;
    sub_1BBBEADB8();
    sub_1BBBEAD98();
    ((void (*)(char *, uint64_t))v7[1])(v9, v36);
    *(void *)description = v16;
    unint64_t v40 = v17;
    swift_bridgeObjectRetain();
    sub_1BBBEB2F8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v18 = v40;
    v3[1].opaque[0] = *(void *)description;
    v3[1].opaque[1] = v18;
    sub_1BBBEB2C8();
    uint64_t v19 = os_transaction_create();
    swift_release();
    v3[2].opaque[0] = v19;
    swift_unknownObjectRelease();
    uint64_t v7 = &v36;
    LODWORD(v12) = v37;
    if (v37) {
      break;
    }
    if (a1)
    {
      if (qword_1EB9F7870 != -1) {
        swift_once();
      }
      uint64_t v20 = qword_1EB9F7860;
      uint64_t v21 = a1;
      goto LABEL_25;
    }
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
LABEL_36:
    int v30 = (a1 & 0x3F) << 8;
    unsigned int v31 = (v30 | (a1 >> 6)) + 33217;
    unsigned int v32 = (v30 | (a1 >> 6) & 0x3F) << 8;
    unsigned int v33 = (((v32 | (a1 >> 12) & 0x3F) << 8) | (a1 >> 18)) - 2122219023;
    unsigned int v34 = (v32 | (a1 >> 12)) + 8487393;
    if (v12) {
      unsigned int v14 = v33;
    }
    else {
      unsigned int v14 = v34;
    }
    if (a1 < 0x800) {
      unsigned int v14 = v31;
    }
LABEL_10:
    *(void *)description = (v14 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << (8 * ((4 - (__clz(v14) >> 3)) & 7)));
  }
  unint64_t v12 = (unint64_t)a1 >> 32;
  if ((unint64_t)a1 >> 32) {
    goto LABEL_35;
  }
  LODWORD(v12) = a1 >> 11;
  if (a1 >> 11 == 27) {
    goto LABEL_48;
  }
  LODWORD(v12) = a1 >> 16;
  if (a1 >> 16 <= 0x10)
  {
    if ((a1 & 0xFFFFFF80) != 0) {
      goto LABEL_44;
    }
    if (a1 <= 0xFF)
    {
      unsigned int v22 = ((_BYTE)a1 + 1);
      goto LABEL_22;
    }
    __break(1u);
LABEL_47:
    __break(1u);
LABEL_48:
    __break(1u);
LABEL_49:
    unsigned int v35 = (v13 | (a1 >> 6) & 0x3F) << 8;
    if (v12) {
      unsigned int v22 = (((v35 | (a1 >> 12) & 0x3F) << 8) | (a1 >> 18)) - 2122219023;
    }
    else {
      unsigned int v22 = (v35 | (a1 >> 12)) + 8487393;
    }
    goto LABEL_22;
  }
LABEL_43:
  __break(1u);
LABEL_44:
  int v13 = (a1 & 0x3F) << 8;
  if (a1 >= 0x800) {
    goto LABEL_49;
  }
  unsigned int v22 = (v13 | (a1 >> 6)) + 33217;
LABEL_22:
  *(void *)description = (v22 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << ((32 - (__clz(v22) & 0x38)) & 0x38));
  if (qword_1EB9F7870 != -1) {
    swift_once();
  }
  uint64_t v20 = qword_1EB9F7860;
  uint64_t v21 = description;
LABEL_25:
  v3[2].opaque[1] = (uint64_t)_os_activity_create(&dword_1BBBA9000, v21, v20, OS_ACTIVITY_FLAG_DEFAULT);
  swift_beginAccess();
  uint64_t v23 = swift_unknownObjectRetain();
  os_activity_scope_enter(v23, v3 + 3);
  swift_endAccess();
  swift_unknownObjectRelease();
  if (qword_1EB9F7958 != -1) {
    swift_once();
  }
  uint64_t v24 = sub_1BBBEAE28();
  __swift_project_value_buffer(v24, (uint64_t)qword_1EB9F8B78);
  swift_retain_n();
  uint64_t v25 = sub_1BBBEAE08();
  os_log_type_t v26 = sub_1BBBEB518();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v27 = (uint8_t *)swift_slowAlloc();
    uint64_t v28 = swift_slowAlloc();
    *(_DWORD *)uint64_t v27 = 136446210;
    uint64_t v38 = v28;
    *(void *)description = 0x3A4E58545BLL;
    unint64_t v40 = 0xE500000000000000;
    swift_retain();
    swift_bridgeObjectRetain();
    sub_1BBBEB2F8();
    swift_bridgeObjectRelease();
    sub_1BBBEB2F8();
    swift_release();
    *(void *)description = sub_1BBBAC938(*(uint64_t *)description, v40, &v38);
    sub_1BBBEB6C8();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BBBA9000, v25, v26, "Opened %{public}s", v27, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C1862BC0](v28, -1, -1);
    MEMORY[0x1C1862BC0](v27, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  return v3;
}

uint64_t Transaction.subscriptionCleaner.getter()
{
  sub_1BBBEADF8();
  return v1;
}

uint64_t sub_1BBBDDB04@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = swift_weakLoadStrong();
  uint64_t v5 = result;
  if (!result)
  {
    type metadata accessor for Transaction.CleanupHelper();
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = sub_1BBBDFF50;
    *(void *)(v5 + 24) = a1;
    swift_weakAssign();
    uint64_t result = swift_retain();
  }
  *a2 = v5;
  return result;
}

uint64_t sub_1BBBDDB8C@<X0>(uint64_t a1@<X1>, unsigned char *a2@<X8>)
{
  uint64_t v4 = (uint64_t *)(a2 + 8);
  swift_beginAccess();
  swift_retain();
  LOBYTE(a1) = sub_1BBBDEFDC(v4, a1);
  uint64_t result = swift_endAccess();
  *a2 = a1 & 1;
  return result;
}

uint64_t sub_1BBBDDC18()
{
  return (*(uint64_t (**)(void))(v0 + 24))();
}

uint64_t sub_1BBBDDC40()
{
  swift_unknownObjectRelease();
  swift_release();

  swift_release();
  return MEMORY[0x1F4186498](v0, 64, 7);
}

uint64_t sub_1BBBDDC90(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t v5 = *(void *)(v1 + 40);
  uint64_t v6 = swift_task_alloc();
  long long v7 = *(_OWORD *)(v1 + 48);
  *(void *)(v2 + 16) = v6;
  *(void *)uint64_t v6 = v2;
  *(void *)(v6 + 8) = sub_1BBBDDD54;
  *(_OWORD *)(v6 + 48) = v7;
  *(void *)(v6 + 32) = v4;
  *(void *)(v6 + 40) = v5;
  *(void *)(v6 + 24) = a1;
  return MEMORY[0x1F4188298](sub_1BBBDCB20, 0, 0);
}

uint64_t sub_1BBBDDD54()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1BBBDDE48@<X0>(uint64_t *a1@<X8>)
{
  return sub_1BBBDDB04(v1, a1);
}

uint64_t static Transaction.named<A>(_:with:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v7 + 48) = a6;
  *(void *)(v7 + 56) = v6;
  *(unsigned char *)(v7 + 88) = a4;
  *(void *)(v7 + 32) = a3;
  *(void *)(v7 + 40) = a5;
  *(void *)(v7 + 16) = a1;
  *(void *)(v7 + 24) = a2;
  return MEMORY[0x1F4188298](sub_1BBBDDE90, 0, 0);
}

uint64_t sub_1BBBDDE90()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v1 = *(int **)(v0 + 40);
  uint64_t v3 = *(char **)(v0 + 24);
  int v4 = *(unsigned __int8 *)(v0 + 88);
  swift_allocObject();
  uint64_t v5 = sub_1BBBDD448(v3, v2, v4);
  *(void *)(v0 + 64) = v5;
  uint64_t v9 = (uint64_t (*)(uint64_t, os_activity_scope_state_s *))((char *)v1 + *v1);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_1BBBDDFB0;
  uint64_t v7 = *(void *)(v0 + 16);
  return v9(v7, v5);
}

uint64_t sub_1BBBDDFB0()
{
  *(void *)(*(void *)v1 + 80) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1BBBDE128;
  }
  else {
    uint64_t v2 = sub_1BBBDE0C4;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1BBBDE0C4()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1BBBDE128()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t static Transaction.named<A>(_:with:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(void *)(v8 + 56) = a7;
  *(void *)(v8 + 64) = v7;
  *(void *)(v8 + 40) = a5;
  *(void *)(v8 + 48) = a6;
  *(unsigned char *)(v8 + 96) = a4;
  *(void *)(v8 + 24) = a2;
  *(void *)(v8 + 32) = a3;
  *(void *)(v8 + 16) = a1;
  return MEMORY[0x1F4188298](sub_1BBBDE1BC, 0, 0);
}

uint64_t sub_1BBBDE1BC()
{
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 72) = v2;
  long long v3 = *(_OWORD *)(v0 + 40);
  *(void *)(v2 + 16) = v1;
  *(_OWORD *)(v2 + 24) = v3;
  uint64_t v4 = swift_task_alloc();
  *(void *)(v0 + 80) = v4;
  *(void *)uint64_t v4 = v0;
  *(void *)(v4 + 8) = sub_1BBBDE2B4;
  uint64_t v5 = *(void *)(v0 + 64);
  char v6 = *(unsigned char *)(v0 + 96);
  uint64_t v7 = *(void *)(v0 + 16);
  long long v8 = *(_OWORD *)(v0 + 24);
  *(void *)(v4 + 48) = v2;
  *(void *)(v4 + 56) = v5;
  *(void *)(v4 + 40) = &unk_1E9F83848;
  *(unsigned char *)(v4 + 88) = v6;
  *(_OWORD *)(v4 + 24) = v8;
  *(void *)(v4 + 16) = v7;
  return MEMORY[0x1F4188298](sub_1BBBDDE90, 0, 0);
}

uint64_t sub_1BBBDE2B4()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 88) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x1F4188298](sub_1BBBDE3F0, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    long long v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_1BBBDE3F0()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1BBBDE454(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v7 = (uint64_t (*)(uint64_t))((char *)a3 + *a3);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v5;
  *uint64_t v5 = v3;
  v5[1] = sub_1BBBDDD54;
  return v7(a1);
}

uint64_t sub_1BBBDE530(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 24);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1BBBDDD54;
  uint64_t v8 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  char v6 = (void *)swift_task_alloc();
  void v5[2] = v6;
  *char v6 = v5;
  v6[1] = sub_1BBBDDD54;
  return v8(a1);
}

void sub_1BBBDE65C()
{
  if (v0[2].opaque[0])
  {
    if (qword_1EB9F7958 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_1BBBEAE28();
    __swift_project_value_buffer(v1, (uint64_t)qword_1EB9F8B78);
    swift_retain_n();
    uint64_t v2 = sub_1BBBEAE08();
    os_log_type_t v3 = sub_1BBBEB518();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      uint64_t v5 = swift_slowAlloc();
      *(_DWORD *)uint64_t v4 = 136446210;
      uint64_t v6 = v5;
      uint64_t v7 = 0x3A4E58545BLL;
      unint64_t v8 = 0xE500000000000000;
      swift_retain();
      swift_bridgeObjectRetain();
      sub_1BBBEB2F8();
      swift_bridgeObjectRelease();
      sub_1BBBEB2F8();
      swift_release();
      uint64_t v7 = sub_1BBBAC938(0x3A4E58545BLL, 0xE500000000000000, &v6);
      sub_1BBBEB6C8();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1BBBA9000, v2, v3, "Closed %{public}s", v4, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C1862BC0](v5, -1, -1);
      MEMORY[0x1C1862BC0](v4, -1, -1);
    }
    else
    {

      swift_release_n();
    }
    swift_beginAccess();
    os_activity_scope_leave(v0 + 3);
    swift_endAccess();
    v0[2].opaque[0] = 0;
    swift_unknownObjectRelease();
  }
}

uint64_t Transaction.deinit()
{
  sub_1BBBDE65C();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_weakDestroy();
  return v0;
}

uint64_t Transaction.__deallocating_deinit()
{
  sub_1BBBDE65C();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_weakDestroy();
  return MEMORY[0x1F4186488](v0, 88, 7);
}

uint64_t sub_1BBBDE94C()
{
  (*(void (**)(void))(v0 + 16))();
  swift_release();
  return MEMORY[0x1F4186488](v0, 32, 7);
}

uint64_t sub_1BBBDE99C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for Transaction.CleanupHelper();
  sub_1BBBEBA28();
  sub_1BBBEB2F8();
  swift_bridgeObjectRelease();
  sub_1BBBEB2F8();
  MEMORY[0x1C1862170](v3, a2);
  sub_1BBBEB2F8();
  swift_bridgeObjectRelease();
  sub_1BBBEB2F8();
  return 60;
}

uint64_t Transaction.description.getter()
{
  return 0x3A4E58545BLL;
}

uint64_t sub_1BBBDEAD4()
{
  return 0x3A4E58545BLL;
}

uint64_t AnyCancellable.store(in:)()
{
  return swift_release();
}

uint64_t sub_1BBBDEBD0@<X0>(unsigned char *a1@<X8>)
{
  return sub_1BBBDDB8C(*(void *)(v1 + 24), a1);
}

os_activity_scope_state_s *PressuredExitTransactionManager.begin(_:)(char *a1, uint64_t a2, int a3)
{
  return sub_1BBBDD448(a1, a2, a3);
}

uint64_t type metadata accessor for Transaction()
{
  return self;
}

uint64_t sub_1BBBDEC6C()
{
  qword_1EB9F7860 = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "_os_activity_current");
  return swift_unknownObjectRetain();
}

uint64_t os_activity(name:block:)(const char *a1, uint64_t a2, char a3, void (*a4)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  if (a3)
  {
    if ((unint64_t)a1 >> 32)
    {
LABEL_15:
      __break(1u);
      goto LABEL_16;
    }
    if (a1 >> 11 == 27) {
      __break(1u);
    }
    if (a1 >> 16 > 0x10)
    {
      __break(1u);
    }
    else if ((a1 & 0xFFFFFF80) == 0)
    {
      if (a1 > 0xFF)
      {
        __break(1u);
        goto LABEL_21;
      }
      unsigned int v8 = ((_BYTE)a1 + 1);
LABEL_11:
      uint64_t v19 = (v8 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << ((32 - (__clz(v8) & 0x38)) & 0x38));
      if (qword_1EB9F7870 == -1)
      {
LABEL_12:
        uint64_t v6 = qword_1EB9F7860;
        uint64_t v7 = (const char *)&v19;
        goto LABEL_13;
      }
LABEL_21:
      swift_once();
      goto LABEL_12;
    }
    int v15 = (a1 & 0x3F) << 8;
    if (a1 >= 0x800)
    {
      unsigned int v16 = (v15 | (a1 >> 6) & 0x3F) << 8;
      unsigned int v17 = (((v16 | (a1 >> 12) & 0x3F) << 8) | (a1 >> 18)) - 2122219023;
      unsigned int v18 = (v16 | (a1 >> 12)) + 8487393;
      if (a1 >> 16) {
        unsigned int v8 = v17;
      }
      else {
        unsigned int v8 = v18;
      }
    }
    else
    {
      unsigned int v8 = (v15 | (a1 >> 6)) + 33217;
    }
    goto LABEL_11;
  }
  if (!a1)
  {
    __break(1u);
    goto LABEL_15;
  }
  if (qword_1EB9F7870 != -1) {
LABEL_16:
  }
    swift_once();
  uint64_t v6 = qword_1EB9F7860;
  uint64_t v7 = a1;
LABEL_13:
  uint64_t v9 = _os_activity_create(&dword_1BBBA9000, v7, v6, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v9, &state);
  a4(v10, v11, v12, v13);
  os_activity_scope_leave(&state);
  return swift_unknownObjectRelease();
}

uint64_t method lookup function for Transaction(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for Transaction);
}

uint64_t type metadata accessor for Transaction.CleanupHelper()
{
  return self;
}

ValueMetadata *type metadata accessor for PressuredExitTransactionManager()
{
  return &type metadata for PressuredExitTransactionManager;
}

uint64_t sub_1BBBDEF00(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1BBBE0328;
  return v6(a1);
}

uint64_t sub_1BBBDEFDC(uint64_t *a1, uint64_t a2)
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
    swift_retain();
    uint64_t v8 = sub_1BBBEB7E8();
    swift_release();
    if (v8)
    {
      swift_bridgeObjectRelease();
      swift_release();
      sub_1BBBEAF08();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v18;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_1BBBEB7D8();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    uint64_t v16 = sub_1BBBDF2B0(v7, result + 1);
    uint64_t v20 = v16;
    if (*(void *)(v16 + 24) <= *(void *)(v16 + 16))
    {
      swift_retain();
      sub_1BBBDF4D8();
      uint64_t v17 = v20;
    }
    else
    {
      uint64_t v17 = v16;
      swift_retain();
    }
    sub_1BBBDF7EC(a2, v17);
    *uint64_t v3 = v17;
    swift_bridgeObjectRelease();
    *a1 = a2;
    return 1;
  }
  sub_1BBBEAF08();
  sub_1BBBDF8C0(&qword_1EB9F75E0);
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_1BBBEB228();
  uint64_t v11 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v12 = v10 & ~v11;
  if (((*(void *)(v6 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12) & 1) == 0)
  {
LABEL_11:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v19 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    uint64_t v15 = swift_retain();
    sub_1BBBDF904(v15, v12, isUniquelyReferenced_nonNull_native);
    *uint64_t v2 = v19;
    swift_bridgeObjectRelease();
    *a1 = a2;
    return 1;
  }
  uint64_t v13 = ~v11;
  sub_1BBBDF8C0((unint64_t *)&unk_1E9F83858);
  while ((sub_1BBBEB268() & 1) == 0)
  {
    unint64_t v12 = (v12 + 1) & v13;
    if (((*(void *)(v6 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12) & 1) == 0) {
      goto LABEL_11;
    }
  }
  swift_release();
  swift_bridgeObjectRelease();
  *a1 = *(void *)(*(void *)(*v2 + 48) + 8 * v12);
  swift_retain();
  return 0;
}

uint64_t sub_1BBBDF2B0(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F76C0);
    uint64_t v2 = sub_1BBBEB828();
    uint64_t v14 = v2;
    sub_1BBBEB7C8();
    if (sub_1BBBEB7F8())
    {
      sub_1BBBEAF08();
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_1BBBDF4D8();
          uint64_t v2 = v14;
        }
        sub_1BBBDF8C0(&qword_1EB9F75E0);
        uint64_t result = sub_1BBBEB228();
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
      while (sub_1BBBEB7F8());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x1E4FBC870];
  }
  return v2;
}

uint64_t sub_1BBBDF4D8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F76C0);
  uint64_t v3 = sub_1BBBEB818();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v27 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v26 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v8 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v10 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v12 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v13 = v12 | (v10 << 6);
      }
      else
      {
        int64_t v14 = v10 + 1;
        if (__OFADD__(v10, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v14 >= v26) {
          goto LABEL_33;
        }
        unint64_t v15 = v27[v14];
        ++v10;
        if (!v15)
        {
          int64_t v10 = v14 + 1;
          if (v14 + 1 >= v26) {
            goto LABEL_33;
          }
          unint64_t v15 = v27[v10];
          if (!v15)
          {
            int64_t v10 = v14 + 2;
            if (v14 + 2 >= v26) {
              goto LABEL_33;
            }
            unint64_t v15 = v27[v10];
            if (!v15)
            {
              int64_t v16 = v14 + 3;
              if (v16 >= v26)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v25 = 1 << *(unsigned char *)(v2 + 32);
                if (v25 > 63) {
                  bzero(v27, ((unint64_t)(v25 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v27 = -1 << v25;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v15 = v27[v16];
              if (!v15)
              {
                while (1)
                {
                  int64_t v10 = v16 + 1;
                  if (__OFADD__(v16, 1)) {
                    goto LABEL_39;
                  }
                  if (v10 >= v26) {
                    goto LABEL_33;
                  }
                  unint64_t v15 = v27[v10];
                  ++v16;
                  if (v15) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v10 = v16;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v15 - 1) & v15;
        unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
      }
      uint64_t v17 = *(void *)(*(void *)(v2 + 48) + 8 * v13);
      sub_1BBBEAF08();
      sub_1BBBDF8C0(&qword_1EB9F75E0);
      uint64_t result = sub_1BBBEB228();
      uint64_t v18 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v19 = result & ~v18;
      unint64_t v20 = v19 >> 6;
      if (((-1 << v19) & ~*(void *)(v8 + 8 * (v19 >> 6))) != 0)
      {
        unint64_t v11 = __clz(__rbit64((-1 << v19) & ~*(void *)(v8 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v21 = 0;
        unint64_t v22 = (unint64_t)(63 - v18) >> 6;
        do
        {
          if (++v20 == v22 && (v21 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v23 = v20 == v22;
          if (v20 == v22) {
            unint64_t v20 = 0;
          }
          v21 |= v23;
          uint64_t v24 = *(void *)(v8 + 8 * v20);
        }
        while (v24 == -1);
        unint64_t v11 = __clz(__rbit64(~v24)) + (v20 << 6);
      }
      *(void *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      *(void *)(*(void *)(v4 + 48) + 8 * v11) = v17;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

unint64_t sub_1BBBDF7EC(uint64_t a1, uint64_t a2)
{
  sub_1BBBEAF08();
  sub_1BBBDF8C0(&qword_1EB9F75E0);
  sub_1BBBEB228();
  unint64_t result = sub_1BBBEB7B8();
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

uint64_t sub_1BBBDF8C0(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1BBBEAF08();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1BBBDF904(uint64_t result, unint64_t a2, char a3)
{
  uint64_t v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_1BBBDF4D8();
  }
  else
  {
    if (v7 > v6)
    {
      uint64_t result = (uint64_t)sub_1BBBDFAB8();
      goto LABEL_12;
    }
    sub_1BBBDFC64();
  }
  uint64_t v8 = *v3;
  sub_1BBBEAF08();
  sub_1BBBDF8C0(&qword_1EB9F75E0);
  uint64_t result = sub_1BBBEB228();
  uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
  a2 = result & ~v9;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v10 = ~v9;
    sub_1BBBDF8C0((unint64_t *)&unk_1E9F83858);
    do
    {
      uint64_t result = sub_1BBBEB268();
      if (result) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v10;
    }
    while (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  uint64_t v11 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v11 + 48) + 8 * a2) = v5;
  uint64_t v12 = *(void *)(v11 + 16);
  BOOL v13 = __OFADD__(v12, 1);
  uint64_t v14 = v12 + 1;
  if (!v13)
  {
    *(void *)(v11 + 16) = v14;
    return result;
  }
  __break(1u);
LABEL_15:
  uint64_t result = sub_1BBBEBB08();
  __break(1u);
  return result;
}

void *sub_1BBBDFAB8()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F76C0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1BBBEB808();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(void *)(*(void *)(v4 + 48) + 8 * v15) = *(void *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t result = (void *)swift_retain();
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1BBBDFC64()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F76C0);
  uint64_t v3 = sub_1BBBEB818();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v25 = v2 + 56;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  else {
    uint64_t v6 = -1;
  }
  unint64_t v7 = v6 & *(void *)(v2 + 56);
  int64_t v26 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v8 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v10 = 0;
  while (1)
  {
    if (v7)
    {
      unint64_t v12 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    int64_t v14 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v14 >= v26) {
      goto LABEL_33;
    }
    unint64_t v15 = *(void *)(v25 + 8 * v14);
    ++v10;
    if (!v15)
    {
      int64_t v10 = v14 + 1;
      if (v14 + 1 >= v26) {
        goto LABEL_33;
      }
      unint64_t v15 = *(void *)(v25 + 8 * v10);
      if (!v15)
      {
        int64_t v10 = v14 + 2;
        if (v14 + 2 >= v26) {
          goto LABEL_33;
        }
        unint64_t v15 = *(void *)(v25 + 8 * v10);
        if (!v15) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v7 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    uint64_t v17 = *(void *)(*(void *)(v2 + 48) + 8 * v13);
    sub_1BBBEAF08();
    sub_1BBBDF8C0(&qword_1EB9F75E0);
    swift_retain();
    uint64_t result = sub_1BBBEB228();
    uint64_t v18 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v19 = result & ~v18;
    unint64_t v20 = v19 >> 6;
    if (((-1 << v19) & ~*(void *)(v8 + 8 * (v19 >> 6))) != 0)
    {
      unint64_t v11 = __clz(__rbit64((-1 << v19) & ~*(void *)(v8 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v21 = 0;
      unint64_t v22 = (unint64_t)(63 - v18) >> 6;
      do
      {
        if (++v20 == v22 && (v21 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v23 = v20 == v22;
        if (v20 == v22) {
          unint64_t v20 = 0;
        }
        v21 |= v23;
        uint64_t v24 = *(void *)(v8 + 8 * v20);
      }
      while (v24 == -1);
      unint64_t v11 = __clz(__rbit64(~v24)) + (v20 << 6);
    }
    *(void *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    *(void *)(*(void *)(v4 + 48) + 8 * v11) = v17;
    ++*(void *)(v4 + 16);
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v26)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v15 = *(void *)(v25 + 8 * v16);
  if (v15)
  {
    int64_t v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v10 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v10 >= v26) {
      goto LABEL_33;
    }
    unint64_t v15 = *(void *)(v25 + 8 * v10);
    ++v16;
    if (v15) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_1BBBDFF50()
{
  return sub_1BBBEADF8();
}

uint64_t sub_1BBBDFFA8()
{
  swift_beginAccess();
  *(void *)(v0 + 72) = MEMORY[0x1E4FBC870];
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BBBDFFFC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F7678);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1BBBE005C()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1BBBE0094(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1BBBE0324;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1E9F83868 + dword_1E9F83868);
  return v6(a1, v4);
}

uint64_t sub_1BBBE014C(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = swift_task_alloc();
  long long v6 = *(_OWORD *)(v1 + 24);
  *(void *)(v2 + 16) = v5;
  *(void *)uint64_t v5 = v2;
  *(void *)(v5 + 8) = sub_1BBBE0324;
  *(_OWORD *)(v5 + 40) = v6;
  *(void *)(v5 + 24) = a1;
  *(void *)(v5 + 32) = v4;
  return MEMORY[0x1F4188298](sub_1BBBDCDE0, 0, 0);
}

uint64_t sub_1BBBE020C()
{
  uint64_t v2 = *(int **)(v0 + 16);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_1BBBE0324;
  long long v6 = (uint64_t (*)(void))((char *)v2 + *v2);
  uint64_t v4 = (void *)swift_task_alloc();
  v3[2] = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_1BBBDD110;
  return v6();
}

unint64_t sub_1BBBE032C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F838B0);
  uint64_t v2 = (void *)sub_1BBBEB988();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (_OWORD *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *((void *)v4 - 2);
    uint64_t v6 = *((void *)v4 - 1);
    long long v13 = *v4;
    swift_bridgeObjectRetain();
    swift_retain();
    unint64_t result = sub_1BBBE7E88(v5, v6);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    int64_t v9 = (uint64_t *)(v2[6] + 16 * result);
    *int64_t v9 = v5;
    v9[1] = v6;
    *(_OWORD *)(v2[7] + 16 * result) = v13;
    uint64_t v10 = v2[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    void v2[2] = v12;
    v4 += 2;
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

uint64_t DarwinNotificationHelper.description.getter()
{
  uint64_t v0 = type metadata accessor for DarwinNotificationHelper();
  uint64_t v2 = sub_1BBBE3BF8(&qword_1E9F83898, v1, (void (*)(uint64_t))type metadata accessor for DarwinNotificationHelper);
  sub_1BBBEBA28();
  sub_1BBBEB2F8();
  swift_bridgeObjectRelease();
  sub_1BBBEB2F8();
  MEMORY[0x1C1862170](v0, v2);
  sub_1BBBEB2F8();
  swift_bridgeObjectRelease();
  sub_1BBBEB2F8();
  return 60;
}

uint64_t type metadata accessor for DarwinNotificationHelper()
{
  return self;
}

uint64_t sub_1BBBE0570(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for DarwinNotificationHelper();
  sub_1BBBEBA28();
  sub_1BBBEB2F8();
  swift_bridgeObjectRelease();
  sub_1BBBEB2F8();
  MEMORY[0x1C1862170](v3, a2);
  sub_1BBBEB2F8();
  swift_bridgeObjectRelease();
  sub_1BBBEB2F8();
  return 60;
}

uint64_t DarwinNotificationHelper.__allocating_init(notificationHandlers:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  type metadata accessor for DarwinNotificationListener();
  uint64_t v3 = swift_allocObject();
  sub_1BBBE191C(a1, 0);
  *(void *)(v2 + 16) = v3;
  *(void *)(v2 + 24) = 0;
  return v2;
}

uint64_t DarwinNotificationHelper.init(notificationHandlers:)(uint64_t a1)
{
  uint64_t v2 = v1;
  type metadata accessor for DarwinNotificationListener();
  uint64_t v4 = swift_allocObject();
  sub_1BBBE191C(a1, 0);
  *(void *)(v2 + 16) = v4;
  *(void *)(v2 + 24) = 0;
  return v2;
}

uint64_t type metadata accessor for DarwinNotificationListener()
{
  return self;
}

uint64_t DarwinNotificationHelper.__allocating_init(subscribedToNames:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  type metadata accessor for DarwinNotificationListener();
  uint64_t v3 = swift_allocObject();
  sub_1BBBE2408(a1);
  *(void *)(v2 + 16) = v3;
  *(void *)(v2 + 24) = 0;
  return v2;
}

uint64_t DarwinNotificationHelper.init(subscribedToNames:)(uint64_t a1)
{
  uint64_t v2 = v1;
  type metadata accessor for DarwinNotificationListener();
  uint64_t v4 = swift_allocObject();
  sub_1BBBE2408(a1);
  *(void *)(v2 + 16) = v4;
  *(void *)(v2 + 24) = 0;
  return v2;
}

uint64_t DarwinNotificationHelper.__allocating_init(notificationName:rateLimit:)(void *a1, double a2)
{
  uint64_t v4 = swift_allocObject();
  type metadata accessor for DarwinNotificationPoster();
  uint64_t v5 = swift_allocObject();
  sub_1BBBE0E94(a1, a2);
  *(void *)(v4 + 16) = 0;
  *(void *)(v4 + 24) = v5;
  return v4;
}

uint64_t DarwinNotificationHelper.init(notificationName:rateLimit:)(void *a1, double a2)
{
  uint64_t v3 = v2;
  type metadata accessor for DarwinNotificationPoster();
  uint64_t v6 = swift_allocObject();
  sub_1BBBE0E94(a1, a2);
  *(void *)(v3 + 16) = 0;
  *(void *)(v3 + 24) = v6;
  return v3;
}

uint64_t sub_1BBBE0894(char a1)
{
  if (*(void *)(v1 + 24))
  {
    if (a1)
    {
      swift_retain();
      sub_1BBBE14DC();
    }
    else
    {
      swift_retain();
      __swift_instantiateConcreteTypeFromMangledName(qword_1EB9F8100);
      sub_1BBBB8B7C(&qword_1EB9F80F0, qword_1EB9F8100);
      sub_1BBBEAFB8();
    }
    return swift_release();
  }
  else
  {
    sub_1BBBE27DC();
    swift_allocError();
    *uint64_t v2 = 0;
    return swift_willThrow();
  }
}

uint64_t sub_1BBBE0970(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + 24);
  if (v2)
  {
    uint64_t v4 = *(NSObject **)(v2 + 32);
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v2;
    *(void *)(v5 + 24) = a1;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = sub_1BBBE2868;
    *(void *)(v6 + 24) = v5;
    v10[4] = sub_1BBBD2448;
    v10[5] = v6;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 1107296256;
    _OWORD v10[2] = sub_1BBBAFFC8;
    v10[3] = &block_descriptor_8;
    uint64_t v7 = _Block_copy(v10);
    swift_retain_n();
    swift_retain();
    swift_release();
    dispatch_sync(v4, v7);
    _Block_release(v7);
    LOBYTE(v4) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    swift_release();
    uint64_t result = swift_release();
    if ((v4 & 1) == 0) {
      return result;
    }
    __break(1u);
  }
  sub_1BBBE27DC();
  swift_allocError();
  *int64_t v9 = 0;
  return swift_willThrow();
}

uint64_t sub_1BBBE0B0C(uint64_t a1, unint64_t a2)
{
  if (*(void *)(v2 + 16))
  {
    MEMORY[0x1F4188790](a1);
    swift_retain();
    sub_1BBBEB628();
    swift_release();
    return v11;
  }
  else
  {
    if (qword_1EB9F8258 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_1BBBEAE28();
    __swift_project_value_buffer(v6, (uint64_t)qword_1EB9F8B90);
    swift_bridgeObjectRetain_n();
    uint64_t v7 = sub_1BBBEAE08();
    os_log_type_t v8 = sub_1BBBEB538();
    if (os_log_type_enabled(v7, v8))
    {
      int64_t v9 = (uint8_t *)swift_slowAlloc();
      uint64_t v10 = swift_slowAlloc();
      uint64_t v11 = v10;
      *(_DWORD *)int64_t v9 = 136315138;
      swift_bridgeObjectRetain();
      sub_1BBBAC938(a1, a2, &v11);
      sub_1BBBEB6C8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1BBBA9000, v7, v8, "DarwinNotificationHelper initialized for posting. Not registered for %s", v9, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C1862BC0](v10, -1, -1);
      MEMORY[0x1C1862BC0](v9, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return 0;
  }
}

uint64_t sub_1BBBE0D38(uint64_t a1)
{
  if (*(void *)(v1 + 16))
  {
    MEMORY[0x1F4188790](a1);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F7890);
    sub_1BBBEB628();
    swift_release();
    return v4;
  }
  else
  {
    sub_1BBBE27DC();
    swift_allocError();
    *uint64_t v3 = 1;
    return swift_willThrow();
  }
}

uint64_t DarwinNotificationHelper.deinit()
{
  swift_release();
  swift_release();
  return v0;
}

uint64_t DarwinNotificationHelper.__deallocating_deinit()
{
  swift_release();
  swift_release();
  return MEMORY[0x1F4186488](v0, 32, 7);
}

uint64_t sub_1BBBE0E94(void *a1, double a2)
{
  unsigned int v32 = a1;
  uint64_t v4 = sub_1BBBEB5F8();
  uint64_t v25 = *(void *)(v4 - 8);
  uint64_t v26 = v4;
  MEMORY[0x1F4188790](v4);
  uint64_t v24 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(qword_1EB9F8010);
  uint64_t v28 = *(void *)(v6 - 8);
  uint64_t v29 = v6;
  MEMORY[0x1F4188790](v6);
  uint64_t v27 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_1BBBEB608();
  uint64_t v8 = *(void *)(v31 - 8);
  MEMORY[0x1F4188790](v31);
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1BBBEB578();
  MEMORY[0x1F4188790](v11);
  uint64_t v12 = sub_1BBBEB0F8();
  MEMORY[0x1F4188790](v12 - 8);
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(qword_1EB9F8100);
  swift_allocObject();
  uint64_t v13 = sub_1BBBEAF38();
  *(void *)(v2 + 24) = v13;
  sub_1BBBAEE84();
  sub_1BBBEB0D8();
  uint64_t v34 = MEMORY[0x1E4FBC860];
  sub_1BBBE3BF8((unint64_t *)&qword_1EB9F8330, 255, MEMORY[0x1E4FBCC10]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F8320);
  sub_1BBBB8B7C((unint64_t *)&qword_1EB9F8328, &qword_1EB9F8320);
  sub_1BBBEB798();
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x1E4FBCC58], v31);
  uint64_t v14 = v30;
  unint64_t v15 = v32;
  uint64_t v16 = sub_1BBBEB648();
  *(void *)(v14 + 40) = MEMORY[0x1E4FBC860];
  *(void *)(v14 + 32) = v16;
  *(void *)(v14 + 16) = v15;
  *(unsigned char *)(v14 + 48) = a2 != 0.0;
  if (a2 == 0.0)
  {
    uint64_t v34 = v13;
    swift_allocObject();
    swift_weakInit();
    sub_1BBBB8B7C(&qword_1EB9F80F8, qword_1EB9F8100);
    id v22 = v15;
    swift_retain();
    sub_1BBBEB078();
    swift_release();
    swift_release();
  }
  else
  {
    uint64_t v17 = v16;
    uint64_t v34 = v13;
    id v18 = v15;
    swift_retain();
    unint64_t v19 = v24;
    sub_1BBBEB5E8();
    uint64_t v35 = v17;
    sub_1BBBB8B7C(&qword_1EB9F80F8, qword_1EB9F8100);
    sub_1BBBE3BF8(&qword_1EB9F8270, 255, (void (*)(uint64_t))sub_1BBBAEE84);
    unint64_t v20 = v27;
    sub_1BBBEB068();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v19, v26);
    swift_release();
    swift_allocObject();
    swift_weakInit();
    sub_1BBBB8B7C(&qword_1EB9F80E8, qword_1EB9F8010);
    uint64_t v21 = v29;
    sub_1BBBEB078();
    swift_release();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v20, v21);
  }
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F8260);
  sub_1BBBB8B7C(&qword_1EB9F8268, &qword_1EB9F8260);
  sub_1BBBEAEF8();
  swift_endAccess();
  swift_release();

  return v14;
}

void sub_1BBBE14DC()
{
  uint64_t v1 = v0;
  uint64_t v2 = CFNotificationCenterGetDarwinNotifyCenter();
  if (v2)
  {
    uint64_t v3 = v2;
    if (qword_1EB9F7238 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_1BBBEAE28();
    __swift_project_value_buffer(v4, (uint64_t)qword_1EB9F8B50);
    swift_retain_n();
    uint64_t v5 = sub_1BBBEAE08();
    os_log_type_t v6 = sub_1BBBEB558();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = swift_slowAlloc();
      uint64_t v8 = swift_slowAlloc();
      uint64_t v11 = v8;
      *(_DWORD *)uint64_t v7 = 136446466;
      uint64_t v9 = sub_1BBBEB2A8();
      sub_1BBBAC938(v9, v10, &v11);
      sub_1BBBEB6C8();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v7 + 12) = 1024;
      swift_release();
      sub_1BBBEB6C8();
      swift_release();
      _os_log_impl(&dword_1BBBA9000, v5, v6, "Posting %{public}s, rate-limiting: %{BOOL}d.", (uint8_t *)v7, 0x12u);
      swift_arrayDestroy();
      MEMORY[0x1C1862BC0](v8, -1, -1);
      MEMORY[0x1C1862BC0](v7, -1, -1);
    }
    else
    {

      swift_release_n();
    }
    CFNotificationCenterPostNotification(v3, *(CFNotificationName *)(v1 + 16), 0, 0, 1u);
  }
  else
  {
    sub_1BBBEB958();
    __break(1u);
  }
}

uint64_t sub_1BBBE1734()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_1BBBE14DC();
    return swift_release();
  }
  return result;
}

uint64_t sub_1BBBE178C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1BBBEB158();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = &v13[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = *(void **)(a1 + 32);
  *uint64_t v7 = v8;
  (*(void (**)(void *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E4FBCBF0], v4);
  id v9 = v8;
  LOBYTE(v8) = sub_1BBBEB178();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v5 + 8))(v7, v4);
  if (v8)
  {
    int v11 = sub_1BBBEB2A8();
    v13[12] = 1;
    sub_1BBBB86D8(v11, v12, a2, 0x100000000);
    return swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1BBBE18CC()
{
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186488](v0, 49, 7);
}

uint64_t sub_1BBBE191C(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  int v19 = a2;
  uint64_t v18 = sub_1BBBEB608();
  uint64_t v5 = *(void *)(v18 - 8);
  MEMORY[0x1F4188790](v18);
  uint64_t v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1BBBEB578();
  MEMORY[0x1F4188790](v8);
  uint64_t v9 = sub_1BBBEB0F8();
  MEMORY[0x1F4188790](v9 - 8);
  *(void *)(v2 + 24) = MEMORY[0x1E4FBC868];
  v17[1] = sub_1BBBAEE84();
  sub_1BBBEB0D8();
  aBlock[0] = MEMORY[0x1E4FBC860];
  sub_1BBBE3BF8((unint64_t *)&qword_1EB9F8330, 255, MEMORY[0x1E4FBCC10]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F8320);
  sub_1BBBB8B7C((unint64_t *)&qword_1EB9F8328, &qword_1EB9F8320);
  sub_1BBBEB798();
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E4FBCC58], v18);
  *(void *)(v2 + 32) = sub_1BBBEB648();
  *(void *)(v2 + 40) = MEMORY[0x1E4FBC868];
  *(void *)(v2 + 56) = MEMORY[0x1E4FBC860];
  *(void *)(v2 + 16) = a1;
  *(unsigned char *)(v2 + 48) = v19;
  uint64_t v10 = swift_bridgeObjectRetain();
  int v11 = sub_1BBBE3910(v10);
  swift_bridgeObjectRelease();
  int v12 = *(NSObject **)(v2 + 32);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v3;
  *(void *)(v13 + 24) = v11;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = sub_1BBBE3DB4;
  *(void *)(v14 + 24) = v13;
  aBlock[4] = sub_1BBBD29D4;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BBBAFFC8;
  void aBlock[3] = &block_descriptor_54;
  unint64_t v15 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v12, v15);
  _Block_release(v15);
  LOBYTE(v12) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if ((v12 & 1) == 0) {
    return v3;
  }
  __break(1u);
  return result;
}

void sub_1BBBE1CE4(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F7978);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v50 = (char *)v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F7850);
  uint64_t v6 = *(void *)(v49 - 8);
  MEMORY[0x1F4188790](v49);
  uint64_t v48 = (char *)v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1BBBEB158();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  int v11 = (void *)((char *)v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  int v12 = *(void **)(v2 + 32);
  *int v11 = v12;
  (*(void (**)(void *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x1E4FBCBF0], v8);
  id v47 = v12;
  LOBYTE(v12) = sub_1BBBEB178();
  (*(void (**)(void *, uint64_t))(v9 + 8))(v11, v8);
  if (v12)
  {
    if (qword_1EB9F8258 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  uint64_t v13 = sub_1BBBEAE28();
  uint64_t v46 = __swift_project_value_buffer(v13, (uint64_t)qword_1EB9F8B90);
  uint64_t v14 = sub_1BBBEAE08();
  os_log_type_t v15 = sub_1BBBEB558();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl(&dword_1BBBA9000, v14, v15, "Setup darwin callback handlers", v16, 2u);
    MEMORY[0x1C1862BC0](v16, -1, -1);
  }

  uint64_t v17 = *(void *)(a1 + 16);
  if (v17)
  {
    unint64_t v43 = (void (**)(char *, uint64_t))(v6 + 8);
    uint64_t v44 = v2 + 56;
    swift_bridgeObjectRetain();
    uint64_t v18 = 0;
    v40[0] = a1;
    int v19 = (unint64_t *)(a1 + 40);
    uint64_t v42 = MEMORY[0x1E4FBC848] + 8;
    *(void *)&long long v20 = 136315138;
    long long v41 = v20;
    v40[1] = MEMORY[0x1E4FBC840] + 8;
    uint64_t v45 = v2;
    do
    {
      uint64_t v52 = v17;
      uint64_t v23 = *(v19 - 1);
      unint64_t v24 = *v19;
      uint64_t v25 = qword_1EB9F81A0;
      uint64_t v26 = swift_bridgeObjectRetain();
      if (v25 != -1) {
        uint64_t v26 = swift_once();
      }
      MEMORY[0x1F4188790](v26);
      v40[-4] = v27;
      v40[-3] = v23;
      v40[-2] = v24;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F7890);
      sub_1BBBEADF8();
      uint64_t v51 = v18;
      uint64_t v28 = v47;
      id v54 = v47;
      uint64_t v29 = sub_1BBBEB5D8();
      uint64_t v30 = v23;
      uint64_t v31 = (uint64_t)v50;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v50, 1, 1, v29);
      sub_1BBBAEE84();
      sub_1BBBB8B7C(&qword_1EB9F7888, &qword_1EB9F7890);
      sub_1BBBE3BF8(&qword_1EB9F8270, 255, (void (*)(uint64_t))sub_1BBBAEE84);
      id v32 = v28;
      uint64_t v33 = v48;
      sub_1BBBEB048();
      sub_1BBBCB7AC(v31);

      swift_release();
      swift_allocObject();
      uint64_t v34 = v45;
      swift_weakInit();
      sub_1BBBB8B7C(&qword_1EB9F7880, &qword_1EB9F7850);
      uint64_t v35 = v49;
      sub_1BBBEB078();
      swift_release();
      (*v43)(v33, v35);
      swift_beginAccess();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F8260);
      sub_1BBBB8B7C(&qword_1EB9F8268, &qword_1EB9F8260);
      sub_1BBBEAEF8();
      swift_endAccess();
      swift_release();
      swift_bridgeObjectRetain_n();
      uint64_t v36 = sub_1BBBEAE08();
      os_log_type_t v37 = sub_1BBBEB558();
      if (os_log_type_enabled(v36, v37))
      {
        uint64_t v38 = swift_slowAlloc();
        uint64_t v39 = swift_slowAlloc();
        v53[0] = v39;
        *(_DWORD *)uint64_t v38 = v41;
        swift_bridgeObjectRetain();
        *(void *)(v38 + 4) = sub_1BBBAC938(v30, v24, v53);
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_1BBBA9000, v36, v37, "Setting up darwin callback handler for %s", (uint8_t *)v38, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1C1862BC0](v39, -1, -1);
        MEMORY[0x1C1862BC0](v38, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      v19 += 2;
      uint64_t v21 = sub_1BBBEB2C8();
      uint64_t v22 = v30;
      uint64_t v18 = v51;
      sub_1BBBE3324((const char *)(v21 + 32), *(void *)(v21 + 16), v34, v22, v24);
      swift_bridgeObjectRelease();
      swift_release();
      uint64_t v17 = v52 - 1;
    }
    while (v52 != 1);
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_1BBBE2408(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v17 = a1;
  uint64_t v3 = sub_1BBBEB608();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1BBBEB578();
  MEMORY[0x1F4188790](v7);
  uint64_t v8 = sub_1BBBEB0F8();
  MEMORY[0x1F4188790](v8 - 8);
  *(void *)(v1 + 24) = MEMORY[0x1E4FBC868];
  unint64_t v16 = sub_1BBBAEE84();
  sub_1BBBEB0D8();
  aBlock[0] = MEMORY[0x1E4FBC860];
  sub_1BBBE3BF8((unint64_t *)&qword_1EB9F8330, 255, MEMORY[0x1E4FBCC10]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F8320);
  sub_1BBBB8B7C((unint64_t *)&qword_1EB9F8328, &qword_1EB9F8320);
  sub_1BBBEB798();
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E4FBCC58], v3);
  uint64_t v9 = sub_1BBBEB648();
  *(void *)(v1 + 32) = v9;
  *(void *)(v1 + 40) = MEMORY[0x1E4FBC868];
  uint64_t v10 = MEMORY[0x1E4FBC860];
  *(void *)(v1 + 56) = MEMORY[0x1E4FBC860];
  *(void *)(v1 + 16) = sub_1BBBE032C(v10);
  *(unsigned char *)(v1 + 48) = 0;
  uint64_t v11 = swift_allocObject();
  uint64_t v12 = v17;
  *(void *)(v11 + 16) = v2;
  *(void *)(v11 + 24) = v12;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = sub_1BBBE3C98;
  *(void *)(v13 + 24) = v11;
  aBlock[4] = sub_1BBBD29D4;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BBBAFFC8;
  void aBlock[3] = &block_descriptor_34_0;
  uint64_t v14 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync((dispatch_queue_t)v9, v14);
  _Block_release(v14);
  LOBYTE(v9) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if ((v9 & 1) == 0) {
    return v2;
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for DarwinNotificationPoster()
{
  return self;
}

unint64_t sub_1BBBE27DC()
{
  unint64_t result = qword_1E9F838A0;
  if (!qword_1E9F838A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F838A0);
  }
  return result;
}

uint64_t sub_1BBBE2830()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1BBBE2868()
{
  return sub_1BBBE178C(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_1BBBE2870()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t block_copy_helper_8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1BBBE2890()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = v1 + 64;
  uint64_t v3 = 1 << *(unsigned char *)(v1 + 32);
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  unint64_t v5 = v4 & *(void *)(v1 + 64);
  int64_t v6 = (unint64_t)(v3 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v9 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v10 = v9 | (v8 << 6);
      goto LABEL_5;
    }
    int64_t v11 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v11 >= v6) {
      goto LABEL_23;
    }
    unint64_t v12 = *(void *)(v2 + 8 * v11);
    ++v8;
    if (!v12)
    {
      int64_t v8 = v11 + 1;
      if (v11 + 1 >= v6) {
        goto LABEL_23;
      }
      unint64_t v12 = *(void *)(v2 + 8 * v8);
      if (!v12)
      {
        int64_t v8 = v11 + 2;
        if (v11 + 2 >= v6) {
          goto LABEL_23;
        }
        unint64_t v12 = *(void *)(v2 + 8 * v8);
        if (!v12)
        {
          int64_t v8 = v11 + 3;
          if (v11 + 3 >= v6) {
            goto LABEL_23;
          }
          unint64_t v12 = *(void *)(v2 + 8 * v8);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v5 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v8 << 6);
LABEL_5:
    uint64_t result = notify_cancel(*(_DWORD *)(*(void *)(v1 + 56) + 4 * v10));
  }
  int64_t v13 = v11 + 4;
  if (v13 >= v6)
  {
LABEL_23:
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v0;
  }
  unint64_t v12 = *(void *)(v2 + 8 * v13);
  if (v12)
  {
    int64_t v8 = v13;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v8 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v8 >= v6) {
      goto LABEL_23;
    }
    unint64_t v12 = *(void *)(v2 + 8 * v8);
    ++v13;
    if (v12) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_1BBBE2A24()
{
  sub_1BBBE2890();
  return MEMORY[0x1F4186488](v0, 64, 7);
}

uint64_t sub_1BBBE2A58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v8 = sub_1BBBEB158();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  int64_t v11 = &v20[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  unint64_t v12 = *(void **)(a1 + 32);
  *int64_t v11 = v12;
  (*(void (**)(void *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x1E4FBCBF0], v8);
  id v13 = v12;
  LOBYTE(v12) = sub_1BBBEB178();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v9 + 8))(v11, v8);
  if (v12)
  {
    swift_beginAccess();
    uint64_t v15 = *(void *)(a1 + 24);
    if (*(void *)(v15 + 16))
    {
      swift_bridgeObjectRetain();
      unint64_t v16 = sub_1BBBE7E88(a2, a3);
      if (v17)
      {
        uint64_t v18 = *(unsigned int *)(*(void *)(v15 + 56) + 4 * v16);
        swift_bridgeObjectRelease();
        unsigned __int8 v19 = 0;
LABEL_7:
        swift_endAccess();
        v20[8] = v19;
        uint64_t result = sub_1BBBB8564(a2, a3, v18 | ((unint64_t)v19 << 32));
        *a4 = result;
        return result;
      }
      swift_bridgeObjectRelease();
    }
    uint64_t v18 = 0;
    unsigned __int8 v19 = 1;
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_1BBBE2C10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v8 = (uint64_t *)(a1 + 40);
  swift_beginAccess();
  if (!*(void *)(*(void *)(a1 + 40) + 16)) {
    goto LABEL_5;
  }
  swift_bridgeObjectRetain();
  sub_1BBBE7E88(a2, a3);
  if ((v9 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    swift_endAccess();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F7858);
    swift_allocObject();
    uint64_t v11 = sub_1BBBEAF38();
    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v14 = *v8;
    *uint64_t v8 = 0x8000000000000000;
    sub_1BBBE928C(v11, a2, a3, isUniquelyReferenced_nonNull_native);
    *uint64_t v8 = v14;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    sub_1BBBB8B7C(&qword_1EB9F7898, &qword_1EB9F7858);
    uint64_t v10 = sub_1BBBEAFC8();
    goto LABEL_6;
  }
  swift_endAccess();
  swift_retain();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F7858);
  sub_1BBBB8B7C(&qword_1EB9F7898, &qword_1EB9F7858);
  uint64_t v10 = sub_1BBBEAFC8();
LABEL_6:
  uint64_t result = swift_release();
  *a4 = v10;
  return result;
}

uint64_t sub_1BBBE2E1C(uint64_t *a1)
{
  uint64_t v1 = *a1;
  unint64_t v2 = a1[1];
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_1BBBE2E8C(v1, v2);
    return swift_release();
  }
  return result;
}

uint64_t sub_1BBBE2E8C(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_1BBBEB158();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  char v9 = (uint64_t *)((char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = (void *)v2[4];
  *char v9 = v10;
  uint64_t v11 = *MEMORY[0x1E4FBCBF0];
  unint64_t v12 = *(void (**)(void *, uint64_t, uint64_t))(v7 + 104);
  v12(v9, v11, v6);
  id v42 = v10;
  LOBYTE(v10) = sub_1BBBEB178();
  unint64_t v43 = *(void (**)(void *, uint64_t))(v7 + 8);
  v43(v9, v6);
  if (v10)
  {
    long long v41 = v12;
    if (qword_1EB9F8258 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  uint64_t v44 = a1;
  uint64_t v13 = sub_1BBBEAE28();
  __swift_project_value_buffer(v13, (uint64_t)qword_1EB9F8B90);
  swift_bridgeObjectRetain_n();
  uint64_t v14 = sub_1BBBEAE08();
  os_log_type_t v15 = sub_1BBBEB558();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v39 = v7 + 104;
    uint64_t v16 = swift_slowAlloc();
    unint64_t v40 = v3;
    char v17 = (uint8_t *)v16;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v46 = v18;
    unsigned int v38 = v11;
    *(_DWORD *)char v17 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v45 = sub_1BBBAC938(v44, a2, &v46);
    uint64_t v11 = v38;
    sub_1BBBEB6C8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1BBBA9000, v14, v15, "Invoking callback, notification, %s", v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C1862BC0](v18, -1, -1);
    unsigned __int8 v19 = v17;
    uint64_t v3 = v40;
    MEMORY[0x1C1862BC0](v19, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  long long v20 = v41;
  uint64_t v21 = v42;
  *char v9 = v42;
  v20(v9, v11, v6);
  id v22 = v21;
  LOBYTE(v21) = sub_1BBBEB178();
  uint64_t result = ((uint64_t (*)(void *, uint64_t))v43)(v9, v6);
  if (v21)
  {
    swift_beginAccess();
    uint64_t v24 = v3[3];
    if (*(void *)(v24 + 16))
    {
      swift_bridgeObjectRetain();
      uint64_t v25 = v44;
      unint64_t v26 = sub_1BBBE7E88(v44, a2);
      if (v27)
      {
        uint64_t v28 = *(unsigned int *)(*(void *)(v24 + 56) + 4 * v26);
        swift_bridgeObjectRelease();
        unsigned __int8 v29 = 0;
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t v28 = 0;
        unsigned __int8 v29 = 1;
      }
    }
    else
    {
      uint64_t v28 = 0;
      unsigned __int8 v29 = 1;
      uint64_t v25 = v44;
    }
    swift_endAccess();
    LOBYTE(v46) = v29;
    uint64_t v30 = sub_1BBBB8564(v25, a2, v28 | ((unint64_t)v29 << 32));
    uint64_t v31 = v3[2];
    uint64_t v32 = *(void *)(v31 + 16);
    swift_bridgeObjectRetain();
    if (v32)
    {
      unint64_t v33 = sub_1BBBE7E88(v25, a2);
      if (v34)
      {
        uint64_t v35 = *(void (**)(uint64_t *))(*(void *)(v31 + 56) + 16 * v33);
        uint64_t v46 = v25;
        unint64_t v47 = a2;
        uint64_t v48 = v30;
        swift_retain();
        v35(&v46);
        swift_release();
      }
    }
    swift_beginAccess();
    if (*(void *)(v3[5] + 16))
    {
      swift_bridgeObjectRetain();
      sub_1BBBE7E88(v25, a2);
      if (v36)
      {
        swift_endAccess();
        swift_retain();
        swift_bridgeObjectRelease();
        uint64_t v46 = v25;
        unint64_t v47 = a2;
        uint64_t v48 = v30;
        sub_1BBBEAF18();
        swift_bridgeObjectRelease();
        return swift_release();
      }
      else
      {
        swift_endAccess();
        return swift_bridgeObjectRelease_n();
      }
    }
    else
    {
      swift_endAccess();
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1BBBE3324(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void aBlock[6] = *MEMORY[0x1E4F143B8];
  int out_token = 0;
  if (*(unsigned char *)(a3 + 48)) {
    goto LABEL_6;
  }
  if (qword_1EB9F81A0 != -1) {
    swift_once();
  }
  sub_1BBBEADF8();
  if ((aBlock[0] & 1) == 0)
  {
LABEL_6:
    char v9 = *(NSObject **)(a3 + 32);
    uint64_t v10 = swift_allocObject();
    swift_weakInit();
    uint64_t v11 = (void *)swift_allocObject();
    void v11[2] = v10;
    v11[3] = a4;
    v11[4] = a5;
    aBlock[4] = sub_1BBBE3D38;
    aBlock[5] = v11;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1BBBE3600;
    void aBlock[3] = &block_descriptor_44;
    unint64_t v12 = _Block_copy(aBlock);
    swift_bridgeObjectRetain();
    swift_release();
    notify_register_dispatch(a1, &out_token, v9, v12);
    _Block_release(v12);
  }
  else
  {
    notify_register_check(a1, &out_token);
  }
  int v13 = out_token;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v16 = *(void *)(a3 + 24);
  *(void *)(a3 + 24) = 0x8000000000000000;
  sub_1BBBE93FC(v13, a4, a5, isUniquelyReferenced_nonNull_native);
  *(void *)(a3 + 24) = v16;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_endAccess();
}

uint64_t sub_1BBBE358C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_1BBBE2E8C(a3, a4);
    return swift_release();
  }
  return result;
}

uint64_t sub_1BBBE3600(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t sub_1BBBE3654@<X0>(uint64_t *a1@<X8>)
{
  return sub_1BBBE2A58(v1[2], v1[3], v1[4], a1);
}

uint64_t sub_1BBBE3674@<X0>(uint64_t *a1@<X8>)
{
  return sub_1BBBE2C10(v1[2], v1[3], v1[4], a1);
}

uint64_t method lookup function for DarwinNotificationHelper(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for DarwinNotificationHelper);
}

uint64_t dispatch thunk of DarwinNotificationHelper.__allocating_init(notificationHandlers:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of DarwinNotificationHelper.__allocating_init(subscribedToNames:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of DarwinNotificationHelper.__allocating_init(notificationName:rateLimit:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of DarwinNotificationHelper.post(bypassRateLimit:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of DarwinNotificationHelper.setValue(value:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of DarwinNotificationHelper.currentValue(name:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of DarwinNotificationHelper.publisher(name:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

unsigned char *storeEnumTagSinglePayload for DarwinNotificationHelper.DarwinNotificationHelperError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x1BBBE3880);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DarwinNotificationHelper.DarwinNotificationHelperError()
{
  return &type metadata for DarwinNotificationHelper.DarwinNotificationHelperError;
}

unint64_t sub_1BBBE38BC()
{
  unint64_t result = qword_1E9F838A8;
  if (!qword_1E9F838A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F838A8);
  }
  return result;
}

void *sub_1BBBE3910(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F7988);
  int v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = sub_1BBBE39F8((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_1BBBCB438();
  if (v6 != v1)
  {
    __break(1u);
    return (void *)MEMORY[0x1E4FBC860];
  }
  return v3;
}

uint64_t sub_1BBBE39F8(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *uint64_t v5 = a4;
    v5[1] = v6;
    void v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    long long v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *uint64_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    unint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1BBBE3BF8(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1BBBE3C40()
{
  swift_weakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1BBBE3C78()
{
  return sub_1BBBE1734();
}

void sub_1BBBE3C98()
{
  sub_1BBBE1CE4(*(void *)(v0 + 24));
}

uint64_t sub_1BBBE3CC0()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1BBBE3CD0@<X0>(uint64_t *a1@<X8>)
{
  return sub_1BBBB7AB4(v1[2], v1[3], v1[4], a1);
}

uint64_t sub_1BBBE3CF0(uint64_t *a1)
{
  return sub_1BBBE2E1C(a1);
}

uint64_t sub_1BBBE3CF8()
{
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1BBBE3D38(uint64_t a1)
{
  return sub_1BBBE358C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t objectdestroy_26Tm()
{
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1BBBE3D88()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t UnsignedInteger.reversed.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v35 = *(void (***)(char *, char *, uint64_t))(a1 - 8);
  uint64_t v4 = MEMORY[0x1F4188790](a1);
  char v36 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x1F4188790](v4);
  uint64_t v8 = (char *)&v34 - v7;
  uint64_t v9 = MEMORY[0x1F4188790](v6);
  uint64_t v11 = (char *)&v34 - v10;
  MEMORY[0x1F4188790](v9);
  uint64_t v13 = (char *)&v34 - v12;
  uint64_t v15 = *(void *)(*(void *)(*(void *)(v14 + 8) + 24) + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x1F4188790](AssociatedTypeWitness);
  unint64_t v18 = (char *)&v34 - v17;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v41 = AssociatedTypeWitness;
  uint64_t v39 = AssociatedConformanceWitness;
  sub_1BBBEBAE8();
  uint64_t v37 = a2;
  unint64_t v40 = v18;
  uint64_t v42 = v15;
  sub_1BBBEBA98();
  uint64_t result = sub_1BBBEB758();
  if (result < 0) {
    goto LABEL_25;
  }
  uint64_t v21 = result;
  if (result)
  {
    unint64_t v43 = sub_1BBBB300C();
    uint64_t v22 = 0;
    uint64_t v23 = (void (**)(char *, uint64_t))(v35 + 1);
    v35 += 2;
    uint64_t v38 = v21;
    while (1)
    {
      uint64_t v44 = v22;
      sub_1BBBEB718();
      sub_1BBBEBAE8();
      sub_1BBBEBA98();
      sub_1BBBEB708();
      uint64_t v24 = *v23;
      (*v23)(v8, a1);
      v24(v11, a1);
      if (sub_1BBBEB768()) {
        break;
      }
      char v25 = sub_1BBBEB768();
      uint64_t v26 = sub_1BBBEB758();
      if ((v25 & 1) == 0)
      {
        if (v26 >= 64)
        {
LABEL_16:
          uint64_t v44 = 0;
          sub_1BBBEB6F8();
          char v30 = sub_1BBBEB268();
          v24(v11, a1);
          uint64_t result = ((uint64_t (*)(char *, uint64_t))v24)(v13, a1);
          if (v30) {
            goto LABEL_4;
          }
          goto LABEL_19;
        }
        goto LABEL_13;
      }
      if (v26 > 64) {
        goto LABEL_16;
      }
      sub_1BBBEBAE8();
      sub_1BBBEBA98();
      char v27 = sub_1BBBEB258();
      v24(v11, a1);
      uint64_t v28 = v36;
      (*v35)(v36, v13, a1);
      if (v27)
      {
        uint64_t v29 = sub_1BBBEB748();
        v24(v28, a1);
        goto LABEL_14;
      }
      v24(v28, a1);
      v24(v13, a1);
LABEL_19:
      sub_1BBBEBAE8();
      sub_1BBBEBA98();
      uint64_t result = sub_1BBBEB758();
      uint64_t v31 = result - 1;
      if (__OFSUB__(result, 1))
      {
        __break(1u);
LABEL_24:
        __break(1u);
LABEL_25:
        __break(1u);
        return result;
      }
      BOOL v32 = __OFSUB__(v31, v22);
      uint64_t v33 = v31 - v22;
      if (v32) {
        goto LABEL_24;
      }
      uint64_t v44 = v33;
      sub_1BBBEB728();
      v24(v8, a1);
      sub_1BBBEB738();
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v24)(v11, a1);
LABEL_4:
      if (v38 == ++v22) {
        return result;
      }
    }
    if (sub_1BBBEB758() >= 64) {
      goto LABEL_16;
    }
LABEL_13:
    uint64_t v29 = sub_1BBBEB748();
LABEL_14:
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v24)(v13, a1);
    if (!v29) {
      goto LABEL_4;
    }
    goto LABEL_19;
  }
  return result;
}

int8x8_t static UInt64.interleave(x:y:)(unsigned int a1, unsigned int a2)
{
  int8x16_t v2 = (int8x16_t)vdupq_n_s64(a2);
  int8x16_t v3 = (int8x16_t)vdupq_n_s64(a1);
  int8x16_t v4 = vorrq_s8(vorrq_s8(vorrq_s8(vorrq_s8((int8x16_t)vshlq_u64((uint64x2_t)vandq_s8(v2, (int8x16_t)xmmword_1BBBEE540), (uint64x2_t)xmmword_1BBBEE580), vorrq_s8(vorrq_s8((int8x16_t)vshlq_u64((uint64x2_t)vandq_s8(v2, (int8x16_t)xmmword_1BBBEE4E0), (uint64x2_t)xmmword_1BBBEE520), (int8x16_t)vshlq_u64((uint64x2_t)vandq_s8(v3, (int8x16_t)xmmword_1BBBEE480), (uint64x2_t)xmmword_1BBBEE4A0)), (int8x16_t)vshlq_u64((uint64x2_t)vandq_s8(v3, (int8x16_t)xmmword_1BBBEE4E0), (uint64x2_t)xmmword_1BBBEE500))), (int8x16_t)vshlq_u64((uint64x2_t)vandq_s8(v3, (int8x16_t)xmmword_1BBBEE540), (uint64x2_t)xmmword_1BBBEE560)), vorrq_s8(
             vorrq_s8((int8x16_t)vshlq_u64((uint64x2_t)vandq_s8(v2, (int8x16_t)xmmword_1BBBEE480), (uint64x2_t)xmmword_1BBBEE4C0), vorrq_s8(vorrq_s8((int8x16_t)vshlq_u64((uint64x2_t)vandq_s8(v2, (int8x16_t)xmmword_1BBBEE420), (uint64x2_t)xmmword_1BBBEE460), (int8x16_t)vshlq_u64((uint64x2_t)vandq_s8(v3, (int8x16_t)xmmword_1BBBEE3C0), (uint64x2_t)xmmword_1BBBEE3E0)), (int8x16_t)vshlq_u64((uint64x2_t)vandq_s8(v3, (int8x16_t)xmmword_1BBBEE420), (uint64x2_t)xmmword_1BBBEE440))), vorrq_s8(vorrq_s8((int8x16_t)vshlq_u64((uint64x2_t)vandq_s8(v2, (int8x16_t)xmmword_1BBBEE3C0), (uint64x2_t)xmmword_1BBBEE400),
                 vorrq_s8((int8x16_t)vshlq_u64((uint64x2_t)vandq_s8(v2, (int8x16_t)xmmword_1BBBEE360), (uint64x2_t)xmmword_1BBBEE3A0), (int8x16_t)vshlq_u64((uint64x2_t)vandq_s8(v3, (int8x16_t)xmmword_1BBBEE360), (uint64x2_t)xmmword_1BBBEE380))), vorrq_s8(vorrq_s8((int8x16_t)vshlq_u64((uint64x2_t)vandq_s8(v2, (int8x16_t)xmmword_1BBBEE300), (uint64x2_t)xmmword_1BBBEE340), (int8x16_t)vshlq_u64((uint64x2_t)vandq_s8(v3, (int8x16_t)xmmword_1BBBEE300), (uint64x2_t)xmmword_1BBBEE320)), vorrq_s8((int8x16_t)vshlq_u64((uint64x2_t)vandq_s8(v2, (int8x16_t)xmmword_1BBBEE2B0), (uint64x2_t)xmmword_1BBBEE2E0), (int8x16_t)vshlq_u64(
                                (uint64x2_t)vandq_s8(v3, (int8x16_t)xmmword_1BBBEE2B0),
                                (uint64x2_t)xmmword_1BBBEE2D0)))))),
         vorrq_s8(vorrq_s8(vorrq_s8((int8x16_t)vshlq_u64((uint64x2_t)vandq_s8(v2, (int8x16_t)xmmword_1BBBEE530), (uint64x2_t)xmmword_1BBBEE570), vorrq_s8(vorrq_s8((int8x16_t)vshlq_u64((uint64x2_t)vandq_s8(v2, (int8x16_t)xmmword_1BBBEE4D0), (uint64x2_t)xmmword_1BBBEE510), (int8x16_t)vshlq_u64((uint64x2_t)vandq_s8(v3, (int8x16_t)xmmword_1BBBEE470), (uint64x2_t)xmmword_1BBBEE490)), (int8x16_t)vshlq_u64((uint64x2_t)vandq_s8(v3, (int8x16_t)xmmword_1BBBEE4D0), (uint64x2_t)xmmword_1BBBEE4F0))), (int8x16_t)vshlq_u64((uint64x2_t)vandq_s8(v3, (int8x16_t)xmmword_1BBBEE530), (uint64x2_t)xmmword_1BBBEE550)), vorrq_s8(vorrq_s8(
               (int8x16_t)vshlq_u64((uint64x2_t)vandq_s8(v2, (int8x16_t)xmmword_1BBBEE470), (uint64x2_t)xmmword_1BBBEE4B0), vorrq_s8(vorrq_s8((int8x16_t)vshlq_u64((uint64x2_t)vandq_s8(v2, (int8x16_t)xmmword_1BBBEE410), (uint64x2_t)xmmword_1BBBEE450), (int8x16_t)vshlq_u64((uint64x2_t)vandq_s8(v3, (int8x16_t)xmmword_1BBBEE3B0), (uint64x2_t)xmmword_1BBBEE3D0)), (int8x16_t)vshlq_u64((uint64x2_t)vandq_s8(v3, (int8x16_t)xmmword_1BBBEE410), (uint64x2_t)xmmword_1BBBEE430))), vorrq_s8(vorrq_s8((int8x16_t)vshlq_u64((uint64x2_t)vandq_s8(v2, (int8x16_t)xmmword_1BBBEE3B0), (uint64x2_t)xmmword_1BBBEE3F0), vorrq_s8(
                   (int8x16_t)vshlq_u64((uint64x2_t)vandq_s8(v2, (int8x16_t)xmmword_1BBBEE350), (uint64x2_t)xmmword_1BBBEE390), (int8x16_t)vshlq_u64((uint64x2_t)vandq_s8(v3, (int8x16_t)xmmword_1BBBEE350), (uint64x2_t)xmmword_1BBBEE370))), vorrq_s8(vorrq_s8((int8x16_t)vshlq_u64((uint64x2_t)vandq_s8(v2, (int8x16_t)xmmword_1BBBEE2F0), (uint64x2_t)xmmword_1BBBEE330), (int8x16_t)vshlq_u64((uint64x2_t)vandq_s8(v3, (int8x16_t)xmmword_1BBBEE2F0), (uint64x2_t)xmmword_1BBBEE310)), vorrq_s8((int8x16_t)vshlq_u64((uint64x2_t)vandq_s8(v2, (int8x16_t)xmmword_1BBBED370), (uint64x2_t)xmmword_1BBBED370), (int8x16_t)vshlq_u64((uint64x2_t)vandq_s8(v3, (int8x16_t)xmmword_1BBBED370),
                                (uint64x2_t)xmmword_1BBBEE2C0)))))));
  return vorr_s8(*(int8x8_t *)v4.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v4, v4, 8uLL));
}

uint64_t UInt64.deinterleave.getter(unint64_t a1)
{
  char v1 = 0;
  LODWORD(v2) = 0;
  LODWORD(v3) = 0;
  uint64_t v4 = 0;
  while (1)
  {
    unint64_t v5 = ((1 << v4) & a1) >> v1;
    if (HIDWORD(v5)) {
      break;
    }
    uint64_t v6 = v4 + 1;
    unint64_t v7 = ((1 << v6) & a1) >> ++v1;
    if (HIDWORD(v7)) {
      break;
    }
    uint64_t v3 = v3 | v5;
    uint64_t v2 = v2 | v7;
    unint64_t v8 = v6 - 1;
    uint64_t v4 = v6 + 1;
    if (v8 >= 0x3E) {
      return v3 | (v2 << 32);
    }
  }
  uint64_t result = sub_1BBBEB948();
  __break(1u);
  return result;
}

BOOL static LocalizationUtility.Table.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t LocalizationUtility.Table.hash(into:)()
{
  return sub_1BBBEBB88();
}

uint64_t LocalizationUtility.Table.hashValue.getter()
{
  return sub_1BBBEBBB8();
}

uint64_t static LocalizationUtility.localizedString(key:table:)()
{
  type metadata accessor for BundleHelper();
  ObjCClassFromMetauint64_t data = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v2 = sub_1BBBEAC78();

  swift_bridgeObjectRelease();
  return v2;
}

uint64_t type metadata accessor for BundleHelper()
{
  return self;
}

unint64_t sub_1BBBE492C()
{
  unint64_t result = qword_1E9F838B8;
  if (!qword_1E9F838B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F838B8);
  }
  return result;
}

ValueMetadata *type metadata accessor for LocalizationUtility()
{
  return &type metadata for LocalizationUtility;
}

unsigned char *storeEnumTagSinglePayload for LocalizationUtility.Table(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BBBE4A5CLL);
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

ValueMetadata *type metadata accessor for LocalizationUtility.Table()
{
  return &type metadata for LocalizationUtility.Table;
}

void static DispatchUtilities.logCurrentDispatchQueueQoS()()
{
  HIDWORD(v0) = qos_class_self() - 9;
  LODWORD(v0) = HIDWORD(v0);
  switch((v0 >> 2))
  {
    case 0u:
    case 2u:
    case 3u:
    case 4u:
    case 6u:
      sub_1BBBEB558();
      sub_1BBBBCA3C();
      id v5 = (id)sub_1BBBEB698();
      sub_1BBBEADE8();

      break;
    default:
      sub_1BBBEB558();
      sub_1BBBBCA3C();
      id v1 = (void *)sub_1BBBEB698();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F7C80);
      uint64_t v2 = swift_allocObject();
      *(_OWORD *)(v2 + 16) = xmmword_1BBBED370;
      qos_class_t v3 = qos_class_self();
      uint64_t v4 = MEMORY[0x1E4FBC530];
      *(void *)(v2 + 56) = MEMORY[0x1E4FBC4C0];
      *(void *)(v2 + 64) = v4;
      *(_DWORD *)(v2 + 32) = v3;
      sub_1BBBEADE8();

      swift_bridgeObjectRelease();
      break;
  }
}

ValueMetadata *type metadata accessor for DispatchUtilities()
{
  return &type metadata for DispatchUtilities;
}

uint64_t QueueSynchronizer.__allocating_init(queue:)(void *a1)
{
  uint64_t v2 = swift_allocObject();
  QueueSynchronizer.init(queue:)(a1);
  return v2;
}

uint64_t QueueSynchronizer.init(queue:)(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1BBBEB158();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  unint64_t v7 = (void *)((char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F7990);
  swift_allocObject();
  *(void *)(v1 + 24) = sub_1BBBEB0A8();
  *unint64_t v7 = a1;
  (*(void (**)(void *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E4FBCBD8], v4);
  id v8 = a1;
  LOBYTE(a1) = sub_1BBBEB178();
  (*(void (**)(void *, uint64_t))(v5 + 8))(v7, v4);
  if ((a1 & 1) == 0)
  {
    __break(1u);
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  swift_retain();
  sub_1BBBEB5A8();
  swift_release();
  if (LOBYTE(aBlock[0]) == 1)
  {
    *(void *)(v2 + 16) = v8;
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    *(void *)(v9 + 24) = v2;
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = sub_1BBBE5094;
    *(void *)(v10 + 24) = v9;
    aBlock[4] = sub_1BBBD2448;
    aBlock[5] = v10;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1BBBAFFC8;
    void aBlock[3] = &block_descriptor_9;
    uint64_t v11 = _Block_copy(aBlock);
    uint64_t v12 = v8;
    swift_retain();
    swift_retain();
    swift_release();
    dispatch_sync(v12, v11);

    _Block_release(v11);
    LOBYTE(v12) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    swift_release();
    if ((v12 & 1) == 0) {
      return v2;
    }
    goto LABEL_6;
  }
LABEL_7:
  uint64_t result = sub_1BBBEB958();
  __break(1u);
  return result;
}

uint64_t sub_1BBBE5054()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1BBBE5094()
{
  return sub_1BBBEB5C8();
}

uint64_t sub_1BBBE50D0()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t block_copy_helper_9(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t QueueSynchronizer.conditionalSync<A>(_:)(uint64_t (*a1)(uint64_t))
{
  sub_1BBBEABD8();
  sub_1BBBAEE84();
  uint64_t v2 = sub_1BBBEB5B8();
  if ((v4 & 1) == 0) {
    return a1(v2);
  }
  MEMORY[0x1F4188790](v2);
  return sub_1BBBEB628();
}

uint64_t QueueSynchronizer.deinit()
{
  swift_release();
  return v0;
}

uint64_t QueueSynchronizer.__deallocating_deinit()
{
  swift_release();
  return MEMORY[0x1F4186488](v0, 32, 7);
}

uint64_t type metadata accessor for QueueSynchronizer()
{
  return self;
}

uint64_t method lookup function for QueueSynchronizer(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for QueueSynchronizer);
}

uint64_t dispatch thunk of QueueSynchronizer.__allocating_init(queue:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t PerformanceCapture.flag.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

double sub_1BBBE52D8()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC8SPShared18PerformanceCapture_duration;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t PerformanceCapture.__allocating_init(flag:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  sub_1BBBEAD78();
  *(void *)(v4 + OBJC_IVAR____TtC8SPShared18PerformanceCapture_duration) = 0;
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  return v4;
}

uint64_t PerformanceCapture.init(flag:)(uint64_t a1, uint64_t a2)
{
  sub_1BBBEAD78();
  *(void *)(v2 + OBJC_IVAR____TtC8SPShared18PerformanceCapture_duration) = 0;
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return v2;
}

uint64_t sub_1BBBE53D4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1BBBEAD88();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = (double *)(v1 + OBJC_IVAR____TtC8SPShared18PerformanceCapture_duration);
  swift_beginAccess();
  if (*v6 == 0.0)
  {
    sub_1BBBEAD78();
    sub_1BBBEAD68();
    uint64_t v8 = v7;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    *(void *)uint64_t v6 = v8;
  }
  sub_1BBBEB558();
  if (qword_1E9F833F0 != -1) {
    swift_once();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F7C80);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_1BBBEE6D0;
  uint64_t v11 = *(void *)(v1 + 16);
  uint64_t v10 = *(void *)(v1 + 24);
  uint64_t v12 = MEMORY[0x1E4FBB1A0];
  *(void *)(v9 + 56) = MEMORY[0x1E4FBB1A0];
  unint64_t v13 = sub_1BBBBC9E8();
  *(void *)(v9 + 64) = v13;
  *(void *)(v9 + 32) = v11;
  *(void *)(v9 + 40) = v10;
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_1BBBEB488();
  *(void *)(v9 + 96) = v12;
  *(void *)(v9 + 104) = v13;
  *(void *)(v9 + 72) = v14;
  *(void *)(v9 + 80) = v15;
  sub_1BBBEADE8();
  return swift_bridgeObjectRelease();
}

uint64_t PerformanceCapture.deinit()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC8SPShared18PerformanceCapture_start;
  uint64_t v2 = sub_1BBBEAD88();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t PerformanceCapture.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC8SPShared18PerformanceCapture_start;
  uint64_t v2 = sub_1BBBEAD88();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x1F4186488](v0, v3, v4);
}

double sub_1BBBE56E0@<D0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (double *)(*a1 + OBJC_IVAR____TtC8SPShared18PerformanceCapture_duration);
  swift_beginAccess();
  double result = *v3;
  *a2 = *(void *)v3;
  return result;
}

uint64_t sub_1BBBE5734(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a2 + OBJC_IVAR____TtC8SPShared18PerformanceCapture_duration);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = v2;
  return result;
}

uint64_t sub_1BBBE578C()
{
  return type metadata accessor for PerformanceCapture();
}

uint64_t type metadata accessor for PerformanceCapture()
{
  uint64_t result = qword_1E9F838C8;
  if (!qword_1E9F838C8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1BBBE57E0()
{
  uint64_t result = sub_1BBBEAD88();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for PerformanceCapture(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for PerformanceCapture);
}

uint64_t dispatch thunk of PerformanceCapture.duration.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of PerformanceCapture.__allocating_init(flag:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of PerformanceCapture.finished()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t sub_1BBBE58FC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F75B0);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for XPCSessionManager.ListenerRecord();
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v12 + 48))(a1, 1) == 1)
  {
    sub_1BBBB4DE4(a1, &qword_1EB9F75B0);
    sub_1BBBE823C(a2, (uint64_t)v8);
    uint64_t v13 = sub_1BBBEABA8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(a2, v13);
    return sub_1BBBB4DE4((uint64_t)v8, &qword_1EB9F75B0);
  }
  else
  {
    sub_1BBBEA830(a1, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for XPCSessionManager.ListenerRecord);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v18 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_1BBBE9560((uint64_t)v11, a2, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v18;
    swift_bridgeObjectRelease();
    uint64_t v16 = sub_1BBBEABA8();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(a2, v16);
  }
}

uint64_t sub_1BBBE5B1C()
{
  sub_1BBBB4D64(0, (unint64_t *)&qword_1EB9F7C78);
  uint64_t result = sub_1BBBEB6A8();
  qword_1EB9F8BA8 = result;
  return result;
}

uint64_t XPCSessionManager.__allocating_init(name:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  XPCSessionManager.init(name:)(a1, a2);
  return v4;
}

uint64_t XPCSessionManager.init(name:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v17 = sub_1BBBEB578();
  MEMORY[0x1F4188790](v17);
  uint64_t v6 = sub_1BBBEB0F8();
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v7 = sub_1BBBEB608();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x1E4FBC868];
  v3[5] = 0;
  v3[6] = v11;
  v3[2] = a1;
  v3[3] = a2;
  uint64_t v16 = sub_1BBBB4D64(0, (unint64_t *)&qword_1EB9F8340);
  unint64_t aBlock = 0;
  unint64_t v19 = 0xE000000000000000;
  sub_1BBBEB858();
  swift_bridgeObjectRelease();
  unint64_t aBlock = 0xD000000000000030;
  unint64_t v19 = 0x80000001BBBEFB00;
  swift_bridgeObjectRetain();
  sub_1BBBEB2F8();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x1E4FBCC68], v7);
  sub_1BBBEB0D8();
  unint64_t aBlock = MEMORY[0x1E4FBC860];
  sub_1BBBEAA64((unint64_t *)&qword_1EB9F8330, MEMORY[0x1E4FBCC10]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F8320);
  sub_1BBBB2BC0();
  sub_1BBBEB798();
  uint64_t v12 = sub_1BBBEB648();
  v3[4] = v12;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = sub_1BBBE6008;
  *(void *)(v13 + 24) = v3;
  uint64_t v22 = sub_1BBBD2448;
  uint64_t v23 = v13;
  unint64_t aBlock = MEMORY[0x1E4F143A8];
  unint64_t v19 = 1107296256;
  long long v20 = sub_1BBBAFFC8;
  uint64_t v21 = &block_descriptor_10;
  uint64_t v14 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync((dispatch_queue_t)v12, v14);
  _Block_release(v14);
  LOBYTE(v12) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if ((v12 & 1) == 0) {
    return (uint64_t)v3;
  }
  __break(1u);
  return result;
}

void sub_1BBBE5F90(uint64_t a1)
{
  uint64_t v2 = (objc_class *)type metadata accessor for _XPCListenerDelegateTrampoline();
  uint64_t v3 = (char *)objc_allocWithZone(v2);
  *(void *)&v3[OBJC_IVAR____TtC8SPSharedP33_4DFE191C45A702EAD1213F8D530A798030_XPCListenerDelegateTrampoline_sessionManager] = a1;
  swift_unownedRetain();
  v6.receiver = v3;
  v6.super_class = v2;
  id v4 = objc_msgSendSuper2(&v6, sel_init);
  uint64_t v5 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = v4;
}

void sub_1BBBE6008()
{
  sub_1BBBE5F90(v0);
}

uint64_t sub_1BBBE6010()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t block_copy_helper_10(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t XPCSessionManager.register(service:)(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for XPCServiceDescription();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x1F4188790](v3 - 8);
  objc_super v6 = *(NSObject **)(v1 + 32);
  sub_1BBBEA9FC(a1, (uint64_t)aBlock - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for XPCServiceDescription);
  unint64_t v7 = (*(unsigned __int8 *)(v4 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v1;
  sub_1BBBEA830((uint64_t)aBlock - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v8 + v7, (uint64_t (*)(void))type metadata accessor for XPCServiceDescription);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = sub_1BBBE67B4;
  *(void *)(v9 + 24) = v8;
  aBlock[4] = sub_1BBBD29D4;
  aBlock[5] = v9;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BBBAFFC8;
  void aBlock[3] = &block_descriptor_10;
  uint64_t v10 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v6, v10);
  _Block_release(v10);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation) {
    __break(1u);
  }
  return result;
}

uint64_t sub_1BBBE623C(uint64_t a1, uint64_t a2)
{
  uint64_t v35 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F75B0);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v36 = (uint64_t)v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for XPCSessionManager.ListenerRecord();
  uint64_t v32 = *(void *)(v5 - 8);
  uint64_t v33 = v5;
  MEMORY[0x1F4188790](v5);
  uint64_t v34 = (uint64_t)v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1BBBEABA8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30[1] = sub_1BBBEB558();
  if (qword_1EB9F7C88 != -1) {
    swift_once();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F7C80);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_1BBBEE6D0;
  uint64_t v13 = *(void *)(a1 + 16);
  uint64_t v12 = *(void *)(a1 + 24);
  uint64_t v14 = MEMORY[0x1E4FBB1A0];
  *(void *)(v11 + 56) = MEMORY[0x1E4FBB1A0];
  unint64_t v15 = sub_1BBBBC9E8();
  uint64_t v31 = a1;
  unint64_t v16 = v15;
  *(void *)(v11 + 64) = v15;
  *(void *)(v11 + 32) = v13;
  *(void *)(v11 + 40) = v12;
  sub_1BBBEAA64(&qword_1EB9F7598, MEMORY[0x1E4F61990]);
  swift_bridgeObjectRetain();
  uint64_t v17 = v35;
  uint64_t v18 = sub_1BBBEBA48();
  *(void *)(v11 + 96) = v14;
  *(void *)(v11 + 104) = v16;
  *(void *)(v11 + 72) = v18;
  *(void *)(v11 + 80) = v19;
  sub_1BBBEADE8();
  swift_bridgeObjectRelease();
  long long v20 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v20(v10, v17, v7);
  id v21 = objc_allocWithZone(MEMORY[0x1E4F29290]);
  sub_1BBBEAB98();
  uint64_t v22 = (void *)sub_1BBBEB278();
  swift_bridgeObjectRelease();
  id v23 = objc_msgSend(v21, sel_initWithMachServiceName_, v22);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v24 = v34;
  sub_1BBBEA9FC(v17, v34, (uint64_t (*)(void))type metadata accessor for XPCServiceDescription);
  uint64_t v25 = v33;
  *(void *)(v24 + *(int *)(v33 + 20)) = v23;
  v20(v10, v17, v7);
  uint64_t v26 = v36;
  sub_1BBBEA9FC(v24, v36, (uint64_t (*)(void))type metadata accessor for XPCSessionManager.ListenerRecord);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v32 + 56))(v26, 0, 1, v25);
  uint64_t v27 = v31;
  swift_beginAccess();
  id v28 = v23;
  sub_1BBBE58FC(v26, (uint64_t)v10);
  swift_endAccess();
  objc_msgSend(v28, sel_setDelegate_, *(void *)(v27 + 40));
  objc_msgSend(v28, sel_resume);

  return sub_1BBBEA99C(v24, (uint64_t (*)(void))type metadata accessor for XPCSessionManager.ListenerRecord);
}

uint64_t sub_1BBBE6660()
{
  uint64_t v1 = (int *)type metadata accessor for XPCServiceDescription();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  swift_release();
  uint64_t v5 = v0 + v3;
  uint64_t v6 = sub_1BBBEABA8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);

  if (*(void *)(v0 + v3 + v1[9])) {
    swift_release();
  }
  if (*(void *)(v5 + v1[10])) {
    swift_release();
  }
  if (*(void *)(v5 + v1[11])) {
    swift_release();
  }
  return MEMORY[0x1F4186498](v0, v3 + v4, v2 | 7);
}

uint64_t sub_1BBBE67B4()
{
  uint64_t v1 = *(void *)(type metadata accessor for XPCServiceDescription() - 8);
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
  return sub_1BBBE623C(v2, v3);
}

uint64_t sub_1BBBE6818()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1BBBE6828(uint64_t a1)
{
  uint64_t v9 = 0;
  uint64_t v2 = *(NSObject **)(a1 + 32);
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = &v9;
  *(void *)(v3 + 24) = a1;
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = sub_1BBBEAAE4;
  *(void *)(v4 + 24) = v3;
  aBlock[4] = sub_1BBBD29D4;
  aBlock[5] = v4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BBBAFFC8;
  void aBlock[3] = &block_descriptor_45;
  uint64_t v5 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v2, v5);
  _Block_release(v5);
  LOBYTE(v2) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v2)
  {
    __break(1u);
  }
  else
  {
    uint64_t v7 = v9;
    if (v9)
    {
      swift_release();
      return v7;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1BBBE6994(void *a1, uint64_t a2)
{
  *a1 = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t NSXPCConnection.machServiceName.getter@<X0>(uint64_t a1@<X8>)
{
  id v3 = objc_msgSend(v1, sel_serviceName);
  if (v3)
  {
    uint64_t v4 = v3;
    sub_1BBBEB2A8();

    sub_1BBBEABB8();
    uint64_t v5 = sub_1BBBEABA8();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);
    uint64_t v7 = v5;
    uint64_t v8 = a1;
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v10 = sub_1BBBEABA8();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56);
    uint64_t v7 = v10;
    uint64_t v8 = a1;
    uint64_t v9 = 1;
  }
  return v6(v8, v9, 1, v7);
}

uint64_t sub_1BBBE6AD0(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void (**)(void *))(a1 + *(int *)(type metadata accessor for XPCServiceDescription() + 44));
  if (v4)
  {
    swift_retain();
    v4(a2);
    return sub_1BBBCB428((uint64_t)v4);
  }
  else
  {
    sub_1BBBEB558();
    if (qword_1EB9F7C88 != -1) {
      swift_once();
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F7C80);
    uint64_t v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_1BBBEE6D0;
    uint64_t v8 = *(void *)(v2 + 16);
    uint64_t v7 = *(void *)(v2 + 24);
    *(void *)(v6 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v6 + 64) = sub_1BBBBC9E8();
    *(void *)(v6 + 32) = v8;
    *(void *)(v6 + 40) = v7;
    *(void *)(v6 + 96) = sub_1BBBB4D64(0, &qword_1EB9F7C60);
    *(void *)(v6 + 104) = sub_1BBBE7218();
    *(void *)(v6 + 72) = a2;
    swift_bridgeObjectRetain();
    id v9 = a2;
    sub_1BBBEADE8();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_1BBBE6C54(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    a4(a2, a3);
    return swift_release();
  }
  return result;
}

uint64_t sub_1BBBE6CD0(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void (**)(void *))(a1 + *(int *)(type metadata accessor for XPCServiceDescription() + 40));
  if (v4)
  {
    swift_retain();
    v4(a2);
    return sub_1BBBCB428((uint64_t)v4);
  }
  else
  {
    sub_1BBBEB558();
    if (qword_1EB9F7C88 != -1) {
      swift_once();
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F7C80);
    uint64_t v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_1BBBEE6D0;
    uint64_t v8 = *(void *)(v2 + 16);
    uint64_t v7 = *(void *)(v2 + 24);
    *(void *)(v6 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v6 + 64) = sub_1BBBBC9E8();
    *(void *)(v6 + 32) = v8;
    *(void *)(v6 + 40) = v7;
    *(void *)(v6 + 96) = sub_1BBBB4D64(0, &qword_1EB9F7C60);
    *(void *)(v6 + 104) = sub_1BBBE7218();
    *(void *)(v6 + 72) = a2;
    swift_bridgeObjectRetain();
    id v9 = a2;
    sub_1BBBEADE8();
    return swift_bridgeObjectRelease();
  }
}

uint64_t XPCSessionManager.deinit()
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t XPCSessionManager.__deallocating_deinit()
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186488](v0, 56, 7);
}

id sub_1BBBE6F98()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _XPCListenerDelegateTrampoline();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

BOOL NSXPCConnection.hasEntitlement<A>(_:)()
{
  sub_1BBBEB338();
  Swift::Bool v0 = NSXPCConnection.hasEntitlement(_:)(v2);
  swift_bridgeObjectRelease();
  return v0;
}

Swift::Bool __swiftcall NSXPCConnection.hasEntitlement(_:)(Swift::String a1)
{
  object = a1._object;
  uint64_t countAndFlagsBits = a1._countAndFlagsBits;
  uint64_t v4 = (void *)sub_1BBBEB278();
  id v5 = objc_msgSend(v1, sel_valueForEntitlement_, v4);

  if (v5)
  {
    sub_1BBBEB778();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
  }
  sub_1BBBB91B4((uint64_t)v10, (uint64_t)v11);
  if (v12)
  {
    if (swift_dynamicCast() & 1) != 0 && (v9) {
      return 1;
    }
  }
  else
  {
    sub_1BBBB4DE4((uint64_t)v11, &qword_1EB9F7FB0);
  }
  sub_1BBBEB538();
  if (qword_1EB9F7C88 != -1) {
    swift_once();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F7C80);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1BBBEE6D0;
  *(void *)(v7 + 56) = sub_1BBBB4D64(0, &qword_1EB9F7C60);
  *(void *)(v7 + 64) = sub_1BBBE7218();
  *(void *)(v7 + 32) = v1;
  *(void *)(v7 + 96) = MEMORY[0x1E4FBB1A0];
  *(void *)(v7 + 104) = sub_1BBBBC9E8();
  *(void *)(v7 + 72) = countAndFlagsBits;
  *(void *)(v7 + 80) = object;
  id v8 = v1;
  swift_bridgeObjectRetain();
  sub_1BBBEADE8();
  swift_bridgeObjectRelease();
  return 0;
}

unint64_t sub_1BBBE7218()
{
  unint64_t result = qword_1EB9F7C68;
  if (!qword_1EB9F7C68)
  {
    sub_1BBBB4D64(255, &qword_1EB9F7C60);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9F7C68);
  }
  return result;
}

uint64_t type metadata accessor for XPCSessionManager()
{
  return self;
}

uint64_t method lookup function for XPCSessionManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for XPCSessionManager);
}

uint64_t dispatch thunk of XPCSessionManager.__allocating_init(name:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t type metadata accessor for _XPCListenerDelegateTrampoline()
{
  return self;
}

uint64_t *sub_1BBBE72F4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v23 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v23 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1BBBEABA8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    id v8 = (int *)type metadata accessor for XPCServiceDescription();
    *(uint64_t *)((char *)a1 + v8[5]) = *(uint64_t *)((char *)a2 + v8[5]);
    uint64_t v9 = v8[6];
    uint64_t v10 = *(void **)((char *)a2 + v9);
    *(uint64_t *)((char *)a1 + v9) = (uint64_t)v10;
    uint64_t v11 = v8[7];
    uint64_t v12 = *(void **)((char *)a2 + v11);
    *(uint64_t *)((char *)a1 + v11) = (uint64_t)v12;
    uint64_t v13 = v8[8];
    uint64_t v14 = *(void **)((char *)a2 + v13);
    *(uint64_t *)((char *)a1 + v13) = (uint64_t)v14;
    uint64_t v15 = v8[9];
    unint64_t v16 = (uint64_t *)((char *)a1 + v15);
    uint64_t v17 = (char *)a2 + v15;
    uint64_t v18 = *(uint64_t *)((char *)a2 + v15);
    id v19 = v10;
    id v20 = v12;
    id v21 = v14;
    if (v18)
    {
      uint64_t v22 = *((void *)v17 + 1);
      *unint64_t v16 = v18;
      v16[1] = v22;
      swift_retain();
    }
    else
    {
      *(_OWORD *)unint64_t v16 = *(_OWORD *)v17;
    }
    uint64_t v24 = v8[10];
    uint64_t v25 = (uint64_t *)((char *)a1 + v24);
    uint64_t v26 = (uint64_t *)((char *)a2 + v24);
    if (*v26)
    {
      uint64_t v27 = v26[1];
      *uint64_t v25 = *v26;
      v25[1] = v27;
      swift_retain();
    }
    else
    {
      *(_OWORD *)uint64_t v25 = *(_OWORD *)v26;
    }
    uint64_t v28 = v8[11];
    uint64_t v29 = (uint64_t *)((char *)a1 + v28);
    char v30 = (uint64_t *)((char *)a2 + v28);
    if (*v30)
    {
      uint64_t v31 = v30[1];
      *uint64_t v29 = *v30;
      v29[1] = v31;
      swift_retain();
    }
    else
    {
      *(_OWORD *)uint64_t v29 = *(_OWORD *)v30;
    }
    uint64_t v32 = *(int *)(a3 + 20);
    uint64_t v33 = *(void **)((char *)a2 + v32);
    *(uint64_t *)((char *)a1 + v32) = (uint64_t)v33;
    id v34 = v33;
  }
  return a1;
}

void sub_1BBBE74A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1BBBEABA8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  int v5 = (int *)type metadata accessor for XPCServiceDescription();

  if (*(void *)(a1 + v5[9])) {
    swift_release();
  }
  if (*(void *)(a1 + v5[10])) {
    swift_release();
  }
  if (*(void *)(a1 + v5[11])) {
    swift_release();
  }
  uint64_t v6 = *(void **)(a1 + *(int *)(a2 + 20));
}

uint64_t sub_1BBBE759C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1BBBEABA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = (int *)type metadata accessor for XPCServiceDescription();
  *(void *)(a1 + v7[5]) = *(void *)(a2 + v7[5]);
  uint64_t v8 = v7[6];
  uint64_t v9 = *(void **)(a2 + v8);
  *(void *)(a1 + v8) = v9;
  uint64_t v10 = v7[7];
  uint64_t v11 = *(void **)(a2 + v10);
  *(void *)(a1 + v10) = v11;
  uint64_t v12 = v7[8];
  uint64_t v13 = *(void **)(a2 + v12);
  *(void *)(a1 + v12) = v13;
  uint64_t v14 = v7[9];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = a2 + v14;
  uint64_t v17 = *(void *)(a2 + v14);
  id v18 = v9;
  id v19 = v11;
  id v20 = v13;
  if (v17)
  {
    uint64_t v21 = *(void *)(v16 + 8);
    void *v15 = v17;
    v15[1] = v21;
    swift_retain();
  }
  else
  {
    *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
  }
  uint64_t v22 = v7[10];
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = (void *)(a2 + v22);
  if (*v24)
  {
    uint64_t v25 = v24[1];
    void *v23 = *v24;
    v23[1] = v25;
    swift_retain();
  }
  else
  {
    *(_OWORD *)uint64_t v23 = *(_OWORD *)v24;
  }
  uint64_t v26 = v7[11];
  uint64_t v27 = (void *)(a1 + v26);
  uint64_t v28 = (void *)(a2 + v26);
  if (*v28)
  {
    uint64_t v29 = v28[1];
    *uint64_t v27 = *v28;
    v27[1] = v29;
    swift_retain();
  }
  else
  {
    *(_OWORD *)uint64_t v27 = *(_OWORD *)v28;
  }
  uint64_t v30 = *(int *)(a3 + 20);
  uint64_t v31 = *(void **)(a2 + v30);
  *(void *)(a1 + v30) = v31;
  id v32 = v31;
  return a1;
}

uint64_t sub_1BBBE7700(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1BBBEABA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = (int *)type metadata accessor for XPCServiceDescription();
  *(void *)(a1 + v7[5]) = *(void *)(a2 + v7[5]);
  uint64_t v8 = v7[6];
  uint64_t v9 = *(void **)(a1 + v8);
  uint64_t v10 = *(void **)(a2 + v8);
  *(void *)(a1 + v8) = v10;
  id v11 = v10;

  uint64_t v12 = v7[7];
  uint64_t v13 = *(void **)(a1 + v12);
  uint64_t v14 = *(void **)(a2 + v12);
  *(void *)(a1 + v12) = v14;
  id v15 = v14;

  uint64_t v16 = v7[8];
  uint64_t v17 = *(void **)(a1 + v16);
  id v18 = *(void **)(a2 + v16);
  *(void *)(a1 + v16) = v18;
  id v19 = v18;

  uint64_t v20 = v7[9];
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = a2 + v20;
  uint64_t v23 = *(void *)(a1 + v20);
  uint64_t v24 = *(void *)(a2 + v20);
  if (v23)
  {
    if (v24)
    {
      uint64_t v25 = *(void *)(v22 + 8);
      *uint64_t v21 = v24;
      v21[1] = v25;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v24)
  {
    uint64_t v26 = *(void *)(v22 + 8);
    *uint64_t v21 = v24;
    v21[1] = v26;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)uint64_t v21 = *(_OWORD *)v22;
LABEL_8:
  uint64_t v27 = v7[10];
  uint64_t v28 = (void *)(a1 + v27);
  uint64_t v29 = a2 + v27;
  uint64_t v30 = *(void *)(a1 + v27);
  uint64_t v31 = *(void *)(a2 + v27);
  if (v30)
  {
    if (v31)
    {
      uint64_t v32 = *(void *)(v29 + 8);
      *uint64_t v28 = v31;
      v28[1] = v32;
      swift_retain();
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v31)
  {
    uint64_t v33 = *(void *)(v29 + 8);
    *uint64_t v28 = v31;
    v28[1] = v33;
    swift_retain();
    goto LABEL_15;
  }
  *(_OWORD *)uint64_t v28 = *(_OWORD *)v29;
LABEL_15:
  uint64_t v34 = v7[11];
  uint64_t v35 = (void *)(a1 + v34);
  uint64_t v36 = a2 + v34;
  uint64_t v37 = *(void *)(a1 + v34);
  uint64_t v38 = *(void *)(a2 + v34);
  if (!v37)
  {
    if (v38)
    {
      uint64_t v40 = *(void *)(v36 + 8);
      *uint64_t v35 = v38;
      v35[1] = v40;
      swift_retain();
      goto LABEL_22;
    }
LABEL_21:
    *(_OWORD *)uint64_t v35 = *(_OWORD *)v36;
    goto LABEL_22;
  }
  if (!v38)
  {
    swift_release();
    goto LABEL_21;
  }
  uint64_t v39 = *(void *)(v36 + 8);
  *uint64_t v35 = v38;
  v35[1] = v39;
  swift_retain();
  swift_release();
LABEL_22:
  uint64_t v41 = *(int *)(a3 + 20);
  uint64_t v42 = *(void **)(a2 + v41);
  unint64_t v43 = *(void **)(a1 + v41);
  *(void *)(a1 + v41) = v42;
  id v44 = v42;

  return a1;
}

uint64_t sub_1BBBE7904(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1BBBEABA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = (int *)type metadata accessor for XPCServiceDescription();
  *(void *)(a1 + v7[5]) = *(void *)(a2 + v7[5]);
  *(void *)(a1 + v7[6]) = *(void *)(a2 + v7[6]);
  *(void *)(a1 + v7[7]) = *(void *)(a2 + v7[7]);
  *(void *)(a1 + v7[8]) = *(void *)(a2 + v7[8]);
  uint64_t v8 = v7[9];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (uint64_t *)(a2 + v8);
  uint64_t v11 = *v10;
  if (*v10)
  {
    uint64_t v12 = v10[1];
    *uint64_t v9 = v11;
    v9[1] = v12;
  }
  else
  {
    *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  }
  uint64_t v13 = v7[10];
  uint64_t v14 = (void *)(a1 + v13);
  id v15 = (uint64_t *)(a2 + v13);
  uint64_t v16 = *v15;
  if (*v15)
  {
    uint64_t v17 = v15[1];
    *uint64_t v14 = v16;
    v14[1] = v17;
  }
  else
  {
    *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
  }
  uint64_t v18 = v7[11];
  id v19 = (void *)(a1 + v18);
  uint64_t v20 = (uint64_t *)(a2 + v18);
  uint64_t v21 = *v20;
  if (*v20)
  {
    uint64_t v22 = v20[1];
    *id v19 = v21;
    v19[1] = v22;
  }
  else
  {
    *(_OWORD *)id v19 = *(_OWORD *)v20;
  }
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_1BBBE7A30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1BBBEABA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = (int *)type metadata accessor for XPCServiceDescription();
  *(void *)(a1 + v7[5]) = *(void *)(a2 + v7[5]);
  uint64_t v8 = v7[6];
  uint64_t v9 = *(void **)(a1 + v8);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);

  uint64_t v10 = v7[7];
  uint64_t v11 = *(void **)(a1 + v10);
  *(void *)(a1 + v10) = *(void *)(a2 + v10);

  uint64_t v12 = v7[8];
  uint64_t v13 = *(void **)(a1 + v12);
  *(void *)(a1 + v12) = *(void *)(a2 + v12);

  uint64_t v14 = v7[9];
  id v15 = (void *)(a1 + v14);
  uint64_t v16 = a2 + v14;
  uint64_t v17 = *(void *)(a1 + v14);
  uint64_t v18 = *(void *)(a2 + v14);
  if (v17)
  {
    if (v18)
    {
      uint64_t v19 = *(void *)(v16 + 8);
      void *v15 = v18;
      v15[1] = v19;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v18)
  {
    uint64_t v20 = *(void *)(v16 + 8);
    void *v15 = v18;
    v15[1] = v20;
    goto LABEL_8;
  }
  *(_OWORD *)id v15 = *(_OWORD *)v16;
LABEL_8:
  uint64_t v21 = v7[10];
  uint64_t v22 = (void *)(a1 + v21);
  uint64_t v23 = a2 + v21;
  uint64_t v24 = *(void *)(a1 + v21);
  uint64_t v25 = *(void *)(a2 + v21);
  if (v24)
  {
    if (v25)
    {
      uint64_t v26 = *(void *)(v23 + 8);
      *uint64_t v22 = v25;
      v22[1] = v26;
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v25)
  {
    uint64_t v27 = *(void *)(v23 + 8);
    *uint64_t v22 = v25;
    v22[1] = v27;
    goto LABEL_15;
  }
  *(_OWORD *)uint64_t v22 = *(_OWORD *)v23;
LABEL_15:
  uint64_t v28 = v7[11];
  uint64_t v29 = (void *)(a1 + v28);
  uint64_t v30 = a2 + v28;
  uint64_t v31 = *(void *)(a1 + v28);
  uint64_t v32 = *(void *)(a2 + v28);
  if (!v31)
  {
    if (v32)
    {
      uint64_t v34 = *(void *)(v30 + 8);
      *uint64_t v29 = v32;
      v29[1] = v34;
      goto LABEL_22;
    }
LABEL_21:
    *(_OWORD *)uint64_t v29 = *(_OWORD *)v30;
    goto LABEL_22;
  }
  if (!v32)
  {
    swift_release();
    goto LABEL_21;
  }
  uint64_t v33 = *(void *)(v30 + 8);
  *uint64_t v29 = v32;
  v29[1] = v33;
  swift_release();
LABEL_22:
  uint64_t v35 = *(int *)(a3 + 20);
  uint64_t v36 = *(void **)(a1 + v35);
  *(void *)(a1 + v35) = *(void *)(a2 + v35);

  return a1;
}

uint64_t sub_1BBBE7C00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1BBBE7C14);
}

uint64_t sub_1BBBE7C14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for XPCServiceDescription();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_1BBBE7CD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1BBBE7CE8);
}

uint64_t sub_1BBBE7CE8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for XPCServiceDescription();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata accessor for XPCSessionManager.ListenerRecord()
{
  uint64_t result = qword_1EB9F7418;
  if (!qword_1EB9F7418) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1BBBE7DF0()
{
  uint64_t result = type metadata accessor for XPCServiceDescription();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_1BBBE7E88(uint64_t a1, uint64_t a2)
{
  sub_1BBBEBB78();
  sub_1BBBEB2E8();
  uint64_t v4 = sub_1BBBEBBB8();
  return sub_1BBBE7F98(a1, a2, v4);
}

unint64_t sub_1BBBE7F00(uint64_t a1)
{
  sub_1BBBEABA8();
  sub_1BBBEAA64(&qword_1EB9F7588, MEMORY[0x1E4F61990]);
  uint64_t v2 = sub_1BBBEB228();
  return sub_1BBBE807C(a1, v2);
}

unint64_t sub_1BBBE7F98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1BBBEBAA8() & 1) == 0)
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
      while (!v14 && (sub_1BBBEBAA8() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_1BBBE807C(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_1BBBEABA8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    BOOL v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_1BBBEAA64(&qword_1EB9F7590, MEMORY[0x1E4F61990]);
      char v15 = sub_1BBBEB268();
      (*(void (**)(char *, uint64_t))(v12 - 8))(v7, v4);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
    }
    while (((*(void *)(v18 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  return v9;
}

uint64_t sub_1BBBE823C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_1BBBE7F00(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    uint64_t v21 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1BBBE9BA0();
      uint64_t v9 = v21;
    }
    uint64_t v10 = *(void *)(v9 + 48);
    uint64_t v11 = sub_1BBBEABA8();
    (*(void (**)(unint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10 + *(void *)(*(void *)(v11 - 8) + 72) * v6, v11);
    uint64_t v12 = *(void *)(v9 + 56);
    uint64_t v13 = type metadata accessor for XPCSessionManager.ListenerRecord();
    uint64_t v20 = *(void *)(v13 - 8);
    sub_1BBBEA830(v12 + *(void *)(v20 + 72) * v6, a2, (uint64_t (*)(void))type metadata accessor for XPCSessionManager.ListenerRecord);
    sub_1BBBE8F44(v6, v9);
    *uint64_t v3 = v9;
    swift_bridgeObjectRelease();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
    uint64_t v15 = a2;
    uint64_t v16 = 0;
    uint64_t v17 = v13;
  }
  else
  {
    uint64_t v18 = type metadata accessor for XPCSessionManager.ListenerRecord();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    uint64_t v17 = v18;
    uint64_t v15 = a2;
    uint64_t v16 = 1;
  }
  return v14(v15, v16, 1, v17);
}

uint64_t sub_1BBBE8408(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F7878);
  char v36 = a2;
  uint64_t v6 = sub_1BBBEB978();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_retain();
    }
    sub_1BBBEBB78();
    sub_1BBBEB2E8();
    uint64_t result = sub_1BBBEBBB8();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *uint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1BBBE8720(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F7980);
  char v37 = a2;
  uint64_t v6 = sub_1BBBEB978();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = v2;
  int64_t v35 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v35) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v35) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v34;
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v35) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    int v32 = *(_DWORD *)(*(void *)(v5 + 56) + 4 * v20);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_1BBBEBB78();
    sub_1BBBEB2E8();
    uint64_t result = sub_1BBBEBBB8();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *uint64_t v18 = v31;
    v18[1] = v30;
    *(_DWORD *)(*(void *)(v7 + 56) + 4 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v34;
  uint64_t v22 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1BBBE8A2C(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for XPCSessionManager.ListenerRecord();
  uint64_t v49 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v54 = (uint64_t)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1BBBEABA8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v51 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F75D0);
  int v50 = a2;
  uint64_t v11 = v10;
  uint64_t v12 = sub_1BBBEB978();
  uint64_t v13 = v12;
  if (!*(void *)(v11 + 16)) {
    goto LABEL_41;
  }
  uint64_t v14 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v15 = *(void *)(v11 + 64);
  uint64_t v46 = (void *)(v11 + 64);
  if (v14 < 64) {
    uint64_t v16 = ~(-1 << v14);
  }
  else {
    uint64_t v16 = -1;
  }
  unint64_t v17 = v16 & v15;
  id v44 = v2;
  int64_t v45 = (unint64_t)(v14 + 63) >> 6;
  unint64_t v47 = (void (**)(char *, unint64_t, uint64_t))(v8 + 16);
  uint64_t v52 = (void (**)(char *, unint64_t, uint64_t))(v8 + 32);
  uint64_t v53 = v7;
  uint64_t v18 = v12 + 64;
  uint64_t result = swift_retain();
  int64_t v20 = 0;
  uint64_t v48 = v11;
  int64_t v21 = v51;
  while (1)
  {
    if (v17)
    {
      unint64_t v23 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      unint64_t v24 = v23 | (v20 << 6);
      goto LABEL_22;
    }
    int64_t v25 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v25 >= v45) {
      break;
    }
    unint64_t v26 = v46;
    unint64_t v27 = v46[v25];
    ++v20;
    if (!v27)
    {
      int64_t v20 = v25 + 1;
      if (v25 + 1 >= v45) {
        goto LABEL_34;
      }
      unint64_t v27 = v46[v20];
      if (!v27)
      {
        int64_t v28 = v25 + 2;
        if (v28 >= v45)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v44;
          if ((v50 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v27 = v46[v28];
        if (!v27)
        {
          while (1)
          {
            int64_t v20 = v28 + 1;
            if (__OFADD__(v28, 1)) {
              goto LABEL_43;
            }
            if (v20 >= v45) {
              goto LABEL_34;
            }
            unint64_t v27 = v46[v20];
            ++v28;
            if (v27) {
              goto LABEL_21;
            }
          }
        }
        int64_t v20 = v28;
      }
    }
LABEL_21:
    unint64_t v17 = (v27 - 1) & v27;
    unint64_t v24 = __clz(__rbit64(v27)) + (v20 << 6);
    int64_t v21 = v51;
LABEL_22:
    uint64_t v29 = v8;
    uint64_t v30 = *(void *)(v8 + 72);
    unint64_t v31 = *(void *)(v11 + 48) + v30 * v24;
    if (v50)
    {
      (*v52)(v21, v31, v53);
      uint64_t v32 = *(void *)(v11 + 56);
      uint64_t v33 = *(void *)(v49 + 72);
      sub_1BBBEA830(v32 + v33 * v24, v54, (uint64_t (*)(void))type metadata accessor for XPCSessionManager.ListenerRecord);
    }
    else
    {
      (*v47)(v21, v31, v53);
      uint64_t v34 = *(void *)(v11 + 56);
      uint64_t v33 = *(void *)(v49 + 72);
      sub_1BBBEA9FC(v34 + v33 * v24, v54, (uint64_t (*)(void))type metadata accessor for XPCSessionManager.ListenerRecord);
    }
    sub_1BBBEAA64(&qword_1EB9F7588, MEMORY[0x1E4F61990]);
    uint64_t result = sub_1BBBEB228();
    uint64_t v35 = -1 << *(unsigned char *)(v13 + 32);
    unint64_t v36 = result & ~v35;
    unint64_t v37 = v36 >> 6;
    if (((-1 << v36) & ~*(void *)(v18 + 8 * (v36 >> 6))) != 0)
    {
      unint64_t v22 = __clz(__rbit64((-1 << v36) & ~*(void *)(v18 + 8 * (v36 >> 6)))) | v36 & 0x7FFFFFFFFFFFFFC0;
      int64_t v21 = v51;
    }
    else
    {
      char v38 = 0;
      unint64_t v39 = (unint64_t)(63 - v35) >> 6;
      int64_t v21 = v51;
      do
      {
        if (++v37 == v39 && (v38 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v40 = v37 == v39;
        if (v37 == v39) {
          unint64_t v37 = 0;
        }
        v38 |= v40;
        uint64_t v41 = *(void *)(v18 + 8 * v37);
      }
      while (v41 == -1);
      unint64_t v22 = __clz(__rbit64(~v41)) + (v37 << 6);
    }
    *(void *)(v18 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    (*v52)((char *)(*(void *)(v13 + 48) + v30 * v22), (unint64_t)v21, v53);
    uint64_t result = sub_1BBBEA830(v54, *(void *)(v13 + 56) + v33 * v22, (uint64_t (*)(void))type metadata accessor for XPCSessionManager.ListenerRecord);
    ++*(void *)(v13 + 16);
    uint64_t v11 = v48;
    uint64_t v8 = v29;
  }
  swift_release();
  uint64_t v3 = v44;
  unint64_t v26 = v46;
  if ((v50 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v42 = 1 << *(unsigned char *)(v11 + 32);
  if (v42 >= 64) {
    bzero(v26, ((unint64_t)(v42 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v26 = -1 << v42;
  }
  *(void *)(v11 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v13;
  return result;
}

unint64_t sub_1BBBE8F44(int64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1BBBEABA8();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = MEMORY[0x1F4188790](v4);
  uint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a2 + 64;
  uint64_t v10 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v11 = (a1 + 1) & ~v10;
  if (((1 << v11) & *(void *)(a2 + 64 + 8 * (v11 >> 6))) != 0)
  {
    uint64_t v12 = ~v10;
    unint64_t result = sub_1BBBEB7A8();
    if ((*(void *)(v9 + 8 * (v11 >> 6)) & (1 << v11)) != 0)
    {
      unint64_t v39 = (result + 1) & v12;
      uint64_t v14 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      uint64_t v13 = v5 + 16;
      uint64_t v15 = *(void *)(v13 + 56);
      uint64_t v40 = v13;
      unint64_t v37 = (uint64_t (**)(char *, uint64_t))(v13 - 8);
      char v38 = v14;
      uint64_t v36 = v12;
      do
      {
        uint64_t v16 = v9;
        uint64_t v17 = v15;
        int64_t v18 = v15 * v11;
        v38(v8, *(void *)(a2 + 48) + v15 * v11, v4);
        sub_1BBBEAA64(&qword_1EB9F7588, MEMORY[0x1E4F61990]);
        uint64_t v19 = sub_1BBBEB228();
        unint64_t result = (*v37)(v8, v4);
        unint64_t v20 = v19 & v12;
        if (a1 >= (uint64_t)v39)
        {
          if (v20 >= v39 && a1 >= (uint64_t)v20)
          {
LABEL_16:
            if (v17 * a1 < v18
              || *(void *)(a2 + 48) + v17 * a1 >= (unint64_t)(*(void *)(a2 + 48) + v18 + v17))
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (v17 * a1 != v18)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            uint64_t v23 = *(void *)(a2 + 56);
            uint64_t v24 = *(void *)(*(void *)(type metadata accessor for XPCSessionManager.ListenerRecord() - 8) + 72);
            int64_t v25 = v24 * a1;
            unint64_t result = v23 + v24 * a1;
            int64_t v26 = v24 * v11;
            unint64_t v27 = v23 + v24 * v11 + v24;
            BOOL v28 = v25 < v26 || result >= v27;
            uint64_t v9 = v16;
            if (v28)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
              a1 = v11;
              uint64_t v12 = v36;
            }
            else
            {
              a1 = v11;
              uint64_t v12 = v36;
              if (v25 != v26)
              {
                unint64_t result = swift_arrayInitWithTakeBackToFront();
                a1 = v11;
              }
            }
            goto LABEL_5;
          }
        }
        else if (v20 >= v39 || a1 >= (uint64_t)v20)
        {
          goto LABEL_16;
        }
        uint64_t v9 = v16;
LABEL_5:
        unint64_t v11 = (v11 + 1) & v12;
        uint64_t v15 = v17;
      }
      while (((*(void *)(v9 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
    }
    uint64_t v29 = (uint64_t *)(v9 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v30 = *v29;
    uint64_t v31 = (-1 << a1) - 1;
  }
  else
  {
    uint64_t v29 = (uint64_t *)(v9 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v31 = *v29;
    uint64_t v30 = (-1 << a1) - 1;
  }
  *uint64_t v29 = v31 & v30;
  uint64_t v32 = *(void *)(a2 + 16);
  BOOL v33 = __OFSUB__(v32, 1);
  uint64_t v34 = v32 - 1;
  if (v33)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v34;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_1BBBE928C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_1BBBE7E88(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_1BBBE9838();
LABEL_7:
    int64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_release();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_1BBBE8408(v15, a4 & 1);
  unint64_t v21 = sub_1BBBE7E88(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_1BBBEBB18();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  int64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  uint64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
  uint64_t *v23 = a2;
  v23[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v24 = v18[2];
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (v25)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  void v18[2] = v26;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BBBE93FC(int a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_1BBBE7E88(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= result && (a4 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_1BBBE99F0();
LABEL_7:
    int64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      *(_DWORD *)(v18[7] + 4 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_1BBBE8720(result, a4 & 1);
  uint64_t result = sub_1BBBE7E88(a2, a3);
  if ((v16 & 1) != (v19 & 1))
  {
LABEL_17:
    uint64_t result = sub_1BBBEBB18();
    __break(1u);
    return result;
  }
  unint64_t v12 = result;
  int64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  unint64_t v20 = (uint64_t *)(v18[6] + 16 * v12);
  *unint64_t v20 = a2;
  v20[1] = a3;
  *(_DWORD *)(v18[7] + 4 * v12) = a1;
  uint64_t v21 = v18[2];
  BOOL v22 = __OFADD__(v21, 1);
  uint64_t v23 = v21 + 1;
  if (v22)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  void v18[2] = v23;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BBBE9560(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = sub_1BBBEABA8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  char v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v12 = (void *)*v3;
  unint64_t v14 = sub_1BBBE7F00(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 < v17 || (a3 & 1) == 0)
  {
    if (v19 >= v17 && (a3 & 1) == 0)
    {
      sub_1BBBE9BA0();
      goto LABEL_7;
    }
    sub_1BBBE8A2C(v17, a3 & 1);
    unint64_t v24 = sub_1BBBE7F00(a2);
    if ((v18 & 1) == (v25 & 1))
    {
      unint64_t v14 = v24;
      unint64_t v20 = *v4;
      if (v18) {
        goto LABEL_8;
      }
LABEL_13:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
      return sub_1BBBE9748(v14, (uint64_t)v11, a1, v20);
    }
LABEL_15:
    uint64_t result = sub_1BBBEBB18();
    __break(1u);
    return result;
  }
LABEL_7:
  unint64_t v20 = *v4;
  if ((v18 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v21 = v20[7];
  uint64_t v22 = v21 + *(void *)(*(void *)(type metadata accessor for XPCSessionManager.ListenerRecord() - 8) + 72) * v14;
  return sub_1BBBEAAFC(a1, v22);
}

uint64_t sub_1BBBE9748(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_1BBBEABA8();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  uint64_t v10 = a4[7];
  uint64_t v11 = type metadata accessor for XPCSessionManager.ListenerRecord();
  uint64_t result = sub_1BBBEA830(a3, v10 + *(void *)(*(void *)(v11 - 8) + 72) * a1, (uint64_t (*)(void))type metadata accessor for XPCSessionManager.ListenerRecord);
  uint64_t v13 = a4[2];
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    a4[2] = v15;
  }
  return result;
}

void *sub_1BBBE9838()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F7878);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1BBBEB968();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_retain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1BBBE99F0()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F7980);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1BBBEB968();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 4 * v15;
    LODWORD(v17) = *(_DWORD *)(*(void *)(v2 + 56) + v20);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = v19;
    v21[1] = v18;
    *(_DWORD *)(*(void *)(v4 + 56) + v20) = v17;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

char *sub_1BBBE9BA0()
{
  uint64_t v1 = type metadata accessor for XPCSessionManager.ListenerRecord();
  uint64_t v40 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1 - 8);
  unint64_t v39 = (char *)&v31 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = sub_1BBBEABA8();
  uint64_t v3 = *(void *)(v38 - 8);
  MEMORY[0x1F4188790](v38);
  unint64_t v37 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9F75D0);
  uint64_t v32 = v0;
  uint64_t v5 = *v0;
  uint64_t v6 = sub_1BBBEB968();
  uint64_t v7 = *(void *)(v5 + 16);
  uint64_t v42 = v6;
  if (!v7)
  {
    uint64_t result = (char *)swift_release();
    uint64_t v30 = v42;
    uint64_t v29 = v32;
LABEL_25:
    *uint64_t v29 = v30;
    return result;
  }
  uint64_t v8 = v6;
  uint64_t result = (char *)(v6 + 64);
  uint64_t v10 = (char *)(v5 + 64);
  unint64_t v11 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  uint64_t v33 = v5 + 64;
  if (v8 != v5 || result >= &v10[8 * v11])
  {
    uint64_t result = (char *)memmove(result, v10, 8 * v11);
    uint64_t v8 = v42;
  }
  int64_t v12 = 0;
  *(void *)(v8 + 16) = *(void *)(v5 + 16);
  uint64_t v13 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v41 = v5;
  uint64_t v14 = -1;
  if (v13 < 64) {
    uint64_t v14 = ~(-1 << v13);
  }
  unint64_t v15 = v14 & *(void *)(v5 + 64);
  uint64_t v36 = v3 + 16;
  int64_t v34 = (unint64_t)(v13 + 63) >> 6;
  uint64_t v35 = v3 + 32;
  uint64_t v17 = v37;
  uint64_t v16 = v38;
  uint64_t v18 = (uint64_t)v39;
  for (uint64_t i = v42;
        ;
        uint64_t result = (char *)sub_1BBBEA830(v18, *(void *)(i + 56) + v25, (uint64_t (*)(void))type metadata accessor for XPCSessionManager.ListenerRecord))
  {
    if (v15)
    {
      unint64_t v20 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      unint64_t v21 = v20 | (v12 << 6);
      uint64_t v22 = v41;
      goto LABEL_9;
    }
    int64_t v26 = v12 + 1;
    uint64_t v22 = v41;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v26 >= v34) {
      goto LABEL_23;
    }
    unint64_t v27 = *(void *)(v33 + 8 * v26);
    ++v12;
    if (!v27)
    {
      int64_t v12 = v26 + 1;
      if (v26 + 1 >= v34) {
        goto LABEL_23;
      }
      unint64_t v27 = *(void *)(v33 + 8 * v12);
      if (!v27) {
        break;
      }
    }
LABEL_22:
    unint64_t v15 = (v27 - 1) & v27;
    unint64_t v21 = __clz(__rbit64(v27)) + (v12 << 6);
LABEL_9:
    unint64_t v23 = *(void *)(v3 + 72) * v21;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v17, *(void *)(v22 + 48) + v23, v16);
    uint64_t v24 = *(void *)(v22 + 56);
    unint64_t v25 = *(void *)(v40 + 72) * v21;
    sub_1BBBEA9FC(v24 + v25, v18, (uint64_t (*)(void))type metadata accessor for XPCSessionManager.ListenerRecord);
    (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(i + 48) + v23, v17, v16);
  }
  int64_t v28 = v26 + 2;
  if (v28 >= v34)
  {
LABEL_23:
    uint64_t result = (char *)swift_release();
    uint64_t v29 = v32;
    uint64_t v30 = v42;
    goto LABEL_25;
  }
  unint64_t v27 = *(void *)(v33 + 8 * v28);
  if (v27)
  {
    int64_t v12 = v28;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v12 = v28 + 1;
    if (__OFADD__(v28, 1)) {
      break;
    }
    if (v12 >= v34) {
      goto LABEL_23;
    }
    unint64_t v27 = *(void *)(v33 + 8 * v12);
    ++v28;
    if (v27) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_1BBBE9F14(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v62 = type metadata accessor for XPCServiceDescription();
  uint64_t v56 = *(void *)(v62 - 8);
  uint64_t v4 = MEMORY[0x1F4188790](v62);
  uint64_t v57 = v5;
  uint64_t v58 = (uint64_t)&v53 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v53 - v6;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F75B0);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)&v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = type metadata accessor for XPCSessionManager.ListenerRecord();
  uint64_t v11 = *(void *)(v61 - 8);
  MEMORY[0x1F4188790](v61);
  uint64_t v60 = (uint64_t)&v53 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1BBBEABA8();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x1F4188790](v13);
  uint64_t v17 = (char *)&v53 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v15);
  uint64_t v19 = (char *)&v53 - v18;
  uint64_t v20 = sub_1BBBE6828(v1);
  unint64_t v55 = a1;
  id v21 = objc_msgSend(a1, sel_serviceName);
  if (!v21)
  {
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  uint64_t v22 = v21;
  uint64_t v59 = v2;
  uint64_t v63 = v7;
  sub_1BBBEB2A8();

  sub_1BBBEABB8();
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v19, v17, v13);
  if (*(void *)(v20 + 16) && (unint64_t v23 = sub_1BBBE7F00((uint64_t)v19), (v24 & 1) != 0))
  {
    sub_1BBBEA9FC(*(void *)(v20 + 56) + *(void *)(v11 + 72) * v23, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for XPCSessionManager.ListenerRecord);
    uint64_t v25 = 0;
  }
  else
  {
    uint64_t v25 = 1;
  }
  uint64_t v26 = (uint64_t)v63;
  uint64_t v27 = v61;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v10, v25, 1, v61);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v10, 1, v27) == 1)
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v19, v13);
    sub_1BBBB4DE4((uint64_t)v10, &qword_1EB9F75B0);
    uint64_t v2 = v59;
LABEL_9:
    sub_1BBBEB538();
    if (qword_1EB9F7C88 != -1) {
      swift_once();
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F7C80);
    uint64_t v28 = swift_allocObject();
    *(_OWORD *)(v28 + 16) = xmmword_1BBBED370;
    uint64_t v30 = *(void *)(v2 + 16);
    uint64_t v29 = *(void *)(v2 + 24);
    *(void *)(v28 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v28 + 64) = sub_1BBBBC9E8();
    *(void *)(v28 + 32) = v30;
    *(void *)(v28 + 40) = v29;
    swift_bridgeObjectRetain();
    sub_1BBBEADE8();
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v53 = v19;
  uint64_t v54 = v14;
  uint64_t v61 = v13;
  uint64_t v32 = v60;
  sub_1BBBEA830((uint64_t)v10, v60, (uint64_t (*)(void))type metadata accessor for XPCSessionManager.ListenerRecord);
  sub_1BBBEA9FC(v32, v26, (uint64_t (*)(void))type metadata accessor for XPCServiceDescription);
  sub_1BBBEB558();
  if (qword_1EB9F7C88 != -1) {
    swift_once();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F7C80);
  uint64_t v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = xmmword_1BBBEE6D0;
  uint64_t v35 = *(void *)(v59 + 16);
  uint64_t v34 = *(void *)(v59 + 24);
  *(void *)(v33 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v33 + 64) = sub_1BBBBC9E8();
  *(void *)(v33 + 32) = v35;
  *(void *)(v33 + 40) = v34;
  *(void *)(v33 + 96) = sub_1BBBB4D64(0, &qword_1EB9F7C60);
  *(void *)(v33 + 104) = sub_1BBBE7218();
  uint64_t v36 = v55;
  *(void *)(v33 + 72) = v55;
  swift_bridgeObjectRetain();
  id v37 = v36;
  sub_1BBBEADE8();
  swift_bridgeObjectRelease();
  uint64_t v38 = v62;
  objc_msgSend(v37, sel_setExportedInterface_, *(void *)(v26 + *(int *)(v62 + 28)));
  objc_msgSend(v37, sel_setExportedObject_, *(void *)(v26 + *(int *)(v38 + 24)));
  objc_msgSend(v37, sel_setRemoteObjectInterface_, *(void *)(v26 + *(int *)(v38 + 32)));
  uint64_t v39 = swift_allocObject();
  swift_weakInit();
  uint64_t v40 = v58;
  sub_1BBBEA9FC(v26, v58, (uint64_t (*)(void))type metadata accessor for XPCServiceDescription);
  unint64_t v41 = (*(unsigned __int8 *)(v56 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80);
  unint64_t v42 = (v57 + v41 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v43 = swift_allocObject();
  *(void *)(v43 + 16) = v39;
  sub_1BBBEA830(v40, v43 + v41, (uint64_t (*)(void))type metadata accessor for XPCServiceDescription);
  *(void *)(v43 + v42) = v37;
  uint64_t v68 = sub_1BBBEA8D4;
  uint64_t v69 = v43;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v65 = 1107296256;
  uint64_t v66 = sub_1BBBAED3C;
  uint64_t v67 = &block_descriptor_28;
  id v44 = _Block_copy(&aBlock);
  id v45 = v37;
  swift_release();
  objc_msgSend(v45, sel_setInvalidationHandler_, v44);
  _Block_release(v44);
  uint64_t v46 = swift_allocObject();
  swift_weakInit();
  sub_1BBBEA9FC((uint64_t)v63, v40, (uint64_t (*)(void))type metadata accessor for XPCServiceDescription);
  uint64_t v47 = swift_allocObject();
  *(void *)(v47 + 16) = v46;
  sub_1BBBEA830(v40, v47 + v41, (uint64_t (*)(void))type metadata accessor for XPCServiceDescription);
  *(void *)(v47 + v42) = v45;
  uint64_t v48 = (uint64_t)v63;
  uint64_t v68 = sub_1BBBEA8F0;
  uint64_t v69 = v47;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v65 = 1107296256;
  uint64_t v66 = sub_1BBBAED3C;
  uint64_t v67 = &block_descriptor_35;
  uint64_t v49 = _Block_copy(&aBlock);
  id v50 = v45;
  swift_release();
  objc_msgSend(v50, sel_setInterruptionHandler_, v49);
  _Block_release(v49);
  objc_msgSend(v50, sel_resume);
  uint64_t v51 = *(uint64_t (**)(id))(v48 + *(int *)(v62 + 36));
  if (v51)
  {
    swift_retain();
    char v52 = v51(v50);
    sub_1BBBCB428((uint64_t)v51);
    if ((v52 & 1) == 0)
    {
      objc_msgSend(v50, sel_invalidate);
      sub_1BBBEA99C(v48, (uint64_t (*)(void))type metadata accessor for XPCServiceDescription);
      sub_1BBBEA99C(v60, (uint64_t (*)(void))type metadata accessor for XPCSessionManager.ListenerRecord);
      (*(void (**)(char *, uint64_t))(v54 + 8))(v53, v61);
      return 0;
    }
  }
  sub_1BBBEA99C(v48, (uint64_t (*)(void))type metadata accessor for XPCServiceDescription);
  sub_1BBBEA99C(v60, (uint64_t (*)(void))type metadata accessor for XPCSessionManager.ListenerRecord);
  (*(void (**)(char *, uint64_t))(v54 + 8))(v53, v61);
  return 1;
}

uint64_t sub_1BBBEA830(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1BBBEA898()
{
  swift_weakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1BBBEA8D4()
{
  return sub_1BBBEA908((void (*)(uint64_t, uint64_t))sub_1BBBE6AD0);
}

uint64_t sub_1BBBEA8F0()
{
  return sub_1BBBEA908((void (*)(uint64_t, uint64_t))sub_1BBBE6CD0);
}

uint64_t sub_1BBBEA908(void (*a1)(uint64_t, uint64_t))
{
  uint64_t v3 = *(void *)(type metadata accessor for XPCServiceDescription() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  return sub_1BBBE6C54(*(void *)(v1 + 16), v1 + v4, *(void *)(v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8)), a1);
}

uint64_t sub_1BBBEA99C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1BBBEA9FC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1BBBEAA64(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1BBBEAAAC()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1BBBEAAE4()
{
  return sub_1BBBE6994(*(void **)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_1BBBEAAEC()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1BBBEAAFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for XPCSessionManager.ListenerRecord();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BBBEAB78()
{
  return MEMORY[0x1F4119240]();
}

uint64_t sub_1BBBEAB88()
{
  return MEMORY[0x1F4119248]();
}

uint64_t sub_1BBBEAB98()
{
  return MEMORY[0x1F4119258]();
}

uint64_t sub_1BBBEABA8()
{
  return MEMORY[0x1F4119260]();
}

uint64_t sub_1BBBEABB8()
{
  return MEMORY[0x1F4119268]();
}

uint64_t sub_1BBBEABC8()
{
  return MEMORY[0x1F4119278]();
}

uint64_t sub_1BBBEABD8()
{
  return MEMORY[0x1F4119280]();
}

uint64_t sub_1BBBEABE8()
{
  return MEMORY[0x1F41192A8]();
}

uint64_t sub_1BBBEABF8()
{
  return MEMORY[0x1F40E37C0]();
}

uint64_t sub_1BBBEAC08()
{
  return MEMORY[0x1F40E37D0]();
}

uint64_t sub_1BBBEAC18()
{
  return MEMORY[0x1F40E37E0]();
}

uint64_t sub_1BBBEAC28()
{
  return MEMORY[0x1F40E37F0]();
}

uint64_t sub_1BBBEAC38()
{
  return MEMORY[0x1F40E3800]();
}

uint64_t sub_1BBBEAC48()
{
  return MEMORY[0x1F40E3818]();
}

uint64_t sub_1BBBEAC58()
{
  return MEMORY[0x1F40E3830]();
}

uint64_t sub_1BBBEAC68()
{
  return MEMORY[0x1F40E3B70]();
}

uint64_t sub_1BBBEAC78()
{
  return MEMORY[0x1F40E3F58]();
}

uint64_t sub_1BBBEAC88()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1BBBEAC98()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1BBBEACA8()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1BBBEACB8()
{
  return MEMORY[0x1F41192B8]();
}

uint64_t sub_1BBBEACC8()
{
  return MEMORY[0x1F40E4BC8]();
}

uint64_t sub_1BBBEACD8()
{
  return MEMORY[0x1F40E4C08]();
}

uint64_t sub_1BBBEACE8()
{
  return MEMORY[0x1F40E4C58]();
}

uint64_t sub_1BBBEACF8()
{
  return MEMORY[0x1F40E4C80]();
}

uint64_t sub_1BBBEAD08()
{
  return MEMORY[0x1F40E4CA8]();
}

uint64_t sub_1BBBEAD18()
{
  return MEMORY[0x1F40E4CD8]();
}

uint64_t sub_1BBBEAD28()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1BBBEAD38()
{
  return MEMORY[0x1F40E4E48]();
}

uint64_t sub_1BBBEAD48()
{
  return MEMORY[0x1F40E4E60]();
}

uint64_t sub_1BBBEAD58()
{
  return MEMORY[0x1F40E4EC8]();
}

uint64_t sub_1BBBEAD68()
{
  return MEMORY[0x1F40E50E0]();
}

uint64_t sub_1BBBEAD78()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t sub_1BBBEAD88()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1BBBEAD98()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_1BBBEADB8()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_1BBBEADC8()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1BBBEADD8()
{
  return MEMORY[0x1F41884F0]();
}

uint64_t sub_1BBBEADE8()
{
  return MEMORY[0x1F4188500]();
}

uint64_t sub_1BBBEADF8()
{
  return MEMORY[0x1F41192C8]();
}

uint64_t sub_1BBBEAE08()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1BBBEAE18()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1BBBEAE28()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1BBBEAE38()
{
  return MEMORY[0x1F40D6658]();
}

uint64_t sub_1BBBEAE48()
{
  return MEMORY[0x1F40D6728]();
}

uint64_t sub_1BBBEAE58()
{
  return MEMORY[0x1F40D6750]();
}

uint64_t sub_1BBBEAE68()
{
  return MEMORY[0x1F40D6768]();
}

uint64_t sub_1BBBEAE78()
{
  return MEMORY[0x1F40D6778]();
}

uint64_t sub_1BBBEAE88()
{
  return MEMORY[0x1F40D67A8]();
}

uint64_t sub_1BBBEAE98()
{
  return MEMORY[0x1F40D6800]();
}

uint64_t sub_1BBBEAEA8()
{
  return MEMORY[0x1F40D6858]();
}

uint64_t sub_1BBBEAEB8()
{
  return MEMORY[0x1F40D6878]();
}

uint64_t sub_1BBBEAEC8()
{
  return MEMORY[0x1F40D6880]();
}

uint64_t sub_1BBBEAED8()
{
  return MEMORY[0x1F40D68A0]();
}

uint64_t sub_1BBBEAEE8()
{
  return MEMORY[0x1F40D6918]();
}

uint64_t sub_1BBBEAEF8()
{
  return MEMORY[0x1F40D6948]();
}

uint64_t sub_1BBBEAF08()
{
  return MEMORY[0x1F40D6960]();
}

uint64_t sub_1BBBEAF18()
{
  return MEMORY[0x1F40D6A08]();
}

uint64_t sub_1BBBEAF28()
{
  return MEMORY[0x1F40D6A18]();
}

uint64_t sub_1BBBEAF38()
{
  return MEMORY[0x1F40D6A20]();
}

uint64_t sub_1BBBEAF48()
{
  return MEMORY[0x1F40D6A28]();
}

uint64_t sub_1BBBEAF58()
{
  return MEMORY[0x1F40D6A50]();
}

uint64_t sub_1BBBEAF68()
{
  return MEMORY[0x1F40D6A68]();
}

uint64_t sub_1BBBEAF78()
{
  return MEMORY[0x1F40D6B10]();
}

uint64_t sub_1BBBEAF88()
{
  return MEMORY[0x1F40D6B18]();
}

uint64_t sub_1BBBEAF98()
{
  return MEMORY[0x1F40D6B30]();
}

uint64_t sub_1BBBEAFA8()
{
  return MEMORY[0x1F40D6B38]();
}

uint64_t sub_1BBBEAFB8()
{
  return MEMORY[0x1F40D6B68]();
}

uint64_t sub_1BBBEAFC8()
{
  return MEMORY[0x1F40D6BD8]();
}

uint64_t sub_1BBBEAFD8()
{
  return MEMORY[0x1F40D6BE0]();
}

uint64_t sub_1BBBEAFE8()
{
  return MEMORY[0x1F40D6C50]();
}

uint64_t sub_1BBBEAFF8()
{
  return MEMORY[0x1F40D6C90]();
}

uint64_t sub_1BBBEB008()
{
  return MEMORY[0x1F40D6C98]();
}

uint64_t sub_1BBBEB018()
{
  return MEMORY[0x1F40D6CA0]();
}

uint64_t sub_1BBBEB028()
{
  return MEMORY[0x1F40D6CC0]();
}

uint64_t sub_1BBBEB038()
{
  return MEMORY[0x1F40D6CF0]();
}

uint64_t sub_1BBBEB048()
{
  return MEMORY[0x1F40D6D80]();
}

uint64_t sub_1BBBEB058()
{
  return MEMORY[0x1F40D6D88]();
}

uint64_t sub_1BBBEB068()
{
  return MEMORY[0x1F40D6DA0]();
}

uint64_t sub_1BBBEB078()
{
  return MEMORY[0x1F40D6E18]();
}

uint64_t sub_1BBBEB088()
{
  return MEMORY[0x1F40D6E48]();
}

uint64_t sub_1BBBEB098()
{
  return MEMORY[0x1F40D6E58]();
}

uint64_t sub_1BBBEB0A8()
{
  return MEMORY[0x1F4186C50]();
}

uint64_t sub_1BBBEB0B8()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1BBBEB0C8()
{
  return MEMORY[0x1F4186CE0]();
}

uint64_t sub_1BBBEB0D8()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1BBBEB0E8()
{
  return MEMORY[0x1F4186D28]();
}

uint64_t sub_1BBBEB0F8()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1BBBEB108()
{
  return MEMORY[0x1F4186E28]();
}

uint64_t sub_1BBBEB118()
{
  return MEMORY[0x1F4186E60]();
}

uint64_t sub_1BBBEB128()
{
  return MEMORY[0x1F4186EB0]();
}

uint64_t sub_1BBBEB138()
{
  return MEMORY[0x1F4186EC0]();
}

uint64_t sub_1BBBEB148()
{
  return MEMORY[0x1F4186EE8]();
}

uint64_t sub_1BBBEB158()
{
  return MEMORY[0x1F4186EF8]();
}

uint64_t sub_1BBBEB168()
{
  return MEMORY[0x1F4186F18]();
}

uint64_t sub_1BBBEB178()
{
  return MEMORY[0x1F4186F40]();
}

uint64_t sub_1BBBEB188()
{
  return MEMORY[0x1F4183270]();
}

uint64_t sub_1BBBEB198()
{
  return MEMORY[0x1F4183280]();
}

uint64_t sub_1BBBEB1A8()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1BBBEB1B8()
{
  return MEMORY[0x1F4183358]();
}

uint64_t sub_1BBBEB1C8()
{
  return MEMORY[0x1F4183360]();
}

uint64_t sub_1BBBEB1D8()
{
  return MEMORY[0x1F41834A0]();
}

uint64_t sub_1BBBEB1E8()
{
  return MEMORY[0x1F41834A8]();
}

uint64_t sub_1BBBEB1F8()
{
  return MEMORY[0x1F41834E0]();
}

uint64_t sub_1BBBEB208()
{
  return MEMORY[0x1F41834F8]();
}

uint64_t sub_1BBBEB218()
{
  return MEMORY[0x1F4183500]();
}

uint64_t sub_1BBBEB228()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1BBBEB238()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t sub_1BBBEB248()
{
  return MEMORY[0x1F41835D0]();
}

uint64_t sub_1BBBEB258()
{
  return MEMORY[0x1F4183748]();
}

uint64_t sub_1BBBEB268()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1BBBEB278()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1BBBEB288()
{
  return MEMORY[0x1F40E61B8]();
}

uint64_t sub_1BBBEB298()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_1BBBEB2A8()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1BBBEB2B8()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1BBBEB2C8()
{
  return MEMORY[0x1F41838B8]();
}

uint64_t sub_1BBBEB2D8()
{
  return MEMORY[0x1F4183950]();
}

uint64_t sub_1BBBEB2E8()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1BBBEB2F8()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1BBBEB308()
{
  return MEMORY[0x1F4183A60]();
}

uint64_t sub_1BBBEB318()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1BBBEB328()
{
  return MEMORY[0x1F4183B50]();
}

uint64_t sub_1BBBEB338()
{
  return MEMORY[0x1F4183D70]();
}

uint64_t sub_1BBBEB348()
{
  return MEMORY[0x1F4183D78]();
}

uint64_t sub_1BBBEB358()
{
  return MEMORY[0x1F4183D98]();
}

uint64_t sub_1BBBEB368()
{
  return MEMORY[0x1F4183E10]();
}

uint64_t sub_1BBBEB378()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1BBBEB388()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1BBBEB398()
{
  return MEMORY[0x1F4183EA8]();
}

uint64_t sub_1BBBEB3A8()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1BBBEB3B8()
{
  return MEMORY[0x1F4183EF0]();
}

uint64_t sub_1BBBEB3C8()
{
  return MEMORY[0x1F4183F18]();
}

uint64_t sub_1BBBEB3D8()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1BBBEB3E8()
{
  return MEMORY[0x1F4183F40]();
}

uint64_t sub_1BBBEB3F8()
{
  return MEMORY[0x1F4183F60]();
}

uint64_t sub_1BBBEB408()
{
  return MEMORY[0x1F4183F78]();
}

uint64_t sub_1BBBEB418()
{
  return MEMORY[0x1F4183F80]();
}

uint64_t sub_1BBBEB428()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1BBBEB438()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1BBBEB448()
{
  return MEMORY[0x1F4187C08]();
}

uint64_t sub_1BBBEB458()
{
  return MEMORY[0x1F4187C10]();
}

uint64_t sub_1BBBEB468()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1BBBEB478()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1BBBEB488()
{
  return MEMORY[0x1F4184008]();
}

uint64_t sub_1BBBEB498()
{
  return MEMORY[0x1F40E6430]();
}

uint64_t sub_1BBBEB4A8()
{
  return MEMORY[0x1F40E6448]();
}

uint64_t sub_1BBBEB4B8()
{
  return MEMORY[0x1F41841A8]();
}

uint64_t sub_1BBBEB4C8()
{
  return MEMORY[0x1F4184230]();
}

uint64_t sub_1BBBEB4D8()
{
  return MEMORY[0x1F41842D0]();
}

uint64_t sub_1BBBEB4E8()
{
  return MEMORY[0x1F41842F8]();
}

uint64_t sub_1BBBEB4F8()
{
  return MEMORY[0x1F4184338]();
}

uint64_t sub_1BBBEB508()
{
  return MEMORY[0x1F4184440]();
}

uint64_t sub_1BBBEB518()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_1BBBEB528()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1BBBEB538()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1BBBEB548()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t sub_1BBBEB558()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1BBBEB568()
{
  return MEMORY[0x1F4186FA0]();
}

uint64_t sub_1BBBEB578()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1BBBEB588()
{
  return MEMORY[0x1F4186FF0]();
}

uint64_t sub_1BBBEB598()
{
  return MEMORY[0x1F4187000]();
}

uint64_t sub_1BBBEB5A8()
{
  return MEMORY[0x1F4187018]();
}

uint64_t sub_1BBBEB5B8()
{
  return MEMORY[0x1F4187020]();
}

uint64_t sub_1BBBEB5C8()
{
  return MEMORY[0x1F4187028]();
}

uint64_t sub_1BBBEB5D8()
{
  return MEMORY[0x1F4187040]();
}

uint64_t sub_1BBBEB5E8()
{
  return MEMORY[0x1F4187070]();
}

uint64_t sub_1BBBEB5F8()
{
  return MEMORY[0x1F4187088]();
}

uint64_t sub_1BBBEB608()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1BBBEB618()
{
  return MEMORY[0x1F41870B8]();
}

uint64_t sub_1BBBEB628()
{
  return MEMORY[0x1F41870D8]();
}

uint64_t sub_1BBBEB638()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1BBBEB648()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1BBBEB658()
{
  return MEMORY[0x1F4187110]();
}

uint64_t sub_1BBBEB668()
{
  return MEMORY[0x1F40E6A98]();
}

uint64_t sub_1BBBEB678()
{
  return MEMORY[0x1F40E6AC8]();
}

uint64_t sub_1BBBEB688()
{
  return MEMORY[0x1F40E6AF0]();
}

uint64_t sub_1BBBEB698()
{
  return MEMORY[0x1F4188728]();
}

uint64_t sub_1BBBEB6A8()
{
  return MEMORY[0x1F4188758]();
}

uint64_t sub_1BBBEB6B8()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1BBBEB6C8()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1BBBEB6D8()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1BBBEB6E8()
{
  return MEMORY[0x1F4184830]();
}

uint64_t sub_1BBBEB6F8()
{
  return MEMORY[0x1F41848C0]();
}

uint64_t sub_1BBBEB708()
{
  return MEMORY[0x1F41848C8]();
}

uint64_t sub_1BBBEB718()
{
  return MEMORY[0x1F4184908]();
}

uint64_t sub_1BBBEB728()
{
  return MEMORY[0x1F4184910]();
}

uint64_t sub_1BBBEB738()
{
  return MEMORY[0x1F4184918]();
}

uint64_t sub_1BBBEB748()
{
  return MEMORY[0x1F4184938]();
}

uint64_t sub_1BBBEB758()
{
  return MEMORY[0x1F4184940]();
}

uint64_t sub_1BBBEB768()
{
  return MEMORY[0x1F4184950]();
}

uint64_t sub_1BBBEB778()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1BBBEB798()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1BBBEB7A8()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1BBBEB7B8()
{
  return MEMORY[0x1F4184B30]();
}

uint64_t sub_1BBBEB7C8()
{
  return MEMORY[0x1F4184B60]();
}

uint64_t sub_1BBBEB7D8()
{
  return MEMORY[0x1F4184B90]();
}

uint64_t sub_1BBBEB7E8()
{
  return MEMORY[0x1F4184BA8]();
}

uint64_t sub_1BBBEB7F8()
{
  return MEMORY[0x1F4184BC0]();
}

uint64_t sub_1BBBEB808()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1BBBEB818()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1BBBEB828()
{
  return MEMORY[0x1F4184CA0]();
}

uint64_t sub_1BBBEB838()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1BBBEB848()
{
  return MEMORY[0x1F4184CB0]();
}

uint64_t sub_1BBBEB858()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1BBBEB868()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1BBBEB878()
{
  return MEMORY[0x1F4184D78]();
}

uint64_t sub_1BBBEB888()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1BBBEB898()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1BBBEB8A8()
{
  return MEMORY[0x1F4184EE8]();
}

uint64_t sub_1BBBEB8B8()
{
  return MEMORY[0x1F4184F48]();
}

uint64_t sub_1BBBEB8C8()
{
  return MEMORY[0x1F4184F68]();
}

uint64_t sub_1BBBEB8D8()
{
  return MEMORY[0x1F4184F70]();
}

uint64_t sub_1BBBEB8E8()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1BBBEB8F8()
{
  return MEMORY[0x1F41192D8]();
}

uint64_t sub_1BBBEB908()
{
  return MEMORY[0x1F41851A8]();
}

uint64_t sub_1BBBEB918()
{
  return MEMORY[0x1F41851F8]();
}

uint64_t sub_1BBBEB928()
{
  return MEMORY[0x1F4185270]();
}

uint64_t sub_1BBBEB938()
{
  return MEMORY[0x1F4185278]();
}

uint64_t sub_1BBBEB948()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1BBBEB958()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1BBBEB968()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1BBBEB978()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1BBBEB988()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1BBBEB998()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1BBBEB9B8()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1BBBEB9C8()
{
  return MEMORY[0x1F4185528]();
}

uint64_t sub_1BBBEB9D8()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1BBBEB9E8()
{
  return MEMORY[0x1F41855E0]();
}

uint64_t sub_1BBBEB9F8()
{
  return MEMORY[0x1F41855F0]();
}

uint64_t sub_1BBBEBA08()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1BBBEBA18()
{
  return MEMORY[0x1F4185710]();
}

uint64_t sub_1BBBEBA28()
{
  return MEMORY[0x1F41192E8]();
}

uint64_t sub_1BBBEBA38()
{
  return MEMORY[0x1F41192F0]();
}

uint64_t sub_1BBBEBA48()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1BBBEBA68()
{
  return MEMORY[0x1F41857F0]();
}

uint64_t sub_1BBBEBA78()
{
  return MEMORY[0x1F41858D8]();
}

uint64_t sub_1BBBEBA88()
{
  return MEMORY[0x1F4185A18]();
}

uint64_t sub_1BBBEBA98()
{
  return MEMORY[0x1F4185A20]();
}

uint64_t sub_1BBBEBAA8()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1BBBEBAB8()
{
  return MEMORY[0x1F41192F8]();
}

uint64_t sub_1BBBEBAC8()
{
  return MEMORY[0x1F4119300]();
}

uint64_t sub_1BBBEBAD8()
{
  return MEMORY[0x1F4185A88]();
}

uint64_t sub_1BBBEBAE8()
{
  return MEMORY[0x1F4185D58]();
}

uint64_t sub_1BBBEBAF8()
{
  return MEMORY[0x1F4185D68]();
}

uint64_t sub_1BBBEBB08()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1BBBEBB18()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1BBBEBB28()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1BBBEBB38()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1BBBEBB48()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1BBBEBB58()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1BBBEBB78()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1BBBEBB88()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1BBBEBB98()
{
  return MEMORY[0x1F4185ED0]();
}

uint64_t sub_1BBBEBBA8()
{
  return MEMORY[0x1F4185EE8]();
}

uint64_t sub_1BBBEBBB8()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1BBBEBBC8()
{
  return MEMORY[0x1F4185F68]();
}

uint64_t sub_1BBBEBBD8()
{
  return MEMORY[0x1F4185FB0]();
}

uint64_t sub_1BBBEBBE8()
{
  return MEMORY[0x1F4185FB8]();
}

uint64_t sub_1BBBEBBF8()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1BBBEBC08()
{
  return MEMORY[0x1F4185FD8]();
}

uint64_t sub_1BBBEBC18()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t sub_1BBBEBC28()
{
  return MEMORY[0x1F4188198]();
}

uint64_t sub_1BBBEBC38()
{
  return MEMORY[0x1F41881A8]();
}

uint64_t sub_1BBBEBC58()
{
  return MEMORY[0x1F4186318]();
}

uint64_t CCCryptorGCMOneshotDecrypt()
{
  return MEMORY[0x1F40C94F8]();
}

uint64_t CCCryptorGCMOneshotEncrypt()
{
  return MEMORY[0x1F40C9500]();
}

void CCHmac(CCHmacAlgorithm algorithm, const void *key, size_t keyLength, const void *data, size_t dataLength, void *macOut)
{
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9770](data, *(void *)&len, md);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9778](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9780](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9788](c, data, *(void *)&len);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B8]();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return (SCNetworkReachabilityRef)MEMORY[0x1F4101EE8](allocator, address);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x1F4101F08](target, flags);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_release(const void *aBlock)
{
}

{
  return MEMORY[0x1F41813D0]();
}

{
  return MEMORY[0x1F41813F0]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1F40C9F70](dso, description, activity, *(void *)&flags);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

void bzero(void *a1, size_t a2)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x1F40CC4D8](a1);
}

uid_t getuid(void)
{
  return MEMORY[0x1F40CC570]();
}

int initgroups(const char *a1, int a2)
{
  return MEMORY[0x1F40CC688](a1, *(void *)&a2);
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1F40CC930]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1F40CD058](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1F40CD088](*(void *)&token, state64);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1F40CDBD8]();
}

int setregid(gid_t a1, gid_t a2)
{
  return MEMORY[0x1F40CDFA8](*(void *)&a1, *(void *)&a2);
}

int setreuid(uid_t a1, uid_t a2)
{
  return MEMORY[0x1F40CDFB0](*(void *)&a1, *(void *)&a2);
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1F41863F0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1F4186420]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1F4186428]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1F4186460]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1F4186538]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1F4186540]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getFunctionTypeMetadata1()
{
  return MEMORY[0x1F41865C8]();
}

uint64_t swift_getFunctionTypeMetadata2()
{
  return MEMORY[0x1F41865D0]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1F4186688]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1F4186690]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1F4186710]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1F4186778]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1F4188258]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1F4186858]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1F4186860]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1F4186868]();
}

uint64_t swift_unownedRelease()
{
  return MEMORY[0x1F4186880]();
}

uint64_t swift_unownedRetain()
{
  return MEMORY[0x1F4186888]();
}

uint64_t swift_unownedRetainStrong()
{
  return MEMORY[0x1F4186890]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x1F41868A0]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1F41868B8]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1F41868C0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1F41868C8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}