uint64_t sub_258E4C760()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(void);
  sqlite3 *v8;
  sqlite3 *v9;
  uint64_t v11;

  v1 = v0;
  OUTLINED_FUNCTION_0();
  v2 = sub_258E54020();
  v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  *(void *)(v0 + 16) = 0;
  sub_258E53FA0();
  v4 = sub_258E53FC0();
  v6 = v5;
  v7 = *(void (**)(void))(v3 + 8);
  OUTLINED_FUNCTION_1();
  v7();
  v8 = sub_258E4C8C8(v4, v6);
  if (v11)
  {
    swift_release();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_1();
    v7();
  }
  else
  {
    v9 = v8;
    OUTLINED_FUNCTION_1();
    v7();
    swift_bridgeObjectRelease();
    *(void *)(v1 + 16) = v9;
  }
  return v1;
}

sqlite3 *sub_258E4C8C8(uint64_t a1, uint64_t a2)
{
  v4 = (sqlite3 **)swift_slowAlloc();
  v5 = v4;
  *v4 = 0;
  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    sub_258E54170();
    int v9 = *(_DWORD *)filename;
  }
  else
  {
    MEMORY[0x270FA5388](v4);
    if ((a2 & 0x2000000000000000) != 0)
    {
      *(void *)filename = a1;
      uint64_t v14 = a2 & 0xFFFFFFFFFFFFFFLL;
      int v9 = sqlite3_open_v2(filename, v5, v6, 0);
    }
    else
    {
      if ((a1 & 0x1000000000000000) != 0)
      {
        uint64_t v7 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        uint64_t v8 = a1 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v7 = sub_258E54180();
      }
      int v9 = sub_258E536B8(v7, v8, (void *(*)(uint64_t *__return_ptr))sub_258E4E2F8);
    }
  }
  v10 = *v5;
  if (*v5)
  {
    if (!v9)
    {
      MEMORY[0x25A2D25C0](v5, -1, -1);
      return v10;
    }
    sub_258E4CB7C(*v5);
    sub_258E4DF44();
    swift_allocError();
    *(_DWORD *)uint64_t v11 = v9;
  }
  else
  {
    sub_258E4DF44();
    swift_allocError();
    *(_DWORD *)uint64_t v11 = 0;
  }
  *(unsigned char *)(v11 + 4) = v10 == 0;
  swift_willThrow();
  MEMORY[0x25A2D25C0](v5, -1, -1);
  return v10;
}

void sub_258E4CAEC()
{
  v1 = *(sqlite3 **)(v0 + 16);
  if (v1)
  {
    sub_258E4CB7C(v1);
    *(void *)(v0 + 16) = 0;
  }
}

uint64_t sub_258E4CB10()
{
  sub_258E4CAEC();

  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for DataStore()
{
  return self;
}

void type metadata accessor for URLResourceKey(uint64_t a1)
{
}

void sub_258E4CB7C(sqlite3 *a1)
{
  if (sqlite3_close_v2(a1))
  {
    if (qword_26B2EFDD8 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_258E540B0();
    __swift_project_value_buffer(v1, (uint64_t)qword_26B2F0080);
    oslog = sub_258E54090();
    os_log_type_t v2 = sub_258E54130();
    if (os_log_type_enabled(oslog, v2))
    {
      v3 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v3 = 67240192;
      sub_258E54150();
      _os_log_impl(&dword_258E4B000, oslog, v2, "Close db connection failed with code %{public}d", v3, 8u);
      MEMORY[0x25A2D25C0](v3, -1, -1);
    }
    else
    {
    }
  }
}

uint64_t sub_258E4CCBC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v9 = swift_allocObject();
  *(unsigned char *)(v9 + 16) = a4;
  sub_258E519CC(a1, a2, a3, 1, 2, (void (*)(char *__return_ptr, uint64_t, sqlite3_stmt *))sub_258E4DFA0, v9, &v12);
  uint64_t result = swift_release();
  if (!v4)
  {
    if (v13 == 255)
    {
      sub_258E4DF44();
      swift_allocError();
      *(_DWORD *)uint64_t v11 = 2;
      *(unsigned char *)(v11 + 4) = 1;
      return swift_willThrow();
    }
    else
    {
      return v12;
    }
  }
  return result;
}

void sub_258E4CDBC(sqlite3_stmt *a1@<X1>, char a2@<W2>, uint64_t a3@<X8>)
{
  switch(sqlite3_column_type(a1, 0))
  {
    case 1:
      if (!a2)
      {
        sqlite3_column_int64(a1, 0);
        uint64_t v8 = sub_258E541A0();
        goto LABEL_27;
      }
      if (a2 == 1)
      {
        *(void *)a3 = sqlite3_column_int64(a1, 0);
        *(void *)(a3 + 8) = 0;
        char v7 = 1;
        break;
      }
      if (a2 != 4) {
        goto LABEL_21;
      }
      *(void *)a3 = sqlite3_column_int(a1, 0);
      *(void *)(a3 + 8) = 0;
      *(unsigned char *)(a3 + 16) = 0;
      return;
    case 2:
      if (!a2)
      {
        sqlite3_column_double(a1, 0);
        uint64_t v8 = sub_258E54120();
        goto LABEL_27;
      }
      if (a2 == 2 || a2 == 5)
      {
        *(double *)a3 = sqlite3_column_double(a1, 0);
        *(void *)(a3 + 8) = 0;
        char v7 = 4;
        break;
      }
      goto LABEL_21;
    case 3:
      if (a2) {
        goto LABEL_21;
      }
      if (sqlite3_column_bytes(a1, 0) >= 1 && sqlite3_column_text(a1, 0))
      {
        uint64_t v8 = sub_258E54110();
LABEL_27:
        *(void *)a3 = v8;
        *(void *)(a3 + 8) = v9;
      }
      else
      {
        *(_OWORD *)a3 = xmmword_258E546B0;
      }
      char v7 = 2;
      break;
    case 4:
      if (a2 != 3) {
        goto LABEL_21;
      }
      int v10 = sqlite3_column_bytes(a1, 0);
      if (v10 >= 1 && (int v11 = v10, (v12 = sqlite3_column_blob(a1, 0)) != 0))
      {
        *(void *)a3 = MEMORY[0x25A2D1FE0](v12, v11);
        *(void *)(a3 + 8) = v13;
      }
      else
      {
        *(_OWORD *)a3 = xmmword_258E546C0;
      }
      char v7 = 3;
      break;
    default:
LABEL_21:
      *(void *)a3 = 0;
      *(void *)(a3 + 8) = 0;
      char v7 = -1;
      break;
  }
  *(unsigned char *)(a3 + 16) = v7;
}

uint64_t sub_258E4CFB0@<X0>(char *zSql@<X0>, sqlite3 *db@<X1>, sqlite3_stmt **ppStmt@<X2>, const char **pzTail@<X3>, _DWORD *a5@<X8>)
{
  uint64_t result = sqlite3_prepare_v2(db, zSql, -1, ppStmt, pzTail);
  *a5 = result;
  return result;
}

uint64_t sub_258E4CFF8(uint64_t result)
{
  if (result)
  {
    int v1 = result;
    sub_258E4DF44();
    swift_allocError();
    *(_DWORD *)uint64_t v2 = v1;
    *(unsigned char *)(v2 + 4) = 0;
    return swift_willThrow();
  }
  return result;
}

void *sub_258E4D054()
{
  OUTLINED_FUNCTION_0();
  uint64_t v4 = v3;
  uint64_t v5 = v2;
  unint64_t v6 = v1;
  uint64_t v7 = v0;
  switch(v8)
  {
    case 1:
      uint64_t v11 = v2 + 1;
      if (__OFADD__(v2, 1)) {
        goto LABEL_47;
      }
      if (v11 < (uint64_t)0xFFFFFFFF80000000) {
        goto LABEL_48;
      }
      if (v11 > 0x7FFFFFFF) {
        goto LABEL_49;
      }
      return (void *)sqlite3_bind_int64(v3, v11, v0);
    case 2:
      uint64_t v12 = MEMORY[0x270FA5388](v0);
      if ((v6 & 0x1000000000000000) == 0 && v6 & 0x2000000000000000 | v7 & 0x1000000000000000)
      {
        MEMORY[0x270FA5388](v12);
        if ((v6 & 0x2000000000000000) == 0)
        {
          if ((v7 & 0x1000000000000000) == 0) {
            goto LABEL_52;
          }
          uint64_t v13 = (v6 & 0xFFFFFFFFFFFFFFFLL) + 32;
          uint64_t v14 = v7 & 0xFFFFFFFFFFFFLL;
          return sub_258E536B8(v13, v14, (void *(*)(uint64_t *__return_ptr))sub_258E4DDF4);
        }
        *(void *)v23 = v7;
        uint64_t v24 = v6 & 0xFFFFFFFFFFFFFFLL;
        uint64_t v18 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
          __break(1u);
        }
        else if (v18 >= (uint64_t)0xFFFFFFFF80000000)
        {
          if (v18 <= 0x7FFFFFFF)
          {
            if (qword_26B2EFF40 == -1) {
              return (void *)sqlite3_bind_text(v4, v5 + 1, v23, -1, (void (__cdecl *)(void *))qword_26B2EFF48);
            }
LABEL_56:
            swift_once();
            return (void *)sqlite3_bind_text(v4, v5 + 1, v23, -1, (void (__cdecl *)(void *))qword_26B2EFF48);
          }
LABEL_55:
          __break(1u);
          goto LABEL_56;
        }
        __break(1u);
        goto LABEL_55;
      }
      sub_258E54170();
      return (void *)*(unsigned int *)v23;
    case 3:
      switch(v1 >> 62)
      {
        case 1uLL:
          if (v0 >> 32 < (int)v0)
          {
            __break(1u);
            JUMPOUT(0x258E4D460);
          }
          sub_258E4DE34(v0, v1);
          uint64_t v20 = OUTLINED_FUNCTION_2((int)v7, v7 >> 32, v6);
          goto LABEL_39;
        case 2uLL:
          uint64_t v21 = *(void *)(v0 + 16);
          uint64_t v22 = *(void *)(v0 + 24);
          sub_258E4DE10(v0, v1, 3);
          swift_retain();
          swift_retain();
          uint64_t v19 = OUTLINED_FUNCTION_2(v21, v22, v6);
          swift_release();
          swift_release();
          goto LABEL_40;
        case 3uLL:
          uint64_t v0 = 0;
          uint64_t v16 = 0;
          goto LABEL_38;
        default:
          uint64_t v16 = v1 & 0xFFFFFFFFFFFFFFLL;
LABEL_38:
          uint64_t v20 = sub_258E4DADC(v0, v16, v3, v2);
LABEL_39:
          uint64_t v19 = v20;
LABEL_40:
          sub_258E4DE8C(v7, v6, 3);
          break;
      }
      return (void *)v19;
    case 4:
      uint64_t v17 = v2 + 1;
      if (__OFADD__(v2, 1))
      {
        __break(1u);
LABEL_44:
        __break(1u);
LABEL_45:
        __break(1u);
LABEL_46:
        __break(1u);
LABEL_47:
        __break(1u);
LABEL_48:
        __break(1u);
LABEL_49:
        __break(1u);
      }
      else if (v17 >= (uint64_t)0xFFFFFFFF80000000)
      {
        if (v17 <= 0x7FFFFFFF)
        {
          return (void *)sqlite3_bind_double(v3, v17, *(double *)&v0);
        }
LABEL_51:
        __break(1u);
LABEL_52:
        uint64_t v13 = sub_258E54180();
        return sub_258E536B8(v13, v14, (void *(*)(uint64_t *__return_ptr))sub_258E4DDF4);
      }
      __break(1u);
      goto LABEL_51;
    default:
      uint64_t v9 = v2 + 1;
      if (__OFADD__(v2, 1)) {
        goto LABEL_44;
      }
      if (v9 < (uint64_t)0xFFFFFFFF80000000) {
        goto LABEL_45;
      }
      if (v9 > 0x7FFFFFFF) {
        goto LABEL_46;
      }
      return (void *)sqlite3_bind_int(v3, v9, v0);
  }
}

