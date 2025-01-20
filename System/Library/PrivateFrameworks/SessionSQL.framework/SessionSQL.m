uint64_t sub_1C7BE803C()
{
  uint64_t v0;
  uint64_t vars8;

  MEMORY[0x1C87BDF10](*(void *)(v0 + 16), -1, -1);

  return MEMORY[0x1F4186488](v0, 24, 7);
}

uint64_t type metadata accessor for UnfairLock()
{
  return self;
}

void type metadata accessor for BSSqliteDatabaseConnectionDataProtectionClass(uint64_t a1)
{
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

void sub_1C7BE80C8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_1C7BE8110@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v5 = (unint64_t)objc_msgSend(a1, sel_count);
  if ((v5 & 0x8000000000000000) != 0) {
    goto LABEL_14;
  }
  unint64_t v6 = v5;
  v21 = a2;
  if (v5)
  {
    uint64_t v2 = 0;
    v7 = (void *)MEMORY[0x1E4FBC860];
    while (v6 != v2)
    {
      id v8 = objc_msgSend(a1, sel_keyAtIndex_, v2);
      if (!v8) {
        goto LABEL_15;
      }
      v9 = v8;
      uint64_t v10 = sub_1C7BF41B0();
      uint64_t v12 = v11;
      id v13 = objc_msgSend(a1, sel_objectForKey_, v9);

      if (!v13)
      {
        *(void *)&long long v27 = 0;
        *((void *)&v27 + 1) = 0xE000000000000000;
        sub_1C7BF42E0();
        _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
        _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
        goto LABEL_17;
      }
      sub_1C7BF42D0();
      swift_unknownObjectRelease();
      sub_1C7BE9F38(&v27, v29);
      *(void *)&long long v27 = v10;
      *((void *)&v27 + 1) = v12;
      sub_1C7BE9F48((uint64_t)v29, (uint64_t)v28);
      uint64_t v24 = v10;
      uint64_t v25 = v12;
      sub_1C7BE9F48((uint64_t)v28, (uint64_t)v26);
      *(void *)&long long v22 = v10;
      *((void *)&v22 + 1) = v12;
      sub_1C7BE9F38(v26, v23);
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        v7 = sub_1C7BF14EC(0, v7[2] + 1, 1, v7);
      }
      unint64_t v15 = v7[2];
      unint64_t v14 = v7[3];
      if (v15 >= v14 >> 1) {
        v7 = sub_1C7BF14EC((void *)(v14 > 1), v15 + 1, 1, v7);
      }
      ++v2;
      v7[2] = v15 + 1;
      v16 = &v7[6 * v15];
      long long v17 = v23[1];
      v16[3] = v23[0];
      v16[4] = v17;
      v16[2] = v22;
      sub_1C7BEA0B0((uint64_t)&v27, &qword_1EBC68D18);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v29);
      if (v6 == v2) {
        goto LABEL_12;
      }
    }
    __break(1u);
LABEL_14:
    __break(1u);
LABEL_15:
    *(void *)&long long v27 = 0;
    *((void *)&v27 + 1) = 0xE000000000000000;
    sub_1C7BF42E0();
    _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
    uint64_t v24 = v2;
    sub_1C7BF4380();
    _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
    swift_bridgeObjectRelease();
    while (1)
    {
LABEL_17:
      sub_1C7BF4330();
      __break(1u);
      swift_bridgeObjectRelease();
      *(void *)&long long v27 = 0;
      *((void *)&v27 + 1) = 0xE000000000000000;
      sub_1C7BF42E0();
      swift_bridgeObjectRelease();
      *(void *)&long long v27 = 0xD000000000000027;
      *((void *)&v27 + 1) = 0x80000001C7BF5080;
      swift_getErrorValue();
      sub_1C7BF43B0();
      _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
      swift_bridgeObjectRelease();
    }
  }
LABEL_12:
  uint64_t v18 = swift_bridgeObjectRetain();
  uint64_t v19 = sub_1C7BE9C00(v18);

  uint64_t result = swift_bridgeObjectRelease_n();
  uint64_t *v21 = v19;
  return result;
}

uint64_t SQLResult.startIndex.getter()
{
  return 0;
}

uint64_t SQLResult.endIndex.getter()
{
  return *(void *)(*(void *)v0 + 16);
}

uint64_t SQLResult.allColumns.getter()
{
  uint64_t v1 = *v0;
  int64_t v2 = *(void *)(*v0 + 16);
  uint64_t v3 = MEMORY[0x1E4FBC860];
  if (v2)
  {
    uint64_t v14 = MEMORY[0x1E4FBC860];
    swift_bridgeObjectRetain();
    sub_1C7BE9128(0, v2, 0);
    uint64_t v3 = v14;
    uint64_t v4 = (char *)(v1 + 64);
    do
    {
      uint64_t v6 = *((void *)v4 - 4);
      uint64_t v5 = *((void *)v4 - 3);
      uint64_t v7 = *((void *)v4 - 2);
      unint64_t v8 = *((void *)v4 - 1);
      char v9 = *v4;
      swift_bridgeObjectRetain();
      sub_1C7BE9148(v7, v8, v9);
      sub_1C7BE91C4(v7, v8, v9);
      unint64_t v11 = *(void *)(v14 + 16);
      unint64_t v10 = *(void *)(v14 + 24);
      if (v11 >= v10 >> 1) {
        sub_1C7BE9128(v10 > 1, v11 + 1, 1);
      }
      v4 += 40;
      *(void *)(v14 + 16) = v11 + 1;
      uint64_t v12 = v14 + 16 * v11;
      *(void *)(v12 + 32) = v6;
      *(void *)(v12 + 40) = v5;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
  return v3;
}

uint64_t SQLResult.allValues.getter()
{
  uint64_t v1 = *v0;
  int64_t v2 = *(void *)(*v0 + 16);
  uint64_t v3 = MEMORY[0x1E4FBC860];
  if (v2)
  {
    uint64_t v12 = MEMORY[0x1E4FBC860];
    swift_bridgeObjectRetain();
    sub_1C7BE9240(0, v2, 0);
    uint64_t v3 = v12;
    uint64_t v4 = (char *)(v1 + 64);
    do
    {
      uint64_t v5 = *((void *)v4 - 2);
      unint64_t v6 = *((void *)v4 - 1);
      char v7 = *v4;
      swift_bridgeObjectRetain();
      sub_1C7BE9148(v5, v6, v7);
      swift_bridgeObjectRelease();
      unint64_t v9 = *(void *)(v12 + 16);
      unint64_t v8 = *(void *)(v12 + 24);
      if (v9 >= v8 >> 1) {
        sub_1C7BE9240(v8 > 1, v9 + 1, 1);
      }
      v4 += 40;
      *(void *)(v12 + 16) = v9 + 1;
      uint64_t v10 = v12 + 24 * v9;
      *(void *)(v10 + 32) = v5;
      *(void *)(v10 + 40) = v6;
      *(unsigned char *)(v10 + 48) = v7;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
  return v3;
}

Swift::Int __swiftcall SQLResult.index(after:)(Swift::Int after)
{
  BOOL v1 = __OFADD__(after, 1);
  Swift::Int result = after + 1;
  if (v1) {
    __break(1u);
  }
  return result;
}

unint64_t SQLResult.subscript.getter@<X0>(unint64_t result@<X0>, uint64_t a2@<X8>)
{
  if (*(void *)(*(void *)v2 + 16) <= result)
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = *(void *)v2 + 40 * result;
    uint64_t v5 = *(void *)(v4 + 48);
    unint64_t v6 = *(void *)(v4 + 56);
    char v7 = *(unsigned char *)(v4 + 64);
    swift_bridgeObjectRetain();
    sub_1C7BE9148(v5, v6, v7);
    Swift::Int result = swift_bridgeObjectRelease();
    *(void *)a2 = v5;
    *(void *)(a2 + 8) = v6;
    *(unsigned char *)(a2 + 16) = v7;
  }
  return result;
}

uint64_t SQLResult.subscript.getter@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = *v3;
  uint64_t v6 = *(void *)(*v3 + 16);
  if (v6)
  {
    uint64_t v8 = result;
    unint64_t v9 = (char *)(v5 + 64);
    while (1)
    {
      uint64_t v10 = *((void *)v9 - 2);
      unint64_t v11 = *((void *)v9 - 1);
      char v12 = *v9;
      if (*((void *)v9 - 4) == v8 && *((void *)v9 - 3) == a2) {
        break;
      }
      Swift::Int result = sub_1C7BF4390();
      if (result) {
        break;
      }
      v9 += 40;
      if (!--v6) {
        goto LABEL_9;
      }
    }
    swift_bridgeObjectRetain();
    sub_1C7BE9148(v10, v11, v12);
    Swift::Int result = swift_bridgeObjectRelease();
    *(void *)a3 = v10;
    *(void *)(a3 + 8) = v11;
    *(unsigned char *)(a3 + 16) = v12;
  }
  else
  {
LABEL_9:
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = 0;
    *(unsigned char *)(a3 + 16) = -1;
  }
  return result;
}

uint64_t SQLResult.subscript.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = sub_1C7BF4300();
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v3 + 16);
  if (v7)
  {
    uint64_t v8 = v4;
    unint64_t v9 = (char *)(v3 + 64);
    while (1)
    {
      uint64_t v10 = *((void *)v9 - 2);
      unint64_t v11 = *((void *)v9 - 1);
      char v12 = *v9;
      BOOL v13 = *((void *)v9 - 4) == v8 && *((void *)v9 - 3) == v6;
      if (v13 || (sub_1C7BF4390() & 1) != 0) {
        break;
      }
      v9 += 40;
      if (!--v7) {
        goto LABEL_9;
      }
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1C7BE9148(v10, v11, v12);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)a1 = v10;
    *(void *)(a1 + 8) = v11;
    *(unsigned char *)(a1 + 16) = v12;
  }
  else
  {
LABEL_9:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)a1 = 0;
    *(void *)(a1 + 8) = 0;
    *(unsigned char *)(a1 + 16) = -1;
  }
  return result;
}

uint64_t SQLResult.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = *v4;
  uint64_t v8 = *(void *)(*v4 + 16);
  if (v8)
  {
    unint64_t v11 = (char *)(v7 + 64);
    while (1)
    {
      uint64_t v12 = *((void *)v11 - 2);
      unint64_t v13 = *((void *)v11 - 1);
      char v14 = *v11;
      BOOL v15 = *((void *)v11 - 4) == a1 && *((void *)v11 - 3) == a2;
      if (v15 || (sub_1C7BF4390() & 1) != 0) {
        break;
      }
      v11 += 40;
      if (!--v8) {
        goto LABEL_9;
      }
    }
    swift_bridgeObjectRetain();
    sub_1C7BE9148(v12, v13, v14);
    swift_bridgeObjectRelease();
    SQLValue.unbox<A>()(a3, a4);
    return sub_1C7BE91C4(v12, v13, v14);
  }
  else
  {
LABEL_9:
    v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a3 - 8) + 56);
    return v16(a4, 1, 1, a3);
  }
}

uint64_t SQLResult.subscript.getter@<X0>(uint64_t a1@<X3>, uint64_t a2@<X8>)
{
  uint64_t v5 = *v2;
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_1C7BF4300();
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)(v5 + 16);
  if (v9)
  {
    uint64_t v10 = v6;
    uint64_t v18 = a2;
    unint64_t v11 = (char *)(v5 + 64);
    while (1)
    {
      uint64_t v12 = *((void *)v11 - 2);
      unint64_t v13 = *((void *)v11 - 1);
      char v14 = *v11;
      BOOL v15 = *((void *)v11 - 4) == v10 && *((void *)v11 - 3) == v8;
      if (v15 || (sub_1C7BF4390() & 1) != 0) {
        break;
      }
      v11 += 40;
      if (!--v9)
      {
        swift_bridgeObjectRelease();
        a2 = v18;
        goto LABEL_11;
      }
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1C7BE9148(v12, v13, v14);
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    SQLValue.unbox<A>()(a1, v18);
    return sub_1C7BE91C4(v12, v13, v14);
  }
  else
  {
    swift_bridgeObjectRelease();
LABEL_11:
    swift_bridgeObjectRelease();
    v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 - 8) + 56);
    return v16(a2, 1, 1, a1);
  }
}

void sub_1C7BE8C74(void *a1@<X8>)
{
  *a1 = 0;
}

void sub_1C7BE8C7C(void *a1@<X8>)
{
  *a1 = *(void *)(*(void *)v1 + 16);
}

void (*sub_1C7BE8C8C(uint64_t (**a1)(uint64_t a1), unint64_t *a2))(void *a1)
{
  uint64_t v4 = (uint64_t (*)(uint64_t))malloc(0x28uLL);
  *a1 = v4;
  *((void *)v4 + 4) = sub_1C7BE8D34(v4, *a2);
  return sub_1C7BE8CEC;
}

void sub_1C7BE8CEC(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

uint64_t (*sub_1C7BE8D34(uint64_t (*result)(uint64_t a1), unint64_t a2))(uint64_t a1)
{
  uint64_t v3 = *v2;
  if (*(void *)(v3 + 16) <= a2)
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = result;
    uint64_t v5 = v3 + 40 * a2;
    uint64_t v6 = *(void *)(v5 + 48);
    unint64_t v7 = *(void *)(v5 + 56);
    char v8 = *(unsigned char *)(v5 + 64);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1C7BE9148(v6, v7, v8);
    swift_bridgeObjectRelease();
    *(void *)uint64_t v4 = v6;
    *((void *)v4 + 1) = v7;
    *((unsigned char *)v4 + 16) = v8;
    swift_bridgeObjectRelease();
    return destroy for SQLValue;
  }
  return result;
}

uint64_t destroy for SQLValue(uint64_t a1)
{
  return sub_1C7BE91C4(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t *sub_1C7BE8DF0@<X0>(uint64_t *result@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *result;
  if (*result < 0 || (uint64_t v4 = result[1], result = *v2, (*v2)[2] < v4))
  {
    __break(1u);
  }
  else
  {
    a2[1] = v4;
    a2[2] = result;
    *a2 = v3;
    return (uint64_t *)swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_1C7BE8E1C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = *v1;
  *a1 = *v1;
  a1[1] = 0;
  a1[2] = *(void *)(v2 + 16);
  return swift_bridgeObjectRetain();
}

BOOL sub_1C7BE8E30()
{
  return *(void *)(*(void *)v0 + 16) == 0;
}

void sub_1C7BE8E44(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(_WORD *)(a1 + 8) = 256;
}

uint64_t *sub_1C7BE8E54@<X0>(uint64_t *result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  if ((a2 & 0x8000000000000000) == 0)
  {
    uint64_t v3 = *result;
    if (!a2)
    {
LABEL_6:
      *a3 = v3;
      return result;
    }
    unint64_t v4 = v3 ^ 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v5 = a2 - 1;
    while (v4 > v5)
    {
      ++v3;
      if (!--a2) {
        goto LABEL_6;
      }
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1C7BE8E8C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t result = sub_1C7BE9E60(*a1, a2, *a3);
  *(void *)a4 = result;
  *(unsigned char *)(a4 + 8) = v6 & 1;
  return result;
}

uint64_t *sub_1C7BE8EC4(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *result;
  uint64_t v3 = *a2;
  if (*a2 < *result)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (*a2 == *result) {
    return 0;
  }
  unint64_t v4 = (uint64_t *)(v3 - v2);
  if (v3 > v2)
  {
    uint64_t result = 0;
    unint64_t v5 = v3 + ~v2;
    while (v5 <= 0x7FFFFFFFFFFFFFFELL)
    {
      uint64_t result = (uint64_t *)((char *)result + 1);
      if (v4 == result) {
        return result;
      }
    }
    __break(1u);
    goto LABEL_10;
  }
LABEL_11:
  __break(1u);
  return result;
}

uint64_t *sub_1C7BE8F1C(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *result;
  uint64_t v3 = a2[1];
  if (*result >= *a2)
  {
    BOOL v5 = __OFSUB__(v2, v3);
    BOOL v4 = v2 - v3 < 0;
  }
  else
  {
    BOOL v5 = 0;
    BOOL v4 = 0;
  }
  if (v4 == v5) {
    __break(1u);
  }
  return result;
}

void *sub_1C7BE8F38(void *result, void *a2)
{
  if (*result < *a2 || a2[1] < *result) {
    __break(1u);
  }
  return result;
}

void *sub_1C7BE8F54(void *result, void *a2)
{
  if (*result < *a2 || a2[1] < result[1]) {
    __break(1u);
  }
  return result;
}

void *sub_1C7BE8F70@<X0>(void *result@<X0>, void *a2@<X8>)
{
  if (__OFADD__(*result, 1)) {
    __break(1u);
  }
  else {
    *a2 = *result + 1;
  }
  return result;
}

void *sub_1C7BE8F88(void *result)
{
  if (__OFADD__(*result, 1)) {
    __break(1u);
  }
  else {
    ++*result;
  }
  return result;
}

void sub_1C7BE8FA0(void *a1@<X8>)
{
  *a1 = *v1;
  a1[1] = 0;
}

uint64_t sub_1C7BE8FAC()
{
  return *(void *)(*(void *)v0 + 16);
}

uint64_t sub_1C7BE8FB8()
{
  return 2;
}

void *sub_1C7BE8FC0()
{
  uint64_t v1 = sub_1C7BE99E4(*v0);
  swift_bridgeObjectRelease();
  return v1;
}

void *sub_1C7BE8FF8(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_1C7BE9AAC(a1, a2, a3, *v3);
}

uint64_t sub_1C7BE9000()
{
  return sub_1C7BF4220();
}

uint64_t sub_1C7BE9024()
{
  return 1;
}

uint64_t sub_1C7BE902C()
{
  return sub_1C7BF4420();
}

uint64_t sub_1C7BE9070()
{
  return sub_1C7BF4410();
}

uint64_t sub_1C7BE9098()
{
  return sub_1C7BF4420();
}

uint64_t sub_1C7BE90E8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1C7BE9414(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_1C7BE9108(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1C7BE95AC(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_1C7BE9128(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1C7BE96FC(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_1C7BE9148(uint64_t result, unint64_t a2, char a3)
{
  if (a3 == 3) {
    return sub_1C7BE916C(result, a2);
  }
  if (a3 == 2) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_1C7BE916C(uint64_t a1, unint64_t a2)
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

uint64_t sub_1C7BE91C4(uint64_t result, unint64_t a2, char a3)
{
  if (a3 == 3) {
    return sub_1C7BE91E8(result, a2);
  }
  if (a3 == 2) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1C7BE91E8(uint64_t a1, unint64_t a2)
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

uint64_t sub_1C7BE9240(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1C7BE9868(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

unint64_t sub_1C7BE9264()
{
  unint64_t result = qword_1EA4FE378;
  if (!qword_1EA4FE378)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4FE378);
  }
  return result;
}

uint64_t sub_1C7BE92B8()
{
  return MEMORY[0x1E4FBB568];
}

uint64_t sub_1C7BE92C4()
{
  return sub_1C7BE93C0(&qword_1EA4FE380, &qword_1EA4FE388);
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

uint64_t sub_1C7BE9348()
{
  return sub_1C7BE93C0(&qword_1EA4FE390, &qword_1EA4FE398);
}

uint64_t sub_1C7BE9384()
{
  return sub_1C7BE93C0(&qword_1EA4FE3A0, &qword_1EA4FE3A8);
}

uint64_t sub_1C7BE93C0(unint64_t *a1, uint64_t *a2)
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

ValueMetadata *type metadata accessor for SQLResult()
{
  return &type metadata for SQLResult;
}

uint64_t sub_1C7BE9414(char a1, int64_t a2, char a3, void *a4)
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC68AA0);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 4;
  unint64_t v13 = a4 + 4;
  size_t v14 = 5 * v8;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v14]) {
      memmove(v10 + 4, a4 + 4, v14 * 8);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v14] || v12 >= &v13[v14])
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC68D08);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_1C7BF4370();
  __break(1u);
  return result;
}

uint64_t sub_1C7BE95AC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC68AA8);
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
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_1C7BF4370();
  __break(1u);
  return result;
}

uint64_t sub_1C7BE96FC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC68D40);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  unint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
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
  uint64_t result = sub_1C7BF4370();
  __break(1u);
  return result;
}

uint64_t sub_1C7BE9868(char a1, int64_t a2, char a3, char *a4)
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4FE3B0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
  size_t v14 = 24 * v8;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v14]) {
      memmove(v12, v13, v14);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v14] || v12 >= &v13[v14])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_1C7BF4370();
  __break(1u);
  return result;
}