uint64_t sub_258E4D484@<X0>(char *a1@<X0>, sqlite3_stmt *a2@<X1>, uint64_t a3@<X2>, _DWORD *a4@<X8>)
{
  uint64_t v7 = a3 + 1;
  if (__OFADD__(a3, 1))
  {
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v4 = a4;
  if (v7 < (uint64_t)0xFFFFFFFF80000000)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (v7 > 0x7FFFFFFF)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  unint64_t v6 = a2;
  uint64_t v5 = a1;
  if (qword_26B2EFF40 != -1) {
LABEL_9:
  }
    swift_once();
  uint64_t result = sqlite3_bind_text(v6, v7, v5, -1, (void (__cdecl *)(void *))qword_26B2EFF48);
  *uint64_t v4 = result;
  return result;
}

void sub_258E4D540()
{
  qword_26B2EFF48 = -1;
}

uint64_t sub_258E4D560()
{
  uint64_t v0 = sub_258E540F0();
  uint64_t v2 = v1;
  if (v0 == sub_258E540F0() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_258E541B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_258E4D5E8()
{
  return sub_258E4D7A8(*v0, MEMORY[0x263F07B58]);
}

uint64_t sub_258E4D61C(uint64_t a1, id *a2)
{
  uint64_t result = sub_258E540D0();
  *a2 = 0;
  return result;
}

uint64_t sub_258E4D698(uint64_t a1, id *a2)
{
  char v3 = sub_258E540E0();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_258E4D718@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_258E4D740();
  *a1 = result;
  return result;
}

uint64_t sub_258E4D740()
{
  sub_258E540F0();
  uint64_t v0 = sub_258E540C0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_258E4D778()
{
  return sub_258E4D7A8(*v0, MEMORY[0x263F8D308]);
}

uint64_t sub_258E4D7A8(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = sub_258E540F0();
  uint64_t v4 = a2(v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_258E4D7E8()
{
  return sub_258E4D7F0();
}

uint64_t sub_258E4D7F0()
{
  sub_258E540F0();
  sub_258E54100();

  return swift_bridgeObjectRelease();
}

uint64_t sub_258E4D844()
{
  return sub_258E4D84C();
}

uint64_t sub_258E4D84C()
{
  sub_258E540F0();
  sub_258E54200();
  sub_258E54100();
  uint64_t v0 = sub_258E54220();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_258E4D8C0()
{
  return sub_258E4D560();
}

uint64_t sub_258E4D8CC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_258E540C0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_258E4D914@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_258E4D940(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_258E4D944(uint64_t a1)
{
  uint64_t v2 = sub_258E4DA44(&qword_26A0CFA48);
  uint64_t v3 = sub_258E4DA44(&qword_26A0CFA50);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_258E4D9DC()
{
  return sub_258E4DA44(&qword_26A0CFA30);
}

uint64_t sub_258E4DA10()
{
  return sub_258E4DA44(&qword_26A0CFA38);
}

uint64_t sub_258E4DA44(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for URLResourceKey(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_258E4DA88()
{
  return sub_258E4DA44(&qword_26A0CFA40);
}

uint64_t sub_258E4DABC@<X0>(char *a1@<X0>, _DWORD *a2@<X8>)
{
  return sub_258E4D484(a1, *(sqlite3_stmt **)(v2 + 16), *(void *)(v2 + 24), a2);
}

uint64_t sub_258E4DADC(uint64_t a1, uint64_t a2, sqlite3_stmt *a3, uint64_t a4)
{
  return sub_258E4DD1C(a1, a2 & 0xFFFFFFFFFFFFLL, BYTE6(a2), a3, a4);
}

uint64_t sub_258E4DB08(uint64_t a1, uint64_t a2, int a3, sqlite3_stmt *a4, uint64_t a5)
{
  LODWORD(v7) = a3;
  int v10 = (char *)sub_258E53F20();
  if (!v10)
  {
LABEL_4:
    BOOL v12 = __OFSUB__(a2, a1);
    uint64_t v13 = a2 - a1;
    if (v12)
    {
      __break(1u);
    }
    else
    {
      uint64_t v14 = sub_258E53F30();
      if (v14 >= v13) {
        uint64_t v15 = v13;
      }
      else {
        uint64_t v15 = v14;
      }
      uint64_t v7 = a5 + 1;
      if (!__OFADD__(a5, 1))
      {
        if (v7 >= (uint64_t)0xFFFFFFFF80000000)
        {
          if (v7 <= 0x7FFFFFFF)
          {
            if (v10) {
              a5 = v15;
            }
            else {
              a5 = 0;
            }
            if (a5 >= (uint64_t)0xFFFFFFFF80000000)
            {
              if (a5 <= 0x7FFFFFFF)
              {
                if (qword_26B2EFF40 == -1) {
                  return sqlite3_bind_blob(a4, v7, v10, a5, (void (__cdecl *)(void *))qword_26B2EFF48);
                }
LABEL_24:
                swift_once();
                return sqlite3_bind_blob(a4, v7, v10, a5, (void (__cdecl *)(void *))qword_26B2EFF48);
              }
LABEL_23:
              __break(1u);
              goto LABEL_24;
            }
LABEL_22:
            __break(1u);
            goto LABEL_23;
          }
LABEL_21:
          __break(1u);
          goto LABEL_22;
        }
LABEL_20:
        __break(1u);
        goto LABEL_21;
      }
    }
    __break(1u);
    goto LABEL_20;
  }
  uint64_t result = sub_258E53F40();
  if (!__OFSUB__(a1, result))
  {
    v10 += a1 - result;
    goto LABEL_4;
  }
  __break(1u);
  return result;
}

uint64_t sub_258E4DC38(void *a1, int a2, uint64_t a3, sqlite3_stmt *a4, uint64_t a5)
{
  uint64_t v8 = a5 + 1;
  if (__OFADD__(a5, 1))
  {
    __break(1u);
    goto LABEL_12;
  }
  if (v8 < (uint64_t)0xFFFFFFFF80000000)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (v8 > 0x7FFFFFFF)
  {
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v5 = a1;
  if (a1) {
    uint64_t v7 = a3;
  }
  else {
    uint64_t v7 = 0;
  }
  if (v7 < (uint64_t)0xFFFFFFFF80000000) {
    goto LABEL_14;
  }
  if (v7 > 0x7FFFFFFF)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  unint64_t v6 = a4;
  if (qword_26B2EFF40 != -1) {
LABEL_16:
  }
    swift_once();
  return sqlite3_bind_blob(v6, v8, v5, v7, (void (__cdecl *)(void *))qword_26B2EFF48);
}

uint64_t sub_258E4DD1C(uint64_t a1, uint64_t a2, uint64_t a3, sqlite3_stmt *a4, uint64_t a5)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v8 = a1;
  __int16 v9 = a2;
  char v10 = BYTE2(a2);
  char v11 = BYTE3(a2);
  char v12 = BYTE4(a2);
  char v13 = BYTE5(a2);
  uint64_t result = sub_258E4DF08(&v8, (int)&v14, a3, a4, a5, &v7, &v14);
  if (!v5) {
    return v14;
  }
  return result;
}

void *sub_258E4DDF4@<X0>(_DWORD *a1@<X8>)
{
  return sub_258E53714(*(void *(**)(uint64_t *__return_ptr))(v1 + 16), a1);
}

uint64_t sub_258E4DE10(uint64_t result, unint64_t a2, char a3)
{
  if (a3 == 3) {
    return sub_258E4DE34(result, a2);
  }
  if (a3 == 2) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_258E4DE34(uint64_t a1, unint64_t a2)
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

uint64_t sub_258E4DE8C(uint64_t result, unint64_t a2, char a3)
{
  if (a3 == 3) {
    return sub_258E4DEB0(result, a2);
  }
  if (a3 == 2) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_258E4DEB0(uint64_t a1, unint64_t a2)
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

uint64_t sub_258E4DF08@<X0>(void *a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, sqlite3_stmt *a4@<X3>, uint64_t a5@<X4>, void *a6@<X6>, _DWORD *a7@<X8>)
{
  uint64_t result = sub_258E4DC38(a1, a2, a3, a4, a5);
  if (v7) {
    *a6 = v7;
  }
  else {
    *a7 = result;
  }
  return result;
}

unint64_t sub_258E4DF44()
{
  unint64_t result = qword_26B2EFDD0;
  if (!qword_26B2EFDD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2EFDD0);
  }
  return result;
}

uint64_t sub_258E4DF90()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

void sub_258E4DFA0(sqlite3_stmt *a1@<X1>, uint64_t a2@<X8>)
{
  sub_258E4CDBC(a1, *(unsigned char *)(v2 + 16), a2);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_258E4DFF4@<X0>(const char *a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result = sqlite3_open_v2(a1, *(sqlite3 ***)(v2 + 16), *(_DWORD *)(v2 + 24), 0);
  *a2 = result;
  return result;
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

void sub_258E4E044(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t __swift_memcpy5_4(uint64_t result, int *a2)
{
  int v2 = *a2;
  *(unsigned char *)(result + 4) = *((unsigned char *)a2 + 4);
  *(_DWORD *)uint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for DataStore.Error(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 5)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for DataStore.Error(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(unsigned char *)(result + 4) = 0;
    *(_DWORD *)uint64_t result = a2 - 1;
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
  *(unsigned char *)(result + 5) = v3;
  return result;
}

uint64_t sub_258E4E0F0(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 4)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_258E4E110(uint64_t result, int a2)
{
  if (a2)
  {
    *(_DWORD *)uint64_t result = a2 - 1;
    char v2 = 1;
  }
  else
  {
    char v2 = 0;
  }
  *(unsigned char *)(result + 4) = v2;
  return result;
}

ValueMetadata *type metadata accessor for DataStore.Error()
{
  return &type metadata for DataStore.Error;
}

uint64_t destroy for DataStoreValue(uint64_t a1)
{
  return sub_258E4DE8C(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t _s18PegasusPersistence14DataStoreValueOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_258E4DE10(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for DataStoreValue(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_258E4DE10(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  unint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_258E4DE8C(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for DataStoreValue(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  unint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_258E4DE8C(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for DataStoreValue(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFC && *(unsigned char *)(a1 + 17))
    {
      int v2 = *(_DWORD *)a1 + 251;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
      if (v3 <= 4) {
        int v2 = -1;
      }
      else {
        int v2 = v3 ^ 0xFF;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DataStoreValue(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_258E4E2D8(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_258E4E2E0(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for DataStoreValue()
{
  return &type metadata for DataStoreValue;
}

void *sub_258E4E2F8@<X0>(_DWORD *a1@<X8>)
{
  return sub_258E4DDF4(a1);
}

uint64_t OUTLINED_FUNCTION_2(uint64_t a1, uint64_t a2, int a3)
{
  return sub_258E4DB08(a1, a2, a3, v4, v3);
}

uint64_t sub_258E4E354(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return PegasusPersistenceReader.codableForResource<A>(_:)(a1, a2, a5, a3, a6, a4);
}

uint64_t PegasusPersistenceReader.codableForResource<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = sub_258E53EE0();
  swift_allocObject();
  v14[3] = v12;
  v14[4] = &protocol witness table for JSONDecoder;
  v14[0] = sub_258E53ED0();
  (*(void (**)(uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t))(a5 + 24))(a1, a2, v14, a4, a6, a3, a5);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_258E4E4B0(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return PegasusPersistenceReader.codableForResource<A>(_:decoder:)(a1, a2, a3, a6, a4, a7, a5);
}

uint64_t PegasusPersistenceReader.codableForResource<A>(_:decoder:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a6 + 8))(a1, a2, a4, a6);
  if (!v7)
  {
    uint64_t v13 = result;
    unint64_t v14 = v12;
    uint64_t v17 = a7;
    uint64_t v16 = a3[3];
    uint64_t v15 = a3[4];
    __swift_project_boxed_opaque_existential_1(a3, v16);
    (*(void (**)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 8))(a5, v13, v14, a5, v17, v16, v15);
    return sub_258E4DEB0(v13, v14);
  }
  return result;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_258E4E5FC()
{
  return sub_258E53EC0();
}

uint64_t dispatch thunk of PegasusPersistenceReader.dataForResource(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of PegasusPersistenceReader.codableForResource<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))();
}

uint64_t dispatch thunk of PegasusPersistenceReader.codableForResource<A>(_:decoder:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 24))();
}

uint64_t dispatch thunk of CustomDecoder.decode<A>(_:from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 8))();
}

uint64_t static PegasusKeyValueElement<>.read(fromPegasusKeyValueStore:at:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10 = a1[3];
  uint64_t v11 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v10);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 104))(a2, a3, a4, a6, v10, v11);
}

uint64_t PegasusKeyValueElement<>.write(toPegasusKeyValueStore:at:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v12 = a1[3];
  uint64_t v13 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v12);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 112))(v7, a2, a3, a4, a7, v12, v13);
}

uint64_t static Int.read(fromPegasusKeyValueStore:at:)(void *a1)
{
  OUTLINED_FUNCTION_0_0(a1);
  uint64_t v1 = OUTLINED_FUNCTION_1_0();
  return v2(v1);
}

uint64_t Int.write(toPegasusKeyValueStore:at:)(void *a1)
{
  OUTLINED_FUNCTION_3(a1);
  OUTLINED_FUNCTION_2_0();
  return v1();
}

uint64_t sub_258E4E864@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = static Int.read(fromPegasusKeyValueStore:at:)(a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_258E4E894(void *a1)
{
  return Int.write(toPegasusKeyValueStore:at:)(a1);
}

uint64_t static Double.read(fromPegasusKeyValueStore:at:)(void *a1)
{
  OUTLINED_FUNCTION_0_0(a1);
  uint64_t v1 = OUTLINED_FUNCTION_1_0();
  return v2(v1);
}

uint64_t Double.write(toPegasusKeyValueStore:at:)(void *a1, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t v7 = a1[3];
  uint64_t v8 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, double))(v8 + 48))(a2, a3, v7, v8, a4);
}

uint64_t sub_258E4E970@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = static Double.read(fromPegasusKeyValueStore:at:)(a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_258E4E9A0(void *a1, uint64_t a2, uint64_t a3)
{
  return Double.write(toPegasusKeyValueStore:at:)(a1, a2, a3, *v3);
}

uint64_t static Date.read(fromPegasusKeyValueStore:at:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a1[3];
  uint64_t v6 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v5);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 88))(a2, a3, v5, v6);
}

uint64_t Date.write(toPegasusKeyValueStore:at:)(void *a1)
{
  OUTLINED_FUNCTION_3(a1);
  OUTLINED_FUNCTION_2_0();
  return v1();
}

uint64_t sub_258E4EA7C(void *a1)
{
  return Date.write(toPegasusKeyValueStore:at:)(a1);
}

uint64_t static Bool.read(fromPegasusKeyValueStore:at:)(void *a1)
{
  OUTLINED_FUNCTION_0_0(a1);
  uint64_t v1 = OUTLINED_FUNCTION_1_0();
  return v2(v1);
}

uint64_t Bool.write(toPegasusKeyValueStore:at:)(void *a1)
{
  OUTLINED_FUNCTION_3(a1);
  OUTLINED_FUNCTION_2_0();
  return v1();
}

uint64_t sub_258E4EB18@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = static Bool.read(fromPegasusKeyValueStore:at:)(a1);
  *a2 = result;
  return result;
}

uint64_t sub_258E4EB40(void *a1)
{
  return Bool.write(toPegasusKeyValueStore:at:)(a1);
}

uint64_t static Data.read(fromPegasusKeyValueStore:at:)(void *a1)
{
  OUTLINED_FUNCTION_0_0(a1);
  uint64_t v1 = OUTLINED_FUNCTION_1_0();
  return v2(v1);
}

uint64_t Data.write(toPegasusKeyValueStore:at:)(void *a1)
{
  OUTLINED_FUNCTION_5(a1);
  uint64_t v1 = OUTLINED_FUNCTION_4();
  return v2(v1);
}

uint64_t sub_258E4EBDC@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = static Data.read(fromPegasusKeyValueStore:at:)(a1);
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_258E4EC04(void *a1)
{
  return Data.write(toPegasusKeyValueStore:at:)(a1);
}

uint64_t static String.read(fromPegasusKeyValueStore:at:)(void *a1)
{
  OUTLINED_FUNCTION_0_0(a1);
  uint64_t v1 = OUTLINED_FUNCTION_1_0();
  return v2(v1);
}

uint64_t String.write(toPegasusKeyValueStore:at:)(void *a1)
{
  OUTLINED_FUNCTION_5(a1);
  uint64_t v1 = OUTLINED_FUNCTION_4();
  return v2(v1);
}

uint64_t sub_258E4ECA0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = static String.read(fromPegasusKeyValueStore:at:)(a1);
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_258E4ECC8(void *a1)
{
  return String.write(toPegasusKeyValueStore:at:)(a1);
}

uint64_t dispatch thunk of static PegasusKeyValueElement.read(fromPegasusKeyValueStore:at:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t dispatch thunk of PegasusKeyValueElement.write(toPegasusKeyValueStore:at:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

void *OUTLINED_FUNCTION_0_0(void *a1)
{
  return __swift_project_boxed_opaque_existential_1(a1, a1[3]);
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return v0;
}

void *OUTLINED_FUNCTION_3(void *a1)
{
  return __swift_project_boxed_opaque_existential_1(a1, a1[3]);
}

uint64_t OUTLINED_FUNCTION_4()
{
  return v0;
}

void *OUTLINED_FUNCTION_5(void *a1)
{
  return __swift_project_boxed_opaque_existential_1(a1, a1[3]);
}

uint64_t sub_258E4EE14(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = a2;
  uint64_t v3 = sub_258E53FB0();
  OUTLINED_FUNCTION_0_1();
  uint64_t v5 = v4;
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_258E54020();
  OUTLINED_FUNCTION_0_1();
  uint64_t v10 = v9;
  uint64_t v11 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v19 - v14;
  uint64_t v21 = a1;
  uint64_t v22 = v20;
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F06E38], v3);
  sub_258E4F39C();
  sub_258E54010();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v3);
  sub_258E53FA0();
  uint64_t v16 = *(void (**)(char *, uint64_t))(v10 + 8);
  v16(v13, v8);
  uint64_t v17 = sub_258E54030();
  v16(v15, v8);
  return v17;
}

uint64_t sub_258E4EFF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v23 = a4;
  uint64_t v24 = a1;
  uint64_t v25 = a2;
  uint64_t v5 = sub_258E53FB0();
  OUTLINED_FUNCTION_0_1();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_258E54020();
  OUTLINED_FUNCTION_0_1();
  uint64_t v13 = v12;
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v22 - v18;
  uint64_t v26 = a3;
  uint64_t v27 = v23;
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v10, *MEMORY[0x263F06E38], v5);
  sub_258E4F39C();
  sub_258E54010();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v5);
  sub_258E53FA0();
  uint64_t v20 = *(void (**)(char *, uint64_t))(v13 + 8);
  v20(v17, v11);
  sub_258E54050();
  return ((uint64_t (*)(char *, uint64_t))v20)(v19, v11);
}

uint64_t sub_258E4F1D4()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC18PegasusPersistence22PegasusFilePersistence_baseFolder;
  uint64_t v2 = sub_258E54020();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_258E4F274()
{
  return type metadata accessor for PegasusFilePersistence();
}

uint64_t type metadata accessor for PegasusFilePersistence()
{
  uint64_t result = qword_26A0CFA60;
  if (!qword_26A0CFA60) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_258E4F2C4()
{
  uint64_t result = sub_258E54020();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_258E4F354(uint64_t a1, uint64_t a2)
{
  return sub_258E4EE14(a1, a2);
}

uint64_t sub_258E4F378(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_258E4EFF8(a1, a2, a3, a4);
}

unint64_t sub_258E4F39C()
{
  unint64_t result = qword_26B2EFE20;
  if (!qword_26B2EFE20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2EFE20);
  }
  return result;
}

uint64_t sub_258E4F404()
{
  uint64_t v0 = sub_258E540B0();
  __swift_allocate_value_buffer(v0, qword_26B2F0080);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B2F0080);
  return sub_258E540A0();
}

uint64_t sub_258E4F480()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for Logging()
{
  return self;
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

uint64_t PegasusPersistenceContext.location.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_258E54020();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t PegasusPersistenceContext.init(location:fileManager:)@<X0>(uint64_t a1@<X0>, id a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_258E54020();
  OUTLINED_FUNCTION_0_1();
  uint64_t v8 = v7;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(a3, a1, v6);
  if (!a2) {
    a2 = objc_msgSend(self, sel_defaultManager);
  }
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(a1, v6);
  uint64_t result = type metadata accessor for PegasusPersistenceContext();
  *(void *)(a3 + *(int *)(result + 20)) = a2;
  return result;
}

uint64_t type metadata accessor for PegasusPersistenceContext()
{
  uint64_t result = qword_26B2EFDE0;
  if (!qword_26B2EFDE0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t PegasusPersistenceContext.localDirectory()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  v44[7] = *(id *)MEMORY[0x263EF8340];
  sub_258E53F80();
  OUTLINED_FUNCTION_0_1();
  v40[2] = v4;
  uint64_t v41 = v5;
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  v40[1] = (char *)v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  v43 = (char *)v40 - v8;
  uint64_t v9 = sub_258E54020();
  OUTLINED_FUNCTION_0_1();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_258E53FB0();
  OUTLINED_FUNCTION_0_1();
  uint64_t v17 = v16;
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)v40 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44[0] = (id)0x6C61636F6CLL;
  v44[1] = (id)0xE500000000000000;
  (*(void (**)(char *, void, uint64_t))(v17 + 104))(v20, *MEMORY[0x263F06E30], v15);
  sub_258E4F39C();
  sub_258E54010();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v20, v15);
  swift_bridgeObjectRelease();
  sub_258E53FA0();
  sub_258E54000();
  uint64_t v23 = *(uint64_t (**)(uint64_t, uint64_t))(v11 + 8);
  uint64_t v22 = v11 + 8;
  uint64_t v21 = v23;
  uint64_t v24 = v14;
  uint64_t v25 = v9;
  uint64_t v26 = a1;
  v23((uint64_t)v24, v9);
  uint64_t v27 = *(void **)(v2 + *(int *)(type metadata accessor for PegasusPersistenceContext() + 20));
  v28 = (void *)sub_258E540C0();
  swift_bridgeObjectRelease();
  LOBYTE(v20) = objc_msgSend(v27, sel_fileExistsAtPath_, v28);

  if ((v20 & 1) == 0)
  {
    v29 = (void *)sub_258E53FF0();
    v44[0] = 0;
    unsigned int v30 = objc_msgSend(v27, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v29, 1, 0, v44);

    if (!v30)
    {
      id v39 = v44[0];
      sub_258E53F90();

      swift_willThrow();
      return v21(v26, v25);
    }
    id v31 = v44[0];
  }
  __swift_instantiateConcreteTypeFromMangledName(qword_26B2EFE40);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_258E54A50;
  v33 = (void *)*MEMORY[0x263EFF6B0];
  *(void *)(inited + 32) = *MEMORY[0x263EFF6B0];
  id v34 = v33;
  sub_258E4FB10(inited);
  uint64_t v35 = v42;
  sub_258E53FD0();
  if (v35)
  {
    v21(v26, v25);
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v42 = v22;
    swift_bridgeObjectRelease();
    char v37 = sub_258E53F50();
    v38 = *(uint64_t (**)(void))(v41 + 8);
    v41 += 8;
    OUTLINED_FUNCTION_2_1();
    uint64_t result = v38();
    if (v37 != 2 && (v37 & 1) == 0)
    {
      sub_258E53F70();
      sub_258E53F60();
      sub_258E53FE0();
      OUTLINED_FUNCTION_2_1();
      return v38();
    }
  }
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

void sub_258E4FB10(uint64_t a1)
{
  uint64_t v1 = a1;
  if (!*(void *)(a1 + 16)
    || (__swift_instantiateConcreteTypeFromMangledName(&qword_26B2EFE38),
        uint64_t v2 = sub_258E54160(),
        uint64_t v3 = v2,
        (uint64_t v32 = *(void *)(v1 + 16)) == 0))
  {
LABEL_24:
    swift_bridgeObjectRelease();
    return;
  }
  unint64_t v4 = 0;
  uint64_t v5 = v2 + 56;
  uint64_t v30 = v1;
  uint64_t v31 = v1 + 32;
  while (v4 < *(void *)(v1 + 16))
  {
    uint64_t v6 = *(void **)(v31 + 8 * v4);
    sub_258E540F0();
    sub_258E54200();
    id v7 = v6;
    sub_258E54100();
    uint64_t v8 = sub_258E54220();
    swift_bridgeObjectRelease();
    uint64_t v9 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v10 = v8 & ~v9;
    unint64_t v11 = v10 >> 6;
    uint64_t v12 = *(void *)(v5 + 8 * (v10 >> 6));
    uint64_t v13 = 1 << v10;
    if (((1 << v10) & v12) != 0)
    {
      uint64_t v14 = sub_258E540F0();
      uint64_t v16 = v15;
      if (v14 == sub_258E540F0() && v16 == v17)
      {
LABEL_21:
        swift_bridgeObjectRelease_n();
LABEL_22:

        goto LABEL_23;
      }
      char v19 = sub_258E541B0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v19) {
        goto LABEL_22;
      }
      uint64_t v20 = ~v9;
      while (1)
      {
        unint64_t v10 = (v10 + 1) & v20;
        unint64_t v11 = v10 >> 6;
        uint64_t v12 = *(void *)(v5 + 8 * (v10 >> 6));
        uint64_t v13 = 1 << v10;
        if ((v12 & (1 << v10)) == 0) {
          break;
        }
        uint64_t v21 = sub_258E540F0();
        uint64_t v23 = v22;
        if (v21 == sub_258E540F0() && v23 == v24) {
          goto LABEL_21;
        }
        char v26 = sub_258E541B0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v26) {
          goto LABEL_22;
        }
      }
    }
    *(void *)(v5 + 8 * v11) = v13 | v12;
    *(void *)(*(void *)(v3 + 48) + 8 * v10) = v7;
    uint64_t v27 = *(void *)(v3 + 16);
    BOOL v28 = __OFADD__(v27, 1);
    uint64_t v29 = v27 + 1;
    if (v28) {
      goto LABEL_26;
    }
    *(void *)(v3 + 16) = v29;
LABEL_23:
    ++v4;
    uint64_t v1 = v30;
    if (v4 == v32) {
      goto LABEL_24;
    }
  }
  __break(1u);
LABEL_26:
  __break(1u);
}

uint64_t *initializeBufferWithCopyOfBuffer for PegasusPersistenceContext(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_258E54020();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = *(void **)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = (uint64_t)v9;
    id v10 = v9;
  }
  return a1;
}

void destroy for PegasusPersistenceContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_258E54020();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  int v5 = *(void **)(a1 + *(int *)(a2 + 20));
}

uint64_t initializeWithCopy for PegasusPersistenceContext(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_258E54020();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void **)(a2 + v7);
  *(void *)(a1 + v7) = v8;
  id v9 = v8;
  return a1;
}

uint64_t assignWithCopy for PegasusPersistenceContext(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_258E54020();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void **)(a2 + v7);
  id v9 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = v8;
  id v10 = v8;

  return a1;
}

uint64_t initializeWithTake for PegasusPersistenceContext(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_258E54020();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for PegasusPersistenceContext(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_258E54020();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);

  return a1;
}

uint64_t getEnumTagSinglePayload for PegasusPersistenceContext(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_258E500CC);
}

uint64_t sub_258E500CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_258E54020();
  OUTLINED_FUNCTION_1_1();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  }
  else
  {
    unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v9 >= 0xFFFFFFFF) {
      LODWORD(v9) = -1;
    }
    return (v9 + 1);
  }
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for PegasusPersistenceContext(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_258E50194);
}

void sub_258E50194(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_258E54020();
  OUTLINED_FUNCTION_1_1();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    __swift_storeEnumTagSinglePayload(a1, a2, a2, v8);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_258E50244()
{
  uint64_t result = sub_258E54020();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void sub_258E50300()
{
}

void PegasusKeyValueStore.codable<A>(for:)()
{
  OUTLINED_FUNCTION_3_0();
  uint64_t v28 = v0;
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v13 = sub_258E54140();
  OUTLINED_FUNCTION_0_2();
  uint64_t v15 = v14;
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v28 - v17;
  uint64_t v19 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 56))(v10, v8, v6, v2);
  if (v20 >> 60 == 15)
  {
    OUTLINED_FUNCTION_1_2();
    __swift_storeEnumTagSinglePayload(v21, v22, v23, v24);
  }
  else
  {
    uint64_t v26 = v19;
    unint64_t v27 = v20;
    sub_258E53EE0();
    swift_allocObject();
    sub_258E53ED0();
    sub_258E53EC0();
    sub_258E504C4(v26, v27);
    swift_release();
    __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v4);
    (*(void (**)(uint64_t, char *, uint64_t))(v15 + 32))(v12, v18, v13);
    OUTLINED_FUNCTION_1_2();
  }
}

uint64_t sub_258E504C4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_258E4DEB0(a1, a2);
  }
  return a1;
}