void *sub_1C7BE99E4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4FE3B0);
  uint64_t v3 = (void *)swift_allocObject();
  size_t v4 = _swift_stdlib_malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 24);
  swift_bridgeObjectRetain();
  BOOL v5 = sub_1C7BE9AAC(&v7, (uint64_t)(v3 + 4), v1, a1);
  swift_bridgeObjectRelease();
  if (v5 != (void *)v1)
  {
    __break(1u);
    return (void *)MEMORY[0x1E4FBC860];
  }
  return v3;
}

void *sub_1C7BE9AAC(void *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a2)
  {
LABEL_11:
    uint64_t v5 = 0;
    goto LABEL_12;
  }
  uint64_t v5 = a3;
  if (!a3)
  {
LABEL_12:
    *uint64_t result = a4;
    result[1] = v5;
    return (void *)v5;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    unint64_t v6 = *(void *)(a4 + 16);
    if (v6)
    {
      uint64_t v7 = a2;
      size_t v14 = result;
      uint64_t v8 = (char *)(a4 + 64);
      uint64_t v9 = -(uint64_t)v6;
      uint64_t v10 = 1;
      while (v10 - 1 < v6)
      {
        uint64_t v11 = *((void *)v8 - 2);
        unint64_t v12 = *((void *)v8 - 1);
        char v13 = *v8;
        swift_bridgeObjectRetain();
        sub_1C7BE9148(v11, v12, v13);
        uint64_t result = (void *)swift_bridgeObjectRelease();
        *(void *)uint64_t v7 = v11;
        *(void *)(v7 + 8) = v12;
        *(unsigned char *)(v7 + 16) = v13;
        if (v5 == v10)
        {
          uint64_t result = v14;
          goto LABEL_12;
        }
        unint64_t v6 = *(void *)(a4 + 16);
        if (v10 == v6)
        {
          uint64_t v5 = v10;
          uint64_t result = v14;
          goto LABEL_12;
        }
        ++v10;
        v7 += 24;
        v8 += 40;
        if (v9 + v10 == 1)
        {
          __break(1u);
          goto LABEL_11;
        }
      }
      __break(1u);
      goto LABEL_16;
    }
    goto LABEL_11;
  }
LABEL_16:
  __break(1u);
  return result;
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

uint64_t sub_1C7BE9C00(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x1E4FBC860];
  if (v1)
  {
    uint64_t v20 = MEMORY[0x1E4FBC860];
    sub_1C7BE90E8(0, v1, 0);
    for (uint64_t i = a1 + 32; ; i += 48)
    {
      sub_1C7BE9FF4(i, (uint64_t)v18);
      uint64_t v5 = v18[0];
      uint64_t v6 = v18[1];
      sub_1C7BE9F48((uint64_t)v19, (uint64_t)v15);
      SQLValue.init(_:)((uint64_t)v15, (uint64_t)&v16);
      unsigned __int8 v7 = v17;
      if (v17 == 255) {
        break;
      }
      long long v14 = v16;
      sub_1C7BE9F48((uint64_t)v19, (uint64_t)v15);
      swift_bridgeObjectRetain();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v15);
      sub_1C7BEA0B0((uint64_t)v18, &qword_1EBC68D10);
      uint64_t v2 = v20;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1C7BE90E8(0, *(void *)(v2 + 16) + 1, 1);
        uint64_t v2 = v20;
      }
      unint64_t v9 = *(void *)(v2 + 16);
      unint64_t v8 = *(void *)(v2 + 24);
      if (v9 >= v8 >> 1)
      {
        sub_1C7BE90E8(v8 > 1, v9 + 1, 1);
        uint64_t v2 = v20;
      }
      *(void *)(v2 + 16) = v9 + 1;
      uint64_t v10 = v2 + 40 * v9;
      *(void *)(v10 + 32) = v5;
      *(void *)(v10 + 40) = v6;
      *(_OWORD *)(v10 + 48) = v14;
      *(unsigned char *)(v10 + 64) = v7;
      if (!--v1) {
        return v2;
      }
    }
    sub_1C7BE9F48((uint64_t)v19, (uint64_t)v15);
    *(void *)&long long v16 = 0;
    *((void *)&v16 + 1) = 0xE000000000000000;
    sub_1C7BF42E0();
    swift_bridgeObjectRelease();
    *(void *)&long long v16 = 0xD00000000000002ELL;
    *((void *)&v16 + 1) = 0x80000001C7BF50B0;
    sub_1C7BF4430();
    _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
    swift_bridgeObjectRelease();
    uint64_t v2 = *((void *)&v16 + 1);
    uint64_t v11 = v16;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v15);
    sub_1C7BEA05C();
    swift_allocError();
    *unint64_t v12 = v11;
    v12[1] = v2;
    swift_willThrow();
    sub_1C7BEA0B0((uint64_t)v18, &qword_1EBC68D10);
    swift_release();
  }
  return v2;
}

uint64_t sub_1C7BE9E60(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2 < 0)
  {
LABEL_21:
    __break(1u);
    return result;
  }
  if (a2)
  {
    unint64_t v3 = a3 - result;
    if (a3 - result >= (unint64_t)(a2 - 1)) {
      unint64_t v3 = a2 - 1;
    }
    if (v3 >= (result ^ 0x7FFFFFFFFFFFFFFFuLL)) {
      unint64_t v3 = result ^ 0x7FFFFFFFFFFFFFFFLL;
    }
    unint64_t v4 = v3 + 1;
    if (v4 >= 5)
    {
      uint64_t v7 = v4 & 3;
      if ((v4 & 3) == 0) {
        uint64_t v7 = 4;
      }
      unint64_t v5 = v4 - v7;
      int64x2_t v8 = 0uLL;
      int64x2_t v9 = (int64x2_t)(unint64_t)result;
      int64x2_t v10 = vdupq_n_s64(1uLL);
      unint64_t v11 = v5;
      do
      {
        int64x2_t v8 = vaddq_s64(v8, v10);
        int64x2_t v9 = vaddq_s64(v9, v10);
        v11 -= 4;
      }
      while (v11);
      uint64_t v6 = vaddvq_s64(vaddq_s64(vzip2q_s64(v9, v8), vzip1q_s64(v9, v8)));
    }
    else
    {
      unint64_t v5 = 0;
      uint64_t v6 = result;
    }
    uint64_t v12 = v5 + result - 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v13 = v5 + result - a3;
    uint64_t v14 = a2 - v5;
    uint64_t result = v6;
    while (1)
    {
      if (!v13) {
        return 0;
      }
      if (!v12) {
        break;
      }
      ++result;
      ++v12;
      ++v13;
      if (!--v14) {
        return result;
      }
    }
    __break(1u);
    goto LABEL_21;
  }
  return result;
}

_OWORD *sub_1C7BE9F38(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1C7BE9F48(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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

uint64_t sub_1C7BE9FF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC68D10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_1C7BEA05C()
{
  unint64_t result = qword_1EA4FE3B8;
  if (!qword_1EA4FE3B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4FE3B8);
  }
  return result;
}

uint64_t sub_1C7BEA0B0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void *initializeBufferWithCopyOfBuffer for SQLResultError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for SQLResultError()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for SQLResultError(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for SQLResultError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SQLResultError(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SQLResultError(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for SQLResultError()
{
  return &type metadata for SQLResultError;
}

uint64_t getEnumTagSinglePayload for SQLResultError.Code(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for SQLResultError.Code(unsigned char *result, int a2, int a3)
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
        *__n128 result = a2;
        return result;
      case 2:
        *(_WORD *)__n128 result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)__n128 result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *__n128 result = 0;
      break;
    case 2:
      *(_WORD *)__n128 result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x1C7BEA350);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1C7BEA378()
{
  return 0;
}

ValueMetadata *type metadata accessor for SQLResultError.Code()
{
  return &type metadata for SQLResultError.Code;
}

unint64_t sub_1C7BEA398()
{
  unint64_t result = qword_1EA4FE3C0;
  if (!qword_1EA4FE3C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4FE3C0);
  }
  return result;
}

uint64_t SQLValue.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_1C7BE9F48(a1, (uint64_t)v23);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC68CF8);
  if (!swift_dynamicCast())
  {
    sub_1C7BEB2D4(0, &qword_1EBC68A80);
    if (swift_dynamicCast())
    {
      id v5 = v15[0];
      BOOL v6 = sub_1C7BEAAF4();

      if (v6)
      {
        objc_msgSend(v5, sel_doubleValue);
        uint64_t v21 = MEMORY[0x1E4FBB3D0];
        long long v22 = &protocol witness table for Double;
        *(void *)&long long v20 = v7;
LABEL_14:
        SQLValue.init(_:)((uint64_t)&v20, (uint64_t)&v18);

        __swift_destroy_boxed_opaque_existential_0(a1);
        long long v14 = v18;
        char v4 = v19;
        goto LABEL_15;
      }
      if (sub_1C7BEAC40())
      {
        id v8 = objc_msgSend(v5, sel_longLongValue);
        uint64_t v21 = MEMORY[0x1E4FBC1C8];
        long long v22 = &protocol witness table for Int64;
        *(void *)&long long v20 = v8;
        goto LABEL_14;
      }
    }
    sub_1C7BEB2D4(0, &qword_1EBC68A88);
    if (swift_dynamicCast())
    {
      id v5 = v15[0];
      uint64_t v9 = sub_1C7BF41C0();
      uint64_t v11 = MEMORY[0x1E4FBB1A0];
      uint64_t v12 = &protocol witness table for String;
    }
    else
    {
      sub_1C7BEB2D4(0, &qword_1EBC68A78);
      if (!swift_dynamicCast())
      {
        __swift_destroy_boxed_opaque_existential_0(a1);
        uint64_t result = __swift_destroy_boxed_opaque_existential_0((uint64_t)v23);
        *(void *)a2 = 0;
        *(void *)(a2 + 8) = 0;
        *(unsigned char *)(a2 + 16) = -1;
        return result;
      }
      id v5 = v15[0];
      uint64_t v9 = sub_1C7BEACF4(v5);
      uint64_t v11 = MEMORY[0x1E4F277C0];
      uint64_t v12 = &protocol witness table for Data;
    }
    uint64_t v21 = v11;
    long long v22 = v12;
    *(void *)&long long v20 = v9;
    *((void *)&v20 + 1) = v10;
    goto LABEL_14;
  }
  sub_1C7BECD90(&v20, (uint64_t)&v18);
  sub_1C7BEB124((uint64_t)&v18, (uint64_t)v15);
  SQLValue.init(_:)((uint64_t)v15, (uint64_t)&v16);
  __swift_destroy_boxed_opaque_existential_0(a1);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v18);
  long long v14 = v16;
  char v4 = v17;
LABEL_15:
  uint64_t result = __swift_destroy_boxed_opaque_existential_0((uint64_t)v23);
  *(_OWORD *)a2 = v14;
  *(unsigned char *)(a2 + 16) = v4;
  return result;
}

{
  void *v4;
  uint64_t v5;
  char v6;
  uint64_t result;
  void *v8;
  uint64_t v9;
  unsigned char v10[40];

  sub_1C7BEB124(a1, (uint64_t)v10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC68CF8);
  sub_1C7BEB2D4(0, (unint64_t *)&qword_1EBC68D20);
  if (swift_dynamicCast())
  {
    __swift_destroy_boxed_opaque_existential_0(a1);

    char v4 = 0;
    id v5 = 0;
    BOOL v6 = 4;
LABEL_11:
    uint64_t result = __swift_destroy_boxed_opaque_existential_0((uint64_t)v10);
    *(void *)a2 = v4;
    *(void *)(a2 + 8) = v5;
    *(unsigned char *)(a2 + 16) = v6;
    return result;
  }
  if (swift_dynamicCast())
  {
    __swift_destroy_boxed_opaque_existential_0(a1);
    id v5 = 0;
    BOOL v6 = 0;
    char v4 = v8;
    goto LABEL_11;
  }
  if (swift_dynamicCast())
  {
    __swift_destroy_boxed_opaque_existential_0(a1);
    id v5 = 0;
    char v4 = v8;
    BOOL v6 = 1;
    goto LABEL_11;
  }
  if (swift_dynamicCast())
  {
    __swift_destroy_boxed_opaque_existential_0(a1);
    char v4 = v8;
    id v5 = v9;
    BOOL v6 = 2;
    goto LABEL_11;
  }
  if (swift_dynamicCast())
  {
    __swift_destroy_boxed_opaque_existential_0(a1);
    char v4 = v8;
    id v5 = v9;
    BOOL v6 = 3;
    goto LABEL_11;
  }
  uint64_t result = sub_1C7BF4330();
  __break(1u);
  return result;
}

uint64_t SQLValue.unbox<A>()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_1C7BF4290();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790]();
  id v8 = &v19[-v7];
  uint64_t v9 = *(void *)v2;
  unint64_t v10 = *(void *)(v2 + 8);
  switch(*(unsigned char *)(v2 + 16))
  {
    case 1:
      uint64_t v11 = MEMORY[0x1E4FBB3D0];
      uint64_t v12 = &protocol witness table for Double;
      goto LABEL_4;
    case 2:
      uint64_t v21 = MEMORY[0x1E4FBB1A0];
      long long v22 = &protocol witness table for String;
      *(void *)&long long v20 = v9;
      *((void *)&v20 + 1) = v10;
      swift_bridgeObjectRetain();
      break;
    case 3:
      uint64_t v21 = MEMORY[0x1E4F277C0];
      long long v22 = &protocol witness table for Data;
      *(void *)&long long v20 = v9;
      *((void *)&v20 + 1) = v10;
      sub_1C7BE916C(v9, v10);
      break;
    case 4:
      id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1CA98]), sel_init);
      uint64_t v21 = sub_1C7BEB2D4(0, (unint64_t *)&qword_1EBC68D20);
      long long v22 = &protocol witness table for NSNull;
      *(void *)&long long v20 = v13;
      break;
    default:
      uint64_t v11 = MEMORY[0x1E4FBC1C8];
      uint64_t v12 = &protocol witness table for Int64;