uint64_t sub_258E504D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return PegasusKeyValueStore.setCodable<A>(_:for:)(a1, a2, a3, a6, a4, a7);
}

uint64_t PegasusKeyValueStore.setCodable<A>(_:for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  sub_258E53F10();
  swift_allocObject();
  sub_258E53F00();
  uint64_t v11 = sub_258E53EF0();
  unint64_t v13 = v12;
  uint64_t result = swift_release();
  if (!v6)
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a6 + 64))(v11, v13, a2, a3, a4, a6);
    return sub_258E4DEB0(v11, v13);
  }
  return result;
}

uint64_t sub_258E505F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return PegasusKeyValueStore.subscript.getter(a1, a2, a5, a3, a6, a4);
}

uint64_t PegasusKeyValueStore.subscript.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v14[3] = a3;
  v14[4] = a5;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v14);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 16))(boxed_opaque_existential_1, v6, a3);
  (*(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t))(a6 + 8))(v14, a1, a2, a4, a6);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

void sub_258E5073C()
{
}

void PegasusKeyValueStore.subscript.setter()
{
  OUTLINED_FUNCTION_3_0();
  uint64_t v29 = v2;
  uint64_t v30 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v31 = v9;
  uint64_t v11 = v10;
  uint64_t v12 = sub_258E54140();
  OUTLINED_FUNCTION_0_2();
  uint64_t v14 = v13;
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v29 - v16;
  OUTLINED_FUNCTION_0_2();
  uint64_t v19 = v18;
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (char *)&v29 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  uint64_t v32 = v11;
  v23(v17, v11, v12);
  if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, v6) == 1)
  {
    uint64_t v24 = *(void (**)(char *, uint64_t))(v14 + 8);
    v24(v17, v12);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 120))(v30, v31, v8, v4);
    uint64_t v26 = OUTLINED_FUNCTION_2_2();
    ((void (*)(uint64_t))v24)(v26);
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v22, v17, v6);
    v33[3] = v8;
    v33[4] = v4;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v33);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(boxed_opaque_existential_1, v0, v8);
    (*(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(v29 + 16))(v33, v30, v31, v6);
    swift_bridgeObjectRelease();
    uint64_t v27 = OUTLINED_FUNCTION_2_2();
    v28(v27);
    (*(void (**)(char *, uint64_t))(v19 + 8))(v22, v6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
  }
  OUTLINED_FUNCTION_1_2();
}

uint64_t (*sub_258E509C0(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  PegasusKeyValueStore.subscript.modify();
  v2[4] = v3;
  return sub_258E50A60;
}

void PegasusKeyValueStore.subscript.modify()
{
  OUTLINED_FUNCTION_3_0();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v15 = malloc(0x58uLL);
  *uint64_t v14 = v15;
  v15[5] = v2;
  v15[6] = v0;
  v15[3] = v6;
  v15[4] = v4;
  v15[1] = v10;
  v15[2] = v8;
  *uint64_t v15 = v12;
  uint64_t v16 = sub_258E54140();
  v15[7] = v16;
  uint64_t v17 = *(void *)(v16 - 8);
  v15[8] = v17;
  size_t v18 = *(void *)(v17 + 64);
  v15[9] = malloc(v18);
  v15[10] = malloc(v18);
  PegasusKeyValueStore.subscript.getter(v12, v10, v8, v6, v4, v2);
  OUTLINED_FUNCTION_1_2();
}

void sub_258E50B74(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void **)(*(void *)a1 + 72);
  uint64_t v4 = *(void **)(*(void *)a1 + 80);
  if (a2)
  {
    uint64_t v5 = v2[7];
    uint64_t v6 = v2[8];
    (*(void (**)(void *, void *, uint64_t))(v6 + 16))(v3, v4, v5);
    swift_bridgeObjectRetain();
    PegasusKeyValueStore.subscript.setter();
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v5);
  }
  else
  {
    swift_bridgeObjectRetain();
    PegasusKeyValueStore.subscript.setter();
  }
  free(v4);
  free(v3);

  free(v2);
}

BOOL static PegasusKeyValueStoreError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t PegasusKeyValueStoreError.hash(into:)()
{
  return sub_258E54210();
}

uint64_t PegasusKeyValueStoreError.hashValue.getter()
{
  return sub_258E54220();
}

uint64_t sub_258E50D30()
{
  return sub_258E54220();
}

unint64_t sub_258E50D78()
{
  unint64_t result = qword_26A0CFA70[0];
  if (!qword_26A0CFA70[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A0CFA70);
  }
  return result;
}

uint64_t sub_258E50DC4(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return PegasusKeyValueStore.subscript.getter(*a2, a2[1], *(uint64_t *)((char *)a2 + a3 - 32), *(uint64_t *)((char *)a2 + a3 - 24), *(uint64_t *)((char *)a2 + a3 - 16), *(uint64_t *)((char *)a2 + a3 - 8));
}

void sub_258E50DFC(uint64_t a1)
{
  uint64_t v2 = sub_258E54140();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v5 - v3, a1);
  swift_bridgeObjectRetain();
  PegasusKeyValueStore.subscript.setter();
}

uint64_t sub_258E50F14()
{
  return 32;
}

__n128 sub_258E50F20(uint64_t a1, _OWORD *a2)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 16);
  *a2 = *(_OWORD *)a1;
  a2[1] = v3;
  return result;
}

uint64_t dispatch thunk of PegasusKeyValueStore.string(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of PegasusKeyValueStore.setString(_:for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))();
}

uint64_t dispatch thunk of PegasusKeyValueStore.integer(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of PegasusKeyValueStore.setInteger(_:for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 32))();
}

uint64_t dispatch thunk of PegasusKeyValueStore.double(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t dispatch thunk of PegasusKeyValueStore.setDouble(_:for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

uint64_t dispatch thunk of PegasusKeyValueStore.data(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 56))();
}

uint64_t dispatch thunk of PegasusKeyValueStore.setData(_:for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 64))();
}

uint64_t dispatch thunk of PegasusKeyValueStore.BOOL(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 72))();
}

uint64_t dispatch thunk of PegasusKeyValueStore.setBool(_:for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 80))();
}

uint64_t dispatch thunk of PegasusKeyValueStore.date(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 88))();
}

uint64_t dispatch thunk of PegasusKeyValueStore.setDate(_:for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 96))();
}

uint64_t dispatch thunk of PegasusKeyValueStore.codable<A>(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 104))();
}

uint64_t dispatch thunk of PegasusKeyValueStore.setCodable<A>(_:for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 112))();
}

uint64_t dispatch thunk of PegasusKeyValueStore.deleteValue(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 120))();
}

uint64_t dispatch thunk of PegasusKeyValueStore.subscript.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 128))();
}

uint64_t dispatch thunk of PegasusKeyValueStore.subscript.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 136))();
}

uint64_t dispatch thunk of PegasusKeyValueStore.subscript.modify(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 144))();
}

uint64_t dispatch thunk of PegasusKeyValueStoreFullAccess.close()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of PegasusKeyValueStoreFullAccess.clear()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PegasusKeyValueStoreError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFD)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v5 = v6 - 4;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for PegasusKeyValueStoreError(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 3;
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
        JUMPOUT(0x258E51324);
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
          *__n128 result = a2 + 3;
        break;
    }
  }
  return result;
}

uint64_t sub_258E5134C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_258E51354(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PegasusKeyValueStoreError()
{
  return &type metadata for PegasusKeyValueStoreError;
}

uint64_t sub_258E5136C()
{
  uint64_t result = sub_258E52DD4();
  if (v2 != 3)
  {
    if (v2 != 255) {
      sub_258E5190C(result, v1, v2);
    }
    return 0;
  }
  return result;
}

void sub_258E513A8()
{
}

uint64_t sub_258E513D0()
{
  uint64_t v0 = sub_258E52DD4();
  if (v2 != 255)
  {
    if (!v2) {
      return v0 == 1;
    }
    sub_258E5190C(v0, v1, v2);
  }
  return 2;
}

void sub_258E51410()
{
}

uint64_t sub_258E51440()
{
  uint64_t result = sub_258E52DD4();
  if (v2 != 255)
  {
    if (v2 == 2) {
      return result;
    }
    sub_258E5190C(result, v1, v2);
  }
  return 0;
}

void sub_258E5147C()
{
}

uint64_t sub_258E514A4()
{
  uint64_t result = sub_258E52DD4();
  if (v2 != 1)
  {
    if (v2 != 255) {
      sub_258E5190C(result, v1, v2);
    }
    return 0;
  }
  return result;
}

void sub_258E514F4()
{
}

uint64_t sub_258E51520()
{
  uint64_t result = sub_258E52DD4();
  if (v2 != 255)
  {
    if (v2 == 4) {
      return result;
    }
    sub_258E5190C(result, v1, v2);
  }
  return 0;
}

void sub_258E51564()
{
}

uint64_t sub_258E51594@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_258E52DD4();
  if (v4 != 255)
  {
    if (v4 == 4)
    {
      sub_258E54060();
      uint64_t v5 = 0;
      goto LABEL_6;
    }
    sub_258E5190C(v2, v3, v4);
  }
  uint64_t v5 = 1;
LABEL_6:
  uint64_t v6 = sub_258E54080();

  return __swift_storeEnumTagSinglePayload(a1, v5, 1, v6);
}

void sub_258E51614()
{
}

uint64_t sub_258E5167C()
{
  return sub_258E51440();
}

void sub_258E516A0()
{
}

uint64_t sub_258E516C4()
{
  return sub_258E514A4();
}

void sub_258E516EC()
{
}

uint64_t sub_258E51710()
{
  return sub_258E51520();
}

void sub_258E51738()
{
}

uint64_t sub_258E5175C()
{
  return sub_258E5136C();
}

void sub_258E51780()
{
}

uint64_t sub_258E517A4()
{
  return sub_258E513D0();
}

void sub_258E517C8()
{
}

uint64_t sub_258E517EC@<X0>(uint64_t a1@<X8>)
{
  return sub_258E51594(a1);
}

void sub_258E51810()
{
}

void sub_258E51834()
{
  OUTLINED_FUNCTION_3_0();
  unint64_t v1 = v0;
  uint64_t v2 = malloc(0x28uLL);
  void *v1 = v2;
  PegasusKeyValueStore.subscript.modify();
  v2[4] = v3;
  OUTLINED_FUNCTION_1_2();
}