LABEL_4:
      uint64_t v21 = v11;
      long long v22 = v12;
      *(void *)&long long v20 = v9;
      break;
  }
  sub_1C7BECD90(&v20, (uint64_t)v19);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC68CF8);
  int v14 = swift_dynamicCast();
  BOOL v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 - 8) + 56);
  if (v14)
  {
    uint64_t v16 = *(void *)(a1 - 8);
    v15((uint64_t)v8, 0, 1, a1);
    (*(void (**)(uint64_t, unsigned char *, uint64_t))(v16 + 32))(a2, v8, a1);
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v17 = 1;
    v15((uint64_t)v8, 1, 1, a1);
    (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return v15(a2, v17, 1, a1);
}

BOOL sub_1C7BEAAF4()
{
  objc_msgSend(v0, sel_objCType);
  uint64_t v1 = sub_1C7BF4200();
  uint64_t v3 = sub_1C7BF1A4C(v1, v2);
  swift_bridgeObjectRelease();
  uint64_t v13 = MEMORY[0x1E4FBC860];
  sub_1C7BE9108(0, 2, 0);
  uint64_t v4 = v13;
  unint64_t v6 = *(void *)(v13 + 16);
  unint64_t v5 = *(void *)(v13 + 24);
  int64_t v7 = v5 >> 1;
  unint64_t v8 = v6 + 1;
  if (v5 >> 1 <= v6)
  {
    sub_1C7BE9108(v5 > 1, v6 + 1, 1);
    uint64_t v4 = v13;
    unint64_t v5 = *(void *)(v13 + 24);
    int64_t v7 = v5 >> 1;
  }
  *(void *)(v4 + 16) = v8;
  *(unsigned char *)(v4 + v6 + 32) = 102;
  int64_t v9 = v6 + 2;
  if (v7 < v9)
  {
    sub_1C7BE9108(v5 > 1, v9, 1);
    uint64_t v4 = v13;
  }
  *(void *)(v4 + 16) = v9;
  *(unsigned char *)(v4 + v8 + 32) = 100;
  if (*(void *)(v3 + 16) == 1)
  {
    uint64_t v10 = *(unsigned __int8 *)(v3 + 32);
    swift_release();
    BOOL v11 = sub_1C7BEB8D0(v10, v4);
  }
  else
  {
    swift_release();
    BOOL v11 = 0;
  }
  swift_release();
  return v11;
}

BOOL sub_1C7BEAC40()
{
  id v1 = v0;
  objc_msgSend(v1, sel_objCType);
  uint64_t v2 = sub_1C7BF4200();
  uint64_t v4 = sub_1C7BF1A4C(v2, v3);
  swift_bridgeObjectRelease();
  if (*(void *)(v4 + 16) != 1)
  {
    swift_release();
    return 1;
  }
  int v5 = *(unsigned __int8 *)(v4 + 32);
  swift_release();
  if (v5 != 81) {
    return 1;
  }
  id v6 = objc_msgSend(v1, sel_longLongValue);
  id v7 = objc_msgSend(v1, sel_unsignedLongLongValue);
  return (uint64_t)v6 >= 0 && v6 == v7;
}

uint64_t sub_1C7BEACF4(void *a1)
{
  v36[5] = *MEMORY[0x1E4F143B8];
  *(void *)&long long v33 = a1;
  sub_1C7BEB2D4(0, &qword_1EBC68A78);
  id v2 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC68AB0);
  if (swift_dynamicCast())
  {
    sub_1C7BECD90(v34, (uint64_t)v36);
    __swift_project_boxed_opaque_existential_1(v36, v36[3]);
    sub_1C7BF40B0();

    v34[0] = v33;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v36);
    return *(void *)&v34[0];
  }
  uint64_t v35 = 0;
  memset(v34, 0, sizeof(v34));
  sub_1C7BECCC4((uint64_t)v34);
  uint64_t v3 = sub_1C7BF4260();
  uint64_t v4 = sub_1C7BF4270();
  uint64_t v5 = sub_1C7BF4260();
  uint64_t v6 = sub_1C7BF4270();
  if (v3 < v5 || v6 < v3) {
    goto LABEL_39;
  }
  uint64_t v7 = sub_1C7BF4260();
  uint64_t v8 = sub_1C7BF4270();
  if (v4 < v7 || v8 < v4) {
    goto LABEL_40;
  }
  if (__OFSUB__(v4, v3))
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  *(void *)&v34[0] = sub_1C7BEC400(v4 - v3);
  *((void *)&v34[0] + 1) = v9;
  MEMORY[0x1F4188790](*(void *)&v34[0]);
  uint64_t v10 = sub_1C7BEB930((void *(*)(uint64_t *__return_ptr, char *, char *))sub_1C7BECD24);
  unsigned __int8 v13 = BYTE14(v34[0]);
  uint64_t v14 = *((void *)&v34[0] + 1) >> 62;
  BOOL v15 = v10;
  uint64_t v16 = v11;
  switch(*((void *)&v34[0] + 1) >> 62)
  {
    case 1:
      LODWORD(v17) = DWORD1(v34[0]) - LODWORD(v34[0]);
      if (__OFSUB__(DWORD1(v34[0]), v34[0])) {
        goto LABEL_43;
      }
      uint64_t v17 = (int)v17;
LABEL_13:
      if (v12 != v17)
      {
        if (v14)
        {
          if (v14 == 1) {
            uint64_t v21 = *(uint64_t *)&v34[0] >> 32;
          }
          else {
            uint64_t v21 = *(void *)(*(void *)&v34[0] + 24);
          }
LABEL_33:
          if (v21 >= v12)
          {
            sub_1C7BF4120();
            goto LABEL_35;
          }
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
LABEL_44:
          __break(1u);
        }
LABEL_31:
        uint64_t v21 = v13;
        goto LABEL_33;
      }
LABEL_19:
      memset(v36, 0, 15);
      if (v11 == sub_1C7BF4270()) {
        goto LABEL_35;
      }
      char v22 = sub_1C7BF4280();
      BOOL v15 = v15;
      uint64_t v23 = sub_1C7BF4260();
      uint64_t v24 = sub_1C7BF4270();

      if (v16 < v23 || v16 >= v24)
      {
LABEL_30:
        __break(1u);
        goto LABEL_31;
      }
      LOBYTE(v25) = 0;
      uint64_t v26 = v16 + 1;
      break;
    case 2:
      uint64_t v19 = *(void *)(*(void *)&v34[0] + 16);
      uint64_t v18 = *(void *)(*(void *)&v34[0] + 24);
      BOOL v20 = __OFSUB__(v18, v19);
      uint64_t v17 = v18 - v19;
      if (!v20) {
        goto LABEL_13;
      }
      goto LABEL_44;
    case 3:
      if (!v12) {
        goto LABEL_19;
      }
      uint64_t v21 = 0;
      goto LABEL_33;
    default:
      uint64_t v17 = BYTE14(v34[0]);
      goto LABEL_13;
  }
  while (1)
  {
    *((unsigned char *)v36 + v25) = v22;
    unsigned int v25 = v25 + 1;
    if ((v25 >> 8))
    {
      __break(1u);
LABEL_39:
      __break(1u);
LABEL_40:
      __break(1u);
      goto LABEL_41;
    }
    if (v25 == 14)
    {
      sub_1C7BF4130();
      if (v26 == sub_1C7BF4270()) {
        goto LABEL_35;
      }
      LOBYTE(v25) = 0;
      goto LABEL_28;
    }
    if (v26 == sub_1C7BF4270()) {
      break;
    }
LABEL_28:
    char v22 = sub_1C7BF4280();
    long long v27 = v15;
    uint64_t v28 = sub_1C7BF4260();
    uint64_t v29 = sub_1C7BF4270();

    if (v26 >= v28 && v26++ < v29) {
      continue;
    }
    goto LABEL_30;
  }
  sub_1C7BF4130();
LABEL_35:

  return *(void *)&v34[0];
}

uint64_t sub_1C7BEB124(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t SQLValue.unboxedValue()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = *(void *)v1;
  unint64_t v3 = *(void *)(v1 + 8);
  switch(*(unsigned char *)(v1 + 16))
  {
    case 1:
      uint64_t v5 = MEMORY[0x1E4FBB3D0];
      uint64_t v6 = &protocol witness table for Double;
      goto LABEL_4;
    case 2:
      a1[3] = MEMORY[0x1E4FBB1A0];
      a1[4] = (uint64_t)&protocol witness table for String;
      *a1 = result;
      a1[1] = v3;
      uint64_t result = swift_bridgeObjectRetain();
      break;
    case 3:
      a1[3] = MEMORY[0x1E4F277C0];
      a1[4] = (uint64_t)&protocol witness table for Data;
      *a1 = result;
      a1[1] = v3;
      uint64_t result = sub_1C7BE916C(result, v3);
      break;
    case 4:
      id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1CA98]), sel_init);
      uint64_t result = sub_1C7BEB2D4(0, (unint64_t *)&qword_1EBC68D20);
      a1[3] = result;
      a1[4] = (uint64_t)&protocol witness table for NSNull;
      *a1 = (uint64_t)v7;
      break;
    default:
      uint64_t v5 = MEMORY[0x1E4FBC1C8];
      uint64_t v6 = &protocol witness table for Int64;
LABEL_4:
      a1[3] = v5;
      a1[4] = (uint64_t)v6;
      *a1 = result;
      break;
  }
  return result;
}

uint64_t sub_1C7BEB2D4(uint64_t a1, unint64_t *a2)
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

uint64_t SQLValue.contains<A>(_:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v49 = a4;
  v54 = a1;
  uint64_t v6 = *(void *)(a2 - 8);
  ((void (*)(void))MEMORY[0x1F4188790])();
  v48 = (char *)&v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1C7BF4290();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v52 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v10 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  uint64_t v12 = (char *)&v45 - v11;
  uint64_t v13 = v8;
  uint64_t v55 = *(void *)(v8 - 8);
  uint64_t v14 = v55;
  uint64_t v15 = MEMORY[0x1F4188790](v10);
  uint64_t v16 = MEMORY[0x1F4188790](v15);
  uint64_t v18 = (char *)&v45 - v17;
  MEMORY[0x1F4188790](v16);
  BOOL v20 = (char *)&v45 - v19;
  uint64_t v21 = *(void *)v4;
  unint64_t v22 = *(void *)(v4 + 8);
  uint64_t v23 = *(unsigned __int8 *)(v4 + 16);
  v51 = v24;
  switch(v23)
  {
    case 1:
      uint64_t v25 = MEMORY[0x1E4FBB3D0];
      uint64_t v26 = &protocol witness table for Double;
      goto LABEL_4;
    case 2:
      uint64_t v58 = MEMORY[0x1E4FBB1A0];
      v59 = &protocol witness table for String;
      uint64_t v56 = v21;
      unint64_t v57 = v22;
      swift_bridgeObjectRetain();
      break;
    case 3:
      uint64_t v58 = MEMORY[0x1E4F277C0];
      v59 = &protocol witness table for Data;
      uint64_t v56 = v21;
      unint64_t v57 = v22;
      sub_1C7BE916C(v21, v22);
      break;
    case 4:
      id v27 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1CA98]), sel_init);
      uint64_t v58 = sub_1C7BEB2D4(0, (unint64_t *)&qword_1EBC68D20);
      v59 = &protocol witness table for NSNull;
      uint64_t v56 = (uint64_t)v27;
      break;
    default:
      uint64_t v25 = MEMORY[0x1E4FBC1C8];
      uint64_t v26 = &protocol witness table for Int64;
LABEL_4:
      uint64_t v58 = v25;
      v59 = v26;
      uint64_t v56 = v21;
      break;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC68CF8);
  int v28 = swift_dynamicCast();
  uint64_t v29 = *(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56);
  v29(v20, v28 ^ 1u, 1, a2);
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v18, v54, a2);
  v29(v18, 0, 1, a2);
  uint64_t v53 = TupleTypeMetadata2;
  v54 = v20;
  v30 = &v12[*(int *)(TupleTypeMetadata2 + 48)];
  uint64_t v31 = a2;
  uint64_t v32 = v14;
  long long v33 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
  v33(v12, v20, v13);
  v33(v30, v18, v13);
  uint64_t v50 = v6;
  v34 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48);
  if (v34(v12, 1, v31) == 1)
  {
    uint64_t v35 = *(void (**)(char *, uint64_t))(v32 + 8);
    v35(v18, v13);
    if (v34(v30, 1, v31) == 1)
    {
      v35(v12, v13);
      char v36 = 1;
LABEL_15:
      v39 = v54;
      goto LABEL_16;
    }
  }
  else
  {
    v46 = v18;
    uint64_t v47 = v32;
    v37 = v51;
    v33(v51, v12, v13);
    uint64_t v38 = v31;
    if (v34(v30, 1, v31) != 1)
    {
      uint64_t v40 = v50;
      v41 = v37;
      v42 = v48;
      (*(void (**)(char *, char *, uint64_t))(v50 + 32))(v48, v30, v31);
      char v36 = sub_1C7BF4190();
      v43 = *(void (**)(char *, uint64_t))(v40 + 8);
      v43(v42, v38);
      uint64_t v35 = *(void (**)(char *, uint64_t))(v47 + 8);
      v35(v46, v13);
      v43(v41, v38);
      v35(v12, v13);
      goto LABEL_15;
    }
    uint64_t v35 = *(void (**)(char *, uint64_t))(v47 + 8);
    v35(v46, v13);
    (*(void (**)(char *, uint64_t))(v50 + 8))(v37, v31);
  }
  v39 = v54;
  (*(void (**)(char *, uint64_t))(v52 + 8))(v12, v53);
  char v36 = 0;
LABEL_16:
  v35(v39, v13);
  return v36 & 1;
}

BOOL sub_1C7BEB8D0(BOOL result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  int v3 = result;
  if (*(unsigned char *)(a2 + 32) == result) {
    return 1;
  }
  if (v2 == 1) {
    return 0;
  }
  for (uint64_t i = 33; ; ++i)
  {
    uint64_t v5 = i - 31;
    if (__OFADD__(i - 32, 1)) {
      break;
    }
    int v6 = *(unsigned __int8 *)(a2 + i);
    uint64_t result = v6 == v3;
    if (v6 == v3 || v5 == v2) {
      return result;
    }
  }
  __break(1u);
  return result;
}