void sub_258E518C4(void *a1)
{
  unint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

uint64_t sub_258E5190C(uint64_t result, unint64_t a2, char a3)
{
  if (a3 != -1) {
    return sub_258E4DE8C(result, a2, a3);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_2()
{
  return *(void *)(v0 - 136);
}

uint64_t sub_258E5197C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

uint64_t type metadata accessor for LockedState()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

void sub_258E519CC(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void (*a6)(char *__return_ptr, uint64_t, sqlite3_stmt *)@<X5>, uint64_t a7@<X6>, void *a8@<X8>)
{
  void (*v45)(char *__return_ptr, uint64_t, sqlite3_stmt *);
  uint64_t v46;
  uint64_t *v47;
  char zSql[8];
  unint64_t v49;
  char v50;
  unsigned int v51;

  uint64_t v10 = *(sqlite3 **)(v8 + 16);
  if (!v10)
  {
    sub_258E4DF44();
    OUTLINED_FUNCTION_2_3();
    *(_DWORD *)uint64_t v19 = 0;
    *(unsigned char *)(v19 + 4) = 1;
    swift_willThrow();
    return;
  }
  v45 = a6;
  v46 = a3;
  uint64_t v43 = a5;
  uint64_t v44 = a7;
  uint64_t v41 = a4;
  uint64_t v42 = a8;
  uint64_t v13 = (sqlite3_stmt **)swift_slowAlloc();
  *uint64_t v13 = 0;
  uint64_t v14 = (const char **)swift_slowAlloc();
  *uint64_t v14 = 0;
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    sub_258E54170();
  }
  else
  {
    v47 = &v41;
    MEMORY[0x270FA5388](v15);
    if ((a2 & 0x2000000000000000) != 0)
    {
      *(void *)zSql = a1;
      v49 = a2 & 0xFFFFFFFFFFFFFFLL;
      int v18 = sqlite3_prepare_v2(v10, zSql, -1, v13, v14);
    }
    else
    {
      if ((a1 & 0x1000000000000000) != 0)
      {
        uint64_t v16 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        uint64_t v17 = a1 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v16 = sub_258E54180();
      }
      int v18 = sub_258E536B8(v16, v17, (void *(*)(uint64_t *__return_ptr))sub_258E53758);
    }
    v51 = v18;
  }
  sub_258E4CFF8(v51);
  if (v9) {
    goto LABEL_12;
  }
  uint64_t v20 = *v13;
  if (!*v13)
  {
    sub_258E4DF44();
    OUTLINED_FUNCTION_2_3();
    *(_DWORD *)uint64_t v36 = 1;
    *(unsigned char *)(v36 + 4) = 1;
    swift_willThrow();
LABEL_12:
    OUTLINED_FUNCTION_3_1();
    OUTLINED_FUNCTION_3_1();
    return;
  }
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_3_1();
  uint64_t v21 = *(void *)(v46 + 16);
  if (v21)
  {
    uint64_t v22 = 0;
    uint64_t v23 = (char *)(swift_bridgeObjectRetain() + 48);
    do
    {
      uint64_t v24 = *((void *)v23 - 2);
      unint64_t v25 = *((void *)v23 - 1);
      char v26 = *v23;
      sub_258E4DE10(v24, v25, *v23);
      uint64_t v27 = sub_258E4D054();
      sub_258E4CFF8((uint64_t)v27);
      v23 += 24;
      ++v22;
      sub_258E4DE8C(v24, v25, v26);
    }
    while (v21 != v22);
    swift_bridgeObjectRelease();
  }
  int v28 = sqlite3_step(v20);
  if (v28 != 101)
  {
    int v29 = v28;
    if (v28 != 100)
    {
LABEL_31:
      sub_258E4DF44();
      OUTLINED_FUNCTION_2_3();
      *(_DWORD *)uint64_t v37 = v29;
      *(unsigned char *)(v37 + 4) = 0;
LABEL_38:
      swift_willThrow();
      goto LABEL_39;
    }
    uint64_t v30 = v43 - 2;
    if (v43 >= 2)
    {
      uint64_t v31 = 0;
      do
      {
        if (v45)
        {
          v45(zSql, v31 + 1, v20);
        }
        else
        {
          *(void *)zSql = 0;
          v49 = 0;
          v50 = -1;
        }
        unint64_t v32 = v49;
        char v33 = v50;
        if (v30 == v31)
        {
          v40 = v42;
          *uint64_t v42 = *(void *)zSql;
          v40[1] = v32;
          *((unsigned char *)v40 + 16) = v33;
          goto LABEL_39;
        }
        sub_258E5190C(*(uint64_t *)zSql, v49, v50);
        int v34 = sqlite3_step(v20);
        ++v31;
      }
      while (v34 == 100);
      int v29 = v34;
      if (v34 != 101) {
        goto LABEL_31;
      }
      uint64_t v35 = v42;
      if (v31 >= v41) {
        goto LABEL_29;
      }
    }
LABEL_37:
    sub_258E4DF44();
    OUTLINED_FUNCTION_2_3();
    *(_DWORD *)uint64_t v39 = 3;
    *(unsigned char *)(v39 + 4) = 1;
    goto LABEL_38;
  }
  uint64_t v35 = v42;
  if (v41 > 0 || v43 <= 0) {
    goto LABEL_37;
  }
LABEL_29:
  *uint64_t v35 = 0;
  v35[1] = 0;
  *((unsigned char *)v35 + 16) = -1;
LABEL_39:
  sqlite3_finalize(v20);
}

uint64_t sub_258E51E00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(char *__return_ptr, uint64_t, sqlite3_stmt *), uint64_t a7)
{
  void (*v29)(char *__return_ptr, uint64_t, sqlite3_stmt *);
  int v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  uint64_t v39;
  void (*v40)(char *__return_ptr, uint64_t, sqlite3_stmt *);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  char zSql[8];
  uint64_t v46;
  unsigned int v47;

  uint64_t v9 = *(sqlite3 **)(v7 + 16);
  if (v9)
  {
    uint64_t v42 = a4;
    uint64_t v43 = a3;
    uint64_t v39 = a5;
    v40 = a6;
    uint64_t v41 = a7;
    uint64_t v12 = (sqlite3_stmt **)swift_slowAlloc();
    *uint64_t v12 = 0;
    uint64_t v13 = (const char **)swift_slowAlloc();
    *uint64_t v13 = 0;
    uint64_t v14 = MEMORY[0x270FA5388](v13);
    if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
    {
      sub_258E54170();
    }
    else
    {
      uint64_t v44 = &v39;
      MEMORY[0x270FA5388](v14);
      if ((a2 & 0x2000000000000000) != 0)
      {
        *(void *)zSql = a1;
        v46 = a2 & 0xFFFFFFFFFFFFFFLL;
        int v17 = sqlite3_prepare_v2(v9, zSql, -1, v12, v13);
      }
      else
      {
        if ((a1 & 0x1000000000000000) != 0)
        {
          uint64_t v15 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
          uint64_t v16 = a1 & 0xFFFFFFFFFFFFLL;
        }
        else
        {
          uint64_t v15 = sub_258E54180();
        }
        int v17 = sub_258E536B8(v15, v16, (void *(*)(uint64_t *__return_ptr))sub_258E53758);
      }
      v47 = v17;
    }
    sub_258E4CFF8(v47);
    if (v8) {
      goto LABEL_12;
    }
    uint64_t v19 = *v12;
    if (!*v12)
    {
      sub_258E4DF44();
      swift_allocError();
      *(_DWORD *)int v34 = 1;
      *(unsigned char *)(v34 + 4) = 1;
      swift_willThrow();
LABEL_12:
      MEMORY[0x25A2D25C0](v13, -1, -1);
      MEMORY[0x25A2D25C0](v12, -1, -1);
      return v7;
    }
    MEMORY[0x25A2D25C0](v13, -1, -1);
    MEMORY[0x25A2D25C0](v12, -1, -1);
    uint64_t v20 = *(void *)(v43 + 16);
    if (v20)
    {
      uint64_t v21 = 0;
      uint64_t v22 = (char *)(swift_bridgeObjectRetain() + 48);
      do
      {
        uint64_t v23 = *((void *)v22 - 2);
        unint64_t v24 = *((void *)v22 - 1);
        char v25 = *v22;
        sub_258E4DE10(v23, v24, *v22);
        char v26 = sub_258E4D054();
        sub_258E4CFF8((uint64_t)v26);
        v22 += 24;
        ++v21;
        sub_258E4DE8C(v23, v24, v25);
      }
      while (v20 != v21);
      swift_bridgeObjectRelease();
    }
    int v27 = sqlite3_step(v19);
    uint64_t v7 = v41;
    uint64_t v28 = v42;
    int v29 = v40;
    if (v27 == 101)
    {
      if (v42 <= 0 && v39 > 0)
      {
LABEL_29:
        uint64_t v7 = 1;
LABEL_39:
        sqlite3_finalize(v19);
        return v7;
      }
    }
    else
    {
      uint64_t v30 = v27;
      if (v27 != 100)
      {
LABEL_31:
        sub_258E4DF44();
        swift_allocError();
        *(_DWORD *)uint64_t v35 = v30;
        *(unsigned char *)(v35 + 4) = 0;
LABEL_38:
        swift_willThrow();
        goto LABEL_39;
      }
      uint64_t v31 = v39 - 2;
      if (v39 >= 2)
      {
        unint64_t v32 = 0;
        do
        {
          if (v29) {
            v29(zSql, v32 + 1, v19);
          }
          else {
            zSql[0] = 1;
          }
          if (v31 == v32)
          {
            uint64_t v7 = zSql[0];
            goto LABEL_39;
          }
          char v33 = sqlite3_step(v19);
          ++v32;
        }
        while (v33 == 100);
        uint64_t v30 = v33;
        if (v33 != 101) {
          goto LABEL_31;
        }
        if (v32 >= v28) {
          goto LABEL_29;
        }
      }
    }
    sub_258E4DF44();
    swift_allocError();
    *(_DWORD *)uint64_t v37 = 3;
    *(unsigned char *)(v37 + 4) = 1;
    goto LABEL_38;
  }
  sub_258E4DF44();
  swift_allocError();
  *(_DWORD *)uint64_t v18 = 0;
  *(unsigned char *)(v18 + 4) = 1;
  swift_willThrow();
  return v7;
}

void sub_258E52258(uint64_t a1, uint64_t a2, os_unfair_lock_s *a3)
{
  uint64_t v3 = a3 + 4;
  unsigned __int8 v4 = a3 + 6;
  os_unfair_lock_lock(a3 + 6);
  sub_258E53818(v3);
  os_unfair_lock_unlock(v4);
}

void *sub_258E522BC(void *a1, void *(*a2)(uint64_t *__return_ptr))
{
  uint64_t result = a2(&v5);
  if (!v2)
  {
    uint64_t result = (void *)swift_release();
    *a1 = v5;
  }
  return result;
}

uint64_t static PegasusKeyValueStoreFactory.store(at:requiresAuthentication:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  sub_258E54020();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_1_3();
  uint64_t v8 = v7 - v6;
  (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v7 - v6, a1);
  uint64_t v10 = type metadata accessor for KeyValueStore();
  swift_allocObject();
  uint64_t result = sub_258E528B4(v8);
  if (!v2)
  {
    a2[3] = v10;
    a2[4] = (uint64_t)&off_2706EB7A0;
    *a2 = result;
  }
  return result;
}

uint64_t type metadata accessor for KeyValueStore()
{
  return self;
}

uint64_t static PegasusKeyValueStoreFactory.deviceInfoStore(context:name:requiresAuthentication:)@<X0>(uint64_t a1@<X1>, unint64_t a2@<X2>, int a3@<W3>, uint64_t *a4@<X8>)
{
  int v38 = a3;
  uint64_t v33 = a1;
  unint64_t v34 = a2;
  unint64_t v32 = a4;
  uint64_t v5 = sub_258E53FB0();
  OUTLINED_FUNCTION_0_1();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_1_3();
  uint64_t v11 = v10 - v9;
  uint64_t v35 = sub_258E54020();
  OUTLINED_FUNCTION_0_1();
  uint64_t v13 = v12;
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  int v17 = (char *)&v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  uint64_t v20 = (char *)&v32 - v19;
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v32 - v21;
  uint64_t result = PegasusPersistenceContext.localDirectory()((uint64_t)v20);
  if (!v4)
  {
    uint64_t v24 = 0x642E656369766564;
    if (v34) {
      uint64_t v24 = v33;
    }
    unint64_t v25 = 0xE900000000000062;
    if (v34) {
      unint64_t v25 = v34;
    }
    uint64_t v36 = v24;
    unint64_t v37 = v25;
    (*(void (**)(uint64_t, void, uint64_t))(v7 + 104))(v11, *MEMORY[0x263F06E38], v5);
    sub_258E4F39C();
    swift_bridgeObjectRetain();
    sub_258E54010();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v11, v5);
    swift_bridgeObjectRelease();
    char v26 = *(void (**)(char *, uint64_t))(v13 + 8);
    int v27 = v20;
    uint64_t v28 = v35;
    v26(v27, v35);
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v17, v22, v28);
    uint64_t v29 = type metadata accessor for KeyValueStore();
    swift_allocObject();
    uint64_t v30 = sub_258E528B4((uint64_t)v17);
    uint64_t v31 = v32;
    v32[3] = v29;
    v31[4] = (uint64_t)&off_2706EB7A0;
    *uint64_t v31 = v30;
    return ((uint64_t (*)(char *, uint64_t))v26)(v22, v28);
  }
  return result;
}