char *sub_1C7BEB930(void *(*a1)(uint64_t *__return_ptr, char *, char *))
{
  v16[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *v1;
  unint64_t v3 = v1[1];
  uint64_t v5 = v1;
  switch(v3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      *(_OWORD *)uint64_t v1 = xmmword_1C7BF4BD0;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v11 = v4 >> 32;
      if (isUniquelyReferenced_nonNull_native) {
        goto LABEL_16;
      }
      if (v11 < (int)v4) {
        goto LABEL_23;
      }
      if (sub_1C7BF4060() && __OFSUB__((int)v4, sub_1C7BF4090())) {
        goto LABEL_24;
      }
      sub_1C7BF40A0();
      swift_allocObject();
      uint64_t v13 = sub_1C7BF4040();
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
      uint64_t result = sub_1C7BEBD18((int)v4, v11, a1);
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
      sub_1C7BF4100();
      uint64_t result = sub_1C7BEBD18(*(void *)(v14 + 16), *(void *)(v14 + 24), a1);
      unint64_t v12 = v15 | 0x8000000000000000;
      if (v2)
      {
        *uint64_t v1 = v14;
LABEL_19:
        v5[1] = v12;
      }
      else
      {
        *uint64_t v1 = v14;
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
      *uint64_t v1 = v16[0];
      v1[1] = v8;
      return result;
  }
  return result;
}

unsigned char *sub_1C7BEBC30@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X1>, void *a3@<X8>)
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
    uint64_t result = (unsigned char *)sub_1C7BEC4A0(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    uint64_t result = (unsigned char *)sub_1C7BEC564((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000;
  }
  else
  {
    uint64_t result = (unsigned char *)sub_1C7BEC5E0((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

void *sub_1C7BEBCA8(void *(*a1)(uint64_t *__return_ptr, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
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

char *sub_1C7BEBD18(uint64_t a1, uint64_t a2, void *(*a3)(uint64_t *__return_ptr, char *, char *))
{
  uint64_t result = (char *)sub_1C7BF4060();
  if (!result) {
    goto LABEL_12;
  }
  uint64_t v8 = result;
  uint64_t result = (char *)sub_1C7BF4090();
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
  uint64_t v12 = sub_1C7BF4080();
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

uint64_t sub_1C7BEBDCC@<X0>(uint64_t __s1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, char *a4@<X8>)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (const void *)__s1;
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = (a2 >> 32) - (int)a2;
      if (a2 >> 32 < (int)a2)
      {
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
      sub_1C7BE916C(a2, a3);
      BOOL v10 = (char *)sub_1C7BF4060();
      if (!v10) {
        goto LABEL_8;
      }
      uint64_t v11 = sub_1C7BF4090();
      if (__OFSUB__((int)a2, v11)) {
LABEL_33:
      }
        __break(1u);
      v10 += (int)a2 - v11;
LABEL_8:
      uint64_t v12 = sub_1C7BF4080();
      if (v12 >= v9) {
        size_t v13 = (a2 >> 32) - (int)a2;
      }
      else {
        size_t v13 = v12;
      }
      if (!v7)
      {
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        JUMPOUT(0x1C7BEC030);
      }
      if (!v10) {
        goto LABEL_36;
      }
      int v14 = memcmp(v7, v10, v13);
      __s1 = sub_1C7BE91E8(a2, a3);
      BOOL v8 = v14 == 0;
LABEL_24:
      char v24 = v8;
LABEL_29:
      *a4 = v24;
      return __s1;
    case 2uLL:
      uint64_t v15 = *(void *)(a2 + 16);
      uint64_t v16 = *(void *)(a2 + 24);
      swift_retain();
      swift_retain();
      uint64_t v17 = (char *)sub_1C7BF4060();
      if (!v17) {
        goto LABEL_17;
      }
      uint64_t v18 = sub_1C7BF4090();
      if (__OFSUB__(v15, v18)) {
        goto LABEL_32;
      }
      v17 += v15 - v18;
LABEL_17:
      BOOL v19 = __OFSUB__(v16, v15);
      int64_t v20 = v16 - v15;
      if (v19) {
        goto LABEL_31;
      }
      uint64_t v21 = sub_1C7BF4080();
      if (v21 >= v20) {
        size_t v22 = v20;
      }
      else {
        size_t v22 = v21;
      }
      if (!v7) {
        goto LABEL_37;
      }
      if (!v17) {
        goto LABEL_38;
      }
      int v23 = memcmp(v7, v17, v22);
      swift_release();
      __s1 = swift_release();
      BOOL v8 = v23 == 0;
      goto LABEL_24;
    case 3uLL:
      if (!__s1) {
        goto LABEL_39;
      }
      char v24 = 1;
      goto LABEL_29;
    default:
      uint64_t __s2 = a2;
      __int16 v26 = a3;
      char v27 = BYTE2(a3);
      char v28 = BYTE3(a3);
      char v29 = BYTE4(a3);
      char v30 = BYTE5(a3);
      if (__s1)
      {
        __s1 = memcmp((const void *)__s1, &__s2, BYTE6(a3));
        BOOL v8 = __s1 == 0;
        goto LABEL_24;
      }
      __break(1u);
      goto LABEL_35;
  }
}

uint64_t sub_1C7BEC040(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  __s1[2] = *MEMORY[0x1E4F143B8];
  switch(a2 >> 62)
  {
    case 1uLL:
      if (a1 >> 32 < (int)a1) {
        __break(1u);
      }
      sub_1C7BE916C(a1, a2);
      char v5 = sub_1C7BEC664((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, a3, a4);
      sub_1C7BE91E8(a1, a2);
      goto LABEL_6;
    case 2uLL:
      uint64_t v10 = a2 & 0x3FFFFFFFFFFFFFFFLL;
      uint64_t v11 = *(void *)(a1 + 16);
      uint64_t v12 = *(void *)(a1 + 24);
      swift_retain();
      swift_retain();
      char v5 = sub_1C7BEC664(v11, v12, v10, a3, a4);
      swift_release();
      swift_release();
LABEL_6:
      sub_1C7BE91E8(a3, a4);
      return v5 & 1;
    case 3uLL:
      memset(__s1, 0, 14);
      goto LABEL_8;
    default:
      __s1[0] = a1;
      LOWORD(__s1[1]) = a2;
      BYTE2(__s1[1]) = BYTE2(a2);
      BYTE3(__s1[1]) = BYTE3(a2);
      BYTE4(__s1[1]) = BYTE4(a2);
      BYTE5(__s1[1]) = BYTE5(a2);
LABEL_8:
      sub_1C7BEBDCC((uint64_t)__s1, a3, a4, &v14);
      sub_1C7BE91E8(a3, a4);
      if (!v4) {
        char v5 = v14;
      }
      return v5 & 1;
  }
}

void sub_1C7BEC270(void *a1, unsigned char *a2, uint64_t a3)
{
  id v7 = v3;
  uint64_t v8 = sub_1C7BF4260();

  uint64_t v21 = a2;
  if (!a2 || !a3) {
    goto LABEL_5;
  }
  if (a3 < 0)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (v8 == sub_1C7BF4270())
  {
LABEL_5:
    *a1 = v7;
    a1[1] = v8;
    return;
  }
  char v9 = sub_1C7BF4280();
  id v10 = v7;
  uint64_t v11 = sub_1C7BF4260();
  uint64_t v12 = sub_1C7BF4270();

  if (v8 >= v11 && v8 < v12)
  {
    *a2 = v9;
    if (a3 == 1)
    {
      ++v8;
      goto LABEL_5;
    }
    int64_t v20 = a1;
    uint64_t v13 = 1;
    while (a3 != v13)
    {
      uint64_t v14 = v8 + v13;
      if (v8 + v13 == sub_1C7BF4270())
      {
        v8 += v13;
        goto LABEL_18;
      }
      char v15 = sub_1C7BF4280();
      id v16 = v10;
      uint64_t v17 = sub_1C7BF4260();
      uint64_t v18 = sub_1C7BF4270();

      if (v14 < v17 || v14 >= v18) {
        goto LABEL_20;
      }
      uint64_t v19 = v13 + 1;
      v21[v13] = v15;
      uint64_t v13 = v19;
      if (a3 == v19)
      {
        v8 += v19;
LABEL_18:
        a1 = v20;
        goto LABEL_5;
      }
    }
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
LABEL_22:
  __break(1u);
}

uint64_t sub_1C7BEC400(uint64_t result)
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
      sub_1C7BF40A0();
      swift_allocObject();
      sub_1C7BF4070();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_1C7BF4110();
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

uint64_t sub_1C7BEC4A0(unsigned char *__src, unsigned char *a2)
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

uint64_t sub_1C7BEC564(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_1C7BF40A0();
  swift_allocObject();
  uint64_t result = sub_1C7BF4050();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_1C7BF4110();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_1C7BEC5E0(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_1C7BF40A0();
  swift_allocObject();
  uint64_t result = sub_1C7BF4050();
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

uint64_t sub_1C7BEC664(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t result = sub_1C7BF4060();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = sub_1C7BF4090();
    if (__OFSUB__(a1, result))
    {
LABEL_9:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  sub_1C7BF4080();
  sub_1C7BEBDCC(v11, a4, a5, &v13);
  if (!v5) {
    char v12 = v13;
  }
  return v12 & 1;
}

uint64_t _s10SessionSQL8SQLValueO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t *)a1;
  unint64_t v3 = *(void *)(a1 + 8);
  char v4 = *(unsigned char *)(a1 + 16);
  uint64_t v5 = *(uint64_t *)a2;
  unint64_t v6 = *(void *)(a2 + 8);
  int v7 = *(unsigned __int8 *)(a2 + 16);
  switch(v4)
  {
    case 1:
      if (v7 != 1) {
        goto LABEL_24;
      }
      sub_1C7BE91C4(*(void *)a1, v3, 1);
      sub_1C7BE91C4(v5, v6, 1);
      char v8 = *(double *)&v2 == *(double *)&v5;
      break;
    case 2:
      if (v7 != 2)
      {
        swift_bridgeObjectRetain();
        goto LABEL_24;
      }
      if (v2 == v5 && v3 == v6) {
        char v8 = 1;
      }
      else {
        char v8 = sub_1C7BF4390();
      }
      sub_1C7BE9148(v5, v6, 2);
      sub_1C7BE9148(v2, v3, 2);
      sub_1C7BE91C4(v2, v3, 2);
      sub_1C7BE91C4(v5, v6, 2);
      break;
    case 3:
      if (v7 != 3)
      {
        sub_1C7BE916C(*(void *)a1, v3);
        goto LABEL_24;
      }
      uint64_t v10 = 0;
      switch(v3 >> 62)
      {
        case 1uLL:
          LODWORD(v10) = HIDWORD(v2) - v2;
          if (__OFSUB__(HIDWORD(v2), v2))
          {
            __break(1u);
LABEL_46:
            __break(1u);
LABEL_47:
            __break(1u);
LABEL_48:
            __break(1u);
            JUMPOUT(0x1C7BECAC0);
          }
          uint64_t v10 = (int)v10;
LABEL_33:
          switch(v6 >> 62)
          {
            case 1uLL:
              LODWORD(v22) = HIDWORD(v5) - v5;
              if (__OFSUB__(HIDWORD(v5), v5)) {
                goto LABEL_47;
              }
              uint64_t v22 = (int)v22;
LABEL_38:
              if (v10 != v22)
              {
LABEL_43:
                sub_1C7BE9148(*(void *)a2, *(void *)(a2 + 8), 3);
                sub_1C7BE9148(v2, v3, 3);
                sub_1C7BE91C4(v2, v3, 3);
                uint64_t v15 = v5;
                unint64_t v16 = v6;
                char v17 = 3;
                goto LABEL_25;
              }
              if (v10 < 1)
              {
LABEL_44:
                sub_1C7BE9148(*(void *)a2, *(void *)(a2 + 8), 3);
                sub_1C7BE9148(v2, v3, 3);
                sub_1C7BE91C4(v2, v3, 3);
                uint64_t v12 = v5;
                unint64_t v13 = v6;
                char v14 = 3;
                goto LABEL_21;
              }
              sub_1C7BE9148(*(void *)a2, *(void *)(a2 + 8), 3);
              sub_1C7BE9148(v5, v6, 3);
              sub_1C7BE9148(v2, v3, 3);
              char v25 = sub_1C7BEC040(v2, v3, v5, v6);
              sub_1C7BE91C4(v2, v3, 3);
              sub_1C7BE91C4(v5, v6, 3);
              if ((v25 & 1) == 0) {
                goto LABEL_26;
              }
              char v8 = 1;
              break;
            case 2uLL:
              uint64_t v24 = *(void *)(v5 + 16);
              uint64_t v23 = *(void *)(v5 + 24);
              BOOL v21 = __OFSUB__(v23, v24);
              uint64_t v22 = v23 - v24;
              if (!v21) {
                goto LABEL_38;
              }
              goto LABEL_48;
            case 3uLL:
              if (v10) {
                goto LABEL_43;
              }
              goto LABEL_44;
            default:
              uint64_t v22 = BYTE6(v6);
              goto LABEL_38;
          }
          break;
        case 2uLL:
          uint64_t v20 = *(void *)(v2 + 16);
          uint64_t v19 = *(void *)(v2 + 24);
          BOOL v21 = __OFSUB__(v19, v20);
          uint64_t v10 = v19 - v20;
          if (!v21) {
            goto LABEL_33;
          }
          goto LABEL_46;
        case 3uLL:
          goto LABEL_33;
        default:
          uint64_t v10 = BYTE6(v3);
          goto LABEL_33;
      }
      break;
    case 4:
      if (v7 != 4 || (v6 | v5) != 0) {
        goto LABEL_24;
      }
      sub_1C7BE91C4(*(void *)a1, v3, 4);
      uint64_t v12 = 0;
      unint64_t v13 = 0;
      char v14 = 4;
LABEL_21:
      sub_1C7BE91C4(v12, v13, v14);
      char v8 = 1;
      break;
    default:
      if (*(unsigned char *)(a2 + 16))
      {
LABEL_24:
        sub_1C7BE9148(v5, v6, v7);
        sub_1C7BE91C4(v2, v3, v4);
        uint64_t v15 = v5;
        unint64_t v16 = v6;
        char v17 = v7;
LABEL_25:
        sub_1C7BE91C4(v15, v16, v17);
LABEL_26:
        char v8 = 0;
      }
      else
      {
        sub_1C7BE91C4(*(void *)a1, v3, 0);
        sub_1C7BE91C4(v5, v6, 0);
        char v8 = v2 == v5;
      }
      break;
  }
  return v8 & 1;
}

uint64_t sub_1C7BECAF8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_1C7BE9148(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for SQLValue(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_1C7BE9148(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  unint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_1C7BE91C4(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for SQLValue(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  unint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_1C7BE91C4(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for SQLValue(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFC && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 252);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 4) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SQLValue(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 252;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1C7BECC84(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 3u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 4);
  }
}

uint64_t sub_1C7BECC9C(uint64_t result, unsigned int a2)
{
  if (a2 >= 4)
  {
    *(void *)__n128 result = a2 - 4;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 4;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for SQLValue()
{
  return &type metadata for SQLValue;
}

uint64_t sub_1C7BECCC4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC68AB8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_1C7BECD24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v9 = **(void **)(v3 + 16);
  v8[2] = &v9;
  __n128 result = sub_1C7BEBCA8((void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_1C7BECDEC, (uint64_t)v8, a1, a2);
  *a3 = result;
  a3[1] = v6;
  a3[2] = v7;
  return result;
}

uint64_t sub_1C7BECD90(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

void sub_1C7BECDEC(unsigned char *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  id v7 = **(id **)(v3 + 16);
  sub_1C7BEC270(v10, a1, a2);
  uint64_t v8 = v10[1];
  *a3 = v10[0];
  a3[1] = v8;
  a3[2] = v9;
}

unint64_t sub_1C7BECE60(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    long long v2 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC68A98);
  long long v2 = (void *)sub_1C7BF4360();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  int v4 = (char *)(a1 + 64);
  while (1)
  {
    uint64_t v5 = *((void *)v4 - 4);
    uint64_t v6 = *((void *)v4 - 3);
    uint64_t v7 = *((void *)v4 - 2);
    unint64_t v8 = *((void *)v4 - 1);
    char v9 = *v4;
    swift_bridgeObjectRetain();
    sub_1C7BE9148(v7, v8, v9);
    unint64_t result = sub_1C7BF1D7C(v5, v6);
    if (v11) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v12 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v12 = v5;
    v12[1] = v6;
    uint64_t v13 = v2[7] + 24 * result;
    *(void *)uint64_t v13 = v7;
    *(void *)(v13 + 8) = v8;
    *(unsigned char *)(v13 + 16) = v9;
    uint64_t v14 = v2[2];
    BOOL v15 = __OFADD__(v14, 1);
    uint64_t v16 = v14 + 1;
    if (v15) {
      goto LABEL_11;
    }
    v4 += 40;
    v2[2] = v16;
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

SessionSQL::SQLStatement __swiftcall SQLStatement.init(stringLiteral:)(Swift::String stringLiteral)
{
  object = stringLiteral._object;
  uint64_t countAndFlagsBits = stringLiteral._countAndFlagsBits;
  int v4 = v1;
  uint64_t v5 = (void *)sub_1C7BECE60(MEMORY[0x1E4FBC860]);
  *int v4 = v5;
  v4[1] = countAndFlagsBits;
  v4[2] = object;
  result.parameterizedStatement._object = v7;
  result.parameterizedStatement._uint64_t countAndFlagsBits = v6;
  result.bindings._rawValue = v5;
  return result;
}

SessionSQL::SQLStatement __swiftcall SQLStatement.init(stringInterpolation:)(SessionSQL::SQLStatement stringInterpolation)
{
  uint64_t v2 = *(void *)stringInterpolation.bindings._rawValue;
  uint64_t v3 = *((void *)stringInterpolation.bindings._rawValue + 1);
  *unint64_t v1 = *((void *)stringInterpolation.bindings._rawValue + 2);
  v1[1] = v2;
  v1[2] = v3;
  return stringInterpolation;
}

SessionSQL::SQLStatement::StringInterpolation __swiftcall SQLStatement.StringInterpolation.init(literalCapacity:interpolationCount:)(Swift::Int literalCapacity, Swift::Int interpolationCount)
{
  *uint64_t v2 = 0;
  v2[1] = 0xE000000000000000;
  v2[2] = sub_1C7BECE60(MEMORY[0x1E4FBC860]);
  uint64_t v4 = MEMORY[0x1C87BD840](literalCapacity);
  result.bindings._rawValue = v6;
  result.value._object = v5;
  result.value._uint64_t countAndFlagsBits = v4;
  return result;
}

uint64_t SQLStatement.StringInterpolation.appendInterpolation(_:)()
{
  sub_1C7BF4300();
  _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();

  return swift_bridgeObjectRelease();
}

uint64_t SQLStatement.StringInterpolation.appendInterpolation(_:)(long long *a1)
{
  char v1 = *((unsigned char *)a1 + 16);
  long long v3 = *a1;
  char v4 = v1;
  return sub_1C7BED0B4((uint64_t)&v3);
}

uint64_t sub_1C7BED0B4(uint64_t a1)
{
  uint64_t v2 = *(void *)a1;
  unint64_t v3 = *(void *)(a1 + 8);
  char v4 = *(unsigned char *)(a1 + 16);
  sub_1C7BF4380();
  _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
  swift_bridgeObjectRelease();
  _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
  sub_1C7BE9148(v2, v3, v4);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *(void *)(v1 + 16);
  *(void *)(v1 + 16) = 0x8000000000000000;
  sub_1C7BEDB2C(v2, v3, v4, 0x676E69646E696240, 0xE800000000000000, isUniquelyReferenced_nonNull_native);
  *(void *)(v1 + 16) = v7;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t SQLStatement.StringInterpolation.appendInterpolation(bind:)(uint64_t a1)
{
  sub_1C7BEB124(a1, (uint64_t)v5);
  SQLValue.init(_:)((uint64_t)v5, (uint64_t)&v7);
  uint64_t v1 = v7;
  unint64_t v2 = v8;
  char v3 = v9;
  v5[0] = v7;
  v5[1] = v8;
  char v6 = v9;
  sub_1C7BED0B4((uint64_t)v5);
  return sub_1C7BE91C4(v1, v2, v3);
}

uint64_t sub_1C7BED230()
{
  return MEMORY[0x1E4FBB220];
}

uint64_t sub_1C7BED23C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0xE000000000000000;
  a2[2] = sub_1C7BECE60(MEMORY[0x1E4FBC860]);
  return MEMORY[0x1C87BD840](a1);
}

uint64_t sub_1C7BED280()
{
  return _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
}

unint64_t sub_1C7BED290()
{
  unint64_t result = qword_1EA4FE3C8;
  if (!qword_1EA4FE3C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4FE3C8);
  }
  return result;
}

unint64_t sub_1C7BED2E8()
{
  unint64_t result = qword_1EA4FE3D0;
  if (!qword_1EA4FE3D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4FE3D0);
  }
  return result;
}

uint64_t *sub_1C7BED33C@<X0>(uint64_t *result@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *result;
  uint64_t v3 = result[1];
  *a2 = result[2];
  a2[1] = v2;
  a2[2] = v3;
  return result;
}

unint64_t sub_1C7BED354()
{
  unint64_t result = qword_1EA4FE3D8;
  if (!qword_1EA4FE3D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4FE3D8);
  }
  return result;
}

unint64_t sub_1C7BED3B0()
{
  unint64_t result = qword_1EA4FE3E0;
  if (!qword_1EA4FE3E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4FE3E0);
  }
  return result;
}

uint64_t sub_1C7BED404()
{
  return MEMORY[0x1E4FBB230];
}

uint64_t sub_1C7BED410()
{
  return MEMORY[0x1E4FBB228];
}

unint64_t sub_1C7BED41C@<X0>(unint64_t *a1@<X0>, unint64_t *a2@<X8>)
{
  unint64_t v3 = *a1;
  unint64_t v4 = a1[1];
  unint64_t result = sub_1C7BECE60(MEMORY[0x1E4FBC860]);
  *a2 = result;
  a2[1] = v3;
  a2[2] = v4;
  return result;
}

uint64_t destroy for SQLStatement()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *_s10SessionSQL12SQLStatementVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for SQLStatement(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

void *assignWithTake for SQLStatement(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SQLStatement(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SQLStatement(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SQLStatement()
{
  return &type metadata for SQLStatement;
}

uint64_t destroy for SQLStatement.StringInterpolation()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *_s10SessionSQL12SQLStatementV19StringInterpolationVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for SQLStatement.StringInterpolation(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for SQLStatement.StringInterpolation(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SQLStatement.StringInterpolation(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SQLStatement.StringInterpolation(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SQLStatement.StringInterpolation()
{
  return &type metadata for SQLStatement.StringInterpolation;
}

uint64_t sub_1C7BED800(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC68A98);
  char v40 = a2;
  uint64_t v6 = sub_1C7BF4350();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v38 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v37 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    for (i = v5; ; uint64_t v5 = i)
    {
      if (v10)
      {
        unint64_t v20 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v21 = v20 | (v13 << 6);
      }
      else
      {
        int64_t v22 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v22 >= v37) {
          goto LABEL_33;
        }
        unint64_t v23 = v38[v22];
        ++v13;
        if (!v23)
        {
          int64_t v13 = v22 + 1;
          if (v22 + 1 >= v37) {
            goto LABEL_33;
          }
          unint64_t v23 = v38[v13];
          if (!v23)
          {
            int64_t v24 = v22 + 2;
            if (v24 >= v37)
            {
LABEL_33:
              swift_release();
              uint64_t v3 = v2;
              if (v40)
              {
                uint64_t v36 = 1 << *(unsigned char *)(v5 + 32);
                if (v36 >= 64) {
                  bzero(v38, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v38 = -1 << v36;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v23 = v38[v24];
            if (!v23)
            {
              while (1)
              {
                int64_t v13 = v24 + 1;
                if (__OFADD__(v24, 1)) {
                  goto LABEL_40;
                }
                if (v13 >= v37) {
                  goto LABEL_33;
                }
                unint64_t v23 = v38[v13];
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
        unint64_t v21 = __clz(__rbit64(v23)) + (v13 << 6);
      }
      char v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
      uint64_t v30 = *v29;
      uint64_t v31 = v29[1];
      uint64_t v32 = *(void *)(v5 + 56) + 24 * v21;
      uint64_t v34 = *(void *)v32;
      unint64_t v33 = *(void *)(v32 + 8);
      char v35 = *(unsigned char *)(v32 + 16);
      if ((v40 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        sub_1C7BE9148(v34, v33, v35);
      }
      sub_1C7BF4400();
      sub_1C7BF41E0();
      uint64_t result = sub_1C7BF4420();
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
            goto LABEL_39;
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
      *uint64_t v18 = v30;
      v18[1] = v31;
      uint64_t v19 = *(void *)(v7 + 56) + 24 * v17;
      *(void *)uint64_t v19 = v34;
      *(void *)(v19 + 8) = v33;
      *(unsigned char *)(v19 + 16) = v35;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1C7BEDB2C(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v7 = v6;
  uint64_t v14 = *v6;
  unint64_t v16 = sub_1C7BF1D7C(a4, a5);
  uint64_t v17 = *(void *)(v14 + 16);
  BOOL v18 = (v15 & 1) == 0;
  uint64_t v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v20 = v15;
  uint64_t v21 = *(void *)(v14 + 24);
  if (v21 >= v19 && (a6 & 1) != 0) {
    goto LABEL_7;
  }
  if (v21 >= v19 && (a6 & 1) == 0)
  {
    sub_1C7BEDCC8();
LABEL_7:
    int64_t v22 = (void *)*v7;
    if (v20)
    {
LABEL_8:
      uint64_t v23 = v22[7] + 24 * v16;
      uint64_t result = sub_1C7BE91C4(*(void *)v23, *(void *)(v23 + 8), *(unsigned char *)(v23 + 16));
      *(void *)uint64_t v23 = a1;
      *(void *)(v23 + 8) = a2;
      *(unsigned char *)(v23 + 16) = a3;
      return result;
    }
    goto LABEL_11;
  }
  sub_1C7BED800(v19, a6 & 1);
  unint64_t v25 = sub_1C7BF1D7C(a4, a5);
  if ((v20 & 1) != (v26 & 1))
  {
LABEL_17:
    uint64_t result = sub_1C7BF43A0();
    __break(1u);
    return result;
  }
  unint64_t v16 = v25;
  int64_t v22 = (void *)*v7;
  if (v20) {
    goto LABEL_8;
  }
LABEL_11:
  v22[(v16 >> 6) + 8] |= 1 << v16;
  BOOL v27 = (uint64_t *)(v22[6] + 16 * v16);
  *BOOL v27 = a4;
  v27[1] = a5;
  uint64_t v28 = v22[7] + 24 * v16;
  *(void *)uint64_t v28 = a1;
  *(void *)(v28 + 8) = a2;
  *(unsigned char *)(v28 + 16) = a3;
  uint64_t v29 = v22[2];
  BOOL v30 = __OFADD__(v29, 1);
  uint64_t v31 = v29 + 1;
  if (v30)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v22[2] = v31;

  return swift_bridgeObjectRetain();
}

void *sub_1C7BEDCC8()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC68A98);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1C7BF4340();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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
    int64_t v27 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v27 >= v13) {
      goto LABEL_26;
    }
    unint64_t v28 = *(void *)(v6 + 8 * v27);
    ++v9;
    if (!v28)
    {
      int64_t v9 = v27 + 1;
      if (v27 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v28 = *(void *)(v6 + 8 * v9);
      if (!v28) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v28 - 1) & v28;
    unint64_t v15 = __clz(__rbit64(v28)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 24 * v15;
    uint64_t v21 = *(void *)(v2 + 56) + v20;
    uint64_t v22 = *(void *)v21;
    unint64_t v23 = *(void *)(v21 + 8);
    int64_t v24 = (void *)(*(void *)(v4 + 48) + v16);
    char v25 = *(unsigned char *)(v21 + 16);
    *int64_t v24 = v19;
    v24[1] = v18;
    uint64_t v26 = *(void *)(v4 + 56) + v20;
    *(void *)uint64_t v26 = v22;
    *(void *)(v26 + 8) = v23;
    *(unsigned char *)(v26 + 16) = v25;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)sub_1C7BE9148(v22, v23, v25);
  }
  int64_t v29 = v27 + 2;
  if (v29 >= v13) {
    goto LABEL_26;
  }
  unint64_t v28 = *(void *)(v6 + 8 * v29);
  if (v28)
  {
    int64_t v9 = v29;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v29 + 1;
    if (__OFADD__(v29, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v28 = *(void *)(v6 + 8 * v9);
    ++v29;
    if (v28) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t SQLSchemaBuilder.init(majorVersion:schemaRevisions:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_WORD *)a3 = result;
  *(void *)(a3 + 8) = a2;
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for SQLSchemaBuilder(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SQLSchemaBuilder(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for SQLSchemaBuilder(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for SQLSchemaBuilder()
{
  return &type metadata for SQLSchemaBuilder;
}

uint64_t sub_1C7BEDF7C()
{
  return 118;
}

BOOL sub_1C7BEE034(unsigned __int16 *a1, unsigned __int16 *a2)
{
  unsigned int v2 = *a1;
  unsigned int v3 = *a2;
  BOOL v4 = v2 == v3;
  BOOL v5 = v2 < v3;
  if (v4) {
    return a1[1] < a2[1];
  }
  else {
    return v5;
  }
}

uint64_t sub_1C7BEE05C()
{
  return sub_1C7BEDF7C();
}

BOOL static SQLiteError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t SQLiteError.hash(into:)()
{
  return sub_1C7BF4410();
}

uint64_t SQLiteError.hashValue.getter()
{
  return sub_1C7BF4420();
}

BOOL sub_1C7BEE0F0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1C7BEE104()
{
  return sub_1C7BF4420();
}

uint64_t sub_1C7BEE14C()
{
  return sub_1C7BF4410();
}

uint64_t sub_1C7BEE178()
{
  return sub_1C7BF4420();
}

void sub_1C7BEE1BC(uint64_t a1)
{
  uint64_t v2 = v1;
  os_unfair_lock_assert_owner(*(const os_unfair_lock **)(*(void *)(v2 + 24) + 16));
  if (a1 == 1)
  {
    if (*(void *)(v2 + 56)) {
      return;
    }
    unint64_t v7 = sub_1C7BECE60(MEMORY[0x1E4FBC860]);
    MEMORY[0x1C87BD840](18);
    _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
    sub_1C7BF4380();
    _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
    swift_bridgeObjectRelease();
    unint64_t v4 = 0xE000000000000000;
    unint64_t v5 = v7;
    unint64_t v6 = 0;
    goto LABEL_7;
  }
  if (!a1 && *(void *)(v2 + 56) == 1)
  {
    unint64_t v5 = sub_1C7BECE60(MEMORY[0x1E4FBC860]);
    unint64_t v6 = 0xD000000000000016;
    unint64_t v4 = 0x80000001C7BF54E0;
LABEL_7:
    unint64_t v7 = v4;
    SQLDatabase.perform(_:)((uint64_t *)&v5);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

id SQLDatabase.perform(_:)(uint64_t *a1)
{
  aBlock[6] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  unsigned int v3 = *(void **)(v1 + 32);
  unint64_t v4 = (void *)sub_1C7BF41A0();
  id v5 = objc_msgSend(v3, sel_prepareStatement_, v4);

  if (v5)
  {
    unint64_t v6 = sub_1C7BF1ED8(v2);
    unint64_t v7 = (void *)swift_allocObject();
    v7[2] = MEMORY[0x1E4FBC860];
    sub_1C7BEF88C((uint64_t)v6);
    swift_release();
    uint64_t v8 = (void *)sub_1C7BF4180();
    swift_bridgeObjectRelease();
    aBlock[4] = sub_1C7BF2234;
    aBlock[5] = v7;
    aBlock[0] = (id)MEMORY[0x1E4F143A8];
    aBlock[1] = (id)1107296256;
    aBlock[2] = sub_1C7BEFCE4;
    aBlock[3] = &block_descriptor;
    int64_t v9 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    aBlock[0] = 0;
    unsigned __int8 v10 = objc_msgSend(v5, sel_executeWithBindings_resultRowHandler_error_, v8, v9, aBlock);
    _Block_release(v9);

    id v11 = aBlock[0];
    if (v10)
    {

      swift_beginAccess();
      id v5 = (id)v7[2];
      swift_bridgeObjectRetain();
      swift_release();
    }
    else
    {
      int64_t v13 = v11;
      sub_1C7BF40D0();

      swift_willThrow();
      swift_release();
    }
  }
  else
  {
    sub_1C7BEE598();
    swift_allocError();
    *unint64_t v12 = 3;
    swift_willThrow();
  }
  return v5;
}

unint64_t sub_1C7BEE598()
{
  unint64_t result = qword_1EA4FE3E8;
  if (!qword_1EA4FE3E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4FE3E8);
  }
  return result;
}

uint64_t sub_1C7BEE5EC(void *a1, uint64_t *a2)
{
  uint64_t v4 = v2;
  uint64_t v7 = *a2;
  unint64_t v6 = a2[1];
  *(void *)(v4 + 16) = 10;
  type metadata accessor for UnfairLock();
  uint64_t v8 = swift_allocObject();
  int64_t v9 = (_DWORD *)swift_slowAlloc();
  *(void *)(v8 + 16) = v9;
  _DWORD *v9 = 0;
  *(void *)(v4 + 48) = 0;
  *(void *)(v4 + 56) = 0;
  *(void *)(v4 + 32) = a1;
  *(void *)(v4 + 40) = 0;
  *(void *)(v4 + 24) = v8;
  id v10 = a1;
  unint64_t v40 = sub_1C7BECE60(MEMORY[0x1E4FBC860]);
  unint64_t v41 = 0xD00000000000001BLL;
  unint64_t v42 = 0x80000001C7BF5500;
  SQLDatabase.perform(_:)((uint64_t *)&v40);
  if (!v3)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v40 = sub_1C7BECE60(MEMORY[0x1E4FBC860]);
    unint64_t v41 = 0xD000000000000016;
    unint64_t v42 = 0x80000001C7BF5520;
    SQLDatabase.perform(_:)((uint64_t *)&v40);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v40 = 0;
    unint64_t v41 = 0xE000000000000000;
    unint64_t v42 = sub_1C7BECE60(MEMORY[0x1E4FBC860]);
    MEMORY[0x1C87BD840](18);
    _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
    uint64_t v43 = 10;
    sub_1C7BF4380();
    _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
    swift_bridgeObjectRelease();
    unint64_t v11 = v40;
    unint64_t v12 = v41;
    unint64_t v40 = v42;
    unint64_t v41 = v11;
    unint64_t v42 = v12;
    SQLDatabase.perform(_:)((uint64_t *)&v40);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v40 = sub_1C7BECE60(MEMORY[0x1E4FBC860]);
    unint64_t v41 = 0xD000000000000017;
    unint64_t v42 = 0x80000001C7BF5540;
    SQLDatabase.perform(_:)((uint64_t *)&v40);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v40 = sub_1C7BECE60(MEMORY[0x1E4FBC860]);
    unint64_t v41 = 0xD000000000000019;
    unint64_t v42 = 0x80000001C7BF5560;
    SQLDatabase.perform(_:)((uint64_t *)&v40);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v40 = sub_1C7BECE60(MEMORY[0x1E4FBC860]);
    unint64_t v41 = 0xD00000000000001ELL;
    unint64_t v42 = 0x80000001C7BF5580;
    SQLDatabase.perform(_:)((uint64_t *)&v40);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v6)
    {
      LOWORD(v40) = v7;
      unint64_t v41 = v6;
      sub_1C7BEEE00((unsigned __int16 *)&v40);
      v39 = v10;
      swift_bridgeObjectRelease();
    }
    else
    {
      v39 = v10;
    }
    unint64_t v40 = sub_1C7BECE60(MEMORY[0x1E4FBC860]);
    unint64_t v41 = 0xD000000000000015;
    unint64_t v42 = 0x80000001C7BF55A0;
    v44.bindings._rawValue = &v40;
    Swift::Int64 v22 = SQLDatabase.performSimple(_:)(v44);
    int64_t v24 = v23;
    if (v23)
    {

      uint64_t v25 = 0;
    }
    else
    {
      uint64_t v25 = v22;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v40 = sub_1C7BECE60(MEMORY[0x1E4FBC860]);
    unint64_t v41 = 0xD000000000000011;
    unint64_t v42 = 0x80000001C7BF55C0;
    v45.bindings._rawValue = &v40;
    Swift::Int64 v26 = SQLDatabase.performSimple(_:)(v45);
    if (v27)
    {

      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v28 = v26;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v24) {
        goto LABEL_25;
      }
      if (qword_1EBC68A70 != -1) {
        swift_once();
      }
      double v29 = fmax((double)v28 * 0.05, 256.0);
      uint64_t v30 = sub_1C7BF4170();
      __swift_project_value_buffer(v30, (uint64_t)qword_1EBC68A58);
      uint64_t v31 = sub_1C7BF4160();
      os_log_type_t v32 = sub_1C7BF4250();
      if (os_log_type_enabled(v31, v32))
      {
        uint64_t v33 = swift_slowAlloc();
        *(_DWORD *)uint64_t v33 = 134349312;
        unint64_t v40 = v25;
        sub_1C7BF42A0();
        *(_WORD *)(v33 + 12) = 2050;
        unint64_t v40 = v28;
        sub_1C7BF42A0();
        _os_log_impl(&dword_1C7BE6000, v31, v32, "Database has %{public}lld/%{public}lld free pages.", (uint8_t *)v33, 0x16u);
        MEMORY[0x1C87BDF10](v33, -1, -1);
      }

      if (v29 > (double)v25) {
        goto LABEL_25;
      }
      uint64_t v34 = sub_1C7BF4160();
      os_log_type_t v35 = sub_1C7BF4250();
      if (os_log_type_enabled(v34, v35))
      {
        uint64_t v36 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v36 = 0;
        _os_log_impl(&dword_1C7BE6000, v34, v35, "Vacuuming", v36, 2u);
        MEMORY[0x1C87BDF10](v36, -1, -1);
      }

      unint64_t v40 = sub_1C7BECE60(MEMORY[0x1E4FBC860]);
      unint64_t v41 = 0xD000000000000019;
      unint64_t v42 = 0x80000001C7BF55E0;
      SQLDatabase.perform(_:)((uint64_t *)&v40);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
LABEL_25:

    return v4;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_msgSend(*(id *)(v4 + 32), sel_close, v37);
  swift_release();
  if (qword_1EBC68A70 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_1C7BF4170();
  __swift_project_value_buffer(v13, (uint64_t)qword_1EBC68A58);
  id v14 = v3;
  unint64_t v15 = sub_1C7BF4160();
  os_log_type_t v16 = sub_1C7BF4240();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v38 = v4;
    id v17 = v10;
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    uint64_t v19 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v18 = 138543362;
    uint64_t v20 = sub_1C7BF40C0();
    unint64_t v40 = v20;
    sub_1C7BF42A0();
    *uint64_t v19 = v20;
    id v10 = v17;
    uint64_t v4 = v38;

    _os_log_impl(&dword_1C7BE6000, v15, v16, "Failed to open database: %{public}@", v18, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4FE3F8);
    swift_arrayDestroy();
    MEMORY[0x1C87BDF10](v19, -1, -1);
    MEMORY[0x1C87BDF10](v18, -1, -1);
  }
  else
  {
  }
  swift_willThrow();

  return v4;
}

uint64_t sub_1C7BEEE00(unsigned __int16 *a1)
{
  uint64_t v2 = v1;
  v33[1] = *(id *)MEMORY[0x1E4F143B8];
  unsigned int v3 = *a1;
  uint64_t v4 = *((void *)a1 + 1);
  uint64_t v30 = sub_1C7BECE60(MEMORY[0x1E4FBC860]);
  unint64_t v31 = 0xD000000000000013;
  unint64_t v32 = 0x80000001C7BF5600;
  v34.bindings._rawValue = &v30;
  Swift::Int64 v5 = SQLDatabase.performSimple(_:)(v34);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if (v7) {
    return result;
  }
  if (v5 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_29;
  }
  if (v5 > 0x7FFFFFFF)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  uint64_t v8 = *(uint8_t **)(v4 + 16);
  if ((unint64_t)v8 >= 0x10000)
  {
    uint64_t result = sub_1C7BF4320();
    __break(1u);
  }
  else
  {
    unsigned int v9 = (unsigned __int16)*(void *)(v4 + 16);
    if (v3 != WORD1(v5) || (unsigned __int16)v5 != v9)
    {
      BOOL v10 = v3 < WORD1(v5);
      if (v3 == WORD1(v5)) {
        BOOL v10 = v9 < (unsigned __int16)v5;
      }
      if (v10)
      {
        if (qword_1EBC68A70 == -1)
        {
LABEL_11:
          uint64_t v11 = sub_1C7BF4170();
          __swift_project_value_buffer(v11, (uint64_t)qword_1EBC68A58);
          unint64_t v12 = sub_1C7BF4160();
          os_log_type_t v13 = sub_1C7BF4250();
          if (os_log_type_enabled(v12, v13))
          {
            id v14 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)id v14 = 0;
            _os_log_impl(&dword_1C7BE6000, v12, v13, "Existing schema version is greater than target schema version", v14, 2u);
            MEMORY[0x1C87BDF10](v14, -1, -1);
          }

          sub_1C7BEE598();
          swift_allocError();
          *unint64_t v15 = 2;
          return swift_willThrow();
        }
LABEL_30:
        swift_once();
        goto LABEL_11;
      }
      if (qword_1EBC68A70 != -1) {
        swift_once();
      }
      uint64_t v16 = sub_1C7BF4170();
      __swift_project_value_buffer(v16, (uint64_t)qword_1EBC68A58);
      id v17 = sub_1C7BF4160();
      os_log_type_t type = sub_1C7BF4250();
      if (os_log_type_enabled(v17, type))
      {
        log = v17;
        uint64_t v18 = swift_slowAlloc();
        int64_t v27 = (void *)swift_slowAlloc();
        v33[0] = v27;
        *(_DWORD *)uint64_t v18 = 136446466;
        uint64_t v30 = 118;
        unint64_t v31 = 0xE100000000000000;
        sub_1C7BF4380();
        _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
        swift_bridgeObjectRelease();
        _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
        sub_1C7BF4380();
        _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
        swift_bridgeObjectRelease();
        uint64_t v19 = (uint8_t *)v18;
        uint64_t v30 = sub_1C7BF1724(v30, v31, (uint64_t *)v33);
        sub_1C7BF42A0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v18 + 12) = 2082;
        uint64_t v30 = 118;
        unint64_t v31 = 0xE100000000000000;
        sub_1C7BF4380();
        _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
        swift_bridgeObjectRelease();
        _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
        sub_1C7BF4380();
        _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
        swift_bridgeObjectRelease();
        uint64_t v30 = sub_1C7BF1724(v30, v31, (uint64_t *)v33);
        sub_1C7BF42A0();
        swift_bridgeObjectRelease();
        id v17 = log;
        _os_log_impl(&dword_1C7BE6000, log, type, "Migrating database from %{public}s to %{public}s", v19, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x1C87BDF10](v27, -1, -1);
        MEMORY[0x1C87BDF10](v19, -1, -1);
      }

      if (v3 == WORD1(v5))
      {
        uint64_t v30 = (unsigned __int16)v5;
      }
      else
      {
        uint64_t v20 = (void *)v2[4];
        v33[0] = 0;
        if (!objc_msgSend(v20, sel_truncateDatabaseAndReturnError_, v33))
        {
          id v26 = v33[0];
          sub_1C7BF40D0();

          return swift_willThrow();
        }
        uint64_t v30 = 0;
        id v21 = v33[0];
        Swift::Int64 v22 = sub_1C7BF4160();
        os_log_type_t v23 = sub_1C7BF4250();
        if (os_log_type_enabled(v22, v23))
        {
          int v24 = (int)v8;
          uint64_t v8 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v8 = 0;
          _os_log_impl(&dword_1C7BE6000, v22, v23, "Truncated database", v8, 2u);
          uint64_t v25 = v8;
          LODWORD(v8) = v24;
          MEMORY[0x1C87BDF10](v25, -1, -1);
        }
      }
      swift_bridgeObjectRetain();
      swift_retain();
      sub_1C7BF33F8(0x6F6974617267694DuLL, 0xE90000000000006ELL, v2, v3, v4, (unint64_t *)&v30, v2, v3 | (v8 << 16));
      swift_bridgeObjectRelease();
      return swift_release();
    }
  }
  return result;
}

Swift::Int64 __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLDatabase.performSimple(_:)(SessionSQL::SQLStatement a1)
{
  uint64_t v3 = *((void *)a1.bindings._rawValue + 2);
  long long v10 = *(_OWORD *)a1.bindings._rawValue;
  uint64_t v11 = v3;
  uint64_t v4 = SQLDatabase.perform(_:)((uint64_t *)&v10);
  if (!v2)
  {
    uint64_t v1 = (uint64_t)v4;
    if (!v4[2] || (uint64_t v5 = v4[4], swift_bridgeObjectRetain(), swift_bridgeObjectRelease(), *(void *)(v5 + 16) != 1))
    {
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    uint64_t v1 = *(void *)(v5 + 48);
    unint64_t v6 = *(void *)(v5 + 56);
    int v7 = *(unsigned __int8 *)(v5 + 64);
    swift_bridgeObjectRetain();
    sub_1C7BE9148(v1, v6, v7);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v7)
    {
      sub_1C7BE91C4(v1, v6, v7);
LABEL_7:
      sub_1C7BEE598();
      swift_allocError();
      *uint64_t v8 = 4;
      swift_willThrow();
    }
  }
  return v1;
}

id sub_1C7BEF540()
{
  v3[0] = sub_1C7BECE60(MEMORY[0x1E4FBC860]);
  v3[1] = 0xD00000000000001BLL;
  v3[2] = 0x80000001C7BF51B0;
  SQLDatabase.perform(_:)(v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(void **)(v0 + 32);

  return objc_msgSend(v1, sel_close);
}

uint64_t SQLDatabase.deinit()
{
  swift_release();

  return v0;
}

uint64_t SQLDatabase.__deallocating_deinit()
{
  swift_release();

  return MEMORY[0x1F4186488](v0, 64, 7);
}

uint64_t SQLDatabase.Storage.path.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1C7BF40F0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t SQLDatabase.Storage.protectionClass.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for SQLDatabase.Storage() + 20));
}

uint64_t SQLDatabase.Storage.init(path:protectionClass:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_1C7BF40F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a3, a1, v6);
  uint64_t result = type metadata accessor for SQLDatabase.Storage();
  *(void *)(a3 + *(int *)(result + 20)) = a2;
  return result;
}

uint64_t SQLDatabase.__allocating_init(storage:schema:)(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  uint64_t v5 = *(void *)(a1 + *(int *)(type metadata accessor for SQLDatabase.Storage() + 20));
  id v6 = objc_allocWithZone(MEMORY[0x1E4F4F848]);
  int v7 = (void *)sub_1C7BF40E0();
  id v8 = objc_msgSend(v6, sel_initWithFileURL_dataProtectionClass_, v7, v5);

  v11[0] = v3;
  v11[1] = v4;
  type metadata accessor for SQLDatabase();
  swift_allocObject();
  uint64_t v9 = sub_1C7BEE5EC(v8, v11);
  sub_1C7BF22C4(a1);
  return v9;
}

Swift::Bool __swiftcall SQLDatabase.isInTransaction()()
{
  uint64_t v1 = *(os_unfair_lock_s **)(*(void *)(v0 + 24) + 16);
  os_unfair_lock_lock(v1);
  Swift::Bool v2 = *(void *)(v0 + 40) != 0;
  os_unfair_lock_unlock(v1);
  return v2;
}

unint64_t sub_1C7BEF88C(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC68D28);
    Swift::Bool v2 = (void *)sub_1C7BF4360();
  }
  else
  {
    Swift::Bool v2 = (void *)MEMORY[0x1E4FBC868];
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
  unint64_t result = swift_bridgeObjectRetain();
  int64_t i = 0;
  if (v5) {
    goto LABEL_10;
  }
LABEL_11:
  int64_t v12 = i + 1;
  if (__OFADD__(i, 1)) {
    goto LABEL_35;
  }
  if (v12 >= v27) {
    goto LABEL_32;
  }
  unint64_t v13 = *(void *)(v28 + 8 * v12);
  int64_t v14 = i + 1;
  if (!v13)
  {
    int64_t v14 = i + 2;
    if (i + 2 >= v27) {
      goto LABEL_32;
    }
    unint64_t v13 = *(void *)(v28 + 8 * v14);
    if (!v13)
    {
      int64_t v14 = i + 3;
      if (i + 3 >= v27) {
        goto LABEL_32;
      }
      unint64_t v13 = *(void *)(v28 + 8 * v14);
      if (!v13)
      {
        int64_t v14 = i + 4;
        if (i + 4 >= v27) {
          goto LABEL_32;
        }
        unint64_t v13 = *(void *)(v28 + 8 * v14);
        if (!v13)
        {
          int64_t v15 = i + 5;
          if (i + 5 < v27)
          {
            unint64_t v13 = *(void *)(v28 + 8 * v15);
            if (v13)
            {
              int64_t v14 = i + 5;
              goto LABEL_26;
            }
            while (1)
            {
              int64_t v14 = v15 + 1;
              if (__OFADD__(v15, 1)) {
                goto LABEL_36;
              }
              if (v14 >= v27) {
                break;
              }
              unint64_t v13 = *(void *)(v28 + 8 * v14);
              ++v15;
              if (v13) {
                goto LABEL_26;
              }
            }
          }
LABEL_32:
          sub_1C7BF3DD0();
          return (unint64_t)v2;
        }
      }
    }
  }
LABEL_26:
  unint64_t v5 = (v13 - 1) & v13;
  unint64_t v11 = __clz(__rbit64(v13)) + (v14 << 6);
  for (i = v14; ; unint64_t v11 = v10 | (i << 6))
  {
    uint64_t v16 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v11);
    uint64_t v18 = *v16;
    uint64_t v17 = v16[1];
    sub_1C7BEB124(*(void *)(a1 + 56) + 40 * v11, (uint64_t)v39);
    *(void *)&long long v38 = v18;
    *((void *)&v38 + 1) = v17;
    v35[2] = v38;
    v36[0] = v39[0];
    v36[1] = v39[1];
    uint64_t v37 = v40;
    uint64_t v30 = v18;
    uint64_t v31 = v17;
    sub_1C7BECD90(v36, (uint64_t)v29);
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC68CF8);
    swift_dynamicCast();
    uint64_t v20 = v30;
    uint64_t v19 = v31;
    sub_1C7BE9F38(&v32, v34);
    sub_1C7BE9F38(v34, v35);
    sub_1C7BE9F38(v35, &v33);
    unint64_t result = sub_1C7BF1D7C(v20, v19);
    unint64_t v21 = result;
    if (v22)
    {
      id v8 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *id v8 = v20;
      v8[1] = v19;
      uint64_t v9 = (_OWORD *)(v2[7] + 32 * v21);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
      unint64_t result = (unint64_t)sub_1C7BE9F38(&v33, v9);
      if (!v5) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    os_log_type_t v23 = (uint64_t *)(v2[6] + 16 * result);
    *os_log_type_t v23 = v20;
    v23[1] = v19;
    unint64_t result = (unint64_t)sub_1C7BE9F38(&v33, (_OWORD *)(v2[7] + 32 * result));
    uint64_t v24 = v2[2];
    BOOL v25 = __OFADD__(v24, 1);
    uint64_t v26 = v24 + 1;
    if (v25) {
      goto LABEL_34;
    }
    v2[2] = v26;
    if (!v5) {
      goto LABEL_11;
    }
LABEL_10:
    unint64_t v10 = __clz(__rbit64(v5));
    v5 &= v5 - 1;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_1C7BEFC04(void *a1, uint64_t a2)
{
  uint64_t v3 = (void *)(a2 + 16);
  sub_1C7BE8110(a1, &v10);
  uint64_t v4 = v10;
  swift_beginAccess();
  unint64_t v5 = *(void **)(a2 + 16);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(a2 + 16) = v5;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    unint64_t v5 = sub_1C7BF1614(0, v5[2] + 1, 1, v5);
    *uint64_t v3 = v5;
  }
  unint64_t v8 = v5[2];
  unint64_t v7 = v5[3];
  if (v8 >= v7 >> 1)
  {
    unint64_t v5 = sub_1C7BF1614((void *)(v7 > 1), v8 + 1, 1, v5);
    *uint64_t v3 = v5;
  }
  void v5[2] = v8 + 1;
  v5[v8 + 4] = v4;
  return swift_endAccess();
}

void SQLDatabase.inTransaction(reason:_:)(unint64_t a1, unint64_t a2, uint64_t (*a3)(void))
{
  unint64_t v5 = v3;
  unint64_t v8 = a1;
  *(void *)aBlock = a1;
  *(void *)&aBlock[8] = a2;
  uint64_t v61 = 32;
  unint64_t v62 = 0xE100000000000000;
  sub_1C7BF2320();
  if (sub_1C7BF42C0())
  {
    __break(1u);
    goto LABEL_29;
  }
  uint64_t v9 = v3[3];
  uint64_t v10 = *(os_unfair_lock_s **)(v9 + 16);
  os_unfair_lock_lock(v10);
  uint64_t v11 = v5[6];
  BOOL v12 = __OFADD__(v11, 1);
  uint64_t v13 = v11 + 1;
  if (v12)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  v5[6] = v13;
  os_unfair_lock_assert_owner(v10);
  uint64_t v14 = v5[5];
  uint64_t v15 = v5[6];
  uint64_t v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  uint64_t v53 = a3;
  os_unfair_lock_unlock(v10);
  sub_1C7BF42E0();
  swift_bridgeObjectRelease();
  strcpy(aBlock, "transaction_");
  aBlock[13] = 0;
  *(_WORD *)&aBlock[14] = -5120;
  uint64_t v54 = v8;
  unint64_t v55 = a2;
  _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
  _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
  uint64_t v61 = v16;
  sub_1C7BF4380();
  _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
  swift_bridgeObjectRelease();
  unint64_t v8 = *(void *)&aBlock[8];
  uint64_t v17 = *(void *)aBlock;
  uint64_t v18 = *(os_unfair_lock_s **)(v9 + 16);
  os_unfair_lock_lock(v18);
  uint64_t v19 = v5[7];
  if (v19 == -1)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  uint64_t v63 = v9;
  v5[7] = v19 + 1;
  sub_1C7BEE1BC(v19);
  os_unfair_lock_unlock(v18);
  id v20 = objc_allocWithZone(MEMORY[0x1E4F4F838]);
  swift_bridgeObjectRetain();
  swift_retain();
  unint64_t v21 = (void *)sub_1C7BF41A0();
  char v22 = (void *)sub_1C7BF41A0();
  swift_bridgeObjectRelease();
  v59 = sub_1C7BF2374;
  v60 = v5;
  *(void *)aBlock = MEMORY[0x1E4F143A8];
  *(void *)&aBlock[8] = 1107296256;
  *(void *)&aBlock[16] = sub_1C7BEFCE4;
  uint64_t v58 = &block_descriptor_3;
  os_log_type_t v23 = _Block_copy(aBlock);
  id v56 = objc_msgSend(v20, sel_initWithIdentifier_forReason_invalidationBlock_, v21, v22, v23);

  _Block_release(v23);
  swift_release();
  *(void *)aBlock = 0;
  *(void *)&aBlock[8] = 0xE000000000000000;
  *(void *)&aBlock[16] = sub_1C7BECE60(MEMORY[0x1E4FBC860]);
  MEMORY[0x1C87BD840](10);
  _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
  _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
  long long v24 = *(_OWORD *)aBlock;
  *(void *)aBlock = *(void *)&aBlock[16];
  *(_OWORD *)&aBlock[8] = v24;
  SQLDatabase.perform(_:)((uint64_t *)aBlock);
  if (!v4)
  {
    uint64_t v52 = v17;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_1EBC68A70 == -1) {
      goto LABEL_9;
    }
    goto LABEL_33;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  BOOL v25 = *(os_unfair_lock_s **)(v63 + 16);
  os_unfair_lock_lock(v25);
  uint64_t v26 = v5[6];
  BOOL v12 = __OFSUB__(v26, 1);
  uint64_t v27 = v26 - 1;
  if (!v12)
  {
    v5[6] = v27;
    os_unfair_lock_assert_owner(v25);
    os_unfair_lock_unlock(v25);
    swift_willThrow();
LABEL_19:
    objc_msgSend(v56, sel_invalidate, v51);

    return;
  }
LABEL_32:
  __break(1u);
LABEL_33:
  swift_once();
LABEL_9:
  uint64_t v28 = sub_1C7BF4170();
  __swift_project_value_buffer(v28, (uint64_t)qword_1EBC68A58);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  double v29 = sub_1C7BF4160();
  os_log_type_t v30 = sub_1C7BF4230();
  if (os_log_type_enabled(v29, v30))
  {
    uint64_t v31 = swift_slowAlloc();
    uint64_t v51 = swift_slowAlloc();
    *(void *)aBlock = v51;
    *(_DWORD *)uint64_t v31 = 136446466;
    swift_bridgeObjectRetain();
    uint64_t v61 = sub_1C7BF1724(v54, v55, (uint64_t *)aBlock);
    sub_1C7BF42A0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v31 + 12) = 2082;
    swift_bridgeObjectRetain();
    uint64_t v61 = sub_1C7BF1724(v52, v8, (uint64_t *)aBlock);
    sub_1C7BF42A0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1C7BE6000, v29, v30, "Beginning db savepoint [%{public}s]: %{public}s", (uint8_t *)v31, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1C87BDF10](v51, -1, -1);
    MEMORY[0x1C87BDF10](v31, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  uint64_t v32 = v63;
  long long v33 = *(os_unfair_lock_s **)(v63 + 16);
  os_unfair_lock_lock(v33);
  uint64_t v34 = v5[6];
  BOOL v12 = __OFSUB__(v34, 1);
  uint64_t v35 = v34 - 1;
  if (v12)
  {
    __break(1u);
    goto LABEL_35;
  }
  uint64_t v36 = v5[5];
  v5[6] = v35;
  os_unfair_lock_assert_owner(v33);
  uint64_t v37 = v5[5];
  BOOL v12 = __OFADD__(v37, 1);
  uint64_t v38 = v37 + 1;
  if (v12)
  {
LABEL_35:
    __break(1u);
    __break(1u);
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  v5[5] = v38;
  os_unfair_lock_assert_owner(v33);
  os_unfair_lock_unlock(v33);
  char v39 = v53();
  if (v4)
  {
    sub_1C7BF0808(v54, v55, v52, v8);
    swift_bridgeObjectRelease();
    swift_willThrow();
    uint64_t v40 = *(os_unfair_lock_s **)(v32 + 16);
    os_unfair_lock_lock(v40);
    uint64_t v41 = v5[5];
    BOOL v12 = __OFSUB__(v41, 1);
    uint64_t v42 = v41 - 1;
    if (!v12)
    {
      v5[5] = v42;
      os_unfair_lock_assert_owner(v40);
      os_unfair_lock_unlock(v40);
      goto LABEL_19;
    }
    goto LABEL_36;
  }
  if (v39) {
    sub_1C7BF0544(v54, v55, v52, v8);
  }
  else {
    sub_1C7BF0808(v54, v55, v52, v8);
  }
  swift_bridgeObjectRelease();
  if (v36)
  {
    swift_retain();
    uint64_t v43 = sub_1C7BF4160();
    os_log_type_t v44 = sub_1C7BF4230();
    if (os_log_type_enabled(v43, v44))
    {
      SessionSQL::SQLStatement v45 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)SessionSQL::SQLStatement v45 = 134349056;
      v46 = *(os_unfair_lock_s **)(v63 + 16);
      os_unfair_lock_lock(v46);
      uint64_t v47 = v5[5];
      os_unfair_lock_unlock(v46);
      *(void *)aBlock = v47;
      uint64_t v32 = v63;
      sub_1C7BF42A0();
      swift_release();
      _os_log_impl(&dword_1C7BE6000, v43, v44, "Outstanding transactions remaining: %{public}ld", v45, 0xCu);
      MEMORY[0x1C87BDF10](v45, -1, -1);
    }
    else
    {

      swift_release();
    }
  }
  else
  {
    sub_1C7BF0B64((uint64_t)v5, v54, v55);
  }
  v48 = *(os_unfair_lock_s **)(v32 + 16);
  os_unfair_lock_lock(v48);
  uint64_t v49 = v5[5];
  BOOL v12 = __OFSUB__(v49, 1);
  uint64_t v50 = v49 - 1;
  if (!v12)
  {
    v5[5] = v50;
    os_unfair_lock_assert_owner(v48);
    os_unfair_lock_unlock(v48);
    objc_msgSend(v56, sel_invalidate);

    return;
  }
LABEL_37:
  __break(1u);
}

uint64_t sub_1C7BF0544(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v5 = v4;
  if (qword_1EBC68A70 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_1C7BF4170();
  __swift_project_value_buffer(v10, (uint64_t)qword_1EBC68A58);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v11 = sub_1C7BF4160();
  os_log_type_t v12 = sub_1C7BF4230();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    uint64_t v14 = v19;
    *(_DWORD *)uint64_t v13 = 136446466;
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_1C7BF1724(a1, a2, &v19);
    sub_1C7BF42A0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v13 + 12) = 2082;
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_1C7BF1724(a3, a4, &v19);
    sub_1C7BF42A0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1C7BE6000, v11, v12, "Committing transaction savepoint [%{public}s]: %{public}s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    uint64_t v15 = v14;
    uint64_t v5 = v4;
    MEMORY[0x1C87BDF10](v15, -1, -1);
    MEMORY[0x1C87BDF10](v13, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  uint64_t v19 = 0;
  unint64_t v20 = 0xE000000000000000;
  unint64_t v21 = sub_1C7BECE60(MEMORY[0x1E4FBC860]);
  MEMORY[0x1C87BD840](18);
  _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
  _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
  uint64_t v16 = v19;
  unint64_t v17 = v20;
  uint64_t v19 = v21;
  unint64_t v20 = v16;
  unint64_t v21 = v17;
  SQLDatabase.perform(_:)(&v19);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v5) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1C7BF0808(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v5 = v4;
  if (qword_1EBC68A70 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_1C7BF4170();
  __swift_project_value_buffer(v10, (uint64_t)qword_1EBC68A58);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v11 = sub_1C7BF4160();
  os_log_type_t v12 = sub_1C7BF4230();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v20 = v14;
    *(_DWORD *)uint64_t v13 = 136446466;
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_1C7BF1724(a1, a2, &v20);
    sub_1C7BF42A0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v13 + 12) = 2082;
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_1C7BF1724(a3, a4, &v20);
    uint64_t v5 = v4;
    sub_1C7BF42A0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1C7BE6000, v11, v12, "Rollback to transaction savepoint [%{public}s]: %{public}s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1C87BDF10](v14, -1, -1);
    MEMORY[0x1C87BDF10](v13, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  uint64_t v20 = 0;
  unint64_t v21 = 0xE000000000000000;
  unint64_t v22 = sub_1C7BECE60(MEMORY[0x1E4FBC860]);
  MEMORY[0x1C87BD840](22);
  _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
  _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
  uint64_t v15 = v20;
  unint64_t v16 = v21;
  uint64_t v20 = v22;
  unint64_t v21 = v15;
  unint64_t v22 = v16;
  SQLDatabase.perform(_:)(&v20);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v5)
  {
    swift_bridgeObjectRelease();
    uint64_t v20 = 0;
    unint64_t v21 = 0xE000000000000000;
    unint64_t v22 = sub_1C7BECE60(MEMORY[0x1E4FBC860]);
    MEMORY[0x1C87BD840](18);
    _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
    _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
    uint64_t v18 = v20;
    unint64_t v19 = v21;
    uint64_t v20 = v22;
    unint64_t v21 = v18;
    unint64_t v22 = v19;
    SQLDatabase.perform(_:)(&v20);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_1C7BF0B64(uint64_t a1, uint64_t a2, unint64_t a3)
{
  v16[0] = sub_1C7BECE60(MEMORY[0x1E4FBC860]);
  v16[1] = 0xD00000000000001BLL;
  v16[2] = 0x80000001C7BF51B0;
  SQLDatabase.perform(_:)(v16);
  if (v3)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_1EBC68A70 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_1C7BF4170();
    __swift_project_value_buffer(v6, (uint64_t)qword_1EBC68A58);
    swift_bridgeObjectRetain_n();
    unint64_t v7 = sub_1C7BF4160();
    os_log_type_t v8 = sub_1C7BF4230();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      uint64_t v10 = swift_slowAlloc();
      v16[0] = v10;
      *(_DWORD *)uint64_t v9 = 136446210;
      swift_bridgeObjectRetain();
      uint64_t v17 = sub_1C7BF1724(a2, a3, v16);
      sub_1C7BF42A0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C7BE6000, v7, v8, "Unable to execute wal_checkpoint(FULL, privacy: .public) for: %{public}s", v9, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C87BDF10](v10, -1, -1);
      MEMORY[0x1C87BDF10](v9, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_1EBC68A70 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_1C7BF4170();
    __swift_project_value_buffer(v11, (uint64_t)qword_1EBC68A58);
    swift_bridgeObjectRetain_n();
    os_log_type_t v12 = sub_1C7BF4160();
    os_log_type_t v13 = sub_1C7BF4230();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      v16[0] = v15;
      *(_DWORD *)uint64_t v14 = 136446210;
      swift_bridgeObjectRetain();
      uint64_t v17 = sub_1C7BF1724(a2, a3, v16);
      sub_1C7BF42A0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C7BE6000, v12, v13, "Successfully executed wal_checkpoint(FULL, privacy: .public) for: %{public}s", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C87BDF10](v15, -1, -1);
      MEMORY[0x1C87BDF10](v14, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

void sub_1C7BF0F10(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(os_unfair_lock_s **)(*(void *)(a2 + 24) + 16);
  os_unfair_lock_lock(v3);
  uint64_t v4 = *(void *)(a2 + 56);
  if (v4)
  {
    *(void *)(a2 + 56) = v4 - 1;
    sub_1C7BEE1BC(v4);
    os_unfair_lock_unlock(v3);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1C7BF0F6C(uint64_t a1, uint64_t a2, unint64_t *a3, void *a4, unsigned int a5)
{
  unint64_t v7 = *a3;
  if ((*a3 & 0x8000000000000000) != 0) {
    goto LABEL_34;
  }
  uint64_t v8 = v5;
  uint64_t v31 = *(void *)(a2 + 16);
  if (!v7) {
    goto LABEL_16;
  }
  if (!v31) {
    goto LABEL_27;
  }
  unint64_t v10 = v7 - 2;
  if (v7 < 2)
  {
LABEL_16:
    if (v7 == v31) {
      goto LABEL_27;
    }
    swift_bridgeObjectRetain();
    while (v7 < *(void *)(a2 + 16))
    {
      uint64_t v17 = swift_allocObject();
      *(_OWORD *)(v17 + 16) = *(_OWORD *)(a2 + 16 * v7 + 32);
      uint64_t v18 = qword_1EBC68A70;
      swift_retain();
      if (v18 != -1) {
        swift_once();
      }
      unint64_t v19 = v7 + 1;
      uint64_t v20 = sub_1C7BF4170();
      __swift_project_value_buffer(v20, (uint64_t)qword_1EBC68A58);
      unint64_t v21 = sub_1C7BF4160();
      os_log_type_t v22 = sub_1C7BF4250();
      if (os_log_type_enabled(v21, v22))
      {
        uint64_t v23 = swift_slowAlloc();
        *(_DWORD *)uint64_t v23 = 134349312;
        *(void *)(v23 + 4) = v7;
        *(_WORD *)(v23 + 12) = 2050;
        *(void *)(v23 + 14) = v19;
        _os_log_impl(&dword_1C7BE6000, v21, v22, "Migrating from minor revision %{public}ld to %{public}ld", (uint8_t *)v23, 0x16u);
        MEMORY[0x1C87BDF10](v23, -1, -1);
      }

      sub_1C7BF42E0();
      swift_bridgeObjectRelease();
      strcpy((char *)v33, "MigratingFrom_");
      HIBYTE(v33[1]) = -18;
      sub_1C7BF4380();
      _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
      swift_bridgeObjectRelease();
      _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
      unint64_t v35 = v7 + 1;
      sub_1C7BF4380();
      int v6 = v24;
      _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
      swift_bridgeObjectRelease();
      swift_retain();
      swift_retain();
      sub_1C7BF2BC4(v33[0], v33[1], a4, (void (*)(uint64_t))sub_1C7BF3CAC, v17, (uint64_t)a4);
      swift_bridgeObjectRelease();
      if (v8)
      {
        swift_bridgeObjectRelease();
        swift_release_n();
        swift_release();
        return 1;
      }
      swift_release_n();
      swift_release();
      ++v7;
      if (v31 == v19)
      {
        swift_bridgeObjectRelease();
        goto LABEL_27;
      }
    }
    __break(1u);
LABEL_34:
    __break(1u);
LABEL_35:
    swift_once();
    goto LABEL_29;
  }
  if (v31 - 1 < v10) {
    unint64_t v10 = v31 - 1;
  }
  unint64_t v11 = v10 + 1;
  if (v11 >= 0x21)
  {
    uint64_t v13 = v11 & 0x1F;
    if ((v11 & 0x1F) == 0) {
      uint64_t v13 = 32;
    }
    unint64_t v14 = v11 - v13;
    uint64_t v12 = v14 + 1;
    do
      v14 -= 32;
    while (v14);
  }
  else
  {
    uint64_t v12 = 1;
  }
  unint64_t v15 = v7 - v12;
  uint64_t v16 = v31 - v12;
  while (v16)
  {
    --v16;
    if (!--v15) {
      goto LABEL_16;
    }
  }
LABEL_27:
  unint64_t v34 = sub_1C7BECE60(MEMORY[0x1E4FBC860]);
  MEMORY[0x1C87BD840](22);
  _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
  int v6 = __PAIR64__(a5, a5) >> 16;
  LODWORD(v35) = v6;
  sub_1C7BF4380();
  _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
  swift_bridgeObjectRelease();
  v33[0] = v34;
  v33[1] = 0;
  unint64_t v34 = 0xE000000000000000;
  SQLDatabase.perform(_:)(v33);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v8) {
    return 1;
  }
  swift_bridgeObjectRelease();
  if (qword_1EBC68A70 != -1) {
    goto LABEL_35;
  }
LABEL_29:
  uint64_t v25 = sub_1C7BF4170();
  __swift_project_value_buffer(v25, (uint64_t)qword_1EBC68A58);
  uint64_t v26 = sub_1C7BF4160();
  os_log_type_t v27 = sub_1C7BF4250();
  if (os_log_type_enabled(v26, v27))
  {
    uint64_t v28 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v28 = 67240192;
    LODWORD(v33[0]) = v6;
    sub_1C7BF42A0();
    _os_log_impl(&dword_1C7BE6000, v26, v27, "Set revision to %{public}d", v28, 8u);
    MEMORY[0x1C87BDF10](v28, -1, -1);
  }

  return 1;
}

void sub_1C7BF1484(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void *sub_1C7BF14EC(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC68D38);
      unint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      void v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 48);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[6 * v8 + 4]) {
          memmove(v12, a4 + 4, 48 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      unint64_t v10 = (void *)MEMORY[0x1E4FBC860];
      uint64_t v12 = (void *)(MEMORY[0x1E4FBC860] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_1C7BF2AB4(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_1C7BF1614(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC68D30);
      unint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      void v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      unint64_t v10 = (void *)MEMORY[0x1E4FBC860];
      uint64_t v13 = (void *)(MEMORY[0x1E4FBC860] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4]) {
          memmove(v13, a4 + 4, 8 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_1C7BF3CDC(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1C7BF1724(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1C7BF17F8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1C7BE9F48((uint64_t)v12, *a3);
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
      sub_1C7BE9F48((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1C7BF17F8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1C7BF42B0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1C7BF19B4(a5, a6);
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
  uint64_t v8 = sub_1C7BF4310();
  if (!v8)
  {
    sub_1C7BF4320();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1C7BF4370();
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

uint64_t sub_1C7BF19B4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1C7BF1A4C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1C7BF1C2C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1C7BF1C2C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1C7BF1A4C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1C7BF1BC4(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1C7BF42F0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_1C7BF4320();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1C7BF4210();
      if (!v2) {
        return MEMORY[0x1E4FBC860];
      }
    }
    sub_1C7BF4370();
    __break(1u);
LABEL_14:
    uint64_t result = sub_1C7BF4320();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC860];
  }
  return result;
}

void *sub_1C7BF1BC4(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC68AA8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1C7BF1C2C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC68AA8);
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
  uint64_t result = sub_1C7BF4370();
  __break(1u);
  return result;
}

unint64_t sub_1C7BF1D7C(uint64_t a1, uint64_t a2)
{
  sub_1C7BF4400();
  sub_1C7BF41E0();
  uint64_t v4 = sub_1C7BF4420();

  return sub_1C7BF1DF4(a1, a2, v4);
}

unint64_t sub_1C7BF1DF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1C7BF4390() & 1) == 0)
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
      while (!v14 && (sub_1C7BF4390() & 1) == 0);
    }
  }
  return v6;
}

void *sub_1C7BF1ED8(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC68A90);
  uint64_t v2 = sub_1C7BF4340();
  uint64_t v3 = (void *)v2;
  int64_t v4 = 0;
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v32 = a1 + 64;
  uint64_t v6 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & v5;
  int64_t v36 = (unint64_t)(v6 + 63) >> 6;
  uint64_t v9 = v2 + 64;
  if ((v7 & v5) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v10 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v10 | (v4 << 6); ; unint64_t i = __clz(__rbit64(v13)) + (v4 << 6))
  {
    unint64_t v15 = (uint64_t *)(*(void *)(a1 + 48) + 16 * i);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    uint64_t v18 = *(void *)(a1 + 56) + 24 * i;
    uint64_t v19 = *(void *)v18;
    unint64_t v20 = *(void *)(v18 + 8);
    switch(*(unsigned char *)(v18 + 16))
    {
      case 1:
        unint64_t v35 = &protocol witness table for Double;
        unint64_t v21 = MEMORY[0x1E4FBB3D0];
        goto LABEL_22;
      case 2:
        unint64_t v34 = MEMORY[0x1E4FBB1A0];
        unint64_t v35 = &protocol witness table for String;
        *(void *)&long long v33 = v19;
        *((void *)&v33 + 1) = v20;
        swift_bridgeObjectRetain();
        uint64_t v22 = v19;
        unint64_t v23 = v20;
        char v24 = 2;
        goto LABEL_25;
      case 3:
        unint64_t v34 = MEMORY[0x1E4F277C0];
        unint64_t v35 = &protocol witness table for Data;
        *(void *)&long long v33 = v19;
        *((void *)&v33 + 1) = v20;
        swift_bridgeObjectRetain();
        uint64_t v22 = v19;
        unint64_t v23 = v20;
        char v24 = 3;
LABEL_25:
        sub_1C7BE9148(v22, v23, v24);
        break;
      case 4:
        id v25 = objc_allocWithZone(MEMORY[0x1E4F1CA98]);
        swift_bridgeObjectRetain();
        id v26 = objc_msgSend(v25, sel_init);
        unint64_t v34 = sub_1C7BF3DD8();
        unint64_t v35 = &protocol witness table for NSNull;
        *(void *)&long long v33 = v26;
        break;
      default:
        unint64_t v35 = &protocol witness table for Int64;
        unint64_t v21 = MEMORY[0x1E4FBC1C8];
LABEL_22:
        unint64_t v34 = v21;
        *(void *)&long long v33 = v19;
        swift_bridgeObjectRetain();
        break;
    }
    *(void *)(v9 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    os_log_type_t v27 = (void *)(v3[6] + 16 * i);
    *os_log_type_t v27 = v17;
    v27[1] = v16;
    sub_1C7BECD90(&v33, v3[7] + 40 * i);
    uint64_t v28 = v3[2];
    BOOL v29 = __OFADD__(v28, 1);
    uint64_t v30 = v28 + 1;
    if (v29)
    {
      __break(1u);
LABEL_32:
      __break(1u);
      goto LABEL_33;
    }
    v3[2] = v30;
    if (v8) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v12 = v4 + 1;
    if (__OFADD__(v4, 1)) {
      goto LABEL_32;
    }
    if (v12 >= v36) {
      break;
    }
    unint64_t v13 = *(void *)(v32 + 8 * v12);
    ++v4;
    if (!v13)
    {
      int64_t v4 = v12 + 1;
      if (v12 + 1 >= v36) {
        return v3;
      }
      unint64_t v13 = *(void *)(v32 + 8 * v4);
      if (!v13)
      {
        int64_t v4 = v12 + 2;
        if (v12 + 2 >= v36) {
          return v3;
        }
        unint64_t v13 = *(void *)(v32 + 8 * v4);
        if (!v13)
        {
          int64_t v14 = v12 + 3;
          if (v14 >= v36) {
            return v3;
          }
          unint64_t v13 = *(void *)(v32 + 8 * v14);
          if (v13)
          {
            int64_t v4 = v14;
            goto LABEL_18;
          }
          while (1)
          {
            int64_t v4 = v14 + 1;
            if (__OFADD__(v14, 1)) {
              break;
            }
            if (v4 >= v36) {
              return v3;
            }
            unint64_t v13 = *(void *)(v32 + 8 * v4);
            ++v14;
            if (v13) {
              goto LABEL_18;
            }
          }
LABEL_33:
          __break(1u);
          JUMPOUT(0x1C7BF21E8);
        }
      }
    }
LABEL_18:
    unint64_t v8 = (v13 - 1) & v13;
  }
  return v3;
}

uint64_t sub_1C7BF21FC()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1C7BF2234(void *a1)
{
  return sub_1C7BEFC04(a1, v1);
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

uint64_t type metadata accessor for SQLDatabase.Storage()
{
  uint64_t result = qword_1EBC68A48;
  if (!qword_1EBC68A48) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t type metadata accessor for SQLDatabase()
{
  return self;
}

uint64_t sub_1C7BF22C4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SQLDatabase.Storage();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1C7BF2320()
{
  unint64_t result = qword_1EBC68D00;
  if (!qword_1EBC68D00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBC68D00);
  }
  return result;
}

void sub_1C7BF2374(uint64_t a1)
{
  sub_1C7BF0F10(a1, v1);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_1C7BF23B8()
{
  unint64_t result = qword_1EA4FE3F0;
  if (!qword_1EA4FE3F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4FE3F0);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SQLiteError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
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
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SQLiteError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *unint64_t result = a2 + 4;
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
        JUMPOUT(0x1C7BF2574);
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
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

uint64_t sub_1C7BF259C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1C7BF25A4(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SQLiteError()
{
  return &type metadata for SQLiteError;
}

uint64_t method lookup function for SQLDatabase(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for SQLDatabase);
}

uint64_t dispatch thunk of SQLDatabase.close()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t *initializeBufferWithCopyOfBuffer for SQLDatabase.Storage(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_1C7BF40F0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t destroy for SQLDatabase.Storage(uint64_t a1)
{
  uint64_t v2 = sub_1C7BF40F0();
  int v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t initializeWithCopy for SQLDatabase.Storage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1C7BF40F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithCopy for SQLDatabase.Storage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1C7BF40F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t initializeWithTake for SQLDatabase.Storage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1C7BF40F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for SQLDatabase.Storage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1C7BF40F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t getEnumTagSinglePayload for SQLDatabase.Storage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1C7BF292C);
}

uint64_t sub_1C7BF292C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1C7BF40F0();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for SQLDatabase.Storage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1C7BF29AC);
}

uint64_t sub_1C7BF29AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1C7BF40F0();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t sub_1C7BF2A1C()
{
  uint64_t result = sub_1C7BF40F0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1C7BF2AB4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC68D10);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_1C7BF4370();
  __break(1u);
  return result;
}

void sub_1C7BF2BC4(uint64_t a1, unint64_t a2, void *a3, void (*a4)(uint64_t), uint64_t a5, uint64_t a6)
{
  unint64_t v10 = a2;
  uint64_t v11 = a1;
  *(void *)aBlock = a1;
  *(void *)&aBlock[8] = a2;
  uint64_t v62 = 32;
  unint64_t v63 = 0xE100000000000000;
  sub_1C7BF2320();
  if (sub_1C7BF42C0())
  {
    __break(1u);
    goto LABEL_27;
  }
  uint64_t v12 = a3[3];
  unint64_t v13 = *(os_unfair_lock_s **)(v12 + 16);
  os_unfair_lock_lock(v13);
  uint64_t v14 = a3[6];
  BOOL v15 = __OFADD__(v14, 1);
  uint64_t v16 = v14 + 1;
  if (v15)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  uint64_t v54 = a6;
  a3[6] = v16;
  os_unfair_lock_assert_owner(v13);
  uint64_t v17 = a3[5];
  uint64_t v18 = a3[6];
  uint64_t v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  uint64_t v53 = a4;
  os_unfair_lock_unlock(v13);
  sub_1C7BF42E0();
  swift_bridgeObjectRelease();
  strcpy(aBlock, "transaction_");
  aBlock[13] = 0;
  *(_WORD *)&aBlock[14] = -5120;
  uint64_t v55 = v11;
  unint64_t v56 = v10;
  _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
  _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
  uint64_t v62 = v19;
  sub_1C7BF4380();
  _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
  swift_bridgeObjectRelease();
  unint64_t v10 = *(void *)&aBlock[8];
  uint64_t v11 = *(void *)aBlock;
  unint64_t v20 = *(os_unfair_lock_s **)(v12 + 16);
  os_unfair_lock_lock(v20);
  uint64_t v21 = a3[7];
  if (v21 == -1)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  uint64_t v64 = v12;
  a3[7] = v21 + 1;
  sub_1C7BEE1BC(v21);
  os_unfair_lock_unlock(v20);
  id v22 = objc_allocWithZone(MEMORY[0x1E4F4F838]);
  swift_bridgeObjectRetain();
  swift_retain();
  unint64_t v23 = (void *)sub_1C7BF41A0();
  char v24 = (void *)sub_1C7BF41A0();
  swift_bridgeObjectRelease();
  v60 = sub_1C7BF2374;
  uint64_t v61 = a3;
  *(void *)aBlock = MEMORY[0x1E4F143A8];
  *(void *)&aBlock[8] = 1107296256;
  *(void *)&aBlock[16] = sub_1C7BEFCE4;
  v59 = &block_descriptor_30;
  id v25 = _Block_copy(aBlock);
  id v57 = objc_msgSend(v22, sel_initWithIdentifier_forReason_invalidationBlock_, v23, v24, v25);

  _Block_release(v25);
  swift_release();
  *(void *)aBlock = 0;
  *(void *)&aBlock[8] = 0xE000000000000000;
  *(void *)&aBlock[16] = sub_1C7BECE60(MEMORY[0x1E4FBC860]);
  MEMORY[0x1C87BD840](10);
  _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
  _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
  long long v26 = *(_OWORD *)aBlock;
  *(void *)aBlock = *(void *)&aBlock[16];
  *(_OWORD *)&aBlock[8] = v26;
  SQLDatabase.perform(_:)((uint64_t *)aBlock);
  if (!v6)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_1EBC68A70 == -1) {
      goto LABEL_9;
    }
    goto LABEL_31;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  os_log_type_t v27 = *(os_unfair_lock_s **)(v64 + 16);
  os_unfair_lock_lock(v27);
  uint64_t v28 = a3[6];
  BOOL v15 = __OFSUB__(v28, 1);
  uint64_t v29 = v28 - 1;
  if (!v15)
  {
    a3[6] = v29;
    os_unfair_lock_assert_owner(v27);
    os_unfair_lock_unlock(v27);
    swift_willThrow();
LABEL_18:
    objc_msgSend(v57, sel_invalidate);

    return;
  }
LABEL_30:
  __break(1u);
LABEL_31:
  swift_once();
LABEL_9:
  uint64_t v30 = sub_1C7BF4170();
  __swift_project_value_buffer(v30, (uint64_t)qword_1EBC68A58);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v31 = sub_1C7BF4160();
  os_log_type_t v32 = sub_1C7BF4230();
  if (os_log_type_enabled(v31, v32))
  {
    uint64_t v33 = swift_slowAlloc();
    uint64_t v52 = swift_slowAlloc();
    *(void *)aBlock = v52;
    *(_DWORD *)uint64_t v33 = 136446466;
    swift_bridgeObjectRetain();
    uint64_t v62 = sub_1C7BF1724(v55, v56, (uint64_t *)aBlock);
    sub_1C7BF42A0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v33 + 12) = 2082;
    swift_bridgeObjectRetain();
    uint64_t v62 = sub_1C7BF1724(v11, v10, (uint64_t *)aBlock);
    sub_1C7BF42A0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1C7BE6000, v31, v32, "Beginning db savepoint [%{public}s]: %{public}s", (uint8_t *)v33, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1C87BDF10](v52, -1, -1);
    MEMORY[0x1C87BDF10](v33, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  uint64_t v34 = v64;
  unint64_t v35 = *(os_unfair_lock_s **)(v64 + 16);
  os_unfair_lock_lock(v35);
  uint64_t v37 = a3[5];
  uint64_t v36 = a3[6];
  BOOL v15 = __OFSUB__(v36, 1);
  uint64_t v38 = v36 - 1;
  if (v15)
  {
    __break(1u);
    goto LABEL_33;
  }
  a3[6] = v38;
  os_unfair_lock_assert_owner(v35);
  uint64_t v39 = a3[5];
  BOOL v15 = __OFADD__(v39, 1);
  uint64_t v40 = v39 + 1;
  if (v15)
  {
LABEL_33:
    __break(1u);
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  a3[5] = v40;
  os_unfair_lock_assert_owner(v35);
  os_unfair_lock_unlock(v35);
  v53(v54);
  if (v6)
  {
    sub_1C7BF0808(v55, v56, v11, v10);
    swift_bridgeObjectRelease();
    swift_willThrow();
    uint64_t v41 = *(os_unfair_lock_s **)(v34 + 16);
    os_unfair_lock_lock(v41);
    uint64_t v42 = a3[5];
    BOOL v15 = __OFSUB__(v42, 1);
    uint64_t v43 = v42 - 1;
    if (!v15)
    {
      a3[5] = v43;
      os_unfair_lock_assert_owner(v41);
      os_unfair_lock_unlock(v41);
      goto LABEL_18;
    }
    goto LABEL_34;
  }
  sub_1C7BF0544(v55, v56, v11, v10);
  swift_bridgeObjectRelease();
  if (v37)
  {
    swift_retain();
    os_log_type_t v44 = sub_1C7BF4160();
    os_log_type_t v45 = sub_1C7BF4230();
    if (os_log_type_enabled(v44, v45))
    {
      v46 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v46 = 134349056;
      uint64_t v47 = *(os_unfair_lock_s **)(v64 + 16);
      os_unfair_lock_lock(v47);
      uint64_t v48 = a3[5];
      os_unfair_lock_unlock(v47);
      *(void *)aBlock = v48;
      uint64_t v34 = v64;
      sub_1C7BF42A0();
      swift_release();
      _os_log_impl(&dword_1C7BE6000, v44, v45, "Outstanding transactions remaining: %{public}ld", v46, 0xCu);
      MEMORY[0x1C87BDF10](v46, -1, -1);
    }
    else
    {

      swift_release();
    }
  }
  else
  {
    sub_1C7BF0B64((uint64_t)a3, v55, v56);
  }
  uint64_t v49 = *(os_unfair_lock_s **)(v34 + 16);
  os_unfair_lock_lock(v49);
  uint64_t v50 = a3[5];
  BOOL v15 = __OFSUB__(v50, 1);
  uint64_t v51 = v50 - 1;
  if (!v15)
  {
    a3[5] = v51;
    os_unfair_lock_assert_owner(v49);
    os_unfair_lock_unlock(v49);
    objc_msgSend(v57, sel_invalidate);

    return;
  }
LABEL_35:
  __break(1u);
}

void sub_1C7BF33F8(unint64_t a1, unint64_t a2, void *a3, unsigned int a4, uint64_t a5, unint64_t *a6, void *a7, unsigned int a8)
{
  unint64_t v15 = a1;
  *(void *)aBlock = a1;
  *(void *)&aBlock[8] = a2;
  uint64_t v72 = 32;
  unint64_t v73 = 0xE100000000000000;
  sub_1C7BF2320();
  if (sub_1C7BF42C0())
  {
    __break(1u);
    goto LABEL_29;
  }
  uint64_t v63 = a5;
  uint64_t v16 = a3[3];
  uint64_t v17 = *(os_unfair_lock_s **)(v16 + 16);
  os_unfair_lock_lock(v17);
  uint64_t v18 = a3[6];
  BOOL v19 = __OFADD__(v18, 1);
  uint64_t v20 = v18 + 1;
  if (v19)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  uint64_t v62 = a6;
  a3[6] = v20;
  os_unfair_lock_assert_owner(v17);
  uint64_t v21 = a3[5];
  uint64_t v22 = a3[6];
  uint64_t v23 = v21 + v22;
  if (__OFADD__(v21, v22))
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  v60 = a7;
  unsigned int v61 = a8;
  os_unfair_lock_unlock(v17);
  sub_1C7BF42E0();
  swift_bridgeObjectRelease();
  strcpy(aBlock, "transaction_");
  aBlock[13] = 0;
  *(_WORD *)&aBlock[14] = -5120;
  uint64_t v65 = v15;
  unint64_t v66 = a2;
  _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
  _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
  uint64_t v72 = v23;
  sub_1C7BF4380();
  _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
  swift_bridgeObjectRelease();
  unint64_t v15 = *(void *)&aBlock[8];
  uint64_t v24 = *(void *)aBlock;
  id v25 = *(os_unfair_lock_s **)(v16 + 16);
  os_unfair_lock_lock(v25);
  uint64_t v26 = a3[7];
  if (v26 == -1)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  uint64_t v74 = v16;
  a3[7] = v26 + 1;
  sub_1C7BEE1BC(v26);
  os_unfair_lock_unlock(v25);
  id v27 = objc_allocWithZone(MEMORY[0x1E4F4F838]);
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v28 = (void *)sub_1C7BF41A0();
  uint64_t v29 = (void *)sub_1C7BF41A0();
  swift_bridgeObjectRelease();
  v70 = sub_1C7BF2374;
  v71 = a3;
  *(void *)aBlock = MEMORY[0x1E4F143A8];
  *(void *)&aBlock[8] = 1107296256;
  *(void *)&aBlock[16] = sub_1C7BEFCE4;
  v69 = &block_descriptor_23;
  uint64_t v30 = _Block_copy(aBlock);
  id v67 = objc_msgSend(v27, sel_initWithIdentifier_forReason_invalidationBlock_, v28, v29, v30);

  _Block_release(v30);
  swift_release();
  *(void *)aBlock = 0;
  *(void *)&aBlock[8] = 0xE000000000000000;
  *(void *)&aBlock[16] = sub_1C7BECE60(MEMORY[0x1E4FBC860]);
  MEMORY[0x1C87BD840](10);
  _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
  _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
  long long v31 = *(_OWORD *)aBlock;
  *(void *)aBlock = *(void *)&aBlock[16];
  *(_OWORD *)&aBlock[8] = v31;
  SQLDatabase.perform(_:)((uint64_t *)aBlock);
  if (!v8)
  {
    uint64_t v59 = v24;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_1EBC68A70 == -1) {
      goto LABEL_9;
    }
    goto LABEL_33;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  os_log_type_t v32 = *(os_unfair_lock_s **)(v74 + 16);
  os_unfair_lock_lock(v32);
  uint64_t v33 = a3[6];
  BOOL v19 = __OFSUB__(v33, 1);
  uint64_t v34 = v33 - 1;
  if (!v19)
  {
    a3[6] = v34;
    os_unfair_lock_assert_owner(v32);
    os_unfair_lock_unlock(v32);
    swift_willThrow();
LABEL_23:
    objc_msgSend(v67, sel_invalidate);

    return;
  }
LABEL_32:
  __break(1u);
LABEL_33:
  swift_once();
LABEL_9:
  uint64_t v35 = sub_1C7BF4170();
  __swift_project_value_buffer(v35, (uint64_t)qword_1EBC68A58);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v36 = sub_1C7BF4160();
  os_log_type_t v37 = sub_1C7BF4230();
  if (os_log_type_enabled(v36, v37))
  {
    uint64_t v38 = swift_slowAlloc();
    uint64_t v58 = swift_slowAlloc();
    *(void *)aBlock = v58;
    *(_DWORD *)uint64_t v38 = 136446466;
    swift_bridgeObjectRetain();
    uint64_t v72 = sub_1C7BF1724(v65, v66, (uint64_t *)aBlock);
    sub_1C7BF42A0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v38 + 12) = 2082;
    swift_bridgeObjectRetain();
    uint64_t v72 = sub_1C7BF1724(v59, v15, (uint64_t *)aBlock);
    sub_1C7BF42A0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1C7BE6000, v36, v37, "Beginning db savepoint [%{public}s]: %{public}s", (uint8_t *)v38, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1C87BDF10](v58, -1, -1);
    MEMORY[0x1C87BDF10](v38, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  uint64_t v39 = v74;
  uint64_t v40 = *(os_unfair_lock_s **)(v74 + 16);
  os_unfair_lock_lock(v40);
  uint64_t v41 = a3[6];
  BOOL v19 = __OFSUB__(v41, 1);
  uint64_t v42 = v41 - 1;
  if (v19)
  {
    __break(1u);
    goto LABEL_35;
  }
  uint64_t v43 = a3[5];
  a3[6] = v42;
  os_unfair_lock_assert_owner(v40);
  uint64_t v44 = a3[5];
  BOOL v19 = __OFADD__(v44, 1);
  uint64_t v45 = v44 + 1;
  if (v19)
  {
LABEL_35:
    __break(1u);
    __break(1u);
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  a3[5] = v45;
  os_unfair_lock_assert_owner(v40);
  os_unfair_lock_unlock(v40);
  char v46 = sub_1C7BF0F6C(a4, v63, v62, v60, v61);
  if (v8)
  {
    sub_1C7BF0808(v65, v66, v59, v15);
    swift_bridgeObjectRelease();
    swift_willThrow();
    uint64_t v52 = *(os_unfair_lock_s **)(v39 + 16);
    os_unfair_lock_lock(v52);
    uint64_t v53 = a3[5];
    BOOL v19 = __OFSUB__(v53, 1);
    uint64_t v54 = v53 - 1;
    if (!v19)
    {
      a3[5] = v54;
      os_unfair_lock_assert_owner(v52);
      os_unfair_lock_unlock(v52);
      goto LABEL_23;
    }
    goto LABEL_36;
  }
  if (v46) {
    sub_1C7BF0544(v65, v66, v59, v15);
  }
  else {
    sub_1C7BF0808(v65, v66, v59, v15);
  }
  swift_bridgeObjectRelease();
  if (v43)
  {
    swift_retain();
    uint64_t v47 = sub_1C7BF4160();
    os_log_type_t v48 = sub_1C7BF4230();
    if (os_log_type_enabled(v47, v48))
    {
      uint64_t v49 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v49 = 134349056;
      uint64_t v50 = *(os_unfair_lock_s **)(v74 + 16);
      os_unfair_lock_lock(v50);
      uint64_t v51 = a3[5];
      os_unfair_lock_unlock(v50);
      *(void *)aBlock = v51;
      uint64_t v39 = v74;
      sub_1C7BF42A0();
      swift_release();
      _os_log_impl(&dword_1C7BE6000, v47, v48, "Outstanding transactions remaining: %{public}ld", v49, 0xCu);
      MEMORY[0x1C87BDF10](v49, -1, -1);
    }
    else
    {

      swift_release();
    }
  }
  else
  {
    sub_1C7BF0B64((uint64_t)a3, v65, v66);
  }
  uint64_t v55 = *(os_unfair_lock_s **)(v39 + 16);
  os_unfair_lock_lock(v55);
  uint64_t v56 = a3[5];
  BOOL v19 = __OFSUB__(v56, 1);
  uint64_t v57 = v56 - 1;
  if (!v19)
  {
    a3[5] = v57;
    os_unfair_lock_assert_owner(v55);
    os_unfair_lock_unlock(v55);
    objc_msgSend(v67, sel_invalidate);

    return;
  }
LABEL_37:
  __break(1u);
}

uint64_t sub_1C7BF3C74()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C7BF3CAC(uint64_t a1)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  uint64_t v4 = a1;
  return v2(&v4);
}

uint64_t sub_1C7BF3CDC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 8 * a1 + 32;
    unint64_t v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_1C7BF4370();
  __break(1u);
  return result;
}

uint64_t sub_1C7BF3DD0()
{
  return swift_release();
}

unint64_t sub_1C7BF3DD8()
{
  unint64_t result = qword_1EBC68D20;
  if (!qword_1EBC68D20)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBC68D20);
  }
  return result;
}

uint64_t sub_1C7BF3E30()
{
  uint64_t v0 = sub_1C7BF4140();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  int v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1C7BF4170();
  __swift_allocate_value_buffer(v4, qword_1EBC68A58);
  __swift_project_value_buffer(v4, (uint64_t)qword_1EBC68A58);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4F18030], v0);
  return sub_1C7BF4150();
}

uint64_t static Logger.database.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_1EBC68A70 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1C7BF4170();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1EBC68A58);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
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

uint64_t sub_1C7BF4040()
{
  return MEMORY[0x1F40E37C0]();
}

uint64_t sub_1C7BF4050()
{
  return MEMORY[0x1F40E37D0]();
}

uint64_t sub_1C7BF4060()
{
  return MEMORY[0x1F40E37E0]();
}

uint64_t sub_1C7BF4070()
{
  return MEMORY[0x1F40E37F0]();
}

uint64_t sub_1C7BF4080()
{
  return MEMORY[0x1F40E3800]();
}

uint64_t sub_1C7BF4090()
{
  return MEMORY[0x1F40E3818]();
}

uint64_t sub_1C7BF40A0()
{
  return MEMORY[0x1F40E3830]();
}

uint64_t sub_1C7BF40B0()
{
  return MEMORY[0x1F40E3B70]();
}

uint64_t sub_1C7BF40C0()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1C7BF40D0()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1C7BF40E0()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1C7BF40F0()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1C7BF4100()
{
  return MEMORY[0x1F40E4BC8]();
}

uint64_t sub_1C7BF4110()
{
  return MEMORY[0x1F40E4C80]();
}

uint64_t sub_1C7BF4120()
{
  return MEMORY[0x1F40E4CA8]();
}

uint64_t sub_1C7BF4130()
{
  return MEMORY[0x1F40E4CD8]();
}

uint64_t sub_1C7BF4140()
{
  return MEMORY[0x1F40D3790]();
}

uint64_t sub_1C7BF4150()
{
  return MEMORY[0x1F40D39A0]();
}

uint64_t sub_1C7BF4160()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1C7BF4170()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1C7BF4180()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1C7BF4190()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1C7BF41A0()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1C7BF41B0()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1C7BF41C0()
{
  return MEMORY[0x1F40E62E8]();
}

uint64_t sub_1C7BF41D0()
{
  return MEMORY[0x1F4183908]();
}

uint64_t sub_1C7BF41E0()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1C7BF4200()
{
  return MEMORY[0x1F4183A60]();
}

uint64_t sub_1C7BF4210()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1C7BF4220()
{
  return MEMORY[0x1F4183C18]();
}

uint64_t sub_1C7BF4230()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1C7BF4240()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1C7BF4250()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1C7BF4260()
{
  return MEMORY[0x1F40E6800]();
}

uint64_t sub_1C7BF4270()
{
  return MEMORY[0x1F40E6808]();
}

uint64_t sub_1C7BF4280()
{
  return MEMORY[0x1F40E6810]();
}

uint64_t sub_1C7BF4290()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1C7BF42A0()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1C7BF42B0()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1C7BF42C0()
{
  return MEMORY[0x1F40E6D88]();
}

uint64_t sub_1C7BF42D0()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1C7BF42E0()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1C7BF42F0()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1C7BF4300()
{
  return MEMORY[0x1F4184D20]();
}

uint64_t sub_1C7BF4310()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1C7BF4320()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1C7BF4330()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1C7BF4340()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1C7BF4350()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1C7BF4360()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1C7BF4370()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1C7BF4380()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1C7BF4390()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1C7BF43A0()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1C7BF43B0()
{
  return MEMORY[0x1F40E6E30]();
}

uint64_t sub_1C7BF43C0()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1C7BF43D0()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1C7BF43E0()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1C7BF43F0()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1C7BF4400()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1C7BF4410()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1C7BF4420()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1C7BF4430()
{
  return MEMORY[0x1F4186318]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
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

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}