uint64_t static PegasusKeyValueStoreFactory.defaultStore(at:requiresAuthentication:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v23 = a1;
  uint64_t v1 = sub_258E53FB0();
  OUTLINED_FUNCTION_0_1();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_1_3();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = sub_258E54020();
  OUTLINED_FUNCTION_0_1();
  uint64_t v10 = v9;
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v22 - v15;
  unint64_t v24 = 0xD000000000000017;
  unint64_t v25 = 0x8000000258E55A40;
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v7, *MEMORY[0x263F06E38], v1);
  sub_258E4F39C();
  sub_258E54010();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v7, v1);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v14, v16, v8);
  uint64_t v17 = type metadata accessor for KeyValueStore();
  swift_allocObject();
  uint64_t v18 = v26;
  uint64_t v19 = sub_258E528B4((uint64_t)v14);
  if (!v18)
  {
    uint64_t v20 = v23;
    v23[3] = v17;
    v20[4] = (uint64_t)&off_2706EB7A0;
    *uint64_t v20 = v19;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v16, v8);
}

uint64_t sub_258E528B4(uint64_t a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_258E54020();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v5);
  type metadata accessor for DataStore();
  swift_allocObject();
  uint64_t v8 = sub_258E4C760();
  if (v2)
  {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v9 = v8;
    sub_258E51E00(0xD000000000000058, 0x8000000258E55BD0, MEMORY[0x263F8EE78], 0, 1, 0, 0);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B2EFFF0);
    uint64_t v11 = swift_allocObject();
    *(_DWORD *)(v11 + 24) = 0;
    *(void *)(v11 + 16) = v9;
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    *(void *)(v3 + 16) = v11;
  }
  return v3;
}

ValueMetadata *type metadata accessor for PegasusKeyValueStoreFactory()
{
  return &type metadata for PegasusKeyValueStoreFactory;
}

uint64_t sub_258E52AE0()
{
  sub_258E52258((uint64_t)sub_258E52D50, 0, *(os_unfair_lock_s **)(v0 + 16));
  swift_release();
  return v0;
}

void sub_258E52B4C()
{
  sub_258E52258((uint64_t)sub_258E52D50, 0, *(os_unfair_lock_s **)(v0 + 16));
}

uint64_t sub_258E52B80()
{
  uint64_t v0 = sub_258E52AE0();

  return MEMORY[0x270FA0228](v0, 24, 7);
}

void *initializeBufferWithCopyOfBuffer for KeyValueStore.State(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  return a1;
}

uint64_t destroy for KeyValueStore.State()
{
  return swift_release();
}

void *assignWithCopy for KeyValueStore.State(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void *assignWithTake for KeyValueStore.State(void *a1, void *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for KeyValueStore.State(uint64_t *a1, unsigned int a2)
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
  if ((v3 + 1) >= 2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for KeyValueStore.State(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)uint64_t result = 0;
    *(_DWORD *)uint64_t result = a2 - 0x7FFFFFFF;
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

uint64_t sub_258E52D08(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_258E52D20(void *result, int a2)
{
  if (a2 < 0)
  {
    unsigned int v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2) {
      return result;
    }
    unsigned int v2 = a2 - 1;
  }
  *uint64_t result = v2;
  return result;
}

ValueMetadata *type metadata accessor for KeyValueStore.State()
{
  return &type metadata for KeyValueStore.State;
}

uint64_t sub_258E52D50@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  if (*a1)
  {
    swift_retain();
    sub_258E4CAEC();
    uint64_t result = swift_release();
    *a2 = 0;
  }
  else
  {
    sub_258E5360C();
    swift_allocError();
    *uint64_t v4 = 2;
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_258E52DD4()
{
  uint64_t v1 = (os_unfair_lock_s *)(*(void *)(v0 + 16) + 24);
  os_unfair_lock_lock(v1);
  sub_258E535E4();
  os_unfair_lock_unlock(v1);
  return v3;
}

void sub_258E52E5C()
{
  uint64_t v1 = (os_unfair_lock_s *)(*(void *)(v0 + 16) + 24);
  os_unfair_lock_lock(v1);
  sub_258E53838();
  os_unfair_lock_unlock(v1);
}

void sub_258E52EEC()
{
}

void sub_258E52F10()
{
}

void sub_258E52F34()
{
  uint64_t v1 = (os_unfair_lock_s *)(*(void *)(v0 + 16) + 24);
  os_unfair_lock_lock(v1);
  sub_258E53838();
  os_unfair_lock_unlock(v1);
}

void sub_258E52FD8()
{
}

void sub_258E52FFC()
{
  uint64_t v1 = (os_unfair_lock_s *)(*(void *)(v0 + 16) + 24);
  os_unfair_lock_lock(v1);
  sub_258E535E4();
  os_unfair_lock_unlock(v1);
}

uint64_t sub_258E53080(void *a1)
{
  if (*a1)
  {
    swift_retain();
    sub_258E51E00(0xD000000000000022, 0x8000000258E55BA0, MEMORY[0x263F8EE78], 0, 1, 0, 0);
    if (!v1) {
      sub_258E51E00(0xD000000000000058, 0x8000000258E55BD0, MEMORY[0x263F8EE78], 0, 1, 0, 0);
    }
    return swift_release();
  }
  else
  {
    sub_258E5360C();
    swift_allocError();
    unsigned char *v3 = 2;
    return swift_willThrow();
  }
}

void *sub_258E53170@<X0>(void *result@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, unsigned __int8 a4@<W4>, uint64_t a5@<X8>)
{
  if (!*result) {
    goto LABEL_7;
  }
  uint64_t v9 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    uint64_t v9 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (!v9) {
    goto LABEL_7;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B2EFDF0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_258E54C30;
  *(void *)(inited + 32) = a4 + 1;
  *(void *)(inited + 40) = 0;
  *(unsigned char *)(inited + 48) = 0;
  *(void *)(inited + 56) = a2;
  *(void *)(inited + 64) = a3;
  *(unsigned char *)(inited + 72) = 2;
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_258E4CCBC(0xD00000000000003ALL, 0x8000000258E55B60, inited, a4);
  if (v5)
  {

    swift_release();
    swift_setDeallocating();
    uint64_t result = (void *)sub_258E53658();
LABEL_7:
    *(void *)a5 = 0;
    *(void *)(a5 + 8) = 0;
    *(unsigned char *)(a5 + 16) = -1;
    return result;
  }
  uint64_t v15 = v12;
  uint64_t v16 = v13;
  char v17 = v14;
  swift_release();
  swift_setDeallocating();
  uint64_t result = (void *)sub_258E53658();
  *(void *)a5 = v15;
  *(void *)(a5 + 8) = v16;
  *(unsigned char *)(a5 + 16) = v17;
  return result;
}

uint64_t sub_258E532C0(void *a1, uint64_t a2, uint64_t a3, unint64_t a4, unsigned __int8 a5, uint64_t a6, unint64_t a7, char a8)
{
  if (*a1)
  {
    uint64_t v10 = HIBYTE(a4) & 0xF;
    if ((a4 & 0x2000000000000000) == 0) {
      uint64_t v10 = a3 & 0xFFFFFFFFFFFFLL;
    }
    if (v10)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B2EFDF0);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_258E54C40;
      *(void *)(inited + 32) = a3;
      *(void *)(inited + 40) = a4;
      *(unsigned char *)(inited + 48) = 2;
      uint64_t v16 = a5 + 1;
      *(void *)(inited + 56) = v16;
      *(void *)(inited + 64) = 0;
      *(unsigned char *)(inited + 72) = 0;
      *(void *)(inited + 80) = a6;
      *(void *)(inited + 88) = a7;
      *(unsigned char *)(inited + 96) = a8;
      *(void *)(inited + 104) = v16;
      *(void *)(inited + 112) = 0;
      *(unsigned char *)(inited + 120) = 0;
      *(void *)(inited + 128) = a6;
      *(void *)(inited + 136) = a7;
      *(unsigned char *)(inited + 144) = a8;
      sub_258E4DE10(a6, a7, a8);
      sub_258E4DE10(a6, a7, a8);
      swift_retain();
      swift_bridgeObjectRetain();
      sub_258E51E00(0xD00000000000006FLL, 0x8000000258E55AF0, inited, 0, 1, 0, 0);
      swift_setDeallocating();
      sub_258E53658();
      return swift_release();
    }
    sub_258E5360C();
    swift_allocError();
    char v19 = 1;
  }
  else
  {
    sub_258E5360C();
    swift_allocError();
    char v19 = 2;
  }
  *uint64_t v18 = v19;
  return swift_willThrow();
}

uint64_t sub_258E53478(void *a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (*a1)
  {
    uint64_t v6 = HIBYTE(a4) & 0xF;
    if ((a4 & 0x2000000000000000) == 0) {
      uint64_t v6 = a3 & 0xFFFFFFFFFFFFLL;
    }
    if (v6)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B2EFDF0);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_258E54A50;
      *(void *)(inited + 32) = a3;
      *(void *)(inited + 40) = a4;
      *(unsigned char *)(inited + 48) = 2;
      swift_retain();
      swift_bridgeObjectRetain();
      sub_258E51E00(0xD000000000000027, 0x8000000258E55AC0, inited, 0, 1, 0, 0);
      swift_setDeallocating();
      sub_258E53658();
      return swift_release();
    }
    sub_258E5360C();
    swift_allocError();
    char v10 = 1;
  }
  else
  {
    sub_258E5360C();
    swift_allocError();
    char v10 = 2;
  }
  *uint64_t v9 = v10;
  return swift_willThrow();
}

uint64_t sub_258E535C8()
{
  OUTLINED_FUNCTION_4_0();
  return sub_258E53478(v0, v1, v2, v3);
}

uint64_t sub_258E535E4()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

unint64_t sub_258E5360C()
{
  unint64_t result = qword_26A0CFAF8;
  if (!qword_26A0CFAF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A0CFAF8);
  }
  return result;
}

uint64_t sub_258E53658()
{
  swift_arrayDestroy();

  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t sub_258E5369C()
{
  OUTLINED_FUNCTION_4_0();
  return sub_258E4CFB0(v0, v1, v2, v3, v4);
}

void *sub_258E536B8(uint64_t a1, uint64_t a2, void *(*a3)(uint64_t *__return_ptr))
{
  if (a1)
  {
    unint64_t result = a3(&v5);
    if (!v3) {
      return (void *)v5;
    }
  }
  else
  {
    unint64_t result = ((void *(*)(uint64_t *__return_ptr, void, void))a3)((uint64_t *)((char *)&v5 + 4), 0, 0);
    if (!v3) {
      return (void *)HIDWORD(v5);
    }
  }
  return result;
}

void *sub_258E53714@<X0>(void *(*a1)(uint64_t *__return_ptr)@<X2>, _DWORD *a2@<X8>)
{
  unint64_t result = a1(&v5);
  if (!v2) {
    *a2 = v5;
  }
  return result;
}

void *sub_258E53758@<X0>(_DWORD *a1@<X8>)
{
  return sub_258E537B8(a1);
}

uint64_t sub_258E53770()
{
  OUTLINED_FUNCTION_4_0();
  return sub_258E532C0(v1, v2, v3, v4, *(unsigned char *)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56), *(unsigned char *)(v0 + 64));
}

void *sub_258E53798()
{
  OUTLINED_FUNCTION_4_0();
  return sub_258E53170(v1, v2, v3, *(unsigned char *)(v0 + 40), v4);
}

void *sub_258E537B8@<X0>(_DWORD *a1@<X8>)
{
  unint64_t result = (*(void *(**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  if (!v2) {
    *a1 = v5;
  }
  return result;
}

uint64_t sub_258E537FC(void *a1)
{
  return sub_258E53080(a1);
}

void *sub_258E53818(void *a1)
{
  return sub_258E522BC(a1, *(void *(**)(uint64_t *__return_ptr))(v1 + 16));
}

uint64_t sub_258E53838()
{
  return sub_258E535E4();
}

uint64_t sub_258E53850()
{
  return sub_258E5369C();
}

uint64_t OUTLINED_FUNCTION_2_3()
{
  return swift_allocError();
}

void OUTLINED_FUNCTION_3_1()
{
  JUMPOUT(0x25A2D25C0);
}

BOOL static PegasusPersistenceControllerError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t PegasusPersistenceControllerError.hash(into:)()
{
  return sub_258E54210();
}

uint64_t PegasusPersistenceControllerError.hashValue.getter()
{
  return sub_258E54220();
}

uint64_t static PegasusPersistenceControllerFactory.create(with:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_258E54020();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t v8 = type metadata accessor for PegasusFilePersistence();
  uint64_t v9 = swift_allocObject();
  uint64_t result = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(v9 + OBJC_IVAR____TtC18PegasusPersistence22PegasusFilePersistence_baseFolder, v7, v4);
  a2[3] = v8;
  a2[4] = (uint64_t)&off_2706EB610;
  *a2 = v9;
  return result;
}

unint64_t sub_258E53A6C()
{
  unint64_t result = qword_26A0CFB00;
  if (!qword_26A0CFB00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A0CFB00);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for PegasusPersistenceControllerError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x258E53B84);
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

ValueMetadata *type metadata accessor for PegasusPersistenceControllerError()
{
  return &type metadata for PegasusPersistenceControllerError;
}

ValueMetadata *type metadata accessor for PegasusPersistenceControllerFactory()
{
  return &type metadata for PegasusPersistenceControllerFactory;
}

uint64_t sub_258E53BCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return PegasusPersistenceWriter.persistCodable<A>(_:name:)(a1, a2, a3, a6, a4, a7, a5);
}

uint64_t PegasusPersistenceWriter.persistCodable<A>(_:name:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14 = sub_258E53F10();
  swift_allocObject();
  v16[3] = v14;
  v16[4] = &protocol witness table for JSONEncoder;
  v16[0] = sub_258E53F00();
  (*(void (**)(uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a6 + 24))(a1, v16, a2, a3, a5, a7, a4, a6);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
}

uint64_t sub_258E53CD8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return PegasusPersistenceWriter.persistCodable<A>(_:encoder:name:)(a1, a2, a3, a4, a7, a5, a8, a6);
}

uint64_t PegasusPersistenceWriter.persistCodable<A>(_:encoder:name:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v13 = a2[3];
  uint64_t v14 = a2[4];
  __swift_project_boxed_opaque_existential_1(a2, v13);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 8))(a1, a6, a8, v13, v14);
  if (!v8)
  {
    uint64_t v17 = result;
    unint64_t v18 = v16;
    (*(void (**)(void))(a7 + 8))();
    return sub_258E4DEB0(v17, v18);
  }
  return result;
}

uint64_t sub_258E53DFC()
{
  return sub_258E53EF0();
}

uint64_t dispatch thunk of PegasusPersistenceWriter.persistData(_:name:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8))();
}

uint64_t dispatch thunk of PegasusPersistenceWriter.persistCodable<A>(_:name:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 16))();
}

uint64_t dispatch thunk of PegasusPersistenceWriter.persistCodable<A>(_:encoder:name:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 24))();
}

uint64_t dispatch thunk of CustomEncoder.encode<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t sub_258E53EC0()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_258E53ED0()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_258E53EE0()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_258E53EF0()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_258E53F00()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_258E53F10()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_258E53F20()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_258E53F30()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_258E53F40()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_258E53F50()
{
  return MEMORY[0x270EEEF78]();
}

uint64_t sub_258E53F60()
{
  return MEMORY[0x270EEEF88]();
}

uint64_t sub_258E53F70()
{
  return MEMORY[0x270EEEFE8]();
}

uint64_t sub_258E53F80()
{
  return MEMORY[0x270EEEFF8]();
}

uint64_t sub_258E53F90()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_258E53FA0()
{
  return MEMORY[0x270EEFBB0]();
}

uint64_t sub_258E53FB0()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_258E53FC0()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_258E53FD0()
{
  return MEMORY[0x270EEFC88]();
}

uint64_t sub_258E53FE0()
{
  return MEMORY[0x270EEFCE8]();
}

uint64_t sub_258E53FF0()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_258E54000()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_258E54010()
{
  return MEMORY[0x270EEFF40]();
}

uint64_t sub_258E54020()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_258E54030()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_258E54040()
{
  return MEMORY[0x270EF0198]();
}

uint64_t sub_258E54050()
{
  return MEMORY[0x270EF01C0]();
}

uint64_t sub_258E54060()
{
  return MEMORY[0x270EF02B0]();
}

uint64_t sub_258E54070()
{
  return MEMORY[0x270EF02C8]();
}

uint64_t sub_258E54080()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_258E54090()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_258E540A0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_258E540B0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_258E540C0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_258E540D0()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_258E540E0()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_258E540F0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_258E54100()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_258E54110()
{
  return MEMORY[0x270F9D7C8]();
}

uint64_t sub_258E54120()
{
  return MEMORY[0x270F9DD60]();
}

uint64_t sub_258E54130()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_258E54140()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_258E54150()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_258E54160()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_258E54170()
{
  return MEMORY[0x270F9E988]();
}

uint64_t sub_258E54180()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_258E541A0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_258E541B0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_258E541C0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_258E541D0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_258E541E0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_258E541F0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_258E54200()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_258E54210()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_258E54220()
{
  return MEMORY[0x270F9FC90]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x270F9B490](a1, *(void *)&a2, a3, *(void *)&n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x270F9B4A0](a1, *(void *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x270F9B4A8](a1, *(void *)&a2, *(void *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x270F9B4B0](a1, *(void *)&a2, a3);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x270F9B4E0](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_close_v2(sqlite3 *a1)
{
  return MEMORY[0x270F9B560](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x270F9B568](a1, *(void *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B570](a1, *(void *)&iCol);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  MEMORY[0x270F9B590](a1, *(void *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B598](a1, *(void *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B5A0](a1, *(void *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x270F9B5C0](a1, *(void *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B5D0](a1, *(void *)&iCol);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B690](pStmt);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x270F9B710](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x270F9B720](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x270F9B800](a1);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}